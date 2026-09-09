<jsp:include page="../../../../includes.jsp"></jsp:include>    
<%@ taglib prefix="s" uri="/struts-tags" %>
<%
	String contextPath=request.getContextPath();
 %>
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
<link href="https://fonts.googleapis.com/css?family=Rubik" rel="stylesheet" />
<jsp:include page="../../../../floorMgmtIncludes.jsp"></jsp:include> 

<style type="text/css"> 
/* ===== MASTER LAYOUT (Modern Flexbox) ===== */
html, body {
    height: 100%;
    margin: 0;
    overflow: hidden;
    background-color: #f4f7f9;
}

#mainBG {
    flex: 1;
    display: flex;
    height: 100%;
    overflow: hidden;
}

.master-container {
    display: flex;
    width: 100%;
    height: 100%;
    font-family: 'Segoe UI', 'Roboto', 'Arial', sans-serif;
}

/* ===== LEFT SIDEBAR (Actions & Tools) ===== */
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

.filter-card {
    background: #f8fafc;
    border: 1px solid #e3e8ee;
    border-radius: 12px;
    padding: 15px;
    margin-bottom: 12px;
}

/* Tables */
.release-filter-table {
    width: 100%;
    border-spacing: 0 10px;
}

.release-filter-table .label-cell {
    text-align: right;
    padding-right: 10px;
    font-size: 12px;
    color: #4e5e71;
    font-weight: 600;
    width: 80px;
}

/* ===== UNIFORM 24px INPUTS & SELECTS ===== */
input[type="text"], input[type="number"], select,
.release-filter-table input[type="text"],
.release-filter-table input[type="number"],
.release-filter-table select {
    width: 100%;
    height: 24px;              
    padding: 2px 8px;          
    border: 1px solid #ccd6e0;
    border-radius: 4px;        
    font-size: 12px;          
    background-color: #ffffff;
    box-sizing: border-box;
    color: #333;
}

/* Readonly / disabled look */
input[readonly],
input:disabled,
select:disabled,
.release-filter-table input[readonly],
.release-filter-table input:disabled,
.release-filter-table select:disabled {
    background-color: #f3f6f9 !important;
    color: #555;
    border-color: #e1e8ed;
}

/* jqx date/time containers */
.release-filter-table div[id^="fromdate"],
.release-filter-table div[id^="todate"] {
    width: 100%;
}

.radio-group {
    display: flex;
    flex-wrap: wrap;
    gap: 10px;
    align-items: center;
    justify-content: center;
    font-size: 12px;
    color: #333;
    padding: 2px 0;
}

.radio-group label {
    display: flex;
    align-items: center;
    cursor: pointer;
    margin: 0;
}
.radio-group input[type="radio"] {
    margin-right: 4px;
}

/* ===== MODERN TOP ACTION BAR ===== */
.top-action-bar {
    display: flex;
    flex-wrap: wrap;
    gap: 10px;
    align-items: center;
    background: #f8fafc;
    border: 1px solid #e3e8ee;
    border-radius: 8px;
    padding: 12px 15px;
    margin: 5px 0 15px 0;
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

.action-divider {
    width: 1px;
    height: 24px;
    background-color: #ccd6e0;
    margin: 0 5px;
}

.radio-group-modern {
    display: flex;
    gap: 15px;
    align-items: center;
    font-size: 13px;
    font-weight: 600;
    color: #333;
}

.radio-group-modern label {
    display: flex;
    align-items: center;
    cursor: pointer;
    margin: 0;
}

.radio-group-modern input[type="radio"] {
    margin: 0 6px 0 0;
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
}

.btn-update-green {
    display: inline-flex;
    align-items: center;
    gap: 6px;
    background-color: #10b981;
    color: #fff;
    border: none;
    padding: 6px 16px;
    font-size: 13px;
    font-weight: 600;
    border-radius: 6px;
    cursor: pointer;
    transition: background 0.2s;
}

.btn-update-green:hover {
    background-color: #059669;
}

/* Sidebar Submit buttons */
.btn-submit {
    width: 100%;
    height: 30px;            
    padding: 0 12px;         
    background: #2563eb;
    color: #fff;
    border: none;
    border-radius: 4px;      
    font-size: 13px;
    font-weight: 600;
    cursor: pointer;
    line-height: 30px;       
    transition: background 0.2s;
    margin-bottom: 5px;
}

.btn-submit:hover {
    background: #1d4ed8;
}

/* ===== RIGHT CONTENT AREA ===== */
.main-content-area {
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

.grid-content-container {
    flex: 1;
    display: flex;
    flex-direction: column;
    padding: 15px;
    overflow: auto; 
    box-sizing: border-box;
    gap: 15px;
}

.borderStyle {  
    background: #fff;
    border: 1px solid #e1e8ed;
    border-radius: 8px;
    box-shadow: 0 2px 4px rgba(0,0,0,0.02);
    overflow: hidden;
}

/* Specific component styles */
.modalStyle {      
    background-color:#f4f7f9; 
    padding: 15px;
    border-bottom: 1px solid #e1e8ed;
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

.status {
    color: #FD8725;
    font-family: 'Segoe UI', Tahoma, sans-serif;
    font-size: 15px;
    font-weight: bold;
    margin: 0;
}

.hidden-scrollbar {
    height: 630px;
    overflow-x: hidden;
} 

#divname {
    background-color: #e2c791;
    box-shadow: 10px 10px grey;
    position: fixed;
    z-index: 1000;
    right: 30px;
    top: 100px;
    border-radius: 8px;
    padding: 10px;
}
</style>
</head>       
<body> 

<div id="modalcomments" class="modal fade" role="dialog">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header modalStyle">     
        <button type="button" class="close" data-dismiss="modal">&times;</button>  
        <h4 class="modal-title" style="text-align:center">Comments</h4>
      </div>
      <div class="modal-body">
        <div class="comments-outer-container container-fluid">
          <div class="comments-container"></div>
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

<div id="modalstatusupdate" class="modal fade" role="dialog">  
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header modalStyle">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title" style="text-align:center">Status Update</h4>      
      </div>
      <div class="modal-body">
      <table width="100%" style="border-spacing: 0 10px; border-collapse: separate;">
      <tr>
      <td align="right" style="padding-right: 15px; font-weight: 600;">Priority</td>
      <td align="left">
          <select name="priority" id="priority" class="form-control" style="width:100%; max-width: 200px;" value='<s:property value="priority"/>'>
              <option value="1">HIGH</option>
              <option value="2">MED</option>
              <option value="3">LOW</option>
          </select>
      </td>
      </tr>
      <tr>
      <td align="right" style="padding-right: 15px; font-weight: 600;">Promise Date</td>
       <td align="left"><div id="promdate" name="promdate" value='<s:property value="promdate"/>'></div></td>
      </tr>
      </table>
      </div>
      <div class="modal-footer">
      <button type="button" id="btnsave" class="btn btn-primary" data-dismiss="modal">Save</button>
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
        <h4 class="modal-title" style="text-align:center">Date Statistics</h4>      
      </div>
      <div class="modal-body">
      <div id="salmdiv" style="border: 1px solid #ccc; height: 350px;"><jsp:include page="salesmanGrid.jsp"></jsp:include></div>
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
      <div id="crmdiv" style="border: 1px solid #ccc; height: 350px;"><jsp:include page="clientGrid.jsp"></jsp:include></div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
      </div>  
    </div>  
  </div>
</div>

<div id="sidesearchwndow"><div></div></div>
<div id="brandsearchwindow"><div></div><div></div></div>
<div id="catsearchwindow"><div></div><div></div></div>
<div id="subcatsearchwindow"><div></div><div></div></div>	
<div id="productwindow"><div></div></div>

<div id="mainBG" class="homeContent hidden-scrollbar" data-type="background"> 
    <div class="master-container">

        <div class="sidebar-filters">
            <div class="sidebar-scroll-content">
                
                <div class="filter-card">
                    <table class="release-filter-table">
                        <tr>
                            <td class="label-cell">From</td>
                            <td><div id="fromdate" name="fromdate" value='<s:property value="fromdate"/>'></div></td>
                        </tr>
                        <tr>
                            <td class="label-cell">To</td>
                            <td><div id="todate" name="todate" value='<s:property value="todate"/>'></div></td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <div class="radio-group">
                                    <label><input type="radio" id="rsumm" name="stkled" onchange="fundisable();" value="rsumm"> Reset Reorder</label>
                                    <label><input type="radio" id="rdet" name="stkled" onchange="fundisable();" value="rdet"> To Be Ordered</label>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td class="label-cell">Level Count</td>
                            <td><input type="number" id="levelcount" name="levelcount"></td>
                        </tr>
                        <tr>
                            <td class="label-cell">Type</td>
                            <td>
                                <select id="type" name="type" onchange="clearnames()">
                                    <option value="">--Select--</option>
                                    <option value="BR">Brand</option>
                                    <option value="PR">Product</option>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <input type="text" id="name" name="name" placeholder="Press F3 for Search" readonly="readonly" onkeydown="getname(event);" value='<s:property value="name"/>'>
                            </td>
                        </tr>
                    </table>
                    
                    <div style="margin-top: 15px; width: 100%;">
                        <button type="button" id="btnupdate" name="btnupdate" class="btn-submit" onclick="funupdate();">Update</button>
                        <button type="button" id="btnupdates" name="btnupdates" class="btn-submit" onclick="fungo();">Purchase Request</button>
                    </div>
                </div>

                <input type="hidden" name="updatdata" id="updatdata" value="Update" onclick="funupdates()">
                <input type="hidden" id="cldocno" name="cldocno" value='<s:property value="cldocno"/>'>
                <input type="hidden" id="cmpbranch">     	  
                <input type="hidden" id="brandid" name="brandid" >  
                <input type="hidden" id="catid" name="catid" >
                <input type="hidden" id="subcatid" name="subcatid" >      
                <input type="hidden" id="psrno" name="psrno" >
                <input type="hidden" id="prddocno" name="prddocno" >

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

            </div>
        </div>

        <div class="main-content-area">
            
            <div class="top-toolbar-container">
                <jsp:include page="../../heading.jsp"></jsp:include>
            </div>

            <div class="top-action-bar">
                <div class="radio-group-modern">
                    <label><input id="one" type="radio" name="radios" onchange="showGrids(1);" onclick="$(this).attr('value', this.checked ? 1 : 0)"> ADD</label>
                    <label><input id="two" type="radio" name="radios" onchange="showGrids(2);" onclick="$(this).attr('value', this.checked ? 1 : 0)"> VIEW</label>
                </div>
                
                <div class="action-divider"></div>

                <button type="button" class="action-btn" id="btnsubmit" data-toggle="tooltip" title="Submit">
                    <i class="fa fa-refresh"></i> Refresh
                </button>    
                <button type="button" class="action-btn" id="btnexcel" data-toggle="tooltip" title="Excel Export">
                    <i class="fa fa-file-excel-o"></i> Export
                </button>    
                <button type="button" class="action-btn" id="btncalc" onclick="funcalculate();" data-toggle="tooltip" title="Calculate">
                    <i class="fa fa-calculator"></i> Calculate
                </button>
                
                <div class="action-divider"></div>

                <button type="button" class="action-btn" id="btnupdate_modal" data-toggle="modal" data-target="#modalstatusupdate" data-tooltip="tooltip" title="Update Status">
                    <i class="fa fa-pencil"></i> Status
                </button>
                
                <div class="badge-wrapper">
                    <button type="button" class="action-btn" id="btnpromise" data-tooltip="tooltip" title="Exceeded Promise Date" data-filtervalue="Exceeded Promise Date">
                        <i class="fa fa-handshake-o"></i> Alerts
                    </button>
                    <span class="badge badge-notify badge-promisexc"></span>
                </div>

                <div class="action-divider"></div>

                <button type="button" class="action-btn" id="btnattachs" data-toggle="modal" data-target="#modalattach" data-tooltip="tooltip" title="Attach">
                    <i class="fa fa-paperclip"></i> Attach
                </button>
                <button type="button" class="action-btn" id="btncomment" data-toggle="modal" data-tooltip="tooltip" title="Comments">
                    <i class="fa fa-comments"></i> Comments
                </button>
                <button type="button" class="action-btn" id="btnsalesman" data-toggle="modal" data-target="#modalsalesman" data-tooltip="tooltip" title="Date Statistics">
                    <i class="fa fa-bar-chart"></i> Date Stats
                </button>
                <button type="button" class="action-btn" id="btnclient" data-toggle="modal" data-target="#modalclient" data-tooltip="tooltip" title="Client Statistics">
                    <i class="fa fa-users"></i> Client Stats
                </button>

                <div style="margin-left: auto;">
                    <label class="status" id="lblclientstatushead" name="lblclientstatushead"></label>
                </div>
            </div>

            <div class="grid-content-container">
                
                <div id="productdiv" class="borderStyle"><jsp:include page="productGrid.jsp"></jsp:include></div>                     
                
                <div id="bomdiv" class="borderStyle" style="padding: 10px; display: flex; flex-direction: column; gap: 10px;">
                    <jsp:include page="bomGrid.jsp"></jsp:include>
                    
                    <div style="display: flex; gap: 10px; align-items: center;">
                        <button type="button" class="btn-update-green" onclick="funReserve();">Reserve</button>
                        <button type="button" id="loads" class="btn-submit" style="width: auto; margin-bottom: 0; padding: 0 15px;" onclick="loaddatass()">Load Data</button>
                    </div>

                    <div id="divname" hidden="true">
                        <table width="100%" id="prdetails"> 
                            <tr style="height: 25px" bgcolor="#e5ab69">  
                                <td align="center"><font color="#fff"><b>Quantity</b></font></td> 
                                <td align="center"><font color="#fff"><b>Stock Qty</b></font></td>  
                                <td align="center"><font color="#fff"><b>Batch No</b></font></td>
                                <td align="center"><font color="#fff"><b>Expiry Date</b></font></td>
                                <td align="center"><font color="#fff"><b>Description</b></font></td>
                            </tr>
                            <tr class="trhideclass1">
                                <td><input type="text" id="qty1" onchange="chkstocksval(this.value,1)" style="width:100%; height:20px;"></td>     
                                <td><input type="text" tabindex="-1" id="stkqty1" style="width:100%; height:20px;"></td> 
                                <td><input type="text" tabindex="-1" id="bt1" style="width:100%; height:20px;"></td>
                                <td><input type="text" tabindex="-1" id="ed1" style="width:100%; height:20px;"></td>
                                <td><input type="text" tabindex="-1" id="dsc1" style="width:100%; height:20px;"></td>
                                <td><input type="hidden" id="stkid1"></td> 
                            </tr>
                            <tr class="trhideclass2">
                                <td><input type="text" id="qty2" onchange="chkstocksval(this.value,2)" style="width:100%; height:20px;"></td>    
                                <td><input type="text" tabindex="-1" id="stkqty2" style="width:100%; height:20px;"></td>   
                                <td><input type="text" tabindex="-1" id="bt2" style="width:100%; height:20px;"></td>
                                <td><input type="text" tabindex="-1" id="ed2" style="width:100%; height:20px;"></td>
                                <td><input type="text" tabindex="-1" id="dsc2" style="width:100%; height:20px;"></td>
                                <td><input type="hidden" id="stkid2"></td> 
                            </tr>
                            <tr class="trhideclass3">
                                <td><input type="text" id="qty3" onchange="chkstocksval(this.value,3)" style="width:100%; height:20px;"></td>    
                                <td><input type="text" tabindex="-1" id="stkqty3" style="width:100%; height:20px;"></td>    
                                <td><input type="text" tabindex="-1" id="bt3" style="width:100%; height:20px;"></td>
                                <td><input type="text" tabindex="-1" id="ed3" style="width:100%; height:20px;"></td>
                                <td><input type="text" tabindex="-1" id="dsc3" style="width:100%; height:20px;"></td>
                                <td><input type="hidden" id="stkid3"></td> 
                            </tr>
                            <tr class="trhideclass4">
                                <td><input type="text" id="qty4" onchange="chkstocksval(this.value,4)" style="width:100%; height:20px;"></td>    
                                <td><input type="text" tabindex="-1" id="stkqty4" style="width:100%; height:20px;"></td>   
                                <td><input type="text" tabindex="-1" id="bt4" style="width:100%; height:20px;"></td>
                                <td><input type="text" tabindex="-1" id="ed4" style="width:100%; height:20px;"></td>
                                <td><input type="text" tabindex="-1" id="dsc4" style="width:100%; height:20px;"></td>
                                <td><input type="hidden" id="stkid4"></td> 
                            </tr>
                            <tr class="trhideclass5">
                                <td><input type="text" id="qty5" onchange="chkstocksval(this.value,5)" style="width:100%; height:20px;"></td>   
                                <td><input type="text" tabindex="-1" id="stkqty5" style="width:100%; height:20px;"></td>   
                                <td><input type="text" tabindex="-1" id="bt5" style="width:100%; height:20px;"></td>
                                <td><input type="text" tabindex="-1" id="ed5" style="width:100%; height:20px;"></td>
                                <td><input type="text" tabindex="-1" id="dsc5" style="width:100%; height:20px;"></td> 
                                <td><input type="hidden" id="stkid5"></td> 
                            </tr>
                            <tr class="trhideclass6">
                                <td><input type="text" id="qty6" onchange="chkstocksval(this.value,6)" style="width:100%; height:20px;"></td>     
                                <td><input type="text" tabindex="-1" id="stkqty6" style="width:100%; height:20px;"></td>  
                                <td><input type="text" tabindex="-1" id="bt6" style="width:100%; height:20px;"></td>
                                <td><input type="text" tabindex="-1" id="ed6" style="width:100%; height:20px;"></td>
                                <td><input type="text" tabindex="-1" id="dsc6" style="width:100%; height:20px;"></td>
                                <td><input type="hidden" id="stkid6"></td> 
                            </tr>
                            <tr class="trhideclass7">
                                <td><input type="text" id="qty7" onchange="chkstocksval(this.value,7)" style="width:100%; height:20px;"></td>     
                                <td><input type="text" tabindex="-1" id="stkqty7" style="width:100%; height:20px;"></td>  
                                <td><input type="text" tabindex="-1" id="bt7" style="width:100%; height:20px;"></td>
                                <td><input type="text" tabindex="-1" id="ed7" style="width:100%; height:20px;"></td>
                                <td><input type="text" tabindex="-1" id="dsc7" style="width:100%; height:20px;"></td>
                                <td><input type="hidden" id="stkid7"></td> 
                            </tr>
                            <tr class="trhideclass8">
                                <td><input type="text" id="qty8" onchange="chkstocksval(this.value,8)" style="width:100%; height:20px;"></td>     
                                <td><input type="text" tabindex="-1" id="stkqty8" style="width:100%; height:20px;"></td>   
                                <td><input type="text" tabindex="-1" id="bt8" style="width:100%; height:20px;"></td>
                                <td><input type="text" tabindex="-1" id="ed8" style="width:100%; height:20px;"></td>
                                <td><input type="text" tabindex="-1" id="dsc8" style="width:100%; height:20px;"></td>
                                <td><input type="hidden" id="stkid8"></td> 
                            </tr>  
                            <tr class="trhideclass9">
                                <td><input type="text" id="qty9" onchange="chkstocksval(this.value,9)" style="width:100%; height:20px;"></td>     
                                <td><input type="text" tabindex="-1" id="stkqty9" style="width:100%; height:20px;"></td> 
                                <td><input type="text" tabindex="-1" id="bt9" style="width:100%; height:20px;"></td>
                                <td><input type="text" tabindex="-1" id="ed9" style="width:100%; height:20px;"></td>
                                <td><input type="text" tabindex="-1" id="dsc9" style="width:100%; height:20px;"></td>
                                <td><input type="hidden" id="stkid9"></td> 
                            </tr>
                            <tr class="trhideclass10">
                                <td><input type="text" id="qty10" onchange="chkstocksval(this.value,10)" style="width:100%; height:20px;"></td>    
                                <td><input type="text" tabindex="-1" id="stkqty10" style="width:100%; height:20px;"></td>   
                                <td><input type="text" tabindex="-1" id="bt10" style="width:100%; height:20px;"></td>
                                <td><input type="text" tabindex="-1" id="ed10" style="width:100%; height:20px;"> </td>
                                <td><input type="text" tabindex="-1" id="dsc10" style="width:100%; height:20px;"></td>
                                <td><input type="hidden" id="stkid10"></td> 
                            </tr>
                            <tr><td colspan="7">&nbsp;</td></tr>
                            <tr> 
                                <td colspan="7" align="center" style="display:flex; gap:10px; justify-content:center;"> 
                                    <button type="button" name="searchs1" id="searchs1" class="btn-submit" style="width: auto; padding: 0 15px; margin-bottom: 0;" onclick="chkfocss()">Submit</button>
                                    <button type="button" name="searchss1" id="searchss1" class="btn-submit" style="width: auto; padding: 0 15px; margin-bottom: 0; background-color: #64748b;" onclick="closes()">Close</button>
                                </td>
                            </tr>
                        </table>
                    </div>
   
                    <div id="batchdiv" hidden="true"><jsp:include page="batchdet.jsp"></jsp:include></div> 
                </div>

                <div id="thirddiv" class="borderStyle"><jsp:include page="thirdGrid.jsp"></jsp:include></div>

                <div id="div1" style="display:flex; flex-direction:column; gap:15px;">
                    <div id="listdiv" class="borderStyle"><jsp:include page="listGrid.jsp"></jsp:include></div>
                    <div id="sublistdiv" class="borderStyle"><jsp:include page="sublistGrid.jsp"></jsp:include></div>
                </div>

                <div id="div2" style="display:flex; flex-direction:column;">
                    <div id="tobeorderdiv" class="borderStyle"><jsp:include page="tobeorderdGrid.jsp"></jsp:include></div>
                </div>

            </div>

        </div>

    </div>		
</div>

<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@7.24.4/dist/sweetalert2.all.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.6-rc.0/js/select2.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/js-cookie@2/src/js.cookie.min.js"></script>
<script type="text/javascript">   
    $(document).ready(function(){ 
    	funprimseexceed();
    	document.getElementById("one").checked=true;
    	$('#productdiv').show();
		$('#deptdiv').show();
		$('#updatebtn').show();
		$('#thirddiv').hide();
        $('[data-tooltip="tooltip"]').tooltip();
        
    	$("body").prepend('<div id="overlay" class="ui-widget-overlay" style="z-index: 1000; display: none;"></div>');
	    $("body").prepend("<div id='PleaseWait' style='display: none;position:absolute; z-index: 1001;top:50%;left:50%;transform:translate(-50%,-50%);'><img src='../../../../icons/31load.gif'/></div>");
	    
        document.getElementById("cmpbranch").value="Company/Branch Name";
	   
	    $("#btnupdate").attr('disabled',true);
	    $("#btnupdates").attr('disabled',true);
	     
	    $("#btnupdates").hide();
	    $("#btnupdate").show();
	     
		$("#fromdate").jqxDateTimeInput({ width: '100%', height: '24px',formatString:"dd.MM.yyyy"});
		$("#todate").jqxDateTimeInput({ width: '100%', height: '24px',formatString:"dd.MM.yyyy"});
		var fromdates=new Date($('#fromdate').jqxDateTimeInput('getDate'));
		var onemounth=new Date(new Date(fromdates).setMonth(fromdates.getMonth()-1)); 
		    
	    $('#fromdate').jqxDateTimeInput('setDate', new Date(onemounth));
		$('#todate').on('change', function (event) {
			var fromdates=new Date($('#fromdate').jqxDateTimeInput('getDate'));
			var todates=new Date($('#todate').jqxDateTimeInput('getDate')); 
			if(fromdates>todates){
				$.messager.alert('Message','To Date Less Than From Date  ','warning');   
			    return false;
			}   
		});
	
	    $('#div1').show();
		$('#div2').hide();
	 
		document.getElementById('rsumm').checked="true";
			
		$('#catsearchwindow').jqxWindow({width : '25%',height : '58%',maxHeight : '70%',maxWidth : '45%',title : 'Category Search',position : {x : 420,y : 87},theme : 'energyblue',showCloseButton : true,keyboardCloseKey : 27});
		$('#catsearchwindow').jqxWindow('close');
		$('#subcatsearchwindow').jqxWindow({width : '25%',height : '58%',maxHeight : '70%',maxWidth : '45%',title : 'Sub Category Search',position : {x : 420,y : 87},theme : 'energyblue',showCloseButton : true,keyboardCloseKey : 27});
		$('#subcatsearchwindow').jqxWindow('close');
		$('#brandsearchwindow').jqxWindow({width : '25%',height : '58%',maxHeight : '70%',maxWidth : '70%',title : 'Brand Search',position : {x : 420,y : 87},theme : 'energyblue',showCloseButton : true,keyboardCloseKey : 27});
		$('#brandsearchwindow').jqxWindow('close');
		$('#productwindow').jqxWindow({ width: '50%',height: '62%',  maxHeight: '80%'  ,maxWidth: '50%' , title: 'Product Search' ,position: { x: 250, y: 60 }, keyboardCloseKey: 27});
		$('#productwindow').jqxWindow('close');   
			 
		$('#name').dblclick(function(){
			 if($('#type').val()=="BR"){
				 brandFormSearchContent('brandFormSearchGrid.jsp');  
			 } 
			 else if($('#type').val()=="CA"){
				 catFormSearchContent('catFormSearchGrid.jsp'); 
			 }
			 else if($('#type').val()=="SC"){
				 subCatFormSearchContent('subCatFormSearchGrid.jsp');
			 }
			 else if($('#type').val()=="PR"){
				 productSearchContent('productSearch.jsp');
			 }
		}); 

        $('#sidesearchwndow').jqxWindow({ width: '55%', height: '92%',  maxHeight: '85%' ,maxWidth: '80%' ,title: 'Product Search ' , position: { x: 300, y: 0 }, keyboardCloseKey: 27});
	    $('#sidesearchwndow').jqxWindow('close');   
	    $('[data-toggle="tooltip"]').tooltip(); 
    	 
    	$('#btnattachs').click(function(){ 
         	funAttachs(event); 
        });
        $('#btnsubmit').click(function(){     
            funload(); 
        });          
        
        $('#btnexcel').click(function(){ 
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
    		for(var i=0;i<selectedrows.length;i++){
    			var chk=selectedrows[i];
    			var docs=rows[chk].doc_no;
    			var type=rows[chk].otype;
    			orderarray.push(docs+" :: "+type+" :: ");
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
    
    function showGrids(id){
    	if(parseInt(id)==1){
    		$('#two').val(0);
    	}
    	if(parseInt(id)==2){
    		$('#one').val(0);
    	}
    	var chk=$('#one').val();
    	var chk2=$('#two').val();
    	if(parseInt(chk)==1){
    		$('#productdiv').show();
    		$('#deptdiv').show();
    		$('#updatebtn').show();
    		$('#thirddiv').hide();
    		$('#jqxviewGrid').jqxGrid('clear');
    	}
    	if(parseInt(chk2)==1){
    		$('#productdiv').hide();
    		$('#deptdiv').hide();
    		$('#thirddiv').show();
    		$('#updatebtn').hide();
    		$('#jqxbomGrid').jqxGrid('clear');
    		$('#jqxdeptGrid').jqxGrid('clear');
    	}
    }
    
    function productSearchContent(url) {
   		$.get(url).done(function (data) {
   			$('#sidesearchwndow').jqxWindow('open');
   		    $('#sidesearchwndow').jqxWindow('setContent', data);
   	    }); 
   	} 
    
    function addGridFilters(id,filtervalue,datafield,filtertype,filtercondition){   
    	var filtergroup = new $.jqx.filter();
    	var filter_or_operator = 1;
	    var filter1 = filtergroup.createfilter(filtertype, filtervalue, filtercondition);
	    filtergroup.addfilter(filter_or_operator, filter1);
	    $("#jqxpdpGrid").jqxGrid('addfilter', datafield, filtergroup);
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
		}
		x.open("GET","getPromiseAlert.jsp",true);
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
    
   function funload(){  
    	var chk2=$('#two').val();
        if(parseInt(chk2)==1){
        	 $('#thirddiv').load("viewProductGrid.jsp?id="+1);
        }
        else{
        	 $('#productdiv').load("ProductGrid.jsp?id="+1);       
        }
   }

   function funAlertload(){  
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
	   var purchasearray=new Array();
       var rows=$("#jqxdeptGrid").jqxGrid('getrows');
       if(parseFloat(rows.length)==0){
           $.messager.alert('Message', '  Select Documents ');
           return false;
       }
			
       $.messager.confirm('Confirm', 'Do you want to Update?', function(r){
           if (r){	
               $("#overlay, #PleaseWait").show();
               var selectedrows=$("#jqxdeptGrid").jqxGrid('selectedrowindexes');
               for(var i=0 ; i < selectedrows.length ; i++){
                   var chk=selectedrows[i];
                   var psrno=rows[chk].mpsrno;
                   var desc=rows[chk].pdesc;
                   var measure=rows[chk].measure;
                   var deptid=rows[chk].deptid;
                   var rowno=rows[chk].rowss;
                   purchasearray.push(psrno+" :: "+desc+" :: "+measure+" :: "+rowno+" :: "+deptid+" :: ");
               }
               saveGridData(purchasearray);
           }
       });
   }
   
   function saveGridData(purchasearray){
		var contocno=$('#hidvoc').val();
		var chkpsrno=$('#hidpsrno').val();  
		var prdid=$('#hidprdid').val();
		var type=$('#hidtype').val();
		var btn="reserve";
		var x=new XMLHttpRequest();
		x.onreadystatechange=function(){
		if (x.readyState==4 && x.status==200){
				var items=x.responseText;
				items = items.split('::');
				var chk  = items[0].split(",");
				var psrno = items[1].split(",");
				if(parseInt(chk)>0)  
				{	
					$("#overlay, #PleaseWait").hide();
					if(parseInt(chk)>0)  
					{	
				        $.messager.alert('Message', '  Product Successfully Created ');
				        $('#deptdiv').load("deptProductGrid.jsp?id="+1+"&mpsrno="+chkpsrno);
					}
				}
				else
				{
					$("#overlay, #PleaseWait").hide();
				    $.messager.alert('Message', '  Not Created  ');
				}
		}
		}
        x.open("GET","createproduct.jsp?productarray="+purchasearray+"&psrno="+chkpsrno,true);			
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
		    temptrno1=temptrno+",";
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

function funExportBtn(){
	if (document.getElementById('rsumm').checked) {
	    JSONToCSVCon(dat1, 'Reorder Level - Reset Reorder ', true);
	}
	else {
	    JSONToCSVCon(dat2, 'Reorder Level - To Be Ordered ', true);
	}
}

function brandFormSearchContent(url) {
	$('#brandsearchwindow').jqxWindow('open');
	$.get(url).done(function(data) {
		$('#brandsearchwindow').jqxWindow('setContent', data);
		$('#brandsearchwindow').jqxWindow('bringToFront');
	});
}

function subCatFormSearchContent(url) {
	$('#subcatsearchwindow').jqxWindow('open');
	$.get(url).done(function(data) {
		$('#subcatsearchwindow').jqxWindow('setContent', data);
		$('#subcatsearchwindow').jqxWindow('bringToFront');
	});
}

function catFormSearchContent(url) {
	$('#catsearchwindow').jqxWindow('open');
	$.get(url).done(function(data) {
		$('#catsearchwindow').jqxWindow('setContent', data);
		$('#catsearchwindow').jqxWindow('bringToFront');
	});
}

function productSearchContent(url) {
	$('#productwindow').jqxWindow('open');
	$.get(url).done(function (data) {
	  $('#productwindow').jqxWindow('setContent', data);
	}); 
}

function getname(event) {
	if($('#type').val()=="BR") {
	    brandFormSearchContent('brandFormSearchGrid.jsp');  
	} 
    else if($('#type').val()=="CA") {
	    catFormSearchContent('catFormSearchGrid.jsp'); 
	}
    else if($('#type').val()=="SC") {
	    subCatFormSearchContent('subCatFormSearchGrid.jsp');
	}
    else if($('#type').val()=="PR") {
	    productSearchContent('productSearch.jsp');
    }
}

function funreload(event) {
	var fromdates=new Date($('#fromdate').jqxDateTimeInput('getDate'));
	var todates=new Date($('#todate').jqxDateTimeInput('getDate')); 
	 	 
    if(fromdates>todates){
		   $.messager.alert('Message','To Date Less Than From Date  ','warning');   
	       return false;
	} 
    else {
	    var barchval = document.getElementById("cmbbranch").value;
        var fromdate= $("#fromdate").val();
	    var todate= $("#todate").val();
	 
	    var type=$('#type').val();
	    var brandid=$("#brandid").val();
	    var catid=$("#catid").val();
	    var subcatid=$("#subcatid").val();                  
	    var psrno=$("#psrno").val(); 
	    var levelcount=$("#levelcount").val();
	 
	    $("#overlay, #PleaseWait").show(); 

		if (document.getElementById('rsumm').checked) {
	        document.getElementById("cmpbranch").value="Company/Branch Name";
	        $("#sublist").jqxGrid('clear');
	        var load="yes";
 	        $("#listdiv").load("listGrid.jsp?barchval="+barchval+"&fromdate="+fromdate+"&todate="+todate+"&type="+type+"&brandid="+brandid+"&catid="+catid+"&subcatid="+subcatid+"&psrno="+psrno+"&load="+load+"&levelcount="+levelcount);
		}
		else {
			var load="yes";
			$("#tobeorderdiv").load("tobeorderdGrid.jsp?barchval="+barchval+"&fromdate="+fromdate+"&todate="+todate+"&type="+type+"&brandid="+brandid+"&catid="+catid+"&subcatid="+subcatid+"&psrno="+psrno+"&load="+load+"&levelcount="+levelcount);	
		}
    }
  	$("#btnupdate").attr('disabled',true);
}
	
function funCalculates() {}

function hidebranch() {
    $("#branchdiv").hide();
    $("#branchlabel").hide();
}
	
function fundisable() {
    if (document.getElementById('rsumm').checked) {
        $('#div1').show();
        $('#div2').hide();
        $("#btnupdates").hide();
        $("#btnupdate").show();
    }
    else if (document.getElementById('rdet').checked) {
        $('#div1').hide();
        $('#div2').show();
        $("#btnupdates").show();
        $("#btnupdate").hide();
    }
}
	
function funupdate() {
    $.messager.confirm('Message', 'Do you want to save changes?', function(r){
        if(r==false) {}
        else {
            var listss = new Array();
            var prorows = $("#sublist").jqxGrid('getrows'); 
            for (var i = 0; i < prorows.length; i++) {
                var dis=0;
                if (prorows[i].selects == true) {
                    if (prorows[i].discontinued == true) {
                        dis=1;
                    }
                    listss.push(prorows[i].bdocno + "::" +prorows[i].selects
                            + "::" + dis + "::"
                            + prorows[i].bin+ "::" + prorows[i].minstock + "::"
                            + prorows[i].maxstock+ "::" + prorows[i].retailprice
                            + "::" + prorows[i].wholesale+ "::"
                            + prorows[i].normal+ "::"+prorows[i].reorderlevel+ "::"+prorows[i].reorderqty+ "::");  
                }
            }
            save(listss);
        }
    }); 
}

function save(listss) {
    var x=new XMLHttpRequest();
    x.onreadystatechange=function() {
        if (x.readyState==4 && x.status==200) {
            var items= x.responseText;
            var itemval=items.trim();
            if(parseInt(itemval)==1) {
                $.messager.alert('Message', '  Record successfully Updated ', function(r){});
                $("#sublist").jqxGrid('clear');
                $("#sublist").jqxGrid('addrow', null, {});
                funreload(event);
            }
            else {
                $.messager.alert('Message', '  Not Updated ', function(r){});
            }  
        }
    }
    x.open("GET","saveupdate.jsp?list="+listss+"&prddocno="+document.getElementById("prddocno").value);  
    x.send();
}

function fungo() {
    var checkval="open"; 
    var psrno=0;
    var selectedrows = $("#tobeorderdgrid").jqxGrid('selectedrowindexes');
    selectedrows = selectedrows.sort(function(a,b){return a - b});
    for(var i=0 ; i < selectedrows.length ; i++){
        psrno=psrno+$("#tobeorderdgrid").jqxGrid('getcellvalue',selectedrows[i],'psrno')+"::";
    } 
    var barchval = document.getElementById("cmbbranch").value;
    var url=document.URL;
    var reurl=url.split("com");
    var path1='com/Procurement/Purchase/purchaserequest/PurchaseRequest.jsp';
    var path= path1+"?psrno="+psrno+"&checkval="+checkval+"&barchval="+barchval;
    top.addTab( "Purchase Request",reurl[0]+""+path);		
}

function loaddatass() {
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

function loaddatass1() {
    for (var i = 1; i <= 10; i++) {
        document.getElementById("qty"+i).value="";
        document.getElementById("stkqty"+i).value="";
        document.getElementById("bt"+i).value="";
        document.getElementById("ed"+i).value="";
        document.getElementById("stkid"+i).value="";
        document.getElementById("dsc"+i).value="";
        
        $('#bt'+i).attr('readonly', true);
        $('#ed'+i).attr('readonly', true);
        $('#stkqty'+i).attr('readonly', true);
        $('#dsc'+i).attr('readonly', true);
        
        $('.trhideclass'+i).hide();
    }
		   		
    var rows = $('#batgrid').jqxGrid('getrows');
    var kk=0;
    for(var i=0 ; i < rows.length ; i++){
        kk=kk+1;
        var id1=".trhideclass"+kk;
        var id3="bt"+kk;
        var id4="ed"+kk;
        var id5="stkqty"+kk;
        var id6="stkid"+kk;
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
	 
function clearprd() {
    $("#batgrid").jqxGrid('clear'); 
    for (var i = 1; i <= 10; i++) {
        document.getElementById("qty"+i).value="";
        document.getElementById("stkqty"+i).value="";
        document.getElementById("bt"+i).value="";
        document.getElementById("ed"+i).value="";
        document.getElementById("stkid"+i).value="";
        document.getElementById("dsc"+i).value="";
    }
}
	 
function chkstocksval(value,tf) {
    if(parseFloat(value)>0) {
        var id5="qty"+tf;
        var id7="stkqty"+tf;
        var qty=0;
        if(parseFloat(document.getElementById(""+id5).value)>0) {
            qty=document.getElementById(""+id5).value;
        }
        if(parseFloat(document.getElementById(""+id7).value)<(parseFloat(qty))) {
            document.getElementById(""+id5).value=0;
            document.getElementById(""+id5).focus();
            return 0;
        }
    }
}
	 
function closes() {
    $('#prdetails').find('input[type=text]').each(function(){
        $(this).val("");
    });
    $('#divname').hide();
}

function chkfocss() {
    var ss=0;
    var totqty=0;
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
 	   
        if(parseFloat(document.getElementById(""+id5).value)>0) {
            totqty=parseFloat(totqty)+parseFloat(document.getElementById(""+id5).value);
            aa=document.getElementById(""+id5).value;
        }
 	   
        if(parseFloat(document.getElementById(""+id5).value)>0 ) {
            temp=temp+document.getElementById(""+id7).value+" @@ "+aa+" @@ "+bb+" @@ "+document.getElementById(""+id8).value+" @@@ ";
        }
        if(!document.getElementById(""+id7).value=="") {
            stkid=stkid+document.getElementById(""+id7).value+" @@ "+document.getElementById(""+id5).value+" @@@ ";
        }
    }
    
    if(document.getElementById("focvalidate").value==1) {
		checkfocqty(0,totqty,temp,stkid);
    }
	else {
        var rowid=document.getElementById("hidrow").value;
        $('#jqxthirdGrid').jqxGrid('setcellvalue', rowid, "toberesqty",totqty);
        $('#jqxthirdGrid').jqxGrid('setcellvalue', rowid, "stockid",stkid);
        $('#jqxthirdGrid').jqxGrid('setcellvalue', rowid, "collqty",temp);
        $('#divname').hide();
	}
}
	 
function checkfocqty(temp3,temp2,collqty) {
    var psrno=document.getElementById("temppsrno").value; 
    var unit=document.getElementById("unit").value;
    var x=new XMLHttpRequest();
    x.onreadystatechange=function(){
        if (x.readyState==4 && x.status==200) {
            var items= x.responseText.trim();
            if(temp3>items) {
                document.getElementById("errormsg").innerText=" Allowed Foc :  "+items;
                return 0;
            }
            else {
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
		
function checkfocqtyss(temp2,psrno,unit,rs) {
    var x=new XMLHttpRequest();
    x.onreadystatechange=function(){
        if (x.readyState==4 && x.status==200) {
            var items= x.responseText.trim();
            $('#serviecGrid').jqxGrid('setcellvalue',rs,"foc",items);
        }
    } 
    x.open("GET","checkfocqty.jsp?qty="+temp2+"&psrno="+psrno+"&unit="+unit,true);
    x.send();
}
		
function checkfocqtys(temp2) {
    var psrno=document.getElementById("temppsrno").value; 
    var unit=document.getElementById("unit").value;
    var x=new XMLHttpRequest();
    x.onreadystatechange=function(){
        if (x.readyState==4 && x.status==200) {
            var items= x.responseText.trim();
            if(parseFloat(items)>0) {
                document.getElementById("focs").value=parseInt(items);
                document.getElementById("focs").focus();
                var input = document.getElementById("focs");
                input.focus();
                input.setSelectionRange(0,0);
            }
            else {
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