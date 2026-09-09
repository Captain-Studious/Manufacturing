<jsp:include page="../../../../includes.jsp"></jsp:include>    
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%  String contextPath=request.getContextPath();%>
<!DOCTYPE html>   
<html lang="en">
<head>
<title>Delivery and Invoice Processing</title>                                                 
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">  
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="https://daneden.github.io/animate.css/animate.min.css">
<link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
<link href="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.6-rc.0/css/select2.min.css" rel="stylesheet" />
<jsp:include page="../../../../floorMgmtIncludes.jsp"></jsp:include> 

<style type="text/css"> 
/* ===== MASTER LAYOUT (Modern Flexbox) ===== */
html, body {
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

/* ===== MODERN TOP ACTION BAR ===== */
.top-action-bar {
    display: flex;
    flex-wrap: wrap;
    gap: 8px;
    align-items: center;
    background: #f8fafc;
    border: 1px solid #e3e8ee;
    border-radius: 8px;
    padding: 12px 15px;
    margin: 15px;
    box-shadow: 0 1px 3px rgba(0,0,0,0.05);
}

.action-btn {
    display: inline-flex;
    align-items: center;
    justify-content: center;
    gap: 6px;
    background-color: #ffffff;
    border: 1px solid #ccd6e0;
    color: #333;
    padding: 6px 12px;
    font-size: 13px;
    font-weight: 500;
    border-radius: 6px;
    transition: all 0.2s ease-in-out;
    box-shadow: 0 1px 2px rgba(0,0,0,0.02);
    cursor: pointer;
}

.action-btn:hover {
    background-color: #f0f4f8;
    border-color: #2563eb;
    color: #2563eb;
}

.action-btn i {
    font-size: 14px;
}

.action-btn:focus {
    outline: none;
    box-shadow: 0 0 0 2px rgba(37, 99, 235, 0.2);
}

.action-divider {
    width: 1px;
    height: 24px;
    background-color: #ccd6e0;
    margin: 0 4px;
}

/* ===== MAIN CONTENT AREA ===== */
.main-content-area {
    flex: 1;
    display: flex;
    flex-direction: column;
    background: #ffffff;
    height: 100%;
    overflow: hidden;
    width: 100%;
}

.grid-content-container {
    flex: 1;
    display: flex;
    flex-direction: column;
    padding: 0 15px 15px 15px;
    overflow: auto; 
    box-sizing: border-box;
}

.borderStyle {  
    margin-bottom: 0;
    background: #fff;
    border: 1px solid #e1e8ed;
    border-radius: 8px;
    box-shadow: 0 2px 4px rgba(0,0,0,0.02);
    overflow: hidden;
    height: 100%;
}

/* ===== MODAL & LEGACY STYLES ===== */
.modalStyle {      
    background-color:#f4f7f9; 
    padding: 15px;
    border-bottom: 1px solid #e1e8ed;
}
.modal-header h4 {
    margin: 0;
    color: #333;
    font-weight: 600;
}

.comment {
    background: #f8fafc;
    border: 1px solid #e1e8ed;
    color: #333;
    padding: 10px;
    border-radius: 8px;
    margin-bottom: 10px;
}

.msg-details {
    text-align: right;
    font-size: 11px;
    color: #888;
    margin-top: 5px;
}

.comments-container {
    height: 300px;
    overflow-y: auto;
    margin-bottom: 15px;
}

.hidden-scrollbar {
    height: 100%;
    overflow-x: hidden;
}

/* Update Modal inputs */
.modal-body input[type="text"], .modal-body select {
    height: 28px;
    border: 1px solid #ccd6e0;
    border-radius: 4px;
    padding: 2px 8px;
    font-size: 12px;
}
</style>
</head>       
<body onload="getBranch();">
<div class='hidden-scrollbar'>                                   
  <div class="master-container">
    <div class="main-content-area">

        <div class="top-action-bar">
            <button type="button" class="action-btn" id="btnsubmit" data-toggle="tooltip" title="Submit">
                <i class="fa fa-refresh"></i> Refresh
            </button>    
            <button type="button" class="action-btn" id="btnexcel" data-toggle="tooltip" title="Excel Export">
                <i class="fa fa-file-excel-o"></i> Export
            </button>    
            <button type="button" class="action-btn" id="btncalc" onclick="funcalculateinsert();" data-toggle="tooltip" title="Calculate">
                <i class="fa fa-calculator"></i> Calculate
            </button>

            <div class="action-divider"></div>

            <button type="button" class="action-btn" id="btncreatedel" data-toggle="modal" data-target="#modaldeliverynotecreation" title="Create Delivery Note">
                <i class="fa fa-tasks"></i> Delivery Note
            </button>
            <button type="button" class="action-btn" id="btncreateinv" data-toggle="modal" data-target="#modalinvoicecreation" title="Create Sales Invoice">
                <i class="fa fa-ticket"></i> Sales Invoice
            </button>
            <button type="button" class="action-btn" id="btncreateship" data-toggle="modal" data-target="#modalshipdetails" title="Create Shipping Details">
                <i class="fa fa-ship"></i> Shipping Details
            </button>

            <div class="action-divider"></div>

            <button type="button" class="action-btn" id="btnattachs" data-toggle="modal" data-target="#modalattach" title="Attach">
                <i class="fa fa-paperclip"></i> Attach
            </button>
            <button type="button" class="action-btn" id="btncomment" data-toggle="modal" title="Comments">
                <i class="fa fa-comments"></i> Comments
            </button>
            <button type="button" class="action-btn" id="btnsalesman" data-toggle="modal" data-target="#modalsalesman" title="Datewise Statistics">
                <i class="fa fa-bar-chart"></i> Date Stats
            </button>
            <button type="button" class="action-btn" id="btnclient" data-toggle="modal" data-target="#modalclient" title="Client Statistics">
                <i class="fa fa-users"></i> Client Stats
            </button>
        </div>

        <div class="grid-content-container">      
            <div id="productdiv" class="borderStyle"><jsp:include page="productGrid.jsp"></jsp:include></div>                     
        </div>

    </div>
  </div>

  <div id="modalcomments" class="modal fade" role="dialog">
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header modalStyle">     
          <button type="button" class="close" data-dismiss="modal">&times;</button>  
          <h4 class="modal-title" style="text-align:center">Comments</h4>
        </div>
        <div class="modal-body">
          <div class="comments-outer-container container-fluid">
            <div class="comments-container">                
            </div>
            <div class="create-msg-container">
                <div class="row">
                  <div class="col-xs-12">   
                    <div class="input-group">
                      <input type="text" class="form-control" placeholder="Please Type In" id="txtcomment">
                      <div class="input-group-btn">
                        <button type="button" id="btncommentsend" class="btn btn-primary">
                          <i class="fa fa-paper-plane"></i>
                        </button>
                      </div>
                    </div>
                  </div>
                </div>
            </div>
          </div>
        </div>  
      </div>
    </div>
  </div>
    
  <div id="modaldeliverynotecreation" class="modal fade" role="dialog">  
    <div class="modal-dialog modal-lg">
      <div class="modal-content">
        <div class="modal-header modalStyle">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title" style="text-align:center">Delivery Note Creation</h4>      
        </div>
        <div class="modal-body">
          <table width="100%" style="border-spacing: 0 10px; border-collapse: separate;">
          <tr>
            <td align="right" style="padding-right:10px;"><label class="branch">Description</label></td>
            <td align="left"><input type="text" id="desc" name="desc" style="width:96%;"/></td>
            
            <td align="right" style="padding-right:10px;"><label class="branch">Sales Person</label></td>
            <td align="left">
                <input type="text" id="txtsalesperson" name="txtsalesperson" readonly style="width:96%;" placeholder="Press F3 to Search" onkeydown="getSalesPerson(event);">
                <input type="hidden" id="salespersonid" name="salespersonid" />
            </td>
            
            <td align="right" style="padding-right:10px;"><label class="branch">Date</label></td>
            <td align="left"><div id="deldate" style="width:96%;" name="deldate" value='<s:property value="deldate"/>'></div></td>
          </tr>
          <tr>
            <td align="right" style="padding-right:10px;"><label class="branch">Branch</label></td>
            <td align="left"><input type="text" id="sorbrhid" name="sorbrhid" style="width:96%;" readonly/></td>
            
            <td align="right" style="padding-right:10px;"><label class="branch">Location</label></td>
            <td align="left" colspan="3"><select id="sorlocation" name="sorlocation" style="width:98%;" value='<s:property value="sorlocation"/>'></select></td>
          </tr>
          </table>
        </div>
        <div class="modal-footer">
          <button type="button" id="savedeliverynote" class="btn btn-primary" data-dismiss="modal">Save</button>
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>  
      </div>  
    </div>
  </div>   
    
  <div id="modalinvoicecreation" class="modal fade" role="dialog">  
    <div class="modal-dialog modal-lg">
      <div class="modal-content">
        <div class="modal-header modalStyle">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title" style="text-align:center">Invoice Creation</h4>      
        </div>
        <div class="modal-body">
          <table width="100%" style="border-spacing: 0 10px; border-collapse: separate;">
          <tr>
            <td align="right" style="padding-right:10px;"><label class="branch">Description</label></td>
            <td align="left"><input type="text" id="invdesc" name="invdesc" style="width:96%;"  /></td>
            
            <td align="right" style="padding-right:10px;"><label class="branch">Pay Terms</label></td>
            <td align="left"><input type="text" id="pterms" name="pterms" style="width:96%;"  /></td>
            
            <td align="right" style="padding-right:10px;"><label class="branch">Date</label></td>
            <td align="left"><div id="invdate" style="width:96%;" name="invdate" value='<s:property value="invdate"/>'></div></td>
          </tr>
          <tr>
            <td align="right" style="padding-right:10px;"><label class="branch">Branch</label></td>
            <td align="left"><input type="text" id="sorbrhid2" name="sorbrhid2" style="width:96%;" readonly/></td>
            
            <td align="right" style="padding-right:10px;"><label class="branch">Location</label></td>
            <td align="left" colspan="3"><select id="sorlocation2" name="sorlocation2" style="width:98%;" value='<s:property value="sorlocation2"/>'></select></td>
          </tr>
          </table>
        </div>
        <div class="modal-footer">
          <button type="button" id="saveinvoice" class="btn btn-primary" data-dismiss="modal">Save</button>
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>  
      </div>  
    </div>
  </div>
    
  <div id="modalshipdetails" class="modal fade" role="dialog">  
    <div class="modal-dialog modal-lg">
      <div class="modal-content">
        <div class="modal-header modalStyle">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title" style="text-align:center">Shipping Details</h4>      
        </div>
        <div class="modal-body">
          <table width="100%" style="border-spacing: 0 10px; border-collapse: separate;">
          <tr>
            <td align="right" style="padding-right:10px;"><label class="branch">Vessel</label></td>
            <td align="left"><input type="text" id="txtvessel" name="txtvessel" style="width:96%;" /></td>
            <td align="right" style="padding-right:10px;"><label class="branch">IMO</label></td>
            <td align="left"><input type="text" id="txtimo" name="txtimo" style="width:96%;" /></td>
          </tr>
          <tr>
            <td align="right" style="padding-right:10px;"><label class="branch">Type</label></td>
            <td align="left"><input type="text" id="txttype" name="txttype" style="width:96%;" /></td>
            <td align="right" style="padding-right:10px;"><label class="branch">Port</label></td>
            <td align="left"><input type="text" id="txtport" name="txtport" style="width:96%;" /></td>
            <td align="right" style="padding-right:10px;"><label class="branch">Agent</label></td>
            <td align="left"><input type="text" id="txtagent" name="txtagent" style="width:96%;" /></td>
          </tr>
          </table>
        </div>
        <div class="modal-footer">
          <button type="button" id="saveshipdetails" class="btn btn-primary" data-dismiss="modal">Save</button>
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>  
      </div>  
    </div>
  </div>

  <div id="modalsalesman" class="modal fade" role="dialog" style="z-index: 1050;">  
    <div class="modal-dialog modal-lg">
      <div class="modal-content">
        <div class="modal-header modalStyle">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title" style="text-align:center">Datewise Statistics</h4>      
        </div>
        <div class="modal-body">
        <div id="salmdiv" style="height: 350px; border: 1px solid #ccc;"><jsp:include page="salesmanGrid.jsp"></jsp:include></div>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>  
      </div>  
    </div>
  </div>  

  <div id="modalclient" class="modal fade" role="dialog" style="z-index: 1050;">  
    <div class="modal-dialog modal-lg">
      <div class="modal-content">
        <div class="modal-header modalStyle">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title" style="text-align:center">Client Statistics</h4>    
        </div>
        <div class="modal-body">
        <div id="crmdiv" style="height: 350px; border: 1px solid #ccc;"><jsp:include page="clientGrid.jsp"></jsp:include></div>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>  
      </div>  
    </div>
  </div>
  
  <div id="sidesearchwndow"><div></div></div>
  <div id="salespersonwindow"><div></div><div></div></div>
  <div id="locationwindow"><div></div></div>

  <input type="hidden" name="hidbrhid" id="hidbrhid">  
  <input type="hidden" name="srvdetmtrno" id="srvdetmtrno">
  <input type="hidden" name="hidcomments" id="hidcomments"> 
  <input type="hidden" name="rowindexg" id="rowindexg"> 
  <input type="hidden" name="hidpsrno" id="hidpsrno"> 
  <input type="hidden" id="locationid" name="locationid"> 
  <input type="hidden" id="hiddelno" name="hiddelno"> 
  <input type="hidden" id="hidbrchname" name="hidbrchname">
  <input type="hidden" id="hidbrchid" name="hidbrchid">
  <div style="display:none;">
    <div id='fromdate' name='fromdate'></div>
    <div id='todate' name='todate'></div>
  </div>

</div>		

<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@7.24.4/dist/sweetalert2.all.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.6-rc.0/js/select2.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/js-cookie@2/src/js.cookie.min.js"></script>
<script type="text/javascript">   
$(document).ready(function(){ 
    $('[data-tooltip="tooltip"]').tooltip();
    $("#deldate").jqxDateTimeInput({ width: '100%', height: '24px', formatString:"dd.MM.yyyy"}); 
    $("#invdate").jqxDateTimeInput({ width: '100%', height: '24px', formatString:"dd.MM.yyyy"}); 
    
    $('#sidesearchwndow').jqxWindow({ width: '55%', height: '92%',  maxHeight: '85%' ,maxWidth: '80%' ,title: 'Product Search ' , position: { x: 300, y: 0 }, keyboardCloseKey: 27});
    $('#sidesearchwndow').jqxWindow('close');
    
    $('#salespersonwindow').jqxWindow({width : '25%',height : '58%',maxHeight : '70%',maxWidth : '45%',title : 'Sales Person Search',position : {x : 420,y : 87},theme : 'energyblue',showCloseButton : true,keyboardCloseKey : 27});
	$('#salespersonwindow').jqxWindow('close');
	
    $('#locationwindow').jqxWindow({width : '25%',height : '58%',maxHeight : '70%',maxWidth : '45%',title : 'Location Search',position : {x : 420,y : 87},theme : 'energyblue',showCloseButton : true,keyboardCloseKey : 27});
	$('#locationwindow').jqxWindow('close');
	
    $('#txtsalesperson').dblclick(function(){
	    if($('#mode').val()!= "view"){
	    	salespersonSearchContent('salesPersonSearch.jsp');
	    }
	});
	$('#txtlocation').dblclick(function(){
	    if($('#mode').val()!= "view"){
	    	$('#locationwindow').jqxWindow('open');
	    	locationSearchContent('locationSearch.jsp');  
	    }
	});

    $("body").prepend('<div id="overlay" class="ui-widget-overlay" style="z-index: 1000; display: none;"></div>');
	$("body").prepend("<div id='PleaseWait' style='display: none;position:absolute; z-index: 1001;top:50%;left:50%;transform:translate(-50%,-50%);'><img src='../../../../icons/31load.gif'/></div>");
    $('[data-toggle="tooltip"]').tooltip(); 
    	 
    $('#savedeliverynote').click(function(){
    	funStockCheck(1);
    });
    	 
    $('#saveinvoice').click(function(){ 
    	var delno=$('#hiddelno').val();
    	if(parseInt(delno)>0){
    		funSaveInvoice();   
    	}
    	else{
    		funStockCheck(2);
    	}
    });
    
    $('#btnattachs').click(function(){ 
        funAttachs(event);      
    });
    $('#btnsubmit').click(function(){ 
        $('#jqxpdpGrid').jqxGrid('clear');
        $('#srvdetmtrno').val(''); 
        funload(); 
        $('#salmdiv').load('salesmanGrid.jsp?id='+1);   
        $('#crmdiv').load('clientGrid.jsp?id='+1);      
    });          
    $('#btnexcel').click(function(){         
 	    $("#productdiv").excelexportjs({
 			containerid: "productdiv",   
 			datatype: 'json',
 			dataset: null,
 			gridId: "jqxpdpGrid",
 			columns: getColumns("jqxpdpGrid") ,       
 			worksheetName:"Delivery and Invoice Processing"                
 		}); 
    });   
    $('#btncomment').click(function(){
        getComments();  
        var rows = $("#jqxpdpGrid").jqxGrid('getrows');
    	var selectedrows=$("#jqxpdpGrid").jqxGrid('selectedrowindexes');
    	selectedrows = selectedrows.sort(function(a,b){return a - b});
    	if(selectedrows.length==0){
    		$("#overlay, #PleaseWait").hide();
    		$.messager.alert('Warning','Select a document.');
    		return false;
    	}
    	if(selectedrows.length>1){
    		$.messager.alert('Warning','Select a single document.');
    		return false;
    	}
      	$('#modalcomments').modal('toggle');              
    });
    $('#btncreatepr').click(function(){        
   	    funCreateRequest();       
    });
    $('#btnload').click(function(){        
        funSetWorkorderGrid();  
    });
    $('#btncreate').click(function(){        
        funCreateBlending();  
    });
    $('#btnbomentry').click(function(){        
        funCreateBomEntry();  
    });
    $('#saveshipdetails').click(function(){        
        funSaveshipdetails();  
    });
    $('#btncreatedel').click(function(){        
        funSetbrchinv(1);  
    });
    $('#btncreateinv').click(function(){        
        funSetbrchinv(2);  
    });
    $('#btncommentsend').click(function(){
        var txtcomment=$('#txtcomment').val();
        var rows = $("#jqxpdpGrid").jqxGrid('getrows');
  		var selectedrows=$("#jqxpdpGrid").jqxGrid('selectedrowindexes');
  		selectedrows = selectedrows.sort(function(a,b){return a - b});
  		if(selectedrows.length==0){
  			$("#overlay, #PleaseWait").hide();
  			$.messager.alert('Warning','Select a document.');
  			return false;
  		}
  		if(selectedrows.length>1){
  			$.messager.alert('Warning','Select a single document.');
  			return false;
  		}
        if(txtcomment==""){
          	swal({
  				type: 'error',
  				title: 'Warning',
  				text: 'Please type in comment'
  			});
          	return false;
        }
        saveComment();
    });
         
    $('.warningpanel div button').click(function(){
        var gridrows=$('#jqxpdpGrid').jqxGrid('getrows');
        if(gridrows.length==0){
        	swal({
				type: 'warning',
				title: 'Warning',
				text: 'Please submit'
			});
			return false;
        }
        $(this).toggleClass('active');  
        if($(this).hasClass('active')){
        	addGridFilters($(this).attr('id'),$(this).attr('data-filtervalue'),$(this).attr('data-datafield'),$(this).attr('data-filtertype'),$(this).attr('data-filtercondition'));
        }
        else{
        	$('#jqxpdpGrid').jqxGrid('removefilter',$(this).attr('data-datafield'), true);
        }
    });  
});
    
function productSearchContent(url) {
   	$.get(url).done(function (data) {
   		$('#sidesearchwndow').jqxWindow('open');
   		$('#sidesearchwndow').jqxWindow('setContent', data);
   	}); 
} 
    
function funStockCheck(chkid){
	$('#jqxpdpGrid').jqxGrid('clearfilters', true);    
	var rows = $("#jqxpdpGrid").jqxGrid('getrows');
	var selectedrows=$("#jqxpdpGrid").jqxGrid('selectedrowindexes');
	
    if(selectedrows.length==0){
		$("#overlay, #PleaseWait").hide();
		$.messager.alert('Warning','Select documents.');
		return false;
	}
		
	var i=0;var temptrno="";           
	var j=0;
	var clientid=0;
	var locid=$('#sorlocation').val();
	var brhid=$('#hidbrchid').val();
	var orderdoc="",cur=0,currate=0;
	var ordertype="";
	var tmpcount=rows.length;
	var blndArray=new Array();
	for (i = 0; i < selectedrows.length; i++) {
        var chk=selectedrows[i];
        var chkpsrno=rows[chk].psrno;
        clientid=rows[chk].clientid;
        cur=rows[chk].curid;
        currate=rows[chk].rate;
        if(orderdoc==""){
           	orderdoc=rows[chk].orderdoc;
        }
        else{
           	orderdoc=orderdoc+","+rows[chk].orderdoc;
        }
        ordertype=rows[chk].otype;
        if(!(typeof(chkpsrno)==="undefined" || chkpsrno==null || chkpsrno=="")){           
           	blndArray.push(rows[chk].psrno+" :: "+rows[chk].specid+" :: "+rows[chk].qty+" :: "+rows[chk].rsvqtychk+" :: "+rows[chk].rsvstockid+" :: "+brhid+" :: "+locid);
        }
	}
	checkstock(blndArray,chkid);
}
    
function checkstock(blndArray,chkid){
	var x=new XMLHttpRequest();
	x.onreadystatechange=function(){
		if (x.readyState==4 && x.status==200){
			var items=x.responseText;
			var item = items.split('::');
			var method=item[0];
			var aa=item[1];
			     
			if((parseInt(method)==2) || (parseInt(method)==0))  
			{	
				$.messager.alert('Message', '  Product Not In Stock ');
			}
			else
			{
				if(parseInt(chkid)==1){
					funSaveDeliveryNote();
				}
				if(parseInt(chkid)==2){
					funSaveInvoice();
				}
			}
		}
	}
    x.open("GET","checkStock.jsp?productarray="+encodeURIComponent(blndArray),true);			
	x.send();
}
   
function funSetbrchinv(chkid){
    var brchname=$('#hidbrchname').val();
    var brchid=$('#hidbrchid').val();
    if(parseInt(chkid)==1){
	    $('#sorbrhid').val(brchname);
    }
    if(parseInt(chkid)==2){
	    $('#sorbrhid2').val(brchname);
    }
    getDefaultLocation(brchid,chkid);
}

function getDefaultLocation(brchid,chkid){
   	var x = new XMLHttpRequest();
	x.onreadystatechange = function() {
		if (x.readyState == 4 && x.status == 200) {
			var items= x.responseText.trim();
			items=items.split('***');
			var docno=items[1].split(",");
		    var type=items[0].split(",");
		    var optionstype = '';
		    for ( var i = 0; i < type.length; i++) {
		        optionstype += '<option value="' + docno[i] + '">' + type[i] + '</option>';
			}
		    if(parseInt(chkid)==1){
		        $("select#sorlocation").html(optionstype); 
		    }
		    if(parseInt(chkid)==2){
		    	$("select#sorlocation2").html(optionstype); 
		    }
		}
	}
	x.open("GET", "getTestLocation.jsp?brhid="+brchid, true);
	x.send();
}
   
function saveComment(){  
    var comment=$('#txtcomment').val();
    $('#hidcomments').val($('#txtcomment').val());
   	if (($(hidcomments).val()).includes('$')) { $(hidcomments).val($(hidcomments).val().replace(/$/g, ''));};
    if (($(hidcomments).val()).includes('%')) { $(hidcomments).val($(hidcomments).val().replace(/%/g, ''));};
   	if (($(hidcomments).val()).includes('^')) { $(hidcomments).val($(hidcomments).val().replace(/^/g, ''));};
    if (($(hidcomments).val()).includes('`')) { $(hidcomments).val($(hidcomments).val().replace(/`/g, ''));};
   	if (($(hidcomments).val()).includes('~')) { $(hidcomments).val($(hidcomments).val().replace(/~/g, ''));};
    if ($(hidcomments).val().indexOf('\'')  >= 0 ) { $(hidcomments).val($(hidcomments).val().replace(/'/g, ''));};
   	if (($(hidcomments).val()).includes(',')) { $(hidcomments).val($(hidcomments).val().replace(/,/g, ''));}
   	if ($(hidcomments).val().indexOf('"') >= 0) { $(hidcomments).val($(hidcomments).val().replace(/["']/g, ''));};
   	if (($(hidcomments).val()).match(/\\/g)) { $(hidcomments).val($(hidcomments).val().replace(/\\/g, ''));}; 
   	 
    var rows = $("#jqxpdpGrid").jqxGrid('getrows');
	var selectedrows=$("#jqxpdpGrid").jqxGrid('selectedrowindexes');
	selectedrows = selectedrows.sort(function(a,b){return a - b});

	if(selectedrows.length==0){
		$("#overlay, #PleaseWait").hide();
		return false;
	}
	if(selectedrows.length>1){
		return false;
	}
	else{
		for (i = 0; i < selectedrows.length; i++) {
			var srvdetmtrno= $('#jqxpdpGrid').jqxGrid('getcellvalue', selectedrows[i], "doc_no");
			var x=new XMLHttpRequest();
			x.onreadystatechange=function(){
				if (x.readyState==4 && x.status==200)
				{
					var items=x.responseText.trim().split(",");
					$('#txtcomment').val(''); 
					getComments(); 		
				}
			}
			x.open("GET","saveComment.jsp?comment="+encodeURIComponent($('#hidcomments').val())+"&enqno="+srvdetmtrno,true);
			x.send();
		}
	}
}

function getSalesPerson(event){
    var x= event.keyCode;
    if(x==114){
      	salespersonSearchContent('salesPersonSearch.jsp');  	 
    }
}
   	
function salespersonSearchContent(url) {
   	$('#salespersonwindow').jqxWindow('open');
   	$.get(url).done(function(data) {
   		$('#salespersonwindow').jqxWindow('setContent', data);
   		$('#salespersonwindow').jqxWindow('bringToFront');
   	});
}
   	
function getLocation(event){
	var x= event.keyCode;
	if(x==114){
	   	locationSearchContent('locationSearch.jsp');  	 
    }
}
		
function locationSearchContent(url) {
	$('#locationwindow').jqxWindow('open');
	$.get(url).done(function(data) {
		$('#locationwindow').jqxWindow('setContent', data);
		$('#locationwindow').jqxWindow('bringToFront');
	});
}

function getComments(){
    var rows = $("#jqxpdpGrid").jqxGrid('getrows');
	var selectedrows=$("#jqxpdpGrid").jqxGrid('selectedrowindexes');
	selectedrows = selectedrows.sort(function(a,b){return a - b});

	if(selectedrows.length==0){
		$("#overlay, #PleaseWait").hide();
		return false;
	}
	if(selectedrows.length>1){
		return false;
	}
	else{
		for (i = 0; i < selectedrows.length; i++) {
			var srvdetmtrno= $('#jqxpdpGrid').jqxGrid('getcellvalue', selectedrows[i], "doc_no");
			var x=new XMLHttpRequest();
			x.onreadystatechange=function(){
				if (x.readyState==4 && x.status==200)
				{
					var items=x.responseText.trim().split(",");
					var str='';
					if(items!=''){ 
						for(var i=0;i<items.length;i++){
							str+='<div class="comment"><div class="msg"><p>'+items[i].split("::")[0]+'</p></div><div class="msg-details"><p>'+items[i].split("::")[1]+' - '+items[i].split("::")[2]+'</p></div></div>';
						}
						$('.comments-container').html($.parseHTML(str));		
					}
				}   
			}
			x.open("GET","getComments.jsp?enqno="+srvdetmtrno,true);
			x.send(); 
		}
	}
}

function funAttachs(event){                            
	var brchid="<%= session.getAttribute("BRANCHID").toString() %>";
	var rows = $("#jqxpdpGrid").jqxGrid('getrows');
	var selectedrows=$("#jqxpdpGrid").jqxGrid('selectedrowindexes');
	selectedrows = selectedrows.sort(function(a,b){return a - b});

	if(selectedrows.length==0){
		$("#overlay, #PleaseWait").hide();
		$.messager.alert('Warning','Select a document.');
		return false;
	}
	if(selectedrows.length>1){
		$.messager.alert('Warning','Select a single document.');
		return false;
	}
	else{
		for (i = 0; i < selectedrows.length; i++) {
			var srvdetmtrno= $('#jqxpdpGrid').jqxGrid('getcellvalue', selectedrows[i], "doc_no");
			var type= $('#jqxpdpGrid').jqxGrid('getcellvalue', selectedrows[i], "otype");
			var frmdet="";
   			var fname="";
			if(type=="SOR"){
				frmdet="SOR";
				fname="Sales Order";
			}else{
				 frmdet="STKO";
				 fname="Stock Order";
			}
   		    var myWindow= window.open("<%=contextPath%>/com/common/Attachmaster.jsp?formCode="+frmdet+"&docno="+srvdetmtrno+"&brchid="+brchid+"&frmname="+fname,"_blank","top=180,left=310,Width=800,Height=430,location=no,scrollbars=no,toolbar=no,resizable=no,meanubar=no,titlebar=no");
			myWindow.focus();  
		}
	}
} 

function addGridFilters(id,filtervalue,datafield,filtertype,filtercondition){   
    var filtergroup = new $.jqx.filter();
    var filter_or_operator = 1;
	var filter1 = filtergroup.createfilter(filtertype, filtervalue, filtercondition);
	filtergroup.addfilter(filter_or_operator, filter1);
	$("#jqxpdpGrid").jqxGrid('addfilter', datafield, filtergroup);
	$("#jqxpdpGrid").jqxGrid('applyfilters');     
}

function funload(){  
	$('#productdiv').load("productGrid.jsp?id="+1);   
}
  
function funSaveshipdetails(){
    $('#jqxpdpGrid').jqxGrid('clearfilters', true);    
    var rows = $("#jqxpdpGrid").jqxGrid('getrows');
    var selectedrows=$("#jqxpdpGrid").jqxGrid('selectedrowindexes');
    var vessel=$('#txtvessel').val();
    var imo=$('#txtimo').val();
    var type=$('#txttype').val();
    var port=$('#txtport').val();
    var agent=$('#txtagent').val();
    var shipArray=new Array();
    
    if(selectedrows.length==0){
    	$("#overlay, #PleaseWait").hide();
    	$.messager.alert('Warning','Select documents.');
    	return false;
    }
    		
    $.messager.confirm('Message', 'Do you want to save shipping details?', function(r){
    	if(r==false)
    	{
    		return false; 
    	}
    	else
    	{
    		$("#overlay, #PleaseWait").show();
    		for (var i = 0; i < selectedrows.length; i++) {
    	        var chk=selectedrows[i];
    	        var chkpsrno=rows[chk].psrno;
    	        var ddoc=rows[chk].ddoc;
    	        var orderno=rows[chk].orderdoc;
    	            
    	        if(!(typeof(chkpsrno)==="undefined" || chkpsrno==null || chkpsrno=="")){           
    	            shipArray.push(orderno+" :: "+ddoc+" :: "+chkpsrno+" :: "+vessel+" :: "+imo+" :: "+type+" :: "+port+" :: "+agent);
    	        }
    		}
    		savedetails(shipArray);
    	}
    });
}
   
function savedetails(shipArray){
    var x=new XMLHttpRequest();
    x.onreadystatechange=function(){
     	if (x.readyState==4 && x.status==200){
     		var items=x.responseText;
     		var item = items.split('::');
     		var method=item[0];
     		var aa=item[1];
     			     
     		if(parseInt(method)>0)  
     		{	
     			$("#overlay, #PleaseWait").hide();
     			$.messager.alert('Message', '  Shipping Details '+aa+' Successfully Saved ');
     		}
     		else
     		{
     			$("#overlay, #PleaseWait").hide();
     			$.messager.alert('Message', '  Not Saved  ');
     		}
     	}
    }
    x.open("GET","saveShippingDetails.jsp?productarray="+encodeURIComponent(shipArray),true);			
    x.send();
}
    
function funSaveDeliveryNote(){
    $('#jqxpdpGrid').jqxGrid('clearfilters', true);    
	var rows = $("#jqxpdpGrid").jqxGrid('getrows');
	var selectedrows=$("#jqxpdpGrid").jqxGrid('selectedrowindexes');
	if(selectedrows.length==0){
		$("#overlay, #PleaseWait").hide();
		$.messager.alert('Warning','Select documents.');
		return false;
	}
		
	$.messager.confirm('Message', 'Do you want to create delivery note?', function(r){
		if(r==false)
		{
			return false; 
		}
		else
		{
			$("#overlay, #PleaseWait").show();
			var i=0;var temptrno="";           
			var j=0;
			var clientid=0;
	        var locid=$('#sorlocation').val();
	        var orderdoc="",cur=0,currate=0;
	        var ordertype="";
			var tmpcount=rows.length;
			var blndArray=new Array();
			for (i = 0; i < selectedrows.length; i++) {
                var chk=selectedrows[i];
                var chkpsrno=rows[chk].psrno;
                clientid=rows[chk].clientid;
                cur=rows[chk].curid;
                currate=rows[chk].rate;
                if(orderdoc==""){
            	    orderdoc=rows[chk].orderdoc;
                }
                else{
            	    orderdoc=orderdoc+","+rows[chk].orderdoc;
                }
                ordertype=rows[chk].otype;
                if(!(typeof(chkpsrno)==="undefined" || chkpsrno==null || chkpsrno=="")){           
            	    blndArray.push(rows[chk].psrno+" :: "+rows[chk].uomid+" :: "+rows[chk].qty+" :: "+"0"+" :: "+"0"+" :: "+ 
            	    rows[chk].unitprice+" :: "+rows[chk].total+" :: "+rows[chk].disper+" :: "+rows[chk].dis+" :: "+rows[chk].netotal+" :: "+rows[chk].specid+" :: "+
            	    "0"+" :: "+rows[chk].stockid+" :: "+"0"+" :: "+rows[chk].foc+" :: "+"0");
                }
			}
			savedeliverynote(blndArray,clientid,locid,orderdoc,ordertype,cur,currate);
		}
	});
}
    
function savedeliverynote(blndArray,clientid,locid,orderdoc,ordertype,cur,currate){
    var spersonid=$('#salespersonid').val();
    var desc=$('#desc').val();
    var deldate=$('#deldate').val();
  	var promdate="";
  	var x=new XMLHttpRequest();
  	x.onreadystatechange=function(){
  		if (x.readyState==4 && x.status==200){
  			var items=x.responseText;
  			var item = items.split('::');
  			var method=item[0];
  			var aa=item[1];
  			if(parseInt(method)>0)  
  			{	
  				$("#overlay, #PleaseWait").hide();
  				$.messager.alert('Message', '  Delivery Note '+aa+' Successfully Created ');
  				funload();
  			}
  			else
  			{
  				$("#overlay, #PleaseWait").hide();
  				$.messager.alert('Message', '  Not Created  ');
  			}
  		}
  	}
    x.open("GET","saveDeliveryNote.jsp?productarray="+encodeURIComponent(blndArray)+"&desc="+desc+"&salespersonid="+spersonid+"&clientid="+clientid+"&locid="+locid+"&deldate="+deldate+"&orderdoc="+orderdoc+"&ordertype="+ordertype+"&currency="+cur+"&rate="+currate,true);			
  	x.send();
}
    
function funSaveInvoice(){
    $('#jqxpdpGrid').jqxGrid('clearfilters', true);    
	var rows = $("#jqxpdpGrid").jqxGrid('getrows');
	var selectedrows=$("#jqxpdpGrid").jqxGrid('selectedrowindexes');
	
	if(selectedrows.length==0){
		$("#overlay, #PleaseWait").hide();
		$.messager.alert('Warning','Select documents.');
		return false;
	}
		
	$.messager.confirm('Message', 'Do you want to create invoice?', function(r){
		if(r==false)
		{
			return false; 
		}
		else
		{
			$("#overlay, #PleaseWait").show();
			var i=0;var temptrno="";           
			var j=0;
			var totalsum=0;
			var netotalsum=0;
			var tmpcount=rows.length;
			var clientid=0;
			var locid=$('#sorlocation').val();
	        var clacno=0;
	        var taxamtsum=0;
	        var orderdoc="",cur=0,currate=0;
	        var ordertype="";
			var blndArray=new Array();
			
			for (i = 0; i < selectedrows.length; i++) {
                var chk=selectedrows[i];
                var chkpsrno=rows[chk].psrno;
                clientid=rows[chk].clientid;
                clacno=rows[chk].clacno;
                cur=rows[chk].curid;
                currate=rows[chk].rate;
                if(orderdoc==""){
            	    orderdoc=rows[chk].orderdoc;
                }
                else{
            	    orderdoc=orderdoc+","+rows[chk].orderdoc;
                }
            
                ordertype=rows[chk].otype;
                totalsum=parseFloat(totalsum)+parseFloat(rows[chk].total);
                netotalsum=parseFloat(netotalsum)+parseFloat(rows[chk].netotal);
                taxamtsum=parseFloat(taxamtsum)+parseFloat(rows[chk].taxamount);
            
                if(!(typeof(chkpsrno)==="undefined" || chkpsrno==null || chkpsrno=="")){           
            	    blndArray.push(rows[chk].psrno+" :: "+rows[chk].uomid+" :: "+rows[chk].qty+" :: "+"0"+" :: "+"0"+" :: "+
            			 rows[chk].unitprice+" :: "+rows[chk].total+" :: "+rows[chk].discper+" :: "+rows[chk].dis+" :: "+rows[chk].nettotal+" :: "+rows[chk].specid+" :: "+
            			"0"+" :: "+rows[chk].stockid+"::"+"0"+" :: "+rows[chk].foc+" :: "+rows[chk].locid+" :: "+rows[chk].taxper+" :: "
            			 +rows[chk].netotal+" :: "+"0"+" :: "+000+" :: "+"0"+" :: "+"0"+" :: "+rows[chk].taxamount+" :: "+"0000"+" :: ");
                }
			}
			savesaleinvoice(blndArray,clientid,locid,totalsum,netotalsum,clacno,taxamtsum,orderdoc,ordertype,cur,currate);
		}
	});
}
    
function savesaleinvoice(blndArray,clientid,locid,totalsum,netotalsum,clacno,taxamtsum,orderdoc,ordertype,cur,currate){
    var pterms=$('#pterms').val();
    var desc=$('#invdesc').val();
    var invdate=$('#invdate').val();
    var delno=$('#hiddelno').val();
    var locid=$('#sorlocation2').val();
  	var promdate="";
  	var x=new XMLHttpRequest();
  	x.onreadystatechange=function(){
  		if (x.readyState==4 && x.status==200){
  			var items=x.responseText;
  			var item = items.split('::');
  			var method=item[0];
  			var aa=item[1];
  			if(parseInt(method)>0)  
  			{	
  				$("#overlay, #PleaseWait").hide();
  				$.messager.alert('Message', '  Invoice '+aa+' Successfully Created ');
  			}
  			else
  			{
  				$("#overlay, #PleaseWait").hide();
  				$.messager.alert('Message', '  Not Created  ');
  			}
  		}
  	}
    x.open("GET","saveInvoice.jsp?productarray="+encodeURIComponent(blndArray)+"&desc="+desc+"&pterms="+pterms+"&clientid="+clientid+"&locid="+locid+"&invdate="+invdate+"&totalsum="+totalsum+"&netotalsum="+netotalsum+"&clacno="+clacno+"&taxamtsum="+taxamtsum+"&orderdoc="+orderdoc+"&ordertype="+ordertype+"&delno="+delno+"&currency="+cur+"&rate="+currate,true);			
  	x.send();
}
</script>   
</body>    
</html>