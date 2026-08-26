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
String list=request.getParameter("bomarray")==null?"0":request.getParameter("bomarray");
String list2=request.getParameter("ppdetail")==null?"0":request.getParameter("ppdetail");
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
ArrayList<String> chkarray= new ArrayList<String>();
String aa2[]=list2.split(",");

	 
for(int i=0;i<aa2.length;i++){
	System.out.println("----------"+aa2[i]);
	 String bb2[]=aa2[i].split("::");
	  
	 String temp2="";
	 for(int j=0;j<bb2.length;j++){ 
		 
		 System.out.println("----------"+bb2[j]);
		 temp2=temp2+bb2[j]+"::";
		 
	}
	 chkarray.add(temp2);
	 
} 
	  Connection conn=null;
	    String sql="",tempnw="",updatesqls1="";
	    int val=0;
	    try
	    {
	   	
	    conn = ClsConnection.getMyConnection();
		Statement stmt = conn.createStatement();
		
		
		/* String tst1="select coalesce(max(doc_no),0)+1 as docno from my_workorder";
		ResultSet rs1=stmt.executeQuery(tst1);
		if(rs1.next()){
			BOvoc=	rs1.getString("docno");
		}
		
		System.out.println("==BOvoc=="+BOvoc); */
	
			 for(int k=0;k<pmgntarray.size();k++){
				 String[] pmgntarr=((String) pmgntarray.get(k)).split("::"); 
				 String psrno=""+(pmgntarr[0].trim().equalsIgnoreCase("undefined") || pmgntarr[0].trim().equalsIgnoreCase("NaN")|| pmgntarr[0].trim().equalsIgnoreCase("")|| pmgntarr[0].isEmpty()?0:pmgntarr[0].trim())+"";
				 String qty=""+(pmgntarr[1].trim().equalsIgnoreCase("undefined") || pmgntarr[1].trim().equalsIgnoreCase("NaN")|| pmgntarr[1].trim().equalsIgnoreCase("")|| pmgntarr[1].isEmpty()?0:pmgntarr[1].trim())+"";
				 String mtypeid=""+(pmgntarr[2].trim().equalsIgnoreCase("undefined") || pmgntarr[2].trim().equalsIgnoreCase("NaN")|| pmgntarr[2].trim().equalsIgnoreCase("")|| pmgntarr[2].isEmpty()?0:pmgntarr[2].trim())+"";
				 String mtype=""+(pmgntarr[3].trim().equalsIgnoreCase("undefined") || pmgntarr[3].trim().equalsIgnoreCase("NaN")|| pmgntarr[3].trim().equalsIgnoreCase("")|| pmgntarr[3].isEmpty()?0:pmgntarr[3].trim())+"";
				 String uomid=""+(pmgntarr[4].trim().equalsIgnoreCase("undefined") || pmgntarr[4].trim().equalsIgnoreCase("NaN")|| pmgntarr[4].trim().equalsIgnoreCase("")|| pmgntarr[4].isEmpty()?0:pmgntarr[4].trim())+"";
				 String mainpsrno=""+(pmgntarr[5].trim().equalsIgnoreCase("undefined") || pmgntarr[5].trim().equalsIgnoreCase("NaN")|| pmgntarr[5].trim().equalsIgnoreCase("")|| pmgntarr[5].isEmpty()?0:pmgntarr[5].trim())+"";
				 String mrpdoc=""+(pmgntarr[6].trim().equalsIgnoreCase("undefined") || pmgntarr[6].trim().equalsIgnoreCase("NaN")|| pmgntarr[6].trim().equalsIgnoreCase("")|| pmgntarr[6].isEmpty()?0:pmgntarr[6].trim())+"";
				 for(int g=0;g<chkarray.size();g++){
					 String[] pmgntarr2=((String) chkarray.get(g)).split("::"); 
					String rdoc= ""+(pmgntarr2[0].trim().equalsIgnoreCase("undefined") || pmgntarr2[0].trim().equalsIgnoreCase("NaN")|| pmgntarr2[0].trim().equalsIgnoreCase("")|| pmgntarr2[0].isEmpty()?0:pmgntarr2[0].trim())+"";
					String dtype= ""+(pmgntarr2[1].trim().equalsIgnoreCase("undefined") || pmgntarr2[1].trim().equalsIgnoreCase("NaN")|| pmgntarr2[1].trim().equalsIgnoreCase("")|| pmgntarr2[1].isEmpty()?0:pmgntarr2[1].trim())+"";
					String calcqty= ""+(pmgntarr2[2].trim().equalsIgnoreCase("undefined") || pmgntarr2[2].trim().equalsIgnoreCase("NaN")|| pmgntarr2[2].trim().equalsIgnoreCase("")|| pmgntarr2[2].isEmpty()?0:pmgntarr2[2].trim())+"";
					String mnpsrno= ""+(pmgntarr2[3].trim().equalsIgnoreCase("undefined") || pmgntarr2[3].trim().equalsIgnoreCase("NaN")|| pmgntarr2[3].trim().equalsIgnoreCase("")|| pmgntarr2[3].isEmpty()?0:pmgntarr2[3].trim())+"";
					String tst2="insert into my_mrp (rdocno, rdtype, psrno, dpsrno, qty, uom, materialtype, prqty, woqty, prdocno, wodocno, colorcode, calcqty, mtypeid, volume, mainpsrno) values ("+rdoc+",'"+dtype+"',0,"+psrno+",'"+qty+"',"+uomid+",'"+mtype+"',0,0,0,0,101,1,"+mtypeid+",0,"+mnpsrno+")";
					 val=stmt.executeUpdate(tst2);
				 }
				 	 
			
			
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
	 	
	 	
	 	
%>



 