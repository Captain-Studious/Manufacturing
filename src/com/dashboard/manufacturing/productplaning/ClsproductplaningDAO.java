package com.dashboard.manufacturing.productplaning;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Enumeration;

import javax.servlet.http.HttpSession;

import net.sf.json.JSONArray;

import com.common.ClsCommon;
import com.connection.ClsConnection;
public class ClsproductplaningDAO{
	ClsConnection ClsConnection=new ClsConnection();
	ClsCommon ClsCommon=new ClsCommon();
	public JSONArray clientGridLoad(HttpSession session,String id) throws SQLException{
		JSONArray data=new JSONArray();                      
		Connection conn=null; 
		 java.sql.Date edates = null; 
		 if(!id.equalsIgnoreCase("1")){  
			 return data;
		 } 
		try{
			conn=ClsConnection.getMyConnection();  
			Statement stmt=conn.createStatement();
			String strsql="select count(*) val,d.sval,e.refname from my_sorderm m left join my_acbook e on e.cldocno=m.cldocno and e.dtype='CRM'left join (select count(*) sval,e.cldocno from my_stockorderm m left join my_acbook e on e.cldocno=m.cldocno and e.dtype='CRM' where  m.status=3 and e.cldocno is not null group by e.cldocno)d on d.cldocno=e.cldocno where  m.status=3 and e.cldocno is not null group by e.cldocno";        
			//System.out.println("strsql--->>>"+strsql);               
			ResultSet rs=stmt.executeQuery(strsql);
			data=ClsCommon.convertToJSON(rs);  
		}   
		catch(Exception e){
			e.printStackTrace();
		}
		finally{
			conn.close();  
		}
		return data;
	}
	
	public JSONArray salesmanGridLoad(HttpSession session,String id) throws SQLException{
		JSONArray data=new JSONArray();                      
		Connection conn=null; 
		 java.sql.Date edates = null; 
		 if(!id.equalsIgnoreCase("1")){  
			 return data;
		 } 
		try{
			conn=ClsConnection.getMyConnection();  
			Statement stmt=conn.createStatement();
			String strsql="select a.date,d.val,d2.sval from(select date,'SOR' typess from my_sorderm where status=3 and date is not null group by date\r\n" + 
					"union all\r\n" + 
					"select date,'STKO' typess from my_stockorderm where status=3 and date is not null group by date)a left join(select count(*)val,date from my_sorderm where status=3 and date is not null group by date)d on d.date=a.date left join(select count(*)sval,date from my_stockorderm where status=3 and date is not null group by date)d2 on d2.date=a.date";        
			System.out.println("strsqlrttstd--->>>"+strsql);               
			ResultSet rs=stmt.executeQuery(strsql);
			data=ClsCommon.convertToJSON(rs);  
		}   
		catch(Exception e){
			e.printStackTrace();
		}
		finally{
			conn.close();  
		}
		return data;
	}
	
public JSONArray subload(String id) throws SQLException {
		JSONArray RESULTDATA=new JSONArray();

		Connection conn = null;   

		try {
			conn = ClsConnection.getMyConnection();
			Statement stmt = conn.createStatement();

			String	sql="select 'Workorder No' type union all select 'Production' type union all select 'Description' type union all select 'Total Qty' type union all select 'UOM(Base)' type union all select 'Batch No' type union all select 'Batch Date' type union all select 'Time' type union all select 'Method' type union all select 'Type' type";
			//System.out.println("-------sql------"+sql);
			ResultSet resultSet = stmt.executeQuery(sql);
			RESULTDATA=ClsCommon.convertToJSON(resultSet);


		}catch(Exception e){
			e.printStackTrace();

		}finally{
			conn.close();
		}
		return RESULTDATA;
	}

public JSONArray workorderGridLoad(HttpSession session,String id,String work) throws SQLException{
	JSONArray data=new JSONArray();                      
	Connection conn=null; 
	 java.sql.Date edates = null; 
	 if(!id.equalsIgnoreCase("1")){  
		 return data;
	 } 
	try{
		conn=ClsConnection.getMyConnection();  
		Statement stmt=conn.createStatement();
		String strsql="select w.workorderno,u.user_name username,date_format (w.logdate,'%d-%m-%Y %H:%m')logdate,description from my_workorderlog w left join my_user u on w.userid=u.doc_no where type='PRDPL' and w.workorderno="+work+"";        
		//System.out.println("strsql--->>>"+strsql);               
		ResultSet rs=stmt.executeQuery(strsql);
		data=ClsCommon.convertToJSON(rs);  
	}   
	catch(Exception e){
		e.printStackTrace();
	}
	finally{
		conn.close();  
	}
	return data;
}

public JSONArray productload(String id) throws SQLException {
	JSONArray RESULTDATA=new JSONArray();
	if(!(id.equalsIgnoreCase("1") || id.equalsIgnoreCase("2"))){
		return RESULTDATA;   
	}
	Connection conn = null;   

	try {
		String	sql="";
		conn = ClsConnection.getMyConnection();
		Statement stmt = conn.createStatement();     
		
			sql="select m.sorddoc,dt.department,GROUP_CONCAT(convert((coalesce(mp.rdocno,0)), char))  sordoc,case when m.workprocess=1 then 'Product Start Marked' when m.workprocess=2 then 'Product End Marked' when m.workprocess=3 then 'Batch Created' when m.workprocess=4 then 'Blending Sheet Created' when m.workprocess=5 then 'Materials Requested' when m.workprocess=6 then 'MIN Created' when m.workprocess=7 then 'Quality Assuarance Completed' when m.workprocess=8 then 'MIR Created' when m.workprocess=9 then 'Production Completed' end as process,m.trno,m.batchtime,pd.doc_no bomdoc,at.mspecno specid,u.doc_no uomid,m.qualityno,m.minno as gisno,m.materialrequestno,m.blendsheetno,m.batchno,date_format(m.batchdate,'%d-%m-%Y')batchdate,m.startmark,m.endmark,TIME_TO_SEC(TIMEDIFF(endmark,startmark)) as tottime,cat.category,sc.subcategory,bd.brandname,m.psrno,group_concat(convert(coalesce(mp.mainpsrno,0),char))mnpsrno,m.doc_no workorder,m.qty,part_no pid,productname pdesc,u.unit uom,p.name mtype,m.bomethod from my_workorder m left join my_main mm on (m.psrno=mm.psrno) left join  my_brand bd on mm.brandid=bd.doc_no left join my_catm cat on(mm.catid=cat.doc_no) left join my_scatm sc on(mm.scatid=sc.doc_no)  left join my_unitm u on u.doc_no=mm.munit left join my_prodattrib at on mm.doc_no=at.mpsrno left join my_prodtype p on p.doc_no=mm.prdtype left join my_prdetail pd on m.psrno=pd.psrno left join my_mrp mp on m.doc_no=mp.wodocno left join my_dept dt on mm.deptid=dt.doc_no where m.workprocess!=9  group by m.doc_no,m.psrno ";
		
		
		System.out.println("-------firstgridsqdftdyhl------"+sql);
		ResultSet resultSet = stmt.executeQuery(sql);
		RESULTDATA=ClsCommon.convertToJSON(resultSet);


	}catch(Exception e){
		e.printStackTrace();

	}finally{
		conn.close();
	}
	return RESULTDATA;
}

public  JSONArray searchbatch(HttpSession session,String psrno,String unit,String load,String tempchk,String trno) throws SQLException {

	JSONArray RESULTDATA=new JSONArray();

	 if(!(load.equalsIgnoreCase("yes")))
	 {
		 return RESULTDATA;
	 }

	Enumeration<String> Enumeration = session.getAttributeNames();
	int a=0;
	while(Enumeration.hasMoreElements()){
		if(Enumeration.nextElement().equalsIgnoreCase("BRANCHID")){
			a=1;
		}
	}
	if(a==0){
		return RESULTDATA;
	}
	String brcid = session.getAttribute("BRANCHID").toString(); 

	String sqltest="";


	Connection conn = null;
	try {

		conn = ClsConnection.getMyConnection();
		Statement stmtmain = conn.createStatement (); 
		

		String pySql="";
		
		int multimethod=0;
		 Statement stmtqty=conn.createStatement();
		 String chkw="select method  from gl_prdconfig where field_nme='multiqty'";
		  
		 ResultSet rsszs=stmtqty.executeQuery(chkw); 
		 if(rsszs.next())
		 {
			 
			  
			 multimethod=rsszs.getInt("method");
			 
		 }
		 double fr=1;
		
		 if(multimethod>0)
		 {
			 
			
			  Statement stmt= conn.createStatement (); 
			     String slss=" select fr from my_unit where psrno="+psrno+" and unit='"+unit+"' ";
			     
			     System.out.println("====slss==="+slss);
			     ResultSet rv1=stmt.executeQuery(slss);
			     if(rv1.next())
			     {
			    	 fr=rv1.getDouble("fr"); 
			     }
	    	 
			 
			 
		 }
		 
		if((tempchk.equalsIgnoreCase("1")) && (!trno.equalsIgnoreCase(""))) {
			pySql="select '' qty ,'' foc ,coalesce(sum(o.qty),0)setqty,(coalesce(sum(i.op_qty-(i.out_qty+i.rsv_qty+i.del_qty)),0)+coalesce(sum(o.qty),0))/"+fr+" stkqty,i.stockid,round(i.cost_price,2) cost_price,i.batch_no,date_format(i.exp_date,'%d.%m.%Y') exp_date  from my_prddin i left join my_prddout o on (i.stockid=o.stockid and o.tr_no='"+trno+"')   where i.psrno='"+psrno+"' group by  i.batch_no,i.psrno having sum(i.op_qty-(i.out_qty+i.rsv_qty+i.del_qty))>0 order by i.exp_date,i.stockid  limit 10 ";
		}
		else {
			
		

			
			  pySql="select '' qty ,'' foc , (sum(op_qty-(out_qty+rsv_qty+del_qty)))/"+fr+" stkqty,stockid,round(cost_price,2) cost_price,batch_no,date_format(exp_date,'%d.%m.%Y') exp_date "
					+ " from my_prddin where psrno='"+psrno+"' and brhid='"+brcid+"'   group by  batch_no,psrno having sum(op_qty-(out_qty+rsv_qty+del_qty))>0 order by exp_date,stockid  limit 10 ";

		}	
 


	  System.out.println("====pySql===="+pySql);
	 
			ResultSet resultSet = stmtmain.executeQuery(pySql);

			RESULTDATA=ClsCommon.convertToJSON(resultSet); 
	 
		

		stmtmain.close();
		conn.close();

	}
	catch(Exception e){
		e.printStackTrace();
		conn.close();
	}
	//	System.out.println(RESULTDATA);
	return RESULTDATA;
}

public JSONArray secondload(String id,String docno,String qty,String wono) throws SQLException {
	JSONArray RESULTDATA=new JSONArray();
	if(!id.equalsIgnoreCase("1")){
		return RESULTDATA;      
	}

	
	Connection conn = null;   

	try {
		conn = ClsConnection.getMyConnection();
		Statement stmt = conn.createStatement();     
		
		
		
		/*String sql="select 'Search' srchbtn,u.doc_no uomid, if(m2.mtypeid=1,convert(m1.psrno , char(50)),convert(m2.psrno , char(50)))psrno,m.doc_no,m1.stdper\r\n" + 
				",if(m2.mtypeid=1,round((wo.qty/if(wou.type='K',m.kilogram,m.volume))* m1.qtykg,3),round(m2.qty,3)) qty,\r\n" + 
				" if(m2.mtypeid=1,round((wo.qty/if(wou.type='K',m.kilogram,m.volume))* m1.quantity,3),round(m2.qty,3)) qtykg,\r\n" + 
				" part_no pid,productname pdesc, u.unit uom from my_workorder wo inner join my_prdetail m on wo.psrno=m.psrno inner join (select psrno,max(if(activeprocess=1,doc_no,0)) active,max(if(activeprocess=0,doc_no,0)) nonactive from my_prdetail group by psrno) bom on (if(bom.active>0,bom.active,bom.nonactive)=m.doc_no) left join my_prdetailraw m1 on  m.doc_no=m1.rdocno    left join my_workorderd m2 on  wo.doc_no=m2.rdocno left join my_main mm on (m2.psrno=mm.psrno)   left join my_unitm u on u.doc_no=mm.munit left join my_unitm wou on wou.doc_no=wo.uom where m.status=3 and m.psrno="+docno+" and wo.doc_no="+wono+" group by psrno";
		*/
		System.out.println("stkdoc==="+docno);
		String sql="select 'Search' srchbtn,u.doc_no uomid,convert(m2.psrno , char(50))psrno,m2.stdper,m2.qtyltr qty,m2.qtykg,part_no pid,productname pdesc, u.unit uom from my_workorder wo   left join my_workorderd m2 on  (wo.doc_no=m2.rdocno ) left join my_main mm on (m2.psrno=mm.psrno)   left join my_unitm u on u.doc_no=mm.munit left join my_unitm wou on wou.doc_no=wo.uom where wo.doc_no="+wono+" and m2.sorpsrno in (select mainpsrno from my_mrp where wodocno="+wono+" and psrno="+docno+") group by m2.psrno";
		System.out.println("------rawmaterialload------"+sql);   
		ResultSet resultSet = stmt.executeQuery(sql);
		RESULTDATA=ClsCommon.convertToJSON(resultSet);   


	}catch(Exception e){
		e.printStackTrace();

	}finally{
		conn.close();
	}
	return RESULTDATA;
}

public   JSONArray searchProduct(HttpSession session,String id,String dept) throws SQLException {

	 JSONArray RESULTDATA=new JSONArray();
	if(!(id.equalsIgnoreCase("1"))){
		  return RESULTDATA;
	   }
	
	    String brcid=session.getAttribute("BRANCHID").toString();
	   
	Connection conn = null;

	try {
			 conn = ClsConnection.getMyConnection();
			Statement stmtVeh = conn.createStatement (); 
			
			String condtn="",sqltest="";
			
			
			int method=0,productconcat=0;
		
			
			
			
		
			
			

			int tax=0;
			Statement stmt3 = conn.createStatement (); 
		 
			
			
			
			
			
			String joinsql="";
			
			String fsql="";
			
			String outfsql="";
			
			
			
			
			
				// left join my_desc de on(de.psrno=m.doc_no) and de.discontinued=0  and  if(de.brhid=0,"+brcid+",de.brhid)='"+brcid+"'
				String sql="select round(b.stock,2)stock,bh.* from (select m.mainpsrno,p.typeid mtypeid,p.name mtype,bd.brandname,dt.department, at.mspecno as specid, m.part_no,m.doc_no,u.unit,u.doc_no unitid,m.munit,m.psrno,m.productname pdesc from my_main m left join  "
						+ " my_unitm u on m.munit=u.doc_no left join my_dept dt on m.deptid=dt.doc_no and dt.status=3 left join my_prodattrib at on(at.mpsrno=m.doc_no) left join  my_brand bd on m.brandid=bd.doc_no  "
						+ " left join my_catm c on c.doc_no=m.catid left join my_scatm sc on m.scatid=sc.doc_no left join my_prodtype p on p.doc_no=m.prdtype"
						+"    where m.status=3 and m.prdtype<>9 )bh left join (select round(sum((op_qty-out_qty-rsv_qty-del_qty)+(foc-foc_out)),2)stock,psrno from my_prddin group by psrno)b on bh.psrno=b.psrno";
			
				
			System.out.println("-----prdsrch2---"+sql);
	 
					ResultSet resultSet = stmtVeh.executeQuery (sql);
					RESULTDATA=ClsCommon.convertToJSON(resultSet);
					stmtVeh.close();	
			
			
			
	
			conn.close();

	}
	catch(Exception e){
		e.printStackTrace();
		conn.close();
	}
	//System.out.println(RESULTDATA);
return RESULTDATA;
}


public JSONArray completegridload(String id,String docno) throws SQLException {
	JSONArray RESULTDATA=new JSONArray();
	if(!id.equalsIgnoreCase("1")){
		return RESULTDATA;      
	}

	
	Connection conn = null;   

	try {
		conn = ClsConnection.getMyConnection();
		Statement stmt = conn.createStatement();     
		/*String sql="select i.batch_no,'' detdocno,bd.brandname,o.stockid stkid,o.specid,o.psrno as doc_no,m.doc_no docno,o.psrno,o.psrno as prodoc,sum(o.qty-o.out_qty) totqty, sum(o.out_qty) as oldqty,sum(o.qty-o.out_qty) qty,sum(o.qty-o.out_qty) qutval,sum(o.out_qty) outqty,sum(o.qty-o.out_qty) as balqty,m.part_no pid,m.part_no 	productid,m.part_no as proid,m.productname pdesc,m.productname as proname,u.unit uom,u.doc_no uomid,p.name mtype   from my_minm ma\r\n" + 
				"left join my_prddout o on ma.tr_no=o.tr_no left join my_prddin i on o.stockid=i.stockid\r\n" + 
				"left join my_main m on(o.psrno=m.doc_no) left join  my_unitm u on(m.munit=u.doc_no) left join  my_brand bd on m.brandid=bd.doc_no   left join my_prodattrib at on(at.mpsrno=m.doc_no) left join my_prodtype p on p.doc_no=m.prdtype where m.status=3 and ma.doc_no in("+docno+")  group by  i.batch_no,i.psrno having sum(i.op_qty-(i.out_qty+i.rsv_qty+i.del_qty))>0 order by i.exp_date,i.stockid";*/
		
		String sql="select nm.batchno as batch_no,sum(md.qty) issueqty,b.mspecno specid,u.doc_no uomid, mm.psrno,bd.brandname,part_no pid,productname pdesc,u.unit uom from my_minm nm left join my_mind md on (nm.doc_no=md.rdocno) left join my_main mm on (md.psrno=mm.psrno) left join  my_brand bd on mm.brandid=bd.doc_no  left join my_unitm u on u.doc_no=mm.munit left join my_prodattrib b on mm.psrno=b.mpsrno  where nm.refno="+docno+" group by md.psrno";
		
		//System.out.println("stkdoc==="+docno.length());
		
		System.out.println("------completegridload------"+sql);   
		ResultSet resultSet = stmt.executeQuery(sql);
		RESULTDATA=ClsCommon.convertToJSON(resultSet);   


	}catch(Exception e){
		e.printStackTrace();

	}finally{
		conn.close();
	}
	return RESULTDATA;
}

public JSONArray balancesheetload(String id,String docno,String blndno) throws SQLException {
	JSONArray RESULTDATA=new JSONArray();
	if(!id.equalsIgnoreCase("1")){
		return RESULTDATA;      
	}

	
	Connection conn = null;   

	try {
		conn = ClsConnection.getMyConnection();
		Statement stmt = conn.createStatement();     
		String sql="select m.qtykg,m.stdper,b.mspecno specid,u.doc_no uomid, m.psrno,cat.category,sc.subcategory,bd.brandname,m.doc_no,m.qty,part_no pid,productname pdesc,u.unit uom,p.name mtype from my_blendsheet m left join my_main mm on (m.psrno=mm.psrno) left join  my_brand bd on mm.brandid=bd.doc_no left join my_catm cat on(mm.catid=cat.doc_no) left join my_scatm sc on(mm.scatid=sc.doc_no)  left join my_unitm u on u.doc_no=mm.munit left join my_prodtype p on p.doc_no=mm.prdtype left join my_prodattrib b on m.psrno=b.mpsrno  where m.workorderno="+docno+" and m.doc_no="+blndno+"";
		//System.out.println("stkdoc==="+docno.length());
		
		System.out.println("------blendingsheetloadcb------"+sql);   
		ResultSet resultSet = stmt.executeQuery(sql);
		RESULTDATA=ClsCommon.convertToJSON(resultSet);   


	}catch(Exception e){
		e.printStackTrace();

	}finally{
		conn.close();
	}
	return RESULTDATA;
}

public JSONArray qualityinprocessload(String id,String docno) throws SQLException {
	JSONArray RESULTDATA=new JSONArray();
	System.out.println("------idload------"+id);  
	if(!id.equalsIgnoreCase("1")){
		return RESULTDATA;      
	}

	
	Connection conn = null;   

	try {
		conn = ClsConnection.getMyConnection();
		Statement stmt = conn.createStatement();     
		String sql="select 'Search' srchbtn,sum(md.qty) issueqty,b.mspecno specid,u.doc_no uomid, mm.psrno,bd.brandname,part_no pid,productname pdesc,u.unit uom from my_minm nm left join my_mind md on (nm.doc_no=md.rdocno) left join my_main mm on (md.psrno=mm.psrno) left join  my_brand bd on mm.brandid=bd.doc_no  left join my_unitm u on u.doc_no=mm.munit left join my_prodattrib b on mm.psrno=b.mpsrno  where nm.refno="+docno+" group by md.psrno";
		
		System.out.println("------blendingsheetloadcbbhjb------"+sql);   
		ResultSet resultSet = stmt.executeQuery(sql);
		RESULTDATA=ClsCommon.convertToJSON(resultSet);   


	}catch(Exception e){
		e.printStackTrace();

	}finally{
		conn.close();
	}
	return RESULTDATA;
}

public JSONArray mrload(String id,String docno) throws SQLException {
	JSONArray RESULTDATA=new JSONArray();
	if(!id.equalsIgnoreCase("1")){
		return RESULTDATA;      
	}

	
	Connection conn = null;   

	try {
		conn = ClsConnection.getMyConnection();
		Statement stmt = conn.createStatement();     
		String sql="select b.mspecno specid,u.doc_no uomid, m.psrno,cat.category,sc.subcategory,bd.brandname,m.rdocno,m.qty,part_no pid,productname pdesc,u.unit uom,p.name mtype from my_mreqd m left join my_main mm on (m.psrno=mm.psrno) left join  my_brand bd on mm.brandid=bd.doc_no left join my_catm cat on(mm.catid=cat.doc_no) left join my_scatm sc on(mm.scatid=sc.doc_no)  left join my_unitm u on u.doc_no=mm.munit left join my_prodtype p on p.doc_no=mm.prdtype left join my_prodattrib b on m.psrno=b.mpsrno where m.rdocno="+docno+"";
		//System.out.println("stkdoc==="+docno.length());
		
		System.out.println("------materialrequestload------"+sql);   
		ResultSet resultSet = stmt.executeQuery(sql);
		RESULTDATA=ClsCommon.convertToJSON(resultSet);   


	}catch(Exception e){
		e.printStackTrace();

	}finally{
		conn.close();
	}
	return RESULTDATA;
}

public JSONArray lastload(String id,String docno) throws SQLException {
	JSONArray RESULTDATA=new JSONArray();
	if(!id.equalsIgnoreCase("1")){
		return RESULTDATA;      
	}

	
	Connection conn = null;   

	try {
		conn = ClsConnection.getMyConnection();
		Statement stmt = conn.createStatement();     
		String sql="select m1.rowno,m1.rdocno,m1.srno,pr.name prcsid,pr.doc_no processid,pr.description 'desc',u.name mtype,u.doc_no machineid " + 
				" from my_prdetail m left join my_prdetailprocess m1 on m.doc_no=m1.rdocno left join my_prprocessm pr on m1.processid=pr.doc_no " + 
				" left join my_prmachinery u on m1.machineid=u.doc_no where m.status=3 and m.psrno="+docno;
		//System.out.println("stkdoc==="+docno.length());
		
		System.out.println("-------secondgridsqlvcbc------"+sql);   
		ResultSet resultSet = stmt.executeQuery(sql);
		RESULTDATA=ClsCommon.convertToJSON(resultSet);   


	}catch(Exception e){
		e.printStackTrace();

	}finally{
		conn.close();
	}
	return RESULTDATA;
}

public JSONArray getProcessQAData(String docno,String id,String chk) throws SQLException{
	JSONArray data=new JSONArray();
	
	  if(!chk.equalsIgnoreCase("1")){ 
		  return data; 
		  }
	 
	Connection conn=null;
	try{
		conn=ClsConnection.getMyConnection();
		Statement stmt=conn.createStatement();
		String strsql="";
		
		if(id.equalsIgnoreCase("1")){
		  strsql="select m1.rowno,m1.rdocno,m1.srno,pr.test tstid,pr.description desc1,pr.doc_no testid,m1.testmethod tstmthd,m1.limit "+
		" from my_prdetail m inner join my_prdetailquality m1 on m.doc_no=m1.rdocno left join my_prtest pr on m1.testid=pr.doc_no"+
		" where m.status=3 and m.psrno="+docno;
		}else {
			 strsql="select m1.rowno,m1.rdocno,m1.srno,pr.name prid,pr.doc_no processid,pr.description 'desc',t.test tstid,t.doc_no testid,"+
						" t.description desc1,m1.testmethod,m1.limit from my_prdetail m inner join my_prdetailqaprocess"+
						" m1 on m.doc_no=m1.rdocno inner join my_prprocessm pr on m1.processid=pr.doc_no left join my_prtest t on m1.testid=t.doc_no"+
						" where m.status=3 and m.psrno="+docno;
		}
		System.out.println("qualityload==="+strsql);
		 ResultSet rs=stmt.executeQuery(strsql);
		data=ClsCommon.convertToJSON(rs);
	}
	catch(Exception e){
		e.printStackTrace();
	}
	finally{
		conn.close();
	}
	return data;
}


public JSONArray getQualityConfGridMaster(String docno,String id,String chk) throws SQLException{
	JSONArray data=new JSONArray();
	
	  if(!chk.equalsIgnoreCase("1")){ 
		  return data; 
		  }
	 
	Connection conn=null;
	try{
		conn=ClsConnection.getMyConnection();
		Statement stmt=conn.createStatement();
		String strsql="";
		strsql="select qlno,test,method,u.unit from my_prqualitym m left join my_unitm u on m.unit=u.doc_no where m.status<>7 order by m.qlno";
		
		 ResultSet rs=stmt.executeQuery(strsql);
		data=ClsCommon.convertToJSON(rs);
	}
	catch(Exception e){
		e.printStackTrace();
	}
	finally{
		conn.close();
	}
	return data;
}


}
