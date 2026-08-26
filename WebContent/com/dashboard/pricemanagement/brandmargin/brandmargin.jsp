 
<jsp:include page="../../../../includes.jsp"></jsp:include>    
<%@ taglib prefix="s" uri="/struts-tags" %>

<!DOCTYPE html>
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>GatewayERP(i)</title>
<link href="../../../../css/dashboard.css" media="screen" rel="stylesheet" type="text/css" />  
<%-- <script type="text/javascript" src="../../js/dashboard.js"></script> --%> 

<style type="text/css">
 
.myButtons {
	-moz-box-shadow:inset 0px -1px 3px 0px #91b8b3;
	-webkit-box-shadow:inset 0px -1px 3px 0px #91b8b3;
	box-shadow:inset 0px -1px 3px 0px #91b8b3;
	background:-webkit-gradient(linear, left top, left bottom, color-stop(0.05, #768d87), color-stop(1, #6c7c7c));
	background:-moz-linear-gradient(top, #768d87 5%, #6c7c7c 100%);
	background:-webkit-linear-gradient(top, #768d87 5%, #6c7c7c 100%);
	background:-o-linear-gradient(top, #768d87 5%, #6c7c7c 100%);
	background:-ms-linear-gradient(top, #768d87 5%, #6c7c7c 100%);
	background:linear-gradient(to bottom, #768d87 5%, #6c7c7c 100%);
	filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#768d87', endColorstr='#6c7c7c',GradientType=0);
	background-color:#768d87;
	border:1px solid #566963;
	display:inline-block;
	cursor:pointer;
	color:#ffffff;
	
	font-size:8pt;
	
	padding:3px 17px;
	text-decoration:none;
	text-shadow:0px -1px 0px #2b665e;
}
.myButtons:hover {
	background:-webkit-gradient(linear, left top, left bottom, color-stop(0.05, #6c7c7c), color-stop(1, #768d87));
	background:-moz-linear-gradient(top, #6c7c7c 5%, #768d87 100%);
	background:-webkit-linear-gradient(top, #6c7c7c 5%, #768d87 100%);
	background:-o-linear-gradient(top, #6c7c7c 5%, #768d87 100%);
	background:-ms-linear-gradient(top, #6c7c7c 5%, #768d87 100%);
	background:linear-gradient(to bottom, #6c7c7c 5%, #768d87 100%);
	filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#6c7c7c', endColorstr='#768d87',GradientType=0);
	background-color:#6c7c7c;
}
.myButtons:active {
	position:relative;
	top:1px;
}

</style>

<script type="text/javascript">

$(document).ready(function () {
	

	  $("body").prepend('<div id="overlay" class="ui-widget-overlay" style="z-index: 1; display: none;"></div>');
	     $("body").prepend("<div id='PleaseWait' style='display: none;position:absolute; z-index: 1;top:180px;right:550px;'><img src='../../../../icons/31load.gif'/></div>");
 
	 $("#fromdate").jqxDateTimeInput({ width: '125px', height: '15px',formatString:"dd.MM.yyyy"});
	 $("#todate").jqxDateTimeInput({ width: '125px', height: '15px',formatString:"dd.MM.yyyy"});
	 var fromdates=new Date($('#fromdate').jqxDateTimeInput('getDate'));
	 var onemounth=new Date(new Date(fromdates).setMonth(fromdates.getMonth()-1)); 
	    
     $('#fromdate').jqxDateTimeInput('setDate', new Date(onemounth));
/* 	 $('#todate').on('change', function (event) {
			
		   var fromdates=new Date($('#fromdate').jqxDateTimeInput('getDate'));
		 
		  // out date
		 	 var todates=new Date($('#todate').jqxDateTimeInput('getDate')); //del date
		 	 
		   if(fromdates>todates){
			   
			   $.messager.alert('Message','To Date Less Than From Date  ','warning');   
			 
		   return false;
		  }   
	 });
	 
	  */
	   
	  
});

function funExportBtn(){
	//   $("#orderlist").jqxGrid('exportdata', 'xls', 'Puchase Order List');
	 }

 
function funreload(event)
{

	    
	 var barchval = document.getElementById("cmbbranch").value;
	 $("#sidelistgrid").jqxGrid('clear');
	  $("#sidelistgrid").jqxGrid('addrow', null, {});
	 $("#sidelistgrid").jqxGrid({ disabled: true});
	 
	   $("#overlay, #PleaseWait").show();
	  $("#mainlistdiv").load("mainlistGrid.jsp?barchval="+barchval);
	
		    
	}
	
 
 function funupdate()
 {
 
	 
	 	var listss = new Array();
	 	var rows = $("#sidelistgrid").jqxGrid('getrows');
	   for(var i=0 ; i < rows.length-1 ; i++){
		   
		   if((rows[i].tos>0) ||  (rows[i].tos=0))
		   { 
		   
		   if((rows[i].permargin>0) ||  (rows[i].permargin=0))
		   { 
			 
	  listss.push(rows[i].froms+"::"+rows[i].tos+"::"+rows[i].permargin); 
		   }
		   }
	   }
	 
	   ajaxcall(listss); 
 }
    
 
	  
	 
 
 
  function ajaxcall(listss){
		var x=new XMLHttpRequest();
		x.onreadystatechange=function(){
			if (x.readyState==4 && x.status==200)
				{
				 var items= x.responseText;
				 	var itemval=items.trim();
				 	
				 	//alert(items);
				 	
        if(parseInt(itemval)==1)
        	{
				 	$.messager.alert('Message', '  Record successfully Updated ', function(r){
					     
				     });
				 	 $("#sidelistgrid").jqxGrid('clear');
					  $("#sidelistgrid").jqxGrid('addrow', null, {});
				 	hidebranch();
				}
			else
				{
				$.messager.alert('Message', '  Not Updated ', function(r){
				     
			     });
				}  
		}
		}
	x.open("GET","marginsavedata.jsp?list="+listss+'&branddocno='+document.getElementById("branddocno").value);
		x.send();
	}  
	
	
	function hidebranch()
	{
		
		 
		document.getElementById("branddocno").value="";
		  $("#branchdiv").hide();
		  $("#branchlabel").hide();
		  $('#updatdata').attr('disabled', true);
			 $("#sidelistgrid").jqxGrid({ disabled: true});
	}
	
	
</script>




</head>
<body onload="getBranch();hidebranch();">
<div id="mainBG" class="homeContent" data-type="background"> 
<div class='hidden-scrollbar'>
<table width="100%" >
<tr>
<td width="20%" >
    <fieldset style="background: #ECF8E0;">
	<table width="100%"  >
	<jsp:include page="../../heading.jsp"></jsp:include> 
		
	  
	  <tr><td  align="right" ><label class="branch">&nbsp;</label></td><td align="left"><div id='fromdate' hidden="true" name='fromdate' value='<s:property value="fromdate"/>'></div>
                    </td></tr>
                     <tr><td  align="right" ><label class="branch">&nbsp;</label></td><td align="left"><div id='todate' hidden="true" name='todate' value='<s:property value="todate"/>'></div>
                    </td></tr>
   <tr><td colspan="2"><div id="sidelistdiv"><jsp:include page="listGrid.jsp"></jsp:include></div></td></tr> 
	 	 <tr><td  align="right" colspan="2" >  &nbsp;             </td></tr>	 
 	<tr><td  align="center" colspan="2"><input type="Button" name="updatdata" id="updatdata" class="myButton" value="Update" onclick="funupdate()">
 	
 	
 	<input type="hidden" name="branddocno" id="branddocno"   value='<s:property value="branddocno"/>'>
 	</td></tr>
 	
 	 	 <tr><td  align="right" colspan="2" >  &nbsp;             </td></tr>	
	</table>
	</fieldset>


</td>
<td width="80%">
	<table width="100%">
		<tr>
			 <td><div id="mainlistdiv"><jsp:include page="mainlistGrid.jsp"></jsp:include></div></td>
		</tr>
		
		

		
	</table>
</tr>
</table>

</div>
  
</div>
</body>
</html>