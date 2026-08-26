package com.dashboard.manufacturing.deliveryinvoiceprocessing;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.http.HttpSession;

import com.common.ClsCommon;
import com.connection.ClsConnection;

import net.sf.json.JSONArray;

public class ClsDeliveryInvoiceProcessingDAO {
	ClsConnection ClsConnection=new ClsConnection();
	ClsCommon ClsCommon=new ClsCommon();
	public JSONArray productload(String id) throws SQLException {
		JSONArray RESULTDATA=new JSONArray();
		if(!(id.equalsIgnoreCase("1"))){
			return RESULTDATA;   
		}
		Connection conn = null;   

		try {
			String	sql="";
			conn = ClsConnection.getMyConnection();
			Statement stmt = conn.createStatement();     
			
				sql="select sl.* from(select coalesce(pr.rsv_qty,0)rsvqtychk,coalesce(pr.stockid,0)rsvstockid,cast(if(coalesce(pr.rsv_qty,0)>0,concat(pr.stockid,'##',pr.rsv_qty,'###'),0) as char(100))stockid,d.delno,d.invno,m.acno clacno,m.cldocno as clientid,dt.doc_no deptid,mm.mainpsrno ltstpsrno,round(mm.measure,3) ltstqty,m.mrpno,cat.category,sc.subcategory,bd.brandname,d.psrno,m.date,m.promdate,m.doc_no as orderdoc,m.tr_no,m.voc_no orderno,'SOR' otype,round((sum(d.qty)- if (d.reserveqty is null,0,sum(d.reserveqty))),3)balqty,ac.refname,m.netamount ovalue,sum(round(d.qty,3)) qty,part_no pid,productname pdesc,u.unit uom,p.name mtype,d.prdid,d.descptn,u.doc_no uomid,d.amount as unitprice,d.total,d.disper,d.discount,d.nettaxamount as netotal,d.foc,d.mnflocation as locid,d.taxper,d.taxamount,d.nettotal,m.rate,m.curid,d.doc_no ddoc,bh.branchname,m.brhid,pb.mspecno as specid from my_sorderm m   left join my_acbook ac on ac.cldocno=m.cldocno and ac.dtype='CRM' left join my_sorderd d on d.rdocno=m.doc_no left join my_main mm on (mm.doc_no=d.prdid and d.psrno=mm.psrno) left join  my_brand bd on mm.brandid=bd.doc_no left join my_dept dt on mm.deptid=dt.doc_no  left join my_catm cat on(mm.catid=cat.doc_no) left join my_scatm sc on(mm.scatid=sc.doc_no)  left join my_unitm u on u.doc_no=mm.munit left join my_prodtype p on p.doc_no=mm.prdtype left join my_prddr pr on (d.rdocno=pr.rdocno and d.psrno=pr.psrno) left join my_brch bh on m.brhid=bh.doc_no left join my_prodattrib pb on mm.doc_no=pb.mpsrno where (reserveqty>0 or fillqty>0) and m.status<>7 and (d.delno=0 or d.invno=0)  group by d.prdid,m.doc_no "
						+ ")sl order by sl.orderno";
			
			
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
	public   JSONArray searchSalesPerson(HttpSession session) throws SQLException {

		JSONArray RESULTDATA=new JSONArray();

		Connection conn = null;

		try {
			conn = ClsConnection.getMyConnection();
			Statement stmt = conn.createStatement (); 


			String sql="select doc_no,sal_name from my_salm where status=3";
			// System.out.println("-----fleetsql---"+fleetsql);

			ResultSet resultSet = stmt.executeQuery (sql);
			RESULTDATA=ClsCommon.convertToJSON(resultSet);
			stmt.close();
			conn.close();

		}
		catch(Exception e){
			e.printStackTrace();
			conn.close();
		}
		//System.out.println(RESULTDATA);
		return RESULTDATA;
	}
	
	public   JSONArray searchLocation(HttpSession session) throws SQLException {

		JSONArray RESULTDATA=new JSONArray();

		Connection conn = null;

		try {
			conn = ClsConnection.getMyConnection();
			Statement stmt = conn.createStatement (); 

			String brcid = session.getAttribute("BRANCHID").toString(); 

			String sql="select m.doc_no,loc_name as location,branchname as branch from my_locm m left join my_brch b on(b.doc_no=m.brhid) where m.status=3 and brhid="+brcid+"";
			System.out.println("-----searchLocation---"+sql);

			ResultSet resultSet = stmt.executeQuery (sql);
			RESULTDATA=ClsCommon.convertToJSON(resultSet);
			stmt.close();
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
