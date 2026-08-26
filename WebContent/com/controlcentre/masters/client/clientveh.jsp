 


<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.*"%>
<%@page import="javax.sql.*"%>
<%@page import="com.connection.*" %>


<%	
 	ClsConnection ClsConnection=new ClsConnection();

Connection conn = null;
try
{
  conn = ClsConnection.getMyConnection();

Statement stmt=conn.createStatement();

String chk="select method  from gl_prdconfig where field_nme='clientveh' ";

//System.out.println("===chk==="+chk);

ResultSet rs=stmt.executeQuery(chk); 
int method=0;
 
while(rs.next())
{
 
	method=rs.getInt("method");
  
}

    
	response.getWriter().print(method);
	stmt.close();
	conn.close();
}
catch(Exception e)
{
	conn.close();
}
finally
{
	conn.close();
}
  %>
  













					