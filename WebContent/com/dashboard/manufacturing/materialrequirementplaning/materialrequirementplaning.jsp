<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%  String contextPath=request.getContextPath();%>
<!DOCTYPE html>   
<html lang="en">
<head>
<title>Material Requirement Planing</title>                                                 
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
	            <button type="button" class="btn btn-default btnStyle" id="btnupdate"  data-tooltip="tooltip" data-toggle="modal" data-target="#modalstatusupdate" title="Update Status" data-placement="bottom"><i class="fa fa-pencil " aria-hidden="true"></i></button>
	            
	           <div class="btn-group" role="group">
          	<button type="button" class="btn btn-default" id="btnpromise" data-toggle="tooltip" title="Exceeded Promise Date" data-placement="bottom" data-filtervalue="Exceeded Promise Date" ><i class="fa fa-handshake-o " aria-hidden="true"></i></button>
          	<span class="badge badge-notify badge-promisexc"></span>
          </div>  	            <button type="button" class="btn btn-default btnStyle" id="btncreatepr"  data-tooltip="tooltip" title="Create Purchase Request" data-placement="bottom" ><i class="fa fa-ticket" aria-hidden="true"></i></button>
	            <button type="button" class="btn btn-default btnStyle" id="btncreatebo"  data-tooltip="tooltip" title="Create Work Order" data-placement="bottom" data-toggle="modal" data-target="#modalworkordercreate"><i class="fa fa-tasks" aria-hidden="true"></i></button>
	            <button type="button" class="btn btn-default btnStyle" id="btnprintwork"  data-tooltip="tooltip" title="Print Work Order" data-placement="bottom" data-toggle="modal" data-target="#modalprintworkorder"><i class="fa fa-print" aria-hidden="true"></i></button>
	            <button type="button" class="btn btn-default btnStyle" id="btnbomentry"  data-tooltip="tooltip" title="Add Product" data-placement="bottom" ><i class="fa fa-plus-square" aria-hidden="true"></i></button>
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
     <div class="row"  style="padding-top:5px;">  
      <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">          
        <div id="bomdiv" class="borderStyle"><jsp:include page="bomGrid.jsp"></jsp:include></div>                     
      </div>
       </div> 
    <%--  <div class="row"  style="padding-top:5px;">   
      <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">          
        <div id="processdiv" class="borderStyle"><jsp:include page="processGrid.jsp"></jsp:include></div>                     
      </div>    
    </div> --%>
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
    
     <div id="modalprintworkorder" class="modal fade" role="dialog">  
      <div class="modal-dialog">
        <div class="modal-content">
          <div class="modal-header" style="background-color:#CDFDFA">
            <button type="button" class="close" data-dismiss="modal">&times;</button>
            <h4 class="modal-title" style="text-align:center">Print Work Order</h4>      
          </div>
          <div class="modal-body">
          <table width="100%" >
          <tr>
          <td align="right"><label class="branch">Type</label></td>
          <td align="left"><select name="printType" id="printType" style="width:30%;"  value='<s:property value="printType"/>'">
      <option value="3">All</option>
      <option value="1">Packing Material</option>
      <option value="2">Raw Material</option>
    </select></td>
          </tr>
         
          </table>
          </div>
          <div class="modal-footer" style="background-color:#CDFDFA">
          <button type="button" id="btnworkorder" class="btn btn-default" data-dismiss="modal" style="background-color:red">Print</button>
            <button type="button" class="btn btn-default" data-dismiss="modal" style="background-color:red">Close</button>
          </div>  
        </div>  
      </div>
    </div>
    
      <div id="modalstatusupdate" class="modal fade" role="dialog">  
      <div class="modal-dialog">
        <div class="modal-content">
          <div class="modal-header" style="background-color:#CDFDFA">
            <button type="button" class="close" data-dismiss="modal">&times;</button>
            <h4 class="modal-title" style="text-align:center">Status Update</h4>      
          </div>
          <div class="modal-body">
          <table width="100%" >
          <tr>
          <td align="right"><label class="branch">Priority</label></td>
          <td align="left"><select name="priority" id="priority" style="width:25%;"  value='<s:property value="priority"/>'">
      <option value="1">HIGH</option>
      <option value="2">MED</option>
      <option value="3">LOW</option>
    </select></td>
          </tr>
          <tr>
          <td align="right"><label class="branch">Promise Date</label></td>
           <td align="left"><div id="promdate" style="width:17%;" name="promdate" value='<s:property value="promdate"/>'></div></td>
          </tr>
          </table>
          </div>
          <div class="modal-footer" style="background-color:#CDFDFA">
          <button type="button" id="btnsave" class="btn btn-default" data-dismiss="modal" style="background-color:red">Save</button>
            <button type="button" class="btn btn-default" data-dismiss="modal" style="background-color:red">Close</button>
          </div>  
        </div>  
      </div>
    </div>
    
      <div id="modalworkordercreate" class="modal fade" role="dialog">  
      <div class="modal-dialog">
        <div class="modal-content">
          <div class="modal-header" style="background-color:#CDFDFA">
            <button type="button" class="close" data-dismiss="modal">&times;</button>
            <h4 class="modal-title" style="text-align:center">Create Work Order</h4>      
          </div>
          <div class="modal-body">
          <button type="button" id="btnload" class="btn btn-default" style="background-color:green ;color:yellow;">Load</button>
          <div id="wrkdiv"><jsp:include page="workordersubgrid.jsp"></jsp:include></div>
          
          </div>
          <div class="modal-footer" style="background-color:#CDFDFA">
          <button type="button" id="btncreate" class="btn btn-default" data-dismiss="modal" style="background-color:red;color:yellow;">Create</button>
            <button type="button" class="btn btn-default" data-dismiss="modal" style="background-color:red;color:yellow;">Close</button>
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
    </div>
    <!-- Client Details Modal-->
       <input type="hidden" name="hidbrhid" id="hidbrhid">  
       <input type="hidden" name="srvdetmtrno" id="srvdetmtrno">
       <input type="hidden" name="srvdetpsrno" id="srvdetpsrno">
       <input type="hidden" name="hidcomments" id="hidcomments"> 
       <input type="hidden" name="rowindexg" id="rowindexg"> 
       <input type="hidden" name="hidpsrno" id="hidpsrno">
       <input type="hidden" name="hidpdpworkno" id="hidpdpworkno">    
</div>		
  <!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script> -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@7.24.4/dist/sweetalert2.all.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.6-rc.0/js/select2.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/js-cookie@2/src/js.cookie.min.js"></script>
<script type="text/javascript">   
    $(document).ready(function(){ 
    	funprimseexceed();
    $('[data-tooltip="tooltip"]').tooltip();
    $("#promdate").jqxDateTimeInput({ width: '85px', height: '15px', formatString:"dd.MM.yyyy"});
    $('#sidesearchwndow').jqxWindow({ width: '55%', height: '92%',  maxHeight: '85%' ,maxWidth: '80%' ,title: 'Product Search ' , position: { x: 300, y: 0 }, keyboardCloseKey: 27});
    $('#sidesearchwndow').jqxWindow('close');   
    	 $("body").prepend('<div id="overlay" class="ui-widget-overlay" style="z-index: 1; display: none;"></div>');
	     $("body").prepend("<div id='PleaseWait' style='display: none;position:absolute; z-index: 1;top:180px;right:550px;'><img src='../../../../icons/31load.gif'/></div>");
    	 $('[data-toggle="tooltip"]').tooltip(); 
      
    	 $('#btnattachs').click(function(){ 
          	funAttachs(event);      
          });
         $('#btnsubmit').click(function(){ 
        	 $('#jqxbomGrid').jqxGrid('clear');
        	// $('#jqxprocessGrid').jqxGrid('clear');
        	 $('#jqxpdpGrid').jqxGrid('clear');
        	 $('#srvdetmtrno').val(''); 
        	 $("#jqxbomGrid").jqxGrid('addrow', null, {});
        	 var chkrows=$("#jqxbomGrid").jqxGrid('getrows');
        	    var setrow=chkrows.length-1;
        		  //alert("lastrowindex==="+setrow);
        		  $('#jqxbomGrid').jqxGrid('setcellvalue', setrow, "srchbtn","Search");
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
 				worksheetName:"Material Requirement Planing"                
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
          $('#btnworkorder').click(function(){        
        	  funPrintWork();  
          });
          $('#btnsave').click(function(){
          	$("#overlay, #PleaseWait").show();
          	var rows = $("#jqxpdpGrid").jqxGrid('getrows');
          	var orderarray=new Array();
      		var selectedrows=$("#jqxpdpGrid").jqxGrid('selectedrowindexes');
      		selectedrows = selectedrows.sort(function(a,b){return a - b});

      		if(selectedrows.length==0){
      			$("#overlay, #PleaseWait").hide();
      			$.messager.alert('Warning','Select documents.');
      			return false;
      		}
      		//alert("selectrows==="+selectedrows);
      		for(var i=0;i<selectedrows.length;i++){
      			var chk=selectedrows[i];
      			var docs=rows[chk].doc_no;
      			var type=rows[chk].otype;
      			//alert("docs=="+docs);
      			orderarray.push(docs+" :: "+type+" :: ");
      			/* for(var j=0;j<selectedrows.length;j++){
      				
      			} */
      		}
      		saveStatusUpdate(orderarray);
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
          $('#btnpromise').click(function(){
          	$('#jqxbomGrid').jqxGrid('clear');
         	  
          	funAlertload();
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
    
    function funPrintWork(){
    	var print=$('#printType').val();
    	var orderno=$('#srvdetmtrno').val();
    	var psrno=$('#srvdetpsrno').val();
    	var workno=$('#hidpdpworkno').val();
    	var rows = $("#jqxpdpGrid").jqxGrid('getrows');

		var selectedrows=$("#jqxpdpGrid").jqxGrid('selectedrowindexes');
		selectedrows = selectedrows.sort(function(a,b){return a - b});
    	var tmpcount=selectedrows.length;
		for (i = 0; i < selectedrows.length; i++) {
			/* var order= $('#jqxpdpGrid').jqxGrid('getcellvalue', selectedrows[i], "orderno");
			var qty= $('#jqxpdpGrid').jqxGrid('getcellvalue', selectedrows[i], "qty");
			prdarray.push(order+" :: "+qty+" :: "); */
		if(i==0){      
			var srvdetmtrno= $('#jqxpdpGrid').jqxGrid('getcellvalue', selectedrows[i], "orderdoc");     
			temptrno=srvdetmtrno;
			
			var srvdetpsrno= $('#jqxpdpGrid').jqxGrid('getcellvalue', selectedrows[i], "psrno");     
			tempsrno=srvdetpsrno;   
		}  
		else{  
			var srvdetmtrno= $('#jqxpdpGrid').jqxGrid('getcellvalue', selectedrows[i], "orderdoc");
			var srvdetpsrno= $('#jqxpdpGrid').jqxGrid('getcellvalue', selectedrows[i], "psrno"); 
			if(temptrno==""){
				 temptrno=srvdetmtrno;
			}
			else{
				 temptrno=temptrno+","+srvdetmtrno;
			}
			
			if(tempsrno==""){
				 tempsrno=srvdetpsrno;
			}
			else{
				tempsrno=tempsrno+","+srvdetpsrno;
			}
		}
		//alert("===i==="+i+"===count===="+tmpcount);
		if(i==tmpcount-1){
			temptrno1=temptrno; 
			tempsrno1=tempsrno;
			//alert("==inside last==="+temptrno1);
		}
		else{
			temptrno1=temptrno+","; 
			tempsrno1=tempsrno+",";
		}
		j++; 
		}
    	//alert("orderno=="+orderno+"==psrno=="+psrno+"==workno=="+workno);
    	if(parseInt(workno)==0){
    		$.messager.alert('Warning','Work Order Not Created.');
    		return false;
    	}
    	/* if((orderno=="") || (psrno=="")){
    		$.messager.alert('Warning','Please Calculate .');
    		return false;
    	} */
    	    var url=document.URL;
	        var reurl=url.split("materialrequirementplaning.jsp");
	        
	        
	        var win= window.open(reurl[0]+"printWorkOrder?workType="+print+"&orderno="+temptrno1+"&psrno="+tempsrno1+"&workno="+workno,"_blank","top=150,left=250,Width=1020,Height=500,location=no,scrollbars=no,toolbar=yes");
	        win.focus();
    }
    
    function funCreateBomEntry(){
    	var rows = $("#jqxbomGrid").jqxGrid('getrows');
        var prodetail= new Array();
		var selectedrows=$("#jqxbomGrid").jqxGrid('selectedrowindexes');
		selectedrows = selectedrows.sort(function(a,b){return a - b});

		if(selectedrows.length==0){
			$("#overlay, #PleaseWait").hide();
			$.messager.alert('Warning','Select documents.');
			return false;
		}
		$.messager.confirm('Message', 'Do you want to update bom?', function(r){
			if(r==false)
			{
			return false; 
			}
			else
			{
		$("#overlay, #PleaseWait").show();
		// $('#jqxbomGrid').jqxGrid('clear');
		var i=0;var temptrno="";           
		var j=0;
		var tmpcount=selectedrows.length;
		
		var pdprows = $("#jqxpdpGrid").jqxGrid('getrows');
        var ppdetail= new Array();
      
		var prdrows=$("#jqxpdpGrid").jqxGrid('selectedrowindexes');
		//ppdselectedrows = selectedrows.sort(function(a,b){return a - b});
       //   alert("ppdselectedrows==="+prdrows);
		var i=0;var temptrno="";           
		var j=0;
		//var tmpcount=ppdselectedrows.length;
		for (var g=0; g < prdrows.length; g++) {

			  var chk=prdrows[g];
			
			var otype= pdprows[chk].otype; 
			var orderno=pdprows[chk].orderdoc;
			var calcqty=pdprows[chk].qty;
			var psrno=pdprows[chk].psrno;
			
			temptrno=orderno+" :: "+otype+" :: "+calcqty+" :: "+psrno;  
		  
			 
			 
			// alert(temptrno);
		     ppdetail.push(temptrno);
			} 
			
			
		
	
		
		
		
		
		for (i = 0; i < selectedrows.length; i++) {
            var chk=selectedrows[i];
		   
			var psrno=rows[chk].mainpsrno; 
			var qty= rows[chk].qty;
			var mtypeid= rows[chk].mtypeid; 
			var mtype= rows[chk].mtype;
			var uomid= rows[chk].uomid;
			var mainpsrno= rows[chk].chkpsrno;
			var mrpdoc= rows[0].mrpdoc;
			var otype="OTH";
			var orderno="0";
			if((typeof(qty)==="undefined" || qty==null || qty=="" || qty=="0")){
            	$.messager.alert('Warning','Enter Qty to All Selected Documents.');
            	$("#overlay, #PleaseWait").hide();
            	return false;
            }
			 //temptrno=psrno+" :: "+otype+" :: "+orderno+" :: "+qty;  
			 temptrno=psrno+" :: "+qty+" :: "+mtypeid+" :: "+mtype+" :: "+uomid+" :: "+mainpsrno+" :: "+mrpdoc;  
		     	 //alert(temptrno);
		     prodetail.push(temptrno);

		
		
		}
		saveBomEntry(prodetail,ppdetail);
		//reloaddata(prodetail);
			}
    });
    }
    function saveBomEntry(prodetail,ppdetail){
    	 var x=new XMLHttpRequest();
  		x.onreadystatechange=function(){
  		if (x.readyState==4 && x.status==200){
  	     			
  				var items=x.responseText;
  				if(parseInt(items)>0)  
  				{	
  					$("#overlay, #PleaseWait").hide();
  				$.messager.alert('Message', 'BOM Successfully Updated ');
  				reloaddatabom();
  					
  				
  				}
  				else
  				{
  					$("#overlay, #PleaseWait").hide();
  				$.messager.alert('Message', '  Not Updated  ');
  				}
  				}
  		}
    x.open("GET","saveBomEntry.jsp?bomarray="+prodetail+"&ppdetail="+ppdetail,true);			
  	x.send();
    }
    function reloaddatabom(){
    	var rows = $("#jqxpdpGrid").jqxGrid('getrows');

		var selectedrows=$("#jqxpdpGrid").jqxGrid('selectedrowindexes');
		selectedrows = selectedrows.sort(function(a,b){return a - b});
    	var tmpcount=selectedrows.length;
		for (i = 0; i < selectedrows.length; i++) {
			/* var order= $('#jqxpdpGrid').jqxGrid('getcellvalue', selectedrows[i], "orderno");
			var qty= $('#jqxpdpGrid').jqxGrid('getcellvalue', selectedrows[i], "qty");
			prdarray.push(order+" :: "+qty+" :: "); */
		if(i==0){      
			var srvdetmtrno= $('#jqxpdpGrid').jqxGrid('getcellvalue', selectedrows[i], "orderdoc");     
			temptrno=srvdetmtrno;
			
			var srvdetpsrno= $('#jqxpdpGrid').jqxGrid('getcellvalue', selectedrows[i], "psrno");     
			tempsrno=srvdetpsrno;   
		}  
		else{  
			var srvdetmtrno= $('#jqxpdpGrid').jqxGrid('getcellvalue', selectedrows[i], "orderdoc");
			var srvdetpsrno= $('#jqxpdpGrid').jqxGrid('getcellvalue', selectedrows[i], "psrno"); 
			if(temptrno==""){
				 temptrno=srvdetmtrno;
			}
			else{
				 temptrno=temptrno+","+srvdetmtrno;
			}
			
			if(tempsrno==""){
				 tempsrno=srvdetpsrno;
			}
			else{
				tempsrno=tempsrno+","+srvdetpsrno;
			}
		}
		//alert("===i==="+i+"===count===="+tmpcount);
		if(i==tmpcount-1){
			temptrno1=temptrno; 
			tempsrno1=tempsrno;
			//alert("==inside last==="+temptrno1);
		}
		else{
			temptrno1=temptrno+","; 
			tempsrno1=tempsrno+",";
		}
		j++; 
		}
		$('#srvdetmtrno').val(temptrno1);
		$('#srvdetpsrno').val(tempsrno1);
 	   $('#bomdiv').load("bomGrid.jsp?docno="+temptrno1+"&psrno="+tempsrno1+"&id="+1);
    }
    function saveStatusUpdate(orderarray){
 	   var prior=$('#priority').val();
 	   var promdate=$('#promdate').val();
 	   var x=new XMLHttpRequest();
 		x.onreadystatechange=function(){
 		if (x.readyState==4 && x.status==200){
 	     			
 				var items=x.responseText;
 				if(parseInt(items)=="1")  
 				{	
 					$("#overlay, #PleaseWait").hide();
 				$.messager.alert('Message', '  Status Successfully Updated ');
 				funload();
 				
 				}
 				else
 				{
 					$("#overlay, #PleaseWait").hide();
 				$.messager.alert('Message', '  Not Updated  ');
 				}
 				}
 		}
   x.open("GET","statusupdate.jsp?orderarray="+orderarray+"&priority="+prior+"&promdate="+promdate,true);			
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
    function funAlertload(){  
        /* var brch=$('#cmbbranch').val();    
        var fromdate=$('#fromdate').val();
        var todate=$('#todate').val();           
        $('#sapdiv').load("propertyGrid.jsp?brch="+property+"&id="+1+"&from="+fromdate+"&to="+todate); */
 	   $('#productdiv').load("productGrid.jsp?id="+2);       
   }
    function funprimseexceed(){
    	var x=new XMLHttpRequest();
		x.onreadystatechange=function(){
			if (x.readyState==4 && x.status==200)
			{
				var items=x.responseText.trim();
				$('.badge-promisexc').text(items);
			}
			else
			{
			}
		}
		x.open("GET","getPromiseAlert.jsp",true);
		x.send();
    }
    function funSetWorkorderGrid(){
    	 $("#jqxwrkGrid").jqxGrid('clear');
    	var rows = $("#jqxbomGrid").jqxGrid('getrows');
    	var tempchk=0;
    	$("#jqxwrkGrid").jqxGrid('addrow', null, {});
    	var rows2 = $("#jqxwrkGrid").jqxGrid('getrows');
		var selectedrows=$("#jqxbomGrid").jqxGrid('selectedrowindexes');
		var chkval=selectedrows.length;

		if(selectedrows.length==0){
			//$("#overlay, #PleaseWait").hide();
			$.messager.alert('Warning','Select documents.');
			return false;
		}
	//	alert("chkval=="+chkval);
		if(parseInt(chkval)>0){
		for (var i = 0; i < selectedrows.length; i++) {
            var chk=selectedrows[i];
           //alert("i==="+i+"==chk=="+chk+"===workgridlength==="+rows2.length);
          tempchk=0;
          var res= rows[chk].mtypeid;
	       var res2=rows[chk].hidresqty;
	       var res3= rows[chk].setdoc;
	       var res4= rows[chk].pdesc;
	       var res5= rows[chk].qty;
	       var res6= rows[chk].resqty;
	       var res8= rows[chk].hidworder;
	       var res9= rows[chk].worder;
	       var res7=parseFloat(res6)+parseFloat(res8)+parseFloat(res2)+parseFloat(res9);
   		      // alert("res==="+res+"==res2=="+res2+"===res3=="+res3);
   		    if(parseInt(res)!=9){
   		    	tempchk=1;
		    	   $.messager.alert('Message', ''+res4+' Not a Bulk Product');
		    	  // $('#jqxbomGrid').jqxGrid('unselectrow',chk);
		       }
   		 if(parseFloat(res7)>parseFloat(res5)){
   		    	tempchk=1;
   		    	   $('#jqxbomGrid').jqxGrid('unselectrow',chk);
   		    	   $.messager.alert('Message', 'Balance Quantity Not Available For '+res4);
   		       }
   		     
   			
   			/* var selectedrowsltst=$("#jqxbomGrid").jqxGrid('selectedrowindexes');
   			selectedrowsltst = selectedrowsltst.sort(function(a,b){return a - b});
   			if(selectedrowsltst.length==0){
   				$("#overlay, #PleaseWait").hide();
   				$.messager.alert('Warning','Select documents.');
   				return false;
   			} */
   			if(parseInt(tempchk)==0){
            $('#jqxwrkGrid').jqxGrid('setcellvalue', i, "pid",$('#jqxbomGrid').jqxGrid('getcellvalue', chk, "pid"));
            $('#jqxwrkGrid').jqxGrid('setcellvalue', i, "pdesc",$('#jqxbomGrid').jqxGrid('getcellvalue', chk, "pdesc"));
            $('#jqxwrkGrid').jqxGrid('setcellvalue', i, "mtype",$('#jqxbomGrid').jqxGrid('getcellvalue', chk, "mtype"));
            $('#jqxwrkGrid').jqxGrid('setcellvalue', i, "uom",$('#jqxbomGrid').jqxGrid('getcellvalue', chk, "uom"));
            $('#jqxwrkGrid').jqxGrid('setcellvalue', i, "uomid",$('#jqxbomGrid').jqxGrid('getcellvalue', chk, "uomid"));
            $('#jqxwrkGrid').jqxGrid('setcellvalue', i, "worder",$('#jqxbomGrid').jqxGrid('getcellvalue', chk, "worder"));
            $('#jqxwrkGrid').jqxGrid('setcellvalue', i, "psrno",$('#jqxbomGrid').jqxGrid('getcellvalue', chk, "psrno"));
            
            $('#jqxwrkGrid').jqxGrid('setcellvalue', i, "rdocno",$('#jqxbomGrid').jqxGrid('getcellvalue', chk, "rdocno"));
            $('#jqxwrkGrid').jqxGrid('setcellvalue', i, "rdtype",$('#jqxbomGrid').jqxGrid('getcellvalue', chk, "rdtype"));
            $('#jqxwrkGrid').jqxGrid('setcellvalue', i, "bompsrno",$('#jqxbomGrid').jqxGrid('getcellvalue', chk, "bompsrno"));
            $('#jqxwrkGrid').jqxGrid('setcellvalue', i, "sorddoc",$('#jqxbomGrid').jqxGrid('getcellvalue', chk, "sorddoc"));
            $('#jqxwrkGrid').jqxGrid('setcellvalue', i, "mainpsrno",$('#jqxbomGrid').jqxGrid('getcellvalue', chk, "chkpsrno"));
            $('#jqxwrkGrid').jqxGrid('setcellvalue', i, "bomethod",$('#jqxbomGrid').jqxGrid('getcellvalue', chk, "bomethod"));
            $("#jqxwrkGrid").jqxGrid('addrow', null, {});
   			}
   			
		}
		}
    }
    
    function funCreateBlending(){
        $('#jqxwrkGrid').jqxGrid('clearfilters', true);    
    	
		var rows = $("#jqxwrkGrid").jqxGrid('getrows');
		var bomrows = $("#jqxbomGrid").jqxGrid('getrows');

		//var selectedrows=$("#jqxbomGrid").jqxGrid('selectedrowindexes');
		//selectedrows = selectedrows.sort(function(a,b){return a - b});

		if(rows.length==0){
			$("#overlay, #PleaseWait").hide();
			$.messager.alert('Warning','Select documents.');
			return false;
		}
		
		$.messager.confirm('Message', 'Do you want to create work order?', function(r){
			if(r==false)
			{
			return false; 
			}
			else
			{
			$("#overlay, #PleaseWait").show();

			var i=0;var temptrno="";           
			var j=0;
			var tmpcount=rows.length;
			var blndArray=new Array();
			var bomArray=new Array();
			for (i = 0; i < rows.length; i++) {
            
            var chkpsrno=rows[i].psrno;
            var blndqty=rows[i].worder;
           // alert("qty==="+blndqty);
            if(!(typeof(chkpsrno)==="undefined" || chkpsrno==null || chkpsrno=="")){
            if((typeof(blndqty)==="undefined" || blndqty==null || blndqty=="" || blndqty=="0")){
            	$.messager.alert('Warning','Enter Qty to All Selected Documents.');
            	$("#overlay, #PleaseWait").hide();
            	return false;
            }
            
            	blndArray.push(rows[i].psrno+" :: "+rows[i].uomid+" :: "+rows[i].worder+" :: "+rows[i].remarks+" :: "+rows[i].rdocno+" :: "+rows[i].rdtype+" :: "+rows[i].bompsrno+" :: "+rows[i].sorddoc+" :: "+rows[i].mainpsrno+" :: "+rows[i].bomethod+" :: ");
            }
				
			}
			for (i = 0; i < bomrows.length; i++) {
	            
	            var mtypeid=bomrows[i].mtypeid;
	            var chkpsrno=bomrows[i].psrno;
	           // alert("qty==="+blndqty);
	            if((parseInt(mtypeid)!=9) && !(typeof(chkpsrno)==="undefined" || chkpsrno==null || chkpsrno=="")){
	           
	            
	            bomArray.push(bomrows[i].wodocno+" :: "+bomrows[i].psrno+" :: "+bomrows[i].uomid+" :: "+bomrows[i].mtypeid+" :: "+bomrows[i].qty+" :: "+bomrows[i].worder+" :: "+bomrows[i].bompsrno+" :: "+bomrows[i].chkpsrno+" :: ");
	            }
					
				}
			saveblendingorder(blndArray,bomArray);
				//alert("productarray=="+prdtArray+"==size=="+prdtArray.length);
			}
			});
    }
    
    function saveblendingorder(blndArray,bomArray){
    	 var refno="";
    	 var desc="";
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
  					funload();
  					$('#hidpdpworkno').val(aa);
  				$.messager.alert('Message', '  Work Order '+aa+' Successfully Created ');
  				reloaddatabom();	
  			
  				
  				}
  				else
  				{
  					$("#overlay, #PleaseWait").hide();
  				$.messager.alert('Message', '  Not Created  ');
  				}
  				}
  		}
    x.open("GET","saveBlendingOrder.jsp?productarray="+blndArray+"&bomarray="+bomArray+"&refno="+refno+"&desc="+desc,true);			
  	x.send();
    }
    
    function funCreateRequest(){
    	$('#jqxbomGrid').jqxGrid('clearfilters', true);    
    	
		var rows = $("#jqxbomGrid").jqxGrid('getrows');

		var selectedrows=$("#jqxbomGrid").jqxGrid('selectedrowindexes');
		selectedrows = selectedrows.sort(function(a,b){return a - b});
		if(selectedrows.length==0){
			$("#overlay, #PleaseWait").hide();
			$.messager.alert('Warning','Select documents.');
			return false;
		}
		var tempchk=0;
		
		for (var g = 0; g < selectedrows.length; g++) {
			 var chk=selectedrows[g];
		   var res= rows[chk].mtypeid;
	       var res2=rows[chk].hidresqty;
	       var res3= rows[chk].setdoc;
	       var res4= rows[chk].pdesc;
	       var res5= rows[chk].qty;
	       var res6= rows[chk].resqty;
	       var res8= rows[chk].hidworder;
	       var res9= rows[chk].worder;
	       var res7=parseFloat(res6)+parseFloat(res8)+parseFloat(res2)+parseFloat(res9);
	  // alert("res7==="+res7);
	   
	       if(parseFloat(res7)>parseFloat(res5)){
	    	   $('#jqxbomGrid').jqxGrid('unselectrow',g);
	    	   $.messager.alert('Message', 'Balance Quantity Not Available For '+res4);
	    	   tempchk=1;
	       }
	     
		}
		var selectedrowsltst=$("#jqxbomGrid").jqxGrid('selectedrowindexes');
		selectedrowsltst = selectedrowsltst.sort(function(a,b){return a - b});
		if(parseInt(tempchk)==0){
		$.messager.confirm('Message', 'Do you want to create purchase request?', function(r){
			if(r==false)
			{
			return false; 
			}
			else
			{
			$("#overlay, #PleaseWait").show();

			var i=0;var temptrno="";           
			var j=0;
			var tmpcount=selectedrowsltst.length;
			var prdtArray=new Array();
			var bomArray=new Array();
			for (i = 0; i < selectedrowsltst.length; i++) {
            var chk=selectedrowsltst[i];
            var chkpsrno=rows[chk].psrno;
            var blndqty=rows[chk].resqty;
            var res2=rows[chk].hidresqty;
            var res5= rows[chk].qty;
 	        var res6= rows[chk].resqty;
 	      /*  var res7=parseInt(res6)+parseInt(res2);
	       if(parseInt(res7)==parseInt(res5)){
	    	  // res7=res6;
	       }else{
	    	   if(parseInt(res7)>parseInt(res5)){
	    		   res7=parseInt(res5)-parseInt(res2)
	    	   }
	    	   if(parseInt(res7)<parseInt(res5)){
	    		   res7=res6;
	    	   } 
	       }*/
            if((typeof(blndqty)==="undefined" || blndqty==null || blndqty=="" || blndqty=="0")){
            	$.messager.alert('Warning','Enter Qty to All Selected Documents.');
            	$("#overlay, #PleaseWait").hide();
            	return false;
            }
            if(!(typeof(chkpsrno)==="undefined" || chkpsrno==null || chkpsrno=="")){
            	prdtArray.push(rows[chk].psrno+" :: "+rows[chk].psrno+" :: "+rows[chk].uomid+" :: "+rows[chk].resqty+" :: "+rows[chk].specid+" :: ");
            	bomArray.push(rows[chk].psrno+" :: "+rows[chk].bompsrno+" :: "+rows[chk].rdocno+" :: "+rows[chk].resqty+" :: "+rows[chk].rdtype+" :: ");
            }
				
			}
			savepurachserequest(prdtArray,bomArray);
				//alert("productarray=="+prdtArray+"==size=="+prdtArray.length);
			}
			});
		}
    }
    function savepurachserequest(prdtArray,bomArray){
    	 var refno="";
    	 var desc="";
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
  				$.messager.alert('Message', '  Purchase Request '+aa+' Successfully Created ');
  				reloaddatabom();	
  				//funload();
  				
  				}
  				else
  				{
  					$("#overlay, #PleaseWait").hide();
  				$.messager.alert('Message', '  Not Created  ');
  				}
  				}
  		}
    x.open("GET","savePurchaseRequest.jsp?productarray="+prdtArray+"&refno="+refno+"&desc="+desc+"&bomarray="+bomArray,true);			
  	x.send();
    	
    }
   function funcalculate(){    
	//	$('#jqxpdpGrid').jqxGrid('clearfilters', true);    
	
		var rows = $("#jqxpdpGrid").jqxGrid('getrows');

		var selectedrows=$("#jqxpdpGrid").jqxGrid('selectedrowindexes');
		selectedrows = selectedrows.sort(function(a,b){return a - b});

		if(selectedrows.length==0){
			$("#overlay, #PleaseWait").hide();
			$.messager.alert('Warning','Select documents.');
			return false;
		}
		$.messager.confirm('Message', 'Do you want to calculate?', function(r){
		if(r==false)
		{
		return false; 
		}
		else
		{
		$("#overlay, #PleaseWait").show();

		var i=0;var temptrno="";           
		var j=0;
		var prdarray=new Array();
		var tmpcount=selectedrows.length;
		for (i = 0; i < selectedrows.length; i++) {
			/* var order= $('#jqxpdpGrid').jqxGrid('getcellvalue', selectedrows[i], "orderno");
			var qty= $('#jqxpdpGrid').jqxGrid('getcellvalue', selectedrows[i], "qty");
			prdarray.push(order+" :: "+qty+" :: "); */
		if(i==0){      
			var srvdetmtrno= $('#jqxpdpGrid').jqxGrid('getcellvalue', selectedrows[i], "orderno");     
			temptrno=srvdetmtrno;   
		}  
		else{  
			var srvdetmtrno= $('#jqxpdpGrid').jqxGrid('getcellvalue', selectedrows[i], "orderno");
			if(temptrno==""){
				 temptrno=srvdetmtrno;
			}
			else{
				 temptrno=temptrno+","+srvdetmtrno;
			}
		}
		//alert("===i==="+i+"===count===="+tmpcount);
		if(i==tmpcount-1){
			temptrno1=temptrno; 
			//alert("==inside last==="+temptrno1);
		}
		else{
			temptrno1=temptrno+","; 
		}
		j++; 
		}
		$('#srvdetmtrno').val(temptrno1);
		reloaddatalast($('#srvdetmtrno').val());	
		}
		});
		}
   function reloaddatalast(srvdetmtrno){
	   $('#bomdiv').load("bomGrid.jsp?docno="+srvdetmtrno+"&id="+1);
   }
   function funcalculateinsert(){    
		//$('#jqxpdpGrid').jqxGrid('clearfilters', true);    
	//alert("calculatepsrno==="+thpsrno);
	$('#jqxpdpGrid').jqxGrid('clearfilters', true); 
		var rows = $("#jqxpdpGrid").jqxGrid('getrows');
        var prodetail= new Array();
       /*  if(parseInt(thpsrno)>0){
        	 var temptrno=thpsrno+" :: "+"OTH"+" :: "+"0"+" :: "+"0";  
		     //	 alert(temptrno);
		     prodetail.push(temptrno);
        } */
		var selectedrows=$("#jqxpdpGrid").jqxGrid('selectedrowindexes');
		selectedrows = selectedrows.sort(function(a,b){return a - b});

		if(selectedrows.length==0){
			$("#overlay, #PleaseWait").hide();
			$.messager.alert('Warning','Select documents.');
			return false;
		}
		
		$("#overlay, #PleaseWait").show();
		 $('#jqxbomGrid').jqxGrid('clear');
		var i=0;var temptrno="";           
		var j=0;
		var tmpcount=selectedrows.length;
		for (i = 0; i < selectedrows.length; i++) {

		   
			var psrno= $('#jqxpdpGrid').jqxGrid('getcellvalue', selectedrows[i], "psrno"); 
			var otype= $('#jqxpdpGrid').jqxGrid('getcellvalue', selectedrows[i], "otype"); 
			var orderno= $('#jqxpdpGrid').jqxGrid('getcellvalue', selectedrows[i], "orderdoc");
			var qty= $('#jqxpdpGrid').jqxGrid('getcellvalue', selectedrows[i], "qty");
			var mrpno= $('#jqxpdpGrid').jqxGrid('getcellvalue', selectedrows[i], "mrpno");
			var ltstqty= $('#jqxpdpGrid').jqxGrid('getcellvalue', selectedrows[i], "ltstqty");
			var ltstpsrno= $('#jqxpdpGrid').jqxGrid('getcellvalue', selectedrows[i], "ltstpsrno");
			var sorddoc= $('#jqxpdpGrid').jqxGrid('getcellvalue', selectedrows[i], "sorddoc");
			 for (j = 0; j < selectedrows.length; j++) {
				 var psrno2= $('#jqxpdpGrid').jqxGrid('getcellvalue', selectedrows[j], "psrno");
				 if(i!=j){
					 if(psrno==psrno2){
						 var qty2= $('#jqxpdpGrid').jqxGrid('getcellvalue', selectedrows[j], "qty"); 
						 qty=parseInt(qty2)+parseInt(qty);
					 }
				 }else{
					 
				 }
			} 
			 if(parseInt(ltstpsrno)>0){
				 var chk="MN";
				 temptrno=ltstpsrno+" :: "+otype+" :: "+orderno+" :: "+qty+" :: "+chk+" :: "+ltstqty+" :: "+psrno+" :: "+sorddoc;  
				 prodetail.push(temptrno);
			 }
			 var chk="NM";
			 temptrno=psrno+" :: "+otype+" :: "+orderno+" :: "+qty+" :: "+chk+" :: "+ltstqty+" :: "+psrno+" :: "+sorddoc;  
		     //	 alert(temptrno);
		     prodetail.push(temptrno);
		
	
		
		
		}
		//alert(prodetail);
		reloaddata(prodetail);
		}   
   
	function reloaddata(prodetail){
		 var x=new XMLHttpRequest();
	  		x.onreadystatechange=function(){
	  		if (x.readyState==4 && x.status==200){
	  	     			
	  				var items=x.responseText.trim();
	  				items=items.split("::");
	  				var tst=items[0];
	  				var tst2=items[1];
	  				if(parseInt(tst)>0)  
	  				{	
	  					$("#overlay, #PleaseWait").hide();
	  					if(parseInt(tst)==2){
	  						//$('#srvdetmtrno').val(tst2);
	  						reloaddatabom();
	  						//$.messager.alert('Message', ' BOM not available for this Product  ');
	  					}else{
	  						//funload();
	  						//$('#srvdetmtrno').val(tst2);
	  						reloaddatabom();
	  						
	  					}
	  					 $("#jqxbomGrid").jqxGrid('addrow', null, {});
	  					//$('#bomdiv').load("bomGrid.jsp?docno="+srvdetmtrno+"&id="+1);
	  				//funload();
	  				
	  				}
	  				else
	  				{
	  					$("#overlay, #PleaseWait").hide();
	  				$.messager.alert('Message', ' Error in Insertion of MRP  ');
	  				}
	  				}
	  		}
	    x.open("GET","insertMRP.jsp?srvdetmtrno="+prodetail,true);			
	  	x.send();
		
		
		
		
		              
	} 
	
		
  </script>   
</body>    
</html>
