<%@page import="java.sql.*"%>
<%@page import="javax.sql.*"%>
<%@page import="com.connection.*" %>

<%	
Connection conn = null;
ClsConnection ClsConnection=new ClsConnection();
int errorstatus=0;

try{
	conn=ClsConnection.getMyConnection();
	Statement stmt = conn.createStatement(); 
	double creditlimit=0;
	int acno=0,period=0,val=0,method=0;
	String sqlconfg="select method from gl_prdconfig where field_nme = 'clcreditcheck'";
	ResultSet resultSetconf=stmt.executeQuery(sqlconfg);
	while(resultSetconf.next()){
		method=resultSetconf.getInt("method");
	}
	if(method==1)
	{
		String cldocno = request.getParameter("cldocno");
		String sql1=" select coalesce(credit,0) credit ,acno,period2 from my_acbook where dtype='CRM' and cldocno="+cldocno;
		System.out.println("==sql1=="+sql1);
		
		ResultSet resultSet1=stmt.executeQuery(sql1);
		while(resultSet1.next()){
			creditlimit=resultSet1.getDouble("credit");
			acno=resultSet1.getInt("acno");
			period=resultSet1.getInt("period2");
		}
		
		String sql2="select coalesce(sum(dramount),0) dramount from my_jvtran where acno="+acno;
		System.out.println("==jvsql=="+sql2);
		ResultSet resultSet2=stmt.executeQuery(sql2);
		double dramount=0;
		while(resultSet2.next()){
			dramount=resultSet2.getDouble("dramount");
		}
		if(dramount>creditlimit){
			val=1;
		}
	    if(val==0)
	    {
			String sqlss="select date1,cdate from(  SELECT DATE_ADD(min(date) , INTERVAL "+period+" DAY) date1,curdate() cdate  "
				+" FROM MY_JVTRAN WHERE DRAMOUNT-OUT_AMOUNT!=0 and acno="+acno+") a where a.date1<a.cdate " ;
			ResultSet resultSet21=stmt.executeQuery(sqlss);
			if(resultSet21.next())
			{
				val=2;
			}
	     
	     }
	}
	if(val==1)
	{
		response.getWriter().write("CREDIT LIMIT "+creditlimit+" EXCEEDING");	
	}
	else if(val==2)
	{
		response.getWriter().write("CREDIT PERIOD "+period+" DAYS EXCEEDING");	
	}
	else
	{
		response.getWriter().write("1");
	}
		
	
	
	
	
}
catch(Exception e){
	e.printStackTrace();
	response.getWriter().write(errorstatus);
	conn.close();
}
finally{
	conn.close();
}

%>
