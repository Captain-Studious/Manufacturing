
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
	 $('#todate').on('change', function (event) {
			
		   var fromdates=new Date($('#fromdate').jqxDateTimeInput('getDate'));
		 
		  // out date
		 	 var todates=new Date($('#todate').jqxDateTimeInput('getDate')); //del date
		 	 
		   if(fromdates>todates){
			   
			   $.messager.alert('Message','To Date Less Than From Date  ','warning');   
			 
		   return false;
		  }   
	 });
	 $("#updatdata").attr("disabled",true);
	 
	   
	  
});

function funExportBtn(){
	   //$("#orderlist").jqxGrid('exportdata', 'xls', 'Puchase Order List');
	 }

 
function funreload(event)
{

	  var fromdates=new Date($('#fromdate').jqxDateTimeInput('getDate'));
		 
	  // out date
	 	 var todates=new Date($('#todate').jqxDateTimeInput('getDate')); //del date
	 	 
	   if(fromdates>todates){
		   
		   $.messager.alert('Message','To Date Less Than From Date  ','warning');   
		 
	   return false;
	  } 
	   else
		   {
	 var barchval = document.getElementById("cmbbranch").value;
     var fromdate= $("#fromdate").val();
	 var todate= $("#todate").val();
	 var statusselect="";
	 
	 
	   $("#overlay, #PleaseWait").show();
	  $("#sidelistdiv").load("listGrid.jsp?barchval="+barchval+"&fromdate="+fromdate+"&todate="+todate+"&statusselect="+statusselect);
	
		   }
	}
	
function funupdate()
{
		var pruoduct="saveprmaster"; 
		
		$.messager.confirm('Message', 'Do you want to save changes?', function(r){
		 	  
		     
		   	if(r==false)
		   	  {
		   		pruoduct=""; 
		   		
		   		funupdate1(pruoduct);
		   	  }
		   	if(r==true)
		   		{
		   		
			
		   		funupdate1(pruoduct);
		   		}
		   	
		}); 
}
  function funupdate1(pruoduct)
{
	  
	  
	 
	  
	  
 
	var rows1 = $("#jqxpmgt").jqxGrid('getrows');
	 var  ck="0";
	for(var i=0 ; i < rows1.length-1 ; i++){
			
		
		 if(pruoduct=="saveprmaster")
		  {
			 
			  if((rows1[i].newprice1>0) ||  (rows1[i].newprice2>0) ||  (rows1[i].newprice3>0) || (rows1[i].discount1>0)  || (rows1[i].discount2>0) || (rows1[i].discount3>0))
			   {
				  ck="do";
				  
				   
				  
			   }
		   		    
			 
		  }
		
		
	}
	if(pruoduct=="saveprmaster")
	  {
	if(ck=="0")
		{
		$.messager.alert('Message', 'Do you want to update the product rate?');
			 return 0;
		
		}
	  }
 
 	var listss = new Array();
 	var rows = $("#jqxpmgt").jqxGrid('getrows');
   for(var i=0 ; i < rows.length-1 ; i++){

	 /*   	 if(pruoduct=="saveprmaster")
		  {
			    
	   	   if((rows[i].newprice1>0) ||  (rows[i].newprice2>0) ||  (rows[i].newprice3>0) || (rows[i].discount1>0)  || (rows[i].discount2>0) || (rows[i].discount3>0))
		   { 
	   		   
	   		   
	   		   
			   		    if(!rows[i].newprice1>0 || ! rows[i].newprice2>0 || !rows[i].newprice3>0 || !rows[i].discount1>0 || !rows[i].discount2>0 || !rows[i].discount3>0)  
			  
			   		   { 
			   			 
			   			 
			   		   }  
			   		   
	   		ck="";		   
			   		   
			   		   
		   }
	   	   
	   	   else
	   		   {
	   		$.messager.alert('Message', 'New prices not entered?');
  			 return 0;
	   		   }
	   	   
	   	   
		  } */
	   
	   
	   if((rows[i].price1>0) ||  (rows[i].newprice1>0) || (rows[i].price2>0) || (rows[i].newprice2>0) || (rows[i].price3>0) || (rows[i].newprice3>0) || (rows[i].discount1>0)  || (rows[i].discount2>0) || (rows[i].discount3>0))
	   { 
		 
    
		   listss.push(rows[i].catid+"::"+rows[i].price1+"::"+rows[i].price2+"::"+rows[i].price3+"::"+rows[i].newprice1+"::"+rows[i].newprice2+"::"+rows[i].newprice3+"::"+rows[i].discount1
				   +"::"+rows[i].discount2+"::"+rows[i].discount3+"::"+"test");  
		 
	   }
	  
	 
   }
   ajaxcall(listss,pruoduct);
 
	}
 
  function ajaxcall(listss,pruoduct){
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
				    
				}
			else
				{
				$.messager.alert('Message', '  Not Updated ', function(r){
				     
			     });
				}  
		}
		}
	x.open("GET","pricesavedata.jsp?list="+listss+'&psrno='+document.getElementById("psrno").value+'&pruoduct='+pruoduct);
		x.send();
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
				 	 var barchval = document.getElementById("cmbbranch").value;
				     var fromdate= $("#fromdate").val();
					 var todate= $("#todate").val();
					 var statusselect="";
			 
				 /* 	 $("#overlay, #PleaseWait").show();
			    	  $("#mainlistdiv").load("mainlistGrid.jsp?barchval="+barchval+"&fromdate="+fromdate+"&todate="+todate+"&statusselect="+statusselect+"&doc_no="+document.getElementById("maindocno").value);
					 */ 
		 
				 	 
	  		  	     document.getElementById("discountval").value="";
				 	
				 	document.getElementById("rowindexs").value="";
				 	document.getElementById("std_cost").value="";
				 	document.getElementById("psrno").value="";  
				  
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
	x.open("GET","pricesavedata.jsp?list="+listss+'&psrno='+document.getElementById("psrno").value+'&std_cost='+document.getElementById("std_cost").value+'&fixing='+document.getElementById("fixing").value+'&discountval='+document.getElementById("discountval").value);
		x.send();
	}
  
	function hidebranch()
	{
	 
		/*   $("#branchdiv").hide();
		  $("#branchlabel").hide(); */
		 
	}
	
	
 
   
   
   
   function funprocess()
	
	{
	   $("#overlay, #PleaseWait").show();
		var rows = $("#mainlistgrid").jqxGrid('getrows');
		   for(var i=0 ; i < rows.length ; i++){

 	var std_cost=rows[i].std_cost;
 	
 	 
 	if(std_cost>0 && std_cost!="" && typeof(std_cost)!="undefined")
       {
 		$('#mainlistgrid').jqxGrid('setcellvalue', i, "std_cost",0);
	
		   }
 	
	if(std_cost>0 && std_cost!="" && typeof(std_cost)!="undefined")
    {
		$('#mainlistgrid').jqxGrid('setcellvalue', i, "std_cost",std_cost);
		
		$('#mainlistgrid').jqxGrid('setcellvalue', i, "cellselects",1);
		
	
		   }
 	
 	
		   }
		   $("#overlay, #PleaseWait").hide();
	}
   
   function savegriddata(doc_no)
   {
   	
   	var x=new XMLHttpRequest();
   	x.onreadystatechange=function(){
   	if (x.readyState==4 && x.status==200)
   		{
   		
        			
   			var items=x.responseText;
   			
   			
   			 $.messager.alert('Message', '  Record successfully Updated ', function(r){
   			     
   		     });
   			 
   			funreload(event);
   			$("#jqxpmgt").jqxGrid('clear');
   			$("#mainlistgrid").jqxGrid('clear');
   		  $("#mainlistgrid").jqxGrid('addrow', null, {});
   			}
   		
   	}
   		
   x.open("GET","savedata.jsp?doc_no="+doc_no,true);

   x.send();
   		
   }
       
   
</script>
</head>
<body onload="getBranch();hidebranch();">
<div id="mainBG" class="homeContent" data-type="background"> 
<div class='hidden-scrollbar'>
<table width="100%" >
<tr>
<td width="25%" >
    <fieldset style="background: #ECF8E0;">
	<table width="100%"  >
	<jsp:include page="../../heading.jsp"></jsp:include>
		
	   <tr><td  align="right" colspan="2" >&nbsp;</td></tr>	
	   
	   <tr><td  align="right" colspan="2">
	    <table  width="100%"    >
	  <tr><td  align="right" ><label class="branch">From</label></td><td align="left"><div id='fromdate' name='fromdate' value='<s:property value="fromdate"/>'></div>
                    </td><td colspan="2" rowspan="2">&nbsp;&nbsp; <button type="button" class="icon" id="process" title="Process" onclick="funprocess();">
							<img alt="process" src="<%=contextPath%>/icons/process2.png" width="18" height="18">
						</button> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
                     <tr><td  align="right" ><label class="branch">To</label></td><td align="left"><div id='todate' name='todate' value='<s:property value="todate"/>'></div>
                    </td>
                    </tr>
            	
       </table>
        
       
       
       </td></tr>            
                    
    
	 	 
	 	
 	 
 	 <tr><td  align="center" colspan="2"><input type="Button" name="updatdata" id="updatdata" class="myButton" value="Update" onclick="funupdates()"></td></tr>	 
     
 	<input type="hidden" id="psrno" name="psrno" >
 	<input type="hidden" id="rowindexs" name="rowindexs" >       
 	<input type="hidden" id="discountval" name="discountval" >
 	<input type="hidden" id="std_cost" name="std_cost" >
 	 	<input type="hidden" id="fixing" name="fixing" >
 	 		<input type="hidden" id="statusselect" name="statusselect" >
 	 		<input type="hidden" id="maindocno" name="maindocno" >
 	
	</table>
	</fieldset>


</td>
<td width="75s%">
	<table width="100%">
		<tr>
		 
		</tr>
		
		
		<tr>
 			 
			 
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
  
</div>
</body>
</html>