<jsp:include page="../../../../includes.jsp"></jsp:include>    
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<html>
<% String contextPath=request.getContextPath();%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>GatewayERP(i)</title>
<link href="../../../../css/dashboard.css" media="screen" rel="stylesheet" type="text/css" />  
<script type="text/javascript" src="<%=contextPath%>/js/ajaxfileupload.js"></script>
<script type="text/javascript" src="<%=contextPath%>/js/resample.js"></script>
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

/* Account Banner Custom Styling Maintained */
.account-banner {
    background-color: #E0ECF8;
    padding: 8px 15px;
    border-radius: 6px;
    margin-bottom: 15px;
    display: flex;
    align-items: center;
}
.account {
    color: black;
    font-family: 'Myriad Pro', sans-serif;
    font-weight: bold;
    font-size: 13px;
}
.accname {
    color: black;
    font-family: 'Comic Sans MS', cursive, sans-serif;
    font-size: 13px;
}

/* Net Amount Footer Wrapper */
.net-amount-footer {
    display: flex;
    justify-content: flex-end;
    align-items: center;
    margin-top: 15px;
    padding: 12px 20px;
    background: #fff;
    border: 1px solid #e1e8ed;
    border-radius: 8px;
}
.net-amount-label {
    font-family: 'Myriad Pro', sans-serif;
    font-size: 13px;
    font-weight: bold;
    color: #4e5e71;
    margin-right: 10px;
}

/* Blinking Status Animation Maintained */
.status {
    color: #FD8725;
    font-family: 'Comic Sans MS', cursive, sans-serif;
    font-size: 20px;
    font-weight: bold;
    display: inline-block;
    margin-bottom: 10px;
}
#lblclientstatus {
  -moz-animation: blink 1s infinite alternate;
  -webkit-animation: blink 1s infinite alternate;
  animation: blink 1s infinite alternate;
}
@-moz-keyframes blink { from { opacity: 1; } to { opacity: 0; } }
@-webkit-keyframes blink { from { opacity: 1; } to { opacity: 0; } }
@keyframes blink { from { opacity: 1; } to { opacity: 0; } }
</style>
<script type="text/javascript">

	$(document).ready(function () {
		 $("#fromdate").jqxDateTimeInput({ width: '125px', height: '15px',formatString:"dd.MM.yyyy"});
		 $("#todate").jqxDateTimeInput({ width: '125px', height: '15px',formatString:"dd.MM.yyyy"});
		 
		 $("body").prepend('<div id="overlay" class="ui-widget-overlay" style="z-index: 1; display: none;"></div>');
	     $("body").prepend("<div id='PleaseWait' style='display: none;position:absolute; z-index: 1;top:180px;right:550px;'><img src='../../../../icons/31load.gif'/></div>");
	     
		 $('#accountDetailsWindow').jqxWindow({width: '51%', height: '58%',  maxHeight: '70%' ,maxWidth: '51%' , title: 'Accounts Search',position: { x: 300, y: 87 } , theme: 'energyblue', showCloseButton: true, keyboardCloseKey: 27});
		 $('#accountDetailsWindow').jqxWindow('close');
		 
		 var year = window.parent.txtaccountperiodfrom.value;
		 var newDate = year.split('-');
		 year = newDate[1] + "-" + newDate[0] + "-" + newDate[2];
		 $('#fromdate ').jqxDateTimeInput('setDate', new Date(year));
		 
		 $('#txtaccid').dblclick(function(){
			  accountsSearchContent('accountsDetailsSearch.jsp');
	     });
		 
	});
	
	function accountsSearchContent(url) {
	    $('#accountDetailsWindow').jqxWindow('open');
		$.get(url).done(function (data) {
		$('#accountDetailsWindow').jqxWindow('setContent', data);
		$('#accountDetailsWindow').jqxWindow('bringToFront');
	}); 
	}
	
	function funExportBtn(){
		if(($('#lbldetailname').text()=='Accounts Statement AP')){
			JSONToCSVCon(dataExcelExport, 'AccountsStatementAP', true);
        }else if(($('#lbldetailname').text()=='Accounts Statement AR')){
			JSONToCSVCon(dataExcelExport, 'AccountsStatementAR', true);
        }else if(($('#lbldetailname').text()=='Accounts Statement GL')){
			JSONToCSVCon(dataExcelExport, 'AccountsStatementGL', true);
        }
	} 
	
	function getAccTypeFrom(event){
        var x= event.keyCode;
        if(x==114){
      		accountsSearchContent('accountsDetailsSearch.jsp');
        }
        else{}
        }
	
	function getAccountingPeriod(date){
  		var x = new XMLHttpRequest();
  		x.onreadystatechange = function() {
  			if (x.readyState == 4 && x.status == 200) {
  				var items = x.responseText;
  			    $('#txtaccountperiodfrom').val(items);
  		}
  		}
  		x.open("GET", "getAccountingPeriod.jsp?fromDate="+date, true);
  		x.send();
 }
	
	function getAccountFromPeriod(){
		
		 var date = $('#fromdate').val();
		 getAccountingPeriod(date);
			  
	 		if($('#txtaccountperiodfrom').val()<0){
			  $.messager.alert('Message','Not in Account-Period.','warning');
			  return;
		   }
		
	}
	
	function funreload(event){
		
		if($('#txtaccountperiodfrom').val()<0){
			  $.messager.alert('Message','Not in Account-Period.','warning');
			  return;
		   }
		
		 var branchval = document.getElementById("cmbbranch").value;
		 var fromdate = $('#fromdate').val();
		 var todate = $('#todate').val();
		 var accdocno = $('#txtdocno').val();
		 
		 if(accdocno==''){
			 $.messager.alert('Message','Account is Mandatory.','warning');
			 return 0;
		 }
		
		 $("#overlay, #PleaseWait").show();
		 
		 document.getElementById("lblaccountname").innerText=$('#txtaccname').val(); 
		 $("#accountsStatementDiv").load("accountsStatementTypeGrid.jsp?branchval="+branchval+'&fromdate='+fromdate+'&todate='+todate+'&accdocno='+accdocno+'&check=1');
		}
	
	function funPrintAccountStatement(){
    	if ($("#txtdocno").val()!="") {
	        var url=document.URL;
	        var reurl=url.split("accountsStatementType.jsp");
	        $("#txtdocno").prop("disabled", false);
	        var win= window.open(reurl[0]+"../../../../com/dashboard/accounts/accountsstatement/printAccountsStatement?acno="+document.getElementById("txtdocno").value+'&netamount='+document.getElementById("txtnetamount").value+'&branch='+document.getElementById("cmbbranch").value+'&fromDate='+document.getElementById("fromdate").value+'&toDate='+$('#todate').val()+'&email=Nil&print=1',"_blank","top=150,left=250,Width=1020,Height=500,location=no,scrollbars=no,toolbar=yes");
	        win.focus();
	     }
	    else {
			$.messager.alert('Message','Account is Mandatory.','warning');
			return;
		}
    }
	
	function funSendingEmail() {  
		
	    var email = document.getElementById("txtaccemail").value;
	    var res;var part1;var part2;var dotsplt;
	    if(email.indexOf("@")>=0) {
		    res = email.split('@');
		    part1=res[0];
		    part2=res[1];
		    dotsplt=part2.split('.');
	    }
	    
	   if ($("#txtdocno").val().trim()=="" || typeof($("#txtdocno").val().trim())=="undefined" || typeof($("#txtdocno").val().trim())=="NaN") {
		    $('#txtaccid').val('');$('#txtaccname').val('');$('#txtdocno').val('');$('#txtaccemail').val('');
			
			if (document.getElementById("txtaccid").value == "") {
		        $('#txtaccid').attr('placeholder', 'Press F3 to Search'); 
		    }
			$.messager.alert('Message','Account is Mandatory.','warning');
			return;
	  } else  if(email.trim()=="" || typeof(email.trim())=="undefined" || typeof(email.trim())=="NaN") {
		    $.messager.alert('Message','Email is not Configured Properly.','warning');
			return;
	  } else if(email.indexOf("@")<0) {
		    $.messager.alert('Message','Email is not Configured Properly.','warning');
			return;
	  } else if(email.split('@').length!=2) {
		    $.messager.alert('Message','Email is not Configured Properly.','warning');
			return;
	  } else if(part1.length==0) {
		    $.messager.alert('Message','Email is not Configured Properly.','warning');
			return;
	  } else if(part1.split(" ").length>2) {
		    $.messager.alert('Message','Email is not Configured Properly.','warning');
			return;
      } else if(part2.split(".").length<2) {
    	    $.messager.alert('Message','Email is not Configured Properly.','warning');
			return;
      } else if(dotsplt[0].length==0 ) {
    	    $.messager.alert('Message','Email is not Configured Properly.','warning');
			return;
      } else if(dotsplt[1].length<2 ||dotsplt[1].length>4) {
    	    $.messager.alert('Message','Email is not Configured Properly.','warning');
			return;
      } else {
 		
		    $("#overlay, #PleaseWait").show();
		   
	 		$.ajaxFileUpload ({  
	    	    	
	    	    	  url: 'printAccountsStatement.action?acno='+document.getElementById("txtdocno").value+'&netamount='+document.getElementById("txtnetamount").value+'&branch='+document.getElementById("cmbbranch").value+'&fromDate='+document.getElementById("fromdate").value+'&toDate='+$('#todate').val()+'&email='+$('#txtaccemail').val()+'&print=0',  
	    	          secureuri:false,//false  
	    	          fileElementId:'file', //id  <input type="file" id="file" name="file" />  
	    	          dataType: 'string',// json  
	    	          success: function (data, status) {  
	
	    	             if(status=='success'){
							$("#overlay, #PleaseWait").hide();
							$.messager.alert('Message','E-Mail Send Successfully');
	    	              }
	    	             if(status=='error'){
	    	            	 $("#overlay, #PleaseWait").hide();
	    	            	 $.messager.alert('Message','E-Mail Sending failed');
	    	             }
	    	             
	    	              $("#testImg").attr("src",data.message);
	    	              if(typeof(data.error) != 'undefined')  
	    	              {  
	    	                  if(data.error != '')  
	    	                  {  
	    	                      alert(data.error);  
	    	                  }else  
	    	                  {  
	    	                      alert(data.message);  
	    	                  }  
	    	              }  
	    	          },  
	    	           error: function (data, status, e)
	    	          {  
	    	              alert(e);  
	    	          }  
	    	      }) 
	    	     return false;
 		
		  } 
      }
	  
	  function getClientStatus(){
  		var x = new XMLHttpRequest();
  		x.onreadystatechange = function() {
  			if (x.readyState == 4 && x.status == 200) {
  				var items = x.responseText;
  				items = items.split('####');
  			    $('#lblclientstatus').html(items[0]);
  		}
  		}
  		x.open("GET", "getClientStatus.jsp?accountno="+$("#txtdocno").val().trim(), true);
  		x.send();
 	}
	
</script>
</head>
<body onload="getBranch();">
<div id="mainBG" class="homeContent" data-type="background"> 
<form id="frmAccountStatementType" action="saveAccountStatementType" method="post" autocomplete="off">
<div class='hidden-scrollbar'>

<div class="master-container">

    <div class="sidebar-filters">
        <div class="sidebar-scroll-content">

            <div class="filter-card">
                <table class="filter-table">
                    <tr>
                        <td class="label-cell">Period</td>
                        <td><div id="fromdate" name="fromdate" onchange="getAccountFromPeriod();" value='<s:property value="fromdate"/>'></div></td>
                    </tr>
                    <tr>
                        <td class="label-cell">To</td>
                        <td><div id="todate" name="todate" value='<s:property value="todate"/>'></div></td>
                    </tr>
                </table>
            </div>

            <div class="filter-card">
                <table class="filter-table">
                    <tr>
                        <td class="label-cell">Account</td>
                        <td>
                            <input type="text" id="txtaccid" name="txtaccid" readonly="readonly" placeholder="Press F3 to Search" value='<s:property value="txtaccid"/>' onkeydown="getAccTypeFrom(event);"/>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <input type="text" id="txtaccname" name="txtaccname" readonly="readonly" value='<s:property value="txtaccname"/>' tabindex="-1"/>
                        </td>
                    </tr>
                </table>
            </div>

            <div class="filter-card" style="text-align: center;">
                <label class="status" id="lblclientstatus" name="lblclientstatus"><s:property value="lblclientstatus"/></label>
                <hr style="border: 0; border-top: 1px solid #e1e8ed; margin: 12px 0;">
                <button class="btn-submit" type="button" id="btnPrintAccount" name="btnPrintAccount" onclick="funPrintAccountStatement(event);">Account Statement</button>
            </div>

            <div style="display:none;">
                <input type="hidden" id="txtdocno" name="txtdocno" value='<s:property value="txtdocno"/>'/>
                <input type="hidden" id="txtaccemail" name="txtaccemail" value='<s:property value="txtaccemail"/>'/>
                <input type="hidden" id="txtaccountperiodfrom" name="txtaccountperiodfrom" value='<s:property value="txtaccountperiodfrom"/>'/>
            </div>

        </div>
    </div>

    <div class="main-content-wrapper">
        
        <div class="top-toolbar-container">
            <jsp:include page="../../heading.jsp"></jsp:include>
        </div>

        <div class="scrollable-grid-area">
            
            <div class="account-banner">
                <label class="account">Account :&nbsp;</label>
                <label class="accname" name="lblaccountname" id="lblaccountname"></label>
            </div>

            <div id="accountsStatementDiv">
                <jsp:include page="accountsStatementTypeGrid.jsp"></jsp:include>
            </div>

            <div class="net-amount-footer">
                <span class="net-amount-label">Net Amount :</span>
                <input type="text" id="txtnetamount" name="txtnetamount" style="width: 150px; text-align: right; font-weight: bold; background: #fff;" value='<s:property value="txtnetamount"/>' readonly/>
            </div>

        </div>

    </div>

</div>

</div>
</form>

<div id="accountDetailsWindow">
	<div></div><div></div>
</div>

</div> 
</body>
</html>