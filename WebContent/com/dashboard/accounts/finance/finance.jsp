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

.filter-table div[id^="fromdate"],
.filter-table div[id^="todate"] {
    width: 100%;
}

/* Paired range inputs (Doc Range, Amount Range) */
.range-row {
    display: flex;
    align-items: center;
    gap: 6px;
}
.range-row span {
    font-size: 12px;
    color: #4e5e71;
    flex-shrink: 0;
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

/* Document-type label row — kept from original, used directly in this page */
.account {
    color: black;
    background-color: #E0ECF8;
    width: 100%;
    height: 28px;
    font-family: Myriad Pro;
    font-weight: bold;
    display: inline-block;
    padding: 4px 10px;
    box-sizing: border-box;
}
.accname {
    color: black;
    font-family: inherit;
    font-weight: 600;
}
</style>
<script type="text/javascript">

	$(document).ready(function () {
		 $("#fromdate").jqxDateTimeInput({ width: '125px', height: '15px',formatString:"dd.MM.yyyy"});
		 $("#todate").jqxDateTimeInput({ width: '125px', height: '15px',formatString:"dd.MM.yyyy"});
		 
		 $('#accountDetailsWindow').jqxWindow({width: '51%', height: '58%',  maxHeight: '70%' ,maxWidth: '51%' , title: 'Accounts Search',position: { x: 300, y: 87 } , theme: 'energyblue', showCloseButton: true, keyboardCloseKey: 27});
		 $('#accountDetailsWindow').jqxWindow('close');
		 
		 $("body").prepend('<div id="overlay" class="ui-widget-overlay" style="z-index: 1; display: none;"></div>');
	     $("body").prepend("<div id='PleaseWait' style='display: none;position:absolute; z-index: 1;top:180px;right:550px;'><img src='../../../../icons/31load.gif'/></div>");
		 
		 var curfromdate= $('#fromdate').jqxDateTimeInput('getDate');
	     var oneyeardate=new Date(new Date(curfromdate).setMonth(curfromdate.getMonth()-1));
	     var oneyearbackdate=new Date(new Date(oneyeardate).setDate(oneyeardate.getDate()));
	     $('#fromdate ').jqxDateTimeInput('setDate', new Date(oneyearbackdate));
	     
	     $('#txtaccid').dblclick(function(){
	    	  if($('#cmbtype').val()==''){
    			 $.messager.alert('Message','Account Type is Mandatory.','warning');
    			 return 0;
    		  }
	    	  
	    	  if($('#cmbtype').val()==null){
	    			 $.messager.alert('Message','Account Search Not Available.','warning');
	    			 return 0;
	    	   }
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
	
	function getDocumentType() {
		var x = new XMLHttpRequest();
		x.onreadystatechange = function() {
			if (x.readyState == 4 && x.status == 200) {
				var items = x.responseText;
				items = items.split('####');
				var dtypeItems = items[0].split(",");
				var menuItems = items[1].split(",");
				var optionssalutn = '<option value="">--Select--</option>';
				for (var i = 0; i < menuItems.length; i++) {
					optionssalutn += '<option value="' + dtypeItems[i] + '">'
							+ menuItems[i] + '</option>';
				}
				$("select#cmbdoctype").html(optionssalutn);
				if ($('#hidcmbdoctype').val() != null) {
					$('#cmbdoctype').val($('#hidcmbdoctype').val());
				}
			} else {
			}
		}
		x.open("GET", "getDocumentType.jsp", true);
		x.send();
	} 
	
	function getAccTypeFrom(event){
        var x= event.keyCode;
        if(x==114){
          if($('#cmbtype').val()==''){
   			 $.messager.alert('Message','Account Type is Mandatory.','warning');
   			 return 0;
   		  }
          if($('#cmbtype').val()==null){
 			 $.messager.alert('Message','Account Search Not Available.','warning');
 			 return 0;
 	      }
      	  accountsSearchContent('accountsDetailsSearch.jsp');
        }
        else{}
        }
		
	function funExportBtn(){
		 var dtype=$('#cmbdoctype').val();
		
		 if(dtype=='CRV'){JSONToCSVCon(dataExcelExport, 'CashReceiptVoucher', true);}if(dtype=='CPV'){JSONToCSVCon(dataExcelExport, 'CashPaymentVoucher', true);}
		 if(dtype=='BRV'){JSONToCSVCon(dataExcelExport1, 'BankReceiptVoucher', true);}if(dtype=='BPV'){JSONToCSVCon(dataExcelExport1, 'BankPaymentVoucher', true);}
		 if(dtype=='CNO'){JSONToCSVCon(dataExcelExport2, 'CreditVoucher', true);}if(dtype=='DNO'){JSONToCSVCon(dataExcelExport2, 'DebitVoucher', true);}
		 if(dtype=='JVT'){JSONToCSVCon(dataExcelExport3, 'JournalVoucher', true);}if(dtype=='IJV'){JSONToCSVCon(dataExcelExport3, 'IBJournalVoucher', true);}
		 if(dtype=='PC'){JSONToCSVCon(dataExcelExport, 'PettyCashVoucher', true);}if(dtype=='COT'){JSONToCSVCon(dataExcelExport4, 'ContraTransVoucher', true);}
		 if(dtype=='SEC'){JSONToCSVCon(dataExcelExport5, 'SecurityCheque', true);}if(dtype=='UCP'){JSONToCSVCon(dataExcelExport6, 'UnclearedChequePaymentVoucher', true);}
		 if(dtype=='UCR'){JSONToCSVCon(dataExcelExport6, 'UnclearedChequeReceiptVoucher', true);}if(dtype=='FCR'){JSONToCSVCon(dataExcelExport, 'FuelCardReimbursement', true);}
		 if(dtype=='ICRV'){JSONToCSVCon(dataExcelExport, 'IBCashReceiptVoucher', true);}if(dtype=='ICPV'){JSONToCSVCon(dataExcelExport, 'IBCashPaymentVoucher', true);}
		 if(dtype=='IBR'){JSONToCSVCon(dataExcelExport1, 'IBBankReceiptVoucher', true);}if(dtype=='IBP'){JSONToCSVCon(dataExcelExport1, 'IBBankPaymentVoucher', true);}
	    
	} 
	
	function isNumber(evt) {
        var iKeyCode = (evt.which) ? evt.which : evt.keyCode
        if (iKeyCode != 46 && iKeyCode > 31 && (iKeyCode < 48 || iKeyCode > 57))
         {
          $.messager.alert('Message',' Enter Numbers Only ','warning');    
            return false;
         }
        return true;
    }

	function  funClearInfo(){
		
		$('#cmbbranch').val('a');
		$('#fromdate').val(new Date());
		var curfromdate= $('#fromdate').jqxDateTimeInput('getDate');
	    var oneyeardate=new Date(new Date(curfromdate).setMonth(curfromdate.getMonth()-1));
	    var oneyearbackdate=new Date(new Date(oneyeardate).setDate(oneyeardate.getDate()));
	    $('#fromdate ').jqxDateTimeInput('setDate', new Date(oneyearbackdate));
	     
	    $('#todate').val(new Date());
	    
	    document.getElementById("lbldoctype").innerHTML="";
	    document.getElementById("cmbdoctype").value="";
	    document.getElementById("txtdocrangefrom").value="";
		document.getElementById("txtdocrangeto").value="";
		document.getElementById("txtamtrangefrom").value="";
		document.getElementById("txtamtrangeto").value="";
		document.getElementById("cmbtype").value="";
		document.getElementById("txtaccid").value="";
		document.getElementById("txtaccname").value="";
		document.getElementById("txtdocno").value="";
		
		$("#jqxCashVoucher").jqxGrid('clear');$("#jqxBankVoucher").jqxGrid('clear');$("#jqxCreditDebitVoucher").jqxGrid('clear');$("#jqxJournalVoucher").jqxGrid('clear');
		$("#jqxContraTransVoucher").jqxGrid('clear');$("#securityChequeList").jqxGrid('clear');$("#jqxUnclearedChequeVoucher").jqxGrid('clear');
		
		$("#jqxCashVoucher").jqxGrid('addrow', null, {});$("#jqxBankVoucher").jqxGrid('addrow', null, {});$("#jqxCreditDebitVoucher").jqxGrid('addrow', null, {});
		$("#jqxJournalVoucher").jqxGrid('addrow', null, {});$("#jqxContraTransVoucher").jqxGrid('addrow', null, {});$("#securityChequeList").jqxGrid('addrow', null, {});
		$("#jqxUnclearedChequeVoucher").jqxGrid('addrow', null, {});
		 
		$("#cashDiv").prop("hidden", false);$("#bankDiv").prop("hidden", true);$("#creditDiv").prop("hidden", true);$("#journalDiv").prop("hidden", true);$("#contraDiv").prop("hidden", true);
		$("#securityChqDiv").prop("hidden", true);$("#unclearedChqDiv").prop("hidden", true);
		
		if (document.getElementById("txtaccid").value == "") {
		        $('#txtaccid').attr('placeholder', 'Press F3 to Search'); 
		}
			
		}

	function docTypeInfo(){
		
		 	document.getElementById("lbldoctype").innerHTML="";
		    document.getElementById("txtdocrangefrom").value="";
			document.getElementById("txtdocrangeto").value="";
			document.getElementById("txtamtrangefrom").value="";
			document.getElementById("txtamtrangeto").value="";
			document.getElementById("cmbtype").value="";
			document.getElementById("txtaccid").value="";
			document.getElementById("txtaccname").value="";
			document.getElementById("txtdocno").value="";
			
			$("#jqxCashVoucher").jqxGrid('clear');$("#jqxBankVoucher").jqxGrid('clear');$("#jqxCreditDebitVoucher").jqxGrid('clear');$("#jqxJournalVoucher").jqxGrid('clear');
			$("#jqxContraTransVoucher").jqxGrid('clear');$("#securityChequeList").jqxGrid('clear');$("#jqxUnclearedChequeVoucher").jqxGrid('clear');
			
			$("#jqxCashVoucher").jqxGrid('addrow', null, {});$("#jqxBankVoucher").jqxGrid('addrow', null, {});$("#jqxCreditDebitVoucher").jqxGrid('addrow', null, {});
			$("#jqxJournalVoucher").jqxGrid('addrow', null, {});$("#jqxContraTransVoucher").jqxGrid('addrow', null, {});$("#securityChequeList").jqxGrid('addrow', null, {});
			$("#jqxUnclearedChequeVoucher").jqxGrid('addrow', null, {});
			 
			$("#cashDiv").prop("hidden", false);$("#bankDiv").prop("hidden", true);$("#creditDiv").prop("hidden", true);$("#journalDiv").prop("hidden", true);$("#contraDiv").prop("hidden", true);
			$("#securityChqDiv").prop("hidden", true);$("#unclearedChqDiv").prop("hidden", true);
			
			if($('#cmbdoctype').val()=='FCR'){
				$('#cmbtype').attr('disabled', true);
			}else{
				$('#cmbtype').attr('disabled', false);
			}
			
			if (document.getElementById("txtaccid").value == "") {
		        $('#txtaccid').attr('placeholder', 'Press F3 to Search'); 
			}
	}
	
	function clearAccountInfo(){
		$('#txtdocno').val('');$('#txtaccid').val('');$('#txtaccname').val('');
		if (document.getElementById("txtaccid").value == "") {
	        $('#txtaccid').attr('placeholder', 'Press F3 to Search'); 
		}
	} 
	
	function funreload(event){
		
		 var branchval = document.getElementById("cmbbranch").value;
		 var fromdate = $('#fromdate').val();
		 var todate = $('#todate').val();
		 var accdocno = $('#txtdocno').val();
		 var dtype=$('#cmbdoctype').val();
		 var docrangefrom=$('#txtdocrangefrom').val();
		 var docrangeto=$('#txtdocrangeto').val();
		 var amtrangefrom=$('#txtamtrangefrom').val();
		 var amtrangeto=$('#txtamtrangeto').val();
		 var chk=1;
		 
		if(dtype==''){
			 $.messager.alert('Message','Please Choose Document Type.','warning');
			 return 0;
		 }
		 
		 var documenttype='';
		 if(dtype=='CRV'){documenttype='Listing of Cash Receipt Voucher (CRV)';}if(dtype=='CPV'){documenttype='Listing of Cash Payment Voucher (CPV)';}
		 if(dtype=='BRV'){documenttype='Listing of Bank Receipt Voucher (BRV)';}if(dtype=='BPV'){documenttype='Listing of Bank Payment Voucher (BPV)';}
		 if(dtype=='CNO'){documenttype='Listing of Credit Note (CNO)';}if(dtype=='DNO'){documenttype='Listing of Debit Note (DNO)';}
		 if(dtype=='JVT'){documenttype='Listing of Journal Voucher (JVT)';}if(dtype=='IJV'){documenttype='Listing of IB-Journal Voucher (IJV)';}
		 if(dtype=='PC'){documenttype='Listing of Petty Cash (PC)';}if(dtype=='COT'){documenttype='Listing of Contra Trans (COT)';}
		 if(dtype=='SEC'){documenttype='Listing of Security Cheque (SEC)';}if(dtype=='UCP'){documenttype='Listing of Uncleared Cheque Payment (UCP)';}
		 if(dtype=='UCR'){documenttype='Listing of Uncleared Cheque Receipt (UCR)';}if(dtype=='FCR'){documenttype='Listing of Fuel Card Reimbursement (FCR)';}
		 if(dtype=='ICRV'){documenttype='Listing of IB-Cash Receipt Voucher (ICRV)';}if(dtype=='ICPV'){documenttype='Listing of IB-Cash Payment Voucher (ICPV)';}
		 if(dtype=='IBR'){documenttype='Listing of IB-Bank Receipt Voucher (IBR)';}if(dtype=='IBP'){documenttype='Listing of IB-Bank Payment Voucher (IBP)';}
		
		 $("#overlay, #PleaseWait").show();
		 
		 document.getElementById("lbldoctype").innerText=documenttype; 
		 if(dtype=='CRV' || dtype=='CPV' || dtype=='ICRV' || dtype=='ICPV' || dtype=='PC' || dtype=='FCR'){
			 $("#unclearedChqDiv").prop("hidden", true);$("#securityChqDiv").prop("hidden", true);$("#contraDiv").prop("hidden", true);$("#cashDiv").prop("hidden", false);$("#bankDiv").prop("hidden", true);$("#creditDiv").prop("hidden", true);$("#journalDiv").prop("hidden", true);
				 $("#cashDiv").load("cashVoucher.jsp?branchval="+branchval+'&fromdate='+fromdate+'&todate='+todate+'&accdocno='+accdocno+'&dtype='+dtype
						 +'&docrangefrom='+docrangefrom+'&docrangeto='+docrangeto+'&amtrangefrom='+amtrangefrom+'&amtrangeto='+amtrangeto+'&chk='+chk);
		 } else if(dtype=='BRV' || dtype=='BPV' || dtype=='IBR' || dtype=='IBP'){
			 $("#unclearedChqDiv").prop("hidden", true);$("#securityChqDiv").prop("hidden", true);$("#contraDiv").prop("hidden", true);$("#creditDiv").prop("hidden", true);$("#bankDiv").prop("hidden", false);$("#cashDiv").prop("hidden", true);$("#journalDiv").prop("hidden", true);
			 $("#bankDiv").load("bankVoucher.jsp?branchval="+branchval+'&fromdate='+fromdate+'&todate='+todate+'&accdocno='+accdocno+'&dtype='+dtype
					 +'&docrangefrom='+docrangefrom+'&docrangeto='+docrangeto+'&amtrangefrom='+amtrangefrom+'&amtrangeto='+amtrangeto+'&chk='+chk);
	     } else if(dtype=='CNO' || dtype=='DNO'){
	    	 $("#unclearedChqDiv").prop("hidden", true);$("#securityChqDiv").prop("hidden", true);$("#contraDiv").prop("hidden", true);$("#creditDiv").prop("hidden", false);$("#bankDiv").prop("hidden", true);$("#cashDiv").prop("hidden", true);$("#journalDiv").prop("hidden", true);
			 $("#creditDiv").load("creditVoucher.jsp?branchval="+branchval+'&fromdate='+fromdate+'&todate='+todate+'&accdocno='+accdocno+'&dtype='+dtype
					 +'&docrangefrom='+docrangefrom+'&docrangeto='+docrangeto+'&amtrangefrom='+amtrangefrom+'&amtrangeto='+amtrangeto+'&chk='+chk);
	     } else if(dtype=='COT'){
	    	 $("#unclearedChqDiv").prop("hidden", true);$("#securityChqDiv").prop("hidden", true);$("#contraDiv").prop("hidden", false);$("#creditDiv").prop("hidden", true);$("#bankDiv").prop("hidden", true);$("#cashDiv").prop("hidden", true);$("#journalDiv").prop("hidden", true);
			 $("#contraDiv").load("contraTransVoucher.jsp?branchval="+branchval+'&fromdate='+fromdate+'&todate='+todate+'&accdocno='+accdocno+'&dtype='+dtype
					 +'&docrangefrom='+docrangefrom+'&docrangeto='+docrangeto+'&amtrangefrom='+amtrangefrom+'&amtrangeto='+amtrangeto+'&chk='+chk);
	     } else if(dtype=='SEC'){
	    	 $("#unclearedChqDiv").prop("hidden", true);$("#securityChqDiv").prop("hidden", false);$("#contraDiv").prop("hidden", true);$("#creditDiv").prop("hidden", true);$("#bankDiv").prop("hidden", true);$("#cashDiv").prop("hidden", true);$("#journalDiv").prop("hidden", true);
			 $("#securityChqDiv").load("securityCheque.jsp?branchval="+branchval+'&fromdate='+fromdate+'&todate='+todate+'&accdocno='+accdocno+'&dtype='+dtype
					 +'&docrangefrom='+docrangefrom+'&docrangeto='+docrangeto+'&amtrangefrom='+amtrangefrom+'&amtrangeto='+amtrangeto+'&chk='+chk);
	     } else if(dtype=='UCP' || dtype=='UCR'){
			 $("#unclearedChqDiv").prop("hidden", false);$("#securityChqDiv").prop("hidden", true);$("#contraDiv").prop("hidden", true);$("#creditDiv").prop("hidden", true);$("#bankDiv").prop("hidden", true);$("#cashDiv").prop("hidden", true);$("#journalDiv").prop("hidden", true);
			 $("#unclearedChqDiv").load("unclearedVoucher.jsp?branchval="+branchval+'&fromdate='+fromdate+'&todate='+todate+'&accdocno='+accdocno+'&dtype='+dtype
					 +'&docrangefrom='+docrangefrom+'&docrangeto='+docrangeto+'&amtrangefrom='+amtrangefrom+'&amtrangeto='+amtrangeto+'&chk='+chk);
	     }else {
	    	 $("#unclearedChqDiv").prop("hidden", true);$("#securityChqDiv").prop("hidden", true);$("#journalDiv").prop("hidden", false);$("#contraDiv").prop("hidden", true);$("#creditDiv").prop("hidden", true);$("#bankDiv").prop("hidden", true);$("#cashDiv").prop("hidden", true);
			 $("#journalDiv").load("journalVoucher.jsp?branchval="+branchval+'&fromdate='+fromdate+'&todate='+todate+'&accdocno='+accdocno+'&dtype='+dtype
					 +'&docrangefrom='+docrangefrom+'&docrangeto='+docrangeto+'&amtrangefrom='+amtrangefrom+'&amtrangeto='+amtrangeto+'&chk='+chk);
		 }
		 
		}
	
</script>
</head>
<body onload="getBranch();getDocumentType();">
<div id="mainBG" class="homeContent" data-type="background">
<div class='hidden-scrollbar'>

<div class="master-container">

    <div class="sidebar-filters">
        <div class="sidebar-scroll-content">

            <div class="filter-card">
                <table class="filter-table">
                    <tr>
                        <td class="label-cell" style="width: 70px;">Period</td>
                        <td><div id="fromdate" name="fromdate" value='<s:property value="fromdate"/>'></div></td>
                    </tr>
                    <tr>
                        <td class="label-cell" style="width: 70px;">To</td>
                        <td><div id="todate" name="todate" value='<s:property value="todate"/>'></div></td>
                    </tr>
                    <tr>
                        <td class="label-cell" style="width: 70px;">Dtype</td>
                        <td>
                            <select id="cmbdoctype" name="cmbdoctype" onchange="docTypeInfo();" value='<s:property value="cmbdoctype"/>'>
                                <option value="">--Select--</option>
                            </select>
                            <input type="hidden" id="hidcmbdoctype" name="hidcmbdoctype" value='<s:property value="hidcmbdoctype"/>'/>
                        </td>
                    </tr>
                    <tr>
                        <td class="label-cell" style="width: 70px;">Doc. Range</td>
                        <td>
                            <div class="range-row">
                                <input type="text" id="txtdocrangefrom" name="txtdocrangefrom" onkeypress="javascript:return isNumber(event)" value='<s:property value="txtdocrangefrom"/>'/>
                                <span>-</span>
                                <input type="text" id="txtdocrangeto" name="txtdocrangeto" onkeypress="javascript:return isNumber(event)" value='<s:property value="txtdocrangeto"/>'/>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td class="label-cell" style="width: 70px;">Amount Range</td>
                        <td>
                            <div class="range-row">
                                <input type="text" id="txtamtrangefrom" name="txtamtrangefrom" style="text-align: right;" onkeypress="javascript:return isNumber(event)" onblur="funRoundAmt(this.value,this.id);" value='<s:property value="txtamtrangefrom"/>'/>
                                <span>-</span>
                                <input type="text" id="txtamtrangeto" name="txtamtrangeto" style="text-align: right;" onkeypress="javascript:return isNumber(event)" onblur="funRoundAmt(this.value,this.id);" value='<s:property value="txtamtrangeto"/>'/>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td class="label-cell" style="width: 70px;">Type</td>
                        <td>
                            <select id="cmbtype" name="cmbtype" onchange="clearAccountInfo();" value='<s:property value="cmbtype"/>'>
                                <option value="">--Select--</option>
                                <option value="AP">AP</option>
                                <option value="AR">AR</option>
                                <option value="GL">GL</option>
                                <option value="HR">HR</option>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td class="label-cell" style="width: 70px;">Account</td>
                        <td>
                            <input type="text" id="txtaccid" name="txtaccid" readonly="readonly" placeholder="Press F3 to Search" value='<s:property value="txtaccid"/>' onkeydown="getAccTypeFrom(event);"/>
                        </td>
                    </tr>
                    <tr>
                        <td class="label-cell"></td>
                        <td>
                            <input type="text" id="txtaccname" name="txtaccname" readonly="readonly" value='<s:property value="txtaccname"/>' tabindex="-1"/>
                            <input type="hidden" id="txtdocno" name="txtdocno" value='<s:property value="txtdocno"/>'/>
                        </td>
                    </tr>
                </table>
            </div>

            <div class="filter-card">
                <input type="button" class="btn-submit" name="clear" id="clear" value="Clear" onclick="funClearInfo();">
            </div>

        </div>
    </div>

    <div class="main-content-wrapper">

        <div class="top-toolbar-container">
            <jsp:include page="../../heading.jsp"></jsp:include>
        </div>

        <div class="scrollable-grid-area">

            <div style="margin-bottom: 10px;">
                <label class="account">Document Type :&nbsp;<span class="accname" name="lbldoctype" id="lbldoctype"></span></label>
            </div>

            <div id="cashDiv"><jsp:include page="cashVoucher.jsp"></jsp:include></div>
            <div id="bankDiv" hidden="true"><jsp:include page="bankVoucher.jsp"></jsp:include></div>
            <div id="creditDiv" hidden="true"><jsp:include page="creditVoucher.jsp"></jsp:include></div>
            <div id="journalDiv" hidden="true"><jsp:include page="journalVoucher.jsp"></jsp:include></div>
            <div id="contraDiv" hidden="true"><jsp:include page="contraTransVoucher.jsp"></jsp:include></div>
            <div id="securityChqDiv" hidden="true"><jsp:include page="securityCheque.jsp"></jsp:include></div>
            <div id="unclearedChqDiv" hidden="true"><jsp:include page="unclearedVoucher.jsp"></jsp:include></div>

        </div>

    </div>

</div>

<div id="accountDetailsWindow"><div></div></div>

</div>
</div>
</body>
</html>