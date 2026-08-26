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
ArrayList<String> bomarray= new ArrayList<String>();
String cc[]=list2.split(",");

for(int i=0;i<cc.length;i++){
	System.out.println("----------"+cc[i]);
	 String bb[]=cc[i].split("::");
	  
	 String temp="";
	 for(int j=0;j<bb.length;j++){ 
		 
		 System.out.println("----------"+bb[j]);
		 temp=temp+bb[j]+"::";
		 
	}
	 bomarray.add(temp);
}
	  Connection conn=null;
	    String sql="",tempnw="",updatesqls1="";
	    //String rdocno="0";
	    int val=0;
	    try
	    {
	   	
	    conn = ClsConnection.getMyConnection();
		Statement stmt = conn.createStatement();
		 double prqty=0;
		
		String tst1="select coalesce(max(doc_no),0)+1 as docno from my_workorder";
		ResultSet rs1=stmt.executeQuery(tst1);
		if(rs1.next()){
			BOvoc=	rs1.getString("docno");
		}
		
		System.out.println("==BOvoc=="+BOvoc);
		
			 for(int k=0;k<pmgntarray.size();k++){
				 String[] pmgntarr=((String) pmgntarray.get(k)).split("::"); 
				 String psrno=""+(pmgntarr[0].trim().equalsIgnoreCase("undefined") || pmgntarr[0].trim().equalsIgnoreCase("NaN")|| pmgntarr[0].trim().equalsIgnoreCase("")|| pmgntarr[0].isEmpty()?0:pmgntarr[0].trim())+"";
				 String udoc=""+(pmgntarr[1].trim().equalsIgnoreCase("undefined") || pmgntarr[1].trim().equalsIgnoreCase("NaN")|| pmgntarr[1].trim().equalsIgnoreCase("")|| pmgntarr[1].isEmpty()?0:pmgntarr[1].trim())+"";
				 String reqqty=""+(pmgntarr[2].trim().equalsIgnoreCase("undefined") || pmgntarr[2].trim().equalsIgnoreCase("NaN")|| pmgntarr[2].trim().equalsIgnoreCase("")|| pmgntarr[2].isEmpty()?0:pmgntarr[2].trim())+"";
				 String remarks=""+(pmgntarr[3].trim().equalsIgnoreCase("undefined") || pmgntarr[3].trim().equalsIgnoreCase("NaN")|| pmgntarr[3].trim().equalsIgnoreCase("")|| pmgntarr[3].isEmpty()?0:pmgntarr[3].trim())+"";
				 
				 String rdocno=""+(pmgntarr[4].trim().equalsIgnoreCase("undefined") || pmgntarr[4].trim().equalsIgnoreCase("NaN")|| pmgntarr[4].trim().equalsIgnoreCase("")|| pmgntarr[4].isEmpty()?0:pmgntarr[4].trim())+"";
				 String rdtype=""+(pmgntarr[5].trim().equalsIgnoreCase("undefined") || pmgntarr[5].trim().equalsIgnoreCase("NaN")|| pmgntarr[5].trim().equalsIgnoreCase("")|| pmgntarr[5].isEmpty()?0:pmgntarr[5].trim())+"";
				 String bompsrno=""+(pmgntarr[6].trim().equalsIgnoreCase("undefined") || pmgntarr[6].trim().equalsIgnoreCase("NaN")|| pmgntarr[6].trim().equalsIgnoreCase("")|| pmgntarr[6].isEmpty()?0:pmgntarr[6].trim())+"";
				 String sorddoc=""+(pmgntarr[7].trim().equalsIgnoreCase("undefined") || pmgntarr[7].trim().equalsIgnoreCase("NaN")|| pmgntarr[7].trim().equalsIgnoreCase("")|| pmgntarr[7].isEmpty()?0:pmgntarr[7].trim())+"";
				 String mainpsrno=""+(pmgntarr[8].trim().equalsIgnoreCase("undefined") || pmgntarr[8].trim().equalsIgnoreCase("NaN")|| pmgntarr[8].trim().equalsIgnoreCase("")|| pmgntarr[8].isEmpty()?0:pmgntarr[8].trim())+"";
				 String method=""+(pmgntarr[9].trim().equalsIgnoreCase("undefined") || pmgntarr[9].trim().equalsIgnoreCase("NaN")|| pmgntarr[9].trim().equalsIgnoreCase("")|| pmgntarr[9].isEmpty()?0:pmgntarr[9].trim())+"";
			 String tst2="insert into my_workorder (doc_no, psrno, uom, qty, remarks,sorddoc,bomethod) values ("+BOvoc+","+psrno+","+udoc+","+reqqty+",'"+remarks+"','"+sorddoc+"','"+method+"')";	 
			 val=stmt.executeUpdate(tst2);
			 String sqltstk="select (coalesce(woqty,0)+"+reqqty+")prqty from my_mrp  where dpsrno="+psrno+" and psrno="+bompsrno+" and rdocno="+rdocno+" and rdtype='"+rdtype+"'";
		     System.out.println("==mrpqtyslct=="+sqltstk);
		     ResultSet rs2=stmt.executeQuery(sqltstk);
				if(rs2.next()){
					prqty=	rs2.getDouble("prqty");
				}
			 
			 String sqltst="update my_mrp set woqty="+prqty+",wodocno="+BOvoc+" where dpsrno="+psrno+" and psrno="+bompsrno+" and rdocno="+rdocno+" and rdtype='"+rdtype+"'";
			 val=stmt.executeUpdate(sqltst);
			 
			 if(rdtype.equalsIgnoreCase("SOR")){
				 String sqltstnw="update my_sorderd set workno="+BOvoc+" where rdocno="+rdocno+" and psrno="+mainpsrno+"";
				 val=stmt.executeUpdate(sqltstnw);
			 }
			 if(rdtype.equalsIgnoreCase("STKO")){
				 String sqltstnw="update my_stockorderd set workno="+BOvoc+" where rdocno="+rdocno+" and psrno="+mainpsrno+"";
				 val=stmt.executeUpdate(sqltstnw);
			 }
			 Statement stmtnw = conn.createStatement();
			 String wrkqry="select m1.stdper,1 mtypeid,m.psrno bompsrno,"+mainpsrno+" mainpsrno,u.doc_no uomid, convert(m1.psrno , char(50))psrno,m.doc_no,coalesce(m1.stdper,0)stdper "
					 +",round(('"+reqqty+"'/m.volume)* m1.qtykg,3) qty,round(('"+reqqty+"'/m.volume)* m1.quantity,3) qtykg "
					 +" from my_prdetail m inner join (select psrno,max(if(activeprocess=1,doc_no,0)) active,max(if(activeprocess=0,doc_no,0)) nonactive from my_prdetail group by psrno) bom on (if(bom.active>0,bom.active,bom.nonactive)=m.doc_no) left join my_prdetailraw m1 on  m.doc_no=m1.rdocno  left join my_main mm on (m1.psrno=mm.psrno)   left join my_unitm u on u.doc_no=mm.munit left join my_unitm wou on wou.doc_no=m1.uom where m.status=3 and m.psrno="+psrno+""
					  +" group by psrno "
					+" union all "
					+" select 0 stdper,m.mtypeid,m.psrno bompsrno,"+mainpsrno+" mainpsrno,u.doc_no uomid, convert(m.dpsrno , char(50))psrno,0 doc_no,0 stdper,m.qty,m.qty qtykg from my_mrp m  left join my_main mm on (m.dpsrno=mm.psrno )   left join my_unitm u on u.doc_no=mm.munit where  m.mainpsrno="+mainpsrno+" and m.mtypeid=4 and m.rdocno="+rdocno+" group by psrno";
			 System.out.println("==wrkqry=="+wrkqry);
			 ResultSet rswrk=stmtnw.executeQuery(wrkqry);
			 while (rswrk.next()){
				 String wpsrno=rswrk.getString("psrno");
				 String uomid=rswrk.getString("uomid");
				 String mtypeid=rswrk.getString("mtypeid");
				 String wbompsrno=rswrk.getString("bompsrno");
				 String wmainpsrno=rswrk.getString("mainpsrno");
				 String stdper=rswrk.getString("stdper");
				 String qtykg=rswrk.getString("qtykg");
				 String qtyltr=rswrk.getString("qty");
				 if(Integer.parseInt(wpsrno)>0){
						String tst4="insert into my_workorderd (rdocno, psrno, unitid, mtypeid, qty, workqty, bompsrno, sorpsrno, stdper, qtyltr, qtykg) values ("+BOvoc+","+wpsrno+","+uomid+","+mtypeid+",0,0,'"+wbompsrno+"','"+wmainpsrno+"','"+stdper+"','"+qtyltr+"','"+qtykg+"')";	 
						 val=stmt.executeUpdate(tst4);
				 }
			 }
			 
			 }
			 
			 
			/*  for(int k=0;k<bomarray.size();k++){
				 String[] bomarr=((String) bomarray.get(k)).split("::"); 
				 String wodocno=""+(bomarr[0].trim().equalsIgnoreCase("undefined") || bomarr[0].trim().equalsIgnoreCase("NaN")|| bomarr[0].trim().equalsIgnoreCase("")|| bomarr[0].isEmpty()?0:bomarr[0].trim())+"";
				 String psrno=""+(bomarr[1].trim().equalsIgnoreCase("undefined") || bomarr[1].trim().equalsIgnoreCase("NaN")|| bomarr[1].trim().equalsIgnoreCase("")|| bomarr[1].isEmpty()?0:bomarr[1].trim())+"";
				 String uomid=""+(bomarr[2].trim().equalsIgnoreCase("undefined") || bomarr[2].trim().equalsIgnoreCase("NaN")|| bomarr[2].trim().equalsIgnoreCase("")|| bomarr[2].isEmpty()?0:bomarr[2].trim())+"";
				 String mtypeid=""+(bomarr[3].trim().equalsIgnoreCase("undefined") || bomarr[3].trim().equalsIgnoreCase("NaN")|| bomarr[3].trim().equalsIgnoreCase("")|| bomarr[3].isEmpty()?0:bomarr[3].trim())+"";
				 
				 String qty=""+(bomarr[4].trim().equalsIgnoreCase("undefined") || bomarr[4].trim().equalsIgnoreCase("NaN")|| bomarr[4].trim().equalsIgnoreCase("")|| bomarr[4].isEmpty()?0:bomarr[4].trim())+"";
				 String worder=""+(bomarr[5].trim().equalsIgnoreCase("undefined") || bomarr[5].trim().equalsIgnoreCase("NaN")|| bomarr[5].trim().equalsIgnoreCase("")|| bomarr[5].isEmpty()?0:bomarr[5].trim())+"";
				 String bompsrno=""+(bomarr[6].trim().equalsIgnoreCase("undefined") || bomarr[6].trim().equalsIgnoreCase("NaN")|| bomarr[6].trim().equalsIgnoreCase("")|| bomarr[6].isEmpty()?0:bomarr[6].trim())+"";
				 String mainpsrno=""+(bomarr[7].trim().equalsIgnoreCase("undefined") || bomarr[7].trim().equalsIgnoreCase("NaN")|| bomarr[7].trim().equalsIgnoreCase("")|| bomarr[7].isEmpty()?0:bomarr[7].trim())+"";
				 String stdper=""+(bomarr[8].trim().equalsIgnoreCase("undefined") || bomarr[8].trim().equalsIgnoreCase("NaN")|| bomarr[8].trim().equalsIgnoreCase("")|| bomarr[8].isEmpty()?0:bomarr[8].trim())+"";
				 String qtykg=""+(bomarr[9].trim().equalsIgnoreCase("undefined") || bomarr[9].trim().equalsIgnoreCase("NaN")|| bomarr[9].trim().equalsIgnoreCase("")|| bomarr[9].isEmpty()?0:bomarr[9].trim())+"";
				 String qtyltr=""+(bomarr[10].trim().equalsIgnoreCase("undefined") || bomarr[10].trim().equalsIgnoreCase("NaN")|| bomarr[10].trim().equalsIgnoreCase("")|| bomarr[10].isEmpty()?0:bomarr[10].trim())+"";
			
			
			 } */
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



 