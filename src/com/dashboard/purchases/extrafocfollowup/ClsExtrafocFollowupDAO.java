package com.dashboard.purchases.extrafocfollowup;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import com.common.ClsCommon;
import com.connection.ClsConnection;

import net.sf.json.JSONArray;

public class ClsExtrafocFollowupDAO {
	ClsConnection ClsConnection=new ClsConnection();
	ClsCommon ClsCommon=new ClsCommon();
	public   JSONArray purchaselistsearch(String branch,String fromdate,String todate,String status,String acno) throws SQLException {

        JSONArray RESULTDATA=new JSONArray();
        
        java.sql.Date sqlfromdate = null;
     	if(!(fromdate.equalsIgnoreCase("undefined"))&&!(fromdate.equalsIgnoreCase(""))&&!(fromdate.equalsIgnoreCase("0")))
     	{
     		sqlfromdate=ClsCommon.changeStringtoSqlDate(fromdate);
     		
     	}
     	else{
     
     	}

        java.sql.Date sqltodate = null;
     	if(!(todate.equalsIgnoreCase("undefined"))&&!(todate.equalsIgnoreCase(""))&&!(todate.equalsIgnoreCase("0")))
     	{
     		sqltodate=ClsCommon.changeStringtoSqlDate(todate);
     		
     	}
     	else{
     
     	}

        String sqltest="";
    	if(!((branch.equalsIgnoreCase("a")) || (branch.equalsIgnoreCase("NA")))){
    		sqltest+=" and mm.brhid='"+branch+"'";
 		}
    	
 
    	   
    	
     	Connection conn = null;
        
		try {
				 conn = ClsConnection.getMyConnection();
				Statement stmtVeh = conn.createStatement ();   
 
				String sql="  select mm.description, mm.DATE  ,mm.refno,mm.doc_no,mm.voc_no,mm.date,d.prdId prodoc,   h.account,h.description acname, "
						 + " m.part_no productid,m.productname,u.unit, d.unitid unitdocno, "
						 + "  d.qty   from my_ordm mm left join my_ordd d on d.tr_no=mm.tr_no left join my_main m on m.doc_no=d.prdId "
						  + " left join my_unitm u on d.unitid=u.doc_no   left join my_head h on h.doc_no=mm.acno   left join my_prodattrib at "
						 + "   on(at.mpsrno=m.doc_no)    where   mm.DATE between  '"+sqlfromdate+"' and  '"+sqltodate+"'  "+sqltest+"   and "
						+ "  d.extfoc!=d.extfoc_out and  d.extfoc>0   group by mm.doc_no ";
					
          
          //	System.out.println("---s--------"+sql);	
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
	
	public   JSONArray purchaselistsearchEx(String branch,String fromdate,String todate,String status,String acno) throws SQLException {

        JSONArray RESULTDATA=new JSONArray();
        
        java.sql.Date sqlfromdate = null;
     	if(!(fromdate.equalsIgnoreCase("undefined"))&&!(fromdate.equalsIgnoreCase(""))&&!(fromdate.equalsIgnoreCase("0")))
     	{
     		sqlfromdate=ClsCommon.changeStringtoSqlDate(fromdate);
     		
     	}
     	else{
     
     	}

        java.sql.Date sqltodate = null;
     	if(!(todate.equalsIgnoreCase("undefined"))&&!(todate.equalsIgnoreCase(""))&&!(todate.equalsIgnoreCase("0")))
     	{
     		sqltodate=ClsCommon.changeStringtoSqlDate(todate);
     		
     	}
     	else{
     
     	}

        String sqltest="";
    	if(!((branch.equalsIgnoreCase("a")) || (branch.equalsIgnoreCase("NA")))){
    		sqltest+=" and mm.brhid='"+branch+"'";
 		}
    	
 
    	   
    	
     	Connection conn = null;
        
		try {
				 conn = ClsConnection.getMyConnection();
				Statement stmtVeh = conn.createStatement ();   
 
				String sql="  select mm.voc_no docno, mm.DATE,mm.refno,  h.Account,h.description Acountname,mm.description   from my_ordm mm left join my_ordd d on d.tr_no=mm.tr_no left join my_main m on m.doc_no=d.prdId "
						  + " left join my_unitm u on d.unitid=u.doc_no   left join my_head h on h.doc_no=mm.acno   left join my_prodattrib at "
						 + "   on(at.mpsrno=m.doc_no)    where   mm.DATE between  '"+sqlfromdate+"' and  '"+sqltodate+"'  "+sqltest+"   and "
						+ "  d.extfoc!=d.extfoc_out and  d.extfoc>0   group by mm.doc_no ";
					
          
          //	System.out.println("---s--------"+sql);	
            		ResultSet resultSet = stmtVeh.executeQuery(sql);
            		 RESULTDATA=ClsCommon.convertToEXCEL(resultSet);
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
	public   JSONArray detgridsearch(String docno) throws SQLException {

        JSONArray RESULTDATA=new JSONArray();
        
        
 
 
    	   
    	
     	Connection conn = null;
        
		try {
				 conn = ClsConnection.getMyConnection();
				Statement stmtVeh = conn.createStatement ();  
		
				
				
 			String sql=" select d.extfoc-d.extfoc_out balfoc,d.extfoc,d.extfoc_out,d.rowno,d.psrno ,bd.brandname,mm.refno,mm.doc_no,mm.voc_no,mm.date,d.prdId prodoc, "
				 
						+ "  m.part_no productid,m.productname,u.unit, d.unitid unitdocno,d.taxper, d.taxamount, d.nettaxamount, "
						+ "  d.qty,convert(if(d.out_qty=0,'',d.out_qty),char(30)) out_qty,convert(if(d.qty-d.out_qty=0,'',d.qty-d.out_qty),char(50)) balqty,"
						+ " d.amount,d.total,convert(if(d.disper=0,'',d.disper),char(30)) disper,"
						+ "  convert(if(d.discount=0,'',d.discount),char(30)) discount,d.nettotal  "
						+ "  from my_ordm mm left join my_ordd d on d.rdocno=mm.doc_no left join my_main m on m.doc_no=d.prdId left join my_unitm u on d.unitid=u.doc_no "
						+ "  left join my_prodattrib at on(at.mpsrno=m.doc_no)  left join  my_brand bd on m.brandid=bd.doc_no   where  d.rdocno='"+docno+"'  and "
						+ "   d.extfoc!=d.extfoc_out and  d.extfoc>0   group by m.doc_no "; 
 			
 			
 
          
         	//System.out.println("---det-------"+sql);	
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
	
	public   JSONArray detgridsearchEx(String docno) throws SQLException {

        JSONArray RESULTDATA=new JSONArray();
        
        
 
 
    	   
    	
     	Connection conn = null;
        
		try {
				 conn = ClsConnection.getMyConnection();
				Statement stmtVeh = conn.createStatement ();  
		
				
				
 			String sql=" select m.part_no productid,m.productname,bd.brandname,u.unit"
						+ "  ,d.extfoc ExtraFOC,d.extfoc_out ExtraFOC_Out,d.extfoc-d.extfoc_out ExtraFOC_Bal from my_ordm mm left join my_ordd d on d.rdocno=mm.doc_no left join my_main m on m.doc_no=d.prdId left join my_unitm u on d.unitid=u.doc_no "
						+ "  left join my_prodattrib at on(at.mpsrno=m.doc_no)  left join  my_brand bd on m.brandid=bd.doc_no   where  d.rdocno='"+docno+"'  and "
						+ "   d.extfoc!=d.extfoc_out and  d.extfoc>0   group by m.doc_no "; 
 			
 			
 
          
         	//System.out.println("---det-------"+sql);	
            		ResultSet resultSet = stmtVeh.executeQuery(sql);
            		 RESULTDATA=ClsCommon.convertToEXCEL(resultSet);
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
	
}
