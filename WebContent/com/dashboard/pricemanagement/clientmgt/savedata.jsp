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

<%
ClsCommon ClsCommon=new ClsCommon();
ClsConnection ClsConnection=new ClsConnection();
String cat=request.getParameter("cat")==null?"0":request.getParameter("cat");
 
String dtype = request.getParameter("dtype")==null?"0":request.getParameter("dtype").trim();
 
String cldocno=request.getParameter("cldocno");
 
String reason=request.getParameter("reason");

String[] cldocnoarray = cldocno.split("::");

 
	  Connection conn=null;
	   
	    try
	    {
	   	
	    conn = ClsConnection.getMyConnection();
		Statement stmt = conn.createStatement();
		Statement stmt1 =conn.createStatement();
		Statement stmt2 =conn.createStatement();
		for (int i = 0; i < cldocnoarray.length; i++) {
			String cldocnos=cldocnoarray[i];	
			
			if(!(cldocnos.equalsIgnoreCase(""))){
				
			 int accgroup=0;
			 int headdocno=0;
			 int oldcatid=0;
			 
		/* 	String sqls="select  cat_name,doc_no,pricegroup,acc_group from my_clcatm where doc_no='"+cat+"' ";
			System.out.println("sqls="+sqls);
			ResultSet rss=stmt1.executeQuery(sqls); */
		/* 		 if(rss.next())
				 {
					 accgroup=rss.getInt("acc_group"); 
				 } */
					String sqlss="select acno,catid,acc_group from my_acbook   where cldocno="+cldocnos+" and dtype='CRM' ";
					System.out.println("sqlss="+sqlss);
					
					ResultSet rsss=stmt2.executeQuery(sqlss);
						 if(rsss.next())
						 {
							 headdocno=rsss.getInt("acno"); 
							 oldcatid=rsss.getInt("catid"); 
							 
							 accgroup=rsss.getInt("acc_group"); 
						 }
						 
						 
						 
		
		String updatesqls1=" update my_acbook set catid="+cat+",acc_group="+accgroup+" where cldocno="+cldocnos+" and dtype='CRM' ";
		
		System.out.println("updatesqls1="+updatesqls1);
		
				stmt.executeUpdate(updatesqls1);
				
				String alevel="."+accgroup+"."+headdocno;
			 
				
				
				String updatesqls2=" update my_head set alevel='"+alevel+"',grpno="+accgroup+" where doc_no="+headdocno+"  ";
				
				 System.out.println("updatesqls2="+updatesqls2);
				
						stmt.executeUpdate(updatesqls2);	
						
						
			String insql="insert into my_bclmgt( sr_no, cldocno, oldcatid, newcatid, dtype, date, userid,reason) values("+(i+1)+","+cldocnos+","+oldcatid+","+cat+",'"+dtype+"',now(),'"+session.getAttribute("USERID").toString()+"','"+reason+"') ";
			System.out.println("insql="+insql);
			stmt.executeUpdate(insql);	
			
				
			}
		}
		 
		      
		 
 stmt.close();
		 
	conn.close();
	 response.getWriter().print(1);
    	
    }
    catch(Exception e)
    {
    	e.printStackTrace();
    	
    	
    	conn.close();
    	 response.getWriter().print(2);
    }
	 	
	 	
	 	
%>



 