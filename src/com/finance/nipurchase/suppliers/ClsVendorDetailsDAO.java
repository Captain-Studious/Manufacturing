package com.finance.nipurchase.suppliers;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.Date;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import net.sf.json.JSONArray;

import com.common.ClsCommon;
import com.connection.ClsConnection;

public class ClsVendorDetailsDAO {

	ClsVendorDetailsBean vendorDetailsBean = new ClsVendorDetailsBean();
	ClsConnection ClsConnection=new ClsConnection();
	ClsCommon ClsCommon=new ClsCommon();
	
	
	
	public   JSONArray countrySearch(HttpSession session) throws SQLException
	{
		
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
    	
        Connection conn =null;
        Statement stmt  =null;
        ResultSet resultSet =null;
        
  			try {
				 conn = ClsConnection.getMyConnection();
				 stmt = conn.createStatement ();
            	
				String sql= ("select doc_no as cdocno,country_name from my_acountry where status=3" );
				System.out.println("------------------"+sql);
				 resultSet = stmt.executeQuery(sql) ;
				RESULTDATA=ClsCommon.convertToJSON(resultSet);
		}
		catch(Exception e){
			e.printStackTrace();
		}
  			finally{
  				resultSet.close();
  				stmt.close();
  				conn.close();
  			}
	//	System.out.println(RESULTDATA);
        return RESULTDATA;
   
	}
	
	
	
	
	
	public   JSONArray activitySearch(HttpSession session) throws SQLException
	{
		
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
    	
        Connection conn =null;
        Statement stmt =null;
        ResultSet resultSet =null;
        
    
        
  			try {
				 conn = ClsConnection.getMyConnection();
				 stmt = conn.createStatement ();
            	
				String sql= ("select doc_no as adocno,ay_name from my_activity where status=3" );
				System.out.println("------------------"+sql);
				 resultSet = stmt.executeQuery(sql) ;
				RESULTDATA=ClsCommon.convertToJSON(resultSet);
		}
		catch(Exception e){ 
			e.printStackTrace();
		}
  			finally{
  				
  				conn.close();
  			}
	//	System.out.println(RESULTDATA);
        return RESULTDATA;

	}

	
	public   JSONArray areaSearch(HttpSession session) throws SQLException
	{
		
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
    	
        Connection conn =null;
        Statement stmt  =null;
        ResultSet resultSet =null;
        
  			try {
				 conn = ClsConnection.getMyConnection();
				 stmt = conn.createStatement ();
            	
				String sql= ("select a.doc_no as areadocno,a.area as area,c.city_name as city_name,ac.country_name as country_name,r.reg_name as region_name from my_area a inner join my_acity c on(a.city_id=c.doc_no) inner join my_acountry ac on(ac.doc_no=c.country_id) inner join my_aregion r on(r.doc_no=ac.reg_id) where a.status=3 and c.status=3 and ac.status=3 and r.status=3" );
				 //String sql= ("select c.doc_no as citydocno,c.city_name as city_name,ac.country_name as country_name,r.reg_name as region_name from my_acity c left join my_acountry ac on(ac.doc_no=c.country_id) left join my_aregion r on(r.doc_no=ac.reg_id) where  c.status=3 and ac.status=3 and r.status=3" );
				 System.out.println("------------------"+sql);
				 resultSet = stmt.executeQuery(sql) ;
				RESULTDATA=ClsCommon.convertToJSON(resultSet);
		}
		catch(Exception e){
			e.printStackTrace();
		}
  			finally{
  				resultSet.close();
  				stmt.close();
  				conn.close();
  				
  				
  			}
	//	System.out.println(RESULTDATA);
        return RESULTDATA;
   
	}
	
	
	
	
	 public   JSONArray vdrGridload(HttpSession session,int docno) throws SQLException {

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
	 
	        String brnch=session.getAttribute("BRANCHID").toString();
	  
	        Connection conn =null;
	        Statement cpstmt =null;
	        
			try {
					 conn = ClsConnection.getMyConnection();
					 cpstmt = conn.createStatement ();
	            	
					String  cpsql=("select cperson as cpersion,mob as mobile,email,tel as phone,area,area_id as areaid,extn,ay_name as activity,actvty_id as activity_id from my_crmcontact c left join my_area a on(c.area_id=a.doc_no) left join my_activity ac on(ac.doc_no=c.actvty_id) where c.cldocno="+docno+" and c.dtype='VND'");
					System.out.println("---------------cpsql--------------"+cpsql);
					
					ResultSet resultSet = cpstmt.executeQuery (cpsql);
					RESULTDATA=ClsCommon.convertToJSON(resultSet);
					
			}
			catch(Exception e){
				e.printStackTrace();
			}
			finally{
				cpstmt.close();
				conn.close();
			}
			//System.out.println(RESULTDATA);
	        return RESULTDATA;
	    }
	
	
	
	public int insert(Date vendorDate, String formdetailcode, String txtvendorname,String cmbcurrency, String cmbcategory, String cmbaccgroup,
			String txtaccount, int txtcredit_period_min,int txtcredit_period_max, int txtcredit_limit, String txtaddress,String txtaddress1, String txttel, String txtmob,
			String txtoffice,String txtfax, String txtemail, String txtcontact, String txtextno,HttpSession session,HttpServletRequest request,ArrayList<String> descarray,
			ArrayList<String> vcparray,String txtpanno,String txtserv_taxno,int count_id,String txtcity,String txtibanno,String txtswiftno,String brgadd,String brhname,
			String bnkname,String txtaccno,int types) throws SQLException {
		
		Connection conn = null;
		
		try{
				conn=ClsConnection.getMyConnection();
				conn.setAutoCommit(false);
				
				String company=session.getAttribute("COMPANYID").toString().trim();
				String branch=session.getAttribute("BRANCHID").toString().trim();
				String currency=session.getAttribute("CURRENCYID").toString().trim();
				String userid=session.getAttribute("USERID").toString().trim();
				
				CallableStatement stmtVND = conn.prepareCall("{CALL vendorDetailsDML(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)}");

				stmtVND.registerOutParameter(23, java.sql.Types.INTEGER);
				stmtVND.registerOutParameter(24, java.sql.Types.INTEGER);
				stmtVND.setDate(1,vendorDate);
				stmtVND.setString(2,txtvendorname);
				stmtVND.setString(3,cmbcurrency);
				stmtVND.setString(4,cmbcategory);
				
				stmtVND.setString(5,cmbaccgroup);
				stmtVND.setInt(6,txtcredit_period_min);
				stmtVND.setInt(7,txtcredit_period_max);
				stmtVND.setInt(8,txtcredit_limit);

				stmtVND.setString(9,txtaddress);
				stmtVND.setString(10,txtaddress1);
				stmtVND.setString(11,txttel);
				stmtVND.setString(12,txtmob);
				stmtVND.setString(13,txtoffice);
				stmtVND.setString(14,txtfax);
				stmtVND.setString(15,txtemail);
				stmtVND.setString(16,txtcontact);
				stmtVND.setString(17,txtextno);
				
				stmtVND.setString(18,formdetailcode);
				stmtVND.setString(19,currency);
				stmtVND.setString(20,branch);
				stmtVND.setString(21,company);
				stmtVND.setString(22,userid);
				stmtVND.setString(25,"A");
				stmtVND.executeQuery();
				int docno=stmtVND.getInt("docNo");
				int accountno=stmtVND.getInt("documentNo");
				request.setAttribute("acno", accountno);
				
				vendorDetailsBean.setTxtvendordocno(docno);
				if(docno<=0)
				{
					conn.close();
					return 0;
					
				}
				
				
				
				 Statement stmt1 =null;
				 
				 stmt1 = conn.createStatement ();
				 String q1=("update my_acbook set panno= '"+txtpanno+"' , trnnumber ='"+txtpanno+"' ,tinno= '"+txtpanno+"' ,servtaxno='"+txtserv_taxno+"' ,account_no='"+txtaccno+"',"
				 		+ " bank_name='"+bnkname+"',branch_name='"+brhname+"',branch_address='"+brgadd+"', "
				 		+ "bnkSwiftno='"+txtswiftno+"',ibanno='"+txtibanno+"',bnkCity='"+txtcity+"',bnkCountryid='"+count_id+"',type="+types+" where "
				 		+ " doc_no='"+docno+"' and dtype='VND' ");
				/* String q1="(insert into my_acbook (panno,servtaxno,cldocno)values('txtpanno','txtserv_taxno',10)";*/
			   System.out.println("-------update query-----------"+q1);
			  stmt1.executeUpdate(q1) ;	
			   System.out.println("------------------Ececute update in insertion");
				
				
				
				
				 for(int i=0;i< vcparray.size() ;i++){
					  String[] cparray=((String) vcparray.get(i)).split("::");
					  int resultSettcl=0;
					   String tclsql="";
					   int j=1;
					   
					    if(!(cparray[0].trim().equalsIgnoreCase("undefined")|| cparray[0].trim().equalsIgnoreCase("NaN")||cparray[0].trim().equalsIgnoreCase("")|| cparray[0].isEmpty()))
					     {
					   
					   tclsql="INSERT INTO my_crmcontact(cldocno,dtype,sr_no,cperson,mob,tel,extn,email,area_id,actvty_id) values('"+docno+"','"+formdetailcode+"',"+j+","
								  +"'"+(cparray[0].trim().equalsIgnoreCase("undefined")||cparray[0].trim()==null || cparray[0].trim().equalsIgnoreCase("") || cparray[0].trim().equalsIgnoreCase("NaN")|| cparray[0].isEmpty()?0:cparray[0].trim())+"',"
								  + "'"+(cparray[1].trim().equalsIgnoreCase("undefined")||cparray[1].trim()==null  || cparray[1].trim().equalsIgnoreCase("") || cparray[1].trim().equalsIgnoreCase("NaN")|| cparray[1].isEmpty()?"":cparray[1].trim())+"',"
								  +"'"+(cparray[2].trim().equalsIgnoreCase("undefined")||cparray[2].trim()==null || cparray[2].trim().equalsIgnoreCase("") || cparray[2].trim().equalsIgnoreCase("NaN")|| cparray[2].isEmpty()?0:cparray[2].trim())+"',"
								  + "'"+(cparray[3].trim().equalsIgnoreCase("undefined")||cparray[3].trim()==null  || cparray[3].trim().equalsIgnoreCase("") || cparray[3].trim().equalsIgnoreCase("NaN")|| cparray[3].isEmpty()?"":cparray[3].trim())+"',"
								  + "'"+(cparray[4].trim().equalsIgnoreCase("undefined")||cparray[4].trim()==null  || cparray[4].trim().equalsIgnoreCase("") || cparray[4].trim().equalsIgnoreCase("NaN")|| cparray[4].isEmpty()?"":cparray[4].trim())+"',"
								  + "'"+(cparray[6].trim().equalsIgnoreCase("undefined")||cparray[6].trim()==null  || cparray[5].trim().equalsIgnoreCase("") || cparray[6].trim().equalsIgnoreCase("NaN")|| cparray[6].isEmpty()?0:cparray[6].trim())+"',"
								  + "'"+(cparray[7].trim().equalsIgnoreCase("undefined")||cparray[7].trim()==null  || cparray[7].trim().equalsIgnoreCase("") || cparray[7].trim().equalsIgnoreCase("NaN")|| cparray[7].isEmpty()?0:cparray[7].trim())+"')";
								  System.out.println("==tclsql===+"+tclsql);
								  
								   resultSettcl = stmtVND.executeUpdate (tclsql);
								  j=j+1;
								  if(resultSettcl<=0)
								     {
									  conn.close();
								    	 return 0;
								    	 
								     }
								  
					     }
					   
					   
				 	}
				
				
				
				for(int i=0;i<descarray.size();i++){
					 String[] purorderarray=descarray.get(i).split("::");
				
					    if(!(purorderarray[0].trim().equalsIgnoreCase("undefined")|| purorderarray[0].trim().equalsIgnoreCase("NaN")||purorderarray[0].trim().equalsIgnoreCase("")|| purorderarray[0].isEmpty()))
					     {
				
				    		 String sql="INSERT INTO my_vendorbrand(sr_no,brandid,desc1,brhid,rdocno)VALUES"
								       + " ("+(i+1)+","
								       + "'"+(purorderarray[0].trim().equalsIgnoreCase("undefined") || purorderarray[0].trim().equalsIgnoreCase("NaN")|| purorderarray[0].trim().equalsIgnoreCase("")|| purorderarray[0].isEmpty()?0:purorderarray[0].trim())+"',"
								       + "'"+(purorderarray[1].trim().equalsIgnoreCase("undefined") || purorderarray[1].trim().equalsIgnoreCase("NaN")|| purorderarray[1].trim().equalsIgnoreCase("")|| purorderarray[1].isEmpty()?0:purorderarray[1].trim())+"',"
								       + "'"+session.getAttribute("BRANCHID").toString()+"',"
								       +"'"+docno+"')";
						     int resultSet2 = stmtVND.executeUpdate(sql);
						     
						     if(resultSet2<=0)
								{
									conn.close();
									return 0;
									
								}
					 
					 
				            }
					    
				      }
				
				if (docno>0 && accountno>0) {
					
					conn.commit();
					stmtVND.close();
					conn.close();
					return docno;
				}
				
				stmtVND.close();
				conn.close();
			 }catch(Exception e){
				 	e.printStackTrace();
				 	conn.close();
				 	return 0;
			 }finally{
				 conn.close();
			 }
		return 0;
	}

	public int edit(int txtvendordocno, String formdetailcode, Date vendorDate,String txtvendorname, String cmbcurrency, String cmbcategory,
			String cmbaccgroup, String txtaccount, int txtcredit_period_min,int txtcredit_period_max, int txtcredit_limit, String txtaddress,
			String txtaddress1, String txttel, String txtmob, String txtoffice,String txtfax, String txtemail, String txtcontact, String txtextno,
			HttpSession session,ArrayList<String> descarray,String txtpanno,String txtserv_taxno,int count_id,String txtcity,String txtibanno,
			String txtswiftno,String brgadd,String brhname,String bnkname,String txtaccno,ArrayList<String> vcparray,int types) throws SQLException {
		
			Connection conn = null;
		
		    try{
		    		conn=ClsConnection.getMyConnection();
					conn.setAutoCommit(false);
				
			    	String company=session.getAttribute("COMPANYID").toString().trim();
		 			String branch=session.getAttribute("BRANCHID").toString().trim();
		 			String currency=session.getAttribute("CURRENCYID").toString().trim();
		 			String userid=session.getAttribute("USERID").toString().trim();
				
					CallableStatement stmtVND = conn.prepareCall("{CALL vendorDetailsDML(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)}");		

					stmtVND.setInt(23,txtvendordocno);
					stmtVND.setString(24,txtaccount);
					stmtVND.setDate(1,vendorDate);
					stmtVND.setString(2,txtvendorname);
					stmtVND.setString(3,cmbcurrency);
					stmtVND.setString(4,cmbcategory);
					
					stmtVND.setString(5,cmbaccgroup);
					stmtVND.setInt(6,txtcredit_period_min);
					stmtVND.setInt(7,txtcredit_period_max);
					stmtVND.setInt(8,txtcredit_limit);

					stmtVND.setString(9,txtaddress);
					stmtVND.setString(10,txtaddress1);
					stmtVND.setString(11,txttel);
					stmtVND.setString(12,txtmob);
					stmtVND.setString(13,txtoffice);
					stmtVND.setString(14,txtfax);
					stmtVND.setString(15,txtemail);
					stmtVND.setString(16,txtcontact);
					stmtVND.setString(17,txtextno);
					
					stmtVND.setString(18,formdetailcode);
					stmtVND.setString(19,currency);
					stmtVND.setString(20,branch);
					stmtVND.setString(21,company);
					stmtVND.setString(22,userid);
					stmtVND.setString(25,"E");
					stmtVND.executeQuery();
					int docno=stmtVND.getInt("docNo");
					int accountno=stmtVND.getInt("documentNo");
					
					vendorDetailsBean.setTxtvendordocno(docno);
					
					if(docno<=0)
					{
						conn.close();
						return 0;
						
					}
					
					
					 Statement stmt1 =null;
					 
					 stmt1 = conn.createStatement ();
					 String q1=("update my_acbook set panno= '"+txtpanno+"' , trnnumber ='"+txtpanno+"' ,tinno= '"+txtpanno+"' , servtaxno='"+txtserv_taxno+"' ,account_no='"+txtaccno+"',"
					 		+ " bank_name='"+bnkname+"',branch_name='"+brhname+"',branch_address='"+brgadd+"', "
					 		+ "bnkSwiftno='"+txtswiftno+"',ibanno='"+txtibanno+"',bnkCity='"+txtcity+"',bnkCountryid='"+count_id+"',type="+types+" where "
					 		+ " doc_no='"+docno+"' and dtype='VND' ");


				   System.out.println("-------update query in edit-----------"+q1);
				  stmt1.executeUpdate(q1) ;	
				   System.out.println("------------------Ececute update in updation");
				   
				   
				   
				   
					
					String sqls="delete from my_crmcontact where cldocno='"+docno+"' and dtype='VND'";
					stmtVND.executeUpdate(sqls);
					
					 for(int i=0;i< vcparray.size() ;i++){
						  String[] cparray=((String) vcparray.get(i)).split("::");
						  int resultSettcl=0;
						   String tclsql="";
						   int j=1;
						   
						    if(!(cparray[0].trim().equalsIgnoreCase("undefined")|| cparray[0].trim().equalsIgnoreCase("NaN")||cparray[0].trim().equalsIgnoreCase("")|| cparray[0].isEmpty()))
						     {
						   
						   tclsql="INSERT INTO my_crmcontact(cldocno,dtype,sr_no,cperson,mob,tel,extn,email,area_id,actvty_id) values('"+docno+"','"+formdetailcode+"',"+j+","
									  +"'"+(cparray[0].trim().equalsIgnoreCase("undefined")||cparray[0].trim()==null || cparray[0].trim().equalsIgnoreCase("") || cparray[0].trim().equalsIgnoreCase("NaN")|| cparray[0].isEmpty()?0:cparray[0].trim())+"',"
									  + "'"+(cparray[1].trim().equalsIgnoreCase("undefined")||cparray[1].trim()==null  || cparray[1].trim().equalsIgnoreCase("") || cparray[1].trim().equalsIgnoreCase("NaN")|| cparray[1].isEmpty()?"":cparray[1].trim())+"',"
									  +"'"+(cparray[2].trim().equalsIgnoreCase("undefined")||cparray[2].trim()==null || cparray[2].trim().equalsIgnoreCase("") || cparray[2].trim().equalsIgnoreCase("NaN")|| cparray[2].isEmpty()?0:cparray[2].trim())+"',"
									  + "'"+(cparray[3].trim().equalsIgnoreCase("undefined")||cparray[3].trim()==null  || cparray[3].trim().equalsIgnoreCase("") || cparray[3].trim().equalsIgnoreCase("NaN")|| cparray[3].isEmpty()?"":cparray[3].trim())+"',"
									  + "'"+(cparray[4].trim().equalsIgnoreCase("undefined")||cparray[4].trim()==null  || cparray[4].trim().equalsIgnoreCase("") || cparray[4].trim().equalsIgnoreCase("NaN")|| cparray[4].isEmpty()?"":cparray[4].trim())+"',"
									  + "'"+(cparray[6].trim().equalsIgnoreCase("undefined")||cparray[6].trim()==null  || cparray[5].trim().equalsIgnoreCase("") || cparray[6].trim().equalsIgnoreCase("NaN")|| cparray[6].isEmpty()?0:cparray[6].trim())+"',"
									  + "'"+(cparray[7].trim().equalsIgnoreCase("undefined")||cparray[7].trim()==null  || cparray[7].trim().equalsIgnoreCase("") || cparray[7].trim().equalsIgnoreCase("NaN")|| cparray[7].isEmpty()?0:cparray[7].trim())+"')";
									  System.out.println("==tclsql===+"+tclsql);
									  
									   resultSettcl = stmtVND.executeUpdate (tclsql);
									  j=j+1;
									  if(resultSettcl<=0)
									     {
										  conn.close();
									    	 return 0;
									    	 
									     }
									  
						     }
						   
						   
					 	}
					
				   
				   
				   
				   
					
					
					String sqls1="delete from my_vendorbrand where rdocno='"+docno+"'";
					stmtVND.executeUpdate(sqls1);
					
					for(int i=0;i<descarray.size();i++){
						 String[] purorderarray=descarray.get(i).split("::");
					
						    if(!(purorderarray[0].trim().equalsIgnoreCase("undefined")|| purorderarray[0].trim().equalsIgnoreCase("NaN")||purorderarray[0].trim().equalsIgnoreCase("")|| purorderarray[0].isEmpty()))
						     {
					
					    		 String sql="INSERT INTO my_vendorbrand(sr_no,brandid,desc1,brhid,rdocno)VALUES"
									       + " ("+(i+1)+","
									       + "'"+(purorderarray[0].trim().equalsIgnoreCase("undefined") || purorderarray[0].trim().equalsIgnoreCase("NaN")|| purorderarray[0].trim().equalsIgnoreCase("")|| purorderarray[0].isEmpty()?0:purorderarray[0].trim())+"',"
									       + "'"+(purorderarray[1].trim().equalsIgnoreCase("undefined") || purorderarray[1].trim().equalsIgnoreCase("NaN")|| purorderarray[1].trim().equalsIgnoreCase("")|| purorderarray[1].isEmpty()?0:purorderarray[1].trim())+"',"
									       + "'"+session.getAttribute("BRANCHID").toString()+"',"
									       +"'"+docno+"')";
							     int resultSet2 = stmtVND.executeUpdate(sql);
							     
							     if(resultSet2<=0)
									{
										conn.close();
										return 0;
										
									}
						 
						 
					            }
						    
					      }
					
					
					
					if (docno > 0 && accountno > 0) {
						
						conn.commit();
						stmtVND.close();
						conn.close();
						return 1;
					}
					stmtVND.close();
					conn.close();
			 }catch(Exception e){
				 	e.printStackTrace();
				 	conn.close();
				 	return 0;
			 }finally{
				 conn.close();
			 }
		return 0;
	}

	public int delete(int txtvendordocno, String txtaccount, String formdetailcode, HttpSession session) throws SQLException {
		Connection conn = null;
		
		try{
			conn=ClsConnection.getMyConnection();
			conn.setAutoCommit(false);
			
			String company=session.getAttribute("COMPANYID").toString().trim();
 			String branch=session.getAttribute("BRANCHID").toString().trim();
 			String currency=session.getAttribute("CURRENCYID").toString().trim();
 			String userid=session.getAttribute("USERID").toString().trim();
		    
			CallableStatement stmtVND = conn.prepareCall("{CALL vendorDetailsDML(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)}");		
			
			stmtVND.setInt(23,txtvendordocno);
			stmtVND.setString(24,txtaccount);
			stmtVND.setDate(1,null);
			stmtVND.setString(2,null);
			stmtVND.setString(3,null);
			stmtVND.setString(4,null);
			
			stmtVND.setString(5,null);
			stmtVND.setInt(6,0);
			stmtVND.setInt(7,0);
			stmtVND.setInt(8,0);

			stmtVND.setString(9,null);
			stmtVND.setString(10,null);
			stmtVND.setString(11,null);
			stmtVND.setString(12,null);
			stmtVND.setString(13,null);
			stmtVND.setString(14,null);
			stmtVND.setString(15,null);
			stmtVND.setString(16,null);
			stmtVND.setString(17,null);
			
			stmtVND.setString(18,formdetailcode);
			stmtVND.setString(19,currency);
			stmtVND.setString(20,branch);
			stmtVND.setString(21,company);
			stmtVND.setString(22,userid);
			stmtVND.setString(25,"D");
			stmtVND.executeQuery();
			int docno=stmtVND.getInt("docNo");
			int accountno=stmtVND.getInt("documentNo");
			
			vendorDetailsBean.setTxtvendordocno(docno);
			if (docno > 0 && accountno > 0) {
				
				conn.commit();
				stmtVND.close();
				conn.close();
				return 1;
			}	
			
			if (docno == -1){
				stmtVND.close();
				conn.close();
				return docno;
			}
			stmtVND.close();
			conn.close();
	 }catch(Exception e){
		 	e.printStackTrace();
		 	conn.close();
		 	return 0;
	 }finally{
		 conn.close();
	 }
		return 0;
	}

	public   ClsVendorDetailsBean getViewDetails(int docNo) throws SQLException {
		ClsVendorDetailsBean vendorDetailsBean = new ClsVendorDetailsBean();
		
		Connection conn = null;
		
		try {
			conn = ClsConnection.getMyConnection();
			Statement stmtVND = conn.createStatement();

			ResultSet resultSet = stmtVND.executeQuery ("select ac.type,ac.date,ac.codeno,ac.RefName,ac.curId,ac.catid,ac.acc_group,ac.acno,ac.period,ac.period2, "
					+ " ac.credit,ac.address,ac.address2,ac.per_tel,ac.per_mob,ac.com_mob,ac.fax1,ac.mail1,ac.contactPerson,ac.EXT_NO,ac.dtype,ac.DOC_NO,"
					+ "ac.STATUS,ac.account_no,ac.bank_name,ac.branch_name,ac.branch_address,ac.IBANno,ac.bnkSwiftno,ac.bnkCity,cr.country_name,ac.panno,ac.servtaxno  "
					+ " from my_acbook ac left join my_acountry cr on(ac.bnkCountryid=cr.doc_no) where ac.dtype='VND' and ac.status=3 and ac.doc_no="+docNo);

			while (resultSet.next()) {
				vendorDetailsBean.setTxtvendordocno(docNo);
				vendorDetailsBean.setJqxVendorDate(resultSet.getDate("date").toString());
				vendorDetailsBean.setTxtcode(resultSet.getInt("codeno"));
				vendorDetailsBean.setTxtvendorname(resultSet.getString("RefName"));
				vendorDetailsBean.setHidcmbcurrency(resultSet.getString("curId"));
				vendorDetailsBean.setHidcmbcategory(resultSet.getString("catid"));
				vendorDetailsBean.setHidcmbaccgroup(resultSet.getString("acc_group"));
				vendorDetailsBean.setTxtaccount(resultSet.getString("acno"));
				vendorDetailsBean.setTxtcredit_period_min(resultSet.getInt("period"));
				vendorDetailsBean.setTxtcredit_period_max(resultSet.getInt("period2"));
				vendorDetailsBean.setTxtcredit_limit(resultSet.getInt("credit"));
				vendorDetailsBean.setTxtaddress(resultSet.getString("address"));
				vendorDetailsBean.setTxtaddress1(resultSet.getString("address2"));
				vendorDetailsBean.setTxttel(resultSet.getString("per_tel"));
				vendorDetailsBean.setTxtmob(resultSet.getString("per_mob"));
				vendorDetailsBean.setTxtoffice(resultSet.getString("com_mob"));
				vendorDetailsBean.setTxtfax(resultSet.getString("fax1"));
				vendorDetailsBean.setTxtemail(resultSet.getString("mail1"));
				vendorDetailsBean.setTxtcontact(resultSet.getString("contactPerson"));
				vendorDetailsBean.setTxtextno(resultSet.getString("EXT_NO"));			
				
				vendorDetailsBean.setCmbtype(resultSet.getInt("type"));	
				
				vendorDetailsBean.setPanno(resultSet.getString("panno"));
				vendorDetailsBean.setServtaxno(resultSet.getString("servtaxno"));
				vendorDetailsBean.setTxtaccountno(resultSet.getString("account_no"));
				vendorDetailsBean.setTxtbankname(resultSet.getString("bank_name"));
				vendorDetailsBean.setTxtbranchname(resultSet.getString("branch_name"));
				vendorDetailsBean.setTxtbranchaddress(resultSet.getString("branch_address"));
				vendorDetailsBean.setTxtibanno(resultSet.getString("IBANno"));
				vendorDetailsBean.setTxtswiftno(resultSet.getString("bnkSwiftno"));
				vendorDetailsBean.setTxtcity(resultSet.getString("bnkCity"));
				vendorDetailsBean.setTxtcountry(resultSet.getString("country_name"));
				
				
				
				
			    }
			stmtVND.close();
			conn.close();
			}catch(Exception e){
				e.printStackTrace();
				conn.close();
			}finally{
				 conn.close();
			 }
			return vendorDetailsBean;
			}
	
	 public   JSONArray vndMainSearch(String vndname,String vndaccno,String vndmob,String vndtel) throws SQLException {
	        List<ClsVendorDetailsBean> vndMainSearchBean = new ArrayList<ClsVendorDetailsBean>();

	        JSONArray RESULTDATA=new JSONArray();
	        
	        Connection conn = null;
	        
			try {
					conn = ClsConnection.getMyConnection();
					Statement stmtVND = conn.createStatement();
	            	String sqltest="";
			        
			        if(!(vndname.equalsIgnoreCase(""))){
			            sqltest=sqltest+" and refname like '%"+vndname+"%'";
			        }
			        if(!(vndaccno.equalsIgnoreCase(""))){
			         sqltest=sqltest+" and acno like '%"+vndaccno+"%'";
			        }
			        if(!(vndtel.equalsIgnoreCase(""))){
			         sqltest=sqltest+" and per_tel like '%"+vndtel+"%'";
			        }
			        if(!(vndmob.equalsIgnoreCase(""))){
			         sqltest=sqltest+" and per_mob like '%"+vndmob+"%'";
			        }
					
				String sql=("select refname,acno,per_tel,per_mob,doc_no from my_acbook where dtype='VND' and status<>7 "+sqltest);
					
				System.out.println("========sql======="+sql);
				ResultSet resultSet = stmtVND.executeQuery(sql);
					RESULTDATA=ClsCommon.convertToJSON(resultSet);
					
					stmtVND.close();
					conn.close();
			}catch(Exception e){
				e.printStackTrace();
				conn.close();
			}finally{
				 conn.close();
			 }
	        return RESULTDATA;
	    }
	 
	 public   JSONArray vendorList() throws SQLException {
			Connection conn = null;
	        JSONArray RESULTDATA=new JSONArray();
	        
	  try {
		    conn = ClsConnection.getMyConnection();
		    Statement stmtVND = conn.createStatement();
		    
		    ResultSet resultSet = stmtVND.executeQuery ("SELECT category,refname,per_mob,sal_name,concat(address,'  ',address2) as address, "
		    		+ "mail1 FROM my_acbook CL left JOIN my_clcatm cat ON cl.catid=cat.doc_no and cat.dtype='VND' left join my_salesman s on (cl.sal_id=s.doc_no) and sal_type='SLA' where cl.dtype='VND' ");
		                
		    RESULTDATA=ClsCommon.convertToJSON(resultSet);
		    
		    stmtVND.close();
		    conn.close();
	  }catch(Exception e){
	     e.printStackTrace();
		 conn.close();
	  }finally{
			 conn.close();
		 }
	  return RESULTDATA;
	 }
	    
	 
	 
	 public   JSONArray searchBrand() throws SQLException {
			Connection conn = null;
	        JSONArray RESULTDATA=new JSONArray();
	        
	  try {
		    conn = ClsConnection.getMyConnection();
		    Statement stmtVND = conn.createStatement();
		    
		    ResultSet resultSet = stmtVND.executeQuery ("select doc_no,brand,brandname from my_brand where status=3; ");
		                
		    RESULTDATA=ClsCommon.convertToJSON(resultSet);
		    
		    stmtVND.close();
		    conn.close();
	  }catch(Exception e){
	     e.printStackTrace();
		 conn.close();
	  }finally{
			 conn.close();
		 }
	  return RESULTDATA;
	 }
	 public   JSONArray gridreload(String rdocno) throws SQLException {
			Connection conn = null;
	        JSONArray RESULTDATA=new JSONArray();
	        
	  try {
		    conn = ClsConnection.getMyConnection();
		    Statement stmtVND = conn.createStatement();
		    
		    ResultSet resultSet = stmtVND.executeQuery ("select b.doc_no,b.brandname,if(m.desc1='0','',m.desc1) desc1 from my_vendorbrand m left join my_brand b on b.doc_no=m.brandid where rdocno='"+rdocno+"' ");
		                
		    RESULTDATA=ClsCommon.convertToJSON(resultSet);
		    
		    stmtVND.close();
		    conn.close();
	  }catch(Exception e){
	     e.printStackTrace();
		 conn.close();
	  }finally{
			 conn.close();
		 }
	  return RESULTDATA;
	 }
	       
 
}
