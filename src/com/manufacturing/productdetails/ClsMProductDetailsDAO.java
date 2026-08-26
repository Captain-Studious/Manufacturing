package com.manufacturing.productdetails;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.Date;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import net.sf.json.JSONArray;

import com.common.ClsCommon;
import com.connection.ClsConnection;
import com.procurement.purchase.goodsreceiptnote.ClsgoodsreceiptnoteBean;

public class ClsMProductDetailsDAO {
	ClsConnection objconn=new ClsConnection();
	ClsCommon objcommon=new ClsCommon();
	public int insert(String productcode, String productname, String psrno,
			String method, String technote, String safetymeasure, String uom,
			String volume, String qualitypercent, String duration,
			String labour, String overhead, String others,
			String hidchkactiveprocess, Date sqldate, String mode,
			HttpSession session, HttpServletRequest request, String brchName,
			String formdetailcode,String hidsectype,String txtkg,String density) throws SQLException{
		Connection conn=null;
		int docno=0;
		try{
			conn=objconn.getMyConnection();
			conn.setAutoCommit(false);
			CallableStatement stmttarif =conn.prepareCall("{call mPrDetailDML(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)}");
			stmttarif.registerOutParameter(17,java.sql.Types.INTEGER);
	        stmttarif.registerOutParameter(18,java.sql.Types.INTEGER);
			stmttarif.setDate(1, sqldate);
	        stmttarif.setString(2, psrno);
	        stmttarif.setString(3, method);
	        stmttarif.setString(4, technote);
	        stmttarif.setString(5, safetymeasure);
	        stmttarif.setString(6, uom);
	        stmttarif.setString(7, volume);
	        stmttarif.setString(8, qualitypercent);
	        stmttarif.setString(9, duration);
	        stmttarif.setString(10, labour);
	        stmttarif.setString(11, overhead);
	        stmttarif.setString(12, others);
	        stmttarif.setString(13, hidchkactiveprocess);
	        stmttarif.setString(14, formdetailcode);
	        stmttarif.setString(15, session.getAttribute("USERID").toString());
	        stmttarif.setString(16, brchName);
	        
	        stmttarif.setString(19,mode);
	        stmttarif.setString(20,hidsectype);
	        stmttarif.setDouble(21,Double.parseDouble(txtkg));
	        stmttarif.setDouble(22,Double.parseDouble(density));
	        stmttarif.executeQuery();
			docno=stmttarif.getInt("docNo");
			int vocno=stmttarif.getInt("vocNo");
			request.setAttribute("VOCNO",vocno);
			if(docno<=0){
				return 0;
			}
			else{
				conn.commit();
				return docno;
			}
		}
		catch(Exception e){
			e.printStackTrace();
		}
		finally{
			conn.close();
		}
		return 0;
	}

	
	public boolean edit(String productcode, String productname, String psrno,
			String method, String technote, String safetymeasure, String uom,
			String volume, String qualitypercent, String duration,
			String labour, String overhead, String others,
			String hidchkactiveprocess, Date sqldate, String mode,
			HttpSession session, HttpServletRequest request, String brchName,
			String formdetailcode,int docno,int vocno,String hidsectype,String txtkg,String density) throws SQLException{
		Connection conn=null;
		try{
			conn=objconn.getMyConnection();
			conn.setAutoCommit(false);
			CallableStatement stmttarif =conn.prepareCall("{call mPrDetailDML(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)}");
			stmttarif.setInt(17,docno);
	        stmttarif.setInt(18,vocno);
			stmttarif.setDate(1, sqldate);
	        stmttarif.setString(2, psrno);
	        stmttarif.setString(3, method);
	        stmttarif.setString(4, technote);
	        stmttarif.setString(5, safetymeasure);
	        stmttarif.setString(6, uom);
	        stmttarif.setString(7, volume);
	        stmttarif.setString(8, qualitypercent);
	        stmttarif.setString(9, duration);
	        stmttarif.setString(10, labour);
	        stmttarif.setString(11, overhead);
	        stmttarif.setString(12, others);
	        stmttarif.setString(13, hidchkactiveprocess);
	        stmttarif.setString(14, formdetailcode);
	        stmttarif.setString(15, session.getAttribute("USERID").toString());
	        stmttarif.setString(16, brchName);
	        
	        stmttarif.setString(19,mode);
	        stmttarif.setString(20,hidsectype);
	        stmttarif.setDouble(21,Double.parseDouble(txtkg));
	        stmttarif.setDouble(22,Double.parseDouble(density));
	        int status=stmttarif.executeUpdate();
			if(status<=0){
				return false;
			}
			else{
				conn.commit();
				return true;
			}
		}
		catch(Exception e){
			e.printStackTrace();
		}
		finally{
			conn.close();
		}
		return false;
	}
	
	public boolean delete(String productcode, String productname, String psrno,
			String method, String technote, String safetymeasure, String uom,
			String volume, String qualitypercent, String duration,
			String labour, String overhead, String others,
			String hidchkactiveprocess, Date sqldate, String mode,
			HttpSession session, HttpServletRequest request, String brchName,
			String formdetailcode,int docno,int vocno,String hidsectype,String txtkg,String density) throws SQLException{
		Connection conn=null;
		try{
			conn=objconn.getMyConnection();
			conn.setAutoCommit(false);
			CallableStatement stmttarif =conn.prepareCall("{call mPrDetailDML(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)}");
			stmttarif.setInt(17,docno);
	        stmttarif.setInt(18,vocno);
			stmttarif.setDate(1, sqldate);
	        stmttarif.setString(2, psrno);
	        stmttarif.setString(3, method);
	        stmttarif.setString(4, technote);
	        stmttarif.setString(5, safetymeasure);
	        stmttarif.setString(6, uom);
	        stmttarif.setString(7, volume);
	        stmttarif.setString(8, qualitypercent);
	        stmttarif.setString(9, duration);
	        stmttarif.setString(10, labour);
	        stmttarif.setString(11, overhead);
	        stmttarif.setString(12, others);
	        stmttarif.setString(13, hidchkactiveprocess);
	        stmttarif.setString(14, formdetailcode);
	        stmttarif.setString(15, session.getAttribute("USERID").toString());
	        stmttarif.setString(16, brchName);
	        
	        stmttarif.setString(19,mode);
	        stmttarif.setString(20,hidsectype);
	        stmttarif.setDouble(21,Double.parseDouble(txtkg));
	        stmttarif.setDouble(22,Double.parseDouble(density));
	        int status=stmttarif.executeUpdate();
			if(status<=0){
				return false;
			}
			else{
				conn.commit();
				return true;
			}
		}
		catch(Exception e){
			e.printStackTrace();
		}
		finally{
			conn.close();
		}
		return false;
	}
	public int insertDetail(int val, ArrayList<String> rawmaterialarray,
			ArrayList<String> packingmaterialarray,
			ArrayList<String> processarray,
			ArrayList<String> qualityassurancearray,
			ArrayList<String> processqaarray) throws SQLException {
		// TODO Auto-generated method stub
		
		Connection conn=null;
		try{
			conn=objconn.getMyConnection();
			conn.setAutoCommit(false);
			Statement stmt=conn.createStatement();
			//System.out.println("==materialarraysize=="+rawmaterialarray.size());
			for(int i=0,j=1;i<rawmaterialarray.size();i++,j++){
				String temp[]=rawmaterialarray.get(i).split("::");
				//System.out.println("==materialarray==="+rawmaterialarray.get(i).split("::"));
				String psrno=temp[0].trim();
				String qty=temp[1].trim();
				String qtykg=temp[8].trim();
				//System.out.println("loopwork=="+i);
				if(i==0) {
					String sqltst="delete from my_prdetailraw where rdocno="+val;
					//System.out.println("==deletesql=="+sqltst);
					int insertvaluenw=stmt.executeUpdate(sqltst);
				}
				if(qty.equalsIgnoreCase("") || qty==null || qty.equalsIgnoreCase("undefined") || qty.equalsIgnoreCase("null")){
					qty="0";
				}
				if(qtykg.equalsIgnoreCase("") || qtykg==null || qtykg.equalsIgnoreCase("undefined") || qtykg.equalsIgnoreCase("null")){
					qtykg="0";
				}
				String uomid=temp[2].trim();
				String std=temp[3].trim();
				if(std.equalsIgnoreCase("") || std==null || std.equalsIgnoreCase("undefined") || std.equalsIgnoreCase("null")){
					std="0";
				}
				String processid=temp[4].trim();
				if(processid.equalsIgnoreCase("") || processid==null || processid.equalsIgnoreCase("undefined") || processid.equalsIgnoreCase("null")){
					processid="0";
				}
				String note=""+(temp[5].trim().equalsIgnoreCase("undefined") || temp[5].trim().equalsIgnoreCase("NaN")|| temp[5].trim().equalsIgnoreCase("")|| temp[5].isEmpty()?"":temp[5].trim())+"";
				String rowno=temp[6].trim();
				String density=""+(temp[7].trim().equalsIgnoreCase("undefined") || temp[7].trim().equalsIgnoreCase("NaN")|| temp[7].trim().equalsIgnoreCase("")|| temp[7].isEmpty()?"":temp[7].trim())+"";
				String strsql="";
				/*if(!rowno.equalsIgnoreCase("") && rowno!=null && !rowno.equalsIgnoreCase("null") && !rowno.equalsIgnoreCase("undefined")){
					strsql="update my_prdetailraw set rdocno='"+val+"',srno='"+j+"',psrno='"+psrno+"',quantity='"+qty+"',uom='"+uomid+"',stdper='"+std+"',processid='"+processid+"',notes='"+note+"' where rowno='"+rowno+"'";
				}
				else{
					strsql="insert into my_prdetailraw(rdocno, srno, psrno, quantity, uom, stdper, processid, notes)values("+val+","+j+",'"+psrno+"','"+qty+"','"+uomid+"','"+std+"','"+processid+"','"+note+"')";
				}*/
				if(!psrno.equalsIgnoreCase("") && psrno!=null && !psrno.equalsIgnoreCase("null") && !psrno.equalsIgnoreCase("undefined")){
				strsql="insert into my_prdetailraw(rdocno, srno, psrno, quantity, uom, stdper, processid, notes,density,qtykg)values("+val+","+j+",'"+psrno+"','"+qty+"','"+uomid+"','"+std+"','"+processid+"','"+note+"','"+density+"','"+qtykg+"')";
				
				}
			//	System.out.println("==insertsql=="+strsql);
				int insertvalue=stmt.executeUpdate(strsql);
				//int insertvalue=0;
				if(insertvalue<0){
					return 0;
				}
			}
			
			for(int i=0,j=1;i<packingmaterialarray.size();i++,j++){
				String temp[]=packingmaterialarray.get(i).split("::");
				String psrno=temp[0].trim();
				String packsize=temp[1].trim();
				String uomid=temp[2].trim();
				String rowno=temp[3].trim();
				String strsql="";
				if(i==0) {
					String sqltst="delete from my_prdetailpack where rdocno="+val;
					//System.out.println("==deletesql=="+sqltst);
					int insertvaluenw=stmt.executeUpdate(sqltst);
				}
				/*if(!rowno.equalsIgnoreCase("") && rowno!=null && !rowno.equalsIgnoreCase("null") && !rowno.equalsIgnoreCase("undefined")){
					strsql="update my_prdetailpack set rdocno='"+val+"',srno='"+j+"',psrno='"+psrno+"',packsize='"+packsize+"',uom='"+uomid+"' where rowno='"+rowno+"'";
				}
				else{
					strsql="insert into my_prdetailpack(rdocno, srno, psrno, packsize, uom)values("+val+","+j+",'"+psrno+"','"+packsize+"','"+uomid+"')";
				}*/
				if(!psrno.equalsIgnoreCase("") && psrno!=null && !psrno.equalsIgnoreCase("null") && !psrno.equalsIgnoreCase("undefined")){
					strsql="insert into my_prdetailpack(rdocno, srno, psrno, packsize, uom)values("+val+","+j+",'"+psrno+"','"+packsize+"','"+uomid+"')";
				}
				int insertvalue=stmt.executeUpdate(strsql);
				if(insertvalue<0){
					return 0;
				}
			}
			System.out.println("==my_prdetailprocess=="+processarray.size());
			for(int i=0,j=1;i<processarray.size();i++,j++){
				String temp[]=processarray.get(i).split("::");
				String processid=temp[0].trim();
				String machineid=temp[1].trim();
				String rowno=temp[2].trim();
				String strsql="";
				if(i==0) {
					String sqltst="delete from my_prdetailprocess where rdocno="+val;
					System.out.println("==deletesqlfdg=="+sqltst);
					int insertvaluenw=stmt.executeUpdate(sqltst);
				}
				/*if(!rowno.equalsIgnoreCase("") && rowno!=null && !rowno.equalsIgnoreCase("null") && !rowno.equalsIgnoreCase("undefined")){
					strsql="update my_prdetailprocess set rdocno='"+val+"',srno='"+j+"',processid='"+processid+"',machineid='"+machineid+"' where rowno='"+rowno+"'";
				}
				else{
					strsql="insert into my_prdetailprocess(rdocno, srno, processid, machineid)values("+val+","+j+",'"+processid+"','"+machineid+"')";
				}*/
				
				if(!processid.equalsIgnoreCase("") && processid!=null && !processid.equalsIgnoreCase("null") && !processid.equalsIgnoreCase("undefined")){
					
					strsql="insert into my_prdetailprocess(rdocno, srno, processid, machineid)values("+val+","+j+",'"+processid+"','"+machineid+"')";
				}
				System.out.println("==insertsql=="+strsql);
				int insertvalue=stmt.executeUpdate(strsql);
				if(insertvalue<0){
					return 0;
				}
			}
			System.out.println("==my_prdetailquality=="+qualityassurancearray.size());
			for(int i=0,j=1;i<qualityassurancearray.size();i++,j++){
				String temp[]=qualityassurancearray.get(i).split("::");
				String testid=temp[0].trim();
				String testmethod=temp[1].trim();
				String limit=temp[2].trim();
				String rowno=temp[3].trim();
				String strsql="";
				
				if(i==0) {
					String sqltst="delete from my_prdetailquality where rdocno="+val;
					System.out.println("==deletesqlfdg=="+sqltst);
					int insertvaluenw=stmt.executeUpdate(sqltst);
				}
				
				/*if(!rowno.equalsIgnoreCase("") && rowno!=null && !rowno.equalsIgnoreCase("null") && !rowno.equalsIgnoreCase("undefined")){
					strsql="update my_prdetailquality set rdocno='"+val+"',srno='"+j+"',testid='"+testid+"',testmethod='"+testmethod+"',`limit`='"+limit+"' where rowno='"+rowno+"'";
				}
				else{
					strsql="insert into my_prdetailquality(rdocno, srno, testid, testmethod, `limit`)values("+val+","+j+",'"+testid+"','"+testmethod+"','"+limit+"')";
				}*/
				
				if(!testid.equalsIgnoreCase("") && testid!=null && !testid.equalsIgnoreCase("null") && !testid.equalsIgnoreCase("undefined")){
					
					strsql="insert into my_prdetailquality(rdocno, srno, testid, testmethod, `limit`)values("+val+","+j+",'"+testid+"','"+testmethod+"','"+limit+"')";
				}
				
				System.out.println(strsql);
				int insertvalue=stmt.executeUpdate(strsql);
				if(insertvalue<0){
					return 0;
				}
			}
			
			for(int i=0,j=1;i<processqaarray.size();i++,j++){
				String temp[]=processqaarray.get(i).split("::");
				String processid=temp[0].trim();
				String testid=temp[1].trim();
				String testmethod=temp[2].trim();
				String limit=temp[3].trim();
				String rowno=temp[4].trim();
				String strsql="";
				if(i==0) {
					String sqltst="delete from my_prdetailqaprocess where rdocno="+val;
					System.out.println("==deletesqlfdg=="+sqltst);
					int insertvaluenw=stmt.executeUpdate(sqltst);
				}
				/*if(!rowno.equalsIgnoreCase("") && rowno!=null && !rowno.equalsIgnoreCase("null") && !rowno.equalsIgnoreCase("undefined")){
					strsql="update my_prdetailqaprocess set rdocno='"+val+"',srno='"+j+"',processid='"+processid+"',testid='"+testid+"',testmthod='"+testmethod+"',`limit`='"+limit+"' where rowno='"+rowno+"'";
				}
				else{
					strsql="insert into my_prdetailqaprocess(rdocno, srno, processid, testid, testmethod, `limit`)values("+val+","+j+",'"+processid+"','"+testid+"','"+testmethod+"','"+limit+"')";
				}*/
				if(!processid.equalsIgnoreCase("") && processid!=null && !processid.equalsIgnoreCase("null") && !processid.equalsIgnoreCase("undefined")){
					strsql="insert into my_prdetailqaprocess(rdocno, srno, processid, testid, testmethod, `limit`)values("+val+","+j+",'"+processid+"','"+testid+"','"+testmethod+"','"+limit+"')";
				}
				int insertvalue=stmt.executeUpdate(strsql);
				if(insertvalue<0){
					return 0;
				}
			}
			conn.commit();
			return val;
		}
		catch(Exception e){
			e.printStackTrace();
		}
		finally{
			conn.close();
		}
		return 0;
	}

	public     ClsMProductDetailsBean   getViewDetails(int masterdoc_no) throws SQLException {
		
		ClsMProductDetailsBean showBean = new ClsMProductDetailsBean();
		Connection conn=null;
		try { conn=objconn.getMyConnection();
		
	        int cosrcodemethod=0;			
			
			String sq1="";
			String jsq1="";
	
			
			
		
		Statement stmt  = conn.createStatement ();
		
		String sqls="select p.name mtype,m.kilogram,m.density,m.sectype,m.doc_no,m.voc_no,m.date,m.psrno,prd.part_no productcode,prd.productname,m.method, m.technote, m.sftmesure safetymeasure, m.uom uomid,u.unit uom, m.volume, m.qualityper, m.durhrs, m.activeprocess, m.labour, m.overhead, m.others from my_prdetail m "
				+ "left join my_main prd on m.psrno=prd.psrno left join my_unitm u on m.uom=u.doc_no left join my_prodtype p on p.doc_no=prd.prdtype where m.status=3 and m.doc_no="+masterdoc_no+"";
		System.out.println("viewdetails===="+sqls);
		
		
		ResultSet resultSet = stmt.executeQuery(sqls);    
		String dtype="0";
		String reqdoc="0";
		while (resultSet.next()) {
			showBean.setTypename(resultSet.getString("mtype"));
			showBean.setDocno(resultSet.getInt("doc_no"));
			showBean.setVocno(resultSet.getInt("voc_no"));
			showBean.setDate(resultSet.getString("date"));
			showBean.setProductcode(resultSet.getString("productcode"));
			
		
			showBean.setPsrno(resultSet.getString("psrno"));
			showBean.setProductname(resultSet.getString("productname"));
			showBean.setMethod(resultSet.getString("method"));
			showBean.setTechnote(resultSet.getString("technote"));
			showBean.setSafetymeasure(resultSet.getString("safetymeasure"));
			
			showBean.setUomid(resultSet.getString("uomid"));
			showBean.setUom(resultSet.getString("uom"));
			showBean.setVolume(resultSet.getString("volume"));
			
			showBean.setQualitypercent(resultSet.getString("qualityper"));
			
			showBean.setDuration(resultSet.getString("durhrs"));
		//	showBean.setReqmasterdocno(resultSet.getString("rrefno"));
			
			//dtype=resultSet.getString("rdtype");
			//reqdoc=resultSet.getString("rrefno");
			
			showBean.setLabour(resultSet.getString("labour"));
			showBean.setOverhead(resultSet.getString("overhead"));
			showBean.setOthers(resultSet.getString("others"));
			showBean.setHidchkactiveprocess(resultSet.getString("activeprocess"));
			showBean.setHidsectype(resultSet.getString("sectype"));
			
			showBean.setTxtkg(resultSet.getString("kilogram")); 
			showBean.setDensity(resultSet.getString("density")); 
		}
		
		
		
		
		
		
		
		stmt.close();
		conn.close();
		}
		catch(Exception e){
			
		e.printStackTrace();
		conn.close();
		}
		return showBean;
	}
	
	
	public JSONArray getProcessSearch(String id) throws SQLException{
		JSONArray data=new JSONArray();
		if(!id.equalsIgnoreCase("1")){
			return data;
		}
		Connection conn=null;
		try{
			conn=objconn.getMyConnection();
			Statement stmt=conn.createStatement();
			String strsql="select doc_no,name,description from my_prprocessm where status=3";
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
	
	public JSONArray getTestSearch(String id) throws SQLException{
		JSONArray data=new JSONArray();
		if(!id.equalsIgnoreCase("1")){
			return data;
		}
		Connection conn=null;
		try{
			conn=objconn.getMyConnection();
			Statement stmt=conn.createStatement();
			String strsql="select doc_no,test name,description from my_prtest where status=3";
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
	
	public JSONArray getMachineSearch(String id) throws SQLException{
		JSONArray data=new JSONArray();
		if(!id.equalsIgnoreCase("1")){
			return data;
		}
		Connection conn=null;
		try{
			conn=objconn.getMyConnection();
			Statement stmt=conn.createStatement();
			String strsql="select doc_no,name,description from my_prmachinery where status=3;";
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
	
	
	public JSONArray getMasterSearch(String searchdocno,String searchdate,String searchproductcode,String searchproductname,String id) throws SQLException{
		JSONArray data=new JSONArray();
		System.out.println("id====="+id);
		if(!id.equalsIgnoreCase("1")){
			return data;
		}
		Connection conn=null;
		try{
			conn=objconn.getMyConnection();
			Statement stmt=conn.createStatement();
			String sqltest="";
			if(!searchdocno.trim().equalsIgnoreCase("")){
				sqltest+=" and m.voc_no='"+searchdocno+"'";
			}
			if(!searchdate.trim().equalsIgnoreCase("") && searchdate!=null && !searchdate.equalsIgnoreCase("null")){
				java.sql.Date sqldate=objcommon.changeStringtoSqlDate(searchdate);
				sqltest+=" and m.date='"+sqldate+"'";
			}
			if(!searchproductcode.equalsIgnoreCase("")){
				sqltest+=" and prd.part_no like '"+searchproductcode+"'";
			}
			if(!searchproductname.equalsIgnoreCase("")){
				sqltest+=" and prd.productname like '"+searchproductname+"'";
			}
			String strsql="select m.sectype,m.doc_no,m.voc_no,m.date,m.psrno,prd.part_no productcode,prd.productname,m.method, m.technote, m.sftmesure safetymeasure, m.uom uomid,u.unit uom, m.volume, m.qualityper, m.durhrs, m.activeprocess, m.labour, m.overhead, m.others from my_prdetail m left join "+
			" my_main prd on m.psrno=prd.psrno left join my_unitm u on m.uom=u.doc_no where m.status=3"+sqltest;
			System.out.println("mainsearch=="+strsql);
			ResultSet rs=stmt.executeQuery(strsql);
			data=objcommon.convertToJSON(rs);
			System.out.println(data);
		}
		catch(Exception e){
			e.printStackTrace();
		}
		finally{
			conn.close();
		}
		return data;
	}
	
	public JSONArray getPRDetailRaw(String docno,String id) throws SQLException{
		JSONArray data=new JSONArray();
		if(!id.equalsIgnoreCase("1")){
			return data;
		}
		Connection conn=null;
		try{
			conn=objconn.getMyConnection();
			Statement stmt=conn.createStatement();
			String strsql="select m1.qtykg,m1.density,m1.rowno,m1.rdocno,m1.srno,m1.psrno,m1.quantity qtyltr,prd.part_no rmid,prd.productname 'desc',u.unit uom,u.doc_no "+
			" uomid,pr.name prcs,pr.doc_no processid,m1.stdper 'std',m1.notes note from my_prdetail m left join my_prdetailraw m1 on "+
			" m.doc_no=m1.rdocno left join my_main prd on m1.psrno=prd.psrno left join my_prprocessm pr on m1.processid=pr.doc_no  left join my_unitm "+
			" u on m1.uom=u.doc_no where m.status=3 and m.doc_no="+docno;
			System.out.println("prdrawdetail==="+strsql);
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
	
	public JSONArray unitSearch(HttpSession session) throws SQLException {


		JSONArray RESULTDATA=new JSONArray();

		Connection conn = null;

		try {
			conn = objconn.getMyConnection();
			Statement stmt = conn.createStatement();
int method=0;
			String sqlss="select method from GL_PRDCONFIG where field_nme='multiqty' ";
			ResultSet rss=stmt.executeQuery(sqlss);
			if(rss.next())
			{
				method=rss.getInt("method");
			}
			
			String sql="select "+method+" method, doc_no,unit,unit_desc from my_unitm where status=3";

			ResultSet resultSet = stmt.executeQuery(sql);
			RESULTDATA=objcommon.convertToJSON(resultSet);


		}catch(Exception e){
			e.printStackTrace();

		}finally{
			conn.close();
		}
		return RESULTDATA;
	}
	
	public JSONArray getPRPackdata(String docno,String id) throws SQLException{
		JSONArray data=new JSONArray();
		if(!id.equalsIgnoreCase("1")){
			return data;
		}
		Connection conn=null;
		try{
			conn=objconn.getMyConnection();
			Statement stmt=conn.createStatement();
			String strsql="select m1.rowno,m1.rdocno,m1.srno,m1.psrno,prd.part_no pid,prd.productname 'pdesc',m1.packsize psize,u.unit uom,u.doc_no "+
			" uomid from my_prdetail m left join my_prdetailpack m1 on m.doc_no=m1.rdocno left join my_main prd on m1.psrno=prd.psrno"+
			" left join my_unitm u on m1.uom=u.doc_no where m.status=3 and m.doc_no="+docno;
			System.out.println("packdetailfghf======"+strsql);
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
	
	public JSONArray getProcessData(String docno,String id) throws SQLException{
		JSONArray data=new JSONArray();
		if(!id.equalsIgnoreCase("1")){
			return data;
		}
		Connection conn=null;
		try{
			conn=objconn.getMyConnection();
			Statement stmt=conn.createStatement();
			String strsql="select m1.rowno,m1.rdocno,m1.srno,pr.name prcsid,pr.doc_no processid,pr.description 'desc',u.name mtype,u.doc_no machineid "+
			" from my_prdetail m left join my_prdetailprocess m1 on m.doc_no=m1.rdocno left join my_prprocessm pr on m1.processid=pr.doc_no"+
			" left join my_prmachinery u on m1.machineid=u.doc_no where m.status=3 and m.doc_no="+docno;
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
	
	public JSONArray qualityData(String docno,String id) throws SQLException{
		JSONArray data=new JSONArray();
		if(!id.equalsIgnoreCase("1")){
			return data;
		}
		Connection conn=null;
		try{
			conn=objconn.getMyConnection();
			Statement stmt=conn.createStatement();
			String strsql="select m1.rowno,m1.rdocno,m1.srno,pr.test tstid,pr.description 'desc',pr.doc_no testid,m1.testmethod tstmthd,m1.limit "+
			" from my_prdetail m left join my_prdetailquality m1 on m.doc_no=m1.rdocno left join my_prtest pr on m1.testid=pr.doc_no"+
			" where m.status=3 and m.doc_no="+docno;
		System.out.println("==qualityData==="+strsql);
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
	
	public JSONArray getProcessQAData(String docno,String id) throws SQLException{
		JSONArray data=new JSONArray();
		if(!id.equalsIgnoreCase("1")){
			return data;
		}
		Connection conn=null;
		try{
			conn=objconn.getMyConnection();
			Statement stmt=conn.createStatement();
			String strsql="select m1.rowno,m1.rdocno,m1.srno,pr.name prid,pr.doc_no processid,pr.description 'desc',t.test tstid,t.doc_no testid,"+
			" t.description desc1,m1.testmethod,m1.limit from my_prdetail m left join my_prdetailqaprocess"+
			" m1 on m.doc_no=m1.rdocno left join my_prprocessm pr on m1.processid=pr.doc_no left join my_prtest t on m1.testid=t.doc_no"+
			" where m.status=3 and m.doc_no="+docno;
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
