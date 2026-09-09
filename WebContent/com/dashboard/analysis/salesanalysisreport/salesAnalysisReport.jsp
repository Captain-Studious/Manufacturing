<jsp:include page="../../../../includes.jsp"></jsp:include>    
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%  String contextPath=request.getContextPath();%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>GatewayERP(i)</title>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="https://daneden.github.io/animate.css/animate.min.css">
<link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
<link href="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.6-rc.0/css/select2.min.css" rel="stylesheet" />
<link href="https://fonts.googleapis.com/css?family=Rubik" rel="stylesheet" />
<jsp:include page="../../../../floorMgmtIncludes.jsp"></jsp:include> 
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

/* ===== LEFT SIDEBAR (Actions & Tools) ===== */
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
    width: 90px;
}

/* ===== UNIFORM 24px INPUTS & SELECTS ===== */
input[type="text"], input[type="number"], select, textarea,
.release-filter-table input[type="text"],
.release-filter-table input[type="number"],
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

.myButtons1 {
    width: 24px;
    height: 24px;
    padding: 0;
    background: #2563eb;
    color: #fff;
    border: none;
    border-radius: 4px;
    font-weight: bold;
    cursor: pointer;
    line-height: 24px;
    text-align: center;
}
.myButtons1:hover {
    background: #1d4ed8;
}

/* Action buttons layout */
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
    height: 100%;
}
</style>

<script type="text/javascript">
    var selectedBox = null;
	
	$(document).ready(function () {
		 $("#fromdate").jqxDateTimeInput({ width: '100%', height: '24px',formatString:"dd.MM.yyyy"});
		 $("#todate").jqxDateTimeInput({ width: '100%', height: '24px',formatString:"dd.MM.yyyy"});
		 $('#searchWindow').jqxWindow({ width: '60%', height: '65%',  maxHeight: '85%' ,maxWidth: '80%' , title: 'Search' ,position: { x: 250, y: 60 }, theme: 'energyblue', keyboardCloseKey: 27});
		 $('#searchWindow').jqxWindow('close');
		 $("body").prepend('<div id="overlay" class="ui-widget-overlay" style="z-index: 1000; display: none;"></div>');
	     $("body").prepend("<div id='PleaseWait' style='display: none;position:absolute; z-index: 1001;top:50%;left:50%;transform:translate(-50%,-50%);'><img src='../../../../icons/31load.gif'/></div>");
	     
	     var curfromdate= $('#fromdate').jqxDateTimeInput('getDate');
	     var oneyeardate=new Date(new Date(curfromdate).setMonth(curfromdate.getMonth()-1));
	     var oneyearbackdate=new Date(new Date(oneyeardate).setDate(oneyeardate.getDate()));
	     $('#fromdate').jqxDateTimeInput('setDate', new Date(oneyearbackdate));
	     
	     $('#cmbchoose').val('4');$('#txtnoofdays').attr('readonly', true );$('#txtnoofdays').val('');
 		 
	     $("#overlay, #PleaseWait").show();
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
	
	function getGridColumnCalculation(fromdate,todate,frequencytype,noofdays,summarytype,hidsalesman,hidcatid,hideptid){
  		var x = new XMLHttpRequest();
  		x.onreadystatechange = function() {
  			if (x.readyState == 4 && x.status == 200) {
  				var items = x.responseText;
  				 items = items.split('***');
  			      var frequencyType=items[0];
		          var difference=items[1];
		          var columns=items[2];
		          
		          if(parseInt(columns)==1) {
						$.messager.alert('Message','Period is too Long,Limit Reached.','warning');
						return;
		          }else{
		        	  var branchval = document.getElementById("cmbbranch").value;
		     		  var check=1;
		        	  $("#overlay, #PleaseWait").show();
		     		  $("#analysisDiv").load("salesAnalysisReportGrid.jsp?branchval="+branchval+'&fromdate='+fromdate+'&todate='+todate+'&frequencytype='+frequencytype+'&noofdays='+noofdays+'&summarytype='+summarytype+"&hidsalesman="+hidsalesman+"&hidcatid="+hidcatid+"&hideptid="+hideptid+'&check='+check);
		          }
    		}
		}
		x.open("GET", "getGridColumnCalculation.jsp?fromdate="+fromdate+"&todate="+todate+"&frequencytype="+frequencytype+"&noofdays="+noofdays, true);
		x.send();
    }
	
	function noOfDays(){
		if($('#cmbchoose').val()==1){
			$('#txtnoofdays').attr('readonly', false );$('#txtnoofdays').val('0');			
		}else{
			$('#txtnoofdays').attr('readonly', true );$('#txtnoofdays').val('');
		}
	}
	
	 function funreload(event){
		 var fromdate = $('#fromdate').val();
		 var todate = $('#todate').val();
		 var frequencytype = $('#cmbchoose').val();
		 var noofdays = $('#txtnoofdays').val();
		 var hidsalesman=document.getElementById("hidsalesman").value;
		 var hidcatid=document.getElementById("hidcatid").value;
		 var hideptid=document.getElementById("hideptid").value;
		 
		 if(fromdate==todate) {
				$.messager.alert('Message','Not a Valid Period,From Date & To Date are Same.','warning');
				return;
        }
		 if($('#cmbsummarytype').val()=='') {
				$.messager.alert('Message','Please Choose a Summary Type.','warning');
				return;
		 }
		 var summarytype = $('#cmbsummarytype').val();
		 getGridColumnCalculation(fromdate,todate,frequencytype,noofdays,summarytype,hidsalesman,hidcatid,hideptid);
	 }
	 
	 function funClearInfo(){
	        $('#cmbbranch').val('a');
			$('#fromdate').val(new Date());
			var curfromdate= $('#fromdate').jqxDateTimeInput('getDate');
		    var oneyeardate=new Date(new Date(curfromdate).setMonth(curfromdate.getMonth()-1));
		    var oneyearbackdate=new Date(new Date(oneyeardate).setDate(oneyeardate.getDate()));
		    $('#fromdate ').jqxDateTimeInput('setDate', new Date(oneyearbackdate));
			$('#todate').val(new Date());
			$('#cmbchoose').val('4');
			$('#txtnoofdays').val('');
			$('#txtnoofdays').attr('readonly', true );
			
			document.getElementById("searchdetails").value="";
			document.getElementById("searchby").value="";
			document.getElementById("salesman").value="";
			document.getElementById("hidsalesman").value="";
			document.getElementById("hiddate").value="";
			document.getElementById("accno").value="";
			document.getElementById("hidaccno").value="";
			document.getElementById("hidept").value="";
			document.getElementById("hideptid").value="";
			document.getElementById("hidbrand").value="";
			document.getElementById("hidbrandid").value="";
			document.getElementById("hidproduct").value="";
			document.getElementById("hidproductid").value="";
	}
		
	function funExportBtn(){
		var summary=$('#cmbsummarytype').val();
		if(summary=='slm'){
			summary="SALESMAN";
		}else if(summary=='dpt'){
			summary="DEPARTMENT";
		} else if(summary=='ctg'){
			summary="CATEGORY";
		}
		if(parseInt(window.parent.chkexportdata.value)=="1") {
		  	JSONToCSVCon(dataExcelExport, 'Sales Analysis Report  -   '+summary, true);
		} else {
			$("#analysisGrid").jqxTreeGrid('exportData', 'xls');
		}
	}
    
	function setSearch(){
		var value=$('#searchby').val().trim();
		if(value=="sslm"){
			getSalesman();
		}
		else if(value=="sdpt"){
			getDepartment();
		}
		else if(value=="sctg"){
			getCategory();
		}
	}
    
	function setRemove(){
		var value=$('#searchby').val().trim();
		if(value=="sslm"){
			document.getElementById("searchdetails").value="";
			document.getElementById("salesman").value="";
			document.getElementById("hidsalesman").value="";
			if(document.getElementById("hidept").value!=""){
				document.getElementById("searchdetails").value+=document.getElementById("hidept").value; 
			} if(document.getElementById("hidcat").value!=""){
				document.getElementById("searchdetails").value+=document.getElementById("hidcat").value; 
			} 
		} else if(value=="sdpt"){
			document.getElementById("searchdetails").value="";
			document.getElementById("hidept").value="";
			document.getElementById("hideptid").value="";
			if(document.getElementById("salesman").value!=""){
				document.getElementById("searchdetails").value+=document.getElementById("salesman").value; 
			} if(document.getElementById("hidcat").value!=""){
				document.getElementById("searchdetails").value+=document.getElementById("hidcat").value; 
			} 
		}
		else if(value=="sctg"){
			document.getElementById("searchdetails").value="";
			document.getElementById("hidcat").value="";
			document.getElementById("hidcatid").value="";
			if(document.getElementById("salesman").value!=""){
				document.getElementById("searchdetails").value+=document.getElementById("salesman").value; 
			} 
			if(document.getElementById("hidept").value!=""){
				document.getElementById("searchdetails").value+=document.getElementById("hidept").value; 
			}
		}
	}
	
    function getSalesman(){
		searchContent('salesmanSearch.jsp?id=1');
	}
	function getDepartment(){
		searchContent('departmentSearch.jsp');
	}
	function getCategory(){
		searchContent('categorySearch.jsp');
	}
	function searchContent(url) {
		$('#searchWindow').jqxWindow('open');
		$.get(url).done(function (data) {
		    $('#searchWindow').jqxWindow('setContent', data);
		    $('#searchWindow').jqxWindow('bringToFront');
	    }); 
	}
</script>
</head>
<body onload="getBranch();">
<div id="mainBG" class="homeContent hidden-scrollbar" data-type="background"> 
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
                        <tr>
                            <td class="label-cell">Type</td>
                            <td>
                                <select id="cmbchoose" name="cmbchoose" onchange="noOfDays();" value='<s:property value="cmbchoose"/>'>
                                    <option value="2">Monthly</option>
                                    <option value="3">Quarterly</option>
                                    <option value="4">Yearly</option>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td class="label-cell">Summary</td>
                            <td>
                                <select id="cmbsummarytype" name="cmbsummarytype" value='<s:property value="cmbsummarytype"/>'>
                                    <option value="slm">Salesman</option>
                                    <option value="dpt">Department</option>
                                    <option value="ctg">Category</option>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td class="label-cell">Search By</td>
                            <td>
                                <div style="display: flex; gap: 5px;">
                                    <select name="searchby" id="searchby" style="flex: 1;">
                                        <option value="">--Select--</option>
                                        <option value="sslm">Salesman</option>
                                        <option value="sdpt">Department</option>
                                        <option value="sctg">Category</option>
                                    </select>
                                    <button type="button" name="btnadditem" id="additem" class="myButtons1" onclick="setSearch();">+</button>
                                    <button type="button" name="btnremoveitem" id="btnremoveitem" class="myButtons1" onclick="setRemove();">-</button>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <textarea id="searchdetails" name="searchdetails" style="height: 140px;" readonly="readonly"><s:property value="searchdetails"></s:property>
                                </textarea>
                            </td>
                        </tr>
                    </table>

                    <div class="release-actions">
                        <button type="button" class="btn-submit" name="clear" id="clear" onclick="funClearInfo();">Clear</button>
                    </div>
                </div>

                <input type="hidden" id="txtnoofdays" name="txtnoofdays" value='<s:property value="txtnoofdays"/>'/>
                <input type="hidden" name="salesman" id="salesman">
                <input type="hidden" name="hidsalesman" id="hidsalesman">
                <input type="hidden" name="hidcat" id="hidcat">
                <input type="hidden" name="hidcatid" id="hidcatid">
                <input type="hidden" name="hidept" id="hidept">
                <input type="hidden" name="hideptid" id="hideptid">
                
                <input type="hidden" id="hiddate">
                <input type="hidden" id="accno">
                <input type="hidden" id="hidaccno">
                <input type="hidden" id="hidbrand">
                <input type="hidden" id="hidbrandid">
                <input type="hidden" id="hidproduct">
                <input type="hidden" id="hidproductid">
                
                <div id='paychaaaaa' style="display: none;"></div>
            </div>
        </div>

        <div class="main-content-area">
            
            <div class="top-toolbar-container">
                <jsp:include page="../../heading.jsp"></jsp:include>
            </div>

            <div class="grid-content-container">
                <div id="analysisDiv" class="borderStyle"><jsp:include page="salesAnalysisReportGrid.jsp"></jsp:include></div>
            </div>

        </div>

    </div> 

    <div id="searchWindow">
        <div></div>
    </div>
</div> 
</body>
</html>