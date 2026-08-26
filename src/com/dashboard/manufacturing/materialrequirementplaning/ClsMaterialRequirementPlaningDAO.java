package com.dashboard.manufacturing.materialrequirementplaning;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Enumeration;

import javax.servlet.http.HttpSession;

import net.sf.json.JSONArray;

import com.common.ClsCommon;
import com.connection.ClsConnection;
public class ClsMaterialRequirementPlaningDAO{
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
			if(id.equalsIgnoreCase("1")) {
				sql="select sl.* from(select d.workno work,d.doc_no sorddoc,dt.doc_no deptid,mm.mainpsrno ltstpsrno,round(mm.measure,3) ltstqty,m.mrpno,cat.category,sc.subcategory,bd.brandname,d.psrno,m.date,m.promdate,m.doc_no as orderdoc,m.tr_no,m.voc_no orderno,'SOR' otype,round((sum(d.qty)- if (d.reserveqty is null,0,sum(d.reserveqty))),3)balqty,ac.refname,m.netamount ovalue,sum(round(d.qty,3)) qty,part_no pid,productname pdesc,u.unit uom,p.name mtype,d.prdid,d.descptn  from my_sorderm m   left join my_acbook ac on ac.cldocno=m.cldocno and ac.dtype='CRM' left join my_sorderd d on d.rdocno=m.doc_no left join my_main mm on (mm.doc_no=d.prdid and d.psrno=mm.psrno) left join  my_brand bd on mm.brandid=bd.doc_no left join my_dept dt on mm.deptid=dt.doc_no  left join my_catm cat on(mm.catid=cat.doc_no) left join my_scatm sc on(mm.scatid=sc.doc_no)  left join my_unitm u on u.doc_no=mm.munit left join my_prodtype p on p.doc_no=mm.prdtype   where (d.qty-d.fillqty)>0 and m.status<>7  group by d.prdid,m.doc_no union all select  m.mrpno work,d.rowno sorddoc,dt.doc_no deptid,mm.mainpsrno ltstpsrno,round(mm.measure,3) ltstqty,m.mrpno,cat.category,sc.subcategory,bd.brandname,d.psrno,m.date,m.promdate,m.doc_no,m.tr_no,m.voc_no orderno,'STKO' otype,round((sum(d.qty)- if (d.reserveqty is null,0,sum(d.reserveqty))),3)balqty,m.description refname,m.netamount ovalue,sum(round(d.qty,3)) qty,part_no pid,productname pdesc,u.unit uom,p.name mtype,d.prdid,d.descptn  from my_stockorderm m left join my_acbook ac on ac.cldocno=m.cldocno and ac.dtype='CRM' left join my_stockorderd d on d.rdocno=m.doc_no left join my_main mm on (mm.doc_no=d.prdid and d.psrno=mm.psrno) left join  my_brand bd on mm.brandid=bd.doc_no left join my_dept dt on mm.deptid=dt.doc_no  left join my_catm cat on(mm.catid=cat.doc_no) left join my_scatm sc on(mm.scatid=sc.doc_no) left join my_unitm u on u.doc_no=mm.munit left join my_prodtype p on p.doc_no=mm.prdtype   where (d.qty-d.fillqty)>0 and m.status<>7  group by d.prdid,m.doc_no)sl order by sl.orderno";
			}
			if(id.equalsIgnoreCase("2")) {
				sql="select sl.* from(select d.workno work,d.doc_no sorddoc,dt.doc_no deptid,mm.mainpsrno ltstpsrno,round(mm.measure,3) ltstqty,m.mrpno,cat.category,sc.subcategory,bd.brandname,d.psrno,m.date,m.promdate,m.doc_no as orderdoc,m.tr_no,m.voc_no orderno,'SOR' otype,round((sum(d.qty)- if (d.reserveqty is null,0,sum(d.reserveqty))),3)balqty,ac.refname,m.netamount ovalue,sum(round(d.qty,3)) qty,part_no pid,productname pdesc,u.unit uom,p.name mtype,d.prdid,d.descptn  from my_sorderm m   left join my_acbook ac on ac.cldocno=m.cldocno and ac.dtype='CRM' left join my_sorderd d on d.rdocno=m.doc_no left join my_main mm on (mm.doc_no=d.prdid and d.psrno=mm.psrno) left join  my_brand bd on mm.brandid=bd.doc_no left join my_dept dt on mm.deptid=dt.doc_no  left join my_catm cat on(mm.catid=cat.doc_no) left join my_scatm sc on(mm.scatid=sc.doc_no)  left join my_unitm u on u.doc_no=mm.munit left join my_prodtype p on p.doc_no=mm.prdtype  where (d.qty-d.fillqty)>0 and m.status<>7  group by d.prdid,m.doc_no union all select  m.mrpno work,d.rowno sorddoc,dt.doc_no deptid,mm.mainpsrno ltstpsrno,round(mm.measure,3) ltstqty,m.mrpno,cat.category,sc.subcategory,bd.brandname,d.psrno,m.date,m.promdate,m.doc_no,m.tr_no,m.voc_no orderno,'STKO' otype,round((sum(d.qty)- if (d.reserveqty is null,0,sum(d.reserveqty))),3)balqty,m.description refname,m.netamount ovalue,sum(round(d.qty,3)) qty,part_no pid,productname pdesc,u.unit uom,p.name mtype,d.prdid,d.descptn  from my_stockorderm m left join my_acbook ac on ac.cldocno=m.cldocno and ac.dtype='CRM' left join my_stockorderd d on d.rdocno=m.doc_no left join my_main mm on (mm.doc_no=d.prdid and d.psrno=mm.psrno) left join  my_brand bd on mm.brandid=bd.doc_no left join my_dept dt on mm.deptid=dt.doc_no  left join my_catm cat on(mm.catid=cat.doc_no) left join my_scatm sc on(mm.scatid=sc.doc_no) left join my_unitm u on u.doc_no=mm.munit left join my_prodtype p on p.doc_no=mm.prdtype  where (d.qty-d.fillqty)>0 and m.status<>7  group by d.prdid,m.doc_no)sl where sl.promdate<curdate() order by sl.orderno";
			}
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
public JSONArray secondload(String docno,String id,String psrno) throws SQLException {
	JSONArray RESULTDATA=new JSONArray();
	if(!id.equalsIgnoreCase("1")){
		return RESULTDATA;      
	}
	Connection conn = null;   

	try {
		conn = ClsConnection.getMyConnection();
		Statement stmt = conn.createStatement();
	/*	ArrayList<String> psrnolist=new ArrayList<String>();*/

		
		
		String sql="select round(b.stock,2)stock,bh.* from (select coalesce(m1.wodocno,0)wodocno,m1.bomethod,m1.sorddoc,m1.rdocno,m1.rdtype,m1.psrno bompsrno,m1.doc_no as mrpdoc,'Search' srchbtn,m1.mainpsrno as chkpsrno,m1.mtypeid,coalesce(round(m1.prqty,2),0) hidresqty,coalesce(round(m1.prqty,2),0) resqty,coalesce(round(m1.woqty,2),0) hidworder,coalesce(round(m1.woqty),0) worder,round((if(m1.colorcode in(0,101),round(m1.qty*m1.calcqty,2),round((m1.calcqty/m1.volume)*sum(m1.qty),2)) - if(m1.prqty is null,0,m1.prqty)-if(m1.woqty is null,0,m1.woqty)),2)balqty,m1.colorcode setdoc,at.mspecno as specid,m1.dpsrno psrno, if(m1.colorcode in(0,101),round(m1.qty*m1.calcqty,2),round((m1.calcqty/m1.volume)*sum(m1.qty),2)) as qty,prd.part_no pid,m1.materialtype mtype,prd.productname 'pdesc',u.unit uom,u.doc_no uomid  from my_mrp m1  left join my_main prd on m1.dpsrno=prd.psrno left join my_prodattrib at on(at.mpsrno=prd.doc_no) left join my_unitm  u on m1.uom=u.doc_no  where m1.rdocno in("+docno.substring(0, docno.length())+") and m1.mainpsrno in("+psrno+",0) group by m1.dpsrno,m1.psrno order by m1.colorcode asc)bh left join (select round(sum((op_qty-out_qty-rsv_qty-del_qty)+(foc-foc_out)),2)stock,psrno from my_prddin group by psrno)b on bh.psrno=b.psrno ";
		System.out.println("-------secondgridsqlgriddd------"+sql);   
		ResultSet resultSet3 = stmt.executeQuery(sql);
		RESULTDATA=ClsCommon.convertToJSON(resultSet3);   


	}catch(Exception e){
		e.printStackTrace();

	}finally{
		conn.close();
	}
	return RESULTDATA;
}
public JSONArray thirdload(String docno,String maindocno,String id) throws SQLException {
	JSONArray RESULTDATA=new JSONArray();
	if(!id.equalsIgnoreCase("1")){
		return RESULTDATA;   
	}
	Connection conn = null;   

	try {
		conn = ClsConnection.getMyConnection();
		Statement stmt = conn.createStatement();     

		//String	sql="select m.doc_no,m.tr_no,d.qty,part_no pid,productname pdesc,u.unit uom,p.name mtype,d.prdid  from my_sorderm m left join my_sorderd d on d.rdocno=m.doc_no left join my_main mm on (mm.doc_no=d.prdid and d.psrno=mm.psrno) left join my_unitm u on u.doc_no=mm.munit left join my_prodtype p on p.doc_no=mm.prdtype where m.doc_no='"+maindocno+"' and d.prdid='"+docno+"' and m.status<>7";   
		String sql="select 'Create Blending Order' as chk2,m1.packsize qty,p.name mtype,m1.rowno,m1.rdocno,m1.srno,m1.psrno,round(((i.op_qty-i.out_qty-i.rsv_qty-i.del_qty)+(i.foc-i.foc_out)),2)stock,prd.part_no pid,prd.productname 'pdesc',m1.packsize psize,u.unit uom,u.doc_no "+
				" uomid from my_prdetail m left join my_prdetailpack m1 on m.doc_no=m1.rdocno left join my_main prd on m1.psrno=prd.psrno"+
				" left join my_unitm u on m1.uom=u.doc_no left join my_prddin i on(m1.psrno=i.psrno) left join my_prodtype p on p.doc_no=prd.prdtype where m.status=3 and m.psrno="+docno;
		System.out.println("-------thirdgridsql------"+sql);
		ResultSet resultSet = stmt.executeQuery(sql);
		RESULTDATA=ClsCommon.convertToJSON(resultSet);


	}catch(Exception e){
		e.printStackTrace();

	}finally{
		conn.close();
	}
	return RESULTDATA;
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
		System.out.println("dateload--->>>"+strsql);               
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
		String strsql="select w.workorderno,u.user_name username,w.logdate,description from my_workorderlog w left join my_user u on w.userid=u.doc_no where w.workorderno="+work+"";        
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
						+"    where m.status=3 and m.prdtype=4 and m.deptid in("+dept+"))bh left join (select round(sum((op_qty-out_qty-rsv_qty-del_qty)+(foc-foc_out)),2)stock,psrno from my_prddin group by psrno)b on bh.psrno=b.psrno";
			
				
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

}
