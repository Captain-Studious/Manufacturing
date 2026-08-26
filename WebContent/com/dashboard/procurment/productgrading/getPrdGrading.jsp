<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.*"%>
<%@page import="javax.sql.*"%>
<%@page import="com.connection.*" %>


<%	
ClsConnection ClsConnection=new ClsConnection();

 	Connection conn = null;
	try{
		conn = ClsConnection.getMyConnection();
		Statement stmt = conn.createStatement();
		
		String strSql = "select docno,description from my_prdgrading where status=3;";
		ResultSet rs = stmt.executeQuery(strSql);
		
		String description="";
		String docno="";
		while(rs.next()) {
			description+=rs.getString("description")+",";		
			docno+=rs.getString("docno")+",";
	  		} 
		
		description=description.substring(0, description.length()>0?description.length()-1:0);
		
		response.getWriter().write(description+"####"+docno);
		
		stmt.close();
		conn.close();
	}catch(Exception e){
	 	e.printStackTrace();
	 	conn.close();
	}
  %>
  
