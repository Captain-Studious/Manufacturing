<%@ taglib prefix="s" uri="/struts-tags"%>

<!doctype html>
<html>

<jsp:include page="../../../../includes.jsp"></jsp:include>

<head>
<meta charset="utf-8">
<title>GatewayERP(i)</title>
<style>
P.breakhere {
page-break-before: always;
}
table,tr,td{
border-collapse:collapse;
}

</style>

<script  type="text/javascript">
$(document).ready(function(){
	var pdfInfo = {};
	  var x = document.location.search.substring(1).split('&');
	  for (var i in x) { var z = x[i].split('=',2); pdfInfo[z[0]] = unescape(z[1]); }
	  function getPdfInfo() {
	    var page = pdfInfo.page || 1;
	    var pageCount = pdfInfo.topage || 1;
	    document.getElementById('curpage').textContent = page;
	    document.getElementById('pagecount').textContent = pageCount;
	  }
});

</script>

</head>

<body  style="background-color:white; font-size:10px;">
<jsp:include page="../../../common/printHeader.jsp"></jsp:include>

<table width="100%" border="0" cellspacing="10" cellpadding="5">
  <tr>
    
    <td width="50%" rowspan="5">
		    <fieldset>
	    <table width="100%" border="0" cellspacing="10" cellpadding="5">
	    <tr><td><label id="lblvendoeaccName" name="lblvendoeaccName"><s:property value="lblvendoeaccName"/></label></td></tr>
            <tr><td><b>Trn No:</b>&nbsp;<label id="lbltrnno" name="lbltrnno"><s:property value="lbltrnno"/></label></td></tr>
	    <tr><td><label id="lblclientaddress" name="lblclientaddress"><s:property value="lblclientaddress"/></label></td></tr>
            <tr><td><label id="lblclientcity" name="lblclientcity"><s:property value="lblclientcity"/></label>-
             <label id="lblclientcountry" name="lblclientcountry"><s:property value="lblclientcountry"/></label>
            </td></tr>
		    <tr><td><label id="lblclientmob" name="lblclientmob"><s:property value="lblclientmob"/></label><br/><br/><br/><br/></td></tr>
		    
            </table></fieldset>
		    </td>
 
    <td>
		  <fieldset>
		  <table width="100%" border="0" cellspacing="10" cellpadding="5">  
		   <tr> 
		    <td width="25%" align="right"><b>INVOICE NO:</b></td>
		    <td width="25%"><label id="lblinvno" name="lblinvno"><s:property value="lblinvno"/></label></td>
		  </tr>
		  
		  <tr>
		    <td align="right"><b>DATE &amp;TIME:</b></td>
		    <td><label id="lbldate" name="lbldate"><s:property value="lbldate"/></label></td>
		  </tr>
		  <tr>
		    <td align="right"><b>ACCOUNT DATE:</b></td>
		    <td><label id="lblduedate" name="lblduedate"><s:property value="lblduedate"/></label></td>
		  </tr>
		  <tr>
		    <td align="right"><b>S.O.NO:</b>
		   	  <td><label id="lblsono" name="lblsono"><s:property value="lblsono"/></label>
		    </td>
		    <td align="right"><b>Page&nbsp;(</b>
		    <label id="curpage" name="curpage"><s:property value="curpage"/><b>/</b>
		    <label id="pagecount" name="pagecount"><s:property value="pagecount"/><b>)</b>
		    </td>
		  </tr>
		  <tr>
		    <td height="25" align="right"><b>SALESMAN:</b></td>
		    <td><label id="lblsalesPerson" name="lblsalesPerson"><s:property value="lblsalesPerson"/></label></td>
		  </tr>
		  </table></fieldset>
  </td>
  </tr>
</table><br/>
<table width="100%" border="1" cellspacing="3" cellpadding="5">
  <tr style="background-color: #ebccff">
    <td width="5%" align="center" style="font-weight: bold">NO</td>
    <td width="30%" style="font-weight: bold">PRODUCT NAME</td>
    <td width="9%" style="font-weight: bold">EXP</td>
    <td width="8%" style="font-weight: bold">BATCH</td>
    <td width="4%" style="font-weight: bold">QTY</td>
    <td width="8%" align="right" style="font-weight: bold">MRP</td>
    <td width="8%" align="right" style="font-weight: bold">RATE</td>
    <td width="9%" align="right" style="font-weight: bold">AMOUNT</td>
    <td width="5%" align="right" style="font-weight: bold">TAX %</td>
    <td width="6%" align="right" style="font-weight: bold">TAX</td>
    <td width="8%" align="right" style="font-weight: bold">TOTAL</td>
  </tr>
   <s:iterator var="stat" value='#request.details' >
<tr>   
<%int i=0; %>
    <s:iterator status="arr" value="#stat.split('::')" var="des">   
    <%
    if(i>4){%>
    
  <td  align="right" >
  <s:property value="#des"/>
  </td>
  <%} else if(i<4){ %>
    
  <td  align="left" >
  <s:property value="#des"/>
  </td>
   
  
   <%} else{ %>
    
  <td  align="left" >
  <s:property value="#des"/>
  </td>
  <% } i++;  %>
 </s:iterator>
</tr>
</s:iterator>

</table>
<br/><br/><br/><br/>
<div id="bottomdiv" style="width: 100%">
<table width="100%" border="1" cellspacing="1" cellpadding="0">
    <tr>
      <td width="50%" rowspan="4" valign="top" style="font-weight: bold; border-left:none; border-top:none; border-bottom:none;">
		<label id="lblamountinwords" name="lblamountinwords"><s:property value="lblamountinwords"/></label></td>
      <td width="23%" align="right" style="border:none">Total:</td>
      <td width="27%" align="right" style="font-weight: bold; border:none">
      <label id="lbltotal" name="lbltotal"><s:property value="lbltotal"/></label></td>
    </tr>
    <tr>
      <td align="right" style="border:none">Discount:</td>
      <td align="right" style="font-weight: bold; border:none">
      <label id="lbldiscount" name="lbldiscount"><s:property value="lbldiscount"/></label></td>
    </tr>
    <tr>
      <td align="right" style="border:none">Tax:</td>
      <td align="right" style="font-weight: bold; border:none">
      <label id="lbltax" name="lbltax"><s:property value="lbltax"/></label></td>
    </tr>
    <tr>
      <td align="right" style="border:none">Net Total:</td>
      <td align="right" style="font-weight: bold; border:none;">
      <label id="lblnettotal" name="lblnettotal"><s:property value="lblnettotal"/></label></td>
    </tr>
    <tr style="border-left:none; border-right:none; border-bottom:none;">
      <td colspan="3" align="right" style="border-left:none; border-right:none; border-bottom:none; padding-right: 5px;"><br/>
      <table width="33%" border="1" cellspacing="0" cellpadding="0">
        <tr>
          <td width="32%" align="center">No.</td>
          <td width="34%" align="center">CTN</td>
          <td width="34%" align="center">BAG</td>
          </tr>
        <tr>
          <td align="center">&nbsp;</td>
          <td align="center">&nbsp;</td>
          <td align="center">&nbsp;</td>
          </tr>
      </table></td>
    </tr>
    <tr style="border:none;">
      <td colspan="3" style="font-weight: bold; border:none;">
        1.This Bill Should be settled within 90 days<br/>
        2.Goods oncetold will not be taken back or exchanged<br/>
        3.Recieved Goods in Good condition
      </td>
    </tr>
 	
    <tr style="border:none; ">
      <td style="font-weight: bolder; border:none; padding-bottom: 8px;"><br/>&nbsp;Prepared By:
      <label id="lblpreparedby" name="lblpreparedby"><s:property value="lblpreparedby"/></label></td>
      <td style="font-weight: bolder; border:none;"><br/>Verified By:&nbsp;_________________</td>
      <td align="center" style="font-weight: bolder; border:none;"><br/>Customer Sign & Stamp:</td>
    </tr>
  </table>
</div>

<P CLASS="breakhere">
<br/><br/><br/><br/><br/><br/>
<table width="100%" border="1" cellspacing="3" cellpadding="5">
  <tr style="background-color: #ebccff">
    <td width="4%" align="center" style="font-weight: bold">NO</td>
    <td width="26%" style="font-weight: bold">PRODUCT NAME</td>
    <td width="9%" style="font-weight: bold">EXP</td>
    <td width="8%" style="font-weight: bold">BATCH</td>
    <td width="4%" style="font-weight: bold">QTY</td>
    <td width="5%" align="right" style="font-weight: bold">FOC</td>
    <td width="8%" align="right" style="font-weight: bold">MRP</td>
    <td width="8%" align="right" style="font-weight: bold">RATE</td>
    <td width="9%" align="right" style="font-weight: bold">AMOUNT</td>
    <td width="5%" align="right" style="font-weight: bold">TAX %</td>
    <td width="6%" align="right" style="font-weight: bold">TAX</td>
    <td width="8%" align="right" style="font-weight: bold">TOTAL</td>
  </tr>
   <s:iterator var="stat" value='#request.nextpagedetails' >
<tr>   
<%int i=0; %>
    <s:iterator status="arr" value="#stat.split('::')" var="des">   
    <%
    if(i>5){%>
    
  <td  align="right" >
  <s:property value="#des"/>
  </td>
  <%} else if(i<5){ %>
    
  <td  align="left" >
  <s:property value="#des"/>
  </td>
   
  
   <%} else{ %>
    
  <td  align="left" >
  <s:property value="#des"/>
  </td>
  <% } i++;  %>
 </s:iterator>
</tr>
</s:iterator>

</table>
</body>
</html>
