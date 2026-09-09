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

.process-btn-cell {
    width: 30px;
    padding-left: 5px;
}

.icon {
    background: none;
    border: none;
    cursor: pointer;
    padding: 0;
    display: flex;
    align-items: center;
    justify-content: center;
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
	 
	 
	 $("#fromdate1").jqxDateTimeInput({ width: '100%', height: '24px',formatString:"dd.MM.yyyy"});
	 $("#todate1").jqxDateTimeInput({ width: '100%', height: '24px',formatString:"dd.MM.yyyy"});
	 
/* var fromdates1=new Date($('#fromdate1').jqxDateTimeInput('getDate'));
	 var onemounth1=new Date(new Date(fromdates1).setMonth(fromdates1.getMonth()-1)); 
 
     $('#fromdate1').jqxDateTimeInput('setDate', new Date(onemounth1));
	  */
	 
	 var fromdates=new Date($('#fromdate').jqxDateTimeInput('getDate'));
	 var onemounth=new Date(new Date(fromdates).setMonth(fromdates.getMonth()-1)); 
	 $('#todate').jqxDateTimeInput({ disabled: true}); 
     $('#fromdate').jqxDateTimeInput('setDate', new Date(onemounth));
     
     
	 $('#fromdate').on('change', function (event) {
		 $('#todate').jqxDateTimeInput({ disabled: false});
		   var fromdates=new Date($('#fromdate').jqxDateTimeInput('getDate'));
		 
		  // out date
		 	 var todates=new Date($('#todate').jqxDateTimeInput('getDate')); //del date
		 	 
		   if(fromdates>todates){
			   
			   $.messager.alert('Message','To Date Less Than From Date  ','warning');   
			   $('#todate').jqxDateTimeInput({ disabled: true});
		   return false;
		  }   
		 	 
		 	 
		   $('#todate').jqxDateTimeInput({ disabled: true}); 	 
		 	 
	 });
	 
	 
	 $('#todate1').on('change', function (event) {
		 
		   var fromdates=new Date($('#fromdate1').jqxDateTimeInput('getDate'));
		 
		  // out date
		 	 var todates=new Date($('#todate1').jqxDateTimeInput('getDate')); //del date
		 	 
		   if(fromdates>todates){
			   
			   $.messager.alert('Message','Clear To Date Less Than Clear From Date  ','warning');   
			   
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
		
		
		
		
		   $('#brandwindow').jqxWindow({ width: '50%',height: '62%',  maxHeight: '80%'  ,maxWidth: '50%' , title: 'Product Brand Search' ,position: { x: 250, y: 60 }, keyboardCloseKey: 27});
		   $('#brandwindow').jqxWindow('close');   
		
		   $('#productwindow').jqxWindow({ width: '50%',height: '62%',  maxHeight: '80%'  ,maxWidth: '50%' , title: 'Product Search' ,position: { x: 250, y: 60 }, keyboardCloseKey: 27});
		   $('#productwindow').jqxWindow('close');   
		   $('#ptypewindow').jqxWindow({ width: '30%',height: '62%',  maxHeight: '80%'  ,maxWidth: '50%' , title: 'Product Type Search' ,position: { x: 250, y: 60 }, keyboardCloseKey: 27});
		   $('#ptypewindow').jqxWindow('close');
		  
		   $('#pcategorywindow').jqxWindow({ width: '30%', height: '62%',  maxHeight: '80%' ,maxWidth: '50%' , title: 'Category Search' ,position: { x: 250, y: 60 }, keyboardCloseKey: 27});
		   $('#pcategorywindow').jqxWindow('close');  
		   $('#pdeptwindow').jqxWindow({ width: '30%', height: '62%',  maxHeight: '80%' ,maxWidth: '50%' , title: 'Department Search' ,position: { x: 250, y: 60 }, keyboardCloseKey: 27});
		   $('#pdeptwindow').jqxWindow('close');
		     $('#psubcategorywindow').jqxWindow({ width: '30%', height: '62%',  maxHeight: '80%' ,maxWidth: '50%' , title: 'Sub Category Search' ,position: { x: 250, y: 60 }, keyboardCloseKey: 27});
		   $('#psubcategorywindow').jqxWindow('close');
		   
			 
		$('#name').dblclick(function(){
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
				 productSearchContent('productSearch1.jsp');
			 }
		
			
			
		}); 
		
		 
		
});
function brandFormSearchContent(url) {
	$('#brandsearchwindow').jqxWindow('open');
	$.get(url).done(function(data) {
		$('#brandsearchwindow').jqxWindow('setContent', data);
		$('#brandsearchwindow').jqxWindow('bringToFront');
	});
}
function subCatFormSearchContent(url) {
	$('#subcatsearchwindow').jqxWindow('open');
	$.get(url).done(function(data) {
		$('#subcatsearchwindow').jqxWindow('setContent', data);
		$('#subcatsearchwindow').jqxWindow('bringToFront');
	});
}
function catFormSearchContent(url) {
	$('#catsearchwindow').jqxWindow('open');
	$.get(url).done(function(data) {
		$('#catsearchwindow').jqxWindow('setContent', data);
		$('#catsearchwindow').jqxWindow('bringToFront');
	});
}

function productSearchContent(url) {
	$('#productwindow').jqxWindow('open');
	    $.get(url).done(function (data) {
	//alert(data);
	  $('#productwindow').jqxWindow('setContent', data);

	}); 
	}


function getname(event)
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
	
	
	}


function funExportBtn(){
	JSONToCSVCon(dat1, 'General Review', true);
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
		var type=   $("#type option:selected").text().trim();
		   
		   if(document.getElementById("name").value=="")
			   {
			   
			   $.messager.alert('Message',' Search Your '+type ); 
			   document.getElementById("name").focus();
			   return 0;
			   }
	 var barchval = document.getElementById("cmbbranch").value;
     var fromdate= $("#fromdate").val();
	 var todate= $("#todate").val();
	 var type=$("#type").val();
	 
	 
	 var brandid=$("#brandid").val();
	 var catid=$("#catid").val();
	 var subcatid=$("#subcatid").val();                  
	 var psrno=$("#psrno").val();  
 
	 var hidbrandid=$("#hidbrandid").val(); 
	 var hidtypeid=$("#hidtypeid").val(); 
	 var hideptid=$("#hideptid").val(); 
	 var hidcatid=$("#hidcatid").val(); 
	 var hidsubcatid=$("#hidsubcatid").val(); 
	 var hidproductid=$("#hidproductid").val(); 
	 
	 
	 var optype=$("#optype").val();
	 
	   $("#overlay, #PleaseWait").show(); 
	   var load="yes";
		 
	//  hidbrandid hidtypeid hideptid hidcatid hidsubcatid hidproductid
		 
		
	   
 	  $("#mainlistdiv").load("mainlistGrid.jsp?barchval="+barchval+"&fromdate="+fromdate+"&todate="+todate+"&type="+type
 			  +"&brandid="+brandid+"&catid="+catid+"&subcatid="+subcatid+"&psrno="+psrno+"&load="+load+"&hidbrandid="+hidbrandid
 			  +"&hidtypeid="+hidtypeid+"&hideptid="+hideptid+"&hidcatid="+hidcatid+"&hidsubcatid="+hidsubcatid+"&hidproductid="+hidproductid+"&optype="+optype);
 
	
		   }
	}
	
 
  
  function funCalculate()
  {
	  
	  
		 $("#updatdata").attr("disabled",false);
	  var discountval=document.getElementById("discountval").value;
	  
	  if(discountval=="" || typeof(discountval)=="undefined")
			  {
		  $.messager.alert('Message', ' Enter Max Discount ', function(r){
			     
		     });
		  
		  
		  return 0;
			  }
	  
	 	var rows = $("#jqxpmgt").jqxGrid('getrows');
	    for(var i=0 ; i < rows.length ; i++){
	    	var pricegroup=rows[i].pricegroup;
	      	var counts=rows[i].counts;
	      	
	      	if(pricegroup>0)
	      		{
	     	if(pricegroup==1)
	    			{
	    			$('#jqxpmgt').jqxGrid('setcellvalue', i, "discount1",discountval);
	    			}
	     	else {
               var allowdiscount=(parseFloat(discountval)/parseInt(counts))*(counts-pricegroup+1);
	     		
	     		$('#jqxpmgt').jqxGrid('setcellvalue', i, "discount1",allowdiscount);
	     	}
	     		 
	      		}
	    	 
	    }
	  
  }
  function funupdates()
  {
	  
		$.messager.confirm('Message', 'Do you want to save changes?', function(r){
		 	  
		     
		   	if(r==false)
		   	  {
		   		
		   	  }
		   	else
		   		{
		var listss = new Array();
	 	var rows = $("#jqxpmgt").jqxGrid('getrows'); 
	   for(var i=0 ; i < rows.length ; i++){
		   
		   listss.push(rows[i].catid+"::"+rows[i].discount1+"::"+rows[i].pricegroup);  
	   }
	   save(listss);
		   		}
		   	
		}); 
  }
  function save(listss){
		var x=new XMLHttpRequest();
		x.onreadystatechange=function(){
			if (x.readyState==4 && x.status==200)
				{
				 var items= x.responseText;
				 	var itemval=items.trim();
				 	
				 	//alert(items);
				 	
      if(parseInt(itemval)==1)
      	{
				 	$.messager.alert('Message', '  Record successfully Updated ', function(r){
					     
				     });
				    
				 //	funreload(event);
			/* document.getElementById("discountval").value="";
				 	
				 	document.getElementById("rowindexs").value="";
				 	document.getElementById("std_cost").value="";
				 	document.getElementById("psrno").value="";
				 	document.getElementById("type").value="BR";
				 	
				 	document.getElementById("name").value="";
				 	document.getElementById("brandid").value="";
				 	document.getElementById("catid").value="";
				 	document.getElementById("subcatid").value=""; */
				 	
				 	
				     $("#jqxpmgt").jqxGrid('clear');
					 document.getElementById("name1").innerText="";
					 document.getElementById("name2").innerText="";
					 document.getElementById("name3").innerText="";
					 document.getElementById("productid").innerText="";
					 document.getElementById("productname").innerText="";
					 document.getElementById("productbrand").innerText="";
					  $("#updatdata").attr("disabled",true);  
				  
				 	
				}
			else
				{
				$.messager.alert('Message', '  Not Updated ', function(r){
				     
			     });
				}  
		}
		}
	x.open("GET","pricesavedata.jsp?list="+listss+'&psrno='+document.getElementById("psrno").value+'&std_cost='+document.getElementById("std_cost").value+'&fixing='+document.getElementById("fixing").value+'&labourcharge='+document.getElementById("labourcharge").value+'&discountval='+document.getElementById("discountval").value);
		x.send();
	}

 
	function hidebranch()
	{
	 
		  /* $("#branchdiv").hide();
		  $("#branchlabel").hide(); */
		 
	}
	function clearnames()
	
	
	{
		
		
		 $("#mainlistgrid").jqxGrid('clear');
		
		  $("#mainlistgrid").jqxGrid('addrow', null, {});
		  $("#jqxpmgt").jqxGrid('clear');
		  document.getElementById("name1").innerText="";
			 document.getElementById("name2").innerText="";
			 document.getElementById("name3").innerText="";
			 document.getElementById("productid").innerText="";
			 document.getElementById("productname").innerText="";
			 document.getElementById("productbrand").innerText="";
			 document.getElementById("discountval").value="";
			 	
			 	document.getElementById("rowindexs").value="";
			 	document.getElementById("std_cost").value="";
			 	document.getElementById("psrno").value="";
			 	document.getElementById("labourcharge").value="";
				document.getElementById("fixing").value="";
				
			 	document.getElementById("name").value="";
			 	document.getElementById("brandid").value="";
			 	document.getElementById("catid").value="";
			 	document.getElementById("subcatid").value="";
 
		
	}
	     function funprocess1()
	   {
			   $("#overlay, #PleaseWait").show();
		   setTimeout(function(){
			    
		   funprocess();
			    
			}, 2000);
		  
		 
	   }
	 
	
	   function funprocess()
		
		{	  
		     
		  
		   
			var rows = $("#mainlistgrid").jqxGrid('getrows');
			
			var i=0;
			var k=rows.length-1;
			   for(i=0 ; i < rows.length ; i++){

	 	var std_cost=rows[i].std_cost;
	 	
	 	 
	 	if(std_cost>0 && std_cost!="" && typeof(std_cost)!="undefined")
	       {
	 		$('#mainlistgrid').jqxGrid('setcellvalue', i, "std_cost",0);
		
			   }
	 	
		if(std_cost>0 && std_cost!="" && typeof(std_cost)!="undefined")
	    {
			$('#mainlistgrid').jqxGrid('setcellvalue', i, "std_cost",std_cost);
			
			$('#mainlistgrid').jqxGrid('setcellvalue', i, "cellselects",1);
			
		
			   }
	 	
		/* if(i==k)
			{
			  document.getElementById("loadings").innerText="";
			} */
		
	 	
			   }
			   $("#overlay, #PleaseWait").hide();
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

	   function getPmodel(t){
	   	
	   	var brandid=$('#hidsbrandid').val().trim();
	   	
	   	if(brandid==""){
	   		 $.messager.alert('Message','Select Brand','warning');
	   		 
	   		 return 0;
	   	 }
	   	
	   	  $('#modelwindow').jqxWindow('open');
	   	  $('#modelwindow').jqxWindow('focus');
	   		 modelSearchContent('modelSearch.jsp?id='+t+'&brandid='+brandid, $('#modelwindow'));

	   }

	   function getSubmodel(){
	   	
	   	var brandid=$('#hidsbrandid').val().trim();
	   	var modelid=$('#hidsmodelid').val().trim();
	   	
	   	if(brandid==""){
	   		 $.messager.alert('Message','Select Brand','warning');
	   		 
	   		 return 0;
	   	 }
	   	
	   	if(modelid==""){
	   		 $.messager.alert('Message','Select Model','warning');
	   		 
	   		 return 0;
	   	 }
	   	
	   	  $('#submodelwindow').jqxWindow('open');
	   	  $('#submodelwindow').jqxWindow('focus');
	   	  subModelSearchContent('SubModelSearch.jsp?modelid='+modelid+'&brandid='+brandid, $('#submodelwindow'));

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


	   function getProduct(){
	   	
	   	var brandid=$('#hidbrandid').val().trim();
	   	var catid=$('#hidcatid').val().trim();
	   	var subcatid=$('#hidsubcatid').val().trim();
	   	
	   	 $('#productwindow').jqxWindow('open');
	   		$('#productwindow').jqxWindow('focus');
	   		 productSearchContent('productSearch.jsp?brandid='+brandid+'&catid='+catid+'&subcatid='+subcatid, $('#productwindow'));

	   }

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

		 function subcategorySearchContent(url) {
		   //alert(url);
		     $.get(url).done(function (data) {
		 //alert(data);
		   $('#psubcategorywindow').jqxWindow('setContent', data);

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
	   	
	   	
	   	else{
	   		
	   	}
	   }
	   function funClearData(){
	   	
	   	 document.getElementById("hidsbrandid").value="";
	   	 document.getElementById("hidsmodelid").value="";
	   	 document.getElementById("hidyomid").value="";
	   	 document.getElementById("hidspec1id").value="";
	   	 document.getElementById("hidspec2id").value="";
	   	 document.getElementById("hidspec3id").value="";
	   	 document.getElementById("hidbrandid").value="";
	   	 document.getElementById("hidtypeid").value="";
	   	 document.getElementById("hidproductid").value="";
	   	 document.getElementById("hidcatid").value="";
	   	 document.getElementById("hidsubcatid").value=""; 
	   	 document.getElementById("hidsbrand").value="";
	   	 document.getElementById("hidsmodel").value="";
	   	 document.getElementById("hidyom").value="";
	   	 document.getElementById("hidspec1").value="";
	   	 document.getElementById("hidspec2").value="";
	   	 document.getElementById("hidspec3").value="";
	   	 document.getElementById("hidbrand").value="";
	   	 document.getElementById("hidtype").value="";
	   	 document.getElementById("hidproduct").value="";
	   	 document.getElementById("hidcat").value="";
	   	 document.getElementById("hidsubcat").value="";

	   	 document.getElementById("prodsearchby").value="";
	   	 document.getElementById("searchdetails").value="";
	   	 document.getElementById("hideptid").value="";
	   	 document.getElementById("hidept").value="";
	   	 document.getElementById("cmbbranch").value="a";
	   	 //$("#partSearchdiv").load("partSearchGrid.jsp");
	   	  //clearnames();
	   	
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
	   	
	   	if(suitvalue=="sbrand"){
	   		 document.getElementById("hidsbrandid").value="";
	   		 document.getElementById("hidsbrand").value="";
	   		 
	   	}
	   	else if(suitvalue=="smodel"){
	   		document.getElementById("hidsmodelid").value="";
	   		document.getElementById("hidsmodel").value="";
	   		
	   	}
	   	else if(suitvalue=="syom"){
	   		document.getElementById("hidyomid").value="";
	   		 document.getElementById("hidyom").value="";
	   		 
	   	}
	   	
	   	else if(suitvalue=="spec1"){
	   		document.getElementById("hidspec1id").value="";
	   		document.getElementById("hidspec1").value="";
	   		 
	   	}
	   	else if(suitvalue=="spec2"){
	   		document.getElementById("hidspec2id").value="";
	   		document.getElementById("hidspec2").value="";
	   		 
	   	}
	   	else if(suitvalue=="spec3"){
	   		document.getElementById("hidspec3id").value="";
	   		document.getElementById("hidspec3").value="";
	   	}
	   	document.getElementById("searchdetails").value="";
	   	
	   	if(document.getElementById("hidsbrand").value!=""){
	   		document.getElementById("searchdetails").value+="\n"+document.getElementById("hidsbrand").value;	
	   	}
	   	if(document.getElementById("hidsmodel").value!=""){
	   		document.getElementById("searchdetails").value+="\n"+document.getElementById("hidsmodel").value;	
	   	}
	   	if(document.getElementById("hidyom").value!=""){
	   		document.getElementById("searchdetails").value+="\n"+document.getElementById("hidyom").value;	
	   	}
	   	if(document.getElementById("hidspec1").value!=""){
	   		document.getElementById("searchdetails").value+="\n"+document.getElementById("hidspec1").value;	
	   	}
	   	if(document.getElementById("hidspec2").value!=""){
	   		document.getElementById("searchdetails").value+="\n"+document.getElementById("hidspec2").value;	
	   	}
	   	if(document.getElementById("hidspec3").value!=""){
	   		document.getElementById("searchdetails").value+="\n"+document.getElementById("hidspec3").value;	
	   	}
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
	   }


</script>
</head>
<body onload="getBranch();hidebranch();dis();">
    <div id="mainBG" class="homeContent" data-type="background"> 
        <div class="master-container">

            <div class="sidebar-filters">
                <div class="sidebar-scroll-content">
                    
                    <div class="filter-card">
                        <table class="release-filter-table">
                            <tr>
                                <td class="label-cell">From</td>
                                <td>
                                    <div style="display:flex; align-items:center;">
                                        <div id="fromdate" name="fromdate" value='<s:property value="fromdate"/>'></div>
                                        <div class="process-btn-cell">
                                            <button type="button" class="icon" id="process" title="Process" onclick="funprocess();" hidden="true">
                                                <img alt="process" src="<%=contextPath%>/icons/process2.png" width="18" height="18">
                                            </button>
                                        </div>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td class="label-cell">To</td>
                                <td><div id="todate" name="todate" value='<s:property value="todate"/>'></div></td>
                            </tr>
                            <tr>
                                <td class="label-cell">Sales Count</td>
                                <td>
                                    <input type="number" id="salescount" name="salescount">
                                </td>
                            </tr>
                        </table>

                        <select id="type" hidden="true" name="type" onchange="clearnames()">
                            <option value=""></option>
                        </select> 
                        <input type="hidden" id="name" placeholder="Press F3 for Search" readonly="readonly" onkeydown="getname(event);" name="name" value='<s:property value="name"/>'> 
                        <input type="hidden" name="updatdata" id="updatdata" value="Update" onclick="funupdates()">

                        <div class="release-actions">
                            <button type="button" class="btn-submit" name="updatdata_visible" id="updatdata_visible" onclick="funupdates()">Update</button>
                        </div>
                    </div>

                    <div class="filter-card">
                        <h4 class="filter-card-header">Stock Clearing</h4>
                        <table class="release-filter-table">
                            <tr>
                                <td colspan="2">
                                    <div style="display:flex; gap:5px; align-items:center;">
                                        <input type="text" id="piceper" name="piceper" style="width: 40px;">
                                        <span class="label-cell" style="padding-right: 5px;">%</span>
                                        <select id="plusmin" name="plusmin" onchange="cleargrid()" style="flex:1;">
                                            <option value="pl">Plus</option>
                                            <option value="ms">Minus</option>
                                        </select>
                                        <button type="button" name="Calculate" id="Calculate" class="btn-submit" style="min-width:70px; padding: 0 5px;" onclick="funCalculateclprice()">Calculate</button>
                                    </div>
                                    <input type="hidden" id="clearprice" name="clearprice">
                                </td>
                            </tr>
                            <tr>
                                <td class="label-cell">Clear From</td>
                                <td><div id="fromdate1" name="fromdate1" value='<s:property value="fromdate1"/>'></div></td>
                            </tr>
                            <tr>
                                <td class="label-cell">Clear To</td>
                                <td><div id="todate1" name="todate1" value='<s:property value="todate1"/>'></div></td>
                            </tr>
                        </table>
                        <div class="release-actions">
                            <button type="button" class="btn-submit" name="updatdata1" id="updatdata1" onclick="funupdatesdata()">Update</button>
                        </div>
                    </div>

                    <div class="filter-card">
                        <table class="release-filter-table">
                            <tr>
                                <td class="label-cell">PRODUCT</td>
                                <td>
                                    <div style="display: flex; gap: 5px;">
                                        <select name="prodsearchby" id="prodsearchby" style="flex: 1;"> 
                                            <option value="">--Select--</option>
                                            <option value="ptype">TYPE</option>
                                            <option value="pbrand">BRAND</option>
                                            <option value="pdept">DEPARTMENT</option>
                                            <option value="pcategory">CATEGORY</option>
                                            <option value="psubcategory">SUB CATEGORY</option>
                                            <option value="product">PRODUCT</option>
                                        </select>
                                        <button type="button" name="btnadditem" id="additem" class="btn-submit" style="min-width: 26px; width: 26px; padding: 0;" onclick="setprodSearch();">+</button>
                                        <button type="button" name="btnremoveitem" id="btnremoveitem" class="btn-submit" style="min-width: 26px; width: 26px; padding: 0;" onclick="setRemove();">-</button>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2">
                                    <textarea id="searchdetails" name="searchdetails" style="height: 120px;" readonly></textarea>
                                </td>
                            </tr>
                        </table>
                        <div class="release-actions">
                            <button type="button" class="btn-submit" name="btnclear" id="btnclear" onclick="funClearData();">Clear</button>
                        </div>
                    </div>

                    <input type="hidden" id="brandid" name="brandid">  
                    <input type="hidden" id="catid" name="catid">
                    <input type="hidden" id="subcatid" name="subcatid">      
                    <input type="hidden" id="psrno" name="psrno">
                    <input type="hidden" id="rowindexs" name="rowindexs">       
                    <input type="hidden" id="discountval" name="discountval">
                    <input type="hidden" id="std_cost" name="std_cost">
                    <input type="hidden" id="fixing" name="fixing">
                    <input type="hidden" id="labourcharge" name="labourcharge">
                    <input type="hidden" name="hidbrandid" id="hidbrandid">
                    <input type="hidden" name="hidmodelid" id="hidmodelid">
                    <input type="hidden" name="hidyomid" id="hidyomid">
                    <input type="hidden" name="hidspec1id" id="hidspec1id">
                    <input type="hidden" name="hidspec2id" id="hidspec2id">
                    <input type="hidden" name="hidspec3id" id="hidspec3id">
                    <input type="hidden" name="hidsubmodelid" id="hidsubmodelid">
                    <input type="hidden" name="hidsubmodel" id="hidsubmodel">
                    <input type="hidden" name="hidbrand" id="hidbrand">
                    <input type="hidden" name="hidmodel" id="hidmodel">
                    <input type="hidden" name="hidyom" id="hidyom">
                    <input type="hidden" name="hidspec1" id="hidspec1">
                    <input type="hidden" name="hidspec2" id="hidspec2">
                    <input type="hidden" name="hidspec3" id="hidspec3">  
                    <input type="hidden" name="hidsbrandid" id="hidsbrandid">  
                    <input type="hidden" name="hidsmodelid" id="hidsmodelid">
                    <input type="hidden" name="hidtypeid" id="hidtypeid">
                    <input type="hidden" name="hideptid" id="hideptid">
                    <input type="hidden" name="hidcatid" id="hidcatid">
                    <input type="hidden" name="hidsubcatid" id="hidsubcatid">
                    <input type="hidden" name="hidproductid" id="hidproductid">
                    <input type="hidden" name="hidept" id="hidept">
                    <input type="hidden" name="hidsbrand" id="hidsbrand">
                    <input type="hidden" name="hidsmodel" id="hidsmodel">
                    <input type="hidden" name="hidtype" id="hidtype">
                    <input type="hidden" name="hidcat" id="hidcat">
                    <input type="hidden" name="hidsubcat" id="hidsubcat">
                    <input type="hidden" name="hidproduct" id="hidproduct">
                    <input type="hidden" name="hidvehsuitid" id="hidvehsuitid">  

                </div>
            </div>

            <div class="main-content-area">
                
                <div class="top-toolbar-container">
                    <jsp:include page="../../heading.jsp"></jsp:include>
                </div>

                <div class="grid-content-container">
                    <div id="mainlistdiv"><jsp:include page="mainlistGrid.jsp"></jsp:include></div>
                    
                    <%-- 
                    <div style="display:flex; gap:20px; margin-top:20px;">
                        <div id="pricelistdiv" style="flex:1;" hidden="true"><jsp:include page="pricelistgrid.jsp"></jsp:include></div>
                        <div style="flex:1;"> 
                            <table width="100%">
                                <tr>
                                    <td align="left" width="15%"><font size="1.8px"><b><label id="name1"></label></b></font></td>
                                    <td align="left" width="85%"><font color="#0000ff" size="1.85px"><b><label id="productid"></label></b></font></td>
                                </tr>
                                <tr>
                                    <td align="left" width="15%"><font size="1.8px"><b><label id="name2"></label></b></font></td>
                                    <td align="left"><font color="#0000ff" size="1.8px"><b><label id="productname"></label></b></font></td>
                                </tr>
                                <tr>
                                    <td align="left" width="15%"><font size="1.8px"><b><label id="name3"></label></b></font></td>
                                    <td align="left"><font color="#0000ff" size="1.8px"><b><label id="productbrand"></label></b></font></td>
                                </tr>
                            </table>
                        </div>
                    </div> 
                    --%>
                </div>

            </div>

        </div> 
        
        <div id="brandsearchwindow"><div></div><div></div></div>
        <div id="catsearchwindow"><div></div><div></div></div>
        <div id="subcatsearchwindow"><div></div><div></div></div>	
        <div id="productwindow"><div></div></div>
        <div id="brandwindow"><div></div></div>
        <div id="ptypewindow"><div></div></div>
        <div id="pcategorywindow"><div></div></div>
        <div id="pdeptwindow"><div></div></div>
        <div id="psubcategorywindow"><div></div></div>
 
    </div>
</body>
</html>