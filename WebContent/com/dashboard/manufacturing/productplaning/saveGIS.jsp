  <%@page import="java.util.ArrayList"%>
<%@page import="java.sql.*"%>
<%@page import="javax.sql.*"%>
<%@page import="com.connection.*" %>
<%@page import="net.sf.json.JSONArray"%>
<%@page import="net.sf.json.JSONObject"%>
<%@page import="java.util.*"%>
<%@page import="javax.servlet.http.HttpServletRequest" %>
<%@page import="javax.servlet.http.HttpSession" %>
<%@page import="com.common.*"%>
<%@ page import="java.sql.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="com.sales.InventoryTransfer.materialissuenote.ClsMaterialIssueNoteDAO" %>
<%
ClsConnection ClsConnection=new ClsConnection();
ClsCommon ClsCommon=new ClsCommon();
ClsMaterialIssueNoteDAO DAO = new ClsMaterialIssueNoteDAO();
String list=request.getParameter("productarray")==null?"0":request.getParameter("productarray");
String workno=request.getParameter("workno")==null?"0":request.getParameter("workno"); 
String mpsrno=request.getParameter("psrno")==null?"0":request.getParameter("psrno"); 
String batch=request.getParameter("batch")==null?"0":request.getParameter("batch");  
String sorddoc=request.getParameter("sorddoc")==null?"0":request.getParameter("sorddoc");  
java.sql.Date sqlprocessdate=null;
Calendar cal = Calendar.getInstance();
SimpleDateFormat format1 = new SimpleDateFormat("dd.MM.yyyy");
String formatted = format1.format(cal.getTime());
System.out.println("==availdatezxd==="+formatted+"====sorddoc====="+sorddoc);
 if(!(formatted.equalsIgnoreCase("undefined"))&&!(formatted.equalsIgnoreCase(""))&&!(formatted.equalsIgnoreCase("0")))
{
sqlprocessdate=ClsCommon.changeStringtoSqlDate(formatted);
	
}
else{

} 
ArrayList<String> pmgntarray= new ArrayList<String>();
String aa[]=list.split(",");
String BOvoc="0";
String doc="0";
	 
for(int i=0;i<aa.length;i++){
	System.out.println("----------"+aa[i]);
	 String bb[]=aa[i].split("::");
	  
	 String temp="";
	 for(int j=0;j<bb.length;j++){ 
		 
		 System.out.println("----------"+bb[j]);
		 temp=temp+bb[j]+"::";
		 
	}
	 pmgntarray.add(temp);
	 
} 
 
	  Connection conn=null;
	    String sql="",tempnw="",updatesqls1="";
	    int val=0,isstype=0;
	    try
	    {
	   	
	    conn = ClsConnection.getMyConnection();
		Statement stmt = conn.createStatement();
		
		String sqltst2="select coalesce(doc_no,0) as doc_no from my_issuetype where status=3 and typeid=2";
		ResultSet rs1=stmt.executeQuery(sqltst2);
		if(rs1.next()){
			isstype=	rs1.getInt("doc_no");
		}
		int vals=0;
		int qrychk=0;
		String chkpsrno="0";
		String chkprdname="";
		for(int i=0;i< pmgntarray.size();i++){
			qrychk=0;
			chkpsrno="0";
			String[] prod=((String) pmgntarray.get(i)).split("::");
			System.out.println("prod[0]===="+prod[0]);
			if(!((prod[0].equalsIgnoreCase("0"))||(prod[0].equalsIgnoreCase("undefined"))||(prod[0].equalsIgnoreCase("")))){

		String prdid=""+(prod[0].trim().equalsIgnoreCase("undefined") || prod[0].trim().equalsIgnoreCase("NaN")|| prod[0].trim().equalsIgnoreCase("")|| prod[0].isEmpty()?0:prod[0].trim())+"";
		String specno=""+(prod[6].equalsIgnoreCase("undefined") || prod[6].equalsIgnoreCase("") || prod[6].trim().equalsIgnoreCase("NaN")|| prod[6].isEmpty()?0:prod[6].trim())+"";
							 
		String  rqty=""+(prod[3].trim().equalsIgnoreCase("undefined") || prod[3].trim().equalsIgnoreCase("NaN")|| prod[3].trim().equalsIgnoreCase("")|| prod[3].isEmpty()?0:prod[3].trim())+"";
		double masterqty=Double.parseDouble(rqty);
		double masterqty1=Double.parseDouble(rqty);
		
		 String unitidss=""+(prod[2].trim().equalsIgnoreCase("undefined") || prod[2].trim().equalsIgnoreCase("NaN")|| prod[2].trim().equalsIgnoreCase("")|| prod[2].isEmpty()?0:prod[2].trim())+"";
		    String prsros=""+(prod[0].trim().equalsIgnoreCase("undefined") || prod[0].trim().equalsIgnoreCase("NaN")|| prod[0].trim().equalsIgnoreCase("")|| prod[0].isEmpty()?0:prod[0].trim())+"";
		    String stock=""+(prod[10].trim().equalsIgnoreCase("undefined") || prod[10].trim().equalsIgnoreCase("NaN")|| prod[10].trim().equalsIgnoreCase("")|| prod[10].isEmpty()?0:prod[10].trim())+"";   
		    String batchid=""+(prod[11].trim().equalsIgnoreCase("undefined") || prod[11].trim().equalsIgnoreCase("NaN")|| prod[11].trim().equalsIgnoreCase("")|| prod[11].isEmpty()?0:prod[11].trim())+"";
		   
	         System.out.println("stock==="+stock);
	         System.out.println("stocklength==="+stock.length());
	     	double balstkqty=0;
				String qty_fld="";
				String qryapnd="";
				String slquery="";
				
				String loc="";
				
				
				double cost_price=0;
				 
				
				int locids=0;
				
			 
					qty_fld="out_qty";
					//qryapnd="and cost_price="+unitprice+"";
					//qryapnd="and stockid="+stkid+"";
				 	slquery="(out_qty+rsv_qty+del_qty)";
				  
				 	loc="and locid=1 ";
					
				 	Statement stmtstk=conn.createStatement();
				 	
				 	if(stock.equalsIgnoreCase("0")) {
				 		
				 		String stkSql="select cost_price,locid,stockid,psrno,specno,sum(op_qty) stkqty,sum((op_qty-"+slquery+")) balstkqty,"+slquery+" out_qty,"+qty_fld+" as qty,out_qty qtys,date from my_prddin "
								+ "where  psrno='"+prdid+"' and specno='"+specno+"' "+qryapnd+"  and prdid='"+prdid+"' and brhid=1 "+loc+"  and date<='"+sqlprocessdate+"'  "
								+ "group by stockid,cost_price,prdid,psrno having sum((op_qty-"+slquery+"))>0 order by date,stockid";

						System.out.println("=1111111111111111111111   1stkSql=inside insert="+stkSql);

						ResultSet rsstk = stmtstk.executeQuery(stkSql);

						while(rsstk.next()) {
							balstkqty=rsstk.getDouble("balstkqty");
							System.out.println("masterqty==if=="+masterqty+"==balstkqty=="+balstkqty);
							if(balstkqty<masterqty) {
								  qrychk=0;
								  chkpsrno=prdid;
								  break;
								  
							}else {
								  qrychk=1;
							}
						}
				 	}
				 	else{
				 		 ArrayList<String> pmgntarray2= new ArrayList<String>();
						    String aa2[]=stock.split("@@@");
						    //String BOvoc="0";
						    	 
						    for(int k=0;k<aa2.length;k++){
						    	System.out.println("----------"+aa2[k]);
						    	 String bb[]=aa2[k].split("@@");
						    	  
						    	 String temp="";
						    	 for(int j=0;j<bb.length;j++){ 
						    		 
						    		 System.out.println("----------"+bb[j]);
						    		 temp=temp+bb[j]+"::";
						    		
						    	}
						    	 System.out.println("----batchlist------"+temp);
						    	 pmgntarray.add(temp);
						    	 
						    } 
				 		for(int b=0;b< pmgntarray2.size();b++){
							
							String[] batch2=((String) pmgntarray2.get(b)).split("::");
							String batchno=""+(batch2[0].trim().equalsIgnoreCase("undefined") || batch2[0].trim().equalsIgnoreCase("NaN")|| batch2[0].trim().equalsIgnoreCase("")|| batch2[0].isEmpty()?0:batch2[0].trim())+"";
							String derqty=""+(batch2[1].trim().equalsIgnoreCase("undefined") || batch2[1].trim().equalsIgnoreCase("NaN")|| batch2[1].trim().equalsIgnoreCase("")|| batch2[1].isEmpty()?0:batch2[1].trim())+"";
							System.out.println("batch qty===="+derqty);
							masterqty=Double.parseDouble(derqty);
							if(masterqty>0) { 
							String stkSql="select cost_price,locid,stockid,psrno,specno,sum(op_qty) stkqty,sum((op_qty-"+slquery+")) balstkqty,"+slquery+" out_qty,"+qty_fld+" as qty,out_qty qtys,date from my_prddin "
									+ "where batch_no='"+batchno+"' and psrno='"+prdid+"' and specno='"+specno+"' "+qryapnd+"  and prdid='"+prdid+"' and brhid=1 "+loc+"  and date<='"+sqlprocessdate+"'  "
									+ "group by stockid,cost_price,prdid,psrno having sum((op_qty-"+slquery+"))>0 order by date,stockid";

							System.out.println("=1111111111111111111111   1stkSql=inside insert="+stkSql);

							ResultSet rsstk = stmtstk.executeQuery(stkSql);

							while(rsstk.next()) {
				              
								
								balstkqty=rsstk.getDouble("balstkqty");
								System.out.println("masterqty==else=="+masterqty+"==balstkqty=="+balstkqty);
								if(balstkqty<masterqty) {
									  qrychk=0;
									  chkpsrno=prdid;
									  break;
									  
								}else {
									  qrychk=1;
								}
							  }
						   }
				 		}
				 	}
				 	if(qrychk==0) {
						 
						  chkpsrno=prdid;
						  break;
						  
					}
			}
			
		}
		 System.out.println("----qrychk------"+qrychk);
		if(qrychk==0){
			vals=2;
			Statement stmtnme = conn.createStatement();
			String sqlname="select productname from my_main where psrno="+chkpsrno+"";
			ResultSet rsname = stmtnme.executeQuery(sqlname);
			while(rsname.next()){
				chkprdname=rsname.getString("productname");
			}
		}
		
		
		if(qrychk==1){
		  vals=DAO.insert(sqlprocessdate, workno+" :: MNF", "workorder", 0, session, "A", "MIN", request, pmgntarray, 1, 0, 0, isstype, 0, 0, batch);
		 
		 BOvoc=	request.getAttribute("vocno").toString();
		  doc=	request.getAttribute("docno").toString();
		 System.out.println("==Goodsissuenotevoc=="+BOvoc+"==vals===="+vals);
		 if((vals>0) && (vals!=2)){ 
		 String sqltst="update my_workorder set minno="+doc+", workprocess=6 where doc_no="+workno+" and psrno="+mpsrno+"";
			 val=stmt.executeUpdate(sqltst);
			 
			String upsql="insert into my_workorderlog (type,brhId, logdate, userid, workorderno,description) values ('PRDPL','"+session.getAttribute("BRANCHID").toString()+"',now(),'"+session.getAttribute("USERID").toString()+"',"+workno+",'created material issue note')";
			int aaa= stmt.executeUpdate(upsql);
		 }	 
			 
		}	
		if(vals>0){ 
			 if(vals==2){ 
				 tempnw="2";
				 }
			 else{
					 tempnw="1"; 
				 }
					
				 
		 }	
    stmt.close();
		 
	conn.close();
	 response.getWriter().print(tempnw+" :: "+BOvoc+" :: "+doc+" :: "+chkprdname);
    	
    }
    catch(Exception e)
    {
    	e.printStackTrace();
    	
    	
    	conn.close();
    	 response.getWriter().print(tempnw+" :: "+BOvoc+" :: "+doc);
    }
	 finally{
		 conn.close();
	 }
	 	
	 	
%>



 