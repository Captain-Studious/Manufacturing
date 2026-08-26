 
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
<%-- <script type="text/javascript" src="../../js/dashboard.js"></script> --%> 

<style type="text/css">
.icons {
	width: 2.5em;
	height: 2em;
	border: none;
 background-color: #E0ECF8;
}



input[type=text]::-webkit-search-cancel-button {
    -webkit-appearance: searchfield-cancel-button;
}


.myButtons {
	display: inline-block;
	margin-right:4px;
	margin-left:4px; 
  margin-bottom: 0;
  font-weight: normal;
  line-height: 1.3;
  text-align: center;
  white-space: nowrap;
  vertical-align: middle;
  -ms-touch-action: manipulation;
      touch-action: manipulation;
  cursor: pointer;
  -webkit-user-select: none;
     -moz-user-select: none;
      -ms-user-select: none;
          user-select: none;
  background-image: none;
  border: 1px solid transparent;
  border-radius: 4px;
  color: #fff;
  background-color: grey;
}
.myButtons:hover {
	  color: #fff;
  background-color: #31b0d5;
  
}
.myButtons:active {
  color: #fff;
  background-color: #31b0d5;
  
}
.myButtons:focus {
  color: #fff;
  background-color: grey;
}
</style>

<script type="text/javascript">

$(document).ready(function () {
	  $("body").prepend('<div id="overlay" class="ui-widget-overlay" style="z-index: 1; display: none;"></div>');
	     $("body").prepend("<div id='PleaseWait' style='display: none;position:absolute; z-index: 1;top:180px;right:550px;'><img src='../../../../icons/31load.gif'/></div>");
		
	     $('#ptypewindow').jqxWindow({ width: '30%',height: '62%',  maxHeight: '80%'  ,maxWidth: '50%' , title: 'Product Type Search' ,position: { x: 250, y: 60 }, keyboardCloseKey: 27});
		   $('#ptypewindow').jqxWindow('close');
		   $('#brandwindow').jqxWindow({ width: '30%', height: '62%',  maxHeight: '75%' ,maxWidth: '50%' , title: 'Brand Search' ,position: { x: 250, y: 60 }, keyboardCloseKey: 27});
		   $('#brandwindow').jqxWindow('close');
		   $('#modelwindow').jqxWindow({ width: '30%',height: '62%',  maxHeight: '80%' ,maxWidth: '50%' , title: 'Model Search' ,position: { x: 250, y: 60 }, keyboardCloseKey: 27});
		   $('#modelwindow').jqxWindow('close');
		   $('#submodelwindow').jqxWindow({ width: '30%',height: '62%',  maxHeight: '80%' ,maxWidth: '50%' , title: 'Sub Model Search' ,position: { x: 250, y: 60 }, keyboardCloseKey: 27});
		   $('#submodelwindow').jqxWindow('close');
		   $('#productwindow').jqxWindow({ width: '50%',height: '62%',  maxHeight: '80%'  ,maxWidth: '50%' , title: 'Product Search' ,position: { x: 250, y: 60 }, keyboardCloseKey: 27});
		   $('#productwindow').jqxWindow('close');
		   $('#pcategorywindow').jqxWindow({ width: '30%', height: '62%',  maxHeight: '80%' ,maxWidth: '50%' , title: 'Category Search' ,position: { x: 250, y: 60 }, keyboardCloseKey: 27});
		   $('#pcategorywindow').jqxWindow('close');
		   $('#pdeptwindow').jqxWindow({ width: '30%', height: '62%',  maxHeight: '80%' ,maxWidth: '50%' , title: 'Department Search' ,position: { x: 250, y: 60 }, keyboardCloseKey: 27});
		   $('#pdeptwindow').jqxWindow('close');
		   $('#psubcategorywindow').jqxWindow({ width: '30%', height: '62%',  maxHeight: '80%' ,maxWidth: '50%' , title: 'Sub Category Search' ,position: { x: 250, y: 60 }, keyboardCloseKey: 27});
		   $('#psubcategorywindow').jqxWindow('close');
 
		   
			$('#yomsearchwindow').jqxWindow({
				width : '25%',
				height : '62%',
				maxHeight : '70%',
				maxWidth : '45%',
				title : 'Yom Search',
				position : {
					x : 420,
					y : 87
				},
				theme : 'energyblue',
				showCloseButton : true,
				keyboardCloseKey : 27
			});
			$('#yomsearchwindow').jqxWindow('close');
		   $('#spec1window').jqxWindow({ width: '30%',height: '62%',  maxHeight: '80%'  ,maxWidth: '50%' , title: 'Bed Size Search' ,position: { x: 250, y: 60 }, keyboardCloseKey: 27});
		   $('#spec1window').jqxWindow('close');
		   $('#spec2window').jqxWindow({ width: '32%',height: '62%',  maxHeight: '65%'  ,maxWidth: '52%' , title: 'Engin Size Search' ,position: { x: 350, y: 60 }, keyboardCloseKey: 27});
		   $('#spec2window').jqxWindow('close');
		   $('#spec3window').jqxWindow({ width: '32%',height: '62%',  maxHeight: '65%'  ,maxWidth: '52%' , title: 'Cabin Size Search' ,position: { x: 350, y: 60 }, keyboardCloseKey: 27});
		   $('#spec3window').jqxWindow('close');
		   $('#suitsearchwindow').jqxWindow({
				width : '80%',
				height : '65%',
				maxHeight : '90%',
				maxWidth : '90%',
				title : 'Brand Search',
				position : {
					x : 120,
					y : 87
				},
				theme : 'energyblue',
				showCloseButton : true,
				keyboardCloseKey : 27
			});
			$('#suitsearchwindow').jqxWindow('close');
			
		
			   $('#brand').dblclick(function(){
				   
				   
					var yomfrm=document.getElementById("yomfrm").value;
			 		var yomto=document.getElementById("yomto").value;
					
					if(yomfrm==""){
						 $.messager.alert('Message','Select Yom(From)','warning');
						 
						 return 0;
					 }
					 
					
				/* 	if(yomto==""){
						 $.messager.alert('Message','Select Yom(To)','warning');
						 
						 return 0;
					 }
					 */
				 
				  $('#brandwindow').jqxWindow('open');
					$('#brandwindow').jqxWindow('focus');
					brandSearchContent("brandSearch1.jsp?yomfrm="+document.getElementById("yomfrm").value+"&yomto="+document.getElementById("yomto").value);

				 });
			

			   $('#model').dblclick(function(){
				   
					var yomfrm=document.getElementById("yomfrm").value;
			 		var yomto=document.getElementById("yomto").value;
					
					if(yomfrm==""){
						 $.messager.alert('Message','Select Yom(From)','warning');
						 
						 return 0;
					 }
					 
					
					/* if(yomto==""){
						 $.messager.alert('Message','Select Yom(To)','warning');
						 
						 return 0;
					 }
					 */
					
					var brandid=$('#brandid').val().trim();
					
					if(brandid==""){
						 $.messager.alert('Message','Select Brand','warning');
						 
						 return 0;
					 }
					
					  $('#modelwindow').jqxWindow('open');
					  $('#modelwindow').jqxWindow('focus');
						 modelSearchContent('modelSearch1.jsp?brandid='+brandid+"&yomfrm="+document.getElementById("yomfrm").value+"&yomto="+document.getElementById("yomto").value);

				 });
			   
			   
			   $('#submodel').dblclick(function(){
					var yomfrm=document.getElementById("yomfrm").value;
			 		var yomto=document.getElementById("yomto").value;
					
					if(yomfrm==""){
						 $.messager.alert('Message','Select Yom(From)','warning');
						 
						 return 0;
					 }
					 
					
				/* 	if(yomto==""){
						 $.messager.alert('Message','Select Yom(To)','warning');
						 
						 return 0;
					 }
					 */
					
					var brandid=$('#brandid').val().trim();
					var modelid=$('#modelid').val().trim();
					
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
					  subModelSearchContent('SubModelSearch1.jsp?modelid='+modelid+'&brandid='+brandid+"&yomfrm="+document.getElementById("yomfrm").value+"&yomto="+document.getElementById("yomto").value);

			   });
			
 		   $('#yomfrm').dblclick(function(){
	    			
	    			 
	    			var yomfrm=document.getElementById("yomfrm").value;
	    	 		var yomto=document.getElementById("yomto").value;
	    	 		
	    	 		
	    	 	 
	    	 		var type="frm";
	    	 		
	    	 		
	    	 		yomSearchContent('yomSearchGrid.jsp?yomfrm='+yomfrm+'&yomto='+yomto+'&type='+type);   
	    		});
	    		
	    		$('#yomto').dblclick(function(){
	    			
	    			 
	    			var yomfrm=document.getElementById("yomfrm").value;
	    	 		var yomto=document.getElementById("yomto").value;
	    	 		var type="to";
	    	 		$('#yomsearchwindow').jqxWindow('open');
	    	 		yomSearchContent('yomSearchGrid.jsp?yomfrm='+yomfrm+'&yomto='+yomto+'&type='+type);   
	    		});
	    		
			   
			   
			   $('#bedsize').dblclick(function(){

				   var brandid=$('#brandid').val().trim();
					var modelid=$('#modelid').val().trim();
					
					var submodelid=$('#submodelid').val().trim();
					
					if(brandid==""){
						 $.messager.alert('Message','Select Brand','warning');
						 
						 return 0;
					 }
					
					if(modelid==""){
						 $.messager.alert('Message','Select Model','warning');
						 
						 return 0;
					 }
				   
					if(submodelid==""){
						 $.messager.alert('Message','Select Model','warning');
						 
						 return 0;
					 }
				   
				   
					$('#spec1window').jqxWindow('open');
					$('#spec1window').jqxWindow('focus');
					 spec1SearchContent('spec1Search1.jsp?modelid='+modelid+'&brandid='+brandid+"&submodelid="+submodelid+"&yomfrm="+document.getElementById("yomfrm").value+"&yomto="+document.getElementById("yomto").value);
				   });
	  
		 
			   
			   $('#enginsize').dblclick(function(){

				   var brandid=$('#brandid').val().trim();
					var modelid=$('#modelid').val().trim();
					
					var submodelid=$('#submodelid').val().trim();
					
					if(brandid==""){
						 $.messager.alert('Message','Select Brand','warning');
						 
						 return 0;
					 }
					
					if(modelid==""){
						 $.messager.alert('Message','Select Model','warning');
						 
						 return 0;
					 }
				   
					if(submodelid==""){
						 $.messager.alert('Message','Select Model','warning');
						 
						 return 0;
					 }
				   
				   
				   $('#spec2window').jqxWindow('open');
					$('#spec2window').jqxWindow('focus');
					 spec2SearchContent('spec2Search2.jsp?modelid='+modelid+'&brandid='+brandid+"&submodelid="+submodelid+"&yomfrm="+document.getElementById("yomfrm").value+"&yomto="+document.getElementById("yomto").value);
				   });
	  
			   
			   
			 
			   $('#cabinsize').dblclick(function(){

				   var brandid=$('#brandid').val().trim();
				   var modelid=$('#modelid').val().trim();
				   var submodelid=$('#submodelid').val().trim();
					
					if(brandid==""){
						 $.messager.alert('Message','Select Brand','warning');
						 return 0;
					 }
					
					if(modelid==""){
						 $.messager.alert('Message','Select Model','warning');
						 
						 return 0;
					 }
				   
					if(submodelid==""){
						 $.messager.alert('Message','Select Model','warning');
						 
						 return 0;
					 }
					$('#spec3window').jqxWindow('open');
					$('#spec3window').jqxWindow('focus');
					 spec3SearchContent('spec3Search3.jsp?modelid='+modelid+'&brandid='+brandid+"&submodelid="+submodelid+"&yomfrm="+document.getElementById("yomfrm").value+"&yomto="+document.getElementById("yomto").value);

			   });
			   
			   
			   
			   
});
function getYom(event,type){
 
		var yomfrm=document.getElementById("yomfrm").value;
		var yomto=document.getElementById("yomto").value;
	   	 var x= event.keyCode;
	   	 if(x==114){
	   		yomSearchContent('yomSearchGrid.jsp?yomfrm='+yomfrm+'&yomto='+yomto+'&type='+type);  	 }
	    	 else{
	   		 }
	          	 }
	
function yomSearchContent(url) {
	
	$('#yomsearchwindow').jqxWindow('open');
	
	$.get(url).done(function(data) {
		$('#yomsearchwindow').jqxWindow('setContent', data);
 
	});
}
function getbed(event){
	 var x= event.keyCode;
	

		
	 if(x==114){
		 
		  var brandid=$('#brandid').val().trim();
			var modelid=$('#modelid').val().trim();
			
			var submodelid=$('#submodelid').val().trim();
			
			if(brandid==""){
				 $.messager.alert('Message','Select Brand','warning');
				 
				 return 0;
			 }
			
			if(modelid==""){
				 $.messager.alert('Message','Select Model','warning');
				 
				 return 0;
			 }
		   
			if(submodelid==""){
				 $.messager.alert('Message','Select Sub Model','warning');
				 
				 return 0;
			 }
		   
		   
			$('#spec1window').jqxWindow('open');
			$('#spec1window').jqxWindow('focus');
			 spec1SearchContent('spec1Search1.jsp?modelid='+modelid+'&brandid='+brandid+"&submodelid="+submodelid+"&yomfrm="+document.getElementById("yomfrm").value+"&yomto="+document.getElementById("yomto").value); 
	 }
	 else{
		 }
		 
	 }  
	 
	 
function geteng(event){        
	 var x= event.keyCode;
	

		
	 if(x==114){
		 
		   var brandid=$('#brandid').val().trim();
			var modelid=$('#modelid').val().trim();
			
			var submodelid=$('#submodelid').val().trim();
			
			if(brandid==""){
				 $.messager.alert('Message','Select Brand','warning');
				 
				 return 0;
			 }
			
			if(modelid==""){
				 $.messager.alert('Message','Select Model','warning');
				 
				 return 0;
			 }
		   
			if(submodelid==""){
				 $.messager.alert('Message','Select Sub Model','warning');
				 
				 return 0;
			 }
		   
		   
		   $('#spec2window').jqxWindow('open');
			$('#spec2window').jqxWindow('focus');
			 spec2SearchContent('spec2Search2.jsp?modelid='+modelid+'&brandid='+brandid+"&submodelid="+submodelid+"&yomfrm="+document.getElementById("yomfrm").value+"&yomto="+document.getElementById("yomto").value);
	 }
	 else{
		 }
		 
	 }  
	 

function getcab(event){
	 var x= event.keyCode;
	

		
	 if(x==114){
		 

		   var brandid=$('#brandid').val().trim();
		   var modelid=$('#modelid').val().trim();
		   var submodelid=$('#submodelid').val().trim();
			
			if(brandid==""){
				 $.messager.alert('Message','Select Brand','warning');
				 return 0;
			 }
			
			if(modelid==""){
				 $.messager.alert('Message','Select Model','warning');
				 
				 return 0;
			 }
		   
			if(submodelid==""){
				 $.messager.alert('Message','Select Sub Model','warning');
				 
				 return 0;
			 }
			$('#spec3window').jqxWindow('open');
			$('#spec3window').jqxWindow('focus');
			 spec3SearchContent('spec3Search3.jsp?modelid='+modelid+'&brandid='+brandid+"&submodelid="+submodelid+"&yomfrm="+document.getElementById("yomfrm").value+"&yomto="+document.getElementById("yomto").value);
	 }
	 else{
		 }
		 
	 }   

 
	 

 


function getbrand(event){
	 var x= event.keyCode;
	
	
		
		
	 if(x==114){
			var yomfrm=document.getElementById("yomfrm").value;
	 		var yomto=document.getElementById("yomto").value;
			
			if(yomfrm==""){
				 $.messager.alert('Message','Select Yom(From)','warning');
				 
				 return 0;
			 }
			 
			/* 
			if(yomto==""){
				 $.messager.alert('Message','Select Yom(To)','warning');
				 
				 return 0;
			 }
		  */
		  $('#brandwindow').jqxWindow('open');
			$('#brandwindow').jqxWindow('focus');
			brandSearchContent('brandSearch1.jsp?', $('#brandwindow'));
			
	 
	 }
	 else{
		 }
		 
	 }  
	 
	 
	 
	 
function getmodel(event){
	 var x= event.keyCode;
	

		
	 if(x==114){
		 var brandid=$('#brandid').val().trim();
			
			if(brandid==""){
				 $.messager.alert('Message','Select Brand','warning');
				 
				 return 0;
			 }
			
			var yomfrm=document.getElementById("yomfrm").value;
	 		var yomto=document.getElementById("yomto").value;
			
			if(yomfrm==""){
				 $.messager.alert('Message','Select Yom(From)','warning');
				 
				 return 0;
			 }
			 
			
	/* 		if(yomto==""){
				 $.messager.alert('Message','Select Yom(To)','warning');
				 
				 return 0;
			 }
			 */
			
			  $('#modelwindow').jqxWindow('open');
			  $('#modelwindow').jqxWindow('focus');
				 modelSearchContent('modelSearch1.jsp?brandid='+brandid, $('#modelwindow'));  }
	 else{
		 }
		 
	 }  
	 
function getsubmodel(event){
	 var x= event.keyCode;
	

		
	 if(x==114){
			var yomfrm=document.getElementById("yomfrm").value;
	 		var yomto=document.getElementById("yomto").value;
			
			if(yomfrm==""){
				 $.messager.alert('Message','Select Yom(From)','warning');
				 
				 return 0;
			 }
			 
			
		/* 	if(yomto==""){
				 $.messager.alert('Message','Select Yom(To)','warning');
				 
				 return 0;
			 } */
			var brandid=$('#brandid').val().trim();
			var modelid=$('#modelid').val().trim();
			
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
			  subModelSearchContent('SubModelSearch1.jsp?modelid='+modelid+'&brandid='+brandid, $('#submodelwindow')); }
	 else{
		 }
		 
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

function getSpec1(){
	
	$('#spec1window').jqxWindow('open');
	$('#spec1window').jqxWindow('focus');
	 spec1SearchContent('spec1Search.jsp', $('#spec1window'));
}

function getSpec2(){

	$('#spec2window').jqxWindow('open');
	$('#spec2window').jqxWindow('focus');
	 spec2SearchContent('spec2Search.jsp', $('#spec2window'));

}
function getSpec3(){

	$('#spec3window').jqxWindow('open');
	$('#spec3window').jqxWindow('focus');
	 spec3SearchContent('spec3Search.jsp', $('#spec3window'));

}
 
function getSuit(){
	
	 $('#suitsearchwindow').jqxWindow('open');
		$('#suitsearchwindow').jqxWindow('focus');
		suitSearchContent('suitSearch.jsp', $('#suitsearchwindow'));
}

function suitSearchContent(url) {
	  //alert(url);
	    $.get(url).done(function (data) {
	//alert(data);
	  $('#suitsearchwindow').jqxWindow('setContent', data);

	}); 
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

function spec1SearchContent(url) {
  //alert(url);
    $.get(url).done(function (data) {
//alert(data);
  $('#spec1window').jqxWindow('setContent', data);

}); 
}

function spec2SearchContent(url) {
	  //alert(url);
	    $.get(url).done(function (data) {
	//alert(data);
	  $('#spec2window').jqxWindow('setContent', data);

	}); 
	}
	
function spec3SearchContent(url) {
	  //alert(url);
	    $.get(url).done(function (data) {
	//alert(data);
	  $('#spec3window').jqxWindow('setContent', data);

	}); 
	}

 

function productSearchContent(url) {
	  //alert(url);
	    $.get(url).done(function (data) {
	//alert(data);
	  $('#productwindow').jqxWindow('setContent', data);

	}); 
	}



function funExportBtn(){
	   $("#partSearchgrid").jqxGrid('exportdata', 'xls', 'PartList');
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

function setsuitSearch(){
	var value=$('#suitsearchby').val().trim();
	//alert(value);
	if(value=="suit"){
		getSuit();
	}
	 if(value=="sbrand"){
		getPbrand(1);
	}
	else if(value=="smodel"){
		getPmodel(1);
	}
	else if(value=="submodel"){
		getSubmodel();
	}
	else if(value=="syom"){
		getYom();
	}
	else if(value=="spec1"){
		getSpec1();
	}
	else if(value=="spec2"){
		getSpec2();
	}
	else if(value=="spec3"){
		getSpec3();
	}
	else{
		
	}
}


function funreload(event)
{

	  var cal="";
 
	$('#gridtype').val(1);
	
	var suitvalue="";
	var prodvalue=$('#prodsearchby').val().trim();
	var type;
	
	/* if(suitvalue!=""){
		type="1";
	}
	if(prodvalue!=""){
		type="2";
	} */
	type="1";
	
	/* if(suitvalue=="" && prodvalue=="" ){
		$.messager.alert('Warning','Please Select a Category for Search');
		return false;
	} */
	
	var hidsbrand;
	var hidsmodel;
	var hidyom;
	var hidspec1;
	var hidspec2;
	var hidspec3;
	var branchid;
	var hidbrand;
	var hidtype;
	var hidproduct;
	var hidcat;
	var hidsubcat;
	
	 branchid=document.getElementById("cmbbranch").value;
	/* if(type=="1"){ */
		
	 hidsbrand=document.getElementById("hidsbrandid").value;
	 hidsmodel=document.getElementById("hidsmodelid").value;
	 hidsubmodel=document.getElementById("hidsubmodelid").value;
	 hidyom=document.getElementById("hidyomid").value;
	 hidspec1=document.getElementById("hidspec1id").value;
	 hidspec2=document.getElementById("hidspec2id").value;
	 hidspec3=document.getElementById("hidspec3id").value;
	
	 /* if(hidsubmodel!=""){
		 
	 if(hidsbrand==""){
		 $.messager.alert('Message','Select Brand','warning');
		 
		 return 0;
	 }
	 if(hidsmodel==""){
		 $.messager.alert('Message','Select Model','warning');
		 return 0;
	 }
	 
	 }
	 
	 if(hidsmodel!=""){
		 if(hidsbrand==""){
			 $.messager.alert('Message','Select Brand','warning');
			 
			 return 0;
		 }
	 } */
	
	 
	 
	/* }
	
	if(type=="2"){ */
		
		 hidbrand=document.getElementById("hidbrandid").value;
		 hidtype=document.getElementById("hidtypeid").value;
		 hidproduct=document.getElementById("hidproductid").value;
		 hidcat=document.getElementById("hidcatid").value;
		 hidsubcat=document.getElementById("hidsubcatid").value;
		 hidept=document.getElementById("hideptid").value;
		 
		 
		 
var brandid1=document.getElementById("brandid").value;
var modelid1=document.getElementById("modelid").value;
var submodelid1=document.getElementById("submodelid").value;

var spec1id1=document.getElementById("spec1id").value;
var spec2id1=document.getElementById("spec2id").value;
var spec3id1=document.getElementById("spec3id").value;

var yomfrm=document.getElementById("yomfrm").value;
var yomto=document.getElementById("yomto").value;


 

		
	 /* } */
var gen="0";
if($("#gen").prop('checked') == true){
	gen=1
 
}
 

	 
	 $("#overlay, #PleaseWait").show();
		var load="load";
	$("#partSearchdiv").load("partSearchGrid.jsp?type="+type+"&hidsbrand="+hidsbrand+"&hidsmodel="+hidsmodel+"&hidyom="+hidyom+"&hidspec1="
			+hidspec1+"&hidspec2="+hidspec2+"&hidspec3="+hidspec3+"&hidbrand="+hidbrand+"&hidtype="+hidtype+"&hidcat="+hidcat+"&hidsubcat="+hidsubcat
			+"&hidproduct="+hidproduct+"&branchid="+branchid+"&hidept="+hidept+"&hidsubmodel="+hidsubmodel+"&gridtype="
			+document.getElementById("gridtype").value+"&cal="+cal+"&load="+load	 
			+"&brandid1="+brandid1+"&modelid1="+modelid1+"&submodelid1="+submodelid1+"&spec1id1="+spec1id1+"&spec2id1="+spec2id1+"&spec3id1="+spec3id1+"&yomfrm="+yomfrm+"&yomto="+yomto+"&gen="+gen);	
	
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
	 
	 
	 
		 document.getElementById("yomfrm").value="";
 		 document.getElementById("yomto").value="";
 		 document.getElementById("yomfrmid").value="";
 		 document.getElementById("yomtoid").value="";
 		 
 		 document.getElementById("brandid").value="";
 		 document.getElementById("brand").value="";
 		 
 		 document.getElementById("model").value="";
 		 document.getElementById("modelid").value="";
 		 
		 document.getElementById("submodel").value="";
 		 document.getElementById("submodelid").value="";
 		 
 		 
 		 document.getElementById("bedsize").value="";
 		 document.getElementById("spec1id").value="";
 		 
		 document.getElementById("enginsize").value="";
 		 document.getElementById("spec2id").value="";
 		 
 		document.getElementById("cabinsize").value="";
		 document.getElementById("spec3id").value="";
		  
 
 		 
  
	
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


function funreload1()
{
	 $("#overlay, #PleaseWait").show();
		var load="load";
		
		
		
		$("#suitdiv").load("suitSearch.jsp?load="+load);	
		
	
	}
	
	
	
function funCalculate ()
{
	
	
	  if($('#gridtype').val()=="1")
		{
		//  $('#partSearchgrid').jqxGrid('showcolumn', 'stkqty');

	  var cal="cal";
	  
		$('#gridtype').val(1);
		
		var suitvalue="";
		var prodvalue=$('#prodsearchby').val().trim();
		var type;
		
 
		type="1";
		
	 
		
		var hidsbrand;
		var hidsmodel;
		var hidyom;
		var hidspec1;
		var hidspec2;
		var hidspec3;
		var branchid;
		var hidbrand;
		var hidtype;
		var hidproduct;
		var hidcat;
		var hidsubcat;
		
		 branchid=document.getElementById("cmbbranch").value;
 
			
		 hidsbrand=document.getElementById("hidsbrandid").value;
		 hidsmodel=document.getElementById("hidsmodelid").value;
		 hidsubmodel=document.getElementById("hidsubmodelid").value;
		 hidyom=document.getElementById("hidyomid").value;
		 hidspec1=document.getElementById("hidspec1id").value;
		 hidspec2=document.getElementById("hidspec2id").value;
		 hidspec3=document.getElementById("hidspec3id").value;
 
			
			 hidbrand=document.getElementById("hidbrandid").value;
			 hidtype=document.getElementById("hidtypeid").value;
			 hidproduct=document.getElementById("hidproductid").value;
			 hidcat=document.getElementById("hidcatid").value;
			 hidsubcat=document.getElementById("hidsubcatid").value;
			 hidept=document.getElementById("hideptid").value;
			
			 
			 var brandid1=document.getElementById("brandid").value;
			 var modelid1=document.getElementById("modelid").value;
			 var submodelid1=document.getElementById("submodelid").value;
			 var yomid1=document.getElementById("yomid").value;
			 var spec1id1=document.getElementById("spec1id").value;
			 var spec2id1=document.getElementById("spec2id").value;
			 var spec3id1=document.getElementById("spec3id").value;


			 var yomfrm=document.getElementById("yomfrm").value;
			 var yomto=document.getElementById("yomto").value;


			  	
			 	 /* } */

			 var gen="0";
			 if($("#gen").prop('checked') == true){
			 	gen=1
			  
			 }
			   
			 	 
			 	 $("#overlay, #PleaseWait").show();
			 		var load="load";
			 	$("#partSearchdiv").load("partSearchGrid.jsp?type="+type+"&hidsbrand="+hidsbrand+"&hidsmodel="+hidsmodel+"&hidyom="+hidyom+"&hidspec1="
			 			+hidspec1+"&hidspec2="+hidspec2+"&hidspec3="+hidspec3+"&hidbrand="+hidbrand+"&hidtype="+hidtype+"&hidcat="
			 			+hidcat+"&hidsubcat="+hidsubcat+"&hidproduct="+hidproduct+"&branchid="+branchid+"&hidept="+hidept+"&hidsubmodel="+hidsubmodel
			 			+"&gridtype="+document.getElementById("gridtype").value+"&cal="+cal+"&load="+load
			 			+"&brandid1="+brandid1+"&modelid1="+modelid1+"&submodelid1="+submodelid1+"&spec1id1="+spec1id1+
			 			"&spec2id1="+spec2id1+"&spec3id1="+spec3id1+"&yomfrm="+yomfrm+"&yomto="+yomto+"&gen="+gen);	
			 	
		 
/* 		 $("#overlay, #PleaseWait").show();
			var load="load";
			
			
			
		$("#partSearchdiv").load("partSearchGrid.jsp?type="+type+"&hidsbrand="+hidsbrand+"&hidsmodel="+hidsmodel+"&hidyom="+hidyom+"&hidspec1="+hidspec1+"&hidspec2="+hidspec2+"&hidspec3="+hidspec3+"&hidbrand="+hidbrand+"&hidtype="+hidtype+"&hidcat="+hidcat+"&hidsubcat="+hidsubcat+"&hidproduct="+hidproduct+"&branchid="+branchid+"&hidept="+hidept+"&hidsubmodel="+hidsubmodel+"&gridtype="+document.getElementById("gridtype").value+"&cal="+cal+"&load="+load);	
		 */
 
		}
	else if($('#gridtype').val()=="2")
		{
		 //$('#partSearchgrid').jqxGrid('showcolumn', 'stkqty');

		  var cal="cal"; 
		 funUpdate(cal);
		}
	     
}
	   

	 function ajaxcall(list){
		 var branch=document.getElementById("cmbbranch").value;
 
		 	
		 	var x=new XMLHttpRequest();
		 	x.onreadystatechange=function(){
		 		if (x.readyState==4 && x.status==200)
		 			{
		 			 var items= x.responseText.trim();
		  
		 
		 		    items = items.split('###');
		 		    
		 		    
			           var temp1=items[0];
			           var temp2=items[1];
			          
 	       
			           if(temp1.indexOf(",")>=0){
			    
			 
			        	 
				            for ( var j = 0; j < temp1.length; j++) {
				            	
				             
				            var	test=temp1.split(",");
				            var test2=temp2.split(",");
				      
				         
				            	var rows = $("#partSearchgrid").jqxGrid('getrows');
				    		 
				    			 
				    		   for(var i=0 ; i < rows.length ; i++){
				    			   
				    			   if(parseInt(test[j])==parseInt(rows[i].doc_no)){
				    			   
				                
				    			   $('#partSearchgrid').jqxGrid('setcellvalue', i, "stkqty" ,test2[j]);
				    			   }
				    			   
				    		   }
				    	 
				            	
				            }
				            	
				           } 
			           
			           
		 			    
		 			}
		 		  //type,description,remarks,lbrcost,partscost,total
		 	}
		 	 x.open("GET","stockqty.jsp?list="+list+"&branch="+branch,true);
				x.send();
			        
		 }

	   
	   
	   
	   
		function hidebranch()
		{
			
			 
 
			  $("#branchdiv").hide();
			  $("#branchlabel").hide();
			 
		}
		
	
</script>
</head>
<body onload="getBranch();">
<div id="mainBG" class="homeContent" data-type="background"> 
<div class='hidden-scrollbar'>
 
<table width="100%">
<tr>
<td width="23%" align="center">
    <fieldset style="background: #ECF8E0;">
	<table width="100%">
	<jsp:include page="../../heading.jsp"></jsp:include>
	
    <!--   <tr>
       <td colspan="2">
       &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="radio" id="rdall" name="rdo" value="rdall"><label for="rdall" class="branch">All</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
       <input type="radio" id="rdsummary" name="rdo" value="rdsummary"><label for="rdsummary" class="branch">Summary</label></td>
       </tr>
    
 <tr><td colspan="2" align="center"><button type="button" id="btnsearch" name="btnsearch" onClick="getSuit();" class="myButton">Suitability Main Search</button></td></tr>	
	 -->
	 <tr><td><input type="hidden" id="gridtype"></td></tr>
<%-- 	<tr>
	  <td width="24%" align="right"><label class="branch">Suitability</label></td>
	  <td width="76%"  align="left"><select name="suitsearchby" id="suitsearchby" style="width:52%;">
<option value="">--Select--</option>
	 
     <option value="sbrand">BRAND</option>
    <option value="smodel">MODEL</option>
    <option value="submodel">SUB MODEL</option>
    <option value="syom">YOM</option>
    <option value="spec1">BEDSIZE</option>
     <option value="spec2">ENGINESIZE</option>
      <option value="spec3">CABINSIZE</option>
    </select>&nbsp;&nbsp;<button type="button" name="btnadditem" id="additem" class="myButtons" onClick="setsuitSearch();">+</button>&nbsp;&nbsp;<button  type="button" name="btnremoveitem" id="btnremoveitem" class="myButtons" onclick="setRemove();">-</button></td>
	  </tr> --%>
<tr><td colspan="2" align="center"><input type="checkbox" id="gen" value="1" ><label class="branch">General</label> </td></tr>
	   <tr><td   colspan="2" > 
 	   <table width="100%" >
 	   
 	  <!--   <tr> <td  align="right"  width="27%"><label class="branch"> YOM</label></td>  <td  width="73%"> <input type="text"   id="yom" style="width: 100%;height:20PX;"  style="width: 75%;"  placeholder="Press F3 for Search" readonly="readonly" onKeyDown="getyom(event);" > </td></tr> -->
	 
	 <tr> <td    align="right"><label class="branch">YOM(From)</label></td><td > 
 <input type="text" name="yomfrm"  id="yomfrm" placeholder="Press F3 for Search"  style="width: 100%;height:20PX;"   readonly onKeyDown="getYom(event,'frm');" value='<s:property value="yomfrm"/>'></td>
<!--  </tr><tr><td   align="right"> <label class="branch">YOM(To)</label></td> -->
<!--  <td  > --><input type="hidden" name="yomto"    onKeyDown="getYom(event,'to');"  style="width: 100%;height:20PX;"    readonly="readonly" placeholder="Press F3 for Search" id="yomto" value='<s:property value="yomto"/>'><!--  </td> -->
	 
	 <tr> <td  align="right" width="27%"><label class="branch">BRAND </label></td>  <td width="73%">  <input type="text" id="brand" style="width: 100%;height:20PX;"  style="width: 75%;"  placeholder="Press F3 for Search" readonly="readonly" onKeyDown="getbrand(event);" > </td></tr>
  
	  <tr> <td  align="right" ><label class="branch">MODEL</label> </td>  <td>  <input type="text" id="model" style="width: 100%;height:20PX;"  style="width: 75%;"  placeholder="Press F3 for Search" readonly="readonly" onKeyDown="getmodel(event);" > </td></tr>
	  <tr> <td  align="right"  ><label class="branch">SUB MODEL</label></td>  <td> <input type="text" id="submodel" style="width: 100%;height:20PX;"  style="width: 75%;"  placeholder="Press F3 for Search" readonly="readonly" onKeyDown="getsubmodel(event);"> </td></tr>      
	  
	   <tr> <td  align="right"  ><label class="branch">ENGINE SIZE</label>  </td>  <td> <input type="text" id="enginsize" style="width: 100%;height:20PX;"  style="width: 75%;"  placeholder="Press F3 for Search" readonly="readonly" onKeyDown="geteng(event);" > </td></tr>
	    <tr> <td  align="right"  ><label class="branch">CABIN SIZE</label>  </td>  <td> <input type="text" id="cabinsize" style="width: 100%;height:20PX;"  style="width: 75%;"  placeholder="Press F3 for Search" readonly="readonly" onKeyDown="getcab(event);"> </td></tr>
	  	
	  <tr> <td  align="right"  ><label class="branch"> BED SIZE</label> </td>  <td> <input type="text" id="bedsize" style="width: 100%;height:20PX;"  style="width: 75%;"  placeholder="Press F3 for Search" readonly="readonly" onKeyDown="getbed(event);" > </td></tr>
	
	  
	  </table> 
 
	     </td></tr> 
	   
      <tr >
	  <td align="right"><label class="branch">PRODUCT</label></td>
	  <td  align="left"><select name="prodsearchby" id="prodsearchby" style="width:52%;"> 
    <option value="">--Select--</option>
    <option value="ptype">TYPE</option>
    <option value="pbrand">BRAND</option>
    <option value="pdept">DEPARTMENT</option>
    <option value="pcategory">CATEGORY</option>
    <option value="psubcategory">SUB CATEGORY</option>
    <option value="product">PRODUCT</option>
    </select>&nbsp;&nbsp;<button type="button" name="btnadditem" id="additem" class="myButtons" onClick="setprodSearch();">+</button>&nbsp;&nbsp;<button  type="button" name="btnremoveitem" id="btnremoveitem" class="myButtons" onclick="setRemove();">-</button></td>
	  </tr>
	<tr >
	  <td colspan="2"
      align="right" ><textarea id="searchdetails" name="searchdetails" style="resize:none;font: 10px Tahoma;width:100%;" rows="15"  readonly></textarea></td>
	  </tr>
	<tr >
	<td colspan="2" style="border-top:2px solid #DCDDDE;"><center><input type="button" name="btnclear" id="btnclear" value="Clear" class="myButtons" onclick="funClearData();"></center>
    </td>
	</tr>
		
	</table>
	</fieldset>
</td>
<td width="77%">
	<table width="100%">
		<tr>
		<td>		<div id="partSearchdiv"><jsp:include page="partSearchGrid.jsp"></jsp:include></div>
			 
			 <input type="hidden" name="mode" id="mode" value='<s:property value="mode"/>'>
			  <input type="hidden" name="msg" id="msg" value='<s:property value="msg"/>'>
			  
			  
			  
			  		<!-- 	   brand   -->  <input type="hidden" name="brandid" id="brandid"> 
			 <!--       model  -->  <input type="hidden" name="modelid" id="modelid">
			  	<!--  submodel  -->  <input type="hidden" name="submodelid" id="submodelid"> 
			  			  
			  			  			  <input type="hidden" name="yomid" id="yomid">
		 <!--  spec1   --> <input type="hidden" name="spec1id" id="spec1id">
			  <!-- spec2 --> <input type="hidden" name="spec2id" id="spec2id">
		 <!--   spec3   --> <input type="hidden" name="spec3id" id="spec3id">
 
			  
			  
			  
 			  
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
			 	<input type="hidden" id="yomfrmid" name="yomfrmid"  
				value='<s:property value="yomfrmid"/>' />	
				
				<input type="hidden" id="yomtoid" name="yomtoid"
				value='<s:property value="yomtoid"/>' />	
			 </td>
			  
		</tr>
	</table>
</tr>
</table>
<div id="ptypewindow">
<div></div>
</div>
<div id="brandwindow">
<div></div>
</div>
<div id="modelwindow">
<div></div>
</div>
<div id="submodelwindow">
<div></div>
</div>
<div id="productwindow">
<div></div>
</div>
<div id="pcategorywindow">
<div></div>
</div>
<div id="pdeptwindow">
<div></div>
</div>
<div id="psubcategorywindow">
<div></div>
</div>
<div id="yomwindow">
<div></div>
</div>

<div id="spec1window">
<div></div>
</div>
<div id="spec2window">
<div></div>
</div>
<div id="spec3window">
<div></div>
</div>
<div id="suitsearchwindow">
			<div></div>
			<div></div>
		</div>
		<div id="yomsearchwindow">
			<div></div>
		</div>
</div>
</div>
</body>

</html>