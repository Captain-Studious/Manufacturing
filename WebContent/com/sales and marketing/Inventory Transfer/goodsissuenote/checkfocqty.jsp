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
int status=0;


   

   ClsConnection ClsConnection=new ClsConnection();
 //  System.out.println("-----list-------"+list);
     
    String qtys=request.getParameter("qty")==null?"0":request.getParameter("qty");
    String psrno=request.getParameter("psrno")==null?"0":request.getParameter("psrno");
    String unit=request.getParameter("unit")==null?"0":request.getParameter("unit");
    
     
    Connection conn=null;
	Statement stmt =null;
 
    try
    {
   	
    	conn = ClsConnection.getMyConnection();
    	stmt = conn.createStatement();
    	
    	double qty=0;
    	if(!(qtys.equalsIgnoreCase("undefined")))
    	{
    		 qty=Double.parseDouble(qtys);
    	}
    	 
     
		double foc=0;
		
		int method=0;
		Statement stmt31=conn.createStatement();
		String chk311="select method  from gl_prdconfig where field_nme='multiqty' ";
		ResultSet rss31=stmt31.executeQuery(chk311); 
		if(rss31.next())
		{

			method=rss31.getInt("method");
		}
		 double fr=1;
			if(method>0)	
			{
				 Statement stmt11 = conn.createStatement ();
			    
			     String slss=" select fr from my_unit where psrno="+psrno+" and unit='"+unit+"' ";
			     
			     System.out.println("====slss==="+slss);
			     ResultSet rv1=stmt11.executeQuery(slss);
			     if(rv1.next())
			     {
			    	 fr=rv1.getDouble("fr"); 
			     }
			 
		
			qty=qty*fr;
			}
				
				
		 
	
		
    	
    	String sqls="select round(foc,0) foc,qty,psrno from  my_prodfocfixing where psrno="+psrno+" and qty<="+qty+" order by qty desc";
    // System.out.println("-----sqls- dochk------"+sqls);
       ResultSet rss=stmt.executeQuery(sqls);
       
       
       
    	if(rss.first())
    	{
    		foc=rss.getDouble("foc")/fr;
    	}
    	 
    	
    	
    	
    	
    	
    	 response.getWriter().print(foc); 
    	
    }
    catch(Exception e)
    {
    	e.printStackTrace();
    	 response.getWriter().print(0);
    	
     
    	 
    	 
    }
    finally
    {
   	stmt.close();
   	conn.close();
    }
	 	
	 	
	 	
%>
