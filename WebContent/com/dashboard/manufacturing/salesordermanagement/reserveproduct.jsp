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
<%@page import="com.procurement.purchase.purchaserequest.ClsPurchaserequestDAO"%> 
<%@page import="com.procurement.purchase.purchaseorder.ClspurchaseorderDAO"%> 
<%@page import="java.text.SimpleDateFormat" %>  
<%	
ClsConnection ClsConnection=new ClsConnection();

ClsCommon ClsCommon=new ClsCommon();

	Connection conn = null;
	Statement stmt=null;
	ClsPurchaserequestDAO sdao= new ClsPurchaserequestDAO();
	ClspurchaseorderDAO orderobj= new ClspurchaseorderDAO();

	try{
	 	conn = ClsConnection.getMyConnection();
	 	
		stmt = conn.createStatement();
		
		SimpleDateFormat sdf = new SimpleDateFormat("dd.MM.yyyy");
		String dt=sdf.format(new java.util.Date());
		java.sql.Date sqlDate= ClsCommon.changeStringtoSqlDate(dt);
		
		
		String purchasestrarray=request.getParameter("purchasearray")==null?"":request.getParameter("purchasearray");
		String purchaserequestarray=request.getParameter("purchaserequestarray")==null?"":request.getParameter("purchaserequestarray");
		String purchaseorderarray=request.getParameter("purchaseorderarray")==null?"":request.getParameter("purchaseorderarray");
		String estimationrequestarray=request.getParameter("estimationrequestarray")==null?"":request.getParameter("estimationrequestarray");
		String estimationorderarray=request.getParameter("estimationorderarray")==null?"":request.getParameter("estimationorderarray");
		String contocno=request.getParameter("contocno")==null?"":request.getParameter("contocno");
		String conttrno=request.getParameter("conttrno")==null?"":request.getParameter("conttrno");
		String ordernet1=request.getParameter("ordernet")==null?"0":request.getParameter("ordernet");
		String ordertot1=request.getParameter("ordertot")==null?"0":request.getParameter("ordertot");
		String vendor1=request.getParameter("vendor")==null?"0":request.getParameter("vendor");
		String type=request.getParameter("dtype")==null?"0":request.getParameter("dtype");
		double ordernet=Double.parseDouble(ordernet1);
		double ordertot=Double.parseDouble(ordertot1);
		int vendor=Integer.parseInt(vendor1);
		String click=request.getParameter("click")==null?"":request.getParameter("click");
		System.out.println("click=="+click);
	    System.out.println("purchasestrarray=="+purchasestrarray);
	    System.out.println("purchaserequestarray=="+purchaserequestarray);
 String sql="",sqlsub="",sql1="",sqltrno="",sqltrnosel="",sqlmatsel="";
 String rowno="0",resqty="0",purqty="0",brhid="0",psrnos="0",specno="0",locid="",costdocno="",tr_no="0",voc="0",dresqty="0",stock="0";
 String temp="0";
 int val=0;
 int p=0;
 int mytrno=0;
 double matresqty=0;
 double masterqty=0;
	double matpurqty=0;
	double reservqty=0,reservqtynw=0,dreservqtynw=0;
	double resqty1=0;
	ArrayList<String> pmgntarray= new ArrayList<String>();
	String sqlestsel="";
	double masterreqqty=0;
	double masterreserveqty=0;
	if(click.equalsIgnoreCase("reserve")){
		 conn.setAutoCommit(false);
 String splt[]=purchasestrarray.split(","); 
 
 for(int i=0;i<splt.length;i++){
		System.out.println("----------"+splt[i]);
		 String bb[]=splt[i].split("::");
		  
		 String tempk="";
		 for(int j=0;j<bb.length;j++){ 
			 
			 System.out.println("----------"+bb[j]);
			 tempk=tempk+bb[j]+"::";
			 
		}
		 pmgntarray.add(tempk);
		 
	} 
 for(int i=0;i<pmgntarray.size();i++)
 {
	 masterreserveqty=0;
	 String data[]=((String) pmgntarray.get(i)).split("::"); 
	 rowno=data[0].trim().equalsIgnoreCase("undefined") || data[0].trim().equalsIgnoreCase("NaN")|| data[0].trim().equalsIgnoreCase("")|| data[0].isEmpty()?"0":data[0].trim();
	 resqty=data[1].trim().equalsIgnoreCase("undefined") || data[1].trim().equalsIgnoreCase("NaN")|| data[1].trim().equalsIgnoreCase("")|| data[1].isEmpty()?"0":data[1].trim();
	 purqty=data[2].trim().equalsIgnoreCase("undefined") || data[2].trim().equalsIgnoreCase("NaN")|| data[2].trim().equalsIgnoreCase("")|| data[2].isEmpty()?"0":data[2].trim();
	 brhid=data[3].trim().equalsIgnoreCase("undefined") || data[3].trim().equalsIgnoreCase("NaN")|| data[3].trim().equalsIgnoreCase("")|| data[3].isEmpty()?"0":data[3].trim();
	 psrnos=data[4].trim().equalsIgnoreCase("undefined") || data[4].trim().equalsIgnoreCase("NaN")|| data[4].trim().equalsIgnoreCase("")|| data[4].isEmpty()?"0":data[4].trim();
	 specno=data[5].trim().equalsIgnoreCase("undefined") || data[5].trim().equalsIgnoreCase("NaN")|| data[5].trim().equalsIgnoreCase("")|| data[5].isEmpty()?"0":data[5].trim();
	 locid=data[6].trim().equalsIgnoreCase("undefined") || data[6].trim().equalsIgnoreCase("NaN")|| data[6].trim().equalsIgnoreCase("")|| data[6].isEmpty()?"0":data[6].trim();
	
	 costdocno=data[7].trim().equalsIgnoreCase("undefined") || data[7].trim().equalsIgnoreCase("NaN")|| data[7].trim().equalsIgnoreCase("")|| data[7].isEmpty()?"0":data[7].trim();
	 tr_no=data[8].trim().equalsIgnoreCase("undefined") || data[8].trim().equalsIgnoreCase("NaN")|| data[8].trim().equalsIgnoreCase("")|| data[8].isEmpty()?"0":data[8].trim();
	 voc=data[9].trim().equalsIgnoreCase("undefined") || data[9].trim().equalsIgnoreCase("NaN")|| data[9].trim().equalsIgnoreCase("")|| data[9].isEmpty()?"0":data[9].trim();
	 dresqty=data[10].trim().equalsIgnoreCase("undefined") || data[10].trim().equalsIgnoreCase("NaN")|| data[10].trim().equalsIgnoreCase("")|| data[10].isEmpty()?"0":data[10].trim();
	 stock=data[11].trim().equalsIgnoreCase("undefined") || data[11].trim().equalsIgnoreCase("NaN")|| data[11].trim().equalsIgnoreCase("")|| data[11].isEmpty()?"0":data[11].trim();
	 //  purchasearray.push(rowno+"::"+resqty+"::"+purqty+"::"+brhid+"::"+psrno+"::"+specid+"::"+locid+"::"+costdocno+"::");
	  System.out.println("stock==="+stock);
			         System.out.println("stocklength==="+stock.length());
	 masterqty=Double.parseDouble(purqty);
	 masterreqqty=masterqty;
	 
	reservqty=Double.parseDouble(resqty);
	masterreserveqty=Double.parseDouble(resqty);
	dreservqtynw=Double.parseDouble(dresqty);
	//System.out.println("masterqty====="+masterqty);
		if(stock.equalsIgnoreCase("0")) {
	sqltrno="insert into my_trno(USERNO, TRTYPE, brhId, edate, transid) values("+session.getAttribute("USERID").toString()+",'SOM',"+session.getAttribute("BRANCHID").toString()+",curdate(),0)";
		// System.out.println("sqltrno====="+sqltrno);
		 stmt.executeUpdate(sqltrno);
		
		sqltrnosel="select max(trno) mytrno from my_trno";
		ResultSet rstrno = stmt.executeQuery(sqltrnosel);
		while(rstrno.next()) {
			
			mytrno=rstrno.getInt("mytrno");
		}
 double delqtys=0;
	double balstkqty=0;
   int psrno=0;
	double ckkqty=0;
	int stockid=0;
	double remstkqty=0;
	double outstkqty=0;
	double stkqty=0;
	double qty=0;
	double detqty=0;
	double focmasterqty=0.0;
	int locidss=0,qrychk=0;

	String stkSql="select locid,stockid,psrno,specno,sum(op_qty) stkqty,sum((op_qty-(rsv_qty+out_qty+del_qty))) balstkqty,"
			+ " (rsv_qty+out_qty+del_qty) out_qty,rsv_qty as qty,date from my_prddin "
			+ "where psrno="+psrnos+" and specno="+specno+" and prdid="+psrnos+" and brhid="+brhid+" "
			+ "group by stockid,prdid,psrno having sum((op_qty-(rsv_qty+out_qty+del_qty)))>0 order by date,stockid";

	System.out.println("=stkSql======11=======inside insert="+stkSql);

	ResultSet rsstk = stmt.executeQuery(stkSql);
	
	 
	

  	while(rsstk.next()) {
		//System.out.println("---loop---"+p++);
        qrychk=1;
		balstkqty=rsstk.getDouble("balstkqty");
		psrno=rsstk.getInt("psrno");
		outstkqty=rsstk.getDouble("out_qty");
		stockid=rsstk.getInt("stockid");
		stkqty=rsstk.getDouble("stkqty");
		qty=rsstk.getDouble("qty");
		locidss=rsstk.getInt("locid");
  	}
		/* System.out.println("---focmasterqty-----"+focmasterqty);	
		System.out.println("---balstkqty-----"+balstkqty);	
		System.out.println("---out_qty-----"+outstkqty);	
		System.out.println("---stkqty-----"+stkqty);*/
		System.out.println("---availablereservedqty-----"+qty); 

		focmasterqty=masterqty;
		if((reservqty>0) && (qrychk==1))
		{
			reservqtynw=reservqty;
			if(qty>0){
				reservqty=qty+reservqty;
				dreservqtynw=dreservqtynw+reservqtynw;
			}else{
				dreservqtynw=dreservqtynw+reservqtynw;
			}
			String sqsnw="";
			if(type.equalsIgnoreCase("SOR")){
		    sqsnw="update my_sorderd set reserveqty="+dreservqtynw+" where rdocno="+costdocno+" ";
			System.out.println("--1---inupdatemy_sorderd---"+sqsnw);
			}
			if(type.equalsIgnoreCase("STKO")){
			    sqsnw="update my_stockorderd set reserveqty="+dreservqtynw+" where rdocno="+costdocno+" ";
				System.out.println("--1---inupdatemy_stockorderd---"+sqsnw);
				}
			int	updt2=stmt.executeUpdate(sqsnw);
			if(updt2>0){
				val=1;
			}else{
				conn.close();
				temp="0";
			}
			
			
			String sqs="update my_prddin set rsv_qty="+reservqty+" where stockid="+stockid+" and prdid="+psrnos+" and  psrno="+psrnos+" and specno="+specno+"";
			System.out.println("--1---inupdate---"+sqs);
			int	updt=stmt.executeUpdate(sqs);
			if(updt>0){
				val=1;
			}else{
				conn.close();
				temp="0";
			}
			
			
			String prodoutsql="insert into my_prddout(sr_no,TR_NO, date,dtype, rdocno,stockid, specid, psrno,rsv_qty,prdid,brhid,locid,unit_price) Values"
					+ " ("+(p+1)+","+mytrno+",curdate(),'SOM',"+costdocno+","
					+ "'"+stockid+"',"
					+ ""+specno+","
					+ ""+psrnos+","
					+ "'"+reservqtynw+"',"
					+ ""+psrnos+","
					+""+brhid+","+locidss+",0)";

			 System.out.println("prodoutsql--->>>>Sql"+prodoutsql);
		int	prodout = stmt.executeUpdate (prodoutsql);
		if(prodout>0){
			val=1;
		}else{
			conn.close();
			temp="0";
		}
		  
		
		String prodreqsql="insert into my_prddr(sr_no,voc_no,TR_NO, date,dtype, rdocno,stockid, specid, psrno,rsv_qty,prdid,brhid,locid,unit_price,cost_price) Values"
				+ " ("+(p+1)+","+voc+","+mytrno+",curdate(),'SOM',"+costdocno+","
				+ "'"+stockid+"',"
				+ ""+specno+","
				+ ""+psrnos+","
				+ "'"+reservqtynw+"',"
				+ ""+psrnos+","
				+""+brhid+","+locidss+",0,0)";

		 System.out.println("prodreqsql--->>>>Sql"+prodreqsql);
	int	prodreq = stmt.executeUpdate (prodreqsql);
	if(prodreq>0){
		val=1;
	}else{
		conn.close();
		temp="0";
	}
		}
		else{
			temp="2";
		}
		
		
		
		
	
	
  	System.out.println("results--->>>>Sql"+val+"===temp=="+temp);
		}
		else {
	 		 ArrayList<String> pmgntarray2= new ArrayList<String>();
			    String aa[]=stock.split("@@@");
			    String BOvoc="0";
			    	 
			    for(int k=0;k<aa.length;k++){
			    	System.out.println("----------"+aa[k]);
			    	 String bb[]=aa[k].split("@@");
			    	  
			    	 String temp2="";
			    	 for(int j=0;j<bb.length;j++){ 
			    		 
			    		 System.out.println("----------"+bb[j]);
			    		 temp2=temp2+bb[j]+"::";
			    		
			    	}
			    	 System.out.println("----batchlist------"+temp2);
			    	 pmgntarray2.add(temp2);
			    	 
			    } 
	 		for(int b=0;b< pmgntarray2.size();b++){
				
				String[] batch=((String) pmgntarray2.get(b)).split("::");
				String batchno=""+(batch[0].trim().equalsIgnoreCase("undefined") || batch[0].trim().equalsIgnoreCase("NaN")|| batch[0].trim().equalsIgnoreCase("")|| batch[0].isEmpty()?0:batch[0].trim())+"";
				String derqty=""+(batch[1].trim().equalsIgnoreCase("undefined") || batch[1].trim().equalsIgnoreCase("NaN")|| batch[1].trim().equalsIgnoreCase("")|| batch[1].isEmpty()?0:batch[1].trim())+"";
				System.out.println("batch qty===="+derqty);
				sqltrno="insert into my_trno(USERNO, TRTYPE, brhId, edate, transid) values("+session.getAttribute("USERID").toString()+",'SOM',"+session.getAttribute("BRANCHID").toString()+",curdate(),0)";
				// System.out.println("sqltrno====="+sqltrno);
				 stmt.executeUpdate(sqltrno);
				
				sqltrnosel="select max(trno) mytrno from my_trno";
				ResultSet rstrno = stmt.executeQuery(sqltrnosel);
				while(rstrno.next()) {
					
					mytrno=rstrno.getInt("mytrno");
				}
		 double delqtys=0;
			double balstkqty=0;
		   int psrno=0;
			double ckkqty=0;
			int stockid=0;
			double remstkqty=0;
			double outstkqty=0;
			double stkqty=0;
			double qty=0;
			double detqty=0;
			double focmasterqty=0.0;
			int locidss=0,qrychk=0;

			String stkSql="select locid,stockid,psrno,specno,sum(op_qty) stkqty,sum((op_qty-(rsv_qty+out_qty+del_qty))) balstkqty,"
					+ " (rsv_qty+out_qty+del_qty) out_qty,rsv_qty as qty,date from my_prddin "
					+ "where batch_no='"+batchno+"' and psrno="+psrnos+" and specno="+specno+" and prdid="+psrnos+" and brhid="+brhid+" "
					+ "group by stockid,prdid,psrno having sum((op_qty-(rsv_qty+out_qty+del_qty)))>0 order by date,stockid";

			System.out.println("=stkSql======11=======inside insert="+stkSql);

			ResultSet rsstk = stmt.executeQuery(stkSql);
			
			 
			

		  	while(rsstk.next()) {
				//System.out.println("---loop---"+p++);
		        qrychk=1;
				balstkqty=rsstk.getDouble("balstkqty");
				psrno=rsstk.getInt("psrno");
				outstkqty=rsstk.getDouble("out_qty");
				stockid=rsstk.getInt("stockid");
				stkqty=rsstk.getDouble("stkqty");
				qty=rsstk.getDouble("qty");
				locidss=rsstk.getInt("locid");
		  	}
				/* System.out.println("---focmasterqty-----"+focmasterqty);	
				System.out.println("---balstkqty-----"+balstkqty);	
				System.out.println("---out_qty-----"+outstkqty);	
				System.out.println("---stkqty-----"+stkqty);*/
				System.out.println("---availablereservedqty-----"+qty); 

				focmasterqty=masterqty;
				if((reservqty>0) && (qrychk==1))
				{
					reservqtynw=reservqty;
					if(qty>0){
						reservqty=qty+reservqty;
						dreservqtynw=dreservqtynw+reservqtynw;
					}else{
						dreservqtynw=dreservqtynw+reservqtynw;
					}
					String sqsnw="";
					if(type.equalsIgnoreCase("SOR")){
				    sqsnw="update my_sorderd set reserveqty="+dreservqtynw+" where rdocno="+costdocno+" ";
					System.out.println("--1---inupdatemy_sorderd---"+sqsnw);
					}
					if(type.equalsIgnoreCase("STKO")){
					    sqsnw="update my_stockorderd set reserveqty="+dreservqtynw+" where rdocno="+costdocno+" ";
						System.out.println("--1---inupdatemy_stockorderd---"+sqsnw);
						}
					int	updt2=stmt.executeUpdate(sqsnw);
					if(updt2>0){
						val=1;
					}else{
						conn.close();
						temp="0";
					}
					
					
					String sqs="update my_prddin set rsv_qty="+reservqty+" where stockid="+stockid+" and prdid="+psrnos+" and  psrno="+psrnos+" and specno="+specno+"";
					System.out.println("--1---inupdate---"+sqs);
					int	updt=stmt.executeUpdate(sqs);
					if(updt>0){
						val=1;
					}else{
						conn.close();
						temp="0";
					}
					
					
					String prodoutsql="insert into my_prddout(sr_no,TR_NO, date,dtype, rdocno,stockid, specid, psrno,rsv_qty,prdid,brhid,locid,unit_price) Values"
							+ " ("+(p+1)+","+mytrno+",curdate(),'SOM',"+costdocno+","
							+ "'"+stockid+"',"
							+ ""+specno+","
							+ ""+psrnos+","
							+ "'"+reservqtynw+"',"
							+ ""+psrnos+","
							+""+brhid+","+locidss+",0)";

					 System.out.println("prodoutsql--->>>>Sql"+prodoutsql);
				int	prodout = stmt.executeUpdate (prodoutsql);
				if(prodout>0){
					val=1;
				}else{
					conn.close();
					temp="0";
				}
				  
				
				String prodreqsql="insert into my_prddr(sr_no,voc_no,TR_NO, date,dtype, rdocno,stockid, specid, psrno,rsv_qty,prdid,brhid,locid,unit_price,cost_price) Values"
						+ " ("+(p+1)+","+voc+","+mytrno+",curdate(),'SOM',"+costdocno+","
						+ "'"+stockid+"',"
						+ ""+specno+","
						+ ""+psrnos+","
						+ "'"+reservqtynw+"',"
						+ ""+psrnos+","
						+""+brhid+","+locidss+",0,0)";

				 System.out.println("prodreqsql--->>>>Sql"+prodreqsql);
			int	prodreq = stmt.executeUpdate (prodreqsql);
			if(prodreq>0){
				val=1;
			}else{
				conn.close();
				temp="0";
			}
				}
				else{
					temp="2";
				}
				
				
				
				
			
			
		  	System.out.println("results--->>>>Sql"+val+"===temp=="+temp);
 
	 		}
		}
	
		
	 
		
	
	 }
	
 if(val>0)
	{
		temp="1";
		conn.commit();
	}
	 
	 
 }
		
	
	
		 response.getWriter().print(temp);
 		
 	
	}catch(Exception e){
	 	e.printStackTrace();
	 	conn.close();
   }finally{
	   stmt.close();
	   conn.close();
   }
%>
