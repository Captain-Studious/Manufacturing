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
<%@ page import="com.procurement.purchase.purchaserequest.ClsPurchaserequestDAO" %>
<%
ClsConnection ClsConnection=new ClsConnection();
ClsCommon ClsCommon=new ClsCommon();
ClsPurchaserequestDAO DAO = new ClsPurchaserequestDAO();
String list=request.getParameter("productarray")==null?"0":request.getParameter("productarray");
String workno=request.getParameter("workno")==null?"0":request.getParameter("workno"); 
String mpsrno=request.getParameter("psrno")==null?"0":request.getParameter("psrno"); 
String desc=request.getParameter("desc")==null?"0":request.getParameter("desc");  
String ordertype=request.getParameter("ordertype")==null?"0":request.getParameter("ordertype");
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
		
		
		String tst1="select coalesce(max(doc_no),0)+1 as docno from my_quality";
		ResultSet rs1=stmt.executeQuery(tst1);
		if(rs1.next()){
			BOvoc=	rs1.getString("docno");
		}
		
		System.out.println("==BlendsheetOvoc=="+BOvoc);
		
			 for(int k=0;k<pmgntarray.size();k++){
				 String[] pmgntarr=((String) pmgntarray.get(k)).split("::"); 
				 String name=""+(pmgntarr[0].trim().equalsIgnoreCase("undefined") || pmgntarr[0].trim().equalsIgnoreCase("NaN")|| pmgntarr[0].trim().equalsIgnoreCase("")|| pmgntarr[0].isEmpty()?0:pmgntarr[0].trim())+"";
				 String descp=""+(pmgntarr[1].trim().equalsIgnoreCase("undefined") || pmgntarr[1].trim().equalsIgnoreCase("NaN")|| pmgntarr[1].trim().equalsIgnoreCase("")|| pmgntarr[1].isEmpty()?0:pmgntarr[1].trim())+"";
				 String tstmthd=""+(pmgntarr[2].trim().equalsIgnoreCase("undefined") || pmgntarr[2].trim().equalsIgnoreCase("NaN")|| pmgntarr[2].trim().equalsIgnoreCase("")|| pmgntarr[2].isEmpty()?0:pmgntarr[2].trim())+"";
				 String limit=""+(pmgntarr[3].trim().equalsIgnoreCase("undefined") || pmgntarr[3].trim().equalsIgnoreCase("NaN")|| pmgntarr[3].trim().equalsIgnoreCase("")|| pmgntarr[3].isEmpty()?0:pmgntarr[3].trim())+"";
				 String work=""+(pmgntarr[4].trim().equalsIgnoreCase("undefined") || pmgntarr[4].trim().equalsIgnoreCase("NaN")|| pmgntarr[4].trim().equalsIgnoreCase("")|| pmgntarr[4].isEmpty()?0:pmgntarr[4].trim())+"";
			 String tst2="insert into my_quality (doc_no,name,description,testmethod,`limit`,workorderno,reftype) values ("+BOvoc+",'"+name+"','"+descp+"','"+tstmthd+"','"+limit+"',"+work+",'FILL')";	 
			 val=stmt.executeUpdate(tst2);
			
			 }
			 String sqltst="update my_prdupdate set qualityno="+BOvoc+" where orderno="+workno+" and opsrno="+mpsrno+" and type='"+ordertype+"'";
			 val=stmt.executeUpdate(sqltst);
			 
			String upsql="insert into my_workorderlog (type,brhId, logdate, userid, workorderno,description) values ('FILL','"+session.getAttribute("BRANCHID").toString()+"',now(),'"+session.getAttribute("USERID").toString()+"',"+workno+",'created quality assuarance')";
			int aaa= stmt.executeUpdate(upsql);
			 
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



 