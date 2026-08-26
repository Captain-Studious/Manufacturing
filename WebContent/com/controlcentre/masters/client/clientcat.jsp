 <%@page import="java.util.ArrayList"%>
<%@page import="java.sql.*"%>
<%@page import="javax.sql.*"%>
<%@page import="com.connection.*" %>


<%	

	Connection conn = null;
ClsConnection ClsConnection= new ClsConnection();
	try{
	 	conn = ClsConnection.getMyConnection();
		Statement stmt = conn.createStatement();
		
		String strSql = "select method from gl_prdconfig where field_nme='clientcat'";
		ResultSet rs = stmt.executeQuery(strSql);
		
		int method=0;
		
		if(rs.next()) {
			method=rs.getInt("method");
	  		} 
		
		
		
		response.getWriter().print(method);
		
		stmt.close();
		conn.close();
	}catch(Exception e){
	 	e.printStackTrace();
	 	conn.close();
	}finally{
		conn.close();
	}
  %>
  
 