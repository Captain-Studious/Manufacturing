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
String refno=request.getParameter("refno")==null?"0":request.getParameter("refno"); 
String desc=request.getParameter("desc")==null?"0":request.getParameter("desc");  
String sorchk=request.getParameter("sorchk")==null?"0":request.getParameter("sorchk"); 
java.sql.Date sqlprocessdate=null;
Calendar cal = Calendar.getInstance();
SimpleDateFormat format1 = new SimpleDateFormat("dd.MM.yyyy");
String formatted = format1.format(cal.getTime());
System.out.println("==sorchk==="+sorchk);
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
	    String sql="",tempnw="0",updatesqls1="";
	    //String rdocno="0";
	    int val=0;
	    try
	    {
	   	
	    conn = ClsConnection.getMyConnection();
		Statement stmt = conn.createStatement();
		 double prqty=0;
		
		
		
			 for(int k=0;k<pmgntarray.size();k++){
				 String[] pmgntarr=((String) pmgntarray.get(k)).split("::"); 
				 String psrno=""+(pmgntarr[0].trim().equalsIgnoreCase("undefined") || pmgntarr[0].trim().equalsIgnoreCase("NaN")|| pmgntarr[0].trim().equalsIgnoreCase("")|| pmgntarr[0].isEmpty()?0:pmgntarr[0].trim())+"";
				 String specid=""+(pmgntarr[1].trim().equalsIgnoreCase("undefined") || pmgntarr[1].trim().equalsIgnoreCase("NaN")|| pmgntarr[1].trim().equalsIgnoreCase("")|| pmgntarr[1].isEmpty()?0:pmgntarr[1].trim())+"";
				 String reqqty=""+(pmgntarr[2].trim().equalsIgnoreCase("undefined") || pmgntarr[2].trim().equalsIgnoreCase("NaN")|| pmgntarr[2].trim().equalsIgnoreCase("")|| pmgntarr[2].isEmpty()?0:pmgntarr[2].trim())+"";
				 String rsvqtychk=""+(pmgntarr[3].trim().equalsIgnoreCase("undefined") || pmgntarr[3].trim().equalsIgnoreCase("NaN")|| pmgntarr[3].trim().equalsIgnoreCase("")|| pmgntarr[3].isEmpty()?0:pmgntarr[3].trim())+"";
				 
				 String rsvstockid=""+(pmgntarr[4].trim().equalsIgnoreCase("undefined") || pmgntarr[4].trim().equalsIgnoreCase("NaN")|| pmgntarr[4].trim().equalsIgnoreCase("")|| pmgntarr[4].isEmpty()?0:pmgntarr[4].trim())+"";
				 String brhid=""+(pmgntarr[5].trim().equalsIgnoreCase("undefined") || pmgntarr[5].trim().equalsIgnoreCase("NaN")|| pmgntarr[5].trim().equalsIgnoreCase("")|| pmgntarr[5].isEmpty()?0:pmgntarr[5].trim())+"";
				 String locid=""+(pmgntarr[6].trim().equalsIgnoreCase("undefined") || pmgntarr[6].trim().equalsIgnoreCase("NaN")|| pmgntarr[6].trim().equalsIgnoreCase("")|| pmgntarr[6].isEmpty()?0:pmgntarr[6].trim())+"";
				//String sorddoc=""+(pmgntarr[7].trim().equalsIgnoreCase("undefined") || pmgntarr[7].trim().equalsIgnoreCase("NaN")|| pmgntarr[7].trim().equalsIgnoreCase("")|| pmgntarr[7].isEmpty()?0:pmgntarr[7].trim())+"";
			if(Double.parseDouble(rsvqtychk)>0){
				if(Double.parseDouble(rsvqtychk)<Double.parseDouble(reqqty)){
					 String sqltstk="select if(sum(i.op_qty-(i.out_qty+i.del_qty+i.rsv_qty))>0,1,0) qty from my_prddin i  where stockid="+rsvstockid+" and brhid="+brhid+" and locid='"+locid+"'";
				     System.out.println("==rsvstockid=="+sqltstk);
				     ResultSet rs2=stmt.executeQuery(sqltstk);
						while(rs2.next()){
							prqty=	rs2.getDouble("qty");
							if(prqty==0){
								tempnw="2";
								break;
								
							}
							if(prqty==1){
								tempnw="1";
								
								
							}
						}
				}
			}
			else{
				 String sqltstk="select if(sum(i.op_qty-(i.out_qty+i.del_qty+i.rsv_qty))>0,1,0) qty from my_prddin i  where psrno="+psrno+" and specno="+specid+" and brhid="+brhid+" and locid='"+locid+"'";
			     System.out.println("==prddinstockchk=="+sqltstk);
			     ResultSet rs2=stmt.executeQuery(sqltstk);
					while(rs2.next()){
						prqty=	rs2.getDouble("qty");
						if(prqty==0){
							tempnw="2";
							break;
							
						}
						if(prqty==1){
							tempnw="1";
							
							
						}
					}
				
			}
			
			 
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



 