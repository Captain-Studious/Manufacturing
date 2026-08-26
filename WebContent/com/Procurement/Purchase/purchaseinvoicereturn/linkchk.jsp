<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.*"%>
<%@page import="javax.sql.*"%>
<%@page import="com.connection.*" %>


<%
   
      String masterdoc_no=request.getParameter("masterdoc_no")==null?"0":request.getParameter("masterdoc_no");

String reftype=request.getParameter("reftype")==null?"0":request.getParameter("reftype");
String refmasterdocno=request.getParameter("refmasterdocno")==null?"0":request.getParameter("refmasterdocno");

int tr_no=0;
 	Connection conn = null;
try{	ClsConnection ClsConnection=new ClsConnection();
	conn= ClsConnection.getMyConnection();
	Statement stmt = conn.createStatement ();
	int val=0;
	
  
/*   	if(reftype.equalsIgnoreCase("PIV"))
	{
	String strSql2 = "select * from (select sum(d.qty+d.foc-(d.out_qty+d.foc_out)) qty,ii.inqty bel_qty,d.prdid,m.doc_no,m.voc_no,m.date,m.description,m.refno,0 'chk' "
			+ "  from my_srvm m  left join      my_srvd d on d.tr_no=m.tr_no "
			+ " left join (select  sum(op_qty-(out_qty+rsv_qty+del_qty)) inqty,cost_price,prdid,specno,tr_no,batch_no,exp_date from my_prddin group by tr_no) ii "
	     	+ "   on      ii.tr_no=d.tr_no "
			+ " 	 where  m.status=3 and m.fstatus=0 and m.doc_no="+refmasterdocno+"   group by m.doc_no) as a having qty!=bel_qty and qty>0  ";
	
	// System.out.println("---ssssssssssss1-"+strSql2);
	ResultSet rs1 = stmt.executeQuery(strSql2);

	if(rs1.next()) {
		val=1;
 		} 
	}
	 
	  */
 
	
	  val=1; 
 
	stmt.close();
	conn.close();

	response.getWriter().print(val);
}
catch(Exception e){
	e.printStackTrace();
	conn.close();
}
	%>