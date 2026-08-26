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
		
		
		String tst1="select coalesce(max(doc_no),0)+1 as docno from my_blendsheet";
		ResultSet rs1=stmt.executeQuery(tst1);
		if(rs1.next()){
			BOvoc=	rs1.getString("docno");
		}
		
		System.out.println("==BlendsheetOvoc=="+pmgntarray.size());
		
			 for(int k=0;k<pmgntarray.size();k++){
				 String[] pmgntarr=((String) pmgntarray.get(k)).split("::"); 
				 String psrno=""+(pmgntarr[0].trim().equalsIgnoreCase("undefined") || pmgntarr[0].trim().equalsIgnoreCase("NaN")|| pmgntarr[0].trim().equalsIgnoreCase("")|| pmgntarr[0].isEmpty()?0:pmgntarr[0].trim())+"";
				 String udoc=""+(pmgntarr[1].trim().equalsIgnoreCase("undefined") || pmgntarr[1].trim().equalsIgnoreCase("NaN")|| pmgntarr[1].trim().equalsIgnoreCase("")|| pmgntarr[1].isEmpty()?0:pmgntarr[1].trim())+"";
				 String reqqty=""+(pmgntarr[2].trim().equalsIgnoreCase("undefined") || pmgntarr[2].trim().equalsIgnoreCase("NaN")|| pmgntarr[2].trim().equalsIgnoreCase("")|| pmgntarr[2].isEmpty()?0:pmgntarr[2].trim())+"";
				 String work=""+(pmgntarr[3].trim().equalsIgnoreCase("undefined") || pmgntarr[3].trim().equalsIgnoreCase("NaN")|| pmgntarr[3].trim().equalsIgnoreCase("")|| pmgntarr[3].isEmpty()?0:pmgntarr[3].trim())+"";
				 String qtykg=""+(pmgntarr[4].trim().equalsIgnoreCase("undefined") || pmgntarr[4].trim().equalsIgnoreCase("NaN")|| pmgntarr[4].trim().equalsIgnoreCase("")|| pmgntarr[4].isEmpty()?0:pmgntarr[4].trim())+"";
				 String stdper=""+(pmgntarr[5].trim().equalsIgnoreCase("undefined") || pmgntarr[5].trim().equalsIgnoreCase("NaN")|| pmgntarr[5].trim().equalsIgnoreCase("")|| pmgntarr[5].isEmpty()?0:pmgntarr[5].trim())+"";
			 String tst2="insert into my_blendsheet (doc_no, psrno, uom, qty,workorderno,qtykg,stdper) values ("+BOvoc+","+psrno+","+udoc+","+reqqty+","+work+","+qtykg+","+stdper+")";	 
			 val=stmt.executeUpdate(tst2);
			
			 }
			 String sqltst="update my_workorder set blendsheetno="+BOvoc+",workprocess=4 where doc_no="+workno+" and psrno="+mpsrno+"";
			 val=stmt.executeUpdate(sqltst);
			 
			String upsql="insert into my_workorderlog (type,brhId, logdate, userid, workorderno,description) values ('PRDPL','"+session.getAttribute("BRANCHID").toString()+"',now(),'"+session.getAttribute("USERID").toString()+"',"+workno+",'created blending sheet')";
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



 