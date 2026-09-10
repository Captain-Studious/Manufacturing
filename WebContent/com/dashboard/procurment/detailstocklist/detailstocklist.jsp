    
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
    width: 260px; 
    flex: 0 0 260px; 
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
    width: 80px;
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

/* jqx Date Container Mapping Rules */
.filter-table div[id^="fromdate"],
.filter-table div[id^="todate"] {
    width: 100%;
}

/* ===== MASTER 30px BUTTON SYSTEM ===== */
.btn-submit, .myButton {
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

.btn-submit:hover, .myButton:hover {
    background: #1d4ed8 !important;
}

/* Text Labels styling */
.info-label {
    color: blue;
    font-weight: bold;
    font-size: 10px;
    display: block;
    text-align: center;
    margin-top: 5px;
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

/* Grid Layout Styling for the Quadrants */
.grid-section-title {
    font-size: 12px;
    font-family: sans-serif;
    font-weight: bold;
    text-decoration: underline;
    margin-bottom: 5px;
    display: block;
}

.dashboard-row {
    display: flex;
    gap: 15px;
    margin-bottom: 15px;
}

.dashboard-col {
    flex: 1;
    display: flex;
    flex-direction: column;
}
</style>

<script type="text/javascript">   
<%String psrnoss=request.getParameter("temppsrno")==null || request.getParameter("temppsrno")==""?"0":request.getParameter("temppsrno");
String pna=request.getParameter("pna")==null || request.getParameter("pna")==""?"0":request.getParameter("pna");
String mode=request.getParameter("mod")==null || request.getParameter("mod")==""?"0":request.getParameter("mod");

%>

$(document).ready(function () {
	 $("#fromdate").jqxDateTimeInput({ width: '125px', height: '15px',formatString:"dd.MM.yyyy"});
	 $("#todate").jqxDateTimeInput({ width: '125px', height: '15px',formatString:"dd.MM.yyyy"});
	   $("body").prepend('<div id="overlay2" class="ui-widget-overlay" style="z-index: 1; display: none;"></div>');
	     $("body").prepend("<div id='PleaseWait2' style='display: none;position:absolute; z-index: 1;top:200px;right:750px;'><img src='../../../../icons/31load.gif'/></div>");
		
	  var curfromdate= $('#fromdate').jqxDateTimeInput('getDate');
	     var oneyeardate=new Date(new Date(curfromdate).setMonth(curfromdate.getMonth()-6));
	     var oneyearbackdate=new Date(new Date(oneyeardate).setDate(oneyeardate.getDate()));
	     $('#fromdate').jqxDateTimeInput('setDate', new Date(oneyearbackdate)); 
	     
	     var psrnos='<%=psrnoss%>';
	     var pnas='<%=pna%>';
	     var mod1='<%=mode%>';
	     if(mod1=="v")
			{
	    	 document.getElementById("psrno").value=psrnos;
	    	 document.getElementById("jqxInput").value=pnas;
	    	 var aa="start";
	    	  $("#part").load("part.jsp?psrnos="+psrnos+"&load="+aa);
	    	 funreload(event);
	    	 
	    	 
	        
	             
			}
	     
	  
	     
	     $("#main").show();
	     $("#sub").hide();
});


function hidebranch()
{
	
	 

	  $("#branchdiv").hide();
	  $("#branchlabel").hide();
	  
	  
 	  document.getElementById("lbldetailname").innerText="Detail Stock Enquiry";  
		document.getElementById("lbldetail").innerText="Supply Chain";
	 
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
	  var psrno=$("#psrno").val();
	  var aa="yes";
	  var type="2";
	  $("#overlay, #PleaseWait").show();
	  $("#listdiv1").load("orderlistGrid.jsp?barchval="+barchval+"&fromdate="+fromdate+"&todate="+todate+"&psrno="+psrno+"&load="+aa);
	  $("#listdiv2").load("purchaselistGrid.jsp?barchval="+barchval+"&fromdate="+fromdate+"&todate="+todate+"&psrno="+psrno+"&load="+aa);
	  $("#listdiv3").load("saleslistGrid.jsp?barchval="+barchval+"&fromdate="+fromdate+"&todate="+todate+"&psrno="+psrno+"&load="+aa);
	  $("#listdiv4").load("savelistGrid.jsp?psrno="+psrno+"&load="+aa);
	  $("#listdiv5").load("batchlistGrid.jsp?psrno="+psrno+"&load="+aa);
	 
 
		   }
	 	 
	}
	
	function chgitem(val)
	{
		if(val=="Stock Movement")
			{
			document.getElementById("cs").value="List Details";
			
			 $("#main").hide();
		     $("#sub").show();
		    
			  var barchval = document.getElementById("cmbbranch").value;
		      var fromdate= $("#fromdate").val();
			  var todate= $("#todate").val();
			  var psrno=$("#psrno").val();
			  var aa="yes";
			  var type="2";
			 
	 
		 	  $("#overlay2, #PleaseWait2").show();
			 
			  $("#listdiv7").load("stockLedgerGridDetail.jsp?barchval="+barchval+"&fromdate="+fromdate+"&todate="+todate+"&psrno="+psrno+"&load="+aa+"&type="+type);
				    
			}
		else
			{
			
			document.getElementById("cs").value="Stock Movement";
			

			  $("#main").show();
			     $("#sub").hide();
			}
		
		 
	}
	
</script>
</head>
<body onload="getBranch();hidebranch();">
<div id="mainBG" class="homeContent" data-type="background"> 
<div class='hidden-scrollbar'>

<div class="master-container">

    <div class="sidebar-filters">
        <div class="sidebar-scroll-content">

            <div class="filter-card">
                <table class="filter-table">
                    <tr>
                        <td class="label-cell">From</td>
                        <td><div id='fromdate' name='fromdate' value='<s:property value="fromdate"/>'></div></td>
                    </tr>
                    <tr>
                        <td class="label-cell">To</td>
                        <td><div id='todate' name='todate' value='<s:property value="todate"/>'></div></td>
                    </tr> 
                    <tr>
                        <td class="label-cell">Product</td>
                        <td>
                            <div id="part"><jsp:include page="part.jsp"></jsp:include></div>
                        </td>
                    </tr>
                </table>
            </div>

            <div class="filter-card">
                <input type="button" class="btn-submit" name="cs" id="cs" value="Stock Movement" onclick="chgitem(this.value)">
            </div>

            <div class="filter-card">
                <table class="filter-table">
                    <tr>
                        <td class="label-cell">Stock</td> 
                        <td><input type="text" id="stock" name="stock" style="text-align: right;" readonly="readonly" value='<s:property value="stock"/>' /></td>
                    </tr> 
                    <tr>
                        <td class="label-cell">Reserve</td> 
                        <td><input type="text" id="rsv" name="rsv" style="text-align: right;" readonly="readonly" value='<s:property value="rsv"/>' /></td>
                    </tr> 
                    <tr>
                        <td class="label-cell">Balance</td> 
                        <td><input type="text" id="bal" name="bal" style="text-align: right;" readonly="readonly" value='<s:property value="bal"/>' /></td>
                    </tr> 
                    <tr>
                        <td class="label-cell">Selling Price</td> 
                        <td><input type="text" id="sellprice" name="sellprice" style="text-align: right;" readonly="readonly" value='<s:property value="sellprice"/>' /></td>
                    </tr> 
                    <tr>
                        <td class="label-cell">MRP</td> 
                        <td><input type="text" id="mrp" name="mrp" style="text-align: right;" readonly="readonly" value='<s:property value="mrp"/>' /></td>
                    </tr> 
                </table>

                <hr style="border: 0; border-top: 1px solid #e1e8ed; margin: 15px 0;">

                <label id="prdname" name="prdname" class="info-label"><s:property value="prdname"/></label>
                <label id="brname" name="brname" class="info-label"><s:property value="brname"/></label>
            </div>

            <div style="display:none;">
                <input type="hidden" id="psrno" name="psrno" value='<s:property value="psrno"/>' /> 
                <input type="hidden" id="statusselect" name="statusselect" value='<s:property value="statusselect"/>'>
                <input type="hidden" id="acno" name="acno" value='<s:property value="acno"/>'>
            </div>

        </div>
    </div>

    <div class="main-content-wrapper">
        
        <div class="top-toolbar-container">
            <jsp:include page="../../heading.jsp"></jsp:include>
        </div>

        <div class="scrollable-grid-area">
            
            <div id="main">
                <div class="dashboard-row">
                    <div class="dashboard-col">
                        <label class="grid-section-title">Pending Purchase Order</label>
                        <div id="listdiv1"><jsp:include page="orderlistGrid.jsp"></jsp:include></div>

                        <div style="height: 15px;"></div>

                        <label class="grid-section-title">Purchase Details</label>
                        <div id="listdiv2"><jsp:include page="purchaselistGrid.jsp"></jsp:include></div>
                    </div>
                    
                    <div class="dashboard-col">
                        <label class="grid-section-title">Sales Details</label>
                        <div id="listdiv3"><jsp:include page="saleslistGrid.jsp"></jsp:include></div>
                    </div>
                </div>

                <div class="dashboard-row">
                    <div class="dashboard-col">
                        <label class="grid-section-title">Sales Slab</label>
                        <div id="listdiv4"><jsp:include page="savelistGrid.jsp"></jsp:include></div>
                    </div>
                    
                    <div class="dashboard-col">
                        <label class="grid-section-title">Batch Wise Stock</label>
                        <div id="listdiv5"><jsp:include page="batchlistGrid.jsp"></jsp:include></div>
                    </div>
                </div>
            </div>
            
            <div id="sub">
                <div id="listdiv7"><jsp:include page="stockLedgerGridDetail.jsp"></jsp:include></div>
            </div>
            
        </div>

    </div>

</div>
 
<div id="productDetailsWindow">
	<div></div><div></div>
</div>

</div>
</div>
</body>
</html>