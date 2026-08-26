<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.*"%>
<%@page import="javax.sql.*"%>
<%@page import="com.connection.*" %>


<%	
 	Connection conn = null;
try{	ClsConnection ClsConnection=new ClsConnection();
	conn=ClsConnection.getMyConnection();
Statement stmt = conn.createStatement ();
	String strSql = "select spec_name,doc_no,spec_code from my_specval where ref_master='suitability'";
	ResultSet rs = stmt.executeQuery(strSql);
	String spec1="";
	String specode1="";
	String spec2="";
	String specode2="";
	String spec3="";
	String specode3="";
	
	int i=0;
	while(rs.next()) {
		if(i==0){
			spec1=rs.getString("spec_name");
			specode1=rs.getString("spec_code");
		}
		if(i==1)
		{
			spec2=rs.getString("spec_name");
			specode2=rs.getString("spec_code");
		}
		if(i==2)
		{
			spec3=rs.getString("spec_name");
			specode3=rs.getString("spec_code");
		}
		
		i++;
			} 
	
	response.getWriter().write(spec1+"###"+spec2+"###"+spec3+"###"+specode1+"###"+specode2+"###"+specode3);
	System.out.println("inside"+spec1+"###"+spec2+"###"+spec3+"###"+specode1+"###"+specode2+"###"+specode3);
}
catch(Exception e){
	e.printStackTrace();
	
}
finally{
	conn.close();
}
%>
  
