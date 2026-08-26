package com.dashboard.client.paymentfollowup;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import net.sf.json.JSONArray;

import com.common.ClsCommon;
import com.connection.ClsConnection;

public class ClsPaymentFollowUpDAO  {
	ClsConnection ClsConnection=new ClsConnection();

	ClsCommon ClsCommon=new ClsCommon();

	
	public JSONArray paymentFollowUpGridLoading(String branch,String uptodate,String chkfollowup,String followupdate,String salesperson,String category,String amtrangefrm,String amtrangeto,String clientStatus) throws SQLException {
        JSONArray RESULTDATA=new JSONArray();
       
        Connection conn = null;
       
		java.sql.Date sqlUpToDate = null;
        java.sql.Date sqlFollowUpDate = null;
		
		try {
				conn = ClsConnection.getMyConnection();
				Statement stmtCRM = conn.createStatement();
				
				if(!(uptodate.equalsIgnoreCase("undefined")) && !(uptodate.equalsIgnoreCase("")) && !(uptodate.equalsIgnoreCase("0"))){
					sqlUpToDate = ClsCommon.changeStringtoSqlDate(uptodate);
				}
        
				if(!(followupdate.equalsIgnoreCase("undefined")) && !(followupdate.equalsIgnoreCase("")) && !(followupdate.equalsIgnoreCase("0"))){
					sqlFollowUpDate = ClsCommon.changeStringtoSqlDate(followupdate);
				}
				
				if(sqlUpToDate!=null){

			    String sql = "";String sql1 = "";String sql2 = "";String sql3 = "";
				
				if(chkfollowup.equalsIgnoreCase("1")){
					if(!(sqlFollowUpDate==null)){
			        	sql2+=" and bv.fdate<='"+sqlFollowUpDate+"'";
					}
				}
				
				if(!((branch.equalsIgnoreCase("a")) || (branch.equalsIgnoreCase("NA")))){
	    			sql+=" and j.brhid="+branch+"";
	    		}
				
				if(!(salesperson.equalsIgnoreCase(""))){
	    			sql3+=" and bk.sal_id="+salesperson+"";
	    		}
				
				if(!(category.equalsIgnoreCase(""))){
	    			sql3+=" and bk.catid="+category+"";
	    		}
				
				if(!(((amtrangefrm.equalsIgnoreCase("")) && (amtrangeto.equalsIgnoreCase(""))) || ((amtrangefrm.equalsIgnoreCase("0")) && (amtrangeto.equalsIgnoreCase("0"))) )){
	    			sql1+=" having balance between "+amtrangefrm+" and "+amtrangeto+"";
	    		}
				
				if(!(clientStatus.equalsIgnoreCase(""))){
					if(clientStatus.equalsIgnoreCase("1")){
						sql3+=" and (bk.rostatus!=0 or bk.lostatus!=0)";
					}
					else if(clientStatus.equalsIgnoreCase("2")){
						sql3+=" and (bk.rostatus=0 or bk.lostatus=0)";
					}
					else if(clientStatus.equalsIgnoreCase("3")){
						sql3+=" and (bk.rostatus!=0 or bk.lostatus!=0) and bk.pcase=1";
					}
					else if(clientStatus.equalsIgnoreCase("4")){
						sql3+="  and (bk.rostatus=0 or bk.lostatus=0) and bk.pcase=1";
					}
					else if(clientStatus.equalsIgnoreCase("5")){
						sql3+=" and (bk.rostatus!=0 or bk.lostatus!=0) and bk.pcase=2";
					}
					else if(clientStatus.equalsIgnoreCase("6")){
						sql3+="  and (bk.rostatus=0 or bk.lostatus=0) and bk.pcase=2";
					}
					else if(clientStatus.equalsIgnoreCase("7")){
						sql3+=" and bk.pcase=3";
					}
	    		}
					
				/*sql = "select CONVERT(ag.fdate,CHAR(100)) fdate,ag.acno,name,ag.contact,ag.cldocno,ag.brhid,ag.doc_no,if(ag.pmob is null,ag.mob,ag.pmob) pmob,CONVERT(if(sum(t7+u6)<0,round((sum(t7+u6)*-1),2),''),CHAR(10)) advance,"
					+ "CONVERT(if(sum(t7+u6)>0,round((sum(t7+u6)),2),''),CHAR(10)) balance,CONVERT(if(sum(u6<0),round((sum(u6*-1)),2),''),CHAR(10)) unapplied,CONVERT(if(sum(t7)>0,round((sum(t7)),2),''),CHAR(10)) netamount,"
					+ "CONVERT(if(sum(l1)>0,round((sum(l1)),2),''),CHAR(10)) level1,CONVERT(if(sum(l2)>0,round((sum(l2)),2),''),CHAR(10)) level2,CONVERT(if(sum(l3)>0,round((sum(l3)),2),''),CHAR(10)) level3,"
					+ "CONVERT(if(sum(l4)>0,round((sum(l4)),2),''),CHAR(10)) level4,CONVERT(if(sum(l5)>0,round((sum(l5)),2),''),CHAR(10)) level5 from (select d.fdate,d.name,d.mob,d.cldocno,d.contact,d.pmob,d.acno,"
					+ "d.brhid,d.doc_no,if(d.duedys between 0 and 30 and d.bal>0,round((d.bal),2),0) l1,if(d.duedys between 31 and 60 and d.bal>0,round((d.bal),2),0) l2,if(d.duedys between 61 and 90 and d.bal>0,"
					+ "round((d.bal),2),0) l3,if(d.duedys between 91 and 120 and d.bal>0,round((d.bal),2),0) l4,if(d.duedys >121 and d.bal>0,round((d.bal),2),0) l5,CONVERT(if(d.bal<0,round((d.bal),2),''),CHAR(10)) U6,"
					+ "if(d.bal>0,d.bal,0) t7 from (select coalesce(bv.fdate,'') fdate,j.acno,h.description name,bk.com_mob mob,bk.per_mob pmob,bk.contactPerson contact,bk.cldocno,j.brhid,sum(dramount-out_amount) bal,j.tranid, j.doc_no,"
					+ "TIMESTAMPDIFF(Day,cast(j.date as datetime),cast('"+sqlUpToDate+"' as datetime)) duedys from my_jvtran j inner join my_brch b on j.brhId=b.doc_no inner join my_curr bc on b.curId=bc.doc_no inner join my_head h "
					+ "on j.acno=h.doc_no inner join my_curr c on j.curId=c.doc_no left join my_acbook bk on h.cldocno=bk.cldocno  and bk.dtype='CRM' left join (select max(doc_no) doc_no,rdocno from gl_bcpf group by rdocno) sub "
					+ "on(sub.rdocno=bk.doc_no) left join gl_bcpf bv on sub.doc_no = bv.doc_no where j.status=3 and h.atype='AR' and j.date<='"+sqlUpToDate+"' "+sql+"  and j.yrid=0 group by tranid having bal<>0 ) d) ag group by acno"+sql1+"";*/
					
				sql = "select CONVERT(coalesce(bv.fdate,''),CHAR(100)) fdate,a.*,bk.cldocno,bk.contactPerson 'contact',if(bk.per_mob is null,bk.com_mob,bk.per_mob) pmob,s.sal_name from ( select ag.name,ag.acno,ag.brhid,ag.doc_no,CONVERT(if(sum(t7+u6)<0,round((sum(t7+u6)*-1),2),''),CHAR(50)) advance,\r\n" + 
					" CONVERT(if(sum(u6<0),round((sum(u6*-1)),2),''),CHAR(50)) unapplied,CONVERT(if(sum(t7+u6)>0,round((sum(t7+u6)),2),''),CHAR(50)) balance,CONVERT(if(sum(t7)>0,round((sum(t7)),2),''),CHAR(50)) netamount,CONVERT(if(sum(l1)>0,round((sum(l1)),2),''),CHAR(50)) level1,\r\n" + 
					" CONVERT(if(sum(l2)>0,round((sum(l2)),2),''),CHAR(50)) level2,CONVERT(if(sum(l3)>0,round((sum(l3)),2),''),CHAR(50)) level3,CONVERT(if(sum(l4)>0,round((sum(l4)),2),''),CHAR(50)) level4,CONVERT(if(sum(l5)>0,round((sum(l5)),2),''),CHAR(50)) level5 from (\r\n" +
					" select d.name,d.acno,d.brhid,d.doc_no,if(d.duedys between 0 and 30 and d.bal>0,round((d.bal),2),0) l1,if(d.duedys between 31 and 60 and d.bal>0,round((d.bal),2),0) l2,if(d.duedys between 61 and 90 and d.bal>0,round((d.bal),2),0) l3,if(d.duedys between 91 and 120 and d.bal>0,\r\n" +
					" round((d.bal),2),0) l4,if(d.duedys >=121 and d.bal>0,round((d.bal),2),0) l5,CONVERT(if(d.bal<0,round((d.bal),2),''),CHAR(50)) U6,if(d.bal>0,d.bal,0) t7 from (select j.acno,j.brhid,h.description name,sum(dramount-out_amount) bal,j.tranid, j.doc_no,\n\r" +
					" TIMESTAMPDIFF(Day,cast(j.date as datetime),cast('"+sqlUpToDate+"' as datetime)) duedys from my_jvtran j inner join my_head h on j.acno=h.doc_no where j.status=3 and h.atype='AR' and j.yrid=0 and j.date<='"+sqlUpToDate+"' "+sql+" group by tranid having bal<>0) d) ag group by acno"+sql1+") a\r\n" + 
					" left join my_acbook bk on a.acno=bk.acno and bk.status=3 left join my_salm s on bk.sal_id=s.doc_no left join (select max(doc_no) doc_no,rdocno from gl_bcpf group by rdocno) sub on(sub.rdocno=bk.doc_no) left join gl_bcpf bv on sub.doc_no = bv.doc_no where 1=1"+sql2+""+sql3+"";
					
				ResultSet resultSet = stmtCRM.executeQuery(sql);
				RESULTDATA=ClsCommon.convertToJSON(resultSet);
				
				}
				
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
	
	public JSONArray paymentFollowUpGridExporting(String branch,String uptodate,String chkfollowup,String followupdate,String salesperson,String category,String amtrangefrm,String amtrangeto,String clientStatus) throws SQLException {
        JSONArray RESULTDATA=new JSONArray();
       
        Connection conn = null;
       
		java.sql.Date sqlUpToDate = null;
        java.sql.Date sqlFollowUpDate = null;
		
		try {
				conn = ClsConnection.getMyConnection();
				Statement stmtCRM = conn.createStatement();
				
				if(!(uptodate.equalsIgnoreCase("undefined")) && !(uptodate.equalsIgnoreCase("")) && !(uptodate.equalsIgnoreCase("0"))){
					sqlUpToDate = ClsCommon.changeStringtoSqlDate(uptodate);
				}
        
				if(!(followupdate.equalsIgnoreCase("undefined")) && !(followupdate.equalsIgnoreCase("")) && !(followupdate.equalsIgnoreCase("0"))){
					sqlFollowUpDate = ClsCommon.changeStringtoSqlDate(followupdate);
				}
				
				if(sqlUpToDate!=null){

			    String sql = "";String sql1 = "";String sql2 = "";String sql3 = "";
				
				if(chkfollowup.equalsIgnoreCase("1")){
					if(!(sqlFollowUpDate==null)){
			        	sql2+=" and bv.fdate<='"+sqlFollowUpDate+"'";
					}
				}
				
				if(!((branch.equalsIgnoreCase("a")) || (branch.equalsIgnoreCase("NA")))){
	    			sql+=" and j.brhid="+branch+"";
	    		}
				
				if(!(salesperson.equalsIgnoreCase(""))){
	    			sql3+=" and bk.sal_id="+salesperson+"";
	    		}
				
				if(!(category.equalsIgnoreCase(""))){
	    			sql3+=" and bk.catid="+category+"";
	    		}
				
				if(!(((amtrangefrm.equalsIgnoreCase("")) && (amtrangeto.equalsIgnoreCase(""))) || ((amtrangefrm.equalsIgnoreCase("0")) && (amtrangeto.equalsIgnoreCase("0"))) )){
	    			sql1+=" having balance between "+amtrangefrm+" and "+amtrangeto+"";
	    		}
				
				if(!(clientStatus.equalsIgnoreCase(""))){
					if(clientStatus.equalsIgnoreCase("1")){
						sql3+=" and (bk.rostatus!=0 or bk.lostatus!=0)";
					}
					else if(clientStatus.equalsIgnoreCase("2")){
						sql3+=" and (bk.rostatus=0 or bk.lostatus=0)";
					}
					else if(clientStatus.equalsIgnoreCase("3")){
						sql3+=" and (bk.rostatus!=0 or bk.lostatus!=0) and bk.pcase=1";
					}
					else if(clientStatus.equalsIgnoreCase("4")){
						sql3+="  and (bk.rostatus=0 or bk.lostatus=0) and bk.pcase=1";
					}
					else if(clientStatus.equalsIgnoreCase("5")){
						sql3+=" and (bk.rostatus!=0 or bk.lostatus!=0) and bk.pcase=2";
					}
					else if(clientStatus.equalsIgnoreCase("6")){
						sql3+="  and (bk.rostatus=0 or bk.lostatus=0) and bk.pcase=2";
					}
					else if(clientStatus.equalsIgnoreCase("7")){
						sql3+=" and bk.pcase=3";
					}
	    		}
					
				sql = "select a.name 'Account Name',bk.contactPerson 'Contact Person',if(bk.per_mob is null,bk.com_mob,bk.per_mob) 'Mobile No',a.advance 'Advance',a.balance 'Balance',a.unapplied 'Unapplied',a.netamount 'Total',a.level1 'Level 1[0-30]',a.level2 'Level 2[31-60]',a.level3 'Level 3[61-90]',\r\n" +
					" a.level4 'Level 4[91-120]',a.level5 'Level 5[>121]',s.sal_name 'Sales Person',CONVERT(coalesce(bv.fdate,''),CHAR(100)) 'Follow-Up Date' from ( select ag.name,ag.acno,ag.brhid,ag.doc_no,CONVERT(if(sum(t7+u6)<0,round((sum(t7+u6)*-1),2),''),CHAR(50)) advance,\r\n" + 
					" CONVERT(if(sum(u6<0),round((sum(u6*-1)),2),''),CHAR(50)) unapplied,CONVERT(if(sum(t7+u6)>0,round((sum(t7+u6)),2),''),CHAR(50)) balance,CONVERT(if(sum(t7)>0,round((sum(t7)),2),''),CHAR(50)) netamount,CONVERT(if(sum(l1)>0,round((sum(l1)),2),''),CHAR(50)) level1,\r\n" + 
					" CONVERT(if(sum(l2)>0,round((sum(l2)),2),''),CHAR(50)) level2,CONVERT(if(sum(l3)>0,round((sum(l3)),2),''),CHAR(50)) level3,CONVERT(if(sum(l4)>0,round((sum(l4)),2),''),CHAR(50)) level4,CONVERT(if(sum(l5)>0,round((sum(l5)),2),''),CHAR(50)) level5 from (\r\n" +
					" select d.name,d.acno,d.brhid,d.doc_no,if(d.duedys between 0 and 30 and d.bal>0,round((d.bal),2),0) l1,if(d.duedys between 31 and 60 and d.bal>0,round((d.bal),2),0) l2,if(d.duedys between 61 and 90 and d.bal>0,round((d.bal),2),0) l3,if(d.duedys between 91 and 120 and d.bal>0,\r\n" +
					" round((d.bal),2),0) l4,if(d.duedys >=121 and d.bal>0,round((d.bal),2),0) l5,CONVERT(if(d.bal<0,round((d.bal),2),''),CHAR(50)) U6,if(d.bal>0,d.bal,0) t7 from (select j.acno,j.brhid,h.description name,sum(dramount-out_amount) bal,j.tranid, j.doc_no,\n\r" +
					" TIMESTAMPDIFF(Day,cast(j.date as datetime),cast('"+sqlUpToDate+"' as datetime)) duedys from my_jvtran j inner join my_head h on j.acno=h.doc_no where j.status=3 and h.atype='AR' and j.yrid=0 and j.date<='"+sqlUpToDate+"' "+sql+" group by tranid having bal<>0) d) ag group by acno"+sql1+") a\r\n" + 
					" left join my_acbook bk on a.acno=bk.acno and bk.status=3 left join my_salm s on bk.sal_id=s.doc_no left join (select max(doc_no) doc_no,rdocno from gl_bcpf group by rdocno) sub on(sub.rdocno=bk.doc_no) left join gl_bcpf bv on sub.doc_no = bv.doc_no where 1=1"+sql2+""+sql3+"";
					
				ResultSet resultSet = stmtCRM.executeQuery(sql);
				RESULTDATA=ClsCommon.convertToEXCEL(resultSet);
				
				}
				
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
	
	public JSONArray paymentFollowUpDetailGrid(String cldocno) throws SQLException {
        JSONArray RESULTDATA=new JSONArray();
        
        Connection conn = null;
        
		try {
				conn = ClsConnection.getMyConnection();
				Statement stmtCRM = conn.createStatement();
				
				String sql = "select m.date detdate,m.remarks remk,m.fdate,u.user_id user from gl_bcpf m inner join my_user u on u.doc_no=m.userid where m.rdocno="+cldocno+" "
						+ "and m.bibpid=22 and m.status=3 group by m.doc_no order by m.fdate desc";
				
				ResultSet resultSet = stmtCRM.executeQuery(sql);

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
	
	public  ClsPaymentFollowUpBean getPrint(HttpServletRequest request,String atype,int acno,String branch,String uptodate,int level1from,int level1to,int level2from,
			int level2to,int level3from,int level3to,int level4from,int level4to,int level5from) throws SQLException {
			
		ClsPaymentFollowUpBean bean = new ClsPaymentFollowUpBean();

		Connection conn = null;
		
        java.sql.Date sqlUpToDate = null;
        
	try {
		conn = ClsConnection.getMyConnection();
		Statement stmtClient = conn.createStatement();
		String sql = "",sqld="",sqld1="",condition="",joins="",casestatement="";
		
		if(!(uptodate.equalsIgnoreCase("undefined")) && !(uptodate.equalsIgnoreCase("")) && !(uptodate.equalsIgnoreCase("0"))){
        	sqlUpToDate = ClsCommon.changeStringtoSqlDate(uptodate);
        }
		
		if(atype.equalsIgnoreCase("AR")){
			condition=" and bk.dtype='CRM'";
			sqld=" and j.dramount < 0";
			sqld1=" and j.dramount > 0";
		}
		else if(atype.equalsIgnoreCase("AP")){
			condition=" and bk.dtype='VND'";
			sqld=" and j.dramount > 0";
			sqld1=" and j.dramount < 0";
		}
		
		sql="select 'Outstanding Statement' vouchername,(DATE_FORMAT('"+sqlUpToDate+"','%D %M  %Y ')) vouchername1,bk.address accountaddress,bk.per_mob accountmob,"
			+ "j.acno,t.account,t.description,c.company,c.address,c.tel,c.fax,b.branchname,b.pbno,b.stcno,b.cstno,l.loc_name location,cd.code from my_acbook bk left join "
			+ "my_jvtran j on  bk.acno=j.acno  left join my_head t on j.acno=t.doc_no left join my_brch b on j.brhid=b.doc_no left join my_locm l "
			+ "on l.brhid=b.doc_no left join my_comp c on b.cmpid=c.doc_no left join my_curr cd on cd.doc_no=j.curId where j.acno="+acno+" and j.yrid=0 and j.status=3 group by acno";
		
		ResultSet resultSet = stmtClient.executeQuery(sql);
		
		while(resultSet.next()){
			bean.setLblcompname(resultSet.getString("company"));
			bean.setLblcompaddress(resultSet.getString("address"));
			bean.setLblprintname(resultSet.getString("vouchername"));
			bean.setLblprintname1(resultSet.getString("vouchername1"));
			bean.setLblcomptel(resultSet.getString("tel"));
			bean.setLblcompfax(resultSet.getString("fax"));
			bean.setLblbranch(resultSet.getString("branchname"));
			bean.setLbllocation(resultSet.getString("location"));
			bean.setLblcstno(resultSet.getString("cstno"));
			bean.setLblpan(resultSet.getString("pbno"));
			bean.setLblservicetax(resultSet.getString("stcno"));
			
			bean.setLblaccountname(resultSet.getString("description"));
			bean.setLblaccountaddress(resultSet.getString("accountaddress"));
			bean.setLblaccountmobileno(resultSet.getString("accountmob"));
			bean.setLblcurrencycode(resultSet.getString("code"));
		}
		
		String sql1 = "";
		
		if(!((branch.equalsIgnoreCase("a")) || (branch.equalsIgnoreCase("NA")))){
			sql1+=" and j.brhId="+branch+"";
		}
		
		/*sql1 = "select if(d.bal>0,round(d.bal,2),'  ') netamount,if(d.duedys between 0 and 30 and d.bal>0,round((d.bal),2),'  ') level1,if(d.duedys between 31 and 60 and d.bal>0,round((d.bal),2),'  ') level2,"
				+ "if(d.duedys between 61 and 90 and d.bal>0,round((d.bal),2),'  ') level3,if(d.duedys between 91 and 120 and d.bal>0,round((d.bal),2),'  ') level4,if(d.duedys > 121 and d.bal>0,round((d.bal),2),'  ') level5 "
				+ "from (select j.doc_no,j.ref_detail,j.description,DATE_FORMAT((j.date),'%d-%m-%Y') date,j.dtype,round((sum(j.dramount)),2) totalamount,round((sum(j.out_amount)),2) totalapplied,round((sum(j.dramount-j.out_amount)),2) bal,"
				+ "bk.refname name,bk.per_mob pmob,TIMESTAMPDIFF(Day,cast(j.date as datetime),cast('"+sqlUpToDate+"' as datetime)) duedys from my_jvtran j inner join my_brch b on j.brhId=b.doc_no inner join my_curr bc on "
				+ "b.curId=bc.doc_no inner join my_head h on j.acno=h.doc_no inner join my_curr c on j.curId=c.doc_no left join my_acbook bk on h.cldocno=bk.cldocno and bk.dtype='CRM' where h.atype='AR' and j.date<='"+sqlUpToDate+"' "
				+ "and j.acno="+acno+" and (j.dramount-j.out_amount)!=0) d order by date";*/
		
		sql1 = "select CONVERT(if(sum(t7)>0,round((sum(t7)),2),'  '),CHAR(50)) netamount,CONVERT(if(sum(l1)>0,round((sum(l1)),2),'  '),CHAR(50)) level1,CONVERT(if(sum(l2)>0,round((sum(l2)),2),'  '),CHAR(50)) level2,\r\n" + 
		 		" CONVERT(if(sum(l3)>0,round((sum(l3)),2),'  '),CHAR(50)) level3,CONVERT(if(sum(l4)>0,round((sum(l4)),2),'  '),CHAR(50)) level4,CONVERT(if(sum(l5)>0,round((sum(l5)),2),'  '),CHAR(50)) level5 from\r\n" + 
		 		" (select d.name,d.acno,d.brhid,d.doc_no,if(d.duedys between "+level1from+" and "+level1to+" and d.bal>0,round((d.bal),2),0) l1,\r\n" + 
		 		" if(d.duedys between "+level2from+" and "+level2to+" and d.bal>0,round((d.bal),2),0) l2,if(d.duedys between "+level3from+" and "+level3to+" and d.bal>0,round((d.bal),2),0) l3,\r\n" + 
		 		" if(d.duedys between "+level4from+" and "+level4to+" and d.bal>0,round((d.bal),2),0) l4,if(d.duedys >= "+level5from+" and d.bal>0,round((d.bal),2),0) l5,\r\n" + 
		 		" CONVERT(if(d.bal<0,round((d.bal),2),''),CHAR(50)) U6,if(d.bal>0,d.bal,0) t7 from (select j.acno,j.brhid,h.description name,sum(dramount-out_amount) bal,\r\n" + 
		 		" j.tranid, j.doc_no,TIMESTAMPDIFF(Day,cast(j.date as datetime),cast('"+sqlUpToDate+"' as datetime)) duedys from my_jvtran j inner join my_head h on j.acno=h.doc_no\r\n" + 
		 		" where j.status=3 and h.atype='"+atype+"' and j.acno="+acno+" and j.yrid=0 and j.date<='"+sqlUpToDate+"' group by tranid having bal<>0) d) ag group by acno";
		 
		ResultSet resultSet1 = stmtClient.executeQuery(sql1);
		
		ArrayList<String> printarray= new ArrayList<String>();
		
		while(resultSet1.next()){
			if(!(resultSet1.getString("netamount").equalsIgnoreCase("  "))){
				bean.setThirdarray(3);
			}
			String temp="";
			temp=resultSet1.getString("netamount")+"::"+resultSet1.getString("level1")+"::"+resultSet1.getString("level2")+"::"+resultSet1.getString("level3")+"::"+resultSet1.getString("level4")+"::"+resultSet1.getString("level5");
		    printarray.add(temp);
		}
		
		request.setAttribute("printingarray", printarray);
		
		joins=ClsCommon.getFinanceVocTablesJoins(conn);
		casestatement=ClsCommon.getFinanceVocTablesCase(conn);
		
		String sql2 = "";
		
		/*sql2="select if(j.dtype in ('�NV','INS','INT'),m.voc_no,j.doc_no) doc_no,j.ref_detail,j.description,DATE_FORMAT((j.date),'%d-%m-%Y') date,j.dtype,round(j.dramount,2) netamount,round(j.out_amount,2) applied,round((j.dramount-j.out_amount),2) balance,"
				+ "bk.refname name,bk.per_mob pmob,TIMESTAMPDIFF(Day,cast(j.date as datetime),cast('"+sqlUpToDate+"' as datetime)) duedys from my_jvtran j inner join "
				+ "my_brch b on j.brhId=b.doc_no inner join my_curr bc on b.curId=bc.doc_no inner join my_head h on j.acno=h.doc_no inner join my_curr c on j.curId=c.doc_no left join "
				+ "my_acbook bk on h.cldocno=bk.cldocno"+condition+" left join gl_invm m on m.dtype=j.dtype and j.doc_no=m.doc_no where h.atype='"+atype+"' and  j.status=3 and j.date<='"+sqlUpToDate+"' and j.acno="+acno+""+sqld+" and (j.dramount-j.out_amount)!=0 order by j.date";*/
				
		sql2="select "+casestatement+"a.* from (select j.doc_no transNo,j.ref_detail,j.description,DATE_FORMAT((j.date),'%d-%m-%Y') date,j.dtype transType,"
				+ "round(j.dramount*j.id,2) netamount,round(j.out_amount*j.id,2) applied,round((j.dramount-j.out_amount)*j.id,2) balance,b.branchname,bk.refname name,bk.per_mob pmob,"
				+ "TIMESTAMPDIFF(Day,cast(j.date as datetime),cast('"+sqlUpToDate+"' as datetime)) duedys from my_jvtran j inner join my_brch b on j.brhId=b.doc_no "
				+ "inner join my_curr bc on b.curId=bc.doc_no inner join my_head h on j.acno=h.doc_no inner join my_curr c on j.curId=c.doc_no left join my_acbook bk "
				+ "on h.cldocno=bk.cldocno"+condition+" where h.atype='"+atype+"' and j.date<='"+sqlUpToDate+"' and j.acno="+acno+""+sqld+" and (j.dramount-j.out_amount)!=0 and j.status=3  and j.yrid=0 "
				+ "order by j.date) a"+joins+"";
		
		ResultSet resultSet2 = stmtClient.executeQuery(sql2);
		
		ArrayList<String> printunappliedarray= new ArrayList<String>();
		
		while(resultSet2.next()){
			bean.setFirstarray(1);
			String temp1="";
			temp1=resultSet2.getString("date")+"::"+resultSet2.getString("transtype")+"::"+resultSet2.getString("transno")+"::"+resultSet2.getString("ref_detail")+"::"+resultSet2.getString("branchname")+"::"+resultSet2.getString("description")+"::"+resultSet2.getString("netamount")+"::"+resultSet2.getString("applied")+"::"+resultSet2.getString("balance")+"::"+resultSet2.getString("duedys");
			printunappliedarray.add(temp1);
		}
		request.setAttribute("printunapplyarray", printunappliedarray);
		
		String sql3 = "";
		
		/*sql3="select if(j.dtype in ('�NV','INS','INT'),m.voc_no,j.doc_no) doc_no,j.ref_detail,j.description,DATE_FORMAT((j.date),'%d-%m-%Y') date,j.dtype,round(j.dramount,2) netamount,round(j.out_amount,2) applied,round((j.dramount-j.out_amount),2) balance,"
				+ "bk.refname name,bk.per_mob pmob,TIMESTAMPDIFF(Day,cast(j.date as datetime),cast('"+sqlUpToDate+"' as datetime)) duedys from my_jvtran j inner join "
				+ "my_brch b on j.brhId=b.doc_no inner join my_curr bc on b.curId=bc.doc_no inner join my_head h on j.acno=h.doc_no inner join my_curr c on j.curId=c.doc_no left join "
				+ "my_acbook bk on h.cldocno=bk.cldocno"+condition+" left join gl_invm m on m.dtype=j.dtype and j.doc_no=m.doc_no where h.atype='"+atype+"' and j.status=3 and j.date<='"+sqlUpToDate+"' and j.acno="+acno+""+sqld1+" and (j.dramount-j.out_amount)!=0 order by j.date";*/
		
		sql3="select "+casestatement+"a.* from (select j.doc_no transNo,j.ref_detail,j.description,DATE_FORMAT((j.date),'%d-%m-%Y') date,j.dtype transType,"
				+ "round(j.dramount*j.id,2) netamount,round(j.out_amount*j.id,2) applied,round((j.dramount-j.out_amount)*j.id,2) balance,b.branchname,bk.refname name,bk.per_mob pmob,"
				+ "TIMESTAMPDIFF(Day,cast(j.date as datetime),cast('"+sqlUpToDate+"' as datetime)) duedys from my_jvtran j inner join my_brch b on j.brhId=b.doc_no "
				+ "inner join my_curr bc on b.curId=bc.doc_no inner join my_head h on j.acno=h.doc_no inner join my_curr c on j.curId=c.doc_no left join my_acbook bk "
				+ "on h.cldocno=bk.cldocno"+condition+" where h.atype='"+atype+"' and j.date<='"+sqlUpToDate+"' and j.acno="+acno+""+sqld1+" and (j.dramount-j.out_amount)!=0 and j.status=3  and j.yrid=0 "
				+ "order by j.date) a"+joins+"";
		
		ResultSet resultSet3 = stmtClient.executeQuery(sql3);
		
		ArrayList<String> printoutstandingarray= new ArrayList<String>();
		
		while(resultSet3.next()){
			bean.setSecarray(2);
			String temp2="";
			temp2=resultSet3.getString("date")+"::"+resultSet3.getString("transtype")+"::"+resultSet3.getString("transno")+"::"+resultSet3.getString("ref_detail")+"::"+resultSet3.getString("branchname")+"::"+resultSet3.getString("description")+"::"+resultSet3.getString("netamount")+"::"+resultSet3.getString("applied")+"::"+resultSet3.getString("balance")+"::"+resultSet3.getString("duedys");
			printoutstandingarray.add(temp2);
		}
		request.setAttribute("printoutstandingsarray", printoutstandingarray);
		
		String sql4 = "";
		
		sql4="select a.totalunappliedamount*a.id totalunappliedamount,a.totalapplied*a.id totalapplied,a.unappliedbalance*a.id unappliedbalance,b.totaloutamount*b.id totaloutamount,"
		  + "b.totaloutapplied*b.id totaloutapplied,(b.outstandingbalance*b.id) outstandingbalance,(b.outstandingbalance+a.unappliedbalance) nettotal from ((select j.id,"
		  + "round((sum(j.dramount)),2) totalunappliedamount,round((sum(j.out_amount)),2) totalapplied,round((sum(j.dramount-j.out_amount)),2) unappliedbalance from my_jvtran j where "
		  + "j.status=3 and j.date<='"+sqlUpToDate+"' and j.acno="+acno+""+sqld+" and (j.dramount-j.out_amount)!=0  and j.yrid=0 order by j.date) a,(select j.id,round((sum(j.dramount)),2) totaloutamount,"
		  + "round((sum(j.out_amount)),2) totaloutapplied,round((sum(j.dramount-j.out_amount)),2) outstandingbalance from my_jvtran j where j.status=3 and j.date<='"+sqlUpToDate+"' and "
		  + "j.acno="+acno+""+sqld1+" and (j.dramount-j.out_amount)!=0  and j.yrid=0 order by j.date) b)";
		
		ResultSet resultSet4 = stmtClient.executeQuery(sql4);
		
		while(resultSet4.next()){
			bean.setLblsumnetamount(resultSet4.getString("totalunappliedamount"));
			bean.setLblsumapplied(resultSet4.getString("totalapplied"));
			bean.setLblsumbalance(resultSet4.getString("unappliedbalance"));
			
			bean.setLblsumoutnetamount(resultSet4.getString("totaloutamount"));
			bean.setLblsumoutapplied(resultSet4.getString("totaloutapplied"));
			bean.setLblsumoutbalance(resultSet4.getString("outstandingbalance"));
			
			bean.setLblnetamount(resultSet4.getString("nettotal"));
		}
		
		String sql5 = "";
		
		if(!((branch.equalsIgnoreCase("a")) || (branch.equalsIgnoreCase("NA")))){
			sql5+=" and j.brhId="+branch+"";
		}
		
		sql5 = "select DATE_FORMAT((j.date),'%d-%m-%Y') date,j.dtype,j.doc_no,CONVERT(if(j.rtype='0','',if(rtype='RAG',concat(rtype,' - ',r.voc_no),concat(rtype,' - ',l.voc_no))),CHAR(50)) aggvocno,"  
			 + "j.description,CONVERT(if(secamount1<0,round(secamount1*-1,2),' '),CHAR(100)) securityamount,coalesce(round(@i:=@i+secamount1,2),0) netsecurityamount,b.branchname from  ( "  
			 + "select sum(secamount) secamount1,a.* from ( select date,dtype,doc_no,sum(dramount) as secamount,rdocno,rtype,brhid,description  from my_jvtran where acno=(select t.doc_no from my_account ac "
			 + "inner join my_head t on ac.acno=t.doc_no where ac.codeno='RSECURITY') and status=3 and rdocno is not null group by rdocno,rtype) a group by rdocno,rtype) j left join gl_ragmt r on j.rdocno=r.doc_no "
			 + "and j.rtype='RAG' left join gl_lagmt l on j.rdocno=l.doc_no and j.rtype='LAG' left join my_acbook c on (c.doc_no=r.cldocno or c.doc_no=l.cldocno) and c.dtype='CRM' left join my_brch b on b.doc_no=j.brhid,(select @i:=0) as i "  
			 + "where secamount!=0 and j.date<='"+sqlUpToDate+"' and c.acno="+acno+""+sql5+" order by rdocno,rtype";  
			
		ResultSet resultSet5 = stmtClient.executeQuery(sql5);
		
		ArrayList<String> printsecurityarray= new ArrayList<String>();
		Double netsecurityamount=0.00;
		while(resultSet5.next()){
			bean.setFourtharray(4);
			String temp3="";
			netsecurityamount=netsecurityamount+resultSet5.getDouble("securityamount");

			temp3=resultSet5.getString("date")+"::"+resultSet5.getString("dtype")+"::"+resultSet5.getString("doc_no")+"::"+resultSet5.getString("branchname")+"::"+resultSet5.getString("aggvocno")+"::"+resultSet5.getString("description")+"::"+resultSet5.getString("securityamount");
			printsecurityarray.add(temp3);
		}
		request.setAttribute("printsecurityamountarray", printsecurityarray);
		
		netsecurityamount = ClsCommon.Round(netsecurityamount, 2);
		bean.setLblnetsecurityamount(String.valueOf(netsecurityamount));
		
		stmtClient.close();
		conn.close();
	} catch(Exception e){
		e.printStackTrace();
		conn.close();
	} finally{
		conn.close();
	}
	return bean;
  }
}
