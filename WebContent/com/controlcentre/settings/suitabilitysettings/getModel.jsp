<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.*"%>
<%@page import="javax.sql.*"%>
<%@page import="com.connection.*" %>


<%	

String yomfrm = request.getParameter("yomfrm")==null  ?"NA":request.getParameter("yomfrm").trim();

String yomto = request.getParameter("yomto")==null  ?"NA":request.getParameter("yomto").trim();

System.out.println("==yomfrm====="+yomfrm);

System.out.println("==yomto====="+yomto);
ClsConnection ClsConnection=new ClsConnection();
Connection conn = ClsConnection.getMyConnection();
String temp=request.getParameter("id");
System.out.println("==temp===="+temp);
 	try{
	Statement stmt = conn.createStatement ();
/* 	String strSql = "select DOC_NO, MODEL  from my_smodel where status <> 7 and brandid='"+temp+"' ";
	 */
	
	 String strSql = "  select b.MODEL,b.doc_no,f.yom,t.yom from my_smodel b	left join my_syom f on f.doc_no= b.frmyomid "
			 +"		left join my_syom t on t.doc_no= b.toyomid where   b.status=3 and brandid='"+temp+"' and b.frmyomid>0  and f.yom<='"+yomfrm+"' and  "
			 +"	   t.yom>='"+yomto+"'  ";
	
	System.out.println("==strSql===="+strSql);
	ResultSet rs = stmt.executeQuery(strSql);
	String model="";
	String modelid="";
	while(rs.next()) {
		model+=rs.getString("MODEL")+",";		
		modelid+=rs.getString("doc_no")+",";
  		} 
	//model=model.substring(0, model.length()-1);
	model=model.substring(0, model.length()>0?model.length()-1:0);
	response.getWriter().write(model+"####"+modelid);
	
 	}
 	catch(Exception e){
 		e.printStackTrace();
 		
 	}
 	finally{
 		conn.close();
 	}
  %>
  
