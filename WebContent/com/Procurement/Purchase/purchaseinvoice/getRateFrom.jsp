<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.*"%>
<%@page import="javax.sql.*"%>
<%@page import="com.connection.*" %>


<%	Connection conn = null;
try
{
	String curr=request.getParameter("curr");
ClsConnection ClsConnection=new ClsConnection();
 	  conn = ClsConnection.getMyConnection();
	Statement stmt = conn.createStatement ();
	String strSql = "select round(rate,2)rate from my_curbook where curid='"+curr+"'";
	ResultSet rs = stmt.executeQuery(strSql);
	Double rate=0.0;
	while(rs.next()) {
		rate=rs.getDouble("rate");
  		} 
	response.getWriter().write(rate.toString());
	stmt.close();
	conn.close();
}
catch(Exception e)
{
	conn.close();
}
  %>
  
