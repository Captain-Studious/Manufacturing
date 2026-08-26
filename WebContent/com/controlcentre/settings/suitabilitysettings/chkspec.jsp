  <%@page import="java.util.ArrayList"%>
<%@page import="java.sql.*"%>
<%@page import="javax.sql.*"%>
<%@page import="com.connection.*" %>


<%	


String doc_no = request.getParameter("docno")==null?"NA":request.getParameter("docno").trim();

	
String yomfrm = request.getParameter("yomfrm")==null?"NA":request.getParameter("yomfrm").trim();

	
String yomto = request.getParameter("yomto")==null?"NA":request.getParameter("yomto").trim();
String brand = request.getParameter("brand")==null?"NA":request.getParameter("brand").trim();

String mode = request.getParameter("mode")==null?"NA":request.getParameter("mode").trim();
String model = request.getParameter("model")==null?"NA":request.getParameter("model").trim();

String submodel = request.getParameter("submodel")==null?"NA":request.getParameter("submodel").trim();

System.out.println("==doc_no=="+doc_no)	   ;   
System.out.println("==yomfrm=="+yomfrm)	   ;    
System.out.println("==yomto=="+yomto)	   ;     

Connection conn=null;
try{
	ClsConnection ClsConnection=new  ClsConnection();
 	conn = ClsConnection.getMyConnection();
	Statement stmt = conn.createStatement ();
	String sql="";
	
	
	if(yomto.equalsIgnoreCase("OPEN"))
	{
		
	}
	else
	{
		sql= " and t.yom<="+yomto+" and t.yom!='OPEN' "	;
	}
	Statement stmt1 = conn.createStatement ();
	
	 int val=0;
	
		String sqls1 = "select frmyomid,toyomid,f.yom fyom,t.yom  from( "
				+" select frmyomid  frmyomid , toyomid   toyomid from my_sbrand where doc_no='"+brand+"' and frmyomid>0 and  status=3 )a "
				+"  left join my_syom f on f.doc_no=a.frmyomid "
				+"  left join my_syom t on t.doc_no=a.toyomid where  f.yom <="+yomfrm+"  "
						+" 	and (t.yom>='"+yomto+"' or t.yom='OPEN' )   ";
				        
		System.out.println("====sqls1==1=="+sqls1);
		ResultSet rs11 = stmt1.executeQuery(sqls1);
	 
	 int val11=0;
		while(rs11.next()) {
			
			val11=1;
			 
			
		}
		
		int modelrs=0;
		
		String sqls11 = "select frmyomid,toyomid,f.yom fyom,t.yom  from( "
				+" select frmyomid  frmyomid , toyomid   toyomid from my_smodel where doc_no='"+model+"' and frmyomid>0 and  status=3 ) a "
				+"  left join my_syom f on f.doc_no=a.frmyomid "
				+"  left join my_syom t on t.doc_no=a.toyomid where  f.yom <="+yomfrm+"  "
						+" 	and (t.yom>='"+yomto+"' or t.yom='OPEN' )   ";
				        
		System.out.println("====sqls11=========2============="+sqls11);
		ResultSet rs111 = stmt1.executeQuery(sqls11);
 
		while(rs111.next()) {
			
			modelrs=1;
			 
			
		}
		
	int smodelrs=0;
		
		String ssqls11 = "select frmyomid,toyomid,f.yom fyom,t.yom  from( "
				+" select frmyomid  frmyomid , toyomid   toyomid from my_ssubmodel where doc_no='"+submodel+"' and frmyomid>0 and  status=3 ) a "
				+"  left join my_syom f on f.doc_no=a.frmyomid "
				+"  left join my_syom t on t.doc_no=a.toyomid where  f.yom <="+yomfrm+"  "
						+" 	and (t.yom>='"+yomto+"' or t.yom='OPEN' )   ";
				        
		System.out.println("====ssqls11===========3==========="+ssqls11);
		ResultSet rs1111 = stmt1.executeQuery(ssqls11);
 
		while(rs1111.next()) {
			
			smodelrs=1;
			 
			
		}
		
	 if(val11==1 && modelrs==1  && smodelrs==1)
	 {
		 
		 val=1; 
		/*  System.out.println("==mode===================================="+mode)	   ; 
		 if(mode.equalsIgnoreCase("E"))
		 {
		 
			 
		 int spec1=0;
			String sqls="select * from   my_suitspec1 where submodelid='"+doc_no+"'   and  status=3 ";
			System.out.println("==sqls=="+sqls)	   ;    
			ResultSet rs1 = stmt1.executeQuery(sqls);
	 
		 
		 int val1=0;
			while(rs1.next()) {
				
				spec1=1;
				 
				
			}
			 int spec2=0;
        String sqls4="select * from   my_suitspec2 where submodelid='"+doc_no+"'   and  status=3 ";
		System.out.println("==sqls4=="+sqls4)	   ;  
			ResultSet rs5 = stmt1.executeQuery(sqls4);
  
		 
		 
			while(rs5.next()) {
				
				spec2=1;
				 
				
			}
			int spec3=0;
	        String sqls41="select * from   my_suitspec3 where submodelid='"+doc_no+"'   and  status=3 ";
			System.out.println("==sqls41=="+sqls41)	   ;  
				ResultSet rs51 = stmt1.executeQuery(sqls41);
			 
			 
				while(rs51.next()) {
					
					spec3=1;
					 
					
				}
				
			
			if(spec1==1 || spec2==1 || spec3==1)
			{
			
				if(spec1==1)
				{
				   
						String strSql = "select frmyomid,toyomid,f.yom fyom,t.yom  from( "
								+" select frmyomid frmyomid ,toyomid  toyomid from my_suitspec1 where submodelid='"+doc_no+"' and frmyomid>0 and  status=3 )a "
								+"  left join my_syom f on f.doc_no=a.frmyomid "
								+"  left join my_syom t on t.doc_no=a.toyomid where f.yom >="+yomfrm+" "+sql+" ";
								        
								        
							System.out.println("==strSql=="+strSql)	   ;     
						ResultSet rs = stmt.executeQuery(strSql);
						 
					
						while(rs.next()) {
						 val=1;
									
					  		} 
						
				}
			
				if(spec2==1)
				{
					val=0;
				
						String  sql2 = "select frmyomid,toyomid,f.yom fyom,t.yom  from( "
								+" select frmyomid frmyomid ,toyomid  toyomid from my_suitspec2 where submodelid='"+doc_no+"' and frmyomid>0 and  status=3 )a "
								+"  left join my_syom f on f.doc_no=a.frmyomid "
								+"  left join my_syom t on t.doc_no=a.toyomid where f.yom >="+yomfrm+" "+sql+" ";
								        
								        
							System.out.println("==sql2=="+sql2)	   ;     
						ResultSet rss1 = stmt.executeQuery(sql2);
						 
					
						while(rss1.next()) {
						 val=1;
									
					  		} 
			
				}
				if(spec3==1)
				{
					val=0;
						String sql3 = "select frmyomid,toyomid,f.yom fyom,t.yom  from( "
								+" select frmyomid frmyomid ,toyomid  toyomid from my_suitspec3 where submodelid='"+doc_no+"' and frmyomid>0 and  status=3 )a "
								+"  left join my_syom f on f.doc_no=a.frmyomid "
								+"  left join my_syom t on t.doc_no=a.toyomid where f.yom >="+yomfrm+" "+sql+" ";
								        
								        
							System.out.println("==sql3=="+sql3)	   ;     
						ResultSet rss2 = stmt.executeQuery(sql3);
						 
					
						while(rss2.next()) {
						 val=1;
									
					  		} 
						
				}
		 
			stmt.close();
			}
			else
			{
				 val=1;
			}
		 } */
		/*  else
		 {
			 val=1; 
		 } */
	 }
	
		System.out.println("=============================val============="+val)	   ;   
	conn.close();

	response.getWriter().print(val);
	
}
catch(Exception e){
	e.printStackTrace();
	conn.close();
}
finally{
	conn.close();
}
	/* response.getWriter().write(auth.toArray()); */

  %>