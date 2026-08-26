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

</style>

	<script type="text/javascript">
	$(document).ready(function () {
	
	}); 

 	function mainloadSearch() {
 		console.log(1);
 		var sclname=document.getElementById("SCl_name").value;
 		var rno=document.getElementById("rno").value;
		getdata(sclname,rno);
	}
	function getdata(sclname,rno){  
		console.log(2);
		$("#srefreshdiv").load('subprocessSearch.jsp?sclname='+encodeURIComponent(sclname)+'&rno='+rno+'&id='+1);   
	} 
 
	</script>
<body bgcolor="#E0ECF8">    
<div id=search>
<table width="100%" >
  <tr >
   <td>
   <table >
   <tr>
     <td align="right" width="">Name</td>
     <td align="left" width="53%"><input type="text" name="SCl_name" id="SCl_name"  style="width:96.5%;" value='<s:property value="SCl_name"/>'></td>
     <td colspan="2" align="center">Doc NO</td>
     <td align="center"><input type="text" name="rno" id="rno" value='<s:property value="rno"/>'>
     <td align="left"><button name="btnsearch" onclick="mainloadSearch();" style="width:90px;height:20px" id="btnsearch">Search</button></td>       
    <tr>
   </table>
  </td>
  </tr> 
  </td>
  <tr>
    <td colspan="8" align="right">
    <div id="srefreshdiv">
    <jsp:include  page="subprocessSearch.jsp"></jsp:include>        
    </div>  
    </td>
  </tr>
</table>
  </div>
</body>
</html>          