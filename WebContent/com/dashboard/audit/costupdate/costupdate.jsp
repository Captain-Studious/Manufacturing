<link href="../../../../css/dashboard.css" media="screen" rel="stylesheet" type="text/css" />  
<jsp:include page="../../../../includes.jsp"></jsp:include>    
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>GatewayERP(i)</title>
<%-- <script type="text/javascript" src="../../js/dashboard.js"></script> --%> 
<style type="text/css">
.myButtons {
	display: inline-block;
	margin-right:4px;
	margin-left:4px; 
  margin-bottom: 0;
  font-weight: normal;
  line-height: 1.3;
  text-align: center;
  white-space: nowrap;
  vertical-align: middle;
  -ms-touch-action: manipulation;
      touch-action: manipulation;
  cursor: pointer;
  -webkit-user-select: none;
     -moz-user-select: none;
      -ms-user-select: none;
          user-select: none;
  background-image: none;
  border: 1px solid transparent;
  border-radius: 4px;
  color: #fff;
  background-color: grey;
}
.myButtons:hover {
	  color: #fff;
  background-color: #31b0d5;
  
}
.myButtons:active {
  color: #fff;
  background-color: #31b0d5;
  
}
.myButtons:focus {
  color: #fff;
  background-color: grey;
}
</style>

<script type="text/javascript">

$(document).ready(function () {
	  // setType(null);
	  
	   $("body").prepend('<div id="overlay" class="ui-widget-overlay" style="z-index: 1; display: none;"></div>');
	     $("body").prepend("<div id='PleaseWait' style='display: none;position:absolute; z-index: 1;top:200px;right:750px;'><img src='../../../../icons/31load.gif'/></div>");
	$('#vehdetaildiv').hide();
	 $("#fromdate").jqxDateTimeInput({ width: '125px', height: '15px',formatString:"dd.MM.yyyy"});
	 $("#todate").jqxDateTimeInput({ width: '125px', height: '15px',formatString:"dd.MM.yyyy"});
	
	 
	   var curfromdate=$('#fromdate').jqxDateTimeInput('getDate');
       var onemonthbackdate=new Date(curfromdate.setMonth(curfromdate.getMonth()-1));
       $('#fromdate').jqxDateTimeInput('setDate', onemonthbackdate); 
     });

function funreload(event)
{
	if(document.getElementById("cmbbranch").value==""){
		$.messager.alert('Warning','Please Select Branch');
		return false;
	}
	var dateval=funDateInPeriod($('#todate').jqxDateTimeInput('getDate'));
	//alert(dateval);
	if(dateval==1){
		 var branch=document.getElementById("cmbbranch").value;
	     var fromdate=$('#fromdate').jqxDateTimeInput('val');
	     var todate=$('#todate').jqxDateTimeInput('val');
	  
	    	 $("#overlay, #PleaseWait").show();
	    	 $("#costupdatediv").load("costupdateGrid.jsp?branch="+branch+"&fromdate="+fromdate+"&todate="+todate+"&id=1");   	 
	}
	}
	

	function setValues(){

		 if($('#msg').val()!=""){
   		   $.messager.alert('Message',$('#msg').val());
		   $("#overlay, #PleaseWait").hide();
   		  }
		
		 
	}
	function funExportBtn(){
		 $("#vehUtilizeGrid").jqxGrid('exportdata', 'xls', 'Vehicle Utilization');
		
		
	}

	
	function funClearData(){
		$('input[type=text],[type=hidden]').val('');
		
	}

	function funPost(){
		var rows = $("#costupdateGrid").jqxGrid('selectedrowindexes');
		document.getElementById("hidtrno").value="";
		for(var i=0;i<rows.length;i++){
    		var dummy=$('#costupdateGrid').jqxGrid('getcellvalue',rows[i],'tr_no');
    		
    		if(rows.length==1){
    			document.getElementById("hidtrno").value=dummy+",";
    		}
    		else{
    			document.getElementById("hidtrno").value+=dummy+",";
    		}
    	}
		//alert("==hidtrno====="+document.getElementById("hidtrno").value);
		document.getElementById("mode").value="A";
		$("#overlay, #PleaseWait").show();
		document.getElementById("frmCostUpdate").submit();
	}
</script>
</head>
<body onload="getBranch();setValues();">
<form id="frmCostUpdate" method="post" action="saveCostUpdate">
<div id="mainBG" class="homeContent" data-type="background"> 
<div class='hidden-scrollbar'>
<table width="100%">
<tr>
<td width="20%" align="center">
    <fieldset style="background: #ECF8E0;">
	<table width="99%">
	<jsp:include page="../../heading.jsp"></jsp:include>

 <tr>
   <td width="37%" align="right"><label class="branch">From Date</label></td><td width="63%"><div id="fromdate"></div></td></tr>
 <tr>
   <td align="right"><label class="branch">To Date</label></td>
   <td><div id="todate"></div></td>
 </tr>
 

 
	<tr>
	<td colspan="2" style="border-top:2px solid #DCDDDE;">
	 
	<center><input type="button" name="btnclear" id="btnclear" value="Clear" class="myButtons" onclick="funClearData();">&nbsp;&nbsp;
	<input type="button" name="btnpost" id="btnpost" value="Post" class="myButtons" onclick="funPost();">
	</center>
   
    </td>
	</tr>
		  <tr>
   <td colspan="2" align="right">
 <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
   </td>
 </tr>
	</table>
	</fieldset>
</td>
<td width="80%">
	<table width="100%">
		<tr>
			 <td> <div id="costupdatediv"> <jsp:include page="costupdateGrid.jsp"></jsp:include> </div> 		
			 </td>
			 <input type="hidden" name="mode" id="mode" value='<s:property value="mode"/>'>
			  <input type="hidden" name="msg" id="msg" value='<s:property value="msg"/>'>
			  <input type="hidden" name="hidtrno" id="hidtrno">
			  
		</tr>
	</table>
</tr>
</table>
</div>

</div>

</form>
</body>
</html>