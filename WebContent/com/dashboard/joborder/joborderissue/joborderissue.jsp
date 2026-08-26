
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
	

	  $("body").prepend('<div id="overlay" class="ui-widget-overlay" style="z-index: 1; display: none;"></div>');
	     $("body").prepend("<div id='PleaseWait' style='display: none;position:absolute; z-index: 1;top:180px;right:550px;'><img src='../../../../icons/31load.gif'/></div>");
 
		 $('#customerDetailsWindow').jqxWindow({width: '51%', height: '58%',  maxHeight: '70%' ,maxWidth: '51%' , title: 'Client Search',position: { x: 300, y: 87 } , theme: 'energyblue', showCloseButton: true, keyboardCloseKey: 27});
		 $('#customerDetailsWindow').jqxWindow('close'); 	 	 
	
		 $("#updatdata").attr('disabled', true );
	     $('#txtclient').dblclick(function(){
	 
		    	 
			  	  accountSearchContent('clientINgridsearch.jsp?');
		    		 
		  });
	   	  
	     $('#div1').show();
		   $('#div2').hide();
	 
		   document.getElementById('rsumm').checked="true";
});



function getaccountdetails(event){
 	 var x= event.keyCode;
   	
 
 		
 	 if(x==114){
 	 
 	 accountSearchContent('clientINgridsearch.jsp?');    }
 	 else{
 		 }
 		 
 	 }  
	  function accountSearchContent(url) {
       //alert(url);
        $('#customerDetailsWindow').jqxWindow('open');
          $.get(url).done(function (data) {
//alert(data);
        $('#customerDetailsWindow').jqxWindow('setContent', data);

	}); 
    	}	

function funExportBtn(){
	
	 }

 
function funreload(event)
{
	 $("#updatdata").attr('disabled', true );
		   
	
	
	 var barchval = document.getElementById("cmbbranch").value;
   
	 
	 var cldocno=$('#cldocno').val();
	  
	   $("#overlay, #PleaseWait").show(); 
		$("#prdgrid").jqxGrid('clear');
		$("#collectedgrid").jqxGrid('clear');
		if(document.getElementById('rsumm').checked) {
	   
			var aa="issue";
 
	  
 	  $("#listdiv").load("listGrid.jsp?barchval="+barchval+"&cldocno="+cldocno+"&type="+aa);
 	  
		}
		 else if (document.getElementById('rdet').checked) 
			{
				
				var aa="col";	
			 
	 
			 	  $("#listdiv").load("listGrid.jsp?barchval="+barchval+"&cldocno="+cldocno+"&type="+aa);
			}
 
 	 
	}
	
 
  
  function funCalculates()
  {
	  
		  
  }
  
  
  
  
	function hidebranch() 
	{
	 
		  
		 
	}

	function fundisable(){
		
		$("#mainlistgrid").jqxGrid('clear');
		$("#prdgrid").jqxGrid('clear');
		$("#collectedgrid").jqxGrid('clear');
		
		if (document.getElementById('rsumm').checked) {
			
			  $('#div1').show();
			   $('#div2').hide();
			  
			}
		 else if (document.getElementById('rdet').checked) {
			 
			  $('#div1').hide();
			  $('#div2').show();
			 
			}
		 }
	
	
	function funupdates()
	{
		
		if(document.getElementById('rsumm').checked) {
			funsaveissue();
		}
		else if (document.getElementById('rdet').checked) 
		{
			funsavecoll();
		}
		
	}

	
	function funsavecoll()
	{
		
		
		
		$.messager.confirm('Message', 'Do you want to save changes?', function(r){
		 	  
		     
		   	if(r==false)
		   	  {
		   		
		   	  }
		   	else
		   		{
	 
		   	
		
		
		var listss = new Array();
		
		 var selectedrows=$("#collectedgrid").jqxGrid('selectedrowindexes');
	       var j=0;
	       
			selectedrows = selectedrows.sort(function(a,b){return a - b});
			var rows = $("#collectedgrid").jqxGrid('getrows'); 
			
		 
			   for(var i=0 ; i < rows.length ; i++){
			   
				
				    
						if(selectedrows[j]==i){
							 	
							   listss.push(rows[i].psrno+"::"+rows[i].rdocno); 
						j++; 
					  }
				   
				   
			   }
			   save2(listss);
				   	
		   	
	}
		   	
		});
		
		  }
		  function save2(listss){
				var x=new XMLHttpRequest();
				x.onreadystatechange=function(){
					if (x.readyState==4 && x.status==200) 
						{
						 var items= x.responseText;
						 	var itemval=items.trim();
						 
		      if(parseInt(itemval)==1)
		      	{
						 	$.messager.alert('Message', '  Record successfully Updated ', function(r){
							     
						     });
						    
						 	funreload(event);
				 
						}
					else
						{
						$.messager.alert('Message', '  Not Updated ', function(r){
						     
					     });
						}  
				}
				}  
			x.open("GET","savecoldata.jsp?list="+listss);
				x.send();
			}

		 
	
	
	
	
	function funsaveissue()
	{
		
		
		
		$.messager.confirm('Message', 'Do you want to save changes?', function(r){
		 	  
		     
		   	if(r==false)
		   	  {
		   		
		   	  }
		   	else
		   		{
	 
		   	
		
		
		var listss = new Array();
		
		 var selectedrows=$("#prdgrid").jqxGrid('selectedrowindexes');
	       var j=0;
	       
			selectedrows = selectedrows.sort(function(a,b){return a - b});
			var rows = $("#prdgrid").jqxGrid('getrows'); 
			
		 
			   for(var i=0 ; i < rows.length ; i++){
			   
				
				    
						if(selectedrows[j]==i){
							 	
							   listss.push(rows[i].psrno+"::"+rows[i].rdocno); 
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
						 
		      if(parseInt(itemval)==1)
		      	{
						 	$.messager.alert('Message', '  Record successfully Updated ', function(r){
							     
						     });
						    
						 	funreload(event);
				 
						}
					else
						{
						$.messager.alert('Message', '  Not Updated ', function(r){
						     
					     });
						}  
				}
				}  
			x.open("GET","savedata.jsp?list="+listss);
				x.send();
			}

		 
	
	
	 </script>
</head>
<body onload="getBranch();">
<div id="mainBG" class="homeContent" data-type="background"> 
<div class='hidden-scrollbar'>
<table width="100%" >
<tr>
<td width="20%" >
    <fieldset style="background: #ECF8E0;">
	<table width="100%"  >
	<jsp:include page="../../heading.jsp"></jsp:include>
		 <tr><td  align="right" colspan="2" >&nbsp;</td></tr>	 
	  
	  
	  	  	 <tr><td colspan="2" align="center"><input type="radio" id="rsumm" name="stkled" onchange="fundisable();" value="rsumm"><label for="rsumm" class="branch">Issue</label>&nbsp;&nbsp;
	 <input type="radio" id="rdet" name="stkled" onchange="fundisable();" value="rdet"><label for="rdet" class="branch">Return</label></td></tr>
	  
	  
	  	 <tr>
<td align="right"><label class="branch">Client</label></td>
    <td  ><input type="text" name="txtclient" id="txtclient" value='<s:property value="txtclient"/>' readonly="readonly" placeholder="Press F3 To Search"   style="height:20px;width:70%;" onKeyDown="getaccountdetails(event);" >  </td></tr>
 <tr> <td>&nbsp;</td><td> <input type="text" id="txtclientdet" name="txtclientdet" value='<s:property value="txtclientdet"/>'  readonly="readonly"  style="height:20px;width:100%;"></td></tr>
	  

 	      <tr><td colspan="2">&nbsp;</td></tr>
 	       <tr><td colspan="2">&nbsp;</td></tr>
 
 	      <tr><td colspan="2">&nbsp;</td></tr>
 	       <tr><td colspan="2">&nbsp;</td></tr>
 	       	  
	  
 
 <tr><td  align="center" colspan="2"><input type="button" name="updatdata" id="updatdata" class="myButton" value="Update" onclick="funupdates()"></td></tr>
        
   
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
		<tr>
			 <td>
			 <div id="div1">
			 
			 <div id="sublistdiv"><jsp:include page="sublistGrid.jsp"></jsp:include></div>
			 </div>
			 
			  <div id="div2">
			 
			 <div id="sublistdiv2"><jsp:include page="collectedgrid.jsp"></jsp:include></div>
			 </div>
			 
			 </td>
		</tr>
	</table>
	
 
	
	 </td>
</tr>
</table>

  	        	        	        	  
    <div id="customerDetailsWindow">
	   <div ></div>
	</div>    
</div>
 
</div>
</body>
</html>