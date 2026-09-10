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

/* Readonly fields override */
input[readonly],
input:disabled {
    background-color: #f3f6f9 !important;
    color: #555;
    border-color: #e1e8ed !important;
    cursor: text;
}

/* Fieldset and Legend overrides */
fieldset {
    border: 1px solid #ccd6e0;
    border-radius: 8px;
    padding: 10px;
    background: transparent;
    margin-bottom: 5px;
}
legend {
    font-size: 12px;
    font-weight: bold;
    color: #4e5e71;
    padding: 0 5px;
}

/* Checkboxes & Radios */
.radio-group {
    display: flex;
    justify-content: center;
    gap: 15px;
    margin-top: 5px;
    font-size: 12px;
    font-weight: 600;
    color: #4e5e71;
}
.radio-group label {
    display: flex;
    align-items: center;
    cursor: pointer;
}
.radio-group input[type="radio"] {
    margin: 0 5px 0 0;
    vertical-align: middle;
}

/* jqx Date Container Mapping Rules */
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

	$(document).ready(function () {
		 $("#fromdate").jqxDateTimeInput({ width: '125px', height: '15px',formatString:"dd.MM.yyyy"});
		 $("#todate").jqxDateTimeInput({ width: '125px', height: '15px',formatString:"dd.MM.yyyy"});
		 
		 $('#assetDetailsWindow').jqxWindow({width: '30%', height: '60%',  maxHeight: '62%' ,maxWidth: '60%' , title: 'Asset Search',position: { x: 250, y: 120 } , theme: 'energyblue', showCloseButton: true, keyboardCloseKey: 27});
		 $('#assetDetailsWindow').jqxWindow('close');
	     
		 $('#groupDetailsWindow').jqxWindow({width: '20%', height: '60%',  maxHeight: '62%' ,maxWidth: '60%' , title: 'Group Search',position: { x: 250, y: 120 } , theme: 'energyblue', showCloseButton: true, keyboardCloseKey: 27});
	     $('#groupDetailsWindow').jqxWindow('close');
	     
		 $("body").prepend('<div id="overlay" class="ui-widget-overlay" style="z-index: 1; display: none;"></div>');
	     $("body").prepend("<div id='PleaseWait' style='display: none;position:absolute; z-index: 1;top:180px;right:550px;'><img src='../../../../icons/31load.gif'/></div>");
		 
		 var curfromdate= $('#fromdate').jqxDateTimeInput('getDate');
	     var oneyeardate=new Date(new Date(curfromdate).setMonth(curfromdate.getMonth()-1));
	     var oneyearbackdate=new Date(new Date(oneyeardate).setDate(oneyeardate.getDate()));
	     $('#fromdate ').jqxDateTimeInput('setDate', new Date(oneyearbackdate));
	     
		  $('#txtasset').dblclick(function(){
			  assetSearchContent('assetSearchGrid.jsp');
		  });
		  
		  $('#txtgroup').dblclick(function(){
			  groupSearchContent('groupSearchGrid.jsp');
		  });
			
	     document.getElementById("rdall").checked=true;
	     
	});
	
	function funExportBtn(){
	    JSONToCSVConvertor(dataExcelExport, 'FixedAssetRegister', true);
	} 
	
	function JSONToCSVConvertor(JSONData, ReportTitle, ShowLabel) {
		
	    var arrData = typeof JSONData != 'object' ? JSON.parse(JSONData) : JSONData;
	    
	    var CSV = '';    
	    
	    CSV += ReportTitle + '\r\n\n';

	    //This condition will generate the Label/Header
	    if (ShowLabel) {
	        var row = "";
	        
	        //This loop will extract the label from 1st index of on array
	        for (var index in arrData[0]) {
	            
	            //Now convert each value to string and comma-seprated
	            row += index + ',';
	        }

	        row = row.slice(0, -1);
	        
	        //append Label row with line break
	        CSV += row + '\r\n';
	    }
	    
	    //1st loop is to extract each row
	    for (var i = 0; i < arrData.length; i++) {
	        var row = "";
	        
	        //2nd loop will extract each column and convert it in string comma-seprated
	        for (var index in arrData[i]) {
	            row += '"' + arrData[i][index] + '",';
	        }

	        row.slice(0, row.length - 1);
	        
	        //add a line break after each row
	        CSV += row + '\r\n';
	    }

	    if (CSV == '') {        
	        alert("Invalid data");
	        return;
	    }   
	    
	    //Generate a file name
	    var fileName = "";
	    //this will remove the blank-spaces from the title and replace it with an underscore
	    fileName += ReportTitle.replace(/ /g,"_");   
	    
	    //Initialize file format you want csv or xls
	    var uri = 'data:text/csv;charset=utf-8,' + escape(CSV);
	    
	    // Now the little tricky part.
	    // you can use either>> window.open(uri);
	    // but this will not work in some browsers
	    // or you will not get the correct file extension    
	    
	    //this trick will generate a temp <a /> tag
	    var link = document.createElement("a");    
	    link.href = uri;
	    
	    //set the visibility hidden so it will not effect on your web-layout
	    link.style = "visibility:hidden";
	    link.download = fileName + ".csv";
	    
	    //this part will append the anchor tag and remove it after automatic click
	    document.body.appendChild(link);
	    link.click();
	    document.body.removeChild(link);
	}

	
	function assetSearchContent(url) {
	    $('#assetDetailsWindow').jqxWindow('open');
		$.get(url).done(function (data) {
		$('#assetDetailsWindow').jqxWindow('setContent', data);
		$('#assetDetailsWindow').jqxWindow('bringToFront');
	}); 
	}
	
	function groupSearchContent(url) {
	    $('#groupDetailsWindow').jqxWindow('open');
		$.get(url).done(function (data) {
		$('#groupDetailsWindow').jqxWindow('setContent', data);
		$('#groupDetailsWindow').jqxWindow('bringToFront');
	}); 
	}
	
	function getAsset(event){
        var x= event.keyCode;
        if(x==114){
        	assetSearchContent('assetSearchGrid.jsp');
        }
        else{}
        }
	
	function getGroup(event){
        var x= event.keyCode;
        if(x==114){
        	groupSearchContent('groupSearchGrid.jsp');
        }
        else{}
        }

	function funreload(event){
		 var branchval = document.getElementById("cmbbranch").value;
		 var fromdate = $('#fromdate').val();
		 var todate = $('#todate').val();
		 var assetno = $('#txtasset').val();
		 var group = $('#txtgroupno').val();
		 var check=1;
		 
		 $("#overlay, #PleaseWait").show();
		 
		 if(document.getElementById("rdall").checked==true){
			 $("#assetDiv").load("fixedAssetRegisterGrid.jsp?rpttype=1&branchval="+branchval+'&fromdate='+fromdate+'&todate='+todate+'&assetno='+assetno+'&group='+group+'&check='+check);
		 	
		 }else if(document.getElementById("rdsold").checked==true){
			 $("#assetDiv").load("fixedAssetRegisterGrid.jsp?rpttype=2&branchval="+branchval+'&fromdate='+fromdate+'&todate='+todate+'&assetno='+assetno+'&group='+group+'&check='+check);
			 
		 }else{
			 $("#assetDiv").load("fixedAssetRegisterGrid.jsp?rpttype=3&branchval="+branchval+'&fromdate='+fromdate+'&todate='+todate+'&assetno='+assetno+'&group='+group+'&check='+check);
		   }
		}
	
	function  funClearInfo(){
		
		$('#fromdate').val(new Date());
		var curfromdate= $('#fromdate').jqxDateTimeInput('getDate');;
	    var oneyeardate=new Date(new Date(curfromdate).setMonth(curfromdate.getMonth()-1));
	    var oneyearbackdate=new Date(new Date(oneyeardate).setDate(oneyeardate.getDate()));
	    $('#fromdate').jqxDateTimeInput('setDate', new Date(oneyearbackdate));
	     
	    $('#todate').val(new Date());
	    
		document.getElementById("txtasset").value="";
		document.getElementById("txtgroup").value="";
		document.getElementById("txtgroupno").value="";
		
		document.getElementById("rdall").checked=true;
		
		 if (document.getElementById("txtgroup").value == "") {
		        $('#txtgroup').attr('placeholder', 'Press F3 to Search'); 
		    }
		 
		 if (document.getElementById("txtasset").value == "") {
		        $('#txtasset').attr('placeholder', 'Press F3 to Search'); 
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
                        <td class="label-cell">From</td>
                        <td><div id="fromdate" name="fromdate" value='<s:property value="fromdate"/>'></div></td>
                    </tr> 
                    <tr>
                        <td class="label-cell">To</td>
                        <td><div id="todate" name="todate" value='<s:property value="todate"/>'></div></td>
                    </tr>
                </table>
            </div>

            <div class="filter-card">
                <table class="filter-table">
                    <tr>
                        <td class="label-cell">Asset</td>
                        <td>
                            <input type="text" id="txtasset" name="txtasset" readonly="readonly" placeholder="Press F3 to Search" value='<s:property value="txtasset"/>' onkeydown="getAsset(event);"/>
                        </td>
                    </tr>
                    <tr>
                        <td class="label-cell">Group</td>
                        <td>
                            <input type="text" id="txtgroup" name="txtgroup" readonly="readonly" placeholder="Press F3 to Search" value='<s:property value="txtgroup"/>' onkeydown="getGroup(event);"/>
                        </td>
                    </tr> 
                </table>
            </div>

            <div class="filter-card">
                <fieldset>
                    <legend>Report Type</legend>
                    <div class="radio-group">
                        <label>
                            <input type="radio" id="rdall" name="rdo" value="rdall">
                            All
                        </label>
                        <label>
                            <input type="radio" id="rdsold" name="rdo" value="rdsold">
                            Sold
                        </label>
                    </div>
                    <div class="radio-group" style="margin-top: 10px;">
                        <label>
                            <input type="radio" id="rdadditions" name="rdo" value="rdadditions">
                            Additions
                        </label>
                    </div>
                </fieldset>

                <hr style="border: 0; border-top: 1px solid #e1e8ed; margin: 15px 0;">

                <input type="button" class="btn-submit" name="clear" id="clear" value="Clear" onclick="funClearInfo();" style="background:#64748b !important;">
            </div>

            <div style="display:none;">
                <input type="hidden" id="txtgroupno" name="txtgroupno" value='<s:property value="txtgroupno"/>'/>
            </div>

        </div>
    </div>

    <div class="main-content-wrapper">
        
        <div class="top-toolbar-container">
            <jsp:include page="../../heading.jsp"></jsp:include>
        </div>

        <div class="scrollable-grid-area">
            
            <div id="assetDiv">
                <jsp:include page="fixedAssetRegisterGrid.jsp"></jsp:include>
            </div>

        </div>

    </div>

</div>

<div id="assetDetailsWindow">
	<div></div><div></div>
</div>
<div id="groupDetailsWindow">
	<div></div><div></div>
</div>

</div>
</body>
</html>