package com.dashboard.joborder;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Enumeration;

import javax.servlet.http.HttpSession;

import net.sf.json.JSONArray;

import com.common.ClsCommon;
import com.connection.ClsConnection;
public class ClsjobOrderDAO
{

	
	ClsConnection ClsConnection=new ClsConnection();
	ClsCommon ClsCommon=new ClsCommon();
	
	public  JSONArray searchMaster(String branch,String cldocno,String type) throws SQLException
	{

 

		JSONArray RESULTDATA=new JSONArray();
	

		String sqltest="";
 
		if(!(cldocno.equalsIgnoreCase(""))){
			sqltest=sqltest+" and m.cldocno = '"+cldocno+"'";
		}

	 	if(!((branch.equalsIgnoreCase("a")) || (branch.equalsIgnoreCase("NA")))){
    		sqltest=sqltest+" and m.brhid='"+branch+"'";
 		}
    	
	 	
	 	if(type.equalsIgnoreCase("fixing"))
	 	{
	 		sqltest=sqltest+" and d.status=1 ";
	 	}
	 	else if(type.equalsIgnoreCase("issue"))
	 	{
	 		sqltest=sqltest+" and d.status=0 ";
	 	}
		else if(type.equalsIgnoreCase("col"))
	 	{
	 		sqltest=sqltest+" and d.status in (0,1) ";
	 	}
		Connection conn = null;

		try {
			conn = ClsConnection.getMyConnection();
			Statement stmtenq1 = conn.createStatement ();

			String clssql= ("select m.voc_no,m.brhid,m.doc_no,br.brandname,mo.modelname,sm.submodel,ach.submodelid,y.yom,ac.refname,trim(ac.address) address,"
					+ " m.cldocno,ach.reg_no regno,ach.brandid brdid,ach.modelid,ach.yom yomid,s1.spec bsize,ach.bsizeid,s2.spec esize,ach.esizeid,s3.spec csize,ach.csizeid from"
					+ " my_joborderm m  left join my_joborderd d on d.rdocno=m.doc_no left join my_acbook ac on ac.cldocno=m.cldocno and ac.dtype='CRM' "
					+ "  left join my_acvehicle ach on ach.doc_no=m.clrefno  left join my_sbrand br on br.doc_no=ach.brandid left join my_smodel mo on mo.doc_no=ach.modelid "
					+ " left join my_ssubmodel sm on(sm.doc_No=ach.submodelid and sm.modelid=ach.modelid) left join my_suitspec1 s1 on(s1.doc_no=ach.bsizeid)  "
					+ " left join my_suitspec2 s2 on(s2.doc_no=ach.esizeid) left join my_suitspec3 s3 on(s3.doc_no=ach.csizeid)  "
					+ " left join my_syom y on y.doc_no=ach.yom where   m.status=3 "+sqltest+" group by m.doc_no");

System.out.println("====searchmaster===="+clssql);
			ResultSet resultSet = stmtenq1.executeQuery(clssql);

			RESULTDATA=ClsCommon.convertToJSON(resultSet);
			stmtenq1.close();
			conn.close();
		}
		catch(Exception e){
			conn.close();
			e.printStackTrace();
		}
		//System.out.println(RESULTDATA);
		return RESULTDATA;
	}

	
	public JSONArray prdGridReload(String  branch,String docno) throws SQLException {


		JSONArray RESULTDATA=new JSONArray();

		Connection conn = null;

		try {

			if(((docno.equalsIgnoreCase(""))||(docno.equalsIgnoreCase("undefined")))){

				docno="0";
			}

		 
			conn = ClsConnection.getMyConnection();
			Statement stmt = conn.createStatement();


			String	sql=" select rdocno,fixing,brandname,clstatus,1 method, stkid,specid,psrno as prodoc,psrno as doc_no,rdocno,psrno,qty+balqty totqty, qty,qty as oldqty, "
						+ "  outqty,case when (totqty-outqty)=0 then 0 else (qty+balqty) end as balqty,0 size,part_no, "
						+ "  productid as proid,productid,productname as proname,productname,unit,unitdocno, totwtkg, "
						+ "  kgprice, unitprice, total, discper,  dis, netotal from(select  fixing,brandname,clstatus,stkid,specid,psrno as doc_no, "
						+ "   rdocno,psrno,qtys as totqty, qty,qtys,outqty,(qtys-outqty) as balqty,0 size,part_no,productid, "
						+ "   productname,unit,unitdocno, totwtkg, kgprice, unitprice, total, discper,  dis, netotal from "
						+ "   ( select if(d.fixing=1,'YES','NO') fixing,bd.brandname,d.clstatus, d.stockid as stkid,"
						+ " d.specno as specid,d.rdocno,m.doc_no psrno,aa.qty as qty, ii.op_qty "
						+ "   as qtys,ii.outqty,m.part_no,m.part_no productid,m.productname, "
						+ "    u.unit,u.doc_no unitdocno,d.NtWtKG totwtkg, d.KGPrice kgprice,d.amount unitprice,aa.total total,d.disper "
						+ "   discper, aa.discount dis,aa.nettotal netotal from my_joborderm ma left join my_joborderd d on(ma.doc_no=d.rdocno) "
						+ "   left join my_main m on(d.psrno=m.doc_no and d.prdid=m.psrno) left join  my_unitm u on(d.unitid=u.doc_no) "
						+ "  left join my_prodattrib at on(at.mpsrno=m.doc_no and d.specno=at.mpsrno ) left join  my_brand bd on m.brandid=bd.doc_no "
						+ "  left join my_prddin i on (i.psrno=d.psrno and i.prdid=d.prdid and i.specno=d.specno "
						+ "   and ma.brhid=i.brhid) "
						+ "  left join (select sum(qty) qty,sum(total) total,sum(discount) discount,sum(nettotal) nettotal,psrno,rdocno,specno,prdid from my_joborderd where  rdocno in("+docno+") "
						+ "  group by  psrno) aa on aa.psrno=i.psrno "
						+ "  left join( select date,sum(op_qty) op_qty,stockid,sum(out_qty+del_qty+rsv_qty) outqty,prdid,psrno,specno,brhid "
						+ "  from my_prddin where 1=1 group by psrno) ii on "
						+ "   (ii.psrno=i.psrno and ii.prdid=i.prdid and ii.specno=i.specno and ma.brhid=ii.brhid) "
						+ "    where m.status=3  and d.status=0 and d.rdocno in("+docno+") and ma.brhid='"+branch+"' group by i.prdid  order by i.date,i.prdid ) as a ) as b ";
 
				 
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

	
	public JSONArray collectedgridReload(String  branch,String docno) throws SQLException {


		JSONArray RESULTDATA=new JSONArray();

		Connection conn = null;

		try {

			if(((docno.equalsIgnoreCase(""))||(docno.equalsIgnoreCase("undefined")))){

				docno="0";
			}

		 
			conn = ClsConnection.getMyConnection();
			Statement stmt = conn.createStatement();


			String	sql=" select fixing,brandname,clstatus,1 method, stkid,specid,psrno as prodoc,psrno as doc_no,rdocno,psrno,qty+balqty totqty, qty,qty as oldqty, "
						+ "  outqty,case when (totqty-outqty)=0 then 0 else (qty+balqty) end as balqty,0 size,part_no, "
				  + "  productid as proid,productid,productname as proname,productname,unit,unitdocno, totwtkg, "
				  + "  kgprice, unitprice, total, discper,  dis, netotal from(select  fixing,brandname,clstatus,stkid,specid,psrno as doc_no, "
				 + "   rdocno,psrno,qtys as totqty, qty,qtys,outqty,(qtys-outqty) as balqty,0 size,part_no,productid, "
				 + "   productname,unit,unitdocno, totwtkg, kgprice, unitprice, total, discper,  dis, netotal from "
				 + "   ( select if(d.fixing=1,'YES','NO') fixing,bd.brandname,d.clstatus, d.stockid as stkid,"
				 + "d.specno as specid,d.rdocno,m.doc_no psrno,aa.qty as qty, ii.op_qty "
				 + "   as qtys,ii.outqty,m.part_no,m.part_no productid,m.productname, "
				+ "    u.unit,u.doc_no unitdocno,d.NtWtKG totwtkg, d.KGPrice kgprice,d.amount unitprice,aa.total total,d.disper "
				 + "   discper, aa.discount dis,aa.nettotal netotal from my_joborderm ma left join my_joborderd d on(ma.doc_no=d.rdocno) "
				 + "   left join my_main m on(d.psrno=m.doc_no and d.prdid=m.psrno) left join  my_unitm u on(d.unitid=u.doc_no) "
				  + "  left join my_prodattrib at on(at.mpsrno=m.doc_no and d.specno=at.mpsrno ) left join  my_brand bd on m.brandid=bd.doc_no "
				 + "  left join my_prddin i on (i.psrno=d.psrno and i.prdid=d.prdid and i.specno=d.specno "
				  + "   and ma.brhid=i.brhid) "
				  + "  left join (select sum(qty) qty,sum(total) total,sum(discount) discount,sum(nettotal) nettotal,psrno,rdocno,specno,prdid from my_joborderd where  rdocno in("+docno+") "
				   + " group by  psrno) aa on aa.psrno=i.psrno "
				   + "  left join( select date,sum(op_qty) op_qty,stockid,sum(out_qty+del_qty+rsv_qty) outqty,prdid,psrno,specno,brhid "
				  + "  from my_prddin where 1=1 group by psrno) ii on "
				 + "   (ii.psrno=i.psrno and ii.prdid=i.prdid and ii.specno=i.specno and ma.brhid=ii.brhid) "
				 + "    where m.status=3  and d.status in(0,1) and d.rdocno in("+docno+") and ma.brhid='"+branch+"' group by i.prdid  order by i.date,i.prdid ) as a ) as b ";
 
				 
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

	
	public JSONArray fixingGridReload(String  branch,String docno) throws SQLException {


		JSONArray RESULTDATA=new JSONArray();

		Connection conn = null;

		try {

			if(((docno.equalsIgnoreCase(""))||(docno.equalsIgnoreCase("undefined")))){

				docno="0";
			}

		 
			conn = ClsConnection.getMyConnection();
			Statement stmt = conn.createStatement();


			String	sql=" select rdocno,fixing,brandname,clstatus,1 method, stkid,specid,psrno as prodoc,psrno as doc_no,rdocno,psrno,qty+balqty totqty, qty,qty as oldqty, "
						+ "  outqty,case when (totqty-outqty)=0 then 0 else (qty+balqty) end as balqty,0 size,part_no, "
						+ "  productid as proid,productid,productname as proname,productname,unit,unitdocno, totwtkg, "
						+ "  kgprice, unitprice, total, discper,  dis, netotal from(select  fixing,brandname,clstatus,stkid,specid,psrno as doc_no, "
						+ "   rdocno,psrno,qtys as totqty, qty,qtys,outqty,(qtys-outqty) as balqty,0 size,part_no,productid, "
						+ "   productname,unit,unitdocno, totwtkg, kgprice, unitprice, total, discper,  dis, netotal from "
						+ "   ( select if(d.fixing=1,'YES','NO') fixing,bd.brandname,d.clstatus, d.stockid as stkid,"
						+ " d.specno as specid,d.rdocno,m.doc_no psrno,aa.qty as qty, ii.op_qty "
						+ "   as qtys,ii.outqty,m.part_no,m.part_no productid,m.productname, "
						+ "    u.unit,u.doc_no unitdocno,d.NtWtKG totwtkg, d.KGPrice kgprice,d.amount unitprice,aa.total total,d.disper "
						+ "   discper, aa.discount dis,aa.nettotal netotal from my_joborderm ma left join my_joborderd d on(ma.doc_no=d.rdocno) "
						+ "   left join my_main m on(d.psrno=m.doc_no and d.prdid=m.psrno) left join  my_unitm u on(d.unitid=u.doc_no) "
						+ "  left join my_prodattrib at on(at.mpsrno=m.doc_no and d.specno=at.mpsrno ) left join  my_brand bd on m.brandid=bd.doc_no "
						+ "  left join my_prddin i on (i.psrno=d.psrno and i.prdid=d.prdid and i.specno=d.specno "
						+ "   and ma.brhid=i.brhid) "
						+ "  left join (select sum(qty) qty,sum(total) total,sum(discount) discount,sum(nettotal) nettotal,psrno,rdocno,specno,prdid from my_joborderd where  rdocno in("+docno+") "
						+ "  group by  psrno) aa on aa.psrno=i.psrno "
						+ "  left join( select date,sum(op_qty) op_qty,stockid,sum(out_qty+del_qty+rsv_qty) outqty,prdid,psrno,specno,brhid "
						+ "  from my_prddin where 1=1 group by psrno) ii on "
						+ "   (ii.psrno=i.psrno and ii.prdid=i.prdid and ii.specno=i.specno and ma.brhid=ii.brhid) "
						+ "    where m.status=3  and d.status=1 and d.rdocno in("+docno+") and ma.brhid='"+branch+"' group by i.prdid  order by i.date,i.prdid ) as a ) as b ";
 
				 
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

	
}
