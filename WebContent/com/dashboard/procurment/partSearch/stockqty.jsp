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
 
     String list=request.getParameter("list")==null?"0":request.getParameter("list");

 ClsConnection ClsConnection=new ClsConnection();
System.out.println("-----list-------"+list);
     
    String branch=request.getParameter("branch")==null?"0":request.getParameter("branch");
   
     String aa[]=list.split(",");

 	ArrayList<String> mainarray= new ArrayList<String>();
 	 
 for(int i=0;i<aa.length;i++){
 	 
 	 String bb[]=aa[i].split("::");
 
 	 String temp="";
 	 for(int j=0;j<bb.length;j++){ 
 		 temp=temp+bb[j]+"::";
 		 
 	}
 	System.out.println("-----temp-------"+temp);
 	 
 	 mainarray.add(temp);
 	 
 } 
    Connection conn=null;
    String sql="";
    
    String temp1="";
    String temp2="";
    double acqty=0;
    try
    {
   	
    conn = ClsConnection.getMyConnection();
	Statement stmt = conn.createStatement();
	
	int calcu=0;
	
	for(int k=0;k<mainarray.size();k++)
	{
	
	      
	  
	  String[] serarray=mainarray.get(k).split("::");  
		System.out.println("----serarray[0]--------"+serarray[0]);
	     
	     String  prdids=""+(serarray[0].trim().equalsIgnoreCase("undefined") || serarray[0].trim().equalsIgnoreCase("NaN")|| serarray[0].trim().equalsIgnoreCase("")|| serarray[0].isEmpty()?0:serarray[0].trim())+"";
	        
 
	 int prdid=Integer.parseInt(prdids);
	 
	 
 
		 sql="select (sum(op_qty)-sum(out_qty+rsv_qty+del_qty)) acqty from my_prddin where  prdid='"+prdid+"'  "; 
	      
	        
	           System.out.println("----sql--------"+sql);  
	           
	           ResultSet rss=  stmt.executeQuery(sql); 
	        	if(rss.next())
	        	{
	        		acqty=rss.getDouble("acqty");
	        		
	        		 
	        		
	        	 	temp1=temp1+prdid+",";
	        		temp2=temp2+acqty+",";		
	        		
	        	}
	        	 
	        	
	        		 
		
      }
	 stmt.close();
	 
     System.out.println("----temp1--------"+temp1); 
     
     
     System.out.println("----temp2--------"+temp2); 
	 
	 response.getWriter().write(temp1+"###"+temp2);
		conn.close();
    	
    }
    catch(Exception e)
    {
    	e.printStackTrace();
    	conn.close();
    }
	 	
	 	
	 	
%>
