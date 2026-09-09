<jsp:include page="../../../../includes.jsp"></jsp:include>    
<%@ taglib prefix="s" uri="/struts-tags" %>
<%  String contextPath=request.getContextPath();%>
<!DOCTYPE html>   
<html lang="en">
<head>
<title>Product Planing</title>                                                 
<meta http-equiv="Content-Type" content="text/html;charset=ISO-8859-1">  
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="https://daneden.github.io/animate.css/animate.min.css">
<link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
<link href="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.6-rc.0/css/select2.min.css" rel="stylesheet" />
<jsp:include page="../../../../floorMgmtIncludes.jsp"></jsp:include> 

<style type="text/css"> 
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
    margin: 5px 5px 15px 5px;
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

/* Updated inner buttons (Load Data, Submit, etc) */
.myButtons, .myButton {
    display: inline-flex;
    align-items: center;
    justify-content: center;
    background-color: #2563eb;
    color: #fff;
    border: none;
    padding: 6px 16px;
    font-size: 13px;
    font-weight: 600;
    border-radius: 6px;
    cursor: pointer;
    box-shadow: 0 1px 3px rgba(0,0,0,0.1);
    transition: background 0.2s;
    text-decoration: none;
    margin-right: 4px;
}
.myButtons:hover, .myButton:hover {
    background-color: #1d4ed8;
    color: #fff;
}
.myButtons:disabled, .myButton:disabled {
    background-color: #9ca3af;
    cursor: not-allowed;
}

/* Modals & Layout */
.modalStyle {      
    background-color:#f4f7f9; 
    padding: 15px;
    border-bottom: 1px solid #e1e8ed;
}
.borderStyle {  
    margin-bottom: 0;
    background: #fff;
    border: 1px solid #e1e8ed;
    border-radius: 8px;
    box-shadow: 0 2px 4px rgba(0,0,0,0.02);
    overflow: hidden;
}   
.badge-notify{
   position:absolute;right:-5px;top:-8px;z-index:2;background-color:red; border-radius:10px; padding:3px 6px; font-size:10px;
} 
.comment{
  background: #f8fafc;
  border: 1px solid #e1e8ed;
  color: #333;
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
  font-size: 11px;
  color: #888;
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
.select2-selection--single {
    width: 100%;
}
.status {
    color: #FD8725;
    font-family: 'Segoe UI', Tahoma, sans-serif;
    font-size: 15px;
    font-weight: bold;
    margin: 0;
}
#lblclientstatus {
  animation: blink 1s infinite alternate;
}
@keyframes blink {
  from { opacity: 1; }
  to { opacity: 0.5; }
}
#divname {
    background-color: #f8fafc;
    border: 1px solid #e1e8ed;
    border-radius: 8px;
    box-shadow: 0 4px 12px rgba(0,0,0,0.15);
    position:fixed; z-index:1000; right:30px; top:100px; padding: 10px;
}
.hidden-scrollbar {
    height: 630px;
    overflow-x: hidden;
}
</style>
</head>       
<body onload="getBranch();getLocation();getQualityConfig();">
<div class='hidden-scrollbar'>                                   
  <div class="container-fluid" >
    
    <div class="row">
      <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
        <div class="top-action-bar">
            
            <button type="button" class="action-btn" id="btnsubmit" data-toggle="tooltip" title="Submit/Refresh">
                <i class="fa fa-refresh"></i> Refresh
            </button>
            
            <div class="action-divider"></div>

            <button type="button" class="action-btn" id="btnprocess" data-tooltip="tooltip" title="View BoM">
                <i class="fa fa-vine"></i> View BoM
            </button>
            <button type="button" class="action-btn" id="btnstartmarking" data-toggle="modal" data-target="#modalstartmarkupdate" title="Product Start Marking">
                <i class="fa fa-calendar-check-o"></i> Start Mark
            </button>
            <button type="button" class="action-btn" id="btnendmarking" data-toggle="modal" data-target="#modalendmarkupdate" title="Product End Marking">
                <i class="fa fa-calendar-minus-o"></i> End Mark
            </button>
            
            <div class="action-divider"></div>

            <button type="button" class="action-btn" id="btnconfirm" data-toggle="modal" data-target="#modalbatchcreation" title="Create Batch">
                <i class="fa fa-plus"></i> Create Batch
            </button>
            <button type="button" class="action-btn" id="btnpreproductiontest" data-toggle="modal" data-target="#modalpreproductiontest" title="Blend Sheet Creation">
                <i class="fa fa-check-circle"></i> Blend Sheet
            </button>
            <button type="button" class="action-btn" id="btnblensheetprint" title="Blending Sheet Print">
                <i class="fa fa-print"></i> Print Blend Sheet
            </button>
            <button type="button" class="action-btn" id="btnmaterialrequest" data-toggle="modal" data-target="#modalmaterialrequest" title="Material Request">
                <i class="fa fa-credit-card-alt"></i> Material Req
            </button>
            <button type="button" class="action-btn" id="btngoodsissuenote" data-toggle="modal" data-target="#modalgoodsissuenote" title="Material Issue Note">
                <i class="fa fa-pencil-square-o"></i> Mat. Issue Note
            </button>
            <button type="button" class="action-btn" id="btnproductioncomplete" data-toggle="modal" data-target="#modalproductioncompletion" title="Production Completion">
                <i class="fa fa-life-ring"></i> Prod. Complete
            </button>

            <div class="action-divider"></div>

            <button type="button" class="action-btn" id="btnqualityinprocess" data-toggle="modal" data-target="#modalqualityinprocess" title="Quality In Process">
                <i class="fa fa-random"></i> Qty In-Process
            </button>
            <button type="button" class="action-btn" id="btnqualityassuarance" data-toggle="modal" data-target="#modalqualityassuarance" title="Quality Assuarance">
                <i class="fa fa-thumbs-up"></i> Qty Assurance
            </button>
            <button type="button" class="action-btn" id="btncertificateanalysisprint" title="Certificate Analysis Print">
                <i class="fa fa-certificate"></i> Cert. Print
            </button>

            <div class="action-divider"></div>

            <button type="button" class="action-btn" id="btnattachs" data-toggle="modal" data-target="#modalattach" title="Attach">
                <i class="fa fa-download"></i> Attach
            </button>
            <button type="button" class="action-btn" id="btncomment" data-toggle="modal" title="Comments">
                <i class="fa fa-comments"></i> Comments
            </button>
            <button type="button" class="action-btn" id="btnwork" data-toggle="modal" data-target="#modalworkorderlog" title="Work Order Log">
                <i class="fa fa-building"></i> WO Log
            </button>
            <button type="button" class="action-btn" id="btnsalesman" data-toggle="modal" data-target="#modalsalesman" title="Date Statistics">
                <i class="fa fa-bar-chart"></i> Date Stats
            </button>
            <button type="button" class="action-btn" id="btnclient" data-toggle="modal" data-target="#modalclient" title="Client Statistics">
                <i class="fa fa-users"></i> Client Stats
            </button>

            <div style="margin-left: auto;">
                <label class="status" id="lblclientstatushead" name="lblclientstatushead"></label>
            </div>
            
        </div>
      </div>
    </div>         
    
    <div class="row" style="padding-top:5px;">      
      <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">          
        <div id="productdiv" class="borderStyle"><jsp:include page="productGrid.jsp"></jsp:include></div>                     
      </div>
    </div>
    
    <div class="row" style="padding-top:15px;">          
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
    
    <div id="modalstartmarkupdate" class="modal fade" role="dialog">  
      <div class="modal-dialog">
        <div class="modal-content">
          <div class="modal-header modalStyle">
            <button type="button" class="close" data-dismiss="modal">&times;</button>
            <h4 class="modal-title" style="text-align:center">Product Start Marking</h4> 
            <h6 class="modal-title" style="text-align:center"><label class="status" id="lblclientstatus1" name="lblclientstatus1"></label></h6>     
          </div>
          <div class="modal-body">
          <table width="100%" >
          <tr>
          <td align="right"><label class="branch" style="padding-right: 15px;">Start Time</label></td>
           <td align="left"><div id="startdate" style="width:100%; max-width: 200px;" name="startdate" value='<s:property value="startdate"/>'></div></td>
          </tr>
          </table>
          </div>
          <div class="modal-footer">
            <button type="button" id="btnstartsave" class="btn btn-primary" data-dismiss="modal">Save</button>
            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
          </div>  
        </div>  
      </div>
    </div>
      
    <div id="modalendmarkupdate" class="modal fade" role="dialog">  
      <div class="modal-dialog">
        <div class="modal-content">
          <div class="modal-header modalStyle">
            <button type="button" class="close" data-dismiss="modal">&times;</button>
            <h4 class="modal-title" style="text-align:center">Product End Marking</h4>  
            <h6 class="modal-title" style="text-align:center"><label class="status" id="lblclientstatus2" name="lblclientstatus2"></label></h6>    
          </div>
          <div class="modal-body">
          <table width="100%" >
          <tr>
          <td align="right"><label class="branch" style="padding-right: 15px;">End Time</label></td>
           <td align="left"><div id="enddate" style="width:100%; max-width: 200px;" name="enddate" value='<s:property value="enddate"/>'></div></td>
          </tr>
          </table>
          </div>
          <div class="modal-footer">
            <button type="button" id="btnendsave" class="btn btn-primary" data-dismiss="modal">Save</button>
            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
          </div>  
        </div>  
      </div>
    </div>
      
    <div id="modalbatchcreation" class="modal fade" role="dialog">  
      <div class="modal-dialog">
        <div class="modal-content">
          <div class="modal-header modalStyle">
            <button type="button" class="close" data-dismiss="modal">&times;</button>
            <h4 class="modal-title" style="text-align:center">Batch Creation</h4> 
            <h6 class="modal-title" style="text-align:center"><label class="status" id="lblclientstatus3" name="lblclientstatus3"></label></h6>     
          </div>
          <div class="modal-body">
          <table width="100%" style="border-spacing: 0 10px; border-collapse: separate;">
          <tr>
          <td align="right" style="padding-right: 10px;"><label class="branch">Batch Date</label></td>
           <td align="left"><div id="batchdate" style="width:100%;" name="batchdate" value='<s:property value="batchdate"/>'></div></td>
          <td align="right" style="padding-right: 10px;"><label class="branch">Batch No</label></td>
           <td align="left"><input type="text" class="form-control" id="batchno" name="batchno" style="width:100%;" onkeypress="javascript:return isNumber(event);" /></td>
          </tr>
          <tr>
          <td align="right" style="padding-right: 10px;"><label class="branch">Time</label></td>
           <td align="left"><div id="batchtime" style="width:100%;" name="batchtime" value='<s:property value="batchtime"/>'></div></td>
          <td align="right" style="padding-right: 10px;"><label class="branch">Qty</label></td>
           <td align="left"><input type="text" class="form-control" id="batchqty" name="batchqty" style="width:100%;" onblur="funRoundAmt(this.value,this.id);" onkeypress="javascript:return isNumber (event);" /></td>
          </tr>
          </table>
          </div>
          <div class="modal-footer">
            <button type="button" id="btnbatchsave" class="btn btn-primary" data-dismiss="modal">Save</button>
            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
          </div>  
        </div>  
      </div>
    </div> 
    
    <div id="modalpreproductiontest" class="modal fade" role="dialog">  
      <div class="modal-dialog modal-lg">
        <div class="modal-content">
          <div class="modal-header modalStyle">
            <button type="button" id="upclosepreprodtest" class="close" data-dismiss="modal">&times;</button>
            <h4 class="modal-title" style="text-align:center">Blend Sheet Creation</h4>
            <h6 class="modal-title" style="text-align:center"><label class="status" id="lblclientstatus4" name="lblclientstatus4"></label></h6>      
          </div>
          <div class="modal-body">
          <button type="button" id="btnpreprodload" class="myButton" style="margin-bottom: 10px;">Load</button>
          <div id="preproddiv" style="border: 1px solid #ccc;"><jsp:include page="preProductionGrid.jsp"></jsp:include></div>
          </div>
          <div class="modal-footer">
            <button type="button" id="btnpreprodsave" class="btn btn-primary" data-dismiss="modal">Create Blending Sheet</button>
            <button type="button" id="downclosepreprodtest" class="btn btn-default" data-dismiss="modal">Close</button>
          </div>  
        </div>  
      </div>
    </div>  
      
    <div id="modalmaterialrequest" class="modal fade" role="dialog">  
      <div class="modal-dialog modal-lg">
        <div class="modal-content">
          <div class="modal-header modalStyle">
            <button type="button" id="upmaterialrequest" class="close" data-dismiss="modal">&times;</button>
            <h4 class="modal-title" style="text-align:center">Material Request</h4> 
            <h6 class="modal-title" style="text-align:center"><label class="status" id="lblclientstatus5" name="lblclientstatus5"></label></h6>     
          </div>
          <div class="modal-body">
          <button type="button" id="btnmaterialreqload" class="myButton" style="margin-bottom: 10px;">Load</button>
          <div id="materialreqdiv" style="border: 1px solid #ccc;"><jsp:include page="materialRequestGrid.jsp"></jsp:include></div>
          </div>
          <div class="modal-footer">
            <button type="button" id="btnmaterialreqsave" class="btn btn-primary" data-dismiss="modal">Create Material Request</button>
            <button type="button" id="downmaterialrequest" class="btn btn-default" data-dismiss="modal">Close</button>
          </div>  
        </div>  
      </div>
    </div>  
      
    <div id="modalqualityinprocess" class="modal fade" role="dialog">  
      <div class="modal-dialog modal-lg">
        <div class="modal-content">
          <div class="modal-header modalStyle">
            <button type="button" id="upqltyinprocess" class="close" data-dismiss="modal">&times;</button>
            <h4 class="modal-title" style="text-align:center">Quality In Process</h4> 
            <h6 class="modal-title" style="text-align:center"><label class="status" id="lblclientstatus10" name="lblclientstatus10"></label></h6>     
          </div>
          <div class="modal-body">
           <div style="display:flex; gap:10px; margin-bottom: 10px;">
              <button type="button" id="btnqualityinprocessload" class="myButton">Load</button>
              <input type="button" id="loads" class="myButton" value="Load Data" onclick="loaddatass()"> 
           </div>
           
           <div id="qltyprcsdiv" style="border: 1px solid #ccc;"><jsp:include page="qualityInProcessGrid.jsp"></jsp:include></div>
          
           <div id="divname" hidden="true">
               <table width="100%" id="prdetails" class="table table-bordered"> 
                   <tr style="height: 25px" bgcolor="#2563eb">  
                       <td align="center"><font color="#fff"><b>Quantity</b></font></td> 
                       <td align="center"><font color="#fff"><b>Stock Qty</b></font></td>  
                       <td align="center"><font color="#fff"><b>Batch No</b></font></td>
                       <td align="center"><font color="#fff"><b>Expiry Date</b></font></td>
                       <td align="center" hidden="true"></td> 
                   </tr>
                   <tr class="trhideclass1">
                       <td><input type="text" id="qty1" class="form-control" onchange="chkstocksval(this.value,1)"></td>     
                       <td><input type="text" tabindex="-1" id="stkqty1" class="form-control"></td> 
                       <td><input type="text" tabindex="-1" id="bt1" class="form-control"></td>
                       <td><input type="text" tabindex="-1" id="ed1" class="form-control"></td>
                       <td><input type="hidden" id="stkid1"></td> 
                   </tr>
                   <tr class="trhideclass2">
                       <td><input type="text" id="qty2" class="form-control" onchange="chkstocksval(this.value,2)"></td>    
                       <td><input type="text" tabindex="-1" id="stkqty2" class="form-control"></td>   
                       <td><input type="text" tabindex="-1" id="bt2" class="form-control"></td>
                       <td><input type="text" tabindex="-1" id="ed2" class="form-control"></td>  
                       <td><input type="hidden" id="stkid2"></td> 
                   </tr>
                   <tr class="trhideclass3">
                       <td><input type="text" id="qty3" class="form-control" onchange="chkstocksval(this.value,3)"></td>    
                       <td><input type="text" tabindex="-1" id="stkqty3" class="form-control"></td>    
                       <td><input type="text" tabindex="-1" id="bt3" class="form-control"></td>
                       <td><input type="text" tabindex="-1" id="ed3" class="form-control"></td>  
                       <td><input type="hidden" id="stkid3"></td> 
                   </tr>
                   <tr class="trhideclass4">
                       <td><input type="text" id="qty4" class="form-control" onchange="chkstocksval(this.value,4)"></td>    
                       <td><input type="text" tabindex="-1" id="stkqty4" class="form-control"></td>   
                       <td><input type="text" tabindex="-1" id="bt4" class="form-control"></td>
                       <td><input type="text" tabindex="-1" id="ed4" class="form-control"></td>  
                       <td><input type="hidden" id="stkid4"></td> 
                   </tr>
                   <tr class="trhideclass5">
                       <td><input type="text" id="qty5" class="form-control" onchange="chkstocksval(this.value,5)"></td>   
                       <td><input type="text" tabindex="-1" id="stkqty5" class="form-control"></td>   
                       <td><input type="text" tabindex="-1" id="bt5" class="form-control"></td>
                       <td><input type="text" tabindex="-1" id="ed5" class="form-control"></td>   
                       <td><input type="hidden" id="stkid5"></td> 
                   </tr>
                   <tr class="trhideclass6">
                       <td><input type="text" id="qty6" class="form-control" onchange="chkstocksval(this.value,6)"></td>     
                       <td><input type="text" tabindex="-1" id="stkqty6" class="form-control"></td>  
                       <td><input type="text" tabindex="-1" id="bt6" class="form-control"></td>
                       <td><input type="text" tabindex="-1" id="ed6" class="form-control"></td>  
                       <td><input type="hidden" id="stkid6"></td> 
                   </tr>
                   <tr class="trhideclass7">
                       <td><input type="text" id="qty7" class="form-control" onchange="chkstocksval(this.value,7)"></td>     
                       <td><input type="text" tabindex="-1" id="stkqty7" class="form-control"></td>  
                       <td><input type="text" tabindex="-1" id="bt7" class="form-control"></td>
                       <td><input type="text" tabindex="-1" id="ed7" class="form-control"></td>
                       <td><input type="hidden" id="stkid7"></td> 
                   </tr>
                   <tr class="trhideclass8">
                       <td><input type="text" id="qty8" class="form-control" onchange="chkstocksval(this.value,8)"></td>     
                       <td><input type="text" tabindex="-1" id="stkqty8" class="form-control"></td>   
                       <td><input type="text" tabindex="-1" id="bt8" class="form-control"></td>
                       <td><input type="text" tabindex="-1" id="ed8" class="form-control"></td>
                       <td><input type="hidden" id="stkid8"></td> 
                   </tr>   
                   <tr class="trhideclass9">
                       <td><input type="text" id="qty9" class="form-control" onchange="chkstocksval(this.value,9)"></td>     
                       <td><input type="text" tabindex="-1" id="stkqty9" class="form-control"></td> 
                       <td><input type="text" tabindex="-1" id="bt9" class="form-control"></td>
                       <td><input type="text" tabindex="-1" id="ed9" class="form-control"></td>  
                       <td><input type="hidden" id="stkid9"></td> 
                   </tr>
                   <tr class="trhideclass10">
                       <td><input type="text" id="qty10" class="form-control" onchange="chkstocksval(this.value,10)"></td>    
                       <td><input type="text" tabindex="-1" id="stkqty10" class="form-control"></td>   
                       <td><input type="text" tabindex="-1" id="bt10" class="form-control"></td>
                       <td><input type="text" tabindex="-1" id="ed10" class="form-control"></td>
                       <td><input type="hidden" id="stkid10"></td> 
                   </tr>
                   <tr><td colspan="7" > &nbsp; </td></tr>
                   <tr> 
                       <td colspan="7" align="center" style="display:flex; gap:10px; justify-content:center;"> 
                           <input type="button" name="searchs1" id="searchs1" class="myButton" value="Submit" onclick="chkfocss(1)">
                           <input type="button" name="searchss1" id="searchss1" class="myButton" style="background:#64748b;" value="Close" onclick="closes()">
                       </td>
                   </tr>
               </table>
           </div>
   
           <div id="batchdiv" hidden="true"><jsp:include page="batchdet.jsp"></jsp:include></div> 
          </div>
          <div class="modal-footer">
            <button type="button" id="btnqltyinprcssave" class="btn btn-primary" data-dismiss="modal">Save</button>
            <button type="button" id="downqltyinprocess" class="btn btn-default" data-dismiss="modal">Close</button>
          </div>  
        </div>  
      </div>
    </div>  
      
    <div id="modalgoodsissuenote" class="modal fade" role="dialog">  
      <div class="modal-dialog modal-lg">
        <div class="modal-content">
          <div class="modal-header modalStyle">
            <button type="button" id="upmaterialissue" class="close" data-dismiss="modal">&times;</button>
            <h4 class="modal-title" style="text-align:center">Material Issue Note</h4>
           <h6 class="modal-title" style="text-align:center"><label class="status" id="lblclientstatus6" name="lblclientstatus6"></label></h6>
          </div>
          <div class="modal-body">
           <div style="display:flex; gap:10px; margin-bottom: 10px;">
               <button type="button" id="btnGISload" class="myButton">Load</button>
               <input type="button" id="loads" class="myButton" value="Load Data" onclick="loaddatass()"> 
           </div>
           
           <div id="gisdiv" style="border: 1px solid #ccc;"><jsp:include page="goodsIssueGrid.jsp"></jsp:include></div>
           
           <div id="divname" hidden="true">
               </div>
          </div>
          <div class="modal-footer">
            <button type="button" id="btnGISsave" class="btn btn-primary" data-dismiss="modal">Create MIN</button>
            <button type="button" id="downmaterialissue" class="btn btn-default" data-dismiss="modal">Close</button>
          </div>  
        </div>  
      </div>
    </div>  

    <div id="modalqualityassuarance" class="modal fade" role="dialog">  
      <div class="modal-dialog modal-xl">
        <div class="modal-content">
          <div class="modal-header modalStyle">
            <button type="button" id="upqualityassurance" class="close" data-dismiss="modal">&times;</button>
            <h4 class="modal-title" style="text-align:center">Quality Assuarance</h4> 
            <h6 class="modal-title" style="text-align:center"><label class="status" id="lblclientstatus7" name="lblclientstatus7"></label></h6>     
          </div>
          <div class="modal-body">
           <table width="100%">
           <tr>
               <td width="20%"><button type="button" id="btnload" class="myButton" style="margin-bottom:10px;">Load</button></td>
               <td align="right" width="40%" id="finlabel"><label class="branch" style="margin-right:10px;">Final</label></td>
               <td align="left" width="40%">
                   <input type="checkbox" id="qaid" name="qaid" onclick="$(this).attr('value', this.checked ? 1 : 0)" />
               </td>
           </tr>
           <tr>
               <td colspan="3">
                   <div id="qadiv" style="width:100%; border:1px solid #ccc;"><jsp:include page="qualityAssuaranceGrid.jsp"></jsp:include></div>
                   <div id="qasubdiv" style="width:100%; border:1px solid #ccc;"><jsp:include page="qualitysubGrid.jsp"></jsp:include></div>
                   <div id="qaconfdiv" style="width:100%; border:1px solid #ccc;"><jsp:include page="qualityConfigGrid.jsp"></jsp:include></div>
               </td>
           </tr>
           </table>
          </div>
          <div class="modal-footer">
            <button type="button" id="btnqasave" class="btn btn-primary" data-dismiss="modal">Save</button>
            <button type="button" id="downqualityassurance" class="btn btn-default" data-dismiss="modal">Close</button>
          </div>  
        </div>  
      </div>
    </div>  
      
    <div id="modalproductioncompletion" class="modal fade" role="dialog">  
      <div class="modal-dialog modal-xl">
        <div class="modal-content">
          <div class="modal-header modalStyle">
            <button type="button" id="upproduction" class="close" data-dismiss="modal">&times;</button>
            <h4 class="modal-title" style="text-align:center">Production Completion</h4>   
            <h6 class="modal-title" style="text-align:center"><label class="status" id="lblclientstatus8" name="lblclientstatus8"></label></h6>   
          </div>
          <div class="modal-body">
          <button type="button" id="btnlstgridload" class="myButton" style="margin-bottom:10px;">Load</button>
          
          <div id="productiondiv" style="border: 1px solid #ccc; margin-bottom:15px;"><jsp:include page="productionCompleteGrid.jsp"></jsp:include></div>
          
          <button type="button" id="btnCreateMIR" class="myButton" style="margin-bottom:15px; background-color:#8b5cf6;">Create Material Issue Note Return</button>
          
          <fieldset style="border:1px solid #e1e8ed; padding:15px; border-radius:8px;">
          <h4 style="margin-top:0; font-size:14px; font-weight:600; color:#333;">Production Details</h4>
          <table width="100%" style="border-spacing:0 10px; border-collapse:separate;">
          <tr>
           <td align="left" width="20%"><label class="branch">Generated Product</label><br><input type="text" class="form-control" id="genproduct" name="genproduct" style="width:96%;" /></td>
           <td align="left" width="10%"><label class="branch">Quantity</label><br><input type="text" class="form-control" id="genqty" name="genqty" style="width:96%;" onblur="funRoundAmt(this.value,this.id);" onkeypress="javascript:return isNumber (event);"/></td>
           <td align="left" width="10%" colspan="2"><label class="branch">Uom</label><br><input type="text" class="form-control" id="genuom" name="genuom" style="width:96%;"/></td>
          </tr>
          <tr>
           <td align="left" width="20%"><label class="branch">Std Production Cost</label><br><input type="text" class="form-control" id="stdprodcost" style="width:96%;" name="stdprodcost" onblur="funRoundAmt(this.value,this.id);" onkeypress="javascript:return isNumber (event);" /></td>
           <td align="left" width="10%"><label class="branch">Lumpsum</label><br>
           <input type="checkbox" id="lmpsm" name="lmpsm" onclick="$(this).attr('value', this.checked ? 1 : 0)" />
           </td>
		   <td width="20%" align="left"><label class="branch">Branch</label><br><select class="form-control" id="cmbbranch" onclick="getLocation();" name="cmbbranch" style="width:96%;" value='<s:property value="cmbbranch"/>'><option value="">--Select--</option></select><input type="hidden" id="hidcmbbranch" name="hidcmbbranch" value='<s:property value="hidcmbbranch"/>'/></td>
	       <td align="left" width="20%"><label class="branch">Location</label><br><select class="form-control" id="txtlocation" name="txtlocation" style="width:96%;" value='<s:property value="txtlocation"/>'><option value="">--Select--</option></select><input type="hidden" id="txtlocationid" name="txtlocationid" value='<s:property value="txtlocationid"/>'/></td> 
          </tr>
          </table>
          </fieldset>
          
          </div>
          <div class="modal-footer">
            <button type="button" id="btncompletionsave" class="btn btn-primary" data-dismiss="modal">Save</button>
            <button type="button" id="downproduction" class="btn btn-default" data-dismiss="modal">Close</button>
          </div>  
        </div>  
      </div>
    </div> 
       
    <div id="modalsalesman" class="modal fade" role="dialog">  
      <div class="modal-dialog">
        <div class="modal-content">
          <div class="modal-header modalStyle">
            <button type="button" class="close" data-dismiss="modal">&times;</button>
            <h4 class="modal-title" style="text-align:center">Date Statistics</h4>      
          </div>
          <div class="modal-body">
          <div id="salmdiv" style="border:1px solid #ccc; height:350px;"><jsp:include page="salesmanGrid.jsp"></jsp:include></div>
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
          </div>  
        </div>  
      </div>
    </div>

    <div id="modalclient" class="modal fade" role="dialog">  
      <div class="modal-dialog">
        <div class="modal-content">
          <div class="modal-header modalStyle">
            <button type="button" class="close" data-dismiss="modal">&times;</button>
            <h4 class="modal-title" style="text-align:center">Client Statistics</h4>    
          </div>
          <div class="modal-body">
          <div id="crmdiv" style="border:1px solid #ccc; height:350px;"><jsp:include page="clientGrid.jsp"></jsp:include></div>
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
          </div>  
        </div>  
      </div>
    </div>
    
    <div id="modalworkorderlog" class="modal fade" role="dialog">  
      <div class="modal-dialog">
        <div class="modal-content">
          <div class="modal-header modalStyle">
            <button type="button" class="close" data-dismiss="modal">&times;</button>
            <h4 class="modal-title" style="text-align:center">Workorder Log</h4>  
            <h6 class="modal-title" style="text-align:center"><label class="status" id="lblclientstatus9" name="lblclientstatus9"></label></h6>  
          </div>
          <div class="modal-body">
          <div id="wrkdiv" style="border:1px solid #ccc; height:350px;"><jsp:include page="workOrderLogGrid.jsp"></jsp:include></div>
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
          </div>  
        </div>  
      </div>
    </div>
    
    <div id="sidesearchwndow">
	   <div></div>
	</div>

   <div>    
       <input type="hidden" name="hidbrhid" id="hidbrhid">  
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
       <input type="hidden" name="rowindexg" id="rowindexg">
       <input type="hidden" name="prdname" id="prdname">
       <input type="hidden" name="hidsordoc" id="hidsordoc">
       <input type="hidden" name="hidDept" id="hidDept">
       <input type="hidden" name="hidqltychk" id="hidqltychk">
       <input type="hidden" name="hidsorddoc" id="hidsorddoc">
       <input type="hidden" name="hidmnpsrno" id="hidmnpsrno">
   </div>
</div>		

<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@7.24.4/dist/sweetalert2.all.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.6-rc.0/js/select2.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/js-cookie@2/src/js.cookie.min.js"></script>
<script type="text/javascript">   
    $(document).ready(function(){ 
    	getQualityConfig();
    $('[data-tooltip="tooltip"]').tooltip();
    $('#sidesearchwndow').jqxWindow({ width: '55%', height: '92%',  maxHeight: '85%' ,maxWidth: '80%' ,title: 'Product Search ' , position: { x: 300, y: 0 }, keyboardCloseKey: 27});
    $('#sidesearchwndow').jqxWindow('close');
    $("#batchdate").jqxDateTimeInput({ width: '100%', height: '24px', formatString:"dd.MM.yyyy"});
    $("#batchtime").jqxDateTimeInput({ width: '100%', height: '24px', formatString: 'HH:mm', showCalendarButton: false ,value: new Date()});
    $("#startdate").jqxDateTimeInput({ width: '100%', height: '24px', formatString: 'HH:mm', showCalendarButton: false ,value: new Date()});
    $("#enddate").jqxDateTimeInput({ width: '100%', height: '24px', formatString: 'HH:mm', showCalendarButton: false ,value: new Date()});
    	 $("body").prepend('<div id="overlay" class="ui-widget-overlay" style="z-index: 1000; display: none;"></div>');
	     $("body").prepend("<div id='PleaseWait' style='display: none;position:absolute; z-index: 1001;top:50%;left:50%;transform:translate(-50%,-50%);'><img src='../../../../icons/31load.gif'/></div>");
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
        	 $('#productdiv').load("productGrid.jsp?id="+1);  
        	 $('#salmdiv').load('salesmanGrid.jsp?id='+1);   
             $('#crmdiv').load('clientGrid.jsp?id='+1); 
        });          
        $('#btnexcel').click(function(){         
        });
        $('#btnblensheetprint').click(function(){        
        	  funPrintBlendsheet(); 
        	
          });
        $('#btncertificateanalysisprint').click(function(){        
        	funPrintCertificate(); 
      	
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
        $('#upqltyinprocess').click(function(){        
        	funclose();     
           
         });
        $('#downqltyinprocess').click(function(){        
        	funclose();     
           
         });
        $('#btnqltyinprcssave').click(function(){        
        	 funqualityinprocesssave();     
            
          });
        $('#btnstartsave').click(function(){        
   	      var mark="start";
   	           funMarking(mark);       
          
        });
        $('#btnqualityinprocessload').click(function(){        
     	    funQualityinProcess();   
            
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
$('#btnGISsave').click(function(){        
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
$('#btnCreateMIR').click(function(){        
	funCreateMIR();
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
   
    function getQualityConfig(){
		var x = new XMLHttpRequest();
		x.onreadystatechange = function() {
			if (x.readyState == 4 && x.status == 200) {
				 var items= x.responseText.trim();
			       if(parseFloat(items)==1){
			    	   $('#finlabel').hide();
			    	   $('#qaid').hide();
			    	   $('#qadiv').hide();
			       	$('#qasubdiv').hide();
			       	$('#qaconfdiv').show(); 
			       	$('#hidqltychk').val("1");
			      }else{
			    	  $('#finlabel').show();
			    	  $('#qaid').show();
			    	   $('#qadiv').show();
			       	$('#qasubdiv').hide();
			       	$('#qaconfdiv').hide();
			    	$('#hidqltychk').val("0");
			      } 
			}}
		   x.open("GET","getqualityconfig.jsp",true);
			x.send();
	}
    
    function productSearchContent(url) {
      		 $.get(url).done(function (data) {
      			 $('#sidesearchwndow').jqxWindow('open');
      		     $('#sidesearchwndow').jqxWindow('setContent', data);
      	}); 
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

   	var workno=$('#hidworkno').val();
		if(workno==0){
			$("#overlay, #PleaseWait").hide();
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
			}
			x.open("GET","saveComment.jsp?comment="+encodeURIComponent($('#hidcomments').val())+"&enqno="+workno,true);
			x.send();
    }
    function getComments(){
    	var rows = $("#jqxpdpGrid").jqxGrid('getrows');
    	var workno=$('#hidworkno').val();

		if(workno==0){
			$("#overlay, #PleaseWait").hide();
			return false;
		}
		
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
			}
			x.open("GET","getComments.jsp?enqno="+workno,true);
			x.send(); 
    }
    
    function funPrintBlendsheet(){
    	    var url=document.URL;
	        var reurl=url.split("productplaning.jsp");
	        var pdesc=$('#hidgenproduct').val();
	        var puom=$('#hidgenuom').val();
	        var totqty=$('#batchqty').val();
	        var batchno=$('#hidbatchno').val();
	        var bsheetno=$('#hidblendsheetno').val();
	        var sordoc=$('#hidsordoc').val();
	        var dept=$('#hidDept').val();
	        var psrno=$('#hidmnpsrno').val();
	        var win= window.open(reurl[0]+"printBlendingSheet?product="+pdesc+"&totalqty="+totqty+"&batchno="+batchno+"&blendsheetno="+bsheetno+"&sordoc="+sordoc+"&department="+dept+"&uom="+puom+"&psrno="+psrno,"_blank","top=150,left=250,Width=1020,Height=500,location=no,scrollbars=no,toolbar=yes");
	        win.focus();
    }
    
    function funPrintCertificate(){
    	 var url=document.URL;
	        var reurl=url.split("productplaning.jsp");
	        var pdesc=$('#hidgenproduct').val();
	        var puom=$('#hidgenuom').val();
	        var workno=$('#hidworkno').val();
	        var batchno=$('#hidbatchno').val();
	        var psrno=$('#hidpsrno').val();
	        var sordoc=$('#hidsordoc').val();
	        var dept=$('#hidDept').val();
	        
	        var win= window.open(reurl[0]+"printCertificate?product="+pdesc+"&workno="+workno+"&batchno="+batchno+"&psrno="+psrno,"_blank","top=150,left=250,Width=1020,Height=500,location=no,scrollbars=no,toolbar=yes");
	        win.focus();
    }
    function funclose(){
    	$("#jqxqltyprcsGrid").jqxGrid('clear');
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
    }
    
    function funQualitySave(){
    	var rows="0",chkrowlength=0;
    	var workno=$('#hidworkno').val();
    	
    	var temp=$('#qaid').val();
    	var temp2=$('#hidqltychk').val();
   	    var psrno=$('#hidpsrno').val();
    	if(parseInt(temp2)==1){
    		 $("#jqxqacnfGrid").jqxGrid('clearfilters',true);
    		rows = $("#jqxqacnfGrid").jqxGrid('getrows');
    		var selectedrows=$("#jqxqacnfGrid").jqxGrid('selectedrowindexes');
    		chkrowlength=selectedrows.length;
    	}
    	else{
	    	if(parseInt(temp)==1){
	    		 $("#qasubGrid").jqxGrid('clearfilters',true);
	    		 rows = $("#qasubGrid").jqxGrid('getrows');
	    	}
	    	else{
	    		$("#qaGrid").jqxGrid('clearfilters',true);
	    		 rows = $("#qaGrid").jqxGrid('getrows');
	    	}
	    	chkrowlength=rows.length;
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
			var i=0;var temptrno="";           
			var j=0;
			var tmpcount=rows.length;
			var blndArray=new Array();
			for (i = 0; i < chkrowlength; i++) {
            
            var chkval="0",confchk="0";
            if(parseInt(temp2)==1){
            	confchk=selectedrows[i];
            	chkval =rows[confchk].qlno ;
            }
            else{
	            if(parseInt(temp)==1){
	            	chkval =rows[i].tstid ;
		       	}
		       	else{
		       		chkval =rows[i].prid ;
		       	}
            }
            if(!(typeof(chkval)==="undefined" || chkval==null || chkval=="")){
            	  if(parseInt(temp2)==1){
            		  blndArray.push(rows[confchk].qlno+" :: "+rows[confchk].spec+" :: "+rows[confchk].testres+" :: "+workno+" :: "+psrno+" :: ");
            	  }
            	  else{
		            	 if(parseInt(temp)==1){
		            		 blndArray.push(rows[i].tstid+" :: "+rows[i].desc1+" :: "+rows[i].testmethod+" :: "+rows[i].limit+" :: "+workno+" :: ");
		     	       	}
		     	       	else{
		     	       	     blndArray.push(rows[i].prid+" :: "+rows[i].desc+" :: "+rows[i].testmethod+" :: "+rows[i].limit+" :: "+workno+" :: ");
		     	       	}
            	  }
            }
				
			}
			savequality(blndArray);
			}
			});
    }
    
    function funpreproductiontest(){
    	var workno=$('#hidworkno').val();
    	$("#jqxpreProdGrid").jqxGrid('clearfilters',true);
    	var rows = $("#jqxpreProdGrid").jqxGrid('getrows');
    	var blndno=$('#hidblendsheetno').val();
    	
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
            if(!(typeof(chkpsrno)==="undefined" || chkpsrno==null || chkpsrno=="")){
                       
            	blndArray.push(rows[i].psrno+" :: "+rows[i].uomid+" :: "+rows[i].qty+" :: "+workno+" :: "+rows[i].qtykg+" :: "+rows[i].stdper+" :: ");
            }
				
			}
			saveblendingsheet(blndArray);
			}
			});
    }
    
    function  savequality(blndArray){
    	var workno=$('#hidworkno').val();
   	 var psrno=$('#hidpsrno').val();
   	var temp2=$('#hidqltychk').val();
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
    x.open("GET","saveQuality.jsp?productarray="+blndArray+"&workno="+workno+"&psrno="+psrno+"&qltychk="+temp2,true);			
  	x.send();
    
    }
    
    function saveblendingsheet(blndArray){
    	var workno=$('#hidworkno').val();
    	 var psrno=$('#hidpsrno').val();
    	 var blndno=$('#hidblendsheetno').val();
     	
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
    function 	funQualityinProcess(){
   	 var psrno=$('#hidpsrno').val();
   	 var blndno=$('#hidblendsheetno').val();
   	 var qty=$('#batchqty').val();
   	 var workno=$('#hidworkno').val();
   	$('#qltyprcsdiv').load("qualityInProcessGrid.jsp?id="+1+"&docno="+workno);
   	
   }
    function 	funpreprodload(){
    	 var psrno=$('#hidpsrno').val();
    	 var blndno=$('#hidblendsheetno').val();
    	 var qty=$('#batchqty').val();
    	 var workno=$('#hidworkno').val();
    	$('#preproddiv').load("preProductionGrid.jsp?id="+1+"&docno="+psrno+"&wqty="+qty+"&wono="+workno);
    	
    }
    function funloadbom(){
    	var workno=$('#hidworkno').val();
    	var qty=$('#batchqty').val();
    	var blndno=$('#hidblendsheetno').val();
    	$('#bomdiv').load("bomGrid.jsp?id="+1+"&docno="+workno+"&cond="+2+"&wqty="+qty+"&blndno="+blndno);
    }
    function funloadmaterial(){
    	var workno=$('#hidworkno').val();
    	var blndno=$('#hidblendsheetno').val();
    	var mrno=$('#hidmaterialrequestno').val();
    	if(parseInt(mrno)>0){
    		$.messager.alert('Warning','Material Request Already Created.');
    		return false;
    	}
    	$('#materialreqdiv').load("materialRequestGrid.jsp?id="+1+"&docno="+workno+"&blndno="+blndno);
    }
    
    function funLoadCompleteGrid(){
    	var trno=$('#hidcomptrno').val();
    	var gis=$('#hidworkno').val();
    	if(parseInt(trno)>0){
    		$.messager.alert('Warning','Production Already Completed.');
    		return false;
    	}
    	if(parseInt(gis)==0){
    		$.messager.alert('Warning','Production Cycle Not Completed.');
    		return false;
    	}
    	else{
    		$('#genproduct').val($('#hidgenproduct').val());
    		$('#genqty').val($('#hidgenqty').val());
    		$('#genuom').val($('#hidgenuom').val());
    		$('#productiondiv').load("productionCompleteGrid.jsp?id="+1+"&docno="+gis);
    	}
    	
    }
    
    function funloadGIS(){
    	var workno=$('#hidworkno').val();
    	var mrno=$('#hidmaterialrequestno').val();
    	var gisno=$('#hidgisno').val();
    	var blndno=$('#hidblendsheetno').val();
    	var cond=0;
    	if(parseInt(gisno)>0){
    		$.messager.alert('Warning','MIN Already Created.');
			return false;
    	}
    	if(parseInt(mrno)>0){
    		workno=mrno;
    		cond=1;
    	}
    	$('#gisdiv').load("goodsIssueGrid.jsp?id="+1+"&docno="+workno+"&cond="+cond+"&blndno="+blndno);
    }
    function funGISsave(){
    	var workno=$('#hidworkno').val();
    	  $('#jqxgisGrid').jqxGrid('clearfilters', true);    
    	var rows = $("#jqxgisGrid").jqxGrid('getrows');
    	var gisno=$('#hidgisno').val();
    	
    	if(parseInt(gisno)>0){
    		$.messager.alert('Warning','MIN Already Created.');
			return false;
    	}
		if(rows.length==0){
			$("#overlay, #PleaseWait").hide();
			$.messager.alert('Warning','Select documents.');
			return false;
		}
		$.messager.confirm('Message', 'Do you want to create MIN?', function(r){
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
			for (i = 0; i < rows.length; i++) {
            
            var chkpsrno=rows[i].psrno;
            if(!(typeof(chkpsrno)==="undefined" || chkpsrno==null || chkpsrno=="")){
            	
            	blndArray.push(rows[i].psrno+" :: "+rows[i].psrno+" :: "+rows[i].uomid+" :: "+rows[i].qty.toFixed(2)+" :: "+"0"+" :: "+"0"+" :: "+rows[i].specid+" :: "+"0"+" :: "+"0"+" :: "+"0"+" :: "+rows[i].stockid+" :: "+"0"+" :: ");
            }
				
			}
			saveGIS(blndArray);
				
			}
			});
    }
    
    function funqualityinprocesssave(){
    	var workno=$('#hidworkno').val();
    	$('#jqxqltyprcsGrid').jqxGrid('clearfilters', true);  
    	var rows = $("#jqxqltyprcsGrid").jqxGrid('getrows');
    	var gisno=$('#hidgisno').val();
    	
    
		if(rows.length==0){
			$("#overlay, #PleaseWait").hide();
			$.messager.alert('Warning','Select documents.');
			return false;
		}
		$.messager.confirm('Message', 'Do you want to create MIN?', function(r){
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
			for (i = 0; i < rows.length; i++) {
            
            var issqty=rows[i].tobeissued;
            if(!(typeof(issqty)==="undefined" || issqty==null || issqty=="")){
            	
            	blndArray.push(rows[i].psrno+" :: "+rows[i].psrno+" :: "+rows[i].uomid+" :: "+rows[i].tobeissued.toFixed(2)+" :: "+"0"+" :: "+"0"+" :: "+rows[i].specid+" :: "+"0"+" :: "+"0"+" :: "+"0"+" :: "+rows[i].stockid+" :: "+"0"+" :: ");
            }
				
			}
			saveGIS(blndArray);
				
			}
			});
    }
    
    function funCreateMIR(){
        var workno=$('#hidworkno').val();
        $('#jqxproductionGrid').jqxGrid('clearfilters', true);  
        var gis=$('#hidgisno').val();
    	var rows = $("#jqxproductionGrid").jqxGrid('getrows');
    	var gisno=$('#hidgisno').val();
    	
    	 if(parseInt(gisno)==0){
    		$.messager.alert('Warning','MIN Not Created.');
			return false;
    	} 
		if(rows.length==0){
			$("#overlay, #PleaseWait").hide();
			$.messager.alert('Warning','Select documents.');
			return false;
		}
		$.messager.confirm('Message', 'Do you want to create MIR?', function(r){
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
			for (i = 0; i < rows.length; i++) {
            
            var chkpsrno=rows[i].psrno;
            var chkqty=rows[i].retqty;
            if(!(typeof(chkpsrno)==="undefined" || chkpsrno==null || chkpsrno=="")){
            	if(parseInt(chkqty)>0){
            	blndArray.push(rows[i].psrno+" :: "+rows[i].psrno+" :: "+rows[i].uomid+" :: "+rows[i].retqty.toFixed(2)+" :: "+"0"+" :: "+"0"+" :: "+rows[i].specid+" :: "+"0"+" :: "+"0"+" :: "+"0"+" :: "+"0"+" :: "+gis+" :: "+"0"+" :: "+rows[i].batch_no)
            	}             
            }
				
			}
			saveMIR(blndArray);
				
			}
			});
    }
    
    function saveMIR(blndArray){
    	var workno=$('#hidworkno').val();
    	var batch=$('#hidbatchno').val();
   	 var psrno=$('#hidpsrno').val();
   	 var min=$('#hidgisno').val();
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
  						$.messager.alert('Message', '  Material Issue Note Return'+aa+' Successfully Created ');
  						funLoadCompleteGrid();
  				}
  				else
  				{
  					$("#overlay, #PleaseWait").hide();
  				$.messager.alert('Message', '  Not Created  ');
  				 funclose();
  				}
  				}
  		}
    x.open("GET","saveMIR.jsp?productarray="+blndArray+"&workno="+workno+"&psrno="+psrno+"&batch="+batch+"&min="+min,true);			
  	x.send();
    	
    }
    
    function saveGIS(blndArray){
    	var workno=$('#hidworkno').val();
    	var sorddoc=$('#hidsorddoc').val();
    	var batch=$('#hidbatchno').val();
   	 var psrno=$('#hidpsrno').val();
   	 var x=new XMLHttpRequest();
  		x.onreadystatechange=function(){
  		if (x.readyState==4 && x.status==200){
  	     			
  				var items=x.responseText;
  				 var item = items.split('::');
  				 var method=item[0].trim();
  			      
  			      var aa=item[1].trim();
  			    var dd=item[2].trim();
  			  var name=item[3].trim();
  				if(parseInt(method)>0)  
  				{	
  					$("#overlay, #PleaseWait").hide();
  					if(parseInt(method)==2){
  						$.messager.alert('Message', ' Product -'+name+'- Not In Stock ');
  					}else{
  						$('#hidgisno').val(dd);
  						$.messager.alert('Message', '  Material Issue Note '+aa+' Successfully Created ');
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
    x.open("GET","saveGIS.jsp?productarray="+blndArray+"&workno="+workno+"&psrno="+psrno+"&batch="+batch+"&sorddoc="+sorddoc,true);			
  	x.send();
    }
    
    function funmaterialreqsave(){
    	var workno=$('#hidworkno').val();
    	 $('#jqxmaterialGrid').jqxGrid('clearfilters', true);  
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
			var i=0;var temptrno="";           
			var j=0;
			var tmpcount=rows.length;
			var blndArray=new Array();
			for (i = 0; i < rows.length; i++) {
            
            var chkpsrno=rows[i].psrno;
            if(!(typeof(chkpsrno)==="undefined" || chkpsrno==null || chkpsrno=="")){
            	
            	blndArray.push(rows[i].psrno+" :: "+rows[i].psrno+" :: "+rows[i].uomid+" :: "+rows[i].qty.toFixed(2)+" :: "+"0"+" :: "+"0"+" :: "+rows[i].specid+" :: "+"0"+" :: "+"0"+" :: "+"0"+" :: " );
            }
				
			}
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
    	getBranch();
    	getLocation();
    	var workno=$('#hidworkno').val();
    	   var psrno=$('#hidpsrno').val();
    	   var lmpsmchk=$('#lmpsm').val();
    	   var dtype="";
    	   var uomid=$('#hidgenuomid').val();
    	   var specid=$('#hidgenspecid').val();
    	   var qty=$('#hidgenqty').val();
    	   var batch=$('#hidbatchno').val();
    	   var prdcost=$('#stdprodcost').val();
    	   var trno=$('#hidcomptrno').val();
    	   var branch=$('#cmbbranch').val();
    	   var locm=$('#txtlocation').val();
    	   var sorddoc=$('#hidsorddoc').val();
       	 if(parseInt(trno)>0){
       		$.messager.alert('Warning','Production Already Completed.');
       		return false;
       	}
    	if(workno==""){
			$.messager.alert('Warning','Select a document.');
			return false;
	   }
    	if(branch==""){
			$.messager.alert('Warning','Select a Branch.');
			return false;
	   }
    	$.messager.confirm('Message', 'Do you want to complete production?', function(r){
			if(r==false)
			{
			return false; 
			}
			else
			{
				$("#overlay, #PleaseWait").show();
    	 var x=new XMLHttpRequest();
 		x.onreadystatechange=function(){
 		if (x.readyState==4 && x.status==200){
 	     			
 				var items=x.responseText.trim();
 				if(parseInt(items)>0)  
 				{	
 					$("#overlay, #PleaseWait").hide();
 				$.messager.alert('Message', ' Production Completed Successfully ');
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
   x.open("POST","productioncomplete.jsp?workno="+workno+"&branch="+branch+"&location="+locm+"&prdcost="+prdcost+"&batch="+batch+"&qty="+qty+"&uomid="+uomid+"&specid="+specid+"&psrno="+psrno+"&lmpsmchk="+lmpsmchk+"&sorddoc="+sorddoc,true);			
 	x.send();
			}
    	}); 
    }
    	
    
    
    function addGridFilters(id,filtervalue,datafield,filtertype,filtercondition){   
    	var filtergroup = new $.jqx.filter();
    	var filter_or_operator = 1;
	    	var filter1 = filtergroup.createfilter(filtertype, filtervalue, filtercondition);
	
	    	filtergroup.addfilter(filter_or_operator, filter1);
	    	$("#jqxsapGrid").jqxGrid('addfilter', datafield, filtergroup);
	    	$("#jqxsapGrid").jqxGrid('applyfilters');     
    	
 	}
    function isNumber(evt) {
        var iKeyCode = (evt.which) ? evt.which : evt.keyCode
        if (iKeyCode != 46 && iKeyCode >> 31 && (iKeyCode << 48 || iKeyCode >> 57))
        	{
            return false;
        	}
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
    	var qlty=$('#hidqltychk').val();
    	if(parseInt(qlty)==1){
    		 $('#qaconfdiv').load("qualityConfigGrid.jsp?id="+finalval+"&docno="+psrno+"&chk="+1);
    	}
    	else{
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
		 
    }
    
   function funMarking(mark){
	   var psrno=$('#hidpsrno').val();
	   var workno=$('#hidworkno').val();
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
  x.open("GET","markingupdate.jsp?psrno="+psrno+"&mark="+mark+"&markdate="+markdate+"&workno="+workno,true);			
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
				items = items.split('####');
				
				var branchIdItems  = items[0].split(",");
				var branchItems = items[1].split(",");
				var perm = items[2];  
				var optionsbranch;
				for (var i = 0; i < branchItems.length; i++) {
					optionsbranch += '<option value="' + branchIdItems[i].trim() + '">'
							+ branchItems[i] + '</option>';
				}
				$("select#cmbbranch").html(optionsbranch);
			} else {
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
				items = items.split('####');
				
				var branchIdItems  = items[0].split(",");
				var branchItems = items[1].split(",");
				var perm = items[2];  
				var optionsbranch;
				for (var i = 0; i < branchItems.length; i++) {
					optionsbranch += '<option value="' + branchIdItems[i].trim() + '">'
							+ branchItems[i] + '</option>';
				}
				$("select#txtlocation").html(optionsbranch);
			} else {
			}  
		}
		x.open("GET","searchlocation.jsp?branch="+brhid, true);
		x.send();   
	}
	 function funAttachs(event){                            
			var brchid="<%= session.getAttribute("BRANCHID").toString() %>";
			var rows = $("#jqxpdpGrid").jqxGrid('getrows');
			 var workno=$('#hidworkno').val();
			
			if(rows.length==0){
				$("#overlay, #PleaseWait").hide();
				$.messager.alert('Warning','Select a document.');
				return false;
			}

			    var workno=$('#hidworkno').val();
				var frmdet="";
	   			var fname="";
			
					frmdet="MNF";
					fname="Product Planning";
				
	   		    var  myWindow= window.open("<%=contextPath%>/com/common/Attachmaster.jsp?formCode="+frmdet+"&docno="+workno+"&brchid="+brchid+"&frmname="+fname,"_blank","top=180,left=310,Width=800,Height=430,location=no,scrollbars=no,toolbar=no,resizable=no,meanubar=no,titlebar=no");
					 myWindow.focus();  
			  
	                
		   } 
   function funbom()
   {
   	var doc=$('#hidbomdoc').val();
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
		 document.getElementById("stkqty1").value="";
		 document.getElementById("bt1").value="";
		 document.getElementById("ed1").value="";
		 document.getElementById("stkid1").value="";
		 document.getElementById("dsc1").value="";
		 
		 document.getElementById("qty2").value="";
		 document.getElementById("stkqty2").value="";
		 document.getElementById("bt2").value="";
		 document.getElementById("ed2").value="";
		 document.getElementById("stkid2").value="";
		 document.getElementById("dsc2").value="";
		 
		 document.getElementById("qty3").value="";
		 document.getElementById("stkqty3").value="";
		 document.getElementById("bt3").value="";
		 document.getElementById("ed3").value="";
		 document.getElementById("stkid3").value="";
		 document.getElementById("dsc3").value="";
		 
		 document.getElementById("qty4").value="";
		 document.getElementById("stkqty4").value="";
		 document.getElementById("bt4").value="";
		 document.getElementById("ed4").value="";
		 document.getElementById("stkid4").value="";
		 document.getElementById("dsc4").value="";
		 
		 
		 document.getElementById("qty5").value="";
		 document.getElementById("stkqty5").value="";
		 document.getElementById("bt5").value="";
		 document.getElementById("ed5").value="";
		 document.getElementById("stkid5").value="";
		 document.getElementById("dsc5").value="";
		 
		 
		 document.getElementById("qty6").value="";
		 document.getElementById("stkqty6").value="";
		 document.getElementById("bt6").value="";
		 document.getElementById("ed6").value="";
		 document.getElementById("stkid6").value="";
		 document.getElementById("dsc6").value="";
		 
		 
		 document.getElementById("qty7").value="";
		 document.getElementById("stkqty7").value="";
		 document.getElementById("bt7").value="";
		 document.getElementById("ed7").value="";
		 document.getElementById("stkid7").value="";
		 document.getElementById("dsc7").value="";
		 
		 
		 document.getElementById("qty8").value="";
		 document.getElementById("stkqty8").value="";
		 document.getElementById("bt8").value="";
		 document.getElementById("ed8").value="";
		 document.getElementById("stkid8").value="";
		 document.getElementById("dsc8").value="";
		 
		 
		 
		 document.getElementById("qty9").value="";
		 document.getElementById("stkqty9").value="";
		 document.getElementById("bt9").value="";
		 document.getElementById("ed9").value="";
		 document.getElementById("stkid9").value="";
		 document.getElementById("dsc9").value="";
		 
		 
		 document.getElementById("qty10").value="";
		 document.getElementById("stkqty10").value="";
		 document.getElementById("bt10").value="";
		 document.getElementById("ed10").value="";
		 document.getElementById("stkid10").value="";
		 document.getElementById("dsc10").value="";
		 
		 
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
  	  
         }
     		$('#divname').show();
     
    		 document.getElementById("qty1").focus();
			 }
	 
	 function clearprd()
		{
			
			$("#batgrid").jqxGrid('clear'); 
			 document.getElementById("qty1").value="";
			 document.getElementById("stkqty1").value="";
			 document.getElementById("bt1").value="";
			 document.getElementById("ed1").value="";
			 document.getElementById("stkid1").value="";
			 document.getElementById("dsc1").value="";
			 
			 document.getElementById("qty2").value="";
			 document.getElementById("stkqty2").value="";
			 document.getElementById("bt2").value="";
			 document.getElementById("ed2").value="";
			 document.getElementById("stkid2").value="";
			 document.getElementById("dsc2").value="";
			 
			 document.getElementById("qty3").value="";
			 document.getElementById("stkqty3").value="";
			 document.getElementById("bt3").value="";
			 document.getElementById("ed3").value="";
			 document.getElementById("stkid3").value="";
			 document.getElementById("dsc3").value="";
			 
			 document.getElementById("qty4").value="";
			 document.getElementById("stkqty4").value="";
			 document.getElementById("bt4").value="";
			 document.getElementById("ed4").value="";
			 document.getElementById("stkid4").value="";
			 document.getElementById("dsc4").value="";
			 
			 
			 document.getElementById("qty5").value="";
			 document.getElementById("stkqty5").value="";
			 document.getElementById("bt5").value="";
			 document.getElementById("ed5").value="";
			 document.getElementById("stkid5").value="";
			 document.getElementById("dsc5").value="";
			 
			 
			 document.getElementById("qty6").value="";
			 document.getElementById("stkqty6").value="";
			 document.getElementById("bt6").value="";
			 document.getElementById("ed6").value="";
			 document.getElementById("stkid6").value="";
			 document.getElementById("dsc6").value="";
			 
			 
			 document.getElementById("qty7").value="";
			 document.getElementById("stkqty7").value="";
			 document.getElementById("bt7").value="";
			 document.getElementById("ed7").value="";
			 document.getElementById("stkid7").value="";
			 document.getElementById("dsc7").value="";
			 
			 
			 document.getElementById("qty8").value="";
			 document.getElementById("stkqty8").value="";
			 document.getElementById("bt8").value="";
			 document.getElementById("ed8").value="";
			 document.getElementById("stkid8").value="";
			 document.getElementById("dsc8").value="";
			 
			 
			 
			 document.getElementById("qty9").value="";
			 document.getElementById("stkqty9").value="";
			 document.getElementById("bt9").value="";
			 document.getElementById("ed9").value="";
			 document.getElementById("stkid9").value="";
			 document.getElementById("dsc9").value="";
			 
			 
			 document.getElementById("qty10").value="";
			 document.getElementById("stkqty10").value="";
			 document.getElementById("bt10").value="";
			 document.getElementById("ed10").value="";
			 document.getElementById("stkid10").value="";
			 document.getElementById("dsc10").value="";
			 
			
		}
	 
	 function chkstocksval(value,tf)
		{
			if(parseFloat(value)>0)
				{
				  var id5="qty"+tf;
	       	 
	       	   var id7="stkqty"+tf;
				var qty=0;
				var foc=0;
	       	if(parseFloat(document.getElementById(""+id5).value)>0)
			   {
	       		qty=document.getElementById(""+id5).value;
			   }
	       	
	     	if(parseFloat(document.getElementById(""+id7).value)<(parseFloat(qty)))
	     		{
	     		document.getElementById(""+id5).value=0;
	     		document.getElementById(""+id5).focus();
	     		return 0;
	     		}
	     	else
	     		{
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
 	   var id7="bt"+ss;
 	   var id8="ed"+ss;
 	   var id9="stkid"+ss;
 	   
 	   if(parseFloat(document.getElementById(""+id5).value)>0)
 		   {
 		   totqty=parseFloat(totqty)+parseFloat(document.getElementById(""+id5).value);
 		   
 		   
 		   aa=document.getElementById(""+id5).value;
 		   }
 	   
 	   
 	   if(parseFloat(document.getElementById(""+id5).value)>0 )
 		   {
 		   temp=temp+document.getElementById(""+id7).value+" @@ "+aa+" @@ "+bb+" @@ "+document.getElementById(""+id8).value+" @@@ ";
 		   }
		   if(!document.getElementById(""+id7).value=="")
		   {
			   stkid=stkid+document.getElementById(""+id7).value+" @@ "+document.getElementById(""+id5).value+" @@@ ";
			   
		   }
 	   
 	  
       }
    
   
    
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