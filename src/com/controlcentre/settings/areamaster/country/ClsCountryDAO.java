package com.controlcentre.settings.areamaster.country;

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
import net.sf.json.JSONObject;

import com.common.ClsCommon;
import com.connection.ClsConnection;

public class ClsCountryDAO {
	ClsConnection ClsConnection=new ClsConnection();
	ClsCommon ClsCommon=new ClsCommon();
	
	
	ClsCountryBean countryBean = new ClsCountryBean();
	
	public int insert(ClsCountryBean bean,HttpSession session) throws SQLException{
		int aaa;
		Connection conn=null;
		try{
			  conn=ClsConnection.getMyConnection();
			CallableStatement stmtcountry = conn.prepareCall("{CALL ECountryDML(?,?,?,?,?,?,?,?)}");
			
			
			System.out.println("ECountryDML(@docno,'"+bean.getCountry().toUpperCase()+"','"+bean.getContry_code().toUpperCase()+"',"+Integer.parseInt(bean.getRegion())+",'"+(Date) bean.getDate_coun()+"','"+session.getAttribute("BRANCHID").toString()+"','"+session.getAttribute("USERID").toString()+"','"+bean.getMode()+"')");
			
			stmtcountry.registerOutParameter(7,java.sql.Types.INTEGER);
			stmtcountry.setString(1,bean.getCountry().toUpperCase());	
			stmtcountry.setString(2,bean.getContry_code().toUpperCase());
			stmtcountry.setInt(3,Integer.parseInt(bean.getRegion()));
			stmtcountry.setDate(4,(Date) bean.getDate_coun());
			stmtcountry.setString(5,session.getAttribute("BRANCHID").toString());
			stmtcountry.setString(6,session.getAttribute("USERID").toString());
			stmtcountry.setString(8,bean.getMode());
			
			System.out.println("test for CallableStatement "+stmtcountry);
			int val = stmtcountry.executeUpdate();
			aaa=stmtcountry.getInt("docNo");
			
			System.out.println(aaa);
			countryBean.setDocno(aaa);
			stmtcountry.close();
			conn.close();
			return aaa;
			
		}catch(Exception e){	
			
			e.printStackTrace();	
			 
		}
		finally{
			conn.close();
		}
		return 0;
	}
	
	public boolean edit(ClsCountryBean bean,HttpSession session) throws SQLException{
		Connection conn=null;
		try{
			  conn=ClsConnection.getMyConnection();
			int aaa;
			CallableStatement stmtcountry = conn.prepareCall("{CALL ECountryDML(?,?,?,?,?,?,?,?)}");
			
			stmtcountry.setString(1,bean.getCountry().toUpperCase());	
			stmtcountry.setString(2,bean.getContry_code().toUpperCase());
			stmtcountry.setInt(3,Integer.parseInt(bean.getRegion()));
			stmtcountry.setDate(4,(Date) bean.getDate_coun());
			stmtcountry.setString(5,session.getAttribute("BRANCHID").toString());
			stmtcountry.setString(6,session.getAttribute("USERID").toString());
			stmtcountry.setInt(7,bean.getDocno());
			stmtcountry.setString(8,bean.getMode());
			stmtcountry.executeUpdate();
			
			System.out.println("test for CallableStatement edit "+stmtcountry);
			aaa=stmtcountry.getInt("docNo");
			System.out.println(aaa);
			countryBean.setDocno(aaa);
			stmtcountry.close();
			conn.close();
			
			if (aaa > 0) {
				System.out.println("Sucess");
				return true;
			}
		}catch(Exception e){	
			e.printStackTrace();
		}
		finally{
			conn.close();
		}
		return false;
	}
	
	public boolean delete(ClsCountryBean bean,HttpSession session) throws SQLException {
		Connection conn=null;
		try{
			  conn=ClsConnection.getMyConnection();
			int aaa;
			CallableStatement stmtcountry = conn.prepareCall("{CALL ECountryDML(?,?,?,?,?,?,?,?)}");
			stmtcountry.setString(1,null);	
			stmtcountry.setString(2,null);
			stmtcountry.setInt(3,0);
			stmtcountry.setDate(4,null);
			stmtcountry.setString(5,session.getAttribute("BRANCHID").toString());
			stmtcountry.setString(6,session.getAttribute("USERID").toString());
			stmtcountry.setInt(7,bean.getDocno());
			stmtcountry.setString(8,bean.getMode());
			stmtcountry.executeUpdate();
			
			aaa=stmtcountry.getInt("docNo");
			countryBean.setDocno(aaa);
			stmtcountry.close();
			conn.close();
			if (aaa > 0) {
				System.out.println("Sucess");
				return true;
			}	
			
		 }catch(Exception e){
			 e.printStackTrace();
			}
			finally{
				conn.close();
			}
		return false;
	 }
	
	 public   JSONArray searchDetails() throws SQLException {
		 JSONArray RESULTDATA = new JSONArray();
	        List<ClsCountryBean> listBean = new ArrayList<ClsCountryBean>();
	        Connection conn=null;
			try{
				  conn=ClsConnection.getMyConnection();
				 
					  
				Statement stmtCountry =conn.createStatement();            	
					ResultSet resultSet = stmtCountry.executeQuery ("select m.country_name,m.country_code,m.reg_id,m.doc_no,m.DATE,d.reg_name region from my_acountry m left join my_aregion d  on m.reg_id=d.doc_no where m.status<>7");
					RESULTDATA=ClsCommon.convertToJSON(resultSet);
				//	System.out.println("---------------  "+RESULTDATA);
					/*while (resultSet.next()) {
						
						ClsCountryBean bean = new ClsCountryBean();
		            	bean.setDocno(resultSet.getInt("doc_no"));
						bean.setRegion(resultSet.getString("region"));
						bean.setDate_coun(resultSet.getDate("DATE"));
						bean.setCountry(resultSet.getString("country_name"));
						bean.setContry_code(resultSet.getString("country_code"));
						bean.setReg_id(resultSet.getInt("reg_id"));
		            	listBean.add(bean);
		            	System.out.println("---------------  "+bean);
		            	System.out.println("---------------  "+listBean);
					}*/
			}
			catch(Exception e){
				e.printStackTrace();
			}
			finally{
				conn.close();
			}
//	//System.out.println("nitin===="+listBean);
	        return RESULTDATA;
	    }

}
