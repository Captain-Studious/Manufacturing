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

/* Cards Layout Rules */
.filter-card {
    background: #f8fafc;
    border: 1px solid #e3e8ee;
    border-radius: 12px;
    padding: 15px;
    margin-bottom: 12px;
}

/* Internal Presentation Tables */
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
    width: 60px;
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

/* Select specific styling */
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

/* Fieldset and Legend overrides */
fieldset {
    border: 1px solid #ccd6e0;
    border-radius: 8px;
    padding: 10px;
    background: transparent;
    margin-bottom: 15px;
}
legend {
    font-size: 12px;
    font-weight: bold;
    color: #4e5e71;
    padding: 0 5px;
}

/* Checkboxes */
.checkbox-list {
    display: flex;
    flex-direction: column;
    gap: 8px;
    padding: 5px 0;
}
.checkbox-item {
    display: flex;
    align-items: center;
    gap: 8px;
    font-size: 12px;
    font-weight: 600;
    color: #4e5e71;
    cursor: pointer;
}
.checkbox-item input[type="checkbox"] {
    margin: 0;
    cursor: pointer;
}

/* Analysis Layout Container */
.analysis-container {
    display: flex;
    align-items: center;
    gap: 8px;
    margin-bottom: 10px;
}

/* jqx Date Container Mapping Rules */
.filter-table div[id^="fromdate"],
.filter-table div[id^="todate"] {
    width: 100%;
}

/* ===== RIGHT CONTENT AREA (Horizontally Aligned Heading) ===== */
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
    
	var selectedBox = null;
	
	$(document).ready(function () {
		 $("#fromdate").jqxDateTimeInput({ width: '125px', height: '15px',formatString:"dd.MM.yyyy"});
		 $("#todate").jqxDateTimeInput({ width: '125px', height: '15px',formatString:"dd.MM.yyyy"});
		 
		 $("body").prepend('<div id="overlay" class="ui-widget-overlay" style="z-index: 1; display: none;"></div>');
	     $("body").prepend("<div id='PleaseWait' style='display: none;position:absolute; z-index: 1;top:180px;right:550px;'><img src='../../../../icons/31load.gif'/></div>");
	     
		 var year = window.parent.txtaccountperiodfrom.value;
		 var newDate = year.split('-');
		 year = newDate[1] + "-" + newDate[0] + "-" + newDate[2];
		 $('#fromdate ').jqxDateTimeInput('setDate', new Date(year));
	     
		 $("#branchlabel").attr('hidden',true);
		 $("#branchdiv").attr('hidden',true);
			
	     /* document.getElementById("hidchckgroup").value=1;
 		 document.getElementById("chckgroup").checked = true; */
 		 
 		 $(".chcklevels").click(function() {
 	        selectedBox = this.id;

 	        $(".chcklevels").each(function() {
 	            if ( this.id == selectedBox )
 	            {
 	                this.checked = true;
 	            }
 	            else
 	            {
 	                this.checked = false;
 	            };        
 	        });
 	    });    
 		 
		 document.getElementById("hidchcklevel4").value=1;
 		 document.getElementById("chcklevel4").checked = true;
	});
	
	function isNumber(evt) {
        var iKeyCode = (evt.which) ? evt.which : evt.keyCode
        if (iKeyCode != 46 && iKeyCode > 31 && (iKeyCode < 48 || iKeyCode > 57))
         {
          $.messager.alert('Message',' Enter Numbers Only ','warning');    
            return false;
         }
        return true;
    }
	
	function analysischeck(){
		 if(document.getElementById("chckanalysis").checked){
			 document.getElementById("hidchckanalysis").value = 1;
			 $('#txtnoofdays').val("0");
 			 $('#txtfrequency').val("0");
		 }
		 else{
			 document.getElementById("hidchckanalysis").value = 0;
		 }
		 hidedata();
	 }
	
	function checklevel1(){
		if(document.getElementById("chcklevel1").checked){
			 document.getElementById("hidchcklevel1").value = 1;
			 document.getElementById("hidchcklevel2").value = 0;
			 document.getElementById("hidchcklevel3").value = 0;
			 document.getElementById("hidchcklevel4").value = 0;
		 }
		 else{
			 document.getElementById("hidchcklevel1").value = 0;
		 }
	 }
	
	function checklevel2(){
		 if(document.getElementById("chcklevel2").checked){
			 document.getElementById("hidchcklevel2").value = 1;
			 document.getElementById("hidchcklevel1").value = 0;
			 document.getElementById("hidchcklevel3").value = 0;
			 document.getElementById("hidchcklevel4").value = 0;
		 }
		 else{
			 document.getElementById("hidchcklevel2").value = 0;
		 }
	 }
	
	function checklevel3(){
		 if(document.getElementById("chcklevel3").checked){
			 document.getElementById("hidchcklevel3").value = 1;
			 document.getElementById("hidchcklevel1").value = 0;
			 document.getElementById("hidchcklevel2").value = 0;
			 document.getElementById("hidchcklevel4").value = 0;
		 }
		 else{
			 document.getElementById("hidchcklevel3").value = 0;
		 }
	 }
	
	function checklevel4(){
		 if(document.getElementById("chcklevel4").checked){
			 document.getElementById("hidchcklevel4").value = 1;
			 document.getElementById("hidchcklevel1").value = 0;
			 document.getElementById("hidchcklevel2").value = 0;
			 document.getElementById("hidchcklevel3").value = 0;
		 }
		 else{
			 document.getElementById("hidchcklevel4").value = 0;
		 }
	 }
	
	function hidedata(){
  		var analysis=$('#hidchckanalysis').val();
  		
  		if(parseInt(analysis)==1){
  			   $("#analysisDiv").prop("hidden", false);
  			   $("#viewDiv").attr("hidden", true);
  			}
  			else{
  				$("#analysisDiv").prop("hidden", true);
  				$("#viewDiv").attr("hidden", false);
  			}
  		}
	
	 function funreload(event){
		 var branchval = document.getElementById("cmbbranch").value;
		 var fromdate = $('#fromdate').val();
		 var todate = $('#todate').val();
		 var level1 = $('#hidchcklevel1').val();
		 var level2 = $('#hidchcklevel2').val();
		 var level3 = $('#hidchcklevel3').val();
		 var level4 = $('#hidchcklevel4').val();
		 var check=1;
		 
		 $("#overlay, #PleaseWait").show();
		 
		 $("#balanceSheetDiv").load("balanceSheetGrid.jsp?branchval="+branchval+'&fromdate='+fromdate+'&todate='+todate+'&level1='+level1+'&level2='+level2+'&level3='+level3+'&level4='+level4+'&check='+check);
		}
		
		function funExportBtn(){
		  if(parseInt(window.parent.chkexportdata.value)=="1") {
		  	JSONToCSVCon(dataExcelExport, 'BalanceSheet', true);
		  } else {
			 $("#balanceSheetGrid").jqxTreeGrid('exportData', 'xls');
		  }
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
                        <td class="label-cell">Period</td>
                        <td><div id="fromdate" name="fromdate" value='<s:property value="fromdate"/>'></div></td>
                    </tr>
                </table>
            </div>

            <div id="viewDiv">
                <div class="filter-card">
                    <table class="filter-table">
                        <tr>
                            <td class="label-cell">To</td>
                            <td><div id="todate" name="todate" value='<s:property value="todate"/>'></div></td>
                        </tr>
                    </table>

                    <fieldset>
                        <legend>Levels</legend>
                        <div class="checkbox-list">
                            <label class="checkbox-item">
                                <input type="checkbox" id="chcklevel1" name="chcklevel1" class="chcklevels" onchange="checklevel1();" onclick="$(this).attr('value', this.checked ? 1 : 0)">
                                Level 1
                            </label>
                            <label class="checkbox-item">
                                <input type="checkbox" id="chcklevel2" name="chcklevel2" class="chcklevels" onchange="checklevel2();" onclick="$(this).attr('value', this.checked ? 1 : 0)">
                                Level 2
                            </label>
                            <label class="checkbox-item">
                                <input type="checkbox" id="chcklevel3" name="chcklevel3" class="chcklevels" onchange="checklevel3();" onclick="$(this).attr('value', this.checked ? 1 : 0)">
                                Level 3
                            </label>
                            <label class="checkbox-item">
                                <input type="checkbox" id="chcklevel4" name="chcklevel4" class="chcklevels" onchange="checklevel4();" onclick="$(this).attr('value', this.checked ? 1 : 0)">
                                Level 4
                            </label>
                        </div>
                    </fieldset>
                </div>
            </div>

            <div id="analysisDiv" hidden="true">
                <div class="filter-card">
                    <div class="analysis-container">
                        <select id="cmbchoose" name="cmbchoose" style="width:50%;" value='<s:property value="cmbchoose"/>'>
                            <option value="1">Days</option>
                            <option value="2">Monthly</option>
                            <option value="3">Quarterly</option>
                            <option value="4">Yearly</option>
                        </select>
                        <input type="text" id="txtnoofdays" name="txtnoofdays" style="width:50%;" value='<s:property value="txtnoofdays"/>'/>
                    </div>
                    <table class="filter-table">
                        <tr>
                            <td class="label-cell" style="width:80px;">Frequency</td>
                            <td><input type="text" id="txtfrequency" name="txtfrequency" value='<s:property value="txtfrequency"/>'/></td>
                        </tr>
                    </table>
                </div>
            </div>

            <div style="display:none;">
                <input type="hidden" id="hidchcklevel1" name="hidchcklevel1" value='<s:property value="hidchcklevel1"/>'/>
                <input type="hidden" id="hidchcklevel2" name="hidchcklevel2" value='<s:property value="hidchcklevel2"/>'/>
                <input type="hidden" id="hidchcklevel3" name="hidchcklevel3" value='<s:property value="hidchcklevel3"/>'/>
                <input type="hidden" id="hidchcklevel4" name="hidchcklevel4" value='<s:property value="hidchcklevel4"/>'/>
                </div>

        </div>
    </div>

    <div class="main-content-wrapper">
        
        <div class="top-toolbar-container">
            <jsp:include page="../../heading.jsp"></jsp:include>
        </div>

        <div class="scrollable-grid-area">
            
            <div id="balanceSheetDiv">
                <jsp:include page="balanceSheetGrid.jsp"></jsp:include>
            </div>

        </div>

    </div>

</div>

</div> 
</body>
</html>