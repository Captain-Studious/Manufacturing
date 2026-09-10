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
<script type="text/javascript">

$(document).ready(function () {
	
	/*  $("body").prepend('<div id="overlay" class="ui-widget-overlay" style="z-index: 1001; display: none;"></div>');
	    $("body").prepend("<div id='PleaseWait' style='display: none;position:absolute; z-index: 1;top:200;right:600;'><img src='../../../../icons/31load.gif'/></div>");    
 */	 $("#periodupto").jqxDateTimeInput({ width: '125px', height: '15px',formatString:"dd.MM.yyyy"});
 $('#assetwindow').jqxWindow({ width: '40%', height: '60%',  maxHeight: '60%' ,maxWidth: '40%' , title: 'Asset Group Search' ,position: { x: 250, y: 60 }, keyboardCloseKey: 27});
 $('#assetwindow').jqxWindow('close');
	  
 $('#assetgrp').dblclick(function(){
	    $('#assetwindow').jqxWindow('open');
	$('#assetwindow').jqxWindow('focus');
	 assetSearchContent('assetGroupSearch.jsp', $('#assetwindow'));
	});
});
function getAssetGroup(event){
	 var x= event.keyCode;
   if(x==114){
   	  $('#assetwindow').jqxWindow('open');
 		$('#assetwindow').jqxWindow('focus');
 		 assetSearchContent('assetGroupSearch.jsp', $('#assetwindow'));
   }
   else{
    }
}
function assetSearchContent(url) {
    //alert(url);
      $.get(url).done(function (data) {
//alert(data);
    $('#assetwindow').jqxWindow('setContent', data);

}); 
}
function funreload(event)
{
	/* if(document.getElementById("cmbbranch").value=="" || document.getElementById("cmbbranch").value=='a'){
		$.messager.alert('Warning','Please Select Branch');
		return false;
	}
	 */
	  $("#falistdiv").load("faListGrid.jsp?branch="+document.getElementById("cmbbranch").value+"&assetgroup="+document.getElementById("hidassetgrp").value);
	}
	
	function setValues(){

		 if($('#msg').val()!=""){
   		   $.messager.alert('Message',$('#msg').val());
   		  }
	}
	function funExportBtn(){
		 $("#faListGrid").jqxGrid('exportdata', 'xls', 'Fixed Asset List');
	
		
	}
		
	</script>
<style>

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

.filter-table div[id^="periodupto"] {
    width: 100%;
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
</head>
<body onload="getBranch();setValues();">
<form id="frmFAList" action="frmFAList" method="post">
<div id="mainBG" class="homeContent" data-type="background">
<div class='hidden-scrollbar'>

<div class="master-container">

    <div class="sidebar-filters">
        <div class="sidebar-scroll-content">

            <div class="filter-card">
                <table class="filter-table">
                    <tr>
                        <td class="label-cell" style="width: 90px;">Period Upto</td>
                        <td><div id="periodupto"></div></td>
                    </tr>
                    <tr>
                        <td class="label-cell" style="width: 90px;">Asset Group</td>
                        <td>
                            <input type="text" name="assetgrp" id="assetgrp" readonly placeholder="Press F3 to Search" onKeyDown="getAssetGroup(event);">
                        </td>
                    </tr>
                </table>
            </div>

            <div style="display:none;">
                <input type="hidden" name="hidassetgrp" id="hidassetgrp">
                <input type="hidden" name="mode" id="mode" value='<s:property value="mode"/>'>
                <input type="hidden" name="msg" id="msg" value='<s:property value="msg"/>'>
            </div>

        </div>
    </div>

    <div class="main-content-wrapper">

        <div class="top-toolbar-container">
            <jsp:include page="../../heading.jsp"></jsp:include>
        </div>

        <div class="scrollable-grid-area">
            <div id="falistdiv">
                <jsp:include page="faListGrid.jsp"></jsp:include>
            </div>
        </div>

    </div>

</div>

<div id="assetwindow"><div></div></div>

</div>
</div>
</form>
</body>
</html>