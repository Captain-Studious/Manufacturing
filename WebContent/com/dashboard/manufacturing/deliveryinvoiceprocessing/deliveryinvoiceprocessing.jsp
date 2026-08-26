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
     #border1 {
	  border-radius: 25px;
	  padding: 8px;
	  -moz-box-shadow:    inset 0 0 3px #000000;
      -webkit-box-shadow: inset 0 0 3px #000000;
      box-shadow:         inset 0 0 3px #000000;   
    }  
  .btn-group>.btn:first-child:not(:last-child):not(.dropdown-toggle) {     
    border-radius: 30px !important;       
} 
  .btn:focus,.btn:active {
   outline: none !important;
   box-shadow: none;
   }
   .modalStyle {      
    background-color:#33b5e5; 
    padding: 10px; 
   }
   .borderStyle{  
    margin-bottom: 0;
    white-space: nowrap;
    vertical-align: middle;
    -ms-touch-action: manipulation;
    touch-action: manipulation;
    border: none;
    line-height: 1.42857143;
    -webkit-user-select: none;
    -moz-user-select: none;
    -ms-user-select: none;
    user-select: none;
    box-shadow: 1px 2px 7px 3px #d4cece;                          
    position: relative;
   -webkit-transition: all 0.3s;
   -moz-transition: all 0.3s;
   transition: all 0.3s;
  }   
  .iconStyle{
	color: #000000 !important;  
	display: inline-block;
	border: none;
	transition: all 0.4s ease 0s;   
  }
  .btnStyle{  
  	display: inline-block;   
    margin-bottom: 0;
    font-weight: 400;
    margin-right:5px;
    text-align: center;
    white-space: nowrap;
    vertical-align: middle;
    -ms-touch-action: manipulation;
    touch-action: manipulation;
    cursor: pointer;
    background-image: none;
    border: none;
    padding: 3px 8px;  
    font-size: 14px;
    line-height: 1.42857143;
    border-radius: 30px;
    -webkit-user-select: none;
    -moz-user-select: none;
    -ms-user-select: none;
    user-select: none;
    box-shadow: 0px 2px 3px 0.1px rgba(0, 0, 0, 0.6);                     
    position: relative;
   -webkit-transition: all 0.3s;
   -moz-transition: all 0.3s;
   transition: all 0.3s;
  }
   @media (min-width: 900px) {               
  .modal-xl {
    width: 100%;  
   max-width:1200px;  
  }
} 
   .textpanel{
    color: blue;
  }   
    .custompanel{
      float: left;
      display: inline-block;
      margin-top: 0px; 
      padding-top: 10px;
      padding-bottom: 0px;
      border-radius: 8px;
    }
    .badge-notify{
	   position:absolute;right:-5px;top:-8px;z-index:2;background-color:red;
	} 
	.comment{
      background-image: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
      color: #fff;
      clear:both;
      float: right;
      display: block;
      padding-top: 8px;
      padding-bottom: 2px;
      padding-left: 10px;
      padding-right: 5px;
      border-radius: 12px;
      border-top-right-radius: 0;
      margin-bottom: 8px;
      transition:all 0.5s ease-in;
    }
    .msg-details{
      text-align: right;
    }
    .comments-container{
      height: 400px;
      overflow-y: auto;
      margin-bottom: 8px;
      padding-right: 5px;
    }
    .comments-outer-container{
      width: 100%;
      height: 100%;
    }
    .msg{
    	word-break:break-all;
    }
    .rowgap{
    	margin-bottom:6px;
    }
    
.select2-selection--single {
    width: 100%;
}
  </style>
</head>       
<body> 
<div class='hidden-scrollbar'>                                   
  <div class="container-fluid" >
    <div class="row" >
      <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
        <div class="primarypanel custompanel" style="margin-left:5px;">  
             <div id="border1">           
	  			<button type="button" class="btn btn-default btnStyle" id="btnsubmit"  data-toggle="tooltip" title="Submit" data-placement="bottom"><i class="fa fa-refresh iconStyle" aria-hidden="true"></i></button>    
	          	<button type="button" class="btn btn-default btnStyle" id="btnexcel" data-toggle="tooltip" title="Excel Export" data-placement="bottom"><i class="fa fa-file-excel-o " aria-hidden="true"></i></button>    
                <button type="button" class="btn btn-default btnStyle" id="btncalc"  data-toggle="tooltip" onclick="funcalculateinsert();" title="Calculate" data-placement="bottom"><i class="fa fa-calculator" aria-hidden="true"></i></button>
            </div>                                    
	  	 </div>
	  	 <div class="otherpanel custompanel"  style="margin-left:5px;">    
           <div id="border1">     
	            
	            <button type="button" class="btn btn-default btnStyle" id="btncreatedel"  data-tooltip="tooltip" title="Create Delivery Note" data-placement="bottom" data-toggle="modal" data-target="#modaldeliverynotecreation"><i class="fa fa-tasks" aria-hidden="true"></i></button>
	            <button type="button" class="btn btn-default btnStyle" id="btncreateinv"  data-tooltip="tooltip" title="Create Sales Invoice" data-placement="bottom" data-toggle="modal" data-target="#modalinvoicecreation"><i class="fa fa-ticket" aria-hidden="true"></i></button>
	            <button type="button" class="btn btn-default btnStyle" id="btncreateship"  data-tooltip="tooltip" title="Create Shipping Details" data-placement="bottom" data-toggle="modal" data-target="#modalshipdetails"><i class="fa fa-ship" aria-hidden="true"></i></button>
	           
           </div>                                              
	  	 </div> 
	  	  <div class="otherpanel custompanel"  style="margin-left:5px;">             
           <div id="border1">
                <button type="button" class="btn btn-default btnStyle" id="btnattachs" data-toggle="modal" data-target="#modalattach" ><i class="fa fa-download" aria-hidden="true" data-toggle="tooltip" title="Attach" data-placement="bottom"></i></button>
	            <button type="button" class="btn btn-default btnStyle" id="btncomment"  data-toggle="modal"  data-tooltip="tooltip" title="Comments" data-placement="bottom"><i class="fa fa-comments" aria-hidden="true"></i></button>
	            <button type="button" class="btn btn-default btnStyle" id="btnsalesman"  data-toggle="modal" data-target="#modalsalesman" data-tooltip="tooltip" title="Datewise Statistics" data-placement="bottom"><i class="fa fa-bar-chart" aria-hidden="true"></i></button>
	            <button type="button" class="btn btn-default btnStyle" id="btnclient"  data-toggle="modal" data-target="#modalclient" data-tooltip="tooltip" title="Client Statistics" data-placement="bottom"><i class="fa fa-bar-chart" aria-hidden="true"></i></button>
           </div>                                            
	  	  </div>
         <!--  <div class="col-xs-12 col-sm-12 col-md-12 col-lg-3" style="padding-top:0;margin-top:0;padding-bottom:0;margin-bottom:0;">                        
			<p  style="font-size:75%;margin:0px;padding-top:15px;padding-left:6px;">&nbsp;</p>   
        </div>  -->       
      </div>      
    </div>         
    <div class="row"  style="padding-top:5px;">      
      <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12" >          
        <div id="productdiv" class="borderStyle"><jsp:include page="productGrid.jsp"></jsp:include></div>                     
      </div>
    </div> 
  
     <!-- Comments Modal-->     
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
                <!-- <div class="container-fluid"> -->
                  <div class="row">
                    <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">   
                      <div class="input-group">
                        <input type="text" class="form-control" placeholder="Please Type In" id="txtcomment">
                        <div class="input-group-btn">
                          <button type="button" id="btncommentsend" class="btn btn-default">
                            <i class="fa fa-paper-plane"></i>
                          </button>
                        </div>
                      </div>
                    </div>
                  </div>
                <!-- </div> -->
              </div>
            </div>
          </div>  
          <!-- <div class="modal-footer">
            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
          </div> -->
        </div>
      </div>
    </div>
    
  <div id="modaldeliverynotecreation" class="modal fade" role="dialog">  
      <div class="modal-dialog modal-lg">
        <div class="modal-content">
          <div class="modal-header" style="background-color:#CDFDFA">
            <button type="button" class="close" data-dismiss="modal">&times;</button>
            <h4 class="modal-title" style="text-align:center">Delivery Note Creation</h4>      
          </div>
          <div class="modal-body">
           <table width="100%" >
           <tr>
           
           <td align="left" width="20%"><label class="branch">Description</label><input type="text" id="desc" name="desc" style="width:96%;"  /></td>
           <td align="left" width="20%"><label class="branch">Sales Person</label><input type="text" id="txtsalesperson" name="txtsalesperson" readonly style="width:96%;" placeholder="Press F3 to Search" onKeyDown="getSalesPerson(event);">
           <input type="hidden" id="salespersonid" name="salespersonid" /></td>
           <td align="left" width="5%"><label class="branch">Date</label><div id="deldate" style="width:96%;" name="deldate" value='<s:property value="deldate"/>'></div></td>
           </tr>
         <tr>
          <td align="left" width="20%"><label class="branch">Branch</label><input type="text" id="sorbrhid" name="sorbrhid" style="width:96%;"  readonly/></td>
           <td align="left" width="20%"><label class="branch">Location</label><select  id="sorlocation" name="sorlocation" style="width:96%;" value='<s:property value="sorlocation"/>'></select></td>
          </tr>
           </table>
          
          </div>
          <div class="modal-footer" style="background-color:#CDFDFA">
          <button type="button" id="savedeliverynote" class="btn btn-default" data-dismiss="modal" style="background-color:red">Save</button>
            <button type="button" class="btn btn-default" data-dismiss="modal" style="background-color:red">Close</button>
          </div>  
        </div>  
      </div>
    </div>   
    
      <div id="modalinvoicecreation" class="modal fade" role="dialog">  
      <div class="modal-dialog modal-lg">
        <div class="modal-content">
          <div class="modal-header" style="background-color:#CDFDFA">
            <button type="button" class="close" data-dismiss="modal">&times;</button>
            <h4 class="modal-title" style="text-align:center">Invoice Creation</h4>      
          </div>
          <div class="modal-body">
           <table width="100%" >
           <tr>
           
           <td align="left" width="20%"><label class="branch">Description</label><input type="text" id="invdesc" name="invdesc" style="width:96%;"  /></td>
           <td align="left" width="20%"><label class="branch">Pay Terms</label><input type="text" id="pterms" name="pterms" style="width:96%;"  /></td>
          <td align="left" width="5%"><label class="branch">Date</label><div id="invdate" style="width:96%;" name="invdate" value='<s:property value="invdate"/>'></div></td></tr>
          <tr>
          <td align="left" width="20%"><label class="branch">Branch</label><input type="text" id="sorbrhid2" name="sorbrhid2" style="width:96%;"  readonly/></td>
         <td align="left" width="20%"><label class="branch">Location</label><select  id="sorlocation2" name="sorlocation2" style="width:96%;" value='<s:property value="sorlocation2"/>'></select></td>
          </tr>
           </table>
          
          </div>
          <div class="modal-footer" style="background-color:#CDFDFA">
          <button type="button" id="saveinvoice" class="btn btn-default" data-dismiss="modal" style="background-color:red">Save</button>
            <button type="button" class="btn btn-default" data-dismiss="modal" style="background-color:red">Close</button>
          </div>  
        </div>  
      </div>
    </div>
    
      
    
    <div id="modalshipdetails" class="modal fade" role="dialog">  
      <div class="modal-dialog modal-lg">
        <div class="modal-content">
          <div class="modal-header" style="background-color:#CDFDFA">
            <button type="button" class="close" data-dismiss="modal">&times;</button>
            <h4 class="modal-title" style="text-align:center">Shipping Details</h4>      
          </div>
          <div class="modal-body">
           <table width="100%" >
           <tr>
           <td align="left" width="15%" colspan=2><label class="branch">Vessel</label><input type="text" id="txtvessel" name="txtvessel" style="width:96%;"  /></td>
           <td align="left" width="20%" colspan=2><label class="branch">IMO</label><input type="text" id="txtimo" name="txtimo" style="width:96%;"  /></td></tr>
           <tr><td align="left" width="20%"><label class="branch">Type</label><input type="text" id="txttype" name="txttype" style="width:96%;"  /></td>
          <td align="left" width="20%"><label class="branch">Port</label><input type="text" id="txtport" name="txtport" style="width:96%;"  /></td>
          <td align="left" width="20%"><label class="branch">Agent</label><input type="text" id="txtagent" name="txtagent" style="width:96%;"  /></td></tr>
           </table>
          
          </div>
          <div class="modal-footer" style="background-color:#CDFDFA">
          <button type="button" id="saveshipdetails" class="btn btn-default" data-dismiss="modal" style="background-color:red">Save</button>
            <button type="button" class="btn btn-default" data-dismiss="modal" style="background-color:red">Close</button>
          </div>  
        </div>  
      </div>
    </div>
       <!-- Comments Modal--> 
      <!-- Salesman Details Modal-->
    <div id="modalsalesman" class="modal fade" role="dialog">  
      <div class="modal-dialog">
        <div class="modal-content">
          <div class="modal-header" style="background-color:#CDFDFA">
            <button type="button" class="close" data-dismiss="modal">&times;</button>
            <h4 class="modal-title" style="text-align:center">Datewise Statistics</h4>      
          </div>
          <div class="modal-body">
          <div id="salmdiv"><jsp:include page="salesmanGrid.jsp"></jsp:include></div>
          </div>
          <div class="modal-footer" style="background-color:#CDFDFA">
            <button type="button" class="btn btn-default" data-dismiss="modal" style="background-color:red">Close</button>
          </div>  
        </div>  
      </div>
    </div>  
    <!-- Salesman Details Modal-->
        <!-- Client Details Modal-->
    <div id="modalclient" class="modal fade" role="dialog">  
      <div class="modal-dialog">
        <div class="modal-content">
          <div class="modal-header" style="background-color:#CDFDFA">
            <button type="button" class="close" data-dismiss="modal">&times;</button>
            <h4 class="modal-title" style="text-align:center">Client Statistics</h4>    
          </div>
          <div class="modal-body">
          <div id="crmdiv"><jsp:include page="clientGrid.jsp"></jsp:include></div>
          </div>
          <div class="modal-footer" style="background-color:#CDFDFA">
            <button type="button" class="btn btn-default" data-dismiss="modal" style="background-color:red">Close</button>
          </div>  
        </div>  
      </div>
       <div id="sidesearchwndow">
	   <div ></div>
	</div>
    </div>
    <div id="salespersonwindow">
			<div></div>
			<div></div>
		</div>
		<div id="locationwindow">
	<div></div>
</div>	
    </div>
    <!-- Client Details Modal-->
       <input type="hidden" name="hidbrhid" id="hidbrhid">  
       <input type="hidden" name="srvdetmtrno" id="srvdetmtrno">
       <input type="hidden" name="hidcomments" id="hidcomments"> 
       <input type="hidden" name="rowindexg" id="rowindexg"> 
       <input type="hidden" name="hidpsrno" id="hidpsrno"> 
       <input type="hidden" id="locationid" name="locationid"> 
       <input type="hidden" id="hiddelno" name="hiddelno"> 
       <input type="hidden" id="hidbrchname" name="hidbrchname">
       <input type="hidden" id="hidbrchid" name="hidbrchid">
</div>		
  <!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script> -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@7.24.4/dist/sweetalert2.all.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.6-rc.0/js/select2.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/js-cookie@2/src/js.cookie.min.js"></script>
<script type="text/javascript">   
    $(document).ready(function(){ 
    	//funprimseexceed();
    $('[data-tooltip="tooltip"]').tooltip();
     $("#deldate").jqxDateTimeInput({ width: '100px', height: '15px', formatString:"dd.MM.yyyy"}); 
     $("#invdate").jqxDateTimeInput({ width: '100px', height: '15px', formatString:"dd.MM.yyyy"}); 
    $('#sidesearchwndow').jqxWindow({ width: '55%', height: '92%',  maxHeight: '85%' ,maxWidth: '80%' ,title: 'Product Search ' , position: { x: 300, y: 0 }, keyboardCloseKey: 27});
    $('#sidesearchwndow').jqxWindow('close');
    $('#salespersonwindow').jqxWindow({
		width : '25%',
		height : '58%',
		maxHeight : '70%',
		maxWidth : '45%',
		title : 'Sales Person Search',
		position : {
			x : 420,
			y : 87
		},
		theme : 'energyblue',
		showCloseButton : true,
		keyboardCloseKey : 27
	});
	$('#salespersonwindow').jqxWindow('close');
	 $('#locationwindow').jqxWindow({
			width : '25%',
			height : '58%',
			maxHeight : '70%',
			maxWidth : '45%',
			title : 'Location Search',
			position : {
				x : 420,
				y : 87
			},
			theme : 'energyblue',
			showCloseButton : true,
			keyboardCloseKey : 27
		});
		$('#locationwindow').jqxWindow('close');
	 $('#txtsalesperson').dblclick(function(){
		   
	    	if($('#mode').val()!= "view")
	    		{
	    		salespersonSearchContent('salesPersonSearch.jsp');
	    		}
	  });
	 $('#txtlocation').dblclick(function(){
		   
	    	if($('#mode').val()!= "view")
	    		{
	    		$('#locationwindow').jqxWindow('open');
	    		locationSearchContent('locationSearch.jsp');  
	    		}
	  });
    	 $("body").prepend('<div id="overlay" class="ui-widget-overlay" style="z-index: 1; display: none;"></div>');
	     $("body").prepend("<div id='PleaseWait' style='display: none;position:absolute; z-index: 1;top:180px;right:550px;'><img src='../../../../icons/31load.gif'/></div>");
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
    //alert("selectedrows==="+selectedrows.length);
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
  //alert("selectedrows==="+selectedrows.length);
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
   	 //alert(url);
   		 $.get(url).done(function (data) {
   			 
   			 $('#sidesearchwndow').jqxWindow('open');
   		$('#sidesearchwndow').jqxWindow('setContent', data);
   
   	}); 
   	} 
    
   function funStockCheck(chkid){
	   $('#jqxpdpGrid').jqxGrid('clearfilters', true);    
   	
		var rows = $("#jqxpdpGrid").jqxGrid('getrows');

		var selectedrows=$("#jqxpdpGrid").jqxGrid('selectedrowindexes');
		//selectedrows = selectedrows.sort(function(a,b){return a - b});
      // alert("selectedrows==="+selectedrows);
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
	            var orderdoc=0,cur=0,currate=0;
	            var ordertype="";
			var tmpcount=rows.length;
			var blndArray=new Array();
			for (i = 0; i < selectedrows.length; i++) {
           var chk=selectedrows[i];
           var chkpsrno=rows[chk].psrno;
            clientid=rows[chk].clientid;
           // locid=rows[chk].locid;
            cur=rows[chk].curid;
            currate=rows[chk].rate;
            if(orderdoc==""){
           	 orderdoc=rows[chk].orderdoc;
            }
            else{
           	 orderdoc=orderdoc+","+rows[chk].orderdoc;
            }
            ordertype=rows[chk].otype;
          // alert("chkpsrno==="+chkpsrno);
           if(!(typeof(chkpsrno)==="undefined" || chkpsrno==null || chkpsrno=="")){           
           	blndArray.push(rows[chk].psrno+" :: "+rows[chk].specid+" :: "+rows[chk].qty+" :: "+rows[chk].rsvqtychk+" :: "+rows[chk].rsvstockid+" :: "+ 
           	brhid+" :: "+locid);
           	//alert("stkid==="+rows[chk].stockid);
           }
				
			}
			checkstock(blndArray,chkid);
				//alert("productarray=="+prdtArray+"==size=="+prdtArray.length);
			
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
						//alert("in save del");
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
   	//alert("in locationset===");
   	var x = new XMLHttpRequest();
		x.onreadystatechange = function() {
			if (x.readyState == 4 && x.status == 200) {
				 
				 var items= x.responseText.trim();
				 items=items.split('***');
				   var docno=items[1].split(",");
		           var type=items[0].split(",");
		           //alert("type=="+type+"==docno=="+docno);
		           var optionstype = '';
					
		           for ( var i = 0; i < type.length; i++) {
		        	   optionstype += '<option value="' + docno[i] + '">' + type[i] + '</option>';
			        }
		           if(parseInt(chkid)==1){
		        	   $("select#sorlocation").html(optionstype); 
		    	   }
		    	   if(parseInt(chkid)==2){
		    		  // alert("in chkid=="+chkid);
		    		   $("select#sorlocation2").html(optionstype); 
		    	   }
		           	
		            
		        
		
			              
			              	
			} else {
			}
		}
		x.open("GET", "getTestLocation.jsp?brhid="+brchid, true);
		x.send();
   	
   }
   
    function saveComment(){  
    	var comment=$('#txtcomment').val();
    
    	$('#hidcomments').val($('#txtcomment').val());
   	    if (($(hidcomments).val()).includes('$')) { $(hidcomments).val($(hidcomments).val().replace(/$/g, ''));};if (($(hidcomments).val()).includes('%')) { $(hidcomments).val($(hidcomments).val().replace(/%/g, ''));};
   	    if (($(hidcomments).val()).includes('^')) { $(hidcomments).val($(hidcomments).val().replace(/^/g, ''));};if (($(hidcomments).val()).includes('`')) { $(hidcomments).val($(hidcomments).val().replace(/`/g, ''));};
   	    if (($(hidcomments).val()).includes('~')) { $(hidcomments).val($(hidcomments).val().replace(/~/g, ''));};if ($(hidcomments).val().indexOf('\'')  >= 0 ) { $(hidcomments).val($(hidcomments).val().replace(/'/g, ''));};
   	    if (($(hidcomments).val()).includes(',')) { $(hidcomments).val($(hidcomments).val().replace(/,/g, ''));}
   	    if ($(hidcomments).val().indexOf('"') >= 0) { $(hidcomments).val($(hidcomments).val().replace(/["']/g, ''));};
   	    if (($(hidcomments).val()).match(/\\/g)) { $(hidcomments).val($(hidcomments).val().replace(/\\/g, ''));}; 
   	 var rows = $("#jqxpdpGrid").jqxGrid('getrows');

		var selectedrows=$("#jqxpdpGrid").jqxGrid('selectedrowindexes');
		selectedrows = selectedrows.sort(function(a,b){return a - b});

		if(selectedrows.length==0){
			$("#overlay, #PleaseWait").hide();
			//$.messager.alert('Warning','Select a document.');
			return false;
		}
//alert("selectedrows==="+selectedrows.length);
		if(selectedrows.length>1){
			//$.messager.alert('Warning','Select a single document.');
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
				else
				{
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
      		salespersonSearchContent('salesPersonSearch.jsp');  	 }
       	 else{
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
	   		locationSearchContent('locationSearch.jsp');  	 }
	    	 else{
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
			//$.messager.alert('Warning','Select a document.');
			return false;
		}
//alert("selectedrows==="+selectedrows.length);
		if(selectedrows.length>1){
			//$.messager.alert('Warning','Select a single document.');
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
					}else{}	
				}   
				else
				{
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
//alert("selectedrows==="+selectedrows.length);
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
			
   		    var  myWindow= window.open("<%=contextPath%>/com/common/Attachmaster.jsp?formCode="+frmdet+"&docno="+srvdetmtrno+"&brchid="+brchid+"&frmname="+fname,"_blank","top=180,left=310,Width=800,Height=430,location=no,scrollbars=no,toolbar=no,resizable=no,meanubar=no,titlebar=no");
				 myWindow.focus();  
		}
		}
		//	alert("brchid=="+brchid);
		//var brchid=$('#hidbrhid').val();  
                
	   } 
    function addGridFilters(id,filtervalue,datafield,filtertype,filtercondition){   
    	var filtergroup = new $.jqx.filter();
    	var filter_or_operator = 1;
    	    //var filtercondition = 'contains';
	    	var filter1 = filtergroup.createfilter(filtertype, filtervalue, filtercondition);
	
	    	filtergroup.addfilter(filter_or_operator, filter1);
	    	//filtergroup.addfilter(filter_or_operator, filter2);
	    	// add the filters.
	    	$("#jqxpdpGrid").jqxGrid('addfilter', datafield, filtergroup);
	    	// apply the filters.
	    	$("#jqxpdpGrid").jqxGrid('applyfilters');     
    	
 	}
    function funload(){  
        /* var brch=$('#cmbbranch').val();    
        var fromdate=$('#fromdate').val();
        var todate=$('#todate').val();           
        $('#sapdiv').load("propertyGrid.jsp?brch="+property+"&id="+1+"&from="+fromdate+"&to="+todate); */
	   $('#productdiv').load("productGrid.jsp?id="+1);   
	   //$("#jqxbomGrid").jqxGrid('addrow', null, {});
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
    		//selectedrows = selectedrows.sort(function(a,b){return a - b});
           // alert("selectedrows==="+selectedrows);
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
    	            	shipArray.push(orderno+" :: "+ddoc+" :: "+chkpsrno+" :: "+vessel+" :: "+imo+" :: "+ 
    	            	type+" :: "+port+" :: "+agent);
    	            	//alert("stkid==="+rows[chk].stockid);
    	            }
    					
    				}
    				savedetails(shipArray);
    					//alert("productarray=="+prdtArray+"==size=="+prdtArray.length);
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
		//selectedrows = selectedrows.sort(function(a,b){return a - b});
       // alert("selectedrows==="+selectedrows);
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
	            var orderdoc=0,cur=0,currate=0;
	            var ordertype="";
			var tmpcount=rows.length;
			var blndArray=new Array();
			for (i = 0; i < selectedrows.length; i++) {
            var chk=selectedrows[i];
            var chkpsrno=rows[chk].psrno;
             clientid=rows[chk].clientid;
            // locid=rows[chk].locid;
             cur=rows[chk].curid;
             currate=rows[chk].rate;
             if(orderdoc==""){
            	 orderdoc=rows[chk].orderdoc;
             }
             else{
            	 orderdoc=orderdoc+","+rows[chk].orderdoc;
             }
             ordertype=rows[chk].otype;
           // alert("chkpsrno==="+chkpsrno);
            if(!(typeof(chkpsrno)==="undefined" || chkpsrno==null || chkpsrno=="")){           
            	blndArray.push(rows[chk].psrno+" :: "+rows[chk].uomid+" :: "+rows[chk].qty+" :: "+"0"+" :: "+"0"+" :: "+ 
            	rows[chk].unitprice+" :: "+rows[chk].total+" :: "+rows[chk].disper+" :: "+rows[chk].dis+" :: "+rows[chk].netotal+" :: "+rows[chk].specid+" :: "+
            	"0"+" :: "+rows[chk].stockid+" :: "+"0"+" :: "+rows[chk].foc+" :: "+"0");
            	//alert("stkid==="+rows[chk].stockid);
            }
				
			}
			savedeliverynote(blndArray,clientid,locid,orderdoc,ordertype,cur,currate);
				//alert("productarray=="+prdtArray+"==size=="+prdtArray.length);
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
  				//reloaddatabom();	
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
		//selectedrows = selectedrows.sort(function(a,b){return a - b});

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
            // locid=rows[chk].locid;
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
          //  alert("chkpsrno==="+chkpsrno);
            if(!(typeof(chkpsrno)==="undefined" || chkpsrno==null || chkpsrno=="")){           
            	
            	
            	blndArray.push(rows[chk].psrno+" :: "+rows[chk].uomid+" :: "+rows[chk].qty+" :: "+"0"+" :: "+"0"+" :: "+
            			 rows[chk].unitprice+" :: "+rows[chk].total+" :: "+rows[chk].discper+" :: "+rows[chk].dis+" :: "+rows[chk].nettotal+" :: "+rows[chk].specid+" :: "+
            			"0"+" :: "+rows[chk].stockid+"::"+"0"+" :: "+rows[chk].foc+" :: "+rows[chk].locid+" :: "+rows[chk].taxper+" :: "
            			 +rows[chk].netotal+" :: "+"0"+" :: "+000+" :: "+"0"+" :: "+"0"+" :: "+rows[chk].taxamount+" :: "+"0000"+" :: ");
            }
				
			}
			savesaleinvoice(blndArray,clientid,locid,totalsum,netotalsum,clacno,taxamtsum,orderdoc,ordertype,cur,currate);
				//alert("productarray=="+prdtArray+"==size=="+prdtArray.length);
			}
			});
    }
    
    function savesaleinvoice(blndArray,clientid,locid,totalsum,netotalsum,clacno,taxamtsum,orderdoc,ordertype,cur,currate){
    	//alert("clientid=="+clientid+"==locid=="+locid+"==totalsum=="+totalsum+"==netotalsum=="+netotalsum+"==clacno=="+clacno+"==taxamtsum=="+taxamtsum);
    	 var pterms=$('#pterms').val();
    	 var desc=$('#invdesc').val();
    	 var invdate=$('#invdate').val();
    	 var delno=$('#hiddelno').val();
    	 var locid=$('#sorlocation2').val();
    	// alert("invdate=="+invdate+"==locid=="+locid+"==clientid=="+clientid);
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
  				//reloaddatabom();	
  				//funload();
  				
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
