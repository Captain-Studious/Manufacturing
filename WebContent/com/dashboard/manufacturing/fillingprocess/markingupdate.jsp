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
String psrno=request.getParameter("psrno")==null?"0":request.getParameter("psrno"); 
String mark=request.getParameter("mark")==null?"0":request.getParameter("mark"); 
String type=request.getParameter("type")==null?"0":request.getParameter("type");
String markdate=request.getParameter("markdate")==null?"0":request.getParameter("markdate");
String workno=request.getParameter("workno")==null?"0":request.getParameter("workno");
String otype=request.getParameter("otype")==null?"0":request.getParameter("otype");
java.sql.Date sqlprocessdate=null;

/*  if(!(markdate.equalsIgnoreCase("undefined"))&&!(markdate.equalsIgnoreCase(""))&&!(markdate.equalsIgnoreCase("0")))
{
sqlprocessdate=ClsCommon.changeStringtoSqlDate(markdate);
	
}
else{

}  */
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
		System.out.println("=====otype======="+otype);
		if(otype.equalsIgnoreCase("SOR")){
	 
			if(mark.equalsIgnoreCase("start")){
				updatesqls1=" update my_sorderd set fillstartmark='"+markdate+"'  where rdocno="+workno+" and psrno="+psrno+" ";
			}
			if(mark.equalsIgnoreCase("end")){
				updatesqls1=" update my_sorderd set fillendmark='"+markdate+"'  where rdocno="+workno+" and psrno="+psrno+" ";
			}
		}
		if(otype.equalsIgnoreCase("STKO")){
			 
			if(mark.equalsIgnoreCase("start")){
				updatesqls1=" update my_stockorderd set fillstartmark='"+markdate+"'  where rdocno="+workno+" and psrno="+psrno+" ";
			}
			if(mark.equalsIgnoreCase("end")){
				updatesqls1=" update my_stockorderd set fillendmark='"+markdate+"'  where rdocno="+workno+" and psrno="+psrno+" ";
			}
		}
System.out.println("=====startendmarkingsql======="+updatesqls1);
			
			val=stmt.executeUpdate(updatesqls1);
		
			
			 
			
			
			String upsql="insert into my_workorderlog (type,brhId, logdate, userid, workorderno,description) values ('FILL','"+session.getAttribute("BRANCHID").toString()+"',now(),'"+session.getAttribute("USERID").toString()+"',"+workno+",'filling start or end marking')";
			 
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



 