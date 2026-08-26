<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
<% String contextPath=request.getContextPath();%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta charset="UTF-8">
<title>GatewayERP(i)</title>
<jsp:include page="../../../../includes.jsp"></jsp:include>

<script type="text/javascript">
     
	$(document).ready(function () {
	  	 /* Date */
	 	 $("#jqxVendorDate").jqxDateTimeInput({ width: '80%', height: '15px', formatString:"dd.MM.yyyy"});
		 $('#brandsearchwndow').jqxWindow({ width: '40%', height: '55%',  maxHeight: '62%' ,maxWidth: '60%' , title: 'Brand Search' ,position: { x: 200, y: 120 }, keyboardCloseKey: 27});
	     $('#brandsearchwndow').jqxWindow('close'); 
	     
	     $('#areainfowindow').jqxWindow({ width: '55%', height: '58%',  maxHeight: '85%' ,maxWidth: '80%' ,title: ' Area Search' , position: { x: 250, y: 60 }, keyboardCloseKey: 27});
   	  $('#areainfowindow').jqxWindow('close');
   	  $('#activityinfowindow').jqxWindow({ width: '20%', height: '58%',  maxHeight: '85%' ,maxWidth: '80%' ,title: 'Activity Search' , position: { x: 250, y: 60 }, keyboardCloseKey: 27});
   	  $('#activityinfowindow').jqxWindow('close');
    	$('#countryinfowindow').jqxWindow({ width: '20%', height: '58%',  maxHeight: '85%' ,maxWidth: '80%' ,title: ' Country Search' , position: { x: 250, y: 60 }, keyboardCloseKey: 27});
	  $('#countryinfowindow').jqxWindow('close');   
	     
		 getCurrencyIds();getCategory();getGroup();getType();
		 
		 
		 $('#txtcountry').dblclick(function(){
			 if($('#mode').val()!="view")
				 {
			  $('#countryinfowindow').jqxWindow('open');
			  countrySearchContent('country.jsp'); 
			  
				 } 
			  
			  });
		  
	});  
	
	
	
	function countrySearchContent(url) {
		 //alert(url);
	  	 $.get(url).done(function (data) {
				 //alert(data);
		$('#countryinfowindow').jqxWindow('setContent', data);

	                	}); 
	      	}
	
	
	
	function getcountry(event){
	  	 var x= event.keyCode;
	  	 if(x==114){
	  		 if($('#mode').val()!="view")
			 {
	  	  $('#countryinfowindow').jqxWindow('open');
	  
	     // $('#accountWindow').jqxWindow('focus');
	            countrySearchContent('country.jsp');  	 }
	  	 }
	   	 else{
	  		 }
	         	 }
	
	
	
	
	function getGroup() {
  		var x = new XMLHttpRequest();
  		x.onreadystatechange = function() {
  			if (x.readyState == 4 && x.status == 200) {
  				var items = x.responseText;
  				items = items.split('####');
  				var groupItems = items[0].split(",");
  				var groupIdItems = items[1].split(",");
  				var optionsgroup = '<option value="">--Select--</option>';
  				for (var i = 0; i < groupItems.length; i++) {
  					optionsgroup += '<option value="' + groupIdItems[i] + '">'
  							+ groupItems[i] + '</option>';
  				}
  				$("select#cmbaccgroup").html(optionsgroup);
  				if ($('#hidcmbaccgroup').val() != null) {
  					$('#cmbaccgroup').val($('#hidcmbaccgroup').val());
  				}
  			} else {
  			}
  		}
  		x.open("GET", "getGroup.jsp", true);
  		x.send();
  	} 
	
	function getCategory() {
  		var x = new XMLHttpRequest();
  		x.onreadystatechange = function() {
  			if (x.readyState == 4 && x.status == 200) {
  				var items = x.responseText;
  				items = items.split('####');
  				var categoryItems = items[0].split(",");
  				var categoryIdItems = items[1].split(",");
  				var optionscategory = '<option value="">--Select--</option>';
  				for (var i = 0; i < categoryItems.length; i++) {
  					optionscategory += '<option value="' + categoryIdItems[i] + '">'
  							+ categoryItems[i] + '</option>';
  				}
  				$("select#cmbcategory").html(optionscategory);
  				if ($('#hidcmbcategory').val() != null) {
					$('#cmbcategory').val($('#hidcmbcategory').val());
				}
  			} else {
  			}
  			
  		}
  		x.open("GET", "getCategory.jsp", true);
  		x.send();
  	}
    function brandinfoSearchContent(url) {
     	 //alert(url);
     		 $.get(url).done(function (data) {
     			 
     			 $('#brandsearchwndow').jqxWindow('open');
     		$('#brandsearchwndow').jqxWindow('setContent', data);
     
     	}); 
     	} 
	function getCategoryAccountGroup(a) {
  		var x = new XMLHttpRequest();
  		x.onreadystatechange = function() {
  			if (x.readyState == 4 && x.status == 200) {
  				var items = x.responseText.trim();
  			    $('#hidcmbaccgroup').val(items);
  				
  				if ($('#hidcmbaccgroup').val() != null || $('#hidcmbaccgroup').val() != "") {
  					$('#cmbaccgroup').val($('#hidcmbaccgroup').val());
  				}
  			} else {
  			}
  		}
  		x.open("GET", "getCategoryAccountGroup.jsp?category="+a, true);
  		x.send();
  	} 
	function getType() {
  		var x = new XMLHttpRequest();
  		x.onreadystatechange = function() {
  			if (x.readyState == 4 && x.status == 200) {
  				var items = x.responseText.trim();
  				 
  				items = items.split('####');
  			
  				
  				var typeItems = items[0].split(",");
  				var typeIdItems = items[1].split(",");
  				var optionstype ;
  				for (var i = 0; i < typeItems.length; i++) {
  					optionstype += '<option value="' + typeIdItems[i] + '">'
  							+ typeItems[i] + '</option>';
  				}
  				$("select#cmbtype").html(optionstype);
  				if ($('#hidcmbtype').val() != null) {
  					$('#cmbtype').val($('#hidcmbtype').val());
  				}
  			} else {
  			}
  		}
  		x.open("GET", "getType.jsp", true);
  		x.send();
  	}
	
	function getCurrencyIds(){
		var x=new XMLHttpRequest();
		x.onreadystatechange=function(){
		if (x.readyState==4 && x.status==200)
			{
			 	items= x.responseText;
			 	items=items.split('####');
		        var curidItems=items[0];
		        var curcodeItems=items[1];
		        var multiItems=items[2];
		        var optionscurr = '';
		        
		     if(curcodeItems.indexOf(",")>=0){
		        	var currencyid=curidItems.split(",");
		        	var currencycode=curcodeItems.split(",");
		        	multiItems.split(",");
		       
		       for ( var i = 0; i < currencycode.length; i++) {
		    	   optionscurr += '<option value="' + currencyid[i] + '">' + currencycode[i] + '</option>';
		        }
		      
		         $("select#cmbcurrency").html(optionscurr);
		         if ($('#hidcmbcurrency').val() != null && $('#hidcmbcurrency').val() != "") {
		       		 $('#cmbcurrency').val($('#hidcmbcurrency').val()) ;
		         } 
				     
			   }
		
		       else{
		    	   optionscurr += '<option value="' + curidItems + '"selected>' + curcodeItems + '</option>';
		    	   
			    	 $("select#cmbcurrency").html(optionscurr);
			       
			         if ($('#hidcmbcurrency').val() != null && $('#hidcmbcurrency').val() != "") {
			       		 $('#cmbcurrency').val($('#hidcmbcurrency').val()) ;
			         }
			      }
			}
	     }
	      x.open("GET", "getCurrencyId.jsp",true);
	     x.send();
	    
	   }
	   
	   function getVendorAlreadyExists(vendorname,docno,mode)
	   {
  				var x = new XMLHttpRequest();
  				x.onreadystatechange = function()
  				{
  						if (x.readyState == 4 && x.status == 200)
  						{
  							var items = x.responseText.trim();

  							if(parseInt(items)==1)
  							{
  									 document.getElementById("errormsg").innerText="Vendor Already Exists.";
  					 				 return 0;
  				 			}
  							else
  							{
  								 	$('#cmbaccgroup').attr('disabled', false);
  					
  								    var rows = $("#brandgrid").jqxGrid('getrows');
  				  				    $('#gridlenght').val(rows.length);
  				  					 //alert($('#gridlength').val());
  				 				    for(var i=0 ; i < rows.length ; i++)
  				 				    {
  				   				    		// var myvar = rows[i].tarif; 
  				       		 	   			 newTextBox = $(document.createElement("input"))
  				     			   			 .attr("type", "dil")
  				       						 .attr("id", "desctest"+i)
  				       					   	 .attr("name", "desctest"+i)
  				       				 		 .attr("hidden", "true"); 
  				   
  				  					 		newTextBox.val(rows[i].doc_no+"::"+rows[i].desc1+" :: ");
  				
  												//alert(newTextBox.val()); 
  				  							 newTextBox.appendTo('form');
  				    
  				   					}  			   
  				   
  				   
  				   
  							 		var rows = $("#vdrDetailsGrid").jqxGrid('getrows');
  			    			 		for(var i=0;i<rows.length;i++)
  			    					 {
  				   
  			   								var cpersion= $.trim(rows[i].cpersion);
  			   
  									 	 
  					
  					
  													newTextBox = $(document.createElement("input"))
  				      					   		 	.attr("type", "dil")
  				       								.attr("id", "test"+i)
  				         							.attr("name", "test"+i)
  				       								.attr("hidden", "true");
  				    
  					   
  					
  			  								 		newTextBox.val(rows[i].cpersion+"::"+rows[i].mobile+" :: "
  					  										 +rows[i].phone+" :: "+rows[i].extn+" :: "+rows[i].email+" :: "
  					  										 +rows[i].area+" :: "+rows[i].areaid+" :: "+rows[i].activity_id+"");
  			   
  			  								 		newTextBox.appendTo('form'); 
  			   
  			  
  											
  			   
  			  				 		}
  			  						 $('#vdrgridlength').val(rows.length);   
  					
  								  $("#frmVendorDetails").submit();
  				 		}
  			   
  					}
			}
			x.open("GET", "getVendorAlreadyExists.jsp?vendorname="+vendorname+"&docno="+docno+"&mode="+mode, true);
			x.send();
    }
	
	function getMobileNoAlreadyExists(mobileno,docno,mode){
  		var x = new XMLHttpRequest();
  		x.onreadystatechange = function() {
  			if (x.readyState == 4 && x.status == 200) {
  				var items = x.responseText.trim();

  				if(parseInt(items)==1){
  					 $.messager.alert('Message','Mobile No. Already Exists.','warning');
  					 return 0;
  				 }
  		}
	}
	x.open("GET", "getMobileNoAlreadyExists.jsp?mobileno="+mobileno+"&docno="+docno+"&mode="+mode, true);
	x.send();
	}
      
	 function funReadOnly(){
			$('#frmVendorDetails input').attr('readonly', true );
		    $('#frmVendorDetails select').attr('disabled', true); 
		    $('#formdetailcode').attr('disabled', false);
			$('#jqxVendorDate').jqxDateTimeInput({disabled: true});
			  $("#brandgrid").jqxGrid({ disabled: true}); 
			  $("#vdrDetailsGrid").jqxGrid({ disabled: true});
			  getType();

			  
	 }
	 function funRemoveReadOnly(){
		    getCurrencyIds();
			$('#frmVendorDetails input').attr('readonly', false );
			$('#frmVendorDetails select').attr('disabled', false); 
			$('#jqxVendorDate').jqxDateTimeInput({disabled: false});
			$('#txtaccount').attr('readonly', true);
			$('#txtcode').attr('readonly', true);
			$('#cmbaccgroup').attr('disabled', true);
			$('#docno').attr('readonly', true);
			$('#txtcountry').attr('readonly', true);
			  $("#brandgrid").jqxGrid({ disabled: false}); 
			  $("#vdrDetailsGrid").jqxGrid({ disabled: false}); 
			 
			  
      		//$("#vdrDetailsGrid").jqxGrid("addrow", null, {});
      	
      		


      		
			  
			  if($("#mode").val()=="A")
			     {
				  $('#jqxVendorDate').val(new Date());
				  $("#brandgrid").jqxGrid('clear');
				  $("#brandgrid").jqxGrid('addrow', null, {});
				  $("#vdrDetailsGrid").jqxGrid('clear');
				  $("#vdrDetailsGrid").jqxGrid('addrow', null, {});
			     }  
			
			
	 }
	 function funNotify(){	
		 
		 var taxtype=document.getElementById("cmbtype").value;
		 
		 
		 if(taxtype.trim()==''){
			 document.getElementById("errormsg").innerText="Type is Mandatory.";
			 return 0;
		 }
		 else
			 {
			 document.getElementById("errormsg").innerText="";
			 }
		 
		 if($('#cmbtype').find('option:selected').text()=='Registered'){
			 var registeredtrnno=document.getElementById("panno").value;
			 if(registeredtrnno.trim()==''){
				 document.getElementById("errormsg").innerText="TRN No. is Mandatory for Registered.";
				 return 0;
			 } 
			 else
				 {
				 document.getElementById("errormsg").innerText="";
				 }
		 }
		 
		 
		 vendorname=document.getElementById("txtvendorname").value;
		 docno=document.getElementById("docno").value;
		 mode=document.getElementById("mode").value;
		 getVendorAlreadyExists(vendorname,docno,mode);
		} 
	 
	 function funSearchLoad(){
			changeContent('vndMainSearch.jsp'); 
		 }
	 
	 function funFocus()
	    {
	    	$('#jqxVendorDate').jqxDateTimeInput('focus'); 	    		
	    }
	 
	 function setValues(){
		  var maindoc=document.getElementById("docno").value;
		  if(maindoc>0)
			  {
		 
	    var indexVal1 = document.getElementById("docno").value;
	   
	     
	    
	   $("#venderDetails").load('vendermaingrid.jsp?cldocno='+indexVal1);
		  
	  
			  }
		 
		 getCurrencyIds();
		 
		 if($('#hidjqxVendorDate').val()){
			 $("#jqxVendorDate").jqxDateTimeInput('val', $('#hidjqxVendorDate').val());
		  }
		 
		 if($('#msg').val()!=""){
			   $.messager.alert('Message',$('#msg').val());
			  }
		 
		 document.getElementById("formdet").innerText=$('#formdetail').val()+" ("+$('#formdetailcode').val().trim()+")";
		 funSetlabel();
		 
		 if(document.getElementById("docno").value>0)
			 {
		 	 var indexval1 = document.getElementById("docno").value;   
		 	
 	  		 $("#divbrand").load("brandgrid.jsp?rdocno="+indexval1); 
			 }
		 
		 
		}
	 
	 function funChkButton() {
			/* funReset(); */
		}
	 
	 /* Validations */
	 $(function(){
	        $('#frmVendorDetails').validate({
	                rules: {
	                txtvendorname:"required",
	                cmbcurrency:"required",
	                cmbcategory:"required",
	                cmbaccgroup:"required",
	                //txtmob: {"required":true,digits:true,maxlength:12,minlength:12},
	                 
	                 },
	                 messages: {
	                 txtvendorname:" *",
	                 cmbcurrency:" *",
	                 cmbcategory:" *",
	                 cmbaccgroup:" *",
	                 //txtmob: {required:" *",digits:" Invalid Mobile Number",maxlength:" Maximum 12 Digits",minlength:" Please Enter 12 Digits"},
	                 }
	        });});
	 
	 function funExcelBtn(){
		    var url=document.URL;
		    var reurl=url.split("suppliers");
		    top.addTab("VendorList",reurl[0]+"suppliers/vendorList.jsp");
		}
	 
	 
	 
		function typecheck() {
			 
			 document.getElementById("errormsg").innerText="";
			 }
		 
	      
</script>

<style>
.hidden-scrollbar {
  overflow: auto;
  height: 530px;
}
</style>

</head>
<body onload="setValues();getType();">
<div id="mainBG" class="homeContent" data-type="background">
<form id="frmVendorDetails" action="saveVendorDetails" method="post" autocomplete="off">
<jsp:include page="../../../../header.jsp"></jsp:include><br/>
   
<div class='hidden-scrollbar'>
<fieldset>
<table width="100%">
  <tr>
    <td width="3%" align="right">Date</td>
    <td width="10%"><div id="jqxVendorDate" name="jqxVendorDate" value='<s:property value="jqxVendorDate"/>'></div>
    <input type="hidden" id="hidjqxVendorDate" name="hidjqxVendorDate" value='<s:property value="hidjqxVendorDate"/>'/></td>
    <td width="4%" align="right">Code</td>
    <td width="4%"><input type="text" id="txtcode" name="txtcode" style="width:100%;" tabindex="-1" value='<s:property value="txtcode"/>'/></td>
    <td width="4%" align="right">Name</td>
    <td width="26%"><input type="text" id="txtvendorname" name="txtvendorname" style="width:100%;" value='<s:property value="txtvendorname"/>'/></td>
    <td width="6%" align="right">Currency</td>
    <td width="6%"><select id="cmbcurrency" name="cmbcurrency" style="width:80%;" value='<s:property value="cmbcurrency"/>'>
      <option value="">--Select--</option></select>
      <input type="hidden" id="hidcmbcurrency" name="hidcmbcurrency" value='<s:property value="hidcmbcurrency"/>'/></td>
    <td width="4%" align="right">Category</td>
    <td width="14%"><select id="cmbcategory" name="cmbcategory" style="width:100%;" onchange="getCategoryAccountGroup(this.value);" value='<s:property value="cmbcategory"/>'>
      <option value="">--Select--</option></select>
      <input type="hidden" id="hidcmbcategory" name="hidcmbcategory" value='<s:property value="hidcmbcategory"/>'/></td>
    <td width="5%" align="right">Doc No</td>
    <td width="14%"><input type="text" id="docno" name="txtvendordocno" style="width:75%;" tabindex="-1" value='<s:property value="txtvendordocno"/>'/></td>
  </tr>
</table>
</fieldset><br/>

<fieldset>
<table width="100%" >
  <tr>
    <td width="5%" align="right">Account Group</td>
    <td width="10%"><select id="cmbaccgroup" name="cmbaccgroup"  style="width:90%;" value='<s:property value="cmbaccgroup"/>'>
      <option value="">--Select--</option></select>
       <input type="hidden" id="hidcmbaccgroup" name="hidcmbaccgroup" value='<s:property value="hidcmbaccgroup"/>'/></td>
    <td width="5%" align="right">Account</td>
        
    <td width="12%"><input type="text" id="txtaccount" name="txtaccount" style="width:80%;" value='<s:property value="txtaccount"/>' tabindex="-1"/></td>
    
     
    <td width="6%" align="right">Service Tax No</td>
    <td width="5%"><input type="text" id="servtaxno" name="servtaxno" style="width:90%;" value='<s:property value="servtaxno"/>'/></td>
  
    
    <td width="10%" align="right">Credit Period-Min(Days)</td>
    <td width="5%"><input type="text" id="txtcredit_period_min" name="txtcredit_period_min" style="width:90%;text-align: right;" value='<s:property value="txtcredit_period_min"/>'/></td>
    <td width="7%" align="right">Max(Days)</td>
    <td width="5%"><input type="text" id="txtcredit_period_max" name="txtcredit_period_max" style="width:90%;text-align: right;" value='<s:property value="txtcredit_period_max"/>'/></td>
    <td width="6%" align="right">Credit Limit</td>
    <td width="5%"><input type="text" id="txtcredit_limit" name="txtcredit_limit" style="width:90%;text-align: right;" value='<s:property value="txtcredit_limit"/>'/></td>
  
  
  </tr>
  <tr>
    <td align="right"  width="10%"><label id="lbltypeentity">Type</label></td>
    <td width="10%"><select id="cmbtype" name="cmbtype" style="width:90%;" onchange="typecheck();" value='<s:property value="cmbtype"/>'>
      </select>
      <input type="hidden" id="hidcmbtype" name="hidcmbtype" value='<s:property value="hidcmbtype"/>'/></td>
      <td width="3%" align="right">TRN No</td>
    <td width="15%"><input type="text" id="panno" name="panno" style="width:80%;" value='<s:property value="panno"/>'/></td>

</tr>
</table>
</fieldset><br/>


 

<table width="100%">

 

<tr><td width="50%">
<fieldset>



<legend>Communication Details</legend>



<table width="100%">
	<tr></tr>
  <tr>
    <td width="10%" align="right">Address</td>
    <td width="20%"><input type="text" id="txtaddress" name="txtaddress" style="width:90%;" value='<s:property value="txtaddress"/>'/></td>
    <td width="10%" align="right">Address 2</td>
    <td width="20%"><input type="text" id="txtaddress1" name="txtaddress1" style="width:90%;" value='<s:property value="txtaddress1"/>'/></td>
  	<td width="10%"></td>
  	<td width="20%"></td>
  </tr>
  
   <tr>
    <td align="right" width="10%">Tel</td>
    <td width="20%"><input type="text" id="txttel" name="txttel" style="width:90%;" value='<s:property value="txttel"/>'/></td>
    <td align="right" width="10%">Mob</td>
    <td width="20%"><input type="text" id="txtmob" name="txtmob" style="width:90%;" onblur="getMobileNoAlreadyExists(this.value,$('#docno').val(),$('#mode').val());" value='<s:property value="txtmob"/>'/></td>
    <td width="10%" align="right">Office No.</td>
    <td width="20%"><input type="text" id="txtoffice" name="txtoffice" style="width:90%;" value='<s:property value="txtoffice"/>'/></td>
  </tr>
  
  
   <tr>
    <td align="right" width="10%">Fax</td>
    <td width="20%"><input type="text" id="txtfax" name="txtfax" style="width:90%;" value='<s:property value="txtfax"/>'/></td>
    <td align="right" width="10%">Email</td>
    <td width="20%"><input type="email" id="txtemail" name="txtemail" style="width:90%;" placeholder="someone@example.com" value='<s:property value="txtemail"/>'/></td>
  	<td></td>
  	<td></td>
  </tr>
  
   <tr>
    <td align="right">Contact Person</td>
    <td><input type="text" id="txtcontact" name="txtcontact" style="width:90%;" value='<s:property value="txtcontact"/>'/></td>
    <td align="right">Extn. No.</td>
    <td ><input type="text" id="txtextno" name="txtextno" style="width:90%;" value='<s:property value="txtextno"/>'/></td>
  	<td></td>
  	<td></td>
  </tr>
  
  <tr></tr>
</table>


</br>
</fieldset>
</td><td width="50%">
<fieldset>
<legend>Bank Information</legend>
<table width="100%">
<tr>
<td width="12%" align="right">Account No.</td>
<td width="41%"><input type="text" id="txtaccountno"  name="txtaccountno" style="width:90%;" value='<s:property value="txtaccountno"/>'/></td></tr>
<tr>
<td align="right">Bank Name</td>
<td colspan="3"><input type="text" id="txtbankname" name="txtbankname" style="width:91%;" value='<s:property value="txtbankname"/>'/></td></tr>
<tr>
<td align="right">Branch Name</td>
<td colspan="3"><input type="text" id="txtbranchname" name="txtbranchname" style="width:91%;" value='<s:property value="txtbranchname"/>'/></td></tr>
<tr>
<td align="right">Branch Address</td>
<td colspan="3"><input type="text" id="txtbranchaddress" name="txtbranchaddress" style="width:91%;" value='<s:property value="txtbranchaddress"/>'/></td></tr>
<tr>
<td align="right">Swift No.</td>
<td><input type="text" id="txtswiftno" name="txtswiftno" style="width:80%;" value='<s:property value="txtswiftno"/>'/></td>
<td width="8%" align="right">IBAN No.</td>
<td width="39%"><input type="text" id="txtibanno" name="txtibanno" style="width:80%;" value='<s:property value="txtibanno"/>'/></td></tr>
<tr>
<td align="right">City</td>
<td><input type="text" id="txtcity" name="txtcity" style="width:80%;" value='<s:property value="txtcity"/>'/></td>
<td align="right">Country</td>
<td><input type="text" id="txtcountry" name="txtcountry" style="width:80%;" placeholder="press F3 to search" value='<s:property value="txtcountry"/>' readonly="true" onKeyDown="getcountry(event);"/></td></tr>
		<input type="hidden" id="cityid" name="cityid" value='<s:property value="cityid"/>'/>
		<input type="hidden" id="countryid" name="countryid" value='<s:property value="countryid"/>'/>
</table>
</fieldset>
</td></tr></table>


 <fieldset>
<legend>Contact Person Details</legend>
<table width="100%" id="venderGridtbl">
<tr><td>
     <div id="venderDetails"> 
  <jsp:include page="vendermaingrid.jsp"></jsp:include></div>
</td>
  </tr>
  
</table>
<input type="hidden" id="vdrgridlength" name="vdrgridlength"/>
</fieldset>    




<fieldset>

<legend>Brand Details</legend>
 <div id="divbrand" ><jsp:include page="brandgrid.jsp"></jsp:include></div>

</fieldset>

<input type="hidden" id="mode" name="mode" value='<s:property value="mode"/>'/>
<input type="hidden" id="deleted" name="deleted" value='<s:property value="deleted"/>'/>
<input type="hidden" id="msg" name="msg"  value='<s:property value="msg"/>'/>
<input type="hidden" id="txtmobilevalidation" name="txtmobilevalidation" value='<s:property value="txtmobilevalidation"/>'/>

<input type="hidden" id="gridlenght" name="gridlenght"  value='<s:property value="gridlenght"/>'/>

</div>
</form>

<div id="brandsearchwndow">
   <div ></div>
</div>
<div id="areainfowindow">
   <div ></div>
</div>
<div id="activityinfowindow">
   <div ></div>
</div>
<div id="countryinfowindow">
   <div ></div>
</div>
  

</div>
</body>
</html>