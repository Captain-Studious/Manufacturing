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
 
String pruoduct=request.getParameter("pruoduct")==null?"0":request.getParameter("pruoduct");
String pdocno=request.getParameter("psrno");
System.out.println("-----pruoduct-----"+pruoduct);

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
 
	  Connection conn=null;
	    String sql="";
	    try
	    {
	   	
	    conn = ClsConnection.getMyConnection();
		Statement stmt = conn.createStatement();
		
		for(int k=0;k<pmgntarray.size();k++)
		{
		
/* 			
			                          0                  1                   2                   3                    4                      5                       6                       7
			    listss.push(rows[i].catid+"::"+rows[i].price1+"::"+rows[i].price2+"::"+rows[i].price3+"::"+rows[i].newprice1+"::"+rows[i].newprice2+"::"+rows[i].newprice3+"::"+rows[i].discount1
					  
					   
					                   8                         9
					   +"::"+rows[i].discount2+"::"+rows[i].discount3);  	 */	
		
					   if(pruoduct.equalsIgnoreCase("saveprmaster"))
						{
						   
						  if(k==0)
						  {
							  String delsql="delete  from my_descpr where psrno='"+pdocno+"'";
								stmt.executeUpdate(delsql);
						  }
						   
						}
					   
					   if(k==0)
						  {
							  String delsql1="delete  from my_bdescpr where psrno='"+pdocno+"'";
								stmt.executeUpdate(delsql1);
						  }
					   
	 
		String[] pmgntarr=((String) pmgntarray.get(k)).split("::"); 
			     
			if(pruoduct.equalsIgnoreCase("saveprmaster"))
			{
	      sql="INSERT INTO my_descpr(sr_no,psrno, catid,  price1, price2, price3, discount1, discount2, discount3)VALUES"
			       + " ("+(k+1)+","
			       + " '"+pdocno+"',"
			       + "'"+(pmgntarr[0].trim().equalsIgnoreCase("undefined") || pmgntarr[0].trim().equalsIgnoreCase("NaN")|| pmgntarr[0].trim().equalsIgnoreCase("")|| pmgntarr[0].isEmpty()?0:pmgntarr[0].trim())+"',"
			       + "'"+(pmgntarr[4].trim().equalsIgnoreCase("undefined") || pmgntarr[4].trim().equalsIgnoreCase("NaN")|| pmgntarr[4].trim().equalsIgnoreCase("")|| pmgntarr[4].isEmpty()?0:pmgntarr[4].trim())+"',"
			       + "'"+(pmgntarr[5].trim().equalsIgnoreCase("undefined") || pmgntarr[5].trim().equalsIgnoreCase("NaN")||pmgntarr[5].trim().equalsIgnoreCase("")|| pmgntarr[5].isEmpty()?0:pmgntarr[5].trim())+"',"
			       + "'"+(pmgntarr[6].trim().equalsIgnoreCase("undefined") || pmgntarr[6].trim().equalsIgnoreCase("NaN")||pmgntarr[6].trim().equalsIgnoreCase("")|| pmgntarr[6].isEmpty()?0:pmgntarr[6].trim())+"',"
			       + "'"+(pmgntarr[7].trim().equalsIgnoreCase("undefined") || pmgntarr[7].trim().equalsIgnoreCase("NaN")||pmgntarr[7].trim().equalsIgnoreCase("")|| pmgntarr[7].isEmpty()?0:pmgntarr[7].trim())+"',"
			       + "'"+(pmgntarr[8].trim().equalsIgnoreCase("undefined") || pmgntarr[8].trim().equalsIgnoreCase("NaN")||pmgntarr[8].trim().equalsIgnoreCase("")|| pmgntarr[8].isEmpty()?0:pmgntarr[8].trim())+"',"
			       + "'"+(pmgntarr[9].trim().equalsIgnoreCase("undefined") || pmgntarr[9].trim().equalsIgnoreCase("NaN")||pmgntarr[9].trim().equalsIgnoreCase("")|| pmgntarr[9].isEmpty()?0:pmgntarr[9].trim())+"')";
	    
		
	     int resultSet2 = stmt.executeUpdate(sql);
		     if(resultSet2<=0)
				{
					conn.close();
				 
					
				}
		}
		String  sql2="INSERT INTO my_bdescpr(sr_no,psrno,catid,price1,price2,price3,newprice1,newprice2,newprice3,discount1,discount2,discount3)VALUES"
				       + " ("+(k+1)+","
				       + " '"+pdocno+"',"
				       + "'"+(pmgntarr[0].trim().equalsIgnoreCase("undefined") || pmgntarr[0].trim().equalsIgnoreCase("NaN")|| pmgntarr[0].trim().equalsIgnoreCase("")|| pmgntarr[0].isEmpty()?0:pmgntarr[0].trim())+"',"
					   + "'"+(pmgntarr[1].trim().equalsIgnoreCase("undefined") || pmgntarr[1].trim().equalsIgnoreCase("NaN")|| pmgntarr[1].trim().equalsIgnoreCase("")|| pmgntarr[1].isEmpty()?0:pmgntarr[1].trim())+"',"
					   + "'"+(pmgntarr[2].trim().equalsIgnoreCase("undefined") || pmgntarr[2].trim().equalsIgnoreCase("NaN")|| pmgntarr[2].trim().equalsIgnoreCase("")|| pmgntarr[2].isEmpty()?0:pmgntarr[2].trim())+"',"
					   + "'"+(pmgntarr[3].trim().equalsIgnoreCase("undefined") || pmgntarr[3].trim().equalsIgnoreCase("NaN")||pmgntarr[3].trim().equalsIgnoreCase("")|| pmgntarr[3].isEmpty()?0:pmgntarr[3].trim())+"',"
					   + "'"+(pmgntarr[4].trim().equalsIgnoreCase("undefined") || pmgntarr[4].trim().equalsIgnoreCase("NaN")|| pmgntarr[4].trim().equalsIgnoreCase("")|| pmgntarr[4].isEmpty()?0:pmgntarr[4].trim())+"',"
					   + "'"+(pmgntarr[5].trim().equalsIgnoreCase("undefined") || pmgntarr[5].trim().equalsIgnoreCase("NaN")||pmgntarr[5].trim().equalsIgnoreCase("")|| pmgntarr[5].isEmpty()?0:pmgntarr[5].trim())+"',"
					   + "'"+(pmgntarr[6].trim().equalsIgnoreCase("undefined") || pmgntarr[6].trim().equalsIgnoreCase("NaN")||pmgntarr[6].trim().equalsIgnoreCase("")|| pmgntarr[6].isEmpty()?0:pmgntarr[6].trim())+"',"
					   + "'"+(pmgntarr[7].trim().equalsIgnoreCase("undefined") || pmgntarr[7].trim().equalsIgnoreCase("NaN")||pmgntarr[7].trim().equalsIgnoreCase("")|| pmgntarr[7].isEmpty()?0:pmgntarr[7].trim())+"',"
					   + "'"+(pmgntarr[8].trim().equalsIgnoreCase("undefined") || pmgntarr[8].trim().equalsIgnoreCase("NaN")||pmgntarr[8].trim().equalsIgnoreCase("")|| pmgntarr[8].isEmpty()?0:pmgntarr[8].trim())+"',"
					   + "'"+(pmgntarr[9].trim().equalsIgnoreCase("undefined") || pmgntarr[9].trim().equalsIgnoreCase("NaN")||pmgntarr[9].trim().equalsIgnoreCase("")|| pmgntarr[9].isEmpty()?0:pmgntarr[9].trim())+"')";
				      
			
		     int resultSet3 = stmt.executeUpdate(sql2);
			     if(resultSet3<=0)
					{
						conn.close();
					 
						
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



 