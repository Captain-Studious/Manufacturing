<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<html>
<% String contextPath=request.getContextPath();%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>GatewayERP(i)</title>
<jsp:include page="../../../includeso.jsp"></jsp:include>
<%-- <script type="text/javascript" src="<%=contextPath%>/js/ajaxfileupload.js"></script> --%>

<jsp:include page="tab.css"/>
<%@ include file="tab.jsp" %> 

<script type="text/javascript">
$(document).ready(function () {
	/* Date */
	getSecType();
	// document.getElementById("qualitypercent").value=="100";
	// $('#qualitypercent').val(100);
    $("#date").jqxDateTimeInput({ width: '160px', height: '15px', formatString:"dd.MM.yyyy"});
    $('#productDetailsWindow').jqxWindow({width: '58%', height: '58%',  maxHeight: '70%' ,maxWidth: '50%' , title: 'Product Search',position: { x: 420, y: 87 } , theme: 'energyblue', showCloseButton: true, keyboardCloseKey: 27});
 	$('#productDetailsWindow').jqxWindow('close');	
 	$('#processwindow').jqxWindow({width: '58%', height: '58%',  maxHeight: '70%' ,maxWidth: '58%' , title: 'Process Search',position: { x: 420, y: 87 } , theme: 'energyblue', showCloseButton: true, keyboardCloseKey: 27});
 	$('#processwindow').jqxWindow('close'); 
 	$('#testwindow').jqxWindow({width: '58%', height: '58%',  maxHeight: '70%' ,maxWidth: '58%' , title: 'Test Search',position: { x: 420, y: 87 } , theme: 'energyblue', showCloseButton: true, keyboardCloseKey: 27});
 	$('#testwindow').jqxWindow('close'); 
 	$('#machinewindow').jqxWindow({width: '58%', height: '58%',  maxHeight: '70%' ,maxWidth: '58%' , title: 'Machinery Search',position: { x: 420, y: 87 } , theme: 'energyblue', showCloseButton: true, keyboardCloseKey: 27});
 	$('#machinewindow').jqxWindow('close'); 
 	$('#unitsearchwindow').jqxWindow({
		width : '25%',
		height : '58%',
		maxHeight : '70%',
		maxWidth : '45%',
		title : 'Unit Search',
		position : {
			x : 420,
			y : 87
		},
		theme : 'energyblue',
		showCloseButton : true,
		keyboardCloseKey : 27
	});
	$('#unitsearchwindow').jqxWindow('close');
 	/* document.getElementById("formdet").innerText="Product Details(PRDT)";
	document.getElementById("formdetail").value="Product Details";
	document.getElementById("formdetailcode").value="PRDT";
	window.parent.formCode.value="PRDT";
	window.parent.formName.value="Product Details"; */
 		
 	$('#productcode').dblclick(function(){
		 productSearchContent('../../productsearch/productSearch.jsp?frm=PRDT&ldk=2');			
 	});
 	$('#uom').dblclick(function(){
		 
		unitFormSearchContent('unitFormSearchGrid.jsp');  
	}); 
}); 
    
    function getProduct(event){
    	if(document.getElementById("mode").value=="A" || document.getElementById("mode").value=="E"){
    		var x= event.keyCode;
	        if(x==114){
	        	productSearchContent('../../productsearch/productSearch.jsp?frm=PRDT&ldk=2');
	        }
    	}
    }
 	function productSearchContent(url) {
		$('#productDetailsWindow').jqxWindow('open');
		$.get(url).done(function (data) {
			$('#productDetailsWindow').jqxWindow('setContent', data);
			$('#productDetailsWindow').jqxWindow('bringToFront');
		}); 
	}
	
	function processSearchContent(url) {
		$('#processwindow').jqxWindow('open');
		$.get(url).done(function (data) {
			$('#processwindow').jqxWindow('setContent', data);
			$('#processwindow').jqxWindow('bringToFront');
		}); 
	}
	
	function testSearchContent(url) {
		$('#testwindow').jqxWindow('open');
		$.get(url).done(function (data) {
			$('#testwindow').jqxWindow('setContent', data);
			$('#testwindow').jqxWindow('bringToFront');
		}); 
	}
	
	function machineSearchContent(url) {
		$('#machinewindow').jqxWindow('open');
		$.get(url).done(function (data) {
			$('#machinewindow').jqxWindow('setContent', data);
			$('#machinewindow').jqxWindow('bringToFront');
		}); 
	}
	 function funReadOnly(){
		  
		    
			$('#frmProductDetails input').attr('readonly', true );
		$('#frmProductDetails select').attr('disabled', true);
			$('#date').jqxDateTimeInput({disabled: true});
			$("#rawmaterialsGrid").jqxGrid({ disabled: true});
			$("#packmaterialsGrid").jqxGrid({ disabled: true});
			$('#date').jqxDateTimeInput({ disabled: true});
			$("#processGrid").jqxGrid({ disabled: true});
			$("#qualityGrid").jqxGrid({ disabled: true});
			$("#inprocessGrid").jqxGrid({ disabled: true});
			$('#docno,#productcode,#productname').attr('readonly', true);
	 }
	 
	 function funRemoveReadOnly(){
		 getSecType();
			$('#frmProductDetails input').attr('readonly', false );
			$('#frmProductDetails select').attr('disabled', false);
			$('#date').jqxDateTimeInput({disabled: false});
			$('#docno,#productcode,#productname').attr('readonly', false);
			$("#rawmaterialsGrid").jqxGrid({ disabled: false});
			$("#packmaterialsGrid").jqxGrid({ disabled: false});
			$("#processGrid").jqxGrid({ disabled: false});
			$("#qualityGrid").jqxGrid({ disabled: false});
			$("#inprocessGrid").jqxGrid({ disabled: false});
			$('#txtkg').attr('readonly', true );
			$('#density').attr('readonly', true );
			if ($("#mode").val() == "A") {
					
					$('#date').val(new Date());
					$("#rawmaterialsGrid").jqxGrid('clear'); 
					$("#rawmaterialsGrid").jqxGrid('addrow', null, {});
					$("#packmaterialsGrid").jqxGrid('clear'); 
					$("#packmaterialsGrid").jqxGrid('addrow', null, {});
					$("#processGrid").jqxGrid('clear'); 
					$("#processGrid").jqxGrid('addrow', null, {});
					$("#qualityGrid").jqxGrid('clear'); 
					$("#qualityGrid").jqxGrid('addrow', null, {});
					$("#inprocessGrid").jqxGrid('clear'); 
					$("#inprocessGrid").jqxGrid('addrow', null, {});
					setChkActiveProcess();
					$('#labour,#overhead,#others').val(0);
					$('#qualitypercent').val(100);
			}
			
			if ($("#mode").val() == "E") {
				$("#rawmaterialsGrid").jqxGrid('addrow', null, {});
				$("#packmaterialsGrid").jqxGrid('addrow', null, {});
				$("#processGrid").jqxGrid('addrow', null, {});
				$("#qualityGrid").jqxGrid('addrow', null, {});
				$("#inprocessGrid").jqxGrid('addrow', null, {});
				// getSecType();
				//alert("sectype==="+$('#hidsectype').val());
				 var qper=$('#qualitypercent').val();
				
				if(qper==""){
					// alert("qper=="+qper);
					$('#qualitypercent').val(100);
				}
			}
	 }
	function funNotify(){	
		
		if(document.getElementById("productcode").value==""){
			document.getElementById("errormsg").innerText="";
			document.getElementById("errormsg").innerText="Product is mandatory";
			document.getElementById("productcode").focus();
			return 0;
		}
		var rows=$('#rawmaterialsGrid').jqxGrid('getrows');
		var validgridcounter=0;
		for(var i=0 ; i < rows.length ; i++){
			var psrno=rows[i].psrno;
			var notes=rows[i].note;
			if(notes=="undefined"){
				//alert("in undefined");
				notes="";
			}
			if(psrno!="" && psrno!="undefined" && psrno!=null && typeof(psrno)!="undefined"){
				newTextBox = $(document.createElement("input"))
	    		.attr("type", "dil")
	    		.attr("id", "rawmaterialarray"+i)
	    		.attr("name", "rawmaterialarray"+i)
	    		.attr("hidden", "true");
			
				newTextBox.val(rows[i].psrno+" :: "+rows[i].qtyltr+" :: "+rows[i].uomid+" :: "+rows[i].std+" :: "+rows[i].processid+" :: "+notes+" :: "+rows[i].rowno+" :: "+rows[i].density+" :: "+rows[i].qtykg);		
				newTextBox.appendTo('form');	
				validgridcounter++;
			}
			
		}
		$('#rawmaterialgridlength').val(validgridcounter);
		
		rows=$('#packmaterialsGrid').jqxGrid('getrows');
		validgridcounter=0;
		for(var i=0 ; i < rows.length ; i++){
			var psrno=rows[i].psrno;
			if(psrno!="" && psrno!="undefined" && psrno!=null && typeof(psrno)!="undefined"){
				newTextBox = $(document.createElement("input"))
		    		.attr("type", "dil")
		    		.attr("id", "packingmaterialarray"+i)
		    		.attr("name", "packingmaterialarray"+i)
		    		.attr("hidden", "true");
				
				newTextBox.val(rows[i].psrno+" :: "+rows[i].psize+" :: "+rows[i].uomid+" :: "+rows[i].rowno);		
				newTextBox.appendTo('form');
				validgridcounter++;
			}
		}
		
		$('#packingmaterialgridlength').val(validgridcounter);
		
		rows=$('#processGrid').jqxGrid('getrows');
		validgridcounter=0;
		for(var i=0 ; i < rows.length ; i++){
			var processid=rows[i].processid;
			if(processid!="" && processid!="undefined" && processid!=null && typeof(processid)!="undefined"){
				newTextBox = $(document.createElement("input"))
		    		.attr("type", "dil")
		    		.attr("id", "processarray"+i)
		    		.attr("name", "processarray"+i)
		    		.attr("hidden", "true");
				
				newTextBox.val(rows[i].processid+" :: "+rows[i].machineid+" :: "+rows[i].rowno);		
				newTextBox.appendTo('form');
				validgridcounter++;
			}
		}
		
		$('#processgridlength').val(validgridcounter);
		
		rows=$('#qualityGrid').jqxGrid('getrows');
		validgridcounter=0;
		for(var i=0 ; i < rows.length ; i++){
			var testid=rows[i].testid;
			if(testid!="" && testid!="undefined" && testid!=null && typeof(testid)!="undefined"){
				newTextBox = $(document.createElement("input"))
		    		.attr("type", "dil")
		    		.attr("id", "qualityassurancearray"+i)
		    		.attr("name", "qualityassurancearray"+i)
		    		.attr("hidden", "true");
				
				newTextBox.val(rows[i].testid+" :: "+rows[i].tstmthd+" :: "+rows[i].limit+" :: "+rows[i].rowno);		
				newTextBox.appendTo('form');
				validgridcounter++;
			}
		}
		
		$('#qualityassurancegridlength').val(validgridcounter);
		
		rows=$('#inprocessGrid').jqxGrid('getrows');
		validgridcounter=0;
		for(var i=0 ; i < rows.length ; i++){
			var processid=rows[i].processid;
			if(processid!="" && processid!="undefined" && processid!=null && typeof(processid)!="undefined"){
				newTextBox = $(document.createElement("input"))
		    		.attr("type", "dil")
		    		.attr("id", "processqaarray"+i)
		    		.attr("name", "processqaarray"+i)
		    		.attr("hidden", "true");
				
				newTextBox.val(rows[i].processid+" :: "+rows[i].testid+" :: "+rows[i].testmethod+" :: "+rows[i].limit+" :: "+rows[i].rowno);		
				newTextBox.appendTo('form');
				validgridcounter++;
			}
		}
		
		$('#processqagridlength').val(validgridcounter);
		
		return 1;
	} 
	 
	 function funSearchLoad(){
			changeContent('masterSearch.jsp'); 
		 }
	 
	 function funFocus(){
	    	$('#date').jqxDateTimeInput('focus'); 	    		
	    }
	 
	 
	 
	 function setValues(){
		
	 	if($('#msg').val()!=""){
			$.messager.alert('Message',$('#msg').val());
		}
	 	//alert("sectype==="+$('#hidsectype').val());
	 	if($('#hidsectype').val()!=""){
	 		$('#sectype').val($('#hidsectype').val())
		}
	 	if(document.getElementById("hidchkactiveprocess").value=="1"){
    		document.getElementById("chkactiveprocess").checked=true;
    	}
    	else{
    		document.getElementById("chkactiveprocess").checked=false;
    	}
	 	var docs=$('#docno').val();
	 	//alert(docs);
		if(parseInt(docs)>0){
			var docno=document.getElementById("docno").value;
			//alert("inside");
        	$('#jqxRawMaterials').load('rawmaterials.jsp?docno='+docno+'&id=1');
			$('#jqxPackMaterials').load('packingmaterials.jsp?docno='+docno+'&id=1');
			$('#jqxProcess').load('process.jsp?docno='+docno+'&id=1');
			$('#jqxQualityAssurance').load('qualityassurance.jsp?docno='+docno+'&id=1');
			$('#jqxInProcess').load('inprocess.jsp?docno='+docno+'&id=1');
		}	 
		document.getElementById("formdet").innerText=$('#formdetail').val()+" ("+$('#formdetailcode').val().trim()+")";
		funSetlabel();
		if(document.getElementById("hidchkactiveprocess").value=="1"){
	 		document.getElementById("chkactiveprocess").checked=true;
	 	}
	 	else{
	 		document.getElementById("chkactiveprocess").checked=false;
	 	}
		}
	 
	 function funChkButton() {
			/* funReset(); */
		}
	 function getProdUnit(event){
	   	 var x= event.keyCode;
	   	 if(x==114){
	   		unitFormSearchContent('unitFormSearchGrid.jsp');  	 }
	    	 else{
	   		 }
	          	 }
	 function unitFormSearchContent(url) {
			$('#unitsearchwindow').jqxWindow('open');
			$.get(url).done(function(data) {
				$('#unitsearchwindow').jqxWindow('setContent', data);
				$('#unitsearchwindow').jqxWindow('bringToFront');
			});
		}
	 function setChkActiveProcess(){
	 	if(document.getElementById("chkactiveprocess").checked==true){
	 		document.getElementById("hidchkactiveprocess").value="1";
	 	}
	 	else{
	 		document.getElementById("hidchkactiveprocess").value="0";
	 	}
	 }
	  function isNumber(evt,id) {
		//Function to restrict characters and enter number only
			  var iKeyCode = (evt.which) ? evt.which : evt.keyCode
		        if (iKeyCode != 46 && iKeyCode > 31 && (iKeyCode < 48 || iKeyCode > 57))
		         {
		        	// $.messager.alert('Warning','Enter Numbers Only');
		           $("#"+id+"").focus();
		            return false;
		            
		         }
		        
		        return true;
		    }
	  
		function getSecType() {
			var x = new XMLHttpRequest();
			x.onreadystatechange = function() {
				if (x.readyState == 4 && x.status == 200) {
					items = x.responseText;
					items = items.split('###');
					var brandItems = items[0].split(",");
					var brandidItems = items[1].split(",");
					var optionsbrand = '<option value="">--Select--</option>';
					for (var i = 0; i < brandItems.length; i++) {
						optionsbrand += '<option value="' + brandidItems[i] + '">'
								+ brandItems[i] + '</option>';
						/* document.getElementById("brandid").value=brandidItems[i]; */
					}

					$("select#sectype").html(optionsbrand);
					$('#sectype').val($('#hidsectype').val());
				} else {
				}
			}
			x.open("GET", "getSecType.jsp", true);
			x.send();
		}
	  function funCalcDensity(){
		  var volume=$('#volume').val();
		  var density=$('#density').val();
		  var calcval=parseFloat(volume)*parseFloat(density);
		  var res=parseFloat(calcval).toFixed(4);
	    	 // alert("res==="+res);
	    	  var res1=(res=='NaN'?"0":res);
	    	  document.getElementById("txtkg").value=res1;
	   var rows=$('#rawmaterialsGrid').jqxGrid('getrows');
	   for(var i=0 ; i < rows.length ; i++){
			var chkval=rows[i].rmid;
			if(!chkval==""){
				var qty=$('#rawmaterialsGrid').jqxGrid('getcellvalue', i, "qty");
		    	var std=$('#rawmaterialsGrid').jqxGrid('getcellvalue', i, "std");
		    	var density=$('#rawmaterialsGrid').jqxGrid('getcellvalue', i, "density");
		    	var vol=document.getElementById("volume").value;
		    	var kg=document.getElementById("txtkg").value;
		    	var calc1=parseFloat(kg)*(parseFloat(std)/100);
		    	 var calcs=parseFloat(calc1)/parseFloat(density);
		    	 /*calcs=parseFloat(calcs).toFixed(2); */
		    	 
		    	$('#rawmaterialsGrid').jqxGrid('setcellvalue', i, "qtykg",calc1);
		    	$('#rawmaterialsGrid').jqxGrid('setcellvalue', i, "qtyltr",calcs);
			}
	   }
	   
	  }
	  function funRoundAmt4(){
	    	var chk=$('#density').val();
	    	  var res=parseFloat(chk).toFixed(4);
	    	  //alert("res==="+res);
	    	  var res1=(res=='NaN'?"0":res);
	    	  document.getElementById("density").value=res1;  
	    	 }  
</script>

<style>
.hidden-scrollbar {
  overflow: auto;
  height: 530px;
}
</style>

</head>
<body onload="setValues();">
<div id="mainBG" class="homeContent" data-type="background">
<form id="frmProductDetails" action="saveMProductDetails" method="post" autocomplete="off">
<jsp:include page="../../../header.jsp"></jsp:include><br/>   

<div class='hidden-scrollbar'>
<fieldset>
<table width="100%">
	<tr>
  		<td  width="70%">
  			<table width="100%">
  				<tr>
  					<td align="right" width="8%">Product</td>
					<td width="18%">
    					<input type="text" name="productcode" id="productcode" style="width:96%;" value='<s:property value="productcode"/>' onkeydown="getProduct(event);" readonly placeholder="Press F3 to Search">
      					<input type="hidden" id="psrno" name="psrno" value='<s:property value="psrno"/>'/>
      				</td>
   					<td width="20%"><input type="text" id="productname" name="productname" style="width:96%;" value='<s:property value="productname"/>'/></td>
   					<td width="15%"><input type="text" id="typename" name="typename" style="width:75%;" value='<s:property value="typename"/>'/></td>
   				</tr>
    			<tr>
  <td align="right">Method</td>
  <td colspan=3><input type="text"  style="width:93%;" id="method" name="method" value='<s:property value="method"/>'/></td>
  </tr>
  <tr>
  <td align="right">Tech. Note</td>
  <td  colspan=3><input type="text" id="technote" name="technote" rows="3" style="width:93%;" value='<s:property value="technote"/>'/></td>
  </tr>
 <tr>
 <td align="right">Safety Measure</td>
  <td colspan=3><input type="text"  style="width:93%;" id="safetymeasure" name="safetymeasure" value='<s:property value="safetymeasure"/>'/></td>
  </tr>
  
  
  </table>
  </td>
  <td  width="30%">
  <table width="100%">
  <tr>
   <td width="6%" align="right">Date</td>
    <td width="8%"><div id="date" name="date" value='<s:property value="date"/>'></div>
    <input type="hidden" id="hidjqxClientDate" name="hidjqxClientDate" value='<s:property value="hidjqxClientDate"/>'/></td>    
    <td width="5%" align="right">Doc No</td>
    <td width="10%">
    	<input type="text" id="vocno" name="vocno" style="width:80%;" tabindex="-1" value='<s:property value="vocno"/>'/>
    	<input type="hidden" id="docno" name="docno" style="width:80%;" tabindex="-1" value='<s:property value="docno"/>'/>
    </td></tr>
  <tr>
  
  <td align="right">Volume(In Ltrs)</td>
  <td><input type="text"  style="width:80%;" id="volume" onchange="funCalcDensity();" name="volume" onkeypress="javascript:return isNumber (event,id)" onblur="funRoundAmt(value,id);" value='<s:property value="volume"/>'/></td>
   <td align="right">Density</td>
  <td><input type="text"  style="width:80%;" id="density" name="density"  onchange="funRoundAmt4();" value='<s:property value="density"/>'/></td>
  </tr>
  <tr>
  <td align="right">UOM</td>
  <td>
  	<%-- <input type="text"  style="width:70%;" id="uom" name="uom" value='<s:property value="uom"/>'/> --%>
  
  	<input type="text" id="uom" name="uom" style="width: 80%;" placeholder="Press F3 for Search" readonly="true" onKeyDown="getProdUnit(event);" value='<s:property value="uom"/>' />
  		<input type="hidden"  style="width:70%;" id="uomid" name="uomid" value='<s:property value="uomid"/>'/>
  <td align="right">KG</td>
  <td><input type="text"  style="width:80%;readonly:true;"  id="txtkg" name="txtkg" value='<s:property value="txtkg"/>'/></td>
  </td>
  
  </tr>
  <tr>
  <td align="right">Quality%</td>
  <td><input type="text"  style="width:80%;" id="qualitypercent" name="qualitypercent" value='<s:property value="qualitypercent"/>'/></td>
  <td align="right">Dur/Hrs</td>
  <td><input type="text"  style="width:80%;" id="duration" name="duration" value='<s:property value="duration"/>'/></td>
  </tr>
 <tr>
 <td></td>
 <td align="center">Labour</td>
  <td align="center">Overhead</td>
  <td align="center">Others</td>
  </tr>
   <tr>
  <td align="right">Overhead</td>
  <td align="center"><input type="text"  style="width:70%;text-align:right;" id="labour" name="labour" value='<s:property value="labour"/>'  onkeypress="javascript:return isNumber (event,id)" onblur="funRoundAmt(value,id);"/></td>
  <td align="center"><input type="text"  style="width:80%;text-align:right;" id="overhead" name="overhead" value='<s:property value="overhead"/>'  onkeypress="javascript:return isNumber (event,id)" onblur="funRoundAmt(value,id);"/></td>
  <td align="center"><input type="text"  style="width:80%;text-align:right;" id="others" name="others" value='<s:property value="others"/>'  onkeypress="javascript:return isNumber (event,id)" onblur="funRoundAmt(value,id);"/></td>
  </tr>
  <tr>
  <td colspan=2><input type="checkbox" id="chkactiveprocess" name="chkactiveprocess" onchange="setChkActiveProcess();"><label id="lblchkactiveprocess" for="chkactiveprocess">Active Process</label>
  <input type="hidden" id="hidchkactiveprocess" name="hidchkactiveprocess" value='<s:property value="hidchkactiveprocess"/>'/></td>
  <td align="right" id="secname">Section</td>
<td><select  name="sectype" id="sectype"  value='<s:property value="sectype"/>' style="width:90%;"></select>
<input type="hidden" id="hidsectype" name="hidsectype" value='<s:property value="hidsectype"/>' />
</td>
  </tr>
  </table>
  </td>
  </tr>
  </table>
</fieldset>
<br/>

	<ul id="tabs">
    	<li><a href="#" name="tab1">Raw Materials</a></li>
    	<li><a href="#" name="tab2">Packing Materials</a></li>
   		<li><a href="#" name="tab3">Process</a></li>
     	<li><a href="#" name="tab4">Quality Assurance</a></li>
     	<li><a href="#" name="tab5">In Process Q.A</a></li> 
    </ul>
    
<div id="content">
<div id="tab1">
<div style="width:100%;">
 <div id="jqxRawMaterials"> <jsp:include page="rawmaterials.jsp"></jsp:include></div><br/>

</div>
</div>

<div id="tab2">
<div style="width:100%;">
 <div id="jqxPackMaterials"> <jsp:include page="packingmaterials.jsp"></jsp:include></div><br/>
</div>
</div>
 <div id="tab3">
<div style="width:100%;">
 <div id="jqxProcess"> <jsp:include page="process.jsp"></jsp:include></div><br/>
</div>
</div>
<div id="tab4">
<div style="width:100%;">
 <div id="jqxQualityAssurance"> <jsp:include page="qualityassurance.jsp"></jsp:include></div><br/>
</div>
</div>
<div id="tab5">
<div style="width:100%;">
 <div id="jqxInProcess"> <jsp:include page="inprocess.jsp"></jsp:include></div><br/>
</div>
</div>
</div> 

<input type="hidden" id="mode" name="mode"/>
<input type="hidden" name="deleted" id="deleted" value='<s:property value="deleted"/>'/>
<input type="hidden" id="msg" name="msg"  value='<s:property value="msg"/>'/>
<input type="hidden" id="rawmaterialgridlength" name="rawmaterialgridlength"  value='<s:property value="rawmaterialgridlength"/>'/>
<input type="hidden" id="packingmaterialgridlength" name="packingmaterialgridlength"  value='<s:property value="packingmaterialgridlength"/>'/>
<input type="hidden" id="processgridlength" name="processgridlength"  value='<s:property value="processgridlength"/>'/>
<input type="hidden" id="qualityassurancegridlength" name="qualityassurancegridlength" value='<s:property value="qualityassurancegridlength"/>'/>
<input type="hidden" id="processqagridlength" name="processqagridlength" value='<s:property value="processqagridlength"/>'/>
<input type="hidden" id="txtmobilevalidation" name="txtmobilevalidation" value='<s:property value="txtmobilevalidation"/>'/>
<input type="hidden" id="txtcategoryvalidation" name="txtcategoryvalidation" value='<s:property value="txtcategoryvalidation"/>'/>
<input type="hidden" id="txtcategorywiseedit" name="txtcategorywiseedit" value='<s:property value="txtcategorywiseedit"/>'/>
<input type="hidden" id="gridlength" name="gridlength"/>
<input type="hidden" id="referencelength" name="referencelength"/>
<input type="hidden" id="attachlength" name="attachlength"/>
<input type="hidden" id="creditcardlength" name="creditcardlength"/>
<input type="hidden" id="separateservicechargelength" name="separateservicechargelength"/>
</div>
</form>
<div id="productDetailsWindow">
   <div></div>
</div>
<div id="processwindow">
   <div></div>
</div>
<div id="testwindow">
   <div></div>
</div>
<div id="machinewindow">
   <div></div>
</div>
<div id="stateWindow">
   <div></div>
</div>
<div id="unitsearchwindow">
			<div></div>
			<div></div>
		</div>
</div>
</body>
</html>
