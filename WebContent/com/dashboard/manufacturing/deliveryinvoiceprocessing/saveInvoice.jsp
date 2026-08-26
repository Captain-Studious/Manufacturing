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
<%@ page import="com.sales.Sales.salesInvoice.ClsSalesInvoiceDAO" %>
<%
ClsConnection ClsConnection=new ClsConnection();
ClsCommon ClsCommon=new ClsCommon();
ClsSalesInvoiceDAO DAO = new ClsSalesInvoiceDAO();
String list=request.getParameter("productarray")==null?"0":request.getParameter("productarray");
String pterms=request.getParameter("pterms")==null?"0":request.getParameter("pterms"); 
int cid=request.getParameter("clientid")==null?0:Integer.parseInt(request.getParameter("clientid")); 
int  lid=request.getParameter("locid")==null?0:Integer.parseInt(request.getParameter("locid")); 
String desc=request.getParameter("desc")==null?"0":request.getParameter("desc");  
String invdate=request.getParameter("invdate")==null?"0":request.getParameter("invdate"); 
String totalsum=request.getParameter("totalsum")==null?"0":request.getParameter("totalsum");
String netotalsum=request.getParameter("netotalsum")==null?"0":request.getParameter("netotalsum");
String clacno=request.getParameter("clacno")==null?"0":request.getParameter("clacno");
double taxamtsum=request.getParameter("taxamtsum")==null?0.0:Double.parseDouble(request.getParameter("taxamtsum"));
int delno=request.getParameter("delno")==null?0:Integer.parseInt(request.getParameter("delno"));
String delnochk=request.getParameter("delno")==null?"0":request.getParameter("delno");
String orderdoc=request.getParameter("orderdoc")==null?"0":request.getParameter("orderdoc"); 
String ordertype=request.getParameter("ordertype")==null?"0":request.getParameter("ordertype"); 
String currency=request.getParameter("currency")==null?"0":request.getParameter("currency"); 
String rate=request.getParameter("rate")==null?"0":request.getParameter("rate");  
System.out.println("clientid=="+cid+"==locid=="+lid+"==totalsum=="+totalsum+"==netotalsum=="+netotalsum+"==clacno=="+clacno+"==taxamtsum=="+taxamtsum);
java.sql.Date sqlprocessdate=null;
java.sql.Date sqlprocessdate2=null;
Calendar cal = Calendar.getInstance();
SimpleDateFormat format1 = new SimpleDateFormat("dd.MM.yyyy");
String formatted = format1.format(cal.getTime());
System.out.println("==ordertype==="+ordertype);
int sid=0;
 /* if(!(locid.equalsIgnoreCase("undefined"))&&!(locid.equalsIgnoreCase(""))&&!(locid.equalsIgnoreCase("0"))&&!(locid==null))
{
	 lid=Integer.parseInt(locid);
}  */
/* if(!(clientid.equalsIgnoreCase("undefined"))&&!(clientid.equalsIgnoreCase(""))&&!(clientid.equalsIgnoreCase("0")))
{
cid=Integer.parseInt(clientid);
} */
System.out.println("-----salespersonid-----"+sid+"-----clientid----"+cid);
 if(!(invdate.equalsIgnoreCase("undefined"))&&!(invdate.equalsIgnoreCase(""))&&!(invdate.equalsIgnoreCase("0")))
{
sqlprocessdate=ClsCommon.changeStringtoSqlDate(invdate);
	
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
	    String sql="",tempnw="",updatesqls1="",sqlk="",orderchk="",ordernochk="";
	    int val=0;
	    try
	    {
	   	
	    conn = ClsConnection.getMyConnection();
		Statement stmt = conn.createStatement();
		orderchk=ordertype;
		ordernochk=orderdoc;
		if(delno>0){
			orderdoc=delnochk;
			ordertype="DEL";
		}
		
		/* BOvoc=DAO.insert(sqlprocessdate, "0", "0", "1", "1", sid, cid, "0", "DIR", "0", desc, "0", "0", "0", "0", "0", "0", "A", "DEL", prodarray, termsarray, servarray, session, request, "0", "0", locid, shiparray, 0, "0"); */

		BOvoc=DAO.insert(sqlprocessdate, "0", "0", currency, rate, sid, cid, orderdoc, ordertype, pterms, desc, totalsum, "0", netotalsum, "0", "0", netotalsum, "A", "INV", prodarray, termsarray, servarray, session, request, orderdoc, "0", sqlprocessdate2, lid, "credit", "0", shiparray, 0, taxamtsum, taxamtsum, 0.0, 0.0, taxamtsum, 1, "0", "0", "exclusive", clacno);
		if(BOvoc>0){ 
		if(orderchk.equalsIgnoreCase("SOR")){
	       	  sqlk="update my_sorderd set invno="+BOvoc+" where rdocno in("+ordernochk+")";
	       	 System.out.println("---update my_sorderd-------"+sqlk);
	       	  val=stmt.executeUpdate(sqlk);
	       }
	       if(orderchk.equalsIgnoreCase("STKO")){
	       	 sqlk="update my_stockorderd set invno="+BOvoc+" where rdocno in("+ordernochk+")";
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



 