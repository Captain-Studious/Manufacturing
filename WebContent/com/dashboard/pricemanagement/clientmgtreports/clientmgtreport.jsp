 
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
.branch1 {
	color: black;
	 
	width: 100%;
	font-family: Tahoma;
	font-size: 10px;
}
</style>

<script type="text/javascript">

$(document).ready(function () {
	

	  $("body").prepend('<div id="overlay" class="ui-widget-overlay" style="z-index: 1; display: none;"></div>');
	     $("body").prepend("<div id='PleaseWait' style='display: none;position:absolute; z-index: 1;top:180px;right:550px;'><img src='../../../../icons/31load.gif'/></div>");
	     $('#accountSearchwindow').jqxWindow({ width: '50%', height: '62%',  maxHeight: '75%' ,maxWidth: '50%' , title: 'Client Search' ,position: { x: 150, y: 60 }, keyboardCloseKey: 27});
		   $('#accountSearchwindow').jqxWindow('close');
 
	/*  $("#fromdate").jqxDateTimeInput({ width: '125px', height: '15px',formatString:"dd.MM.yyyy"});
	 $("#todate").jqxDateTimeInput({ width: '125px', height: '15px',formatString:"dd.MM.yyyy"});
	 var fromdates=new Date($('#fromdate').jqxDateTimeInput('getDate'));
	 var onemounth=new Date(new Date(fromdates).setMonth(fromdates.getMonth()-1)); 
	    
     $('#fromdate').jqxDateTimeInput('setDate', new Date(onemounth));
	 $('#todate').on('change', function (event) {
			
		   var fromdates=new Date($('#fromdate').jqxDateTimeInput('getDate'));
		 
		  // out date
		 	 var todates=new Date($('#todate').jqxDateTimeInput('getDate')); //del date
		 	 
		   if(fromdates>todates){
			   
			   $.messager.alert('Message','To Date Less Than From Date  ','warning');   
			 
		   return false;
		  }   
	 });
	 
	  */
	   $('#clientname').dblclick(function(){
	    
	    	
	    		
		  	    $('#accountSearchwindow').jqxWindow('open');
		  	
		  	  accountSearchContent('accountsDetailsSearch.jsp?');
	    		 
	  });   
	  
});
function getaccountdetails(event){
	 var x= event.keyCode;
 	

		
	 if(x==114){
	  $('#accountSearchwindow').jqxWindow('open');
	
	 accountSearchContent('accountsDetailsSearch.jsp?');    }
	 else{
		 }
		 
	 }  
 function accountSearchContent(url) {

    $.get(url).done(function (data) {

  $('#accountSearchwindow').jqxWindow('setContent', data);

}); 
	}
function funExportBtn(){
	JSONToCSVCon(datas1, 'Client Management List', true);
	 }

 
function funreload(event)
{

/* 	  var fromdates=new Date($('#fromdate').jqxDateTimeInput('getDate'));
		 
	  // out date
	 	 var todates=new Date($('#todate').jqxDateTimeInput('getDate')); //del date
	 	 
	   if(fromdates>todates){
		   
		   $.messager.alert('Message','To Date Less Than From Date  ','warning');   
		 
	   return false;
	  } 
	   else
		   { */
	 var barchval = document.getElementById("cmbbranch").value;
     var fromdate="";
	 var todate="";
	 var statusselect="";
	 
	 var cldocno=$("#cldocno").val();
	 
	   $("#overlay, #PleaseWait").show();
	  $("#listdiv").load("listGrid.jsp?barchval="+barchval+"&fromdate="+fromdate+"&todate="+todate+"&statusselect="+statusselect+"&cldocno="+cldocno);
	
		  /*  } */
	}

function getcat() {
	var x = new XMLHttpRequest();
	x.onreadystatechange = function() {
		if (x.readyState == 4 && x.status == 200) {
			var items = x.responseText;
		//alert(items);
			items = items.split('####');
			
			var catid  = items[0].split(",");
			var cat = items[1].split(",");
		 	var optionsbranch = ' ';  
			for (var i = 0; i < cat.length; i++) {
				optionsbranch += '<option value="' + catid[i].trim() + '">'
						+ cat[i] + '</option>';
			}
			$("select#cat").html(optionsbranch);
			/* if ($('#hidcmbbranch').val() != null) {
				$('#cmbbranch').val($('#hidcmbbranch').val());
			} */
		} else {
			//alert("Error");
		}
	}
	x.open("GET","getcat.jsp", true);
	x.send();
}	



function funupdatesdata()
{
	  
		$.messager.confirm('Message', 'Do you want to save changes?', function(r){
		 	  
		     
		   	if(r==false)
		   	  {
		   		
		   	  }
		   	else
		   		{   var remarks=$("#remarks").val();
		   		if(remarks=="")
		   			{
		   		  $.messager.alert('Message','Enter Reason ','warning');    
		   		  return 0;
		   		  
		   			}
 
				   var cldocno="";
				   var rows = $("#client").jqxGrid('getrows');
				   for(var i=0 ; i < rows.length ; i++){
					   if(rows[i].cellselects=="1")
						   {
						   cldocno=cldocno+rows[i].cldocno+"::";
						   }
					 
				   } 
				   

		   		savedatas(cldocno);
		   		}
				   
		   	 
		   	
		}); 
}
function savedatas(cldocno){
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
				    
				  funreload(event);
					/*	document.getElementById("discountval").value="";
				  
				 	document.getElementById("rowindexs").value="";
				 	document.getElementById("std_cost").value="";
				 	document.getElementById("psrno").value="";
				 	document.getElementById("type").value="BR";
				 	
				 	document.getElementById("name").value="";
				 	document.getElementById("brandid").value="";
				 	document.getElementById("catid").value="";
				 	document.getElementById("subcatid").value="";
			 */	 	getcat(); 
				 	dis();

				  
				 	
				}
			else
				{
				$.messager.alert('Message', '  Not Updated ', function(r){  
				     
			     });
				}  
		}
		}
	x.open("GET","savedata.jsp?&cldocno="+cldocno+'&cat='+document.getElementById("cat").value+'&reason='+$("#remarks").val().replace(/ /g, "%20")+'&dtype=CMT');
		x.send();
	}
	
	function dis()
	{
		 
		
		 $('#remarks').val('');
		 
		 $('#updatdata1').attr("disabled", true);
		 $('#cat').attr("disabled", true);
	}
	function hidebranch()
	{
	 
		  $("#branchdiv").hide();
		  $("#branchlabel").hide();
		 
	}
	function funcleardata()
	{
		 $('#clientname').val('');
		 $('#cldocno').val('');
		
	}
</script>
</head>
<body onload="getBranch();getcat();dis();hidebranch();">
<div id="mainBG" class="homeContent" data-type="background"> 
<div class='hidden-scrollbar'>
<table width="100%" >
<tr>
<td width="20%" >
    <fieldset style="background: #ECF8E0;">
	<table width="100%"  >
	<jsp:include page="../../heading.jsp"></jsp:include>
		
<%--  
	  <tr><td  align="right" ><label class="branch">&nbsp;</label></td><td align="left"><div hidden="true" id='fromdate' name='fromdate' value='<s:property value="fromdate"/>'></div>
                    </td></tr>
                    
                    
                     <tr><td  align="right" ><label class="branch">&nbsp;</label></td><td align="left"><div  hidden="true" id='todate' name='todate' value='<s:property value="todate"/>'></div>
                    </td></tr> --%>
 	 <tr><td colspan="2">&nbsp;</td></tr>
<tr>
<td align="right"><label class="branch">Client</label></td>
    <td  ><input type="text" name="clientname" id="clientname" value='<s:property value="clientname"/>' readonly="readonly" placeholder="Press F3 To Search"   style="height:20px;width:100%;" onKeyDown="getaccountdetails(event);" >  </td></tr>
 
 <tr><td colspan="2">&nbsp;</td></tr>
 <tr><td colspan="2" align="center"><input type="button" class="myButtons" name="clear" id="clear"  value="Clear" onclick="funcleardata()"></td></tr>
 
    <tr><td colspan="2">&nbsp;</td></tr>
	<tr><td    colspan="2" >  
  
 
  <table width="100%"  hidden="true">
	              <tr><td  align="right" ><label class="branch1">Category</label></td><td  align="left"  > <select   id="cat" name="cat"   style="width: 95%;height:20PX;font-size: 11px"  >
                    <option></option>
                     </select>
                     
                       </td></tr>
	   <tr><td  align="right" ><label class="branch1">Reason</label></td><td  align="left" ><input type="text" id="remarks" name="remarks" style="width: 100%;height:20PX;"  style="width: 75%;" value='<s:property value="remarks"/>'></td></tr>
     <tr><td  align="right" colspan="2" >  &nbsp; </td></tr>
 
  <tr><td  align="center" colspan="2"> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="button" name="updatdata1" id="updatdata1" class="myButton" value="Update" onclick="funupdatesdata()"></td></tr>
   </table>

 
</td></tr>
 <tr><td colspan="2">&nbsp;</td></tr>
  <tr><td colspan="2">&nbsp;</td></tr>
   <tr><td colspan="2">&nbsp;</td></tr>
    <tr><td colspan="2">&nbsp;</td></tr>
     <tr><td colspan="2">&nbsp;</td></tr>
      <tr><td colspan="2">&nbsp;</td></tr>
       <tr><td colspan="2">&nbsp;</td></tr>
	<tr>
	<td colspan="2"><div id='paychaaaaa' style="width: 100% ; align:right; height: 90px;"></div></td>
	</tr>	
	</table>
	</fieldset>
   <input type="hidden" id="cldocno" name="cldocno" value='<s:property value="cldocno"/>'>
</td>
<td width="80%">
	<table width="100%">
		<tr>
			 <td><div id="listdiv"><jsp:include page="listGrid.jsp"></jsp:include></div></td>
		</tr>
	</table>
</tr>
</table>

</div>
<div id="accountSearchwindow">
   <div ></div>
</div> 
</div>
</body>
</html>