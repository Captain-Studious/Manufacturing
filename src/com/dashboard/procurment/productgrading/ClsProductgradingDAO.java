package com.dashboard.procurment.productgrading;

import java.sql.Connection;
import java.sql.Date;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import com.common.ClsCommon;
import com.connection.ClsConnection;

import net.sf.json.JSONArray;

public class ClsProductgradingDAO {
	ClsConnection ClsConnection=new ClsConnection();
	ClsCommon ClsCommon=new ClsCommon();
	
	
	public   JSONArray productgradinggridsearch(String branch,String fromdate,String todate,String type,String brandid,String catid,String subcatid,String psrno,
			String loadid,String hidbrandid,String hidtypeid,String hideptid,String hidcatid,String hidsubcatid,String hidproductid,String choosetype) throws SQLException {

        JSONArray RESULTDATA=new JSONArray();
     	Connection conn = null;
        
		try {
			
			
			if(loadid.equalsIgnoreCase("yes"))
			{
				 conn = ClsConnection.getMyConnection();
				Statement stmtVeh = conn.createStatement ();  
			    java.sql.Date sqlfromdate = null;
		     	if(!(fromdate.equalsIgnoreCase("undefined"))&&!(fromdate.equalsIgnoreCase(""))&&!(fromdate.equalsIgnoreCase("0")))
		     	{
		     		sqlfromdate=ClsCommon.changeStringtoSqlDate(fromdate);
		     		//System.out.println("fffffffffffffffffffffffffffffff"+fromdate);
		     		
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
	    /*      String sqlgroup="";
	          String namesql="";
	          String wheresql="";
	          
	       
	          
	   */   String branchsql="";
	  		if(!branch.equalsIgnoreCase("a") && !branch.equalsIgnoreCase("NA") && !branch.equalsIgnoreCase("")){
	  			branchsql=" and pin.brhid="+branch;
			}
				
            	
	          
		     	/*if(type.equalsIgnoreCase("BR"))
		     	{
		     		//sqlgroup= "group by ma.brandid ";
		     		sqlgroup= "group by pin.prdid";
		     		namesql = " a.brandname,a.brandid,";
		     		 wheresql= " and  a.brandid="+brandid+" ";
		     		 
		     		
		     	}
		     	else if(type.equalsIgnoreCase("PR"))
		     	{
		     		sqlgroup= "group by pin.prdid";
		     		namesql = "   a.brandname,a.brandid,";
		     		wheresql= " and  a.psrno="+psrno+" ";
		     		wheresql= " and  a.psrno="+psrno+" ";
		     	}
		     	
		     	else if(type.equalsIgnoreCase("CA"))
		     	{
		     		//sqlgroup= "group by ca.doc_no";
		     		sqlgroup= "group by pin.prdid";
		     		namesql = "   a.category brandname,a.catid brandid,";
		     		 wheresql= " and  a.catid="+catid+" ";
		     	 
		     	}
		     	
		     	else if(type.equalsIgnoreCase("SC"))
		     	{
		     		//sqlgroup= "group by sc.doc_no";
		     		sqlgroup= "group by pin.prdid";
		     		namesql = "   a.subcategory brandname,a.subcatid brandid,";
		     	 wheresql= " and  a.subcatid="+subcatid+" ";
		     		 
		     	}
		     	*/
		

 		     	

		     	
       				
  		String sql1="select datediff('"+sqltodate+"','"+sqlfromdate+"')";		     	
	     	ResultSet resultSet = stmtVeh.executeQuery(sql1);
     //	System.out.println("sssssssssssssssssssssss"+sql1);
     	int t=0;
  		
while(resultSet.next())
		{
		t=resultSet.getInt(1);
//  	 System.out.println("ttttttttttttttttttttttttt"+t);
 	}
String sqltest="";
String sqltest1="";
/*if(!(psrno.equalsIgnoreCase("0")) && !(psrno.equalsIgnoreCase(""))){
	sqltest=sqltest+" and ma.psrno= '"+psrno+"'";
	sqltest1=" and pin.prdid= '"+psrno+"'";
	
}*/
 		  /*   	String sql="select pin.prdid, ma.productname, ma.part_no product,sum(pin.op_qty) purchasequantity,"
 		     			+ "(sum(pin.out_qty)+sum(pin.rsv_qty)+sum(pin.del_qty)) salequantity,"
 		     			+ " (select sum(pin.op_qty)-(sum(pin.out_qty)+sum(pin.rsv_qty)+sum(pin.del_qty))) stockquantity,"
 		divya     			+ " (select ((sum(pin.out_qty)+sum(pin.rsv_qty)+sum(pin.del_qty))/"+t+")*30) averagesalespermonth,"
 		     			+ " (select (sum(pin.op_qty)/"+t+")*30) averagepurchasepermonth from my_main ma "
 		     			 +" left join my_prddin pin on pin.prdid=ma.doc_no "
 		     			 + " where 1=1 "+sqltest+" group by ma.doc_no";
 		     	
 		     	*/
 		     	
	 String sqlss="";
   	 
	 
		if(!(hidbrandid.equalsIgnoreCase("0") || hidbrandid.equalsIgnoreCase("") || hidbrandid.equalsIgnoreCase("undefined"))){
			sqlss=sqlss+" and ma.brandid in ("+hidbrandid+")";
		}

		if(!(hidtypeid.equalsIgnoreCase("0") || hidtypeid.equalsIgnoreCase("") || hidtypeid.equalsIgnoreCase("undefined"))){
			sqlss=sqlss+" and ma.typeid in ("+hidtypeid+")";
		}

		if(!(hidcatid.equalsIgnoreCase("0") || hidcatid.equalsIgnoreCase("") || hidcatid.equalsIgnoreCase("undefined"))){
			sqlss=sqlss+" and ma.catid in ("+hidcatid+")";
		}
		if(!(hidsubcatid.equalsIgnoreCase("0") || hidsubcatid.equalsIgnoreCase("") || hidsubcatid.equalsIgnoreCase("undefined"))){
			sqlss=sqlss+" and ma.scatid in ("+hidsubcatid+")";
		}

		if(!(hidproductid.equalsIgnoreCase("0") || hidproductid.equalsIgnoreCase("") || hidproductid.equalsIgnoreCase("undefined"))){
			sqlss=sqlss+" and ma.psrno in ("+hidproductid+")";
		}
	 
		if(!(hideptid.equalsIgnoreCase("0") || hideptid.equalsIgnoreCase("") || hideptid.equalsIgnoreCase("undefined"))){
			sqlss=sqlss+" and ma.deptid in ("+hideptid+")";
		}
 		     	
  		 /*    	String sql="select pd.description,ma.psrno,b.turndays,pin.prdid, ma.productname, ma.part_no product,sum(pin.op_qty) purchasequantity,"
 		     			+ "(sum(pin.out_qty)+sum(pin.rsv_qty)+sum(pin.del_qty)) salequantity,"
 		     			+ " (select sum(pin.op_qty)-(sum(pin.out_qty)+sum(pin.rsv_qty)+sum(pin.del_qty))) stockquantity,"
 		     			+ " (select ((sum(pin.out_qty)+sum(pin.rsv_qty)+sum(pin.del_qty))/"+t+")*30) averagesalespermonth,"
 		     			+ " (select (sum(pin.op_qty)/"+t+")*30) averagepurchasepermonth from my_main ma  left join  my_brand bd on ma.brandid=bd.doc_no  "
		     			+ " left join my_ptype pt on(ma.typeid=pt.doc_no)  left join my_dept dep on(dep.doc_no=ma.deptid)  "
		     			+ "   left  join my_catm ca on ma.catid=ca.doc_no  left  join  my_scatm sc on ma.scatid=sc.doc_no "
 		     			 +" inner join my_prddin pin on pin.prdid=ma.doc_no left join(select a.prdid, "
 		     			 + " sum(diffmul),sum(a.diffmul)/sum(a.qty) turndays,sum(a.qty) totalqty , "
 		     			 + "sum(datediff) sumdatdiff from (select  pin.stockid,pin.prdid ,pout.qty, "
 		     			 + " pout.qty*(datediff( pout.date,pin.date)) diffmul ,datediff( pout.date,pin.date)  "
 		     			 + " datediff from  my_prddin pin  "
 		     			 + "  left join my_prddout pout on pin.stockid=pout.stockid where 1=1 and pin.date between '"+sqlfromdate+"' and '"+sqltodate+"' "+branchsql+"  "+sqltest1+" ) a group by a.prdid  ) "
 		     			 + "  b on b.prdid=ma.doc_no  left join my_prdgrading pd on ma.star=pd.docno "
 		     			 + " where 1=1 "+sqltest+" "+sqlss+" "+branchsql+" group by ma.doc_no";
 		     	*/
 		String sqlssq1="";    
 		String sqlssq2="";    
		
		if(choosetype.equalsIgnoreCase("FM"))
		{
			sqlssq1 =" and( salequantity is not null and   salequantity!=0) ";
			
			sqlssq2= " order by  salequantity desc ";
		}
		else if(choosetype.equalsIgnoreCase("SM"))
		{
			sqlssq1 =" and( salequantity is not null and   salequantity!=0) ";
			
			sqlssq2= " order by   salequantity asc  ";
		}
		else if(choosetype.equalsIgnoreCase("NM"))
		{
			sqlssq1 =" and( salequantity is  null or   salequantity=0) ";
		}
		
		
     	String sql=" 	select  pd.description,h.turndays,ds.brhid '',k.cou '',if(ds.brhid=0,'Company','Branch') type, sum(ds.reorderlevel)/if(ds.brhid=0,coalesce(k.cou,1),1) reorderlevel, "
     			+ "  sum(ds.reorderqty)/if(ds.brhid=0,coalesce(k.cou,1),1) reorderqty,b.brand,b.psrno,b.prdid,b.part_no product, "
     	 + "  b.productname,a.purchasequantity,c.salequantity, ((a.purchasequantity/"+t+")*30) averagepurchasepermonth, "
     	 + "   ((c.salequantity/"+t+")*30) averagesalespermonth,d.stockquantity,sv.stockprice from(select bd.brandname brand,ma.star,ma.psrno,ma.psrno prdid, "
     	 + "    ma.productname, ma.part_no from my_main ma "
     	+ "   left join  my_brand bd on ma.brandid=bd.doc_no   left join my_ptype pt on(ma.typeid=pt.doc_no) "
     	+ "   left join my_dept dep on(dep.doc_no=ma.deptid) "
     	+ "   left  join my_catm ca on ma.catid=ca.doc_no "
        + "  	left  join  my_scatm sc on ma.scatid=sc.doc_no "
     	+ "  left join my_prddin pin on pin.psrno=ma.psrno "
        + "  	where   ma.status=3 "+sqlss+" group by ma.doc_no) b"
     	+ "  left join (select pin.stockid,pin.psrno,coalesce(sum(pin.op_qty),0)-coalesce(sum(pout.qty),0) purchasequantity from my_prddin pin " /*branchsqlin branchsqlout*/
     	+ "  	left join my_prddout pout on(pin.stockid=pout.stockid and pout.dtype in ('PIR','GRR') and pout.date between'"+sqlfromdate+"' and '"+sqltodate+"' and pout.brhid=1  ) "
     	+ "  	where pin.dtype in ('PIV','GRN') and pin.date between '"+sqlfromdate+"' and '"+sqltodate+"' and pin.brhid=1  group by  pin.psrno) a on a.psrno=b.psrno "
      		+ " left join (select pout.stockid,pout.psrno,coalesce(sum(pout.qty+pout.del_qty),0)-coalesce(pin.op_qty,0) salequantity "
     		+ " from my_prddout pout  left join (select sum(pin.op_qty) op_qty,pin.refstockid,pin.dtype from my_prddin pin   left join my_invr m on (m.tr_no=pin.tr_no and m.ftype=0) "
     		+ " where pin.dtype in ('INR','DLR') and pin.date between '"+sqlfromdate+"' and '"+sqltodate+"'   and m.ftype=0      group by pin.refstockid)  pin  on(pin.refstockid=pout.stockid) "
     		+ "  left join my_invm m on (m.tr_no=pout.tr_no and m.ftype=0) where    pout.dtype in ('INV','DEL') and m.ftype=0 and  pout.date  between '"+sqlfromdate+"' and '"+sqltodate+"'   group by  pout.psrno) c on c.psrno=b.psrno"
     	+ " left join (select coalesce(sum(pin.op_qty),0)-coalesce(sum(pout.outqty),0) stockquantity ,pin.psrno,pin.stockid from  my_prddin pin "
     	+ " left join (select sum(qty+del_qty) outqty,stockid,psrno from  my_prddout where  date<='"+sqltodate+"'   group by stockid ) "
     	+ " pout  on (pout.stockid=pin.stockid ) where pin.date<='"+sqltodate+"'   group by pin.psrno) d on d.psrno=b.psrno "
     		 + " left join (select sum(stockprice)/sum(op_qty) stockprice, psrno from(select op_qty*cost_price  stockprice ,op_qty,psrno,stockid "
        		+ " from  my_prddin where date<='"+sqltodate+"' group by stockid) k group by psrno ) sv on sv.psrno=d.psrno " 
     	+ " left join(select a.prdid, "
 		     			 + " sum(diffmul),sum(a.diffmul)/sum(a.qty) turndays,sum(a.qty) totalqty , "
 		     			 + "sum(datediff) sumdatdiff from (select  pin.stockid,pin.prdid ,pout.qty, "
 		     			 + " pout.qty*(datediff( pout.date,pin.date)) diffmul ,datediff( pout.date,pin.date)  "
 		     			 + " datediff from  my_prddin pin  "
 		     			 + "  left join my_prddout pout on pin.stockid=pout.stockid where 1=1 and pin.date between '"+sqlfromdate+"' and '"+sqltodate+"'   ) a group by a.prdid  ) "
 		     			 + "  h on h.prdid=b.psrno "
     	+ "   inner join my_desc ds on ds.psrno=b.psrno left join my_prdgrading pd on b.star=pd.docno  "
     	+ "   left join (select   count(*) cou,psrno  from my_desc "
     	+ "   where brhid>0 group by psrno) k on k.psrno=ds.psrno where 1=1  "+sqlssq1+"    group by b.psrno  "+sqlssq2+"  " ;	
 		     	
 		 
      System.out.println("-----============sdas==========="+sql);
            		ResultSet resultSet1 = stmtVeh.executeQuery(sql);
            		 RESULTDATA=ClsCommon.convertToJSON(resultSet1);
     				stmtVeh.close();
            	conn.close();
			}
		}
		catch(Exception e){
			e.printStackTrace();
			conn.close();
		}
		//System.out.println(RESULTDATA);
        return RESULTDATA;
    }
	
	
	public   JSONArray productgradinggridsearchex(String branch,String fromdate,String todate,String type,String brandid,String catid,String subcatid,String psrno,
			String loadid,String hidbrandid,String hidtypeid,String hideptid,String hidcatid,String hidsubcatid,String hidproductid,String choosetype) throws SQLException {

        JSONArray RESULTDATA=new JSONArray();
     	Connection conn = null;
        
		try {
			
			
			if(loadid.equalsIgnoreCase("yes"))
			{
				 conn = ClsConnection.getMyConnection();
				Statement stmtVeh = conn.createStatement ();  
			    java.sql.Date sqlfromdate = null;
		     	if(!(fromdate.equalsIgnoreCase("undefined"))&&!(fromdate.equalsIgnoreCase(""))&&!(fromdate.equalsIgnoreCase("0")))
		     	{
		     		sqlfromdate=ClsCommon.changeStringtoSqlDate(fromdate);
		     		//System.out.println("fffffffffffffffffffffffffffffff"+fromdate);
		     		
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
	    /*      String sqlgroup="";
	          String namesql="";
	          String wheresql="";
	          
	       
	          
	   */   String branchsql="";
	  		if(!branch.equalsIgnoreCase("a") && !branch.equalsIgnoreCase("NA") && !branch.equalsIgnoreCase("")){
	  			branchsql=" and pin.brhid="+branch;
			}
				
            	
	          
		     	/*if(type.equalsIgnoreCase("BR"))
		     	{
		     		//sqlgroup= "group by ma.brandid ";
		     		sqlgroup= "group by pin.prdid";
		     		namesql = " a.brandname,a.brandid,";
		     		 wheresql= " and  a.brandid="+brandid+" ";
		     		 
		     		
		     	}
		     	else if(type.equalsIgnoreCase("PR"))
		     	{
		     		sqlgroup= "group by pin.prdid";
		     		namesql = "   a.brandname,a.brandid,";
		     		wheresql= " and  a.psrno="+psrno+" ";
		     		wheresql= " and  a.psrno="+psrno+" ";
		     	}
		     	
		     	else if(type.equalsIgnoreCase("CA"))
		     	{
		     		//sqlgroup= "group by ca.doc_no";
		     		sqlgroup= "group by pin.prdid";
		     		namesql = "   a.category brandname,a.catid brandid,";
		     		 wheresql= " and  a.catid="+catid+" ";
		     	 
		     	}
		     	
		     	else if(type.equalsIgnoreCase("SC"))
		     	{
		     		//sqlgroup= "group by sc.doc_no";
		     		sqlgroup= "group by pin.prdid";
		     		namesql = "   a.subcategory brandname,a.subcatid brandid,";
		     	 wheresql= " and  a.subcatid="+subcatid+" ";
		     		 
		     	}
		     	*/
		

 		     	

		     	
       				
  		String sql1="select datediff('"+sqltodate+"','"+sqlfromdate+"')";		     	
	     	ResultSet resultSet = stmtVeh.executeQuery(sql1);
     //	System.out.println("sssssssssssssssssssssss"+sql1);
     	int t=0;
  		
while(resultSet.next())
		{
		t=resultSet.getInt(1);
//  	 System.out.println("ttttttttttttttttttttttttt"+t);
 	}
String sqltest="";
String sqltest1="";
/*if(!(psrno.equalsIgnoreCase("0")) && !(psrno.equalsIgnoreCase(""))){
	sqltest=sqltest+" and ma.psrno= '"+psrno+"'";
	sqltest1=" and pin.prdid= '"+psrno+"'";
	
}*/
 		  /*   	String sql="select pin.prdid, ma.productname, ma.part_no product,sum(pin.op_qty) purchasequantity,"
 		     			+ "(sum(pin.out_qty)+sum(pin.rsv_qty)+sum(pin.del_qty)) salequantity,"
 		     			+ " (select sum(pin.op_qty)-(sum(pin.out_qty)+sum(pin.rsv_qty)+sum(pin.del_qty))) stockquantity,"
 		divya     			+ " (select ((sum(pin.out_qty)+sum(pin.rsv_qty)+sum(pin.del_qty))/"+t+")*30) averagesalespermonth,"
 		     			+ " (select (sum(pin.op_qty)/"+t+")*30) averagepurchasepermonth from my_main ma "
 		     			 +" left join my_prddin pin on pin.prdid=ma.doc_no "
 		     			 + " where 1=1 "+sqltest+" group by ma.doc_no";
 		     	
 		     	*/
 		     	
	 String sqlss="";
   	 
	 
		if(!(hidbrandid.equalsIgnoreCase("0") || hidbrandid.equalsIgnoreCase("") || hidbrandid.equalsIgnoreCase("undefined"))){
			sqlss=sqlss+" and ma.brandid in ("+hidbrandid+")";
		}

		if(!(hidtypeid.equalsIgnoreCase("0") || hidtypeid.equalsIgnoreCase("") || hidtypeid.equalsIgnoreCase("undefined"))){
			sqlss=sqlss+" and ma.typeid in ("+hidtypeid+")";
		}

		if(!(hidcatid.equalsIgnoreCase("0") || hidcatid.equalsIgnoreCase("") || hidcatid.equalsIgnoreCase("undefined"))){
			sqlss=sqlss+" and ma.catid in ("+hidcatid+")";
		}
		if(!(hidsubcatid.equalsIgnoreCase("0") || hidsubcatid.equalsIgnoreCase("") || hidsubcatid.equalsIgnoreCase("undefined"))){
			sqlss=sqlss+" and ma.scatid in ("+hidsubcatid+")";
		}

		if(!(hidproductid.equalsIgnoreCase("0") || hidproductid.equalsIgnoreCase("") || hidproductid.equalsIgnoreCase("undefined"))){
			sqlss=sqlss+" and ma.psrno in ("+hidproductid+")";
		}
	 
		if(!(hideptid.equalsIgnoreCase("0") || hideptid.equalsIgnoreCase("") || hideptid.equalsIgnoreCase("undefined"))){
			sqlss=sqlss+" and ma.deptid in ("+hideptid+")";
		}
		
        
    
/* 		     	
 		     	String sql="select  ma.part_no product,ma.productname,pd.description Gradation,sum(pin.op_qty) 'Purchase Quantity',"
 		     			+ "(sum(pin.out_qty)+sum(pin.rsv_qty)+sum(pin.del_qty)) 'Sale Quantity',"
 		     			+ " (select sum(pin.op_qty)-(sum(pin.out_qty)+sum(pin.rsv_qty)+sum(pin.del_qty))) 'Stock Quantity' ,"
 		     			+ " (select ((sum(pin.out_qty)+sum(pin.rsv_qty)+sum(pin.del_qty))/"+t+")*30) 'Average Sales Per Month',"
 		     			+ " (select (sum(pin.op_qty)/"+t+")*30)'Average Purchase Per Month', b.turndays   'Turn-Around Days' from my_main ma  left join  my_brand bd on ma.brandid=bd.doc_no  "
		     			+ " left join my_ptype pt on(ma.typeid=pt.doc_no)  left join my_dept dep on(dep.doc_no=ma.deptid)  "
		     			+ "   left  join my_catm ca on ma.catid=ca.doc_no  left  join  my_scatm sc on ma.scatid=sc.doc_no "
 		     			 +" inner join my_prddin pin on pin.prdid=ma.doc_no left join(select a.prdid, "
 		     			 + " sum(diffmul),sum(a.diffmul)/sum(a.qty) turndays,sum(a.qty) totalqty , "
 		     			 + "sum(datediff) sumdatdiff from (select  pin.stockid,pin.prdid ,pout.qty, "
 		     			 + " pout.qty*(datediff( pout.date,pin.date)) diffmul ,datediff( pout.date,pin.date)  "
 		     			 + " datediff from  my_prddin pin  "
 		     			 + "  left join my_prddout pout on pin.stockid=pout.stockid where 1=1 and pin.date between '"+sqlfromdate+"' and '"+sqltodate+"' "+branchsql+"  "+sqltest1+" ) a group by a.prdid  ) "
 		     			 + "  b on b.prdid=ma.doc_no  left join my_prdgrading pd on ma.star=pd.docno "
 		     			 + " where 1=1 "+sqltest+" "+sqlss+" "+branchsql+" group by ma.doc_no";
 		     	
 		     	*/
 		String sqlssq1="";    
 		String sqlssq2="";    
		
		if(choosetype.equalsIgnoreCase("FM"))
		{
			sqlssq1 =" and( salequantity is not null and   salequantity!=0) ";
			
			sqlssq2= " order by  salequantity desc ";
		}
		else if(choosetype.equalsIgnoreCase("SM"))
		{
sqlssq1 =" and( salequantity is not null and   salequantity!=0) ";
			
			sqlssq2= " order by   salequantity asc  ";
		}
		else if(choosetype.equalsIgnoreCase("NM"))
		{
			sqlssq1 =" and( salequantity is  null or   salequantity=0) ";
		}
		    	
 		     	
 		     	
 		     	String sql=" 	select  b.part_no product,b.productname,pd.description Gradation,"
 		     	 + "   a.purchasequantity 'Purchase Quantity',c.salequantity 'Sale Quantity' ,d.stockquantity 'Stock Quantity',sv.stockprice 'Stock Value', "
 		     	 + "   ((c.salequantity/"+t+")*30)'Average Sales Per Month',((a.purchasequantity/"+t+")*30) 'Average Purchase Per Month' ,h.turndays 'Turn-Around Days' from(select bd.brandname brand,ma.star,ma.psrno,ma.psrno prdid, "
 		     	 + "    ma.productname, ma.part_no from my_main ma "
 		     	+ "   left join  my_brand bd on ma.brandid=bd.doc_no   left join my_ptype pt on(ma.typeid=pt.doc_no) "
 		     	+ "   left join my_dept dep on(dep.doc_no=ma.deptid) "
 		     	+ "   left  join my_catm ca on ma.catid=ca.doc_no "
 		        + "  	left  join  my_scatm sc on ma.scatid=sc.doc_no "
 		     	+ "  left join my_prddin pin on pin.psrno=ma.psrno "
 		        + "  	where   ma.status=3 "+sqlss+" group by ma.doc_no) b "
 		     	+ "  left join (select pin.stockid,pin.psrno,coalesce(sum(pin.op_qty),0)-coalesce(sum(pout.qty),0) purchasequantity from my_prddin pin " /*branchsqlin branchsqlout*/
 		     + "  	left join my_prddout pout on(pin.stockid=pout.stockid and pout.dtype in ('PIR','GRR') and pout.date between'"+sqlfromdate+"' and '"+sqltodate+"' and pout.brhid=1  ) "
 		       + "  	where pin.dtype in ('PIV','GRN') and pin.date between '"+sqlfromdate+"' and '"+sqltodate+"' and pin.brhid=1  group by  pin.psrno) a on a.psrno=b.psrno "
 		      		+ " left join (select pout.stockid,pout.psrno,coalesce(sum(pout.qty+pout.del_qty),0)-coalesce(pin.op_qty,0) salequantity "
 		     		+ " from my_prddout pout  left join (select sum(pin.op_qty) op_qty,pin.refstockid,pin.dtype from my_prddin pin   left join my_invr m on (m.tr_no=pin.tr_no and m.ftype=0) "
 		     		+ " where pin.dtype in ('INR','DLR') and pin.date between '"+sqlfromdate+"' and '"+sqltodate+"'   and m.ftype=0      group by pin.refstockid)  pin  on(pin.refstockid=pout.stockid) "
 		     		+ "  left join my_invm m on (m.tr_no=pout.tr_no and m.ftype=0) where    pout.dtype in ('INV','DEL') and m.ftype=0 and  pout.date  between '"+sqlfromdate+"' and '"+sqltodate+"'   group by  pout.psrno) c on c.psrno=b.psrno"
 		     	+ " left join (select coalesce(sum(pin.op_qty),0)-coalesce(sum(pout.outqty),0) stockquantity,pin.psrno,pin.stockid from  my_prddin pin "
 		     	+ " left join (select sum(qty+del_qty) outqty,stockid,psrno from  my_prddout where  date<='"+sqltodate+"'   group by stockid ) "
 		     	+ " pout  on (pout.stockid=pin.stockid ) where pin.date<='"+sqltodate+"'   group by pin.psrno) d on d.psrno=b.psrno "
 		     	+ " left join (select sum(stockprice)/sum(op_qty) stockprice, psrno from(select op_qty*cost_price  stockprice ,op_qty,psrno,stockid "
        		+ " from  my_prddin where date<='"+sqltodate+"' group by stockid) k group by psrno ) sv on sv.psrno=d.psrno " 
 		     	+ " left join(select a.prdid, "
 		 		+ " sum(diffmul),sum(a.diffmul)/sum(a.qty) turndays,sum(a.qty) totalqty , "
 		 		+ "sum(datediff) sumdatdiff from (select  pin.stockid,pin.prdid ,pout.qty, "
 		 		+ " pout.qty*(datediff( pout.date,pin.date)) diffmul ,datediff( pout.date,pin.date)  "
 		 		+ " datediff from  my_prddin pin  "
 		 		+ "  left join my_prddout pout on pin.stockid=pout.stockid where 1=1 and pin.date between '"+sqlfromdate+"' and '"+sqltodate+"'   ) a group by a.prdid  ) "
 		 		+ "  h on h.prdid=b.psrno "
 		     	+ "   inner join my_desc ds on ds.psrno=b.psrno left join my_prdgrading pd on b.star=pd.docno  "
 		     	+ "   left join (select   count(*) cou,psrno  from my_desc "
 		     	+ "   where brhid>0 group by psrno) k on k.psrno=ds.psrno  where 1=1  "+sqlssq1+"    group by b.psrno  "+sqlssq2+"  " ;	
 		 		     	
 		     	
 		 
       // System.out.println("-----======================="+sql);
            		ResultSet resultSet1 = stmtVeh.executeQuery(sql);
            		 RESULTDATA=ClsCommon.convertToEXCEL(resultSet1);
     				stmtVeh.close();
            	conn.close();
			}
		}
		catch(Exception e){
			e.printStackTrace();
			conn.close();
		}
		//System.out.println(RESULTDATA);
        return RESULTDATA;
    }
	
}
