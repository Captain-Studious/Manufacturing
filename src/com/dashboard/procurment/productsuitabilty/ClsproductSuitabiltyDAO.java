package com.dashboard.procurment.productsuitabilty;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import com.common.ClsCommon;
import com.connection.ClsConnection;

import net.sf.json.JSONArray;

 
public class ClsproductSuitabiltyDAO { 


	ClsConnection ClsConnection=new ClsConnection();
	ClsCommon ClsCommon=new ClsCommon();
	
	
public JSONArray mainlistSearch(HttpSession session,String load,String docno,String psrno,String suitstatus) throws SQLException {


 	
	 
 
		
		JSONArray RESULTDATA=new JSONArray();

	//	System.out.println("===load===="+load);
		
		if(!(load.equalsIgnoreCase("load")))
		{
			return RESULTDATA;
		}
		
		
		
		
		
		
		Connection conn = null;

		try {
		 
			
			conn = ClsConnection.getMyConnection();
			Statement stmt = conn.createStatement();
			 
			
			String sqls="";
			if(!(psrno.equalsIgnoreCase("0") || psrno.equalsIgnoreCase("") || psrno.equalsIgnoreCase("undefined"))){
				sqls=sqls+"  and m.doc_no in ("+psrno+")";
			}
			
			
			if(suitstatus.equalsIgnoreCase("NO"))
			{

				String sql = " select   m.doc_no,m.part_no product,m.productname pdesc,pt.producttype as type "
						+ " ,convert(if(m.fixingprice=0,'',m.fixingprice),char(100)) fixingprice, "
						+ "  convert(if(m.lbrchg=0,'',m.lbrchg),char(100)) lbrchg,convert(if(m.clrprice=0,'',m.clrprice),char(100)) clrprice, "
						+ "  convert(if(m.stdprice=0,'',m.stdprice),char(100)) stdprice, b.brand as brand,c.category "
						+ "  as cat,sc.subcategory as scat,dep.department as dept  from my_main m "
						+ "   left join my_ptype pt on(m.typeid=pt.doc_no) left join my_brand b on(m.brandid=b.doc_no) "
						+ " left join my_dept dep on(dep.doc_no=m.deptid) left join my_catm c on(m.catid=c.doc_no) "
						+ " left join my_scatm sc on(m.scatid=sc.doc_no) where m.status=3 and m.suitstatus=0 and  m.mtypeid='"+docno+"' "+sqls+"   group by m.doc_no ";

		 	System.out.println("==NO=="+sql);

				ResultSet resultSet = stmt.executeQuery(sql);
				RESULTDATA=ClsCommon.convertToJSON(resultSet);
			 
			

			}
			else if(suitstatus.equalsIgnoreCase("YES"))
					{
				String sql = " select   m.doc_no,m.part_no product,m.productname pdesc,pt.producttype as type "
						+ " ,convert(if(m.fixingprice=0,'',m.fixingprice),char(100)) fixingprice, "
						+ "  convert(if(m.lbrchg=0,'',m.lbrchg),char(100)) lbrchg,convert(if(m.clrprice=0,'',m.clrprice),char(100)) clrprice, "
						+ "  convert(if(m.stdprice=0,'',m.stdprice),char(100)) stdprice, b.brand as brand,c.category "
						+ "  as cat,sc.subcategory as scat,dep.department as dept  from my_main m "
						+ "   left join my_ptype pt on(m.typeid=pt.doc_no) left join my_brand b on(m.brandid=b.doc_no) "
						+ " left join my_dept dep on(dep.doc_no=m.deptid) left join my_catm c on(m.catid=c.doc_no) "
						+ " left join my_scatm sc on(m.scatid=sc.doc_no) where m.status=3 and m.suitstatus=1 and  m.mtypeid='"+docno+"' "+sqls+"   group by m.doc_no ";

		 	System.out.println("==YES=="+sql);

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
public JSONArray yomSearch(HttpSession session,String type,String yomfrm,String yomto,String yomfrmold,String yomtoold) throws SQLException {


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
 
		
		if(type.equalsIgnoreCase("frm"))
		{
		 
			
			sql="select convert('',char(20)) doc_no,'' yom,'' desc1 union all   select  convert(y.doc_no,char(20)) doc_no,y.yom,y.desc1 from my_syom  y   where y.status=3 and date_format(str_to_date(yom,'%Y'),'%Y')>="+yomfrmold+" and  date_format(str_to_date(yom,'%Y'),'%Y')<='"+yomtoold+"' order by desc1;"; 
			
		 
		}
		else if(type.equalsIgnoreCase("to"))
		 
		{
			
	 
			sql="  select  doc_no,yom,desc1 from (select convert('',char(20)) doc_no,'' yom,'' desc1 union all select  convert(doc_no,char(20)) doc_no,yom,desc1 from my_syom where desc1='0' "
					+ "	 union all  (select  convert(doc_no,char(20)) doc_no,yom,desc1 from my_syom where status=3 "+sqlappend+" and date_format(str_to_date(yom,'%Y'),'%Y')>="+yomfrmold+" and  date_format(str_to_date(yom,'%Y'),'%Y')<='"+yomtoold+"' ))a order by a.desc1 ";
		 
		}
		
 System.out.println("=======sql==="+sql);

		ResultSet resultSet = stmt.executeQuery(sql);
		RESULTDATA=ClsCommon.convertToJSON(resultSet);


	}catch(Exception e){
		e.printStackTrace();

	}finally{
		conn.close();
	}
	return RESULTDATA;
}
public JSONArray suitlistSearch(HttpSession session,String load,String docno,String status,String prddocno) throws SQLException {


 	
	 
	 
	
	JSONArray RESULTDATA=new JSONArray();

//	System.out.println("===load===="+load);
	
	if(!(load.equalsIgnoreCase("load")))
	{
		return RESULTDATA;
	}
	
	
	
	
	
	
	Connection conn = null;

	try {
	 
		
		conn = ClsConnection.getMyConnection();
		Statement stmt = conn.createStatement();
		 
		 String sqls="";
		if(!(prddocno.equalsIgnoreCase("0") || prddocno.equalsIgnoreCase("") || prddocno.equalsIgnoreCase("undefined"))){
			sqls="  and sm1.psrno in ("+prddocno+")";
		}
		
		 
		if(docno.equalsIgnoreCase("2"))
		{
			
			if(status.equalsIgnoreCase("NO"))    // submodel 
					{
				
				
				String sql=" select   b.brand,m.brandid,mo.model,mo.doc_no as modelid,m.submodel,m.doc_no submodelid, "
						+ " m.frmyomid yomfrmid ,m.toyomid yomtoid,coalesce(f.yom,'') yomfrm,coalesce(t.yom,'') yomto "
						+ "  from my_ssubmodel m  inner join my_smodel mo on(mo.doc_no=m.modelid) left join my_sbrand b "
						+ "  on(m.brandid=b.doc_no)  left join my_syom f on f.doc_no=m.frmyomid  left join my_syom t on t.doc_no=m.toyomid"
						+ "   where m.status=3   ";
				
				
				System.out.println("=NO=2=="+sql);

				ResultSet resultSet = stmt.executeQuery(sql);
				RESULTDATA=ClsCommon.convertToJSON(resultSet);
				
				
					}
			else if(status.equalsIgnoreCase("YES"))  
			{
				
				
				
				String sql=" select sm1.pyomfrm yomfrm1,sm1.pyomfrmid yomfrmid1 ,sm1.pyomto yomto1,sm1.pyomtoid yomtoid1, convert(1,char(20)) suitstatus ,b.brand,m.brandid,mo.model,mo.doc_no as modelid,m.submodel,m.doc_no submodelid, "
						+ " m.frmyomid yomfrmid ,m.toyomid yomtoid,coalesce(f.yom,'') yomfrm,coalesce(t.yom,'') yomto "
						+ "  from my_ssubmodel m  inner join my_smodel mo on(mo.doc_no=m.modelid) left join my_sbrand b "
						+ "  on(m.brandid=b.doc_no) left join my_syom f on f.doc_no=m.frmyomid left join my_syom t on t.doc_no=m.toyomid "
						+ "   left join my_suitmaster sm1 on sm1.submodelid=m.doc_no where m.status=3  "+sqls+" and sm1.submodelid is not null union all"
						+ " select sm1.pyomfrm yomfrm1,sm1.pyomfrmid yomfrmid1 ,sm1.pyomto yomto1,sm1.pyomtoid yomtoid1, convert('' ,char(20)) suitstatus, b.brand,m.brandid,mo.model,mo.doc_no as modelid,m.submodel,m.doc_no submodelid, "
						+ " m.frmyomid yomfrmid ,m.toyomid yomtoid,coalesce(f.yom,'') yomfrm,coalesce(t.yom,'') yomto "
						+ "  from my_ssubmodel m  inner join my_smodel mo on(mo.doc_no=m.modelid) left join my_sbrand b "
						+ "  on(m.brandid=b.doc_no)  left join my_syom f on f.doc_no=m.frmyomid  left join my_syom t on t.doc_no=m.toyomid"
						+ " left join my_suitmaster sm1 on sm1.submodelid=m.doc_no where m.status=3  and sm1.submodelid is  null ";
				
				
				System.out.println("=YES=2=="+sql);

				ResultSet resultSet = stmt.executeQuery(sql);
				RESULTDATA=ClsCommon.convertToJSON(resultSet);
			}
			
			
			
			
			
		}
		
 
		else if(docno.equalsIgnoreCase("3"))   // esizeid
		{
			
			if(status.equalsIgnoreCase("NO"))     
			{
		
		

			String sql="select s.frmyomid yomfrmid,s.toyomid yomtoid,coalesce(f.yom,'') yomfrm,coalesce(t.yom,'') yomto,s.doc_no esizeid, spec esize,brand, model, "
					+ " submodel,s.brandid,s.modelid,s.submodelid "
					+ " from my_suitspec2 s left join my_sbrand b "
			+ "  on(b.doc_no=s.brandid) left join my_smodel m on(m.doc_no=s.modelid) left join my_ssubmodel "
			+ "  sm on(sm.doc_No=s.submodelid and sm.modelid=s.modelid) "
			+ " left join my_syom f on f.doc_no=s.frmyomid left join my_syom t on t.doc_no=s.toyomid "
			+ "    where s.status=3     ";
			System.out.println("==3=="+sql);

			ResultSet resultSet = stmt.executeQuery(sql);
			RESULTDATA=ClsCommon.convertToJSON(resultSet);
			
			}
			else if(status.equalsIgnoreCase("YES"))
			{
				
				
				
				String sql="select  sm1.pyomfrm yomfrm1,sm1.pyomfrmid yomfrmid1 ,sm1.pyomto yomto1,sm1.pyomtoid yomtoid1, convert(1,char(20)) suitstatus ,s.frmyomid yomfrmid,s.toyomid yomtoid,coalesce(f.yom,'') yomfrm,"
						+ "coalesce(t.yom,'') yomto,s.doc_no esizeid, spec esize,brand, model, "
						+ " submodel,s.brandid,s.modelid,s.submodelid "
						+ " from my_suitspec2 s left join my_sbrand b "
				+ "  on(b.doc_no=s.brandid) left join my_smodel m on(m.doc_no=s.modelid) left join my_ssubmodel "
				+ "  sm on(sm.doc_No=s.submodelid and sm.modelid=s.modelid) "
				+ " left join my_syom f on f.doc_no=s.frmyomid left join my_syom t on t.doc_no=s.toyomid "
				+ "  left join my_suitmaster sm1 on sm1.esizeid=s.doc_no where s.status=3  "+sqls+" and sm1.esizeid is not null  union all "
				+ "select  sm1.pyomfrm yomfrm1,sm1.pyomfrmid yomfrmid1 ,sm1.pyomto yomto1,sm1.pyomtoid yomtoid1, convert('',char(20)) suitstatus ,s.frmyomid yomfrmid,s.toyomid yomtoid,coalesce(f.yom,'') yomfrm,coalesce(t.yom,'') yomto,s.doc_no "
				+ " esizeid, spec esize,brand, model, "
						+ " submodel,s.brandid,s.modelid,s.submodelid "
						+ " from my_suitspec2 s left join my_sbrand b "
				+ "  on(b.doc_no=s.brandid) left join my_smodel m on(m.doc_no=s.modelid) left join my_ssubmodel "
				+ "  sm on(sm.doc_No=s.submodelid and sm.modelid=s.modelid) "
				+ " left join my_syom f on f.doc_no=s.frmyomid left join my_syom t on t.doc_no=s.toyomid "
				+ "  left join my_suitmaster sm1 on sm1.esizeid=s.doc_no where s.status=3  and sm1.esizeid is  null  ";

				
				
				System.out.println("==3=="+sql);

				ResultSet resultSet = stmt.executeQuery(sql);
				RESULTDATA=ClsCommon.convertToJSON(resultSet);
				
			}
			
			
			
			
		}
		
		
		else if(docno.equalsIgnoreCase("4"))    // csizeid
		{
			
			
			if(status.equalsIgnoreCase("NO"))     
			{
		
		

			String sql="select s.frmyomid yomfrmid,s.toyomid yomtoid,coalesce(f.yom,'') yomfrm,coalesce(t.yom,'') yomto,s.doc_no csizeid, spec csize,brand, model, "
					+ " submodel,s.brandid,s.modelid,s.submodelid "
					+ " from my_suitspec3 s left join my_sbrand b "
			+ "  on(b.doc_no=s.brandid) left join my_smodel m on(m.doc_no=s.modelid) left join my_ssubmodel "
			+ "  sm on(sm.doc_No=s.submodelid and sm.modelid=s.modelid) "
			+ " left join my_syom f on f.doc_no=s.frmyomid left join my_syom t on t.doc_no=s.toyomid  "
			+ "  where s.status=3      ";
			
			
			
		 
			System.out.println("=NO==5=="+sql);

			ResultSet resultSet = stmt.executeQuery(sql);
			RESULTDATA=ClsCommon.convertToJSON(resultSet);
			
			
			}
			else if(status.equalsIgnoreCase("YES"))     
			{
				
				String sql="select  sm1.pyomfrm yomfrm1,sm1.pyomfrmid yomfrmid1 ,sm1.pyomto yomto1,sm1.pyomtoid yomtoid1, convert(1,char(20)) suitstatus ,s.frmyomid yomfrmid,s.toyomid yomtoid,coalesce(f.yom,'') yomfrm,coalesce(t.yom,'') yomto,s.doc_no csizeid, spec csize,brand, model, "
						+ " submodel,s.brandid,s.modelid,s.submodelid "
						+ " from my_suitspec3 s left join my_sbrand b "
				+ "  on(b.doc_no=s.brandid) left join my_smodel m on(m.doc_no=s.modelid) left join my_ssubmodel "
				+ "  sm on(sm.doc_No=s.submodelid and sm.modelid=s.modelid) "
				+ " left join my_syom f on f.doc_no=s.frmyomid left join my_syom t on t.doc_no=s.toyomid  "
				+ " left join my_suitmaster sm1 on sm1.csizeid=s.doc_no where s.status=3  "+sqls+" and sm1.csizeid is not null "
				+ " union all select  sm1.pyomfrm yomfrm1,sm1.pyomfrmid yomfrmid1 ,sm1.pyomto yomto1,sm1.pyomtoid yomtoid1, convert('',char(20)) suitstatus ,s.frmyomid yomfrmid,s.toyomid yomtoid,coalesce(f.yom,'') yomfrm,coalesce(t.yom,'') yomto,s.doc_no csizeid, spec csize,brand, model, "
						+ " submodel,s.brandid,s.modelid,s.submodelid "
						+ " from my_suitspec3 s left join my_sbrand b "
				+ "  on(b.doc_no=s.brandid) left join my_smodel m on(m.doc_no=s.modelid) left join my_ssubmodel "
				+ "  sm on(sm.doc_No=s.submodelid and sm.modelid=s.modelid) "
				+ " left join my_syom f on f.doc_no=s.frmyomid left join my_syom t on t.doc_no=s.toyomid  "
				+ " left join my_suitmaster sm1 on sm1.csizeid=s.doc_no where s.status=3  and sm1.csizeid is  null  ";
			 
				System.out.println("=YES==5=="+sql);

				ResultSet resultSet = stmt.executeQuery(sql);
				RESULTDATA=ClsCommon.convertToJSON(resultSet);
				
				
			}
			
			
			
			
			
		}
		else if(docno.equalsIgnoreCase("5"))    // bsizeid
		{
			
			
			if(status.equalsIgnoreCase("NO"))     
			{
		
			String sql="select s.frmyomid yomfrmid,s.toyomid yomtoid,coalesce(f.yom,'') yomfrm,coalesce(t.yom,'') yomto,s.doc_no bsizeid, spec bsize,brand, model, "
					+ " submodel,s.brandid,s.modelid,s.submodelid "
					+ " from my_suitspec1 s left join my_sbrand b "
			+ "  on(b.doc_no=s.brandid) left join my_smodel m on(m.doc_no=s.modelid) left join my_ssubmodel "
			+ "  sm on(sm.doc_No=s.submodelid and sm.modelid=s.modelid) "
			+ " left join my_syom f on f.doc_no=s.frmyomid left join my_syom t on t.doc_no=s.toyomid"
			+ "    where s.status=3 ";

			
			System.out.println("=NO=4=="+sql);

			ResultSet resultSet = stmt.executeQuery(sql);
			RESULTDATA=ClsCommon.convertToJSON(resultSet);
			
			
			}
			else if(status.equalsIgnoreCase("YES"))     
			{
				
				String sql="select  sm1.pyomfrm yomfrm1,sm1.pyomfrmid yomfrmid1 ,sm1.pyomto yomto1,sm1.pyomtoid yomtoid1, convert(1,char(20)) suitstatus ,s.frmyomid yomfrmid,s.toyomid yomtoid,coalesce(f.yom,'') yomfrm,coalesce(t.yom,'') yomto,s.doc_no bsizeid, spec bsize,brand, model, "
						+ " submodel,s.brandid,s.modelid,s.submodelid "
						+ " from my_suitspec1 s left join my_sbrand b "
				+ "  on(b.doc_no=s.brandid) left join my_smodel m on(m.doc_no=s.modelid) left join my_ssubmodel "
				+ "  sm on(sm.doc_No=s.submodelid and sm.modelid=s.modelid) "
				+ " left join my_syom f on f.doc_no=s.frmyomid left join my_syom t on t.doc_no=s.toyomid"
				+ "  left join my_suitmaster sm1 on sm1.bsizeid=s.doc_no   where s.status=3  "+sqls+" and sm1.bsizeid is not  null union all "
				+ " select  sm1.pyomfrm yomfrm1,sm1.pyomfrmid yomfrmid1 ,sm1.pyomto yomto1,sm1.pyomtoid yomtoid1, convert('',char(20)) suitstatus ,s.frmyomid yomfrmid,s.toyomid yomtoid,coalesce(f.yom,'') yomfrm,coalesce(t.yom,'') yomto,s.doc_no bsizeid, spec bsize,brand, model, "
						+ " submodel,s.brandid,s.modelid,s.submodelid "
						+ " from my_suitspec1 s left join my_sbrand b "
				+ "  on(b.doc_no=s.brandid) left join my_smodel m on(m.doc_no=s.modelid) left join my_ssubmodel "
				+ "  sm on(sm.doc_No=s.submodelid and sm.modelid=s.modelid) "
				+ " left join my_syom f on f.doc_no=s.frmyomid left join my_syom t on t.doc_no=s.toyomid"
				+ "  left join my_suitmaster sm1 on sm1.bsizeid=s.doc_no   where s.status=3 and sm1.bsizeid is null ";
				System.out.println("=YES=4=="+sql);

				ResultSet resultSet = stmt.executeQuery(sql);
				RESULTDATA=ClsCommon.convertToJSON(resultSet);
				
				
				
			}
			
			
			
		}
		
		
	
		
		else if(docno.equalsIgnoreCase("6"))
		{
		
			

			if(status.equalsIgnoreCase("NO"))     
			{
			
	/*		String sql=" select  brand, model, submodel,s.brandid,s.modelid,s.submodelid ,s.frmyomid yomfrmid,s.toyomid yomtoid,coalesce(f.yom,'') yomfrm,coalesce(t.yom,'') yomto "
					+ "  ,s.doc_no bsizeid , s2.doc_no esizeid,s3.doc_no csizeid,s.spec bsize,s2.spec esize,s3.spec csize "
					+ " from my_suitspec1 s inner join my_suitspec2 s2 on s.submodelid=s2.submodelid "
					+ "  inner join my_suitspec3 s3 on s.submodelid=s3.submodelid and s3.submodelid=s2.submodelid "
				+ "  left join my_syom f on f.doc_no=s.frmyomid left join my_syom t on t.doc_no=s.toyomid "
				+ "  left join my_sbrand b on(b.doc_no=s.brandid) left join my_smodel m on(m.doc_no=s.modelid) left join my_ssubmodel "
				+ "  sm on(sm.doc_No=s.submodelid and sm.modelid=s.modelid) "
				+ "  where s.status=3 and s2.status=3 "
				+ "  and s3.status=3   group by s.doc_no,s2.doc_no,s3.doc_no  ";*/
				
				
				String sql=" select brand,model,submodel,brandid,modelid,submodelid,bsizeid,esizeid,csizeid,bsize,esize,csize,yomfrm,yomto,"
						+ "f.doc_no yomfrmid,t.doc_no yomtoid from( "
						+ "  select if(coalesce(f3.yom,'')>=if(coalesce(f.yom,'')>=coalesce(f2.yom,''),coalesce(f.yom,''), "
						+ " coalesce(f2.yom,'')),coalesce(f3.yom,''),if(coalesce(f.yom,'')>=coalesce(f2.yom,''),coalesce(f.yom,''),coalesce(f2.yom,''))) "
						 + " yomfrm, if(coalesce(t3.yom,'')<=if(coalesce(t.yom,'')<=coalesce(t2.yom,''),coalesce(t.yom,''),coalesce(t2.yom,'')), "
						 + "  coalesce(t3.yom,''),if(coalesce(t.yom,'')<=coalesce(t2.yom,''),coalesce(t.yom,''),coalesce(t2.yom,''))) yomto, "
						 + "  brand, model, submodel,s.brandid,s.modelid,s.submodelid    ,s.doc_no bsizeid , s2.doc_no esizeid, "
						 + "  s3.doc_no csizeid,s.spec bsize,s2.spec esize,s3.spec csize "
						 + "  from my_suitspec1 s inner join my_suitspec2 s2 on s.submodelid=s2.submodelid "
						 + "  inner join my_suitspec3 s3 on s.submodelid=s3.submodelid and s3.submodelid=s2.submodelid "
						 + "  left join my_syom f on f.doc_no=s.frmyomid left join my_syom t on t.doc_no=s.toyomid "
						 + "  left join my_syom f2 on f2.doc_no=s2.frmyomid left join my_syom t2 on t2.doc_no=s2.toyomid "
						+ "   left join my_syom f3 on f3.doc_no=s3.frmyomid left join my_syom t3 on t3.doc_no=s3.toyomid "
						+ "  left join my_sbrand b on(b.doc_no=s.brandid) left join my_smodel m on(m.doc_no=s.modelid) left join my_ssubmodel "
						+ "  sm on(sm.doc_No=s.submodelid and sm.modelid=s.modelid)   where s.status=3 and s2.status=3   and s3.status=3"
						+ "  group by s.doc_no,s2.doc_no,s3.doc_no) a   left join my_syom f on f.yom=a.yomfrm left join my_syom t on t.yom=a.yomto  where (yomto='OPEN' or yomto>=yomfrm); " ;
		
			
			System.out.println("=NO=5=="+sql);

			ResultSet resultSet = stmt.executeQuery(sql);
			RESULTDATA=ClsCommon.convertToJSON(resultSet);
			
			
			}
			else if(status.equalsIgnoreCase("YES"))    
			{
				
	/*			String sql=" select   sm1.pyomfrm yomfrm1,sm1.pyomfrmid yomfrmid1 ,sm1.pyomto yomto1,sm1.pyomtoid yomtoid1, convert(1,char(20)) suitstatus ,brand, model, submodel,s.brandid,s.modelid,s.submodelid ,s.frmyomid yomfrmid,s.toyomid yomtoid,coalesce(f.yom,'') yomfrm,"
						+ " coalesce(t.yom,'') yomto "
						+ "  ,s.doc_no bsizeid , s2.doc_no esizeid,s3.doc_no csizeid,s.spec bsize,s2.spec esize,s3.spec csize "
						+ " from my_suitspec1 s inner join my_suitspec2 s2 on s.submodelid=s2.submodelid "
						+ "  inner join my_suitspec3 s3 on s.submodelid=s3.submodelid and s3.submodelid=s2.submodelid "
					+ "  left join my_syom f on f.doc_no=s.frmyomid left join my_syom t on t.doc_no=s.toyomid "
					+ "  left join my_sbrand b on(b.doc_no=s.brandid) left join my_smodel m on(m.doc_no=s.modelid) left join my_ssubmodel "
					+ "  sm on(sm.doc_No=s.submodelid and sm.modelid=s.modelid)  left join my_suitmaster sm1 on sm1.bsizeid=s.doc_no and sm1.esizeid=s2.doc_no "
					+ " and sm1.csizeid=s3.doc_no"
					+ "  where s.status=3 and s2.status=3 and s3.status=3  "+sqls+" "
					+ " and sm1.bsizeid is not null  and sm1.esizeid is not null and  sm1.csizeid is not null   group by s.doc_no,s2.doc_no,s3.doc_no 
					  union all "
					+ "  select   sm1.pyomfrm yomfrm1,sm1.pyomfrmid yomfrmid1 ,sm1.pyomto yomto1,sm1.pyomtoid yomtoid1, convert('',char(20)) suitstatus ,
					 brand, model, submodel,s.brandid,s.modelid,s.submodelid ,s.frmyomid yomfrmid,s.toyomid yomtoid,coalesce(f.yom,'') yomfrm,"
							+ " coalesce(t.yom,'') yomto "
							+ "  ,s.doc_no bsizeid , s2.doc_no esizeid,s3.doc_no csizeid,s.spec bsize,s2.spec esize,s3.spec csize "
							+ " from my_suitspec1 s inner join my_suitspec2 s2 on s.submodelid=s2.submodelid "
							+ "  inner join my_suitspec3 s3 on s.submodelid=s3.submodelid and s3.submodelid=s2.submodelid "
						+ "  left join my_syom f on f.doc_no=s.frmyomid left join my_syom t on t.doc_no=s.toyomid "
						+ "  left join my_sbrand b on(b.doc_no=s.brandid) left join my_smodel m on(m.doc_no=s.modelid) left join my_ssubmodel "
						+ "  sm on(sm.doc_No=s.submodelid and sm.modelid=s.modelid)  left join my_suitmaster sm1 on sm1.bsizeid=s.doc_no and sm1.esizeid=s2.doc_no "
						+ " and sm1.csizeid=s3.doc_no"
						+ "  where s.status=3 and s2.status=3 and s3.status=3 "
						+ " and sm1.bsizeid is null  and sm1.esizeid is null and  sm1.csizeid is null   group by s.doc_no,s2.doc_no,s3.doc_no   ";*/
				
				
				
				String sql=" select   sm1.pyomfrm yomfrm1,sm1.pyomfrmid yomfrmid1 ,sm1.pyomto yomto1,sm1.pyomtoid yomtoid1, convert(1,char(20)) suitstatus ,"
						+ " brand, model, submodel,s.brandid,s.modelid,s.submodelid ,sm1.yomfrmid yomfrmid,sm1.yomtoid yomtoid,sm1.yomfrm,"
						+ " sm1.yomto "
						+ "  ,s.doc_no bsizeid , s2.doc_no esizeid,s3.doc_no csizeid,s.spec bsize,s2.spec esize,s3.spec csize "
						+ " from my_suitspec1 s inner join my_suitspec2 s2 on s.submodelid=s2.submodelid "
						+ "  inner join my_suitspec3 s3 on s.submodelid=s3.submodelid and s3.submodelid=s2.submodelid "
					+ "  left join my_syom f on f.doc_no=s.frmyomid left join my_syom t on t.doc_no=s.toyomid "
					+ "  left join my_sbrand b on(b.doc_no=s.brandid) left join my_smodel m on(m.doc_no=s.modelid) left join my_ssubmodel "
					+ "  sm on(sm.doc_No=s.submodelid and sm.modelid=s.modelid)  left join my_suitmaster sm1 on sm1.bsizeid=s.doc_no and sm1.esizeid=s2.doc_no "
					+ " and sm1.csizeid=s3.doc_no"
					+ "  where s.status=3 and s2.status=3 and s3.status=3  "+sqls+" "
					+ " and sm1.bsizeid is not null  and sm1.esizeid is not null and  sm1.csizeid is not null   group by s.doc_no,s2.doc_no,s3.doc_no  "
					+ "  union all "
					+ "  select  sm1.pyomfrm yomfrm1,sm1.pyomfrmid yomfrmid1 ,sm1.pyomto yomto1,sm1.pyomtoid yomtoid1, convert('',char(20)) suitstatus ,"
					+ " a.brand,a.model,a.submodel,a.brandid,a.modelid,a.submodelid,f.doc_no yomfrmid,t.doc_no yomtoid,a.yomfrm,a.yomto,a.bsizeid,a.esizeid,a.csizeid,a.bsize,a.esize,a.csize from( "
							+ "  select if(coalesce(f3.yom,'')>=if(coalesce(f.yom,'')>=coalesce(f2.yom,''),coalesce(f.yom,''), "
							+ " coalesce(f2.yom,'')),coalesce(f3.yom,''),if(coalesce(f.yom,'')>=coalesce(f2.yom,''),coalesce(f.yom,''),coalesce(f2.yom,''))) "
							 + " yomfrm, if(coalesce(t3.yom,'')<=if(coalesce(t.yom,'')<=coalesce(t2.yom,''),coalesce(t.yom,''),coalesce(t2.yom,'')), "
							 + "  coalesce(t3.yom,''),if(coalesce(t.yom,'')<=coalesce(t2.yom,''),coalesce(t.yom,''),coalesce(t2.yom,''))) yomto, "
							 + "  brand, model, submodel,s.brandid,s.modelid,s.submodelid    ,s.doc_no bsizeid , s2.doc_no esizeid, "
							 + "  s3.doc_no csizeid,s.spec bsize,s2.spec esize,s3.spec csize "
							 + "  from my_suitspec1 s inner join my_suitspec2 s2 on s.submodelid=s2.submodelid "
							 + "  inner join my_suitspec3 s3 on s.submodelid=s3.submodelid and s3.submodelid=s2.submodelid "
							 + "  left join my_syom f on f.doc_no=s.frmyomid left join my_syom t on t.doc_no=s.toyomid "
							 + "  left join my_syom f2 on f2.doc_no=s2.frmyomid left join my_syom t2 on t2.doc_no=s2.toyomid "
							+ "   left join my_syom f3 on f3.doc_no=s3.frmyomid left join my_syom t3 on t3.doc_no=s3.toyomid "
							+ "  left join my_sbrand b on(b.doc_no=s.brandid) left join my_smodel m on(m.doc_no=s.modelid) left join my_ssubmodel "
							+ "  sm on(sm.doc_No=s.submodelid and sm.modelid=s.modelid)   where s.status=3 and s2.status=3   and s3.status=3"
							+ "  group by s.doc_no,s2.doc_no,s3.doc_no) a   left join my_syom f on f.yom=a.yomfrm left join my_syom t on t.yom=a.yomto"
							+ "  left join my_suitmaster sm1 on sm1.bsizeid=a.bsizeid and sm1.esizeid=a.esizeid and sm1.csizeid=a.csizeid where sm1.bsizeid is null  and sm1.esizeid is null and  sm1.csizeid is null  and (a.yomto='OPEN' or a.yomto>=a.yomfrm);" ;
				
				
				System.out.println("=NO=5=="+sql);

				ResultSet resultSet = stmt.executeQuery(sql);
				RESULTDATA=ClsCommon.convertToJSON(resultSet);
				
			}
			
			
			
		}

	


	}catch(Exception e){
		e.printStackTrace();

	}finally{
		conn.close();
	}
	return RESULTDATA;
}


public   JSONArray listgridsearch(String doc_no) throws SQLException {

    JSONArray RESULTDATA=new JSONArray();
    

	
 	Connection conn = null;
    
	try {
			 conn = ClsConnection.getMyConnection();
			Statement stmtVeh = conn.createStatement ();   
		     
				String sql="select 'Un Assigned' types ,count(suitstatus) counts,'NO' suitstatus from my_main where status=3 and mtypeid='"+doc_no+"' and suitstatus=0 union all "
						+ "select ' Assigned' types , count(suitstatus) counts,'YES' suitstatus from my_main where status=3  and mtypeid='"+doc_no+"' and suitstatus=1  ";
			
        	 
        		ResultSet resultSet = stmtVeh.executeQuery(sql);
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

public JSONArray productSearch(HttpSession session,String type) throws SQLException {


	JSONArray RESULTDATA=new JSONArray();

	Connection conn = null;

	try {
		conn = ClsConnection.getMyConnection();
		Statement stmt = conn.createStatement();

	

		String sql="select m.psrno doc_no,m.part_no prodcode,m.productname prodname,um.unit from my_main m inner join my_brand b on(m.brandid=b.doc_no)"
				+ "inner join my_catm c on(m.catid=c.doc_no) inner join my_scatm s on(m.scatid=s.doc_no) left join my_unit u on(u.psrno=m.psrno) "
				+ " left join my_unitm um on(um.doc_no=m.munit)  where m.mtypeid='"+type+"' and m.status=3";
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

public int insert(ArrayList<String> descarray, int cmbmastertype, int prddocno) throws SQLException {
	 
 

		Connection conn = null;

		try {
		 
			
			conn = ClsConnection.getMyConnection();
			conn.setAutoCommit(false);
			Statement stmt = conn.createStatement();
			 
			String updatesq1=" update my_main set suitstatus='0' where doc_no="+prddocno+" ";
			 
		//	System.out.println("=========updatesq1======"+updatesq1);
			 stmt.executeUpdate(updatesq1);
			 
			 
			 String updatesq11=" delete from  my_suitmaster where psrno="+prddocno+" ";
			 
		//	 System.out.println("=========updatesq11======"+updatesq11);
			 
			 stmt.executeUpdate(updatesq11); 
			
			
			int i=0;
			for (i=0;i<descarray.size();i++)
			{
				
				
				
			
				
				
				
				 String[] detmasterarrays=descarray.get(i).split("::");
				 if(!(detmasterarrays[4].trim().equalsIgnoreCase("undefined")|| detmasterarrays[4].trim().equalsIgnoreCase("NaN")||detmasterarrays[4].trim().equalsIgnoreCase("")|| detmasterarrays[4].isEmpty()))
			     {
					/* doc_no, psrno, typeid, brandid, modelid, submodelid, esizeid, bsizeid, csizeid, date, status
					 
					 
					 
				     	newTextBox.val($("#suitlistgrid").jqxGrid('getcellvalue',selectedrows[i],'yomfrm')+"::"+  0
				     			$("#suitlistgrid").jqxGrid('getcellvalue',selectedrows[i],'yomfrmid')+"::"+ 1
				     			$("#suitlistgrid").jqxGrid('getcellvalue',selectedrows[i],'yomto')+"::"+    2
				     			$("#suitlistgrid").jqxGrid('getcellvalue',selectedrows[i],'yomtoid')+"::"+  3
				     			$("#suitlistgrid").jqxGrid('getcellvalue',selectedrows[i],'brandid')+"::"+  4
				     			$("#suitlistgrid").jqxGrid('getcellvalue',selectedrows[i],'modelid')+"::"+  5 
				     			$("#suitlistgrid").jqxGrid('getcellvalue',selectedrows[i],'submodelid')+"::"+ 6
				     			$("#suitlistgrid").jqxGrid('getcellvalue',selectedrows[i],'esizeid')+"::"+    7 
				     			$("#suitlistgrid").jqxGrid('getcellvalue',selectedrows[i],'bsizeid')+"::"+    8 
				     			$("#suitlistgrid").jqxGrid('getcellvalue',selectedrows[i],'csizeid')+"::");   9
				     			
				     			*/
								 
				     	
					 
					 if(i==0)
					 {			
						 String updatesqls1=" update my_main set suitstatus='1' where doc_no="+prddocno+" ";
					 
							 stmt.executeUpdate(updatesqls1);
							 
							 
							 String updatesqls11=" delete from  my_suitmaster where psrno="+prddocno+" ";
							 
							 stmt.executeUpdate(updatesqls11); 
				 		 
			         }
					 
				     String insql="INSERT INTO my_suitmaster(psrno,typeid,yomfrm,yomfrmid,yomto,yomtoid,brandid,modelid,submodelid,esizeid,bsizeid,csizeid,pyomfrm,pyomfrmid,pyomto,pyomtoid)VALUES"
						       + " ("+prddocno+","+cmbmastertype+","
						       + "'"+(detmasterarrays[0].trim().equalsIgnoreCase("undefined") || detmasterarrays[0].trim().equalsIgnoreCase("NaN")|| detmasterarrays[0].trim().equalsIgnoreCase("")|| detmasterarrays[0].isEmpty()?0:detmasterarrays[0].trim())+"',"
						       + "'"+(detmasterarrays[1].trim().equalsIgnoreCase("undefined") || detmasterarrays[1].trim().equalsIgnoreCase("NaN")|| detmasterarrays[1].trim().equalsIgnoreCase("")|| detmasterarrays[1].isEmpty()?0:detmasterarrays[1].trim())+"',"
						       + "'"+(detmasterarrays[2].trim().equalsIgnoreCase("undefined") || detmasterarrays[2].trim().equalsIgnoreCase("NaN")|| detmasterarrays[2].trim().equalsIgnoreCase("")|| detmasterarrays[2].isEmpty()?0:detmasterarrays[2].trim())+"',"
						       + "'"+(detmasterarrays[3].trim().equalsIgnoreCase("undefined") || detmasterarrays[3].trim().equalsIgnoreCase("NaN")||detmasterarrays[3].trim().equalsIgnoreCase("")|| detmasterarrays[3].isEmpty()?0:detmasterarrays[3].trim())+"',"
						       + "'"+(detmasterarrays[4].trim().equalsIgnoreCase("undefined") || detmasterarrays[4].trim().equalsIgnoreCase("NaN")||detmasterarrays[4].trim().equalsIgnoreCase("")|| detmasterarrays[4].isEmpty()?0:detmasterarrays[4].trim())+"',"
						       + "'"+(detmasterarrays[5].trim().equalsIgnoreCase("undefined") || detmasterarrays[5].trim().equalsIgnoreCase("NaN")||detmasterarrays[5].trim().equalsIgnoreCase("")|| detmasterarrays[5].isEmpty()?0:detmasterarrays[5].trim())+"',"
						       + "'"+(detmasterarrays[6].trim().equalsIgnoreCase("undefined") || detmasterarrays[6].trim().equalsIgnoreCase("NaN")||detmasterarrays[6].trim().equalsIgnoreCase("")|| detmasterarrays[6].isEmpty()?0:detmasterarrays[6].trim())+"',"
						       + "'"+(detmasterarrays[7].trim().equalsIgnoreCase("undefined") || detmasterarrays[7].trim().equalsIgnoreCase("NaN")||detmasterarrays[7].trim().equalsIgnoreCase("")|| detmasterarrays[7].isEmpty()?0:detmasterarrays[7].trim())+"',"
						       + "'"+(detmasterarrays[8].trim().equalsIgnoreCase("undefined") || detmasterarrays[8].trim().equalsIgnoreCase("NaN")||detmasterarrays[8].trim().equalsIgnoreCase("")|| detmasterarrays[8].isEmpty()?0:detmasterarrays[8].trim())+"',"
						       + "'"+(detmasterarrays[9].trim().equalsIgnoreCase("undefined") || detmasterarrays[9].trim().equalsIgnoreCase("NaN")||detmasterarrays[9].trim().equalsIgnoreCase("")|| detmasterarrays[9].isEmpty()?0:detmasterarrays[9].trim())+"',"
						       + "'"+(detmasterarrays[10].trim().equalsIgnoreCase("undefined") || detmasterarrays[10].trim().equalsIgnoreCase("NaN")||detmasterarrays[10].trim().equalsIgnoreCase("")|| detmasterarrays[10].isEmpty()?0:detmasterarrays[10].trim())+"',"
						       + "'"+(detmasterarrays[11].trim().equalsIgnoreCase("undefined") || detmasterarrays[11].trim().equalsIgnoreCase("NaN")||detmasterarrays[11].trim().equalsIgnoreCase("")|| detmasterarrays[11].isEmpty()?0:detmasterarrays[11].trim())+"',"
						       + "'"+(detmasterarrays[12].trim().equalsIgnoreCase("undefined") || detmasterarrays[12].trim().equalsIgnoreCase("NaN")||detmasterarrays[12].trim().equalsIgnoreCase("")|| detmasterarrays[12].isEmpty()?0:detmasterarrays[12].trim())+"',"
						       + "'"+(detmasterarrays[13].trim().equalsIgnoreCase("undefined") || detmasterarrays[13].trim().equalsIgnoreCase("NaN")||detmasterarrays[13].trim().equalsIgnoreCase("")|| detmasterarrays[13].isEmpty()?0:detmasterarrays[13].trim())+"')";
	     			
				    // 	System.out.println("========insql========="+insql);
				     int resultSet2 = stmt.executeUpdate(insql);
				     if(resultSet2<=0)
						{
							conn.close();
							return 0;
							
						}

								
					 
					 
					 
					 
			     }
				
			}
			
			conn.commit();
			conn.close();
			return 1;
			
			
		}
		catch(Exception e)
		{
			e.printStackTrace();
			conn.close();
			
		}
		
		
		
		return 0;
	}
}
