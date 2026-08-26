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
<%@ page import="com.sales.InventoryTransfer.materialissuenote.ClsMaterialIssueNoteDAO" %>
<%
ClsConnection ClsConnection=new ClsConnection();
ClsCommon ClsCommon=new ClsCommon();
ClsMaterialIssueNoteDAO DAO = new ClsMaterialIssueNoteDAO();
String list=request.getParameter("productarray")==null?"0":request.getParameter("productarray");
String list2=request.getParameter("productarraynw")==null?"0":request.getParameter("productarraynw");
String workno=request.getParameter("workno")==null?"0":request.getParameter("workno"); 
String mpsrno=request.getParameter("psrno")==null?"0":request.getParameter("psrno"); 
String batch=request.getParameter("batch")==null?"0":request.getParameter("batch"); 
String ordertype=request.getParameter("ordertype")==null?"0":request.getParameter("ordertype");
String sorqty=request.getParameter("sorqty")==null?"0":request.getParameter("sorqty");
String fill=request.getParameter("fill")==null?"0":request.getParameter("fill");
String locid=request.getParameter("location")==null?"0":request.getParameter("location");
String brhid=request.getParameter("brhid")==null?"0":request.getParameter("brhid");
String prdcost=request.getParameter("prdcost");
String lmpchk=request.getParameter("lmpsmchk")==null?"0":request.getParameter("lmpsmchk");
String udoc=request.getParameter("uomid")==null?"0":request.getParameter("uomid"); 
String specid=request.getParameter("specid")==null?"0":request.getParameter("specid");
String sorddoc=request.getParameter("sorddoc")==null?"0":request.getParameter("sorddoc");
String desc=request.getParameter("desc")==null?"0":request.getParameter("desc");
System.out.println("----brhid------"+brhid+"=====locid===="+locid+"=======sorddoc====="+sorddoc);
int locids=Integer.parseInt(locid);
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
ArrayList<String> pmgntarray2= new ArrayList<String>();
String aa[]=list.split(",");
String aa2[]=list2.split(",");
String BOvoc="0";
String doc="0";
	 
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
	    int val=0,vals=0,isstype=0;
	    double fillqty=0,chkqty=0,availbal=0,chkfillqty=0;
	    try
	    {
	   	
	    conn = ClsConnection.getMyConnection();
	    //conn.setAutoCommit(false);
		Statement stmt = conn.createStatement();
		Statement stmtnw = conn.createStatement();
		 Statement stmtchk = conn.createStatement();
		/* if(!sorqty.equalsIgnoreCase("")){
			chkqty=Double.parseDouble(sorqty);
		}
		if(!fill.equalsIgnoreCase("")){
			chkfillqty=Double.parseDouble(fill);
		} */
		/*  String tstchk="select sum(fillqty) as fill from my_prdupdate where orderno="+workno+" and type='"+ordertype+"' and opsrno="+mpsrno+" group by orderno,psrno";
		ResultSet rschk=stmt.executeQuery(tstchk);
		if(rschk.next()){
			fillqty=rschk.getDouble("fill");
			 availbal=chkqty-fillqty;
			 if(chkfillqty>availbal){
				 tempnw="3";
				
			} 
		} */
		String sqltst2="select coalesce(doc_no,0) as doc_no from my_issuetype where status=3 and typeid=2";
		ResultSet rsk=stmt.executeQuery(sqltst2);
		if(rsk.next()){
			isstype=	rsk.getInt("doc_no");
		}
		
		if(tempnw.equalsIgnoreCase("")){
		session.setAttribute("BRANCHID", brhid);
		  vals=DAO.insert(sqlprocessdate, sorddoc+" :: FIL", "Filling Process", 0, session, "A", "MIN", request, pmgntarray, locids, 0, 0, isstype, 0, 0, batch);
		 
		// BOvoc=	request.getAttribute("vocno").toString();
		  doc=	request.getAttribute("docno").toString();
		 System.out.println("==Goodsissuenotevoc=="+BOvoc+"==vals===="+vals);
		 /* if((vals>0) && (vals!=2)){ 
		   String sqltst="update my_prdupdate set minno="+doc+" where orderno="+workno+" and opsrno="+mpsrno+" and type='"+ordertype+"'";
			 val=stmt.executeUpdate(sqltst); 
			 
			String upsql="insert into my_workorderlog (type,brhId, logdate, userid, workorderno,description) values ('FILL','"+brhid+"',now(),'"+session.getAttribute("USERID").toString()+"',"+workno+",'created material issue note')";
			int aaa= stmt.executeUpdate(upsql);
		 }*/ 
		}
			 if(vals>0){ 
				 if(vals==2){ 
					 tempnw="2";
					 }
				 else{
						 tempnw="1"; 
					 }
						
					 
			 
		
			
					String tst1="select coalesce(max(doc_no),0)+1 as docno from my_prdupdate";
					ResultSet rs1=stmt.executeQuery(tst1);
					if(rs1.next()){
						BOvoc=	rs1.getString("docno");
					}
					
					System.out.println("==prdupdateOvoc=="+BOvoc);
					
						 for(int k=0;k<pmgntarray2.size();k++){
							 String[] pmgntarr=((String) pmgntarray2.get(k)).split("::"); 
							 String psrno=""+(pmgntarr[0].trim().equalsIgnoreCase("undefined") || pmgntarr[0].trim().equalsIgnoreCase("NaN")|| pmgntarr[0].trim().equalsIgnoreCase("")|| pmgntarr[0].isEmpty()?0:pmgntarr[0].trim())+"";
							 String uid=""+(pmgntarr[1].trim().equalsIgnoreCase("undefined") || pmgntarr[1].trim().equalsIgnoreCase("NaN")|| pmgntarr[1].trim().equalsIgnoreCase("")|| pmgntarr[1].isEmpty()?0:pmgntarr[1].trim())+"";
							 String reqqty=""+(pmgntarr[2].trim().equalsIgnoreCase("undefined") || pmgntarr[2].trim().equalsIgnoreCase("NaN")|| pmgntarr[2].trim().equalsIgnoreCase("")|| pmgntarr[2].isEmpty()?0:pmgntarr[2].trim())+"";
							 String orderno=""+(pmgntarr[3].trim().equalsIgnoreCase("undefined") || pmgntarr[3].trim().equalsIgnoreCase("NaN")|| pmgntarr[3].trim().equalsIgnoreCase("")|| pmgntarr[3].isEmpty()?0:pmgntarr[3].trim())+"";
							 String opsrno=""+(pmgntarr[4].trim().equalsIgnoreCase("undefined") || pmgntarr[4].trim().equalsIgnoreCase("NaN")|| pmgntarr[4].trim().equalsIgnoreCase("")|| pmgntarr[4].isEmpty()?0:pmgntarr[4].trim())+"";
							 String otype=""+(pmgntarr[5].trim().equalsIgnoreCase("undefined") || pmgntarr[5].trim().equalsIgnoreCase("NaN")|| pmgntarr[5].trim().equalsIgnoreCase("")|| pmgntarr[5].isEmpty()?0:pmgntarr[5].trim())+"";
							 String qtyss=""+(pmgntarr[6].trim().equalsIgnoreCase("undefined") || pmgntarr[6].trim().equalsIgnoreCase("NaN")|| pmgntarr[6].trim().equalsIgnoreCase("")|| pmgntarr[6].isEmpty()?0:pmgntarr[6].trim())+"";
							 String min=""+(pmgntarr[7].trim().equalsIgnoreCase("undefined") || pmgntarr[7].trim().equalsIgnoreCase("NaN")|| pmgntarr[7].trim().equalsIgnoreCase("")|| pmgntarr[7].isEmpty()?0:pmgntarr[7].trim())+"";
							 String work=""+(pmgntarr[8].trim().equalsIgnoreCase("undefined") || pmgntarr[8].trim().equalsIgnoreCase("NaN")|| pmgntarr[8].trim().equalsIgnoreCase("")|| pmgntarr[8].isEmpty()?0:pmgntarr[8].trim())+"";
						/* if(k>0){
							qtyss="0";
						} */
							 String tst2="insert into my_prdupdate (doc_no, psrno, uom, qty,orderno,type,opsrno,fillqty,minno,workno) values ("+BOvoc+","+psrno+","+uid+","+reqqty+","+orderno+",'"+otype+"',"+opsrno+",'"+qtyss+"',"+doc+","+work+")";	 
						 vals=stmt.executeUpdate(tst2);
						
						 }
							
					
						 
					
						 
						 if(vals>0){ 
						 tempnw="1";
							 String refdetails="MNF"+""+workno;
							int trno=0;
								double amount=0,totamount=0,cost=0,absorptioncost=0;
								 
								String tst3="select coalesce((max(trno)+1),1) as itrno from  my_trno";
								ResultSet rs2=stmt.executeQuery(tst3);
								if(rs2.next()){
									trno=rs2.getInt("itrno");
									String sqltestnw="insert into my_trno(USERNO, TRTYPE, brhId, edate, trno) values('"+session.getAttribute("USERID").toString()+"',4,"+brhid+",now(),"+trno+")";
									System.out.println("==trnoinsert=="+sqltestnw);
									vals=stmtchk.executeUpdate(sqltestnw);
								}
								
								
								
								String sqltst="select coalesce(sum(dramount),0)amount from my_jvtran where acno=(select acno from my_issuetype where typeid=2 ) and rdocno="+sorddoc+" and rtype='FIL'";
								System.out.println("==jvtranselecttotalcost=="+sqltst);
								ResultSet rs3=stmtchk.executeQuery(sqltst);
								if(rs3.next()){
									amount=	rs3.getDouble("amount");
									if(amount<0){
										amount=amount*-1;
									}
								}
								System.out.println("==amount=="+amount);
								if(!prdcost.equalsIgnoreCase("")){
									if(!lmpchk.equalsIgnoreCase("1")){
										totamount=(Double.parseDouble(prdcost)*Double.parseDouble(sorqty))+amount;
										absorptioncost=Double.parseDouble(prdcost)*Double.parseDouble(sorqty);
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
									cost=totamount/Double.parseDouble(sorqty);
								}
								Statement jvstmt = conn.createStatement();
									String tst4="insert into my_prddin (psrno, tr_no, date, dtype,fr, unitid, specno, op_qty, out_qty, rsv_qty, del_qty, foc, foc_out, prdid, locid, brhid, sr_no, cost_price, unit_price,exp_date, batch_no, invno, pstatus,description) values ("+mpsrno+","+trno+",'"+sqlprocessdate+"','MNF',1,"+udoc+","+specid+","+sorqty+",0,0,0,0,0,"+mpsrno+","+locid+","+brhid+",1,"+cost+",0,"+null+",'"+batch+"',0,1,'"+desc+"')";	 
									System.out.println("==prddin insert=="+tst4);
									vals=jvstmt.executeUpdate(tst4);
									if(vals<=0){
										conn.close();
										 tempnw="0";
									}else{
										 tempnw="1";
									}
									 
									 
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
												+ "values('"+sqlprocessdate+"','"+refdetails+"',"+workno+",'"+acnos2+"','"+refdetails+"','"+curris2+"','"+rates2+"',"+pricetottal2+","+ldramounts2+",0,1,6,0,0,0,'"+rates2+"','MNF',"+brhid+","+trno+",3,"+sorddoc+",'FIL')";
	
							/*			}
										else
										{
	
											  sql11="insert into my_jvtran(date,ref_detail,doc_no,acno,description,curId,rate,dramount,ldramount,out_amount,id,trtype,ref_row,LAGE,cldocno,lbrrate,costtype,costcode,dTYPE,brhId,tr_no,STATUS)   "
													+ "values('"+masterdate+"','"+refdetails+"',"+docno+",'"+acnos+"','"+refdetails+"','"+curris+"','"+rates+"',"+pricetottal+","+ldramounts+",0,1,6,0,0,0,'"+rates+"',0,0,'GIR','"+session.getAttribute("BRANCHID").toString()+"',"+trno+",3)";
								
										}*/
										 System.out.println("---jvtranwipaccount----"+sql33) ; 
	
										vals = stmtchk.executeUpdate(sql33);
	
										if(vals<=0)
										{
											conn.close();
											 tempnw="0";
	
										}
										else{
											 tempnw="1";
										}
										
									 
										if(!prdcost.equalsIgnoreCase("")){
											
											 int acnos3=0;
												String curris3="1";
												double rates3=1;
	
	
	
												String sql44="select  acno from my_account where codeno='ABSORPTION ACCOUNT' ";
												//System.out.println("-----4--sql2----"+sql2) ;
	
												ResultSet tass5 = stmtchk.executeQuery (sql44);
	
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
														+ "values('"+sqlprocessdate+"','"+refdetails+"',"+workno+",'"+acnos3+"','"+refdetails+"','"+curris3+"','"+rates3+"',"+pricetottal3+","+ldramounts3+",0,1,6,0,0,0,'"+rates3+"','MNF',"+brhid+","+trno+",3,"+sorddoc+",'FIL')";
	
									/*			}
												else
												{
	
													  sql11="insert into my_jvtran(date,ref_detail,doc_no,acno,description,curId,rate,dramount,ldramount,out_amount,id,trtype,ref_row,LAGE,cldocno,lbrrate,costtype,costcode,dTYPE,brhId,tr_no,STATUS)   "
															+ "values('"+masterdate+"','"+refdetails+"',"+docno+",'"+acnos+"','"+refdetails+"','"+curris+"','"+rates+"',"+pricetottal+","+ldramounts+",0,1,6,0,0,0,'"+rates+"',0,0,'GIR','"+session.getAttribute("BRANCHID").toString()+"',"+trno+",3)";
										
												}*/
												// System.out.println("---sql11----"+sql11) ; 
												 System.out.println("---jvtranabsorptionaccount----"+sql55) ; 
												vals = stmtchk.executeUpdate(sql55);
	
												if(vals<=0)
												{
													conn.close();
													 tempnw="0";
	
												}
												else{
													 tempnw="1";
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
									
	
										  sql11="insert into my_jvtran(date,ref_detail,doc_no,acno,description,curId,rate,dramount,ldramount,out_amount,id,trtype,ref_row,LAGE,cldocno,lbrrate,dTYPE,brhId,tr_no,STATUS,rdocno,rtype)   "
												+ "values('"+sqlprocessdate+"','"+refdetails+"',"+workno+",'"+acnos+"','"+refdetails+"','"+curris+"','"+rates+"',"+pricetottal+","+ldramounts+",0,1,6,0,0,0,'"+rates+"','MNF',"+brhid+","+trno+",3,"+sorddoc+",'FIL')";
	
							
										// System.out.println("---sql11----"+sql11) ; 
										System.out.println("---jvtranstockaccount----"+sql11) ; 
										vals = stmtnw.executeUpdate(sql11);
										System.out.println("---stockval----"+val) ; 
										if(vals<=0)
										{
											conn.close();
											 tempnw="0";
	
										}
										else{
											 tempnw="1";
										}
									  String sqltst5="update my_prdupdate set trno="+trno+" where orderno="+workno+" and opsrno="+mpsrno+" and type='"+ordertype+"'";
									 vals=stmtnw.executeUpdate(sqltst5);
									 System.out.println("---prdupdateval----"+vals) ;
									 if(vals<=0)
										{
											conn.close();
											 tempnw="0";
	
										} 
									 else{
										 tempnw="1";
									}
									 String sqltst6="";
									 if(ordertype.equalsIgnoreCase("SOR")){
										  sqltst6="update my_sorderd set fillqty="+sorqty+",mnfbranch="+brhid+",mnflocation="+locid+" where rdocno="+workno+" and psrno="+mpsrno+"";
										 
									 }
                                     if(ordertype.equalsIgnoreCase("STKO")){
                                    	  sqltst6="update my_stockorderd set fillqty="+sorqty+" ,mnfbranch="+brhid+",mnflocation="+locid+" where rdocno="+workno+" and psrno="+mpsrno+"";
										 
									 }
                                     vals=stmtnw.executeUpdate(sqltst6);
									 System.out.println("---orderupdate----"+vals) ;
									 if(vals<=0)
										{
											conn.close();
											 tempnw="0";
	
										} 
									 else{
										 tempnw="1";
									}
									String upsql="insert into my_workorderlog (type,brhId, logdate, userid, workorderno,description) values ('FILL','"+brhid+"',now(),'"+session.getAttribute("USERID").toString()+"',"+workno+",'Filling Completed')";
									 vals= stmtnw.executeUpdate(upsql);
									 if(vals<=0)
										{
											conn.close();
											 tempnw="0";
	
										}
									 else{
										 tempnw="1";
									 }
									 
									 
									
						 
						 
						 
						 
						 
						 }
						 else{
								conn.close();
								 tempnw="0";
						 }
						 
			 }
			 else{
					conn.close();
					 tempnw="0";
			 }
			 
			 
			 
			 
			 if(Integer.parseInt(tempnw)>0){ 
				// conn.commit();
				 }
    stmt.close();
		 
	conn.close();
	 response.getWriter().print(tempnw+" :: "+BOvoc+" :: "+doc+" :: "+availbal);
    	
    }
    catch(Exception e)
    {
    	e.printStackTrace();
    	
    	
    	conn.close();
    	 response.getWriter().print(tempnw+" :: "+BOvoc+" :: "+doc+" :: "+availbal);
    }
	 finally{
		 conn.close();
	 }
	 	
	 	
%>



 