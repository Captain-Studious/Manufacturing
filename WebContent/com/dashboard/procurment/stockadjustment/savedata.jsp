  <%@page import="java.util.ArrayList"%>
<%@page import="java.sql.*"%>
<%@page import="javax.sql.*"%>
<%@page import="com.connection.*" %>
<%@page import="net.sf.json.JSONArray"%>
<%@page import="net.sf.json.JSONObject"%>
<%@page import="java.util.*"%>
<%@page import="javax.servlet.http.HttpServletRequest" %>
<%@page import="javax.servlet.http.HttpSession" %>
<%@page import="com.common.*"%>
<%@ page import="java.sql.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
 
<%
	ClsConnection ClsConnection=new ClsConnection();
ClsCommon ClsCommon =new ClsCommon();
	String list=request.getParameter("list")==null?"0":request.getParameter("list");
	String psrno=request.getParameter("doc_no")==null?"0":request.getParameter("doc_no");
	ArrayList<String> proday= new ArrayList<String>();
	String aa[]=list.split(",");
		for(int i=0;i<aa.length;i++){
			 String bb[]=aa[i].split("::");
			 String temp="";
			 for(int j=0;j<bb.length;j++){ 
				 temp=temp+bb[j]+"::";
			}
			 proday.add(temp);
		  } 
	  Connection conn=null;
	    String sql="";
	    try
	    {
	    conn = ClsConnection.getMyConnection();
	    conn.setAutoCommit(false);
		Statement stmt = conn.createStatement();
	 
		Statement stmt1 = conn.createStatement();
		ArrayList<String> masterarray= new ArrayList<String>();
		
		
		 int val=0;
		int aa1=0;
			for(int k=0;k<proday.size();k++)
			{
				String[] prod=((String) proday.get(k)).split("::"); 
				String stockid=""+(prod[0].trim().equalsIgnoreCase("undefined") || prod[0].trim().equalsIgnoreCase("NaN")|| prod[0].trim().equalsIgnoreCase("")|| prod[0].isEmpty()?0:prod[0].trim())+"";
				String aqtys=""+(prod[1].trim().equalsIgnoreCase("undefined") || prod[1].trim().equalsIgnoreCase("NaN")|| prod[1].trim().equalsIgnoreCase("")|| prod[1].isEmpty()?0:prod[1].trim())+"";
			    double aqty=Double.parseDouble(aqtys);
				String abatchno=""+(prod[2].trim().equalsIgnoreCase("undefined") || prod[2].trim().equalsIgnoreCase("NaN")|| prod[2].trim().equalsIgnoreCase("")|| prod[2].isEmpty()?0:prod[2].trim())+"";
				String aexpdate1=""+(prod[3].trim().equalsIgnoreCase("undefined") || prod[3].trim().equalsIgnoreCase("NaN")|| prod[3].trim().equalsIgnoreCase("")|| prod[3].isEmpty()?0:prod[3].trim())+"";
				 
				java.sql.Date aexpdate=ClsCommon.changeStringtoSqlDate(aexpdate1);
				
				int locid=1;
				int brhid=1;
				double unit_price=0;
				double cost_price=0;
				int specno=0;
				int unitid=0;
				java.sql.Date masterDate=null;
				int fr=1;
			 
				
				String sqlselect="select fr,curdate() date,locid,brhid,unit_price,cost_price,specno,unitid from my_prddin where stockid="+stockid+"  and psrno="+psrno+"  ";
				ResultSet rsss=stmt1.executeQuery(sqlselect);
				if(rsss.next())
				{
					locid=rsss.getInt("locid");
					brhid=rsss.getInt("brhid");
					unit_price=rsss.getDouble("unit_price");
					cost_price=rsss.getDouble("cost_price");
					specno=rsss.getInt("specno");
					masterDate=rsss.getDate("date");
					unitid=rsss.getInt("unitid");
					fr=rsss.getInt("fr");
					
				}
			
						
				CallableStatement stmt11 = conn.prepareCall("{CALL tr_physicalStockAdjustmentDML(?,?,?,?,?,?,?,?,?,?,?,?)}");
				stmt11.registerOutParameter(10, java.sql.Types.VARCHAR);
				stmt11.registerOutParameter(11, java.sql.Types.VARCHAR);
				stmt11.registerOutParameter(12, java.sql.Types.VARCHAR);
				stmt11.setDate(1,masterDate);
				stmt11.setString(2,"Stock Adjustment");
				stmt11.setString(3,"A");
				stmt11.setString(4,"PHK");
				stmt11.setString(5,session.getAttribute("USERID").toString());
				stmt11.setString(6,""+brhid);
				stmt11.setString(7,"1");
				stmt11.setInt(8,brhid);
				stmt11.setInt(9,locid);
				val = stmt11.executeUpdate();
				if(fr==0){fr=1;}
				if(val>0)
				{
				
						int deldocno=stmt11.getInt("deldocno");
						int vocno=stmt11.getInt("vdocNo");
						int trno=stmt11.getInt("strno");
						String sqls1="update my_prddin set out_qty=out_qty+"+aqty+" where stockid="+stockid+" and psrno="+psrno+"  ";
						stmt.executeUpdate(sqls1);
						int newstockids=0;	
						Statement selstmt=conn.createStatement();
					    String sqlssel="select coalesce((max(stockid)+1),1) stockid from my_prddin  ";
					    ResultSet selrss=selstmt.executeQuery(sqlssel);
					     if(selrss.next())
					     {
					    	 newstockids=selrss.getInt("stockid") ;
					     }
				        String sql2="insert into my_prddin(sr_no,stockid, psrno,prdid,specno,unit_price,op_qty,locid,brhid,tr_no,dtype,cost_price,date,batch_no,exp_date,unitid,fr)values"
				    		 + "("+(k+1)+","+newstockids+","
				    			 + "'"+psrno+"',"
				    			 + "'"+psrno+"',"
				    		     + "'"+specno+"',"
				                 + "'"+cost_price+"',"
						         +"'"+aqty+"',"
				                 +"'"+locid+"','"+brhid+"','"+trno+"','PHK',"+cost_price+",'"+masterDate+"','"+abatchno+"','"+aexpdate+"','"+unitid+"',"+fr+")";
				       stmt.executeUpdate(sql2);
						String sqlsss="insert into my_phkd(tr_No,sr_no,rdocno,oldstockid,specno, psrno, prdId,unitid,adj_qty,adj_batchno,adj_expdate,locid,stockid)VALUES"
							+ " ("+trno+","+(k+1)+",'"+deldocno+"',"
							+ "'"+stockid+"',"
							+ "'"+specno+"',"
							+ "'"+psrno+"',"
							+ "'"+psrno+"',"
							+ "'"+unitid+"',"
							+ "'"+aqty+"',"
							+ "'"+abatchno+"',"
							+ "'"+aexpdate+"',"
							+ "'"+locid+"',"+newstockids+")";

				        stmt.executeUpdate (sqlsss);
						String prodoutsql="insert into my_prddout(sr_no,TR_NO, dtype, rdocno,stockid,date, specid, psrno,qty,prdid,brhid,locid,unit_price,cost_price) Values"
							+ " ("+(k+1)+",'"+trno+"','PHK',"+deldocno+","
							+ "'"+stockid+"',"
							+ " '"+masterDate+"' ,"
							+ "'"+specno+"',"
							+ "'"+psrno+"',"
							+ "'"+aqty+"',"
							+ "'"+psrno+"',"
							+"'"+brhid+"','"+locid+"',"+cost_price+",'"+cost_price+"')";
						aa1=stmt.executeUpdate(prodoutsql);
				  		
					 
				
				}
				
				 
			}// for
		
			if(val>0 && aa1>0)
            {
           	 response.getWriter().print(1);
				 conn.commit();
            }else
            {
            	 response.getWriter().print(0);
            	
            }
				
				
				 
				 
				 
				conn.close();
	    }
	    catch(Exception e)
	    {
	    	e.printStackTrace();
	    	conn.close();
	    	response.getWriter().print(0);
	    }
	 	
	 	
%>



 