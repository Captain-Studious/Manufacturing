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
String list2=request.getParameter("bomarray")==null?"0":request.getParameter("bomarray");
String refno=request.getParameter("refno")==null?"0":request.getParameter("refno"); 
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
String PRvoc="0";
	 
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
ArrayList<String> pmgntarray2= new ArrayList<String>();
String aa2[]=list2.split(",");

	 
for(int i=0;i<aa2.length;i++){
	System.out.println("----------"+aa2[i]);
	 String bb2[]=aa2[i].split("::");
	  
	 String temp2="";
	 for(int j=0;j<bb2.length;j++){ 
		 
		 System.out.println("----------"+bb2[j]);
		 temp2=temp2+bb2[j]+"::";
		 
	}
	 pmgntarray2.add(temp2);
	 
} 
	  Connection conn=null;
	    String sql="",tempnw="",updatesqls1="";
	    int val=0,unit=0,cost=0;
	    double prqty=0;
	    try
	    {
	   	
	    conn = ClsConnection.getMyConnection();
		Statement stmt = conn.createStatement();
		
		val=DAO.insert(sqlprocessdate, "0", "MRP", session, "A", "PR", request, pmgntarray,unit,cost);
		 PRvoc=request.getAttribute("vocno").toString();
		System.out.println("==PRvoc=="+PRvoc);
		 if(val>0){
			 for(int k=0;k<pmgntarray2.size();k++){
				 String[] pmgntarr=((String) pmgntarray2.get(k)).split("::"); 
				 String psrno=""+(pmgntarr[0].trim().equalsIgnoreCase("undefined") || pmgntarr[0].trim().equalsIgnoreCase("NaN")|| pmgntarr[0].trim().equalsIgnoreCase("")|| pmgntarr[0].isEmpty()?0:pmgntarr[0].trim())+"";
				 String bompsrno=""+(pmgntarr[1].trim().equalsIgnoreCase("undefined") || pmgntarr[1].trim().equalsIgnoreCase("NaN")|| pmgntarr[1].trim().equalsIgnoreCase("")|| pmgntarr[1].isEmpty()?0:pmgntarr[1].trim())+"";
				 String rdocno=""+(pmgntarr[2].trim().equalsIgnoreCase("undefined") || pmgntarr[2].trim().equalsIgnoreCase("NaN")|| pmgntarr[2].trim().equalsIgnoreCase("")|| pmgntarr[2].isEmpty()?0:pmgntarr[2].trim())+"";
				 String reqqty=""+(pmgntarr[3].trim().equalsIgnoreCase("undefined") || pmgntarr[3].trim().equalsIgnoreCase("NaN")|| pmgntarr[3].trim().equalsIgnoreCase("")|| pmgntarr[3].isEmpty()?0:pmgntarr[3].trim())+"";
				 String rdtype=""+(pmgntarr[4].trim().equalsIgnoreCase("undefined") || pmgntarr[4].trim().equalsIgnoreCase("NaN")|| pmgntarr[4].trim().equalsIgnoreCase("")|| pmgntarr[4].isEmpty()?0:pmgntarr[4].trim())+"";
				 
		     String sqltstk="select (coalesce(prqty,0)+"+reqqty+")prqty from my_mrp  where dpsrno="+psrno+" and psrno="+bompsrno+" and rdocno="+rdocno+" and rdtype='"+rdtype+"'";
		     System.out.println("==mrpqtyslct=="+sqltstk);
		     ResultSet rs1=stmt.executeQuery(sqltstk);
				if(rs1.next()){
					prqty=	rs1.getDouble("prqty");
				}
			 String sqltst="update my_mrp set prqty="+prqty+",prdocno="+PRvoc+" where dpsrno="+psrno+" and psrno="+bompsrno+" and rdocno="+rdocno+" and rdtype='"+rdtype+"'";
			 System.out.println("==mrpqtyupdate=="+sqltst);
			 val=stmt.executeUpdate(sqltst);
			 }
			 
			 
			 tempnw="1";
		 }
    stmt.close();
		 
	conn.close();
	 response.getWriter().print(tempnw+" :: "+PRvoc);
    	
    }
    catch(Exception e)
    {
    	e.printStackTrace();
    	
    	
    	conn.close();
    	 response.getWriter().print(tempnw+" :: "+PRvoc);
    }
	 	
	 	
	 	
%>



 