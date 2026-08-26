package com.dashboard.pricemanagement.OfferList;


import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.http.HttpSession;

import com.common.ClsCommon;
import com.connection.ClsConnection;

import net.sf.json.JSONArray;

public class ClsOfferListDAO

{
	ClsConnection ClsConnection=new ClsConnection();
	ClsCommon ClsCommon=new ClsCommon();
	
	
	public   JSONArray stkclerlist(String branch,String status,String psrno,String fromdate1,String todate1,String type,String brandid,String catid,String subcatid) throws SQLException 
	{

        JSONArray RESULTDATA=new JSONArray();
        java.sql.Date fromdate = null;
        java.sql.Date todate = null;        
        fromdate = ClsCommon.changeStringtoSqlDate(fromdate1);        
        todate = ClsCommon.changeStringtoSqlDate(todate1);
        String sqltest="";
        String wheresql="";  
        String brch="";
    	if(!((branch.equalsIgnoreCase("a")) || (branch.equalsIgnoreCase("NA"))))
    	{
    		sqltest+=" and de.brhid='"+branch+"'";
    		brch = " and brhid= "+branch+" ";
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
			

				String sql=" select b.alqty avail_qty,a.* from(select m.doc_no,m.fixingprice fixingprice,m.clrprice clrprice,m.clrfromdate clrfromdate, m.clrtodate clrtodate,bd.brandname,m.part_no productid,m.productname"
						+ " from  my_main m "
						+ " left join  my_brand bd on m.brandid=bd.doc_no left  join my_catm ca on m.catid=ca.doc_no "
						+ " left  join  my_scatm sc on m.scatid=sc.doc_no left join my_desc de on de.psrno=m.doc_no where m.status=3 "   +wheresql+ " and"
						+ " (clrfromdate between '"+fromdate+"' and '"+todate+"' or "
						+ " clrtodate between '"+fromdate+"' and '"+todate+"') "+sqltest+ "group by m.doc_no )a left join "
						+ " (select sum(op_qty) qty ,sum(op_qty)-sum(out_qty+del_qty+rsv_qty) alqty,psrno from my_prddin where 1=1 "+brch+" group by psrno) b on b.psrno=a.doc_no";
				 System.out.println("------offerlist-----"+sql);	
            	 ResultSet resultSet = stmt.executeQuery(sql);
            	 RESULTDATA=ClsCommon.convertToJSON(resultSet);
     			 stmt.close();            
            	 conn.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
			conn.close();
		}
		//System.out.println(RESULTDATA);
        return RESULTDATA;
    }	
	
	
	public   JSONArray stkclerlistExcel(String branch,String status,String psrno,String fromdate1,String todate1,String type,String brandid,String catid,String subcatid) throws SQLException 
	{

        JSONArray RESULTDATA=new JSONArray();
        java.sql.Date fromdate = null;
        java.sql.Date todate = null;        
        fromdate = ClsCommon.changeStringtoSqlDate(fromdate1);        
        todate = ClsCommon.changeStringtoSqlDate(todate1);
        String sqltest="";
        String wheresql=""; 
        String brch="";
    	if(!((branch.equalsIgnoreCase("a")) || (branch.equalsIgnoreCase("NA"))))
    	{
    		sqltest+=" and de.brhid='"+branch+"'";
    		brch = " and brhid= "+branch+" ";
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
			

				String sql="select a.part_no 'Product Id',a.productname 'Product Name',a.brandname 'Brand Name' ,"
						+ " a.clrfromdate 'Clear Fromdate',a.clrtodate 'Clear Todate',a.fixingprice 'Fixing Price',a.clrprice 'Clear Price' , "
						+ " b.alqty 'Available Qty' from(select m.doc_no,m.fixingprice  ,m.clrprice ,m.clrfromdate , "
						+ "m.clrtodate ,bd.brandname,m.part_no ,m.productname "
						+ " from  my_main m "
						+ " left join  my_brand bd on m.brandid=bd.doc_no left  join my_catm ca on m.catid=ca.doc_no "
						+ " left  join  my_scatm sc on m.scatid=sc.doc_no left join my_desc de on de.psrno=m.doc_no where m.status=3 "   +wheresql+ " and"
						+ " (clrfromdate between '"+fromdate+"' and '"+todate+"' or "
						+ " clrtodate between '"+fromdate+"' and '"+todate+"') "+sqltest+ "group by m.doc_no )a left join "
						+ " (select sum(op_qty) qty ,sum(op_qty)-sum(out_qty+del_qty+rsv_qty) alqty,psrno from my_prddin where 1=1 "+brch+" group by psrno) b on b.psrno=a.doc_no";
				
				 System.out.println("------stkclerlistExcel-----"+sql);	
            	 ResultSet resultSet = stmt.executeQuery(sql);
            	 RESULTDATA=ClsCommon.convertToJSON(resultSet);
     			 stmt.close();            
            	 conn.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
			conn.close();
		}
		//System.out.println(RESULTDATA);
        return RESULTDATA;
    }	
	
	
	public   JSONArray offerlist(String branch,String status,String psrno,String fromdate1,String todate1,String type,String brandid,String catid,String subcatid) throws SQLException 
	{

        JSONArray RESULTDATA=new JSONArray();
        java.sql.Date fromdate = null;
        java.sql.Date todate = null;        
        fromdate = ClsCommon.changeStringtoSqlDate(fromdate1);        
        todate = ClsCommon.changeStringtoSqlDate(todate1);
        String sqltest="";
        String wheresql="";
        String brch="";
    	if(!((branch.equalsIgnoreCase("a")) || (branch.equalsIgnoreCase("NA"))))
    	{
    		sqltest+=" and de.brhid='"+branch+"'";
    		brch = " and brhid= "+branch+" ";
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
	
				String sql=" select b.alqty avail_qty,a.* from(select  m.doc_no,pr.discount1,c.cat_name category,m.fixingprice,m.ofrfrmdate, m.ofrtodate,bd.brandname,m.part_no productid,m.productname"
						+ " from  my_main m "
						+ " left join  my_brand bd on m.brandid=bd.doc_no left  join my_catm ca on m.catid=ca.doc_no "
						+ " left  join  my_scatm sc on m.scatid=sc.doc_no  left join my_clcatm c on c.doc_no=m.ofrcatid left join my_descpr pr on "
						+ " pr.catid=m.ofrcatid and m.doc_no=pr.psrno left join my_desc de on de.psrno=m.doc_no where m.status=3 "   +wheresql+ " and"
						+ " (ofrfrmdate between '"+fromdate+"' and '"+todate+"' or "
						+ " ofrtodate between '"+fromdate+"' and '"+todate+"') "+sqltest+" group by m.doc_no" 
						+" )a left join "
						+ " (select sum(op_qty) qty ,sum(op_qty)-sum(out_qty+del_qty+rsv_qty) alqty,psrno from my_prddin where 1=1 "+brch+" group by psrno) b on b.psrno=a.doc_no;";
				System.out.println("------offerlist-----"+sql);	
            	ResultSet resultSet = stmt.executeQuery(sql);
            	RESULTDATA=ClsCommon.convertToJSON(resultSet);
     			stmt.close();           
            	conn.close();

		}
		catch(Exception e)
		{
			e.printStackTrace();
			conn.close();
		}
		//System.out.println(RESULTDATA);
        return RESULTDATA;
    }	
	
	public   JSONArray offerlistExcel(String branch,String status,String psrno,String fromdate1,String todate1,String type,String brandid,String catid,String subcatid) throws SQLException 
	{

        JSONArray RESULTDATA=new JSONArray();
        java.sql.Date fromdate = null;
        java.sql.Date todate = null;        
        fromdate = ClsCommon.changeStringtoSqlDate(fromdate1);        
        todate = ClsCommon.changeStringtoSqlDate(todate1);
        String sqltest="";
        String wheresql="";
        String brch="";
    	if(!((branch.equalsIgnoreCase("a")) || (branch.equalsIgnoreCase("NA"))))
    	{
    		sqltest+=" and de.brhid='"+branch+"'";
    		brch = " and brhid= "+branch+" ";
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
	
				String sql=" select @i:=@i+1 'Sr No',d.* from(select a.*,b.alqty 'Available Qty' "
						+ " from(select  m.doc_no ,m.part_no 'Product Id',m.productname 'Product Name',bd.brandname 'Brand Name',m.ofrfrmdate "
						+ " 'From Date', m.ofrtodate 'To Date',m.fixingprice 'Fixing price',c.cat_name Category,pr.discount1 'Discount %' "
						+ " from  my_main m "
						+ " left join  my_brand bd on m.brandid=bd.doc_no left  join my_catm ca on m.catid=ca.doc_no "
						+ " left  join  my_scatm sc on m.scatid=sc.doc_no  left join my_clcatm c on c.doc_no=m.ofrcatid left join my_descpr pr on "
						+ " pr.catid=m.ofrcatid and m.doc_no=pr.psrno left join my_desc de on de.psrno=m.doc_no where m.status=3 "   +wheresql+ " and"
						+ " (ofrfrmdate between '"+fromdate+"' and '"+todate+"' or "
						+ " ofrtodate between '"+fromdate+"' and '"+todate+"') "+sqltest+" group by m.doc_no "
						+ " )a left join "
						+ " (select sum(op_qty) qty ,sum(op_qty)-sum(out_qty+del_qty+rsv_qty) alqty,psrno from my_prddin where 1=1 "+brch+" group by psrno) b on b.psrno=a.doc_no )d,(select @i:=0)r" ;
				System.out.println("------offerlist-----"+sql);	
            	ResultSet resultSet = stmt.executeQuery(sql);
            	RESULTDATA=ClsCommon.convertToEXCEL(resultSet);
     			stmt.close();           
            	conn.close();

		}
		catch(Exception e)
		{
			e.printStackTrace();
			conn.close();
		}
		//System.out.println(RESULTDATA);
        return RESULTDATA;
    }	
	
	
	
	public JSONArray brandFormSearch(HttpSession session) throws SQLException 
	{
		JSONArray RESULTDATA=new JSONArray();
		Connection conn = null;
		try 
		{
			conn = ClsConnection.getMyConnection();
			Statement stmt = conn.createStatement();
			String sql="select doc_no,brand from my_brand where status=3";
			ResultSet resultSet = stmt.executeQuery(sql);
			RESULTDATA=ClsCommon.convertToJSON(resultSet);


		}
		catch(Exception e)
		{
			e.printStackTrace();

		}
		finally
		{
			conn.close();
		}
		return RESULTDATA;
	}
	
	public JSONArray catFormSearch(HttpSession session) throws SQLException 
	{


		JSONArray RESULTDATA=new JSONArray();
		Connection conn = null;
		try 
		{
			conn = ClsConnection.getMyConnection();
			Statement stmt = conn.createStatement();

			String sql="select category,doc_no  from my_catm where status <> 7";

			ResultSet resultSet = stmt.executeQuery(sql);
			RESULTDATA=ClsCommon.convertToJSON(resultSet);


		}
		catch(Exception e)
		{
			e.printStackTrace();

		}
		finally
		{
			conn.close();
		}
		return RESULTDATA;
	}
	
	public JSONArray subCatFormSearch(HttpSession session) throws SQLException 
	{
		JSONArray RESULTDATA=new JSONArray();
		Connection conn = null;
		try 
		{
			conn = ClsConnection.getMyConnection();
			Statement stmt = conn.createStatement();
			String sql = "select subcategory,doc_no  from my_scatm where status <>7 ";
			ResultSet resultSet = stmt.executeQuery(sql);
			RESULTDATA=ClsCommon.convertToJSON(resultSet);


		}
		catch(Exception e)
		{
			e.printStackTrace();

		}
		finally
		{
			conn.close();
		}
		return RESULTDATA;
	}

	public JSONArray productSearch(HttpSession session) throws SQLException 
	{
		JSONArray RESULTDATA=new JSONArray();

		Connection conn = null;

		try 
		{
				conn = ClsConnection.getMyConnection();
				Statement stmt = conn.createStatement();
	 
				String sql="select m.doc_no,m.part_no prodcode,m.productname prodname,b.brand from my_main m inner join my_brand b on(m.brandid=b.doc_no) "
						+ "inner join my_catm c on(m.catid=c.doc_no)  where m.status=3 ";
				System.out.println("==productSearch==="+sql);
				ResultSet resultSet = stmt.executeQuery(sql);
				RESULTDATA=ClsCommon.convertToJSON(resultSet);

		}
		catch(Exception e)
		{
				e.printStackTrace();

		}
		finally
		{
				conn.close();
		}
		return RESULTDATA;
	}
	
	
}
