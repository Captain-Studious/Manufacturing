  
<jsp:include page="../../../../includes.jsp"></jsp:include>    
<%@ taglib prefix="s" uri="/struts-tags" %>
<%
	String contextPath=request.getContextPath();
 %>
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
	getmastertype();

	  $("body").prepend('<div id="overlay" class="ui-widget-overlay" style="z-index: 1; display: none;"></div>');
	     $("body").prepend("<div id='PleaseWait' style='display: none;position:absolute; z-index: 1;top:180px;right:550px;'><img src='../../../../icons/31load.gif'/></div>");
	     $('#productDetailsWindow').jqxWindow({width: '51%', height: '58%',  maxHeight: '70%' ,maxWidth: '51%' , title: 'Products Search',position: { x: 300, y: 87 } , theme: 'energyblue', showCloseButton: true, keyboardCloseKey: 27});
		 $('#productDetailsWindow').jqxWindow('close');
			$('#yomsearchwindow').jqxWindow({
				width : '25%',
				height : '58%',
				maxHeight : '70%',
				maxWidth : '45%',
				title : 'Yom Search',
				position : {
					x : 420,
					y : 87
				},
				theme : 'energyblue',
				showCloseButton : true,
				keyboardCloseKey : 27
			});
			$('#yomsearchwindow').jqxWindow('close');
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
	 }); */
	 $("#updatdata").attr("disabled",true);
	 $('#txtpartno').dblclick(function(){
		 productSearchContent('productSearch.jsp?type='+document.getElementById("cmbmastertype").value);
	 }); 
	  
	   
	  
});
function getProduct(event){
    var x= event.keyCode;
    if(x==114){
	
	 
		 productSearchContent('productSearch.jsp?type='+document.getElementById("cmbmastertype").value);
    }
    else{
     }
    }

function productSearchContent(url) {
    $('#productDetailsWindow').jqxWindow('open');
	$.get(url).done(function (data) {
	$('#productDetailsWindow').jqxWindow('setContent', data);
	$('#productDetailsWindow').jqxWindow('bringToFront');
}); 
}
function yomSearchContent(url) {
	$('#yomsearchwindow').jqxWindow('open');
	$.get(url).done(function(data) {
		$('#yomsearchwindow').jqxWindow('setContent', data);
		$('#yomsearchwindow').jqxWindow('bringToFront');
	});
}

function funExportBtn(){
	   //$("#orderlist").jqxGrid('exportdata', 'xls', 'Puchase Order List');
	 }

 
function funreload(event)
{

 
	 
	 
	   $("#overlay, #PleaseWait").show();
	  $("#sidelistdiv").load("listGrid.jsp?doc_no="+document.getElementById("cmbmastertype").value);
	 
	 
		   
	}
	

function funupdates()
{
	  
		$.messager.confirm('Message', 'Do you want to save changes?', function(r){
		 	  
		     
		   	if(r==false)
		   	  {
		   		
		   	  }
		   	else
		   		{
		   		
		   	   $("#overlay, #PleaseWait").show();
		   	var selectedrows=$("#suitlistgrid").jqxGrid('selectedrowindexes');
			selectedrows = selectedrows.sort(function(a,b){return a - b});
			document.getElementById("gridlenght").value=selectedrows.length;
	 		for(var i=0;i<selectedrows.length;i++){
	 			newTextBox = $(document.createElement("input"))
			       	.attr("type", "dil")
			       	.attr("id", "savetest"+i)
			       	.attr("name", "savetest"+i)  
			    	.attr("hidden", "true"); 
	 			
	 		 
	 			 
			     	newTextBox.val($("#suitlistgrid").jqxGrid('getcellvalue',selectedrows[i],'yomfrm')+"::"+
			     			$("#suitlistgrid").jqxGrid('getcellvalue',selectedrows[i],'yomfrmid')+"::"+
			     			$("#suitlistgrid").jqxGrid('getcellvalue',selectedrows[i],'yomto')+"::"+
			     			$("#suitlistgrid").jqxGrid('getcellvalue',selectedrows[i],'yomtoid')+"::"+
			     			$("#suitlistgrid").jqxGrid('getcellvalue',selectedrows[i],'brandid')+"::"+
			     			$("#suitlistgrid").jqxGrid('getcellvalue',selectedrows[i],'modelid')+"::"+
			     			$("#suitlistgrid").jqxGrid('getcellvalue',selectedrows[i],'submodelid')+"::"+
			     			$("#suitlistgrid").jqxGrid('getcellvalue',selectedrows[i],'esizeid')+"::"+
			     			$("#suitlistgrid").jqxGrid('getcellvalue',selectedrows[i],'bsizeid')+"::"+
			     			$("#suitlistgrid").jqxGrid('getcellvalue',selectedrows[i],'csizeid')+"::"+
			     			$("#suitlistgrid").jqxGrid('getcellvalue',selectedrows[i],'yomfrm1')+"::"+
			     			$("#suitlistgrid").jqxGrid('getcellvalue',selectedrows[i],'yomfrmid1')+"::"+
			       			$("#suitlistgrid").jqxGrid('getcellvalue',selectedrows[i],'yomto1')+"::"+
			     			$("#suitlistgrid").jqxGrid('getcellvalue',selectedrows[i],'yomtoid1')+"::");
			     	
			     	
			     	
			     	
			        newTextBox.appendTo('form');
			        
			        
			      
	 		}
	 		
	 		
	 		 
	 		 document.getElementById("suitform").submit();
	 
		   		}	
		}); 
}
 
  function funupdates1()
  {
	  
		$.messager.confirm('Message', 'Do you want to save changes?', function(r){
		 	  
		     
		   	if(r==false)
		   	  {
		   		
		   	  }
		   	else
		   		{
		   		
		   	   $("#overlay, #PleaseWait").show();
		   		
		var listss = new Array();
	  
	 	  var j=0;
		 	var rows = $("#mainlistgrid1").jqxGrid('getrows');
			
	 
			
	        var selectedrows=$("#mainlistgrid").jqxGrid('selectedrowindexes');
	        
 
			selectedrows = selectedrows.sort(function(a,b){return a - b});
	 
	 
		
			
		   for(var i=0 ; i < rows.length ; i++){
			  
		    if(selectedrows[j]==i){
					
		    	  listss.push(rows[i].doc_no+"::");  
			 
				 j++; 
			  
			   }
			 
	 	
		   }
 
   save(listss);
		   		}
		   	
		}); 
  }
  function save(listss){
		var x=new XMLHttpRequest();
		x.onreadystatechange=function(){
			if (x.readyState==4 && x.status==200)
				{
				 var items= x.responseText;
				 	var itemval=items.trim();
				    $("#overlay, #PleaseWait").hide();
				 	//alert(items);
				 	
      if(parseInt(itemval)==1)
      	{
				 	$.messager.alert('Message', '  Record successfully Updated ', function(r){
					     
				     });
	 
		 
					  $("#updatdata").attr("disabled",true);  
	  		   
					  $("#cmbmastertype").attr("disabled",true);  
					  $("#sidelistgrid").jqxGrid('clear');
					  $("#mainlistgrid").jqxGrid('clear');
				 
					   $("#overlay, #PleaseWait").show();
					  $("#sidelistdiv").load("listGrid.jsp?doc_no=2");
				 	
				}
			else
				{
				$.messager.alert('Message', '  Not Updated ', function(r){
				     
			     });
				}  
		}
		}
	x.open("POST","savedata.jsp?list="+listss+'&type='+document.getElementById("cmbmastertype").value);
		x.send();
	}
  
	function hidebranch()
	{
	 
		  $("#branchdiv").hide();
		  $("#branchlabel").hide();
		 
			  
		  
		  
	  	   
		  var msgchk= document.getElementById("msgchk").value;
		  var loadchk= document.getElementById("loadchk").value;
		  
		  if(loadchk=="load")
			  {
			   
			  document.getElementById("lbldetail").innerText=document.getElementById("lbldetail1").value;
				  document.getElementById("lbldetailname").innerText=document.getElementById("lbldetailname1").value;
				  
				  
				  
			  
					if ($('#hidcmbmastertype').val() != "") {
						$('#cmbmastertype').val($('#hidcmbmastertype').val());
					}
				  
				  $("#updatdata").attr("disabled",false); 
				  $("#sidelistdiv").load("listGrid.jsp?doc_no="+document.getElementById("hidcmbmastertype").value);
		  		 
					var suitstatus= "YES";
			    	 var doc_no=document.getElementById("hidcmbmastertype").value;
			    		 
			    		 var psrno=document.getElementById("prddocno").value ;
			     
			    		 
			    	 var load="load";
			   
			    	   $("#overlay, #PleaseWait").show();
			    	  $("#mainlistdiv").load("mainlistGrid.jsp?&doc_no="+doc_no+"&load="+load+"&psrno="+psrno+"&suitstatus="+suitstatus);
			    	  
		 

				   $("#overlay, #PleaseWait").show();
				  $("#mainlistdiv1").load("suitGrid.jsp?&doc_no="+doc_no+"&load="+load+"&suitstatus="+suitstatus+"&prddocno="+psrno);
				  
			    	  
				  document.getElementById("name1").innerText="Product :";
			    	 document.getElementById("name2").innerText="Product Name :";
			     
			   	  document.getElementById("productid").innerText=document.getElementById("prdno").value;
				  document.getElementById("productname").innerText=document.getElementById("prdname").value;
				  
			    	  
			  
			  if(msgchk=="save")
			  {
				  $.messager.alert('Message', '  Record successfully Updated ', function(r){
					     
				     });
	 
		 
					 
					  
					/*   cleardatss(); */
				  
			  }
			  else
				  {
			  
				$.messager.alert('Message', '  Not Updated ', function(r){
				     
			     });

			    
				 /*  $("#sidelistgrid").jqxGrid('clear');
				  $("#mainlistgrid").jqxGrid('clear');
		  */
				
				  }
			  }
		    
		 
	}
	
	
 
   
   
	function getmastertype() {
		var x = new XMLHttpRequest();
		x.onreadystatechange = function() {
			if (x.readyState == 4 && x.status == 200) {
				items = x.responseText;
				items = items.split('###');
				
				 
				var brandItems = items[0].split(",");
				var brandidItems = items[1].split(",");
				var optionsbrand;
				for (var i = 0; i < brandItems.length; i++) {
					optionsbrand += '<option value="' + brandidItems[i] + '">'
							+ brandItems[i] + '</option>';
					/* document.getElementById("brandid").value=brandidItems[i]; */
				}

				$("select#cmbmastertype").html(optionsbrand);
				 
				
				if ($('#hidcmbmastertype').val() != "") {
					$('#cmbmastertype').val($('#hidcmbmastertype').val());
				}
				
		
			} else {
			}
		}
		x.open("GET", "getmastertype.jsp", true);
		x.send();
	}
 function funClearData()
 {
	 $('#txtpartno').val('');
	 $('#psrno').val('');
	 $('#txtproductname').val('');
	 
 }
   
 function cleardatss()
 {
	 $("#suitlistgrid").jqxGrid('clear');
	  $("#mainlistgrid").jqxGrid('clear');
	  
	  document.getElementById("name1").innerText="";
 	 document.getElementById("name2").innerText="";
  
 	 document.getElementById("productid").innerText="";
 	 document.getElementById("productname").innerText="";
 	 
 	 
 	 $("#sidelistgrid").jqxGrid('clear');
 	 
 	   $("#sidelistgrid").jqxGrid('addrow', null, {});
 	 funClearData();
 }
 
 
</script>
</head>
<body onload="getBranch();hidebranch();getmastertype();">
<div id="mainBG" class="homeContent" data-type="background"> 
<div class='hidden-scrollbar'>

<form id="suitform" action="suitsaveAction" method="post">

<table width="100%" >
<tr>
<td width="20%" >
    <fieldset style="background: #ECF8E0;">
	<table width="100%"  >
	<jsp:include page="../../heading.jsp"></jsp:include>
		
	   <tr><td  align="right" colspan="2" >&nbsp;</td></tr>	
	   
 
       
       	 <tr><td  align="right" >
 
 
 
	  	<label class="branch1" >Type</label></td><td>
	 	 
       <select  name="cmbmastertype" id="cmbmastertype"  value='<s:property value="cmbmastertype"/>' onchange="cleardatss()" style="width:100%;"><option ></option></select></td></tr>
 	   
      <tr><td align="right"><label class="branch">Product</label></td>
	<td align="left"><input type="text" id="txtpartno" name="txtpartno" style="width:80%;height:20px;" readonly="readonly" placeholder="Press F3 to Search" value='<s:property value="txtpartno"/>' onKeyDown="getProduct(event);"/></td></tr>
	<input type="hidden" id="psrno" name="psrno" value='<s:property value="psrno"/>' /> 
	<tr><td>&nbsp;</td>
	<td><input type="text" id="txtproductname" name="txtproductname" style="width:100%;height:20px;" readonly="readonly" value='<s:property value="txtproductname"/>' tabindex="-1"/></td></tr> 
	
 
           	 <tr><td  align="right" colspan="2" >&nbsp;</td></tr>   
           	 
           	 
           	     <tr>
	  
	<td colspan="2" ><center><input type="button" name="btnclear" id="btnclear" value="Clear" class="myButtons" onclick="funClearData();"></center>
    </td>
	</tr>     
              <tr><td  align="right" colspan="2" >&nbsp;</td></tr>          
   <tr><td colspan="2"><div id="sidelistdiv"><jsp:include page="listGrid.jsp"></jsp:include></div></td></tr> 
	
	 	  
 	     <tr><td  align="right" colspan="2" >&nbsp;</td></tr>           
 	   
 	           
 	     <tr><td  align="right" colspan="2" >&nbsp;</td></tr>           
 	       <tr><td  align="center" colspan="2"><input type="Button" name="updatdata" id="updatdata" class="myButton" value="Update" onclick="funupdates()"></td></tr>	     
 	          
 	          
 	     <tr><td  align="right" colspan="2" >&nbsp;</td></tr>           
  
 
	</table>
	</fieldset>


</td>
<td width="80%">
	<table width="100%">
		<tr>
			 <td colspan="2"><div id="mainlistdiv"><jsp:include page="mainlistGrid.jsp"></jsp:include></div></td>
		</tr>
		
			 <tr>    <td align="left"  colspan="2"  height="28" >&nbsp;<font    size="2.5px"> <b><label id=name1></label></b></font> <font color="#0000ff" size="2.5px"><b> <label id=productid></label></b></font>  
			  &nbsp;&nbsp;&nbsp;<font   size="2.5px"> <b><label id=name2></label></b></font> <font color="#0000ff" size="2.5px"> <b><label id=productname></label></b></font> </td>  </tr>
		 
		
	 <tr>
			 <td colspan="2"><div id="mainlistdiv1"><jsp:include page="suitGrid.jsp"></jsp:include></div></td>
		</tr>
		
		
	</table>
</tr>
</table>




<input type="hidden" id="hidcmbmastertype" name="hidcmbmastertype" value='<s:property value="hidcmbmastertype"/>' /> 

<input type="hidden" id="prdno" name="prdno" value='<s:property value="prdno"/>' /> 
<input type="hidden" id="prdname" name="prdname" value='<s:property value="prdname"/>' /> 



<input type="hidden" id="prddocno" name="prddocno" value='<s:property value="prddocno"/>' /> 
<input type="hidden" id="gridlenght" name="gridlenght" value='<s:property value="gridlenght"/>' /> 

<input  type="hidden" id="msgchk" name="msgchk" value='<s:property value="msgchk"/>' /> 
<input  type="hidden" id="loadchk" name="loadchk" value='<s:property value="loadchk"/>' /> 
<input  type="hidden" id="lbldetail1" name="lbldetail1" value='<s:property value="lbldetail1"/>' /> 
<input  type="hidden" id="lbldetailname1" name="lbldetailname1" value='<s:property value="lbldetailname1"/>' /> 
  


</form>
</div>
  
<div id="productDetailsWindow">
 <div></div>
</div>
<div id="yomsearchwindow">
 <div></div>
</div>


</div>
</body>
</html>