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
String refno=request.getParameter("refno")==null?"0":request.getParameter("refno"); 
String srvdetmtrno=request.getParameter("srvdetmtrno")==null?"0":request.getParameter("srvdetmtrno");  
java.sql.Date sqlprocessdate=null;
Calendar cal = Calendar.getInstance();
SimpleDateFormat format1 = new SimpleDateFormat("dd.MM.yyyy");
String formatted = format1.format(cal.getTime());
System.out.println("==availdatezxd==="+formatted);
String mrpdoc="0",tstdoc="0";
 if(!(formatted.equalsIgnoreCase("undefined"))&&!(formatted.equalsIgnoreCase(""))&&!(formatted.equalsIgnoreCase("0")))
{
sqlprocessdate=ClsCommon.changeStringtoSqlDate(formatted);
	
}
else{

} 
ArrayList<String> pmgntarray= new ArrayList<String>();
ArrayList<String> psrnolist=new ArrayList<String>();
ArrayList<String> chk1=new ArrayList<String>();
ArrayList<String> chk2=new ArrayList<String>();
ArrayList<String> tstarray=new ArrayList<String>();
String aa[]=srvdetmtrno.split(",");
String PRvoc="0";
System.out.println("-----firstcase-----"+aa.length);
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
	    int val=0,val2=0;
	    try
	    {
	   	
	    conn = ClsConnection.getMyConnection();
	    conn.setAutoCommit(false);
		Statement stmt = conn.createStatement();
		 Statement stmtnw1 = conn.createStatement(); 
		 Statement stmtnw2 = conn.createStatement(); 
		 int kg=0,ltr=0;
		 String struom="select type,doc_no from my_unitm where type in ('K','L')";
		 ResultSet rsuom=stmt.executeQuery(struom);
		 while(rsuom.next()){
			 if(rsuom.getString("type").trim().equalsIgnoreCase("K")){
				 kg=rsuom.getInt("doc_no");
			 }
			 if(rsuom.getString("type").trim().equalsIgnoreCase("L")){
				 ltr=rsuom.getInt("doc_no");
			 }
		 }
		 System.out.println("----mainarraysize------"+pmgntarray.size());
		for(int k=0;k<pmgntarray.size();k++)
		{
		val=0;
          chk2=new ArrayList<String>();
          psrnolist=new ArrayList<String>();
	 
			String[] pmgntarr=((String) pmgntarray.get(k)).split("::"); 
 
			String psrno=""+(pmgntarr[0].trim().equalsIgnoreCase("undefined") || pmgntarr[0].trim().equalsIgnoreCase("NaN")|| pmgntarr[0].trim().equalsIgnoreCase("")|| pmgntarr[0].isEmpty()?0:pmgntarr[0].trim())+"";
			String rdtype=""+(pmgntarr[1].trim().equalsIgnoreCase("undefined") || pmgntarr[1].trim().equalsIgnoreCase("NaN")|| pmgntarr[1].trim().equalsIgnoreCase("")|| pmgntarr[1].isEmpty()?0:pmgntarr[1].trim())+"";
			String masterdoc=""+(pmgntarr[2].trim().equalsIgnoreCase("undefined") || pmgntarr[2].trim().equalsIgnoreCase("NaN")|| pmgntarr[2].trim().equalsIgnoreCase("")|| pmgntarr[2].isEmpty()?0:pmgntarr[2].trim())+"";
			String calcqty=""+(pmgntarr[3].trim().equalsIgnoreCase("undefined") || pmgntarr[3].trim().equalsIgnoreCase("NaN")|| pmgntarr[3].trim().equalsIgnoreCase("")|| pmgntarr[3].isEmpty()?0:pmgntarr[3].trim())+"";
			String chk=""+(pmgntarr[4].trim().equalsIgnoreCase("undefined") || pmgntarr[4].trim().equalsIgnoreCase("NaN")|| pmgntarr[4].trim().equalsIgnoreCase("")|| pmgntarr[4].isEmpty()?0:pmgntarr[4].trim())+"";
			String finqty=""+(pmgntarr[5].trim().equalsIgnoreCase("undefined") || pmgntarr[5].trim().equalsIgnoreCase("NaN")|| pmgntarr[5].trim().equalsIgnoreCase("")|| pmgntarr[5].isEmpty()?0:pmgntarr[5].trim())+"";
			String sorpsrno=""+(pmgntarr[6].trim().equalsIgnoreCase("undefined") || pmgntarr[6].trim().equalsIgnoreCase("NaN")|| pmgntarr[6].trim().equalsIgnoreCase("")|| pmgntarr[6].isEmpty()?0:pmgntarr[6].trim())+"";
			String sorddoc=""+(pmgntarr[7].trim().equalsIgnoreCase("undefined") || pmgntarr[7].trim().equalsIgnoreCase("NaN")|| pmgntarr[7].trim().equalsIgnoreCase("")|| pmgntarr[7].isEmpty()?0:pmgntarr[7].trim())+"";
			System.out.println("==psrno==="+psrno+"==rdtype==="+rdtype+"==masterdoc==="+masterdoc+"==qty==="+calcqty);
             
			String docnos="",rawpackpsrnos="",sqltst="",psrnos="",sqltst2="",psrnos2="",sqltst3="",sqltst4="",sqltstnw="",sqltst2nw="",chkknw="0",chkknw2="0";
             
           
             double mesureqty= Double.parseDouble(finqty)* Double.parseDouble(calcqty);		
          if(k==0){   
             String sqlstart="select * from my_mrp where  rdtype='"+rdtype+"' and rdocno="+masterdoc+" and woqty>0 and prqty>0"; 
       	  System.out.println("==sqlstart===="+sqlstart);
       	     ResultSet rsn= stmtnw1.executeQuery(sqlstart); 
       		if(rsn.next()){
       			val=1;
       			
       		}
       		else{
       			  String sqldel="delete from my_mrp where  rdtype='"+rdtype+"' and rdocno="+masterdoc+" and mainpsrno="+sorpsrno+" and psrno<>0 and  colorcode<>0";
      			 System.out.println("==deleteavailrows===="+sqldel);
      			 val2= stmt.executeUpdate(sqldel);   
       			
       		}
          }    
       if(val==0){      
             String sqltst5="select m1.psrno from (select status,psrno,max(if(activeprocess=1,doc_no,0)) active,max(if(activeprocess=0,doc_no,0)) nonactive from my_prdetail group by psrno) m  inner join my_prdetailraw m1 on  (if(m.active>0,m.active,m.nonactive)=m1.rdocno)  where m.status=3 and m.psrno="+psrno+" union all select m1.psrno from (select status,psrno,max(if(activeprocess=1,doc_no,0)) active,max(if(activeprocess=0,doc_no,0)) nonactive from my_prdetail group by psrno) m  inner join my_prdetailpack m1 on  (if(m.active>0,m.active,m.nonactive)=m1.rdocno)  where m.status=3 and m.psrno="+psrno+" ";
     		System.out.println("===psrnofetch==="+sqltst5);
     		ResultSet resultSetnws = stmt.executeQuery(sqltst5);
     		while(resultSetnws.next()) {
     			if(!rawpackpsrnos.equalsIgnoreCase("")) {
     				rawpackpsrnos=rawpackpsrnos+","+resultSetnws.getString("psrno");
     			}else {
     				rawpackpsrnos=resultSetnws.getString("psrno");
     			}
     			
     		}  	
             
             
             
          /*Taking raw materials corresponding to first grid product*/   
             
     		 sqltst="select  if(m.active>0,m.active,m.nonactive)doc_no,m1.psrno from (select status,psrno,max(if(activeprocess=1,doc_no,0)) active,max(if(activeprocess=0,doc_no,0)) nonactive from my_prdetail group by psrno) m  inner join my_prdetailraw m1 on  (if(m.active>0,m.active,m.nonactive)=m1.rdocno)  where m.status=3 and m.psrno="+psrno+"";  
           // sqltst="select m1.psrno from my_prdetail m  inner join my_prdetailraw m1 on  m.doc_no=m1.rdocno  where m.status=3 and m.psrno="+psrno+"  ";
    		System.out.println("===psrnofetch==="+sqltst);
    		ResultSet resultSet = stmt.executeQuery(sqltst);
    		while(resultSet.next()) {
    			if(!psrnos.equalsIgnoreCase("")) {
    				psrnos=psrnos+","+resultSet.getString("psrno");
    				docnos=docnos+","+resultSet.getString("doc_no");
    			}else {
    				psrnos=resultSet.getString("psrno");
    				docnos=resultSet.getString("doc_no");
    			}
    			
    		}
    		
    		 /*Looking for BOM corresponding to above raw materials*/ 
    		 System.out.println("docnos===="+docnos);
    		if(!psrnos.equalsIgnoreCase("")) {
            System.out.println("raw materials with these psrnos "+psrnos+" available");
            sqltst2="select if(m.active>0,m.active,m.nonactive)doc_no,m.psrno from (select status,psrno,max(if(activeprocess=1,doc_no,0)) active,max(if(activeprocess=0,doc_no,0)) nonactive from my_prdetail group by psrno) m  inner join my_prdetailraw m1 on  (if(m.active>0,m.active,m.nonactive)=m1.rdocno)  where m.status=3 and m.psrno in("+psrnos+") group by m.psrno";
			//sqltst2="select m.psrno from my_prdetail m inner join my_prdetailraw m1 on  m.doc_no=m1.rdocno where m.status=3 and m.psrno in("+psrnos+") group by m.psrno";
			System.out.println("===psrnofetch2==="+sqltst2);
			ResultSet resultSetnwp = stmt.executeQuery(sqltst2);
			while(resultSetnwp.next()) {
				String varchk1=resultSetnwp.getString("psrno");
				docnos=docnos+","+resultSetnwp.getString("doc_no");
				psrnolist.add(varchk1);
			}	
			 System.out.println("docnos===="+docnos);
			for(int i=0;i<psrnolist.size();i++) {
				String chkk=psrnolist.get(i).toString();
				System.out.println("psrnolist===="+chkk);
				do {
					psrnos2="";
					/* chk2.add(chkk);*/
					if(!chkknw2.equalsIgnoreCase("0")) {
						chkknw2=chkknw2+","+chkknw;
					}else {
						chkknw2=chkknw;
					} 
					int g=0;
					if(!chkk.equalsIgnoreCase("0")){
						if(chk2.size()>0){
							
							for(int f=0;f<chk2.size();f++){
								String chkval=chk2.get(f).toString();
								if(chkval.equalsIgnoreCase(chkk)){
									g=1;
									chkk="0";
									break;
								}
							}
							if(g==0){
								chk2.add(chkk);
							}
							
						}
						else{
							chk2.add(chkk);
						}
					}
					else{
						chkk=chkknw;
						for(int h=0;h<chk1.size();h++){
							String chkval2=chk1.get(h).toString();
								for(int f=0;f<chk2.size();f++){
									String chkval=chk2.get(f).toString();
									if(chkval.equalsIgnoreCase(chkval2)){
										g=1;
										
										break;
									}
								}
								if(g==0){
									chk2.add(chkval2);
								}
						}
					}
					
					/*Taking raw materials corresponding to above BOM*/
					
					sqltstnw="select if(m.active>0,m.active,m.nonactive)doc_no,m1.psrno from (select status,psrno,max(if(activeprocess=1,doc_no,0)) active,max(if(activeprocess=0,doc_no,0)) nonactive from my_prdetail group by psrno) m  inner join my_prdetailraw m1 on  (if(m.active>0,m.active,m.nonactive)=m1.rdocno) where m.status=3 and m.psrno in("+chkk+")";
					System.out.println("===psrnofetchdowile==="+sqltstnw);
					ResultSet resultSetnw = stmt.executeQuery(sqltstnw);
					while(resultSetnw.next()) {
						docnos=docnos+","+resultSetnw.getString("doc_no");
						if(!psrnos2.equalsIgnoreCase("")) {
							psrnos2=psrnos2+","+resultSetnw.getString("psrno");
							
						}else {
							psrnos2=resultSetnw.getString("psrno");
						
						}
						
					}
					 System.out.println("docnos===="+docnos);
					chkk="0";
					if(!psrnos2.equalsIgnoreCase("")) {
						chk1=new ArrayList<String>();
						
						/*Looking for BOM corresponding to above raw materials*/ 
						
						System.out.println("raw materials with these psrnos "+psrnos2+" available in do while sub");
						sqltst2nw="select if(m.active>0,m.active,m.nonactive)doc_no,m.psrno from (select status,psrno,max(if(activeprocess=1,doc_no,0)) active,max(if(activeprocess=0,doc_no,0)) nonactive from my_prdetail group by psrno) m  inner join my_prdetailraw m1 on  (if(m.active>0,m.active,m.nonactive)=m1.rdocno) where m.status=3 and m.psrno in("+psrnos2+") group by m.psrno";
						System.out.println("===psrnofetch2dowhile==="+sqltst2nw);
						ResultSet resultSetnw1 = stmt.executeQuery(sqltst2nw);
						while(resultSetnw1.next()) {
							chk1.add(resultSetnw1.getString("psrno"));
							docnos=docnos+","+resultSetnw1.getString("doc_no");
							if(!chkknw.equalsIgnoreCase("0")) {
								chkknw=chkknw+","+resultSetnw1.getString("psrno");
							}else {
								chkknw=resultSetnw1.getString("psrno");
							}
						}
					}
					
					 System.out.println("docnos===="+docnos);
				}while(chk1.size()>0);
				
			}	
			
			
		}
		if(chk2.size()>0) {
			System.out.println("same products with these psrnos "+chk2+" available in BOM");
			int m=0;
			for(int f=0;f<chk2.size();f++){
				String chkval=chk2.get(f).toString();
				if(chkval.equalsIgnoreCase(psrno)){
					m=1;
				
					break;
				}
			}
			if(m==0){
				chk2.add(psrno);
			}
			
		}
		if(!rawpackpsrnos.equalsIgnoreCase("")){
	 String sqlslct="select * from my_mrp where  rdtype='"+rdtype+"' and psrno="+psrno+" and rdocno="+masterdoc+" and dpsrno in ("+rawpackpsrnos+")"; 
	  System.out.println("==finalselect===="+sqlslct);
	     ResultSet rsnwp= stmtnw1.executeQuery(sqlslct); 
		if(rsnwp.next()){
			val=1;
			/*  String sqldel="delete from my_mrp where  rdtype='"+rdtype+"' and psrno="+psrno+" and rdocno="+masterdoc+" and dpsrno in ("+rawpackpsrnos+")";
			 System.out.println("==deleteavailrows===="+sqldel);
			 val= stmt.executeUpdate(sqldel);   */
		}
		else{
			
			 
	             if(chk.equalsIgnoreCase("MN")){
	            	 String fntst="select (select concat(method,' - ',doc_no) from my_prdetail where psrno="+psrno+" group by psrno)bomethod,0 setdoc,coalesce(prd.mainpsrno,0)chkpsrno,1 volume,prd.prdtype,at.mspecno as specid,prd.doc_no mainpsrno,'pack material' as chk2,0 rowno,0 rdocno,0 srno,prd.doc_no psrno,0 qty,prd.part_no pid,p.name mtype,prd.productname 'pdesc',u.unit uom,u.doc_no uomid from my_main prd  left join my_prodattrib at on(at.mpsrno=prd.doc_no) left join my_unitm u on prd.munit=u.doc_no left join my_prodtype p on p.doc_no=prd.prdtype left join my_mrp mp on prd.doc_no=mp.dpsrno  where  prd.doc_no in("+psrno+") ";
	            	  ResultSet fnres = stmtnw1.executeQuery(fntst);
	            	 while(fnres.next()){
	                 	int mnpsrno=fnres.getInt("chkpsrno");
	                 	int psrnosnw=fnres.getInt("mainpsrno");
	                 	int rawpsrno=fnres.getInt("psrno");
	                 	double rawqty=fnres.getDouble("qty");
	                 	double volume=fnres.getDouble("volume");
	                 	int udoc=fnres.getInt("uomid");
	                 	String mtype=fnres.getString("mtype");
	                 	String mtypeid=fnres.getString("prdtype");
	                 	String colorcode=fnres.getString("setdoc");
	                 	String method=fnres.getString("bomethod");
	                 	 String sqlfinchk="select * from my_mrp where  rdtype='"+rdtype+"' and psrno="+psrno+" and rdocno="+masterdoc+" and dpsrno in ("+psrno+")"; 	
	                 	  ResultSet rsnwp1= stmtnw2.executeQuery(sqlfinchk); 
	              		if(rsnwp1.next()){
	              			
	              		}
	              		else{
	                 	String sqltstnw1="insert into my_mrp(rdocno, rdtype, psrno, dpsrno, qty, uom, materialtype,colorcode,calcqty,mtypeid,volume,mainpsrno,sorddoc,bomethod) values("+masterdoc+",'"+rdtype+"',"+psrno+","+psrno+","+finqty+","+udoc+",'"+mtype+"',"+colorcode+","+calcqty+","+mtypeid+","+volume+","+sorpsrno+","+sorddoc+",'"+method+"')"; 
	                     val= stmt.executeUpdate(sqltstnw1);
	              		}
	             
	                 }
	             }
			if(chk2.size()==0){
			
			}else{
				psrno="0";
			}
			 for(int b=0;b<chk2.size();b++){
					String psrnochk=chk2.get(b).toString();
					
					if(!psrno.equalsIgnoreCase("0")) {
						psrno=psrno+","+psrnochk;
					}else {
						psrno=psrnochk;
					}
					
				
			 }
		
		Statement stmtnw = conn.createStatement(); 
		tstdoc="0";
		 String tst1="select coalesce(max(colorcode),0) as docno from my_mrp";
		ResultSet rsk=stmt.executeQuery(tst1);
		if(rsk.next()){
			tstdoc=	rsk.getString("docno");
		} 
		 System.out.println("==docnossss===="+docnos);
              String sqlval="select if(@i=bd.doc_no,@j,@j:=@j+1) setdoc,@i val,@i:=bd.doc_no,bd.* from (select coalesce(b.stock,0)stock,bh.* from(select  m.doc_no,coalesce(prd.mainpsrno,0)chkpsrno,m.volume,prd.prdtype,at.mspecno as specid,m.psrno mainpsrno,'raw material' as chk2,m1.rowno,m1.rdocno,m1.srno,m1.psrno,if(u.doc_no="+kg+",m1.qtykg,m1.quantity) qty,prd.part_no pid,p.name mtype,prd.productname 'pdesc',u.unit uom,u.doc_no as uomid  from my_prdetail m inner join my_prdetailraw m1 on  m.doc_no=m1.rdocno left join my_main prd on m1.psrno=prd.psrno left join my_prodattrib at on(at.mpsrno=prd.doc_no) left join my_prodtype p on p.doc_no=prd.prdtype left join my_unitm  u on prd.munit=u.doc_no left join my_unitm wou on wou.doc_no=m1.uom where m.status=3 and m.doc_no in("+docnos+")"
            		+ " union all "
            		+ " select m.doc_no,coalesce(prd.mainpsrno,0)chkpsrno,m.volume,prd.prdtype,at.mspecno as specid,m.psrno mainpsrno,'pack material' as chk2,m1.rowno,m1.rdocno,m1.srno,m1.psrno,m1.packsize qty,prd.part_no pid,p.name mtype,prd.productname 'pdesc',u.unit uom,u.doc_no uomid from my_prdetail m inner join my_prdetailpack m1 on m.doc_no=m1.rdocno left join my_main prd on m1.psrno=prd.psrno left join my_prodattrib at on(at.mpsrno=prd.doc_no) left join my_unitm u on m1.uom=u.doc_no left join my_prodtype p on p.doc_no=prd.prdtype where m.status=3 and m.doc_no in("+docnos+") )bh left join (select round(sum((op_qty-out_qty-rsv_qty-del_qty)+(foc-foc_out)),2)stock,psrno from my_prddin group by psrno)b on bh.psrno=b.psrno order by bh.doc_no)bd,(select @i:=0) as i,(select @j:="+tstdoc+") as j ";
              System.out.println("==finalselect===="+sqlval);
              ResultSet resnw = stmtnw.executeQuery(sqlval);
            while(resnw.next()){
            	int mnpsrno=resnw.getInt("chkpsrno");
            	int psrnosnw=resnw.getInt("mainpsrno");
            	int rawpsrno=resnw.getInt("psrno");
            	double rawqty=resnw.getDouble("qty");
            	double volume=resnw.getDouble("volume");
            	int udoc=resnw.getInt("uomid");
            	String mtype=resnw.getString("mtype");
            	String mtypeid=resnw.getString("prdtype");
            	String colorcode=resnw.getString("setdoc");
            	
            	
            	
   	
  
            	String sqltstnw1="insert into my_mrp(rdocno, rdtype, psrno, dpsrno, qty, uom, materialtype,colorcode,calcqty,mtypeid,volume,mainpsrno,sorddoc) values("+masterdoc+",'"+rdtype+"',"+psrnosnw+","+rawpsrno+","+rawqty+","+udoc+",'"+mtype+"',"+colorcode+","+mesureqty+","+mtypeid+","+volume+","+sorpsrno+","+sorddoc+")"; 
                val= stmt.executeUpdate(sqltstnw1);
   	
            	}	
            String sqlk="";
           /*  if(rdtype.equalsIgnoreCase("SOR")){
            	  sqlk="update my_sorderm set mrpno="+tstdoc+" where doc_no="+masterdoc+"";
            	  val=stmt.executeUpdate(sqlk);
            }
            if(rdtype.equalsIgnoreCase("STKO")){
            	 sqlk="update my_stockorderm set mrpno="+tstdoc+" where doc_no="+masterdoc+"";
            	 val=stmt.executeUpdate(sqlk);
            } */
           
			
            
		
			
		}
		
		}
		if(rawpackpsrnos.equalsIgnoreCase("")){
			val=2;
		}
		/* if(!mrpdoc.equalsIgnoreCase("0")) {
			mrpdoc=mrpdoc+","+tstdoc;
		}else {
			mrpdoc=tstdoc;
		} */
  }
		}
		 if(val>0){
			 if(val==2){
				 tempnw="2";
				 conn.commit();
				 stmt.close();
			 }
			 else{
				 tempnw="1";
				 conn.commit();
				 stmt.close();
			 }
			 
			
			 
				conn.close();
		 }
   
	 response.getWriter().print(tempnw+" :: "+mrpdoc);
    	
    }
    catch(Exception e)
    {
    	e.printStackTrace();
    	
    	
    	conn.close();
    	 response.getWriter().print(tempnw+" :: "+mrpdoc);
    }
	 finally{
		 conn.close();
	 }
	 	
	 	
%>



 