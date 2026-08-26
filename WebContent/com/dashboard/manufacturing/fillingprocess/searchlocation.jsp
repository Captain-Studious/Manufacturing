<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.*"%>
<%@page import="javax.sql.*"%>
<%@page import="com.connection.*" %>


<%	
ClsConnection ClsConnection=new ClsConnection();
String brhid=request.getParameter("branch")==null?"0":request.getParameter("branch"); 
	Connection conn = null;
	try{
		conn = ClsConnection.getMyConnection();
		Statement stmt = conn.createStatement ();
		if(brhid.equalsIgnoreCase("")){
			brhid=session.getAttribute("BRANCHID").toString();
		}
		String strSql = ("select loc_name,doc_no,brhid from my_locm where status=3 and brhid="+brhid+"" );   
				
		  System.out.println("-----locationsearch------"+strSql);
		
		ResultSet rs = stmt.executeQuery(strSql);
		
		String brnch="",brnchId="";
		while(rs.next()) {
					brnch+=rs.getString("loc_name")+",";
					brnchId+=rs.getString("doc_no")+",";
				} 
		
		String brn[]=brnch.split(",");
		String brnId[]=brnchId.split(",");
		
		brnch=brnch.substring(0, brnch.length()-1);
		brnchId=brnchId.substring(0, brnchId.length()-1);
		
		response.getWriter().write(brnchId+"####"+brnch);
		//session.setAttribute("BRANCHID", brnId[0]);
		
		
		//System.out.println("====zcccas======="+session.getAttribute("BRANCHID").toString());
		
		stmt.close();
		conn.close();
	}catch(Exception e){
	 	e.printStackTrace();
	 	conn.close();
	}finally{
		conn.close();
	}
  %>
  