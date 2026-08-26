<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.*"%>
<%@page import="javax.sql.*"%>
<%@page import="com.connection.*" %>


<%
   
      String masterdoc_no=request.getParameter("masterdoc_no")==null?"0":request.getParameter("masterdoc_no");
 
 
 	Connection conn = null;
try{	ClsConnection ClsConnection=new ClsConnection();
	conn= ClsConnection.getMyConnection();
	Statement stmt = conn.createStatement ();
	int val=0;
	
 
		 int rrefno=0;
  			int tr_nosret=0;
			int acno=0;
			java.sql.Date date=null;
			 int tridinr=0;
			 int tridinv=0;
	String aa = "select tr_no,rrefno,acno,date from my_invr where  doc_no='"+masterdoc_no+"'";
	
 
		ResultSet bb = stmt.executeQuery(aa);
	if(bb.next()) {
		tr_nosret=bb.getInt("tr_no");
		rrefno=bb.getInt("rrefno");
		acno=bb.getInt("acno");
		date=bb.getDate("date");
	
		} 
		int tr_nosinv=0;
		String aa1 = "select tr_no from my_invm where  doc_no='"+rrefno+"'";
 
		ResultSet bb1 = stmt.executeQuery(aa1);
		if(bb1.next()) {
			tr_nosinv=bb1.getInt("tr_no");
			
					} 


	
	double dramountret=0;
	double out_amountret=0;
	
	String cc2 = "select dramount,out_amount,tranid from my_jvtran where  tr_no='"+tr_nosret+"' and acno="+acno+"  ";
	
 
		ResultSet cc3 = stmt.executeQuery(cc2);

		if(cc3.next()) {
			dramountret=cc3.getDouble("dramount");
			out_amountret=cc3.getDouble("out_amount");
		
			tridinr=cc3.getInt("tranid");
			} 
		
		
		double dramountinv=0;
		double out_amountinv=0;
		
		String cc21 = "select dramount,out_amount,tranid from my_jvtran where  tr_no='"+tr_nosinv+"' and acno="+acno+"  ";
		
  
			ResultSet cc31 = stmt.executeQuery(cc21);

			if(cc31.next()) {
				dramountinv=cc31.getDouble("dramount");
				out_amountinv=cc31.getDouble("out_amount");
				tridinv=cc31.getInt("tranid");
				
				} 
			
			if(out_amountret<0 || out_amountinv>0)
			{
				response.getWriter().print(10);	
				
			}
			
			else
			{
				
				String sql1="update my_jvtran set out_amount="+dramountret+" where  tr_no='"+tr_nosret+"' and acno="+acno+"   ";
			  
				stmt.executeUpdate(sql1);
				
				String sql11="update my_jvtran set out_amount="+dramountret*-1+" where  tr_no='"+tr_nosinv+"' and acno="+acno+"   ";
			  
				stmt.executeUpdate(sql11);
				
				
				String sql111="insert into  my_outd(TRANID, AMOUNT,  DATE,  AP_TRID)values("+tridinr+","+dramountret*-1+",'"+date+"',"+tridinv+")    ";
				stmt.executeUpdate(sql111);
				
				response.getWriter().print(11);	
				
			}
			
			
			
		
	
	stmt.close();
	conn.close();


}
catch(Exception e){
	e.printStackTrace();
	response.getWriter().print(0);	
	conn.close();
}
	%>