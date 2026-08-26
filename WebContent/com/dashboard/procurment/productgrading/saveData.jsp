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
<%	

	ClsConnection connDAO=new ClsConnection();
	ClsCommon commonDAO=new ClsCommon();

	Connection conn = null;
	String str=request.getParameter("str")==null?"0":request.getParameter("str").trim().toString();
	String stararray=request.getParameter("stararray")==null?"0":request.getParameter("stararray").trim().toString();
	int status=0;
	
	try{
		ArrayList<String> newarray=new ArrayList<String>();
		
		if(stararray.length()>0){
			String temparray[]=stararray.split(",");
			for(int i=0;i<temparray.length;i++){
				newarray.add(temparray[i]);
			}
		}
		System.out.print("newarray==="+newarray);
		System.out.print("str==="+str);
		String sql=null;
		int val=0;
	    
		conn=connDAO.getMyConnection();
		conn.setAutoCommit(false);
		
		Statement stmt = conn.createStatement();
		
		String branch=session.getAttribute("BRANCHID").toString().trim();
	    String userid=session.getAttribute("USERID").toString().trim();
		
			CallableStatement stmt1=null;
			 for(int i=0;i<newarray.size();i++){
				String temp[]=newarray.get(i).split("::");
				stmt1 = conn.prepareCall("update my_main set star=? where psrno=? ");				
				stmt1.setString(1,str);//star
				stmt1.setString(2,(temp[1].trim().equalsIgnoreCase("undefined") || temp[1].trim().equalsIgnoreCase("NaN") || temp[0].trim().equalsIgnoreCase("") || temp[1].trim().isEmpty()?"0":temp[1].trim()).toString());//psrno
				val = stmt1.executeUpdate();
			  	if(val<=0){
			  		status=1;
			  		stmt1.close();
			      }
			  } 
			  
		if(status==1){
				System.out.print("******** FAILED TO SAVE ********"+status);
			}
			else{
				status=2;
				conn.commit();
			}
		response.getWriter().write(status+"");
	 	stmt.close();
	 	conn.close(); 
	}
	catch(Exception e){
	 	e.printStackTrace();
	 	conn.close();
   } finally{
	   conn.close();
   }
	
%>
