<jsp:include page="../../../../includes.jsp"></jsp:include>    
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>GatewayERP(i)</title>
<link href="../../../../css/dashboard.css" media="screen" rel="stylesheet" type="text/css" />  

<style type="text/css">
/* ===== MASTER LAYOUT (Modern Flexbox) ===== */
html, body {
    height: 100%;
    margin: 0;
    overflow: hidden;
    background-color: #f4f7f9;
}

#mainBG {
    flex: 1;
    display: flex;
    height: 100%;
    overflow: hidden;
}

.master-container {
    display: flex;
    width: 100%;
    height: 100%;
    font-family: 'Segoe UI', 'Roboto', 'Arial', sans-serif;
}

/* ===== LEFT SIDEBAR (Filters & Controls) ===== */
.sidebar-filters {
    width: 280px; 
    flex: 0 0 280px; 
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

/* Cards */
.filter-card {
    background: #f8fafc;
    border: 1px solid #e3e8ee;
    border-radius: 12px;
    padding: 15px;
    margin-bottom: 12px;
}

.filter-card-header {
    margin-top: 0;
    font-size: 13px;
    color: #4e5e71;
    margin-bottom: 10px;
    font-weight: 600;
    border-bottom: 1px solid #e1e8ed;
    padding-bottom: 5px;
}

/* Tables */
.release-filter-table {
    width: 100%;
    border-spacing: 0 10px;
}

.release-filter-table .label-cell {
    text-align: right;
    padding-right: 10px;
    font-size: 12px;
    color: #4e5e71;
    font-weight: 600;
    width: 80px;
}

/* ===== UNIFORM 24px INPUTS & SELECTS ===== */
input[type="text"], select, textarea,
.release-filter-table input[type="text"],
.release-filter-table select,
.release-filter-table textarea {
    width: 100%;
    height: 24px;              
    padding: 2px 8px;          
    border: 1px solid #ccd6e0;
    border-radius: 4px;        
    font-size: 12px;          
    background-color: #ffffff;
    box-sizing: border-box;
    color: #333;
    font-family: inherit;
}

textarea {
    height: auto;
    resize: none;
}

/* Readonly / disabled look */
input[readonly],
input:disabled,
select:disabled,
textarea[readonly],
.release-filter-table input[readonly],
.release-filter-table input:disabled,
.release-filter-table select:disabled {
    background-color: #f3f6f9 !important;
    color: #555;
    border-color: #e1e8ed;
}

/* jqx date/time containers */
.release-filter-table div[id^="fromdate"],
.release-filter-table div[id^="todate"] {
    width: 100%;
}

/* ===== BUTTONS ===== */
.btn-submit {
    width: 100%;
    height: 30px;            
    padding: 0 12px;         
    background: #2563eb;
    color: #fff;
    border: none;
    border-radius: 4px;      
    font-size: 13px;
    font-weight: 600;
    cursor: pointer;
    line-height: 30px;       
    transition: background 0.2s;
}

.btn-submit:hover {
    background: #1d4ed8;
}

.btn-submit:disabled {
    background: #9ca3af;
    cursor: not-allowed;
}

.release-actions {
    display: flex;
    gap: 10px;
    justify-content: center;
    margin-top: 15px;
}

.release-actions .btn-submit {
    min-width: 80px;
}

/* ===== RIGHT CONTENT AREA ===== */
.main-content-area {
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

.grid-content-container {
    flex: 1;
    display: flex;
    flex-direction: column;
    padding: 15px;
    overflow: auto; 
    box-sizing: border-box;
    gap: 15px;
}

.borderStyle {  
    margin-bottom: 0;
    background: #fff;
    border: 1px solid #e1e8ed;
    border-radius: 8px;
    box-shadow: 0 2px 4px rgba(0,0,0,0.02);
    overflow: hidden;
}
</style>

<script type="text/javascript">

$(document).ready(function () {
	
	 $('#audit').attr('disabled',true);
	 $("body").prepend('<div id="overlay" class="ui-widget-overlay" style="z-index: 1000; display: none;"></div>');
	 $("body").prepend("<div id='PleaseWait' style='display: none;position:absolute; z-index: 1001;top:50%;left:50%;transform:translate(-50%,-50%);'><img src='../../../../icons/31load.gif'/></div>");
	 
     $("#fromdate").jqxDateTimeInput({ width: '100%', height: '24px',formatString:"dd.MM.yyyy"});
	 $("#todate").jqxDateTimeInput({ width: '100%', height: '24px',formatString:"dd.MM.yyyy"});
	 
     var fromdates=new Date($('#fromdate').jqxDateTimeInput('getDate'));
	 var onemounth=new Date(new Date(fromdates).setMonth(fromdates.getMonth()-1)); 
	    
     $('#fromdate').jqxDateTimeInput('setDate', new Date(onemounth));
	 $('#todate').on('change', function (event) {
		   var fromdates=new Date($('#fromdate').jqxDateTimeInput('getDate'));
		 	 var todates=new Date($('#todate').jqxDateTimeInput('getDate')); //del date
		   if(fromdates>todates){
			   $.messager.alert('Message','To Date Less Than From Date  ','warning');   
		       return false;
		  }   
	 });
	  
});

function funExportBtn(){
	   /* $("#purchaselist").jqxGrid('exportdata', 'xls', 'Purchase Invoice List'); */
}

function funreload(event)
{
	  var fromdates=new Date($('#fromdate').jqxDateTimeInput('getDate'));
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
	     $("#overlay, #PleaseWait").show();
	     $("#listdiv").load("purchaseInvoiceAuditGrid.jsp?barchval="+barchval+"&fromdate="+fromdate+"&todate="+todate);
	  }
}

function funAudit()
{
	var doc_no=$('#docno').val();
	$.messager.confirm('Message', 'Do you want to save changes?', function(r){
		   if(r==false)
		   {
		     	return false; 
		   }
		   else{
		     	savegriddata(doc_no);	
		   }
	});
}
	
function savegriddata(docno)
{
	var x=new XMLHttpRequest();
	x.onreadystatechange=function(){
	    if (x.readyState==4 && x.status==200)
		{
			 var items=x.responseText;
			 if(parseInt(items)>=1)
			 {
				$.messager.alert('Message', ' Successfully Updated ');
				funreload(event); 
				$("#detailpurchaselist").jqxGrid('clear');
				$('#audit').attr('disabled',true);
			 }
			 else
			 {
				 $.messager.alert('Message', ' Not Updated ');
			 }
		}   
	}
    x.open("GET","savedata.jsp?docno="+docno,true);
    x.send();
}
</script>
</head>
<body onload="getBranch();">
    <div id="mainBG" class="homeContent" data-type="background"> 
        <div class="master-container">

            <div class="sidebar-filters">
                <div class="sidebar-scroll-content">
                    
                    <div class="filter-card">
                        <table class="release-filter-table">
                            <tr>
                                <td class="label-cell">From</td>
                                <td><div id="fromdate" name="fromdate" value='<s:property value="fromdate"/>'></div></td>
                            </tr>
                            <tr>
                                <td class="label-cell">To</td>
                                <td><div id="todate" name="todate" value='<s:property value="todate"/>'></div></td>
                            </tr>
                        </table>

                        <div class="release-actions">
                            <button type="button" class="btn-submit" name="audit" id="audit" onclick="funAudit()">Audit</button>
                        </div>
                    </div>

                    <div id='paychaaaaa' style="display: none;"></div>

                    <input type="hidden" id="acno" name="acno" value='<s:property value="acno"/>'>
                    <input type="hidden" id="docno" name="docno" value='<s:property value="docno"/>'>
                </div>
            </div>

            <div class="main-content-area">
                
                <div class="top-toolbar-container">
                    <jsp:include page="../../heading.jsp"></jsp:include>
                </div>

                <div class="grid-content-container">
                    <div id="listdiv" class="borderStyle" style="flex: 1;"><jsp:include page="purchaseInvoiceAuditGrid.jsp"></jsp:include></div>
                    <div id="listDetailDiv" class="borderStyle" style="flex: 1;"><jsp:include page="purchaseInvoiceAuditGridDetail.jsp"></jsp:include></div>
                </div>

            </div>

        </div> 
        
        <div id="accountSearchwindow"><div></div></div> 

    </div>
</body>
</html>