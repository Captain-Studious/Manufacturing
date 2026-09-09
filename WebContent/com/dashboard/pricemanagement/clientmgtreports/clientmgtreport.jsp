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
    height: 100%;
}
</style>

<script type="text/javascript">

$(document).ready(function () {
	  $("body").prepend('<div id="overlay" class="ui-widget-overlay" style="z-index: 1000; display: none;"></div>');
	  $("body").prepend("<div id='PleaseWait' style='display: none;position:absolute; z-index: 1001;top:50%;left:50%;transform:translate(-50%,-50%);'><img src='../../../../icons/31load.gif'/></div>");
	  
      $('#accountSearchwindow').jqxWindow({ width: '50%', height: '62%',  maxHeight: '75%' ,maxWidth: '50%' , title: 'Client Search' ,position: { x: 150, y: 60 }, keyboardCloseKey: 27});
	  $('#accountSearchwindow').jqxWindow('close');

	  $('#clientname').dblclick(function(){
		  $('#accountSearchwindow').jqxWindow('open');
		  accountSearchContent('accountsDetailsSearch.jsp?');
	  });   
});

function getaccountdetails(event){
	 var x= event.keyCode;
	 if(x==114){
	     $('#accountSearchwindow').jqxWindow('open');
	     accountSearchContent('accountsDetailsSearch.jsp?');    
     }
}  

function accountSearchContent(url) {
    $.get(url).done(function (data) {
        $('#accountSearchwindow').jqxWindow('setContent', data);
    }); 
}

function funExportBtn(){
	JSONToCSVCon(datas1, 'Client Management List', true);
}

function funreload(event)
{
	 var barchval = document.getElementById("cmbbranch").value;
     var fromdate="";
	 var todate="";
	 var statusselect="";
	 var cldocno=$("#cldocno").val();
	 
	 $("#overlay, #PleaseWait").show();
	 $("#listdiv").load("listGrid.jsp?barchval="+barchval+"&fromdate="+fromdate+"&todate="+todate+"&statusselect="+statusselect+"&cldocno="+cldocno);
}

function getcat() {
	var x = new XMLHttpRequest();
	x.onreadystatechange = function() {
		if (x.readyState == 4 && x.status == 200) {
			var items = x.responseText;
			items = items.split('####');
			var catid  = items[0].split(",");
			var cat = items[1].split(",");
		 	var optionsbranch = ' ';  
			for (var i = 0; i < cat.length; i++) {
				optionsbranch += '<option value="' + catid[i].trim() + '">'
						+ cat[i] + '</option>';
			}
			$("select#cat").html(optionsbranch);
		}
	}
	x.open("GET","getcat.jsp", true);
	x.send();
}	

function funupdatesdata()
{
	$.messager.confirm('Message', 'Do you want to save changes?', function(r){
		if(r==false)
		{
		}
		else
		{   
            var remarks=$("#remarks").val();
		   	if(remarks=="")
		   	{
		   		$.messager.alert('Message','Enter Reason ','warning');    
		   		return 0;
		   	}
 
            var cldocno="";
            var rows = $("#client").jqxGrid('getrows');
            for(var i=0 ; i < rows.length ; i++){
                if(rows[i].cellselects=="1")
                {
                    cldocno=cldocno+rows[i].cldocno+"::";
                }
            } 
            savedatas(cldocno);
		}
	}); 
}

function savedatas(cldocno){
	var x=new XMLHttpRequest();
	x.onreadystatechange=function(){
		if (x.readyState==4 && x.status==200)
		{
			var items= x.responseText;
			var itemval=items.trim();
				 	
            if(parseInt(itemval)==1)
            {
				$.messager.alert('Message', '  Record successfully Updated ', function(r){});
				funreload(event);
				getcat(); 
				dis();
			}
			else
			{
				$.messager.alert('Message', '  Not Updated ', function(r){});
			}  
		}
	}
	x.open("GET","savedata.jsp?&cldocno="+cldocno+'&cat='+document.getElementById("cat").value+'&reason='+$("#remarks").val().replace(/ /g, "%20")+'&dtype=CMT');
	x.send();
}
	
function dis()
{
	$('#remarks').val('');
	$('#updatdata1').attr("disabled", true);
	$('#cat').attr("disabled", true);
}

function hidebranch()
{
	$("#branchdiv").hide();
	$("#branchlabel").hide();
}

function funcleardata()
{
	$('#clientname').val('');
	$('#cldocno').val('');
}
</script>
</head>
<body onload="getBranch();getcat();dis();hidebranch();">
    <div id="mainBG" class="homeContent" data-type="background"> 
        <div class="master-container">

            <div class="sidebar-filters">
                <div class="sidebar-scroll-content">
                    
                    <div class="filter-card">
                        <table class="release-filter-table">
                            <tr>
                                <td class="label-cell">Client</td>
                                <td>
                                    <input type="text" name="clientname" id="clientname" value='<s:property value="clientname"/>' readonly="readonly" placeholder="Press F3 To Search" onkeydown="getaccountdetails(event);" >
                                </td>
                            </tr>
                        </table>

                        <div class="release-actions">
                            <button type="button" class="btn-submit" name="clear" id="clear" onclick="funcleardata()">Clear</button>
                        </div>
                    </div>

                    <div class="filter-card" style="display: none;">
                        <table class="release-filter-table">
                            <tr>
                                <td class="label-cell">Category</td>
                                <td>
                                    <select id="cat" name="cat">
                                        <option></option>
                                    </select>
                                </td>
                            </tr>
                            <tr>
                                <td class="label-cell">Reason</td>
                                <td>
                                    <input type="text" id="remarks" name="remarks" value='<s:property value="remarks"/>'>
                                </td>
                            </tr>
                        </table>
                        <div class="release-actions">
                            <button type="button" name="updatdata1" id="updatdata1" class="btn-submit" onclick="funupdatesdata()">Update</button>
                        </div>
                    </div>

                    <div id='paychaaaaa' style="display: none;"></div>
                    
                    <input type="hidden" id="cldocno" name="cldocno" value='<s:property value="cldocno"/>'>
                    
                </div>
            </div>

            <div class="main-content-area">
                
                <div class="top-toolbar-container">
                    <jsp:include page="../../heading.jsp"></jsp:include>
                </div>

                <div class="grid-content-container">
                    <div id="listdiv" class="borderStyle"><jsp:include page="listGrid.jsp"></jsp:include></div>
                </div>

            </div>

        </div> 
        
        <div id="accountSearchwindow"><div></div></div> 

    </div>
</body>
</html>