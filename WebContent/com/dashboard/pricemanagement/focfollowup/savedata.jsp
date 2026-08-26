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
String list=request.getParameter("list")==null?"0":request.getParameter("list");
 
String docno=request.getParameter("docno")==null||request.getParameter("docno")==""?"0":request.getParameter("docno");
String dates=request.getParameter("date")==null||request.getParameter("date")==""?"0":request.getParameter("date");
String refnos=request.getParameter("refnos")==null||request.getParameter("refnos")==""?"0":request.getParameter("refnos");
String totvalue=request.getParameter("totvalue")==null||request.getParameter("totvalue")==""?"0":request.getParameter("totvalue");
String cnvalue=request.getParameter("cnvalue")==null||request.getParameter("cnvalue")==""?"0":request.getParameter("cnvalue");
String balance=request.getParameter("balance")==null||request.getParameter("balance")==""?"0":request.getParameter("balance");

String types=request.getParameter("types")==null||request.getParameter("types")==""?"0":request.getParameter("types");


 
java.sql.Date date = null;
	if(!(dates.equalsIgnoreCase("undefined"))&&!(dates.equalsIgnoreCase(""))&&!(dates.equalsIgnoreCase("0")))
	{
		date=ClsCommon.changeStringtoSqlDate(dates);
		
	}
	else{

	}


ArrayList<String> pmgntarray= new ArrayList<String>();
String aa[]=list.split(",");
 
	 
for(int i=0;i<aa.length;i++){
	// System.out.println("----------"+aa[i]);
	 String bb[]=aa[i].split("::");
	  
	 String temp="";
	 for(int j=0;j<bb.length;j++){ 
		 
		//  System.out.println("----------"+bb[j]);
		 temp=temp+bb[j]+"::";
		 
	}
	 pmgntarray.add(temp);
	 
} 
 
	  Connection conn=null;
	    String sql="";
	    try
	    {
	   	
	    	
	    	
	    	
	    	
	    
	    conn = ClsConnection.getMyConnection();
	    conn.setAutoCommit(false);
		Statement stmt = conn.createStatement();
		
		
 
				String invno="";
				String invdate="";
				String vocno="";
				int vendocno=0;
				int brhid=1;
				int locationid=1;
				String sqls3=" select brhid,refinvno,refinvdate,voc_no,acno,locid from my_srvm where doc_no="+docno+" ";
				
				ResultSet rss3=stmt.executeQuery(sqls3);
				if(rss3.next())
				{
					
					brhid=rss3.getInt("brhid");
					invno=rss3.getString("refinvno");
					invdate=rss3.getString("refinvdate");
					vocno=rss3.getString("voc_no");
					vendocno=rss3.getInt("acno");
					locationid=rss3.getInt("locid");
				}
				
				
				 
				
				
				
		
		int docnos=0;
		
		String sqls="select coalesce(max(doc_no)+1,1) docnos from my_bfocfm ";
		
		ResultSet rss=stmt.executeQuery(sqls);
		if(rss.next())
		{
			
			docnos=rss.getInt("docnos");
		}
		
	   int tr_no=0;
		
		String sqlss="select max(trno)+1 trno from my_trno ";
		
		ResultSet rsss=stmt.executeQuery(sqlss);
		if(rsss.next())
		{
			
			tr_no=rsss.getInt("trno");
		}
		
		   String sql25 = "insert into my_trno(edate,trtype,brhId,USERNO,trno) values('"+date+"',1,"+brhid+","+session.getAttribute("USERID").toString()+","+tr_no+")";
			  stmt.executeUpdate(sql25);
		
			  
			  
			  
			  
		
	      sql="INSERT INTO my_bfocfm(doc_no, tr_no, pdocno, type, date, refno, tvalue, cnvalue, balance, userid, brhid,locid)VALUES"
			       + " ("+docnos+","
			       + " '"+tr_no+"',"
			       + " '"+docno+"',"
			       + " '"+types+"', '"+date+"', '"+refnos+"', "+totvalue+", "+cnvalue+", "+balance+",'"+session.getAttribute("USERID").toString()+"','"+brhid+"',"+locationid+")";
	    
	    //  System.out.println("sql="+sql);
	     int resultSet2 = stmt.executeUpdate(sql);
		     if(resultSet2<=0)
				{
					conn.close();
				 
					
				}
		     String updatesql1="update my_srvm set fstatus=1 where doc_no="+docno+" ";
			    stmt.executeUpdate(updatesql1); 
		
				int bachmethod=0;
				 Statement stmtw=conn.createStatement();
				 String batchs="select method  from gl_prdconfig where field_nme='batch_no'";
				 ResultSet rz=stmtw.executeQuery(batchs); 
				 if(rz.next())
				 {
				 	
					 bachmethod=rz.getInt("method");
				 }

					int expmethod=0;
					 Statement stmtd=conn.createStatement();
					 String expdatesql="select method  from gl_prdconfig where field_nme='exp_date'";
					 ResultSet exprs=stmtd.executeQuery(expdatesql); 
					 if(exprs.next())
					 {
					 	
						 expmethod=exprs.getInt("method");
					 }
		
		
		
		
		for(int k=0;k<pmgntarray.size();k++)
		{
		
                 
                System.out.println("---In---") ;
	 
		String[] pmgntarr=((String) pmgntarray.get(k)).split("::"); 
 
		String  psrno=""+(pmgntarr[0].trim().equalsIgnoreCase("undefined") || pmgntarr[0].trim().equalsIgnoreCase("NaN")|| pmgntarr[0].trim().equalsIgnoreCase("")|| pmgntarr[0].isEmpty()?0:pmgntarr[0].trim())+"";
		 
	 
		String  stockid=""+(pmgntarr[2].trim().equalsIgnoreCase("undefined") || pmgntarr[2].trim().equalsIgnoreCase("NaN")|| pmgntarr[2].trim().equalsIgnoreCase("")|| pmgntarr[2].isEmpty()?0:pmgntarr[2].trim())+"";
	 
		String  expfocrvds=""+(pmgntarr[3].trim().equalsIgnoreCase("undefined") || pmgntarr[3].trim().equalsIgnoreCase("NaN")|| pmgntarr[3].trim().equalsIgnoreCase("")|| pmgntarr[3].isEmpty()?0:pmgntarr[3].trim())+"";
		String  rowno=""+(pmgntarr[1].trim().equalsIgnoreCase("undefined") || pmgntarr[1].trim().equalsIgnoreCase("NaN")|| pmgntarr[1].trim().equalsIgnoreCase("")|| pmgntarr[1].isEmpty()?0:pmgntarr[1].trim())+"";
		 
		
	//	   listss.push(rows[i].psrno+"::"+rows[i].rowno+"::"+rows[i].stockid+"::"+rows[i].expfocrvd+"::"+rows[i].batch_no+"::"+rows[i].exp_date+"::"+rows[i].psrno);  
		
		String  batchno=""+(pmgntarr[4].trim().equalsIgnoreCase("undefined") || pmgntarr[4].trim().equalsIgnoreCase("NaN")|| pmgntarr[4].trim().equalsIgnoreCase("")|| pmgntarr[4].isEmpty()?0:pmgntarr[4].trim())+"";
		String  bexpiry=""+(pmgntarr[5].trim().equalsIgnoreCase("undefined") || pmgntarr[5].trim().equalsIgnoreCase("NaN")|| pmgntarr[5].trim().equalsIgnoreCase("")|| pmgntarr[5].isEmpty()?0:pmgntarr[5].trim())+"";
		
		   
		String  crfoc=""+(pmgntarr[6].trim().equalsIgnoreCase("undefined") || pmgntarr[6].trim().equalsIgnoreCase("NaN")|| pmgntarr[6].trim().equalsIgnoreCase("")|| pmgntarr[6].isEmpty()?0:pmgntarr[6].trim())+"";
		
		
		
	 
		double expfocrvd=Double.parseDouble(expfocrvds);
		
           double cost_price=0;
           
           
       
		
		String sqlp=" select cost_price from my_prddin where stockid="+stockid+" ";
		System.out.println("==1==sqlp="+sqlp);
		ResultSet rssp=stmt.executeQuery(sqlp);
		if(rssp.next())
		{
			
			cost_price=rssp.getDouble("cost_price");
 
		}
		
		
	     double  expfoc=0;
	 		double  expfocrv=0;
	 		double  saveexpfocrv=0;
			 int unitids=0;
			 int specno=0;
			 double unit_price=0;
			 
			String sqls34=" select expfocrvd,expfoc,unitid,specno,amount from my_srvd where rowno="+rowno+" ";
			
			ResultSet rss321=stmt.executeQuery(sqls34);
			if(rss321.next())
			{
				
				expfocrv=rss321.getDouble("expfocrvd");
				expfoc=rss321.getDouble("expfoc");
				unitids=rss321.getInt("unitid");
				specno=rss321.getInt("specno");
				unit_price=rss321.getDouble("amount");
				 
			}
			
			
	     
	     
	     if(types.equalsIgnoreCase("1"))
	     {  	 
			saveexpfocrv=expfocrv+expfocrvd;
			crfoc="0";
			
				
			}
	     else  if(types.equalsIgnoreCase("2"))
			{
	    		saveexpfocrv=expfoc;
	    	 
			}
	     String updatesql="update my_srvd set expfocrvd='"+saveexpfocrv+"' where rowno="+rowno+" ";
	     
	     
		    stmt.executeUpdate(updatesql);  
		
		
		    
		    
			
        double fr=1;
	     String slss=" select fr from my_unit where psrno="+psrno+" and unit="+unitids+" ";
	     
	     
	     ResultSet rv1=stmt.executeQuery(slss);
	     if(rv1.next())
	     {
	    	 fr=rv1.getDouble("fr"); 
	     }
	     int mainstockid=0;	
	     Date bexpirys=null;
	     if(!(expmethod==0|| bexpiry.equalsIgnoreCase("0")) )
	    		 {
	    	 bexpirys= ClsCommon.changeStringtoSqlDate(bexpiry);
	    		 }
	     
	     
	     if(types.equalsIgnoreCase("1"))
	     { 
		 String sql2="insert into my_prddin(sr_no, psrno,prdid,specno,unit_price,op_qty,locid,brhid,tr_no,dtype,cost_price,invno,pstatus,date,fr,unitid, batch_no, exp_date)values"
	    		 + "("+(k+1)+","
	             + "'"+psrno+"',"
			     + "'"+psrno+"',"
			     + "'"+specno+"',"
	               + "'"+unit_price/fr+"',"
			     +"'"+expfocrvd*fr+"',"
	             +"'"+locationid+"','"+brhid+"','"+tr_no+"','PIV',"+cost_price/fr+",'"+docnos+"',2,'"+date+"',"+fr+","+unitids+",'"+(bachmethod==0?0:batchno)+"',if('"+bexpirys+"'='null',"+null+",'"+bexpirys+"'))";
	      
	     int resultSet10 = stmt.executeUpdate(sql2);
	     if(resultSet10<=0)
			{
				conn.close();
			 
				
			}
		
	 
		    
         Statement selstmt=conn.createStatement();
     String sqlssel="select coalesce((max(stockid)),1) stockid from my_prddin  ";
     
  
     
     ResultSet selrss=selstmt.executeQuery(sqlssel);
     
     if(selrss.next())
     {
    	 mainstockid=selrss.getInt("stockid") ;
    	 
    	 
    	 
 	 
     }
	     }
	     else
	     {
	    	 expfocrvd=0; 
	     }
 
	      sql="INSERT INTO my_bfocfd(sr_no,rdocno, tr_no, psrno,rrowno, stockid,expfocrvd, refstockid, cost_price, batch_no, exp_date,fr,unitid,specno,crfoc)VALUES"
			       + " ("+(k+1)+","
			       + " '"+docnos+"',"	   
			       + " '"+tr_no+"',"
 			       + "'"+(pmgntarr[0].trim().equalsIgnoreCase("undefined") || pmgntarr[0].trim().equalsIgnoreCase("NaN")|| pmgntarr[0].trim().equalsIgnoreCase("")|| pmgntarr[0].isEmpty()?0:pmgntarr[0].trim())+"',"
			       + "'"+(pmgntarr[1].trim().equalsIgnoreCase("undefined") || pmgntarr[1].trim().equalsIgnoreCase("NaN")|| pmgntarr[1].trim().equalsIgnoreCase("")|| pmgntarr[1].isEmpty()?0:pmgntarr[1].trim())+"',"
			       + "'"+mainstockid+"',"
	      		   + " '"+expfocrvd+"' ,"
	      		   + "'"+stockid+"','"+cost_price+"','"+(bachmethod==0?0:batchno)+"',if('"+bexpirys+"'='null',"+null+",'"+bexpirys+"'),'"+fr+"','"+unitids+"','"+specno+"','"+crfoc+"')";
	    //  System.out.println("sql="+sql);
	    
	   
	     int resultSet21 = stmt.executeUpdate(sql);
		     if(resultSet21<=0)
				{
					conn.close();
				 
					
				}
 
		     
		     
		 
		      
		}
		
		
		double totvalues=Double.parseDouble(totvalue);
		
		String descs="INV-"+""+invno+""+":-Dated :- "+invdate; 
		
		String refdetails="PIV"+""+vocno;
		
		
		if(types.equalsIgnoreCase("1") || types.equalsIgnoreCase("2"))
		{
				      int facnos=0;
				     String fcurris="1";
				     double frates=1; 
				     
					   String sql22="select acno from my_account where codeno='FOCREC' ";
					   
			
				       ResultSet tass12 = stmt.executeQuery (sql22);
						
						if (tass12.next()) {
					
							facnos=tass12.getInt("acno");		
							
					        } 
			 
			
						
						 String sqls31="select h.curid,round(c.c_rate,2) rate from my_head h left join my_curr c on c.doc_no=h.curid where h.doc_no='"+facnos+"'";
						  
						   ResultSet tass33 = stmt.executeQuery (sqls31);
							
							if (tass33.next()) {
						
								fcurris=tass33.getString("curid");	
							 
								
						              }
							String currencytype11="";
							 String sqlfff = "select a.rate,a.type from my_curbook a inner join (select max(cb.doc_no) doc_no,cb.curid curid,cb.toDate,cb.frmDate from my_curbook cb "
								        +"where  coalesce(toDate,curdate())>='"+date+"' and frmDate<='"+date+"' group by cb.curid) as b on(a.doc_no=b.doc_no and a.curid=b.curid) where a.curid='"+fcurris+"'";
							 //System.out.println("-----6--sqlveh----"+sqlveh) ;
								     ResultSet resultSet441 = stmt.executeQuery(sqlfff);
								         
								      while (resultSet441.next()) {
								    	  
								    	  frates=resultSet441.getDouble("rate");
								      currencytype11=resultSet441.getString("type");
								                 } 
								      
								      if(frates==0)
								      {
								    	  frates=1;  
								      }
							 
								      double pricetottalexp=(totvalues*-1);
								      double ldramountsexp=0 ;     
								      if(currencytype11.equalsIgnoreCase("D"))
								      {
								      
								    	  ldramountsexp=pricetottalexp/frates ;  
								      }
								      
								      else
								      {
								    	  ldramountsexp=pricetottalexp*frates ;  
								      }
					     
						 String sql121="insert into my_jvtran(date,ref_detail,doc_no,acno,description,curId,rate,dramount,ldramount,out_amount,id,trtype,ref_row,LAGE,cldocno,lbrrate,costtype,costcode,dTYPE,brhId,tr_no,STATUS)   "
							 		+ "values('"+date+"','"+refdetails+"',"+docno+",'"+facnos+"','"+descs+"','"+fcurris+"','"+frates+"',round("+pricetottalexp+",2),round("+ldramountsexp+",2),0,-1,3,0,0,0,'"+frates+"',0,0,'PIV',"+brhid+","+tr_no+",3)";
					     
					     
						 
					 
							 int ss12 = stmt.executeUpdate(sql121);
			
						     if(ss12<=0)
								{
									conn.close();
									 
									
								}
						     
		}   
		
		if(types.equalsIgnoreCase("1"))
		{
			     
			     
		
								    
								     int acnos=0;
								     String curris="1";
								     double rates=1;
								     
								    
								     
								   String sql2="select  acno from my_account where codeno='STOCK ACCOUNT' ";
								   //System.out.println("-----4--sql2----"+sql2) ;
							
							      ResultSet tass1 = stmt.executeQuery (sql2);
									
									if (tass1.next()) {
								
										acnos=tass1.getInt("acno");		
										
								        }
									
									
									
									 String sq2ls3="select h.curid,round(c.c_rate,2) rate from my_head h left join my_curr c on c.doc_no=h.curid where h.doc_no='"+acnos+"'";
									   //System.out.println("-----5--sqls3----"+sqls3) ;
									   ResultSet tass3 = stmt.executeQuery (sq2ls3);
										
										if (tass3.next()) {
									
											curris=tass3.getString("curid");	
											 
											
									              }
										String currencytype1="";
										 String sqlveh = "select a.rate,a.type from my_curbook a inner join (select max(cb.doc_no) doc_no,cb.curid curid,cb.toDate,cb.frmDate from my_curbook cb "
											        +"where  coalesce(toDate,curdate())>='"+date+"' and frmDate<='"+date+"' group by cb.curid) as b on(a.doc_no=b.doc_no and a.curid=b.curid) where a.curid='"+curris+"'";
										 //System.out.println("-----6--sqlveh----"+sqlveh) ;
											     ResultSet resultSet44 = stmt.executeQuery(sqlveh);
											         
											      while (resultSet44.next()) {
											    	  rates=resultSet44.getDouble("rate");
											      currencytype1=resultSet44.getString("type");
											                 } 
										 
											      double pricetottal=totvalues;
											      double ldramounts=0 ;     
											      if(currencytype1.equalsIgnoreCase("D"))
											      {
											      
									                   ldramounts=pricetottal/rates ;  
											      }
											      
											      else
											      {
											    	   ldramounts=pricetottal*rates ;  
											      }
								     
									 String sql11="insert into my_jvtran(date,ref_detail,doc_no,acno,description,curId,rate,dramount,ldramount,out_amount,id,trtype,ref_row,LAGE,cldocno,lbrrate,costtype,costcode,dTYPE,brhId,tr_no,STATUS)   "
										 		+ "values('"+date+"','"+refdetails+"',"+docno+",'"+acnos+"','"+descs+"','"+curris+"','"+rates+"',round("+pricetottal+",2),round("+ldramounts+",2),0,1,3,0,0,0,'"+rates+"',0,0,'PIV','"+brhid+"',"+tr_no+",3)";
								     
								     
									  
								 
										 int ss1 = stmt.executeUpdate(sql11);
							
									     if(ss1<=0)
											{
												conn.close();
												 
												
											}
									     
									     
									
		}
		
		
		
		else if(types.equalsIgnoreCase("2"))
		{
			
			
			 
			  int	venderaccount=vendocno;
			 
		      
			 
			 String vendorcur="1"; 
			 double venrate=1;
			 
			 String sqls10="select h.curid,round(c.c_rate,2) rate from my_head h left join my_curr c on c.doc_no=h.curid where h.doc_no='"+venderaccount+"'";
				//System.out.println("---1----sqls10----"+sqls10) ;
			   ResultSet tass11 = stmt.executeQuery (sqls10);
			   if(tass11.next()) {
			
				   vendorcur=tass11.getString("curid");	
				 
					
			        }
			 
			 
		     String currencytype="";
		     String sqlvenselect = "select a.rate,a.type from my_curbook a inner join (select max(cb.doc_no) doc_no,cb.curid curid,cb.toDate,cb.frmDate from my_curbook cb "
		        +"where  coalesce(toDate,curdate())>='"+date+"' and frmDate<='"+date+"' group by cb.curid) as b on(a.doc_no=b.doc_no and a.curid=b.curid) where a.curid='"+vendorcur+"'";
		     //System.out.println("-----2--sqlss----"+sqlss) ;
		     ResultSet resultSet33 = stmt.executeQuery(sqlvenselect);
		         
		      while (resultSet33.next()) {
		    	  venrate=resultSet33.getDouble("rate");
		     currencytype=resultSet33.getString("type");
		                      }
		   
			   double	dramount=(Double.parseDouble(cnvalue)); 
			   
				 
			   double ldramount=0;
			   if(currencytype.equalsIgnoreCase("D"))
			   {
			   
	           	
	           	 ldramount=dramount/venrate ;  
			   }
			   
			   else
			   {
				    ldramount=dramount*venrate ;  
			   }
			   
       		   if(dramount!=0)
         		 {
        		 String sql1="insert into my_jvtran(date,ref_detail,doc_no,acno,description,curId,rate,dramount,ldramount,out_amount,id,trtype,ref_row,LAGE,cldocno,lbrrate,costtype,costcode,dTYPE,brhId,tr_no,STATUS)   "
     			 		+ "values('"+date+"','"+refdetails+"',"+docno+",'"+venderaccount+"','"+descs+"','"+vendorcur+"','"+venrate+"',round("+dramount+",2),round("+ldramount+",2),0,1,3,0,0,0,'"+venrate+"',0,0,'PIV','"+brhid+"',"+tr_no+",3)";
     		     
     			 	 
     			 int ss = stmt.executeUpdate(sql1);

    		     if(ss<=0)
    				{
    					conn.close();
    					 
    					
    				}
         		}
			
			
			
		     
		     String clsql=" select cldocno from my_head where dtype='VND' and doc_no='"+venderaccount+"'";
		     
		 //   System.out.println("========clsql=========="+clsql);
		    ResultSet clrs= stmt.executeQuery(clsql);
		    
		    int vndcldocno=0;
		    if(clrs.next())
		    {
		    	vndcldocno=clrs.getInt("cldocno");
		    }
		     
		     
		     if(vndcldocno>0)
		     {
		    	 
		    	String sql1ss="update my_jvtran set cldocno='"+vndcldocno+"'  where acno='"+venderaccount+"' and tr_no='"+tr_no+"' and status=3  ";
		    	
		    	// System.out.println("========sql1ss=========="+sql1ss);
		    	stmt.executeUpdate(sql1ss);
		    	
		     }
			
			
		     
		     
		     
		     double jvdramount=Double.parseDouble(balance) ;
		     int id=0;
		     int adjustacno=0;
		     
		     String adjustcurrid="1";
		     
		     
		     double adjustcurrate=1;
		     
		/* 	 String jvselect="SELECT sum(dramount) dramount from my_jvtran where tr_no='"+mastertr_no+"'";
			   //System.out.println("-----5--sqls3----"+sqls3) ;
			   ResultSet jvrs = stmt.executeQuery (jvselect);
				
				if (jvrs.next()) {
			
					jvdramount=jvrs.getDouble("dramount");	
					 
					
			              } */
			 
				if(jvdramount>0 || jvdramount<0)
				{
					
					// System.out.println("--innnnnnnnnnnnnnnnnnnnnnnnnnnnn==---****"+jvdramount) ;	
					if(jvdramount>0)
					{
						id=1;
							
						
					}
					
					else
					{
						
						id=-1;
					}
					
					
					
				     
					   String sqls2="select  acno from my_account where codeno='STOCK ADJUSTMENT ACCOUNT' ";
					   //System.out.println("-----4--sql2----"+sql2) ;

				       ResultSet adjaccount = stmt.executeQuery (sqls2);
						
						if (adjaccount.next()) {
					
							adjustacno=adjaccount.getInt("acno");		
							
					        }
						
						
					
						 String expsqls3="select h.curid,round(c.c_rate,2) rate from my_head h left join my_curr c on c.doc_no=h.curid where h.doc_no='"+adjustacno+"'";
						   //System.out.println("-----5--sqls3----"+sqls3) ;
						   ResultSet exptass3 = stmt.executeQuery (expsqls3);
							
							if (exptass3.next()) {
						
								adjustcurrid=exptass3.getString("curid");	
								 
								
						              }
							String adjustcurrencytype1="";
							 String adjustsql = "select a.rate,a.type from my_curbook a inner join (select max(cb.doc_no) doc_no,cb.curid curid,cb.toDate,cb.frmDate from my_curbook cb "
								        +"where  coalesce(toDate,curdate())>='"+date+"' and frmDate<='"+date+"' group by cb.curid) as b on(a.doc_no=b.doc_no and a.curid=b.curid) where a.curid='"+adjustcurrid+"'";
							// System.out.println("---adjustsql----"+adjustsql) ;
								     ResultSet resultadj = stmt.executeQuery(adjustsql);
								         
								      while (resultadj.next()) {
								    	  adjustcurrate=resultadj.getDouble("rate");
								    	  adjustcurrencytype1=resultadj.getString("type");
								                 } 
								      
								      
								      double adjustldramounts=0 ;     
								      if(adjustcurrencytype1.equalsIgnoreCase("D"))
								      {
								      
								    	  adjustldramounts=jvdramount/adjustcurrate ;  
								      }
								      
								      else
								      {
								    	  adjustldramounts=jvdramount*adjustcurrate ;  
								      }
					
					
								      
								      
								      
								      String adjustsql11="insert into my_jvtran(date,ref_detail,doc_no,acno,description,curId,rate,dramount,ldramount,out_amount,id,trtype,ref_row,LAGE,cldocno,lbrrate,costtype,costcode,dTYPE,brhId,tr_no,STATUS)   "
										 		+ "values('"+date+"','"+refdetails+"',"+docno+",'"+adjustacno+"','"+descs+"','"+adjustcurrid+"','"+adjustcurrate+"',round("+jvdramount+",2),round("+adjustldramounts+",2),0,'"+id+"',3,0,0,0,'"+adjustcurrate+"',0,0,'PIV','"+brhid+"',"+tr_no+",3)";
								     
								     
									 
								 
										 int result1 = stmt.executeUpdate(adjustsql11);

									     if(result1<=0)
											{
												conn.close();
											 
												
											}
									     	    
		     
		     
				}
			
			
			
		}
		
     String upsql="insert into gl_biblog (doc_no, brhId, dtype, edate, userId, ENTRY) values ("+docnos+",'"+brhid+"','BFOCF',now(),'"+session.getAttribute("USERID").toString()+"','A')";
	 int aaa= stmt.executeUpdate(upsql);
     conn.commit();
     stmt.close();
	 conn.close();
	 response.getWriter().print(1);
    }
    catch(Exception e)
    {
    	e.printStackTrace();
    	
    	
    	conn.close();
    	 response.getWriter().print(2);
    }
	 	
	 	
	 	
%>



 