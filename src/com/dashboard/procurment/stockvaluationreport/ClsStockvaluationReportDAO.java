package com.dashboard.procurment.stockvaluationreport;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import javax.servlet.http.HttpSession;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import com.common.ClsCommon;
import com.connection.ClsConnection;

public class ClsStockvaluationReportDAO {

 

	 
 
	 

		ClsConnection ClsConnection=new ClsConnection();
		ClsCommon ClsCommon=new ClsCommon();
		public JSONArray brandSearch(HttpSession session) throws SQLException {


			JSONArray RESULTDATA=new JSONArray();

			Connection conn = null;

			try {
				conn = ClsConnection.getMyConnection();
				Statement stmt = conn.createStatement();

				String sql="select doc_no,brand from my_brand where status=3";

				ResultSet resultSet = stmt.executeQuery(sql);
				RESULTDATA=ClsCommon.convertToJSON(resultSet);


			}catch(Exception e){
				e.printStackTrace();

			}finally{
				conn.close();
			}
			return RESULTDATA;
		}

		public JSONArray suitbrandSearch(HttpSession session) throws SQLException {


			JSONArray RESULTDATA=new JSONArray();

			Connection conn = null;

			try {
				conn = ClsConnection.getMyConnection();
				Statement stmt = conn.createStatement();

				String sql="select convert(doc_no,char(50)) as doc_no,brand from (select doc_no,brand from my_sbrand where status=3 union all select '-1','ALL') as a ";

				ResultSet resultSet = stmt.executeQuery(sql);
				RESULTDATA=ClsCommon.convertToJSON(resultSet);


			}catch(Exception e){
				e.printStackTrace();

			}finally{
				conn.close();
			}
			return RESULTDATA;
		}


		public JSONArray suitmodelSearch(HttpSession session,String brandid) throws SQLException {


			JSONArray RESULTDATA=new JSONArray();

			Connection conn = null;

			try {
				conn = ClsConnection.getMyConnection();
				Statement stmt = conn.createStatement();

				//String sql="select m.doc_no,model,brand from my_smodel m left join my_sbrand b on(m.brandid=b.doc_no) where b.status=3 and m.status=3 and b.doc_no in ("+brandid+")";
				String sql="select convert(doc_no,char(50)) as doc_no,model,brand from ( select m.doc_no,model,brand from my_smodel m left join my_sbrand b on(m.brandid=b.doc_no) where b.status=3 and m.status=3 and m.brandid='"+brandid+"' union all select '-1','ALL','') as a";
				System.out.println("===modelSearch===="+sql);
				ResultSet resultSet = stmt.executeQuery(sql);
				RESULTDATA=ClsCommon.convertToJSON(resultSet);


			}catch(Exception e){
				e.printStackTrace();

			}finally{
				conn.close();
			}
			return RESULTDATA;
		}

		public JSONArray subModelSearch(HttpSession session,String brandid,String modelid) throws SQLException {


			JSONArray RESULTDATA=new JSONArray();

			Connection conn = null;

			try {
				conn = ClsConnection.getMyConnection();
				Statement stmt = conn.createStatement();

				//String sql="select m.doc_no,model,brand from my_smodel m left join my_sbrand b on(m.brandid=b.doc_no) where b.status=3 and m.status=3 and m.brandid='"+brandid+"'";
				String sql="select convert(doc_no,char(50)) as doc_no,submodel,model from "
						+ "( select m.doc_no,submodel,model from my_ssubmodel m left join my_smodel mo "
						+ "on(m.modelid=mo.doc_no) where mo.status=3 and m.status=3 and m.modelid="+modelid+""
						+ " and m.brandid="+brandid+" union all select '-1','ALL','') as a";
				System.out.println("===subModelSearch===="+sql);
				ResultSet resultSet = stmt.executeQuery(sql);
				RESULTDATA=ClsCommon.convertToJSON(resultSet);


			}catch(Exception e){
				e.printStackTrace();

			}finally{
				conn.close();
			}
			return RESULTDATA;
		}

		public JSONArray yomSearch(HttpSession session) throws SQLException {


			JSONArray RESULTDATA=new JSONArray();

			Connection conn = null;

			try {
				conn = ClsConnection.getMyConnection();
				Statement stmt = conn.createStatement();

				//String sql="select doc_no,yom from my_syom where status=3";
				String sql="select convert(doc_no,char(50)) as doc_no,yom from ( select doc_no,yom from my_syom where status=3 union all select '-1','ALL') as a";
				ResultSet resultSet = stmt.executeQuery(sql);
				RESULTDATA=ClsCommon.convertToJSON(resultSet);


			}catch(Exception e){
				e.printStackTrace();

			}finally{
				conn.close();
			}
			return RESULTDATA;
		}

		public JSONArray suitSpec1Search(HttpSession session) throws SQLException {


			JSONArray RESULTDATA=new JSONArray();

			Connection conn = null;

			try {
				conn = ClsConnection.getMyConnection();
				Statement stmt = conn.createStatement();

				//String sql="select doc_no,spec from my_suitspec1 where status=3";
				String sql="select convert(doc_no,char(50)) as doc_no,spec from ( select doc_no,spec from my_suitspec1 where status=3 union all select '-1','ALL') as a";
				ResultSet resultSet = stmt.executeQuery(sql);
				RESULTDATA=ClsCommon.convertToJSON(resultSet);


			}catch(Exception e){
				e.printStackTrace();

			}finally{
				conn.close();
			}
			return RESULTDATA;
		}

		public JSONArray suitSpec2Search(HttpSession session) throws SQLException {

			JSONArray RESULTDATA=new JSONArray();

			Connection conn = null;

			try {
				conn = ClsConnection.getMyConnection();
				Statement stmt = conn.createStatement();

				//String sql="select doc_no,spec from my_suitspec2 where status=3";
				String sql="select convert(doc_no,char(50)) as doc_no,spec from ( select doc_no,spec from my_suitspec2 where status=3 union all select '-1','ALL') as a";
				ResultSet resultSet = stmt.executeQuery(sql);
				RESULTDATA=ClsCommon.convertToJSON(resultSet);


			}catch(Exception e){
				e.printStackTrace();

			}finally{
				conn.close();
			}
			return RESULTDATA;
		}

		public JSONArray suitSpec3Search(HttpSession session) throws SQLException {

			JSONArray RESULTDATA=new JSONArray();

			Connection conn = null;

			try {
				conn = ClsConnection.getMyConnection();
				Statement stmt = conn.createStatement();

				//String sql="select doc_no,spec from my_suitspec3 where status=3";
				String sql="select convert(doc_no,char(50)) as doc_no,spec from ( select doc_no,spec from my_suitspec3 where status=3 union all select '-1','ALL') as a";
				ResultSet resultSet = stmt.executeQuery(sql);
				RESULTDATA=ClsCommon.convertToJSON(resultSet);


			}catch(Exception e){
				e.printStackTrace();

			}finally{
				conn.close();
			}
			return RESULTDATA;
		}

		public JSONArray typeSearch(HttpSession session) throws SQLException {


			JSONArray RESULTDATA=new JSONArray();

			Connection conn = null;

			try {
				conn = ClsConnection.getMyConnection();
				Statement stmt = conn.createStatement();

				String sql="select doc_no,producttype ptype from my_ptype where status=3";

				ResultSet resultSet = stmt.executeQuery(sql);
				RESULTDATA=ClsCommon.convertToJSON(resultSet);


			}catch(Exception e){
				e.printStackTrace();

			}finally{
				conn.close();
			}
			return RESULTDATA;
		}

		public JSONArray productSearch(HttpSession session,String brandid,String catid,String subcatid) throws SQLException {


			JSONArray RESULTDATA=new JSONArray();

			Connection conn = null;

			try {
				conn = ClsConnection.getMyConnection();
				Statement stmt = conn.createStatement();
				String sql1="";
				//System.out.println("brandid===="+brandid);
				if(!(brandid.equals("0") || brandid.equals(""))){
					sql1="and b.doc_no in ("+brandid+")";
				}

				String sql2="";
				//System.out.println("brandid===="+brandid);
				if(!(catid.equals("0") || catid.equals(""))){
					sql2="and c.doc_no in ("+catid+")";
				}

				String sql3="";
				//System.out.println("brandid===="+brandid);
				if(!(subcatid.equals("0") || subcatid.equals(""))){
					sql3="and s.doc_no in ("+subcatid+")";
				}


				String sql="select m.doc_no,m.part_no prodcode,m.productname prodname,b.brand from my_main m inner join my_brand b on(m.brandid=b.doc_no)"
						+ "inner join my_catm c on(m.catid=c.doc_no) inner join my_scatm s on(m.scatid=s.doc_no)  where m.status=3 "+sql1+" "+sql2+" "+sql3+"";
				System.out.println("==productSearch==="+sql);
				ResultSet resultSet = stmt.executeQuery(sql);
				RESULTDATA=ClsCommon.convertToJSON(resultSet);


			}catch(Exception e){
				e.printStackTrace();

			}finally{
				conn.close();
			}
			return RESULTDATA;
		}

		public JSONArray catSearch(HttpSession session) throws SQLException {


			JSONArray RESULTDATA=new JSONArray();

			Connection conn = null;

			try {
				conn = ClsConnection.getMyConnection();
				Statement stmt = conn.createStatement();

				String sql="select category cat,doc_no  from my_catm where status=3";

				ResultSet resultSet = stmt.executeQuery(sql);
				RESULTDATA=ClsCommon.convertToJSON(resultSet);


			}catch(Exception e){
				e.printStackTrace();

			}finally{
				conn.close();
			}
			return RESULTDATA;
		}

		public JSONArray deptSearch(HttpSession session) throws SQLException {


			JSONArray RESULTDATA=new JSONArray();

			Connection conn = null;

			try {
				conn = ClsConnection.getMyConnection();
				Statement stmt = conn.createStatement();

				String sql = "select department dept, doc_no from my_dept where status<>7";

				ResultSet resultSet = stmt.executeQuery(sql);
				RESULTDATA=ClsCommon.convertToJSON(resultSet);


			}catch(Exception e){
				e.printStackTrace();

			}finally{
				conn.close();
			}
			return RESULTDATA;
		}

		public JSONArray subCatSearch(HttpSession session,String catid) throws SQLException {


			JSONArray RESULTDATA=new JSONArray();

			Connection conn = null;

			try {
				conn = ClsConnection.getMyConnection();
				Statement stmt = conn.createStatement();

				String sql = "select subcategory subcat,s.doc_no,category cat  from my_scatm s inner join my_catm c on(c.doc_no=s.catid) and c.doc_no in ("+catid+")";

				ResultSet resultSet = stmt.executeQuery(sql);
				RESULTDATA=ClsCommon.convertToJSON(resultSet);


			}catch(Exception e){
				e.printStackTrace();

			}finally{
				conn.close();
			}
			return RESULTDATA;
		}

		public JSONArray locationSearch(HttpSession session,String brhdid) throws SQLException {


			JSONArray RESULTDATA=new JSONArray();

			Connection conn = null;

			try {
				conn = ClsConnection.getMyConnection();
				Statement stmt = conn.createStatement();
				
				String sqls="";
				
				if(!(brhdid.equalsIgnoreCase("0") || brhdid.equalsIgnoreCase("") || brhdid.equalsIgnoreCase("a"))){
					sqls="and b.doc_no in ("+brhdid+")";
				}
				

				String sql = "select l.loc_name locname,l.doc_no,b.branchname from "
						+ " my_locm l left join my_brch b on b.doc_no=l.brhid where l.status=3 "+sqls+" ";

				
				
				System.out.println("====sql====="+sql);
				ResultSet resultSet = stmt.executeQuery(sql);
				RESULTDATA=ClsCommon.convertToJSON(resultSet);


			}catch(Exception e){
				e.printStackTrace();

			}finally{
				conn.close();
			}
			return RESULTDATA;
		}
		public JSONArray partSearch(HttpSession session,String hidbrand,String fromDate,String toDate,String hidtype,String hidcat,
				String hidsubcat,String hidproduct,String branchid,String hidept) throws SQLException {


			JSONArray RESULTDATA=new JSONArray();

			Connection conn = null;

			try {
				conn = ClsConnection.getMyConnection();
				Statement stmt = conn.createStatement();
				String minyom="",maxyom="";
				String sql ="";
				//System.out.println("==hidsbrand==="+hidsbrand+"==hidsmodel=="+hidsmodel+"==hidyom==="+hidyom+"=hidspec1=="+hidspec1+"==hidspec2=="+hidspec2+"==hidspec3=="+hidspec3+"==hidbrand==="+hidbrand+"==hidcat==="+hidcat+"==hidsubcat=="+hidsubcat+"==hidproduct="+hidproduct);


				String sql1="",sql2="",sql3="",sql4="",sql5="",sql6="",sql7="",sql8="",sql9="",sql10="",sql11="",sql12="",sql13="",sqlfinal="";

				if(!(hidbrand.equals("0") || hidbrand.equals("") || hidbrand.equals("undefined"))){
					sql7="and b.doc_no in ("+hidbrand+")";
				}

				if(!(hidtype.equals("0") || hidtype.equals("") || hidtype.equals("undefined"))){
					sql8="and pt.doc_no in ("+hidtype+")";
				}

				if(!(hidcat.equals("0") || hidcat.equals("") || hidcat.equals("undefined"))){
					sql9="and c.doc_no in ("+hidcat+")";
				}
				if(!(hidsubcat.equals("0") || hidsubcat.equals("") || hidsubcat.equals("undefined"))){
					sql10="and sc.doc_no in ("+hidsubcat+")";
				}

				if(!(hidproduct.equals("0") || hidproduct.equals("") || hidproduct.equals("undefined"))){
					sql11="and m.doc_no in ("+hidproduct+")";
				}
				if(!(branchid.equals("0") || branchid.equals("") || branchid.equals("undefined")|| branchid.equals("a"))){
					sql12="and d.brhid in ("+branchid+")";
				}
				if(!(hidept.equals("0") || hidept.equals("") || hidept.equals("undefined"))){
					sql13="and dep.doc_no in ("+hidept+")";
				}

				sqlfinal=sql1+sql2+sql3+sql4+sql5+sql6+sql7+sql8+sql9+sql10+sql11+sql12+sql13;




				sql = "select  m.psrno,m.part_no product,m.productname pdesc,pt.producttype as type,b.brand as brand,c.category as cat,sc.subcategory as scat,"
						+ "br.branchname as branch,"
						+ "dep.department as dept from my_main m inner join my_desc d on(m.doc_no=d.psrno) "
						+ "left join my_prodsuit s on(m.doc_no=s.psrno) left join my_vehsuitmaster vs on(vs.doc_no=s.vehsuitid) "
						+ "left join my_ptype pt on(m.typeid=pt.doc_no) left join my_brand b on(m.brandid=b.doc_no) "
						+ "left join my_dept dep on(dep.doc_no=m.deptid) left join my_catm c on(m.catid=c.doc_no) "
						+ "left join my_scatm sc on(m.scatid=sc.doc_no)  "
						+ "left join my_brch br on(br.doc_no=d.brhid)"
						+ "where m.status=3 "+sqlfinal+" group by m.doc_no ";

				System.out.println("==sql=type1==="+sql);

				ResultSet resultSet = stmt.executeQuery(sql);


				RESULTDATA=ClsCommon.convertToJSON(resultSet);


			}catch(Exception e){
				e.printStackTrace();

			}finally{
				conn.close();
			}
			return RESULTDATA;
		}
		
 

		public JSONArray listdata(HttpSession session,String hidbrand,String fromDate,String toDate,String hidtype,String hidcat,
				String hidsubcat,String hidproduct,String branchid,String hidept,String load,String prodgroupby,String hidlocid) throws SQLException {


			JSONArray RESULTDATA=new JSONArray();
 	if(!(load.equalsIgnoreCase("yes")))
			{
				return RESULTDATA;
			} 
			Connection conn = null;

			try {
				conn = ClsConnection.getMyConnection();
				Statement stmt = conn.createStatement();
				 
				String sql="";

				String sqlfrm="",sqlto="",sql1="",sql2="",sql3="",sql4="",sql5="",sql6="",sql7="",sql8="",sql9="",sql10="",sql11="",sql12="",sql13="",sql14="",sqlfinal="";

				String insqls1="";
				String insqls2="";
				java.sql.Date uptodate=ClsCommon.changeStringtoSqlDate(fromDate);

			/*	java.sql.Date todate=ClsCommon.changeStringtoSqlDate(toDate);*/
					String  sql71="";
					
					
				String joinsql="";	
				
				
				int kk=0;
					
				if(!(hidbrand.equalsIgnoreCase("0") || hidbrand.equalsIgnoreCase("") || hidbrand.equalsIgnoreCase("undefined"))){
					//sql7=" and bd.doc_no in ("+hidbrand+")";
					sql1=" and bd.doc_no in ("+hidbrand+")";
					kk=1;
					
					
				}

				 
				
				if(!(hidtype.equalsIgnoreCase("0") || hidtype.equalsIgnoreCase("") || hidtype.equalsIgnoreCase("undefined"))){
					sql2=" and pt.doc_no in ("+hidtype+")";
					kk=1; 
				}
				 
				if(!(hidept.equalsIgnoreCase("0") || hidept.equalsIgnoreCase("") || hidept.equalsIgnoreCase("undefined"))){
					sql3=" and dep.doc_no in ("+hidept+")";
					
					kk=1;
					
				}
				
	        
				if(!(hidcat.equalsIgnoreCase("0") || hidcat.equalsIgnoreCase("") || hidcat.equalsIgnoreCase("undefined"))){
					sql4=" and cat.doc_no in ("+hidcat+") ";
					
					kk=1; 
					
				}
				
			 
				if(!(hidsubcat.equalsIgnoreCase("0") || hidsubcat.equalsIgnoreCase("") || hidsubcat.equalsIgnoreCase("undefined"))){
					sql5=" and sc.doc_no in ("+hidsubcat+")";
					
					kk=1;
				}
	 
			 String insql="";
			 String insql2="";
					
				if(!(hidproduct.equalsIgnoreCase("0") || hidproduct.equalsIgnoreCase("") || hidproduct.equalsIgnoreCase("undefined"))){
					sql6=" and m.doc_no in ("+hidproduct+")";
					 
					insql= "  and pin.psrno in ("+hidproduct+")"; 
					insql2= "  and psrno in ("+hidproduct+")"; 
				}
				
				joinsql= sql1+sql2+sql3+sql4+sql5+sql6;
 
		/*		
				if(!(hidlocid.equalsIgnoreCase("0") || hidlocid.equalsIgnoreCase("") || hidlocid.equalsIgnoreCase("undefined"))){
					sql14=" and stks.locid in ("+hidlocid+")";
					
					locsql2="and pin.locid in ("+hidlocid+")  ";
					
	                locsql1= " and locid in ("+hidlocid+") ";
					
					
				}  
				*/
				
				 if(!(branchid.equalsIgnoreCase("0") || branchid.equalsIgnoreCase("") || branchid.equalsIgnoreCase("undefined")|| branchid.equalsIgnoreCase("a"))){
			      
					insqls2="and i.brhid="+branchid+"  ";
					
					insqls1= " and brhid="+branchid+" ";
					
					
				} 
				
				 

			String	sqljoin =  " left join my_ptype pt on(m.typeid=pt.doc_no) "
						+ " left join my_brand bd on(m.brandid=bd.doc_no) "
						+ " left join my_dept dep on(dep.doc_no=m.deptid) "
						+ " left join my_catm cat on(m.catid=cat.doc_no)"
						+ " left join my_scatm sc on(m.scatid=sc.doc_no)" ;
				
				String grp="";
				
				String name="";
				
			 
				  if(prodgroupby.equalsIgnoreCase("gptype"))
				{
					  grp = " group by m.typeid ";
					  name= " pt.producttype description , ";
					  kk=1;
				}
				else if(prodgroupby.equalsIgnoreCase("gpbrand"))
						{
					 grp = " group by m.brandid ";
					 
					 name= " bd.brandname description ,  " ;
					 kk=1;
						}
				  
				  
				
				
				else if(prodgroupby.equalsIgnoreCase("gpdept"))
				{ 
					 grp = " group by m.deptid ";
					 name= " dep.department  description ," ;
					 kk=1;
				}
				else if(prodgroupby.equalsIgnoreCase("gpcategory"))
						{
						  grp = " group by m.catid ";
						  name= " cat.category  description , " ;
						  kk=1;
						}
				else if(prodgroupby.equalsIgnoreCase("gpsubcategory"))
						{
						  grp = " group by m.scatid ";
						  name= " sc.subcategory description, " ;
						  kk=1;
						}
				else
				{
					grp = " group by s.psrno ";
					name= " m.part_no code,m.productname description ,  " ;
				}
 
				  if(kk==0)
				  {
					  sqljoin="";
				  }
				  
				
				
				 	  sql="select "+name+" sum(coalesce(s.qty,0))  quantity,sum(coalesce(amount,0)) amount from"
				 	  		+ " (select i.psrno,sum(i.op_qty)-sum(coalesce(o.qty,0)) qty,sum((i.op_qty-coalesce(o.qty,0))*i.cost_price) amount from my_prddin i left join "
				 			+ " (select coalesce(sum(qty),0) qty,stockid from  my_prddout where   date<='"+uptodate+"' "+insql2+"  "+insqls1+" group by stockid) o on i.stockid=o.stockid where   i.date<='"+uptodate+"' "+insql2+"  "+insqls2+" group by psrno ) s "
				 			+ " left join my_main m on(s.psrno=m.psrno) "+sqljoin+" where 1=1 "+joinsql+" "+grp+" ";
				 			 
		 System.out.println("=sql=="+sql);
				ResultSet resultSet = stmt.executeQuery(sql);


				RESULTDATA=ClsCommon.convertToJSON(resultSet);
				conn.close();

			}catch(Exception e){
				e.printStackTrace();
				conn.close();
			} 
			return RESULTDATA;
		}
 
	 
	}
