<%@page import="net.sf.json.JSONObject"%>
<%@page import="net.sf.json.JSONArray"%>
<%@page import="com.connection.*"%>
<%@page import="com.common.*"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.*"%>
<%
Connection conn=null;
String startdate=request.getParameter("startdate")==null?"":request.getParameter("startdate");
String enddate=request.getParameter("enddate")==null?"":request.getParameter("enddate");
String brandfilterarray=request.getParameter("brandarray")==null?"":request.getParameter("brandarray");
String modelfilterarray=request.getParameter("modelarray")==null?"":request.getParameter("modelarray");
String brhid=request.getParameter("brhid")==null?"":request.getParameter("brhid");
JSONObject objdata=new JSONObject();
System.out.println("Parameters:"+startdate+"::"+enddate+"::"+brandfilterarray+"::"+modelfilterarray+"::"+brhid);
try{
	ClsConnection objconn=new ClsConnection();
	ClsCommon objcommon=new ClsCommon();
	conn=objconn.getMyConnection();
	Statement stmt=conn.createStatement();
	String sqltest="",sqlbranch="",amountchk="",sqltest2="";
	if(!brhid.equalsIgnoreCase("") && !brhid.equalsIgnoreCase("a") && !brhid.equalsIgnoreCase("undefined")){
		sqltest+=" and m.brhid="+brhid;
		sqlbranch+=" and brhid="+brhid;
	}
	if(!brandfilterarray.equalsIgnoreCase("") && brandfilterarray!=null && !brandfilterarray.trim().equalsIgnoreCase("[]")){
		brandfilterarray = brandfilterarray.substring(1, brandfilterarray.length() - 1);
		sqltest+=" and gip.brdid in ("+brandfilterarray+")";
	}
	if(!modelfilterarray.equalsIgnoreCase("") && modelfilterarray!=null && !modelfilterarray.trim().equalsIgnoreCase("[]")){
		modelfilterarray = modelfilterarray.substring(1, modelfilterarray.length() - 1);
		sqltest+=" and gip.modelid in ("+modelfilterarray+")";
	}
	java.sql.Date sqlfromdate=null;
	java.sql.Date sqltodate=null;
	
	if(!startdate.equalsIgnoreCase("") && startdate!=null){
		sqlfromdate=objcommon.changeStringtoSqlDate(startdate);
	}
	if(!enddate.equalsIgnoreCase("") && enddate!=null){
		sqltodate=objcommon.changeStringtoSqlDate(enddate);
	}
	if(sqlfromdate!=null){
		sqltest+=" and m.date>='"+sqlfromdate+"' and m.date<='"+sqltodate+"'";
		sqltest2+=" where m.date>='"+sqlfromdate+"' and m.date<='"+sqltodate+"'";
	
	}
	System.out.println("sqlfromdate=="+sqlfromdate+"==sqltodate=="+sqltodate);
	
	//getting card data
	
	 String strgetcarddata="select ((select count(*) from my_sorderd )+(select count(*) from my_stockorderd ))totalcount,(select count(*) as mrp from(select if(coalesce(mp.psrno,0)>0,'Y','N')MRP  from my_sorderm m left join my_sorderd d on d.rdocno=m.doc_no left join my_main mm on (mm.doc_no=d.prdid and d.psrno=mm.psrno)  left join my_mrp mp on (if(mm.mainpsrno>0,mm.mainpsrno,d.psrno)=mp.psrno and d.rdocno=mp.rdocno and mp.rdtype='SOR')     where m.status<>7  "+sqltest+"  group by d.prdid,m.doc_no union all select if(coalesce(mp.psrno,0)>0,'Y','N')MRP  from my_stockorderm m  left join my_stockorderd d on d.rdocno=m.doc_no left join my_main mm on (mm.doc_no=d.prdid and d.psrno=mm.psrno)  left join my_mrp mp on (if(mm.mainpsrno>0,mm.mainpsrno,d.psrno)=mp.psrno and mp.rdtype='STKO')   where m.status<>7 "+sqltest+"  group by d.prdid,m.doc_no)sl where sl.mrp='Y')mrp,"
			 +"(select count(*) as wo from(select if(coalesce(wk.doc_no,0)>0,'Y','N')WO  from my_sorderm m left join my_sorderd d on d.rdocno=m.doc_no left join my_main mm on (mm.doc_no=d.prdid and d.psrno=mm.psrno)  left join my_mrp mp on (if(mm.mainpsrno>0,mm.mainpsrno,d.psrno)=mp.psrno and d.rdocno=mp.rdocno and mp.rdtype='SOR') left join my_workorder wk on  mp.wodocno=wk.doc_no      where m.status<>7  "+sqltest+"  group by d.prdid,m.doc_no union all select if(coalesce(wk.doc_no,0)>0,'Y','N')WO from my_stockorderm m  left join my_stockorderd d on d.rdocno=m.doc_no left join my_main mm on (mm.doc_no=d.prdid and d.psrno=mm.psrno)  left join my_mrp mp on (if(mm.mainpsrno>0,mm.mainpsrno,d.psrno)=mp.psrno and mp.rdtype='STKO') left join my_workorder wk on  mp.wodocno=wk.doc_no    where m.status<>7 "+sqltest+"  group by d.prdid,m.doc_no)sl where sl.wo='Y')wo,"
			 +"(select count(*) as blnd from(select if(coalesce(wk.blendsheetno,0)>0,'Y','N')BLND  from my_sorderm m left join my_sorderd d on d.rdocno=m.doc_no left join my_main mm on (mm.doc_no=d.prdid and d.psrno=mm.psrno)  left join my_mrp mp on (if(mm.mainpsrno>0,mm.mainpsrno,d.psrno)=mp.psrno and d.rdocno=mp.rdocno and mp.rdtype='SOR') left join my_workorder wk on  mp.wodocno=wk.doc_no      where m.status<>7 "+sqltest+"  group by d.prdid,m.doc_no union all select if(coalesce(wk.blendsheetno,0)>0,'Y','N')BLND from my_stockorderm m  left join my_stockorderd d on d.rdocno=m.doc_no left join my_main mm on (mm.doc_no=d.prdid and d.psrno=mm.psrno)  left join my_mrp mp on (if(mm.mainpsrno>0,mm.mainpsrno,d.psrno)=mp.psrno and mp.rdtype='STKO') left join my_workorder wk on  mp.wodocno=wk.doc_no    where m.status<>7 "+sqltest+"  group by d.prdid,m.doc_no)sl where sl.blnd='Y')blnd,"
			 +"(select count(*) as MR from(select if(coalesce(wk.materialrequestno,0)>0,'Y','N')MR  from my_sorderm m left join my_sorderd d on d.rdocno=m.doc_no left join my_main mm on (mm.doc_no=d.prdid and d.psrno=mm.psrno)  left join my_mrp mp on (if(mm.mainpsrno>0,mm.mainpsrno,d.psrno)=mp.psrno and d.rdocno=mp.rdocno and mp.rdtype='SOR') left join my_workorder wk on  mp.wodocno=wk.doc_no      where m.status<>7 "+sqltest+"  group by d.prdid,m.doc_no union all select if(coalesce(wk.materialrequestno,0)>0,'Y','N')MR from my_stockorderm m  left join my_stockorderd d on d.rdocno=m.doc_no left join my_main mm on (mm.doc_no=d.prdid and d.psrno=mm.psrno)  left join my_mrp mp on (if(mm.mainpsrno>0,mm.mainpsrno,d.psrno)=mp.psrno and mp.rdtype='STKO') left join my_workorder wk on  mp.wodocno=wk.doc_no    where m.status<>7 "+sqltest+"  group by d.prdid,m.doc_no)sl where sl.MR='Y')mr,"
			 +"(select count(*) as MIN from(select if(coalesce(wk.minno,0)>0,'Y','N')MIN  from my_sorderm m left join my_sorderd d on d.rdocno=m.doc_no left join my_main mm on (mm.doc_no=d.prdid and d.psrno=mm.psrno)  left join my_mrp mp on (if(mm.mainpsrno>0,mm.mainpsrno,d.psrno)=mp.psrno and d.rdocno=mp.rdocno and mp.rdtype='SOR') left join my_workorder wk on  mp.wodocno=wk.doc_no      where m.status<>7 "+sqltest+"  group by d.prdid,m.doc_no union all select if(coalesce(wk.minno,0)>0,'Y','N')MIN from my_stockorderm m  left join my_stockorderd d on d.rdocno=m.doc_no left join my_main mm on (mm.doc_no=d.prdid and d.psrno=mm.psrno)  left join my_mrp mp on (if(mm.mainpsrno>0,mm.mainpsrno,d.psrno)=mp.psrno and mp.rdtype='STKO') left join my_workorder wk on mp.wodocno=wk.doc_no    where m.status<>7 "+sqltest+" group by d.prdid,m.doc_no)sl where sl.MIN='Y')min,"
			 +"(select count(*) as qa from(select if(coalesce(wk.qualityno,0)>0,'Y','N')QA  from my_sorderm m left join my_sorderd d on d.rdocno=m.doc_no left join my_main mm on (mm.doc_no=d.prdid and d.psrno=mm.psrno)  left join my_mrp mp on (if(mm.mainpsrno>0,mm.mainpsrno,d.psrno)=mp.psrno and d.rdocno=mp.rdocno and mp.rdtype='SOR') left join my_workorder wk on  mp.wodocno=wk.doc_no      where m.status<>7 "+sqltest+"  group by d.prdid,m.doc_no union all select if(coalesce(wk.qualityno,0)>0,'Y','N')QA from my_stockorderm m  left join my_stockorderd d on d.rdocno=m.doc_no left join my_main mm on (mm.doc_no=d.prdid and d.psrno=mm.psrno)  left join my_mrp mp on (if(mm.mainpsrno>0,mm.mainpsrno,d.psrno)=mp.psrno and mp.rdtype='STKO') left join my_workorder wk on  mp.wodocno=wk.doc_no    where m.status<>7 "+sqltest+" group by d.prdid,m.doc_no)sl where sl.qa='Y')qa,"
			 +"(select count(*) as pc from(select if(coalesce(wk.workprocess,0)=9,'Y','N')PC  from my_sorderm m left join my_sorderd d on d.rdocno=m.doc_no left join my_main mm on (mm.doc_no=d.prdid and d.psrno=mm.psrno)  left join my_mrp mp on (if(mm.mainpsrno>0,mm.mainpsrno,d.psrno)=mp.psrno and d.rdocno=mp.rdocno and mp.rdtype='SOR') left join my_workorder wk on  mp.wodocno=wk.doc_no      where m.status<>7 "+sqltest+"  group by d.prdid,m.doc_no union all select if(coalesce(wk.workprocess,0)=9,'Y','N')PC from my_stockorderm m  left join my_stockorderd d on d.rdocno=m.doc_no left join my_main mm on (mm.doc_no=d.prdid and d.psrno=mm.psrno)  left join my_mrp mp on (if(mm.mainpsrno>0,mm.mainpsrno,d.psrno)=mp.psrno and mp.rdtype='STKO') left join my_workorder wk on  mp.wodocno=wk.doc_no    where m.status<>7 "+sqltest+" group by d.prdid,m.doc_no)sl where sl.pc='Y')pc,"
			 +"(select count(*) as fp from(select if(coalesce(d.fillqty,0)>0,'Y','N')FP  from my_sorderm m left join my_sorderd d on d.rdocno=m.doc_no left join my_main mm on (mm.doc_no=d.prdid and d.psrno=mm.psrno)    where m.status<>7 "+sqltest+"  group by d.prdid,m.doc_no union all select if(coalesce(d.fillqty,0)>0,'Y','N')FP from my_stockorderm m  left join my_stockorderd d on d.rdocno=m.doc_no left join my_main mm on (mm.doc_no=d.prdid and d.psrno=mm.psrno)   where m.status<>7 "+sqltest+" group by d.prdid,m.doc_no)sl where sl.fp='Y')fp,"
			 +"(select count(*) as del from(select if(coalesce(d.delno,0)>0,'Y','N')DEL  from my_sorderm m left join my_sorderd d on d.rdocno=m.doc_no left join my_main mm on (mm.doc_no=d.prdid and d.psrno=mm.psrno) where m.status<>7 "+sqltest+"  group by d.prdid,m.doc_no union all select if(coalesce(d.delno,0)>0,'Y','N')DEL from my_stockorderm m  left join my_stockorderd d on d.rdocno=m.doc_no left join my_main mm on (mm.doc_no=d.prdid and d.psrno=mm.psrno)   where m.status<>7 "+sqltest+" group by d.prdid,m.doc_no)sl where sl.del='Y')del,"
			 +"(select count(*) as inv from(select if(coalesce(d.invno,0)>0,'Y','N')INV  from my_sorderm m left join my_sorderd d on d.rdocno=m.doc_no left join my_main mm on (mm.doc_no=d.prdid and d.psrno=mm.psrno)     where m.status<>7 "+sqltest+"  group by d.prdid,m.doc_no union all select if(coalesce(d.invno,0)>0,'Y','N')INV from my_stockorderm m  left join my_stockorderd d on d.rdocno=m.doc_no left join my_main mm on (mm.doc_no=d.prdid and d.psrno=mm.psrno)   where m.status<>7 "+sqltest+" group by d.prdid,m.doc_no)sl where sl.inv='Y')inv";
	 System.out.println("strgetcarddata=="+strgetcarddata);
	ResultSet rsgetcarddata=stmt.executeQuery(strgetcarddata);
	while(rsgetcarddata.next()){
		objdata.put("totalcount",rsgetcarddata.getInt("totalcount"));
		objdata.put("mrp",rsgetcarddata.getInt("mrp"));
		objdata.put("wo",rsgetcarddata.getInt("wo"));
		objdata.put("blnd",rsgetcarddata.getInt("blnd"));
		objdata.put("mr",rsgetcarddata.getInt("mr"));
		objdata.put("min",rsgetcarddata.getInt("min"));
		objdata.put("qa",rsgetcarddata.getInt("qa"));
		objdata.put("pc",rsgetcarddata.getInt("pc"));
		objdata.put("fp",rsgetcarddata.getInt("fp"));
		objdata.put("del",rsgetcarddata.getInt("del"));
		objdata.put("inv",rsgetcarddata.getInt("inv"));
	}
	
	//Getting GIP List
	 String strgetcardlist="select * from(select 'MRP' chktype,if(coalesce(mp.psrno,0)>0,'Y','N')MRP,m.voc_no orderno,'SOR' type,date_format(m.date,'%d-%m-%Y')odate,ac.refname client,mm.part_no productid,mm.productname,round(d.qty,2)qty  from my_sorderm m left join my_sorderd d on d.rdocno=m.doc_no left join my_main mm on (mm.doc_no=d.prdid and d.psrno=mm.psrno) left join my_acbook ac on m.cldocno=ac.cldocno left join my_mrp mp on (if(mm.mainpsrno>0,mm.mainpsrno,d.psrno)=mp.psrno and d.rdocno=mp.rdocno and mp.rdtype='SOR')     where m.status<>7 "+sqltest+"   group by d.prdid,m.doc_no "
			 +" union all select 'MRP' chktype,if(coalesce(mp.psrno,0)>0,'Y','N')MRP,m.voc_no orderno,'STKO' type,date_format(m.date,'%d-%m-%Y')odate,ac.refname client,mm.part_no productid,mm.productname,round(d.qty,2)qty  from my_stockorderm m  left join my_stockorderd d on d.rdocno=m.doc_no left join my_main mm on (mm.doc_no=d.prdid and d.psrno=mm.psrno) left join my_acbook ac on m.cldocno=ac.cldocno  left join my_mrp mp on (if(mm.mainpsrno>0,mm.mainpsrno,d.psrno)=mp.psrno and mp.rdtype='STKO')   where m.status<>7 "+sqltest+" group by d.prdid,m.doc_no)sl where sl.mrp='Y' "
			 +"union all "
			 +"select * from(select 'WO' chktype,if(coalesce(wk.doc_no,0)>0,'Y','N')WO,m.voc_no orderno,'SOR' type,date_format(m.date,'%d-%m-%Y')odate,ac.refname client,mm.part_no productid,mm.productname,round(d.qty,2)qty  from my_sorderm m left join my_sorderd d on d.rdocno=m.doc_no left join my_main mm on (mm.doc_no=d.prdid and d.psrno=mm.psrno) left join my_acbook ac on m.cldocno=ac.cldocno  left join my_mrp mp on (if(mm.mainpsrno>0,mm.mainpsrno,d.psrno)=mp.psrno and d.rdocno=mp.rdocno and mp.rdtype='SOR') left join my_workorder wk on  mp.wodocno=wk.doc_no      where m.status<>7 "+sqltest+"   group by d.prdid,m.doc_no union all select 'WO' chktype,if(coalesce(wk.doc_no,0)>0,'Y','N')WO,m.voc_no orderno,'SOR' type,date_format(m.date,'%d-%m-%Y')odate,ac.refname client,mm.part_no productid,mm.productname,round(d.qty,2)qty from my_stockorderm m  left join my_stockorderd d on d.rdocno=m.doc_no left join my_main mm on (mm.doc_no=d.prdid and d.psrno=mm.psrno) left join my_acbook ac on m.cldocno=ac.cldocno  left join my_mrp mp on (if(mm.mainpsrno>0,mm.mainpsrno,d.psrno)=mp.psrno and mp.rdtype='STKO') left join my_workorder wk on  mp.wodocno=wk.doc_no    where m.status<>7 "+sqltest+"  group by d.prdid,m.doc_no)sl where sl.wo='Y' "
			 +"union all "
			 +"select *  from(select 'BLND' chktype,if(coalesce(wk.blendsheetno,0)>0,'Y','N')BLND,m.voc_no orderno,'SOR' type,date_format(m.date,'%d-%m-%Y')odate,ac.refname client,mm.part_no productid,mm.productname,round(d.qty,2)qty  from my_sorderm m left join my_sorderd d on d.rdocno=m.doc_no left join my_main mm on (mm.doc_no=d.prdid and d.psrno=mm.psrno) left join my_acbook ac on m.cldocno=ac.cldocno left join my_mrp mp on (if(mm.mainpsrno>0,mm.mainpsrno,d.psrno)=mp.psrno and d.rdocno=mp.rdocno and mp.rdtype='SOR') left join my_workorder wk on  mp.wodocno=wk.doc_no      where m.status<>7 "+sqltest+"  group by d.prdid,m.doc_no union all select  'BLND' chktype,if(coalesce(wk.blendsheetno,0)>0,'Y','N')BLND,m.voc_no orderno,'SOR' type,date_format(m.date,'%d-%m-%Y')odate,ac.refname client,mm.part_no productid,mm.productname,round(d.qty,2)qty from my_stockorderm m  left join my_stockorderd d on d.rdocno=m.doc_no left join my_main mm on (mm.doc_no=d.prdid and d.psrno=mm.psrno)   left join my_acbook ac on m.cldocno=ac.cldocno left join my_mrp mp on (if(mm.mainpsrno>0,mm.mainpsrno,d.psrno)=mp.psrno and mp.rdtype='STKO') left join my_workorder wk on  mp.wodocno=wk.doc_no    where m.status<>7 "+sqltest+"  group by d.prdid,m.doc_no)sl where sl.blnd='Y' "
			 +"union all "
			 +"select * from(select 'MIN' chktype,if(coalesce(wk.minno,0)>0,'Y','N')MIN,m.voc_no orderno,'SOR' type,date_format(m.date,'%d-%m-%Y')odate,ac.refname client,mm.part_no productid,mm.productname,round(d.qty,2)qty  from my_sorderm m left join my_sorderd d on d.rdocno=m.doc_no left join my_main mm on (mm.doc_no=d.prdid and d.psrno=mm.psrno) left join my_acbook ac on m.cldocno=ac.cldocno  left join my_mrp mp on (if(mm.mainpsrno>0,mm.mainpsrno,d.psrno)=mp.psrno and d.rdocno=mp.rdocno and mp.rdtype='SOR') left join my_workorder wk on  mp.wodocno=wk.doc_no      where m.status<>7 "+sqltest+"  group by d.prdid,m.doc_no union all select 'MIN' chktype,if(coalesce(wk.minno,0)>0,'Y','N')MIN,m.voc_no orderno,'SOR' type,date_format(m.date,'%d-%m-%Y')odate,ac.refname client,mm.part_no productid,mm.productname,round(d.qty,2)qty from my_stockorderm m  left join my_stockorderd d on d.rdocno=m.doc_no left join my_main mm on (mm.doc_no=d.prdid and d.psrno=mm.psrno)  left join my_acbook ac on m.cldocno=ac.cldocno left join my_mrp mp on (if(mm.mainpsrno>0,mm.mainpsrno,d.psrno)=mp.psrno and mp.rdtype='STKO') left join my_workorder wk on mp.wodocno=wk.doc_no    where m.status<>7 "+sqltest+" group by d.prdid,m.doc_no)sl where sl.MIN='Y' "
			 +"union all "
			 +"select * from(select 'PC' chktype,if(coalesce(wk.workprocess,0)=9,'Y','N')PC,m.voc_no orderno,'SOR' type,date_format(m.date,'%d-%m-%Y')odate,ac.refname client,mm.part_no productid,mm.productname,round(d.qty,2)qty  from my_sorderm m left join my_sorderd d on d.rdocno=m.doc_no left join my_main mm on (mm.doc_no=d.prdid and d.psrno=mm.psrno) left join my_acbook ac on m.cldocno=ac.cldocno  left join my_mrp mp on (if(mm.mainpsrno>0,mm.mainpsrno,d.psrno)=mp.psrno and d.rdocno=mp.rdocno and mp.rdtype='SOR') left join my_workorder wk on  mp.wodocno=wk.doc_no      where m.status<>7 "+sqltest+"  group by d.prdid,m.doc_no union all select 'PC' chktype,if(coalesce(wk.workprocess,0)=9,'Y','N')PC,m.voc_no orderno,'SOR' type,date_format(m.date,'%d-%m-%Y')odate,ac.refname client,mm.part_no productid,mm.productname,round(d.qty,2)qty from my_stockorderm m  left join my_stockorderd d on d.rdocno=m.doc_no left join my_main mm on (mm.doc_no=d.prdid and d.psrno=mm.psrno) left join my_acbook ac on m.cldocno=ac.cldocno  left join my_mrp mp on (if(mm.mainpsrno>0,mm.mainpsrno,d.psrno)=mp.psrno and mp.rdtype='STKO') left join my_workorder wk on  mp.wodocno=wk.doc_no    where m.status<>7 "+sqltest+"  group by d.prdid,m.doc_no)sl where sl.pc='Y' "
			 +"union all "
			 +"select * from(select 'FP' chktype,if(coalesce(d.fillqty,0)>0,'Y','N')FP,m.voc_no orderno,'SOR' type,date_format(m.date,'%d-%m-%Y')odate,ac.refname client,mm.part_no productid,mm.productname,round(d.qty,2)qty  from my_sorderm m left join my_sorderd d on d.rdocno=m.doc_no left join my_main mm on (mm.doc_no=d.prdid and d.psrno=mm.psrno)    left join my_acbook ac on m.cldocno=ac.cldocno where m.status<>7 "+sqltest+"  group by d.prdid,m.doc_no union all select 'FP' chktype,if(coalesce(d.fillqty,0)>0,'Y','N')FP,m.voc_no orderno,'SOR' type,date_format(m.date,'%d-%m-%Y')odate,ac.refname client,mm.part_no productid,mm.productname,round(d.qty,2)qty from my_stockorderm m  left join my_stockorderd d on d.rdocno=m.doc_no left join my_acbook ac on m.cldocno=ac.cldocno left join my_main mm on (mm.doc_no=d.prdid and d.psrno=mm.psrno)   where m.status<>7 "+sqltest+"  group by d.prdid,m.doc_no)sl where sl.fp='Y'";
	 System.out.println("strgetcardlistdata=="+strgetcardlist);
	ResultSet rsgetcardlist=stmt.executeQuery(strgetcardlist);
	JSONArray mrpcardarray=new JSONArray();
	JSONArray wocardarray=new JSONArray();
	JSONArray blndcardarray=new JSONArray();
	JSONArray mincardarray=new JSONArray();
	JSONArray pccardarray=new JSONArray();
	JSONArray fpcardarray=new JSONArray();
	while(rsgetcardlist.next()){
		JSONObject objtemp=new JSONObject();
		objtemp.put("orderno", rsgetcardlist.getString("orderno"));
		objtemp.put("type", rsgetcardlist.getString("type"));
		objtemp.put("date", rsgetcardlist.getString("odate"));
		objtemp.put("client", rsgetcardlist.getString("client"));
		objtemp.put("productid", rsgetcardlist.getString("productid"));
		objtemp.put("productname", rsgetcardlist.getString("productname"));
		objtemp.put("qty", rsgetcardlist.getString("qty"));
		if(rsgetcardlist.getString("chktype").equalsIgnoreCase("MRP")){
			mrpcardarray.add(objtemp);
		}
		else if(rsgetcardlist.getString("chktype").equalsIgnoreCase("WO")){
			wocardarray.add(objtemp);
		}
		else if(rsgetcardlist.getString("chktype").equalsIgnoreCase("BLND")){
			blndcardarray.add(objtemp);
		}
		else if(rsgetcardlist.getString("chktype").equalsIgnoreCase("MIN")){
			mincardarray.add(objtemp);
		}
		else if(rsgetcardlist.getString("chktype").equalsIgnoreCase("PC")){
			pccardarray.add(objtemp);
		}
		else if(rsgetcardlist.getString("chktype").equalsIgnoreCase("FP")){
			fpcardarray.add(objtemp);
		}
	}
	
	objdata.put("mrpcarddata",mrpcardarray);
	objdata.put("wocarddata",wocardarray);
	objdata.put("blndcarddata",blndcardarray);
	objdata.put("mincarddata",mincardarray);
	objdata.put("pccarddata",pccardarray);
	objdata.put("fpcarddata",fpcardarray);   
	JSONArray montharray=new JSONArray();
	int initialmonthdiff=12;
	int initialdatestatus=1;
	if(sqlfromdate!=null && sqltodate!=null){
		String strgetmonthdiff="SELECT TIMESTAMPDIFF(MONTH, '"+sqlfromdate+"', '"+sqltodate+"') monthdiff";
		ResultSet rsgetmonthdiff=stmt.executeQuery(strgetmonthdiff);
		while(rsgetmonthdiff.next()){
			initialmonthdiff=rsgetmonthdiff.getInt("monthdiff");
		}
		initialdatestatus=0;
	}
	for(int i=initialmonthdiff;i>0;i--){
		String strgetmonths="";
		if(initialdatestatus==1){
			strgetmonths="select date_format(date_sub(curdate(),interval "+i+" month),'%b %Y') monthname,month(date_sub(curdate(),interval "+i+" month)) month,year(date_sub(curdate(),interval "+i+" month)) year";	
		}
		else{
			strgetmonths="select date_format(date_sub('"+sqltodate+"',interval "+i+" month),'%b %Y') monthname,month(date_sub('"+sqltodate+"',interval "+i+" month)) month,year(date_sub('"+sqltodate+"',interval "+i+" month)) year";
		}
	//	System.out.println(strgetmonths);
		ResultSet rsgetmonths=stmt.executeQuery(strgetmonths);
		while(rsgetmonths.next()){
			JSONObject objtemp=new JSONObject();
			objtemp.put("monthname",rsgetmonths.getString("monthname"));
			objtemp.put("month",rsgetmonths.getString("month"));
			objtemp.put("year",rsgetmonths.getString("year"));
			montharray.add(objtemp);
		}
	}
	ArrayList<String> gipseries=new ArrayList();
	ArrayList<String> estseries=new ArrayList();
	ArrayList<String> jobseries=new ArrayList();
	ArrayList<String> invseries=new ArrayList();
	ArrayList<String> rlsseries=new ArrayList();
	ArrayList<String> last12months=new ArrayList();
	ArrayList<String> productaseries=new ArrayList();
	ArrayList<String> productamountseries=new ArrayList();
	
	ArrayList<String> sorseries=new ArrayList();
	ArrayList<String> producteseries=new ArrayList();
	
	ArrayList<String> productnameaseries=new ArrayList();
	ArrayList<String> productnameamountseries=new ArrayList();
	ArrayList<String> productnamecseries=new ArrayList();
	ArrayList<String> productnamedseries=new ArrayList();
	ArrayList<String> productnameeseries=new ArrayList();
	ArrayList<String> customerseries=new ArrayList();
	int[] myIntArray = new int[4];
	for(int i=0;i<montharray.size();i++){
		JSONObject objtemp=montharray.getJSONObject(i);
		String basemonth=objtemp.get("month").toString();
		String baseyear=objtemp.get("year").toString();
		last12months.add(objtemp.get("monthname").toString());
		String strgetmonthcount="select (select count(*) from my_acbook where dtype='crm' and status=3 and month(date)="+basemonth+" and year(date)="+baseyear+" "+sqlbranch+") customercount";
		//System.out.println(strgetmonthcount);
		ResultSet rsgetmonthcount=stmt.executeQuery(strgetmonthcount);
		while(rsgetmonthcount.next()){
			/* gipseries.add(rsgetmonthcount.getString("gipcount"));
			estseries.add(rsgetmonthcount.getString("estcount"));
			jobseries.add(rsgetmonthcount.getString("jobcount"));
			invseries.add(rsgetmonthcount.getString("invcount"));
			rlsseries.add(rsgetmonthcount.getString("rlscount")); */
			customerseries.add(rsgetmonthcount.getString("customercount"));
		}
		String strinvcount="select round(sum(grantamt),0)invsum  from my_invm where status=3 and month(date)="+basemonth+" and year(date)="+baseyear+" "+sqlbranch+"";
		ResultSet rsinvcount=stmt.executeQuery(strinvcount);
		while(rsinvcount.next()){
			invseries.add(rsinvcount.getString("invsum"));
		}
		
		String strsorcount="select round(sum(grantamt),0)ordsum  from my_sorderm where status=3 and month(date)="+basemonth+" and year(date)="+baseyear+" "+sqlbranch+"";
		ResultSet rsordcount=stmt.executeQuery(strsorcount);
		while(rsordcount.next()){
			sorseries.add(rsordcount.getString("ordsum"));
		}
	}	
		  String strstackedamount="select mm.productname,sum(qty)prdcount from my_invm m left join my_invd d on m.doc_no=d.rdocno  left join my_main mm on d.psrno=mm.doc_no where m.status=3 "+sqltest+" group by d.psrno order by prdcount desc limit 5";
		  System.out.println(strstackedamount);
		  ResultSet rsstackedamount=stmt.executeQuery(strstackedamount);
		while(rsstackedamount.next()){
			productaseries.add(rsstackedamount.getString("prdcount"));
			
			productnameaseries.add(rsstackedamount.getString("productname"));
			/* if(rsstackedamount.getString("srno").equalsIgnoreCase("1")){
			
			}
			if(rsstackedamount.getString("srno").equalsIgnoreCase("2")){
				productbseries.add(rsstackedamount.getString("prdcount"));
				productnamebseries.add(rsstackedamount.getString("productname"));
			}
			if(rsstackedamount.getString("srno").equalsIgnoreCase("3")){
				productcseries.add(rsstackedamount.getString("prdcount"));
				productnamecseries.add(rsstackedamount.getString("productname"));
			}
			if(rsstackedamount.getString("srno").equalsIgnoreCase("4")){
				productdseries.add(rsstackedamount.getString("prdcount"));
				productnamedseries.add(rsstackedamount.getString("productname"));
			}
			if(rsstackedamount.getString("srno").equalsIgnoreCase("5")){
				producteseries.add(rsstackedamount.getString("prdcount"));
				productnameeseries.add(rsstackedamount.getString("productname"));
			} */
		}
	
		String strprdtamount="select mm.productname,round(sum(d.amount),0)prdcount from my_invm m left join my_invd d on m.doc_no=d.rdocno  left join my_main mm on d.psrno=mm.doc_no where m.status=3 "+sqltest+"  group by d.psrno order by prdcount desc limit 5";
		  System.out.println(strprdtamount);
		  ResultSet rssprdtamount=stmt.executeQuery(strprdtamount);
		while(rssprdtamount.next()){
			
			
			productamountseries.add(rssprdtamount.getString("prdcount"));
			productnameamountseries.add(rssprdtamount.getString("productname"));
			
		}
	
	
/* 	objdata.put("gipseries",gipseries);
	objdata.put("estseries",estseries);
	objdata.put("jobseries",jobseries);
	objdata.put("invseries",invseries);
	objdata.put("rlsseries",rlsseries); */
	  System.out.println("productamountseries=="+productamountseries+"==productnameamountseries=="+productnameamountseries);
	/* System.out.println("productbseries=="+productbseries+"==productnamebseries=="+productnamebseries);
	System.out.println("productcseries=="+productcseries+"==productnamecseries=="+productnamecseries);
	System.out.println("productdseries=="+productdseries+"==productnamedseries=="+productnamedseries);
	System.out.println("producteseries=="+producteseries+"==productnameaseries=="+productnameeseries);
	 */
	objdata.put("productaseries",productaseries);
	objdata.put("productnameaseries",productnameaseries); 
	 objdata.put("productamountseries",productamountseries);
	objdata.put("productnameamountseries",productnameamountseries); 
	/*objdata.put("productcseries",productcseries);
	objdata.put("productnamecseries",productnamecseries); 
	objdata.put("productdseries",productdseries);
	objdata.put("productnamedseries",productnamedseries); 
	objdata.put("producteseries",producteseries);
	objdata.put("productnameeseries",productnameeseries);  */
	
	objdata.put("customerseries",customerseries);
	objdata.put("last12months",last12months);
	
	objdata.put("invseries",invseries);
	objdata.put("sorseries",sorseries);
	
	int repairtypetotal=0;
	String strgetrepairtype="select * from(select ac.refname clientname,round(sum(grantamt),2)salesvalue,(select round(sum(grantamt),2)salesvalue from my_invm)totalsalesvalue from my_invm m left join my_acbook ac on m.cldocno=ac.cldocno and ac.dtype='CRM' "+sqltest2+" group by m.cldocno order by salesvalue desc limit 5)cl"
			+" union all "
			+"select 'others' clientname,round(totalsalesvalue,2)-round(sum(salesvalue),2) salesvalue,round(totalsalesvalue,2)totalsalesvalue from(select ac.refname clientname, round(sum(grantamt),2)salesvalue,(select round(sum(grantamt),2)salesvalue from my_invm)totalsalesvalue from my_invm m left join my_acbook ac on m.cldocno=ac.cldocno and ac.dtype='CRM' "+sqltest2+" group by m.cldocno order by salesvalue desc limit 5)cl";
	System.out.println(strgetrepairtype);
	ResultSet rsgetrepairtype=stmt.executeQuery(strgetrepairtype);
	ArrayList<String> repairtypevalues=new ArrayList();
	ArrayList<String> repairtypelabels=new ArrayList();
	while(rsgetrepairtype.next()){
		repairtypevalues.add(rsgetrepairtype.getString("salesvalue"));
		repairtypelabels.add(rsgetrepairtype.getString("clientname"));
		repairtypetotal+=rsgetrepairtype.getInt("totalsalesvalue");
	}
	//System.out.println(repairtypevalues);
	objdata.put("repairtypevalues",repairtypevalues);
	objdata.put("repairtypelabels",repairtypelabels);
	objdata.put("repairtypetotal",repairtypetotal);
}
catch(Exception e){
	e.printStackTrace();
}
finally{
	conn.close();
}
System.out.println(objdata);
response.getWriter().write(objdata+"");
%>