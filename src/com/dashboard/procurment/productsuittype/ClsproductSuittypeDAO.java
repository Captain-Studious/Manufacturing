package com.dashboard.procurment.productsuittype;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import net.sf.json.JSONArray;

import com.common.ClsCommon;
import com.connection.ClsConnection;

public class ClsproductSuittypeDAO {

	ClsConnection ClsConnection=new ClsConnection();
	ClsCommon ClsCommon=new ClsCommon();
	
	
	public   JSONArray listgridsearch() throws SQLException {

        JSONArray RESULTDATA=new JSONArray();
        
   
    	
     	Connection conn = null;
        
		try {
				 conn = ClsConnection.getMyConnection();
				Statement stmtVeh = conn.createStatement (); 
			     
 				String sql="select count(mtypeid) counts ,pt.doc_no, pt.mastertype, pt.mtype from my_main m "
 						+ " left join my_prodmastertype pt on pt.doc_no=m.mtypeid where m.status=3 group by m.mtypeid order by  doc_no ";
				
            	 
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
	
	
	
	public JSONArray mainlistSearch(HttpSession session,String load,String docno) throws SQLException {


 	
	 
 
		
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
			 

				String sql = " select   m.doc_no,m.part_no product,m.productname pdesc,pt.producttype as type "
						+ " ,convert(if(m.fixingprice=0,'',m.fixingprice),char(100)) fixingprice, "
						+ "  convert(if(m.lbrchg=0,'',m.lbrchg),char(100)) lbrchg,convert(if(m.clrprice=0,'',m.clrprice),char(100)) clrprice, "
						+ "  convert(if(m.stdprice=0,'',m.stdprice),char(100)) stdprice, b.brand as brand,c.category "
						+ "  as cat,sc.subcategory as scat,dep.department as dept  from my_main m "
						+ "   left join my_ptype pt on(m.typeid=pt.doc_no) left join my_brand b on(m.brandid=b.doc_no) "
						+ " left join my_dept dep on(dep.doc_no=m.deptid) left join my_catm c on(m.catid=c.doc_no) "
						+ " left join my_scatm sc on(m.scatid=sc.doc_no) where m.status=3 and m.mtypeid='"+docno+"'  group by m.doc_no ";

		 //	System.out.println("==sql=type2==="+sql);

				ResultSet resultSet = stmt.executeQuery(sql);
				RESULTDATA=ClsCommon.convertToJSON(resultSet);
			 
			

		


		}catch(Exception e){
			e.printStackTrace();

		}finally{
			conn.close();
		}
		return RESULTDATA;
	}



	public int insert(ArrayList<String> descarray, int cmbmastertype) throws SQLException {

		Connection conn = null;

		try {
		 
			
			conn = ClsConnection.getMyConnection();
			conn.setAutoCommit(false);
			Statement stmt = conn.createStatement();
			 
			int i=0;
			for (i=0;i<descarray.size();i++)
			{
				 String[] pmgntarr=descarray.get(i).split("::");
				 if(!(pmgntarr[0].trim().equalsIgnoreCase("undefined")|| pmgntarr[0].trim().equalsIgnoreCase("NaN")||pmgntarr[0].trim().equalsIgnoreCase("")|| pmgntarr[0].isEmpty()))
			     {
					 String pdocno=""+(pmgntarr[0].trim().equalsIgnoreCase("undefined") || pmgntarr[0].trim().equalsIgnoreCase("NaN")|| pmgntarr[0].trim().equalsIgnoreCase("")|| pmgntarr[0].isEmpty()?0:pmgntarr[0].trim())+"";
						
					 
					//	System.out.println("pdocno=="+pdocno);
					 
						
							
						  String updatesqls1=" update my_main set mtypeid="+cmbmastertype+" where psrno="+pdocno+" ";
							
					 
							 stmt.executeUpdate(updatesqls1); 
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
