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
<%@ page import="com.controlcentre.masters.product.ClsProductDAO" %>
<%
ClsConnection ClsConnection=new ClsConnection();
ClsCommon ClsCommon=new ClsCommon();
ClsProductDAO DAO = new ClsProductDAO();
String list=request.getParameter("productarray")==null?"0":request.getParameter("productarray");
String chkpsrno=request.getParameter("psrno")==null?"0":request.getParameter("psrno"); 
String desc=request.getParameter("desc")==null?"0":request.getParameter("desc");  
java.sql.Date sqlprocessdate=null;
Calendar cal = Calendar.getInstance();
SimpleDateFormat format1 = new SimpleDateFormat("dd.MM.yyyy");
String formatted = format1.format(cal.getTime());
System.out.println("==availdatezxd==="+formatted);
 if(!(formatted.equalsIgnoreCase("undefined"))&&!(formatted.equalsIgnoreCase(""))&&!(formatted.equalsIgnoreCase("0")))
{
sqlprocessdate=ClsCommon.changeStringtoSqlDate(formatted);
	
}
else{

} 
ArrayList<String> pmgntarray= new ArrayList<String>();



String aa[]=list.split(",");
String PRvoc="0";
	 
for(int i=0;i<aa.length;i++){
	System.out.println("----------"+aa[i]);
	 String bb[]=aa[i].split("::");
	  
	 String temp="";
	 for(int j=0;j<bb.length;j++){ 
		 
		 System.out.println("----------"+bb[j]);
		 temp=temp+bb[j]+"::";
		 
	}
	 pmgntarray.add(temp);
	 
} 
 
	  Connection conn=null;
	    String sql="",tempnw="",updatesqls1="";
	    int val=0,unit=0,cost=0,updt=0;
	    try
	    {
	   	
	    conn = ClsConnection.getMyConnection();
	    conn.setAutoCommit(false);
		Statement stmt = conn.createStatement();
		
		
		
			 for(int k=0;k<pmgntarray.size();k++){
				 ArrayList<String> prodarray= new ArrayList<String>();
				 ArrayList<String> uomarray= new ArrayList<String>();
				 ArrayList<String> suitarray= new ArrayList<String>();
				 ArrayList<String> specarray= new ArrayList<String>();
				 ArrayList<String> ssarray= new ArrayList<String>();
				 ArrayList<String> spcfcarray= new ArrayList<String>();
				 ArrayList<String> altrarray= new ArrayList<String>();
				 ArrayList<String> pmgntarray2= new ArrayList<String>();
				 String[] pmgntarr=((String) pmgntarray.get(k)).split("::"); 
				 String pcode="",dept="",pbarcode="",ptype="",pbrand="",pcat="",psubcat="",units="",arabicprdname="",desc1="",criteria="",type="",samplesize="",samplemethod="",techunit="",technote="",remarks="",density="",sqlchk="",psrno="0";
				 int cmbstar=0,cmbmastertype=0; 
				  psrno=""+(pmgntarr[0].trim().equalsIgnoreCase("undefined") || pmgntarr[0].trim().equalsIgnoreCase("NaN")|| pmgntarr[0].trim().equalsIgnoreCase("")|| pmgntarr[0].isEmpty()?0:pmgntarr[0].trim())+"";
				 String prdname=""+(pmgntarr[1].trim().equalsIgnoreCase("undefined") || pmgntarr[1].trim().equalsIgnoreCase("NaN")|| pmgntarr[1].trim().equalsIgnoreCase("")|| pmgntarr[1].isEmpty()?0:pmgntarr[1].trim())+"";
				 String measure=""+(pmgntarr[2].trim().equalsIgnoreCase("undefined") || pmgntarr[2].trim().equalsIgnoreCase("NaN")|| pmgntarr[2].trim().equalsIgnoreCase("")|| pmgntarr[2].isEmpty()?0:pmgntarr[2].trim())+"";
				// String row=""+(pmgntarr[3].trim().equalsIgnoreCase("undefined") || pmgntarr[3].trim().equalsIgnoreCase("NaN")|| pmgntarr[3].trim().equalsIgnoreCase("")|| pmgntarr[3].isEmpty()?0:pmgntarr[3].trim())+"";
				int row=0;
				 String deptmt=""+(pmgntarr[4].trim().equalsIgnoreCase("undefined") || pmgntarr[4].trim().equalsIgnoreCase("NaN")|| pmgntarr[4].trim().equalsIgnoreCase("")|| pmgntarr[4].isEmpty()?0:pmgntarr[4].trim())+"";
				 System.out.println("----rowloop------"+row);
				 
				 if((!psrno.equalsIgnoreCase("0")) ){
				 String sqltst3="select * from my_main where doc_no="+psrno+" ";
				 ResultSet rs2=stmt.executeQuery(sqltst3);
				 if(rs2.next()){
					 updt=1;
					 System.out.println("----psrno is available------"+psrno);
				 }
				 }
				 if((psrno.equalsIgnoreCase("0")) ){
						 psrno=chkpsrno;
						 System.out.println("----psrnoreplaced------"+psrno);
					 }
				
				 String sqltst2="select coalesce(part_no,0)part_no,coalesce(deptid,0)deptid,coalesce(barcode,0)barcode,coalesce(typeid,0)typeid,coalesce(brandid,0)brandid,coalesce(catid,0)catid,coalesce(scatid,0)scatid,coalesce(munit,0)munit,coalesce(star,0)star,coalesce(mtypeid,0)mtypeid,coalesce(prdname,0)prdname,coalesce(desc1,0)desc1,coalesce(criteria,0)criteria,2 prdtype,coalesce(samplesize,0)samplesize,coalesce(samplemethod,0)samplemethod,coalesce(techunit,0)techunit,coalesce(technote,0)technote,coalesce(techremarks,0)techremarks,coalesce(remarks,0)remarks,coalesce(density,0)density from my_main where doc_no="+psrno+"";
				 System.out.println("productdetailsfetch====="+sqltst2);
				 ResultSet rs=stmt.executeQuery(sqltst2);
				 if(rs.next()){
					
					         pcode=rs.getString("part_no");
							 dept=rs.getString("deptid");
							 pbarcode=rs.getString("barcode");
							 ptype=rs.getString("typeid");
							 pbrand=rs.getString("brandid");
							 pcat=rs.getString("catid");
							 psubcat=rs.getString("scatid");
							 units=rs.getString("munit");
							 cmbstar=rs.getInt("star");
							 cmbmastertype=rs.getInt("mtypeid");
							 arabicprdname=rs.getString("prdname");
							 desc1=rs.getString("desc1");
							 criteria=rs.getString("criteria");
							 type=rs.getString("prdtype");
							 samplesize=rs.getString("samplesize");
							 samplemethod=rs.getString("samplemethod");
							 techunit=rs.getString("techunit");
							 technote=rs.getString("technote");
							 remarks=rs.getString("remarks");
							 density=rs.getString("density");
					System.out.println("pcode===="+pcode);
				 }
				 String sqlcode="select count(*) rowno from my_main where part_no like '"+pcode+"%'";
				 ResultSet rscode=stmt.executeQuery(sqlcode);
				 if(rscode.next()){
					 row=rscode.getInt("rowno");
				 }
				 row++;
				 pcode=pcode+"-"+row;
				 if(updt==1){
					 sqlchk="update my_main set productname='"+prdname+"',measure="+measure+",mainpsrno="+chkpsrno+" where doc_no="+psrno+" ";
					 System.out.println("updatemain===="+sqlchk); 
					 val=stmt.executeUpdate(sqlchk);
					 if(val<0){
						conn.close();
						tempnw="0";
					 }
				 }
				 else{
					 
					 String sqltst4="select coalesce(psrno,0)psrno, coalesce(op_stock,0)op_stock, coalesce(brhid,0)brhid, coalesce(cmpid,0)cmpid, coalesce(op_cost,0)op_cost, coalesce(PRICE1,0)price1, coalesce(PRICE2,0)price2, coalesce(PRICE3,0)price3, coalesce(minStock,0)minstock, coalesce(maxStock,0)maxstock, coalesce(last_price,0)last_price, coalesce(bin,0)bin, coalesce(discontinued,0)discontinued, coalesce(reorderlevel,0)reorderlevel, coalesce(reorderqty,0)reorderqty, coalesce(old_stock,0)old_stock from my_desc where psrno="+psrno+"";
					 ResultSet rs3=stmt.executeQuery(sqltst4);
					 while(rs3.next()){
						/*  String sql="INSERT INTO my_desc(psrno, brhid,bin, minStock, maxStock, PRICE1, PRICE2, PRICE3,discontinued,reorderlevel,reorderqty)VALUES"
									+ " ('"+pdocno+"',"
									+ "'"+(prod[0].equalsIgnoreCase("undefined") || prod[0].equalsIgnoreCase("") || prod[0].trim().equalsIgnoreCase("NaN")|| prod[0].isEmpty()?0:prod[0].trim())+"',"
									+ "'"+(prod[3].trim().equalsIgnoreCase("undefined")  || prod[3].trim().equalsIgnoreCase("") || prod[3].trim().equalsIgnoreCase("NaN")|| prod[3].isEmpty()?0:prod[3].trim())+"',"
									+ "'"+(prod[4].trim().equalsIgnoreCase("undefined") || prod[4].trim().equalsIgnoreCase("") || prod[4].trim().equalsIgnoreCase("NaN")|| prod[4].isEmpty()?0:prod[4].trim())+"',"
									+ "'"+(prod[5].trim().equalsIgnoreCase("undefined") || prod[5].trim().equalsIgnoreCase("") || prod[5].trim().equalsIgnoreCase("NaN")|| prod[5].isEmpty()?0:prod[5].trim())+"',"
									+ "'"+(prod[6].trim().equalsIgnoreCase("undefined") || prod[6].trim().equalsIgnoreCase("") || prod[6].trim().equalsIgnoreCase("NaN")|| prod[6].isEmpty()?0:prod[6].trim())+"',"
									+ "'"+(prod[7].trim().equalsIgnoreCase("undefined") || prod[7].trim().equalsIgnoreCase("") || prod[7].trim().equalsIgnoreCase("NaN")|| prod[7].isEmpty()?0:prod[7].trim())+"',"
									+ "'"+(prod[8].trim().equalsIgnoreCase("undefined") || prod[8].trim().equalsIgnoreCase("") || prod[8].trim().equalsIgnoreCase("NaN")|| prod[8].isEmpty()?0:prod[8].trim())+"',"
									+ "'"+(prod[2].trim().equalsIgnoreCase("undefined") || prod[2].trim().equalsIgnoreCase("") || prod[2].trim().equalsIgnoreCase("NaN")|| prod[2].isEmpty()?0:prod[2].trim())+"', "
									+ "'"+(prod[9].trim().equalsIgnoreCase("undefined") || prod[9].trim().equalsIgnoreCase("") || prod[9].trim().equalsIgnoreCase("NaN")|| prod[9].isEmpty()?0:prod[9].trim())+"',"
									+ "'"+(prod[10].trim().equalsIgnoreCase("undefined") || prod[10].trim().equalsIgnoreCase("") || prod[10].trim().equalsIgnoreCase("NaN")|| prod[10].isEmpty()?0:prod[10].trim())+"')";  
					 */
						 String tempk=rs3.getString("brhid") + " :: " +"1"+ " :: " + rs3.getString("discontinued") + " :: "+ rs3.getString("bin")+ " :: " + rs3.getString("minStock") + " :: "+ rs3.getString("maxStock")+ " :: " + rs3.getString("PRICE1")+ " :: " + rs3.getString("PRICE2")+ " :: "+ rs3.getString("PRICE3")+ " :: "+rs3.getString("reorderlevel")+ " :: "+rs3.getString("reorderqty")+ " :: ";   
						 
						 prodarray.add(tempk);
						/*  prodarray.add("1");
						 prodarray.add(rs3.getString("discontinued"));
						 prodarray.add(rs3.getString("bin"));
						 prodarray.add(rs3.getString("minStock"));
						 prodarray.add(rs3.getString("maxStock"));
						 prodarray.add(rs3.getString("PRICE1"));
						 prodarray.add(rs3.getString("PRICE2"));
						 prodarray.add(rs3.getString("PRICE3"));
						 prodarray.add(rs3.getString("discontinued"));
						 prodarray.add(rs3.getString("reorderlevel"));
						 prodarray.add(rs3.getString("reorderqty")); */
						 for(int g=0;g<prodarray.size();g++){
							 System.out.println("descarray====="+prodarray.get(g).toString());
						 }
					 }
					 String sqltst5="select coalesce(PSRNO,0)psrno, coalesce(UNIT,0)unit, coalesce(FR,0)fr, coalesce(wt,0)wt, coalesce(VOLUME,0)volume, coalesce(thk,0)thk, coalesce(leng,0)leng, coalesce(width,0)width from my_unit where psrno="+psrno+"";
					 ResultSet rs4=stmt.executeQuery(sqltst5);
					 while(rs4.next()){
						/*  String sql="INSERT INTO my_unit(PSRNO, UNIT, FR, wt, VOLUME, thk, leng, width)VALUES"
									+ " ('"+pdocno+"',"
									+ "'"+(uomarr[0].equalsIgnoreCase("undefined") || uomarr[0].equalsIgnoreCase("") || uomarr[0].trim().equalsIgnoreCase("NaN")|| uomarr[0].isEmpty()?0:uomarr[0].trim())+"',"
									+ "'"+(uomarr[1].trim().equalsIgnoreCase("undefined")  || uomarr[1].trim().equalsIgnoreCase("") || uomarr[1].trim().equalsIgnoreCase("NaN")|| uomarr[1].isEmpty()?0:uomarr[1].trim())+"',"
									+ "'"+(uomarr[2].trim().equalsIgnoreCase("undefined") || uomarr[2].trim().equalsIgnoreCase("") || uomarr[2].trim().equalsIgnoreCase("NaN")|| uomarr[2].isEmpty()?0:uomarr[2].trim())+"',"
									+ "'"+(uomarr[3].trim().equalsIgnoreCase("undefined") || uomarr[3].trim().equalsIgnoreCase("") || uomarr[3].trim().equalsIgnoreCase("NaN")|| uomarr[3].isEmpty()?0:uomarr[3].trim())+"',"
									+ "'"+(uomarr[4].trim().equalsIgnoreCase("undefined") || uomarr[4].trim().equalsIgnoreCase("") || uomarr[4].trim().equalsIgnoreCase("NaN")|| uomarr[4].isEmpty()?0:uomarr[4].trim())+"',"
									+ "'"+(uomarr[5].trim().equalsIgnoreCase("undefined") || uomarr[5].trim().equalsIgnoreCase("") || uomarr[5].trim().equalsIgnoreCase("NaN")|| uomarr[5].isEmpty()?0:uomarr[5].trim())+"',"
									+ "'"+(uomarr[6].trim().equalsIgnoreCase("undefined") || uomarr[6].trim().equalsIgnoreCase("") || uomarr[6].trim().equalsIgnoreCase("NaN")|| uomarr[6].isEmpty()?0:uomarr[6].trim())+"')";
						 newTextBox.val(uomrows[i].unitid + "::" + uomrows[i].fr + "::"
									+ uomrows[i].weight + "::" + uomrows[i].volumn + "::"
									+ uomrows[i].thickness + "::" + uomrows[i].len
									+ "::" + uomrows[i].width + "::"); */
									
				String tempk1=rs4.getString("unit") + " :: " +rs4.getString("fr") + " :: "+ rs4.getString("wt") + " :: " + rs4.getString("volume") + " :: "+ rs4.getString("thk") + " :: " + rs4.getString("leng")+ " :: " + rs4.getString("width") + " :: ";
						 uomarray.add(tempk1);
						/*  uomarray.add(rs4.getString("fr"));
						 uomarray.add(rs4.getString("wt"));
						 uomarray.add(rs4.getString("volume"));
						 uomarray.add(rs4.getString("thk"));
						 uomarray.add(rs4.getString("leng"));
						 uomarray.add(rs4.getString("width")); */
					 
					 }
					 
					 String sqltst6="select 0 chk,coalesce(rdocno,0)rdocno, coalesce(charas,0)charas, coalesce(description,0)description, coalesce(testmethod,0)testmethod, coalesce(unit,0)unit, coalesce(requisite,0)requisite, coalesce(priority,0)priority, coalesce(note,0)note from my_prspec where rdocno="+psrno+"";
					 ResultSet rs5=stmt.executeQuery(sqltst6);
					 while(rs5.next()){
						 
						  
						 /* String sql="INSERT INTO my_prspec(rdocno, charas, description, testmethod, unit, requisite, priority, note)VALUES"
									+ " ('"+pdocno+"',"
									+ "'"+(spcfcarr[0].equalsIgnoreCase("undefined") || spcfcarr[0].equalsIgnoreCase("") || spcfcarr[0].trim().equalsIgnoreCase("NaN")|| spcfcarr[0].isEmpty()?0:spcfcarr[0].trim())+"',"
									+ "'"+(spcfcarr[1].trim().equalsIgnoreCase("undefined")  || spcfcarr[1].trim().equalsIgnoreCase("") || spcfcarr[1].trim().equalsIgnoreCase("NaN")|| spcfcarr[1].isEmpty()?0:spcfcarr[1].trim())+"',"
									+ "'"+(spcfcarr[2].trim().equalsIgnoreCase("undefined") || spcfcarr[2].trim().equalsIgnoreCase("") || spcfcarr[2].trim().equalsIgnoreCase("NaN")|| spcfcarr[2].isEmpty()?0:spcfcarr[2].trim())+"',"
									+ "'"+(spcfcarr[3].trim().equalsIgnoreCase("undefined") || spcfcarr[3].trim().equalsIgnoreCase("") || spcfcarr[3].trim().equalsIgnoreCase("NaN")|| spcfcarr[3].isEmpty()?0:spcfcarr[3].trim())+"',"
									+ "'"+(spcfcarr[4].trim().equalsIgnoreCase("undefined") || spcfcarr[4].trim().equalsIgnoreCase("") || spcfcarr[4].trim().equalsIgnoreCase("NaN")|| spcfcarr[4].isEmpty()?0:spcfcarr[4].trim())+"',"
									+ "'"+(spcfcarr[5].trim().equalsIgnoreCase("undefined") || spcfcarr[5].trim().equalsIgnoreCase("") || spcfcarr[5].trim().equalsIgnoreCase("NaN")|| spcfcarr[5].isEmpty()?0:spcfcarr[5].trim())+"',"
									+ "'"+(spcfcarr[6].trim().equalsIgnoreCase("undefined") || spcfcarr[6].trim().equalsIgnoreCase("") || spcfcarr[6].trim().equalsIgnoreCase("NaN")|| spcfcarr[6].isEmpty()?0:spcfcarr[6].trim())+"')";
						 newTextBox.val(specificrows[i].charctstcs+" :: "+specificrows[i].desc1+" :: "+specificrows[i].tstmthd+" :: "+specificrows[i].uom+" :: "  
								   +specificrows[i].req+" :: "+specificrows[i].prr+" :: "+specificrows[i].note+" :: "+specificrows[i].doc_no+" :: ");*/
					  
								   
	String tempk2=rs5.getString("charas")+" :: "+rs5.getString("description")+" :: "+rs5.getString("testmethod")+" :: "+rs5.getString("unit")+" :: "+rs5.getString("requisite")+" :: "+rs5.getString("priority")+" :: "+rs5.getString("note")+" :: "+rs5.getString("chk")+" :: ";
								   
						 spcfcarray.add(tempk2);
						 /* spcfcarray.add(rs5.getString("description"));
						 spcfcarray.add(rs5.getString("testmethod"));
						 spcfcarray.add(rs5.getString("unit"));
						 spcfcarray.add(rs5.getString("requisite"));
						 spcfcarray.add(rs5.getString("priority"));
						 spcfcarray.add(rs5.getString("note"));
						 spcfcarray.add(rs5.getString("chk")); */
					 }
					 
					 
			  val=DAO.insert(sqlprocessdate, prdname, pcode, pbarcode, ptype, pbrand, pcat, psubcat, units, deptmt, "A", "PRD", prodarray, uomarray, suitarray, specarray, session, 1, pmgntarray2, cmbstar, cmbmastertype, arabicprdname, ssarray, desc1, criteria, type, samplesize, samplemethod, techunit, technote, remarks, spcfcarray, altrarray, density);
				if(val<0){
					conn.close();
					tempnw="0";
				}
				 PRvoc=request.getAttribute("documentNo").toString();
					System.out.println("==PRvoc=="+PRvoc);
				 String sqltst="update my_main set measure="+measure+",mainpsrno="+psrno+" where doc_no="+PRvoc+"";
				 val=stmt.executeUpdate(sqltst);
				 }
				
				
			 }
			 
			 if(val>0){	 
		     conn.commit();
			 tempnw="1";
		     }
    stmt.close();
		 
	conn.close();
	 response.getWriter().print(tempnw+" :: "+PRvoc);
    	
    }
    catch(Exception e)
    {
    	e.printStackTrace();
    	
    	
    	conn.close();
    	 response.getWriter().print(tempnw+" :: "+PRvoc);
    }
	 	
	 	
	 	
%>



 