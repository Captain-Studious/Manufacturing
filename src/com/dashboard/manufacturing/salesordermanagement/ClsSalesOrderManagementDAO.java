package com.dashboard.manufacturing.salesordermanagement;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Enumeration;

import javax.servlet.http.HttpSession;

import net.sf.json.JSONArray;

import com.common.ClsCommon;
import com.connection.ClsConnection;
public class ClsSalesOrderManagementDAO{
	ClsConnection ClsConnection=new ClsConnection();
	ClsCommon ClsCommon=new ClsCommon();
	
public JSONArray productload(String id) throws SQLException {
	System.out.println("in product load===="+id);
		JSONArray RESULTDATA=new JSONArray();
		if(!(id.equalsIgnoreCase("1") || id.equalsIgnoreCase("2"))){
			return RESULTDATA;   
		}
		Connection conn = null;   

		try {
			conn = ClsConnection.getMyConnection();
			Statement stmt = conn.createStatement(); 
			String sql="";
if(id.equalsIgnoreCase("1")) {
	sql="select m.promdate,case when m.priority=1 then 'HIGH' when m.priority=2 then 'MED' when m.priority=3 then 'LOW' end as priority,m.doc_no,m.tr_no,m.voc_no orderno,'SOR' otype,ac.refname,ac.per_mob contact,ac.mail1 mail,ac.per_tel tele,m.netamount ovalue  from my_sorderm m left join my_sorderd d on m.doc_no=d.rdocno  left join my_acbook ac on ac.cldocno=m.cldocno and ac.dtype='CRM' where (d.qty-d.fillqty)>0 and m.status<>7 union all select m.promdate,case when m.priority=1 then 'HIGH' when m.priority=2 then 'MED' when m.priority=3 then 'LOW' end as priority,m.doc_no,m.tr_no,m.voc_no orderno,'STKO' otype,m.description as  refname,'' contact,'' mail,'' tele,m.netamount ovalue  from my_stockorderm m left join my_stockorderd d on m.doc_no=d.rdocno  where (d.qty-d.fillqty)>0 and m.status<>7 ";
}
if(id.equalsIgnoreCase("2")) {
	sql="select m.promdate,case when m.priority=1 then 'HIGH' when m.priority=2 then 'MED' when m.priority=3 then 'LOW' end as priority,m.doc_no,m.tr_no,m.voc_no orderno,'SOR' otype,ac.refname,ac.per_mob contact,ac.mail1 mail,ac.per_tel tele,m.netamount ovalue  from my_sorderm m left join my_sorderd d on m.doc_no=d.rdocno left join my_acbook ac on ac.cldocno=m.cldocno and ac.dtype='CRM' where (d.qty-d.fillqty)>0 and m.status<>7 where promdate<curdate() union all select m.promdate,case when m.priority=1 then 'HIGH' when m.priority=2 then 'MED' when m.priority=3 then 'LOW' end as priority,m.doc_no,m.tr_no,m.voc_no orderno,'STKO' otype,m.description as  refname,'' contact,'' mail,'' tele,m.netamount ovalue  from my_stockorderm m left join my_stockorderd d on m.doc_no=d.rdocno where(d.qty-d.fillqty)>0 and m.status<>7  and promdate<curdate()";
}			    
			System.out.println("-------sql------"+sql);
			ResultSet resultSet = stmt.executeQuery(sql);
			RESULTDATA=ClsCommon.convertToJSON(resultSet);


		}catch(Exception e){
			e.printStackTrace();

		}finally{
			conn.close();
		}
		return RESULTDATA;
	}
public JSONArray secondload(String docno,String id,String stkdoc) throws SQLException {
	JSONArray RESULTDATA=new JSONArray();
	if(!id.equalsIgnoreCase("1")){
		return RESULTDATA;      
	}
	String sql="";
	//System.out.println("stkdoc==="+docno.length());
	if(docno.length()>1 && stkdoc.length()==1) {
		sql="select b.stock,a.* from (select d.descptn,d.psrno,'SOR' dtype,if (d.reserveqty is null,0,sum(d.reserveqty))resqty,sum(d.qty)- if (d.reserveqty is null,0,(d.reserveqty))balqty,m.doc_no,m.tr_no,m.voc_no voc,sum(d.qty) qty,part_no pid,productname pdesc,u.unit uom,p.name mtype,d.prdid  from my_sorderm m left join my_sorderd d on d.rdocno=m.doc_no left join my_main mm on (mm.doc_no=d.prdid and d.psrno=mm.psrno) left join my_unitm u on u.doc_no=mm.munit left join my_prodtype p on p.doc_no=mm.prdtype   where m.doc_no  in("+docno.substring(0, docno.length()-1)+")  and m.status<>7 group by d.psrno)a\r\n" + 
				" left join (select round(sum((op_qty-out_qty-rsv_qty-del_qty)+(foc-foc_out)),2)stock,psrno from my_prddin group by psrno)b on a.psrno=b.psrno";
	}
	if(stkdoc.length()>1 && docno.length()==1) {
		sql="select b.stock,a.* from (select d.descptn,d.psrno,'STKO' dtype,if (d.reserveqty is null,0,sum(d.reserveqty))resqty,sum(d.qty)- if (d.reserveqty is null,0,(d.reserveqty))balqty,m.doc_no,m.tr_no,m.voc_no voc,sum(d.qty) qty,part_no pid,productname pdesc,u.unit uom,p.name mtype,d.prdid  from my_stockorderm m left join my_stockorderd d on d.rdocno=m.doc_no left join my_main mm on (mm.doc_no=d.prdid and d.psrno=mm.psrno) left join my_unitm u on u.doc_no=mm.munit left join my_prodtype p on p.doc_no=mm.prdtype left join my_prddin i on(d.psrno=i.psrno)  where m.doc_no  in("+stkdoc.substring(0, stkdoc.length()-1)+")  and m.status<>7 group by d.psrno)a\r\n" + 
				" left join (select round(sum((op_qty-out_qty-rsv_qty-del_qty)+(foc-foc_out)),2)stock,psrno from my_prddin group by psrno)b on a.psrno=b.psrno";
	}
	if(stkdoc.length()>1 && docno.length()>1) {
		
		sql="select b.stock,sum(a.qty)qty,sum(resqty)resqty,sum(balqty)balqty,a.psrno,a.pid,a.pdesc,a.uom,a.prdid from (select d.descptn,d.psrno,'SOR' dtype,if (d.reserveqty is null,0,sum(d.reserveqty))resqty,sum(d.qty)- if (d.reserveqty is null,0,(d.reserveqty))balqty,m.doc_no,m.tr_no,m.voc_no voc,sum(d.qty) qty,part_no pid,productname pdesc,u.unit uom,p.name mtype,d.prdid  from my_sorderm m left join my_sorderd d on d.rdocno=m.doc_no left join my_main mm on (mm.doc_no=d.prdid and d.psrno=mm.psrno) left join my_unitm u on u.doc_no=mm.munit left join my_prodtype p on p.doc_no=mm.prdtype   where m.doc_no  in("+docno.substring(0, docno.length()-1)+")  and m.status<>7 group by d.psrno union all select '' descptn,d.psrno,'STKO' dtype,if (d.reserveqty is null,0,round(sum(d.reserveqty),2))resqty,round((round(sum(d.qty),2)- if (d.reserveqty is null,0,(d.reserveqty))),2)balqty,m.doc_no,m.tr_no,m.voc_no voc,round(sum(d.qty),2) qty,part_no pid,productname pdesc,u.unit uom,p.name mtype,d.prdid  from my_stockorderm m left join my_stockorderd d on d.rdocno=m.doc_no left join my_main mm on (mm.doc_no=d.prdid and d.psrno=mm.psrno) left join my_unitm u on u.doc_no=mm.munit left join my_prodtype p on p.doc_no=mm.prdtype   where m.doc_no  in("+stkdoc.substring(0, stkdoc.length()-1)+")  and m.status<>7 group by d.psrno)a left join (select round(sum((op_qty-out_qty-rsv_qty-del_qty)+(foc-foc_out)),2)stock,psrno from my_prddin group by psrno)b on a.psrno=b.psrno group by a.psrno";
	}
	Connection conn = null;   

	try {
		conn = ClsConnection.getMyConnection();
		Statement stmt = conn.createStatement();     

		
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

public  JSONArray searchbatch(HttpSession session,String psrno,String unit,String load,String tempchk,String trno,String brhid) throws SQLException {

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
			pySql="select '' qty ,'' foc ,coalesce(sum(o.qty),0)setqty,(coalesce(sum(i.op_qty-(i.out_qty+i.rsv_qty+i.del_qty)),0)+coalesce(sum(o.qty),0))/"+fr+" stkqty,i.stockid,round(i.cost_price,2) cost_price,i.batch_no,date_format(i.exp_date,'%d.%m.%Y') exp_date,i.description  from my_prddin i left join my_prddout o on (i.stockid=o.stockid and o.tr_no='"+trno+"')   where i.psrno='"+psrno+"'  and i.brhid='"+brhid+"' and i.locid=(select  doc_no from my_locm where brhid='"+brhid+"' limit 1) group by  i.batch_no,i.psrno having sum(i.op_qty-(i.out_qty+i.rsv_qty+i.del_qty))>0 order by i.exp_date,i.stockid  limit 10 ";
		}
		else {
			
		

			
		  pySql="select '' qty ,'' foc , (sum(op_qty-(out_qty+rsv_qty+del_qty)))/"+fr+" stkqty,stockid,round(cost_price,2) cost_price,batch_no,date_format(exp_date,'%d.%m.%Y') exp_date,description "
				+ " from my_prddin where psrno='"+psrno+"' and brhid='"+brhid+"' and locid=(select  doc_no from my_locm where brhid='"+brhid+"' limit 1)  group by  batch_no,psrno having sum(op_qty-(out_qty+rsv_qty+del_qty))>0 order by exp_date,stockid  limit 10 ";

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

public JSONArray thirdload(String docno,String maindocno,String id,String stkdoc,String type) throws SQLException {
	JSONArray RESULTDATA=new JSONArray();
	System.out.println("stockorer======"+stkdoc);
	if(!id.equalsIgnoreCase("1")){
		return RESULTDATA;   
	}
	String sql="";
	Connection conn = null;   
	System.out.println("stockorer======"+stkdoc.length()+"====salesorder====="+maindocno.length());
	if(stkdoc.length()>1 && maindocno.length()>1) {	
	sql="select m.tr_no,m.voc_no voc,u.doc_no unitdoc,d.psrno,m.brhid,at.mspecno specno,d.prdid,d.rdocno,d.qty,if (dr.rsv_qty is null,0,sum(dr.rsv_qty))resqty,d.qty- if (dr.rsv_qty is null,0,sum(dr.rsv_qty))oldbalqty,m.doc_no,m.tr_no,m.voc_no orderno,'SOR' otype,ac.refname,ac.per_mob contact,ac.mail1 mail,ac.per_tel tele,m.netamount ovalue "
				+ " from my_sorderm m left join my_sorderd d on d.rdocno=m.doc_no left join my_main mm on (mm.doc_no=d.prdid and d.psrno=mm.psrno) left join my_unitm u on u.doc_no=mm.munit left join my_prodtype p on p.doc_no=mm.prdtype left join my_prodattrib at on mm.doc_no=at.mpsrno left join my_acbook ac on ac.cldocno=m.cldocno and ac.dtype='CRM'  left join  my_prddr dr on m.doc_no=dr.rdocno and dr.dtype='som' where d.prdid='"+docno+"' and  m.doc_no  in("+maindocno.substring(0, maindocno.length()-1)+") and m.status<>7 group by m.doc_no "
	            + "union all "
			    + "select m.tr_no,m.voc_no voc,u.doc_no unitdoc,d.psrno,m.brhid,at.mspecno specno,d.prdid,d.rdocno,d.qty,if (dr.rsv_qty is null,0,sum(dr.rsv_qty))resqty,d.qty- if (dr.rsv_qty is null,0,sum(dr.rsv_qty))oldbalqty,m.doc_no,m.tr_no,m.voc_no orderno,'SOR' otype,m.description refname,ac.per_mob contact,ac.mail1 mail,ac.per_tel tele,m.netamount ovalue  from my_stockorderm m left join my_stockorderd d on d.rdocno=m.doc_no left join my_main mm on (mm.doc_no=d.prdid and d.psrno=mm.psrno) left join my_unitm u on u.doc_no=mm.munit left join my_prodtype p on p.doc_no=mm.prdtype left join my_acbook ac on ac.cldocno=m.cldocno and ac.dtype='CRM' left join  my_prddr dr on m.doc_no=dr.rdocno and dr.dtype='som' left join my_prodattrib at on mm.doc_no=at.mpsrno where d.prdid='"+docno+"' and  m.doc_no  in("+stkdoc.substring(0, stkdoc.length()-1)+")  and m.status<>7 group by m.doc_no";
	}
	if(stkdoc.length()>1 && maindocno.length()==1) {	
		sql= "select m.tr_no,m.voc_no voc,u.doc_no unitdoc,d.psrno,m.brhid,at.mspecno specno,d.prdid,d.rdocno,d.qty,if (dr.rsv_qty is null,0,sum(dr.rsv_qty))resqty,d.qty- if (dr.rsv_qty is null,0,sum(dr.rsv_qty))oldbalqty,m.doc_no,m.tr_no,m.voc_no orderno,'SOR' otype,m.description refname,ac.per_mob contact,ac.mail1 mail,ac.per_tel tele,m.netamount ovalue  from my_stockorderm m left join my_stockorderd d on d.rdocno=m.doc_no left join my_main mm on (mm.doc_no=d.prdid and d.psrno=mm.psrno) left join my_unitm u on u.doc_no=mm.munit left join my_prodtype p on p.doc_no=mm.prdtype left join my_acbook ac on ac.cldocno=m.cldocno and ac.dtype='CRM' left join  my_prddr dr on m.doc_no=dr.rdocno and dr.dtype='som' left join my_prodattrib at on mm.doc_no=at.mpsrno where d.prdid='"+docno+"' and  m.doc_no  in("+stkdoc.substring(0, stkdoc.length()-1)+")  and m.status<>7 group by m.doc_no";
	}
	if(stkdoc.length()==1 && maindocno.length()>1) {
		sql="select m.tr_no,m.voc_no voc,u.doc_no unitdoc,d.psrno,m.brhid,at.mspecno specno,d.prdid,d.rdocno,d. qty,if (dr.rsv_qty is null,0,sum(dr.rsv_qty))resqty,d.qty- if (dr.rsv_qty is null,0,sum(dr.rsv_qty))oldbalqty,m.doc_no,m.tr_no,m.voc_no orderno,'SOR' otype,ac.refname,ac.per_mob contact,ac.mail1 mail,ac.per_tel tele,m.netamount ovalue "
				+ " from my_sorderm m left join my_sorderd d on d.rdocno=m.doc_no left join my_main mm on (mm.doc_no=d.prdid and d.psrno=mm.psrno) left join my_unitm u on u.doc_no=mm.munit left join my_prodtype p on p.doc_no=mm.prdtype left join my_acbook ac on ac.cldocno=m.cldocno and ac.dtype='CRM'  left join  my_prddr dr on m.doc_no=dr.rdocno and dr.dtype='som' left join my_prodattrib at on mm.doc_no=at.mpsrno where d.prdid='"+docno+"' and  m.doc_no  in("+maindocno.substring(0, maindocno.length()-1)+") and m.status<>7 group by m.doc_no ";

	}
	/*if(stkdoc.length()>1 && maindocno.length()>1) {
		
		sql="select m.tr_no,m.voc_no voc,u.doc_no unitdoc,d.psrno,m.brhid,d.specno,d.prdid,d.rdocno,round((d.qty),2) qty,if (dr.rsv_qty is null,0,round(sum(dr.rsv_qty),2))resqty,round((round((d.qty),2)- if (dr.rsv_qty is null,0,sum(dr.rsv_qty))),2)oldbalqty,m.doc_no,m.tr_no,m.voc_no orderno,'SOR' otype,ac.refname,ac.per_mob contact,ac.mail1 mail,ac.per_tel tele,m.netamount ovalue "
				+ " from my_sorderm m left join my_sorderd d on d.rdocno=m.doc_no left join my_main mm on (mm.doc_no=d.prdid and d.psrno=mm.psrno) left join my_unitm u on u.doc_no=mm.munit left join my_prodtype p on p.doc_no=mm.prdtype left join my_acbook ac on ac.cldocno=m.cldocno and ac.dtype='CRM' left join my_prddin i on(d.psrno=i.psrno) left join  my_prddr dr on m.doc_no=dr.rdocno and dr.dtype='som' where d.prdid='"+docno+"' and  m.doc_no  in("+maindocno.substring(0, maindocno.length()-1)+") and m.status<>7 group by m.doc_no union all select m.tr_no,m.voc_no voc,u.doc_no unitdoc,d.psrno,m.brhid,d.specno,d.prdid,d.rdocno,round((d.qty),2) qty,if (dr.rsv_qty is null,0,round(sum(dr.rsv_qty),2))resqty,round((round((d.qty),2)- if (dr.rsv_qty is null,0,sum(dr.rsv_qty))),2)oldbalqty,m.doc_no,m.tr_no,m.voc_no orderno,'SOR' otype,ac.refname,ac.per_mob contact,ac.mail1 mail,ac.per_tel tele,m.netamount ovalue  from my_stockorderm m left join my_stockorderd d on d.rdocno=m.doc_no left join my_main mm on (mm.doc_no=d.prdid and d.psrno=mm.psrno) left join my_unitm u on u.doc_no=mm.munit left join my_prodtype p on p.doc_no=mm.prdtype left join my_acbook ac on ac.cldocno=m.cldocno and ac.dtype='CRM' left join my_prddin i on(d.psrno=i.psrno) left join  my_prddr dr on m.doc_no=dr.rdocno and dr.dtype='som' where d.prdid='"+docno+"' and  m.doc_no  in("+stkdoc.substring(1, stkdoc.length()-1)+") and m.status<>7 group by m.doc_no";

	}*/
	try {
		conn = ClsConnection.getMyConnection();
		Statement stmt = conn.createStatement();     

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
}
