
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
	 $('#todate').jqxDateTimeInput({ disabled: true}); 
     $('#fromdate').jqxDateTimeInput('setDate', new Date(onemounth));
	 $('#fromdate').on('change', function (event) {
		 $('#todate').jqxDateTimeInput({ disabled: false});
		   var fromdates=new Date($('#fromdate').jqxDateTimeInput('getDate'));
		 
		  // out date
		 	 var todates=new Date($('#todate').jqxDateTimeInput('getDate')); //del date
		 	 
		   if(fromdates>todates){
			   
			   $.messager.alert('Message','To Date Less Than From Date  ','warning');   
			   $('#todate').jqxDateTimeInput({ disabled: true});
		   return false;
		  }   
		 	 
		 	 
		   $('#todate').jqxDateTimeInput({ disabled: true}); 	 
		 	 
	 });
	 $("#updatdata").attr("disabled",true);
		$('#catsearchwindow').jqxWindow({
			width : '25%',
			height : '58%',
			maxHeight : '70%',
			maxWidth : '45%',
			title : 'Category Search',
			position : {
				x : 420,
				y : 87
			},
			theme : 'energyblue',
			showCloseButton : true,
			keyboardCloseKey : 27
		});
		$('#catsearchwindow').jqxWindow('close');
		$('#subcatsearchwindow').jqxWindow({
			width : '25%',
			height : '58%',
			maxHeight : '70%',
			maxWidth : '45%',
			title : 'Sub Category Search',
			position : {
				x : 420,
				y : 87
			},
			theme : 'energyblue',
			showCloseButton : true,
			keyboardCloseKey : 27
		});
		$('#subcatsearchwindow').jqxWindow('close');
		
		$('#brandsearchwindow').jqxWindow({
			width : '25%',
			height : '58%',
			maxHeight : '70%',
			maxWidth : '70%',
			title : 'Brand Search',
			position : {
				x : 420,
				y : 87
			},
			theme : 'energyblue',
			showCloseButton : true,
			keyboardCloseKey : 27
		});
		$('#brandsearchwindow').jqxWindow('close');
		   $('#productwindow').jqxWindow({ width: '50%',height: '62%',  maxHeight: '80%'  ,maxWidth: '50%' , title: 'Product Search' ,position: { x: 250, y: 60 }, keyboardCloseKey: 27});
		   $('#productwindow').jqxWindow('close');   
		
		   
			 
		$('#name').dblclick(function(){
			 if($('#type').val()=="BR")
				 {
				 brandFormSearchContent('brandFormSearchGrid.jsp');  
				 } 
			 else if($('#type').val()=="CA")
				 {
				 catFormSearchContent('catFormSearchGrid.jsp'); 
				 }
			 else if($('#type').val()=="SC")
				 {
				 subCatFormSearchContent('subCatFormSearchGrid.jsp');
				 }
			 else if($('#type').val()=="PR")
			 {
				 productSearchContent('productSearch.jsp');
			 }
		
			
			
		}); 
		
		 
		
});
function brandFormSearchContent(url) {
	$('#brandsearchwindow').jqxWindow('open');
	$.get(url).done(function(data) {
		$('#brandsearchwindow').jqxWindow('setContent', data);
		$('#brandsearchwindow').jqxWindow('bringToFront');
	});
}
function subCatFormSearchContent(url) {
	$('#subcatsearchwindow').jqxWindow('open');
	$.get(url).done(function(data) {
		$('#subcatsearchwindow').jqxWindow('setContent', data);
		$('#subcatsearchwindow').jqxWindow('bringToFront');
	});
}
function catFormSearchContent(url) {
	$('#catsearchwindow').jqxWindow('open');
	$.get(url).done(function(data) {
		$('#catsearchwindow').jqxWindow('setContent', data);
		$('#catsearchwindow').jqxWindow('bringToFront');
	});
}

function productSearchContent(url) {
	$('#productwindow').jqxWindow('open');
	    $.get(url).done(function (data) {
	//alert(data);
	  $('#productwindow').jqxWindow('setContent', data);

	}); 
	}


function getname(event)
{
	if($('#type').val()=="BR")
	 {
	 brandFormSearchContent('brandFormSearchGrid.jsp');  
	 } 
else if($('#type').val()=="CA")
	 {
	 catFormSearchContent('catFormSearchGrid.jsp'); 
	 }
else if($('#type').val()=="SC")
	 {
	 subCatFormSearchContent('subCatFormSearchGrid.jsp');
	 }
else if($('#type').val()=="PR")
{
	 productSearchContent('productSearch.jsp');
}
	
	
	}


function funExportBtn(){
	   //$("#orderlist").jqxGrid('exportdata', 'xls', 'Puchase Order List');
	 }

 
function funreload(event)
{
	 $('#todate').jqxDateTimeInput({ disabled: false}); 
	  var fromdates=new Date($('#fromdate').jqxDateTimeInput('getDate'));
		 
	  // out date
	 	 var todates=new Date($('#todate').jqxDateTimeInput('getDate')); //del date
	 	 
	   if(fromdates>todates){
		   
		   $.messager.alert('Message','To Date Less Than From Date  ','warning');   
		 
	   return false;
	  } 
	   else
		   {
	 
		   
		   if(document.getElementById("salescount").value=="")
			   {
			   
			   $.messager.alert('Message','Enter Sales Count' ); 
			   document.getElementById("salescount").focus();
			   return 0;
			   }
	 var barchval = document.getElementById("cmbbranch").value;
     var fromdate= $("#fromdate").val();
	 var todate= $("#todate").val();
	 var salescount=document.getElementById("salescount").value;
	 
	 
	 var brandid=$("#brandid").val();
	 var catid=$("#catid").val();
	 var subcatid=$("#subcatid").val();                  
	 var psrno=$("#psrno").val();  
	   $("#overlay, #PleaseWait").show(); 
 	  $("#mainlistdiv").load("mainlistGrid.jsp?barchval="+barchval+"&fromdate="+fromdate+"&todate="+todate+"&salescount="+salescount+"&type="+type+"&brandid="+brandid+"&catid="+catid+"&subcatid="+subcatid+"&psrno="+psrno);
 
 	 $('#todate').jqxDateTimeInput({ disabled: true}); 
		   }
	}
	
 
  
  function funCalculate()
  {
	  
	  
		 $("#updatdata").attr("disabled",false);
	  var discountval=document.getElementById("discountval").value;
	  
	  if(discountval=="" || typeof(discountval)=="undefined")
			  {
		  $.messager.alert('Message', ' Enter Max Discount ', function(r){
			     
		     });
		  
		  
		  return 0;
			  }
	  
	 	var rows = $("#jqxpmgt").jqxGrid('getrows');
	    for(var i=0 ; i < rows.length ; i++){
	    	var pricegroup=rows[i].pricegroup;
	      	var counts=rows[i].counts;
	      	
	      	if(pricegroup>0)
	      		{
	     	if(pricegroup==1)
	    			{
	    			$('#jqxpmgt').jqxGrid('setcellvalue', i, "discount1",discountval);
	    			}
	     	else {
               var allowdiscount=(parseFloat(discountval)/parseInt(counts))*(counts-pricegroup+1);
	     		
	     		$('#jqxpmgt').jqxGrid('setcellvalue', i, "discount1",allowdiscount);
	     	}
	     		 
	      		}
	    	 
	    }
	  
  }
  function funupdates()
  {
	  
		$.messager.confirm('Message', 'Do you want to save changes?', function(r){
		 	  
		     
		   	if(r==false)
		   	  {
		   		
		   	  }
		   	else
		   		{
		var listss = new Array();
	 	var rows = $("#jqxpmgt").jqxGrid('getrows');
	   for(var i=0 ; i < rows.length ; i++){
		   
		   listss.push(rows[i].catid+"::"+rows[i].discount1+"::"+rows[i].pricegroup);  
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
				 	
				 	//alert(items);
				 	
      if(parseInt(itemval)==1)
      	{
				 	$.messager.alert('Message', '  Record successfully Updated ', function(r){
					     
				     });
				    
				 	funreload(event);
				 	document.getElementById("discountval").value="";
				  
				 	document.getElementById("rowindexs").value="";
				 	document.getElementById("std_cost").value="";
				 	document.getElementById("psrno").value="";
				 	document.getElementById("type").value="BR";
				 	
				 	document.getElementById("name").value="";
				 	document.getElementById("brandid").value="";
				 	document.getElementById("catid").value="";
				 	document.getElementById("subcatid").value="";
				 	
				 	
				     $("#jqxpmgt").jqxGrid('clear');
					 document.getElementById("name1").innerText="";
					 document.getElementById("name2").innerText="";
					 document.getElementById("name3").innerText="";
					 document.getElementById("productid").innerText="";
					 document.getElementById("productname").innerText="";
					 document.getElementById("productbrand").innerText="";
					  $("#updatdata").attr("disabled",true);  
				  
				 	
				}
			else
				{
				$.messager.alert('Message', '  Not Updated ', function(r){
				     
			     });
				}  
		}
		}
	x.open("GET","pricesavedata.jsp?list="+listss+'&psrno='+document.getElementById("psrno").value+'&std_cost='+document.getElementById("std_cost").value+'&fixing='+document.getElementById("fixing").value);
		x.send();
	}

 
	function hidebranch()
	{
	 
		  $("#branchdiv").hide();
		  $("#branchlabel").hide();
		 
	}
	function clearnames()
	
	
	{
		
		
		 $("#mainlistgrid").jqxGrid('clear');
		
		  $("#mainlistgrid").jqxGrid('addrow', null, {});
		  $("#jqxpmgt").jqxGrid('clear');
		 	 document.getElementById("name1").innerText="";
			 document.getElementById("name2").innerText="";
			 document.getElementById("name3").innerText="";
			 document.getElementById("productid").innerText="";
			 document.getElementById("productname").innerText="";
			 document.getElementById("productbrand").innerText="";
			 document.getElementById("discountval").value="";
			 	
			 	document.getElementById("rowindexs").value="";
			 	document.getElementById("std_cost").value="";
			 	document.getElementById("psrno").value="";
			 	
			 	
			 	document.getElementById("name").value="";
			 	document.getElementById("brandid").value="";
			 	document.getElementById("catid").value="";
			 	document.getElementById("subcatid").value="";
 
		
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
		 <tr><td  align="right" colspan="2" >&nbsp;</td></tr>	 
	  
	   <tr><td  align="right" colspan="2" >
	   
	  <table width="100%"  >
	  
	  <tr><td  align="right" width="30%"><label class="branch">From</label></td><td align="left" width="70%"><div id='fromdate' name='fromdate' value='<s:property value="fromdate"/>'></div>
                    </td></tr>
                     <tr><td  align="right" ><label class="branch">To</label></td><td align="left"><div id='todate' name='todate' value='<s:property value="todate"/>'></div>
                    </td></tr>
         <tr><td  align="right" ><label class="branch">Sales Count</label></td><td  align="right"  > <input type="number" id="salescount" name="salescount"   style="width: 100%;height:20PX;font-size: 11px"  >  </td></tr>            
                    
                    </table>
                </td></tr>   
  <tr><td  align="right" ><label class="branch">&nbsp; </label></td><td  align="left"   ><select id="type"    style="width: 75%;height:20PX;";   name="type" onchange="clearnames()">
  <option value="BR">Brand</option>
  <option value="CA">Category</option>
  <option value="SC">Sub Category</option>
  <option value="PR">Product</option>
  
  </select></td></tr>
  
 <tr><td  align="center" colspan="2"> &nbsp;  &nbsp;  &nbsp;  &nbsp;  &nbsp;  &nbsp; <input type="Button" name="updatdata" id="updatdata" class="myButton" value="Update" onclick="funupdates()"></td></tr>
        
  
  <tr> <td  align="center" colspan="2"><input type="hidden" id="name" style="width: 100%;height:20PX;"  style="width: 75%;"  placeholder="Press F3 for Search" readonly="readonly" onKeyDown="getname(event);" name="name"  value='<s:property value="name"/>'> </td></tr>
  
	<tr><td  align="right" colspan="2" >  &nbsp; </td></tr>
 	<tr><td  align="right" colspan="2" >  &nbsp; </td></tr>
 	
 	<tr><td  align="right" colspan="2" >  &nbsp; </td></tr>
 	<tr><td  align="right" colspan="2" >  &nbsp; </td></tr>
 	<tr><td  align="right" colspan="2" >  &nbsp; </td></tr>
 	<tr><td  align="right" colspan="2" >  &nbsp;</td></tr>
 	<tr><td  align="right" colspan="2" >  &nbsp;</td></tr>
 	<tr><td  align="right" colspan="2" >  &nbsp;</td></tr>
 	<tr><td  align="right" colspan="2" >  &nbsp;</td></tr>
  	<tr><td  align="right" colspan="2" >  &nbsp;</td></tr>
  	<tr><td  align="right" colspan="2" >  &nbsp;</td></tr>
  	<tr><td  align="right" colspan="2" >  &nbsp;</td></tr>
  	        	        	        	  
       <input type="hidden" id="brandid" name="brandid" >  
       <input type="hidden" id="catid" name="catid" >
       <input type="hidden" id="subcatid" name="subcatid" >      
 

 
 
 	<input type="hidden" id="psrno" name="psrno" >
 	 	<input type="hidden" id="rowindexs" name="rowindexs" >       
 	 	<input type="hidden" id="discountval" name="discountval" >
 	 	
 	 		<input type="hidden" id="std_cost" name="std_cost" >
 	 	 	 	<input type="hidden" id="fixing" name="fixing" >
 	
	</table>
	</fieldset>


</td>
<td width="80%">
	<table width="100%">
		<tr>
			 <td colspan="2"><div id="mainlistdiv"><jsp:include page="mainlistGrid.jsp"></jsp:include></div></td>
		</tr>
		
		
		<tr>
			 <td width="50%"><div id="pricelistdiv"><jsp:include page="pricelistgrid.jsp"></jsp:include></div></td>
			 
			 
			 <td  width="50%"> 
			 
 
		 
			<table  width="100%" >
			  <tr>    <td align="left" width="15%"><font    size="1.8px"> <b><label id=name1></label></b></font></td>  <td align="left" width="85%"><font color="#0000ff" size="1.85px"><b> <label id=productid></label></b></font></td>  </tr>
		    <tr>      <td align="left" width="15%"><font   size="1.8px"> <b><label id=name2></label></b></font></td><td align="left"><font color="#0000ff" size="1.8px"> <b><label id=productname></label></b></font> </td>  </tr>
		   <tr>      <td align="left" width="15%"><font    size="1.8px"><b> <label id=name3></label></b></font></td>  <td align="left"><font color="#0000ff" size="1.8px"><b><label id=productbrand></label></b></font> </td> </tr>
			  
			  
			  
			  </table>
			 
			  
			 
			 
			 
			 </td>
		</tr>
		
		
	</table>
</tr>
</table>

</div>
  	<div id="brandsearchwindow">
			<div></div>
			<div></div>
		</div>
		
		<div id="catsearchwindow">
			<div></div>
			<div></div>
		</div>
		
		<div id="subcatsearchwindow">
			<div></div>
			<div></div>
		</div>	
		<div id="productwindow">
<div></div>
</div>
</div>
</body>
</html>