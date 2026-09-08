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
    width: 60px;
}

/* ===== UNIFORM 24px INPUTS & SELECTS ===== */
input[type="text"], select,
.release-filter-table input[type="text"],
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
.release-filter-table input[readonly],
.release-filter-table input:disabled {
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
    padding: 15px;
    overflow: auto; 
    box-sizing: border-box;
}
</style>

<script type="text/javascript">

$(document).ready(function () {
	
	  $("body").prepend('<div id="overlay" class="ui-widget-overlay" style="z-index: 1; display: none;"></div>');
	  $("body").prepend("<div id='PleaseWait' style='display: none;position:absolute; z-index: 1;top:180px;right:550px;'><img src='../../../../icons/31load.gif'/></div>");
 
	 $("#fromdate").jqxDateTimeInput({ width: '100%', height: '24px',formatString:"dd.MM.yyyy"});
	 $("#todate").jqxDateTimeInput({ width: '100%', height: '24px',formatString:"dd.MM.yyyy"});
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
	 
});

function funExportBtn(){
	   $("#orderlist").jqxGrid('exportdata', 'xls', 'Puchase Order List');
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
    	 
    	 $("#overlay, #PleaseWait").show();
    	 $("#sidelistdiv").load("listGrid.jsp?barchval="+barchval+"&fromdate="+fromdate+"&todate="+todate+"&statusselect="+statusselect);
	  }
}
	
function funupdate()
{
		var pruoduct="saveprmaster"; 
		
		$.messager.confirm('Message', 'Do you want to save changes?', function(r){
		   	if(r==false)
		   	  {
		   		pruoduct=""; 
		   		funupdate1(pruoduct);
		   	  }
		   	if(r==true)
		   		{
		   		funupdate1(pruoduct);
		   		}
		}); 
}

function funupdate1(pruoduct)
{
	var rows1 = $("#jqxpmgt").jqxGrid('getrows');
	var ck="0";
	for(var i=0 ; i < rows1.length-1 ; i++){
		 if(pruoduct=="saveprmaster")
		  {
			  if((rows1[i].newprice1>0) ||  (rows1[i].newprice2>0) ||  (rows1[i].newprice3>0) || (rows1[i].discount1>0)  || (rows1[i].discount2>0) || (rows1[i].discount3>0))
			   {
				  ck="do";
			   }
		  }
	}
	
	if(pruoduct=="saveprmaster")
	{
    	if(ck=="0")
    	{
    	    $.messager.alert('Message', 'Do you want to update the product rate?');
    		return 0;
    	}
	}
 
 	var listss = new Array();
 	var rows = $("#jqxpmgt").jqxGrid('getrows');
    for(var i=0 ; i < rows.length-1 ; i++){
	   if((rows[i].price1>0) ||  (rows[i].newprice1>0) || (rows[i].price2>0) || (rows[i].newprice2>0) || (rows[i].price3>0) || (rows[i].newprice3>0) || (rows[i].discount1>0)  || (rows[i].discount2>0) || (rows[i].discount3>0))
	   { 
		   listss.push(rows[i].catid+"::"+rows[i].price1+"::"+rows[i].price2+"::"+rows[i].price3+"::"+rows[i].newprice1+"::"+rows[i].newprice2+"::"+rows[i].newprice3+"::"+rows[i].discount1
				   +"::"+rows[i].discount2+"::"+rows[i].discount3+"::"+"test");  
	   }
    }
    ajaxcall(listss,pruoduct);
}
 
function ajaxcall(listss,pruoduct){
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
            }
            else
            {
                $.messager.alert('Message', '  Not Updated ', function(r){
                });
            }  
        }
    }
	x.open("GET","pricesavedata.jsp?list="+listss+'&psrno='+document.getElementById("psrno").value+'&pruoduct='+pruoduct);
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

                        <div id="sidelistdiv" style="margin-top: 15px; margin-bottom: 15px;">
                            <jsp:include page="listGrid.jsp"></jsp:include>
                        </div>
                        
                        <input type="hidden" id="psrno" name="psrno" >

                        <div class="release-actions">
                            <button type="button" class="btn-submit" name="updatdata" id="updatdata" onclick="funupdate()">Update</button>
                        </div>
                    </div>
                </div>
            </div>

            <div class="main-content-area">
                
                <div class="top-toolbar-container">
                    <jsp:include page="../../heading.jsp"></jsp:include>
                </div>

                <div class="grid-content-container">
                    <div id="mainlistdiv" style="margin-bottom: 20px;"><jsp:include page="mainlistGrid.jsp"></jsp:include></div>
                    <div id="pricelistdiv"><jsp:include page="pricelistgrid.jsp"></jsp:include></div>
                </div>

            </div>

        </div> 
    </div>
</body>
</html>