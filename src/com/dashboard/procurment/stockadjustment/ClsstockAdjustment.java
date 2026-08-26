package com.dashboard.procurment.stockadjustment;

	import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

	import net.sf.json.JSONArray;

	import com.common.ClsCommon;
import com.connection.ClsConnection;

	public class ClsstockAdjustment  { 
		ClsConnection ClsConnection=new ClsConnection();

		ClsCommon ClsCommon=new ClsCommon();

		public JSONArray gridDataLoad(String psrno,String load) throws SQLException {
			   JSONArray RESULTDATA=new JSONArray();
			   
			   if(!(load.equalsIgnoreCase("load")))
					   {
				   return RESULTDATA;
					   }
			   
			         Connection conn = null;
			         
			  try {
			   conn = ClsConnection.getMyConnection();
			   Statement stmtCRM = conn.createStatement();
	 
			   
			         
			         String sql="select pin.stockid,pin.date,m.part_no productid,m.ProductName ,pin.dtype,op_qty-(out_qty+del_qty+rsv_qty) stockqty,batch_no,exp_date,op_qty-(out_qty+del_qty+rsv_qty) aqty "
			         		+ " from my_prddin pin inner join my_main m on pin.psrno=m.psrno  where m.status=3 and (op_qty-(out_qty+del_qty+rsv_qty))>0 and m.psrno='"+psrno+"'  group by stockid ";
			         
			         
			        
			    System.out.println("--enqrysql--"+sql);
			         ResultSet resultSet = stmtCRM.executeQuery (sql);
			    RESULTDATA=ClsCommon.convertToJSON(resultSet);
			    stmtCRM.close();
			    conn.close();
			      
			  }catch(Exception e){
			   e.printStackTrace();
			   conn.close();
			  }finally{
			   conn.close();
			  }
			        return RESULTDATA;
			    }
		
		
		
		public JSONArray assetdetails(String pid,String load,String name) throws SQLException {

	        JSONArray RESULTDATA=new JSONArray();
	        
	        System.out.println("asddddddddddddddddddddddddd");
	        System.out.println("load"+load);
	        
	        if(!load.equalsIgnoreCase("yes"))
	        {
	        	return RESULTDATA;
	        }
	        
	        
	        
	        Connection conn =null;
	        try {
	        	conn = ClsConnection.getMyConnection();
	        	Statement stmtBFAR = conn.createStatement();
	        	
	            String sqltest="";
 
	        	 
	        	if((!(pid.equalsIgnoreCase("NA")) )&&(!(pid.equalsIgnoreCase(""))) &&(!(pid.equalsIgnoreCase("0"))) ){
	        		sqltest+=" and m.part_no like '%"+pid+"%' ";
	     		}
	        	
	          	 
	        	if((!(name.equalsIgnoreCase("NA")) )&&(!(name.equalsIgnoreCase(""))) &&(!(name.equalsIgnoreCase("0"))) ){
	        		sqltest+=" and m.productname like '%"+name+"%' ";
	     		}
	        	
	        	
	   
	            String sql="select m.psrno,m.part_no productid,m.ProductName name  from my_prddin pin "
	            		+ "  left join my_main m on pin.psrno=m.psrno  where m.status=3 and (op_qty-(out_qty+del_qty+rsv_qty))>0  "+sqltest+"  group by m.psrno";
	            
	            System.out.println("==="+sql);
	            
	            ResultSet resultSet = stmtBFAR.executeQuery(sql);
	            
	           RESULTDATA=ClsCommon.convertToJSON(resultSet);
	           
	           stmtBFAR.close();
	           conn.close();
	       
	           }catch(Exception e){
	        	   e.printStackTrace();
	        	   conn.close();
	           }finally{
	   			conn.close();
	   		}
	        return RESULTDATA;
	    }
		
		
}

