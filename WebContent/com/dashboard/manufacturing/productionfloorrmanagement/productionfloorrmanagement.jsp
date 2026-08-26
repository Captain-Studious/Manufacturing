<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%  String contextPath=request.getContextPath();%>
<!DOCTYPE html>   
<html lang="en">
<head>
<title>Sales Order Management</title>                                                 
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
</head>      <!-- onload="getBranch();" -->    
<body>                               
  <div class="container-fluid">
    <div class="row" >
      <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">            
        <div class="primarypanel custompanel" style="margin-left:5px;">  
             <div id="border1">           
	  			<button type="button" class="btn btn-default btnStyle" id="btnsubmit"  data-toggle="tooltip" title="Submit" data-placement="bottom"><i class="fa fa-refresh iconStyle" aria-hidden="true"></i></button>    
	          	<button type="button" class="btn btn-default btnStyle" id="btnexcel" data-toggle="tooltip" title="Excel Export" data-placement="bottom"><i class="fa fa-file-excel-o " aria-hidden="true"></i></button>    
                <button type="button" class="btn btn-default btnStyle" id="btncalc"  data-toggle="tooltip" onclick="funcalculate();" title="Calculate" data-placement="bottom"><i class="fa fa-calculator" aria-hidden="true"></i></button>
            </div>                                    
	  	 </div>
	  	 <div class="otherpanel custompanel"  style="margin-left:5px;">    
           <div id="border1">     
	            <button type="button" class="btn btn-default btnStyle" id="btnupdate"  data-tooltip="tooltip" title="Process Update" data-placement="bottom"><i class="fa fa-pencil " aria-hidden="true"></i></button>
	        	<button type="button" class="btn btn-default btnStyle" id="btnqlty"  data-tooltip="tooltip" title="Quality Assurance" data-placement="bottom"><i class="fa fa-pencil" aria-hidden="true"></i></button>
	            <button type="button" class="btn btn-default btnStyle" id="btnconfirm"  data-tooltip="tooltip" title="Confirmation" data-placement="bottom"><i class="fa fa-pencil" aria-hidden="true"></i></button>
	            <button type="button" class="btn btn-default btnStyle" id="btncosting"  data-tooltip="tooltip" title="Batch Costing" data-placement="bottom"><i class="fa fa-pencil" aria-hidden="true"></i></button>
           </div>                                              
	  	 </div> 
	  	 <div class="otherpanel custompanel"  style="margin-left:5px;">             
           <div id="border1">
                <button type="button" class="btn btn-default btnStyle" id="btnattachs" data-toggle="modal" data-target="#modalattach" ><i class="fa fa-download" aria-hidden="true" data-toggle="tooltip" title="Attach" data-placement="bottom"></i></button>
	            <button type="button" class="btn btn-default btnStyle" id="btncomment"  data-toggle="modal"  data-tooltip="tooltip" title="Comments" data-placement="bottom"><i class="fa fa-comments" aria-hidden="true"></i></button>
	            <button type="button" class="btn btn-default btnStyle" id="btnsalesman"  data-toggle="modal" data-target="#modalsalesman" data-tooltip="tooltip" title="Salesman Statistics" data-placement="bottom"><i class="fa fa-bar-chart" aria-hidden="true"></i></button>
	            <button type="button" class="btn btn-default btnStyle" id="btnclient"  data-toggle="modal" data-target="#modalclient" data-tooltip="tooltip" title="Client Statistics" data-placement="bottom"><i class="fa fa-bar-chart" aria-hidden="true"></i></button>
           </div>                                            
	  	  </div>
        </div>                         
         <!--  <div class="col-xs-12 col-sm-12 col-md-12 col-lg-3" style="padding-top:0;margin-top:0;padding-bottom:0;margin-bottom:0;">                        
			<p  style="font-size:75%;margin:0px;padding-top:15px;padding-left:6px;">&nbsp;</p>   
        </div>  -->       
      </div>      
    </div>         
    <div class="row" style="padding-top:5px;">          
      <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">          
        <div id="cnfrmdiv" class="borderStyle"><jsp:include page="confirmGrid.jsp"></jsp:include></div>                     
      </div>
    </div> 
     <div class="row" style="padding-top:5px;">  
      <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">          
        <div id="prcsdiv" class="borderStyle"><jsp:include page="processGrid.jsp"></jsp:include></div>                     
      </div>
     </div> 
      <div class="row" style="padding-top:5px;">  
      <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">          
        <div id="qltyassdiv" class="borderStyle"><jsp:include page="qualityassurance.jsp"></jsp:include></div>                     
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
       <!-- Comments Modal--> 
        <!-- Salesman Details Modal-->
    <%-- <div id="modalsalesman" class="modal fade" role="dialog">  
      <div class="modal-dialog">
        <div class="modal-content">
          <div class="modal-header" style="background-color:#CDFDFA">
            <button type="button" class="close" data-dismiss="modal">&times;</button>
            <h4 class="modal-title" style="text-align:center">Salesman Statistics</h4>      
          </div>
          <div class="modal-body">
          <div id="salmdiv"><jsp:include page="salesmanGrid.jsp"></jsp:include></div>
          </div>
          <div class="modal-footer" style="background-color:#CDFDFA">
            <button type="button" class="btn btn-default" data-dismiss="modal" style="background-color:red">Close</button>
          </div>  
        </div>  
      </div>
    </div> --%>
    <!-- Salesman Details Modal-->
        <!-- Client Details Modal-->
   <%--  <div id="modalclient" class="modal fade" role="dialog">  
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
    </div> --%>
    <!-- Client Details Modal-->
       <input type="hidden" name="hidbrhid" id="hidbrhid">  
       <input type="hidden" name="srvdetmtrno" id="srvdetmtrno"> 
		
  <!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script> -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@7.24.4/dist/sweetalert2.all.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.6-rc.0/js/select2.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/js-cookie@2/src/js.cookie.min.js"></script>
<script type="text/javascript">   
    $(document).ready(function(){ 
    $('[data-tooltip="tooltip"]').tooltip();
    	 $("body").prepend('<div id="overlay" class="ui-widget-overlay" style="z-index: 1; display: none;"></div>');
	     $("body").prepend("<div id='PleaseWait' style='display: none;position:absolute; z-index: 1;top:180px;right:550px;'><img src='../../../../icons/31load.gif'/></div>");
    	 $('[data-toggle="tooltip"]').tooltip(); 
    	 $('#btnattachs').click(function(){ 
         	funAttachs(event);      
         });
        $('#btnsubmit').click(function(){         
           // funload(); 
            $('#cnfrmdiv').load("confirmGrid.jsp?id=1"); 
            $('#prcsdiv').load("processGrid.jsp?id=1");   
            $('#qltyassdiv').load("qualityassurance.jsp?id=1");      
        });          
        $('#btnexcel').click(function(){         
	         $("#cnfrmdiv").excelexportjs({
				containerid: "cnfrmdiv",   
				datatype: 'json',
				dataset: null,
				gridId: "jqxcnfrmGrid",
				columns: getColumns("jqxcnfrmGrid") ,       
				worksheetName:"Production Floor Management"             
			}); 
        });
        $('#btncomment').click(function(){        
  	       /*  var actdocno=$('#hiddocno').val();
  	    	if(actdocno==""){  
  	    		swal({
  					type: 'warning',
  					title: 'Warning',
  					text: 'Please select a document'      
  				});
  	    		return false;
  	    	}  
  	      	  */  
  	      	$('#modalcomments').modal('toggle');              
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
	        
   }
   function funcalculate(){    
		$('#jqxpdpGrid').jqxGrid('clearfilters', true);    
	
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
		for (i = 0; i < selectedrows.length; i++) {

		if(i==0){      
			var srvdetmtrno= $('#jqxpdpGrid').jqxGrid('getcellvalue', selectedrows[i], "doc_no");     
			temptrno=srvdetmtrno;   
		}  
		else{  
			var srvdetmtrno= $('#jqxpdpGrid').jqxGrid('getcellvalue', selectedrows[i], "doc_no");
			 temptrno=temptrno+","+srvdetmtrno;
		}
		temptrno1=temptrno+","; 
		j++; 
		}
		$('#srvdetmtrno').val(temptrno1);
		reloaddata($('#srvdetmtrno').val());	
		}
		});
		}   
	function reloaddata(srvdetmtrno){
		$('#prcsdiv').load("bomGrid.jsp?docno="+srvdetmtrno+"&id="+1);              
	} 
	 function funAttachs(event){                            
			//var brchid="<%= session.getAttribute("BRANCHID").toString() %>";  
			var brchid=$('#hidbrhid').val();  
	        var docno=$('#hiddocno').val();  		
	   		 if(docno!=''){      
	   			var frmdet="SOR";
	   			var fname="Sales Order";
	   		    var  myWindow= window.open("<%=contextPath%>/com/dashboard/management/Attachmaster.jsp?formCode="+frmdet+"&docno="+docno+"&brchid="+brchid+"&frmname="+fname,"_blank","top=180,left=310,Width=800,Height=430,location=no,scrollbars=no,toolbar=no,resizable=no,meanubar=no,titlebar=no");
					 myWindow.focus();   
	   		}else{   
				$.messager.alert('Message','Select a Document....!','warning');
				return;
			    }               
		   } 
  <%--  function getBranch() {    
		var x = new XMLHttpRequest();
		x.onreadystatechange = function() {
			if (x.readyState == 4 && x.status == 200) {
				var items = x.responseText;
			//alert(items);
				items = items.split('####');
				
				var branchIdItems  = items[0].split(",");
				var branchItems = items[1].split(",");
				var perm = items[2];  
				var optionsbranch;
				/* if(perm==0){
				 optionsbranch = '<option value="a" selected>All</option>';
				}
				else{    
					
				} */
				for (var i = 0; i < branchItems.length; i++) {
					optionsbranch += '<option value="' + branchIdItems[i].trim() + '">'
							+ branchItems[i] + '</option>';
				}
				$("select#cmbbranch").html(optionsbranch);
				/* if ($('#hidcmbbranch').val() != null) {
					$('#cmbbranch').val($('#hidcmbbranch').val());
				} */
			} else {
				//alert("Error");
			}  
		}
		x.open("GET","<%=contextPath%>/com/dashboard/getBranch.jsp", true);
		x.send();   
	} --%>
  </script>   
</body>    
</html>
