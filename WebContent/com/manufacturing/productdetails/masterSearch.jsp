 <%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<html>
<head>
 
<% String contextPath=request.getContextPath();%>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>GatewayERP(i)</title>
<%--   <jsp:include page="../../../../includes.jsp"></jsp:include>   --%> 


<style>
<link href="<%=contextPath%>/css/body.css" media="screen" rel="stylesheet" type="text/css" />
.branch22 {
	color: black;
	background-color: #E0ECF8;
	width: 100%;
	font-family: Tahoma;
	font-size: 10px;
}


</style>


	<script type="text/javascript">
	$(document).ready(function () {
		$("#searchdate").jqxDateTimeInput({ width: '100px', height: '15px', formatString:"dd.MM.yyyy"});
		$("#searchdate").jqxDateTimeInput('setDate',null);
	});
	function mainloadSearch() {
 		
		//var searchdocno=document.getElementById("searchdocno").value;
 		//var searchdate=$('#searchdate').jqxDateTimeInput('val');
 		//var searchdate=$('#searchdate').val();
 		//var searchproductcode=document.getElementById("searchproductcode").value;
 		//var searchproductname=document.getElementById("searchproductname").value;
		getdata();
 

	}
	function getdata(){
		
		//$("#srefreshdiv").load('masterSearchGrid.jsp?searchdocno='+searchdocno+'&searchdate='+searchdate+'&searchproductcode='+searchproductcode+'&searchproductname='+searchproductname+'&id=1');
		$("#srefreshdiv").load('masterSearchGrid.jsp?id=1');
		}
	
</script>
<body bgcolor="#E0ECF8">
<div id=search>
<table style="width:100%;">
  <tr >
 
   <td align="right" width="8%" ><label class="branch">Doc No</label></td>   
    <td align="left" width="21%"><input type="text" name="searchdocno" id="searchdocno" value='<s:property value="searchdocno"/>'></td>
     <td width="10%" align="right"  ><label class="branch22">Date</label></td>
    <td align="left" width="20%"><div id="searchdate" name="searchdate"></div></td>
    
    <td align="right" width="11%"><label class="branch22">Product code</label></td>
    <td align="left" width="31%" colspan="2"><input type="text" name="searchproductcode" id="searchproductcode"  value='<s:property value="searchproductcode"/>'></td>
   
    </tr>
     
  <tr>
 
<td align="right" width="6%"><label class="branch22">Product Name</label></td>
    <td align="left" width="80%"><input type="text" name="searchproductname" id="searchproductname" style="height:18px;width:90%;" value='<s:property value="searchproductname"/>'></td>
   
    <td  align="center" style="width:15%;"> <input type="button" name="btnmastersearch" id="btnmastersearch" class="myButton" value="Search"  onclick="mainloadSearch();"></td>
  </tr>
  </table>
   
     
    
    <div id="srefreshdiv">
      
   <jsp:include  page="masterSearchGrid.jsp"></jsp:include> 
   
   </div>
 
  </div>
</body>
</html>