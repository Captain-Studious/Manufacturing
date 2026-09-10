
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
    width: 60px;
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

/* Range Inputs Row (From - To) */
.range-container {
    display: flex;
    align-items: center;
    justify-content: space-between;
    gap: 8px;
}
.range-container input {
    flex: 1;
}
.range-container span {
    font-weight: bold;
    color: #4e5e71;
}

/* jqx Date Container Mapping Rules */
.filter-table div[id^="fromdate"],
.filter-table div[id^="todate"] {
    width: 100%;
}

/* ===== MASTER 30px BUTTON SYSTEM ===== */
.btn-submit, .myButtons {
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

.btn-submit:hover, .myButtons:hover {
    background: #1d4ed8 !important;
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
	

	  $("body").prepend('<div id="overlay" class="ui-widget-overlay" style="z-index: 1; display: none;"></div>');
	     $("body").prepend("<div id='PleaseWait' style='display: none;position:absolute; z-index: 1;top:180px;right:550px;'><img src='../../../../icons/31load.gif'/></div>");


		 $('#accountDetailsWindow').jqxWindow({width: '51%', height: '60%',  maxHeight: '70%' ,maxWidth: '51%' , title: 'Accounts Search',position: { x: 300, y: 87 } , theme: 'energyblue', showCloseButton: true, keyboardCloseKey: 27});
		 $('#accountDetailsWindow').jqxWindow('close');
		 
	 $("#fromdate").jqxDateTimeInput({ width: '125px', height: '15px',formatString:"dd.MM.yyyy"});
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
	 
	 
     $('#acno').dblclick(function(){
 	 
  		  
		  $('#accountDetailsWindow').jqxWindow('open');
		 commenSearchContent('accountsDetailsSearch.jsp?');
 		    
 		   
	  }); 
	  
});
function  getacc(event){
	 var x= event.keyCode;
	 if(x==114){
	
	  $('#accountDetailsWindow').jqxWindow('open');
	
	 commenSearchContent('accountsDetailsSearch.jsp?');
	 }
	 }   
function commenSearchContent(url) {
	 
		 $.get(url).done(function (data) {
			 
			 $('#accountDetailsWindow').jqxWindow('open');
		$('#accountDetailsWindow').jqxWindow('setContent', data);

	}); 
	} 	


function funExportBtn(){
	   $("#orderlist").jqxGrid('exportdata', 'xls', 'NI Puchase Reports');
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
		   
		   var fromdocno=$("#fromdocno").val();
		   var todocno=$("#todocno").val();   
		   var fromamount=$("#fromamount").val();  
		   var toamount=$("#toamount").val(); 
		   
		   if(fromdocno!="")
			   {
			   if(todocno=="")
				   {
				   
				   $.messager.alert('Message','Enter To Doc No ','warning');   
					 
				   return false;
				   
				   }
			   else if(parseInt(todocno)<parseInt(fromdocno))
				   {
				   
				   $.messager.alert('Message','To Doc No Less Than From Doc No','warning');   
					 
				   return false;
				   
				   }
			   
			   
			   
			   }
		   
		   if(fromamount!="")
		   {
		   if(toamount=="")
			   {
			   
			   $.messager.alert('Message','Enter To Amount ','warning');   
				 
			   return false;
			   
			   }
		   
		   else if(parseFloat(toamount)<parseFloat(fromamount))
		   {
		   
		   $.messager.alert('Message','To Amount Less Than From Amount  ','warning');   
			 
		   return false;
		   
		   }
		   
		   }
	   
		   

		   
		   
		   
	 var barchval = document.getElementById("cmbbranch").value;
     var fromdate= $("#fromdate").val();
	 var todate= $("#todate").val();
	 

	 
 
	 var accdocno=$("#accdocno").val(); 
	   $("#overlay, #PleaseWait").show();
	  $("#listdiv").load("puchasereportGrid.jsp?barchval="+barchval+"&fromdate="+fromdate+"&todate="+todate+"&fromdocno="
			  +fromdocno+"&todocno="+todocno+"&fromamount="+fromamount+"&toamount="+toamount+"&accdocno="+accdocno);
	
		   }
	}
	
	
	
function funClearInfo()
{
	 
	 
	 
	  $("#fromdocno").val('');
	  $("#todocno").val('');   
	 $("#fromamount").val('');  
	 $("#toamount").val(''); 
	  $("#accdocno").val(''); 
	  
	 $("#acno").val(''); 
	 $("#accname").val(''); 
	 
	 
	  $("#fromdocno").attr('placeholder', 'From');
	  $("#todocno").attr('placeholder', 'To');
	  $("#fromamount").attr('placeholder', 'From');
	  $("#toamount").attr('placeholder', 'To');
	  
	  
	/*   $(this).attr('placeholder', '');
	  $(this).attr('placeholder', '');
	  $(this).attr('placeholder', ''); */
	  
	 
	 
}
	   
	
	
function isNumber(evt) {
    var iKeyCode = (evt.which) ? evt.which : evt.keyCode
    if (iKeyCode != 46 && iKeyCode > 31 && (iKeyCode < 48 || iKeyCode > 57))
    	{
 	  // document.getElementById("errormsg").innerText=" Enter Numbers Only";  
 	   $.messager.alert('Message',' Enter Numbers Only  ','warning');   
        return false;
    	}
   // document.getElementById("errormsg").innerText="";  
    return true;
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
                        <td class="label-cell">From</td>
                        <td><div id='fromdate' name='fromdate' value='<s:property value="fromdate"/>'></div></td>
                    </tr>
                    <tr>
                        <td class="label-cell">To</td>
                        <td><div id='todate' name='todate' value='<s:property value="todate"/>'></div></td>
                    </tr>
                </table>
            </div>

            <div class="filter-card">
                <table class="filter-table">
                    <tr>
                        <td class="label-cell">DOC NO</td>
                        <td>
                            <div class="range-container">
                                <input type="text" id="fromdocno" name="fromdocno" placeholder="From" value='<s:property value="fromdocno"/>' onkeypress="javascript:return isNumber (event);" />
                                <span>-</span>
                                <input type="text" id="todocno" name="todocno" placeholder="To" value='<s:property value="todocno"/>' onkeypress="javascript:return isNumber (event);"/>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td class="label-cell">Amount</td>
                        <td>
                            <div class="range-container">
                                <input type="text" id="fromamount" name="fromamount" style="text-align:right;" placeholder="From" value='<s:property value="fromamount"/>' onblur="funRoundAmt(this.value,this.id);" onkeypress="javascript:return isNumber (event);" />
                                <span>-</span>
                                <input type="text" id="toamount" name="toamount" style="text-align:right;" placeholder="To" value='<s:property value="toamount"/>' onblur="funRoundAmt(this.value,this.id);" onkeypress="javascript:return isNumber (event);" />
                            </div>
                        </td>
                    </tr>
                </table>
            </div>

            <div class="filter-card">
                <table class="filter-table">
                    <tr>
                        <td class="label-cell">Vendor</td>
                        <td>
                            <input type="text" id="acno" name="acno" placeholder="Press F3 To search" readonly="readonly" value='<s:property value="acno"/>' tabindex="-1" onkeydown="getacc(event);"/>
                        </td>
                    </tr> 
                    <tr>
                        <td colspan="2">
                            <input type="text" id="accname" name="accname" readonly="readonly" value='<s:property value="accname"/>' tabindex="-1"/>
                        </td>
                    </tr>
                </table>
                
                <hr style="border: 0; border-top: 1px solid #e1e8ed; margin: 15px 0;">
                
                <input type="button" class="btn-submit" name="clear" id="clear" value="Clear" onclick="funClearInfo();" style="background:#64748b !important;">
            </div>

            <div id='paychaaaaa' style="width: 100%; height: 100px;"></div>

            <div style="display:none;">
                <input type="hidden" id="accdocno" name="accdocno" readonly="readonly" value='<s:property value="accdocno"/>' tabindex="-1"/>
            </div>

        </div>
    </div>

    <div class="main-content-wrapper">
        
        <div class="top-toolbar-container">
            <jsp:include page="../../heading.jsp"></jsp:include>
        </div>

        <div class="scrollable-grid-area">
            
            <div id="listdiv">
                <jsp:include page="puchasereportGrid.jsp"></jsp:include>
            </div>

        </div>

    </div>

</div>
 
<div id="accountDetailsWindow">
	<div></div> 
</div>

</div>
</body>
</html>