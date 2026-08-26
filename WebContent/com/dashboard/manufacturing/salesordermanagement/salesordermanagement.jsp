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
    border-radius: 20px !important;       
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
  <style>
.hidden-scrollbar {
  /* // overflow: auto; */
  height: 530px;
    overflow-x: hidden;
    
} 
#divname {
     
    background-color: #e2c791;
    box-shadow: 10px 10px grey;
     position:fixed;z-index:1000;right:30px;top:100px;  
}
</style>  
</head>      <!-- onload="getBranch();" -->    
<body> 
<div class='hidden-scrollbar'>                              
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
	            <button type="button" class="btn btn-default btnStyle" id="btnupdate"  data-tooltip="tooltip" data-toggle="modal" data-target="#modalstatusupdate" title="Update Status" data-placement="bottom"><i class="fa fa-pencil " aria-hidden="true"></i></button>
	            
	           <div class="btn-group" role="group">
          	<button type="button" class="btn btn-default" id="btnpromise" data-toggle="tooltip" title="Exceeded Promise Date" data-placement="bottom" data-filtervalue="Exceeded Promise Date" ><i class="fa fa-handshake-o " aria-hidden="true"></i></button>
          	<span class="badge badge-notify badge-promisexc"></span>
          </div>  
           </div>                                              
	  	 </div> 
	  	 <div class="otherpanel custompanel"  style="margin-left:5px;">             
           <div id="border1">
                <button type="button" class="btn btn-default btnStyle" id="btnattachs" data-toggle="modal" data-target="#modalattach" ><i class="fa fa-download" aria-hidden="true" data-toggle="tooltip" title="Attach" data-placement="bottom"></i></button>
	            <button type="button" class="btn btn-default btnStyle" id="btncomment"  data-toggle="modal"  data-tooltip="tooltip" title="Comments" data-placement="bottom"><i class="fa fa-comments" aria-hidden="true"></i></button>
	            <button type="button" class="btn btn-default btnStyle" id="btnsalesman"  data-toggle="modal" data-target="#modalsalesman" data-tooltip="tooltip" title="Date Statistics" data-placement="bottom"><i class="fa fa-bar-chart" aria-hidden="true"></i></button>
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
        <div id="productdiv" class="borderStyle"><jsp:include page="productGrid.jsp"></jsp:include></div>                     
      </div>
    </div> 
     <div class="row" style="padding-top:5px;">  
      <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">          
        <div id="bomdiv" class="borderStyle"><jsp:include page="bomGrid.jsp"></jsp:include></div>
          <table width="100% "  >
          <tr>
          <td>
          <button type="button" class="btn btn-default"  onclick="funReserve();" style="background-color:green;color:yellow">Reserve</button>
          </td>
          <td>
          <input type="button" id="loads" class="myButtons" value="Load Data" onclick="loaddatass()">
          </td>
          </tr>
          <tr>
           <td>
            <div id="divname" hidden="true">
   <table width="100%" id="prdetails"> 
   
   <tr style="height: 25px" bgcolor="#e5ab69">  
   <td align="center"> <font color="#fff"><b>Quantity</b></font></td> <td  align="center"><font color="#fff"><b>Stock Qty</b></font></td>  <td  align="center"><font color="#fff"><b>Batch No</b></font></td><td  align="center"><font color="#fff"><b>Expiry Date</b></font></td><td  align="center"><font color="#fff"><b>Description</b></font></td></tr>
     <tr  class="trhideclass1">
   <td > <input type="text" id="qty1" onchange="chkstocksval(this.value,1)" ></td>     <td><input type="text"  tabindex="-1"id="stkqty1"></td> <td><input type="text" tabindex="-1"  id="bt1"></td><td><input type="text" tabindex="-1"  id="ed1"></td><td><input type="text" tabindex="-1"  id="dsc1"></td><td><input type="hidden" id="stkid1"></td> </tr>
       <tr class="trhideclass2">
   <td>  <input type="text" id="qty2" onchange="chkstocksval(this.value,2)"></td>    <td><input type="text"  tabindex="-1"id="stkqty2"></td>   <td><input type="text" tabindex="-1"  id="bt2"></td><td><input type="text" tabindex="-1"  id="ed2"></td><td><input type="text" tabindex="-1"  id="dsc2"></td><td><input type="hidden" id="stkid2"></td> </tr>
         <tr class="trhideclass3">
   <td>  <input type="text" id="qty3" onchange="chkstocksval(this.value,3)"></td>    <td><input type="text" tabindex="-1"id="stkqty3"></td>    <td><input type="text" tabindex="-1"  id="bt3"></td><td><input type="text" tabindex="-1"  id="ed3"></td><td><input type="text" tabindex="-1"  id="dsc3"></td><td><input type="hidden" id="stkid3"></td> </tr>
      <tr class="trhideclass4">
   <td>  <input type="text" id="qty4" onchange="chkstocksval(this.value,4)"></td>    <td><input type="text" tabindex="-1"  id="stkqty4"></td>   <td><input type="text" tabindex="-1"  id="bt4"></td><td><input type="text" tabindex="-1"  id="ed4"></td><td><input type="text" tabindex="-1"  id="dsc4"></td><td><input type="hidden" id="stkid4"></td> </tr>
     <tr class="trhideclass5">
   <td>  <input type="text" id="qty5" onchange="chkstocksval(this.value,5)"></td>   <td><input type="text" tabindex="-1" id="stkqty5"></td>   <td><input type="text" tabindex="-1"  id="bt5"></td><td><input type="text" tabindex="-1"   id="ed5"></td><td><input type="text" tabindex="-1"  id="dsc5"></td> <td><input type="hidden" id="stkid5"></td> </tr>
       <tr class="trhideclass6">
   <td>  <input type="text" id="qty6" onchange="chkstocksval(this.value,6)"></td>     <td><input type="text" tabindex="-1" id="stkqty6"></td>  <td><input type="text" tabindex="-1"  id="bt6"></td><td><input type="text" tabindex="-1"  id="ed6"></td><td><input type="text" tabindex="-1"  id="dsc6"></td><td><input type="hidden" id="stkid6"></td> </tr>
      <tr class="trhideclass7">
   <td>  <input type="text" id="qty7" onchange="chkstocksval(this.value,7)"></td>     <td><input type="text" tabindex="-1" id="stkqty7"></td>  <td><input type="text" tabindex="-1"  id="bt7"></td><td><input type="text" tabindex="-1"  id="ed7"></td><td><input type="text" tabindex="-1"  id="dsc7"></td><td><input type="hidden" id="stkid7"></td> </tr>
      <tr class="trhideclass8">
   <td>  <input type="text" id="qty8" onchange="chkstocksval(this.value,8)"></td>     <td><input type="text" tabindex="-1" id="stkqty8"></td>   <td><input type="text" tabindex="-1"  id="bt8"></td><td><input type="text" tabindex="-1"  id="ed8"></td><td><input type="text" tabindex="-1"  id="dsc8"></td><td><input type="hidden" id="stkid8"></td> </tr>  
  <tr class="trhideclass9">
   <td>  <input type="text" id="qty9" onchange="chkstocksval(this.value,9)"></td>     <td><input type="text" tabindex="-1" id="stkqty9"></td> <td><input type="text"  tabindex="-1"  id="bt9"></td><td><input type="text" tabindex="-1"  id="ed9"></td><td><input type="text" tabindex="-1"  id="dsc9"></td><td><input type="hidden" id="stkid9"></td> </tr>
      <tr class="trhideclass10">
   <td>  <input type="text" id="qty10" onchange="chkstocksval(this.value,10)"></td>    <td><input type="text" tabindex="-1" id="stkqty10"></td>   <td><input type="text" tabindex="-1"  id="bt10"></td><td><input type="text" tabindex="-1"  id="ed10"> </td><td><input type="text" tabindex="-1"  id="dsc10"></td><td><input type="hidden" id="stkid10"></td> </tr>
  
       <tr>  <td colspan="7" > &nbsp; </td></tr>
  
  
   <tr> <td colspan="7" align="center"> 
   
    
      <input type="button" name="searchs1" id="searchs1" class="myButtons" value="Submit"  onclick="chkfocss()">
      
      
      
       <input type="button" name="searchss1" id="searchss1" class="myButton" value="Close" onclick="closes()"  >
   
   </td>
          <tr>  <td > &nbsp; </td> <td > &nbsp; </td> <td > &nbsp; </td> <td > &nbsp; </td> <td > &nbsp; </td> <td > &nbsp; </td> <td > &nbsp; </td></tr>
   
   </table>
   
   
   </div>
   
   
<div id="batchdiv"  hidden="true"  ><jsp:include page="batchdet.jsp"></jsp:include></div> 
           </td>
           </tr>
          </table>  
           
                             
      </div>
     </div> 
      <div class="row" style="padding-top:5px;">  
      <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">          
        <div id="thirddiv" class="borderStyle"><jsp:include page="thirdGrid.jsp"></jsp:include></div>                     
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
    <div id="modalsalesman" class="modal fade" role="dialog">  
      <div class="modal-dialog">
        <div class="modal-content">
          <div class="modal-header" style="background-color:#CDFDFA">
            <button type="button" class="close" data-dismiss="modal">&times;</button>
            <h4 class="modal-title" style="text-align:center">Date Statistics</h4>      
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
    </div>
    </div>
    <!-- Client Details Modal-->
       <input type="hidden" name="hidbrhid" id="hidbrhid">  
       <input type="hidden" name="srvdetmtrno" id="srvdetmtrno"> 
		<input type="hidden" name="hidtrno" id="hidtrno"> 
		<input type="hidden" name="hidvoc" id="hidvoc"> 
		<input type="hidden" name="hidprdid" id="hidprdid"> 
		<input type="hidden" name="srvdetmtrnonw" id="srvdetmtrnonw"> 
		<input type="hidden" name="hidcomments" id="hidcomments"> 
		<input type="hidden" name="hidtype" id="hidtype"> 
		 <input type="hidden" name="hidrow" id="hidrow">
         <input type="hidden" name="hidgispsrno" id="hidgispsrno">
         <input type="hidden" name="hidgisunit" id="hidgisunit">
          <input type="hidden" name="focvalidate" id="focvalidate">
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
    	 $("body").prepend('<div id="overlay" class="ui-widget-overlay" style="z-index: 1; display: none;"></div>');
	     $("body").prepend("<div id='PleaseWait' style='display: none;position:absolute; z-index: 1;top:180px;right:550px;'><img src='../../../../icons/31load.gif'/></div>");
    	 $('[data-toggle="tooltip"]').tooltip(); 
    	 
    	 $('#btnattachs').click(function(){ 
         	funAttachs(event); 
         	
         });
        $('#btnsubmit').click(function(){     
        	 $('#jqxbomGrid').jqxGrid('clear');
        	 $('#jqxthirdGrid').jqxGrid('clear');
        	 $('#jqxpdpGrid').jqxGrid('clear');
        	 $('#srvdetmtrno').val('');
            funload(); 
            $('#salmdiv').load('salesmanGrid.jsp?id='+1);   
            $('#crmdiv').load('clientGrid.jsp?id='+1);      
        });          
        $('#btnexcel').click(function(){ 
        	//alert("in excel");
	         $("#productdiv").excelexportjs({
				containerid: "productdiv",   
				datatype: 'json',
				dataset: null,
				gridId: "jqxpdpGrid",
				columns: getColumns("jqxpdpGrid") ,       
				worksheetName:"Sales Order Management"             
			}); 
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
        $('#btnpromise').click(function(){
        	$('#jqxbomGrid').jqxGrid('clear');
       	    $('#jqxthirdGrid').jqxGrid('clear');
        	funAlertload();
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
   function funload(){  
        /* var brch=$('#cmbbranch').val();    
        var fromdate=$('#fromdate').val();
        var todate=$('#todate').val();           
        $('#sapdiv').load("propertyGrid.jsp?brch="+property+"&id="+1+"&from="+fromdate+"&to="+todate); */
	   $('#productdiv').load("productGrid.jsp?id="+1);       
   }
   function funAlertload(){  
       /* var brch=$('#cmbbranch').val();    
       var fromdate=$('#fromdate').val();
       var todate=$('#todate').val();           
       $('#sapdiv').load("propertyGrid.jsp?brch="+property+"&id="+1+"&from="+fromdate+"&to="+todate); */
	   $('#productdiv').load("productGrid.jsp?id="+2);       
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
   
   function funReserve(){
	   
	   //alert("in reserve");
	   var purchasearray=new Array();
	/*       var selectedrows=$("#jqxthirdGrid").jqxGrid('getrows');
		    
			if(selectedrows.length==0){
				$.messager.alert('Warning','Product Is Mandatory');
				return false;
			}
			
			      var selectedrows=$("#jqxthirdGrid").jqxGrid('getrows');
		    
			if(selectedrows.length==0){
				$.messager.alert('Warning','Product Is Mandatory');
				return false;
			}
			
			var aa=0;
			var selectedrows=$("#jqxthirdGrid").jqxGrid('getrows');
			//selectedrows = selectedrows.sort(function(a,b){return a - b});  
			
				  for(var i=0 ; i < selectedrows.length ; i++){
						var proqty=	$("#jqxthirdGrid").jqxGrid('getcellvalue',selectedrows[i],'proqty');
						if(parseFloat(proqty)<=0 ||proqty=="" || proqty==null)
							{
							aa=1;
							break;
							}
					 
						  }
				  
				  if(aa==1)
					  {
					  
					  $.messager.alert('Warning','Procurement Quantity Mandatory');
					  return false;
					  }
			
			
			
			var selectedrows=$("#jqxthirdGrid").jqxGrid('getrows');
			//selectedrows = selectedrows.sort(function(a,b){return a - b});  
			
		 var aa=0;
			
				  for(var i=0 ; i < selectedrows.length ; i++){
					 
			 
						
						var stkqty=	$("#jqxthirdGrid").jqxGrid('getcellvalue',selectedrows[i],'stkqty');
						var proqty=$("#jqxthirdGrid").jqxGrid('getcellvalue',selectedrows[i],'proqty');
						
						
						if(proqty>stkqty)
							{
							aa=1;
							break;
							
							}
						
						
						
				  }
			
			if(aa==1)
				{
				
				 $.messager.alert('Message', 'Procurement Quantity Not More Than Stock Quantity');
				 
				 return 0;
				} */
			
				var selectedrows=$("#jqxthirdGrid").jqxGrid('getrows');
			//alert("selectedrowslength====="+selectedrows.length);
		 	if(parseFloat(selectedrows.length)==0){
		 		$.messager.alert('Message', '  Select a Product to Reserve ');
		 		return false;
		 	}
			
			  $.messager.confirm('Confirm', 'Do you want to Reserve?', function(r){
	 			if (r){	
	 				$("#overlay, #PleaseWait").show();
	 				var selectedrows=$("#jqxthirdGrid").jqxGrid('getrows');
	 				//selectedrows = selectedrows.sort(function(a,b){return a - b});  
	 				
	 			 
	 				
	 					  for(var i=0 ; i < selectedrows.length ; i++){
	 						 
	 							var unitdocno=	$("#jqxthirdGrid").jqxGrid('getcellvalue',selectedrows[i],'unitdoc');
	 							var psrno=$("#jqxthirdGrid").jqxGrid('getcellvalue',selectedrows[i],'psrno');
	 							var prodoc=	$("#jqxthirdGrid").jqxGrid('getcellvalue',selectedrows[i],'prdid');
	 							
	 							var purqty=$("#jqxthirdGrid").jqxGrid('getcellvalue',selectedrows[i],'qty');
	 							var specid=$("#jqxthirdGrid").jqxGrid('getcellvalue',selectedrows[i],'specno');
	 							
	 							
	 							var brhid=	$("#jqxthirdGrid").jqxGrid('getcellvalue',selectedrows[i],'brhid');
	 							
	 							var costdocno=	$("#jqxthirdGrid").jqxGrid('getcellvalue',selectedrows[i],'rdocno');
	 							 
	 						  var resqty=$("#jqxthirdGrid").jqxGrid('getcellvalue',selectedrows[i],'toberesqty');
	 						  
	 						  var tr_no=$("#jqxthirdGrid").jqxGrid('getcellvalue',selectedrows[i],'tr_no');
	 						  
	 						 var voc=$("#jqxthirdGrid").jqxGrid('getcellvalue',selectedrows[i],'voc');
	 						  
	 						 var dresqty=$("#jqxthirdGrid").jqxGrid('getcellvalue',selectedrows[i],'resqty');
	 						  var locid=0;
	 						 var stockid=$("#jqxthirdGrid").jqxGrid('getcellvalue',selectedrows[i],'stockid');
	 						  
	 						  var rowno=0;
	 						  
	 						 purchasearray.push(rowno+" :: "+resqty+" :: "+purqty+" :: "+brhid+" :: "+psrno+" :: "+specid+" :: "+locid+" :: "+costdocno+" :: "+tr_no+" :: "+voc+" :: "+dresqty+" :: "+stockid+" ::");
	 						  
	 					  }
	 					  
	 					//  alert("purchasearray=="+purchasearray);
	 					 saveGridData(purchasearray);
	 				
	 			}
	 	 		});
		
	   
   }
   
   function saveGridData(purchasearray){
		var contocno=$('#hidvoc').val();
		var conttrno=$('#hidtrno').val();  
		var prdid=$('#hidprdid').val();
		var type=$('#hidtype').val();
		var btn="reserve";
		var x=new XMLHttpRequest();
		x.onreadystatechange=function(){
		if (x.readyState==4 && x.status==200){
	     			
				var items=x.responseText;
				if(parseInt(items)>0)  
				{	
					$("#overlay, #PleaseWait").hide();
					if(parseInt(items)==1)  
					{	
				$.messager.alert('Message', '  Product Successfully Reserved ');
				reloaddata($('#srvdetmtrno').val(),$('#srvdetmtrnonw').val());	
				$('#thirddiv').load("thirdGrid.jsp?docno="+prdid+"&maindocno="+$('#srvdetmtrno').val()+"&stkdoc="+$('#srvdetmtrnonw').val()+"&dtype="+type+"&id="+1); 
				
					}
					if(parseInt(items)==2)  
					{	
						$.messager.alert('Message', '  Product Not in Stock ');	
					}
					disable();
				}
				else
				{
					$("#overlay, #PleaseWait").hide();
				$.messager.alert('Message', '  Not Reserved  ');
				}
				}
		}
   x.open("GET","reserveproduct.jsp?purchasearray="+purchasearray+"&contocno="+contocno+"&conttrno="+conttrno+"&click="+btn+"&dtype="+type,true);			
	x.send();
			
	}
   
   function funcalculate(){ 
	    $('#jqxbomGrid').jqxGrid('clear');
  	    $('#jqxthirdGrid').jqxGrid('clear');
		$('#jqxpdpGrid').jqxGrid('clearfilters', true);    
	
		var rows = $("#jqxpdpGrid").jqxGrid('getrows');

		var selectedrows=$("#jqxpdpGrid").jqxGrid('selectedrowindexes');
		selectedrows = selectedrows.sort(function(a,b){return a - b});

		if(selectedrows.length==0){
			$("#overlay, #PleaseWait").hide();
			$.messager.alert('Warning','Select documents.');
			return false;
		}
		
		$("#overlay, #PleaseWait").show();

		var i=0;var temptrno="",temptrno2="";           
		var j=0;
		for (i = 0; i < selectedrows.length; i++) {

		if(i==0){ 
			var dtype=$('#jqxpdpGrid').jqxGrid('getcellvalue', selectedrows[i], "otype");
			if(dtype=="SOR"){
			var srvdetmtrno= $('#jqxpdpGrid').jqxGrid('getcellvalue', selectedrows[i], "doc_no");     
			temptrno=srvdetmtrno; 
			}
			if(dtype=="STKO"){
				var srvdetmtrno2= $('#jqxpdpGrid').jqxGrid('getcellvalue', selectedrows[i], "doc_no");     
				temptrno2=srvdetmtrno2; 
				}
		}  
		else{
			var dtype=$('#jqxpdpGrid').jqxGrid('getcellvalue', selectedrows[i], "otype");
			if(dtype=="SOR"){
			var srvdetmtrno= $('#jqxpdpGrid').jqxGrid('getcellvalue', selectedrows[i], "doc_no");
			if(temptrno==""){
				 temptrno=srvdetmtrno;
			}
			else{
				 temptrno=temptrno+","+srvdetmtrno;
			}
			
			}
			if(dtype=="STKO"){
				var srvdetmtrno2= $('#jqxpdpGrid').jqxGrid('getcellvalue', selectedrows[i], "doc_no");
				if(temptrno2==""){
					 temptrno2=srvdetmtrno2;
				}
				else{
					 temptrno2=temptrno2+","+srvdetmtrno2;
				}
				 
			}
		}
		//alert("salesorderdoc==="+temptrno);
		
			temptrno1=temptrno+",";
		
		//alert("stockorderdoc==="+temptrno2);
		
		temptrno3=temptrno2+",";
		
		j++; 
		}
		$('#srvdetmtrno').val(temptrno1);
		$('#srvdetmtrnonw').val(temptrno3);
		reloaddata($('#srvdetmtrno').val(),$('#srvdetmtrnonw').val());	
		
		}  
   
   function funcalculatenw(){
	   $('#jqxpdpGrid').jqxGrid('clearfilters', true);
	   var rows = $("#jqxpdpGrid").jqxGrid('getrows');

		var selectedrows=$("#jqxpdpGrid").jqxGrid('selectedrowindexes');
		selectedrows = selectedrows.sort(function(a,b){return a - b});
		var i=0;var temptrno="",temptrno2="";           
		var j=0;
		for (i = 0; i < selectedrows.length; i++) {

		if(i==0){ 
			var dtype=$('#jqxpdpGrid').jqxGrid('getcellvalue', selectedrows[i], "otype");
			if(dtype=="SOR"){
			var srvdetmtrno= $('#jqxpdpGrid').jqxGrid('getcellvalue', selectedrows[i], "doc_no");     
			temptrno=srvdetmtrno; 
			}
			if(dtype=="STKO"){
				var srvdetmtrno2= $('#jqxpdpGrid').jqxGrid('getcellvalue', selectedrows[i], "doc_no");     
				temptrno2=srvdetmtrno2; 
				}
		}  
		else{
			var dtype=$('#jqxpdpGrid').jqxGrid('getcellvalue', selectedrows[i], "otype");
			if(dtype=="SOR"){
			var srvdetmtrno= $('#jqxpdpGrid').jqxGrid('getcellvalue', selectedrows[i], "doc_no");
			if(temptrno==""){
				 temptrno=srvdetmtrno;
			}
			else{
				 temptrno=temptrno+","+srvdetmtrno;
			}
			}
			if(dtype=="STKO"){
				var srvdetmtrno2= $('#jqxpdpGrid').jqxGrid('getcellvalue', selectedrows[i], "doc_no");
				if(temptrno2==""){
					 temptrno2=srvdetmtrno2;
				}
				else{
					 temptrno2=temptrno2+","+srvdetmtrno2;
				}
			}
		}
		temptrno1=temptrno+",";
		temptrno3=temptrno2+",";
		j++; 
		}
		$('#srvdetmtrno').val(temptrno1);
		$('#srvdetmtrnonw').val(temptrno3);
		reloaddata($('#srvdetmtrno').val(),$('#srvdetmtrnonw').val());	
   }
	function reloaddata(srvdetmtrno,srvdetmtrnonw){
		//alert("srvdetmtrnonw==="+srvdetmtrnonw);
		$('#bomdiv').load("bomGrid.jsp?docno="+srvdetmtrno+"&stkdoc="+srvdetmtrnonw+"&id="+1);              
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
   function loaddatass()
	 {
		 
			$("#batgrid").jqxGrid('clear'); 
		 
		 
		   $('#prdetails').find('input[type=text]').each(function(){
			     
			      $(this).val("");
			       });
		   
		   
		   
		 
		  var temppsrno=document.getElementById("hidgispsrno").value; 
		 var unit=document.getElementById("hidgisunit").value; 
		 var brhid=document.getElementById("hidbrhid").value; 
		 var temptrno=""; 
		 
		 if(temppsrno==""){
				$.messager.alert('Warning','Select a Product.');
				return false;
		   }
		 
		 

     	  
 		var rows1 = $("#jqxthirdGrid").jqxGrid('getrows');
	    var aa=0;
	   
	
	   var tempchk="";
   	 
		 
		 
 		 $("#batchdiv").load('batchdet.jsp?psrno='+temppsrno+'&unit='+unit+'&temptrno='+temptrno+'&tempchk='+tempchk+"&aa=YES"+"&brhid="+brhid);
 		  setTimeout(function() {
 		     loaddatass1();
 		  }, 1000);
	 }
	 function loaddatass1()
	 {
		 
		 document.getElementById("qty1").value="";
		 //document.getElementById("foc1").value="";
		 document.getElementById("stkqty1").value="";
		 document.getElementById("bt1").value="";
		 document.getElementById("ed1").value="";
		 document.getElementById("stkid1").value="";
		 document.getElementById("dsc1").value="";
		 
		 document.getElementById("qty2").value="";
		 //document.getElementById("foc2").value="";
		 document.getElementById("stkqty2").value="";
		 document.getElementById("bt2").value="";
		 document.getElementById("ed2").value="";
		 document.getElementById("stkid2").value="";
		 document.getElementById("dsc2").value="";
		 
		 document.getElementById("qty3").value="";
		// document.getElementById("foc3").value="";
		 document.getElementById("stkqty3").value="";
		 document.getElementById("bt3").value="";
		 document.getElementById("ed3").value="";
		 document.getElementById("stkid3").value="";
		 document.getElementById("dsc3").value="";
		 
		 document.getElementById("qty4").value="";
		// document.getElementById("foc4").value="";
		 document.getElementById("stkqty4").value="";
		 document.getElementById("bt4").value="";
		 document.getElementById("ed4").value="";
		 document.getElementById("stkid4").value="";
		 document.getElementById("dsc4").value="";
		 
		 
		 document.getElementById("qty5").value="";
		// document.getElementById("foc5").value="";
		 document.getElementById("stkqty5").value="";
		 document.getElementById("bt5").value="";
		 document.getElementById("ed5").value="";
		 document.getElementById("stkid5").value="";
		 document.getElementById("dsc5").value="";
		 
		 
		 document.getElementById("qty6").value="";
		// document.getElementById("foc6").value="";
		 document.getElementById("stkqty6").value="";
		 document.getElementById("bt6").value="";
		 document.getElementById("ed6").value="";
		 document.getElementById("stkid6").value="";
		 document.getElementById("dsc6").value="";
		 
		 
		 document.getElementById("qty7").value="";
		// document.getElementById("foc7").value="";
		 document.getElementById("stkqty7").value="";
		 document.getElementById("bt7").value="";
		 document.getElementById("ed7").value="";
		 document.getElementById("stkid7").value="";
		 document.getElementById("dsc7").value="";
		 
		 
		 document.getElementById("qty8").value="";
		 //document.getElementById("foc8").value="";
		 document.getElementById("stkqty8").value="";
		 document.getElementById("bt8").value="";
		 document.getElementById("ed8").value="";
		 document.getElementById("stkid8").value="";
		 document.getElementById("dsc8").value="";
		 
		 
		 
		 document.getElementById("qty9").value="";
		// document.getElementById("foc9").value="";
		 document.getElementById("stkqty9").value="";
		 document.getElementById("bt9").value="";
		 document.getElementById("ed9").value="";
		 document.getElementById("stkid9").value="";
		 document.getElementById("dsc9").value="";
		 
		 
		 document.getElementById("qty10").value="";
		// document.getElementById("foc10").value="";
		 document.getElementById("stkqty10").value="";
		 document.getElementById("bt10").value="";
		 document.getElementById("ed10").value="";
		 document.getElementById("stkid10").value="";
		 document.getElementById("dsc10").value="";
		// document.getElementById("collqty").value="";
		 
		 
 		$('#bt1').attr('readonly', true);
 		$('#bt2').attr('readonly', true);
 		$('#bt3').attr('readonly', true);
 		$('#bt4').attr('readonly', true);
 		$('#bt5').attr('readonly', true);
 		$('#bt6').attr('readonly', true);
 		$('#bt7').attr('readonly', true);
 		$('#bt8').attr('readonly', true);
 		$('#bt9').attr('readonly', true);
 		$('#bt10').attr('readonly', true);
 		$('#ed1').attr('readonly', true);
 		$('#ed2').attr('readonly', true);
 		$('#ed3').attr('readonly', true);
 		$('#ed4').attr('readonly', true);
 		$('#ed5').attr('readonly', true);
 		$('#ed6').attr('readonly', true);
 		$('#ed7').attr('readonly', true);
 		$('#ed8').attr('readonly', true);
 		$('#ed9').attr('readonly', true);
 		$('#ed10').attr('readonly', true);
		$('#stkqty1').attr('readonly', true);
 		$('#stkqty2').attr('readonly', true);
 		$('#stkqty3').attr('readonly', true);
 		$('#stkqty4').attr('readonly', true);
 		$('#stkqty5').attr('readonly', true);
 		$('#stkqty6').attr('readonly', true);
 		$('#stkqty7').attr('readonly', true);
 		$('#stkqty8').attr('readonly', true);
 		$('#stkqty9').attr('readonly', true);
 		$('#stkqty10').attr('readonly', true);
 		
 		$('#dsc1').attr('readonly', true);
 		$('#dsc2').attr('readonly', true);
 		$('#dsc3').attr('readonly', true);
 		$('#dsc4').attr('readonly', true);
 		$('#dsc5').attr('readonly', true);
 		$('#dsc6').attr('readonly', true);
 		$('#dsc7').attr('readonly', true);
 		$('#dsc8').attr('readonly', true);
 		$('#dsc9').attr('readonly', true);
 		$('#dsc10').attr('readonly', true);
 		
		   	 $('.trhideclass1').hide();
			 $('.trhideclass2').hide();
			 $('.trhideclass3').hide();
			 $('.trhideclass4').hide();
			 $('.trhideclass5').hide();
			 $('.trhideclass6').hide();
			 $('.trhideclass7').hide();
			 $('.trhideclass8').hide();
			 $('.trhideclass9').hide();
			 $('.trhideclass10').hide();
		   		
 	  var rows = $('#batgrid').jqxGrid('getrows');
    var kk=0;
     for(var i=0 ; i < rows.length ; i++){
  	   kk=kk+1;
  	   var id1=".trhideclass"+kk;
  	   var id3="bt"+kk;
  	   var id4="ed"+kk;
  	   var id5="stkqty"+kk;
  	   var id6="stkid"+kk;
  	   var id7="qty"+kk;
  	   var id8="dsc"+kk;
  	   $(""+id1).show();	
		   document.getElementById(""+id3).value= $('#batgrid').jqxGrid('getcellvalue', i, "batch_no");
  	   document.getElementById(""+id4).value= $('#batgrid').jqxGrid('getcelltext', i, "exp_date");
  	   document.getElementById(""+id5).value= $('#batgrid').jqxGrid('getcellvalue', i, "stkqty");
  	   document.getElementById(""+id6).value= $('#batgrid').jqxGrid('getcellvalue', i, "stockid");
  	   document.getElementById(""+id8).value= $('#batgrid').jqxGrid('getcellvalue', i, "description");
  	  /*  if($('#editdata').val()=="Editvalue"){
  		   document.getElementById(""+id7).value= $('#batgrid').jqxGrid('getcellvalue', i, "setqty");
  	   } */
  	  
         }
     		$('#divname').show();
     
    		 document.getElementById("qty1").focus();
			 }
	 
	 function clearprd()
		{
			
			$("#batgrid").jqxGrid('clear'); 
			 document.getElementById("qty1").value="";
			// document.getElementById("foc1").value="";
			 document.getElementById("stkqty1").value="";
			 document.getElementById("bt1").value="";
			 document.getElementById("ed1").value="";
			 document.getElementById("stkid1").value="";
			 document.getElementById("dsc1").value="";
			 
			 document.getElementById("qty2").value="";
			// document.getElementById("foc2").value="";
			 document.getElementById("stkqty2").value="";
			 document.getElementById("bt2").value="";
			 document.getElementById("ed2").value="";
			 document.getElementById("stkid2").value="";
			 document.getElementById("dsc2").value="";
			 
			 document.getElementById("qty3").value="";
			// document.getElementById("foc3").value="";
			 document.getElementById("stkqty3").value="";
			 document.getElementById("bt3").value="";
			 document.getElementById("ed3").value="";
			 document.getElementById("stkid3").value="";
			 document.getElementById("dsc3").value="";
			 
			 document.getElementById("qty4").value="";
			// document.getElementById("foc4").value="";
			 document.getElementById("stkqty4").value="";
			 document.getElementById("bt4").value="";
			 document.getElementById("ed4").value="";
			 document.getElementById("stkid4").value="";
			 document.getElementById("dsc4").value="";
			 
			 
			 document.getElementById("qty5").value="";
			// document.getElementById("foc5").value="";
			 document.getElementById("stkqty5").value="";
			 document.getElementById("bt5").value="";
			 document.getElementById("ed5").value="";
			 document.getElementById("stkid5").value="";
			 document.getElementById("dsc5").value="";
			 
			 
			 document.getElementById("qty6").value="";
			// document.getElementById("foc6").value="";
			 document.getElementById("stkqty6").value="";
			 document.getElementById("bt6").value="";
			 document.getElementById("ed6").value="";
			 document.getElementById("stkid6").value="";
			 document.getElementById("dsc6").value="";
			 
			 
			 document.getElementById("qty7").value="";
			// document.getElementById("foc7").value="";
			 document.getElementById("stkqty7").value="";
			 document.getElementById("bt7").value="";
			 document.getElementById("ed7").value="";
			 document.getElementById("stkid7").value="";
			 document.getElementById("dsc7").value="";
			 
			 
			 document.getElementById("qty8").value="";
			// document.getElementById("foc8").value="";
			 document.getElementById("stkqty8").value="";
			 document.getElementById("bt8").value="";
			 document.getElementById("ed8").value="";
			 document.getElementById("stkid8").value="";
			 document.getElementById("dsc8").value="";
			 
			 
			 
			 document.getElementById("qty9").value="";
			// document.getElementById("foc9").value="";
			 document.getElementById("stkqty9").value="";
			 document.getElementById("bt9").value="";
			 document.getElementById("ed9").value="";
			 document.getElementById("stkid9").value="";
			 document.getElementById("dsc9").value="";
			 
			 
			 document.getElementById("qty10").value="";
			// document.getElementById("foc10").value="";
			 document.getElementById("stkqty10").value="";
			 document.getElementById("bt10").value="";
			 document.getElementById("ed10").value="";
			 document.getElementById("stkid10").value="";
			 document.getElementById("dsc10").value="";
			// document.getElementById("collqty").value="";
			 
			
		}
	 
	 function chkstocksval(value,tf)
		{
			if(parseFloat(value)>0)
				{
				  var id5="qty"+tf;
	       	 //  var id6="foc"+tf;
	       	 
	       	   var id7="stkqty"+tf;
				var qty=0;
				var foc=0;
	       	if(parseFloat(document.getElementById(""+id5).value)>0)
			   {
	       		qty=document.getElementById(""+id5).value;
			   }
	       	
	     /* 	if(parseFloat(document.getElementById(""+id6).value)>0)
			   {
	     		foc=document.getElementById(""+id6).value;
			   } */
				
	     	
	     	if(parseFloat(document.getElementById(""+id7).value)<(parseFloat(qty)))
	     		{
	     		// document.getElementById("errormsg").innerText="Quantity Plus Foc  should not be greater than available stock quantity";
	     		document.getElementById(""+id5).value=0;
	     		//document.getElementById(""+id6).value=0;
	     		document.getElementById(""+id5).focus();
	     		return 0;
	     		}
	     	else
	     		{
	     		//document.getElementById("errormsg").innerText="";
	     		}
	       	
	       	
	       	
				
				}
			
			
		}
	 
	 function closes()
		{
			 
			   $('#prdetails').find('input[type=text]').each(function(){
				     
				      $(this).val("");
				       });
			   
			   
			 $('#divname').hide();
			
		}
	
	 
	 function  chkfocss()
	 
	 {
    
  var ss=0;
  var totqty=0;
  var totfoc=0;
  var stkqty=0;
  var stkid="";
  
  
  var temp="";
  var rows = $('#batgrid').jqxGrid('getrows');
	  
    for(var i=0 ; i < rows.length ; i++){
 	   
 	   
 	     	   ss=ss+1;
        var aa=0; 
        var bb=0;
 	   
 	   var id5="qty"+ss;
 	  // var id6="foc"+ss;
 	   var id7="bt"+ss;
 	   var id8="ed"+ss;
 	   var id9="stkid"+ss;
 	   
 	   if(parseFloat(document.getElementById(""+id5).value)>0)
 		   {
 		   totqty=parseFloat(totqty)+parseFloat(document.getElementById(""+id5).value);
 		   
 		   
 		   aa=document.getElementById(""+id5).value;
 		   }
 	   
 	  /*  if(parseFloat(document.getElementById(""+id6).value)>0)
		   {
 		   totfoc=parseFloat(totfoc)+parseFloat(document.getElementById(""+id6).value);
 		   bb=parseFloat(document.getElementById(""+id6).value);
		   } */
 	   
 	   
 	   if(parseFloat(document.getElementById(""+id5).value)>0 )
 		   {
 		   temp=temp+document.getElementById(""+id7).value+" @@ "+aa+" @@ "+bb+" @@ "+document.getElementById(""+id8).value+" @@@ ";
 		   }
		   if(!document.getElementById(""+id7).value=="")
		   {
			   stkid=stkid+document.getElementById(""+id7).value+" @@ "+document.getElementById(""+id5).value+" @@@ ";
			   
		   }
 	   
 	  
       }
    
   
 //   alert("batchnnnnnnnnno======"+stkid);
    
    if(document.getElementById("focvalidate").value==1)
		{
		checkfocqty(totfoc,totqty,temp,stkid);
		}
	else
		{
		  var rowid=document.getElementById("hidrow").value;
		  
			   $('#jqxthirdGrid').jqxGrid('setcellvalue', rowid, "toberesqty",totqty);
		       $('#jqxthirdGrid').jqxGrid('setcellvalue', rowid, "stockid",stkid);
		       $('#jqxthirdGrid').jqxGrid('setcellvalue', rowid, "collqty",temp);
		  
	      
        $('#divname').hide();
       // calculatedata();
     
		}
    
		 
	 }
	 
	 function checkfocqty(temp3,temp2,collqty)
		{
			
	   
			 var psrno=document.getElementById("temppsrno").value; 
			 var unit=document.getElementById("unit").value;
	    		
			   var x=new XMLHttpRequest();
			   x.onreadystatechange=function(){
			   if (x.readyState==4 && x.status==200)
			    {
			      var items= x.responseText.trim();
			    	  if(temp3>items)
			    		  {
			    	  
			    		  document.getElementById("errormsg").innerText=" Allowed Foc :  "+items;
			        		 return 0;
			    	     }
			    	  else
			    		  {
			    		  document.getElementById("collqty").value=collqty;
				           document.getElementById("quantity").value=temp2;
				           document.getElementById("stockid").value=stkid;
				          // document.getElementById("focs").value=temp3;
				           $('#divname').hide();
				           calculatedata();
			    		  }
			    	  }
			     
			       } 
			   x.open("GET","checkfocqty.jsp?qty="+temp2+"&psrno="+psrno+"&unit="+unit,true);
				x.send();
			 
			
			
		}
		
		
		function checkfocqtyss(temp2,psrno,unit,rs)
		{
			   var x=new XMLHttpRequest();
			   x.onreadystatechange=function(){
			   if (x.readyState==4 && x.status==200)
			    {
			      var items= x.responseText.trim();
			    
			      $('#serviecGrid').jqxGrid('setcellvalue',rs,"foc",items);
			        		  
			    	      
			    	  }
			     
			       } 
			   x.open("GET","checkfocqty.jsp?qty="+temp2+"&psrno="+psrno+"&unit="+unit,true);
				x.send();
			 
			
			
		}
		
		
		
		
		
		function checkfocqtys(temp2)
		{
			
	   
			 var psrno=document.getElementById("temppsrno").value; 
			 var unit=document.getElementById("unit").value;
	    		
			   var x=new XMLHttpRequest();
			   x.onreadystatechange=function(){
			   if (x.readyState==4 && x.status==200)
			    {
			      var items= x.responseText.trim();
			    	 if(parseFloat(items)>0)
			    		 {
			    		 document.getElementById("focs").value=parseInt(items);
			    		 document.getElementById("focs").focus();
			    		  var input = document.getElementById("focs");
			    		  input.focus();
			              input.setSelectionRange(0,0);
			    		 }
			    	 else
			    		 {
			    		 document.getElementById("focs").value="";
			    		 document.getElementById("focs").focus();
			    		 var input = document.getElementById("focs");
			    		  input.focus();
			              input.setSelectionRange(0,0);
			    		 }
			    		 
			        		  
			    	      
			    	  }
			     
			       } 
			   x.open("GET","checkfocqty.jsp?qty="+temp2+"&psrno="+psrno+"&unit="+unit,true);
				x.send();
			 
			
			
		}
  </script>   
</body>    
</html>
