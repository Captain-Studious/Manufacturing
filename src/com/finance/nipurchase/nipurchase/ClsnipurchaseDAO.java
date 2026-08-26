package com.finance.nipurchase.nipurchase;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.Date;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Enumeration;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import net.sf.json.JSONArray;

import com.common.ClsCommon;
import com.connection.ClsConnection;
public class ClsnipurchaseDAO  {
	
	ClsCommon commDAO=new ClsCommon();
	ClsConnection connDAO=new ClsConnection();
	
	Connection conn;
	
public int insert(Date sqlStartDate,Date purdeldate, String reftype,int refno, String acctype,
		String accdoc, String puraccname, String cmbcurr, String currate,
		String delterms, String payterms, String purdesc,
		HttpSession session, String mode,Double nettotal,ArrayList<String> descarray,String Formdetailcode,
		HttpServletRequest request, Date sqlinvdate, String invno,String indateval) throws SQLException {
	try{
		int docno;
		
		 conn=connDAO.getMyConnection();
		 conn.setAutoCommit(false);
		CallableStatement stmtnipurchase= conn.prepareCall("{call nipurchaseDML(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)}");
		stmtnipurchase.registerOutParameter(16, java.sql.Types.INTEGER);
		stmtnipurchase.setInt(18, java.sql.Types.INTEGER);
		stmtnipurchase.setDate(1,sqlStartDate);
		stmtnipurchase.setInt(2,refno);
		stmtnipurchase.setString(3,acctype);
		stmtnipurchase.setString(4,accdoc);
	   	stmtnipurchase.setString(5,cmbcurr);
		stmtnipurchase.setString(6,currate);
		stmtnipurchase.setString(7,delterms);
		stmtnipurchase.setString(8,payterms);
		stmtnipurchase.setString(9,purdesc);
		stmtnipurchase.setDate(10,purdeldate);
		stmtnipurchase.setDouble(11,nettotal);
		stmtnipurchase.setString(12,Formdetailcode);
		stmtnipurchase.setString(13,session.getAttribute("USERID").toString());
		stmtnipurchase.setString(14,session.getAttribute("BRANCHID").toString());
		stmtnipurchase.setString(15,reftype);
		stmtnipurchase.setString(17,mode);
		
 
		stmtnipurchase.executeQuery();
		docno=stmtnipurchase.getInt("docNo");
		int vocno=stmtnipurchase.getInt("vocNo");	
		request.setAttribute("vocno", vocno);
		if(docno<=0)
		{
			conn.close();
			return 0;
			
		}
		int tranno=0;
		int j=0;
		int sno=0;
		
		double fdramt=0;
		double tdramt=0;
		
		int count=0;
		
		int iapprovalStatus=3;
		
		String refdetails="CPU"+""+vocno;
		
		
		String jvdesc="CPU-"+""+invno+""+":-Dated :- "+indateval+"";  
		
		String trsql="SELECT coalesce(max(trno)+1,1) trno FROM my_trno m";
	
		ResultSet tass = stmtnipurchase.executeQuery (trsql);
		
		if (tass.next()) {
	
			tranno=tass.getInt("trno");		
			
	     }
		
		
		
		String appsql="select count(*)   icount from my_apprmaster where status=3 and dtype='"+Formdetailcode+"'";
		
		ResultSet appsqlrs = stmtnipurchase.executeQuery(appsql);
		
		if (appsqlrs.next()) {
	
			count=appsqlrs.getInt("icount");		
			
	     }
		if(count==0)
		{
			
			iapprovalStatus=3;
			
			
		}
		else
		{
			iapprovalStatus=0;
		}
		
		
		request.setAttribute("trans",tranno);
		
		String trnosql="insert into my_trno(edate,trtype,brhId,USERNO,trno) values(now(),5,'"+session.getAttribute("BRANCHID").toString()+"','"+session.getAttribute("USERID").toString()+"','"+tranno+"')";
		
		int dd=stmtnipurchase.executeUpdate(trnosql);
	     
				 if(dd<=0)
					{
						conn.close();
						return 0;
						
					}
		//System.out.println("sssssss"+session.getAttribute("USERID").toString());
		for(int i=0;i< descarray.size();i++){
			
			String[] purorderarray=descarray.get(i).split("::");
			String newjvdesc=jvdesc+"  "+(purorderarray[2].trim().equalsIgnoreCase("undefined") || purorderarray[2].trim().equalsIgnoreCase("NaN")|| purorderarray[2].trim().equalsIgnoreCase("")|| purorderarray[2].isEmpty()?0:purorderarray[2].trim());
			if(i==0){
				
				double dramt=nettotal*-1;
				double as=Double.parseDouble(currate);
				double ldramt=dramt*as;
				
				String sql1="insert into my_jvtran(date,ref_detail,doc_no,acno,description,curId,rate,dramount,ldramount,out_amount,id,trtype,ref_row,LAGE,cldocno,lbrrate,costtype,costcode,dTYPE,brhId,tr_no,STATUS)   "
				 		+ "values('"+sqlStartDate+"','"+refdetails+"',"+docno+",'"+accdoc+"','"+newjvdesc+"','"+cmbcurr+"','"+currate+"',"+dramt+","+ldramt+",0,-1,0,0,0,0,0,0,0,'CPU','"+session.getAttribute("BRANCHID").toString()+"',"+tranno+",'"+iapprovalStatus+"')";
				 
			//	System.out.println(sql1);
				 int ss = stmtnipurchase.executeUpdate(sql1);

			     if(ss<=0)
					{
						conn.close();
						return 0;
						
					}
				
			}
			
		
		   //  System.out.println("==========================================================="+purorderarray);
		    if(!(purorderarray[1].trim().equalsIgnoreCase("undefined")|| purorderarray[1].trim().equalsIgnoreCase("NaN")||purorderarray[1].trim().equalsIgnoreCase("")|| purorderarray[1].isEmpty()))
		     {
	
	    		 String sql="INSERT INTO my_srvpurd(srno,qty,desc1,unitprice,total,discount,nettotal,nuprice,costtype,costcode,remarks,acno,brhid,rdocno)VALUES"
					       + " ("+(i+1)+","
					       + "'"+(purorderarray[1].trim().equalsIgnoreCase("undefined") || purorderarray[1].trim().equalsIgnoreCase("NaN")|| purorderarray[1].trim().equalsIgnoreCase("")|| purorderarray[1].isEmpty()?0:purorderarray[1].trim())+"',"
					       + "'"+(purorderarray[2].trim().equalsIgnoreCase("undefined") || purorderarray[2].trim().equalsIgnoreCase("NaN")|| purorderarray[2].trim().equalsIgnoreCase("")|| purorderarray[2].isEmpty()?0:purorderarray[2].trim())+"',"
					       + "'"+(purorderarray[3].trim().equalsIgnoreCase("undefined") || purorderarray[3].trim().equalsIgnoreCase("NaN")||purorderarray[3].trim().equalsIgnoreCase("")|| purorderarray[3].isEmpty()?0:purorderarray[3].trim())+"',"
					       + "'"+(purorderarray[4].trim().equalsIgnoreCase("undefined") || purorderarray[4].trim().equalsIgnoreCase("NaN")||purorderarray[4].trim().equalsIgnoreCase("")|| purorderarray[4].isEmpty()?0:purorderarray[4].trim())+"',"
					       + "'"+(purorderarray[5].trim().equalsIgnoreCase("undefined") || purorderarray[5].trim().equalsIgnoreCase("NaN")||purorderarray[5].trim().equalsIgnoreCase("")|| purorderarray[5].isEmpty()?0:purorderarray[5].trim())+"',"
					       + "'"+(purorderarray[6].trim().equalsIgnoreCase("undefined") || purorderarray[6].trim().equalsIgnoreCase("NaN")||purorderarray[6].trim().equalsIgnoreCase("")|| purorderarray[6].isEmpty()?0:purorderarray[6].trim())+"',"
					       + "'"+(purorderarray[7].trim().equalsIgnoreCase("undefined") || purorderarray[7].trim().equalsIgnoreCase("NaN")||purorderarray[7].trim().equalsIgnoreCase("")|| purorderarray[7].isEmpty()?0:purorderarray[7].trim())+"',"
					       + "'"+(purorderarray[8].trim().equalsIgnoreCase("undefined") || purorderarray[8].trim().equalsIgnoreCase("NaN")||purorderarray[8].trim().equalsIgnoreCase("")|| purorderarray[8].isEmpty()?0:purorderarray[8].trim())+"',"
					       + "'"+(purorderarray[9].trim().equalsIgnoreCase("undefined") || purorderarray[9].trim().equalsIgnoreCase("NaN")||purorderarray[9].trim().equalsIgnoreCase("")|| purorderarray[9].isEmpty()?0:purorderarray[9].trim())+"',"
					       + "'"+(purorderarray[10].trim().equalsIgnoreCase("undefined") || purorderarray[10].trim().equalsIgnoreCase("NaN")||purorderarray[10].trim().equalsIgnoreCase("")|| purorderarray[10].isEmpty()?0:purorderarray[10].trim())+"',"
					       + "'"+(purorderarray[11].trim().equalsIgnoreCase("undefined") || purorderarray[11].trim().equalsIgnoreCase("NaN")||purorderarray[11].trim().equalsIgnoreCase("")|| purorderarray[11].isEmpty()?0:purorderarray[11].trim())+"',"
					       + "'"+session.getAttribute("BRANCHID").toString()+"',"
					       +"'"+docno+"')";
			     int resultSet2 = stmtnipurchase.executeUpdate(sql);
			     
			     if(resultSet2<=0)
					{
						conn.close();
						return 0;
						
					}
			          String acno1=""+(purorderarray[11].trim().equalsIgnoreCase("undefined") || purorderarray[11].trim().equalsIgnoreCase("NaN")||purorderarray[11].trim().equalsIgnoreCase("")|| purorderarray[11].isEmpty()?0:purorderarray[11].trim())+"";
			    int acno=Integer.parseInt(acno1);
	
			     String tmp=""+(purorderarray[6].trim().equalsIgnoreCase("undefined") || purorderarray[6].trim().equalsIgnoreCase("NaN")||purorderarray[6].trim().equalsIgnoreCase("")|| purorderarray[6].isEmpty()?0:purorderarray[6].trim())+"";
			      fdramt=Double.parseDouble(tmp)*1;
			    		
			     tdramt=fdramt*Double.parseDouble(currate);
			     
			    
			     
			    		/* 
			    String addsumsql="SELECT dramount FROM my_jvtran where tr_no="+tranno+" and acno="+acno+" ";
				ResultSet tass2 = stmtnipurchase.executeQuery (addsumsql);
					
					if (tass2.next()) {
				
						
						  fdramt=tass2.getDouble("dramount")+Double.parseDouble(tmp)*1;
						  
					
						  
						 tdramt=fdramt*Double.parseDouble(currate);
					
						  
						  String upsqdata="update my_jvtran set dramount="+fdramt+",ldramount="+tdramt+"  where tr_no="+tranno+" and acno="+acno+" ";
	
						int updateval=	 stmtnipurchase.executeUpdate(upsqdata); 
						 if(updateval<=0)
							{
								conn.close();
								return 0;
								
							}
						 
						  
				     }
					else
					{
	*/		    		 
			    		 
			   		 
			    		 
			     String don="insert into my_jvtran(date,ref_detail,doc_no,acno,description,curId,rate,dramount,ldramount,out_amount,id,trtype,ref_row,LAGE,cldocno,lbrrate,dTYPE,brhId,tr_no,STATUS,costtype,costcode)   "
					 		+ "values('"+sqlStartDate+"','"+refdetails+"',"+docno+",'"+(purorderarray[11].trim().equalsIgnoreCase("undefined") || purorderarray[11].trim().equalsIgnoreCase("NaN")||purorderarray[11].trim().equalsIgnoreCase("")|| purorderarray[11].isEmpty()?0:purorderarray[11].trim())+"', "
 				+ "'"+newjvdesc+"', "
				+ "'"+cmbcurr+"','"+currate+"','"+(purorderarray[6].trim().equalsIgnoreCase("undefined") || purorderarray[6].trim().equalsIgnoreCase("NaN")||purorderarray[6].trim().equalsIgnoreCase("")|| purorderarray[6].isEmpty()?0:purorderarray[6].trim())+"',"+tdramt+",0,1,0,"+(i+1)+",0,0,0,'CPU', "
				+ "'"+session.getAttribute("BRANCHID").toString()+"',"+tranno+",'"+iapprovalStatus+"',"+(purorderarray[8].trim().equalsIgnoreCase("undefined") || purorderarray[8].trim().equalsIgnoreCase("NaN")||purorderarray[8].trim().equalsIgnoreCase("")|| purorderarray[8].isEmpty()?0:purorderarray[8].trim())+", "
				+ "'"+(purorderarray[9].trim().equalsIgnoreCase("undefined") || purorderarray[9].trim().equalsIgnoreCase("NaN")||purorderarray[9].trim().equalsIgnoreCase("")|| purorderarray[9].isEmpty()?0:purorderarray[9].trim())+"')";
				     
					
			int samp=stmtnipurchase.executeUpdate(don);

			     
			 if(samp<=0)
				{
					conn.close();
					return 0;
					
				}
					//}
			      
			 if(!(purorderarray[8].trim().equalsIgnoreCase("undefined")|| purorderarray[8].trim().equalsIgnoreCase("NaN")||purorderarray[8].trim().equalsIgnoreCase("")|| purorderarray[8].isEmpty() ||purorderarray[8].trim().equalsIgnoreCase("0")))
		     {
				 int TRANID=0;
				 sno=sno+1;
				  String tmp1=""+(purorderarray[6].trim().equalsIgnoreCase("undefined") || purorderarray[6].trim().equalsIgnoreCase("NaN")||purorderarray[6].trim().equalsIgnoreCase("")|| purorderarray[6].isEmpty()?0:purorderarray[6].trim())+"";
				  double  fdramt1=Double.parseDouble(tmp1)*1;
			    		
			
					String trsqlss="SELECT coalesce(max(TRANID),1) TRANID FROM my_jvtran where tr_no="+tranno+" and acno='"+(purorderarray[11].trim().equalsIgnoreCase("undefined") || purorderarray[11].trim().equalsIgnoreCase("NaN")||purorderarray[11].trim().equalsIgnoreCase("")|| purorderarray[11].isEmpty()?0:purorderarray[11].trim())+"' ";
			
					ResultSet tass1 = stmtnipurchase.executeQuery (trsqlss);
					
					if (tass1.next()) {
				
						TRANID=tass1.getInt("TRANID");	
					
					
						
				     }
					
					String ssql="insert into my_costtran(sr_no,acno,costtype,amount,jobid,tranid,tr_no) values("+sno+",'"+(purorderarray[11].trim().equalsIgnoreCase("undefined") || purorderarray[11].trim().equalsIgnoreCase("NaN")||purorderarray[11].trim().equalsIgnoreCase("")|| purorderarray[11].isEmpty()?0:purorderarray[11].trim())+"', "
							+ " "+(purorderarray[8].trim().equalsIgnoreCase("undefined") || purorderarray[8].trim().equalsIgnoreCase("NaN")||purorderarray[8].trim().equalsIgnoreCase("")|| purorderarray[8].isEmpty()?0:purorderarray[8].trim())+","+fdramt1+",'"+(purorderarray[9].trim().equalsIgnoreCase("undefined") || purorderarray[9].trim().equalsIgnoreCase("NaN")||purorderarray[9].trim().equalsIgnoreCase("")|| purorderarray[9].isEmpty()?0:purorderarray[9].trim())+"',"+TRANID+","+tranno+")";
							 
			  int costabsq=  stmtnipurchase.executeUpdate(ssql);
			  
			  if(costabsq<=0)
				{
					conn.close();
					return 0;
					
				}
			  
		     }
			
			 
			 
			 
				String updat="update  my_srvpurm set tr_no="+tranno+",invno='"+invno+"',invdate='"+sqlinvdate+"' where doc_no="+docno+"  ";
					 
				  int tabs=  stmtnipurchase.executeUpdate(updat);
			 
			 
			 
				  if(tabs<=0)
					{
						conn.close();
						return 0;
						
					}
				  
			 
			 
			 
		     }
		    
		  
	     }
		
		
		
		

		
		    
	if (docno > 0) {
		conn.commit();
		stmtnipurchase.close();
		conn.close();
		return docno;
	}
}catch(Exception e){	
	conn.close();
e.printStackTrace();	
}
return 0;
}





public boolean edit(int docno,Date sqlStartDate,Date purdeldate, String reftype, int refno, String acctype,
		String accdoc, String puraccname, String cmbcurr, String currate,
		String delterms, String payterms, String purdesc,
		HttpSession session, String mode,Double nettotal,ArrayList<String> descarray,
		String Formdetailcode,int tranno,HttpServletRequest request,Date sqlinvdate,String invno,String indateval) throws SQLException {
	
	try{
		
		 conn=connDAO.getMyConnection();
		 conn.setAutoCommit(false);
		CallableStatement stmtnipurchase= conn.prepareCall("{call nipurchaseDML(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)}");
		
		stmtnipurchase.setDate(1,sqlStartDate);
		stmtnipurchase.setInt(2,refno);
		stmtnipurchase.setString(3,acctype);
		stmtnipurchase.setString(4,accdoc);
	   	stmtnipurchase.setString(5,cmbcurr);
		stmtnipurchase.setString(6,currate);
		stmtnipurchase.setString(7,delterms);
		stmtnipurchase.setString(8,payterms);
		stmtnipurchase.setString(9,purdesc);
		stmtnipurchase.setDate(10,purdeldate);
		stmtnipurchase.setDouble(11,nettotal);
		stmtnipurchase.setString(12,Formdetailcode);
		stmtnipurchase.setString(13,session.getAttribute("USERID").toString());
		stmtnipurchase.setString(14,session.getAttribute("BRANCHID").toString());
		stmtnipurchase.setString(15,reftype);
		stmtnipurchase.setInt(16,docno);
		stmtnipurchase.setString(17,"E");
		stmtnipurchase.setInt(18, 0);
		int aaa=stmtnipurchase.executeUpdate();
		docno=stmtnipurchase.getInt("docNo");
		
		if(aaa<=0)
		{
			conn.close();
			return false;
			
		}	
		
		int ap_trid=0;
	    double amount=0.00,outamount=0.00;
	  Statement stmtBPV=conn.createStatement();
	     /*Selecting Tran-Id*/
	      ArrayList<String> tranidarray=new ArrayList<>();
	      String sql11="SELECT TRANID FROM my_jvtran where TR_NO="+tranno+" and acno="+accdoc+"";
	      
	   //   System.out.println("----sql11---"+sql11);
	      
	      ResultSet resultSet=stmtBPV.executeQuery(sql11);
	      
	      while(resultSet.next()){
	       tranidarray.add(resultSet.getString("tranid"));
	      }
	      /*Selecting Tran-Id Ends*/
	      
	      /*Selecting Ap_Tran-Id*/
	      ArrayList<String> outamtarray=new ArrayList<>();

	      for(int i=0;i<tranidarray.size();i++){
	       String sql2="select tranid ap_trid,amount from my_outd where ap_trid="+tranidarray.get(i);
	       
	   //    System.out.println("----sql2---"+sql2);
	       ResultSet resultSet1=stmtBPV.executeQuery(sql2);
	       
	       while(resultSet1.next()){
	        outamtarray.add(resultSet1.getInt("ap_trid")+"::"+resultSet1.getDouble("amount"));
	       } 

	      }
	      /*Selecting Ap_Tran-Id*/
	   //   System.out.println("----outamtarray---"+outamtarray);
	      for(int i=0;i<outamtarray.size();i++){
	       
	       ap_trid=Integer.parseInt(outamtarray.get(i).split("::")[0]);
	       amount=Double.parseDouble(outamtarray.get(i).split("::")[1]);

	       String sql4="update my_jvtran set out_amount=out_amount-("+amount+"*id) where tranid="+ap_trid+"";
	      // System.out.println("----sql4---"+sql4);
	       int data1=stmtBPV.executeUpdate(sql4);
	       
	      }
	    /*Apply-Invoicing Grid Updating Ends*/
	      
	       /*Selecting outamount*/
	        String sql5="select sum(amount) outamount from my_outd where ap_trid="+tranidarray.get(0)+"";
	        
	     //   System.out.println("----sql5---"+sql5);
	        ResultSet resultSet2=stmtBPV.executeQuery(sql5);
	      
	        while(resultSet2.next()){
	       outamount= resultSet2.getDouble("outamount");
	        }
	       /*Selecting outamount Ends*/
	      
	        String sql4="update my_jvtran set out_amount=out_amount-("+outamount+"*id) where tranid="+tranidarray.get(0)+"";
	       // System.out.println("----sql4--2-"+sql4);
	        int data3=stmtBPV.executeUpdate(sql4);
	       
	     /*Deleting from my_outd*/
	      String sql3="delete from my_outd where ap_trid="+tranidarray.get(0)+"";
	    //  System.out.println("----sql3---"+sql3);
	      
	      int data2=stmtBPV.executeUpdate(sql3);
	     /*Deleting from my_outd Ends*/
		
				
		   String delsql="Delete from my_srvpurd where rdocno="+docno+" and brhid='"+session.getAttribute("BRANCHID").toString()+"' ";
		   stmtnipurchase.executeUpdate(delsql);
		   
		   String delsql1="Delete from my_jvtran where tr_no="+tranno+" ";
		   stmtnipurchase.executeUpdate(delsql1);
		   
		   String delsql2="Delete from my_costtran where tr_no="+tranno+" ";
		   stmtnipurchase.executeUpdate(delsql2);
		 
			int j=0;
			int sno=0;
			double fdramt=0;
			double tdramt=0;
			Statement stmt =conn.createStatement();
			
			int vocno=0;
			
			String sqlss="select voc_no from my_srvpurm where doc_no='"+docno+"' ";
			ResultSet rss=stmt.executeQuery(sqlss);
			
			if(rss.next())
			
			{
				
				vocno=rss.getInt("voc_no");
				
			}
			
			String refdetails="CPU"+""+vocno;
			String jvdesc="CPU-"+""+invno+""+":-Dated :- "+indateval+"";  

			for(int i=0;i< descarray.size();i++){
				 String[] purorderarray=descarray.get(i).split("::");
				 String newjvdesc=jvdesc+"  "+(purorderarray[2].trim().equalsIgnoreCase("undefined") || purorderarray[2].trim().equalsIgnoreCase("NaN")|| purorderarray[2].trim().equalsIgnoreCase("")|| purorderarray[2].isEmpty()?0:purorderarray[2].trim());
				if(i==0)
					
				{
					double dramt=nettotal*-1;
					double as=Double.parseDouble(currate);
					double ldramt=dramt*as;
					
					 String sql1="insert into my_jvtran(date,ref_detail,doc_no,acno,description,curId,rate,dramount,ldramount,out_amount,id,trtype,ref_row,LAGE,cldocno,lbrrate,costtype,costcode,dTYPE,brhId,tr_no,STATUS)   "
					 		+ "values('"+sqlStartDate+"','"+refdetails+"',"+docno+",'"+accdoc+"','"+newjvdesc+"','"+cmbcurr+"','"+currate+"',"+dramt+","+ldramt+",0,-1,0,0,0,0,0,0,0,'CPU','"+session.getAttribute("BRANCHID").toString()+"',"+tranno+",3)";
	
					 int ss = stmtnipurchase.executeUpdate(sql1);

				     if(ss<=0)
						{
							conn.close();
							return false;
							
						}
					
				}
				
			
			  
			    if(!(purorderarray[1].trim().equalsIgnoreCase("undefined")|| purorderarray[1].trim().equalsIgnoreCase("NaN")||purorderarray[1].trim().equalsIgnoreCase("")|| purorderarray[1].isEmpty()))
			     {
		
		    		 String sql="INSERT INTO my_srvpurd(srno,qty,desc1,unitprice,total,discount,nettotal,nuprice,costtype,costcode,remarks,acno,brhid,rdocno)VALUES"
						       + " ("+(i+1)+","
						       + "'"+(purorderarray[1].trim().equalsIgnoreCase("undefined") || purorderarray[1].trim().equalsIgnoreCase("NaN")|| purorderarray[1].trim().equalsIgnoreCase("")|| purorderarray[1].isEmpty()?0:purorderarray[1].trim())+"',"
						       + "'"+(purorderarray[2].trim().equalsIgnoreCase("undefined") || purorderarray[2].trim().equalsIgnoreCase("NaN")|| purorderarray[2].trim().equalsIgnoreCase("")|| purorderarray[2].isEmpty()?0:purorderarray[2].trim())+"',"
						       + "'"+(purorderarray[3].trim().equalsIgnoreCase("undefined") || purorderarray[3].trim().equalsIgnoreCase("NaN")||purorderarray[3].trim().equalsIgnoreCase("")|| purorderarray[3].isEmpty()?0:purorderarray[3].trim())+"',"
						       + "'"+(purorderarray[4].trim().equalsIgnoreCase("undefined") || purorderarray[4].trim().equalsIgnoreCase("NaN")||purorderarray[4].trim().equalsIgnoreCase("")|| purorderarray[4].isEmpty()?0:purorderarray[4].trim())+"',"
						       + "'"+(purorderarray[5].trim().equalsIgnoreCase("undefined") || purorderarray[5].trim().equalsIgnoreCase("NaN")||purorderarray[5].trim().equalsIgnoreCase("")|| purorderarray[5].isEmpty()?0:purorderarray[5].trim())+"',"
						       + "'"+(purorderarray[6].trim().equalsIgnoreCase("undefined") || purorderarray[6].trim().equalsIgnoreCase("NaN")||purorderarray[6].trim().equalsIgnoreCase("")|| purorderarray[6].isEmpty()?0:purorderarray[6].trim())+"',"
						       + "'"+(purorderarray[7].trim().equalsIgnoreCase("undefined") || purorderarray[7].trim().equalsIgnoreCase("NaN")||purorderarray[7].trim().equalsIgnoreCase("")|| purorderarray[7].isEmpty()?0:purorderarray[7].trim())+"',"
						       + "'"+(purorderarray[8].trim().equalsIgnoreCase("undefined") || purorderarray[8].trim().equalsIgnoreCase("NaN")||purorderarray[8].trim().equalsIgnoreCase("")|| purorderarray[8].isEmpty()?0:purorderarray[8].trim())+"',"
						       + "'"+(purorderarray[9].trim().equalsIgnoreCase("undefined") || purorderarray[9].trim().equalsIgnoreCase("NaN")||purorderarray[9].trim().equalsIgnoreCase("")|| purorderarray[9].isEmpty()?0:purorderarray[9].trim())+"',"
						       + "'"+(purorderarray[10].trim().equalsIgnoreCase("undefined") || purorderarray[10].trim().equalsIgnoreCase("NaN")||purorderarray[10].trim().equalsIgnoreCase("")|| purorderarray[10].isEmpty()?0:purorderarray[10].trim())+"',"
						       + "'"+(purorderarray[11].trim().equalsIgnoreCase("undefined") || purorderarray[11].trim().equalsIgnoreCase("NaN")||purorderarray[11].trim().equalsIgnoreCase("")|| purorderarray[11].isEmpty()?0:purorderarray[11].trim())+"',"
						       + "'"+session.getAttribute("BRANCHID").toString()+"',"
						       +"'"+docno+"')";
				     int resultSet21 = stmtnipurchase.executeUpdate(sql);
				     
				     if(resultSet21<=0)
						{
							conn.close();
							return false;
							
						}
				  String acno1=""+(purorderarray[11].trim().equalsIgnoreCase("undefined") || purorderarray[11].trim().equalsIgnoreCase("NaN")||purorderarray[11].trim().equalsIgnoreCase("")|| purorderarray[11].isEmpty()?0:purorderarray[11].trim())+"";
					    int acno=Integer.parseInt(acno1);
				
					     String tmp=""+(purorderarray[6].trim().equalsIgnoreCase("undefined") || purorderarray[6].trim().equalsIgnoreCase("NaN")||purorderarray[6].trim().equalsIgnoreCase("")|| purorderarray[6].isEmpty()?0:purorderarray[6].trim())+"";
					      fdramt=Double.parseDouble(tmp)*1;
					    		
					     		     tdramt=fdramt*Double.parseDouble(currate);
					     
					    
					     
				/*	    		 
 		    	    String addsumsql="SELECT dramount FROM my_jvtran where tr_no="+tranno+" and acno="+acno+" ";
						ResultSet tass2 = stmtnipurchase.executeQuery (addsumsql);
							
							if (tass2.next()) {
						
								
								  fdramt=tass2.getDouble("dramount")+Double.parseDouble(tmp)*1;
								  
								 tdramt=fdramt*Double.parseDouble(currate);
							
								  
								  String upsqdata="update my_jvtran set dramount="+fdramt+",ldramount="+tdramt+"  where tr_no="+tranno+" and acno="+acno+" ";
								
								int updateval=	 stmtnipurchase.executeUpdate(upsqdata); 
								 if(updateval<=0)
									{
										conn.close();
										return false;
										
									}
								 
								  
						     }
							else
							{
					    		*/ 
					    		 
					    		 
					    		 
					     String don="insert into my_jvtran(date,ref_detail,doc_no,acno,description,curId,rate,dramount,ldramount,out_amount,id,trtype,ref_row,LAGE,cldocno,lbrrate,dTYPE,brhId,tr_no,STATUS,costtype,costcode)   "
							 		+ "values('"+sqlStartDate+"','"+refdetails+"',"+docno+",'"+(purorderarray[11].trim().equalsIgnoreCase("undefined") || purorderarray[11].trim().equalsIgnoreCase("NaN")||purorderarray[11].trim().equalsIgnoreCase("")|| purorderarray[11].isEmpty()?0:purorderarray[11].trim())+"', "
							 				+ "'"+newjvdesc+"', "
						+ "'"+cmbcurr+"','"+currate+"','"+(purorderarray[6].trim().equalsIgnoreCase("undefined") || purorderarray[6].trim().equalsIgnoreCase("NaN")||purorderarray[6].trim().equalsIgnoreCase("")|| purorderarray[6].isEmpty()?0:purorderarray[6].trim())+"',"+tdramt+",0,1,0,"+(i+1)+",0,0,0,'CPU', "
						+ "'"+session.getAttribute("BRANCHID").toString()+"',"+tranno+",3,"+(purorderarray[8].trim().equalsIgnoreCase("undefined") || purorderarray[8].trim().equalsIgnoreCase("NaN")||purorderarray[8].trim().equalsIgnoreCase("")|| purorderarray[8].isEmpty()?0:purorderarray[8].trim())+", "
						+ "'"+(purorderarray[9].trim().equalsIgnoreCase("undefined") || purorderarray[9].trim().equalsIgnoreCase("NaN")||purorderarray[9].trim().equalsIgnoreCase("")|| purorderarray[9].isEmpty()?0:purorderarray[9].trim())+"')";
						     
							 
					
					int samp=	stmtnipurchase.executeUpdate(don);

					     
					 if(samp<=0)
						{
							conn.close();
							return false;
							
						}
						//	}
				 
				 
				 if(!(purorderarray[8].trim().equalsIgnoreCase("undefined")|| purorderarray[8].trim().equalsIgnoreCase("NaN")||purorderarray[8].trim().equalsIgnoreCase("")|| purorderarray[8].isEmpty() ||purorderarray[8].trim().equalsIgnoreCase("0")))
			     {
					 int TRANID=0;
					 sno=sno+1;
					  String tmp1=""+(purorderarray[6].trim().equalsIgnoreCase("undefined") || purorderarray[6].trim().equalsIgnoreCase("NaN")||purorderarray[6].trim().equalsIgnoreCase("")|| purorderarray[6].isEmpty()?0:purorderarray[6].trim())+"";
					  double  fdramt1=Double.parseDouble(tmp1)*1;
						String trsqlss="SELECT coalesce(max(TRANID),1) TRANID FROM my_jvtran where tr_no="+tranno+" and acno='"+(purorderarray[11].trim().equalsIgnoreCase("undefined") || purorderarray[11].trim().equalsIgnoreCase("NaN")||purorderarray[11].trim().equalsIgnoreCase("")|| purorderarray[11].isEmpty()?0:purorderarray[11].trim())+"' ";
						
						
						
						
						ResultSet tass1 = stmtnipurchase.executeQuery (trsqlss);
						
						if (tass1.next()) {
					
							TRANID=tass1.getInt("TRANID");	
						
						
							
					     }
						
					
					 
				String ssql="insert into my_costtran(sr_no,acno,costtype,amount,jobid,tranid,tr_no) values("+sno+",'"+(purorderarray[11].trim().equalsIgnoreCase("undefined") || purorderarray[11].trim().equalsIgnoreCase("NaN")||purorderarray[11].trim().equalsIgnoreCase("")|| purorderarray[11].isEmpty()?0:purorderarray[11].trim())+"', "
						+ " "+(purorderarray[8].trim().equalsIgnoreCase("undefined") || purorderarray[8].trim().equalsIgnoreCase("NaN")||purorderarray[8].trim().equalsIgnoreCase("")|| purorderarray[8].isEmpty()?0:purorderarray[8].trim())+","+fdramt1+",'"+(purorderarray[9].trim().equalsIgnoreCase("undefined") || purorderarray[9].trim().equalsIgnoreCase("NaN")||purorderarray[9].trim().equalsIgnoreCase("")|| purorderarray[9].isEmpty()?0:purorderarray[9].trim())+"',"+TRANID+","+tranno+")";
					 
				  int costabsq=  stmtnipurchase.executeUpdate(ssql);
				  
				  if(costabsq<=0)
					{
						conn.close();
						return false;
						
					}
				  
			     }
				
		
				 
				 
				 
			     }
			    
			  
		     }
			
			
			
		   
		   
		   
		   
		
	//	System.out.println("aaaaaaaaaaaaaaaaa"+aaa);
		/*for(int i=0;i<descarray.size();i++){
	    	
		     String[] purorderarray=descarray.get(i).split("::");
		    
		     if(!(purorderarray[1].trim().equalsIgnoreCase("undefined")|| purorderarray[1].trim().equalsIgnoreCase("NaN")||purorderarray[1].trim().equalsIgnoreCase("")|| purorderarray[1].isEmpty()))
		     {
		    	 
		    	 String sql="INSERT INTO my_srvpurd(srno,qty,desc1,unitprice,total,discount,nettotal,nuprice,costtype,costcode,remarks,acno,brhid,rdocno)VALUES"
					       + " ("+(i+1)+","
					       + "'"+(purorderarray[1].trim().equalsIgnoreCase("undefined") || purorderarray[1].trim().equalsIgnoreCase("NaN")|| purorderarray[1].trim().equalsIgnoreCase("")|| purorderarray[1].isEmpty()?0:purorderarray[1].trim())+"',"
					       + "'"+(purorderarray[2].trim().equalsIgnoreCase("undefined") || purorderarray[2].trim().equalsIgnoreCase("NaN")|| purorderarray[2].trim().equalsIgnoreCase("")|| purorderarray[2].isEmpty()?0:purorderarray[2].trim())+"',"
					       + "'"+(purorderarray[3].trim().equalsIgnoreCase("undefined") || purorderarray[3].trim().equalsIgnoreCase("NaN")||purorderarray[3].trim().equalsIgnoreCase("")|| purorderarray[3].isEmpty()?0:purorderarray[3].trim())+"',"
					       + "'"+(purorderarray[4].trim().equalsIgnoreCase("undefined") || purorderarray[4].trim().equalsIgnoreCase("NaN")||purorderarray[4].trim().equalsIgnoreCase("")|| purorderarray[4].isEmpty()?0:purorderarray[4].trim())+"',"
					       + "'"+(purorderarray[5].trim().equalsIgnoreCase("undefined") || purorderarray[5].trim().equalsIgnoreCase("NaN")||purorderarray[5].trim().equalsIgnoreCase("")|| purorderarray[5].isEmpty()?0:purorderarray[5].trim())+"',"
					       + "'"+(purorderarray[6].trim().equalsIgnoreCase("undefined") || purorderarray[6].trim().equalsIgnoreCase("NaN")||purorderarray[6].trim().equalsIgnoreCase("")|| purorderarray[6].isEmpty()?0:purorderarray[6].trim())+"',"
					       + "'"+(purorderarray[7].trim().equalsIgnoreCase("undefined") || purorderarray[7].trim().equalsIgnoreCase("NaN")||purorderarray[7].trim().equalsIgnoreCase("")|| purorderarray[7].isEmpty()?0:purorderarray[7].trim())+"',"
					       + "'"+(purorderarray[8].trim().equalsIgnoreCase("undefined") || purorderarray[8].trim().equalsIgnoreCase("NaN")||purorderarray[8].trim().equalsIgnoreCase("")|| purorderarray[8].isEmpty()?0:purorderarray[8].trim())+"',"
					       + "'"+(purorderarray[9].trim().equalsIgnoreCase("undefined") || purorderarray[9].trim().equalsIgnoreCase("NaN")||purorderarray[9].trim().equalsIgnoreCase("")|| purorderarray[9].isEmpty()?0:purorderarray[9].trim())+"',"
					       + "'"+(purorderarray[10].trim().equalsIgnoreCase("undefined") || purorderarray[10].trim().equalsIgnoreCase("NaN")||purorderarray[10].trim().equalsIgnoreCase("")|| purorderarray[10].isEmpty()?0:purorderarray[10].trim())+"',"
					       + "'"+(purorderarray[11].trim().equalsIgnoreCase("undefined") || purorderarray[11].trim().equalsIgnoreCase("NaN")||purorderarray[11].trim().equalsIgnoreCase("")|| purorderarray[11].isEmpty()?0:purorderarray[11].trim())+"',"
					       + "'"+session.getAttribute("BRANCHID").toString()+"',"
					       +"'"+docno+"')";*/
		    	 
		/*    	 
	     String sql="update  my_srvpurd set SRNO="+(i+1)+","
	     		   + "qty='"+(purorderarray[1].trim().equalsIgnoreCase("undefined") || purorderarray[1].trim().equalsIgnoreCase("NaN")|| purorderarray[1].trim().equalsIgnoreCase("")|| purorderarray[1].isEmpty()?0:purorderarray[1].trim())+"',"
			       + "desc1='"+(purorderarray[2].trim().equalsIgnoreCase("undefined") || purorderarray[2].trim().equalsIgnoreCase("NaN")|| purorderarray[2].trim().equalsIgnoreCase("")|| purorderarray[2].isEmpty()?0:purorderarray[2].trim())+"',"
			       + "unitprice='"+(purorderarray[3].trim().equalsIgnoreCase("undefined") || purorderarray[3].trim().equalsIgnoreCase("NaN")||purorderarray[3].trim().equalsIgnoreCase("")|| purorderarray[3].isEmpty()?0:purorderarray[3].trim())+"',"
			       + "total='"+(purorderarray[4].trim().equalsIgnoreCase("undefined") || purorderarray[4].trim().equalsIgnoreCase("NaN")||purorderarray[4].trim().equalsIgnoreCase("")|| purorderarray[4].isEmpty()?0:purorderarray[4].trim())+"',"
			       + "discount='"+(purorderarray[5].trim().equalsIgnoreCase("undefined") || purorderarray[5].trim().equalsIgnoreCase("NaN")||purorderarray[5].trim().equalsIgnoreCase("")|| purorderarray[5].isEmpty()?0:purorderarray[5].trim())+"',"
			       + "nettotal='"+(purorderarray[6].trim().equalsIgnoreCase("undefined") || purorderarray[6].trim().equalsIgnoreCase("NaN")||purorderarray[6].trim().equalsIgnoreCase("")|| purorderarray[6].isEmpty()?0:purorderarray[6].trim())+"'," 
	               + "nuprice='"+(purorderarray[7].trim().equalsIgnoreCase("undefined") || purorderarray[7].trim().equalsIgnoreCase("NaN")||purorderarray[7].trim().equalsIgnoreCase("")|| purorderarray[7].isEmpty()?0:purorderarray[7].trim())+"',"
	               + "costtype='"+(purorderarray[8].trim().equalsIgnoreCase("undefined") || purorderarray[8].trim().equalsIgnoreCase("NaN")||purorderarray[8].trim().equalsIgnoreCase("")|| purorderarray[8].isEmpty()?0:purorderarray[8].trim())+"',"
	               + "costcode='"+(purorderarray[9].trim().equalsIgnoreCase("undefined") || purorderarray[9].trim().equalsIgnoreCase("NaN")||purorderarray[9].trim().equalsIgnoreCase("")|| purorderarray[9].isEmpty()?0:purorderarray[9].trim())+"',"
	                + "remarks='"+(purorderarray[10].trim().equalsIgnoreCase("undefined") || purorderarray[10].trim().equalsIgnoreCase("NaN")||purorderarray[10].trim().equalsIgnoreCase("")|| purorderarray[10].isEmpty()?0:purorderarray[10].trim())+"',"
	            + "acno='"+(purorderarray[11].trim().equalsIgnoreCase("undefined") || purorderarray[11].trim().equalsIgnoreCase("NaN")||purorderarray[11].trim().equalsIgnoreCase("")|| purorderarray[11].isEmpty()?0:purorderarray[11].trim())+"',"
	            + "brhid='"+session.getAttribute("BRANCHID").toString()+"' where rdocno="+docno+"";*/
	      
	   //  System.out.println(""+sql);
	/*     int resultSet4 = stmtnipurchase.executeUpdate(sql);
	 	if(resultSet4<=0)
		{
			conn.close();
			return false;
			
		} 
		     }
		    
		
		}*/	
			
			
			 
			 
			String updat="update  my_srvpurm set invno='"+invno+"',invdate='"+sqlinvdate+"' where doc_no="+docno+"  ";
				 
			  int tabs=  stmtnipurchase.executeUpdate(updat);
		 
		 
		 
			  if(tabs<=0)
				{
					conn.close();
					return false;
					
				}
			  
			
			
			
			
		if (aaa > 0) {
		 	conn.commit();
			stmtnipurchase.close();
			conn.close();
			System.out.println("Sucess");
			return true;
		}
	}catch(Exception e){
		e.printStackTrace();
		conn.close();
	}
	return false;
}

public boolean delete(int docno,HttpSession session,String mode,String Formdetailcode) throws SQLException {
	try{
		conn=connDAO.getMyConnection();

		
		CallableStatement stmtnipurchase= conn.prepareCall("{call nipurchaseDML(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)}");
		
		stmtnipurchase.setDate(1,null);
		stmtnipurchase.setString(2,null);
		stmtnipurchase.setString(3,null);
		stmtnipurchase.setString(4,null);
	   	stmtnipurchase.setString(5,null);
		stmtnipurchase.setString(6,null);
		stmtnipurchase.setString(7,null);
		stmtnipurchase.setString(8,null);
		stmtnipurchase.setString(9,null);
		stmtnipurchase.setDate(10,null);
		stmtnipurchase.setDouble(11,0.0);
		stmtnipurchase.setString(12,Formdetailcode);
		stmtnipurchase.setString(13,session.getAttribute("USERID").toString());
		stmtnipurchase.setString(14,session.getAttribute("BRANCHID").toString());
		stmtnipurchase.setString(15,null);
		stmtnipurchase.setInt(16,docno);
		stmtnipurchase.setString(17,"D");
		stmtnipurchase.setInt(18,0);
		
		int aaa=stmtnipurchase.executeUpdate();
		
		
		
		if (aaa > 0) {
			
			stmtnipurchase.close();
			conn.close();
			System.out.println("Sucess");
			return true;
		}	
	}catch(Exception e){
		conn.close();
	}
	return false;
}



	public   JSONArray accountsDetailsTo() throws SQLException {
		
		JSONArray RESULTDATA=new JSONArray();

		   Connection conn=null;
  try {
	  conn= connDAO.getMyConnection();
    Statement stmtCPV = conn.createStatement ();
/*             
    String sql=("select (@i:=@i+1) recno,t.doc_no,t.account,t.description,c.code curr from my_head t,my_acbook a1, "
      + "my_curr c,(select curId from my_brch where doc_no= '"+branch+"') h, (select (@i:=0)) a where  a1.active=1 and t.m_s=0 and c.doc_no=t.curId "
      + "and t.cldocno=a1.cldocno and t.atype='"+dtype+"' and c.doc_no=if(a1.brhId=0 and a1.curId=0,h.curId,if(a1.curId=0,h.curId,a1.curid)) and "
      + "a1.cmpid in(0,'"+company+"') and a1.brhid in(0,'"+branch+"')");*/
    
    /*String sql="select description,doc_no,account from my_head where atype='AP' and m_s=0";*/
    
    String sql= "select t.doc_no,t.account,t.description,t.curid,c.code currency,a.cldocno,c.type,round(cb.rate,2) rate,if(a.per_mob=0,a.per_tel,a.per_mob) mobile from my_head t inner join my_acbook a on t.cldocno=a.cldocno and "
    		+ "a.dtype='VND' and t.atype='AP' left join my_curr c on t.curid=c.doc_no left join my_curbook cb on t.curid=cb.curid inner join (select max(cr.doc_no) doc_no,cr.curid curid,cr.toDate,cr.frmDate "
    		+ "from my_curbook cr where  coalesce(toDate,curdate())>=curdate() and frmDate<=curdate() group by cr.curid) as bo on(cb.doc_no=bo.doc_no and cb.curid=bo.curid) where a.active=1 and t.m_s=0";
    
  // System.out.println("---asdsa---------"+sql); 
    ResultSet resultSet = stmtCPV.executeQuery (sql);
 // System.out.println("------------"+sql);
    RESULTDATA=commDAO.convertToJSON(resultSet);
    
    stmtCPV.close();
    conn.close();
  }
  catch(Exception e){
   e.printStackTrace();
   conn.close();
  }
        return RESULTDATA;
    }
	
	public   JSONArray reloadnipurchase(HttpSession session,String nidoc) throws SQLException {

		JSONArray RESULTDATA=new JSONArray();
	    Enumeration<String> Enumeration = session.getAttributeNames();
	    int a=0;
	    while(Enumeration.hasMoreElements()){
	     if(Enumeration.nextElement().equalsIgnoreCase("BRANCHID")){
	      a=1;
	     }
	    }
	    if(a==0){
	  return RESULTDATA;
	     }
	    String brcid=session.getAttribute("BRANCHID").toString();
	    Connection conn = null;
		try {
				 conn = connDAO.getMyConnection();
				Statement stmtVeh1 = conn.createStatement ();
	        	String pySql=(" select d.srno,d.desc1 description,d.unitprice,d.qty,d.qty qutval,d.total,d.discount,d.nettotal,d.nuprice,d.acno headdoc,h.gr_type grtype ,"
	        			+ "d.costtype,d.costcode, d.remarks,h.account account,h.description accname,h.atype type,coalesce(u.CostGroup,'') CostGroup "
	        			+ " from my_srvpurd d left join my_head h on h.doc_no=d.acno  left join my_costunit u on u.costtype=d.costtype "
	        			+ "  where d.rdocno='"+nidoc+"'  "); 
	        //	System.out.println("========"+pySql);
				ResultSet resultSet = stmtVeh1.executeQuery(pySql);

				RESULTDATA=commDAO.convertToJSON(resultSet); 
				stmtVeh1.close();
				conn.close();

		}
		catch(Exception e){
			e.printStackTrace();
			conn.close();
		}
	//	System.out.println(RESULTDATA);
	    return RESULTDATA;
	}
	
	
	public   JSONArray accountGridsearch(String type) throws SQLException {
      
        JSONArray RESULTDATA=new JSONArray();
        Connection conn = null;
  try {
     conn = connDAO.getMyConnection();
    Statement stmtCPV = conn.createStatement ();
             
    String sqq= ("select t.gr_type grtype,t.doc_no,t.account,t.description,c.code curr,c.doc_no curid,c.c_rate from my_head t left join my_curr c "
      + "on t.curid=c.doc_no where atype='"+type+"' and m_s=0 ");
    
    
   // System.out.println("--cczxc-----"+sqq);
    
    ResultSet resultSet = stmtCPV.executeQuery (sqq);
    
   

    RESULTDATA=commDAO.convertToJSON(resultSet);
    
    stmtCPV.close();
    conn.close();

  }
  catch(Exception e){
	   conn.close();
   e.printStackTrace();
  }
        return RESULTDATA;
    }
	
	public   JSONArray searchCosttype() throws SQLException {

	    JSONArray RESULTDATA=new JSONArray();
	    
	    Connection conn = null;
		try {
				 conn = connDAO.getMyConnection();
				Statement stmtVehclr = conn.createStatement ();
	        	
				ResultSet resultSet = stmtVehclr.executeQuery ("select costtype,costgroup from my_costunit where status=1;");

				RESULTDATA=commDAO.convertToJSON(resultSet);
				stmtVehclr.close();
				conn.close();

		}
		catch(Exception e){
			conn.close();
			e.printStackTrace();
		}
		//System.out.println(RESULTDATA);
	    return RESULTDATA;
	}
	public   JSONArray searchCostcode(String type) throws SQLException {

	    JSONArray RESULTDATA=new JSONArray();
	    Connection conn = null;
	  
		try {
				 conn = connDAO.getMyConnection();
				Statement stmtVehclr = conn.createStatement ();
			
	        	if(type.equalsIgnoreCase("1"))
	        	{
	        		//System.out.println("1111111111111111");
	        		String sql="select costcode code,doc_no,description name,0 reg_no  from my_ccentre where m_s=0;";
	        		//System.out.println("----"+sql );
	        		ResultSet resultSet = stmtVehclr.executeQuery (sql);
	        		RESULTDATA=commDAO.convertToJSON(resultSet);
					stmtVehclr.close();
					
	        	}
	        	else if(type.equalsIgnoreCase("6"))
	        	{
	        		
	        		String sql="select doc_no,fleet_no code,flname name,reg_no from gl_vehmaster where cost=0;";
	        		//System.out.println("----"+sql );
	        		ResultSet resultSet = stmtVehclr.executeQuery (sql);
	        		RESULTDATA=commDAO.convertToJSON(resultSet);
					stmtVehclr.close();
					
	        	}
	        	
	        	conn.close();	

		}
		catch(Exception e){
			e.printStackTrace();
			conn.close();
		}
		//System.out.println(RESULTDATA);
	    return RESULTDATA;
	}
	public   JSONArray refnosearch(HttpSession session) throws SQLException {

		JSONArray RESULTDATA=new JSONArray();
	    Enumeration<String> Enumeration = session.getAttributeNames();
	    int a=0;
	    while(Enumeration.hasMoreElements()){
	     if(Enumeration.nextElement().equalsIgnoreCase("BRANCHID")){
	      a=1;
	     }
	    }
	    if(a==0){
	  return RESULTDATA;
	     }
	    String brcid=session.getAttribute("BRANCHID").toString();
	    Connection conn = null;
		try {
				 conn = connDAO.getMyConnection();
				Statement stmtmain = conn.createStatement ();
	        	String pySql=("select m.doc_no,m.voc_no,m.date,m.netamount,m.type,m.acno,m.refno,m.curid,m.rate,m.delterm,m.payterm,m.deldate,m.desc1,h.description,h.account "
	        			+ "from my_srvlpom m left join my_head h on h.doc_no=m.acno where m.status<>7 and m.brhid='"+brcid+"'" );
	        	//System.out.println("========"+pySql);
				ResultSet resultSet = stmtmain.executeQuery(pySql);

				RESULTDATA=commDAO.convertToJSON(resultSet); 
				stmtmain.close();
				conn.close();

		}
		catch(Exception e){
			e.printStackTrace();
			conn.close();
		}
	//	System.out.println(RESULTDATA);
	    return RESULTDATA;
	}
	public   JSONArray slnosearch(String niorderdocno) throws SQLException {

		 JSONArray RESULTDATA=new JSONArray();
		    /*Enumeration<String> Enumeration = session.getAttributeNames();
		    int a=0;
		    while(Enumeration.hasMoreElements()){
		     if(Enumeration.nextElement().equalsIgnoreCase("BRANCHID")){
		      a=1;
		     }
		    }
		    if(a==0){
		  return RESULTDATA;
		     }*/
		 Connection conn = null;
		try {
				 conn = connDAO.getMyConnection();
				Statement stmtrelode = conn.createStatement ();
	       	
				String resql=(" select d.srno,d.desc1 desc1,d.unitprice unitprice,d.qty,d.total total,m.type,d.discount,m.acno,h.description,h.account from "
						+ "my_srvlpod d inner join my_srvlpom m on d.rdocno=m.doc_no left join my_head h on h.doc_no=m.acno   where d.rdocno='"+niorderdocno+"' ");
				
				
				//System.out.println("--------------"+resql);
				ResultSet resultSet = stmtrelode.executeQuery(resql);
				RESULTDATA=commDAO.convertToJSON(resultSet);
				stmtrelode.close();
				conn.close();

				
				
		}
		catch(Exception e){
			e.printStackTrace();
			conn.close();
		}
		//System.out.println("fgdg"+RESULTDATA);
	   return RESULTDATA;
	}
	public   JSONArray mainsearch(HttpSession session,String docnoss,String accountss,String accnamess,String datess,String reftypess,String aa) throws SQLException {

		JSONArray RESULTDATA=new JSONArray();
	    Enumeration<String> Enumeration = session.getAttributeNames();
	    int a=0;
	    while(Enumeration.hasMoreElements()){
	     if(Enumeration.nextElement().equalsIgnoreCase("BRANCHID")){
	      a=1;
	     }
	    }
	    if(a==0){
	  return RESULTDATA;
	     }
	    String brcid=session.getAttribute("BRANCHID").toString();
	  java.sql.Date  sqlStartDate = null;
		if(!(datess.equalsIgnoreCase("undefined"))&&!(datess.equalsIgnoreCase(""))&&!(datess.equalsIgnoreCase("0")))
    	{
    	sqlStartDate = commDAO.changeStringtoSqlDate(datess);
    	}
    	
    	
	    
		String sqltest="";
	    
	   	if((!(docnoss.equalsIgnoreCase(""))) && (!(docnoss.equalsIgnoreCase("NA")))){
    		sqltest=sqltest+" and m.voc_no like '%"+docnoss+"%'";
    	}
    	if((!(accountss.equalsIgnoreCase(""))) && (!(accountss.equalsIgnoreCase("NA")))){
    		sqltest=sqltest+" and h.account like '%"+accountss+"%'  ";
    	}
    	if((!(accnamess.equalsIgnoreCase(""))) && (!(accnamess.equalsIgnoreCase("NA")))){
    		sqltest=sqltest+" and h.description like '%"+accnamess+"%'";
    	}
    	if((!(reftypess.equalsIgnoreCase(""))) && (!(reftypess.equalsIgnoreCase("NA")))){
    		sqltest=sqltest+" and m.reftype like '%"+reftypess+"%'";
    	}
    	
    	if(!(sqlStartDate==null)){
    		sqltest=sqltest+" and m.date='"+sqlStartDate+"'";
    	} 
        
	    Connection conn = null;
		try {
			conn = connDAO.getMyConnection();
			if(aa.equalsIgnoreCase("yes"))
			{
				 
				Statement stmtmain = conn.createStatement ();
	        	String pySql=("select convert(coalesce(o.voc_no,''),char(20)) refvocno,m.tr_no,m.doc_no,m.voc_no,coalesce(m.invno,'') invno,m.invdate,m.date,m.netamount,m.type,m.acno,m.reftype,m.refno,m.curid,m.rate,m.delterm,m.payterm, "
	        			+ "m.deldate,m.desc1,h.description,h.account from my_srvpurm m left join my_head h on h.doc_no=m.acno left join my_srvlpom o on m.refno=o.doc_no where m.status<>7  "
	        			+ "and m.brhid='"+brcid+"' "+sqltest );
	        	//System.out.println("========"+pySql);
	        	
	       
				ResultSet resultSet = stmtmain.executeQuery(pySql);

				RESULTDATA=commDAO.convertToJSON(resultSet); 
				stmtmain.close();
			}
			
			conn.close();
			return RESULTDATA;
		}
		catch(Exception e){
			e.printStackTrace();
			conn.close();
		}
	//	System.out.println(RESULTDATA);
	    return RESULTDATA;
	}
	 public  ClsnipurchaseBean getPrint(int docno, HttpServletRequest request ,HttpSession session) throws SQLException {
		 ClsnipurchaseBean bean = new ClsnipurchaseBean();
		  Connection conn = null; // String brcid=session.getAttribute("BRANCHID").toString();
		try {
				 conn = connDAO.getMyConnection();
				Statement stmtprint = conn.createStatement ();
	        	
				String resql=("select m.invno,date_format(m.invdate,'%d-%m-%Y') invdate,m.doc_no,m.voc_no,date_format(m.date,'%d-%m-%Y') date,round(m.netamount,2) netamount,m.type,m.acno,if(m.reftype='DIR','Direct',concat('NI Purchase Order ','(',m.refno,')')) reftype,m.refno,m.curid,m.rate,m.delterm, "
						+ "coalesce(m.payterm,'') payterm,date_format(m.deldate,'%d-%m-%Y') deldate,coalesce(m.desc1,'') desc1,coalesce(h.description,'') description,h.account from my_srvpurm m left join my_head h on h.doc_no=m.acno  where m.DOC_NO='"+docno+"' ");
				
				ResultSet pintrs = stmtprint.executeQuery(resql);
				
			     
			       while(pintrs.next()){
			    		    	
			    	    bean.setLbldate(pintrs.getString("date"));
			    	    bean.setLbltype(pintrs.getString("reftype"));
			    	    bean.setDocvals(pintrs.getString("voc_no"));
			    	    bean.setLblacno(pintrs.getString("account"));
			    	    //upper
			    	    bean.setLblacnoname(pintrs.getString("description"));
			    	    bean.setLbldeldate(pintrs.getString("deldate"));
			    	    bean.setLbldddtm(pintrs.getString("delterm"));
			    	    
			    	    bean.setLbldsc(pintrs.getString("desc1"));
			    	    bean.setLblpatms(pintrs.getString("payterm"));
			    	   
			    	    
			    	    bean.setLblnettotal(pintrs.getString("netamount"));
			    	    
			    	    bean.setLblinvno(pintrs.getString("invno"));
			    	    bean.setLblinvdate(pintrs.getString("invdate"));
			    	     
			    	 
			    	    
			       }
				

				stmtprint.close();
				
				
				
				 Statement stmtinvoice10 = conn.createStatement ();
				 /*   String  companysql="select b.branchname,c.company,c.address,c.tel,c.fax,l.loc_name location from my_srvpurm r  "
				    		+ " left join my_brch b on r.brhid=b.doc_no left join my_locm l on l.brhid=b.doc_no "
				    		+ "left join my_comp c on b.cmpid=c.doc_no where r.doc_no="+docno+"  ";*/
				    String  companysql="select c.company,c.address,c.tel,c.fax,lc.loc_name location,b.branchname,b.pbno,b.stcno,b.cstno from my_srvpurm r inner join my_brch b on  "
				    		+ "r.brhid=b.doc_no inner join my_comp c on b.cmpid=c.doc_no inner join my_locm l on l.brhid=b.doc_no inner join (select min(lo.loc) loc,lo.loc_name, "
				    		+ " lo.brhid from my_locm lo group by brhid) as lc on(lc.loc=l.loc and lc.brhid=b.doc_no) where r.doc_no='"+docno+"' ";
//System.out.println("----------------"+companysql);
			         ResultSet resultsetcompany = stmtinvoice10.executeQuery(companysql); 
				    
				       while(resultsetcompany.next()){
				    	   
				    	   bean.setLblbranch(resultsetcompany.getString("branchname"));
				    	   bean.setLblcompname(resultsetcompany.getString("company"));
				    	  
				    	   bean.setLblcompaddress(resultsetcompany.getString("address"));
				    	 
				    	   bean.setLblcomptel(resultsetcompany.getString("tel"));
				    	  
				    	   bean.setLblcompfax(resultsetcompany.getString("fax"));
				    	   bean.setLbllocation(resultsetcompany.getString("location"));
				    	  
				    	 
				    	   
				       } 
				       stmtinvoice10.close();
				 ArrayList<String> arr=new ArrayList<String>();
						Statement stmtinvoice2 = conn.createStatement ();
					
						String strSqldetail="select d.srno,d.desc1 description,round(d.unitprice,2) unitprice,round(d.qty) qty,round(d.total,2) total,round(d.discount,2) discount,round(d.nettotal,2) nettotal,d.nuprice,"
								+ " d.remarks,h.account account,h.description accname,h.atype accounttype  from my_srvpurd d left join my_head h on h.doc_no=d.acno  "
								+ " where d.rdocno='"+docno+"' ";
					
			
					ResultSet rsdetail=stmtinvoice2.executeQuery(strSqldetail);
					
					int rowcount=1;
			
					while(rsdetail.next()){
		
							String temp="";
						
							temp=rowcount+"::"+rsdetail.getString("description")+"::"+rsdetail.getString("qty")+"::"+rsdetail.getString("unitprice")+"::"+rsdetail.getString("total")+"::"+rsdetail.getString("discount")+"::"+rsdetail.getString("nettotal")+"::"+rsdetail.getString("accounttype")+"::"+rsdetail.getString("account")+"::"+rsdetail.getString("accname") ;
		
							arr.add(temp);
							rowcount++;
			
					
						
				              }
					stmtinvoice2.close();  
					request.setAttribute("details",arr); 

				conn.close();



				
		}
		catch(Exception e){
			conn.close();
			e.printStackTrace();
		}
		return bean;
		
	
	}

    }

	
