package com.dashboard.accounts.CreditLimitClintVdr;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import net.sf.json.JSONArray;

import com.common.ClsCommon;
import com.connection.ClsConnection;

public class ClsCreLmtCVDAO {
	
	
	ClsConnection ClsConnection=new ClsConnection();

	ClsCommon ClsCommon=new ClsCommon();

	
	public JSONArray ageingStatement(String branch,String atype,String accdocno, String salesperson,String category,String clientStatus,String check) throws SQLException
	{
       
		JSONArray RESULTDATA=new JSONArray();
		
		Connection conn = null;
        
      
         
		try {
				conn = ClsConnection.getMyConnection();
				Statement stmtAgeingStatement = conn.createStatement();
				
				if(check.equalsIgnoreCase("1")){
				
				
				 
				String sql = "",sqld = "",sqld1 = "",select="" , sql1="";
				
				if(atype.equalsIgnoreCase("AR")){
					sqld=" and j.id < 0";
					sqld1=" and j.id > 0";
					
				
						
					select ="select a.*,if(bk.per_mob is null,bk.com_mob,if(bk.per_mob='NA',bk.com_mob,if(bk.per_mob=' ',bk.com_mob,bk.per_mob))) mobile_no, "
							+ " bk.contactPerson contact_person,s.sal_name from (select name 'account_name',"
							+ "CONVERT(if(sum(t7+u6)<0,round((sum(t7+u6)*-1),2),''),CHAR(50)) 'advance',"
							+  " CONVERT(if(sum(t7+u6)>0,round((sum(t7+u6)),2),''),CHAR(50)) 'balance',CONVERT(if(sum(u6<0),round((sum(u6*-1)),2),''),CHAR(50)) 'unapplied', "
							+ " CONVERT(if(sum(t7)>0,round((sum(t7)),2),''),CHAR(50)) 'total', if(l1>0,l1,'') 'duedate', "
							+ " ag.acno 'account',ag.brhid 'branch_id' from (select d.name,d.acno,d.brhid,d.doc_no,if(d.duedys >0,d.duedys,0) l1, "
							+ " CONVERT(if(d.bal<0,round((d.bal),2),''),CHAR(50)) U6,if(d.bal>0,d.bal,0) t7 from ";
				
							
				}
				else if(atype.equalsIgnoreCase("AP")){
					sqld=" and j.id > 0";
					sqld1=" and j.id < 0";
					
					
					/*select ="select a.*,if(bk.per_mob is null,bk.com_mob,if(bk.per_mob='NA',bk.com_mob,if(bk.per_mob=' ',bk.com_mob,bk.per_mob))) mobile_no,bk.contactPerson contact_person,s.sal_name from (select name 'account_name',CONVERT(if(sum(t7+u6)>0,round((sum(t7+u6)),2),''),CHAR(50)) 'advance',\r\n" + 
							"CONVERT(if(sum(t7+u6)<0,round((sum(t7+u6)*-1),2),''),CHAR(50)) 'balance',CONVERT(if(sum(u6>0),round((sum(u6)),2),''),CHAR(50)) 'unapplied',\r\n" + 
							"CONVERT(if(sum(t7)<0,round((sum(t7)*-1),2),''),CHAR(50)) 'total',CONVERT(if(sum(l1)<0,round((sum(l1)*-1),2),''),CHAR(50)) 'level_1',\r\n" + 
							"CONVERT(if(sum(l2)<0,round((sum(l2)*-1),2),''),CHAR(50)) 'level_2',CONVERT(if(sum(l3)<0,round((sum(l3)*-1),2),''),CHAR(50)) 'level_3',\r\n" + 
							"CONVERT(if(sum(l4)<0,round((sum(l4)*-1),2),''),CHAR(50)) 'level_4',CONVERT(if(sum(l5)<0,round((sum(l5)*-1),2),''),CHAR(50)) 'level_5',\r\n" + 
							"ag.acno 'account',ag.brhid 'branch_id' from (select d.name,d.acno,d.brhid,d.doc_no,\r\n" + 
							"if(d.duedys between "+level1from+" and "+level1to+" and d.bal<0,round((d.bal),2),0) l1,if(d.duedys between "+level2from+" and "+level2to+" and d.bal<0,\r\n" + 
							"round((d.bal),2),0) l2,if(d.duedys between "+level3from+" and "+level3to+" and d.bal<0,round((d.bal),2),0) l3,if(d.duedys between "+level4from+" and "+level4to+" and d.bal<0,\r\n" + 
							"round((d.bal),2),0) l4,if(d.duedys >="+level5from+" and d.bal<0,round((d.bal),2),0) l5,CONVERT(if(d.bal>0,round((d.bal),2),''),CHAR(50)) U6,\r\n" + 
							"if(d.bal<0,d.bal,0) t7 from ";	*/	
					select="select a.*,if(bk.per_mob is null,bk.com_mob,if(bk.per_mob='NA',bk.com_mob,if(bk.per_mob=' ',bk.com_mob,bk.per_mob))) mobile_no, "
							+ " bk.contactPerson contact_person,s.sal_name from (select name 'account_name',CONVERT (if(sum(t7+u6)>0,round((sum(t7+u6)),2),''), "
							+ " CHAR(50)) 'advance', CONVERT (if(sum(t7+u6)<0,round((sum(t7+u6)*-1),2),''),CHAR(50)) 'balance', "
							+ " CONVERT (if(sum(u6>0),round((sum(u6)),2),''),CHAR(50)) 'unapplied',"
							+ "CONVERT (if(sum(t7)<0,round((sum(t7)*-1),2),''),CHAR(50)) 'total',if(l1>0,l1,'') 'duedate',"
							+ "ag.acno 'account',ag.brhid 'branch_id' from (select d.name,d.acno,d.brhid,d.doc_no,if(d.duedys >0,d.duedys,0) l1,"
							+ "CONVERT(if(d.bal>0,round((d.bal),2),''),CHAR(50)) U6,if(d.bal<0,d.bal,0) t7 from";
							
				}
				
				if(!((branch.equalsIgnoreCase("a")) || (branch.equalsIgnoreCase("NA")))){
	    			sql+=" and j.brhId="+branch+"";
	    		}

				if(!(accdocno.equalsIgnoreCase("0")) && !(accdocno.equalsIgnoreCase(""))){
					sql+=" and j.acno="+accdocno+"";
					System.out.println("AAcc"+accdocno+"sql"+sql);
	            }
				
			/*	if(!(accdocno.equalsIgnoreCase("0")) && !(accdocno.equalsIgnoreCase(""))){
					sql1+=" and a.acno="+accdocno+"";
					System.out.println("AAcc"+accdocno+"sql"+sql);
	            }
				*/
				
				if(!(salesperson.equalsIgnoreCase(""))){
	    			sql1+=" and bk.sal_id="+salesperson+"";
	    		}
				
				if(!(category.equalsIgnoreCase(""))){
	    			sql1+=" and bk.catid="+category+"";
	    		}
				
				if(!(clientStatus.equalsIgnoreCase(""))){
					if(clientStatus.equalsIgnoreCase("0")){
						sql1+=" and bk.pcase=0";
					}
					else if(clientStatus.equalsIgnoreCase("1")){
						sql1+=" and bk.pcase=1";
					}
					else if(clientStatus.equalsIgnoreCase("2")){
						sql1+=" and bk.pcase=2";
					}
					else if(clientStatus.equalsIgnoreCase("3")){
						sql1+=" and bk.pcase=3";
					}
	    		}
		
					
				/*sql = select+" (select j.acno,j.brhid,h.description name,sum(dramount) - coalesce(o.amount,0)*id bal, j.tranid, j.doc_no,TIMESTAMPDIFF(Day,cast(j.date as datetime),cast('"+sqlUpToDate+"' as datetime)) duedys\r\n" + 
						"from my_jvtran j inner join my_head h on j.acno=h.doc_no left join (select ap_trid,o.tranid,sum(coalesce(amount,0)) amount from my_outd o inner join my_jvtran j on j.tranid=o.tranid where\r\n" + 
						"j.date<='"+sqlUpToDate+"' group by ap_trid ) o on j.tranid=o.ap_trid where j.status=3 and h.atype='"+atype+"' and j.date<='"+sqlUpToDate+"' "+sql+""+sqld1+" group by j.tranid having bal<>0 \r\n" + 
						" union all select j.acno,j.brhid,h.description name,sum(dramount)- coalesce(o.amount,0)*id bal, j.tranid, j.doc_no,TIMESTAMPDIFF(Day,cast(j.date as datetime),cast('"+sqlUpToDate+"' as datetime)) duedys\r\n" + 
						" from my_jvtran j inner join my_head h on j.acno=h.doc_no left join (select ap_trid,o.tranid,sum(coalesce(amount,0)) amount from my_outd o inner join my_jvtran j on j.tranid=o.ap_trid where j.date<='"+sqlUpToDate+"'\r\n" + 
						" group by tranid) o on j.tranid=o.tranid where j.status=3 and h.atype='"+atype+"' and j.date<='"+sqlUpToDate+"'"+sql+""+sqld+" group by j.tranid having bal<>0) d) ag group by acno ) a  left join my_acbook bk on a.account=bk.acno\r\n" +
						" and bk.status=3 left join my_salm s on bk.sal_id=s.doc_no where 1=1 "+sql1;*/
				sql = select+"  (select j.acno,j.brhid,h.description name, "
							+ "sum(dramount) - coalesce(o.amount,0)*id bal,j.tranid, j.doc_no, TIMESTAMPDIFF(Day,cast(j.date as datetime),cast(curdate() as datetime))duedys"
							+ " from my_jvtran j inner join my_head h on j.acno=h.doc_no left join (select ap_trid,o.tranid,sum(coalesce(amount,0)) amount"
							+ " from my_outd o inner join my_jvtran j on j.tranid=o.tranid where j.date<=curdate() group by ap_trid ) o "
							+ "on j.tranid=o.ap_trid where j.status=3 and h.atype='"+atype+"' and j.date<=curdate()   "+sql+""+sqld1+"  group by j.tranid having bal<>0"
							+ " union all select j.acno,j.brhid,h.description name,sum(dramount)- coalesce(o.amount,0)*id bal, j.tranid, j.doc_no, "
							+ " TIMESTAMPDIFF(Day,cast(j.date as datetime),cast(curdate() as datetime)) duedys"
							+ " from my_jvtran j inner join my_head h on j.acno=h.doc_no left join (select ap_trid,o.tranid,sum(coalesce(amount,0)) amount"
							+ " from my_outd o inner join my_jvtran j on j.tranid=o.ap_trid where j.date<=curdate()"
							+ " group by tranid) o on j.tranid=o.tranid where j.status=3 and h.atype='"+atype+"'  and j.date<=curdate() "+sql+""+sqld+" group by"
							+ " j.tranid having bal<>0) d) ag group by acno ) a  left join my_acbook bk on a.account=bk.acno"
							+ " and bk.status=3 left join my_salm s on bk.sal_id=s.doc_no where 1=1 and bk.credit<balance and bk.period2<duedate"+sql1;
				
				
				
				
				
				
				//System.out.println("===creditaaaaaaaaaa== "+select);
				
				//System.out.println("===crediaaaaaaaaaaaaat== "+sql);
				ResultSet resultSet = stmtAgeingStatement.executeQuery(sql);
				RESULTDATA=ClsCommon.convertToJSON(resultSet);
				
				}
				
				stmtAgeingStatement.close();
				conn.close();
		}catch(Exception e){
			e.printStackTrace();
			conn.close();
		}finally{
			conn.close();
		}
        return RESULTDATA;
    }
	
	

	public JSONArray accountDetails(String type,String account,String partyname,String contact) throws SQLException {
	    Connection conn=null;
	   
	    JSONArray RESULTDATA1=new JSONArray();
	
	    try {
	    	    conn = ClsConnection.getMyConnection();
		        Statement stmtAgeingStatement1 = conn.createStatement();
			
	    	    String sql = "";
	    	    String condition="";
            	
				if(type.equalsIgnoreCase("AR")){
					condition="and a.dtype='CRM'";
				}
				if(type.equalsIgnoreCase("AP")){
					condition="and a.dtype='VND'";
				}
				
	    	    if(!(account.equalsIgnoreCase(""))){
	                sql=sql+" and t.doc_no like '%"+account+"%'";
	            }
	            if(!(partyname.equalsIgnoreCase(""))){
	             sql=sql+" and t.description like '%"+partyname+"%'";
	            }
	            if(!(contact.equalsIgnoreCase(""))){
	                sql=sql+" and a.per_mob like '%"+contact+"%'";
	            }
	            
				sql = "select a.per_mob,t.doc_no,t.account,t.description,c.code curr from my_acbook a left join my_head t on a.acno=t.doc_no "
						+ ""+condition+" left join my_curr c on t.curid=c.doc_no where t.atype='"+type+"' and a.status<>7 and t.m_s=0"+sql;
				
				ResultSet resultSet1 = stmtAgeingStatement1.executeQuery(sql);
				
				RESULTDATA1=ClsCommon.convertToJSON(resultSet1);
				
				stmtAgeingStatement1.close();
				conn.close();
		}catch(Exception e){
			e.printStackTrace();
			conn.close();
		}finally{
			conn.close();
		}
	    return RESULTDATA1;
	}
	
	

}
