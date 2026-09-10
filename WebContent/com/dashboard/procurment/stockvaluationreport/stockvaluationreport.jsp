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

textarea {
    width: 100%;
    border: 1px solid #ccd6e0;
    border-radius: 4px;
    padding: 8px;
    font-family: inherit;
    font-size: 12px;
    resize: vertical;
    box-sizing: border-box;
    outline: none;
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

.btn-square {
    width: 24px !important;
    height: 24px !important;
    padding: 0 !important;
    margin: 0 0 0 4px !important;
    background: #2563eb !important;
    color: #fff !important;
    border: none !important;
    border-radius: 4px !important;
    font-size: 16px !important;
    font-weight: bold !important;
    line-height: 24px !important;
    cursor: pointer;
    display: inline-block;
    vertical-align: middle;
}
.btn-square:hover {
    background: #1d4ed8 !important;
}

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


<script type="text/javascript">

	$(document).ready(function () {
 
		 
		  $("#fromdate").jqxDateTimeInput({ width: '125px', height: '15px',formatString:"dd.MM.yyyy"});
		 //$("#todate").jqxDateTimeInput({ width: '125px', height: '15px',formatString:"dd.MM.yyyy"});
		 
		 $("body").prepend('<div id="overlay" class="ui-widget-overlay" style="z-index: 1; display: none;"></div>');
	     $("body").prepend("<div id='PleaseWait' style='display: none;position:absolute; z-index: 1;top:180px;right:550px;'><img src='../../../../icons/31load.gif'/></div>");
		 
	      $('#ptypewindow').jqxWindow({ width: '50%',height: '60%',  maxHeight: '80%'  ,maxWidth: '50%' , title: 'Product Type Search' ,position: { x: 250, y: 60 }, keyboardCloseKey: 27});
		   $('#ptypewindow').jqxWindow('close');
		   $('#brandwindow').jqxWindow({ width: '49%', height: '65%',  maxHeight: '75%' ,maxWidth: '50%' , title: 'Brand Search' ,position: { x: 250, y: 60 }, keyboardCloseKey: 27});
		   $('#brandwindow').jqxWindow('close');
		   $('#modelwindow').jqxWindow({ width: '50%',height: '60%',  maxHeight: '80%' ,maxWidth: '50%' , title: 'Model Search' ,position: { x: 250, y: 60 }, keyboardCloseKey: 27});
		   $('#modelwindow').jqxWindow('close');
		   $('#submodelwindow').jqxWindow({ width: '50%',height: '60%',  maxHeight: '80%' ,maxWidth: '50%' , title: 'Model Search' ,position: { x: 250, y: 60 }, keyboardCloseKey: 27});
		   $('#submodelwindow').jqxWindow('close');
		   $('#productwindow').jqxWindow({ width: '50%',height: '60%',  maxHeight: '80%'  ,maxWidth: '50%' , title: 'Product Search' ,position: { x: 250, y: 60 }, keyboardCloseKey: 27});
		   $('#productwindow').jqxWindow('close');
		   $('#pcategorywindow').jqxWindow({ width: '50%', height: '60%',  maxHeight: '80%' ,maxWidth: '50%' , title: 'Category Search' ,position: { x: 250, y: 60 }, keyboardCloseKey: 27});
		   $('#pcategorywindow').jqxWindow('close');
		   $('#pdeptwindow').jqxWindow({ width: '50%', height: '60%',  maxHeight: '80%' ,maxWidth: '50%' , title: 'Department Search' ,position: { x: 250, y: 60 }, keyboardCloseKey: 27});
		   $('#pdeptwindow').jqxWindow('close');
		   $('#psubcategorywindow').jqxWindow({ width: '50%', height: '60%',  maxHeight: '80%' ,maxWidth: '50%' , title: 'Sub Category Search' ,position: { x: 250, y: 60 }, keyboardCloseKey: 27});
		   $('#psubcategorywindow').jqxWindow('close');
		
		   $('#locationwindow').jqxWindow({ width: '50%',height: '60%',  maxHeight: '80%' ,maxWidth: '50%' , title: 'Location Search' ,position: { x: 250, y: 60 }, keyboardCloseKey: 27});
		   $('#locationwindow').jqxWindow('close');
	     
	     
		   
	});

	function funExportBtn(){
	 
		  JSONToCSVCon(partdata, 'Stock Valuation Report', true);
		 
		 
		 }
	
	
	function funreload(event){


		var prodvalue=$('#prodsearchby').val().trim();
		var type;
		var branchid;
		var hidbrand;
		var hidtype;
		var hidproduct;
		var hidcat;
		var hidsubcat;
		var frmdate;
		var todate;
		var hidsubcat;
		
		 	 branchid=document.getElementById("cmbbranch").value;
		 	 hidbrand=document.getElementById("hidbrandid").value;
			 hidtype=document.getElementById("hidtypeid").value;
			 hidproduct=document.getElementById("hidproductid").value;
			 hidcat=document.getElementById("hidcatid").value;
			 hidsubcat=document.getElementById("hidsubcatid").value;
			 hidept=document.getElementById("hideptid").value;
			 frmdate=$('#fromdate').jqxDateTimeInput('val');
			 //document.getElementById("fromdate").value;
			 todate=$('#todate').jqxDateTimeInput('val');
			 
				var prodgroupby=$('#prodgroupby').val().trim(); 
			 
			 
				var hidlocid=document.getElementById("hidlocid").value;
				  $("#overlay, #PleaseWait").show();
	 
				 var load="yes";
		 $("#stockLedgerDiv").load("stockgrid.jsp?todate="+todate+"&frmdate="+frmdate+"&hidbrand="+hidbrand+"&hidtype="+hidtype+"&hidcat="+hidcat+"&hidsubcat="+hidsubcat+"&hidproduct="+hidproduct+"&branchid="+branchid+"&hidept="+hidept+"&load="+load+"&prodgroupby="+prodgroupby+"&hidlocid="+hidlocid+"&type=1");
			 
 
			 
			 
		}
	
	
	function getPtype(){
		 
	 	  $('#ptypewindow').jqxWindow('open');
			$('#ptypewindow').jqxWindow('focus');
			typeSearchContent('typeSearch.jsp', $('#ptypewindow'));

	}


	function getPbrand(t){
		 
		  $('#brandwindow').jqxWindow('open');
			$('#brandwindow').jqxWindow('focus');
			brandSearchContent('brandSearch.jsp?id='+t, $('#brandwindow'));

	}


	function getPcategory(){

		  $('#pcategorywindow').jqxWindow('open');
			$('#pcategorywindow').jqxWindow('focus');
			 categorySearchContent('catSearch.jsp', $('#pcategorywindow'));
	}

	function getDept(){

		  $('#pdeptwindow').jqxWindow('open');
			$('#pdeptwindow').jqxWindow('focus');
			 deptSearchContent('deptSearch.jsp', $('#pdeptwindow'));
	}


	function getPsubcategory(){
		var catid=$('#hidcatid').val().trim();
		 $('#psubcategorywindow').jqxWindow('open');
			$('#psubcategorywindow').jqxWindow('focus');
			 subcategorySearchContent('subcatSearch.jsp?catid='+catid, $('#psubcategorywindow'));

	}
	function getLocation(){
		var cmbbranch=$('#cmbbranch').val().trim();
		 $('#locationwindow').jqxWindow('open');
			$('#locationwindow').jqxWindow('focus');
			 
			locationSearchContent('locationsearch.jsp?brhid='+cmbbranch, $('#locationwindow'));

	}



	function getProduct(){
		
		var brandid=$('#hidbrandid').val().trim();
		var catid=$('#hidcatid').val().trim();
		var subcatid=$('#hidsubcatid').val().trim();
		
		 $('#productwindow').jqxWindow('open');
			$('#productwindow').jqxWindow('focus');
			 productSearchContent('productSearch.jsp?brandid='+brandid+'&catid='+catid+'&subcatid='+subcatid, $('#productwindow'));

	}


	/*


	
	
	 */
	 function typeSearchContent(url) {
		  //alert(url);
		    $.get(url).done(function (data) {
		//alert(data);
		  $('#ptypewindow').jqxWindow('setContent', data);

		}); 
		}
		function brandSearchContent(url) {
		  //alert(url);
		    $.get(url).done(function (data) {
		//alert(data);
		  $('#brandwindow').jqxWindow('setContent', data);

		}); 
		}

		function modelSearchContent(url) {
		  //alert(url);
		    $.get(url).done(function (data) {
		//alert(data);
		  $('#modelwindow').jqxWindow('setContent', data);

		}); 
		}

	 
		function subModelSearchContent(url) {
		  //alert(url);
		    $.get(url).done(function (data) {
		//alert(data);
		  $('#submodelwindow').jqxWindow('setContent', data);

		}); 
		}

	function categorySearchContent(url) {
	  //alert(url);
	    $.get(url).done(function (data) {
	//alert(data);
	  $('#pcategorywindow').jqxWindow('setContent', data);

	}); 
	}

	function deptSearchContent(url) {
		  //alert(url);
		    $.get(url).done(function (data) {
		//alert(data);
		  $('#pdeptwindow').jqxWindow('setContent', data);

		}); 
		  
	}
		

		function locationSearchContent(url) {
		  
		    $.get(url).done(function (data) {
		//alert(data);
		  $('#locationwindow').jqxWindow('setContent', data);

		}); 
		}	 

		function subcategorySearchContent(url) {
		  //alert(url);
		    $.get(url).done(function (data) {
		//alert(data);
		  $('#psubcategorywindow').jqxWindow('setContent', data);

		}); 
		}

		function productSearchContent(url) {
		  //alert(url);
		    $.get(url).done(function (data) {
		//alert(data);
		  $('#productwindow').jqxWindow('setContent', data);

		}); 
		}

	function setprodSearch(){
		var value=$('#prodsearchby').val().trim();

		if(value=="ptype"){
			getPtype();
		}
		else if(value=="pbrand"){
			getPbrand(2);
		}
		else if(value=="pdept"){
			getDept();
		}
		else if(value=="product"){
			getProduct();
		}
		else if(value=="pcategory"){
			getPcategory();
		}
		else if(value=="psubcategory"){
			getPsubcategory();
		}
		else if(value=="ploca"){
			getLocation();
		}
		
		else{
			
		}
	}
	
	function fundisable(){
		

		
		if (document.getElementById('rsumm').checked) {
			
			  $('#stockLedgerDiv').show();
			   $('#stockLedgerDetDiv').hide();
			  
			}
		 else if (document.getElementById('rdet').checked) {
			 
			  $('#stockLedgerDiv').hide();
			  $('#stockLedgerDetDiv').show();
			 
			}
		 }
	
	function funClearData(){
		document.getElementById("cmbbranch").value="a";
		 
		 document.getElementById("hidbrandid").value="";
		 document.getElementById("hidtypeid").value="";
		 document.getElementById("hidproductid").value="";
		 document.getElementById("hidcatid").value="";
		 document.getElementById("hidsubcatid").value=""; 
		 document.getElementById("hidbrand").value="";
		 document.getElementById("hidtype").value="";
		 document.getElementById("hidproduct").value="";
		 document.getElementById("hidcat").value="";
		 document.getElementById("hidsubcat").value="";
		 document.getElementById("prodsearchby").value="";
		 document.getElementById("searchdetails").value="";
		 document.getElementById("hideptid").value="";
		 document.getElementById("hidept").value="";
		 
		 document.getElementById("hidloc").value="";
		 document.getElementById("hidlocid").value="";
		 
		 document.getElementById("prodgroupby").value="gproduct";
		 
	   
		
	}
	function setRemove(){
		
		var suitvalue="";
		var prodvalue=$('#prodsearchby').val().trim();
		
		if(prodvalue=="ptype"){
			 
			 document.getElementById("hidtypeid").value="";
			 document.getElementById("hidtype").value="";
			 
		}
		else if(prodvalue=="pbrand"){
			document.getElementById("hidbrandid").value="";
			document.getElementById("hidproduct").value="";
			
		}
		else if(prodvalue=="product"){
			document.getElementById("hidproductid").value="";
			document.getElementById("hidbrand").value="";
		}
		else if(prodvalue=="pcategory"){
			 document.getElementById("hidcatid").value="";
			 document.getElementById("hidcat").value="";
			 
		}
		else if(prodvalue=="psubcategory"){
			document.getElementById("hidsubcatid").value="";
			document.getElementById("hidsubcat").value="";
		}
		else if(prodvalue=="pdept"){
			document.getElementById("hideptid").value="";
			document.getElementById("hidept").value="";
		}
		else if(prodvalue=="hidloc"){
			document.getElementById("hidlocid").value="";
			document.getElementById("hidloc").value="";
		}
 
		document.getElementById("searchdetails").value="";
		
 
		if(document.getElementById("hidbrand").value!=""){
			document.getElementById("searchdetails").value+="\n"+document.getElementById("hidbrand").value;	
		}
		if(document.getElementById("hidtype").value!=""){
			document.getElementById("searchdetails").value+="\n"+document.getElementById("hidtype").value;	
		}
		if(document.getElementById("hidcat").value!=""){
			document.getElementById("searchdetails").value+="\n"+document.getElementById("hidcat").value;	
		}
		if(document.getElementById("hidsubcat").value!=""){
			document.getElementById("searchdetails").value+="\n"+document.getElementById("hidsubcat").value;	
		}
		if(document.getElementById("hidproduct").value!=""){
			document.getElementById("searchdetails").value+="\n"+document.getElementById("hidproduct").value;	
		}
		if(document.getElementById("hidept").value!=""){
			document.getElementById("searchdetails").value+="\n"+document.getElementById("hidept").value;	
		}
		if(document.getElementById("hidloc").value!=""){
			document.getElementById("searchdetails").value+="\n"+document.getElementById("hidloc").value;	
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
                        <td class="label-cell" style="width: 50px;">Up To</td>
                        <td><div id="fromdate" name="fromdate" value='<s:property value="fromdate"/>'></div></td>
                    </tr>
                    <tr>
                        <td class="label-cell" style="width: 50px;">Group</td>
                        <td>
                            <select name="prodgroupby" id="prodgroupby">
                                <option value="gproduct">PRODUCT</option>
                                <!-- <option value="gbranch">BRANCH</option>
                                <option value="gloca">LOCATION</option> -->
                                <option value="gptype">TYPE</option>
                                <option value="gpbrand">BRAND</option>
                                <option value="gpdept">DEPARTMENT</option>
                                <option value="gpcategory">CATEGORY</option>
                                <option value="gpsubcategory">SUB CATEGORY</option>
                            </select>
                        </td>
                    </tr>
                </table>
            </div>

            <div class="filter-card">
                <label class="branch" style="display:block; margin-bottom: 5px;">Product</label>
                <div style="display: flex; align-items: center; justify-content: space-between;">
                    <select name="prodsearchby" id="prodsearchby" style="flex: 1;">
                        <option value="">--Select--</option>
                        <!-- <option value="ploca">LOCATION</option> -->
                        <option value="ptype">TYPE</option>
                        <option value="pbrand">BRAND</option>
                        <option value="pdept">DEPARTMENT</option>
                        <option value="pcategory">CATEGORY</option>
                        <option value="psubcategory">SUB CATEGORY</option>
                        <option value="product">PRODUCT</option>
                    </select>
                    <button type="button" name="btnadditem" id="additem" class="btn-square" onClick="setprodSearch();">+</button>
                    <button type="button" name="btnremoveitem" id="btnremoveitem" class="btn-square" onclick="setRemove();">-</button>
                </div>

                <textarea id="searchdetails" name="searchdetails" rows="12" readonly style="margin-top: 10px;"></textarea>
            </div>

            <div class="filter-card">
                <input type="button" name="btnclear" id="btnclear" value="Clear" class="btn-submit" onclick="funClearData();" style="background:#64748b !important;">
            </div>

            <div style="display:none;">
                <div id="todate" name="todate" value='<s:property value="todate"/>'></div>

                <input type="hidden" name="hidbrandid" id="hidbrandid">
                <input type="hidden" name="hidtypeid" id="hidtypeid">
                <input type="hidden" name="hideptid" id="hideptid">
                <input type="hidden" name="hidcatid" id="hidcatid">
                <input type="hidden" name="hidsubcatid" id="hidsubcatid">
                <input type="hidden" name="hidproductid" id="hidproductid">
                <input type="hidden" name="hidlocid" id="hidlocid">

                <input type="hidden" name="hidbrand" id="hidbrand">
                <input type="hidden" name="hidept" id="hidept">
                <input type="hidden" name="hidtype" id="hidtype">
                <input type="hidden" name="hidcat" id="hidcat">
                <input type="hidden" name="hidsubcat" id="hidsubcat">
                <input type="hidden" name="hidproduct" id="hidproduct">
                <input type="hidden" name="hidloc" id="hidloc">
            </div>

        </div>
    </div>

    <div class="main-content-wrapper">

        <div class="top-toolbar-container">
            <jsp:include page="../../heading.jsp"></jsp:include>
        </div>

        <div class="scrollable-grid-area">
            <div id="stockLedgerDiv">
                <jsp:include page="stockgrid.jsp"></jsp:include>
            </div>
        </div>

    </div>

</div>

<div id="ptypewindow"><div></div></div>
<div id="brandwindow"><div></div></div>
<div id="modelwindow"><div></div></div>
<div id="submodelwindow"><div></div></div>
<div id="productwindow"><div></div></div>
<div id="pcategorywindow"><div></div></div>
<div id="pdeptwindow"><div></div></div>
<div id="psubcategorywindow"><div></div></div>
<div id="locationwindow"><div></div></div>

</div>
</div>
</body>
</html>
