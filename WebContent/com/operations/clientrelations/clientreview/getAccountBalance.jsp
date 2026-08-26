<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.*"%>
<%@page import="javax.sql.*"%>
<%@page import="com.connection.*" %>
<%	
	Connection conn = null;

	try{ ClsConnection ClsConnection=new ClsConnection();
		conn = ClsConnection.getMyConnection();
		Statement stmt = conn.createStatement();
		
		String accountno=request.getParameter("accountno");

		String strSql = "select sum(round(dramount,2)) balance from my_jvtran where acno="+accountno+"";
		ResultSet rs = stmt.executeQuery(strSql);
		
		String balance="";
		while(rs.next()) {
			balance=rs.getString("balance");
		} 
		
		response.getWriter().write(balance);
		
		stmt.close();
		conn.close();
	}catch(Exception e){
	 	e.printStackTrace();
	 	conn.close();
	}finally{
		conn.close();
	}
  %>
  