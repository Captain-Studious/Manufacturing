  <%@page import="java.util.ArrayList"%>
<%@page import="java.sql.*"%>
<%@page import="javax.sql.*"%>
<%@page import="com.connection.*" %>
<%@page import="net.sf.json.JSONArray"%>
<%@page import="net.sf.json.JSONObject"%>
<%@page import="java.util.*"%>
<%@page import="javax.servlet.http.HttpServletRequest" %>
<%@page import="javax.servlet.http.HttpSession" %>
<%@page import="com.common.*"%>
<%@ page import="java.sql.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>

<%
ClsConnection ClsConnection=new ClsConnection();
ClsCommon ClsCommon=new ClsCommon();
String list=request.getParameter("orderarray")==null?"0":request.getParameter("orderarray");
String bno=request.getParameter("bno")==null?"0":request.getParameter("bno"); 
String bdate=request.getParameter("bdate")==null?"0":request.getParameter("bdate"); 
String bqty=request.getParameter("bqty")==null?"0":request.getParameter("bqty");
String btime=request.getParameter("btime")==null?"0":request.getParameter("btime");
String workno=request.getParameter("workno")==null?"0":request.getParameter("workno");
String psrno=request.getParameter("psrno")==null?"0":request.getParameter("psrno"); 
java.sql.Date sqlprocessdate=null;

  if(!(bdate.equalsIgnoreCase("undefined"))&&!(bdate.equalsIgnoreCase(""))&&!(bdate.equalsIgnoreCase("0")))
{
sqlprocessdate=ClsCommon.changeStringtoSqlDate(bdate);
	
}
else{

}  
/* ArrayList<String> pmgntarray= new ArrayList<String>();
String aa[]=list.split(",");
 
	 
 for(int i=0;i<aa.length;i++){
	//System.out.println("----------"+aa[i]);
	 String bb[]=aa[i].split("::");
	  
	 String temp="";
	 for(int j=0;j<bb.length;j++){ 
		 
		// System.out.println("----------"+bb[j]);
		 temp=temp+bb[j]+"::";
		 
	}
	 pmgntarray.add(temp);
	 
}   */
 
	  Connection conn=null;
	    String sql="",tempnw="",updatesqls1="";
	    int val=0;
	    try
	    {
	   	
	    conn = ClsConnection.getMyConnection();
		Statement stmt = conn.createStatement();
		
			updatesqls1=" update my_workorder set batchno='"+bno+"',batchdate='"+sqlprocessdate+"',batchtime='"+btime+"',qty="+bqty+", workprocess=3  where doc_no="+workno+" and psrno="+psrno+"";
					
System.out.println("=====batchupdatesql======="+updatesqls1);
			
			val=stmt.executeUpdate(updatesqls1);
		
			String upsql="insert into my_workorderlog (type,brhId, logdate, userid, workorderno,description) values ('PRDPL','"+session.getAttribute("BRANCHID").toString()+"',now(),'"+session.getAttribute("USERID").toString()+"',"+workno+",'batch details update')";
			 
			 int aaa= stmt.executeUpdate(upsql);
			 
			
			
			
		 
		
		 if(val>0){
			 tempnw="1";
		 }
    stmt.close();
		 
	conn.close();
	 response.getWriter().print(tempnw);
    	
    }
    catch(Exception e)
    {
    	e.printStackTrace();
    	
    	
    	conn.close();
    	 response.getWriter().print(tempnw);
    }
	 finally{
		 conn.close();
	 }
	 	
	 	
%>



 