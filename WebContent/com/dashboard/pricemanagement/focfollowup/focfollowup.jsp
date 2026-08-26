 
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
	
	 document.getElementById('mr').checked=true;
	 $("#cnvalue").attr("disabled",true); 
	  $("body").prepend('<div id="overlay" class="ui-widget-overlay" style="z-index: 1; display: none;"></div>');
	     $("body").prepend("<div id='PleaseWait' style='display: none;position:absolute; z-index: 1;top:180px;right:550px;'><img src='../../../../icons/31load.gif'/></div>");


	       $('#accountSearchwindow').jqxWindow({ width: '50%', height: '62%',  maxHeight: '75%' ,maxWidth: '50%' , title: 'Account Search' ,position: { x: 150, y: 60 }, keyboardCloseKey: 27});
		   $('#accountSearchwindow').jqxWindow('close');
	 $("#fromdate").jqxDateTimeInput({ width: '125px', height: '15px',formatString:"dd.MM.yyyy"});
	 $("#todate").jqxDateTimeInput({ width: '125px', height: '15px',formatString:"dd.MM.yyyy"});
	 
	 
	 $("#date").jqxDateTimeInput({ width: '125px', height: '15px',formatString:"dd.MM.yyyy"});
	 
	 
	 
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
	 
	 
	 
	   $('#account').dblclick(function(){
	    
	    	
	    		
		  	    $('#accountSearchwindow').jqxWindow('open');
		  	
		  	  accountSearchContent('accountsDetailsSearch.jsp?');
	    		 
	  });   
	  
});

function funExportBtn(){
 
	  
//JSONToCSVCon(datass, ' ', true);
	 }

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
	 var statusselect=$("#statusselect").val();
	 
	 var acno=$("#acno").val();
	 
	   $("#overlay, #PleaseWait").show();
	  $("#listdiv").load("purchaselistGrid.jsp?barchval="+barchval+"&fromdate="+fromdate+"&todate="+todate+"&statusselect="+statusselect+"&acno="+acno);
	  $("#detgrid").jqxGrid('clear');
	  disitems();
	  funchanges();
		   }
	}

function  funcleardata()
{
	document.getElementById("acno").value="";
	document.getElementById("account").value="";
	document.getElementById("accname").value="";
	
	 
 
	document.getElementById("statusselect").value="All";
	
	
	
	 if (document.getElementById("account").value == "") {
			
		 
	        $('#account').attr('placeholder', 'Press F3 TO Search'); 
	    }
	  
		
	}
	
function funchanges(){
	
	document.getElementById("calcu").value=0;
	
	if (document.getElementById('mr').checked) {
		
		 $("#cnvalue").val(''); 
		 $("#totvalue").val('');
		 $("#refnos").val('');
		 $("#balance").val(''); 
			$('#date').val(new Date());
		
		 $("#cnvalue").attr("disabled",true); 
		 
	
		 
		
		  $('#detgrid').jqxGrid('showcolumn', 'expfocrvd');
		  $('#detgrid').jqxGrid('showcolumn', 'batch_no');
		  $('#detgrid').jqxGrid('showcolumn', 'exp_date');
		    
			 
		  
		}
	 else if (document.getElementById('cr').checked) {
		 $("#balance").val(''); 
		 $("#cnvalue").val(''); 
		 $("#totvalue").val('');
		 $("#refnos").val('');
			$('#date').val(new Date());
		 $("#cnvalue").attr("disabled",false); 
		  $('#detgrid').jqxGrid('hidecolumn', 'expfocrvd');
		  $('#detgrid').jqxGrid('hidecolumn', 'batch_no');
		  $('#detgrid').jqxGrid('hidecolumn', 'exp_date');
		  
		  
		    
		}
	 }
	
	
function disitems() {
	
	 $("#mr").attr("disabled",true); 
	 $("#cr").attr("disabled",true); 
	 $("#cnvalue").attr("disabled",true); 
	 $("#totvalue").attr("disabled",true); 
	 $("#refnos").attr("disabled",true); 
	 $("#balance").attr("disabled",true); 
	 $("#updatdata").attr("disabled",true); 
	 $('#date').jqxDateTimeInput({disabled: true});
	 
}
function funCalculate()
{
	
	 var selectedrows = $("#detgrid").jqxGrid('selectedrowindexes');
	  selectedrows = selectedrows.sort(function(a,b){return a - b});
	 // alert(selectedrows.length);
	  
		if(selectedrows.length=="0")
			{
		  $.messager.alert('Message','Select Items To be Processed ','warning');   
		  return 0;
			}

 
		
       var totalvalue=0;
	 
  	 
       
       
       
       
	   for(var i=0 ; i < selectedrows.length ; i++){
		          var tempval=0;
		          
		          var expfoc=0;
		          var batch=0;
		          var expdate=0;
		      	if (document.getElementById('mr').checked) {  
		    		
		      		   expfoc=$("#detgrid").jqxGrid('getcellvalue',selectedrows[i],'expfocrvd');
		   			 
		      		 if(expfoc==""||typeof(expfoc)=="undefined"|| typeof(expfoc)=="NaN")
		      			 {
		      			 
		      			  $.messager.alert('Message','Enter Foc Received  In Select Items','warning');   
		      			  return 0; 
		      			 }
		      		 
		      		batch=$("#detgrid").jqxGrid('getcellvalue',selectedrows[i],'batch_no');
		   			 
		      		 if(batch==""||typeof(batch)=="undefined"|| typeof(batch)=="NaN")
		      			 {
		      			 
		      			  $.messager.alert('Message','Enter Batch No In Select Items','warning');   
		      			  return 0; 
		      			 }
		      		 
		      		expdate=$("#detgrid").jqxGrid('getcellvalue',selectedrows[i],'exp_date');
		      		  
		      		 if(expdate==""||typeof(expdate)=="undefined"|| typeof(expdate)=="NaN")
		      			 {
		      			 
		      			  $.messager.alert('Message','Enter Exp Date In Select Items','warning');   
		      			  return 0; 
		      			 }   
		   		  
		   		}
		   	 else if (document.getElementById('cr').checked) {
			      expfoc=$("#detgrid").jqxGrid('getcellvalue',selectedrows[i],'expfoc');
		   	 }
			    
			    var cost_price=$("#detgrid").jqxGrid('getcellvalue',selectedrows[i],'cost_price');
			    tempval=parseFloat(expfoc)*parseFloat(cost_price);
			    totalvalue=parseFloat(totalvalue)+parseFloat(tempval);
			    
		 
	   } 
	    
	 	funRoundAmt4(totalvalue,"totvalue");
	   
	
	 	document.getElementById("calcu").value=1;
	
	}
function funRoundAmt4(value,id){
	  var res=parseFloat(value).toFixed(2);
	  var res1=(res=='NaN'?"0":res);
	  document.getElementById(id).value=res1;  
	 } 
	 
	 
 
	 
	 
	 
	  function funupdatedatas()
	  {
		  
		  
		  if(parseInt(document.getElementById("calcu").value)==0)
			  {
			  $.messager.alert('Message','calculate before process  ','warning');   
			  return 0;
			  
			    $("#cnvalue").val(''); 
				 
				 $("#balance").val(''); 
			  
			  }
		  
		  
	  if (document.getElementById('mr').checked) {
			  
			  var totvalue=$("#totvalue").val();
			  if(totvalue==""||typeof(totvalue)=="undefined"|| typeof(totvalue)=="NaN" ||  totvalue=="0" ||   parseFloat(totvalue)=="0")
   			 {
				  $.messager.alert('Message','value is required  ','warning');   
				  return 0;
					}
 
			  
			  
		  }
		  
		  
		  if (document.getElementById('cr').checked) {
			  
			  var crvalue=$("#cnvalue").val();
			  if(crvalue==""||typeof(crvalue)=="undefined"|| typeof(crvalue)=="NaN" ||  crvalue=="0")
   			 {
				  $.messager.alert('Message','Enter C N Value  ','warning');   
				  return 0;
					}
 
			  
			  
		  }
		  
	 
		  
		  
		  
		  
		  
			$.messager.confirm('Message', 'Do you want to save changes?', function(r){
			 	  
			     
			   	if(r==false)
			   	  {
			   		
			   	  }
			   	else    
			   		{
			var listss = new Array(); 
			 var selectedrows = $("#detgrid").jqxGrid('selectedrowindexes');
			  selectedrows = selectedrows.sort(function(a,b){return a - b});
		   for(var i=0 ; i < selectedrows.length ; i++){
			   
			   		   
			   listss.push($("#detgrid").jqxGrid('getcellvalue',selectedrows[i],'psrno')+"::"+$("#detgrid").jqxGrid('getcellvalue',selectedrows[i],'rowno')
					    +"::"+$("#detgrid").jqxGrid('getcellvalue',selectedrows[i],'stockid')+"::"+$("#detgrid").jqxGrid('getcellvalue',selectedrows[i],'expfocrvd')
					    +"::"+$("#detgrid").jqxGrid('getcellvalue',selectedrows[i],'batch_no')+"::"+$("#detgrid").jqxGrid('getcellText',selectedrows[i],'exp_date')
					    +"::"+$("#detgrid").jqxGrid('getcellvalue',selectedrows[i],'expfoc'));  
			   
			  // listss.push(rows[i].psrno+"::"+rows[i].rowno+"::"+rows[i].stockid+"::"+rows[i].expfocrvd+"::"+rows[i].batch_no+"::"+$("#detgrid").jqxGrid('getcellText',rows[i],'exp_date')+"::"+rows[i].expfoc);  
		   }
		   save(listss);
			   		}
			   	
			}); 
	  }
	  function save(listss){
		  var types=0;
		  if (document.getElementById('mr').checked) {
			  types="1";
		  }
		  else if (document.getElementById('cr').checked) {
			  types="2";
		  }
		  var date= $("#date").val();
		  
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
					  
					 	funreload();
					 	
					 	
					}
				else
					{
					$.messager.alert('Message', '  Not Updated ', function(r){
					     
				     });
					}  
			}
			}
			
		x.open("GET","savedata.jsp?list="+listss+'&docno='+document.getElementById("docno").value+'&date='+date
				+'&refnos='+document.getElementById("refnos").value+'&totvalue='+document.getElementById("totvalue").value
				+'&cnvalue='+document.getElementById("cnvalue").value+'&balance='+document.getElementById("balance").value+'&types='+types);
			x.send();
		}
	  
	 
	  function calculateval()
	  {
		  
			var totvalue=document.getElementById("totvalue").value;
		 var cnvalue=document.getElementById("cnvalue").value;
		 	
		 	
 
		 	var  balance=parseFloat(totvalue)-parseFloat(cnvalue);
				
				   
				
				funRoundAmt4(cnvalue,"cnvalue");
				   
				funRoundAmt4(balance,"balance");
			 
			 
		  
	  }
	  
	  
	  
	  
</script>
</head>
<body onload="getBranch();disitems();">
<div id="mainBG" class="homeContent" data-type="background"> 
<div class='hidden-scrollbar'>
<table width="100%" >
<tr>
<td width="20%" >
    <fieldset style="background: #ECF8E0;">
	<table width="100%"    >
	<jsp:include page="../../heading.jsp"></jsp:include>
		
	 
	  <tr><td  align="right" ><label class="branch">From</label></td><td align="left"><div id='fromdate' name='fromdate' value='<s:property value="fromdate"/>'></div>
                    </td></tr>
                    
                    
                     <tr><td  align="right" ><label class="branch">To</label></td><td align="left"><div id='todate' name='todate' value='<s:property value="todate"/>'></div>
                    </td></tr>
   

  <tr><td colspan="2">&nbsp;</td></tr> 
 <tr><td colspan="2">&nbsp;</td></tr> 
 <tr><td colspan="2"><fieldset>
 <table  width="100%" >
	 <tr><td colspan="2" align="center"><input type="radio" id="mr" name="stkled"  onchange="funchanges()" value="mr"><label for="rsumm" class="branch">Material Receipt</label>&nbsp;&nbsp;
	 <input type="radio" id="cr" name="stkled" value="cr" onchange="funchanges()"><label for="rdet" class="branch">Credit Note</label></td></tr>
 

  <tr><td  align="right"><label class="branch">Ref No</label></td><td  align="left"  ><input type="text" id="refnos" style="height: 20px;" name="refnos" value='<s:property value="refnos"/>'></td></tr> 
   <tr><td align="right" ><label class="branch">Date</label></td><td align="left" ><div id='date' name='date' value='<s:property value="date"/>'></div></td></tr>  
  <tr><td  align="right"><label class="branch">Value</label></td><td  align="left"  ><input type="text" id="totvalue" readonly="readonly" style="height: 20px;text-align: right" name="totvalue" value='<s:property value="totvalue"/>'></td></tr> 
  <tr><td  align="right"><label class="branch">CN&nbsp;Value</label></td><td  align="left"  ><input type="text" id="cnvalue" style="height: 20px;text-align: right" name="cnvalue" value='<s:property value="cnvalue"/>'onchange="calculateval()" ></td></tr> 
  
   <tr><td  align="right"><label class="branch">Balance</label></td><td  align="left"  ><input type="text" id="balance" readonly="readonly" style="height: 20px;text-align: right" name="balance" value='<s:property value="balance"/>'></td></tr>
  
 <tr><td colspan="2" align="center"><input type="button" class="myButton" name="updatdata" id="updatdata"  value="Update" onclick="funupdatedatas()"></td></tr>  
 </table>
</fieldset>
<!-- 	<tr>
	<td colspan="2"><div id='paychaaaaa' style="width: 100% ; align:right; height: 150px;"></div></td>
	</tr> -->	
	 <tr><td colspan="2">&nbsp;</td></tr> 
 <tr><td colspan="2">&nbsp;</td></tr> 
  <tr><td colspan="2">&nbsp;</td></tr> 
 <tr><td colspan="2">&nbsp;</td></tr> 
 
 
 
	</table>
	</fieldset>
   <input type="hidden" id="acno" name="acno" value='<s:property value="acno"/>'>
   <input type="hidden" id="docno" name="docno" value='<s:property value="docno"/>'>
</td>
<td width="80%">
	<table width="100%">
		<tr>
			 <td><div id="listdiv"><jsp:include page="purchaselistGrid.jsp"></jsp:include></div></td>
			 </tr>
			 <tr>
			 <td><div id="listdiv2"><jsp:include page="detailgrid.jsp"></jsp:include></div></td>
	 
		</tr>
	</table>
</tr>
</table>
<select id="statusselect" name="statusselect" hidden="true" style="width:70%;">
	<option value="All">All</option>
 
		  
		<input type="hidden" name="calcu" id="calcu">
	
	 </select>  
 
 <input type="hidden" name="account" id="account" value='<s:property value="account"/>' readonly="readonly" placeholder="Press F3 To Search"   style="height:20px;width:70%;" onKeyDown="getaccountdetails(event);" >  
  <input type="hidden" id="accname" name="accname" value='<s:property value="accname"/>'  readonly="readonly"  style="height:20px;width:100%;">
 
  
</div>
<div id="accountSearchwindow">
   <div ></div>
</div> 
</div>
</body>
</html>