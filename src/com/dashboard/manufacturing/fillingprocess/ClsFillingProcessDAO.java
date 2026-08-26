package com.dashboard.manufacturing.fillingprocess;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Enumeration;

import javax.servlet.http.HttpSession;

import com.common.ClsCommon;
import com.connection.ClsConnection;

import net.sf.json.JSONArray;

public class ClsFillingProcessDAO {
	ClsConnection ClsConnection=new ClsConnection();
	ClsCommon ClsCommon=new ClsCommon();
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
			
				sql="select wo.bomethod,wo.sorddoc,pu.minno as minchk,pu.trno as jvchk,wo.doc_no,wo.batchno,'SOR' otype,case when wo.workprocess=1 then 'Product Start Marked' when wo.workprocess=2 then 'Product End Marked' when wo.workprocess=3 then 'Batch Created' when wo.workprocess=4 then 'Pre Production Test Completed' when wo.workprocess=5 then 'Materials Requested' when wo.workprocess=6 then 'MIN Created' when wo.workprocess=7 then 'Quality Assuarance Completed' when wo.workprocess=8 then 'MIR Created' when wo.workprocess=9 then 'Production Completed' end as process,wo.trno,wo.batchtime,at.mspecno specid,u.doc_no uomid,wo.qualityno,wo.minno as gisno,wo.materialrequestno,wo.blendsheetno,wo.batchno,date_format(wo.batchdate,'%d-%m-%Y')batchdate,m.fillstartmark,m.fillendmark,TIME_TO_SEC(TIMEDIFF(fillendmark,fillstartmark)) as tottime,m.psrno,m.rdocno salesorder,m.qty,m.fillqty,part_no pid,productname pdesc,u.unit uom,p.name mtype,m.descptn  from my_sorderm sm inner join my_sorderd m on sm.doc_no=m.rdocno  inner join my_mrp mr on m.rdocno=mr.rdocno and mr.rdtype='SOR' and mr.mtypeid=9 and mr.mainpsrno=m.psrno inner join my_workorder wo on mr.wodocno=wo.doc_no and workprocess=9 and mr.dpsrno=wo.psrno  left join my_main mm on (m.psrno=mm.psrno)  left join my_unitm u on u.doc_no=mm.munit left join my_prodattrib at on mm.doc_no=at.mpsrno left join my_prodtype p on p.doc_no=mm.prdtype left join my_prdupdate pu on (m.rdocno=pu.orderno and pu.type='SOR' and m.psrno=pu.opsrno) where sm.status<>7 and (m.qty-m.fillqty)>0  group by m.rdocno,wo.psrno "
					+ "union all "
					+ "select wo.bomethod,wo.sorddoc,pu.minno as minchk,pu.trno as jvchk,wo.doc_no,wo.batchno,'STKO' otype,case when wo.workprocess=1 then 'Product Start Marked' when wo.workprocess=2 then 'Product End Marked' when wo.workprocess=3 then 'Batch Created' when wo.workprocess=4 then 'Pre Production Test Completed' when wo.workprocess=5 then 'Materials Requested' when wo.workprocess=6 then 'MIN Created' when wo.workprocess=7 then 'Quality Assuarance Completed' when wo.workprocess=8 then 'MIR Created' when wo.workprocess=9 then 'Production Completed' end as process,wo.trno,wo.batchtime,at.mspecno specid,u.doc_no uomid,wo.qualityno,wo.minno as gisno,wo.materialrequestno,wo.blendsheetno,wo.batchno,date_format(wo.batchdate,'%d-%m-%Y')batchdate,m.fillstartmark,m.fillendmark,TIME_TO_SEC(TIMEDIFF(fillendmark,fillstartmark)) as tottime,m.psrno,m.rdocno salesorder,m.qty,m.fillqty,part_no pid,productname pdesc,u.unit uom,p.name mtype,m.descptn  from my_stockorderm sm left join my_stockorderd m on sm.doc_no=m.rdocno   inner join my_mrp mr on m.rdocno=mr.rdocno and mr.rdtype='SOR' and mr.mtypeid=9 and mr.mainpsrno=m.psrno inner join my_workorder wo on mr.wodocno=wo.doc_no and workprocess=9 and mr.dpsrno=wo.psrno left join my_main mm on (m.psrno=mm.psrno)   left join my_unitm u on u.doc_no=mm.munit left join my_prodattrib at on mm.doc_no=at.mpsrno left join my_prodtype p on p.doc_no=mm.prdtype left join my_prdupdate pu on (m.rdocno=pu.orderno and pu.type='STKO' and m.psrno=pu.opsrno) where sm.status<>7 and (m.qty-m.fillqty)>0 group by m.rdocno,wo.psrno";
			
		
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
	
	public JSONArray secondload(String id,String docno,String qty,String bqty,String type,String order) throws SQLException {
		JSONArray RESULTDATA=new JSONArray();
		if(!id.equalsIgnoreCase("1")){
			return RESULTDATA;      
		}

		
		Connection conn = null;   

		try {
			conn = ClsConnection.getMyConnection();
			Statement stmt = conn.createStatement(); 
			System.out.println("------qty------"+qty+"----"+bqty); 
			String sqltest="";
			
			/*if(!bqty.equalsIgnoreCase("")) {
				sqltest= bqty+" qty,";
				
			}
			if((!qty.equalsIgnoreCase("")) && (Double.parseDouble(qty)>0)) {
				sqltest= qty+" qty,";
			}*/
			String sql="select m1.qtyltr qty,  u.doc_no uomid,at.mspecno specid, m1.psrno as psrno,cat.category,sc.subcategory,bd.brandname,mm.doc_no,part_no pid,productname pdesc,u.unit uom,p.name mtype from my_workorder wo left join my_workorderd m1 on  (wo.doc_no=m1.rdocno ) left join my_main mm on (m1.psrno=mm.psrno) left join  my_brand bd on mm.brandid=bd.doc_no left join my_catm cat on(mm.catid=cat.doc_no) left join my_scatm sc on(mm.scatid=sc.doc_no)  left join my_unitm u on u.doc_no=mm.munit left join my_prodattrib at on(at.mpsrno=mm.doc_no) left join my_prodtype p on p.doc_no=mm.prdtype where  wo.doc_no in(select wodocno from my_mrp where mtypeid=9 and rdocno="+order+" and m1.sorpsrno in ("+docno+") group by rdocno) group by m1.psrno ";
			//System.out.println("stkdoc==="+docno.length());
			
			System.out.println("------rawmaterialloadcvbc------"+sql);   
			ResultSet resultSet = stmt.executeQuery(sql);
			RESULTDATA=ClsCommon.convertToJSON(resultSet);   


		}catch(Exception e){
			e.printStackTrace();

		}finally{
			conn.close();
		}
		return RESULTDATA;
	}
	
	public JSONArray subload(String id) throws SQLException {
		JSONArray RESULTDATA=new JSONArray();

		Connection conn = null;   

		try {
			conn = ClsConnection.getMyConnection();
			Statement stmt = conn.createStatement();

			String	sql="select 'Order No' type union all select 'Order Type' type union all select 'Production' type union all select 'Description' type union all select 'Total Qty' type union all select 'UOM(Base)' type union all select 'Batch No' type union all select 'Batch Date' type union all select 'Time' type union all select 'Method' type union all select 'Type' type";
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
	
	public JSONArray completegridload(String id,String orderno,String otype,String opsrno,String fillqty) throws SQLException {
		JSONArray RESULTDATA=new JSONArray();
		if(!id.equalsIgnoreCase("1")){
			return RESULTDATA;      
		}

		
		Connection conn = null;   

		try {
			conn = ClsConnection.getMyConnection();
			Statement stmt = conn.createStatement();     
			String sql="select b.stock,a.* from(select at.mspecno as specid,bd.brandname,ma.psrno,ma.psrno as prodoc,sum(ma.qty) qty,sum(ma.fillqty)fill,m.part_no pid,m.part_no productid,m.part_no as proid,m.productname pdesc,m.productname as proname,u.unit uom,u.doc_no uomid,p.name mtype   from my_prdupdate ma\r\n" + 
					"left join my_main m on(ma.psrno=m.doc_no) left join  my_unitm u on(m.munit=u.doc_no) left join  my_brand bd on m.brandid=bd.doc_no   left join my_prodattrib at on(at.mpsrno=m.doc_no) left join my_prodtype p on p.doc_no=m.prdtype where m.status=3 and ma.orderno="+orderno+" and ma.type='"+otype+"' and ma.opsrno="+opsrno+"  group by  ma.orderno,ma.psrno)a left join (select round(sum((op_qty-out_qty-rsv_qty-del_qty)+(foc-foc_out)),2)stock,psrno from my_prddin group by psrno)b on a.psrno=b.psrno where a.fill='"+fillqty+"'";
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
			String strsql="select w.workorderno,u.user_name username,date_format (w.logdate,'%d-%m-%Y %H:%m')logdate,description from my_workorderlog w left join my_user u on w.userid=u.doc_no where type='FILL' and w.workorderno="+work+"";        
			System.out.println("worklog--->>>"+strsql);               
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
			" from my_prdetail m left join my_prdetailquality m1 on m.doc_no=m1.rdocno left join my_prtest pr on m1.testid=pr.doc_no"+
			" where m.status=3 and m.psrno="+docno;
			}else {
				 strsql="select m1.rowno,m1.rdocno,m1.srno,pr.name prid,pr.doc_no processid,pr.description 'desc',t.test tstid,t.doc_no testid,"+
							" t.description desc1,m1.testmethod,m1.limit from my_prdetail m left join my_prdetailqaprocess"+
							" m1 on m.doc_no=m1.rdocno left join my_prprocessm pr on m1.processid=pr.doc_no left join my_prtest t on m1.testid=t.doc_no"+
							" where m.status=3 and m.psrno="+docno;
			}
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
