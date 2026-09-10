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

/* ===== UNIFORM 24px INPUTS & SELECTS ===== */
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

select {
    padding: 2px 24px 2px 8px !important;
    font-family: inherit;
    cursor: pointer;
    appearance: none;
    -webkit-appearance: none;
    background-image: url("data:image/svg+xml;charset=UTF-8,%3csvg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 24 24' fill='none' stroke='%234e5e71' stroke-width='2' stroke-linecap='round' stroke-linejoin='round'%3e%3cpolyline points='6 9 12 15 18 9'%3e%3c/polyline%3e%3c/svg%3e");
    background-repeat: no-repeat;
    background-position: right 6px center;
    background-size: 12px;
}

/* Checkbox reset — prevents global input{} rules from stretching it full-width */
input[type="checkbox"] {
    width: auto !important;
    height: auto !important;
    display: inline-block !important;
    vertical-align: middle !important;
    margin: 0 !important;
    padding: 0 !important;
}

.filter-table div[id^="fromdate"],
.filter-table div[id^="todate"] {
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

/* Original custom textbox styling — kept for elements not covered by master input rules */
.textbox {
    border: 0;
    height: 25px;
    width: 20%;
    border-radius: 5px;
    box-shadow: 1px 1px 0 0 #E0ECF8, 5px 5px 40px 2px #E0ECF8 inset;
    -webkit-background-clip: padding-box;
    outline: 0;
}
</style>

<script type="text/javascript">

	$(document).ready(function () {
		 $("#fromdate").jqxDateTimeInput({ width: '125px', height: '15px',formatString:"dd.MM.yyyy"});
		 $("#todate").jqxDateTimeInput({ width: '125px', height: '15px',formatString:"dd.MM.yyyy"});
		 
		 $("body").prepend('<div id="overlay" class="ui-widget-overlay" style="z-index: 1; display: none;"></div>');
	     $("body").prepend("<div id='PleaseWait' style='display: none;position:absolute; z-index: 1;top:180px;right:550px;'><img src='../../../../icons/31load.gif'/></div>");

	     var curfromdate= $('#fromdate').jqxDateTimeInput('getDate');
	     var oneyeardate=new Date(new Date(curfromdate).setMonth(curfromdate.getMonth()-1));
	     var oneyearbackdate=new Date(new Date(oneyeardate).setDate(oneyeardate.getDate()));
	     $('#fromdate ').jqxDateTimeInput('setDate', new Date(oneyearbackdate));
	     
	     $("#trialDiv").hide();
	     document.getElementById("hidchckincludingzero").value=0;
	     
	});
	
	function funExportBtn(){
	    JSONToCSVCon(data, 'TrialBalance', true);
	} 
    
	function includingzerocheck(){
		 if(document.getElementById("chckincludingzero").checked){
			 document.getElementById("hidchckincludingzero").value = 1;
		 }
		 else{
			 document.getElementById("hidchckincludingzero").value = 0;
		 }
	 }
	
	function funreload(event){
		 var branchval = document.getElementById("cmbbranch").value;
		 var fromdate = $('#fromdate').val();
		 var todate = $('#todate').val();
		 var acctype = $('#cmbtype').val();
		 var includingzero = $('#hidchckincludingzero').val(); 
		 
		 $("#overlay, #PleaseWait").show();
		 
		 $("#trialBalanceDiv").load("trialBalanceGrid.jsp?barchval="+branchval+'&fromdate='+fromdate+'&todate='+todate+'&acctype='+acctype+'&includingzero='+includingzero+'&check=1');
		}

</script>
</head>
<body onload="getBranch();">
<div id="mainBG" class="homeContent" data-type="background">
<div class='hidden-scrollbar'>

<div class="master-container">

    <div class="sidebar-filters">
        <div class="sidebar-scroll-content">

            <div class="filter-card">
                <table class="filter-table">
                    <tr>
                        <td class="label-cell" style="width: 50px;">Period</td>
                        <td><div id="fromdate" name="fromdate" value='<s:property value="fromdate"/>'></div></td>
                    </tr>
                    <tr>
                        <td class="label-cell" style="width: 50px;">To</td>
                        <td><div id="todate" name="todate" value='<s:property value="todate"/>'></div></td>
                    </tr>
                </table>

                <div style="margin-top: 10px;">
                    <input type="checkbox" id="chckincludingzero" name="chckincludingzero" value="" onchange="includingzerocheck();" onclick="$(this).attr('value', this.checked ? 1 : 0)" />
                    <input type="hidden" id="hidchckincludingzero" name="hidchckincludingzero" readonly="readonly" value='<s:property value="hidchckincludingzero"/>'/>
                </div>

                <table class="filter-table" style="margin-top: 10px;">
                    <tr>
                        <td class="label-cell" style="width: 50px;">Type</td>
                        <td>
                            <select id="cmbtype" name="cmbtype" value='<s:property value="cmbtype"/>'>
                                <option value="">All</option>
                                <option value="AP">AP</option>
                                <option value="AR">AR</option>
                                <option value="GL">GL</option>
                                <option value="HR">HR</option>
                            </select>
                        </td>
                    </tr>
                </table>
            </div>

        </div>
    </div>

    <div class="main-content-wrapper">

        <div class="top-toolbar-container">
            <jsp:include page="../../heading.jsp"></jsp:include>
        </div>

        <div class="scrollable-grid-area">
            <div id="trialBalanceDiv">
                <jsp:include page="trialBalanceGrid.jsp"></jsp:include>
            </div>
        </div>

    </div>

</div>

<div id="trialDiv" hidden="true">
    <table width="100%">
        <tr>
            <td width="98%" align="right">
                <input type="text" class="textbox" id="txtnetamount" name="txtnetamount" style="text-align: right;" value='<s:property value="txtnetamount"/>'/>
            </td>
            <td width="2%">&nbsp;</td>
        </tr>
    </table>
</div>

</div>
</div>
</body>
</html>