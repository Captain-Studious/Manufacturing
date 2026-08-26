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

String list=request.getParameter("productarray")==null?"0":request.getParameter("productarray");
String workno=request.getParameter("workno")==null?"0":request.getParameter("workno"); 
String mpsrno=request.getParameter("psrno")==null?"0":request.getParameter("psrno"); 
String sorqty=request.getParameter("sorqty")==null?"0":request.getParameter("sorqty"); 
String ordertype=request.getParameter("ordertype")==null?"0":request.getParameter("ordertype");
String fill=request.getParameter("fill")==null?"0":request.getParameter("fill");
String locid=request.getParameter("location")==null?"0":request.getParameter("location");
String brhid=request.getParameter("brhid")==null?"0":request.getParameter("brhid");
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
	    double fillqty=0,chkqty=0,availbal=0,chkfillqty=0;
	    try
	    {
	   	
	    conn = ClsConnection.getMyConnection();
		Statement stmt = conn.createStatement();
		if(!sorqty.equalsIgnoreCase("")){
			chkqty=Double.parseDouble(sorqty);
		}
		if(!fill.equalsIgnoreCase("")){
			chkfillqty=Double.parseDouble(fill);
		}
		/*  String tstchk="select sum(fillqty) as fill from my_prdupdate where orderno="+workno+" and type='"+ordertype+"' and opsrno="+mpsrno+" group by orderno,psrno";
		ResultSet rschk=stmt.executeQuery(tstchk);
		if(rschk.next()){
			fillqty=rschk.getDouble("fill");
			 availbal=chkqty-fillqty;
			 if(chkfillqty>availbal){
				 tempnw="2";
				
			} 
		} */
		
		if(tempnw.equalsIgnoreCase("")){
		String tst1="select coalesce(max(doc_no),0)+1 as docno from my_prdupdate";
		ResultSet rs1=stmt.executeQuery(tst1);
		if(rs1.next()){
			BOvoc=	rs1.getString("docno");
		}
		
		System.out.println("==prdupdateOvoc=="+BOvoc);
		
			 for(int k=0;k<pmgntarray.size();k++){
				 String[] pmgntarr=((String) pmgntarray.get(k)).split("::"); 
				 String psrno=""+(pmgntarr[0].trim().equalsIgnoreCase("undefined") || pmgntarr[0].trim().equalsIgnoreCase("NaN")|| pmgntarr[0].trim().equalsIgnoreCase("")|| pmgntarr[0].isEmpty()?0:pmgntarr[0].trim())+"";
				 String udoc=""+(pmgntarr[1].trim().equalsIgnoreCase("undefined") || pmgntarr[1].trim().equalsIgnoreCase("NaN")|| pmgntarr[1].trim().equalsIgnoreCase("")|| pmgntarr[1].isEmpty()?0:pmgntarr[1].trim())+"";
				 String reqqty=""+(pmgntarr[2].trim().equalsIgnoreCase("undefined") || pmgntarr[2].trim().equalsIgnoreCase("NaN")|| pmgntarr[2].trim().equalsIgnoreCase("")|| pmgntarr[2].isEmpty()?0:pmgntarr[2].trim())+"";
				 String work=""+(pmgntarr[3].trim().equalsIgnoreCase("undefined") || pmgntarr[3].trim().equalsIgnoreCase("NaN")|| pmgntarr[3].trim().equalsIgnoreCase("")|| pmgntarr[3].isEmpty()?0:pmgntarr[3].trim())+"";
				 String opsrno=""+(pmgntarr[4].trim().equalsIgnoreCase("undefined") || pmgntarr[4].trim().equalsIgnoreCase("NaN")|| pmgntarr[4].trim().equalsIgnoreCase("")|| pmgntarr[4].isEmpty()?0:pmgntarr[4].trim())+"";
				 String otype=""+(pmgntarr[5].trim().equalsIgnoreCase("undefined") || pmgntarr[5].trim().equalsIgnoreCase("NaN")|| pmgntarr[5].trim().equalsIgnoreCase("")|| pmgntarr[5].isEmpty()?0:pmgntarr[5].trim())+"";
				 String qtyss=""+(pmgntarr[6].trim().equalsIgnoreCase("undefined") || pmgntarr[6].trim().equalsIgnoreCase("NaN")|| pmgntarr[6].trim().equalsIgnoreCase("")|| pmgntarr[6].isEmpty()?0:pmgntarr[6].trim())+"";
				 String min=""+(pmgntarr[7].trim().equalsIgnoreCase("undefined") || pmgntarr[7].trim().equalsIgnoreCase("NaN")|| pmgntarr[7].trim().equalsIgnoreCase("")|| pmgntarr[7].isEmpty()?0:pmgntarr[7].trim())+"";
			/* if(k>0){
				qtyss="0";
			} */
				 String tst2="insert into my_prdupdate (doc_no, psrno, uom, qty,orderno,type,opsrno,fillqty,minno) values ("+BOvoc+","+psrno+","+udoc+","+reqqty+","+work+",'"+otype+"',"+opsrno+",'"+qtyss+"',"+min+")";	 
			 val=stmt.executeUpdate(tst2);
			
			 }
				String upsql="insert into my_workorderlog (type,brhId, logdate, userid, workorderno,description) values ('FILL','"+brhid+"',now(),'"+session.getAttribute("USERID").toString()+"',"+workno+",'Production Updated')";
				int aaa= stmt.executeUpdate(upsql);
		}
			/*  String sqltst="update my_workorder set blendsheetno="+BOvoc+",workprocess=4 where doc_no="+workno+" and psrno="+mpsrno+"";
			 val=stmt.executeUpdate(sqltst); */
			 
		
			 
			 if(val>0){ 
			 tempnw="1";
			 }
    stmt.close();
		 
	conn.close();
	 response.getWriter().print(tempnw+" :: "+BOvoc+" :: "+availbal);
    	
    }
    catch(Exception e)
    {
    	e.printStackTrace();
    	
    	
    	conn.close();
    	 response.getWriter().print(tempnw+" :: "+BOvoc+" :: "+availbal);
    }
	 finally{
		 conn.close();
	 }
	 	
	 	
%>



 