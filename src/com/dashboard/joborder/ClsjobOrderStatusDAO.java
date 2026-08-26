package com.dashboard.joborder;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Enumeration;

import javax.servlet.http.HttpSession;

import net.sf.json.JSONArray;

import com.common.ClsCommon;
import com.connection.ClsConnection;



public class ClsjobOrderStatusDAO {


	
	ClsConnection ClsConnection=new ClsConnection();
	ClsCommon ClsCommon=new ClsCommon();
	
	public  JSONArray searchaStatusMaster(String branch,String cldocno,String type) throws SQLException
	{

 

		JSONArray RESULTDATA=new JSONArray();
	

		
		Connection conn = null;

		try {
					conn = ClsConnection.getMyConnection();
					Statement stmtenq1 = conn.createStatement (); 
					
					String sqltest="";
					 
					if(!(cldocno.equalsIgnoreCase(""))){
						sqltest=sqltest+" and m.cldocno = '"+cldocno+"'";
					}

				 	if(!((branch.equalsIgnoreCase("a")) || (branch.equalsIgnoreCase("NA")))){
			    		sqltest=sqltest+" and m.brhid='"+branch+"'";
			 		}
			    	
				 	String sqlgp="";
				 	
				 	if(type.equalsIgnoreCase("joborder"))
				 	{
				 		sqltest=sqltest+" and d.status=0 ";
				 	}
				 	else if(type.equalsIgnoreCase("fixing")) 
				 	{
				 		sqltest=sqltest+" and d.status=2  ";
				 		
				 		
				 		sqlgp=" having sum(d.qty-d.out_qty)>0 ";
				 	}
				 	else if(type.equalsIgnoreCase("invoiced"))
				 	{
				 		sqltest=sqltest+" and d.status=2   ";
				 		
				 		sqlgp=" having sum(d.qty-d.out_qty)=0 ";
				 	}
				 	else if(type.equalsIgnoreCase("issue"))
				 	{
				 		sqltest=sqltest+" and d.status=1 ";
				 	}
					else if(type.equalsIgnoreCase("return"))
				 	{
				 		sqltest=sqltest+" and d.status in (3) ";
				 	}	
				 	
					else
					{
						
					}
				 	
					String clssql="select if(d.fixing=1,'YES','NO') fix,m.voc_no voc_no,m.brhid brhid,"
							+ " m.doc_no doc_no,br.brandname brandname,mo.modelname modelname,sm.submodel,ach.submodelid,ach.yom yomid,"
					+ " ac.refname refname,trim(ac.address) address, "
					+ " mm.part_no productid,mm.productname productname, case when d.status=2 and sum(d.qty-d.out_qty)=0 "
					+ "then 4 else d.status end as fixing, m.cldocno cldocno,ach.reg_no regno,"
					+ " ach.brandid brdid,ach.modelid modelid,y.yom,u.unit,sum(d.qty) qty,case when d.status=2 and sum(d.qty-d.out_qty)=0  then 'Invoiced'  "
					+ " when d.status=3 then 'Returned' "
					+ " when d.status='2' and sum(d.qty-d.out_qty)>0 then 'Fixing' when d.status=1 then 'Issue' when d.status=0 then 'Job Order' else   "
					+ " ' ' end as stats,s1.spec bsize,ach.bsizeid,s2.spec esize,ach.esizeid,s3.spec csize,ach.csizeid   from "
					+ " my_joborderm m  left join my_joborderd d on d.rdocno=m.doc_no left join my_acbook ac "
					+ " on ac.cldocno=m.cldocno and ac.dtype='CRM'  left join my_acvehicle ach on ach.doc_no=m.clrefno  "
					+ " left join my_sbrand br on br.doc_no=ach.brandid left join my_smodel mo on mo.doc_no=ach.modelid "
					+ " left join my_ssubmodel sm on(sm.doc_No=ach.submodelid and sm.modelid=ach.modelid) left join my_suitspec1 s1 on(s1.doc_no=ach.bsizeid)  "
					+ " left join my_suitspec2 s2 on(s2.doc_no=ach.esizeid) left join my_suitspec3 s3 on(s3.doc_no=ach.csizeid)  "
					+ " left join my_syom y on y.doc_no=ach.yom "
					+ " left join my_main mm on(d.psrno=mm.doc_no and d.prdid=mm.psrno) left join "
					+ " my_unitm u on(d.unitid=u.doc_no) left join my_prodattrib at"
					+ " on(at.mpsrno=mm.doc_no and d.specno=at.mpsrno ) left join  my_brand bd on"
					+ " mm.brandid=bd.doc_no  where   m.status=3 "+sqltest+" group by m.doc_no,d.psrno "+sqlgp+" ";
					
					System.out.println("====searchjobmaster1234===="+clssql);
					ResultSet resultSet = stmtenq1.executeQuery(clssql);

					RESULTDATA=ClsCommon.convertToJSON(resultSet);
					stmtenq1.close();
					conn.close();
			}
			catch(Exception e)
			{
					conn.close();
					e.printStackTrace();
			}
			//System.out.println(RESULTDATA);
		finally
		{
			return RESULTDATA;
			}
    }

 
	
}
