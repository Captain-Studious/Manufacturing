 
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

/* ===== MASTER LAYOUT ===== */
html, body, #mainBG, .hidden-scrollbar {
    height: 100%;
    margin: 0;
    overflow: hidden;
    background-color: #f4f7f9;
}

.master-container {
    display: flex;
    width: 100%;
    height: 100vh;
    font-family: 'Segoe UI', 'Roboto', 'Arial', sans-serif;
}

/* ===== LEFT SIDEBAR ===== */
.sidebar-filters {
    width: 320px;
    flex: 0 0 320px;
    background: #fff;
    border-right: 1px solid #e1e8ed;
    display: flex;
    flex-direction: column;
    height: 100%;
    box-shadow: 2px 0 8px rgba(0,0,0,.05);
    z-index: 10;
}

.sidebar-scroll-content {
    flex: 1;
    overflow-y: auto;
    padding: 15px 15px 25px;
}

.filter-card {
    background: #f8fafc;
    border: 1px solid #e3e8ee;
    border-radius: 12px;
    padding: 15px;
    margin-bottom: 12px;
}

.filter-table {
    width: 100%;
    border-spacing: 0 10px;
}

.filter-table .label-cell {
    text-align: right;
    padding-right: 10px;
    font-size: 12px;
    color: #4e5e71;
    font-weight: 600;
    white-space: nowrap;
}

/* ===== UNIFORM 24px INPUTS ===== */
input[type="text"], select,
.filter-table input[type="text"],
.filter-table select {
    width: 100%;
    height: 24px !important;
    padding: 2px 8px !important;
    border: 1px solid #ccd6e0 !important;
    border-radius: 4px !important;
    font-size: 12px !important;
    background-color: #ffffff;
    box-sizing: border-box;
    color: #333;
    outline: none;
}

input[readonly],
input:disabled {
    background-color: #f3f6f9 !important;
    color: #555;
    border-color: #e1e8ed !important;
    cursor: text;
}

.filter-table div[id^="fromdate"],
.filter-table div[id^="todate"] {
    width: 100%;
}

/* ===== MASTER 30px BUTTON SYSTEM ===== */
.btn-submit {
    width: 100%;
    height: 30px !important;
    padding: 0 12px !important;
    background: #2563eb !important;
    color: #fff !important;
    border: none !important;
    border-radius: 4px !important;
    font-size: 13px !important;
    font-weight: 600 !important;
    cursor: pointer;
    line-height: 30px !important;
    white-space: nowrap;
    text-align: center;
    transition: all 0.2s ease;
    box-shadow: none !important;
    display: inline-block;
    box-sizing: border-box;
    margin-bottom: 8px;
}
.btn-submit:hover {
    background: #1d4ed8 !important;
}

/* ===== RIGHT CONTENT AREA ===== */
.main-content-wrapper {
    flex: 1;
    display: flex;
    flex-direction: column;
    background: #ffffff;
    height: 100%;
    overflow: hidden;
}

.top-toolbar-container {
    width: 100%;
    padding: 10px 15px;
    background: #ffffff;
    border-bottom: 1px solid #e1e8ed;
    box-sizing: border-box;
}

.scrollable-grid-area {
    flex: 1;
    padding: 15px 20px;
    overflow: auto;
    box-sizing: border-box;
}
</style>

<script type="text/javascript">

$(document).ready(function () {
	
	$("#fromdate").jqxDateTimeInput({ width: '100%', height: '24px', formatString:"dd.MM.yyyy"});
	$("#todate").jqxDateTimeInput({ width: '100%', height: '24px', formatString:"dd.MM.yyyy"});
	  $("body").prepend('<div id="overlay" class="ui-widget-overlay" style="z-index: 1; display: none;"></div>');
	     $("body").prepend("<div id='PleaseWait' style='display: none;position:absolute; z-index: 1;top:180px;right:550px;'><img src='../../../../icons/31load.gif'/></div>");


	       $('#accountSearchwindow').jqxWindow({ width: '50%', height: '62%',  maxHeight: '75%' ,maxWidth: '50%' , title: 'Account Search' ,position: { x: 150, y: 60 }, keyboardCloseKey: 27});
		   $('#accountSearchwindow').jqxWindow('close');
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
	 
	 
	 
	   $('#account').dblclick(function(){
	    
	    	
	    		
		  	    $('#accountSearchwindow').jqxWindow('open');
		  	
		  	  accountSearchContent('accountsDetailsSearch.jsp?');
	    		 
	  });   
	  
});

function funExportBtn(){
	JSONToCSVCon(datas2,' Extra Foc  Master', true);
	JSONToCSVCon(datas4,' Extra Foc  Details', true);
 
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
	
 
	
function disitems() {
	
 
	 $("#updatdata").attr("disabled",true); 
	 
	 
}
 
function funRoundAmt4(value,id){
	  var res=parseFloat(value).toFixed(2);
	  var res1=(res=='NaN'?"0":res);
	  document.getElementById(id).value=res1;  
	 } 
	 
	 
 
	 
	 
	 
	  function funupdatedatas()
	  {
		  
		  
		  
			
			 var selectedrows = $("#detgrid").jqxGrid('selectedrowindexes');
			  selectedrows = selectedrows.sort(function(a,b){return a - b});
			 // alert(selectedrows.length);
			  
				if(selectedrows.length=="0")
					{
					$.messager.alert('Warning','Product Is Mandatory');
				  return false;
					}

		 var aa=0;
		   		var selectedrows=$("#detgrid").jqxGrid('selectedrowindexes');	
		   		selectedrows = selectedrows.sort(function(a,b){return a - b});  
				  for(var i=0 ; i < selectedrows.length ; i++){
					  
					  var expfocrvd=$("#detgrid").jqxGrid('getcellvalue',selectedrows[i],'expfocrvd');
					  
					  if(expfocrvd==null || expfocrvd=="" || expfocrvd==typeof("undefined") || expfocrvd==typeof("NAN"))
						  {
						  aa=1;
						  break;
						  }
							  }
						  
		 
		  
	  if(aa==1)
	  {
		$.messager.alert('Message', '  Extra FOC Paid Is Mandatory  ');
		 return false;
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
			   
			   listss.push($("#detgrid").jqxGrid('getcellvalue',selectedrows[i],'rowno')+"::"+$("#detgrid").jqxGrid('getcellvalue',selectedrows[i],'expfocrvd'));  
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
					 	$.messager.alert('Message', '  successfully Updated ', function(r){
						     
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
			
		x.open("GET","savedata.jsp?list="+listss);
			x.send();
		}
	  
	 
 
	  
	  
</script>
</head>
<body onload="getBranch();disitems();">
<div id="mainBG" class="homeContent" data-type="background">
<div class='hidden-scrollbar'>

<div class="master-container">

    <div class="sidebar-filters">
        <div class="sidebar-scroll-content">

            <div class="filter-card">
                <table class="filter-table">
                    <tr>
                        <td class="label-cell" style="width: 60px;">From</td>
                        <td><div id='fromdate' name='fromdate' value='<s:property value="fromdate"/>'></div></td>
                    </tr>
                    <tr>
                        <td class="label-cell" style="width: 60px;">To</td>
                        <td><div id='todate' name='todate' value='<s:property value="todate"/>'></div></td>
                    </tr>
                </table>
            </div>

            <div class="filter-card">
                <input type="button" class="btn-submit" name="updatdata" id="updatdata" value="Update" onclick="funupdatedatas()">
                <!-- 	<tr>
	<td colspan="2"><div id='paychaaaaa' style="width: 100% ; align:right; height: 150px;"></div></td>
	</tr> -->
            </div>

            <div style="display:none;">
                <input type="hidden" id="acno" name="acno" value='<s:property value="acno"/>'>
                <input type="hidden" id="docno" name="docno" value='<s:property value="docno"/>'>
                <select id="statusselect" name="statusselect">
                    <option value="All">All</option>
                </select>
                <input type="hidden" name="account" id="account" value='<s:property value="account"/>' readonly="readonly" onKeyDown="getaccountdetails(event);">
                <input type="hidden" id="accname" name="accname" value='<s:property value="accname"/>' readonly="readonly">
            </div>

        </div>
    </div>

    <div class="main-content-wrapper">

        <div class="top-toolbar-container">
            <jsp:include page="../../heading.jsp"></jsp:include>
        </div>

        <div class="scrollable-grid-area">
            <div id="listdiv">
                <jsp:include page="purchaselistGrid.jsp"></jsp:include>
            </div>
            <div id="listdiv2">
                <jsp:include page="detailgrid.jsp"></jsp:include>
            </div>
        </div>

    </div>

</div>

<div id="accountSearchwindow"><div></div></div>

</div>
</div>
</body>
</html>