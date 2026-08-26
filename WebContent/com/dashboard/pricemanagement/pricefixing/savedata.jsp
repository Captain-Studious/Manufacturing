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
 
 
 
String pdocno=request.getParameter("psrno");
 
String mrp=request.getParameter("mrp")==null||request.getParameter("std_cost")==""?"0":request.getParameter("mrp");
String fixing=request.getParameter("fixing")==null||request.getParameter("fixing")==""?"0":request.getParameter("fixing");
String list=request.getParameter("list")==null||request.getParameter("list")==""?"0":request.getParameter("list");

 
	  Connection conn=null;
	    String sql="";
	    try
	    {
	   	
	    conn = ClsConnection.getMyConnection();
		Statement stmt = conn.createStatement();
 
			
			String updatesqls1=" update my_main set mrp="+mrp+",fixingprice="+fixing+" where psrno="+pdocno+" ";
			
			
			System.out.println("======updatesqls1========"+updatesqls1);
			
		    stmt.executeUpdate(updatesqls1);
			
		
		    ArrayList<String> pmgntarray= new ArrayList<String>();
		    String aa[]=list.split(",");
		     
		    	 
		    for(int i=0;i<aa.length;i++){
		    	// System.out.println("----------"+aa[i]);
		    	 String bb[]=aa[i].split("::");
		    	  
		    	 String temp="";
		    	 for(int j=0;j<bb.length;j++){ 
		    		 
		    		//  System.out.println("----------"+bb[j]);
		    		 temp=temp+bb[j]+"::";
		    		 
		    	}
		    	 pmgntarray.add(temp);
		    	 
		    } 
		    
		    
		    
			for(int k=0;k<pmgntarray.size();k++)
			{
			
	 
			 
		 
			String[] pmgntarr=((String) pmgntarray.get(k)).split("::"); 
	 
				
				if(!(pmgntarr[0].trim().equalsIgnoreCase("undefined") || pmgntarr[0].trim().equalsIgnoreCase("NaN") || pmgntarr[0].trim().equalsIgnoreCase("") || pmgntarr[0].trim().equalsIgnoreCase("null") || pmgntarr[0].isEmpty()))
				
				{
					if(k==0)
					{
					String sqls="delete from my_prodfocfixing where psrno='"+pdocno+"'";
							 stmt.executeUpdate(sqls);
					}
				
				      sql="INSERT INTO my_prodfocfixing(sr_no,psrno, qty, foc)VALUES"
						       + " ("+(k+1)+","
						       + " '"+pdocno+"',"
			 			       + "'"+(pmgntarr[0].trim().equalsIgnoreCase("undefined") || pmgntarr[0].trim().equalsIgnoreCase("NaN")|| pmgntarr[0].trim().equalsIgnoreCase("")|| pmgntarr[0].isEmpty()?0:pmgntarr[0].trim())+"',"
						       + "'"+(pmgntarr[1].trim().equalsIgnoreCase("undefined") || pmgntarr[1].trim().equalsIgnoreCase("NaN")|| pmgntarr[1].trim().equalsIgnoreCase("")|| pmgntarr[1].isEmpty()?0:pmgntarr[1].trim())+"')";
				    
				   //   System.out.println("sql="+sql);
				     int resultSet2 = stmt.executeUpdate(sql);
					     if(resultSet2<=0)
							{
								conn.close();
							 
								
							}
	 
			  }
			    
						
			}
		      
		 
 stmt.close();
		 
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



 