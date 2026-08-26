<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.*"%>
<%@page import="javax.sql.*"%>
<%@page import="com.connection.*" %>


<%	
 	Connection conn = null;
try{	 ClsConnection ClsConnection=new ClsConnection();
	conn=ClsConnection.getMyConnection();
Statement stmt = conn.createStatement ();
	String strSql = "select  method from gl_config where field_nme in('suit','spec')";
	ResultSet rs = stmt.executeQuery(strSql);
	int spec=0;
	int suit=0;
	int i=0;
	while(rs.next()) {
		if(i==0)
			suit=rs.getInt("method");
		if(i==1)
			spec=rs.getInt("method");
		i++;
			} 
	
	response.getWriter().write(spec+"###"+suit);
	
}
catch(Exception e){
	e.printStackTrace();
	
}
finally{
	conn.close();
}
%>
  
