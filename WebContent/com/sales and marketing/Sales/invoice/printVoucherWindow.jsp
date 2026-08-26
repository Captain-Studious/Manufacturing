 <%@ taglib prefix="s" uri="/struts-tags" %>
 <% String contextPath=request.getContextPath();%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link href="<%=contextPath%>/css/body.css" media="screen" rel="stylesheet" type="text/css" />
<title>GatewayERP(i)</title>

<script type="text/javascript">
	

 	function printinv() {

 		var url=document.URL;

        var reurl=url.split("saveSalesInvoicecr");
        
        $("#docno").prop("disabled", false);
 		
 		var win= window.open(reurl[0]+"printsalesinv?docno="+document.getElementById("masterdoc_no").value+"&printcode=INVOICE&formdetailcode=CREDIT","_blank","top=250,left=310,Width=800,Height=800,location=no,scrollbars=no,toolbar=yes");
	     
 		win.focus();
 		$('#printWindow').jqxWindow('close');
 	}

 	function printfoc(){
 		
 		var url=document.URL;

        var reurl=url.split("saveSalesInvoicecr");
        
        $("#docno").prop("disabled", false);
 		
 		var win= window.open(reurl[0]+"printsalesinv?docno="+document.getElementById("masterdoc_no").value+"&printcode=FOC"+"&printcode=INVOICE&formdetailcode=CREDIT","_blank","top=250,left=310,Width=800,Height=800,location=no,scrollbars=no,toolbar=yes");
	     
 		win.focus();
 		$('#printWindow').jqxWindow('close');
 	}
 	

</script>

<body>
<div id=search>
<br/>
<table width="100%">
<tr><td colspan="2" align="center"><h2>Choose the print type</h2></td></tr>
  <tr>
    <td align="center"><input type="button" name="btninv" id="btninv" class="myButton" value="Invoice"  onclick="printinv();"></td>
    <td align="center"><input type="button" name="btnfoc" id="btnfoc" class="myButton" value="FOC"  onclick="printfoc();"></td>
    
  </tr>
</table>
&nbsp;
  </div>
</body>
</html>