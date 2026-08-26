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
String list=request.getParameter("list")==null?"0":request.getParameter("list");
 
  
ArrayList<String> pmgntarray= new ArrayList<String>();
String aa[]=list.split(",");
 
	 
for(int i=0;i<aa.length;i++){
	//System.out.println("----------"+aa[i]);
	 String bb[]=aa[i].split("::");
	  
	 String temp="";
	 for(int j=0;j<bb.length;j++){ 
		 
		// System.out.println("----------"+bb[j]);
		 temp=temp+bb[j]+"::";
		 
	}
	 pmgntarray.add(temp);
	 
} 
 
	  Connection conn=null;
	    String sql="";
	    try
	    {
	   	
	    conn = ClsConnection.getMyConnection();
		Statement stmt = conn.createStatement();
		conn.setAutoCommit(false);
		for(int k=0;k<pmgntarray.size();k++)
		{
		
 
		 
	 
			String[] pmgntarr=((String) pmgntarray.get(k)).split("::"); 
 
			String psrno=""+(pmgntarr[0].trim().equalsIgnoreCase("undefined") || pmgntarr[0].trim().equalsIgnoreCase("NaN")|| pmgntarr[0].trim().equalsIgnoreCase("")|| pmgntarr[0].isEmpty()?0:pmgntarr[0].trim())+"";
		
			String  rdocno=""+(pmgntarr[1].trim().equalsIgnoreCase("undefined") || pmgntarr[1].trim().equalsIgnoreCase("NaN")|| pmgntarr[1].trim().equalsIgnoreCase("")|| pmgntarr[1].isEmpty()?0:pmgntarr[1].trim())+"";
 
			
			String updatesqls1=" update my_joborderd set status=3  where psrno="+psrno+" and  rdocno="+rdocno+"    ";
			
		//	System.out.println("=====updatesqls1== 1====="+updatesqls1);
			
			stmt.executeUpdate(updatesqls1);
			
			Statement stmt1 = conn.createStatement();
			Statement stmt2 = conn.createStatement();
			
			int stockid=0;
			double qty=0;
			String sqls=" select qty,stockid,status from my_joborderd where status=3 and psrno="+psrno+" and  rdocno="+rdocno+"  ";
			
		//	System.out.println("=====sqls===2===="+sqls);
			ResultSet rss=stmt1.executeQuery(sqls);
 		
			while(rss.next())
			{
				stockid=rss.getInt("stockid");
				qty=rss.getDouble("qty");
				
			//	System.out.println("====stockid=="+stockid);
			//	System.out.println("=====qty==="+qty);
				
			String upsql="update my_prddin set rsv_qty=rsv_qty-"+qty+" where stockid="+stockid+" ";
			
			//System.out.println("=====upsql===3===="+upsql);
			
			stmt2.executeUpdate(upsql);
			
			String upsql1="update my_joborderd set out_qty=out_qty+"+qty+" where status=3 and  stockid="+stockid+"   and psrno="+psrno+" and  rdocno="+rdocno+"  ";
			//System.out.println("=====upsql===4===="+upsql1);
			
			stmt2.executeUpdate(upsql1);
			
			}
			
		 
		}
		      
    stmt.close();
	conn.commit();
	conn.close();
	 response.getWriter().print(1);
    	
    }
    catch(Exception e)
    {
    	e.printStackTrace();
    	
    	
    	conn.close();
    	 response.getWriter().print(2);
    }
	 	
	 	
	 	
%>



 