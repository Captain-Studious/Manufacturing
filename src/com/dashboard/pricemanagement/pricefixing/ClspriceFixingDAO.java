package com.dashboard.pricemanagement.pricefixing;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import com.common.ClsCommon;
import com.connection.ClsConnection;

import net.sf.json.JSONArray;

public class ClspriceFixingDAO {
	ClsConnection ClsConnection=new ClsConnection();
	ClsCommon ClsCommon=new ClsCommon();
	
	public   JSONArray mainlistgridsearch(String branch,String fromdate,String todate,String type,String brandid,String catid,String subcatid,
			String psrno,String load,String hidbrandid,String hidtypeid,String hideptid,String hidcatid,String hidsubcatid,String hidproductid,String optype) throws SQLException {

        JSONArray RESULTDATA=new JSONArray();
        
   
        if(!load.equalsIgnoreCase("yes"))
        {
        	return RESULTDATA;
        }
        
    	
     	Connection conn = null;
        
		try {
				 conn = ClsConnection.getMyConnection();
				Statement stmt = conn.createStatement ();  
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
	          String sqlgroup="";
	          String namesql="";
	          String wheresql="";
	          
	          String branchsql="";
	          
	   
	  		if(!branch.equalsIgnoreCase("a") && !branch.equalsIgnoreCase("NA") && !branch.equalsIgnoreCase("")){
	  			branchsql=" and brhid="+branch;
			}
 
		 if(type.equalsIgnoreCase("BR"))
		     	{
		     		//sqlgroup= "group by ma.brandid ";
		     		sqlgroup= "group by pin.prdid";
		     		namesql = " bd.brandname,ma.brandid,";
		     		 wheresql= " and  ma.brandid="+brandid+" ";
		     		 
		     		
		     	}
		     	else if(type.equalsIgnoreCase("PR"))
		     	{
		     		sqlgroup= "group by pin.prdid";
		     		namesql = "   bd.brandname,ma.brandid,";
		     		wheresql= " and  ma.psrno="+psrno+" ";
		     		 
		     	}
		     	
		     	else if(type.equalsIgnoreCase("CA"))
		     	{
		     		//sqlgroup= "group by ca.doc_no";
		     		sqlgroup= "group by pin.prdid";
		     		namesql = "   ca.category brandname,ca.doc_no brandid,";
		     		 wheresql= " and  ma.catid="+catid+" ";
		     	 
		     	}
		     	
		     	else if(type.equalsIgnoreCase("SC"))
		     	{
		     		 
		     		sqlgroup= "group by pin.prdid";
		     		namesql = "   sc.subcategory brandname,sc.doc_no brandid,";
		     	 wheresql= " and ma.subcatid="+subcatid+" ";
		     		 
		     	}
		    
		 
		 
		 String sqlss="";
	 
		 
			if(!(hidbrandid.equalsIgnoreCase("0") || hidbrandid.equalsIgnoreCase("") || hidbrandid.equalsIgnoreCase("undefined"))){
				sqlss=sqlss+" and bd.doc_no in ("+hidbrandid+")";
			}

			if(!(hidtypeid.equalsIgnoreCase("0") || hidtypeid.equalsIgnoreCase("") || hidtypeid.equalsIgnoreCase("undefined"))){
				sqlss=sqlss+" and pt.doc_no in ("+hidtypeid+")";
			}

			if(!(hidcatid.equalsIgnoreCase("0") || hidcatid.equalsIgnoreCase("") || hidcatid.equalsIgnoreCase("undefined"))){
				sqlss=sqlss+" and ca.doc_no in ("+hidcatid+")";
			}
			if(!(hidsubcatid.equalsIgnoreCase("0") || hidsubcatid.equalsIgnoreCase("") || hidsubcatid.equalsIgnoreCase("undefined"))){
				sqlss=sqlss+" and sc.doc_no in ("+hidsubcatid+")";
			}

			if(!(hidproductid.equalsIgnoreCase("0") || hidproductid.equalsIgnoreCase("") || hidproductid.equalsIgnoreCase("undefined"))){
				sqlss=sqlss+" and ma.doc_no in ("+hidproductid+")";
			}
		 
			if(!(hideptid.equalsIgnoreCase("0") || hideptid.equalsIgnoreCase("") || hideptid.equalsIgnoreCase("undefined"))){
				sqlss=sqlss+" and dep.doc_no in ("+hideptid+")";
			}

			 if(optype.equalsIgnoreCase("NR"))
		     	{
				 
				 sqlss=sqlss+" and ma.fixingprice=0 or ma.mrp=0 " ;
		     	}
			 
 		     	
 		     	
			wheresql=wheresql+sqlss	;
		 
			
			 String sql="";
			
			 if(optype.equalsIgnoreCase("NP"))
		     	{
			   sql=" select "+namesql+"   "
			   		+ "  ma.mrp,pin.brhid,ma.psrno,ma.brandid branddoc,0 totalvalue, "
			   		+ " convert(if(ma.fixingprice=0,'',ma.fixingprice),char(100))   sellingprice , "
			   		+ "  ma.part_no,ma.productname, u.unit,'' qty,'' costprice,'' stkqty ,''  avgcost , " 
			   		+ " '' variation   from my_main ma left join my_prddin pin	on pin.prdid=ma.doc_no  left join  my_brand bd on ma.brandid=bd.doc_no  "
			   		+ "   left  join my_catm ca on ma.catid=ca.doc_no left  join  my_scatm sc on ma.scatid=sc.doc_no left join my_unitm u on ma.munit=u.doc_no "
			   		+ " left join my_ptype pt on(ma.typeid=pt.doc_no)         left join my_dept dep on(dep.doc_no=ma.deptid)  "
			   		+ "   where 1=1 and ma.status=3  and pin.prdid is null  "+wheresql+"   group by ma.psrno " ;
			 
				ResultSet resultSet = stmt.executeQuery(sql);
       		 RESULTDATA=ClsCommon.convertToJSON(resultSet);
			 
		     	}
			 else
			 {
			 
			 
			 
	   sql=" select   "+namesql+"    ma.mrp, ma.part_no,ma.productname,pin.brhid,ma.psrno,ma.brandid branddoc,0 totalvalue,  "
			 + "  convert(if(ma.fixingprice=0,'',ma.fixingprice),char(100))   sellingprice,st.stkqty  "
	   + "   from  my_prddin pin   left join my_main ma on ma.psrno=pin.psrno left join  my_brand bd on ma.brandid=bd.doc_no  "
	   + "  left  join my_catm ca on ma.catid=ca.doc_no  "
	  + "   left  join  my_scatm sc on ma.scatid=sc.doc_no  left join my_unitm u on ma.munit=u.doc_no "
	  + "  left join my_ptype pt on(ma.typeid=pt.doc_no) left join my_dept dep on(dep.doc_no=ma.deptid) "
 		+ "  left join (select sum(op_qty-(out_qty+del_qty+rsv_qty))  "
	   + "   stkqty ,prdid from my_prddin  group by prdid) st on st.prdid=ma.psrno  	"
	   + "   where 1=1 and ma.status=3 "+wheresql+"  group by ma.psrno  "  ; 
	   System.out.println("-----sql----"+sql);
		ResultSet resultSet = stmt.executeQuery(sql);
		 RESULTDATA=ClsCommon.convertToJSON(resultSet);

			 }
	 
   // System.out.println("-----sql----"+sql);
            	
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
	
	
	public   JSONArray listgridsearch(String psrno) throws SQLException {

        JSONArray RESULTDATA=new JSONArray();
        
   
    	
     	Connection conn = null;
        
		try {
				 conn = ClsConnection.getMyConnection();
				Statement stmt = conn.createStatement ();  
			 
				 
		 
				
 				String sql=" select  m.doc_no, m.date,t.description vnd,d.tr_no,d.qty,(d.foc+d.expfoc) foc,d.amount unitprice  from my_srvm m "
 	+" left join  my_head t on t.doc_no=m.acno inner join my_acbook a on (t.cldocno=a.cldocno and "
 	+"	  a.dtype='VND' and t.atype='AP' and a.active=1 and t.m_s=0 ) left join my_srvd d on d.rdocno=m.doc_no "
	    +" where  m.status=3  and psrno='"+psrno+"'  group by d.rowno order by   date desc limit 5  ";  
				
 				 System.out.println("====sql==="+sql);
            	 
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
	
	public   JSONArray foclistgridsearch(String psrno) throws SQLException {

        JSONArray RESULTDATA=new JSONArray();
        
   
    	
     	Connection conn = null;
        
		try {
				 conn = ClsConnection.getMyConnection();
				Statement stmt  = conn.createStatement ();  
			 
				 
		 
				
 				String sql=" select  qty,foc from  my_prodfocfixing where  psrno='"+psrno+"' order by sr_no ";  
				
 				 System.out.println("====sql==="+sql);
            	 
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
