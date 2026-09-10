   
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
    width: 300px; 
    flex: 0 0 300px; 
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
    width: 70px;
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

/* Textarea standardization */
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

/* Checkboxes & Radios */
.radio-group {
    display: flex;
    justify-content: center;
    align-items: center;
    gap: 10px;
    font-size: 12px;
    font-weight: 600;
    color: #4e5e71;
}

.radio-group label {
    display: flex;
    align-items: center;
    cursor: pointer;
}

.radio-group input[type="radio"],
.radio-group input[type="checkbox"] {
    margin: 0 5px 0 0;
    vertical-align: middle;
}

/* Square Icon Buttons for + / - Search Triggers */
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

/* Button Group Styling */
.button-group-row {
    display: flex;
    gap: 8px;
    margin-bottom: 8px;
}

.button-group-row .btn-submit {
    flex: 1;
    margin-bottom: 0;
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
	$('#stockLedgerDiv').show();
	 $('#stockLedgerDetDiv').hide();
	 document.getElementById('rsumm').checked=true;
	  $("body").prepend('<div id="overlay" class="ui-widget-overlay" style="z-index: 1; display: none;"></div>');
	     $("body").prepend("<div id='PleaseWait' style='display: none;position:absolute; z-index: 1;top:180px;right:550px;'><img src='../../../../icons/31load.gif'/></div>");


 
	/*  $("#fromdate").jqxDateTimeInput({ width: '125px', height: '15px',formatString:"dd.MM.yyyy"});
	 $("#todate").jqxDateTimeInput({ width: '125px', height: '15px',formatString:"dd.MM.yyyy"});
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
	 
	  */
	     
		 $('#productDetailsWindow').jqxWindow({width: '51%', height: '59%',  maxHeight: '70%' ,maxWidth: '51%' , title: 'Products Search',position: { x: 300, y: 87 } , theme: 'energyblue', showCloseButton: true, keyboardCloseKey: 27});
		 $('#productDetailsWindow').jqxWindow('close');
		 
		 $('#locationDetailsWindow').jqxWindow({width: '51%', height: '59%',  maxHeight: '70%' ,maxWidth: '51%' , title: 'Products Search',position: { x: 300, y: 87 } , theme: 'energyblue', showCloseButton: true, keyboardCloseKey: 27});
		 $('#locationDetailsWindow').jqxWindow('close');
		
		 $('#ptypewindow').jqxWindow({ width: '50%',height: '60%',  maxHeight: '80%'  ,maxWidth: '50%' , title: 'Product Type Search' ,position: { x: 250, y: 60 }, keyboardCloseKey: 27});
		 $('#ptypewindow').jqxWindow('close');
		 
		 $('#brandwindow').jqxWindow({ width: '49%', height: '65%',  maxHeight: '75%' ,maxWidth: '50%' , title: 'Brand Search' ,position: { x: 250, y: 60 }, keyboardCloseKey: 27});
		   $('#brandwindow').jqxWindow('close');
		   
		   $('#departmentwindow').jqxWindow({ width: '49%', height: '65%',  maxHeight: '75%' ,maxWidth: '50%' , title: 'Department Search' ,position: { x: 250, y: 60 }, keyboardCloseKey: 27});
		   $('#departmentwindow').jqxWindow('close');
		   
		   $('#productwindow').jqxWindow({ width: '50%',height: '60%',  maxHeight: '80%'  ,maxWidth: '50%' , title: 'Product Search' ,position: { x: 250, y: 60 }, keyboardCloseKey: 27});
		   $('#productwindow').jqxWindow('close');
		   
		   $('#pcategorywindow').jqxWindow({ width: '50%', height: '60%',  maxHeight: '80%' ,maxWidth: '50%' , title: 'Category Search' ,position: { x: 250, y: 60 }, keyboardCloseKey: 27});
		   $('#pcategorywindow').jqxWindow('close');
		   
		   $('#psubcategorywindow').jqxWindow({ width: '50%', height: '60%',  maxHeight: '80%' ,maxWidth: '50%' , title: 'Sub Category Search' ,position: { x: 250, y: 60 }, keyboardCloseKey: 27});
		   $('#psubcategorywindow').jqxWindow('close');
		   
		   $('#pvendorwindow').jqxWindow({ width: '50%', height: '60%',  maxHeight: '80%' ,maxWidth: '50%' , title: 'Vendor Search' ,position: { x: 250, y: 60 }, keyboardCloseKey: 27});
		   $('#pvendorwindow').jqxWindow('close');
		 $('#txtpartno').dblclick(function(){
			 productSearchContent('productSearch.jsp', $('#productDetailsWindow'));
		 }); 
		 $('#txtlocation').dblclick(function(){
			 locationSearchContent('locationSearch.jsp', $('#locationDetailsWindow'));
		 });
		 $('#vendor').dblclick(function(){
			 vendorSearchContent('vendorsearch.jsp', $('#pvendorwindow'));
		 });
});

function funExportBtn(){
	if (document.getElementById('rsumm').checked) {
	 //  $("#stocklistgrid").jqxGrid('exportdata', 'xls', 'Strock List');
	 
		JSONToCSVCon(datass, 'Strock List', true);
	   
	   
	}
	 else if (document.getElementById('rdet').checked) {
		 
			//$("#stocklistgriddet").jqxGrid('exportdata', 'xls', 'Strock List');
			
			JSONToCSVCon(dat, 'Strock List', true);
			
			
		}
	 }

function productSearchContent(url) {
    $('#productDetailsWindow').jqxWindow('open');
	$.get(url).done(function (data) {
	$('#productDetailsWindow').jqxWindow('setContent', data);
	$('#productDetailsWindow').jqxWindow('bringToFront');
}); 
}

function getProduct(){
	
	 $('#productDetailsWindow').jqxWindow('open');
		$('#productDetailsWindow').jqxWindow('focus');
		 productSearchContent('productSearch.jsp', $('#productDetailsWindow'));

}

function locationSearchContent(url) {
    $('#locationDetailsWindow').jqxWindow('open');
	$.get(url).done(function (data) {
	$('#locationDetailsWindow').jqxWindow('setContent', data);
	$('#locationDetailsWindow').jqxWindow('bringToFront');
}); 
}

function getLocation(){
	 $('#locationDetailsWindow').jqxWindow('open');
		$('#locationDetailsWindow').jqxWindow('focus');
		locationSearchContent('locationSearch.jsp', $('#locationDetailsWindow'));

}
function funreload(event)
{

	 branchid=document.getElementById("cmbbranch").value;
 	 hidbrand=document.getElementById("hidbrandid").value;
	 hidtype=document.getElementById("hidtypeid").value;
	 hidproduct=document.getElementById("hidproductid").value;
	 hidcat=document.getElementById("hidcatid").value;
	 hidsubcat=document.getElementById("hidsubcatid").value;
	 hidept=document.getElementById("hideptid").value;
	 hidcldocno=document.getElementById("hidvendorcldocno").value;
	 hidacno=document.getElementById("hidvendoracno").value;


	 var barchval = document.getElementById("cmbbranch").value;
     
	 var statusselect=$("#statusselect").val();
	 
	 var psrno=$("#psrno").val();
	 var locid=$("#locid").val();
	 
 
   
		if (document.getElementById('rsumm').checked) {
			
			   
			  
			  $("#overlay, #PleaseWait").show();
			  var load="yes";
			  $("#stockLedgerDiv").load("stockGridSummary.jsp?barchval="+barchval+"&statusselect="+statusselect+"&psrno="+psrno+"&locid="+locid+"&load="+load+"&hidbrand="+hidbrand+"&hidtype="+hidtype+"&hidcat="+hidcat+"&hidsubcat="+hidsubcat+"&hidproduct="+hidproduct+"&branchid="+branchid+"&hidept="+hidept+"&hidcldocno="+hidcldocno+"&hidacno="+hidacno+"&type=1");
		}
		 else if (document.getElementById('rdet').checked) {
			 
			   $("#overlay, #PleaseWait").show();
			   var load="yes";
				  $("#stockLedgerDetDiv").load("stockGridDetail.jsp?barchval="+barchval+"&statusselect="+statusselect+"&psrno="+psrno+"&load="+load);
			 
			}  
	  
	}

function  funcleardatass()
{
	// txtpartno  psrno   txtproductname   Press F3 to Search;
	 
	 document.getElementById('txtpartno').value="";
	 document.getElementById('txtproductname').value="";
	 document.getElementById('psrno').value="";
	 document.getElementById('rsumm').checked=true;
 
	 document.getElementById("cmbbranch").value="a";
	 
	 $('#txtpartno').attr('placeholder', 'Press F3 TO Search'); 
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
function funPrint(){
 var barchval = document.getElementById("cmbbranch").value;
 var branchid=document.getElementById("cmbbranch").value;
 var hidbrand=document.getElementById("hidbrandid").value;
 var hidtype=document.getElementById("hidtypeid").value;
 var hidproduct=document.getElementById("hidproductid").value;
 var hidcat=document.getElementById("hidcatid").value;
 var hidsubcat=document.getElementById("hidsubcatid").value;
 var hidept=document.getElementById("hideptid").value;
 var hidcldocno=document.getElementById("hidvendorcldocno").value;
 var hidacno=document.getElementById("hidvendoracno").value;
     
	 var statusselect=$("#statusselect").val();
	 
	 var psrno=$("#psrno").val();
	 var locid=$("#locid").val();
		var url=document.URL;
		var reurl=url.split("com");
		/* var path= "com/dashboard/workshop/quotationapproval/printQuotationAproval.action?estDocno="+estdocno; */
		var path= "com/dashboard/procurment/productdetails/productdetailsprint.action?barchval="+barchval+"&statusselect="+statusselect+"&psrno="+psrno+"&locid="+locid+"&hidbrand="+hidbrand+"&hidtype="+hidtype+"&hidcat="+hidcat+"&hidsubcat="+hidsubcat+"&hidproduct="+hidproduct+"&branchid="+branchid+"&hidept="+hidept+"&hidcldocno="+hidcldocno+"&hidacno="+hidacno+"&type=1";
		var win= window.open(reurl[0]+path,"_blank","top=250,left=310,Width=800,Height=800,location=no,scrollbars=no,toolbar=yes");		
		win.focus();		
	 
	
}
function funClearData(){
		 document.getElementById('txtpartno').value="";
	 document.getElementById('txtproductname').value="";
	 document.getElementById('psrno').value="";
	 document.getElementById('rsumm').checked=true;
 
	 document.getElementById("cmbbranch").value="a";
	 
	 $('#txtpartno').attr('placeholder', 'Press F3 TO Search'); 
	
	 document.getElementById("txtlocation").value="";
	 document.getElementById("locid").value="";
	 document.getElementById("vendor").value="";
	 document.getElementById("hidvendorcldocno").value="";
	 document.getElementById("hidvendoracno").value="";
	 document.getElementById("hidvendoraccount").value="";
	 document.getElementById("vendor").value="";
	
	 
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
	 document.getElementById("hidvendoracno").value="";
	 document.getElementById("hidvendorcldocno").value="";
	 document.getElementById("cmbbranch").value="a";
	 //$("#partSearchdiv").load("partSearchGrid.jsp");
	
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
	
	else if(value=="pvendor"){
		getPvendor();
	}
	
	else{
		
	}
}
function getPtype(){
	 
	  $('#ptypewindow').jqxWindow('open');
		$('#ptypewindow').jqxWindow('focus');
		typeSearchContent('typeSearch.jsp', $('#ptypewindow'));

}
function typeSearchContent(url) {
//alert(url);
  $.get(url).done(function (data) {
//alert(data);
$('#ptypewindow').jqxWindow('setContent', data);

}); 
}

function getPbrand(t){
	 
	  $('#brandwindow').jqxWindow('open');
		$('#brandwindow').jqxWindow('focus');
		brandSearchContent('brandSearch.jsp?id='+t, $('#brandwindow'));

}
function brandSearchContent(url) {
//alert(url);
  $.get(url).done(function (data) {
//alert(data);
$('#brandwindow').jqxWindow('setContent', data);

}); 
}
function getDept(){

	  $('#departmentwindow').jqxWindow('open');
		$('#departmentwindow').jqxWindow('focus');
		 deptSearchContent('deptSearch.jsp', $('#departmentwindow'));
}
function deptSearchContent(url) {
	  //alert(url);
	    $.get(url).done(function (data) {
	//alert(data);
	  $('#departmentwindow').jqxWindow('setContent', data);

	}); 
	}
function getProduct(){
	
	var brandid=$('#hidbrandid').val().trim();
	var catid=$('#hidcatid').val().trim();
	var subcatid=$('#hidsubcatid').val().trim();
	
	 $('#productwindow').jqxWindow('open');
		$('#productwindow').jqxWindow('focus');
		 productSearchContent('prodSearch.jsp?brandid='+brandid+'&catid='+catid+'&subcatid='+subcatid, $('#productwindow'));

}
function productSearchContent(url) {
	  //alert(url);
	    $.get(url).done(function (data) {
	//alert(data);
	  $('#productwindow').jqxWindow('setContent', data);

	}); 
	}
	
function getPcategory(){

	  $('#pcategorywindow').jqxWindow('open');
		$('#pcategorywindow').jqxWindow('focus');
		 categorySearchContent('catSearch.jsp', $('#pcategorywindow'));
}
function categorySearchContent(url) {
//alert(url);
  $.get(url).done(function (data) {
//alert(data);
$('#pcategorywindow').jqxWindow('setContent', data);

}); 
}

function getPsubcategory(){
	var catid=$('#hidcatid').val().trim();
	 $('#psubcategorywindow').jqxWindow('open');
		$('#psubcategorywindow').jqxWindow('focus');
		 subcategorySearchContent('subcatSearch.jsp?catid='+catid, $('#psubcategorywindow'));

}
function subcategorySearchContent(url) {
  //alert(url);
    $.get(url).done(function (data) {
//alert(data);
  $('#psubcategorywindow').jqxWindow('setContent', data);

}); 
}

function getPvendor(){
	 $('#pvendorwindow').jqxWindow('open');
		$('#pvendorwindow').jqxWindow('focus');
		 pvendorsearchContent('vendorsearch.jsp', $('#pvendorwindow'));

}
function pvendorsearchContent(url) {
  //alert(url);
    $.get(url).done(function (data) {
//alert(data);
  $('#pvendorwindow').jqxWindow('setContent', data);

}); 
}

function getVendor(){
	 $('#pvendorwindow').jqxWindow('open');
		$('#pvendorwindow').jqxWindow('focus');
		vendorSearchContent('vendorsearch.jsp', $('#pvendorwindow'));

}
function vendorSearchContent(url) {
	$("#stocklistgrid").jqxGrid('clear');
   $('#pvendorwindow').jqxWindow('open');
	$.get(url).done(function (data) {
	$('#pvendorwindow').jqxWindow('setContent', data);
	$('#pvendorwindow').jqxWindow('bringToFront');
}); 
}
function funopen(docno){
	
		
		var url=document.URL;
		var reurl=url.split("com/");
		
		window.parent.formName.value="Purchase Order";
		window.parent.formCode.value="PO";
		
		var detName= "Purchase Order";
		var path= "com/Procurement/Purchase/PurchaseOrder/PurchaseOrder.jsp?mod=A"+"&venddocno="+document.getElementById("hidvendoracno").value+"&vendname="+document.getElementById("vendor").value.replace(/ /g,"%20")+"&vendaccount="+document.getElementById("hidvendoraccount").value+"&docno="+docno;
		top.addTab( detName,reurl[0]+""+path);
	
}
function funPurchaseorder()
{
	
	
	var cmbbranch=document.getElementById("cmbbranch").value;
	if(cmbbranch=="a" || cmbbranch=="")
	{
  $.messager.alert('Message',' Branch Is Mandatory','warning');   
  document.getElementById("cmbbranch").focus();
  return 0;
	}
	
	var vend=document.getElementById("hidvendorcldocno").value;
	if(vend=="")
	{
  $.messager.alert('Message',' Vendor Is Mandatory','warning');   
  return 0;
	}
	
	var selectedrows=$("#stocklistgrid").jqxGrid('selectedrowindexes');
	if(selectedrows.length==0){
		 $.messager.alert('Message',' Product Is Mandatory','warning');   
		  return 0;
			}
	
		
	$('#stocklistgrid').jqxGrid('clearfilters');
	var listss = new Array();
	var selectedrows=$("#stocklistgrid").jqxGrid('selectedrowindexes');
	selectedrows = selectedrows.sort(function(a,b){return a - b});
		  for(var i=0 ; i < selectedrows.length ; i++){
			 listss.push($("#stocklistgrid").jqxGrid('getcellvalue',selectedrows[i],'psrno')+"::"+$("#stocklistgrid").jqxGrid('getcellvalue',selectedrows[i],'qty')+"::"+$("#stocklistgrid").jqxGrid('getcellvalue',selectedrows[i],'foc')
					 +"::"+$("#stocklistgrid").jqxGrid('getcellvalue',selectedrows[i],'extfoc')
					 +"::"+$("#stocklistgrid").jqxGrid('getcellvalue',selectedrows[i],'price')); 
				  }
		   save(listss);
            
	   
	
	  }
	  function save(listss){
			var x=new XMLHttpRequest();
			x.onreadystatechange=function(){
				if (x.readyState==4 && x.status==200) 
					{
					 var items= x.responseText;
					 	var itemval=items.trim();
					 
	      if(parseInt(itemval)>0)
	      	{
				/* 	 	$.messager.alert('Message', '  Record successfully Updated ', function(r){
						     
					     });
					     */
					 	funopen(itemval);
			 
					}
				else
					{
					/* $.messager.alert('Message', '  Not Updated ', function(r){
					     
				     }); */
					}  
			}
			}  
		x.open("GET","savedata.jsp?list="+listss+"&venddocno="+document.getElementById("hidvendoracno").value);
			x.send();
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
                        <td class="label-cell">Location</td>
                        <td>
                            <input type="text" id="txtlocation" name="txtlocation" readonly="readonly" placeholder="Press F3 to Search" value='<s:property value="txtlocation"/>' onKeyDown="getLocation(event);"/>
                        </td>
                    </tr>
                    <tr>
                        <td class="label-cell">Vendor</td>
                        <td>
                            <input type="text" id="vendor" name="vendor" readonly="readonly" placeholder="Press F3 to Search" value='<s:property value="vendor"/>' onKeyDown="getVendor(event);"/>
                        </td>
                    </tr>
                </table>
                
                <div class="radio-group" style="margin-top: 10px;">
                    <label>
                        <input type="radio" id="rsumm" name="stkled" onchange="fundisable();" value="rsumm">
                        Summary
                    </label>
                    <input type="radio" hidden="true" id="rdet" name="stkled" onchange="fundisable();" value="rdet">
                </div>
            </div>

            <div class="filter-card">
                <label class="branch" style="display:block; margin-bottom: 5px;">Product Search</label>
                <div style="display: flex; align-items: center; justify-content: space-between;">
                    <select name="prodsearchby" id="prodsearchby" style="flex: 1;">
                        <option value="">--Select--</option>
                        <option value="ptype">TYPE</option>
                        <option value="pbrand">BRAND</option>
                        <option value="pdept">DEPARTMENT</option>  
                        <option value="pcategory">CATEGORY</option>
                        <option value="psubcategory">SUB CATEGORY</option>
                    </select>
                    <button type="button" name="btnadditem" id="additem" class="btn-square" onClick="setprodSearch();">+</button>
                    <button type="button" name="btnremoveitem" id="btnremoveitem" class="btn-square" onclick="setRemove();">-</button>
                </div>
                
                <textarea id="searchdetails" name="searchdetails" rows="13" readonly style="margin-top: 10px;"></textarea>
            </div>

            <div class="filter-card">
                <div class="button-group-row">
                    <input type="button" name="btnclear" id="btnclear" value="Clear" class="btn-submit" onclick="funClearData();" style="background:#64748b !important;">
                    <button type="button" class="btn-submit" id="btnprint" onclick="funPrint();" style="background:#10b981 !important;">Print</button>
                </div>
                <button type="button" class="btn-submit" id="btnpurchase" onclick="funPurchaseorder();">Purchase Order</button>
            </div>

            <div style="display:none;">
                <input type="hidden" id="locid" name="locid" value='<s:property value="locid"/>' /> 
                <input type="hidden" id="txtpartno" name="txtpartno" readonly="readonly" value='<s:property value="txtpartno"/>' onKeyDown="getProduct(event);"/>
                <input type="hidden" id="psrno" name="psrno" value='<s:property value="psrno"/>' /> 
                <input type="hidden" id="txtproductname" name="txtproductname" readonly="readonly" value='<s:property value="txtproductname"/>' tabindex="-1"/>
                
                <input type="hidden" name="hidbrandid" id="hidbrandid">
                <input type="hidden" name="hidtypeid" id="hidtypeid">
                <input type="hidden" name="hideptid" id="hideptid">
                <input type="hidden" name="hidcatid" id="hidcatid">
                <input type="hidden" name="hidsubcatid" id="hidsubcatid">
                <input type="hidden" name="hidproductid" id="hidproductid">
                <input type="hidden" name="hidvendoracno" id="hidvendoracno">
                <input type="hidden" name="hidvendorcldocno" id="hidvendorcldocno">
                <input type="hidden" name="hidvendoraccount" id="hidvendoraccount">
                
                <input type="hidden" name="hidbrand" id="hidbrand">
                <input type="hidden" name="hidept" id="hidept">
                <input type="hidden" name="hidtype" id="hidtype">
                <input type="hidden" name="hidcat" id="hidcat">
                <input type="hidden" name="hidsubcat" id="hidsubcat">
                <input type="hidden" name="hidproduct" id="hidproduct">
                <input type="hidden" name="hidvendor" id="hidvendor">
                
                <input type="hidden" id="statusselect" name="statusselect" value='<s:property value="statusselect"/>'>
                <input type="hidden" id="acno" name="acno" value='<s:property value="acno"/>'>
                
                <div id='paychaaaaa' style="width: 100%; align:right; height: 60px;"></div>
            </div>

        </div>
    </div>

    <div class="main-content-wrapper">
        
        <div class="top-toolbar-container">
            <jsp:include page="../../heading.jsp"></jsp:include>
        </div>

        <div class="scrollable-grid-area">
            
            <div id="stockLedgerDiv">
                <jsp:include page="stockGridSummary.jsp"></jsp:include>
            </div>
            
            <div id="stockLedgerDetDiv">
                <jsp:include page="stockGridDetail.jsp"></jsp:include> 
            </div> 

        </div>

    </div>

</div>
 
<div id="productDetailsWindow"><div></div><div></div></div>
<div id="locationDetailsWindow"><div></div><div></div></div>
<div id="ptypewindow"><div></div></div>
<div id="brandwindow"><div></div></div>
<div id="departmentwindow"><div></div></div>
<div id="productwindow"><div></div></div>
<div id="pcategorywindow"><div></div></div>
<div id="psubcategorywindow"><div></div></div>
<div id="pvendorwindow"><div></div></div>

</div>
</body>
</html>