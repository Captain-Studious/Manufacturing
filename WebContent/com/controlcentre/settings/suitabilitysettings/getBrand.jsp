<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.*"%>
<%@page import="javax.sql.*"%>
<%@page import="com.connection.*" %>


<%	
String yomfrm = request.getParameter("yomfrm")==null  ?"NA":request.getParameter("yomfrm").trim();

String yomto = request.getParameter("yomto")==null  ?"NA":request.getParameter("yomto").trim();

System.out.println("==yomfrm====="+yomfrm);

System.out.println("==yomto====="+yomto);
  
String sql="";

 	Connection conn = null;
try{	 ClsConnection ClsConnection=new ClsConnection();
	conn=ClsConnection.getMyConnection();
Statement stmt = conn.createStatement ();


 	 
			 String strSql = "  select b.brand,b.doc_no,f.yom,t.yom from my_sbrand b	left join my_syom f on f.doc_no= b.frmyomid "
					 +"		left join my_syom t on t.doc_no= b.toyomid where   b.status=3 and b.frmyomid>0  and f.yom<='"+yomfrm+"' and  "
					 +"	   t.yom>='"+yomto+"'  ";
	System.out.println("==strSql====="+strSql);
	
	ResultSet rs = stmt.executeQuery(strSql);
	//System.out.println(strSql);
	String brand="";
	String brandid="";
	while(rs.next()) {
		brand+=rs.getString("brand")+",";		
		brandid+=rs.getString("doc_no")+",";
  		} 
	if(brand.length()>0){
		brand=brand.substring(0, brand.length()-1);	
	}
	stmt.close();
	conn.close();
	response.getWriter().write(brand+"***"+brandid);
	
}
catch(Exception e){
	e.printStackTrace();
	conn.close();
}
finally{
	conn.close();
}
%>
  
