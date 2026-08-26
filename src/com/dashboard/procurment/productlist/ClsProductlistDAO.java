package com.dashboard.procurment.productlist;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.http.HttpSession;

import com.common.ClsCommon;
import com.connection.ClsConnection;

import net.sf.json.JSONArray;

public class ClsProductlistDAO { 

	ClsConnection ClsConnection=new ClsConnection();
	ClsCommon ClsCommon =new ClsCommon();
	
	public JSONArray productlist(HttpSession session,String hidbrand,String fromDate,String toDate,String hidtype,String hidcat,
			String hidsubcat,String hidproduct,String branchid,String hidept,String type,String typess,String criteria) throws SQLException {


		JSONArray RESULTDATA=new JSONArray();

		Connection conn = null;

		try {
			 conn = ClsConnection.getMyConnection();
			Statement stmt = conn.createStatement();
			 
			String sql="";

	 
			String sqls=""; 

			String sqls1="";
	        
	/*        java.sql.Date frmdate = null;
	     	if(!(fromDate.equalsIgnoreCase("undefined"))&&!(fromDate.equalsIgnoreCase(""))&&!(fromDate.equalsIgnoreCase("0")))
	     	{
	     		frmdate=ClsCommon.changeStringtoSqlDate(fromDate);
	     		
	     	}
	     	else{
	     
	     	}

	        java.sql.Date todate = null;
	     	if(!(toDate.equalsIgnoreCase("undefined"))&&!(toDate.equalsIgnoreCase(""))&&!(toDate.equalsIgnoreCase("0")))
	     	{
	     		todate=ClsCommon.changeStringtoSqlDate(toDate);
	     		
	     	}
	     	else{
	     
	     	}*/
			
	    	if(!((branchid.equalsIgnoreCase("a")) || (branchid.equalsIgnoreCase("NA")) || (branchid.equalsIgnoreCase("0")))){
	    		
	    		sqls1=" and de.brhid='"+branchid+"'";
	 		}

			if(!(hidbrand.equalsIgnoreCase("0") || hidbrand.equalsIgnoreCase("") || hidbrand.equalsIgnoreCase("undefined"))){
				sqls=sqls +" and bd.doc_no in ("+hidbrand+")";
			}

			if(!(hidtype.equalsIgnoreCase("0") || hidtype.equalsIgnoreCase("") || hidtype.equalsIgnoreCase("undefined"))){
				sqls=sqls + "and pt.doc_no in ("+hidtype+")";
			}

			if(!(hidcat.equalsIgnoreCase("0") || hidcat.equalsIgnoreCase("") || hidcat.equalsIgnoreCase("undefined"))){
				sqls=sqls + "and cat.doc_no in ("+hidcat+")";
			}
			if(!(hidsubcat.equalsIgnoreCase("0") || hidsubcat.equalsIgnoreCase("") || hidsubcat.equalsIgnoreCase("undefined"))){
				sqls=sqls + "and sc.doc_no in ("+hidsubcat+")";
			}

			if(!(hidproduct.equalsIgnoreCase("0") || hidproduct.equalsIgnoreCase("") || hidproduct.equalsIgnoreCase("undefined"))){
				sqls=sqls + "and m.doc_no in ("+hidproduct+")";
			}
			 
			if(!(hidept.equalsIgnoreCase("0") || hidept.equalsIgnoreCase("") || hidept.equalsIgnoreCase("undefined"))){
				sqls=sqls + "and dep.doc_no in ("+hidept+")";
			}
			if(!(typess.equalsIgnoreCase("0") || typess.equalsIgnoreCase("") || typess.equalsIgnoreCase("undefined"))){
				sqls=sqls + "and m.prdtype in ("+typess+")";
			}
			if(!(criteria.equalsIgnoreCase("0") || criteria.equalsIgnoreCase("") || criteria.equalsIgnoreCase("undefined"))){
				sqls=sqls + "and m.criteria in ("+criteria+")";
			}
		if(type.equalsIgnoreCase("1"))
		{
			 
			sql=" Select ptp.name,case when m.criteria=1 then 'To Produce' when m.criteria=2 then 'To Buy' when m.criteria=3 then 'Both' end criteria ,dep.department,sc.subcategory,pt.producttype type,cat.category cat,bd.brandname brand, at.mspecno as specid, m.part_no productid,"
					+ "m.productname productname,m.doc_no,u.unit,m.munit,m.psrno,m.fixingprice stdprice,m.mrp fixingprice, convert(if(m.lbrchg=0,'',m.lbrchg),char(100))  fixedcharge from "
					+ "my_main m left join "
					+ "   my_unitm u on m.munit=u.doc_no  left join my_prodattrib at on(at.mpsrno=m.doc_no)   left join my_desc de on(de.psrno=m.doc_no "+sqls1+") "
					+ "   left join  my_brand bd on m.brandid=bd.doc_no left join my_catm cat on(m.catid=cat.doc_no) "
					+ " left join my_scatm sc on(m.scatid=sc.doc_no) left join my_dept dep on(dep.doc_no=m.deptid)  "
					+ " left join my_ptype pt on(m.typeid=pt.doc_no) left join my_prodtype ptp on m.prdtype=ptp.doc_no   where m.status=3 and de.discontinued=0     "
					+ "   "+sqls+" "+sqls1+" group by m.doc_no;";




	 System.out.println("==product list===="+sql);

			ResultSet resultSet = stmt.executeQuery(sql);


			RESULTDATA=ClsCommon.convertToJSON(resultSet);
		}

		}catch(Exception e){
			e.printStackTrace();

		}finally{
			conn.close();
		}
		return RESULTDATA;
	}

	
	public JSONArray productlistexcel(HttpSession session,String hidbrand,String fromDate,String toDate,String hidtype,String hidcat,
			String hidsubcat,String hidproduct,String branchid,String hidept,String type,String typess,String criteria) throws SQLException {


		JSONArray RESULTDATA=new JSONArray();

		Connection conn = null;

		try {
			 conn = ClsConnection.getMyConnection();
			Statement stmt = conn.createStatement();
			 
			String sql="";

	 
			String sqls="";

			String sqls1="";
	        
	/*        java.sql.Date frmdate = null;
	     	if(!(fromDate.equalsIgnoreCase("undefined"))&&!(fromDate.equalsIgnoreCase(""))&&!(fromDate.equalsIgnoreCase("0")))
	     	{
	     		frmdate=ClsCommon.changeStringtoSqlDate(fromDate);
	     		
	     	}
	     	else{
	     
	     	}

	        java.sql.Date todate = null;
	     	if(!(toDate.equalsIgnoreCase("undefined"))&&!(toDate.equalsIgnoreCase(""))&&!(toDate.equalsIgnoreCase("0")))
	     	{
	     		todate=ClsCommon.changeStringtoSqlDate(toDate);
	     		
	     	}
	     	else{
	     
	     	}*/
			
	    	if(!((branchid.equalsIgnoreCase("a")) || (branchid.equalsIgnoreCase("NA")) || (branchid.equalsIgnoreCase("0")))){
	    		sqls1=" and de.brhid='"+branchid+"'";
	 		}

			if(!(hidbrand.equalsIgnoreCase("0") || hidbrand.equalsIgnoreCase("") || hidbrand.equalsIgnoreCase("undefined"))){
				sqls=sqls +" and bd.doc_no in ("+hidbrand+")";
			}

			if(!(hidtype.equalsIgnoreCase("0") || hidtype.equalsIgnoreCase("") || hidtype.equalsIgnoreCase("undefined"))){
				sqls=sqls + "and pt.doc_no in ("+hidtype+")";
			}

			if(!(hidcat.equalsIgnoreCase("0") || hidcat.equalsIgnoreCase("") || hidcat.equalsIgnoreCase("undefined"))){
				sqls=sqls + "and cat.doc_no in ("+hidcat+")";
			}
			if(!(hidsubcat.equalsIgnoreCase("0") || hidsubcat.equalsIgnoreCase("") || hidsubcat.equalsIgnoreCase("undefined"))){
				sqls=sqls + "and sc.doc_no in ("+hidsubcat+")";
			}

			if(!(hidproduct.equalsIgnoreCase("0") || hidproduct.equalsIgnoreCase("") || hidproduct.equalsIgnoreCase("undefined"))){
				sqls=sqls + "and m.doc_no in ("+hidproduct+")";
			}
			 
			if(!(hidept.equalsIgnoreCase("0") || hidept.equalsIgnoreCase("") || hidept.equalsIgnoreCase("undefined"))){
				sqls=sqls + "and dep.doc_no in ("+hidept+")";
			}
			if(!(typess.equalsIgnoreCase("0") || typess.equalsIgnoreCase("") || typess.equalsIgnoreCase("undefined"))){
				sqls=sqls + "and m.prdtype in ("+typess+")";
			}
			if(!(criteria.equalsIgnoreCase("0") || criteria.equalsIgnoreCase("") || criteria.equalsIgnoreCase("undefined"))){
				sqls=sqls + "and m.criteria in ("+criteria+")";
			} 
		if(type.equalsIgnoreCase("1"))
		{
			 
			sql=" Select  m.part_no Product,m.productname 'product Name' ,u.unit,bd.brandname Brand,pt.producttype Type,cat.Category,sc.Subcategory,dep.Department   from my_main m left join "
					+ "   my_unitm u on m.munit=u.doc_no  left join my_prodattrib at on(at.mpsrno=m.doc_no)   left join my_desc de on(de.psrno=m.doc_no "+sqls1+") "
					+ "   left join  my_brand bd on m.brandid=bd.doc_no left join my_catm cat on(m.catid=cat.doc_no) "
					+ " left join my_scatm sc on(m.scatid=sc.doc_no) left join my_dept dep on(dep.doc_no=m.deptid)  "
					+ " left join my_ptype pt on(m.typeid=pt.doc_no)   where m.status=3 and de.discontinued=0     "
					+ "   "+sqls+" "+sqls1+" group by m.doc_no;";




		// System.out.println("==sql==asdasd=="+sql);

			ResultSet resultSet = stmt.executeQuery(sql);


			RESULTDATA=ClsCommon.convertToEXCEL(resultSet);
		}

		}catch(Exception e){
			e.printStackTrace();

		}finally{
			conn.close();
		}
		return RESULTDATA;
	}
	public JSONArray prodTypeSearch(HttpSession session) throws SQLException {


		JSONArray RESULTDATA=new JSONArray();

		Connection conn = null;

		try {
			conn = ClsConnection.getMyConnection();
			Statement stmt = conn.createStatement();

			String sql="select doc_no,name as type from my_prodtype where status=3";

			ResultSet resultSet = stmt.executeQuery(sql);
			RESULTDATA=ClsCommon.convertToJSON(resultSet);


		}catch(Exception e){
			e.printStackTrace();

		}finally{
			conn.close();
		}
		return RESULTDATA;
	}
	
	public JSONArray criteriaSearch(HttpSession session) throws SQLException {


		JSONArray RESULTDATA=new JSONArray();

		Connection conn = null;

		try {
			conn = ClsConnection.getMyConnection();
			Statement stmt = conn.createStatement();

			String sql="select 1 doc_no,'To Produce' as crtname union all select 2 doc_no,'To Buy' as crtname union all select 3 doc_no,'Both' as crtname ";

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
