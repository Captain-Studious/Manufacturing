package com.controlcentre.settings.activity;

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


public class ClsActivityDAO {
	ClsConnection ClsConnection=new ClsConnection();
	ClsCommon ClsCommon=new ClsCommon();
	
	
	ClsActivityBean activityBean=new ClsActivityBean();
	public int insert(ClsActivityBean bean,HttpSession session) throws SQLException{
		int aaa;
		Connection conn= null;
		try{
			
			  conn=ClsConnection.getMyConnection();
			CallableStatement stmtactivity = conn.prepareCall("{CALL EActivityDML(?,?,?,?,?,?,?)}");
			stmtactivity.registerOutParameter(6,java.sql.Types.INTEGER);
			stmtactivity.setString(1,bean.getActivity().toUpperCase());	
			stmtactivity.setString(2,bean.getActivity_code().toUpperCase());
			stmtactivity.setDate(3,(Date) bean.getDate_acti());
			stmtactivity.setString(4,session.getAttribute("BRANCHID").toString());
			stmtactivity.setString(5,session.getAttribute("USERID").toString());
			stmtactivity.setString(7,bean.getMode());
			
			int val = stmtactivity.executeUpdate();
			aaa=stmtactivity.getInt("docNo");
			
			System.out.println(aaa);
			activityBean.setDocno(aaa);
			stmtactivity.close();
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
	
	public boolean edit(ClsActivityBean bean,HttpSession session) throws SQLException{
		Connection conn= null;
		try{
			
			  conn=ClsConnection.getMyConnection();
			int aaa;
			CallableStatement stmtactivity = conn.prepareCall("{CALL EActivityDML(?,?,?,?,?,?,?)}");
			stmtactivity.setString(1,bean.getActivity());	
			stmtactivity.setString(2,bean.getActivity_code());
			stmtactivity.setDate(3,(Date) bean.getDate_acti());
			stmtactivity.setString(4,session.getAttribute("BRANCHID").toString());
			stmtactivity.setString(5,session.getAttribute("USERID").toString());
			stmtactivity.setInt(6,bean.getDocno());
			stmtactivity.setString(7,bean.getMode());
			stmtactivity.executeUpdate();
			System.out.println("test for CallableStatement edit "+stmtactivity);
			aaa=stmtactivity.getInt("docNo");
			System.out.println(aaa);
			activityBean.setDocno(aaa);
			stmtactivity.close();
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
	
	public boolean delete(ClsActivityBean bean,HttpSession session) throws SQLException {
		Connection conn= null;
		try{
			
			  conn=ClsConnection.getMyConnection();
			int aaa;
			CallableStatement stmtactivity = conn.prepareCall("{CALL EActivityDML(?,?,?,?,?,?,?)}");
			stmtactivity.setString(1,bean.getActivity());	
			stmtactivity.setString(2,bean.getActivity_code());
			stmtactivity.setDate(3,(Date) bean.getDate_acti());
			stmtactivity.setString(4,session.getAttribute("BRANCHID").toString());
			stmtactivity.setString(5,session.getAttribute("USERID").toString());
			stmtactivity.setInt(6,bean.getDocno());
			stmtactivity.setString(7,bean.getMode());
			stmtactivity.executeUpdate();
			System.out.println("test for CallableStatement edit "+stmtactivity);
			aaa=stmtactivity.getInt("docNo");
			System.out.println(aaa);
			activityBean.setDocno(aaa);
			stmtactivity.close();
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
	        List<ClsActivityBean> listBean = new ArrayList<ClsActivityBean>();
			Connection conn= null;
			try{
				
				  conn=ClsConnection.getMyConnection();
				Statement stmtactivity =conn.createStatement();            	
					ResultSet resultSet = stmtactivity.executeQuery ("select ay_name,ay_code,date,doc_no from my_activity where status<>7");
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
