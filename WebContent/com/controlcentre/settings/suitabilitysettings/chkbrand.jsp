<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.*"%>
<%@page import="javax.sql.*"%>
<%@page import="com.connection.*" %>


<%	


String doc_no = request.getParameter("docno")==null?"NA":request.getParameter("docno").trim();

	
String yomfrm = request.getParameter("yomfrm")==null?"NA":request.getParameter("yomfrm").trim();

	
String yomto = request.getParameter("yomto")==null?"NA":request.getParameter("yomto").trim();
System.out.println("==doc_no=="+doc_no)	   ;   
System.out.println("==yomfrm=="+yomfrm)	   ;    
System.out.println("==yomto=="+yomto)	   ;     

Connection conn=null;
try{
	ClsConnection ClsConnection=new  ClsConnection();
 	conn = ClsConnection.getMyConnection();
	Statement stmt = conn.createStatement ();
	String sql="";
	if(yomto.equalsIgnoreCase("OPEN"))
	{
		
	}
	else
	{
		sql= " and t.yom<="+yomto+" and t.yom!='OPEN' "	;
	}
	Statement stmt1 = conn.createStatement ();
	
	 int val=0;
	
	String sqls="select * from   my_smodel where brandid='"+doc_no+"'   and  status=3 and frmyomid>0  ";
	
	ResultSet rs1 = stmt1.executeQuery(sqls);
 
 int val1=0;
	while(rs1.next()) {
		
		val1=1;
		 
		
	}
	if(val1==1)
	{
	
	String strSql = "select frmyomid,toyomid,f.yom fyom,t.yom  from( "
			+" select min(frmyomid) frmyomid ,max(toyomid)  toyomid from my_smodel where brandid='"+doc_no+"' and frmyomid>0 and  status=3 )a "
			+"  left join my_syom f on f.doc_no=a.frmyomid "
			+"  left join my_syom t on t.doc_no=a.toyomid where f.yom >="+yomfrm+" "+sql+" ";
			        
			        
		System.out.println("==strSql=="+strSql)	   ;     
	ResultSet rs = stmt.executeQuery(strSql);
	 

	while(rs.next()) {
	 val=1;
				
  		} 
 
	stmt.close();
	}
	else
	{
		 val=1;
	}
	
	
	conn.close();

	response.getWriter().print(val);
	
}
catch(Exception e){
	e.printStackTrace();
	conn.close();
}
finally{
	conn.close();
}
	/* response.getWriter().write(auth.toArray()); */

  %>