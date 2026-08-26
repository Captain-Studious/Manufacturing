package com.controlcentre.settings.suitabilitysettings.suitabilitymaster;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.Date;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import net.sf.json.JSONArray;

import com.common.ClsCommon;
import com.connection.ClsConnection;
import com.controlcentre.settings.userrolebi.ClsUserRoleBIBean;
import com.mysql.jdbc.PreparedStatement;
public class ClsSuitabilityMasterDAO {
	ClsConnection ClsConnection=new ClsConnection();
	ClsCommon ClsCommon=new ClsCommon();
	public int insert (java.sql.Date date,String formdet,String formcode,String productype,String mode) throws SQLException{

		Connection conn;
		conn=ClsConnection.getMyConnection();
		conn.setAutoCommit(false);
		java.sql.PreparedStatement stmt =null;
		int returns=0;
		try{

			Statement stmt1 = conn.createStatement();
			Statement stmtTest=conn.createStatement ();
			String testSql="select TYPE from my_stype where status<>7 and TYPE='"+productype+"'";
			ResultSet resultSet1 = stmtTest.executeQuery (testSql);
			if(resultSet1.next()){
				stmtTest.close();
				conn.close();
				return -1;
			}
			
			
			String sql1="select coalesce(max(doc_no)+1,1) docno from my_stype ";
			int docno=0;

			ResultSet rs = stmt1.executeQuery(sql1);
			if(rs.next()){
				docno=rs.getInt("docno");
			}


			String sql="INSERT INTO my_stype(doc_no,TYPE, date, status) VALUES ("+docno+",'"+productype+"','"+date+"',3)";


			stmt=conn.prepareStatement(sql);
			stmt.execute();
			conn.commit();
			returns=docno;
			/* int resultSet2 = stmt.executeUpdate(sql);*/
		}
		catch(Exception e){
			e.printStackTrace();
		}
		finally{
			conn.close();
		}

		return returns;

	}



	public int update (java.sql.Date date,String formdet,String formcode,String productype,String mode,int docno) throws SQLException{

		Connection conn;
		conn=ClsConnection.getMyConnection();
		conn.setAutoCommit(false);
		java.sql.PreparedStatement stmt =null;
		int returns=0;
		try{

			Statement stmtTest=conn.createStatement ();
			String testSql="select PRODUCTTYPE from my_ptype where status<>7 and PRODUCTTYPE='"+productype+"' and doc_no<>"+docno+"";
			ResultSet resultSet1 = stmtTest.executeQuery (testSql);
			if(resultSet1.next()){
				stmtTest.close();
				conn.close();
				return -1;
			}
			
			String sql="update my_stype set TYPE='"+productype+"',date='"+date+"' where doc_no="+docno+"";


			stmt=conn.prepareStatement(sql);
			stmt.execute();
			conn.commit();
			returns=docno;
			/* int resultSet2 = stmt.executeUpdate(sql);*/
		}
		catch(Exception e){
			e.printStackTrace();
		}
		finally{
			conn.close();
		}

		return returns;

	}


	public int delete (java.sql.Date date,String formdet,String formcode,String productype,String mode,int docno) throws SQLException{

		Connection conn;
		conn=ClsConnection.getMyConnection();
		conn.setAutoCommit(false);
		java.sql.PreparedStatement stmt =null;
		int returns=0;
		try{

			String sql="update my_stype set status=7 where doc_no="+docno+"";


			stmt=conn.prepareStatement(sql);
			stmt.execute();
			conn.commit();
			returns=1;
			/* int resultSet2 = stmt.executeUpdate(sql);*/
		}
		catch(Exception e){
			e.printStackTrace();
		}
		finally{
			conn.close();
		}

		return returns;

	}


	public int insertYom (java.sql.Date date,String formdet,String formcode,String yom,String mode) throws SQLException{

		Connection conn;
		conn=ClsConnection.getMyConnection();
		conn.setAutoCommit(false);
		java.sql.PreparedStatement stmt =null;
		int returns=0;
		try{

			Statement stmtTest=conn.createStatement ();
			String testSql="select yom from my_syom where status<>7 and yom='"+yom+"'";
			ResultSet resultSet1 = stmtTest.executeQuery (testSql);
			if(resultSet1.next()){
				stmtTest.close();
				conn.close();
				return -1;
			}
			Statement stmt1 = conn.createStatement();

			String sql1="select coalesce(max(doc_no)+1,1) docno from my_syom ";
			int docno=0;

			ResultSet rs = stmt1.executeQuery(sql1);
			if(rs.next()){
				docno=rs.getInt("docno");
			}


			String sql="INSERT INTO my_syom(doc_no,yom, date, status) VALUES ("+docno+",'"+yom+"','"+date+"',3)";


			stmt=conn.prepareStatement(sql);
			stmt.execute();
			conn.commit();
			returns=docno;
			/* int resultSet2 = stmt.executeUpdate(sql);*/
		}
		catch(Exception e){
			e.printStackTrace();
		}
		finally{
			conn.close();
		}

		return returns;

	}



	public int updateYom (java.sql.Date date,String formdet,String formcode,String yom,String mode,int docno) throws SQLException{

		Connection conn;
		conn=ClsConnection.getMyConnection();
		conn.setAutoCommit(false);
		java.sql.PreparedStatement stmt =null;
		int returns=0;
		try{
			Statement stmtTest=conn.createStatement ();
			String testSql="select yom from my_syom where status<>7 and yom='"+yom+"' and doc_no<>"+docno+"";
			ResultSet resultSet1 = stmtTest.executeQuery (testSql);
			if(resultSet1.next()){
				stmtTest.close();
				conn.close();
				return -1;
			}

			String sql="update my_syom set yom='"+yom+"',date='"+date+"' where doc_no="+docno+"";


			stmt=conn.prepareStatement(sql);
			stmt.execute();
			conn.commit();
			returns=docno;
			/* int resultSet2 = stmt.executeUpdate(sql);*/
		}
		catch(Exception e){
			e.printStackTrace();
		}
		finally{
			conn.close();
		}

		return returns;

	}


	public int deleteYom (java.sql.Date date,String formdet,String formcode,String yom,String mode,int docno) throws SQLException{

		Connection conn;
		conn=ClsConnection.getMyConnection();
		conn.setAutoCommit(false);
		java.sql.PreparedStatement stmt =null;
		int returns=0;
		try{

			String sql="update my_syom set status=7 where doc_no="+docno+"";


			stmt=conn.prepareStatement(sql);
			stmt.execute();
			conn.commit();
			returns=1;
			/* int resultSet2 = stmt.executeUpdate(sql);*/
		}
		catch(Exception e){
			e.printStackTrace();
		}
		finally{
			conn.close();
		}

		return returns;

	}

	public JSONArray brandSearch(HttpSession session,String yomfrm,String yomto) throws SQLException {


		JSONArray RESULTDATA=new JSONArray();

		Connection conn = null;

		try {
			conn = ClsConnection.getMyConnection();
			
			Statement stmt = conn.createStatement();

		//	String sql="select convert(doc_no,char(50)) as doc_no,brand from (select doc_no,brand from my_sbrand where status=3 union all select '-1','ALL' union all select '-2','' ) as a ";

			 String sql = "  select b.brand,b.doc_no,f.yom,t.yom from my_sbrand b	left join my_syom f on f.doc_no= b.frmyomid "
					 +"		left join my_syom t on t.doc_no= b.toyomid where   b.status=3 and b.frmyomid>0  and f.yom<='"+yomfrm+"' and  "
					 +"	   t.yom>='"+yomto+"'  ";
			 
			System.out.println("==sql===="+sql);
			
			ResultSet resultSet = stmt.executeQuery(sql);
			RESULTDATA=ClsCommon.convertToJSON(resultSet);


		}catch(Exception e){
			e.printStackTrace();

		}finally{
			conn.close();
		}
		return RESULTDATA;
	}
	
	
	public JSONArray subModelSearch(HttpSession session,String modelid,String yomfrm,String yomto) throws SQLException {


		JSONArray RESULTDATA=new JSONArray();

		Connection conn = null;

		try {
			conn = ClsConnection.getMyConnection();
			Statement stmt = conn.createStatement();

			 String sql="select convert(doc_no,char(50)) as doc_no,submodel,model from "
			+ "( select m.doc_no,submodel,model from my_ssubmodel m left join my_smodel mo "
			+ "on(m.modelid=mo.doc_no) left join my_syom f on f.doc_no= m.frmyomid "
			 +"		left join my_syom t on t.doc_no= m.toyomid where mo.status=3 and m.status=3 and m.modelid='"+modelid+"'  and f.yom<='"+yomfrm+"' and  "
			+"	   t.yom>='"+yomto+"'  ) as a";
			/*String sql="select convert(doc_no,char(50)) as doc_no,submodel,model from "
					+ "( select m.doc_no,submodel,model from my_ssubmodel m left join my_smodel mo "
					+ "on(m.modelid=mo.doc_no) where mo.status=3 and m.status=3 and m.modelid='"+modelid+"' "
					+ "union all select '-1','ALL','' union all select '-2','','') as a";*/
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
	
	public JSONArray modelSearch(HttpSession session,String brandid,String yomfrm,String yomto) throws SQLException {


		JSONArray RESULTDATA=new JSONArray();

		Connection conn = null;

		try {
			conn = ClsConnection.getMyConnection();
			Statement stmt = conn.createStatement();

		 //String sql="select m.doc_no,model,brand from my_smodel m left join my_sbrand b on(m.brandid=b.doc_no) where b.status=3 and m.status=3 and m.brandid='"+brandid+"'";
		//	String sql="select convert(doc_no,char(50)) as doc_no,model,brand from ( select m.doc_no,model,brand from my_smodel m left join my_sbrand b on(m.brandid=b.doc_no) where b.status=3 and m.status=3 and m.brandid='"+brandid+"' union all select '-1','ALL','' union all select '-2','','') as a";
			
			
			
			
			 String sql = "  select b.MODEL,b.doc_no,f.yom,t.yom,a.brand from my_smodel b left join my_sbrand a on(b.brandid=a.doc_no)	left join my_syom f on f.doc_no= b.frmyomid "
					 +"		left join my_syom t on t.doc_no= b.toyomid where   b.status=3 and brandid='"+brandid+"' and b.frmyomid>0  and f.yom<='"+yomfrm+"' and  "
					 +"	   t.yom>='"+yomto+"'  ";
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

	public JSONArray stypeLoad(HttpSession session) throws SQLException {


		JSONArray RESULTDATA=new JSONArray();

		Connection conn = null;

		try {
			conn = ClsConnection.getMyConnection();
			Statement stmt = conn.createStatement();

			String sql="select DOC_NO doc_no, TYPE prd_type, date from my_stype where status=3";

			ResultSet resultSet = stmt.executeQuery(sql);
			RESULTDATA=ClsCommon.convertToJSON(resultSet);

			stmt.close();
			conn.close();
		}catch(Exception e){
			e.printStackTrace();
			conn.close();
		}finally{
			conn.close();
		}
		return RESULTDATA;
	}


	public JSONArray prdbrandLoad(HttpSession session) throws SQLException {


		JSONArray RESULTDATA=new JSONArray();

		Connection conn = null;

		try {
			conn = ClsConnection.getMyConnection();
			Statement stmt = conn.createStatement(); 

			String sql="select m.BRAND BRANDNAME,m.BRANDNAME desc1 , m.DOC_NO,m.DATE,m.frmyomid,m.toyomid,coalesce(f.yom,'') fromyom,coalesce(t.yom,'') toyom "
					+ " from my_sbrand m left join my_syom f on f.doc_no=m.frmyomid left join my_syom t on t.doc_no=m.toyomid   where m.status<>7;";

			ResultSet resultSet = stmt.executeQuery(sql);
			RESULTDATA=ClsCommon.convertToJSON(resultSet);

			stmt.close();
			conn.close();
		}catch(Exception e){
			e.printStackTrace();
			conn.close();
		}finally{
			conn.close();
		}
		return RESULTDATA;
	}


	public JSONArray suitYomLoad(HttpSession session) throws SQLException {


		JSONArray RESULTDATA=new JSONArray();

		Connection conn = null;

		try {
			conn = ClsConnection.getMyConnection();
			Statement stmt = conn.createStatement();

			String sql="select doc_no, yom, date, status from my_syom where status=3";

			ResultSet resultSet = stmt.executeQuery(sql);
			RESULTDATA=ClsCommon.convertToJSON(resultSet);

			stmt.close();
			conn.close();
		}catch(Exception e){
			e.printStackTrace();
			conn.close();
		}finally{
			conn.close();
		}
		return RESULTDATA;
	}
	
	
	public JSONArray yomSearch(HttpSession session,String type,String yomfrm,String yomto) throws SQLException {


		JSONArray RESULTDATA=new JSONArray();

		Connection conn = null;

		try {
			conn = ClsConnection.getMyConnection();
			Statement stmt = conn.createStatement();
			String sql="";
			String sqlappend="";
			if(!(yomfrm.equalsIgnoreCase(""))){
				sqlappend=sqlappend+" and date_format(str_to_date(yom,'%Y'),'%Y')>="+yomfrm+" ";
			}
			String joinsql="";
		/*	if(barnd.equalsIgnoreCase("null") || barnd.equalsIgnoreCase("") || barnd.equalsIgnoreCase("0") || barnd.equalsIgnoreCase("NA"))
			{
				
			}
			else
			{
				joinsql= "inner join  my_sbrand s on  s.frmyomid=y.doc_no and s.doc_no='"+barnd+"' ";
			}
			
			*/
			/* 
			if(!(yomto.equalsIgnoreCase("ALL") || yomto.equalsIgnoreCase(""))){
				sqlappend=sqlappend+" and date_format(str_to_date(yom,'%Y'),'%Y')>="+yomto+"";
			}
			
			*/	
/*			 select  doc_no,yom,desc1 from(select doc_no,yom,desc1 from my_syom where desc1='0'
					 union all
					  (select doc_no,yom,desc1 from my_syom where status=3 ))a order by a.desc1
			
			*/
			 
			
			if(type.equalsIgnoreCase("frm"))
			{
			/*	if(barnd.equalsIgnoreCase("null") || barnd.equalsIgnoreCase("") || barnd.equalsIgnoreCase("0") || barnd.equalsIgnoreCase("NA"))
				{
					*/
				
				sql="select y.doc_no,y.yom,y.desc1 from my_syom  y  where y.status=3 order by desc1;"; 
				
			/*	else
				{
				
				sql=" select y.doc_no,y.yom,y.desc1 from my_syom  y   where y.status=3	and  y.yom>=(select y.yom  from my_syom  y "
						+ " inner join  my_sbrand s on  s.frmyomid=y.doc_no and s.doc_no='"+barnd+"'  where y.status=3 order by desc1)  order by desc1 ";
				}*/
				
			}
			else if(type.equalsIgnoreCase("to"))
			 
			{
				
			/*	if(barnd.equalsIgnoreCase("null") || barnd.equalsIgnoreCase("") || barnd.equalsIgnoreCase("0") || barnd.equalsIgnoreCase("NA"))
				{
					*/
				sql="select  doc_no,yom,desc1 from(select doc_no,yom,desc1 from my_syom where desc1='0' "
						+ "	 union all  (select doc_no,yom,desc1 from my_syom where status=3 "+sqlappend+" ))a order by a.desc1 ";
				/*}
				else
				{
					sql="select  doc_no,yom,desc1 from(select doc_no,yom,desc1 from my_syom where desc1='0' "
							+ "	 union all  (select doc_no,yom,desc1 from my_syom where status=3 "+sqlappend+" ))a order by a.desc1 ";
					
				}*/
			}
			
	 System.out.println("=====================sql"+sql);  

			ResultSet resultSet = stmt.executeQuery(sql);
			RESULTDATA=ClsCommon.convertToJSON(resultSet);


		}catch(Exception e){
			e.printStackTrace();

		}finally{
			conn.close();
		}
		return RESULTDATA;
	}




	public JSONArray suitSpec1load(HttpSession session) throws SQLException {


		JSONArray RESULTDATA=new JSONArray();

		Connection conn = null;

		try {
			conn = ClsConnection.getMyConnection();
			Statement stmt = conn.createStatement();

	/*		String sql="select s.doc_no, spec, desc1, s.date,brand,(case when s.modelid=-1 then 'ALL' else model end) as model,(case when s.submodelid=-1 then 'ALL' else submodel end) as submodel,s.brandid,s.modelid,s.submodelid from my_suitspec1 s left join my_sbrand b "
					+ "on(b.doc_no=s.brandid) left join my_smodel m on(m.doc_no=s.modelid) left join my_ssubmodel "
					+ "sm on(sm.doc_No=s.submodelid and sm.modelid=s.modelid) where s.status=3";

			*/
			
			
			String sql="select s.frmyomid,s.toyomid,coalesce(f.yom,'') fromyom,coalesce(t.yom,'') toyom,s.doc_no, spec, s.desc1, s.date,brand, model, "
					+ " submodel,s.brandid,s.modelid,s.submodelid "
					+ " from my_suitspec1 s left join my_sbrand b "
			+ "  on(b.doc_no=s.brandid) left join my_smodel m on(m.doc_no=s.modelid) left join my_ssubmodel "
			+ "  sm on(sm.doc_No=s.submodelid and sm.modelid=s.modelid) "
			+ " left join my_syom f on f.doc_no=s.frmyomid left join my_syom t on t.doc_no=s.toyomid  where s.status=3 ";

			// System.out.println("==sql===="+sql);
			
			ResultSet resultSet = stmt.executeQuery(sql);
			RESULTDATA=ClsCommon.convertToJSON(resultSet);

			stmt.close();
			conn.close();
		}catch(Exception e){
			e.printStackTrace();
			conn.close();
		}finally{
			conn.close();
		}
		return RESULTDATA;
	}


	public JSONArray suitSpec2load(HttpSession session) throws SQLException {


		JSONArray RESULTDATA=new JSONArray();

		Connection conn = null;

		try {
			conn = ClsConnection.getMyConnection();
			Statement stmt = conn.createStatement();

		/*	String sql="select s.doc_no, spec, desc1, s.date,brand,(case when s.modelid=-1 then 'ALL' else model end) as model,(case when s.submodelid=-1 then 'ALL' else submodel end) as submodel,s.brandid,s.modelid,s.submodelid from my_suitspec2 s left join my_sbrand b "
					+ "on(b.doc_no=s.brandid) left join my_smodel m on(m.doc_no=s.modelid) left join my_ssubmodel "
					+ "sm on(sm.doc_No=s.submodelid  and sm.modelid=s.modelid) where s.status=3";
*/
			
			String sql="select s.frmyomid,s.toyomid,coalesce(f.yom,'') fromyom,coalesce(t.yom,'') toyom,s.doc_no, spec, s.desc1, s.date,brand, model, "
					+ " submodel,s.brandid,s.modelid,s.submodelid "
					+ " from my_suitspec2 s left join my_sbrand b "
			+ "  on(b.doc_no=s.brandid) left join my_smodel m on(m.doc_no=s.modelid) left join my_ssubmodel "
			+ "  sm on(sm.doc_No=s.submodelid and sm.modelid=s.modelid) "
			+ " left join my_syom f on f.doc_no=s.frmyomid left join my_syom t on t.doc_no=s.toyomid  where s.status=3 ";

			ResultSet resultSet = stmt.executeQuery(sql);
			RESULTDATA=ClsCommon.convertToJSON(resultSet);

			stmt.close();
			conn.close();
		}catch(Exception e){
			e.printStackTrace();
			conn.close();
		}finally{
			conn.close();
		}
		return RESULTDATA;
	}

	public JSONArray suitSpec3load(HttpSession session) throws SQLException {


		JSONArray RESULTDATA=new JSONArray();

		Connection conn = null;

		try {
			conn = ClsConnection.getMyConnection();
			Statement stmt = conn.createStatement();
/*
			String sql="select s.doc_no, spec, desc1, s.date,brand,(case when s.modelid=-1 then 'ALL' else model end) as model,(case when s.submodelid=-1 then 'ALL' else submodel end) as submodel,s.brandid,s.modelid,s.submodelid from my_suitspec3 s left join my_sbrand b "
					+ "on(b.doc_no=s.brandid) left join my_smodel m on(m.doc_no=s.modelid) left join my_ssubmodel "
					+ "sm on(sm.doc_No=s.submodelid and sm.modelid=s.modelid) where s.status=3";

*/
			
			String sql="select s.frmyomid,s.toyomid,coalesce(f.yom,'') fromyom,coalesce(t.yom,'') toyom,s.doc_no, spec, s.desc1, s.date,brand, model, "
					+ " submodel,s.brandid,s.modelid,s.submodelid "
					+ " from my_suitspec3 s left join my_sbrand b "
			+ "  on(b.doc_no=s.brandid) left join my_smodel m on(m.doc_no=s.modelid) left join my_ssubmodel "
			+ "  sm on(sm.doc_No=s.submodelid and sm.modelid=s.modelid) "
			+ " left join my_syom f on f.doc_no=s.frmyomid left join my_syom t on t.doc_no=s.toyomid  where s.status=3 ";
			ResultSet resultSet = stmt.executeQuery(sql);
			RESULTDATA=ClsCommon.convertToJSON(resultSet);

			stmt.close();
			conn.close();
		}catch(Exception e){
			e.printStackTrace();
			conn.close();
		}finally{
			conn.close();
		}
		return RESULTDATA;
	}

	
	public JSONArray suitSpec1Search(HttpSession session,String brandid,String modelid,String submodelid,String bsize1id,String bsize2id,String bsize3id) throws SQLException {


		JSONArray RESULTDATA=new JSONArray();

		Connection conn = null;

		try {
			conn = ClsConnection.getMyConnection();
			Statement stmt = conn.createStatement();
			String spec1id="0";
			
			if(bsize1id.equalsIgnoreCase("")){
				bsize1id="0";
			}
			if(bsize2id.equalsIgnoreCase("")){
				bsize2id="0";
			}
			if(bsize3id.equalsIgnoreCase("")){
				bsize3id="0";
			}
			
			spec1id=bsize1id+","+bsize2id+","+bsize3id;
			
			String sql="select convert(doc_no,char(50)) as doc_no,spec from ( select s.doc_no,spec from "
					+ "my_suitspec1 s left join my_sbrand sb on(sb.doc_no=s.brandid) left join my_smodel sm on(sm.doc_no=s.modelid) left join my_ssubmodel m on(m.doc_no=s.submodelid) where "
					+ "m.doc_no='"+submodelid+"' and sb.doc_no='"+brandid+"' and sm.doc_no='"+modelid+"' and s.doc_no not in ("+spec1id+")  and s.status=3 union all select '-1','ALL' union all select '-2','') as a";

			
			System.out.println("=sql=sdfsa dsadasdasdasd=="+sql);
			
			ResultSet resultSet = stmt.executeQuery(sql);
			RESULTDATA=ClsCommon.convertToJSON(resultSet);


		}catch(Exception e){
			e.printStackTrace();

		}finally{
			conn.close();
		}
		return RESULTDATA;
	}
	
	


	public JSONArray suitSpec2Search(HttpSession session,String brandid,String modelid,String submodelid) throws SQLException {


		JSONArray RESULTDATA=new JSONArray();

		Connection conn = null;

		try {
			conn = ClsConnection.getMyConnection();
			Statement stmt = conn.createStatement();

			String sql="select convert(doc_no,char(50)) as doc_no,spec from ( select s.doc_no,spec from "
					+ "my_suitspec2 s left join my_sbrand sb on(sb.doc_no=s.brandid) left join my_smodel sm on(sm.doc_no=s.modelid) left join my_ssubmodel m on(m.doc_no=s.submodelid) where "
					+ "m.doc_no='"+submodelid+"' and sb.doc_no='"+brandid+"' and sm.doc_no='"+modelid+"'  and s.status=3 union all select '-1','ALL'  union all select '-2','') as a";

			System.out.println("=sql==2="+sql);
			
			ResultSet resultSet = stmt.executeQuery(sql);
			RESULTDATA=ClsCommon.convertToJSON(resultSet);


		}catch(Exception e){
			e.printStackTrace();

		}finally{
			conn.close();
		}
		return RESULTDATA;
	}


	public JSONArray suitSpec3Search(HttpSession session,String brandid,String modelid,String submodelid,String csize1id,String csize2id,String csize3id) throws SQLException {


		JSONArray RESULTDATA=new JSONArray();

		Connection conn = null;

		try {
			conn = ClsConnection.getMyConnection();
			Statement stmt = conn.createStatement();
			String spec3id="0";
			if(csize1id.equalsIgnoreCase("")){
				csize1id="0";
			}
			if(csize2id.equalsIgnoreCase("")){
				csize2id="0";
			}
			if(csize3id.equalsIgnoreCase("")){
				csize3id="0";
			}
			spec3id=csize1id+","+csize2id+","+csize3id;
			
			String sql="select convert(doc_no,char(50)) as doc_no,spec from ( select s.doc_no,spec from "
					+ "my_suitspec3 s left join my_sbrand sb on(sb.doc_no=s.brandid) left join my_smodel sm on(sm.doc_no=s.modelid) left join my_ssubmodel m on(m.doc_no=s.submodelid) where "
					+ "m.doc_no='"+submodelid+"' and sb.doc_no='"+brandid+"' and sm.doc_no='"+modelid+"' and s.doc_no not in ("+spec3id+")  and s.status=3 union all select '-1','ALL' union all select '-2','') as a";

			System.out.println("=sql==3="+sql);
			
			ResultSet resultSet = stmt.executeQuery(sql);
			RESULTDATA=ClsCommon.convertToJSON(resultSet);


		}catch(Exception e){
			e.printStackTrace();

		}finally{
			conn.close();
		}
		return RESULTDATA;
	}



	public int binsert(Date date_brand, String sbrand,String desc,String mode, HttpSession session,String formdetailcode, int frmyomid, int toyomid) throws SQLException {
		Connection conn=ClsConnection.getMyConnection();
		try{
			int docno;


			conn.setAutoCommit(false);
			Statement stmtTest=conn.createStatement ();
			String testSql="select brand from my_sbrand where status<>7 and brand='"+sbrand+"'";
			ResultSet resultSet1 = stmtTest.executeQuery (testSql);
			if(resultSet1.next()){
				stmtTest.close();
				conn.close();
				return -1;
			}
			CallableStatement stmtBrand = conn.prepareCall("{CALL suitBrandDML(?,?,?,?,?,?,?,?)}");
			stmtBrand.registerOutParameter(6, java.sql.Types.INTEGER);
			stmtBrand.setString(1,sbrand);
			stmtBrand.setString(2,desc);
			stmtBrand.setDate(3,date_brand);
			stmtBrand.setString(4,session.getAttribute("BRANCHID").toString());
			stmtBrand.setString(5,session.getAttribute("USERID").toString());
			stmtBrand.setString(7,mode);
			stmtBrand.setString(8, formdetailcode);
			 stmtBrand.executeQuery();
			docno=stmtBrand.getInt("docNo");

			if (docno > 0) {
			
			Statement stmtTest1=conn.createStatement ();
			String testSql1="update  my_sbrand set frmyomid='"+frmyomid+"', toyomid='"+toyomid+"'    where  doc_no='"+docno+"'";
			 stmtTest1.executeUpdate(testSql1);

			}

			if (docno > 0) {

				conn.commit();
				stmtBrand.close();
				stmtTest.close();
				conn.close();
				return docno;
			}
			stmtBrand.close();
			stmtTest.close();

			conn.close();
		}catch(Exception e){	
			e.printStackTrace();	
			conn.close();
		}
		return 0;
	}

	public int bedit(int docno, java.sql.Date sqlStartDate, String sbrand,String desc, HttpSession session,String formdetailcode, int frmyomid, int toyomid) throws SQLException {
		Connection conn=ClsConnection.getMyConnection();
		try{

			conn.setAutoCommit(false);
			Statement stmtTest=conn.createStatement ();
			String testSql="select brand from my_sbrand where status<>7 and brand='"+sbrand+"' and doc_no<>"+docno+"";
			ResultSet resultSet1 = stmtTest.executeQuery (testSql);
			if(resultSet1.next()){
				stmtTest.close();
				conn.close();
				return -1;
			}

			CallableStatement stmtBrand = conn.prepareCall("{CALL suitBrandDML(?,?,?,?,?,?,?,?)}");
			stmtBrand.setString(1,sbrand);
			stmtBrand.setString(2,desc);
			stmtBrand.setDate(3,sqlStartDate);
			stmtBrand.setString(4,session.getAttribute("BRANCHID").toString());
			stmtBrand.setString(5,session.getAttribute("USERID").toString());
			stmtBrand.setInt(6, docno);
			stmtBrand.setString(7,"E");
			stmtBrand.setString(8, formdetailcode);
			int val=stmtBrand.executeUpdate();
			
			System.out.println("=======stmtBrand==1212===="+stmtBrand);
			 stmtBrand.getInt("docNo");

			if (val > 0) {
				
				Statement stmtTest1=conn.createStatement ();
				String testSql1="update  my_sbrand set frmyomid='"+frmyomid+"', toyomid='"+toyomid+"'    where  doc_no='"+docno+"'";
				 stmtTest1.executeUpdate(testSql1);

				}
			
			

			if (val > 0) {

				conn.commit();


				stmtBrand.close();
				conn.close();
				return docno;
			}

			stmtBrand.close();


			conn.close();
		}catch(Exception e){
			e.printStackTrace();
			conn.close();
		}
		return 0;
	}


	public int bdelete(int docno, HttpSession session,String brand,String formdetailcode) throws SQLException {
		Connection conn=ClsConnection.getMyConnection();
		try{

			conn.setAutoCommit(false);
			Statement stmtTest=conn.createStatement ();

			/*
			String testsql3="select m.doc_no from gl_vehbrand b inner join gl_vehmaster m on m.brdid=b.doc_no where b.brand='"+brand+"'";
			ResultSet resultSet3 = stmtTest.executeQuery (testsql3);
			if(resultSet3.next()){
				stmtTest.close();
				conn.close();
				return -2;
			}*/
 
			String test="select sm.model from my_smodel sm where brandid='"+docno+"' and status=3";
			System.out.println("ref check"+test);
			ResultSet resultSet3 = stmtTest.executeQuery (test);
			if(resultSet3.next()){
				stmtTest.close();
				conn.close();
				System.out.println("refered");
				return -2;
				
			}
			CallableStatement stmtBrand = conn.prepareCall("{CALL suitBrandDML(?,?,?,?,?,?,?,?)}");
			stmtBrand.setString(1,null);
			stmtBrand.setString(2,null);
			stmtBrand.setDate(3,null);
			stmtBrand.setString(4,session.getAttribute("BRANCHID").toString());
			stmtBrand.setString(5,session.getAttribute("USERID").toString());
			stmtBrand.setInt(6, docno);
			stmtBrand.setString(7,"D");
			stmtBrand.setString(8, formdetailcode);
			stmtBrand.executeUpdate();
			int aaa=stmtBrand.getInt("docNo");

			if (aaa > 0) {
				//				System.out.println("Sucess");
				conn.commit();
				stmtBrand.close();


				conn.close();
				return aaa;
			}

			stmtBrand.close();
			conn.close();
		}catch(Exception e){
			e.printStackTrace();
			conn.close();
		}
		return 0;
	}



	public JSONArray modellist(HttpSession session) throws SQLException {


		JSONArray RESULTDATA=new JSONArray();

		Connection conn = null;

		try {
			conn = ClsConnection.getMyConnection();
			Statement stmt = conn.createStatement();

			String sql="select m.model,m.date,m.doc_no,b.brand,m.brandid ,m.frmyomid,m.toyomid,coalesce(f.yom,'') fromyom,coalesce(t.yom,'') toyom "
					+ " from my_smodel m inner join my_sbrand b on(m.brandid=b.doc_no) left join my_syom f on f.doc_no=m.frmyomid left join my_syom t on t.doc_no=m.toyomid "
					+ "  where m.status=3 ";

			ResultSet resultSet = stmt.executeQuery(sql);
			RESULTDATA=ClsCommon.convertToJSON(resultSet);

			stmt.close();
			conn.close();
		}catch(Exception e){
			e.printStackTrace();
			conn.close();
		}finally{
			conn.close();
		}
		return RESULTDATA;
	}
	
	
	public JSONArray submodellist(HttpSession session) throws SQLException {


		JSONArray RESULTDATA=new JSONArray();

		Connection conn = null;

		try {
			conn = ClsConnection.getMyConnection();
			Statement stmt = conn.createStatement();

			String sql="select m.submodel as model,m.date,m.doc_no,b.brand brandname,m.brandid brandid1,mo.modelname,mo.doc_no as modelid, "
					+ " m.frmyomid,m.toyomid,coalesce(f.yom,'') fromyom,coalesce(t.yom,'') toyom "
					+ "  from my_ssubmodel m  inner join my_smodel mo on(mo.doc_no=m.modelid) left join my_sbrand b "
					+ "  on(m.brandid=b.doc_no) left join my_syom f on f.doc_no=m.frmyomid left join my_syom t on t.doc_no=m.toyomid where m.status=3 ";

			System.out.println("==sqlbrand==="+sql);
			
			ResultSet resultSet = stmt.executeQuery(sql);
			RESULTDATA=ClsCommon.convertToJSON(resultSet);

			stmt.close();
			conn.close();
		}catch(Exception e){
			e.printStackTrace();
			conn.close();
		}finally{
			conn.close();
		}
		return RESULTDATA;
	}


	public int insert(String smodel, String sbrandid, Date sqlStartDate,
			HttpSession session,String mode,String formdetailcode, int frmyomid, int toyomid) throws SQLException {
		Connection conn=ClsConnection.getMyConnection();
		try{
			int docno;

			conn.setAutoCommit(false);
			Statement stmtTest=conn.createStatement ();
			String testSql="select model from my_smodel where status<>7 and model='"+smodel+"'";
			ResultSet resultSet1 = stmtTest.executeQuery (testSql);
			if(resultSet1.next()){
				stmtTest.close();
				conn.close();
				return -1;
			}

			CallableStatement stmtModel = conn.prepareCall("{call suitModelDML(?,?,?,?,?,?,?,?)}");

			stmtModel.registerOutParameter(6, java.sql.Types.INTEGER);
			stmtModel.setString(1,smodel);
			stmtModel.setDate(2,sqlStartDate);
			stmtModel.setString(3, sbrandid);
			stmtModel.setString(4,session.getAttribute("BRANCHID").toString());
			stmtModel.setString(5,session.getAttribute("USERID").toString());
			stmtModel.setString(7,mode);
			stmtModel.setString(8,formdetailcode);
			stmtModel.executeQuery();
			docno=stmtModel.getInt("docNo");

			
			
			if (docno > 0) {
				
				Statement stmtTest1=conn.createStatement ();
				String testSql1="update  my_smodel set frmyomid='"+frmyomid+"', toyomid='"+toyomid+"'    where  doc_no='"+docno+"'";
				 stmtTest1.executeUpdate(testSql1);
				
			}
			
			
			
			
			if (docno > 0) {

				conn.commit();
				stmtTest.close();
				stmtModel.close();
				conn.close();
				return docno;
			}
			stmtTest.close();
			stmtModel.close();
			conn.close();
		}catch(Exception e){	
			e.printStackTrace();	
			conn.close();
		}
		return 0;
	}

	public int edit(String smodel,int docno,Date modeldate,String sbrandid,String mode, HttpSession session,String formdetailcode, int frmyomid, int toyomid) throws SQLException {
		Connection conn=ClsConnection.getMyConnection();
		try{

			//			System.out.println(conn);
			conn.setAutoCommit(false);
			Statement stmtTest=conn.createStatement ();
			String testSql="select model from my_smodel where status<>7 and model='"+smodel+"' and doc_no<>"+docno+"";
			ResultSet resultSet1 = stmtTest.executeQuery (testSql);
			if(resultSet1.next()){
				stmtTest.close();
				conn.close();
				return -1;
			}
			CallableStatement stmtModel = conn.prepareCall("{call suitModelDML(?,?,?,?,?,?,?,?)}");

			stmtModel.setInt(6, docno);
			stmtModel.setString(1,smodel);
			stmtModel.setDate(2,(Date)modeldate);
			stmtModel.setString(3, sbrandid);
			stmtModel.setString(4, session.getAttribute("BRANCHID").toString());
			stmtModel.setString(5, session.getAttribute("USERID").toString());
			stmtModel.setString(7, mode);
			stmtModel.setString(8,formdetailcode);


			int aa = stmtModel.executeUpdate();
			
			if (aa>0) {
				Statement stmtTest1=conn.createStatement ();
				String testSql1="update  my_smodel set frmyomid='"+frmyomid+"', toyomid='"+toyomid+"'    where  doc_no='"+docno+"'";
				 stmtTest1.executeUpdate(testSql1);
				
			}

			if (aa>0) {

				conn.commit();
				stmtTest.close();
				stmtModel.close();
				conn.close();
				return aa;
			}

			stmtTest.close();
			stmtModel.close();
			conn.close();
		}catch(Exception e){
			e.printStackTrace();
			conn.close();
		}


		return 0;
	}


	public int delete(String smodel,int docno,Date modeldate,String sbrandid,String mode, HttpSession session,String formdetailcode) throws SQLException {
		Connection conn=ClsConnection.getMyConnection();
		try{

			conn.setAutoCommit(false);
			//			System.out.println(conn);
			Statement stmtTest=conn.createStatement ();

			/*String testsql3="select m.doc_no from gl_vehmodel b inner join gl_vehmaster m on m.vmodid=b.doc_no where b.vtype='"+model+"'";
			ResultSet resultSet3 = stmtTest.executeQuery (testsql3);
			if(resultSet3.next()){
				stmtTest.close();
				conn.close();
				return -2;
			}*/
		  
			String test="select sm.submodel from my_ssubmodel sm where modelid='"+docno+"' and status=3";
			System.out.println("ref check"+test);
			ResultSet resultSet3 = stmtTest.executeQuery (test);
			if(resultSet3.next()){
				stmtTest.close();
				conn.close();
				System.out.println("refered");
				return -2;
				
			}
			
			CallableStatement stmtModel = conn.prepareCall("{call suitModelDML(?,?,?,?,?,?,?,?)}");
			stmtModel.setString(1,smodel);
			stmtModel.setDate(2,(Date)modeldate);
			stmtModel.setString(3, sbrandid);
			stmtModel.setString(4, session.getAttribute("BRANCHID").toString());
			stmtModel.setString(5, session.getAttribute("USERID").toString());
			stmtModel.setInt(6, docno);
			stmtModel.setString(7, mode);
			stmtModel.setString(8,formdetailcode);

			int aa = stmtModel.executeUpdate();
			if (aa>0) {

				conn.commit();
				stmtModel.close();
				stmtTest.close();
				conn.close();
				return aa;
			}
			stmtTest.close();
			stmtModel.close();
			conn.close();
		}catch(Exception e){
			e.printStackTrace();
			conn.close();
		}


		return 0;
	}



	public int insert(Date date,String brandid,String modelid,String submodelid, String spec,String desc,String mode, HttpSession session,String formdetailcode,String specs, int frmyomid, int toyomid) throws SQLException {
		Connection conn=ClsConnection.getMyConnection();
		try{
			int docno;


			conn.setAutoCommit(false);
			
		 
							if(specs.equalsIgnoreCase("spec1"))
								{
										Statement stmtTest1=conn.createStatement ();
										String testSql="select spec from my_suitspec1 where status<>7 and spec='"+spec+"' and brandid='"+brandid+"' and modelid='"+modelid+"' and submodelid='"+submodelid+"'";
										System.out.println("spec1"+testSql);
										ResultSet resultSet1 = stmtTest1.executeQuery (testSql);
										if(resultSet1.next())
										{
											stmtTest1.close();
											conn.close();
											return -11;
										}
								}
			
								else if(specs.equalsIgnoreCase("spec2"))
								{
										Statement stmtTest1=conn.createStatement ();
										String testSql="select spec from my_suitspec2 where status<>7 and spec='"+spec+"' and brandid='"+brandid+"' and modelid='"+modelid+"' and submodelid='"+submodelid+"'";
										System.out.println("spec2"+testSql);
										ResultSet resultSet1 = stmtTest1.executeQuery (testSql);
										if(resultSet1.next())
										{
											stmtTest1.close();
											conn.close();
											return -12;
										}
								}
			
								else if(specs.equalsIgnoreCase("spec3"))
								{
										Statement stmtTest1=conn.createStatement ();
										String testSql="select spec from my_suitspec3 where status<>7 and spec='"+spec+"' and brandid='"+brandid+"' and modelid='"+modelid+"' and submodelid='"+submodelid+"'";
										System.out.println(" test sp3"+testSql);
										ResultSet resultSet1 = stmtTest1.executeQuery (testSql);
										if(resultSet1.next())
										{
											stmtTest1.close();
											conn.close();
											return -13;
										}
								}
			 
			
 

			
			Statement stmtTest=conn.createStatement ();
			/*String testSql="select spec from my_suitspec1 where status<>7 and spec='"+spec+"'";
			ResultSet resultSet1 = stmtTest.executeQuery (testSql);
			if(resultSet1.next()){
				stmtTest.close();
				conn.close();
				return -1;
			}*/
			CallableStatement stmtBrand = conn.prepareCall("{CALL suitSpecDML(?,?,?,?,?,?,?,?,?,?,?,?)}");
			stmtBrand.registerOutParameter(6, java.sql.Types.INTEGER);
			stmtBrand.setString(1,spec);
			stmtBrand.setString(2,desc);
			stmtBrand.setDate(3,date);
			stmtBrand.setString(4,session.getAttribute("BRANCHID").toString());
			stmtBrand.setString(5,session.getAttribute("USERID").toString());
			stmtBrand.setString(7,mode);
			stmtBrand.setString(8, formdetailcode);
			stmtBrand.setString(9, specs);
			stmtBrand.setString(10, brandid);
			stmtBrand.setString(11, modelid);
			stmtBrand.setString(12, submodelid);
			
			
		  stmtBrand.executeQuery();
			docno=stmtBrand.getInt("docNo");

			if (docno > 0) {

			if(specs.equalsIgnoreCase("spec1"))
				{
				
				Statement stmtTest1=conn.createStatement ();
				String testSql1="update  my_suitspec1 set frmyomid='"+frmyomid+"', toyomid='"+toyomid+"'    where  doc_no='"+docno+"'";
				 stmtTest1.executeUpdate(testSql1);

				}
			else if(specs.equalsIgnoreCase("spec2"))
			{
				
				Statement stmtTest1=conn.createStatement ();
				String testSql1="update  my_suitspec2 set frmyomid='"+frmyomid+"', toyomid='"+toyomid+"'    where  doc_no='"+docno+"'";
				 stmtTest1.executeUpdate(testSql1);
	
			}
			else if(specs.equalsIgnoreCase("spec3"))
			{
				
				Statement stmtTest1=conn.createStatement ();
				String testSql1="update  my_suitspec3 set frmyomid='"+frmyomid+"', toyomid='"+toyomid+"'    where  doc_no='"+docno+"'";
				 stmtTest1.executeUpdate(testSql1);

			}
			
			}
			
			
			if (docno > 0) {

				conn.commit();
				stmtBrand.close();
				stmtTest.close();
				conn.close();
				return docno;
			}
			stmtBrand.close();
			stmtTest.close();

			conn.close();
		}catch(Exception e){	
			e.printStackTrace();	
			conn.close();
		}
		return 0;
	}

	public int edit(int docno, java.sql.Date sqlStartDate,String brandid,String modelid,String submodelid, String spec,
			String desc,String mode, HttpSession session,String formdetailcode,String specs, int frmyomid, int toyomid) throws SQLException {
		
		
		Connection conn=ClsConnection.getMyConnection();
		try{

			conn.setAutoCommit(false);
			
			
			 
				if(specs.equalsIgnoreCase("spec1"))
					{
							Statement stmtTest1=conn.createStatement ();
							String testSql="select spec from my_suitspec1 where status<>7 and spec='"+spec+"' and brandid='"+brandid+"' and modelid='"+modelid+"' and submodelid='"+submodelid+"' and doc_no<>"+docno+" ";
							System.out.println("update test1"+testSql);
							ResultSet resultSet1 = stmtTest1.executeQuery (testSql);
							if(resultSet1.next())
							{
								stmtTest1.close();
								conn.close();
								return -11;
							}
					}

					else if(specs.equalsIgnoreCase("spec2"))
					{
							Statement stmtTest1=conn.createStatement ();
							String testSql="select spec from my_suitspec2 where status<>7 and spec='"+spec+"' and brandid='"+brandid+"' and modelid='"+modelid+"' and submodelid='"+submodelid+"' and doc_no<>"+docno+"";
							System.out.println("update test2"+testSql);
							ResultSet resultSet1 = stmtTest1.executeQuery (testSql);
							if(resultSet1.next())
							{
								stmtTest1.close();
								conn.close();
								return -12;
							}
					}

					else if(specs.equalsIgnoreCase("spec3"))
					{
							Statement stmtTest1=conn.createStatement ();
							String testSql="select spec from my_suitspec3 where status<>7 and spec='"+spec+"' and brandid='"+brandid+"' and modelid='"+modelid+"' and submodelid='"+submodelid+"' and doc_no<>"+docno+"";
							System.out.println("update test3"+testSql);
							ResultSet resultSet1 = stmtTest1.executeQuery (testSql);
							if(resultSet1.next())
							{
								stmtTest1.close();
								conn.close();
								return -13;
							}
					}
			
			//Statement stmtTest=conn.createStatement ();
			/*String testSql="select brandname from my_sbrand where status<>7 and spec='"+spec+"' and doc_no<>'"+docno+"'";
			ResultSet resultSet1 = stmtTest.executeQuery (testSql);
			if(resultSet1.next()){
				stmtTest.close();
				conn.close();
				return -1;
			}*/
			System.out.println("=======docno======"+docno);
			CallableStatement stmtBrand = conn.prepareCall("{CALL suitSpecDML(?,?,?,?,?,?,?,?,?,?,?,?)}");
			
			stmtBrand.setString(1,spec);
			stmtBrand.setString(2,desc);
			stmtBrand.setDate(3,sqlStartDate);
			stmtBrand.setString(4,session.getAttribute("BRANCHID").toString());
			stmtBrand.setString(5,session.getAttribute("USERID").toString());
			stmtBrand.setInt(6, docno);
			stmtBrand.setString(7,mode);
			stmtBrand.setString(8, formdetailcode);
			stmtBrand.setString(9, specs.trim());
			stmtBrand.setString(10, brandid);
			stmtBrand.setString(11, modelid);
			stmtBrand.setString(12, submodelid);
			int val = stmtBrand.executeUpdate();
			
			System.out.println("=======stmtBrand======"+stmtBrand);
			
			 stmtBrand.getInt("docNo");


				if (val > 0) {

					if(specs.equalsIgnoreCase("spec1"))
						{
						
						Statement stmtTest1=conn.createStatement ();
						String testSql1="update  my_suitspec1 set frmyomid='"+frmyomid+"', toyomid='"+toyomid+"'    where  doc_no='"+docno+"'";
						 stmtTest1.executeUpdate(testSql1);

						}
					else if(specs.equalsIgnoreCase("spec2"))
					{
						
						Statement stmtTest1=conn.createStatement ();
						String testSql1="update  my_suitspec2 set frmyomid='"+frmyomid+"', toyomid='"+toyomid+"'    where  doc_no='"+docno+"'";
						 stmtTest1.executeUpdate(testSql1);
			
					}
					else if(specs.equalsIgnoreCase("spec3"))
					{
						
						Statement stmtTest1=conn.createStatement ();
						String testSql1="update  my_suitspec3 set frmyomid='"+frmyomid+"', toyomid='"+toyomid+"'    where  doc_no='"+docno+"'";
						 stmtTest1.executeUpdate(testSql1);

					}
					
					}
			
			if (val > 0) {

				conn.commit();


				stmtBrand.close();
				conn.close();
				return docno;
			}

			stmtBrand.close();


			conn.close();
		}catch(Exception e){
			e.printStackTrace();
			conn.close();
		}
		return 0;
	}


	public int delete(int docno, HttpSession session,String brand,String formdetailcode,String specs) throws SQLException {
		Connection conn=ClsConnection.getMyConnection();
		try{

			conn.setAutoCommit(false);
			Statement stmtTest=conn.createStatement ();
			
		
		/*	String testsql3="select submodelid from my_vehsuitmaster sm where submodelid='1' ";
			ResultSet resultSet3 = stmtTest.executeQuery (testsql3);
			if(resultSet3.next()){
				stmtTest.close();
				conn.close();
				return -2;
			}
			*/
			
			

			
			
			//System.out.println("0rew2w4567890-065w2467890-06ewqwe67890975ew67890=-86ew236789");
			
			if(specs.equalsIgnoreCase("spec1"))
				{
						Statement stmtTest1=conn.createStatement ();
						String testSql="select  *  from my_suitmaster  where bsizeid='"+docno+"'  ";
					 	System.out.println("update test1"+testSql);
						ResultSet resultSet1 = stmtTest1.executeQuery (testSql);
						if(resultSet1.next())
						{
							stmtTest1.close();
							conn.close();
							return -2;
						}
				}

				else if(specs.equalsIgnoreCase("spec2"))
				{
						Statement stmtTest1=conn.createStatement ();
						String testSql="select * from my_suitmaster where esizeid='"+docno+"'  ";
						 System.out.println("update test2"+testSql);
						ResultSet resultSet1 = stmtTest1.executeQuery (testSql);
						if(resultSet1.next())
						{
							stmtTest1.close();
							conn.close();
							return -2;
						}
				}

				else if(specs.equalsIgnoreCase("spec3"))
				{
						Statement stmtTest1=conn.createStatement ();
						String testSql="select  * from my_suitmaster  where csizeid='"+docno+"' ";
						 System.out.println("update test3"+testSql);
						ResultSet resultSet1 = stmtTest1.executeQuery (testSql);
						if(resultSet1.next())
						{
							stmtTest1.close();
							conn.close();
							return -2;
						}
				}
			
			
			
			CallableStatement stmtBrand = conn.prepareCall("{CALL suitSpecDML(?,?,?,?,?,?,?,?,?,?,?,?)}");
			stmtBrand.setString(1,null);
			stmtBrand.setString(2,null);
			stmtBrand.setDate(3,null);
			stmtBrand.setString(4,session.getAttribute("BRANCHID").toString());
			stmtBrand.setString(5,session.getAttribute("USERID").toString());
			stmtBrand.setInt(6, docno);
			stmtBrand.setString(7,"D");
			stmtBrand.setString(8, formdetailcode);
			stmtBrand.setString(9, specs);
			stmtBrand.setString(10, "0");
			stmtBrand.setString(11, "0");
			stmtBrand.setString(12, "0");
			stmtBrand.executeUpdate();
			int aaa=stmtBrand.getInt("docNo");

			if (aaa > 0) {
				//				System.out.println("Sucess");
				conn.commit();
				stmtBrand.close();


				conn.close();
				return aaa;
			}

			stmtBrand.close();
			conn.close();
		}catch(Exception e){
			e.printStackTrace();
			conn.close();
		}
		return 0;
	}
	
	
	public int insert(Date date,String yomfrm,String yomto,String yomfrmid,String yomtoid,String brandid,
			String modelid,String submodelid, String esizeid,String csize1id,String csize2id,
			String csize3id,String bsize1id,String bsize2id,String bsize3id,String mode, HttpSession session,String formdetailcode) throws SQLException {
		Connection conn=ClsConnection.getMyConnection();
		try{
			int aaa;


			conn.setAutoCommit(false);
			Statement stmtTest=conn.createStatement ();
			
			
			
			CallableStatement stmtBrand = conn.prepareCall("{CALL VehsuitDML(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)}");
			stmtBrand.registerOutParameter(20, java.sql.Types.INTEGER);
			stmtBrand.setString(1,yomfrm.trim().equalsIgnoreCase("")?"":yomfrm);
			stmtBrand.setString(2,yomto.trim().equalsIgnoreCase("")?"":yomto);
			stmtBrand.setString(3,yomfrmid.trim().equalsIgnoreCase("")?"0":yomfrmid);
			stmtBrand.setString(4,yomtoid.trim().equalsIgnoreCase("undefined")  || yomtoid.trim().equalsIgnoreCase("") || yomtoid.trim().equalsIgnoreCase("NaN")|| yomtoid.isEmpty()?"0":yomtoid.trim());
			stmtBrand.setString(5,brandid.trim().equalsIgnoreCase("")?"0":brandid);
			stmtBrand.setString(6,modelid.trim().equalsIgnoreCase("")?"0":modelid);
			stmtBrand.setString(7,submodelid.trim().equalsIgnoreCase("")?"0":submodelid);
			stmtBrand.setString(8,esizeid.trim().equalsIgnoreCase("undefined")  || esizeid.trim().equalsIgnoreCase("") || esizeid.trim().equalsIgnoreCase("NaN")|| esizeid.isEmpty()?"0":esizeid.trim());
			stmtBrand.setString(9,csize1id.trim().equalsIgnoreCase("undefined")  || csize1id.trim().equalsIgnoreCase("") || csize1id.trim().equalsIgnoreCase("NaN")|| csize1id.isEmpty()?"0":csize1id.trim());
			stmtBrand.setString(10,csize2id.trim().equalsIgnoreCase("undefined")  || csize2id.trim().equalsIgnoreCase("") || csize2id.trim().equalsIgnoreCase("NaN")|| csize2id.isEmpty()?"0":csize2id.trim());
			stmtBrand.setString(11,csize3id.trim().equalsIgnoreCase("undefined")  || csize3id.trim().equalsIgnoreCase("") || csize3id.trim().equalsIgnoreCase("NaN")|| csize3id.isEmpty()?"0":csize3id.trim());
			stmtBrand.setString(12,bsize1id.trim().equalsIgnoreCase("undefined")  || bsize1id.trim().equalsIgnoreCase("") || bsize1id.trim().equalsIgnoreCase("NaN")|| bsize1id.isEmpty()?"0":bsize1id.trim());
			stmtBrand.setString(13,bsize2id.trim().equalsIgnoreCase("undefined")  || bsize2id.trim().equalsIgnoreCase("") || bsize2id.trim().equalsIgnoreCase("NaN")|| bsize2id.isEmpty()?"0":bsize2id.trim());
			stmtBrand.setString(14,bsize3id.trim().equalsIgnoreCase("undefined")  || bsize3id.trim().equalsIgnoreCase("") || bsize3id.trim().equalsIgnoreCase("NaN")|| bsize3id.isEmpty()?"0":bsize3id.trim());
			stmtBrand.setDate(15,date);
			stmtBrand.setString(16,session.getAttribute("USERID").toString());
			stmtBrand.setString(17,session.getAttribute("BRANCHID").toString());
			stmtBrand.setString(18, formdetailcode);
			stmtBrand.setString(19,mode);
			int val = stmtBrand.executeUpdate();
			aaa=stmtBrand.getInt("docNo");


			if (val > 0) {

				conn.commit();
				stmtBrand.close();
				stmtTest.close();
				conn.close();
				return aaa;
			}
			stmtBrand.close();
			stmtTest.close();

			conn.close();
		}catch(Exception e){	
			e.printStackTrace();	
			conn.close();
		}
		return 0;
	}

	public int edit(int docno, Date date,String yomfrm,String yomto,String yomfrmid,String yomtoid,String brandid,
			String modelid,String submodelid, String esizeid,String csize1id,String csize2id,
			String csize3id,String bsize1id,String bsize2id,String bsize3id,String mode, HttpSession session,String formdetailcode) throws SQLException {
		
		
		Connection conn=ClsConnection.getMyConnection();
		try{

			conn.setAutoCommit(false);
			Statement stmtTest=conn.createStatement ();
			int aaa=0;
			
			CallableStatement stmtBrand = conn.prepareCall("{CALL VehsuitDML(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)}");
			
			stmtBrand.setString(1,yomfrm.trim().equalsIgnoreCase("")?"":yomfrm);
			stmtBrand.setString(2,yomto.trim().equalsIgnoreCase("")?"":yomto);
			stmtBrand.setString(3,yomfrmid.trim().equalsIgnoreCase("")?"0":yomfrmid);
			stmtBrand.setString(4,yomtoid.trim().equalsIgnoreCase("undefined")  || yomtoid.trim().equalsIgnoreCase("") || yomtoid.trim().equalsIgnoreCase("NaN")|| yomtoid.isEmpty()?"0":yomtoid.trim());
			stmtBrand.setString(5,brandid.trim().equalsIgnoreCase("")?"0":brandid);
			stmtBrand.setString(6,modelid.trim().equalsIgnoreCase("")?"0":modelid);
			stmtBrand.setString(7,submodelid.trim().equalsIgnoreCase("")?"0":submodelid);
			stmtBrand.setString(8,esizeid.trim().equalsIgnoreCase("undefined")  || esizeid.trim().equalsIgnoreCase("") || esizeid.trim().equalsIgnoreCase("NaN")|| esizeid.isEmpty()?"0":esizeid.trim());
			stmtBrand.setString(9,csize1id.trim().equalsIgnoreCase("undefined")  || csize1id.trim().equalsIgnoreCase("") || csize1id.trim().equalsIgnoreCase("NaN")|| csize1id.isEmpty()?"0":csize1id.trim());
			stmtBrand.setString(10,csize2id.trim().equalsIgnoreCase("undefined")  || csize2id.trim().equalsIgnoreCase("") || csize2id.trim().equalsIgnoreCase("NaN")|| csize2id.isEmpty()?"0":csize2id.trim());
			stmtBrand.setString(11,csize3id.trim().equalsIgnoreCase("undefined")  || csize3id.trim().equalsIgnoreCase("") || csize3id.trim().equalsIgnoreCase("NaN")|| csize3id.isEmpty()?"0":csize3id.trim());
			stmtBrand.setString(12,bsize1id.trim().equalsIgnoreCase("undefined")  || bsize1id.trim().equalsIgnoreCase("") || bsize1id.trim().equalsIgnoreCase("NaN")|| bsize1id.isEmpty()?"0":bsize1id.trim());
			stmtBrand.setString(13,bsize2id.trim().equalsIgnoreCase("undefined")  || bsize2id.trim().equalsIgnoreCase("") || bsize2id.trim().equalsIgnoreCase("NaN")|| bsize2id.isEmpty()?"0":bsize2id.trim());
			stmtBrand.setString(14,bsize3id.trim().equalsIgnoreCase("undefined")  || bsize3id.trim().equalsIgnoreCase("") || bsize3id.trim().equalsIgnoreCase("NaN")|| bsize3id.isEmpty()?"0":bsize3id.trim());
			stmtBrand.setDate(15,date);
			stmtBrand.setString(16,session.getAttribute("USERID").toString());
			stmtBrand.setString(17,session.getAttribute("BRANCHID").toString());
			stmtBrand.setString(18, formdetailcode);
			stmtBrand.setString(19,mode);
			stmtBrand.setInt(20,docno);
			int val = stmtBrand.executeUpdate();
			aaa=stmtBrand.getInt("docNo");


			if (val > 0) {

				conn.commit();
				stmtBrand.close();
				stmtTest.close();
				conn.close();
				return aaa;
			}
			stmtBrand.close();
			stmtTest.close();

			conn.close();
		}catch(Exception e){	
			e.printStackTrace();	
			conn.close();
		}
		return 0;
	}


	public int delete(int docno, Date date,String yomfrm,String yomto,String yomfrmid,String yomtoid,String brandid,
			String modelid,String submodelid, String esizeid,String csize1id,String csize2id,
			String csize3id,String bsize1id,String bsize2id,String bsize3id,String mode, HttpSession session,String formdetailcode) throws SQLException {
		
		
		Connection conn=ClsConnection.getMyConnection();
		try{

			
			
			
			
			conn.setAutoCommit(false);
			Statement stmtTest=conn.createStatement ();
			
			
			Statement stmtTest1=conn.createStatement ();
			String testSql="select * from my_prodsuit where vehsuitid='"+docno+"' ";
			//System.out.println("update================== test3"+testSql);
			ResultSet resultSet1 = stmtTest1.executeQuery (testSql);
			if(resultSet1.next())
			{
				stmtTest1.close();
				conn.close();
				return -2;
			}
			
			
			
			
			int aaa=0;
			
			CallableStatement stmtBrand = conn.prepareCall("{CALL VehsuitDML(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)}");
			
			stmtBrand.setString(1,yomfrm);
			stmtBrand.setString(2,yomto);
			stmtBrand.setString(3,yomfrmid);
			stmtBrand.setString(4,yomtoid);
			stmtBrand.setString(5,brandid);
			stmtBrand.setString(6,modelid);
			stmtBrand.setString(7,submodelid);
			stmtBrand.setString(8,esizeid);
			stmtBrand.setString(9,csize1id);
			stmtBrand.setString(10,csize2id);
			stmtBrand.setString(11,csize3id);
			stmtBrand.setString(12,bsize1id);
			stmtBrand.setString(13,bsize2id);
			stmtBrand.setString(14,bsize3id);
			stmtBrand.setDate(15,date);
			stmtBrand.setString(16,session.getAttribute("USERID").toString());
			stmtBrand.setString(17,session.getAttribute("BRANCHID").toString());
			stmtBrand.setString(18, formdetailcode);
			stmtBrand.setString(19,mode);
			stmtBrand.setInt(20,docno);
			int val = stmtBrand.executeUpdate();
			aaa=stmtBrand.getInt("docNo");


			if (val > 0) {

				conn.commit();
				stmtBrand.close();
				stmtTest.close();
				conn.close();
				return aaa;
			}
			stmtBrand.close();
			stmtTest.close();

			conn.close();
		}catch(Exception e){	
			e.printStackTrace();	
			conn.close();
		}
		return 0;
	}


	public int submodelinsert(String submodel,String smodelid, String sbrandid, Date sqlStartDate,
			HttpSession session,String mode,String formdetailcode, int frmyomid, int toyomid) throws SQLException {
		Connection conn=ClsConnection.getMyConnection();
		try{
			int docno;

			conn.setAutoCommit(false);
			Statement stmtTest=conn.createStatement ();
			String testSql="select submodel from my_ssubmodel where status<>7 and modelid="+smodelid+" and SUBMODEL='"+submodel+"' ";
			ResultSet resultSet1 = stmtTest.executeQuery (testSql);
			if(resultSet1.next()){
				stmtTest.close();
				conn.close();
				return -1;
			}
			
			
			

			CallableStatement stmtModel = conn.prepareCall("{call suitSubModelDML(?,?,?,?,?,?,?,?,?)}");

			stmtModel.registerOutParameter(7, java.sql.Types.INTEGER);
			stmtModel.setString(1,submodel);
			stmtModel.setDate(2,sqlStartDate);
			stmtModel.setString(3, sbrandid);
			stmtModel.setString(4, smodelid);
			stmtModel.setString(5,session.getAttribute("BRANCHID").toString());
			stmtModel.setString(6,session.getAttribute("USERID").toString());
			stmtModel.setString(8,mode);
			stmtModel.setString(9,formdetailcode);
			stmtModel.executeQuery();
			docno=stmtModel.getInt("docNo");


			if (docno > 0) {
					
					Statement stmtTest1=conn.createStatement ();
					String testSql1="update  my_ssubmodel set frmyomid='"+frmyomid+"', toyomid='"+toyomid+"'    where  doc_no='"+docno+"'";
					 stmtTest1.executeUpdate(testSql1);

					}
			
			
			if (docno > 0) {

				conn.commit();
				stmtTest.close();
				stmtModel.close();
				conn.close();
				return docno;
			}
			stmtTest.close();
			stmtModel.close();
			conn.close();
		}catch(Exception e){	
			e.printStackTrace();	
			conn.close();
		}
		return 0;
	}

	public int submodeledit(String submodel,String smodelid,int docno,Date modeldate,String sbrandid,String mode, HttpSession session,String formdetailcode, int frmyomid, int toyomid) throws SQLException {
		Connection conn=ClsConnection.getMyConnection();
		try{

			//			System.out.println(conn);
			conn.setAutoCommit(false);
			Statement stmtTest=conn.createStatement ();
			String testSql="select submodel from my_ssubmodel where status<>7 and modelid="+smodelid+" and SUBMODEL='"+submodel+"' and doc_no<>"+docno+"";
			ResultSet resultSet1 = stmtTest.executeQuery (testSql);
			if(resultSet1.next()){
				stmtTest.close();
				conn.close();
				return -1;
			}
			CallableStatement stmtModel = conn.prepareCall("{call suitSubModelDML(?,?,?,?,?,?,?,?,?)}");

			stmtModel.setInt(7, docno);
			stmtModel.setString(1,submodel);
			stmtModel.setDate(2,(Date)modeldate);
			stmtModel.setString(3, sbrandid);
			stmtModel.setString(4, smodelid);
			stmtModel.setString(5, session.getAttribute("BRANCHID").toString());
			stmtModel.setString(6, session.getAttribute("USERID").toString());
			stmtModel.setString(8, mode);
			stmtModel.setString(9,formdetailcode);


			int aa = stmtModel.executeUpdate();

			

			if (aa > 0) {
					
					Statement stmtTest1=conn.createStatement ();
					String testSql1="update  my_ssubmodel set frmyomid='"+frmyomid+"', toyomid='"+toyomid+"'    where  doc_no='"+docno+"'";
					 stmtTest1.executeUpdate(testSql1);

					}
			
			
			
			if (aa>0) {

				conn.commit();
				stmtTest.close();
				stmtModel.close();
				conn.close();
				return aa;
			}

			stmtTest.close();
			stmtModel.close();
			conn.close();
		}catch(Exception e){
			e.printStackTrace();
			conn.close();
		}


		return 0;
	}


	public int submodeldelete(String submodel,String smodelid,int docno,Date modeldate,String sbrandid,String mode, HttpSession session,String formdetailcode) throws SQLException {
		Connection conn=ClsConnection.getMyConnection();
		try{

			conn.setAutoCommit(false);
			//			System.out.println(conn);
			Statement stmtTest=conn.createStatement ();

			/*String testsql3="select m.doc_no from gl_vehmodel b inner join gl_vehmaster m on m.vmodid=b.doc_no where b.vtype='"+model+"'";
			ResultSet resultSet3 = stmtTest.executeQuery (testsql3);
			if(resultSet3.next()){
				stmtTest.close();
				conn.close();
				return -2;
			}*/
			
		 
			String test="select submodelid from my_suitspec1 sm where submodelid='"+docno+"' and status=3";
			System.out.println("ref check"+test);
			ResultSet resultSet3 = stmtTest.executeQuery (test);
			if(resultSet3.next()){
				stmtTest.close();
				conn.close();
				System.out.println("refered");
				return -2;
				
			}
			
			
			
			String test2="select submodelid from my_suitspec2 sm where submodelid='"+docno+"' and status=3";
			System.out.println("ref check"+test2);
			ResultSet resultSet32 = stmtTest.executeQuery (test2);
			if(resultSet32.next()){
				stmtTest.close();
				conn.close();
				System.out.println("refered");
				return -2;
				
			}
			
			
			
			
			String test1="select submodelid from my_suitspec3 sm where submodelid='"+docno+"' and status=3";
			System.out.println("ref check"+test1);
			ResultSet resultSet31 = stmtTest.executeQuery (test1);
			if(resultSet31.next()){
				stmtTest.close();
				conn.close();
				System.out.println("refered");
				return -2;
				
			}
			
			
			
			String test22="select submodelid from my_suitmaster sm where submodelid='"+docno+"' ";
			System.out.println("ref check===================="+test22);
			ResultSet resultSet311 = stmtTest.executeQuery (test22);
			if(resultSet311.next()){
				stmtTest.close();
				conn.close();
				System.out.println("refered");
				return -2;
				
			}
			
			
			
			CallableStatement stmtModel = conn.prepareCall("{call suitSubModelDML(?,?,?,?,?,?,?,?,?)}");

			stmtModel.setInt(7, docno);
			stmtModel.setString(1,submodel);
			stmtModel.setDate(2,(Date)modeldate);
			stmtModel.setString(3, sbrandid);
			stmtModel.setString(4, smodelid);
			stmtModel.setString(5, session.getAttribute("BRANCHID").toString());
			stmtModel.setString(6, session.getAttribute("USERID").toString());
			stmtModel.setString(8, mode);
			stmtModel.setString(9,formdetailcode);

			int aa = stmtModel.executeUpdate();
			if (aa>0) {

				conn.commit();
				stmtModel.close();
				stmtTest.close();
				conn.close();
				return aa;
			}
			stmtTest.close();
			stmtModel.close();
			conn.close();
		}catch(Exception e){
			e.printStackTrace();
			conn.close();
		}


		return 0;
	}
	
	public JSONArray suitSearchLoad(HttpSession session) throws SQLException {


		JSONArray RESULTDATA=new JSONArray();

		Connection conn = null;

		try {
			conn = ClsConnection.getMyConnection();
			Statement stmt = conn.createStatement();

	String sql="select s.doc_no,s.yom_frm yomfrm,s.yom_to yomto,s.doc_no,brand,(case when s.smodelid=-1 then 'ALL' else model end) as model,"
				+ "(case when s.submodelid=-1 then 'ALL' else submodel end) as submodel,"
				+ "(case when s.esizeid=-1 then 'ALL' else coalesce(s2.spec,'') end) as esize,"
				+ "(case when s.bsize1id=-1 then 'ALL' else coalesce(s11.spec,'') end) as bsize1,"
				+ "(case when s.bsize2id=-1 then 'ALL' else coalesce(s12.spec,'') end) as bsize2,"
				+ "(case when s.bsize3id=-1 then 'ALL' else coalesce(s13.spec,'') end) as bsize3,"
				+ "(case when s.csize1id=-1 then 'ALL' else coalesce(s31.spec,'') end) as csize1,"
				+ "(case when s.csize2id=-1 then 'ALL' else coalesce(s32.spec,'') end) as csize2,"
				+ "(case when s.csize3id=-1 then 'ALL' else coalesce(s33.spec,'') end) as csize3,"
				+ "s.sbrandid brandid,s.smodelid modelid,s.submodelid submodelid,s.esizeid,s.bsize1id,s.bsize2id,s.bsize3id,"
				+ "s.csize1id,s.csize2id,s.csize3id,s.yom_frmid yomfrmid,s.yom_toid yomtoid,s.date  "
				+ "from my_vehsuitmaster s left join my_sbrand b on(b.doc_no=s.sbrandid) left join my_smodel m on(m.doc_no=s.smodelid)"
				+ "left join my_ssubmodel sm on(sm.doc_No=s.submodelid and sm.modelid=s.smodelid) left join my_suitspec2 s2 on(s2.doc_no=s.esizeid)"
				+ "left join my_suitspec1 s11 on(s11.doc_no=s.bsize1id)"
				+ "left join my_suitspec1 s12 on(s12.doc_no=s.bsize2id)"
				+ "left join my_suitspec1 s13 on(s13.doc_no=s.bsize3id)"
				+ "left join my_suitspec3 s31 on(s31.doc_no=s.csize1id)"
				+ "left join my_suitspec3 s32 on(s32.doc_no=s.csize2id)"
				+ "left join my_suitspec3 s33 on(s33.doc_no=s.csize3id)"
				+ "where s.status=3 ";

			
			System.out.println("=sql==suitSearch="+sql);
			
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
