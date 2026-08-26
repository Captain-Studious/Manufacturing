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
ClsConnection ClsConnection=new ClsConnection();
String saldocno=request.getParameter("saldocno")==null?"0":request.getParameter("saldocno");
String userdocno=request.getParameter("userdocno")==null?"0":request.getParameter("userdocno");
String cat=request.getParameter("cat")==null?"0":request.getParameter("cat");
String usgper=request.getParameter("usgper")==null?"0":request.getParameter("usgper");
 
  
	  Connection conn=null;
	    String sql="";
	    try
	    {
	   	
	    conn = ClsConnection.getMyConnection();
		Statement stmt = conn.createStatement();

String sqls="update my_salm set userid='"+userdocno+"' ,catid='"+cat+"' ,usgper='"+usgper+"' where doc_no='"+saldocno+"' ";
		      
stmt.executeUpdate(sqls);
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



 