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
<%@ page import="com.sales.Sales.deliverynote.ClsDeliveryNoteDAO" %>
<%
ClsConnection ClsConnection=new ClsConnection();
ClsCommon ClsCommon=new ClsCommon();
ClsDeliveryNoteDAO DAO = new ClsDeliveryNoteDAO();
String list=request.getParameter("productarray")==null?"0":request.getParameter("productarray");
String salesid=request.getParameter("salespersonid")==null?"0":request.getParameter("salespersonid"); 
String clientid=request.getParameter("clientid")==null?"0":request.getParameter("clientid"); 
String locid=request.getParameter("locid")==null?"0":request.getParameter("locid"); 
String desc=request.getParameter("desc")==null?"0":request.getParameter("desc");  
String deldate=request.getParameter("deldate")==null?"0":request.getParameter("deldate");  
String orderdoc=request.getParameter("orderdoc")==null?"0":request.getParameter("orderdoc"); 
String ordertype=request.getParameter("ordertype")==null?"0":request.getParameter("ordertype");  
String currency=request.getParameter("currency")==null?"0":request.getParameter("currency"); 
String rate=request.getParameter("rate")==null?"0":request.getParameter("rate");  
java.sql.Date sqlprocessdate=null;
Calendar cal = Calendar.getInstance();
SimpleDateFormat format1 = new SimpleDateFormat("dd.MM.yyyy");
String formatted = format1.format(cal.getTime());
System.out.println("==list==="+list);
int sid=0,cid=0;
if(!(salesid.equalsIgnoreCase("undefined"))&&!(salesid.equalsIgnoreCase(""))&&!(salesid.equalsIgnoreCase("0")))
{
	sid=Integer.parseInt(salesid);
}
if(!(clientid.equalsIgnoreCase("undefined"))&&!(clientid.equalsIgnoreCase(""))&&!(clientid.equalsIgnoreCase("0")))
{
cid=Integer.parseInt(clientid);
}
System.out.println("-----salespersonid-----"+sid+"-----clientid----"+cid);
 if(!(deldate.equalsIgnoreCase("undefined"))&&!(deldate.equalsIgnoreCase(""))&&!(deldate.equalsIgnoreCase("0")))
{
sqlprocessdate=ClsCommon.changeStringtoSqlDate(deldate);
	
}
else{

} 
ArrayList<String> prodarray= new ArrayList<String>();

ArrayList<String> termsarray= new ArrayList<String>();
ArrayList<String> servarray= new ArrayList<String>();
ArrayList<String> shiparray= new ArrayList<String>();
String aa[]=list.split(",");
int BOvoc=0;
	 
for(int i=0;i<aa.length;i++){
	System.out.println("----------"+aa[i]);
	 String bb[]=aa[i].split("::");
	  
	 String temp="";
	 for(int j=0;j<bb.length;j++){ 
		 
		 System.out.println("----------"+bb[j]);
		 temp=temp+bb[j]+"::";
		 
	}
	 prodarray.add(temp);
	 
} 
 
	  Connection conn=null;
	    String sql="",tempnw="",updatesqls1="",sqlk="";
	    int val=0;
	    try
	    {
	   	
	    conn = ClsConnection.getMyConnection();
		Statement stmt = conn.createStatement();
		System.out.println("insert====="+sqlprocessdate+","+"0,0,"+currency+","+ rate+","+sid+","+cid+","+orderdoc+","+ ordertype+",0,"+ desc+","+ "0,0,0,0,0,0,A,DEL,"+prodarray+","+ termsarray+","+ servarray+","+ session+","+ request+","+ orderdoc+",0,"+ locid+","+ shiparray+",0,0");
		BOvoc=DAO.insert(sqlprocessdate, "0", "0", currency, rate, sid, cid, orderdoc, ordertype, "0", desc, "0", "0", "0", "0", "0", "0", "A", "DEL", prodarray, termsarray, servarray, session, request, orderdoc, "0", locid, shiparray, 0, "0");
	 if(BOvoc>0){
		 if(ordertype.equalsIgnoreCase("SOR")){
       	  sqlk="update my_sorderd set delno="+BOvoc+" where rdocno in("+orderdoc+")";
       	 System.out.println("---update my_sorderd-------"+sqlk);
       	  val=stmt.executeUpdate(sqlk);
       }
       if(ordertype.equalsIgnoreCase("STKO")){
       	 sqlk="update my_stockorderd set delno="+BOvoc+" where rdocno in("+orderdoc+")";
       	 System.out.println("---update my_stockorderd-------"+sqlk);
       	 val=stmt.executeUpdate(sqlk);
       } 
	} 
			 if(BOvoc>0){ 
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



 