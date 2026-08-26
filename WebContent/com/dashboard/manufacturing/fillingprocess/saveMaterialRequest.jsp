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
<%@ page import="com.sales.InventoryTransfer.materialrequest.ClsMaterialrequestDAO" %>
<%
ClsConnection ClsConnection=new ClsConnection();
ClsCommon ClsCommon=new ClsCommon();
ClsMaterialrequestDAO DAO = new ClsMaterialrequestDAO();
String list=request.getParameter("productarray")==null?"0":request.getParameter("productarray");
String workno=request.getParameter("workno")==null?"0":request.getParameter("workno"); 
String mpsrno=request.getParameter("psrno")==null?"0":request.getParameter("psrno"); 
String desc=request.getParameter("desc")==null?"0":request.getParameter("desc");  
java.sql.Date sqlprocessdate=null;
Calendar cal = Calendar.getInstance();
SimpleDateFormat format1 = new SimpleDateFormat("dd.MM.yyyy");
String formatted = format1.format(cal.getTime());
System.out.println("==availdatezxd==="+formatted);
 if(!(formatted.equalsIgnoreCase("undefined"))&&!(formatted.equalsIgnoreCase(""))&&!(formatted.equalsIgnoreCase("0")))
{
sqlprocessdate=ClsCommon.changeStringtoSqlDate(formatted);
	
}
else{

} 
ArrayList<String> pmgntarray= new ArrayList<String>();
String aa[]=list.split(",");
String BOvoc="0";
	 
for(int i=0;i<aa.length;i++){
	System.out.println("----------"+aa[i]);
	 String bb[]=aa[i].split("::");
	  
	 String temp="";
	 for(int j=0;j<bb.length;j++){ 
		 
		 System.out.println("----------"+bb[j]);
		 temp=temp+bb[j]+"::";
		 
	}
	 pmgntarray.add(temp);
	 
} 
 
	  Connection conn=null;
	    String sql="",tempnw="",updatesqls1="";
	    int val=0;
	    try
	    {
	   	
	    conn = ClsConnection.getMyConnection();
		Statement stmt = conn.createStatement();
		
		
		
		
		
		
		 val=DAO.insert(sqlprocessdate, workno, "workorder", 0, session, "A", "MR", request, pmgntarray, 1, 0, 0, 1, 0, 0);
		 BOvoc=	request.getAttribute("vocno").toString();
		 String doc=	request.getAttribute("docno").toString();
		 System.out.println("==Materialrequestvoc=="+BOvoc);
		 if(val>0){ 
		 String sqltst="update my_workorder set materialrequestno="+doc+",workprocess=5 where doc_no="+workno+" and psrno="+mpsrno+"";
			 val=stmt.executeUpdate(sqltst);
			 
			String upsql="insert into my_workorderlog (brhId, logdate, userid, workorderno,description) values ('"+session.getAttribute("BRANCHID").toString()+"',now(),'"+session.getAttribute("USERID").toString()+"',"+workno+",'created material request')";
			int aaa= stmt.executeUpdate(upsql);
		 }	 
			 if(val>0){ 
			 tempnw="1";
			 }
    stmt.close();
		 
	conn.close();
	 response.getWriter().print(tempnw+" :: "+BOvoc);
    	
    }
    catch(Exception e)
    {
    	e.printStackTrace();
    	
    	
    	conn.close();
    	 response.getWriter().print(tempnw+" :: "+BOvoc);
    }
	 finally{
		 conn.close();
	 }
	 	
	 	
%>



 