package com.dashboard.manufacturing.floormgmt;

import com.common.ClsCommon;
import com.connection.ClsConnection;

import java.sql.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import net.sf.json.JSONArray;
public class ClsFloorMgmtDAO {

	ClsConnection objconn=new ClsConnection();
	ClsCommon objcommon=new ClsCommon();
	
	public JSONArray getFloorMgmtData(String id) throws SQLException{
		JSONArray data=new JSONArray();
		if(!id.equalsIgnoreCase("1")){
			return data;
		}
		Connection conn=null;
		try{
			conn=objconn.getMyConnection();
			Statement stmt=conn.createStatement();
			String sqltest="";
			
			String strsql="select sl.* from(select if(coalesce(mp.psrno,0)>0,'Y','N')MRP,if(coalesce(wk.doc_no,0)>0,'Y','N')WO,if(coalesce(wk.blendsheetno,0)>0,'Y','N')BLND,if(coalesce(wk.materialrequestno,0)>0,'Y','N')MR,if(coalesce(wk.minno,0)>0,'Y','N')MIN,if(coalesce(wk.qualityno,0)>0,'Y','N')QA,if(coalesce(wk.workprocess,0)=9,'Y','N')PC,if(coalesce(d.fillqty,0)>0,'Y','N')FP,if(coalesce(d.delno,0)>0,'Y','N')DEL,if(coalesce(d.invno,0)>0,'Y','N')INV,d.delno,d.invno,m.acno clacno,m.cldocno as clientid,dt.doc_no deptid,mm.mainpsrno ltstpsrno,round(mm.measure,3) ltstqty,m.mrpno,cat.category,sc.subcategory,bd.brandname,d.psrno,m.date as orderdate,m.promdate,m.doc_no as orderdoc,m.tr_no,m.voc_no orderno,'SOR' ordertype,round((sum(d.qty)- if (d.reserveqty is null,0,sum(d.reserveqty))),3)balqty,ac.refname as client,m.netamount ovalue,sum(round(d.qty,3)) qty,part_no pid,productname pdesc,u.unit uom,p.name mtype,d.prdid,d.descptn,u.doc_no uomid,d.specno as specid,d.amount as unitprice,d.total,d.disper,d.discount,d.nettaxamount as netotal,d.stockid,d.foc,d.mnflocation as locid,d.taxper,d.taxamount,d.nettotal  from my_sorderm m   left join my_acbook ac on ac.cldocno=m.cldocno and ac.dtype='CRM' left join my_sorderd d on d.rdocno=m.doc_no left join my_main mm on (mm.doc_no=d.prdid and d.psrno=mm.psrno) left join  my_brand bd on mm.brandid=bd.doc_no left join my_dept dt on mm.deptid=dt.doc_no  left join my_catm cat on(mm.catid=cat.doc_no) left join my_scatm sc on(mm.scatid=sc.doc_no)  left join my_unitm u on u.doc_no=mm.munit left join my_prodtype p on p.doc_no=mm.prdtype left join my_mrp mp on (if(mm.mainpsrno>0,mm.mainpsrno,d.psrno)=mp.psrno and d.rdocno=mp.rdocno and mp.rdtype='SOR') left join my_workorder wk on mp.dpsrno=wk.psrno     where m.status<>7   group by d.prdid,m.doc_no " + 
					" union all select if(coalesce(mp.psrno,0)>0,'Y','N')MRP,if(coalesce(wk.doc_no,0)>0,'Y','N')WO,if(coalesce(wk.blendsheetno,0)>0,'Y','N')BLND,if(coalesce(wk.materialrequestno,0)>0,'Y','N')MR,if(coalesce(wk.minno,0)>0,'Y','N')MIN,if(coalesce(wk.qualityno,0)>0,'Y','N')QA,if(coalesce(wk.workprocess,0)=9,'Y','N')PC,if(coalesce(d.fillqty,0)>0,'Y','N')FP,if(coalesce(d.delno,0)>0,'Y','N')DEL,if(coalesce(d.invno,0)>0,'Y','N')INV,d.delno,d.invno,m.acno clacno,m.cldocno as clientid,dt.doc_no deptid,mm.mainpsrno ltstpsrno,round(mm.measure,3) ltstqty,m.mrpno,cat.category,sc.subcategory,bd.brandname,d.psrno,m.date as orderdate,m.promdate,m.doc_no as orderdoc,m.tr_no,m.voc_no orderno,'STKO' ordertype,round((sum(d.qty)- if (d.reserveqty is null,0,sum(d.reserveqty))),3)balqty,m.description as client,m.netamount ovalue,sum(round(d.qty,3)) qty,part_no pid,productname pdesc,u.unit uom,p.name mtype,d.prdid,'' descptn,u.doc_no uomid,d.specno as specid,d.amount as unitprice,d.total,d.disper,d.discount,d.nettotal as netotal,0 stockid,d.foc,d.mnflocation as locid,0 taxper,0 taxamount,d.nettotal  from my_stockorderm m left join my_acbook ac on ac.cldocno=m.cldocno and ac.dtype='CRM' left join my_stockorderd d on d.rdocno=m.doc_no left join my_main mm on (mm.doc_no=d.prdid and d.psrno=mm.psrno) left join  my_brand bd on mm.brandid=bd.doc_no left join my_dept dt on mm.deptid=dt.doc_no  left join my_catm cat on(mm.catid=cat.doc_no) left join my_scatm sc on(mm.scatid=sc.doc_no) left join my_unitm u on u.doc_no=mm.munit left join my_prodtype p on p.doc_no=mm.prdtype left join my_mrp mp on (if(mm.mainpsrno>0,mm.mainpsrno,d.psrno)=mp.psrno and d.rdocno=mp.rdocno and mp.rdtype='SOR') left join my_workorder wk on mp.dpsrno=wk.psrno   where m.status<>7  group by d.prdid,m.doc_no)sl order by sl.orderno ";
			System.out.println("gridloadbvnvbfghfhfgh====="+strsql);
			ResultSet rs=stmt.executeQuery(strsql);
			data=objcommon.convertToJSON(rs);
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
