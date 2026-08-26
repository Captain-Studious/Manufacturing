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
String batch=request.getParameter("batch")==null?"0":request.getParameter("batch");
String workno=request.getParameter("workno")==null?"0":request.getParameter("workno"); 
String mpsrno=request.getParameter("psrno")==null?"0":request.getParameter("psrno"); 
String udoc=request.getParameter("uomid")==null?"0":request.getParameter("uomid"); 
String qty=request.getParameter("qty")==null?"0":request.getParameter("qty");
String specid=request.getParameter("specid")==null?"0":request.getParameter("specid");
String prdcost=request.getParameter("prdcost")==null?"0":request.getParameter("prdcost");
String lmpchk=request.getParameter("lmpsmchk")==null?"0":request.getParameter("lmpsmchk");
String ordertype=request.getParameter("ordertype")==null?"0":request.getParameter("ordertype");
String brhid=request.getParameter("brhid")==null?"0":request.getParameter("brhid");
String locid=request.getParameter("locid")==null?"0":request.getParameter("locid");
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
 String trno="0";
/* ArrayList<String> pmgntarray= new ArrayList<String>();
String aa[]=list.split(",");

	 
for(int i=0;i<aa.length;i++){
	System.out.println("----------"+aa[i]);
	 String bb[]=aa[i].split("::");
	  
	 String temp="";
	 for(int j=0;j<bb.length;j++){ 
		 
		 System.out.println("----------"+bb[j]);
		 temp=temp+bb[j]+"::";
		 
	}
	 pmgntarray.add(temp);
	 
}  */
 
	  Connection conn=null;
	    String sql="",tempnw="",updatesqls1="";
	    int val=0;
	    try
	    {
	   	
	    conn = ClsConnection.getMyConnection();
	    conn.setAutoCommit(false);
		Statement stmt = conn.createStatement();
		Statement stmtnw = conn.createStatement();
		String refdetails="MNF"+""+workno;
		double amount=0,totamount=0,cost=0,absorptioncost=0;
		String tst1="select coalesce((max(trno)+1),1) as itrno from  my_trno";
		ResultSet rs1=stmt.executeQuery(tst1);
		if(rs1.next()){
			trno=	rs1.getString("itrno");
		}
		
		//System.out.println("==BlendsheetOvoc=="+BOvoc);
		
		String sqltst="select coalesce(sum(dramount),0)amount from my_jvtran where acno=(select acno from my_issuetype where typeid=2 ) and rdocno="+workno+" and rtype='MNF'";
		System.out.println("==jvtranselecttotalcost=="+sqltst);
		ResultSet rs2=stmt.executeQuery(sqltst);
		if(rs2.next()){
			amount=	rs2.getDouble("amount");
			if(amount<0){
				amount=amount*-1;
			}
		}
		if(!prdcost.equalsIgnoreCase("")){
			if(lmpchk.equalsIgnoreCase("1")){
				totamount=(Double.parseDouble(prdcost)*Double.parseDouble(qty))+amount;
				absorptioncost=Double.parseDouble(prdcost)*Double.parseDouble(qty);
			}
			else{
				totamount=(Double.parseDouble(prdcost))+amount;
				absorptioncost=Double.parseDouble(prdcost);
			}
			
		}
		else{
			totamount=amount;
		}
		if(totamount>0){
			cost=totamount/Double.parseDouble(qty);
		}
		Statement jvstmt = conn.createStatement();
			String tst2="insert into my_prddin (psrno, tr_no, date, dtype,fr, unitid, specno, op_qty, out_qty, rsv_qty, del_qty, foc, foc_out, prdid, locid, brhid, sr_no, cost_price, unit_price,exp_date, batch_no, invno, pstatus) values ("+mpsrno+","+trno+",'"+sqlprocessdate+"','MNF',1,"+udoc+","+specid+","+qty+",0,0,0,0,0,"+mpsrno+","+locid+","+brhid+",1,"+cost+",0,'"+sqlprocessdate+"','"+batch+"',0,1)";	 
			System.out.println("==prddin insert=="+tst2);
			val=jvstmt.executeUpdate(tst2);
			
			 
			 
			 int acnos2=0;
				String curris2="1";
				double rates2=1;



				String sql22="select acno from my_issuetype where typeid=2 ";
				//System.out.println("-----4--sql2----"+sql2) ;

				ResultSet tass2 = jvstmt.executeQuery (sql22);

				if (tass2.next()) {

					acnos2=tass2.getInt("acno");		

				}



				String sqls4="select h.curid,round(c.c_rate,2) rate from my_head h left join my_curr c on c.doc_no=h.curid where h.doc_no='"+acnos2+"'";
				//System.out.println("-----5--sqls3----"+sqls3) ;
				ResultSet tass4 = jvstmt.executeQuery (sqls4);

				if (tass4.next()) {

					curris2=tass4.getString("curid");	


				}
				String currencytype2="";
				String sqlveh2 = "select a.rate,a.type from my_curbook a inner join (select max(cb.doc_no) doc_no,cb.curid curid,cb.toDate,cb.frmDate from my_curbook cb "
						+"where  coalesce(toDate,curdate())>='"+sqlprocessdate+"' and frmDate<='"+sqlprocessdate+"' group by cb.curid) as b on(a.doc_no=b.doc_no and a.curid=b.curid) where a.curid='"+curris2+"'";
				//System.out.println("-----6--sqlveh----"+sqlveh) ;
				ResultSet resultSet55 = jvstmt.executeQuery(sqlveh2);

				while (resultSet55.next()) {
					rates2=resultSet55.getDouble("rate");
					currencytype2=resultSet55.getString("type");
				} 

				double pricetottal2=amount*-1;
				double ldramounts2=0 ;     
				if(currencytype2.equalsIgnoreCase("D"))
				{

					ldramounts2=pricetottal2/rates2 ;  
				}

				else
				{
					ldramounts2=pricetottal2*rates2 ;  
				}

				String sql33="";
			/*	if(itemtype==1 || itemtype==6)
				{*/

				  sql33="insert into my_jvtran(date,ref_detail,doc_no,acno,description,curId,rate,dramount,ldramount,out_amount,id,trtype,ref_row,LAGE,cldocno,lbrrate,dTYPE,brhId,tr_no,STATUS,rdocno,rtype)   "
						+ "values('"+sqlprocessdate+"','"+refdetails+"',"+workno+",'"+acnos2+"','"+refdetails+"','"+curris2+"','"+rates2+"',"+pricetottal2+","+ldramounts2+",0,1,6,0,0,0,'"+rates2+"','MIR',"+brhid+","+trno+",3,"+workno+",'MNF')";

	/*			}
				else
				{

					  sql11="insert into my_jvtran(date,ref_detail,doc_no,acno,description,curId,rate,dramount,ldramount,out_amount,id,trtype,ref_row,LAGE,cldocno,lbrrate,costtype,costcode,dTYPE,brhId,tr_no,STATUS)   "
							+ "values('"+masterdate+"','"+refdetails+"',"+docno+",'"+acnos+"','"+refdetails+"','"+curris+"','"+rates+"',"+pricetottal+","+ldramounts+",0,1,6,0,0,0,'"+rates+"',0,0,'GIR','"+session.getAttribute("BRANCHID").toString()+"',"+trno+",3)";
		
				}*/
				 System.out.println("---jvtranwipaccount----"+sql33) ; 

				val = stmt.executeUpdate(sql33);

				if(val<=0)
				{
					conn.close();
					 tempnw="0";

				}
				
			 
				if(!prdcost.equalsIgnoreCase("")){
					
					 int acnos3=0;
						String curris3="1";
						double rates3=1;



						String sql44="select  acno from my_account where codeno='ABSORPTION ACCOUNT' ";
						//System.out.println("-----4--sql2----"+sql2) ;

						ResultSet tass5 = stmt.executeQuery (sql44);

						if (tass5.next()) {

							acnos3=tass5.getInt("acno");		

						}



						String sqls5="select h.curid,round(c.c_rate,2) rate from my_head h left join my_curr c on c.doc_no=h.curid where h.doc_no='"+acnos3+"'";
						//System.out.println("-----5--sqls3----"+sqls3) ;
						ResultSet tass6 = stmt.executeQuery (sqls5);

						if (tass6.next()) {

							curris3=tass6.getString("curid");	


						}
						String currencytype3="";
						String sqlveh3 = "select a.rate,a.type from my_curbook a inner join (select max(cb.doc_no) doc_no,cb.curid curid,cb.toDate,cb.frmDate from my_curbook cb "
								+"where  coalesce(toDate,curdate())>='"+sqlprocessdate+"' and frmDate<='"+sqlprocessdate+"' group by cb.curid) as b on(a.doc_no=b.doc_no and a.curid=b.curid) where a.curid='"+curris3+"'";
						//System.out.println("-----6--sqlveh----"+sqlveh) ;
						ResultSet resultSet66 = stmt.executeQuery(sqlveh3);

						while (resultSet66.next()) {
							rates3=resultSet66.getDouble("rate");
							currencytype3=resultSet66.getString("type");
						} 

						double pricetottal3=absorptioncost*-1;
						double ldramounts3=0 ;     
						if(currencytype3.equalsIgnoreCase("D"))
						{

							ldramounts3=pricetottal3/rates3 ;  
						}

						else
						{
							ldramounts3=pricetottal3*rates3 ;  
						}

						String sql55="";
					/*	if(itemtype==1 || itemtype==6)
						{*/

						  sql55="insert into my_jvtran(date,ref_detail,doc_no,acno,description,curId,rate,dramount,ldramount,out_amount,id,trtype,ref_row,LAGE,cldocno,lbrrate,dTYPE,brhId,tr_no,STATUS,rdocno,rtype)   "
								+ "values('"+sqlprocessdate+"','"+refdetails+"',"+workno+",'"+acnos3+"','"+refdetails+"','"+curris3+"','"+rates3+"',"+pricetottal3+","+ldramounts3+",0,1,6,0,0,0,'"+rates3+"','MIR',"+brhid+","+trno+",3,"+workno+",'MNF')";

			/*			}
						else
						{

							  sql11="insert into my_jvtran(date,ref_detail,doc_no,acno,description,curId,rate,dramount,ldramount,out_amount,id,trtype,ref_row,LAGE,cldocno,lbrrate,costtype,costcode,dTYPE,brhId,tr_no,STATUS)   "
									+ "values('"+masterdate+"','"+refdetails+"',"+docno+",'"+acnos+"','"+refdetails+"','"+curris+"','"+rates+"',"+pricetottal+","+ldramounts+",0,1,6,0,0,0,'"+rates+"',0,0,'GIR','"+session.getAttribute("BRANCHID").toString()+"',"+trno+",3)";
				
						}*/
						// System.out.println("---sql11----"+sql11) ; 
						 System.out.println("---jvtranabsorptionaccount----"+sql55) ; 
						val = stmt.executeUpdate(sql55);

						if(val<=0)
						{
							conn.close();
							 tempnw="0";

						}
					
				}
			 
			 
			 
			 
			    int acnos=0;
				String curris="1";
				double rates=1;



				String sql2="select  acno from my_account where codeno='STOCK ACCOUNT' ";
				//System.out.println("-----4--sql2----"+sql2) ;

				ResultSet tass1 = stmtnw.executeQuery (sql2);

				if (tass1.next()) {

					acnos=tass1.getInt("acno");		

				}



				String sqls3="select h.curid,round(c.c_rate,2) rate from my_head h left join my_curr c on c.doc_no=h.curid where h.doc_no='"+acnos+"'";
				//System.out.println("-----5--sqls3----"+sqls3) ;
				ResultSet tass3 = stmtnw.executeQuery (sqls3);

				if (tass3.next()) {

					curris=tass3.getString("curid");	


				}
				String currencytype1="";
				String sqlveh = "select a.rate,a.type from my_curbook a inner join (select max(cb.doc_no) doc_no,cb.curid curid,cb.toDate,cb.frmDate from my_curbook cb "
						+"where  coalesce(toDate,curdate())>='"+sqlprocessdate+"' and frmDate<='"+sqlprocessdate+"' group by cb.curid) as b on(a.doc_no=b.doc_no and a.curid=b.curid) where a.curid='"+curris+"'";
				//System.out.println("-----6--sqlveh----"+sqlveh) ;
				ResultSet resultSet44 = stmtnw.executeQuery(sqlveh);

				while (resultSet44.next()) {
					rates=resultSet44.getDouble("rate");
					currencytype1=resultSet44.getString("type");
				} 

				double pricetottal=totamount;
				double ldramounts=0 ;     
				if(currencytype1.equalsIgnoreCase("D"))
				{

					ldramounts=pricetottal/rates ;  
				}

				else
				{
					ldramounts=pricetottal*rates ;  
				}

				String sql11="";
			/*	if(itemtype==1 || itemtype==6)
				{*/

				  sql11="insert into my_jvtran(date,ref_detail,doc_no,acno,description,curId,rate,dramount,ldramount,out_amount,id,trtype,ref_row,LAGE,cldocno,lbrrate,dTYPE,brhId,tr_no,STATUS,rdocno,rtype)   "
						+ "values('"+sqlprocessdate+"','"+refdetails+"',"+workno+",'"+acnos+"','"+refdetails+"','"+curris+"','"+rates+"',"+pricetottal+","+ldramounts+",0,1,6,0,0,0,'"+rates+"','MIR',"+brhid+","+trno+",3,"+workno+",'MNF')";

	/*			}
				else
				{

					  sql11="insert into my_jvtran(date,ref_detail,doc_no,acno,description,curId,rate,dramount,ldramount,out_amount,id,trtype,ref_row,LAGE,cldocno,lbrrate,costtype,costcode,dTYPE,brhId,tr_no,STATUS)   "
							+ "values('"+masterdate+"','"+refdetails+"',"+docno+",'"+acnos+"','"+refdetails+"','"+curris+"','"+rates+"',"+pricetottal+","+ldramounts+",0,1,6,0,0,0,'"+rates+"',0,0,'GIR','"+session.getAttribute("BRANCHID").toString()+"',"+trno+",3)";
		
				}*/
				// System.out.println("---sql11----"+sql11) ; 
				System.out.println("---jvtranstockaccount----"+sql11) ; 
				val = stmtnw.executeUpdate(sql11);
				System.out.println("---stockval----"+val) ; 
				if(val<=0)
				{
					conn.close();
					 tempnw="0";

				}
			/*  String sqltst5="update my_prdupdate set trno="+trno+" where orderno="+workno+" and opsrno="+mpsrno+" and type='"+ordertype+"'";
			 val=stmtnw.executeUpdate(sqltst5);
			 System.out.println("---prdupdateval----"+val) ;
			 if(val<=0)
				{
					conn.close();
					 tempnw="0";

				} */
			String upsql="insert into my_workorderlog (type,brhId, logdate, userid, workorderno,description) values ('FILL','"+brhid+"',now(),'"+session.getAttribute("USERID").toString()+"',"+workno+",'production completed')";
			int aaa= stmtnw.executeUpdate(upsql);
			 
			 if(val>0){ 
			 tempnw="1";
			 conn.commit();
			 }
    stmt.close();
		 
	conn.close();
	 response.getWriter().print(tempnw+" :: "+trno);
    	
    }
    catch(Exception e)
    {
    	e.printStackTrace();
    	
    	
    	conn.close();
    	 response.getWriter().print(tempnw+" :: "+trno);
    }
	 finally{
		 conn.close();
	 }
	 	
	 	
%>



 