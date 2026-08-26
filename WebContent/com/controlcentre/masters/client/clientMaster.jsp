	<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>GatewayERP(i)</title>
<jsp:include page="../../../../includes.jsp"></jsp:include>

<% String contextPath=request.getContextPath(); %>

<script type="text/javascript">
      $(document).ready(function () {
    	  /* Date */
    	  $("#clientDate").jqxDateTimeInput({ width: '125px', height: '15px', formatString:"dd.MM.yyyy"});
    	  $('#areainfowindow').jqxWindow({ width: '55%', height: '58%',  maxHeight: '85%' ,maxWidth: '80%' ,title: ' Area Search' , position: { x: 250, y: 60 }, keyboardCloseKey: 27});
    	  $('#areainfowindow').jqxWindow('close');
    	  $('#countryinfowindow').jqxWindow({ width: '20%', height: '58%',  maxHeight: '85%' ,maxWidth: '80%' ,title: ' Country Search' , position: { x: 250, y: 60 }, keyboardCloseKey: 27});
    	  $('#countryinfowindow').jqxWindow('close');
    	  $('#activityinfowindow').jqxWindow({ width: '20%', height: '58%',  maxHeight: '85%' ,maxWidth: '80%' ,title: 'Activity Search' , position: { x: 250, y: 60 }, keyboardCloseKey: 27});
    	  $('#activityinfowindow').jqxWindow('close');
    	  $('#salesmaninfowindow').jqxWindow({ width: '50%', height: '58%',  maxHeight: '85%' ,maxWidth: '80%' ,title: 'Salesman Search' , position: { x: 250, y: 60 }, keyboardCloseKey: 27});
    	  $('#salesmaninfowindow').jqxWindow('close');
    	  
    	  
    	  
    	  
    	  
 
 		   $('#brandwindow').jqxWindow({ width: '30%', height: '62%',  maxHeight: '75%' ,maxWidth: '50%' , title: 'Brand Search' ,position: { x: 250, y: 60 }, keyboardCloseKey: 27});
 		   $('#brandwindow').jqxWindow('close');
 		   $('#modelwindow').jqxWindow({ width: '30%',height: '62%',  maxHeight: '80%' ,maxWidth: '50%' , title: 'Model Search' ,position: { x: 500, y: 60 }, keyboardCloseKey: 27});
 		   $('#modelwindow').jqxWindow('close');
 		   $('#submodelwindow').jqxWindow({ width: '30%',height: '62%',  maxHeight: '80%' ,maxWidth: '50%' , title: 'Sub Model Search' ,position: { x: 600, y: 60 }, keyboardCloseKey: 27});
 		   $('#submodelwindow').jqxWindow('close');
 		    $('#yomwindow').jqxWindow({ width: '30%',height: '62%',  maxHeight: '80%'  ,maxWidth: '50%' , title: 'Yom Search' ,position: { x: 250, y: 60 }, keyboardCloseKey: 27});
 		   $('#yomwindow').jqxWindow('close');
 		   $('#spec1window').jqxWindow({ width: '30%',height: '62%',  maxHeight: '80%'  ,maxWidth: '50%' , title: 'Bed Size Search' ,position: { x: 700, y: 60 }, keyboardCloseKey: 27});
 		   $('#spec1window').jqxWindow('close');
 		   $('#spec2window').jqxWindow({ width: '32%',height: '62%',  maxHeight: '65%'  ,maxWidth: '52%' , title: 'Engin Size Search' ,position: { x: 800, y: 60 }, keyboardCloseKey: 27});
 		   $('#spec2window').jqxWindow('close');
 		   $('#spec3window').jqxWindow({ width: '32%',height: '62%',  maxHeight: '65%'  ,maxWidth: '52%' , title: 'Cabin Size Search' ,position: { x: 800, y: 60 }, keyboardCloseKey: 27});
 		   $('#spec3window').jqxWindow('close');
    	  
 		  chkveh();
    	  getGroup();
    	  getCategory();
    	  getCurrency();
    	  
    	  $('#txtarea').dblclick(function(){
    		  $('#areainfowindow').jqxWindow('open');
			  areaSearchContent('area.jsp?getarea=0');
			  });
    	  
    	  $('#txtsalesman').dblclick(function(){
    		  $('#salesmaninfowindow').jqxWindow('open');
			  salesmanSearchContent('salesman.jsp?getsalesman=0');
			  });
    	 
    	    	  
    	  
    	  
    	  $('#txtcountry').dblclick(function(){
    		  $('#countryinfowindow').jqxWindow('open');
    		  countrySearchContent('country.jsp'); 
			  });
    	  
    	  
    	  
      }); 
      
      
      
      
      
      
      
  	function chkveh()
    {
     
    var x=new XMLHttpRequest();
    x.onreadystatechange=function(){
    if (x.readyState==4 && x.status==200)
     {
       var items= x.responseText.trim();
 
 
       if(parseInt(items)>0)
        {
      
    	   
    	   $('#veh').show();
       
       
        }
       else
    	   {
    	   
    	   $('#veh').hide();
    	   
    	   }
       
     
     }
    }
    x.open("GET","clientveh.jsp",true);
  x.send();
  
       
         
     
    }
      
      
      
      
      function brandSearchContent(url) {
    	  //alert(url);
    	    $.get(url).done(function (data) {
    	//alert(data);
    	 $('#brandwindow').jqxWindow('open');
    	
    	  $('#brandwindow').jqxWindow('setContent', data);

    	}); 
    	}

    	function modelSearchContent(url) {
    	  //alert(url);
    	    $.get(url).done(function (data) {
    	//alert(data);
    	 $('#modelwindow').jqxWindow('open');
    	
    	
    	  $('#modelwindow').jqxWindow('setContent', data);

    	}); 
    	}

    	function subModelSearchContent(url) {
    		  //alert(url);
    		    $.get(url).done(function (data) {
    		//alert(data);
    $('#submodelwindow').jqxWindow('open');
    		  $('#submodelwindow').jqxWindow('setContent', data);

    		}); 
    		}

    	 

 

    	function spec1SearchContent(url) {
    	  //alert(url);
    	    $.get(url).done(function (data) {
    	//alert(data);
    	 $('#spec1window').jqxWindow('open');
    	  $('#spec1window').jqxWindow('setContent', data);

    	}); 
    	}

    	function spec2SearchContent(url) {
    		  //alert(url);
    		    $.get(url).done(function (data) {
    		//alert(data);
    		 $('#spec2window').jqxWindow('open');
    		  $('#spec2window').jqxWindow('setContent', data);

    		}); 
    		}
    		
    	function spec3SearchContent(url) {
    		  //alert(url);
    		    $.get(url).done(function (data) {
    		//alert(data);
    		 $('#spec3window').jqxWindow('open');
    		  $('#spec3window').jqxWindow('setContent', data);

    		}); 
    		}

    	function yomSearchContent(url) {
    	  //alert(url);
    	    $.get(url).done(function (data) {
    	//alert(data);
    	 $('#yomwindow').jqxWindow('open');
    	  $('#yomwindow').jqxWindow('setContent', data);

    	}); 
    	}

 
      
      
      
      
      
      
      
      function  funReadOnly(){
    	  
    	  
    		$('#frmClientMaster input').attr('disabled', true );
    		$('#frmClientMaster textarea').attr('disabled', true );
    		$('#frmClientMaster select').attr('disabled', true);
    		$('#frmClientMaster hidden').attr('disabled', false);
    		
    		$('#vehdetgrid').jqxGrid({ disabled: true});
    		$('#cpDetailsGrid').jqxGrid({ disabled: true});
    		 $('#mode').attr('disabled', false);
    		 $('#formdetailcode').attr('disabled', false);
    		 $('#docno').attr('disabled', false);
    		 
    		 clientcat();
    	}
      
      function funSearchLoad(){
    		changeContent('masterSearch.jsp', $('#window'));
    	}
      
      function funRemoveReadOnly(){
    	  
    		$('#frmClientMaster input').attr('disabled', false );
    		$('#frmClientMaster textarea').attr('disabled', false );
    		$('#frmClientMaster select').attr('disabled', false);
    		$('#cpDetailsGrid').jqxGrid({ disabled: false});
    		
    		$('#vehdetgrid').jqxGrid({ disabled: false});
    		//$("#cpGridDetails").load('cpGridDetails.jsp?cldocno=0');
    		if(document.getElementById("mode").value=='A')
    			{
    			$("#cpDetailsGrid").jqxGrid('clear');
        		$("#cpDetailsGrid").jqxGrid("addrow", null, {});
        		
        		
        		$("#vehdetgrid").jqxGrid('clear');
        		$("#vehdetgrid").jqxGrid("addrow", null, {});
        		
    		document.getElementById("txtcredit_period_max").value=0.0;
      	    document.getElementById("txtcredit_period_min").value=0.0;
      	    document.getElementById("txtcredit_limit").value=0.0;
    			}
    		
    		if(document.getElementById("mode").value=='E')
			{
    		 $("#vehdetgrid").jqxGrid("addrow", null, {});
    		 
    		 
           	 $("#cpDetailsGrid").jqxGrid("addrow", null, {});
         
    		 
			}
    		
    		clientcat();
      }
      
      
      
      function getareas(event){
      	 var x= event.keyCode;
      	 //alert("x===="+x);
      	 if(x==114){
      	  $('#areainfowindow').jqxWindow('open');
     
                areaSearchContent('area.jsp?getarea=0');  	 }
       	 else{
       		
      		 }
             	 }
      
      
      function getsalesman(event){
       	 var x= event.keyCode;
       	 //alert("x===="+x);
       	 if(x==114){
       	  $('#salesmaninfowindow').jqxWindow('open');
      
                 salesmanSearchContent('salesman.jsp?getsalesman=0');  	 }
        	 else{
        		
       		 }
              	 }
      
      
      /* function getareas(){
       	//alert("=========");
       	  $('#areainfowindow').jqxWindow('open');
                 areaSearchContent('area.jsp?getarea=0');
        	
         } */
             	 
 function areaSearchContent(url) {
 	 //alert(url);
      	 $.get(url).done(function (data) {
 			 //alert(data);
 	$('#areainfowindow').jqxWindow('setContent', data);

                    	}); 
          	}
         
         
         function salesmanSearchContent(url) {
         	 //alert(url);
              	 $.get(url).done(function (data) {
         			 //alert(data);
         	$('#salesmaninfowindow').jqxWindow('setContent', data);

                            	}); 
                  	}
 
 function getcountry(event){
  	 var x= event.keyCode;
  	 if(x==114){
  	  $('#countryinfowindow').jqxWindow('open');
  
     // $('#accountWindow').jqxWindow('focus');
            countrySearchContent('country.jsp');  	 }
   	 else{
  		 }
         	 }

         	 
function countrySearchContent(url) {
	 //alert(url);
  	 $.get(url).done(function (data) {
			 //alert(data);
	$('#countryinfowindow').jqxWindow('setContent', data);

                	}); 
      	}
      	
/* function getactivity(event){
 	 var x= event.keyCode;
 	 if(x==114){
 	  $('#activityinfowindow').jqxWindow('open');
 
    // $('#accountWindow').jqxWindow('focus');
           activitySearchContent('activity.jsp');  	 }
  	 else{
 		 }
        	 }
        	 
function activitySearchContent(url) {
	 //alert(url);
 	 $.get(url).done(function (data) {
			 //alert(data);
	$('#activityinfowindow').jqxWindow('setContent', data);

               	}); 
     	} */
 
 function getCurrency()
	{
     		
     		
		var x=new XMLHttpRequest();
		var items,currIdItems,mcloseItems,currCodeItems;
		x.onreadystatechange=function(){
			if (x.readyState==4 && x.status==200)
				{
					items= x.responseText;
			        items=items.split('####');
			        currIdItems=items[0].split(",");
			        currCodeItems=items[1].split(",");
			        
			        var optionscurr = '';  
		            for ( var i = 0; i < currCodeItems.length; i++) {
				    	   optionscurr += '<option value="' + currIdItems[i] + '">' + currCodeItems[i] + '</option>';
				        }
		            $("select#currencyid").html(optionscurr);
		        	window.parent.monthclosed.value=mcloseItems;
		        	
				}
			else
				{
				}
			
			if($('#hidcmbcurrencyid').val()){
	   			$("#currencyid").val($('#hidcmbcurrencyid').val());
	   		}
		}
		x.open("GET","getCurrency.jsp",true);
		x.send();
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
				$("select#cmbacgroup").html(optionsgroup);
				
			} else {
			}
			//alert("======"+$('#hidcmbacgroup').val());
			if ($('#hidcmbacgroup').val() != null) {
				$('#cmbacgroup').val($('#hidcmbacgroup').val());
			}
		}
		x.open("GET", "getGroup.jsp", true);
		x.send();
	}
 
 function getCategoryAccountGroup(a) {
	
		/* var x = new XMLHttpRequest();
		x.onreadystatechange = function() {
			if (x.readyState == 4 && x.status == 200) {
				var items = x.responseText.trim();
			    $('#hidcmbacgroup').val(items);
				
				if ($('#hidcmbgroup1').val() != null || $('#hidcmbacgroup').val() != "") {
					$('#cmbacgroup').val($('#hidcmbacgroup').val());
				}
			} else {
			}
		}
		x.open("GET", "getCategoryAccountGroup.jsp?category="+a, true);
		x.send(); */
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
				
			} else {
			}
			//alert("=========="+$('#hidcmbcategory').val());
			if ($('#hidcmbcategory').val() != null) {
				$('#cmbcategory').val($('#hidcmbcategory').val());
			}
		}
		x.open("GET", "getCategory.jsp", true);
		x.send();
	}


 
 function funFocus(){
	 document.getElementById("txtclient_name").focus();  
	
 }
 
 
 
 function funNotify(){	
	 
		var txtclient=document.getElementById("txtclient_name").value;
		
		//var acgroup=document.getElementById("cmbacgroup").value;
		
		var currency=document.getElementById("currencyid").value;
		
		var tin=document.getElementById("txttinno").value;
		
		var cst=document.getElementById("txtcstno").value;
		
		
		if(txtclient=="")
		{
		document.getElementById("errormsg").innerText=" Enter Client Name";
		 document.getElementById("txtclient_name").focus();  
		return 0;
		}
		var cmbacgroup=document.getElementById("cmbacgroup").value;
		
		//alert(cmbacgroup);
		if(cmbacgroup=="")
		{
		document.getElementById("errormsg").innerText=" Select Account Group";
		document.getElementById("cmbacgroup").focus();
		return 0;
		}
		
		
		var txtmobile=document.getElementById("txtmobile").value;
		
		if(txtmobile=="")
			{
			 document.getElementById("errormsg").innerText=" Enter Mobile No ";
			 document.getElementById("txtmobile").focus();
			 return 0;
			}
		
		var txtemail= document.getElementById("txtemail").value;

	 	if(txtemail!="")
	 		{

	 		if (/^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/.test(txtemail))  
	 		{  
	 			 document.getElementById("errormsg").innerText="";
	 		   
	 		}  
	 		
	 		else
	 			{
	 		
	 		 document.getElementById("errormsg").innerText=" You have entered an invalid email address!";
	 		 document.getElementById("txtemail").focus();
	 		 // alert("")  
	 		  return (false)  ;
	 			}
	 		}
		/* if(acgroup=="")
		{
		document.getElementById("errormsg").innerText=" Select Account Group";
		return 0;
		} */
		
	/* 	if(tin=="")
		{
		document.getElementById("errormsg").innerText=" Enter Tin No";
		return 0;
		}
		
		if(cst=="")
		{
		document.getElementById("errormsg").innerText="Enter Cst";
		return 0;
		}
		 */
		 var rows = $("#cpDetailsGrid").jqxGrid('getrows');
		   
		    var len=0;
		   for(var i=0;i<rows.length;i++){
			   
		    var cpersion= $.trim(rows[i].cpersion);
		   
			if(cpersion.trim()!="" && typeof(cpersion)!="undefined" && typeof(cpersion)!="NaN" )
				{
				
				
				newTextBox = $(document.createElement("input"))
			       .attr("type", "dil")
			       .attr("id", "test"+len)
			       .attr("name", "test"+len)
			       .attr("hidden", "true");
			    
				   
				
		   newTextBox.val(rows[i].cpersion+"::"+rows[i].mobile+" :: "
				   +rows[i].phone+" :: "+rows[i].extn+" :: "+rows[i].email+" :: "+rows[i].area+" :: "+rows[i].areaid+" :: "+rows[i].activity_id+"");
		   
		   newTextBox.appendTo('form'); 
		   
		   len=len+1;
				 }
		   
		   }
		   $('#cpgridlength').val(len);
		   
		   
		   
		   
		   
			
			 var rows = $("#vehdetgrid").jqxGrid('getrows');
			    $('#vehdetgridlength').val(rows.length);
			  
			   for(var i=0 ; i < rows.length ; i++){
			
			    newTextBox = $(document.createElement("input"))
			       .attr("type", "dil")
			       .attr("id", "vehtest"+i)
			       .attr("name", "vehtest"+i)
			       .attr("hidden", "true"); 
			 
			   newTextBox.val(rows[i].regno+" :: "+rows[i].brandid+" :: "
					   +rows[i].modelid+" :: "+rows[i].submodelid+" :: "+rows[i].yomid+" :: "+rows[i].bsizeid+" :: "+rows[i].esizeid+" :: "+rows[i].csizeid+" :: "+rows[i].forms+" :: "+rows[i].doc_no+" :: "+0+" :: ");
			
			   
		 
			   newTextBox.appendTo('form');
			  
			    
			   }   
		   
		   
		   
		  
		   
			var x = new XMLHttpRequest();
			x.onreadystatechange = function() {
				if (x.readyState == 4 && x.status == 200) {
					var items = x.responseText.trim();

					if(parseInt(items)==1){
						
						 document.getElementById("errormsg").innerText="Mobile No. Already Exists. ";
						 document.getElementById("txtmobile").focus();
						 return 0;
						
						 
					 }
					
					else
						{
						 $('#cmbcategory').attr('disabled', false);
						 $('#cmbacgroup').attr('disabled', false);
					 
					   
						$('#frmClientMaster').submit();
						
						
						}
			}
		}
		x.open("GET", "getMobileNoAlreadyExists.jsp?mobileno="+document.getElementById("txtmobile").value+"&docno="+document.getElementById("docno").value+"&mode="+document.getElementById("mode").value, true);
		x.send();
		   
		   
		
 }
 
 
 function setValues() {
	  var maindoc=document.getElementById("docno").value;
	  if(maindoc>0)
		  {
	 
    var indexVal1 = document.getElementById("docno").value;
   
     
    
   $("#cpGridDetails").load('cpGridDetails.jsp?cldocno='+indexVal1);
   
   
   $("#vehdetgrids").load('vehdetails.jsp?cldocno='+indexVal1);
	  
  
		  }
 		
	  
	   // main
 		if($('#hidclientDate').val()){
 			$("#clientDate").jqxDateTimeInput('val', $('#hidclientDate').val());
 		}
		
  
 	   if($('#msg').val()!=""){
 		   $.messager.alert('Message',$('#msg').val());
 		   
 		  }
 	   
 	 delvalueChange();
 	/*document.getElementById("formdet").innerText=$('#formdetail').val()+" ("+$('#formdetailcode').val().trim()+")"; */
 	
 }
 
 function delvalueChange()
 {
	 if($('#hidcmbcurrencyid').val()!=""){
		 $('#cmbcurrencyid').val($('#hidcmbcurrencyid').val());
		 
		 
	 }
 	  
	 
	 if ($('#hidcmbgroup1').val() != null || $('#hidcmbacgroup').val() != "") {
			$('#cmbacgroup').val($('#hidcmbacgroup').val());
		}
 }
 function clientcat() {
	 
		var x = new XMLHttpRequest();
		x.onreadystatechange = function() {
			if (x.readyState == 4 && x.status == 200) {
				var items = x.responseText;
			 
	  		  if(parseInt(items)==1)
					{
						if($('#mode').val()!="view")
							{
						 $('#cmbcategory').attr('disabled', true);
						// $('#cmbacgroup').attr('disabled', true);
					 
							}
					}
				else
					{
						if($('#mode').val()!="view")
						{
						 $('#cmbcategory').attr('disabled', false);
					//	 $('#cmbacgroup').attr('disabled', false);
						}
				 
					}   
				
			
			} else {
			}
			
		}
		x.open("GET", "clientcat.jsp", true);
		x.send();
	}

 function validateemail()
 {
 	var txtemail= document.getElementById("txtemail").value;

 	if(txtemail!="")
 		{

 		if (/^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/.test(txtemail))  
 		{  
 			 document.getElementById("errormsg").innerText="";
 		  return (true)  ;
 		}  
 		
 		 document.getElementById("errormsg").innerText=" You have entered an invalid email address!";
 		 
 		 // alert("")  
 		  return (false)  ;
 		}

 	
 	}
 function mobileValid(value){
	   if(value!=""){ 
	    var phoneno = /^\d{12}$/;  
		if(value.match(phoneno)){
			document.getElementById("errormsg").innerText="";
			$('#txtmobilevalidation').val(0);
			return true;
		}
		else{
			document.getElementById("errormsg").innerText="Invalid Mobile Number";
			$('#txtmobilevalidation').val(1);
			return false;
		}
	    } 
	   return true;
}
 
 function getMobileNoAlreadyExists(mobileno,docno,mode){
		var x = new XMLHttpRequest();
		x.onreadystatechange = function() {
			if (x.readyState == 4 && x.status == 200) {
				var items = x.responseText.trim();

				if(parseInt(items)==1){
					/*  $.messager.alert('Message','Mobile No. Already Exists.','warning');
					 return 0; */
				 
					 document.getElementById("errormsg").innerText="Mobile No. Already Exists. ";
					 document.getElementById("txtmobile").focus();
					 return 0;
					 }
				else
					{
					 document.getElementById("errormsg").innerText="";
					}
		}
	}
	x.open("GET", "getMobileNoAlreadyExists.jsp?mobileno="+mobileno+"&docno="+docno+"&mode="+mode, true);
	x.send();
}


</script>

</head>
<style>
.hidden-scrollbar {
  overflow: auto;
  height: 540px;
}</style>
<body onload="setValues();clientcat();">
<div id="mainBG" class="homeContent" data-type="background">
<form id="frmClientMaster" action="clientmaster" method="post" autocomplete="off">

<%-- <input type="hidden" id="mode" name="mode"  value='<s:property value="mode"/>'/>
<input type="hidden" id="msg" name="msg"  value='<s:property value="msg"/>'/> --%>

<jsp:include page="../../../../header.jsp"></jsp:include><br/>   
   
<div class='hidden-scrollbar'>
<fieldset>
<input type="hidden" id="rowindex">
<table width="100%"  >
  <tr>
    <td width="3%" align="right">Date</td>
    <td width="11%"><div id="clientDate" name="clientDate" value='<s:property value="clientDate"/>'></div>
    <input type="hidden" id="hidClientDate" name="hidClientDate" value='<s:property value="hidClientDate"/>'/></td>
    <td width="5%" align="right">Code</td>
    <td width="11%"><input type="text" id="txtcode" readonly name="txtcode" style="width:50%;" tabindex="-1" value='<s:property value="txtcode"/>'/></td>
    <td width="6%" align="right">Name</td>
    <td colspan="2"><input type="text" id="txtclient_name" name="txtclient_name" style="width:100%;" value='<s:property value="txtclient_name"/>'/></td>
    <td width="12%" align="right" colspan="2">Currency</td>
    <td width="16%"><select id="currencyid" name="currencyid" value='<s:property value="currencyid"/>'>
      <option value="">--Select--</option></select>
      <input type="hidden" id="hidcmbcurrencyid" name="hidcmbcurrencyid" value='<s:property value="hidcmbcurrencyid"/>'/></td>
    <td width="4%" align="right" colspan="2">Doc No.</td>
    <td width="10%"><input type="text" id="docno" readonly name="docno" style="width:65%;" tabindex="-1" value='<s:property value="docno"/>'/></td>
  </tr>
  <tr>
   
    <td width="5%" align="right">Salesman</td>
    <td width="11%"><input type="text" id="txtsalesman"  name="txtsalesman" style="width:70%;"  readonly="true" placeholder="press F3 to search"  value='<s:property value="txtsalesman" />'  readonly="true" onKeyDown=" getsalesman(event);"/></td>
   						
    <td align="right">Category</td>
    <td><select id="cmbcategory" name="cmbcategory" style="width:70%;" onchange="getCategoryAccountGroup(this.value);" value='<s:property value="cmbcategory" />'>
      <option value="">--Select--</option></select>
      
      <input type="hidden" id="hidcmbcategory" name="hidcmbcategory" value='<s:property value="hidcmbcategory"/>'/></td>

    <td align="right">Account Group</td>
    <td><select id="cmbacgroup" name="cmbacgroup"  style="width:90%;" value='<s:property value="cmbacgroup"/>'>
      <option value="">--Select--</option></select>
       <input type="hidden" id="hidcmbacgroup" name="hidcmbacgroup" value='<s:property value="hidcmbacgroup"/>'/></td>
       
       
       
       
       <td colspan="4">Credit Period-Min(Days)&nbsp;<input type="text" id="txtcredit_period_min" name="txtcredit_period_min" style="width:20%;text-align: right;" value='<s:property value="txtcredit_period_min"/>'/>
       										&nbsp;Max ( Days )<input type="text" id="txtcredit_period_max" name="txtcredit_period_max" style="width:20%;text-align: right;" value='<s:property value="txtcredit_period_max"/>'/>
       </td>
       
       
    <td align="right">Account</td>
    <td colspan="2"><input type="text" id="txtaccount" readonly name="txtaccount" style="width:65%;" tabindex="-1" value='<s:property value="txtaccount"/>'/></td>
  </tr>
  <tr>
    <td align="right">Tin. No</td>
    <td><input type="text" id="txttinno" name="txttinno" style="width:70%;" value='<s:property value="txttinno"/>'/></td>
    <td align="right">CST No</td>
    <td><input type="text" id="txtcstno" name="txtcstno" style="width:70%;" value='<s:property value="txtcstno"/>'/></td>
    
 

    <td align="right">PAN No</td>
    <td><input type="text" id="txtpanno" name="txtpanno" style="width:70%;" value='<s:property value="txtpanno"/>'/></td>
    <td width="7%"  colspan="3" align="center">&nbsp;&nbsp; &nbsp; Service  Tax  No
    										&nbsp;<input type="text" id="txtserv_taxno" name="txtserv_taxno" style="width:50%;" value='<s:property value="txtserv_taxno"/>'/></td>
    
    <td  colspan="2" width="6%" align="right">Credit Limit</td>
    <td colspan="3" ><input type="text" id="txtcredit_limit" name="txtcredit_limit" style="width:62%;text-align: right;" value='<s:property value="txtcredit_limit"/>'/></td>
  	
  </tr>
</table>
</fieldset>
<fieldset>
<legend>Additional Information</legend>
<table width="70%">
<tr>
<td width="10%" align="right">Finanical name</td>
<td ><input type="text" id="txtfinname" name="txtfinname" style="width:91%;" value='<s:property value="txtfinname"/>'/></td>
<td width="40%" align="right">Finanical Address</td>
<td colspan="5"><input type="text" id="txtfinaddress" name="txtfinaddress" style="width:220%;" value='<s:property value="txtfinaddress"/>'/></td>
</tr>

</table>
</fieldset>

<table width="100%">
<tr><td width="50%">
<fieldset>
<legend>Communication Details</legend>
<table width="100%">
<tr>
<td width="7%" align="right">Address</td>
<td colspan="3"><input type="text" id="txtaddress" name="txtaddress" style="width:80%;" value='<s:property value="txtaddress"/>'/></td></tr>
<tr>
<td align="right">Extn. No.</td>
<td width="36%"><input type="text" id="txtextnno" name="txtextnno" style="width:80%;" value='<s:property value="txtextnno"/>'/></td>
<td width="7%" align="right">Telephone</td>
<td width="50%"><input type="text" id="txttelephone" name="txttelephone" style="width:62%;" value='<s:property value="txttelephone"/>'/></td></tr>
<tr>
<td  align="right">Mobile</td>
<td><input type="text" id="txtmobile" name="txtmobile" style="width:80%;" placeholder="mobile number with country code" onblur="getMobileNoAlreadyExists(this.value,$('#docno').val(),$('#mode').val());" value='<s:property value="txtmobile"/>'/></td>
<td align="right">Fax</td>
<td><input type="text" id="txtfax" name="txtfax" style="width:62%;" value='<s:property value="txtfax"/>'/></td>
</tr>
<tr>
<td align="right">Email</td>
<td colspan="3"><input type="text" id="txtemail" name="txtemail" placeholder="someone@example.com" onblur="validateemail()" style="width:80%;" value='<s:property value="txtemail"/>'/></td></tr>
<tr>
<td align="right">Web</td>
<td colspan="3"><input type="text" id="txtweb" name="txtweb" style="width:80%;" value='<s:property value="txtweb"/>'/></td></tr>
<tr>
<td align="right">Contact</td>
<td colspan="3"><input type="text" id="txtcontact" name="txtcontact" style="width:80%;" value='<s:property value="txtcontact"/>'/></td>
</tr>
<tr>
<td align="right">Area</td>
<td ><input type="text" id="txtarea" name="txtarea" style="width:60%;" readonly="true" placeholder="press F3 to search" value='<s:property value="txtarea"/>' readonly="true" onKeyDown=" getareas(event);"/></td>
 <td colspan="2"><input type="text" id="txtareadet" name="txtareadet" readonly="true" style="width:68%;" value='<s:property value="txtareadet"/>'/></td></tr>
<input type="hidden" id="txtareaid" name="txtareaid"  value='<s:property value="txtareaid"/>'/>
</table>
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
</table><br/><br/>
</fieldset>
</td></tr></table>

<fieldset>
<legend>Contact Person Details</legend>
<table width="100%" id="cpGridtbl">
<tr><td>
     <div id="cpGridDetails"> 
  <jsp:include page="cpGridDetails.jsp"></jsp:include></div>
</td>
  </tr>
  
  <tr><td>
   
</td>
  </tr>
  
  
  <input type="hidden" id="cpgridlength" name="cpgridlength"/>
</table>
</fieldset>
<br>
       <div id="veh"> 
<fieldset>
<table width="100%"  >
<tr><td>

       <div id="vehdetgrids"> 
  <jsp:include page="vehdetails.jsp"></jsp:include></div>
  
       
</td>
  </tr>
  
  <tr><td>
   
</td>
  </tr>
  
  
  <input type="hidden" id="vehdetgridlength" name="vehdetgridlength"/>
</table>

</fieldset>
</div>



<input type="hidden" id="salid" name="salid"  value='<s:property value="salid"/>'/>



<input type="hidden" id="mode" name="mode"  value='<s:property value="mode"/>'/>
		<input type="hidden" id="msg" name="msg"  value='<s:property value="msg"/>'/>
		<input type="hidden" id="deleted" name="deleted"  value='<s:property value="deleted"/>'/>
</div>
</form>
<div id="areainfowindow">
   <div ></div>
   </div>
   <div id="countryinfowindow">
   <div ></div>
   </div>
   <div id="activityinfowindow">
   <div ></div>
   </div>
</div>
<div id="salesmaninfowindow">
   <div ></div>
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
 
 



</body>
</html>
