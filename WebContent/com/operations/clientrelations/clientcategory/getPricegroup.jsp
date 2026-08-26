<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.*"%>
<%@page import="javax.sql.*"%>
<%@page import="com.connection.*" %>

<%	

	Connection conn = null;
	
	try{ ClsConnection ClsConnection =new ClsConnection();
	 	conn = ClsConnection.getMyConnection();
		Statement stmt = conn.createStatement();
 
		
		String strSql = "select name,doc_no from my_pricegroup where status=3";
		ResultSet rs = stmt.executeQuery(strSql);
		
		String group="";
		String groupid="";
		while(rs.next()) {
			group+=rs.getString("name")+",";		
			groupid+=rs.getString("doc_no")+",";
	  		} 
		
		group=group.substring(0, group.length()>0?group.length()-1:0);
		
		response.getWriter().write(group+"####"+groupid);
		
		stmt.close();
		conn.close();
	}catch(Exception e){
	 	e.printStackTrace();
	 	conn.close();
	}finally{
		conn.close();
	}
  %>
  
