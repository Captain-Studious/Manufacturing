package com.dashboard.audit.costupdate;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import net.sf.json.JSONArray;

import com.common.ClsCommon;
import com.connection.ClsConnection;


public class ClsCostupdateDAO {
	ClsConnection ClsConnection=new ClsConnection();

	ClsCommon ClsCommon=new ClsCommon();

	public JSONArray getCosttran(String branch,String fromdate,String todate,String id) throws SQLException {
	  String strSql="";
	    JSONArray RESULTDATA=new JSONArray();
	    if(!id.equalsIgnoreCase("1")){
			return RESULTDATA;
		}   
	    Connection  conn = null;
		java.sql.Date sqlfromdate=null,sqltodate=null;
           try {
			if(!fromdate.equalsIgnoreCase("")){
				sqlfromdate=ClsCommon.changeStringtoSqlDate(fromdate);
			}
			if(!todate.equalsIgnoreCase("")){
				sqltodate=ClsCommon.changeStringtoSqlDate(todate);
			}
			
			conn=ClsConnection.getMyConnection();
				Statement stmtmanual = conn.createStatement ();
				/*strSql="select sum(a.jvamt)+sum(coalesce(b.costtranamt,0)) from (select h.description,h.doc_no,tranid,sum(dramount) jvamt,j.dtype from my_head h ,my_jvtran j where gr_type in (4,5) and"+
						" h.doc_no=j.acno and j.date between '"+sqlfromdate+"' and  '"+sqltodate+"' group by j.tr_no) a inner join"+
						" (select sum(amount) costtranamt,tr_no,acno,tranid from my_costtran group  by tr_no) b on a.tranid=b.tranid where  b.costtranamt!=a.jvamt";*/
				/*strSql="select a.tr_no,a.doc_no,a.acno,a.description,a.dtype,a.jvamt,coalesce(b.costtranamt,0) costtranamt,coalesce(coalesce(a.jvamt,0)-coalesce(b.costtranamt,0),0) difference from"+
						" (select h.description,j.acno,j.doc_no,j.tr_no,tranid,dramount jvamt,j.dtype from my_head h ,my_jvtran j where gr_type in (4,5) and"+
						" h.doc_no=j.acno and j.date between '"+sqlfromdate+"' and  '"+sqltodate+"' ) a left join"+
						" (select sum(amount) costtranamt,acno,tranid from my_costtran group  by tranid ) b on a.tranid=b.tranid where  "+
						" coalesce(b.costtranamt,0)!=a.jvamt group by tr_no,acno";
*/
				strSql="select a.tr_no,a.doc_no,a.acno,a.description,a.dtype,a.jvamt,coalesce(b.costtranamt,0) costtranamt,"+
						" coalesce(coalesce(a.jvamt,0)-coalesce(b.costtranamt,0),0) difference from ("+
						" select h.description,j.acno,j.doc_no,j.tr_no, tranid,sum(if(dramount<0,dramount*-1,dramount)) jvamt,j.dtype from my_head h ,"+
						" my_jvtran j where gr_type in (4,5) and h.doc_no=j.acno and j.date between '"+sqlfromdate+"' and  '"+sqltodate+"' group by tr_no) a"+
						" left join (select sum(if(amount<0,amount*-1,amount)) costtranamt,acno,tr_no from my_costtran cost group  by tr_no ) b"+
						" on a.tr_no=b.tr_no where   round(coalesce(b.costtranamt,0),2)!=round(a.jvamt,2) group by tr_no";
//				System.out.println("Load Sql:"+strSql);
				ResultSet resultSet = stmtmanual.executeQuery (strSql);
				RESULTDATA=ClsCommon.convertToJSON(resultSet);
				stmtmanual.close();
				conn.close();
		}
		catch(Exception e){
			e.printStackTrace();
			conn.close();
		}
		finally{
			conn.close();
		}
		//System.out.println("RESULTDATA=========>"+RESULTDATA);
	    return RESULTDATA;
	}

	public int insert(String hidtrno) throws SQLException {
		// TODO Auto-generated method stub
		Connection conn=null;
		try{
			conn=ClsConnection.getMyConnection();
			
			String trno[]= hidtrno.split(",");
			//System.out.println("===trno==="+trno.length);
			java.sql.Date fromdate=null,todate=null;
			int agmtno=0;
			String agmttype="";
			int srno=0;
			int z=0;
			int costentry=0;
			double temptimediff=0.0;
			String dtype="";
			String strgetfleet="";
			int mrufleet=0;
			
			ArrayList<String> costmovarray=new ArrayList<String>();
			ArrayList<String> tranarray=new ArrayList<String>();
			ArrayList<String> vsiarray=new ArrayList<>();
			ArrayList<String> otherarray=new ArrayList<>();
			for(int i=0;i<trno.length;i++){
				//System.out.println("Inside");
				conn.setAutoCommit(false);
				Statement stmtdelete=conn.createStatement();
				Statement stmtgetdata=conn.createStatement();
				Statement stmtmruinsert=conn.createStatement();
				//Getting dtype of corresponding tr_no
				
				String strgetdtype="select dtype from my_jvtran where tr_no="+trno[i];
				ResultSet rsdtype=stmtgetdata.executeQuery(strgetdtype);
				if(rsdtype.next()){
					dtype=rsdtype.getString("dtype");
				}
				//System.out.println(dtype);
				//Getting agreement type,agreementno,fromdate,todate in case of invoice,salik,traffic,Credit Note
				int cnoagmtno=0;
				String cnoagmttype="";
				double cnoamount=0.0;
				if(dtype.equalsIgnoreCase("CNO")){
					
					String strgetagmtno="select rdocno,rtype from my_jvtran where tr_no="+trno[i];
					String strgetamount="select dramount from my_jvtran jv inner join my_head head on (jv.acno =head.doc_no and head.gr_type in (4,5)) where jv.tr_no="+trno[i];
					ResultSet rsagmtno=stmtgetdata.executeQuery(strgetagmtno);
					while(rsagmtno.next()){
						cnoagmtno=rsagmtno.getInt("rdocno");
						cnoagmttype=rsagmtno.getString("rtype");
					}
					ResultSet rsgetamount=stmtgetdata.executeQuery(strgetamount);
					while(rsgetamount.next()){
						cnoamount=+rsgetamount.getDouble("dramount");
					}
				}
				if(dtype.equalsIgnoreCase("INV")||dtype.equalsIgnoreCase("INS")||dtype.equalsIgnoreCase("INT")|| dtype.equalsIgnoreCase("CNO")){
					String strgetdata="";
					if(dtype.equalsIgnoreCase("CNO")){
						strgetdata="select ratype,rano,fromdate,todate from gl_invm where tr_no=(select max(tr_no) from"+
								" (select tr_no,sum(invd.amount) amount from gl_invm inv inner join gl_invd invd on (inv.doc_no=invd.rdocno)where rano="+cnoagmtno+" and "+
								" ratype='"+cnoagmttype+"' and dtype='INV' group by inv.tr_no ) a where a.amount>="+cnoamount+")";
//						System.out.println(strgetdata);
					}
					else{
						strgetdata="select ratype,rano,fromdate,todate from gl_invm where tr_no="+trno[i];
					}
					ResultSet rsgetdata=stmtgetdata.executeQuery(strgetdata);
					while(rsgetdata.next()){
						agmttype=rsgetdata.getString("ratype");
						agmtno=rsgetdata.getInt("rano");
						fromdate=rsgetdata.getDate("fromdate");
						todate=rsgetdata.getDate("todate");
					}
					
				}
				
				
				
				//Getting tranid and account of corresponding tr_no
				z=0;
				
				String strgettran="select tranid,acno,round(dramount,2) dramount,head.gr_type from my_jvtran jv inner join my_head head on (jv.acno=head.doc_no and head.gr_type in(4,5)) where jv.tr_no="+trno[i];
				Statement stmttran=conn.createStatement();
				ResultSet rsgettran=stmttran.executeQuery(strgettran);
				while(rsgettran.next()){
					tranarray.add(rsgettran.getString("tranid")+"::"+rsgettran.getString("acno")+"::"+rsgettran.getString("dramount")+"::"+srno+1);
					//System.out.println(rsgettran.getInt("gr_type")+"::"+rsgettran.getString("acno"));
				}
				
				//Deleting costtran entries
				
				String strdelete="delete from my_costtran where tr_no="+trno[i];
				int deleteval=stmtdelete.executeUpdate(strdelete);
				
				if(deleteval>=0){
					
					
					//getting details about number of fleets in which the cost is about to distribute 
					if(dtype.equalsIgnoreCase("INV") || dtype.equalsIgnoreCase("INS") || dtype.equalsIgnoreCase("INT") || dtype.equalsIgnoreCase("CNO")){
						
					String strcostmov="select round(sum(if(aa.hourdiff<0,aa.hourdiff*-1,aa.hourdiff)),2) hourdiff,aa.fleet_no from( select (TIMESTAMPDIFF(second,dout ,din))/(60*60) hourdiff,fleet_no,kk.repno"+
							" from ( select repno,fleet_no,if(dout<'"+fromdate+"',cast(concat('"+fromdate+"',' ',tout) as datetime),cast(concat(dout,' ',tout) as"+
							" datetime)) dout,tout,if(din>'"+todate+"',cast(concat('"+todate+" ',tout) as datetime),cast(coalesce(concat(din,' ',tin),"+
							" '"+todate+" ',tout) as datetime)) din,tin from gl_vmove where rdocno="+agmtno+" and rdtype='"+agmttype+"'  and trancode<>'DL'  and"+
							" (dout between '"+fromdate+"' and '"+todate+"' or  coalesce(din,'"+todate+"') between '"+fromdate+"' and '"+todate+"')) kk)aa"+
							" group by aa.fleet_no";
//					System.out.println(strcostmov);
					Statement stmtcostmov=conn.createStatement();
					ResultSet rscostmov=stmtcostmov.executeQuery(strcostmov);
					int counter=0;
					while(rscostmov.next()){
						temptimediff+=rscostmov.getDouble("hourdiff");
							costmovarray.add(rscostmov.getString("hourdiff")+""+"::"+rscostmov.getString("fleet_no"));
							counter++;
							//System.out.println(costmovarray.get(counter));
							//System.out.println("counter: "+counter);
//							System.out.println(rscostmov.getString("hourdiff")+""+"::"+rscostmov.getString("fleet_no"));
					}
					Statement stmtcostinsert=conn.createStatement();
					//System.out.println("Chekc cost size: "+costmovarray.size());
					
					
					if(costmovarray.size()==0){
						int fleetno=0;
						String getmov="select fleet_no from gl_vmove where doc_no=(select max(doc_no) from gl_vmove where rdocno="+agmtno+" and rdtype='"+agmttype+"' and trancode<>'DL')";
						Statement stmtmov=conn.createStatement();
						ResultSet rsmov=stmtmov.executeQuery(getmov);
						while(rsmov.next()){
							fleetno=rsmov.getInt("fleet_no");
						}
						int y=0;
						for(int k=0;k<tranarray.size();k++){
							String strcostentry="select costentry from gl_invmode where acno="+tranarray.get(k).split("::")[1];
							ResultSet rscost=stmtgetdata.executeQuery(strcostentry);
							while(rscost.next()){
								costentry=rscost.getInt("costentry");
							}
							if(costentry==1){
								y++;
								String strcostinsert="insert into my_costtran(acno,costtype,amount,sr_no,tranid,projectid,jobid,tr_no)values('"+tranarray.get(k).split("::")[1]+"'"+
										",6,"+tranarray.get(k).split("::")[2]+","+y+","+tranarray.get(k).split("::")[0]+",0,"+fleetno+","+trno[i]+")";
								Statement costinsert=conn.createStatement();
								int costval=costinsert.executeUpdate(strcostinsert);
								if(costval<=0){
//									System.out.println("Cost Insert Error-Single Fleet Rare Case");
									return 0;
								}
								
							}
						}
					}
					
					for(int j=0,y=0;j<costmovarray.size();j++){
						
						//Getting costentry from gl_invmode corresponding to account-costentry-1 means insert otherwise not
						//System.out.println("======="+j);
						String strcostentry="select costentry from gl_invmode where acno="+tranarray.get(z).split("::")[1];
						ResultSet rscost=stmtgetdata.executeQuery(strcostentry);
						while(rscost.next()){
							costentry=rscost.getInt("costentry");
						}
						//System.out.println("CostEntry: "+costentry);
						if(costentry==1){
						if(counter==1){
							
						String costmov=costmovarray.get(j);
						String costmovamt=costmov.split("::")[0];
						String costmovfleet=costmov.split("::")[1];
						//Insert into costtran when there is only one fleet
					
						for(int c=0;c<tranarray.size();c++){
							y++;
							String strcostinsert="insert into my_costtran(acno,costtype,amount,sr_no,tranid,projectid,jobid,tr_no)values('"+tranarray.get(c).split("::")[1]+"'"+
									",6,"+tranarray.get(c).split("::")[2]+","+y+","+tranarray.get(c).split("::")[0]+",0,"+costmovfleet+","+trno[i]+")";
	
						
//						System.out.println("Single Fleet Insert Costtran Sql:"+strcostinsert);
						int costinsertval=stmtcostinsert.executeUpdate(strcostinsert);
						if(costinsertval<0){
							//conn.close();
//							System.out.println("Cost Insert Error");
							return 0;
						}
						}//Closing of tranarray
						}
						else if(counter>1){
							//Insert into costtran when there are multiple fleets
							String costmov=costmovarray.get(j);
							String costmovamt=costmov.split("::")[0];//hourdiff=amt
							
							String costmovfleet=costmov.split("::")[1];
							
							for(int c=0;c<tranarray.size();c++){
								double amt=(Double.parseDouble(costmovamt)/temptimediff)*Double.parseDouble(tranarray.get(c).split("::")[2]);
								/*ResultSet rstemp=stmtgetdata.executeQuery("select round("+amt+",2) amt");
								if(rstemp.next()){
									amt=rstemp.getDouble("amt");
								}*/
								
								y++;
							String strcostinsert="insert into my_costtran(acno,costtype,amount,sr_no,tranid,projectid,jobid,tr_no)values('"+tranarray.get(c).split("::")[1]+"'"+
									",6,"+amt+","+y+","+tranarray.get(c).split("::")[0]+",0,"+costmovfleet+","+trno[i]+")";
//							System.out.println("Multi Fleet Insert Costtran Sql:"+strcostinsert);
							
							int costinsertval=stmtcostinsert.executeUpdate(strcostinsert);
							if(costinsertval<0){
								//conn.close();
								System.out.println("Cost Insert Error2");
								return 0;
							}
							}

						}
					
					}
				
						
					}//Closing of Costmov loop
					
					}
					else{
						//Get fleet_no from my_jvtran
						int costcode=0;
						int costtype=0;
//						System.out.println("inside else");
						strgetfleet="select costcode,costtype from my_jvtran where tr_no="+trno[i];
						ResultSet rsgetfleet=stmtgetdata.executeQuery(strgetfleet);
						while(rsgetfleet.next()){
							costcode=rsgetfleet.getInt("costcode");
							costtype=rsgetfleet.getInt("costtype");
						}
						int temp=1;
						for(int a=0;a<tranarray.size();a++){
							//inserts data to my_costtran corresponding maintenance accounts
							String strcostinsert="insert into my_costtran(acno,costtype,amount,sr_no,tranid,projectid,jobid,tr_no)values('"+tranarray.get(a).split("::")[1]+"'"+
									","+costtype+","+tranarray.get(a).split("::")[2]+","+temp+","+tranarray.get(a).split("::")[0]+",0,"+costcode+","+trno[i]+")";
//							System.out.println("Insert MRU Costtran Sql:"+strcostinsert);
							temp++;
							Statement stmtins=conn.createStatement();
							int costinsertval=stmtins.executeUpdate(strcostinsert);
							if(costinsertval<=0){
								//conn.close(); 
//								System.out.println("Cost Insert Error");
								return 0;
							}	
							
						}
							
					}
					
				}
				vsiarray=new ArrayList<>();
			tranarray=new ArrayList<>();
			costmovarray=new ArrayList<>();
			otherarray=new ArrayList<>();
			temptimediff=0.0;
			conn.commit();
			}
			
			conn.close();
			return 1;
		}
		catch(Exception e){
			e.printStackTrace();
			conn.close();
		}
		finally{
			conn.close();
		}
		return 0;
	}
}
