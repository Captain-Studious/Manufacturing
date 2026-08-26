package com.dashboard.pricemanagement.discountDetail;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import com.common.ClsCommon;
import com.connection.ClsConnection;

import net.sf.json.JSONArray;

public class ClsDiscountDetailDAO 
{
	
	ClsConnection ClsConnection=new ClsConnection();
	ClsCommon ClsCommon=new ClsCommon();
	
	public   JSONArray discountDetailgridsearch(String branch,String type,String brandid,String catid,String subcatid,String psrno,String types) throws SQLException {

        JSONArray RESULTDATA=new JSONArray();
        
   
        
      if(!(types.equalsIgnoreCase("yes")))
      {
    	  return  RESULTDATA;
      }
        
    	
     	
		     	
		     	 String sqltest="";
		         String wheresql="";
		         
		     	if(!((branch.equalsIgnoreCase("a")) || (branch.equalsIgnoreCase("NA"))))
		     	{
		     		sqltest+=" and de.brhid='"+branch+"'";
		  		}
		     	if(type.equalsIgnoreCase("BR"))
		      	{    	 
		      		 wheresql= " and  m.brandid="+brandid+" ";
		      		    		
		      	}
		      	else if(type.equalsIgnoreCase("PR"))
		      	{
		      		     		wheresql= " and  m.doc_no="+psrno+" ";
		      	}     	
		      	else if(type.equalsIgnoreCase("CA"))
		      	{
		      		
		      		 wheresql= " and  m.catid="+catid+" ";
		      	}     	
		      	else if(type.equalsIgnoreCase("SC"))
		      	{
		      	
		      		 wheresql= " and  m.subcatid="+subcatid+" ";     		 
		      	}     	   
		     	
		      	Connection conn = null;        
		 		try
		 		{
		 				 conn = ClsConnection.getMyConnection();
		 				 Statement stmt = conn.createStatement ();			
		 	
 		     	
 		     	
 		     	
 		     	String sql="select m.doc_no, m.fixingprice,bd.brandname,m.part_no productid,m.productname "
 		     			+ " from  my_main m  left join  my_brand bd on m.brandid=bd.doc_no left  join my_catm ca on m.catid=ca.doc_no "
 		     			+ "left  join  my_scatm sc on m.scatid=sc.doc_no  left join my_clcatm c on c.doc_no=m.ofrcatid "
 		     			+ " inner join my_descpr pr on m.doc_no=pr.psrno left join my_desc de on de.psrno=m.doc_no "
 		     			+ "  where m.status=3   "+wheresql+ " "+sqltest+"   group by m.doc_no;";
 		     	
 
 		     	System.out.println("-----sql----"+sql);
            		ResultSet resultSet = stmt.executeQuery(sql);
            		 RESULTDATA=ClsCommon.convertToJSON(resultSet);
            		 stmt.close();           
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
