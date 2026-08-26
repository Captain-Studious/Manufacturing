<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%  String contextPath=request.getContextPath();%>
<!DOCTYPE html>   
<html lang="en">
<head>
<title>Product Planing</title>                                                 
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
   vertical-align: middle; 
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
.status {
	color: #FD8725;
	font-family: comic sans ms;
	font-size: 15px;
	font-weight: bold;
}

#lblclientstatus {
  -moz-animation-duration: 1s;
  -moz-animation-name: blink;
  -moz-animation-iteration-count: infinite;
  -moz-animation-direction: alternate;
  
  -webkit-animation-duration: 1s;
  -webkit-animation-name: blink;
  -webkit-animation-iteration-count: infinite;
  -webkit-animation-direction: alternate;
  
  animation-duration: 1s;
  animation-name: blink;
  animation-iteration-count: infinite;
  animation-direction: alternate;
}
#divname {
     
    background-color: #e2c791;
    box-shadow: 10px 10px grey;
     position:fixed;z-index:1000;right:30px;top:100px;  
}

  </style>
</head>       
<body onload="getBranch();getLocation();">
<div class='hidden-scrollbar'>                                   
  <div class="container-fluid" >
    <div class="row" >
      <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
      <div class="primarypanel custompanel" style="margin-left:5px;">  
             <div id="border1">           
	  			<button type="button" class="btn btn-default btnStyle" id="btnsubmit"  data-toggle="tooltip" title="Submit" data-placement="bottom"><i class="fa fa-refresh iconStyle" aria-hidden="true"></i></button>    
	          	<!-- <button type="button" class="btn btn-default btnStyle" id="btnexcel" data-toggle="tooltip" title="Excel Export" data-placement="bottom"><i class="fa fa-file-excel-o " aria-hidden="true"></i></button> -->    
            </div>                                    
	  	 </div>
	  	 <div class="primarypanel custompanel" style="margin-left:5px;">  
             <div id="border1">           
	  			<!-- <button type="button" class="btn btn-default btnStyle" id="btnprocess"  data-tooltip="tooltip" title="View BoM" data-placement="bottom"><i class="fa fa-vine " aria-hidden="true"></i></button> -->
	        	 <button type="button" class="btn btn-default btnStyle" id="btnstartmarking"  data-tooltip="tooltip" title="Filling Start Marking" data-toggle="modal" data-target="#modalstartmarkupdate" data-placement="bottom"><i class="fa fa-calendar-check-o" aria-hidden="true"></i></button>
                <button type="button" class="btn btn-default btnStyle" id="btnendmarking"  data-tooltip="tooltip" title="Filling End Marking" data-toggle="modal" data-target="#modalendmarkupdate" data-placement="bottom"><i class="fa fa-calendar-minus-o" aria-hidden="true"></i></button>
	        	
	        <!-- 	<button type="button" class="btn btn-default btnStyle" id="btnconfirm"  data-tooltip="tooltip" title="Create Batch" data-toggle="modal" data-target="#modalbatchcreation" data-placement="bottom"><i class="fa fa-plus" aria-hidden="true"></i></button>
	             <button type="button" class="btn btn-default btnStyle" id="btnpreproductiontest"  data-tooltip="tooltip" title="Pre Production Test" data-toggle="modal" data-target="#modalpreproductiontest" data-placement="bottom"><i class="fa fa-check-circle" aria-hidden="true"></i></button>
	            <button type="button" class="btn btn-default btnStyle" id="btnmaterialrequest"  data-tooltip="tooltip" title="Material Request" data-toggle="modal" data-target="#modalmaterialrequest" data-placement="bottom"><i class="fa fa-credit-card-alt" aria-hidden="true"></i></button> -->
	            <button type="button" class="btn btn-default btnStyle" id="btngoodsissuenote"  data-tooltip="tooltip" title="Production Update" data-toggle="modal" data-target="#modalgoodsissuenote" data-placement="bottom"><i class="fa fa-pencil-square-o" aria-hidden="true"></i></button>
	            
	             <button type="button" class="btn btn-default btnStyle" id="btnqualityassuarance"  data-tooltip="tooltip" title="Quality Assuarance" data-toggle="modal" data-target="#modalqualityassuarance" data-placement="bottom"><i class="fa fa-thumbs-up" aria-hidden="true"></i></button>
                 <!-- <button type="button" class="btn btn-default btnStyle" id="btnproductioncomplete"  data-tooltip="tooltip" title="Filling Completion" data-toggle="modal" data-target="#modalproductioncompletion" data-placement="bottom"><i class="fa fa-life-ring" aria-hidden="true"></i></button>
	           <button type="button" class="btn btn-default btnStyle" id="btntaskmanagement"  data-tooltip="tooltip" title="Update Process" data-placement="bottom"><i class="fa fa-pencil" aria-hidden="true"></i></button> -->
	            
	            
                              
                          </div>                                    
	  	 </div>    
	  	 <div class="primarypanel custompanel" style="margin-left:5px;">  
             <div id="border1">           
	  			 <button type="button" class="btn btn-default btnStyle" id="btnattachs" data-toggle="modal" data-target="#modalattach" ><i class="fa fa-download" aria-hidden="true" data-toggle="tooltip" title="Attach" data-placement="bottom"></i></button>
	            <button type="button" class="btn btn-default btnStyle" id="btncomment"  data-toggle="modal"  data-tooltip="tooltip" title="Comments" data-placement="bottom"><i class="fa fa-comments" aria-hidden="true"></i></button>
	            <button type="button" class="btn btn-default btnStyle" id="btnsalesman"  data-toggle="modal" data-target="#modalsalesman" data-tooltip="tooltip" title="Date Statistics" data-placement="bottom"><i class="fa fa-bar-chart" aria-hidden="true"></i></button>
	            <button type="button" class="btn btn-default btnStyle" id="btnclient"  data-toggle="modal" data-target="#modalclient" data-tooltip="tooltip" title="Client Statistics" data-placement="bottom"><i class="fa fa-bar-chart" aria-hidden="true"></i></button>
	            <button type="button" class="btn btn-default btnStyle" id="btnwork"  data-toggle="modal" data-target="#modalworkorderlog" data-tooltip="tooltip" title="Work Order Log" data-placement="bottom"><i class="fa fa-building" aria-hidden="true"></i></button>
          </div>                                    
	  	 </div>
         <!--  <div class="col-xs-12 col-sm-12 col-md-12 col-lg-3" style="padding-top:0;margin-top:0;padding-bottom:0;margin-bottom:0;">                      
			<p  style="font-size:75%;margin:0px;padding-top:15px;padding-left:6px;">&nbsp;</p>
        </div>  -->   
         <h6 class="modal-title" style="text-align:left"><label class="status" id="lblclientstatushead" name="lblclientstatushead"></label></h6>    
      </div>      
    </div>         
    <div class="row"  style="padding-top:5px;">      
      <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">          
        <div id="productdiv" class="borderStyle"><jsp:include page="productGrid.jsp"></jsp:include></div>                     
      </div>
    </div>
    <div class="row"  style="padding-top:5px;">          
      <div class="col-xs-12 col-sm-12 col-md-12 col-lg-4">          
        <div id="subdiv" class="borderStyle"><jsp:include page="subGrid.jsp"></jsp:include></div>                     
      </div>
      <div class="col-xs-12 col-sm-12 col-md-12 col-lg-4">          
        <div id="bomdiv" class="borderStyle"><jsp:include page="bomGrid.jsp"></jsp:include></div>                     
      </div>
      <div class="col-xs-12 col-sm-12 col-md-12 col-lg-4">          
        <div id="processdiv" class="borderStyle"><jsp:include page="processGrid.jsp"></jsp:include></div>                     
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
    
    <div id="modalstartmarkupdate" class="modal fade" role="dialog">  
      <div class="modal-dialog">
        <div class="modal-content">
          <div class="modal-header" style="background-color:#CDFDFA">
            <button type="button" class="close" data-dismiss="modal">&times;</button>
            <h4 class="modal-title" style="text-align:center">Filling Start Marking</h4> 
            <h6 class="modal-title" style="text-align:center"><label class="status" id="lblclientstatus1" name="lblclientstatus1"></label></h6>     
          </div>
          <div class="modal-body">
          <table width="100%" >
         
          <tr>
          <td align="right"><label class="branch">Start Time</label></td>
           <td align="left"><div id="startdate" style="width:17%;" name="startdate" value='<s:property value="startdate"/>'></div></td>
          </tr>
          </table>
          </div>
          <div class="modal-footer" style="background-color:#CDFDFA">
          <button type="button" id="btnstartsave" class="btn btn-default" data-dismiss="modal" style="background-color:red;color:yellow">Save</button>
            <button type="button" class="btn btn-default" data-dismiss="modal" style="background-color:red;color:yellow">Close</button>
          </div>  
        </div>  
      </div>
    </div>
      
       <div id="modalendmarkupdate" class="modal fade" role="dialog">  
      <div class="modal-dialog">
        <div class="modal-content">
          <div class="modal-header" style="background-color:#CDFDFA">
            <button type="button" class="close" data-dismiss="modal">&times;</button>
            <h4 class="modal-title" style="text-align:center">Filling End Marking</h4>  
            <h6 class="modal-title" style="text-align:center"><label class="status" id="lblclientstatus2" name="lblclientstatus2"></label></h6>    
          </div>
          <div class="modal-body">
          <table width="100%" >
         
          <tr>
          <td align="right"><label class="branch">End Time</label></td>
           <td align="left"><div id="enddate" style="width:17%;" name="enddate" value='<s:property value="enddate"/>'></div></td>
          </tr>
          </table>
          </div>
          <div class="modal-footer" style="background-color:#CDFDFA">
          <button type="button" id="btnendsave" class="btn btn-default" data-dismiss="modal" style="background-color:red;color:yellow">Save</button>
            <button type="button" class="btn btn-default" data-dismiss="modal" style="background-color:red;color:yellow">Close</button>
          </div>  
        </div>  
      </div>
    </div>
      
    <div id="modalbatchcreation" class="modal fade" role="dialog">  
      <div class="modal-dialog">
        <div class="modal-content">
          <div class="modal-header" style="background-color:#CDFDFA">
            <button type="button" class="close" data-dismiss="modal">&times;</button>
            <h4 class="modal-title" style="text-align:center">Batch Creation</h4> 
            <h6 class="modal-title" style="text-align:center"><label class="status" id="lblclientstatus3" name="lblclientstatus3"></label></h6>     
          </div>
          <div class="modal-body">
          <table width="100%" >
         
          <tr>
          <td align="right"><label class="branch">Batch Date</label></td>
           <td align="left"><div id="batchdate" style="width:17%;" name="batchdate" value='<s:property value="batchdate"/>'></div></td>
          <td align="right"><label class="branch">Batch No</label></td>
           <td align="left"><input type="text" id="batchno" name="batchno" style="width:80%;" onkeypress="javascript:return isNumber(event);" /></td>
          
          </tr>
          <tr>
          <td align="right"><label class="branch">Time</label></td>
           <td align="left"><div id="batchtime" style="width:17%;" name="batchtime" value='<s:property value="batchtime"/>'></div></td>
          <td align="right"><label class="branch">Qty</label></td>
           <td align="left"><input type="text" id="batchqty" name="batchqty" style="width:80%;" onblur="funRoundAmt(this.value,this.id);" onkeypress="javascript:return isNumber (event);" /></td>
          
          </tr>
          </table>
          </div>
          <div class="modal-footer" style="background-color:#CDFDFA">
          <button type="button" id="btnbatchsave" class="btn btn-default" data-dismiss="modal" style="background-color:red;color:yellow">Save</button>
            <button type="button" class="btn btn-default" data-dismiss="modal" style="background-color:red;color:yellow">Close</button>
          </div>  
        </div>  
      </div>
    </div> 
    
    <div id="modalpreproductiontest" class="modal fade" role="dialog">  
      <div class="modal-dialog">
        <div class="modal-content">
          <div class="modal-header" style="background-color:#CDFDFA">
            <button type="button" id="upclosepreprodtest" class="close" data-dismiss="modal">&times;</button>
            <h4 class="modal-title" style="text-align:center">Pre Production Test</h4>
            <h6 class="modal-title" style="text-align:center"><label class="status" id="lblclientstatus4" name="lblclientstatus4"></label></h6>      
          </div>
          <div class="modal-body">
          <button type="button" id="btnpreprodload" class="btn btn-default" style="background-color:green ;color:yellow;">Load</button>
          <div id="preproddiv"><jsp:include page="preProductionGrid.jsp"></jsp:include></div>
          </div>
          <div class="modal-footer" style="background-color:#CDFDFA">
            <button type="button" id="btnpreprodsave" class="btn btn-default" data-dismiss="modal" style="background-color:red;color:yellow">Create Blending Sheet</button>
            <button type="button" id="downclosepreprodtest" class="btn btn-default" data-dismiss="modal" style="background-color:red;color:yellow">Close</button>
          </div>  
        </div>  
      </div>
    </div>  
      
      <div id="modalmaterialrequest" class="modal fade" role="dialog">  
      <div class="modal-dialog">
        <div class="modal-content">
          <div class="modal-header" style="background-color:#CDFDFA">
            <button type="button" id="upmaterialrequest" class="close" data-dismiss="modal">&times;</button>
            <h4 class="modal-title" style="text-align:center">Material Request</h4> 
            <h6 class="modal-title" style="text-align:center"><label class="status" id="lblclientstatus5" name="lblclientstatus5"></label></h6>     
          </div>
          <div class="modal-body">
          <button type="button" id="btnmaterialreqload" class="btn btn-default" style="background-color:green ;color:yellow;">Load</button>
          <div id="materialreqdiv"><jsp:include page="materialRequestGrid.jsp"></jsp:include></div>
          </div>
          <div class="modal-footer" style="background-color:#CDFDFA">
            <button type="button" id="btnmaterialreqsave" class="btn btn-default" data-dismiss="modal" style="background-color:red;color:yellow">Create Material Request</button>
            <button type="button" id="downmaterialrequest" class="btn btn-default" data-dismiss="modal" style="background-color:red;color:yellow">Close</button>
          </div>  
        </div>  
      </div>
    </div>  
      
      <div id="modalgoodsissuenote" class="modal fade" role="dialog">  
      <div class="modal-dialog modal-xl" >
        <div class="modal-content">
          <div class="modal-header" style="background-color:#CDFDFA">
            <button type="button" id="upmaterialissue" class="close" data-dismiss="modal">&times;</button>
            <h4 class="modal-title" style="text-align:center">Production Update</h4>
           <h6 class="modal-title" style="text-align:center"><label class="status" id="lblclientstatus6" name="lblclientstatus6"></label></h6>
                     
          </div>
          <div class="modal-body">
           <table width="100% "  >
           <tr>
           <td><button type="button" id="btnGISload" class="btn btn-default" style="background-color:green ;color:yellow;">Load</button></td>
          <td align="left"  width="80%" hidden="true"><label class="branch">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Filling Quantity</label><input type="text" id="fillqty" name="fillqty" style="width:50%;" onchange="funfillqty();" onblur="funRoundAmt(this.value,this.id);" onkeypress="javascript:return isNumber (event);" /></td>
          <td><input type="button" id="loads" class="myButtons" value="Load Data" onclick="loaddatass()"> </td> 
           </tr>
           
          
           <tr>
            <td colspan="3"> <div id="gisdiv"><jsp:include page="goodsIssueGrid.jsp"></jsp:include></div></td>
           </tr>
            <tr>
          <td colspan="3"><fieldset>
          <h4>Production Details</h4>
          <table width="100%" >
          <tr>
          
           <td align="left"  width="20%"><label class="branch">Generated Product</label><input type="text" id="genproduct" name="genproduct" style="width:96%;" /></td>
          
           <td align="left" width="5%"><label class="branch">Quantity</label><input type="text" id="genqty" name="genqty" style="width:96%;" onblur="funRoundAmt(this.value,this.id);" onkeypress="javascript:return isNumber (event);"/></td>
            
           <td align="left"  width="5%" ><label class="branch">Uom</label><input type="text" id="genuom" name="genuom"  style="width:96%;"/></td>
           <td align="left"  width="5%" ><label class="branch">Description</label><input type="text" id="txtdesc" name="txtdesc"  style="width:96%;"/></td>
          <td align="left"  width="5%" ><label class="branch">Batch No</label><input type="text" id="txtbatch" name="txtbatch"  style="width:96%;"/></td>
          </tr>
          <tr>
          
           <td align="left" width="20%"><label class="branch">Std Production Cost</label><input type="text" id="stdprodcost" style="width:96%;" name="stdprodcost" onblur="funRoundAmt(this.value,this.id);" onkeypress="javascript:return isNumber (event);"  text-align: right;" /></td>
           
           <td align="left" width="5%"><label class="branch">Lumpsum</label>
           <input type="checkbox" id="lmpsm" style="width:96%;" name="lmpsm" onclick="$(this).attr('value', this.checked ? 1 : 0)" />
           </td>
          <td width="10%" align="left"><label class="branch">Branch</label><select id="cmbbranch" onclick="getLocation();" name="cmbbranch" style="width:96%;"  value='<s:property value="cmbbranch"/>' > <option value="">--Select--</option></select></div><input type="hidden" id="hidcmbbranch" name="hidcmbbranch" value='<s:property value="hidcmbbranch"/>'/></td>
		
	 <td align="left" width="10%"><label class="branch">Location</label><select id="txtlocation" name="txtlocation" style="width:96%;"  value='<s:property value="txtlocation"/>' > <option value="">--Select--</option></select></div><input type="hidden" id="txtlocationid" name="txtlocationid" value='<s:property value="txtlocationid"/>'/></td> 
  
          </tr>
          
         
          </table>
          </fieldset></td>
         
          
          </tr>
           </table>
           <table width="100%" >
            <tr>
           <td >
            <div id="divname" hidden="true">
   <table width="100%" id="prdetails"> 
   
   <tr style="height: 25px" bgcolor="#e5ab69">  
   <td align="center"> <font color="#fff"><b>Quantity</b></font></td> <td  align="center"><font color="#fff"><b>Stock Qty</b></font></td>  <td  align="center"><font color="#fff"><b>Batch No</b></font></td><td  align="center"><font color="#fff"><b>Expiry Date</b></font></td><td  align="center" hidden="true"></td> </tr>
     <tr  class="trhideclass1">
   <td > <input type="text" id="qty1" onchange="chkstocksval(this.value,1)" ></td>     <td><input type="text"  tabindex="-1"id="stkqty1"></td> <td><input type="text" tabindex="-1"  id="bt1"></td><td><input type="text" tabindex="-1"  id="ed1"></td><td><input type="hidden" id="stkid1"></td> </tr>
       <tr class="trhideclass2">
   <td>  <input type="text" id="qty2" onchange="chkstocksval(this.value,2)"></td>    <td><input type="text"  tabindex="-1"id="stkqty2"></td>   <td><input type="text" tabindex="-1"  id="bt2"></td><td><input type="text" tabindex="-1"  id="ed2"></td>  <td><input type="hidden" id="stkid2"></td> </tr>
         <tr class="trhideclass3">
   <td>  <input type="text" id="qty3" onchange="chkstocksval(this.value,3)"></td>    <td><input type="text" tabindex="-1"id="stkqty3"></td>    <td><input type="text" tabindex="-1"  id="bt3"></td><td><input type="text" tabindex="-1"  id="ed3"></td>  <td><input type="hidden" id="stkid3"></td> </tr>
      <tr class="trhideclass4">
   <td>  <input type="text" id="qty4" onchange="chkstocksval(this.value,4)"></td>    <td><input type="text" tabindex="-1"  id="stkqty4"></td>   <td><input type="text" tabindex="-1"  id="bt4"></td><td><input type="text" tabindex="-1"  id="ed4"></td>  <td><input type="hidden" id="stkid4"></td> </tr>
     <tr class="trhideclass5">
   <td>  <input type="text" id="qty5" onchange="chkstocksval(this.value,5)"></td>   <td><input type="text" tabindex="-1" id="stkqty5"></td>   <td><input type="text" tabindex="-1"  id="bt5"></td><td><input type="text" tabindex="-1"   id="ed5"></td>   <td><input type="hidden" id="stkid5"></td> </tr>
       <tr class="trhideclass6">
   <td>  <input type="text" id="qty6" onchange="chkstocksval(this.value,6)"></td>     <td><input type="text" tabindex="-1" id="stkqty6"></td>  <td><input type="text" tabindex="-1"  id="bt6"></td><td><input type="text" tabindex="-1"  id="ed6"></td>  <td><input type="hidden" id="stkid6"></td> </tr>
      <tr class="trhideclass7">
   <td>  <input type="text" id="qty7" onchange="chkstocksval(this.value,7)"></td>     <td><input type="text" tabindex="-1" id="stkqty7"></td>  <td><input type="text" tabindex="-1"  id="bt7"></td><td><input type="text" tabindex="-1"  id="ed7"></td><td><input type="hidden" id="stkid7"></td> </tr>
      <tr class="trhideclass8">
   <td>  <input type="text" id="qty8" onchange="chkstocksval(this.value,8)"></td>     <td><input type="text" tabindex="-1" id="stkqty8"></td>   <td><input type="text" tabindex="-1"  id="bt8"></td><td><input type="text" tabindex="-1"  id="ed8"></td><td><input type="hidden" id="stkid8"></td> </tr>   <tr>
  <tr class="trhideclass9">
   <td>  <input type="text" id="qty9" onchange="chkstocksval(this.value,9)"></td>     <td><input type="text" tabindex="-1" id="stkqty9"></td> <td><input type="text"  tabindex="-1"  id="bt9"></td><td><input type="text" tabindex="-1"  id="ed9"></td>  <td><input type="hidden" id="stkid9"></td> </tr>
      <tr class="trhideclass10">
   <td>  <input type="text" id="qty10" onchange="chkstocksval(this.value,10)"></td>    <td><input type="text" tabindex="-1" id="stkqty10"></td>   <td><input type="text" tabindex="-1"  id="bt10"></td><td><input type="text" tabindex="-1"  id="ed10"> </td><td><input type="hidden" id="stkid10"></td> </tr>
  
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
          <div class="modal-footer" style="background-color:#CDFDFA">
            <button type="button" id="btnProdUpdate" class="btn btn-default" data-dismiss="modal" style="background-color:red;color:yellow">Update</button>
            <button type="button" id="downmaterialissue" class="btn btn-default" data-dismiss="modal" style="background-color:red;color:yellow">Close</button>
          </div>  
        </div>  
      </div>
    </div> 
    
       <div id="modalqualityassuarance" class="modal fade" role="dialog">  
      <div class="modal-dialog modal-xl">
        <div class="modal-content">
          <div class="modal-header" style="background-color:#CDFDFA">
            <button type="button" id="upqualityassurance" class="close" data-dismiss="modal">&times;</button>
            <h4 class="modal-title" style="text-align:center">Quality Assuarance</h4> 
            <h6 class="modal-title" style="text-align:center"><label class="status" id="lblclientstatus7" name="lblclientstatus7"></label></h6>     
          </div>
          <div class="modal-body">
           <table width="100%">
           <tr>
           <td  width="20%"><button type="button" id="btnload" class="btn btn-default" style="background-color:green ;color:yellow;">Load</button></td>
            <td align="right" width="40%"><label class="branch">Final</label></td>
           <td align="left" width="40%">
           <input type="checkbox" id="qaid" name="qaid" onclick="$(this).attr('value', this.checked ? 1 : 0)" />
           </td>
           </tr>
           <tr>
           <td colspan="3">
           <div id="qadiv" style="width:100%;"><jsp:include page="qualityAssuaranceGrid.jsp"></jsp:include></div>
           <div id="qasubdiv"  style="width:100%;"><jsp:include page="qualitysubGrid.jsp"></jsp:include></div>
           </td>
           </tr>
           </table>
          
          </div>
          <div class="modal-footer" style="background-color:#CDFDFA">
            <button type="button" id="btnqasave" class="btn btn-default" data-dismiss="modal" style="background-color:red;color:yellow">Save</button>
            <button type="button" id="downqualityassurance" class="btn btn-default" data-dismiss="modal" style="background-color:red;color:yellow">Close</button>
          </div>  
        </div>  
      </div>
    </div>  
      
   <div id="modalproductioncompletion" class="modal fade" role="dialog">  
      <div class="modal-dialog">
        <div class="modal-content">
          <div class="modal-header" style="background-color:#CDFDFA">
            <button type="button" id="upproduction" class="close" data-dismiss="modal">&times;</button>
            <h4 class="modal-title" style="text-align:center">Filling Completion</h4>   
            <h6 class="modal-title" style="text-align:center"><label class="status" id="lblclientstatus8" name="lblclientstatus8"></label></h6>   
          </div>
          <div class="modal-body">
          <table width="100%">
         <tr>
          <td  width="20%"><button type="button" id="btnlstgridload" class="btn btn-default" style="background-color:green ;color:yellow;">Load</button></td>
         
         </tr>
          <tr>
         
          <td colspan="2"> <div id="productiondiv"><jsp:include page="productionCompleteGrid.jsp"></jsp:include></div></td>
          
          </tr>
          <!-- <tr><td  width="20%"><button type="button" id="btnCreateMIN" class="btn btn-default" style="background-color:blue ;color:yellow;">Create Material Issue Note </button></td></tr> -->
         
          </table>
          
          </div>
          <div class="modal-footer" style="background-color:#CDFDFA">
          <button type="button" id="btncompletionsave" class="btn btn-default" data-dismiss="modal" style="background-color:red;color:yellow">Save</button>
            <button type="button" id="downproduction" class="btn btn-default" data-dismiss="modal" style="background-color:red;color:yellow">Close</button>
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
    <div id="modalworkorderlog" class="modal fade" role="dialog">  
      <div class="modal-dialog">
        <div class="modal-content">
          <div class="modal-header" style="background-color:#CDFDFA">
            <button type="button" class="close" data-dismiss="modal">&times;</button>
            <h4 class="modal-title" style="text-align:center">Workorder Log</h4>  
            <h6 class="modal-title" style="text-align:center"><label class="status" id="lblclientstatus9" name="lblclientstatus9"></label></h6>  
          </div>
          <div class="modal-body">
          <div id="wrkdiv"><jsp:include page="workOrderLogGrid.jsp"></jsp:include></div>
          </div>
          <div class="modal-footer" style="background-color:#CDFDFA">
            <button type="button" class="btn btn-default" data-dismiss="modal" style="background-color:red">Close</button>
          </div>  
        </div>  
      </div>
    </div>
   </div>
    <!-- Client Details Modal-->
   <div>    <input type="hidden" name="hidbrhid" id="hidbrhid">  
       <input type="hidden" name="hidvocno" id="hidvocno">
       <input type="hidden" name="hidpsrno" id="hidpsrno"> 
       <input type="hidden" name="hidworkno" id="hidworkno">
       <input type="hidden" name="hidblendsheetno" id="hidblendsheetno">
       <input type="hidden" name="hidmaterialrequestno" id="hidmaterialrequestno">
       <input type="hidden" name="hidgisno" id="hidgisno">  
       <input type="hidden" name="hidqualityno" id="hidqualityno">
       <input type="hidden" name="hidgenproduct" id="hidgenproduct">
        <input type="hidden" name="hidgenqty" id="hidgenqty">
         <input type="hidden" name="hidgenuom" id="hidgenuom">
          <input type="hidden" name="hidbatchno" id="hidbatchno">
           <input type="hidden" name="hidgenuomid" id="hidgenuomid">
           <input type="hidden" name="hidgenspecid" id="hidgenspecid">
            <input type="hidden" name="hidbomdoc" id="hidbomdoc">
             <input type="hidden" name="focvalidate" id="focvalidate">
              <input type="hidden" name="hidrow" id="hidrow">
              <input type="hidden" name="hidgispsrno" id="hidgispsrno">
              <input type="hidden" name="hidgisunit" id="hidgisunit">
               <input type="hidden" name="hidcomptrno" id="hidcomptrno">
               <input type="hidden" name="hidcomments" id="hidcomments">
                <input type="hidden" name="hidordertype" id="hidordertype">
                <input type="hidden" name="hidsorddoc" id="hidsorddoc">
                 <input type="hidden" name="hiddescptn" id="hiddescptn">
            </div>
</div>		
  <!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script> -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@7.24.4/dist/sweetalert2.all.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.6-rc.0/js/select2.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/js-cookie@2/src/js.cookie.min.js"></script>
<script type="text/javascript">   
    $(document).ready(function(){ 
    	$('#qadiv').show();
    	$('#qasubdiv').hide();
    $('[data-tooltip="tooltip"]').tooltip();
    $("#batchdate").jqxDateTimeInput({ width: '85px', height: '15px', formatString:"dd.MM.yyyy"});
    $("#batchtime").jqxDateTimeInput({ width: '85px', height: '15px', formatString: 'HH:mm', showCalendarButton: false ,value: new Date()});
    $("#startdate").jqxDateTimeInput({ width: '85px', height: '15px', formatString: 'HH:mm', showCalendarButton: false ,value: new Date()});
    $("#enddate").jqxDateTimeInput({ width: '85px', height: '15px', formatString: 'HH:mm', showCalendarButton: false ,value: new Date()});
    	 $("body").prepend('<div id="overlay" class="ui-widget-overlay" style="z-index: 1; display: none;"></div>');
	     $("body").prepend("<div id='PleaseWait' style='display: none;position:absolute; z-index: 1;top:180px;right:550px;'><img src='../../../../icons/31load.gif'/></div>");
    	 $('[data-toggle="tooltip"]').tooltip(); 
    	 $('#btnattachs').click(function(){ 
           	funAttachs(event);      
           });
        $('#btnsubmit').click(function(){         
            //funload();  
            $("#jqxbomGrid").jqxGrid('clear');
            $("#jqxprocessGrid").jqxGrid('clear');
            $("#jqxpreProdGrid").jqxGrid('clear');
            $('#jqxsubGrid').jqxGrid('setcellvalue', 0, "pdesc","0");
            $('#jqxsubGrid').jqxGrid('setcellvalue', 1, "pdesc","0");
            $('#jqxsubGrid').jqxGrid('setcellvalue', 2, "pdesc","0");
            $('#jqxsubGrid').jqxGrid('setcellvalue', 3, "pdesc","0");
            $('#jqxsubGrid').jqxGrid('setcellvalue', 4, "pdesc","0");
            $('#jqxsubGrid').jqxGrid('setcellvalue', 5, "pdesc","0");
            $('#jqxsubGrid').jqxGrid('setcellvalue', 6, "pdesc","0");
			 $('#jqxsubGrid').jqxGrid('setcellvalue', 7, "pdesc","0");
            $('#jqxsubGrid').jqxGrid('setcellvalue', 8, "pdesc","0");
            $('#jqxsubGrid').jqxGrid('setcellvalue', 9, "pdesc","0");
        	 $('#productdiv').load("productGrid.jsp?id="+1);  
        	 $('#salmdiv').load('salesmanGrid.jsp?id='+1);   
             $('#crmdiv').load('clientGrid.jsp?id='+1); 
        });          
        $('#btnexcel').click(function(){         
	       /*  $("#ppdiv").excelexportjs({
				containerid: "ppdiv",   
				datatype: 'json',
				dataset: null,
				gridId: "jqxsapGrid",
				columns: getColumns("jqxsapGrid") ,   
				worksheetName:"Maintenance Review"       
			}); */   
        });
        $('#btnload').click(function(){        
      	  funSetqualityGrid(); 
      	
        });
        $('#btncommentsend').click(function(){
            
        	var txtcomment=$('#txtcomment').val();
        	var rows = $("#jqxpdpGrid").jqxGrid('getrows');

         	var workno=$('#hidworkno').val();
			if(workno==0){
				$("#overlay, #PleaseWait").hide();
				$.messager.alert('Warning','Select a document.');
				return false;
			}
//alert("selectedrows==="+selectedrows.length);
		
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
        $('#btncomment').click(function(){
          	 getComments();  
           	var rows = $("#jqxpdpGrid").jqxGrid('getrows');
           	var workno=$('#hidworkno').val();
   			

   			if(workno==0){
   				$("#overlay, #PleaseWait").hide();
   				$.messager.alert('Warning','Select a document.');
   				return false;
   			}
  
     	      	$('#modalcomments').modal('toggle');              
             });
        
        $('#btnstartsave').click(function(){        
   	      var mark="start";
   	           funMarking(mark);       
          
        });
        
        $('#btnendsave').click(function(){        
    	                    
        	var mark="end";
	           funMarking(mark); 
        
        });
        
        $('#btnbatchsave').click(function(){        
            
        	funbatchcreate();
        
        });
    
       $('#btnpreprodsave').click(function(){        
            
        	funpreproductiontest();
        
        });
     $('#btnpreprodload').click(function(){        
            
        	funpreprodload();
        
        });
     
     $('#btnmaterialreqload').click(function(){        
         
    	 funloadmaterial();
     
     });
     
 $('#btnmaterialreqsave').click(function(){        
         
    	 funmaterialreqsave();
     
     });
$('#btnGISload').click(function(){        
         
    	 funloadGIS();
     
     });
$('#btnProdUpdate').click(function(){        
    
	
	funGISsave();
});
$('#btnqasave').click(function(){        
    
	 funQualitySave();

});

$('#btnlstgridload').click(function(){        
    
	 funLoadCompleteGrid();

});

$('#btncompletionsave').click(function(){        
    
	 funCompletionSave();

});

$('#btnCreateMIN').click(function(){        
    
	 

});

$('#btnprocess').click(function(){        
    
	funbom();

});

$('#upclosepreprodtest').click(function(){        
    
	funclose();

});
$('#downclosepreprodtest').click(function(){        
    
	funclose();

});
$('#downmaterialrequest').click(function(){        
    
	funclose();

});
$('#upmaterialrequest').click(function(){        
    
	funclose();

});
$('#downmaterialissue').click(function(){        
    
	funclose();

});
$('#upmaterialissue').click(function(){        
    
	funclose();

});
$('#upqualityassurance').click(function(){        
    
	funclose();

});
$('#downqualityassurance').click(function(){        
    
	funclose();

});
$('#downproduction').click(function(){        
    
	funclose();

});
$('#upproduction').click(function(){        
    
	funclose();

});
       $('.warningpanel div button').click(function(){
        	var gridrows=$('#jqxsapGrid').jqxGrid('getrows');
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
        		$('#jqxsapGrid').jqxGrid('removefilter',$(this).attr('data-datafield'), true);
        	}
        });  
    });
   
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

   	var workno=$('#hidworkno').val();
		if(workno==0){
			$("#overlay, #PleaseWait").hide();
			//$.messager.alert('Warning','Select a document.');
			return false;
		}

		
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
			x.open("GET","saveComment.jsp?comment="+encodeURIComponent($('#hidcomments').val())+"&enqno="+workno,true);
			x.send();
		
    	
    }
    function getComments(){
    	var rows = $("#jqxpdpGrid").jqxGrid('getrows');
    	var workno=$('#hidworkno').val();
	

		if(workno==0){
			$("#overlay, #PleaseWait").hide();
			//$.messager.alert('Warning','Select a document.');
			return false;
		}
//alert("selectedrows==="+selectedrows.length);
	
	
		
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
			x.open("GET","getComments.jsp?enqno="+workno,true);
			x.send(); 
		
    	
    }
    
    function funclose(){
    	$("#jqxpreProdGrid").jqxGrid('clear');
    	$("#jqxmaterialGrid").jqxGrid('clear');
    	$("#jqxgisGrid").jqxGrid('clear');
    	$("#qaGrid").jqxGrid('clear');
    	$("#jqxproductionGrid").jqxGrid('clear');
    	document.getElementById("qaid").checked=false;
    	document.getElementById("genproduct").value="";
    	document.getElementById("genqty").value="";
    	document.getElementById("genuom").value="";
    	document.getElementById("stdprodcost").value="";
    	document.getElementById("lmpsm").checked=false;
    	document.getElementById("hidrow").value="";
    	document.getElementById("hidgispsrno").value="";
    	document.getElementById("hidgisunit").value="";
    	document.getElementById("fillqty").value="";
    }
    
    function funfillqty(){
    	var sorqty=$('#batchqty').val();
    	var fill=$('#fillqty').val();
    	/* if(parseFloat(fill)>parseFloat(sorqty)){
    		$.messager.alert('Warning','Filling Qty Exceeded SOR Qty.');
    		$('#fillqty').val("0");
    	} */
    }
    
    function funQualitySave(){
    	var rows="0";
    	var workno=$('#hidworkno').val();
    	
    	var temp=$('#qaid').val();
    	if(temp=="1"){
    		 rows = $("#qasubGrid").jqxGrid('getrows');
    	}
    	else{
    		 rows = $("#qaGrid").jqxGrid('getrows');
    	}
    

		if(workno==0){
			$("#overlay, #PleaseWait").hide();
			$.messager.alert('Warning','Select documents.');
			return false;
		}
		$.messager.confirm('Message', 'Do you want to create quality assuarance?', function(r){
			if(r==false)
			{
			return false; 
			}
			else
			{
			$("#overlay, #PleaseWait").show();
			//$("#jqxbomGrid").jqxGrid('clear');
			var i=0;var temptrno="";           
			var j=0;
			var tmpcount=rows.length;
			var blndArray=new Array();
			for (i = 0; i < rows.length; i++) {
            
            var chkval="0";
            if(temp=="1"){
            	chkval =rows[i].tstid ;
	       	}
	       	else{
	       		chkval =rows[i].prid ;
	       	}
            if(!(typeof(chkval)==="undefined" || chkval==null || chkval=="")){
                       
            	
            	 if(temp=="1"){
            		 blndArray.push(rows[i].tstid+" :: "+rows[i].desc1+" :: "+rows[i].testmethod+" :: "+rows[i].limit+" :: "+workno+" :: ");
     	       	}
     	       	else{
     	       	     blndArray.push(rows[i].prid+" :: "+rows[i].desc+" :: "+rows[i].testmethod+" :: "+rows[i].limit+" :: "+workno+" :: ");
     	       	}
            }
				
			}
			savequality(blndArray);
				//alert("productarray=="+prdtArray+"==size=="+prdtArray.length);
			}
			});
    }
    
    function funpreproductiontest(){
    	var workno=$('#hidworkno').val();
    	var rows = $("#jqxpreProdGrid").jqxGrid('getrows');
    	var blndno=$('#hidblendsheetno').val();
    	alert("blndno=="+blndno);
    	if(parseInt(blndno)>0){
    		$.messager.alert('Warning','Blending Sheet Already Created.');
    		return false;
    	}
		if(rows.length==0){
			$("#overlay, #PleaseWait").hide();
			$.messager.alert('Warning','Select documents.');
			return false;
		}
		$.messager.confirm('Message', 'Do you want to create blending sheet?', function(r){
			if(r==false)
			{
			return false; 
			}
			else
			{
			$("#overlay, #PleaseWait").show();
			$("#jqxbomGrid").jqxGrid('clear');
			var i=0;var temptrno="";           
			var j=0;
			var tmpcount=rows.length;
			var blndArray=new Array();
			for (i = 0; i < rows.length; i++) {
            
            var chkpsrno=rows[i].psrno;
            var blndqty=rows[i].worder;
           // alert("qty==="+blndqty);
            if(!(typeof(chkpsrno)==="undefined" || chkpsrno==null || chkpsrno=="")){
                       
            	blndArray.push(rows[i].psrno+" :: "+rows[i].uomid+" :: "+rows[i].qty+" :: "+workno+" :: ");
            }
				
			}
			saveblendingsheet(blndArray);
				//alert("productarray=="+prdtArray+"==size=="+prdtArray.length);
			}
			});
    }
    
    function  savequality(blndArray){
    	var workno=$('#hidworkno').val();
   	 var psrno=$('#hidpsrno').val();
   	var ordertype=$('#hidordertype').val();
   	 var x=new XMLHttpRequest();
  		x.onreadystatechange=function(){
  		if (x.readyState==4 && x.status==200){
  	     			
  				var items=x.responseText;
  				 var item = items.split('::');
  				 var method=item[0].trim();
  			      
  			      var aa=item[1].trim();
  				if(parseInt(method)>0)  
  				{	
  					$("#overlay, #PleaseWait").hide();
  				//	$('#hidblendsheetno').val(aa);
  				//	funloadbom();
  				$.messager.alert('Message', '  Quality Assuarance '+aa+' Successfully Created ');
  			    funclose();
  				
  				}
  				else
  				{
  					$("#overlay, #PleaseWait").hide();
  				$.messager.alert('Message', '  Not Created  ');
  				 funclose();
  				}
  				}
  		}
    x.open("GET","saveQuality.jsp?productarray="+blndArray+"&workno="+workno+"&psrno="+psrno+"&ordertype="+ordertype,true);			
  	x.send();
    
    }
    
    function saveblendingsheet(blndArray){
    	var workno=$('#hidworkno').val();
    	 var psrno=$('#hidpsrno').val();
    	 var blndno=$('#hidblendsheetno').val();
     	if(parseInt(blndno)>0){
     		$.messager.alert('Warning','Blending Sheet Already Created.');
     		return false;
     	}
    	 var x=new XMLHttpRequest();
   		x.onreadystatechange=function(){
   		if (x.readyState==4 && x.status==200){
   	     			
   				var items=x.responseText;
   				 var item = items.split('::');
   				 var method=item[0].trim();
   			      
   			      var aa=item[1].trim();
   				if(parseInt(method)>0)  
   				{	
   					$("#overlay, #PleaseWait").hide();
   					$('#hidblendsheetno').val(aa);
   					funloadbom();
   				$.messager.alert('Message', '  Blending Sheet '+aa+' Successfully Created ');
   			 funclose();
   				
   				}
   				else
   				{
   					$("#overlay, #PleaseWait").hide();
   				$.messager.alert('Message', '  Not Created  ');
   			 funclose();
   				}
   				}
   		}
     x.open("GET","saveBlendingSheet.jsp?productarray="+blndArray+"&workno="+workno+"&psrno="+psrno,true);			
   	x.send();
    }
    function 	funpreprodload(){
    	 var psrno=$('#hidpsrno').val();
    	 var blndno=$('#hidblendsheetno').val();
     	alert("blndno=="+blndno);
     	if(parseInt(blndno)>0){
     		$.messager.alert('Warning','Blending Sheet Already Created.');
     		return false;
     	}
    	$('#preproddiv').load("preProductionGrid.jsp?id="+1+"&docno="+psrno);
    }
    function funloadbom(){
    	//alert("bomdoc==="+aa);
    	var workno=$('#hidworkno').val();
    	$('#bomdiv').load("bomGrid.jsp?id="+1+"&docno="+workno+"&cond="+2);
    }
    function funloadmaterial(){
    	//alert("bomdoc==="+aa);
    	var workno=$('#hidworkno').val();
    	var mrno=$('#hidmaterialrequestno').val();
    	if(parseInt(mrno)>0){
    		$.messager.alert('Warning','Material Request Already Created.');
    		return false;
    	}
    	$('#materialreqdiv').load("materialRequestGrid.jsp?id="+1+"&docno="+workno);
    }
    
    function funLoadCompleteGrid(){
    	var trno=$('#hidcomptrno').val();
    	var order=$('#hidworkno').val();
    	var psrno=$('#hidpsrno').val();
    	var otype=$('#hidordertype').val();
    	var fill=$('#batchqty').val();
    /* 	if(parseInt(trno)>0){
    		$.messager.alert('Warning','Production Already Completed.');
    		return false;
    	}
    	if(parseInt(gis)==0){
    		$.messager.alert('Warning','Production Cycle Not Completed.');
    		return false;
    	}
    	else{} */
    		
    		$('#productiondiv').load("productionCompleteGrid.jsp?id="+1+"&order="+order+"&psrno="+psrno+"&type="+otype+"&fill="+fill);
    	
    	
    }
    
    function funloadGIS(){
    	//alert("bomdoc==="+aa);
    	var workno=$('#hidpsrno').val();
    	var mrno=$('#hidmaterialrequestno').val();
    	var gisno=$('#hidgisno').val();
    	var qty=$('#fillqty').val();
    	var bqty=$('#batchqty').val();
    	var otype=$('#hidordertype').val();
    	var order=$('#hidworkno').val();
    	var desc=$('#hiddescptn').val();
    	var cond=1;
    	//alert("Minnos==="+gisno);
    	$('#genproduct').val($('#hidgenproduct').val());
    		$('#genqty').val($('#hidgenqty').val());
    		$('#genuom').val($('#hidgenuom').val());
    		$('#txtdesc').val($('#hiddescptn').val());
    		$('#txtbatch').val($('#hidbatchno').val());
    	$('#gisdiv').load("goodsIssueGrid.jsp?id="+1+"&docno="+workno+"&cond="+cond+"&qty="+qty+"&bqty="+bqty+"&type="+otype+"&workorder="+order);
    }
    
    function isNumber(evt) {
        var iKeyCode = (evt.which) ? evt.which : evt.keyCode
        if (iKeyCode != 46 && iKeyCode >> 31 && (iKeyCode << 48 || iKeyCode >> 57))
        	{
     	  // document.getElementById("errormsg").innerText=" Enter Numbers Only";  
           
            return false;
        	}
       // document.getElementById("errormsg").innerText="";  
        return true;
    }
    function funRoundAmt(value,id){
  	  var res=parseFloat(value).toFixed(2);
  	  var res1=(res=='NaN'?"0":res);
  	  document.getElementById(id).value=res1;  
  	 }
    
    function funProdUpdate(){
    	var workno=$('#hidworkno').val();
    	var opsrno=$('#hidpsrno').val();
    	var rows = $("#jqxgisGrid").jqxGrid('getrows');
    	var otype=$('#hidordertype').val();
    	var fillqty=$('#fillqty').val();
    	var gisno=$('#hidgisno').val();
    	 var brhid=$('#cmbbranch').val();
  	   var locid=$('#txtlocation').val();
		if(rows.length==0){
			$("#overlay, #PleaseWait").hide();
			$.messager.alert('Warning','Select documents.');
			return false;
		}
		
			$("#overlay, #PleaseWait").show();
			//$("#jqxbomGrid").jqxGrid('clear');
			var i=0;var temptrno="";           
			var j=0;
			var tmpcount=rows.length;
			var blndArray=new Array();
			for (i = 0; i < rows.length; i++) {
            
            var chkpsrno=rows[i].psrno;
          //  var blndqty=rows[i].worder;
           // alert("qty==="+blndqty);
            if(!(typeof(chkpsrno)==="undefined" || chkpsrno==null || chkpsrno=="")){
            	
            	blndArray.push(rows[i].psrno+" :: "+rows[i].uomid+" :: "+rows[i].qty+" :: "+workno+" :: "+opsrno+" :: "+otype+" :: "+fillqty+" :: "+gisno+" :: ");
            }
				
			}
			//alert("productarray=="+blndArray+"==size=="+blndArray.length);
			saveProdUpdate(blndArray);
				
			
    }
    
    function saveProdUpdate(blndArray){
    	var workno=$('#hidworkno').val();
    	var batch=$('#hidbatchno').val();
   	 var psrno=$('#hidpsrno').val();
   	 var salesqty=$('#batchqty').val();
   	var otype=$('#hidordertype').val();
   	var fillqty=$('#fillqty').val();
    var brhid=$('#cmbbranch').val();
	   var locid=$('#txtlocation').val();
   	 var x=new XMLHttpRequest();
  		x.onreadystatechange=function(){
  		if (x.readyState==4 && x.status==200){
  	     			
  				var items=x.responseText;
  				 var item = items.split('::');
  				 var method=item[0].trim();
  			      
  			      var aa=item[1].trim();
  			   var dd=item[2].trim();
  				if(parseInt(method)>0)  
  				{	
  					
  					//$('#hidblendsheetno').val(aa);
  					//funloadbom();
  					if(parseInt(method)==2)  
  				{
  						$("#overlay, #PleaseWait").hide();
  						$.messager.alert('Message', '2 Filling Qty Exceeded  SOR '+dd+' Qty Available');
  				}
  					else{
  						funCompletionSave();
  						//$.messager.alert('Message', '  Production Successfully Updated ');
  					}
  					
  					 funclose();
  			    
  				
  				}
  				else
  				{
  					$("#overlay, #PleaseWait").hide();
  				$.messager.alert('Message', '  Not Created  ');
  				 funclose();
  				}
  				}
  		}
    x.open("GET","saveProductionUpdate.jsp?productarray="+blndArray+"&workno="+workno+"&psrno="+psrno+"&sorqty="+salesqty+"&ordertype="+otype+"&fill="+fillqty+"&location="+locid+"&brhid="+brhid,true);			
  	x.send();
    }
    
    function funGISsave(){
    	var orderno=$('#hidworkno').val();
    	
    	var rows = $("#jqxgisGrid").jqxGrid('getrows');
    	var gisno=$('#hidgisno').val();
    	var qty=$('#fillqty').val();
    	var bqty=$('#batchqty').val();
    	var opsrno=$('#hidpsrno').val();
    	var otype=$('#hidordertype').val();
    	 var trno=$('#hidcomptrno').val();
    	/*  if(parseInt(gisno)>0){
    		$.messager.alert('Warning','MIN Already Created.');
			return false;
    	}  */
     	if(parseInt(trno)>0){
       		$("#overlay, #PleaseWait").hide();
       		$.messager.alert('Warning','Filling Already Completed.');
       		return false;
       	} 
		if(rows.length==0){
			$("#overlay, #PleaseWait").hide();
			$.messager.alert('Warning','Select documents.');
			return false;
		}
		$.messager.confirm('Message', 'Do you want to update production?', function(r){
			if(r==false)
			{
			return false; 
			}
			else
			{
			$("#overlay, #PleaseWait").show();
			//$("#jqxbomGrid").jqxGrid('clear');
			var i=0;var temptrno="";           
			var j=0;
			var tmpcount=rows.length;
			var blndArray=new Array();
			var blndArray2=new Array();
			for (i = 0; i < rows.length; i++) {
            
            var chkpsrno=rows[i].psrno;
          //  var issue=rows[i].issqty;
           // alert("qty==="+blndqty);
            if(!(typeof(chkpsrno)==="undefined" || chkpsrno==null || chkpsrno=="")){
            	
            	blndArray.push(rows[i].psrno+" :: "+rows[i].psrno+" :: "+rows[i].uomid+" :: "+rows[i].qty+" :: "+"0"+" :: "+"0"+" :: "+rows[i].specid+" :: "+"0"+" :: "+"0"+" :: "+"0"+" :: "+rows[i].stockid+" :: "+"0"+" :: ");
            	blndArray2.push(rows[i].psrno+" :: "+rows[i].uomid+" :: "+rows[i].qty+" :: "+orderno+" :: "+opsrno+" :: "+otype+" :: "+"0"+" :: "+"0"+" :: "+rows[i].workno+" :: ");
            	
              }
	
			}
			//alert("productarray=="+blndArray+"==size=="+blndArray.length);
			saveGIS(blndArray,blndArray2);
				
			}
			});
    }
    
   
    
    function saveGIS(blndArray,blndArray2){
    	var workno=$('#hidworkno').val();
    	var batch=$('#hidbatchno').val();
   	 var psrno=$('#hidpsrno').val();
   	var ordertype=$('#hidordertype').val();
   	var fillqty=$('#fillqty').val();
	var sorqty=$('#batchqty').val();
	  var brhid=$('#cmbbranch').val();
	   var locid=$('#txtlocation').val();
			
 	   var lmpsmchk=$('#lmpsm').val(); 	
 	   var uomid=$('#hidgenuomid').val();
 	   var specid=$('#hidgenspecid').val();
 	   var prdcost=$('#stdprodcost').val();
 	  var sorddoc=$('#hidsorddoc').val();
 	   var desc=$('#txtdesc').val();
	  // alert("branch=="+brhid+"===location=="+locid);
    	 var x=new XMLHttpRequest();
  		x.onreadystatechange=function(){
  		if (x.readyState==4 && x.status==200){
  	     			
  				var items=x.responseText;
  				 var item = items.split('::');
  				 var method=item[0].trim();
  			      
  			      var aa=item[1].trim();
  			    var dd=item[2].trim();
  			  var cc=item[3].trim();
  				if(parseInt(method)>0)  
  				{	
  					
  					//$('#hidblendsheetno').val(aa);
  					//funloadbom();
  					if(parseInt(method)==3){
  						$("#overlay, #PleaseWait").hide();
  						$.messager.alert('Message', '3 Filling Qty Exceeded  SOR '+cc+' Qty Available');
  					}
  					if(parseInt(method)==2){
  						$("#overlay, #PleaseWait").hide();
  						$.messager.alert('Message', ' Product Not In Stock ');
  					}
  					if(parseInt(method)==1){
  						$('#hidgisno').val(dd);
  						$("#overlay, #PleaseWait").hide();
  		 				$.messager.alert('Message', ' Filling Completed Successfully ');
  		 				funload();
  		 				
  					}
  					 funclose();
  			    
  				
  				}
  				else
  				{
  					$("#overlay, #PleaseWait").hide();
  				$.messager.alert('Message', '  Not Created  ');
  				 funclose();
  				}
  				}
  		}
    x.open("GET","saveGIS.jsp?productarray="+blndArray+"&workno="+workno+"&psrno="+psrno+"&batch="+batch+"+&ordertype="+ordertype+"&sorqty="+sorqty+"&fill="+fillqty+"&location="+locid+"&brhid="+brhid+"&productarraynw="+blndArray2+"&prdcost="+prdcost+"&lmpsmchk="+lmpsmchk+"&uomid="+uomid+"&specid="+specid+"&batch="+batch+"&sorddoc="+sorddoc+"&desc="+desc,true);			
  	x.send(); 
    }
    
    function funmaterialreqsave(){
    	var workno=$('#hidworkno').val();
    	var rows = $("#jqxmaterialGrid").jqxGrid('getrows');
    	var mrno=$('#hidmaterialrequestno').val();
    	if(parseInt(mrno)>0){
    		$.messager.alert('Warning','Material Request Already Created.');
    		return false;
    	}
		if(rows.length==0){
			$("#overlay, #PleaseWait").hide();
			$.messager.alert('Warning','Select documents.');
			return false;
		}
		$.messager.confirm('Message', 'Do you want to create material request?', function(r){
			if(r==false)
			{
			return false; 
			}
			else
			{
			$("#overlay, #PleaseWait").show();
			//$("#jqxbomGrid").jqxGrid('clear');
			var i=0;var temptrno="";           
			var j=0;
			var tmpcount=rows.length;
			var blndArray=new Array();
			for (i = 0; i < rows.length; i++) {
            
            var chkpsrno=rows[i].psrno;
          //  var blndqty=rows[i].worder;
           // alert("qty==="+blndqty);
            if(!(typeof(chkpsrno)==="undefined" || chkpsrno==null || chkpsrno=="")){
            	
            	blndArray.push(rows[i].psrno+" :: "+rows[i].psrno+" :: "+rows[i].uomid+" :: "+rows[i].qty+" :: "+"0"+" :: "+"0"+" :: "+rows[i].specid+" :: "+"0"+" :: "+"0"+" :: "+"0"+" :: " );
            }
				
			}
			//alert("productarray=="+blndArray+"==size=="+blndArray.length);
			savematerialrequest(blndArray);
				
			}
			});
    }
    
    function savematerialrequest(blndArray){
    	var workno=$('#hidworkno').val();
   	 var psrno=$('#hidpsrno').val();
   	 var x=new XMLHttpRequest();
  		x.onreadystatechange=function(){
  		if (x.readyState==4 && x.status==200){
  	     			
  				var items=x.responseText;
  				 var item = items.split('::');
  				 var method=item[0].trim();
  			      
  			      var aa=item[1].trim();
  				if(parseInt(method)>0)  
  				{	
  					$("#overlay, #PleaseWait").hide();
  					//$('#hidblendsheetno').val(aa);
  					//funloadbom();
  				$.messager.alert('Message', '  Material Request '+aa+' Successfully Created ');
  				 funclose();
  				
  				}
  				else
  				{
  					$("#overlay, #PleaseWait").hide();
  				$.messager.alert('Message', '  Not Created  ');
  				 funclose();
  				}
  				}
  		}
    x.open("GET","saveMaterialRequest.jsp?productarray="+blndArray+"&workno="+workno+"&psrno="+psrno,true);			
  	x.send();
    }
    
    function funbatchcreate(){
    	var workno=$('#hidworkno').val();
    	var bdate=$('#batchdate').val();
    	var bno=$('#batchno').val();
    	var bqty=$('#batchqty').val();
    	var btime=$('#batchtime').val();
    	   var psrno=$('#hidpsrno').val();
    	if(workno==""){
			$.messager.alert('Warning','Select a document.');
			return false;
	   }
    	 var x=new XMLHttpRequest();
 		x.onreadystatechange=function(){
 		if (x.readyState==4 && x.status==200){
 	     			
 				var items=x.responseText.trim();
 				if(parseInt(items)>0)  
 				{	
 					$("#overlay, #PleaseWait").hide();
 				$.messager.alert('Message', ' Batch Details Successfully Updated ');
 				funload();
 				
 				}
 				else
 				{
 					$("#overlay, #PleaseWait").hide();
 				$.messager.alert('Message', '  Not Updated  ');
 				}
 				}
 		}
   x.open("GET","batchupdate.jsp?workno="+workno+"&bdate="+bdate+"&bno="+bno+"&bqty="+bqty+"&btime="+btime+"&psrno="+psrno,true);			
 	x.send();
    }
    
    
    function funCompletionSave(){
    	var workno=$('#hidworkno').val();
    	   var psrno=$('#hidpsrno').val();
    	   var lmpsmchk="$('#lmpsm').val()";
    	   var dtype="";
    	   var uomid=$('#hidgenuomid').val();
    	   var specid=$('#hidgenspecid').val();
    	   var qty=$('#hidgenqty').val();
    	   var batch=$('#hidbatchno').val();
    	   var prdcost=$('#stdprodcost').val();
    	   var trno=$('#hidcomptrno').val();
    	   var ordertype=$('#hidordertype').val();
    	   var brhid=$('#cmbbranch').val();
    	   var locid=$('#txtlocation').val();
       /* 	if(parseInt(trno)>0){
       		$("#overlay, #PleaseWait").hide();
       		$.messager.alert('Warning','Filling Already Completed.');
       		return false;
       	} */
    	if(workno==""){
			$.messager.alert('Warning','Select a document.');
			return false;
	   }
    	
    	 var x=new XMLHttpRequest();
 		x.onreadystatechange=function(){
 		if (x.readyState==4 && x.status==200){
 	     			
 				var items=x.responseText.trim();
 				if(parseInt(items)>0)  
 				{	
 					$("#overlay, #PleaseWait").hide();
 				$.messager.alert('Message', ' Filling Completed Successfully ');
 				funload();
 				 funclose();
 				}
 				else
 				{
 					$("#overlay, #PleaseWait").hide();
 				$.messager.alert('Message', '  Not Updated  ');
 				 funclose();
 				}
 				}
 		}
   x.open("GET","productioncomplete.jsp?workno="+workno+"&prdcost="+prdcost+"&batch="+batch+"&qty="+qty+"&uomid="+uomid+"&specid="+specid+"&psrno="+psrno+"&lmpsmchk="+lmpsmchk+"&ordertype="+ordertype+"&location="+locid+"&brhid="+brhid,true);			
 	x.send();
		
    }
    	
    
    
    function addGridFilters(id,filtervalue,datafield,filtertype,filtercondition){   
    	var filtergroup = new $.jqx.filter();
    	var filter_or_operator = 1;
    	    //var filtercondition = 'contains';
	    	var filter1 = filtergroup.createfilter(filtertype, filtervalue, filtercondition);
	
	    	filtergroup.addfilter(filter_or_operator, filter1);
	    	//filtergroup.addfilter(filter_or_operator, filter2);
	    	// add the filters.
	    	$("#jqxsapGrid").jqxGrid('addfilter', datafield, filtergroup);
	    	// apply the filters.
	    	$("#jqxsapGrid").jqxGrid('applyfilters');     
    	
 	}
    function isNumber(evt) {
        var iKeyCode = (evt.which) ? evt.which : evt.keyCode
        if (iKeyCode != 46 && iKeyCode >> 31 && (iKeyCode << 48 || iKeyCode >> 57))
        	{
     	  // document.getElementById("errormsg").innerText=" Enter Numbers Only";  
           
            return false;
        	}
       // document.getElementById("errormsg").innerText="";  
        return true;
    }
    function funRoundAmt(value,id){
  	  var res=parseFloat(value).toFixed(2);
  	  var res1=(res=='NaN'?"0":res);
  	  document.getElementById(id).value=res1;  
  	 }
    function funSetqualityGrid(){
    	var psrno=$('#hidpsrno').val();
    	var quality=$('#hidqualityno').val();
    	var finalval=$('#qaid').val();
    	if(parseInt(quality)>0){
    		$.messager.alert('Warning','Quality Assuarance Already Created.');
    		return false;
    	}
    	//alert("final===="+finalval);
    	if(parseInt(finalval)==1){
    		$('#qadiv').hide();
        	$('#qasubdiv').show();
    		 $('#qasubdiv').load("qualitysubGrid.jsp?id="+finalval+"&docno="+psrno+"&chk="+1);
    	}
    	else{
    		$('#qadiv').show();
        	$('#qasubdiv').hide();
    		 $('#qadiv').load("qualityAssuaranceGrid.jsp?id="+finalval+"&docno="+psrno+"&chk="+1);
    	}
		
		 
    }
    
   function funMarking(mark){
	   var psrno=$('#hidpsrno').val();
	   var workno=$('#hidworkno').val();
	   var otype=$('#hidordertype').val();
	   if(workno==""){
			$.messager.alert('Warning','Select a document.');
			return false;
	   }
	   var markdate="";
	   if(mark=="start"){
		   markdate=$('#startdate').val();
	   }
	   if(mark=="end"){
		   markdate=$('#enddate').val();
	   }
	  // alert("mark==="+mark);
	   var x=new XMLHttpRequest();
		x.onreadystatechange=function(){
		if (x.readyState==4 && x.status==200){
	     			
				var items=x.responseText.trim();
				if(parseInt(items)>0)  
				{	
					$("#overlay, #PleaseWait").hide();
				$.messager.alert('Message', ' Successfully Updated ');
				funload();
				
				}
				else
				{
					$("#overlay, #PleaseWait").hide();
				$.messager.alert('Message', '  Not Updated  ');
				}
				}
		}
  x.open("GET","markingupdate.jsp?psrno="+psrno+"&mark="+mark+"&markdate="+markdate+"&workno="+workno+"&otype="+otype,true);			
	x.send();
   }
   function funload(){  
	   $('#productdiv').load("productGrid.jsp?id="+1);                                             
   }
   function getBranch() {
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
	}
   function getLocation() {
	   var brhid=$('#cmbbranch').val();
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
				$("select#txtlocation").html(optionsbranch);
				/* if ($('#hidcmbbranch').val() != null) {
					$('#cmbbranch').val($('#hidcmbbranch').val());
				} */
			} else {
				//alert("Error");
			}  
		}
		x.open("GET","searchlocation.jsp?branch="+brhid, true);
		x.send();   
	}
	 function funAttachs(event){                            
			var brchid="<%= session.getAttribute("BRANCHID").toString() %>";
			var rows = $("#jqxpdpGrid").jqxGrid('getrows');
			   var workno=$('#hidworkno').val();
			   var otype=$('#hidordertype').val();
			
			if(rows.length==0){
				$("#overlay, #PleaseWait").hide();
				$.messager.alert('Warning','Select a document.');
				return false;
			}

			    var workno=$('#hidworkno').val();
				//var type= $('#jqxpdpGrid').jqxGrid('getcellvalue', selectedrows[i], "otype");
				var frmdet="";
	   			var fname="";
			if(otype=="SOR"){
				frmdet="SOR";
				fname="Sales Order";
			}
			if(otype=="STKO"){
				frmdet="STKO";
				fname="Stock Order";
			}		
				
	   		    var  myWindow= window.open("<%=contextPath%>/com/common/Attachmaster.jsp?formCode="+frmdet+"&docno="+workno+"&brchid="+brchid+"&frmname="+fname,"_blank","top=180,left=310,Width=800,Height=430,location=no,scrollbars=no,toolbar=no,resizable=no,meanubar=no,titlebar=no");
					 myWindow.focus();  
			  
	                
		   } 
   function funbom()
   {
   	var doc=$('#hidbomdoc').val();
   	/*  var barchval = document.getElementById("cmbbranch").value;
   		if(barchval=="a" || barchval=="")
   			{
   			  $.messager.alert('Message','Branch is mandatory  ','warning');   
   				 
   			   return false;
   			} */
   	
      var url=document.URL;
   	var reurl=url.split("com/");
   	var mod="view";
   	window.parent.formName.value="Bill of Material";
   	window.parent.formCode.value="PRDT";
   	var detName= "Bill of Material";
   	 var path1='com/manufacturing/productdetails/saveMProductDetails';

   	    var path= path1+"?mode="+mod+"&docno="+doc;  

   	top.addTab( detName,reurl[0]+""+path);  
   }
   function loaddatass()
	 {
		 
			$("#batgrid").jqxGrid('clear'); 
		 
		 
		   $('#prdetails').find('input[type=text]').each(function(){
			     
			      $(this).val("");
			       });
		   
		   
		   
		 
		  var temppsrno=document.getElementById("hidgispsrno").value; 
		 var unit=document.getElementById("hidgisunit").value; 
		 var temptrno=""; 
		 
		 if(temppsrno==""){
				$.messager.alert('Warning','Select a Product.');
				return false;
		   }
		 
		 

     	  
 		var rows1 = $("#jqxgisGrid").jqxGrid('getrows');
	    var aa=0;
	   
	
	   var tempchk="";
   	 
		 
		 
 		 $("#batchdiv").load('batchdet.jsp?psrno='+temppsrno+'&unit='+unit+'&temptrno='+temptrno+'&tempchk='+tempchk+"&aa=YES");
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
		 
		 document.getElementById("qty2").value="";
		 //document.getElementById("foc2").value="";
		 document.getElementById("stkqty2").value="";
		 document.getElementById("bt2").value="";
		 document.getElementById("ed2").value="";
		 document.getElementById("stkid2").value="";
		 
		 
		 document.getElementById("qty3").value="";
		// document.getElementById("foc3").value="";
		 document.getElementById("stkqty3").value="";
		 document.getElementById("bt3").value="";
		 document.getElementById("ed3").value="";
		 document.getElementById("stkid3").value="";
		 
		 
		 document.getElementById("qty4").value="";
		// document.getElementById("foc4").value="";
		 document.getElementById("stkqty4").value="";
		 document.getElementById("bt4").value="";
		 document.getElementById("ed4").value="";
		 document.getElementById("stkid4").value="";
		 
		 
		 
		 document.getElementById("qty5").value="";
		// document.getElementById("foc5").value="";
		 document.getElementById("stkqty5").value="";
		 document.getElementById("bt5").value="";
		 document.getElementById("ed5").value="";
		 document.getElementById("stkid5").value="";
		 
		 
		 
		 document.getElementById("qty6").value="";
		// document.getElementById("foc6").value="";
		 document.getElementById("stkqty6").value="";
		 document.getElementById("bt6").value="";
		 document.getElementById("ed6").value="";
		 document.getElementById("stkid6").value="";
		 
		 
		 
		 document.getElementById("qty7").value="";
		// document.getElementById("foc7").value="";
		 document.getElementById("stkqty7").value="";
		 document.getElementById("bt7").value="";
		 document.getElementById("ed7").value="";
		 document.getElementById("stkid7").value="";
		 
		 
		 
		 document.getElementById("qty8").value="";
		 //document.getElementById("foc8").value="";
		 document.getElementById("stkqty8").value="";
		 document.getElementById("bt8").value="";
		 document.getElementById("ed8").value="";
		 document.getElementById("stkid8").value="";
		 
		 
		 
		 
		 document.getElementById("qty9").value="";
		// document.getElementById("foc9").value="";
		 document.getElementById("stkqty9").value="";
		 document.getElementById("bt9").value="";
		 document.getElementById("ed9").value="";
		 document.getElementById("stkid9").value="";
		 
		 
		 
		 document.getElementById("qty10").value="";
		// document.getElementById("foc10").value="";
		 document.getElementById("stkqty10").value="";
		 document.getElementById("bt10").value="";
		 document.getElementById("ed10").value="";
		 document.getElementById("stkid10").value="";
		
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
  	   $(""+id1).show();	
		   document.getElementById(""+id3).value= $('#batgrid').jqxGrid('getcellvalue', i, "batch_no");
  	   document.getElementById(""+id4).value= $('#batgrid').jqxGrid('getcelltext', i, "exp_date");
  	   document.getElementById(""+id5).value= $('#batgrid').jqxGrid('getcellvalue', i, "stkqty");
  	   document.getElementById(""+id6).value= $('#batgrid').jqxGrid('getcellvalue', i, "stockid");
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
			 
			 document.getElementById("qty2").value="";
			// document.getElementById("foc2").value="";
			 document.getElementById("stkqty2").value="";
			 document.getElementById("bt2").value="";
			 document.getElementById("ed2").value="";
			 document.getElementById("stkid2").value="";
			 
			 
			 document.getElementById("qty3").value="";
			// document.getElementById("foc3").value="";
			 document.getElementById("stkqty3").value="";
			 document.getElementById("bt3").value="";
			 document.getElementById("ed3").value="";
			 document.getElementById("stkid3").value="";
			 
			 
			 document.getElementById("qty4").value="";
			// document.getElementById("foc4").value="";
			 document.getElementById("stkqty4").value="";
			 document.getElementById("bt4").value="";
			 document.getElementById("ed4").value="";
			 document.getElementById("stkid4").value="";
			 
			 
			 
			 document.getElementById("qty5").value="";
			// document.getElementById("foc5").value="";
			 document.getElementById("stkqty5").value="";
			 document.getElementById("bt5").value="";
			 document.getElementById("ed5").value="";
			 document.getElementById("stkid5").value="";
			 
			 
			 
			 document.getElementById("qty6").value="";
			// document.getElementById("foc6").value="";
			 document.getElementById("stkqty6").value="";
			 document.getElementById("bt6").value="";
			 document.getElementById("ed6").value="";
			 document.getElementById("stkid6").value="";
			 
			 
			 
			 document.getElementById("qty7").value="";
			// document.getElementById("foc7").value="";
			 document.getElementById("stkqty7").value="";
			 document.getElementById("bt7").value="";
			 document.getElementById("ed7").value="";
			 document.getElementById("stkid7").value="";
			 
			 
			 
			 document.getElementById("qty8").value="";
			// document.getElementById("foc8").value="";
			 document.getElementById("stkqty8").value="";
			 document.getElementById("bt8").value="";
			 document.getElementById("ed8").value="";
			 document.getElementById("stkid8").value="";
			 
			 
			 
			 
			 document.getElementById("qty9").value="";
			// document.getElementById("foc9").value="";
			 document.getElementById("stkqty9").value="";
			 document.getElementById("bt9").value="";
			 document.getElementById("ed9").value="";
			 document.getElementById("stkid9").value="";
			 
			 
			 
			 document.getElementById("qty10").value="";
			// document.getElementById("foc10").value="";
			 document.getElementById("stkqty10").value="";
			 document.getElementById("bt10").value="";
			 document.getElementById("ed10").value="";
			 document.getElementById("stkid10").value="";
			
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
	        $('#jqxgisGrid').jqxGrid('setcellvalue', rowid, "qty",totqty);
	        $('#jqxgisGrid').jqxGrid('setcellvalue', rowid, "stockid",stkid);
	        $('#jqxgisGrid').jqxGrid('setcellvalue', rowid, "collqty",temp);
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
