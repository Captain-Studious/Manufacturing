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
String fromdate=request.getParameter("fromdate1")==null?"0":request.getParameter("fromdate1");
String todate=request.getParameter("todate1")==null?"0":request.getParameter("todate1");
 
 java.sql.Date sqlfromdate = null;
	if(!(fromdate.equalsIgnoreCase("undefined"))&&!(fromdate.equalsIgnoreCase(""))&&!(fromdate.equalsIgnoreCase("0")))
	{
		sqlfromdate=ClsCommon.changeStringtoSqlDate(fromdate);
		
	}
	else{

	}

 java.sql.Date sqltodate = null;
	if(!(todate.equalsIgnoreCase("undefined"))&&!(todate.equalsIgnoreCase(""))&&!(todate.equalsIgnoreCase("0")))
	{
		sqltodate=ClsCommon.changeStringtoSqlDate(todate);
		
	}
	else{ 

	}
String pdocno=request.getParameter("psrno");
 
String[] psrnoarray = pdocno.split("::");

 
	  Connection conn=null;
	    String sql="";
	    try
	    {
	   	
	    conn = ClsConnection.getMyConnection();
		Statement stmt = conn.createStatement();
		
		for (int i = 0; i < psrnoarray.length; i++) {
			String psrid=psrnoarray[i];	
			
			if(!(psrid.equalsIgnoreCase(""))){
				
				 
		
		
		String updatesqls1=" update my_main set ofrcatid="+cat+",ofrfrmdate='"+sqlfromdate+"',ofrtodate='"+sqltodate+"' where psrno="+psrid+" ";
		
		System.out.println("updatesqls1="+updatesqls1);
		
				stmt.executeUpdate(updatesqls1);
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



 