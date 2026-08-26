<%@page import="com.connection.*"%>   
<%@page import="java.sql.*"%>
<%
String enqno=request.getParameter("enqno")==null || request.getParameter("enqno")==""?"0":request.getParameter("enqno");
ClsConnection objconn=new ClsConnection();   
Connection conn=null;  
String msg="";
try{
	conn=objconn.getMyConnection();
	Statement stmt=conn.createStatement();
	String strgetmsg="select sum(a.val)val from(select count(*) val  from  my_sorderm where promdate<curdate() union all select count(*) val  from  my_stockorderm where promdate<curdate())a";
	System.out.println("getpromisealert==="+strgetmsg);
	ResultSet rs=stmt.executeQuery(strgetmsg);    
	int i=0;
	while(rs.next()){
		msg=rs.getString("val");
	}
			
}
catch(Exception e){
	e.printStackTrace();
}
finally{
	conn.close();
}
response.getWriter().write(msg);
%>