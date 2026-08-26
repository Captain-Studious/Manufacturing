package com.controlcentre.masters.client;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import net.sf.json.JSONArray;

import org.apache.catalina.connector.Request;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.SessionAware;

import com.common.ClsCommon;
import com.connection.ClsConnection;
import com.mysql.jdbc.PreparedStatement;
import com.opensymphony.xwork2.ActionSupport;


public class ClsClientDAO {
	
	ClsConnection ClsConnection=new ClsConnection();
	ClsCommon ClsCommon=new ClsCommon();
	public   JSONArray areaSearch(HttpSession session) throws SQLException
	{
		
		JSONArray RESULTDATA=new JSONArray();
 
    	
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
	public   JSONArray salSearch() throws SQLException
	{
		
		JSONArray RESULTDATA=new JSONArray();
   	   
    	    	
 
    	
        Connection conn =null;
        Statement stmt  =null;
        ResultSet resultSet =null;
        
  			try {
				 conn = ClsConnection.getMyConnection();
				 stmt = conn.createStatement ();
            	
				String sql= ("select sal_id salesmancode ,sal_name salesmanname,doc_no from my_salm where status=3" );
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
	
	
	
	
	
	
	
	
	
	
	
	public JSONArray suitbrandSearch(HttpSession session) throws SQLException {


		JSONArray RESULTDATA=new JSONArray();

		Connection conn = null;

		try {
			conn = ClsConnection.getMyConnection();
			Statement stmt = conn.createStatement();

			String sql="select convert(doc_no,char(50)) as doc_no,brand from (select doc_no,brand from my_sbrand where status=3  ) as a ";

			ResultSet resultSet = stmt.executeQuery(sql);
			RESULTDATA=ClsCommon.convertToJSON(resultSet);


		}catch(Exception e){
			e.printStackTrace();

		}finally{
			conn.close();
		}
		return RESULTDATA;
	}

	
	
	public JSONArray suitmodelSearch(HttpSession session,String brandid) throws SQLException {


		JSONArray RESULTDATA=new JSONArray();

		Connection conn = null;

		try {
			conn = ClsConnection.getMyConnection();
			Statement stmt = conn.createStatement();

			//String sql="select m.doc_no,model,brand from my_smodel m left join my_sbrand b on(m.brandid=b.doc_no) where b.status=3 and m.status=3 and b.doc_no in ("+brandid+")";
			String sql="select convert(doc_no,char(50)) as doc_no,model,brand from ( select m.doc_no,model,brand from my_smodel m left join my_sbrand b on(m.brandid=b.doc_no) where b.status=3 and m.status=3 and m.brandid='"+brandid+"' ) as a";
			System.out.println("===modelSearch===="+sql);
			ResultSet resultSet = stmt.executeQuery(sql);
			RESULTDATA=ClsCommon.convertToJSON(resultSet);


		}catch(Exception e){
			e.printStackTrace();

		}finally{
			conn.close();
		}
		return RESULTDATA;
	}

	public JSONArray subModelSearch(HttpSession session,String brandid,String modelid) throws SQLException {


		JSONArray RESULTDATA=new JSONArray();

		Connection conn = null;

		try {
			conn = ClsConnection.getMyConnection();
			Statement stmt = conn.createStatement();

			
			String sql="select convert(doc_no,char(50)) as doc_no,submodel,model from "
					+ "( select m.doc_no,submodel,model from my_ssubmodel m left join my_smodel mo "
					+ "on(m.modelid=mo.doc_no) where mo.status=3 and m.status=3 and m.modelid="+modelid+""
					+ " and m.brandid="+brandid+" ) as a";
			System.out.println("===subModelSearch===="+sql);
			ResultSet resultSet = stmt.executeQuery(sql);
			RESULTDATA=ClsCommon.convertToJSON(resultSet);


		}catch(Exception e){
			e.printStackTrace();

		}finally{
			conn.close();
		}
		return RESULTDATA;
	}

	public JSONArray yomSearch(HttpSession session) throws SQLException {


		JSONArray RESULTDATA=new JSONArray();

		Connection conn = null;

		try {
			conn = ClsConnection.getMyConnection();
			Statement stmt = conn.createStatement();

			//String sql="select doc_no,yom from my_syom where status=3";
			String sql="select convert(doc_no,char(50)) as doc_no,yom from ( select doc_no,yom from my_syom where status=3 union all select '-1','ALL') as a";
			ResultSet resultSet = stmt.executeQuery(sql);
			RESULTDATA=ClsCommon.convertToJSON(resultSet);


		}catch(Exception e){
			e.printStackTrace();

		}finally{
			conn.close();
		}
		return RESULTDATA;
	}

	public JSONArray suitSpec1Search(HttpSession session,String brandid,String modelid,String submodelid) throws SQLException {


		JSONArray RESULTDATA=new JSONArray();

		Connection conn = null;

		try {
			conn = ClsConnection.getMyConnection();
			Statement stmt = conn.createStatement();

			//String sql="select doc_no,spec from my_suitspec1 where status=3";
			String sql="select convert(doc_no,char(50)) as doc_no,spec from ( select doc_no,spec from my_suitspec1 where status=3 and brandid="+brandid+" and  modelid="+modelid+" and  submodelid="+submodelid+") as a";
			ResultSet resultSet = stmt.executeQuery(sql);
			RESULTDATA=ClsCommon.convertToJSON(resultSet);


		}catch(Exception e){
			e.printStackTrace();

		}finally{
			conn.close();
		}
		return RESULTDATA;
	}

	public JSONArray suitSpec2Search(HttpSession session,String brandid,String modelid,String submodelid) throws SQLException {

		JSONArray RESULTDATA=new JSONArray();

		Connection conn = null;

		try {
			conn = ClsConnection.getMyConnection();
			Statement stmt = conn.createStatement();

			//String sql="select doc_no,spec from my_suitspec2 where status=3";
			String sql="select convert(doc_no,char(50)) as doc_no,spec from ( select doc_no,spec from my_suitspec2 where status=3 and brandid="+brandid+" and  modelid="+modelid+" and  submodelid="+submodelid+") as a";
			ResultSet resultSet = stmt.executeQuery(sql);
			RESULTDATA=ClsCommon.convertToJSON(resultSet);


		}catch(Exception e){
			e.printStackTrace();

		}finally{
			conn.close();
		}
		return RESULTDATA;
	}

	public JSONArray suitSpec3Search(HttpSession session,String brandid,String modelid,String submodelid) throws SQLException {

		JSONArray RESULTDATA=new JSONArray();

		Connection conn = null;

		try {
			conn = ClsConnection.getMyConnection();
			Statement stmt = conn.createStatement();

			//String sql="select doc_no,spec from my_suitspec3 where status=3";
			String sql="select convert(doc_no,char(50)) as doc_no,spec from ( select doc_no,spec from my_suitspec3 where status=3 and brandid="+brandid+" and  modelid="+modelid+" and  submodelid="+submodelid+") as a";
			ResultSet resultSet = stmt.executeQuery(sql);
			RESULTDATA=ClsCommon.convertToJSON(resultSet);


		}catch(Exception e){
			e.printStackTrace();

		}finally{
			conn.close();
		}
		return RESULTDATA;
	}

	
	
	
	
	
	
	
	public   JSONArray activitySearch(HttpSession session) throws SQLException
	{
		
		JSONArray RESULTDATA=new JSONArray();
  
    	    	
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

	
	public int insert(java.sql.Date sqlDate,String client_name, int Currency,int Cmbacgroupid,int Cmbsalesmanid,int catid,String Txtcstno,String Txttinno,
			Double Fcredit_period_min,Double Fcredit_period_max,Double Fcredit_limit,String Txtaddress,String Txtextnno,String Txtmobile,String Txttelephone,
			String Txtfax,String Txtweb,String Txtemail,String Txtcontact,int areaid,String Txtaccountno,String Txtbankname,
			String Txtbranchname,String Txtbranchaddress,String Txtswiftno,String Txtibanno,String Txtcity,
			int countryid,String txtcontact,ArrayList  <String>  cparrayList,HttpSession session,String mode,
			String formcode,String fin_name,String fin_adress,HttpServletRequest request,int salid,String txtserv_taxno, String txtpanno,ArrayList <String> veharray) throws SQLException
	{
		Connection conn=null;
		CallableStatement stmtclient=null;
		int  docno=0;
		try{
			
			
		conn=ClsConnection.getMyConnection();
		conn.setAutoCommit(false);
		
		

/*System.out.println("CALL  TrclientDML("+sqlDate+",'"+client_name+"',"+Currency+","+Cmbacgroupid+","+Cmbsalesmanid+","+catid+","+Fcredit_period_min+","+Fcredit_period_max+","+Fcredit_limit+
		",'"+Txttinno+"','"+Txtcstno+"','"+Txtaddress+"','"+Txttelephone+"','"+Txtmobile+"','"+Txtfax+"','"+Txtemail+"','"+Txtextnno+"','"+Txtweb+"','"+Txtcontact+"',"+areaid+
		",'"+Txtaccountno+"','"+Txtbankname+"','"+Txtbranchname+"','"+Txtbranchaddress+"','"+Txtswiftno+"','"+Txtibanno+"','"+Txtcity+"',"+countryid+","+Integer.parseInt(session.getAttribute("COMPANYID").toString().trim())+","+Integer.parseInt(session.getAttribute("BRANCHID").toString().trim())+","+Integer.parseInt(session.getAttribute("USERID").toString().trim())+",java.sql.Types.INTEGER,java.sql.Types.INTEGER,'"+mode+"','"+formcode+"'");
		*/
		 stmtclient = conn.prepareCall("{CALL  TrclientDML(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)}");
		
		stmtclient.registerOutParameter(32, java.sql.Types.INTEGER);
		stmtclient.registerOutParameter(33, java.sql.Types.INTEGER);
	      // main
		stmtclient.setDate(1,sqlDate);
		stmtclient.setString(2,client_name.toUpperCase());
		stmtclient.setInt(3,Currency);
		stmtclient.setInt(4,Cmbacgroupid);
		stmtclient.setInt(5,2);
		stmtclient.setInt(6,catid);
		stmtclient.setDouble(7,Fcredit_period_min);
		stmtclient.setDouble(8,Fcredit_period_max);
		stmtclient.setDouble(9,Fcredit_limit);
		stmtclient.setString(10,Txttinno);
		stmtclient.setString(11,Txtcstno);
		stmtclient.setString(12,Txtaddress);
		stmtclient.setString(13,Txttelephone);
		stmtclient.setString(14,Txtmobile);
		stmtclient.setString(15,Txtfax);
		stmtclient.setString(16,Txtemail);
		stmtclient.setString(17,Txtextnno);
		stmtclient.setString(18,Txtweb);
		stmtclient.setString(19,Txtcontact);
		stmtclient.setInt(20,areaid);
		stmtclient.setString(21,Txtaccountno);
		stmtclient.setString(22,Txtbankname);
		stmtclient.setString(23,Txtbranchname);
		stmtclient.setString(24,Txtbranchaddress);
		stmtclient.setString(25,Txtswiftno);
		stmtclient.setString(26,Txtibanno);
		stmtclient.setString(27,Txtcity);
		stmtclient.setInt(28,countryid);
		stmtclient.setInt(29,Integer.parseInt(session.getAttribute("COMPANYID").toString().trim()));
		stmtclient.setInt(30,Integer.parseInt(session.getAttribute("BRANCHID").toString().trim()));
		stmtclient.setInt(31,Integer.parseInt(session.getAttribute("USERID").toString().trim()));
		stmtclient.setString(34,mode);
		stmtclient.setString(35,fin_name);
		stmtclient.setString(36,fin_adress);
		stmtclient.setInt(37,salid);
		
	//	   System.out.println("stmtclient"+stmtclient);
		stmtclient.executeQuery();
	     docno=stmtclient.getInt("docNo");
	   int documentNo=stmtclient.getInt("documentNo");
	   request.setAttribute("documentNo", documentNo);
 
	   System.out.println("docno"+docno+"documentNo"+documentNo);
	   if(documentNo>0&&docno>0)
	   {
		   
		   Statement stmt1 =null;
		 
			 stmt1 = conn.createStatement ();
			 String q1=("update my_acbook set panno= '"+txtpanno+"' ,servtaxno='"+txtserv_taxno+"' where "
		   		+ " doc_no='"+docno+"' and dtype='CRM' ");
			/* String q1="(insert into my_acbook (panno,servtaxno,cldocno)values('txtpanno','txtserv_taxno',10)";*/
		   System.out.println("-------update query-----------"+q1);
		   stmt1.executeUpdate(q1) ;	
		   System.out.println("------------------Ececute update in insertion");
		   
		   
		   Statement stmt=conn.createStatement();
		   
		   int catids=0;
		   String sqlsss="select catid from my_acbook where doc_no='"+docno+"' and dtype='CRM' ";
		   
		   System.out.println("========sqlsss================"+sqlsss);
		   
		   ResultSet rsss=stmt.executeQuery(sqlsss);
		   
		   if(rsss.next())
		   {
			   catids=rsss.getInt("catid");
		   }
		   
		   System.out.println("------------catids================"+catids);
		   
		   request.setAttribute("catids", catids);
		   
		   for(int i=0;i< cparrayList.size() ;i++){
				  String[] cparray=((String) cparrayList.get(i)).split("::");
				  int resultSettcl=0;
				   String tclsql="";
				   int j=1;
				   tclsql="INSERT INTO my_crmcontact(cldocno,dtype,sr_no,cperson,mob,tel,extn,email,area_id,actvty_id) values('"+docno+"','"+formcode+"',"+j+","
							  +"'"+(cparray[0].equalsIgnoreCase("undefined")||cparray[0]==null || cparray[0].equalsIgnoreCase("") || cparray[0].trim().equalsIgnoreCase("NaN")|| cparray[0].isEmpty()?0:cparray[0].trim())+"',"
							  + "'"+(cparray[1].trim().equalsIgnoreCase("undefined")||cparray[1]==null  || cparray[1].trim().equalsIgnoreCase("") || cparray[1].trim().equalsIgnoreCase("NaN")|| cparray[1].isEmpty()?"":cparray[1].trim())+"',"
							  +"'"+(cparray[2].equalsIgnoreCase("undefined")||cparray[2]==null || cparray[2].equalsIgnoreCase("") || cparray[2].trim().equalsIgnoreCase("NaN")|| cparray[2].isEmpty()?0:cparray[2].trim())+"',"
							  + "'"+(cparray[3].trim().equalsIgnoreCase("undefined")||cparray[3]==null  || cparray[3].trim().equalsIgnoreCase("") || cparray[3].trim().equalsIgnoreCase("NaN")|| cparray[3].isEmpty()?"":cparray[3].trim())+"',"
							  + "'"+(cparray[4].trim().equalsIgnoreCase("undefined")||cparray[4]==null  || cparray[4].trim().equalsIgnoreCase("") || cparray[4].trim().equalsIgnoreCase("NaN")|| cparray[4].isEmpty()?"":cparray[4].trim())+"',"
							  + "'"+(cparray[6].trim().equalsIgnoreCase("undefined")||cparray[6]==null  || cparray[6].trim().equalsIgnoreCase("") || cparray[6].trim().equalsIgnoreCase("NaN")|| cparray[6].isEmpty()?0:cparray[6].trim())+"',"
							  + "'"+(cparray[7].trim().equalsIgnoreCase("undefined")||cparray[7]==null  || cparray[7].trim().equalsIgnoreCase("") || cparray[7].trim().equalsIgnoreCase("NaN")|| cparray[7].isEmpty()?0:cparray[7].trim())+"')";
							  System.out.println("==tclsql===+"+tclsql);
							  
							   resultSettcl = stmtclient.executeUpdate (tclsql);
							  j=j+1;
							  if(resultSettcl<=0)
							     {
								  conn.close(); 
								  return 0; 
							     }
				   
				   
		   }
	   }
	   
	   
	  // doc_no, cldocno, reg_no, yom, brandid, modelid, submodelid, bsizeid, esizeid, csizeid, dype, sr_no
	   
	   
	   
	   //   newTextBox.val(rows[i].sr_no+"::"+rows[i].regno+" :: "+rows[i].brandid+" :: "
	   //	   +rows[i].modelid+" :: "+rows[i].submodelid+" :: "+rows[i].yomid+" :: "+rows[i].bsizeid+" :: "+rows[i].esizeid+" :: "+rows[i].csizeid+" :: "+"1"+" :: ");
			   //
	   int j=1;
	   for(int i=0;i< veharray.size() ;i++){
			  String[] veharrays=((String) veharray.get(i)).split("::");
			  int resultSettcl=0;
			   String tclsql="";
		
			   
			     if(!(veharrays[1].trim().equalsIgnoreCase("undefined")|| veharrays[1].trim().equalsIgnoreCase("NaN")||veharrays[1].trim().equalsIgnoreCase("")|| veharrays[1].isEmpty()))
			     {
			    	 
			   
			   tclsql="INSERT INTO my_acvehicle(cldocno,sr_no,reg_no,brandid,modelid,submodelid,yom,bsizeid,esizeid,csizeid) values('"+docno+"',"+j+","
						  +"'"+(veharrays[0].equalsIgnoreCase("undefined")||veharrays[0]==null || veharrays[0].equalsIgnoreCase("") || veharrays[0].trim().equalsIgnoreCase("NaN")|| veharrays[0].isEmpty()?0:veharrays[0].trim())+"',"
						  + "'"+(veharrays[1].trim().equalsIgnoreCase("undefined")||veharrays[1]==null  || veharrays[1].trim().equalsIgnoreCase("") || veharrays[1].trim().equalsIgnoreCase("NaN")|| veharrays[1].isEmpty()?"":veharrays[1].trim())+"',"
						  +"'"+(veharrays[2].equalsIgnoreCase("undefined")||veharrays[2]==null || veharrays[2].equalsIgnoreCase("") || veharrays[2].trim().equalsIgnoreCase("NaN")|| veharrays[2].isEmpty()?0:veharrays[2].trim())+"',"
						  + "'"+(veharrays[3].trim().equalsIgnoreCase("undefined")||veharrays[3]==null  || veharrays[3].trim().equalsIgnoreCase("") || veharrays[3].trim().equalsIgnoreCase("NaN")|| veharrays[3].isEmpty()?"":veharrays[3].trim())+"',"
						  + "'"+(veharrays[4].trim().equalsIgnoreCase("undefined")||veharrays[4]==null  || veharrays[4].trim().equalsIgnoreCase("") || veharrays[4].trim().equalsIgnoreCase("NaN")|| veharrays[4].isEmpty()?"":veharrays[4].trim())+"',"
						   + "'"+(veharrays[5].trim().equalsIgnoreCase("undefined")||veharrays[5]==null  || veharrays[5].trim().equalsIgnoreCase("") || veharrays[5].trim().equalsIgnoreCase("NaN")|| veharrays[5].isEmpty()?0:veharrays[5].trim())+"',"
						  + "'"+(veharrays[6].trim().equalsIgnoreCase("undefined")||veharrays[6]==null  || veharrays[6].trim().equalsIgnoreCase("") || veharrays[6].trim().equalsIgnoreCase("NaN")|| veharrays[6].isEmpty()?0:veharrays[6].trim())+"',"
						  + "'"+(veharrays[7].trim().equalsIgnoreCase("undefined")||veharrays[7]==null  || veharrays[7].trim().equalsIgnoreCase("") || veharrays[7].trim().equalsIgnoreCase("NaN")|| veharrays[7].isEmpty()?0:veharrays[7].trim())+"')";
						  System.out.println("==tclsql===+"+tclsql);
						  
						   resultSettcl = stmtclient.executeUpdate (tclsql);
						  j=j+1;
						  if(resultSettcl<=0)
						     {
							  conn.close();
						    	 return 0; 
						     }
			     }
			   
			   
	   }
 

	   
	   System.out.println("====documentNo==="+documentNo+"==docno===="+docno);
	   
	   if(documentNo>0&&docno>0)
	   {
		   
	   conn.commit();
	   conn.close();
	   return docno;
	   }
		}
		catch(Exception e){
			e.printStackTrace();
			
			
			return 0;
			
		}
		finally{
			 stmtclient.close();
				conn.close();
		}
	  
		return docno;
		
	}
	
	public int update(java.sql.Date sqlDate,String client_name, int Currency,int Cmbacgroupid,int Cmbsalesmanid,int catid,String Txtcstno,String Txttinno,
			Double Fcredit_period_min,Double Fcredit_period_max,Double Fcredit_limit,String Txtaddress,String Txtextnno,String Txtmobile,String Txttelephone,
			String Txtfax,String Txtweb,String Txtemail,String Txtcontact,int areaid,String Txtaccountno,String Txtbankname,
			String Txtbranchname,String Txtbranchaddress,String Txtswiftno,String Txtibanno,String Txtcity,int countryid,
			String txtcontact,ArrayList cparrayList,HttpSession session,String mode,String code,String hdocno,String formcode,
			String fin_name,String fin_adress,int salid,String txtserv_taxno, String txtpanno,ArrayList <String> veharray) throws SQLException
	{
		Connection conn=null;
		CallableStatement stmtclient=null;
		int  docno=0;
		try{
		
		conn=ClsConnection.getMyConnection();
		conn.setAutoCommit(false);
		
		
		System.out.println(catid);
		
		 stmtclient = conn.prepareCall("{CALL  TrclientDML(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?) }");
		
		 System.out.println("cccoooooddeeee"+code);
		
		
		
		stmtclient.setInt(32, Integer.parseInt(code));
		stmtclient.setInt(33, Integer.parseInt(hdocno));
	      // main
		stmtclient.setDate(1,sqlDate);
		stmtclient.setString(2,client_name.toUpperCase());
		stmtclient.setInt(3,Currency);
		stmtclient.setInt(4,Cmbacgroupid);
		stmtclient.setInt(5,Cmbsalesmanid);
		stmtclient.setInt(6,catid);
		stmtclient.setDouble(7,Fcredit_period_min);
		stmtclient.setDouble(8,Fcredit_period_max);
		stmtclient.setDouble(9,Fcredit_limit);
		stmtclient.setString(10,Txttinno);
		stmtclient.setString(11,Txtcstno);
		stmtclient.setString(12,Txtaddress);
		stmtclient.setString(13,Txttelephone);
		stmtclient.setString(14,Txtmobile);
		stmtclient.setString(15,Txtfax);
		stmtclient.setString(16,Txtemail);
		stmtclient.setString(17,Txtextnno);
		stmtclient.setString(18,Txtweb);
		stmtclient.setString(19,Txtcontact);
		stmtclient.setInt(20,areaid);
		stmtclient.setString(21,Txtaccountno);
		stmtclient.setString(22,Txtbankname);
		stmtclient.setString(23,Txtbranchname);
		stmtclient.setString(24,Txtbranchaddress);
		stmtclient.setString(25,Txtswiftno);
		stmtclient.setString(26,Txtibanno);
		stmtclient.setString(27,Txtcity);
		stmtclient.setInt(28,countryid);
		stmtclient.setInt(29,Integer.parseInt(session.getAttribute("COMPANYID").toString().trim()));
		stmtclient.setInt(30,Integer.parseInt(session.getAttribute("BRANCHID").toString().trim()));
		stmtclient.setInt(31,Integer.parseInt(session.getAttribute("USERID").toString().trim()));
		stmtclient.setString(34,mode);
		stmtclient.setString(35,fin_name);
		stmtclient.setString(36,fin_adress);
		stmtclient.setInt(37,salid);

		stmtclient.executeQuery();
	     docno=stmtclient.getInt("docNo");
	   int documentNo=stmtclient.getInt("documentNo");
	   
	   if(documentNo>0&&docno>0)
	   {
		   
		   
		   
		   Statement stmt1 =null;
			 
			 stmt1 = conn.createStatement ();
			 String q1=("update my_acbook set panno= '"+txtpanno+"' ,servtaxno='"+txtserv_taxno+"' where "
		   		+ " doc_no='"+docno+"' and dtype='CRM' ");
			
		   System.out.println("-------update query-----------"+q1);
		   stmt1.executeUpdate(q1) ;	
		   System.out.println("------------------Ececute update in updation");
/*		   
		   String SQLSS="DELETE from my_acvehicle where cldocno='"+docno+"'  ";
				
		   stmt1.executeUpdate(SQLSS) ;*/
		   
		   
		   for(int i=0;i< cparrayList.size() ;i++){
				  String[] cparray=((String) cparrayList.get(i)).split("::");
				  int resultSettcl=0;
				   String tclsql="";
				   int j=1;
				   
		
				   tclsql="INSERT INTO my_crmcontact(cldocno,dtype,sr_no,cperson,mob,tel,extn,email,area_id,actvty_id) values('"+docno+"','"+formcode+"',"+j+","
							  +"'"+(cparray[0].trim().equalsIgnoreCase("undefined")||cparray[0].trim()==null || cparray[0].trim().equalsIgnoreCase("") || cparray[0].trim().equalsIgnoreCase("NaN")|| cparray[0].isEmpty()?0:cparray[0].trim())+"',"
							  + "'"+(cparray[1].trim().equalsIgnoreCase("undefined")||cparray[1].trim()==null  || cparray[1].trim().equalsIgnoreCase("") || cparray[1].trim().equalsIgnoreCase("NaN")|| cparray[1].isEmpty()?"":cparray[1].trim())+"',"
							  +"'"+(cparray[2].equalsIgnoreCase("undefined")||cparray[2].trim()==null || cparray[2].trim().equalsIgnoreCase("") || cparray[2].trim().equalsIgnoreCase("NaN")|| cparray[2].isEmpty()?0:cparray[2].trim())+"',"
							  + "'"+(cparray[3].trim().equalsIgnoreCase("undefined")||cparray[3].trim()==null  || cparray[3].trim().equalsIgnoreCase("") || cparray[3].trim().equalsIgnoreCase("NaN")|| cparray[3].isEmpty()?"":cparray[3].trim())+"',"
							  + "'"+(cparray[4].trim().equalsIgnoreCase("undefined")||cparray[4].trim()==null  || cparray[4].trim().equalsIgnoreCase("") || cparray[4].trim().equalsIgnoreCase("NaN")|| cparray[4].isEmpty()?"":cparray[4].trim())+"',"
							  + "'"+(cparray[6].trim().equalsIgnoreCase("undefined")||cparray[6].trim()==null  || cparray[6].trim().equalsIgnoreCase("") || cparray[6].trim().equalsIgnoreCase("NaN")|| cparray[6].isEmpty()?0:cparray[6].trim())+"',"
							  + "'"+(cparray[7].trim().equalsIgnoreCase("undefined")||cparray[7].trim()==null  || cparray[7].trim().equalsIgnoreCase("") || cparray[7].trim().equalsIgnoreCase("NaN")|| cparray[7].isEmpty()?0:cparray[7].trim())+"')";
							  System.out.println("==tclsql===+"+tclsql);
							  
							   resultSettcl = stmtclient.executeUpdate (tclsql);
				 
							   
							   
							   
							  j=j+1;
							  if(resultSettcl<=0)
							     {
								  conn.close();
							    	 return 0; 
							    	 
							     }
				   
				   
		   }
		   
		   
		   
		   
		   
		   
		   
		   
		   
		   
		   int j=1;
		   
		   
		   for(int i=0;i< veharray.size() ;i++){
				  String[] veharrays=((String) veharray.get(i)).split("::");
				  int resultSettcl=0;
				   String tclsql="";
				
				     if(!(veharrays[1].trim().equalsIgnoreCase("undefined")|| veharrays[1].trim().equalsIgnoreCase("NaN")||veharrays[1].trim().equalsIgnoreCase("")|| veharrays[1].isEmpty()))
				     {
				    	 
						 
							String  forms=""+(veharrays[8].trim().equalsIgnoreCase("undefined")||veharrays[8].trim()==null  || veharrays[8].trim().equalsIgnoreCase("") || veharrays[8].trim().equalsIgnoreCase("NaN")|| veharrays[8].isEmpty()?0:veharrays[8].trim())+"";
							String  doc_no=""+(veharrays[9].trim().equalsIgnoreCase("undefined")||veharrays[9].trim()==null  || veharrays[9].trim().equalsIgnoreCase("") || veharrays[9].trim().equalsIgnoreCase("NaN")|| veharrays[9].isEmpty()?0:veharrays[9].trim())+"";
							   
							   
							
							if(forms.equalsIgnoreCase("UPD"))
							{
								
								//tclsql=" update  my_acvehicle set reg_no='"+(veharrays[1].trim().equalsIgnoreCase("undefined")||veharrays[8].trim()==null  || veharrays[8].trim().equalsIgnoreCase("") || veharrays[8].trim().equalsIgnoreCase("NaN")|| veharrays[8].isEmpty()?0:veharrays[8].trim())+"' ",
							
						//	 reg_no,brandid,modelid,submodelid,yom,bsizeid,esizeid,csizeid         
								
								
								   tclsql=" update  my_acvehicle set reg_no='"+(veharrays[0].equalsIgnoreCase("undefined")||veharrays[0]==null || veharrays[0].equalsIgnoreCase("") || veharrays[0].trim().equalsIgnoreCase("NaN")|| veharrays[0].isEmpty()?0:veharrays[0].trim())+"',"
											  + " brandid='"+(veharrays[1].trim().equalsIgnoreCase("undefined")||veharrays[1]==null  || veharrays[1].trim().equalsIgnoreCase("") || veharrays[1].trim().equalsIgnoreCase("NaN")|| veharrays[1].isEmpty()?"":veharrays[1].trim())+"',"
											  +" modelid='"+(veharrays[2].equalsIgnoreCase("undefined")||veharrays[2]==null || veharrays[2].equalsIgnoreCase("") || veharrays[2].trim().equalsIgnoreCase("NaN")|| veharrays[2].isEmpty()?0:veharrays[2].trim())+"',"
											  + " submodelid='"+(veharrays[3].trim().equalsIgnoreCase("undefined")||veharrays[3]==null  || veharrays[3].trim().equalsIgnoreCase("") || veharrays[3].trim().equalsIgnoreCase("NaN")|| veharrays[3].isEmpty()?"":veharrays[3].trim())+"',"
											  + " yom='"+(veharrays[4].trim().equalsIgnoreCase("undefined")||veharrays[4]==null  || veharrays[4].trim().equalsIgnoreCase("") || veharrays[4].trim().equalsIgnoreCase("NaN")|| veharrays[4].isEmpty()?"":veharrays[4].trim())+"',"
											   + " bsizeid='"+(veharrays[5].trim().equalsIgnoreCase("undefined")||veharrays[5]==null  || veharrays[5].trim().equalsIgnoreCase("") || veharrays[5].trim().equalsIgnoreCase("NaN")|| veharrays[5].isEmpty()?0:veharrays[5].trim())+"',"
											  + " esizeid='"+(veharrays[6].trim().equalsIgnoreCase("undefined")||veharrays[6]==null  || veharrays[6].trim().equalsIgnoreCase("") || veharrays[6].trim().equalsIgnoreCase("NaN")|| veharrays[6].isEmpty()?0:veharrays[6].trim())+"',"
											  + " csizeid='"+(veharrays[7].trim().equalsIgnoreCase("undefined")||veharrays[7]==null  || veharrays[7].trim().equalsIgnoreCase("") || veharrays[7].trim().equalsIgnoreCase("NaN")|| veharrays[7].isEmpty()?0:veharrays[7].trim())+"' where cldocno='"+docno+"' and doc_no='"+doc_no+"' ";
								  
								   
								   System.out.println("========tclsql================"+tclsql);
								   resultSettcl = stmtclient.executeUpdate(tclsql);
								
							}
							else
							{
								
				   tclsql="INSERT INTO my_acvehicle(cldocno,sr_no,reg_no,brandid,modelid,submodelid,yom,bsizeid,esizeid,csizeid) values('"+docno+"',"+j+","
							  +"'"+(veharrays[0].equalsIgnoreCase("undefined")||veharrays[0]==null || veharrays[0].equalsIgnoreCase("") || veharrays[0].trim().equalsIgnoreCase("NaN")|| veharrays[0].isEmpty()?0:veharrays[0].trim())+"',"
							  + "'"+(veharrays[1].trim().equalsIgnoreCase("undefined")||veharrays[1]==null  || veharrays[1].trim().equalsIgnoreCase("") || veharrays[1].trim().equalsIgnoreCase("NaN")|| veharrays[1].isEmpty()?"":veharrays[1].trim())+"',"
							  +"'"+(veharrays[2].equalsIgnoreCase("undefined")||veharrays[2]==null || veharrays[2].equalsIgnoreCase("") || veharrays[2].trim().equalsIgnoreCase("NaN")|| veharrays[2].isEmpty()?0:veharrays[2].trim())+"',"
							  + "'"+(veharrays[3].trim().equalsIgnoreCase("undefined")||veharrays[3]==null  || veharrays[3].trim().equalsIgnoreCase("") || veharrays[3].trim().equalsIgnoreCase("NaN")|| veharrays[3].isEmpty()?"":veharrays[3].trim())+"',"
							  + "'"+(veharrays[4].trim().equalsIgnoreCase("undefined")||veharrays[4]==null  || veharrays[4].trim().equalsIgnoreCase("") || veharrays[4].trim().equalsIgnoreCase("NaN")|| veharrays[4].isEmpty()?"":veharrays[4].trim())+"',"
							   + "'"+(veharrays[5].trim().equalsIgnoreCase("undefined")||veharrays[5]==null  || veharrays[5].trim().equalsIgnoreCase("") || veharrays[5].trim().equalsIgnoreCase("NaN")|| veharrays[5].isEmpty()?0:veharrays[5].trim())+"',"
							  + "'"+(veharrays[6].trim().equalsIgnoreCase("undefined")||veharrays[6]==null  || veharrays[6].trim().equalsIgnoreCase("") || veharrays[6].trim().equalsIgnoreCase("NaN")|| veharrays[6].isEmpty()?0:veharrays[6].trim())+"',"
							  + "'"+(veharrays[7].trim().equalsIgnoreCase("undefined")||veharrays[7]==null  || veharrays[7].trim().equalsIgnoreCase("") || veharrays[7].trim().equalsIgnoreCase("NaN")|| veharrays[7].isEmpty()?0:veharrays[7].trim())+"')";


				   System.out.println("========tclsql================"+tclsql);
							   resultSettcl = stmtclient.executeUpdate (tclsql);
							   
							   
							   
							}
							  j=j+1;
							  if(resultSettcl<=0)
							     {
								  conn.close();
							    	 return 0; 
							     }
				     }
				   
				   
		   }
	 
		   
		   
		   
		   
		   
	   }
	   
	   System.out.println("====documentNo==="+documentNo+"==docno===="+docno);
	   
	   if(documentNo>0&&docno>0)
	   {
	   
	   conn.commit();
	   conn.close();
	   return docno;
	   }
		}
		catch(Exception e){
		e.printStackTrace();	
		conn.close();
		return 0;
		}
		finally{
			 
			conn.close();
		}
		
		return docno;
	}

	
	public int delete(String docno,HttpSession session) throws SQLException{
		
		int result=0;
         Connection conn=null;
         CallableStatement stmt=null;
         int tranentry=0;
		try{
			
		
		conn=ClsConnection.getMyConnection();
		conn.setAutoCommit(false);
		
		
		String sql="update my_acbook set status=7 where doc_no='"+docno+"' and cldocno='"+docno+"' and dtype='CRM'";
		
		String sql1="select count(*) as count from my_jvtran where acno=(select acno from my_acbook where doc_no='"+docno+"' and cldocno='"+docno+"' and dtype='CRM')";
		
		String sql2="delete from my_head where cldocno='"+docno+"' and dtype='CRM'";
		
		//String sql3="delete from my_crmcontact where cldocno='"+docno+"' and dtype='CRM'";
		
		Statement cpstmt = conn.createStatement ();
		
		ResultSet resultSet = cpstmt.executeQuery (sql1);
		
		if(resultSet.next())
		{
			 tranentry=resultSet.getInt("count");
		}
		
		if(tranentry==0)
		{
			stmt = conn.prepareCall(sql);
			
			System.out.println("---sql-----"+sql);
			
			int resultSet2 = stmt.executeUpdate();
			
			CallableStatement mydelsmt =conn.prepareCall(sql2);
			
			int resultSet3 = mydelsmt.executeUpdate();
			
			
			if(resultSet2>0&&resultSet3>0)
				{
				result=Integer.parseInt(docno);
				
				}
		
		}
		conn.commit();
		 
		}
		catch(Exception e){
			e.printStackTrace();
		}
		finally{
			stmt.close();
			conn.close();
			
		}
		return result;
	}
	
	
	 public   JSONArray cpGridload(HttpSession session,int docno) throws SQLException {

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
	            	
					String  cpsql=("select cperson as cpersion,mob as mobile,email,tel as phone,area,area_id as areaid,extn,ay_name as activity,actvty_id as activity_id from my_crmcontact c left join my_area a on(c.area_id=a.doc_no) left join my_activity ac on(ac.doc_no=c.actvty_id) where c.cldocno="+docno+" and c.dtype='CRM'");
					System.out.println("------------------------------"+cpsql);
					
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
	 
	 
	 public   JSONArray mainSrearch(HttpSession session,String sclname,String smob,String rno,String Contact) throws SQLException {

	        JSONArray RESULTDATA=new JSONArray();
	    	    	
	        String brnchid=session.getAttribute("BRANCHID").toString();

	    	
	    	String sqltest="";
	    	
	    	if(!(sclname.equalsIgnoreCase(""))){
	    		sqltest=sqltest+" and ac.refname like '%"+sclname+"%'";
	    	}
	    	if(!(smob.equalsIgnoreCase(""))){
	    		sqltest=sqltest+" and ac.com_mob like '%"+smob+"%'";
	    	}
	    	if(!(rno.equalsIgnoreCase(""))){
	    		sqltest=sqltest+" and ac.cldocno like '%"+rno+"%'";
	    	}
	    	if(!(Contact.equalsIgnoreCase(""))){
	    		sqltest=sqltest+" and c.cperson like '%"+Contact+"%'";
	    	}
	    	
	    	
	    	Connection conn =null;
	    	Statement stmtVeh7=null;
	     
			try {
					 conn = ClsConnection.getMyConnection();
					 stmtVeh7 = conn.createStatement ();
					 
					 String str1Sql="select ac.cldocno,ac.refname,ac.com_mob,c.cperson as contact from my_acbook ac "
					 +" left join my_crmcontact c  on c.cldocno=ac.cldocno and c.dtype='CRM'  where ac.dtype='CRM' and ac.status<>7  and  brhid="+brnchid+" "+sqltest+" group by ac.cldocno ";
					 
					//String str1Sql=("select ac.cldocno,ac.refname,com_mob,cp.cperson as contact from my_acbook where dtype='CRM' and status<>7 and  brhid="+brnchid +" " +sqltest+" group by cldocno");
					//System.out.println("=========="+str1Sql);
					ResultSet resultSet = stmtVeh7.executeQuery (str1Sql);
					RESULTDATA=ClsCommon.convertToJSON(resultSet);
					
			}
			catch(Exception e){
				e.printStackTrace();
			}
			finally{
				stmtVeh7.close();
				conn.close();
			}
			//System.out.println(RESULTDATA);
	        return RESULTDATA;
	    }
	    

	 
	 
	 public  ClsClientBean getViewDetails(HttpSession session,String docNo) throws SQLException {
			String branch = session.getAttribute("BRANCHID").toString();
			ClsClientBean clsClientBean = new ClsClientBean();
			
			Connection conn =null;
			Statement stmtCPV0 =null;
			try {
			 conn = ClsConnection.getMyConnection();
			 stmtCPV0 = conn.createStatement ();
			
			 
			
			String strSql= ("select sa.sal_name,ac.sal_id,ac.cldocno,ac.date as clientdate,ac.catid,refname,address,contactperson contact,period,period2,ac.curid,credit,com_mob,per_tel tel,per_tel extn_tel,fax1,web1,mail1,cstno,tinno,acno,bank_name,account_no,branch_name,branch_address,ibanno,bnkswiftno,bnkcity,h.grpno,"
                           +" ac.area_id as areadocno,a.area as area,concat(city.city_name,',',c.country_name,',',r.reg_name) as area_det,bc.country_name as bnkcountry,h.doc_no as acc_no,fin_name,fin_address,ac.panno ,ac.servtaxno from my_acbook ac left join my_head h on(ac.cldocno=h.cldocno and h.dtype='CRM')" 
                           +" left join my_area a on(ac.area_id=a.doc_no) left join my_acity city on(a.city_id=city.doc_no) "
                           + " left join my_salm sa on(sa.doc_no=ac.sal_id) left join my_acountry c on(c.doc_no=city.country_id) left join my_aregion r on(r.doc_no=c.reg_id) left join my_acountry bc on(bc.doc_no=ac.bnkcountryid) where ac.cldocno='"+docNo+"' and ac.dtype='CRM'");
			
			System.out.println("===strSql====="+strSql);
			
			ResultSet resultSet = stmtCPV0.executeQuery(strSql);
	
	
			while (resultSet.next()) {
				
				
				clsClientBean.setTxtserv_taxno(resultSet.getString("ac.servtaxno"));
				clsClientBean.setTxtpanno(resultSet.getString("ac.panno"));
				clsClientBean.setSalid(resultSet.getInt("sal_id"));
				clsClientBean.setTxtsalesman(resultSet.getString("sal_name"));
				
				 
				clsClientBean.setTxtcode(resultSet.getString("ac.cldocno"));
				clsClientBean.setClientDate(resultSet.getString("clientdate"));
				clsClientBean.setHidClientDate(resultSet.getString("ac.cldocno"));
				clsClientBean.setTxtclient_name(resultSet.getString("refname"));
				clsClientBean.setCurrencyid(resultSet.getInt("ac.curid"));
				clsClientBean.setHidcmbcurrencyid(resultSet.getInt("ac.curid"));
				clsClientBean.setCmbacgroup(resultSet.getInt("h.grpno"));
				clsClientBean.setHidcmbacgroup(resultSet.getInt("h.grpno"));
				clsClientBean.setCmbcategory(resultSet.getInt("catid"));
				clsClientBean.setHidcmbcategory(resultSet.getInt("catid"));
				clsClientBean.setTxtcstno(resultSet.getString("cstno"));
				clsClientBean.setTxttinno(resultSet.getString("tinno"));
				clsClientBean.setTxtcredit_period_min(resultSet.getDouble("period"));
				clsClientBean.setTxtcredit_period_max(resultSet.getDouble("period2"));
				clsClientBean.setTxtcredit_limit(resultSet.getDouble("credit"));
				clsClientBean.setTxtaddress(resultSet.getString("address"));
				clsClientBean.setTxtextnno(resultSet.getString("extn_tel"));
				clsClientBean.setTxtmobile(resultSet.getString("com_mob"));
				clsClientBean.setTxtfax(resultSet.getString("fax1"));
				clsClientBean.setTxtweb(resultSet.getString("web1"));
				clsClientBean.setTxttelephone(resultSet.getString("tel"));
				clsClientBean.setTxtemail(resultSet.getString("mail1"));
				clsClientBean.setTxtcontact(resultSet.getString("contact"));
				clsClientBean.setTxtareaid(resultSet.getInt("areadocno"));
				clsClientBean.setTxtareadet(resultSet.getString("area_det"));
				clsClientBean.setTxtarea(resultSet.getString("area"));
				clsClientBean.setTxtaccountno(resultSet.getString("account_no"));
				clsClientBean.setTxtbankname(resultSet.getString("bank_name"));
				clsClientBean.setTxtbranchname(resultSet.getString("branch_name"));
				clsClientBean.setTxtbranchaddress(resultSet.getString("branch_address"));
				clsClientBean.setTxtswiftno(resultSet.getString("bnkswiftno"));
				clsClientBean.setTxtibanno(resultSet.getString("ibanno"));
				clsClientBean.setTxtcity(resultSet.getString("bnkcity"));
				clsClientBean.setTxtcountry(resultSet.getString("bnkcountry"));
				clsClientBean.setTxtaccount(resultSet.getString("acc_no"));
				clsClientBean.setDocno(resultSet.getString("ac.cldocno"));
				clsClientBean.setTxtfinname(resultSet.getString("fin_name"));
				clsClientBean.setTxtfinaddress(resultSet.getString("fin_address"));
			}
			
				
			
				
			
			}
			catch(Exception e){
			e.printStackTrace();
			}
			finally{
				stmtCPV0.close();
				conn.close();
			}
			
			return clsClientBean;
			}

	 public JSONArray prdsuitLoad(HttpSession session,String docno) throws SQLException {


			JSONArray RESULTDATA=new JSONArray();

			Connection conn = null;

			try {
				conn = ClsConnection.getMyConnection();
				Statement stmt = conn.createStatement();

	 
				if(docno.equalsIgnoreCase(""))
				{
					docno="0";
				}
				
			 
 		String sql=" select 'UPD' forms,s.doc_no, s.cldocno, s.reg_no regno, s.yom yomid,y.yom,b.brandname brand ,s.brandid,m.modelname model, s.modelid,sm.submodel, "
						+ " s.submodelid, s1.spec bsize,s.bsizeid,s2.spec esize, s.esizeid,s3.spec csize, s.csizeid,  s.sr_no "
						+ " from  my_acvehicle s left join my_sbrand b on(b.doc_no=s.brandid) left join my_smodel m on(m.doc_no=s.modelid) "
						+ " left join my_ssubmodel sm on(sm.doc_No=s.submodelid and sm.modelid=s.modelid) left join my_suitspec1 s1 on(s1.doc_no=s.bsizeid)  "
						+ " left join my_suitspec2 s2 on(s2.doc_no=s.esizeid) left join my_suitspec3 s3 on(s3.doc_no=s.csizeid)  "
						+ " left join my_syom y on(y.doc_no=s.yom) where s.cldocno="+docno+" ";
		 
			 	System.out.println("===prdsuitLoad====="+sql);
				ResultSet resultSet = stmt.executeQuery(sql);
				RESULTDATA=ClsCommon.convertToJSON(resultSet);


			}catch(Exception e){
				e.printStackTrace();

			}finally{
				conn.close();
			}
			return RESULTDATA;
		}
		


}
