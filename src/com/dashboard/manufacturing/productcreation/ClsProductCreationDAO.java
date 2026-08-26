package com.dashboard.manufacturing.productcreation;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Enumeration;

import javax.servlet.http.HttpSession;

import com.common.ClsCommon;
import com.connection.ClsConnection;

import net.sf.json.JSONArray;

public class ClsProductCreationDAO {
	ClsConnection ClsConnection=new ClsConnection();
	ClsCommon ClsCommon=new ClsCommon();
	
	public JSONArray secondload(String id,String docno,String qty) throws SQLException {
		JSONArray RESULTDATA=new JSONArray();
		if(!id.equalsIgnoreCase("1")){
			return RESULTDATA;      
		}

		
		Connection conn = null;   

		try {
			conn = ClsConnection.getMyConnection();
			Statement stmt = conn.createStatement();     
			String sql="select mm.doc_no mpsrno,u.doc_no uomid, mm.psrno,cat.category,sc.subcategory,bd.brandname,part_no pid,productname pdesc,u.unit uom,p.name mtype from my_main mm  left join  my_brand bd on mm.brandid=bd.doc_no left join my_catm cat on(mm.catid=cat.doc_no) left join my_scatm sc on(mm.scatid=sc.doc_no)  left join my_unitm u on u.doc_no=mm.munit left join my_prodtype p on p.doc_no=mm.prdtype where mm.status=3 and mm.prdtype=9 ";
			//System.out.println("stkdoc==="+docno.length());
			
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
	
	public JSONArray viewload(String id,String docno,String qty) throws SQLException {
		JSONArray RESULTDATA=new JSONArray();
		if(!id.equalsIgnoreCase("1")){
			return RESULTDATA;      
		}

		
		Connection conn = null;   

		try {
			conn = ClsConnection.getMyConnection();
			Statement stmt = conn.createStatement();     
			String sql="select mm.doc_no mpsrno,u.doc_no uomid, mm.psrno,cat.category,sc.subcategory,bd.brandname,mm.part_no pid,mm.productname pdesc,u.unit uom,p.name mtype,dt.department,m2.doc_no deppsrno,m2.part_no deppartno,m2.productname depproduct from my_main mm left join my_main m2 on mm.doc_no=m2.mainpsrno left join my_dept dt on m2.deptid=dt.doc_no left join  my_brand bd on mm.brandid=bd.doc_no left join my_catm cat on(mm.catid=cat.doc_no) left join my_scatm sc on(mm.scatid=sc.doc_no)  left join my_unitm u on u.doc_no=mm.munit left join my_prodtype p on p.doc_no=mm.prdtype where mm.status=3 and m2.mainpsrno<>0";
			//System.out.println("stkdoc==="+docno.length());
			
			System.out.println("------viewload------"+sql);   
			ResultSet resultSet = stmt.executeQuery(sql);
			RESULTDATA=ClsCommon.convertToJSON(resultSet);   


		}catch(Exception e){
			e.printStackTrace();

		}finally{
			conn.close();
		}
		return RESULTDATA;
	}
	
	
	public JSONArray deptload(String id,String docno,String deptid) throws SQLException {
		JSONArray RESULTDATA=new JSONArray();
		if(!id.equalsIgnoreCase("1")){
			return RESULTDATA;      
		}

		
		Connection conn = null;   

		try {
			conn = ClsConnection.getMyConnection();
			Statement stmt = conn.createStatement(); 
			String sql="",sqlval="";
			String sqltst="select coalesce(cast(group_concat(deptid)as char(50)),0)deptid from my_main where mainpsrno="+docno+" and measure<>0";
			ResultSet res2 = stmt.executeQuery(sqltst);
			if(res2.next()) {
				sqlval=res2.getString("deptid");
			}
				sql="select @a:=@a+1 calc,@a rowss,g.* from(select 'Search' srchbtn,d.doc_no deptid,cast(psrno as char(50))psrno,cast(m.doc_no as char(50)) mpsrno,d.department dept,part_no pid,productname as pdesc,d.measure from my_dept d left join my_main m on d.doc_no=m.deptid  where mainpsrno="+docno+" and m.measure<>0\r\n" + 
						"union all\r\n" + 
						"select 'Search' srchbtn,d.doc_no deptid,'' psrno,'' mpsrno,d.department dept,'' pid,concat((select productname from my_main where doc_no="+docno+"),'-',d.department) pdesc,d.measure from my_dept d  where doc_no not in("+sqlval+") and measure<>0)g,(select @a:=0)a";
			
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
					String sql="select bd.brandname,dt.department, at.mspecno as specid, m.part_no,m.doc_no,u.unit,m.munit,m.psrno,concat(m.productname,'-',dt.department)pdesc from my_main m left join  "
							+ " my_unitm u on m.munit=u.doc_no left join my_dept dt on m.deptid=dt.doc_no and dt.status=3 left join my_prodattrib at on(at.mpsrno=m.doc_no) left join  my_brand bd on m.brandid=bd.doc_no  "
							+ " left join my_catm c on c.doc_no=m.catid left join my_scatm sc on m.scatid=sc.doc_no"
							+"    where m.status=3 and m.prdtype=2 and dt.doc_no="+dept+"";
				
					
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
