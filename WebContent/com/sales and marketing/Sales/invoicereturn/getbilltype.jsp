<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.*"%>
<%@page import="javax.sql.*"%>
<%@page import="com.connection.*" %>
<%@page import="javax.servlet.http.HttpServletRequest"%>
<%@page import="javax.servlet.http.HttpSession"%>

<%		Connection conn = null;try
{
	

	/* String dtype=session.getAttribute("Code").toString();
  String clientid=request.getParameter("clientid").trim().toString();
  //  System.out.println("clientid="+clientid);
	String brch=session.getAttribute("BRANCHID").toString(); */
	String strSql ="";
	ClsConnection ClsConnection=new ClsConnection();
 	  conn = ClsConnection.getMyConnection();
	Statement stmt = conn.createStatement ();
	
		strSql="select name,billval from my_billtype where status=3 order by seqno";
	
	
	System.out.println("===bill===="+strSql);
	
	ResultSet rs = stmt.executeQuery(strSql);
	String bill="";
	String billid="";
	
	while(rs.next()) {
		bill+=rs.getString("name")+",";
		billid+=rs.getString("billval")+",";
	
  		} 
	//curid=curid.substring(0, curid.length()-1);
	//curcode=curcode.substring(0, curcode.length()-1);
	//currate=currate.substring(0, currate.length()-1);
	//System.out.println(curid+"####"+curcode+"####"+currate+"####"+multi);
	response.getWriter().write(bill+"####"+billid);
	
	
	stmt.close();
	conn.close();
}
catch(Exception e)
{
	conn.close();
}
	%>
  
