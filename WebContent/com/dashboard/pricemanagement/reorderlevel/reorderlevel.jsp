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

/* Cards */
.filter-card {
    background: #f8fafc;
    border: 1px solid #e3e8ee;
    border-radius: 12px;
    padding: 15px;
    margin-bottom: 12px;
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
input[type="text"], input[type="number"], select,
.release-filter-table input[type="text"],
.release-filter-table input[type="number"],
.release-filter-table select {
    width: 100%;
    height: 24px;              
    padding: 2px 8px;          
    border: 1px solid #ccd6e0;
    border-radius: 4px;        
    font-size: 12px;          
    background-color: #ffffff;
    box-sizing: border-box;
    color: #333;
}

/* Readonly / disabled look */
input[readonly],
input:disabled,
select:disabled,
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

.radio-group {
    display: flex;
    flex-wrap: wrap;
    gap: 10px;
    align-items: center;
    justify-content: center;
    font-size: 12px;
    color: #333;
    padding: 2px 0;
}

.radio-group label {
    display: flex;
    align-items: center;
    cursor: pointer;
}
.radio-group input[type="radio"] {
    margin-right: 4px;
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

/* Action buttons layout */
.release-actions {
    display: flex;
    flex-direction: column;
    gap: 10px;
    justify-content: center;
    margin-top: 15px;
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
</style>

<script type="text/javascript">

$(document).ready(function () {

    $("body").prepend('<div id="overlay" class="ui-widget-overlay" style="z-index: 1; display: none;"></div>');
    $("body").prepend("<div id='PleaseWait' style='display: none;position:absolute; z-index: 1;top:180px;right:550px;'><img src='../../../../icons/31load.gif'/></div>");

    $("#fromdate").jqxDateTimeInput({ width: '100%', height: '24px',formatString:"dd.MM.yyyy"});
    $("#todate").jqxDateTimeInput({ width: '100%', height: '24px',formatString:"dd.MM.yyyy"});	
    
    $('#eventOfferDiv').show();
    $('#stockClearanceDiv').hide();
    document.getElementById('radoffer').checked=true;
    
    var fromdates=new Date($('#fromdate').jqxDateTimeInput('getDate'));
    var onemounth=new Date(new Date(fromdates).setMonth(fromdates.getMonth()-1)); 
    $('#fromdate').jqxDateTimeInput('setDate', new Date(onemounth));

    $('#fromdate').on('change', function (event) 
    {
        var fromdates=new Date($('#fromdate').jqxDateTimeInput('getDate'));
        // out date
        var todates=new Date($('#todate').jqxDateTimeInput('getDate')); //del date
        if(fromdates>todates)
        {
            $.messager.alert('Message','To Date Less Than From Date  ','warning'); 			   
            return false;
        }   
    });
 
    $('#todate').on('change', function (event)
    {
        var fromdates=new Date($('#fromdate').jqxDateTimeInput('getDate'));
        // out date
        var todates=new Date($('#todate').jqxDateTimeInput('getDate')); //del date
        if(fromdates>todates)
        {
            $.messager.alert('Message',' To Date Less Than  From Date  ','warning'); 			   
            return false;
        }  			 	 
    });

    $("#updatdata").attr("disabled",true);
    $('#catsearchwindow').jqxWindow({
                                width : '25%',
                                height : '58%',
                                maxHeight : '70%',
                                maxWidth : '45%',
                                title : 'Category Search',
                                position : {
                                            x : 420,
                                            y : 87
                                            },
                                theme : 'energyblue',
                                showCloseButton : true,
                                keyboardCloseKey : 27
                                });

    $('#catsearchwindow').jqxWindow('close');
    
    $('#subcatsearchwindow').jqxWindow({
                                width : '25%',
                                height : '58%',
                                maxHeight : '70%',
                                maxWidth : '45%',
                                title : 'Sub Category Search',
                                position : {
                                            x : 420,
                                            y : 87
                                            },
                                theme : 'energyblue',
                                showCloseButton : true,
                                keyboardCloseKey : 27
                                    });
    
    $('#subcatsearchwindow').jqxWindow('close');

    $('#brandsearchwindow').jqxWindow({
                                width : '25%',
                                height : '58%',
                                maxHeight : '70%',
                                maxWidth : '70%',
                                title : 'Brand Search',
                                position : {
                                            x : 420,
                                            y : 87
                                            },
                                theme : 'energyblue',
                                showCloseButton : true,
                                keyboardCloseKey : 27
                                });
    $('#brandsearchwindow').jqxWindow('close');
    
    $('#productwindow').jqxWindow({ width: '50%',
                                    height: '62%',
                                    maxHeight: '80%',
                                    maxWidth: '50%' , 
                                    title: 'Product Search' ,
                                    position: { x: 250, y: 60 },
                                    keyboardCloseKey: 27});
    $('#productwindow').jqxWindow('close');   

    $('#name').dblclick(function()
    {
            if($('#type').val()=="BR")
            {
                brandFormSearchContent('brandFormSearchGrid.jsp');  
            } 
            else if($('#type').val()=="CA")
            {
                catFormSearchContent('catFormSearchGrid.jsp'); 
            }
            else if($('#type').val()=="SC")
            {
                subCatFormSearchContent('subCatFormSearchGrid.jsp');
            }
            else if($('#type').val()=="PR")
            {
                productSearchContent('productSearch.jsp');
            }				
    }); 
});

function funExportBtn()
{
    if (document.getElementById('radoffer').checked) 
    {      
        JSONToCSVCon(offerListExcel, 'Offer List', true);
    }
    else if (document.getElementById('radstock').checked) 
    {
        JSONToCSVCon(datasstockclearExcel, 'Stock Clearance', true);
    }
}

function brandFormSearchContent(url) 
{
    $('#brandsearchwindow').jqxWindow('open');
    $.get(url).done(function(data) 
    {
        $('#brandsearchwindow').jqxWindow('setContent', data);
        $('#brandsearchwindow').jqxWindow('bringToFront');
    });
}
function subCatFormSearchContent(url) 
{
    $('#subcatsearchwindow').jqxWindow('open');
    $.get(url).done(function(data) 
    {
            $('#subcatsearchwindow').jqxWindow('setContent', data);
            $('#subcatsearchwindow').jqxWindow('bringToFront');
    });
}
function catFormSearchContent(url) 
{
    $('#catsearchwindow').jqxWindow('open');
    $.get(url).done(function(data)
    {
            $('#catsearchwindow').jqxWindow('setContent', data);
            $('#catsearchwindow').jqxWindow('bringToFront');
    });
}

function productSearchContent(url) 
{
    $('#productwindow').jqxWindow('open');
    $.get(url).done(function (data) 
    {
            $('#productwindow').jqxWindow('setContent', data);
    }); 
}

function getname(event)
{
    if(event.keyCode==114){
        if($('#type').val()=="BR")
        {
                brandFormSearchContent('brandFormSearchGrid.jsp');  
        } 
        else if($('#type').val()=="CA")
        {
                catFormSearchContent('catFormSearchGrid.jsp'); 
        }
        else if($('#type').val()=="SC")
        {
                subCatFormSearchContent('subCatFormSearchGrid.jsp');
        }
        else if($('#type').val()=="PR")
        {
                productSearchContent('productSearch.jsp');
        }
    }
}

function funreload(event)
{
    var fromdates=new Date($('#fromdate').jqxDateTimeInput('getDate'));	 
    // out date
    var todates=new Date($('#todate').jqxDateTimeInput('getDate')); //del date 	 
    if(fromdates>todates)
    {		   
            $.messager.alert('Message','To Date Less Than From Date  ','warning');		 
            return false;
    } 
    else
    {
        var barchval = document.getElementById("cmbbranch").value;     
        var statusselect=$("#statusselect").val();	 
        var psrno=$("#psrno").val(); 
        var type=$('#type').val();
        var brandid=$("#brandid").val();
        var catid=$("#catid").val();
        var subcatid=$("#subcatid").val(); 	 
        var fromdates=$("#fromdate").val();		 				 
        var todates=$("#todate").val();

        if (document.getElementById('radoffer').checked)
        {	   
                $("#overlay, #PleaseWait ").show();
                $("#eventOfferDiv").load("eventOffergrid.jsp?barchval="+barchval+"&statusselect="+statusselect+"&psrno="+psrno+"&type="+type+"&fromdates="+fromdates+"&todates="+todates+"&brandid="+brandid+"&catid="+catid+"&subcatid="+subcatid);
        }
        else if (document.getElementById('radstock').checked) 
        {
                $("#overlay, #PleaseWait").show();
                $("#stockClearanceDiv").load("stockGridDetail.jsp?barchval="+barchval+"&statusselect="+statusselect+"&psrno="+psrno+"&type="+type+"&fromdates="+fromdates+"&todates="+todates+"&brandid="+brandid+"&catid="+catid+"&subcatid="+subcatid);
        } 
    }
}

function  funcleardata()
{
    document.getElementById('psrno').value="";
    document.getElementById('radoffer').checked=true; 
    document.getElementById("cmbbranch").value="a";
}

function fundisable()
{	
    if (document.getElementById('radoffer').checked) 
    {		
            $('#eventOfferDiv').show();
            $('#stockClearanceDiv').hide();		  
    }
    else if (document.getElementById('radstock').checked) 
    {
            $('#eventOfferDiv').hide();
            $('#stockClearanceDiv').show();
    }
}

function clearnames()
{
    document.getElementById("name").value="";
    document.getElementById("psrno").value="";
    document.getElementById("brandid").value="";
    document.getElementById("catid").value="";
    document.getElementById("subcatid").value=""; 
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
                                <td colspan="2">
                                    <div class="radio-group">
                                        <label><input type="radio" id="radoffer" name="revent" onchange="fundisable();" value="radoffer">Event Offer</label>
                                        <label><input type="radio" id="radstock" name="revent" onchange="fundisable();" value="radstock">Stock Clearance</label>
                                    </div>
                                </td>
                            </tr>
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
                                    <select id="type" name="type" onchange="clearnames()">
                                        <option value="">--Select--</option>
                                        <option value="BR">Brand</option>
                                        <option value="PR">Product</option>
                                    </select>
                                </td>
                            </tr>
                            <tr>
                                <td class="label-cell"></td>
                                <td>
                                    <input type="text" id="name" name="name" placeholder="Press F3 for Search" readonly="readonly" onkeydown="getname(event);" value='<s:property value="name"/>'>
                                </td>
                            </tr>
                        </table>

                        <input type="hidden" id="statusselect" name="statusselect" value='<s:property value="statusselect"/>'>
                        <input type="hidden" id="acno" name="acno" value='<s:property value="acno"/>'>
                        <input type="hidden" id="brandid" name="brandid" >  
                        <input type="hidden" id="catid" name="catid" >
                        <input type="hidden" id="subcatid" name="subcatid" > 
                        <input type="hidden" id="psrno" name="psrno" > 
                        
                        <div id='paychaaaaa' style="display: none;"></div>
                    </div>
                </div>
            </div>

            <div class="main-content-area">
                
                <div class="top-toolbar-container">
                    <jsp:include page="../../heading.jsp"></jsp:include>
                </div>

                <div class="grid-content-container">
                    <div id="eventOfferDiv"><jsp:include page="eventOffergrid.jsp"></jsp:include></div>
                    <div id="stockClearanceDiv"><jsp:include page="stockGridDetail.jsp"></jsp:include></div> 
                </div>

            </div>

        </div>

        <div id="brandsearchwindow">
            <div></div>
            <div></div>
        </div>		
        <div id="catsearchwindow">
            <div></div>
            <div></div>
        </div>		
        <div id="subcatsearchwindow">
            <div></div>
            <div></div>
        </div>	
        <div id="productwindow">
            <div></div>
        </div>

    </div>
</body>
</html>