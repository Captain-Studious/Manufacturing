<jsp:include page="../../../../includes.jsp"></jsp:include>    
<%@ taglib prefix="s" uri="/struts-tags" %>
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
  /* ===== MODERN TOP BUTTON BAR ===== */
  .top-action-bar {
      display: flex;
      flex-wrap: wrap;
      gap: 10px;
      align-items: center;
      background: #f8fafc;
      border: 1px solid #e3e8ee;
      border-radius: 8px;
      padding: 12px 15px;
      margin: 10px 5px 15px 5px;
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
      padding: 6px 14px;
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
      margin: 0 5px;
  }

  .badge-wrapper {
      position: relative;
      display: inline-block;
  }

  .badge-notify {
      position: absolute;
      right: -8px;
      top: -8px;
      z-index: 2;
      background-color: #ef4444;
      color: white;
      font-size: 10px;
      padding: 3px 6px;
      border-radius: 10px;
      box-shadow: 0 2px 4px rgba(239, 68, 68, 0.3);
  }

  /* Existing Styles for Grid/Modals */
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
  @media (min-width: 900px) {               
      .modal-xl {
        width: 100%;  
       max-width:1200px;  
      }
  } 
  .textpanel{
    color: blue;
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

            <button type="button" class="action-btn" id="btnupdate" data-toggle="modal" data-target="#modalstatusupdate" data-tooltip="tooltip" title="Update Status">
                <i class="fa fa-pencil"></i> Update Status
            </button>
            
            <div class="badge-wrapper">
                <button type="button" class="action-btn" id="btnpromise" data-toggle="tooltip" title="Exceeded Promise Date" data-filtervalue="Exceeded Promise Date">
                    <i class="fa fa-handshake-o"></i> Promise Date
                </button>
                <span class="badge badge-notify badge-promisexc"></span>
            </div>

            <button type="button" class="action-btn" id="btncreatepr" data-tooltip="tooltip" title="Create Purchase Request">
                <i class="fa fa-ticket"></i> PR
            </button>
            <button type="button" class="action-btn" id="btncreatebo" data-toggle="modal" data-target="#modalworkordercreate" data-tooltip="tooltip" title="Create Work Order">
                <i class="fa fa-tasks"></i> Work Order
            </button>
            <button type="button" class="action-btn" id="btnprintwork" data-toggle="modal" data-target="#modalprintworkorder" data-tooltip="tooltip" title="Print Work Order">
                <i class="fa fa-print"></i> Print WO
            </button>
            <button type="button" class="action-btn" id="btnbomentry" data-tooltip="tooltip" title="Add Product">
                <i class="fa fa-plus-square"></i> Add Prod.
            </button>

            <div class="action-divider"></div>

            <button type="button" class="action-btn" id="btnattachs" data-toggle="modal" data-target="#modalattach" data-tooltip="tooltip" title="Attach">
                <i class="fa fa-paperclip"></i> Attach
            </button>
            <button type="button" class="action-btn" id="btncomment" data-toggle="modal" data-tooltip="tooltip" title="Comments">
                <i class="fa fa-comments"></i> Comments
            </button>
            <button type="button" class="action-btn" id="btnsalesman" data-toggle="modal" data-target="#modalsalesman" data-tooltip="tooltip" title="Datewise Statistics">
                <i class="fa fa-bar-chart"></i> Datewise Stats
            </button>
            <button type="button" class="action-btn" id="btnclient" data-toggle="modal" data-target="#modalclient" data-tooltip="tooltip" title="Client Statistics">
                <i class="fa fa-users"></i> Client Stats
            </button>
        </div>

      </div>      
    </div>         
    
    <div class="row" style="padding-top:5px;">      
      <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12" >          
        <div id="productdiv" class="borderStyle"><jsp:include page="productGrid.jsp"></jsp:include></div>                     
      </div>
    </div> 
    
    <div class="row" style="padding-top:5px;">  
      <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">          
        <div id="bomdiv" class="borderStyle"><jsp:include page="bomGrid.jsp"></jsp:include></div>                     
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
              </div>
            </div>
          </div>  
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

  <input type="hidden" name="hidbrhid" id="hidbrhid">  
  <input type="hidden" name="srvdetmtrno" id="srvdetmtrno">
  <input type="hidden" name="srvdetpsrno" id="srvdetpsrno">
  <input type="hidden" name="hidcomments" id="hidcomments"> 
  <input type="hidden" name="rowindexg" id="rowindexg"> 
  <input type="hidden" name="hidpsrno" id="hidpsrno">
  <input type="hidden" name="hidpdpworkno" id="hidpdpworkno">    
</div>		
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
      		for(var i=0;i<selectedrows.length;i++){
      			var chk=selectedrows[i];
      			var docs=rows[chk].doc_no;
      			var type=rows[chk].otype;
      			orderarray.push(docs+" :: "+type+" :: ");
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
		if(i==tmpcount-1){
			temptrno1=temptrno; 
			tempsrno1=tempsrno;
		}
		else{
			temptrno1=temptrno+","; 
			tempsrno1=tempsrno+",";
		}
		j++; 
		}
    	if(parseInt(workno)==0){
    		$.messager.alert('Warning','Work Order Not Created.');
    		return false;
    	}
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
		var i=0;var temptrno="";           
		var j=0;
		var tmpcount=selectedrows.length;
		
		var pdprows = $("#jqxpdpGrid").jqxGrid('getrows');
        var ppdetail= new Array();
      
		var prdrows=$("#jqxpdpGrid").jqxGrid('selectedrowindexes');
		var i=0;var temptrno="";           
		var j=0;
		for (var g=0; g < prdrows.length; g++) {

			  var chk=prdrows[g];
			
			var otype= pdprows[chk].otype; 
			var orderno=pdprows[chk].orderdoc;
			var calcqty=pdprows[chk].qty;
			var psrno=pdprows[chk].psrno;
			
			temptrno=orderno+" :: "+otype+" :: "+calcqty+" :: "+psrno;  
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
			 temptrno=psrno+" :: "+qty+" :: "+mtypeid+" :: "+mtype+" :: "+uomid+" :: "+mainpsrno+" :: "+mrpdoc;  
		     prodetail.push(temptrno);
		}
		saveBomEntry(prodetail,ppdetail);
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
		if(i==tmpcount-1){
			temptrno1=temptrno; 
			tempsrno1=tempsrno;
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
    function funAlertload(){  
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
			$.messager.alert('Warning','Select documents.');
			return false;
		}
		if(parseInt(chkval)>0){
		for (var i = 0; i < selectedrows.length; i++) {
            var chk=selectedrows[i];
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
   		    if(parseInt(res)!=9){
   		    	tempchk=1;
		    	   $.messager.alert('Message', ''+res4+' Not a Bulk Product');
		       }
   		 if(parseFloat(res7)>parseFloat(res5)){
   		    	tempchk=1;
   		    	   $('#jqxbomGrid').jqxGrid('unselectrow',chk);
   		    	   $.messager.alert('Message', 'Balance Quantity Not Available For '+res4);
   		       }
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
	            if((parseInt(mtypeid)!=9) && !(typeof(chkpsrno)==="undefined" || chkpsrno==null || chkpsrno=="")){
	           
	            
	            bomArray.push(bomrows[i].wodocno+" :: "+bomrows[i].psrno+" :: "+bomrows[i].uomid+" :: "+bomrows[i].mtypeid+" :: "+bomrows[i].qty+" :: "+bomrows[i].worder+" :: "+bomrows[i].bompsrno+" :: "+bomrows[i].chkpsrno+" :: ");
	            }
					
				}
			saveblendingorder(blndArray,bomArray);
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
		if(i==tmpcount-1){
			temptrno1=temptrno; 
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
	$('#jqxpdpGrid').jqxGrid('clearfilters', true); 
		var rows = $("#jqxpdpGrid").jqxGrid('getrows');
        var prodetail= new Array();
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
		     prodetail.push(temptrno);
		
	
		
		
		}
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
	  						reloaddatabom();
	  					}else{
	  						reloaddatabom();
	  						
	  					}
	  					 $("#jqxbomGrid").jqxGrid('addrow', null, {});
	  				
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