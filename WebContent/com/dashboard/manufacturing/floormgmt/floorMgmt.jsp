<jsp:include page="../../../../includes.jsp"></jsp:include>    
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%  String contextPath=request.getContextPath();%>
<!DOCTYPE html>   
<html lang="en">
<head>
<title>Floor Management</title>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="https://daneden.github.io/animate.css/animate.min.css">
<jsp:include page="../../../../floorMgmtIncludes.jsp"></jsp:include>
<link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
<link href="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.6-rc.0/css/select2.min.css" rel="stylesheet" />

<style type="text/css">
    /* ===== MODERN TOP ACTION BAR ===== */
    .top-action-bar {
        display: flex;
        flex-wrap: wrap;
        gap: 12px;
        align-items: center;
        background: #f8fafc;
        border: 1px solid #e3e8ee;
        border-radius: 8px;
        padding: 12px 15px;
        margin-bottom: 15px;
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
        font-weight: 600;
        border-radius: 6px;
        transition: all 0.2s ease-in-out;
        box-shadow: 0 1px 2px rgba(0,0,0,0.02);
        cursor: pointer;
        position: relative;
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

    /* Active State for Toggle Filters */
    .action-btn.active {
        background-color: #2563eb;
        color: #fff;
        border-color: #1d4ed8;
    }

    .action-divider {
        width: 1px;
        height: 28px;
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
        top: -10px;
        z-index: 2;
        background-color: #ef4444;
        color: white;
        font-size: 10px;
        font-weight: bold;
        padding: 3px 6px;
        border-radius: 12px;
        box-shadow: 0 2px 4px rgba(239, 68, 68, 0.3);
    }

    /* Keep warningpanel display as flex to preserve structural layout while ensuring JS selectors still work */
    .warningpanel {
        display: flex;
        flex-wrap: wrap;
        gap: 12px;
        align-items: center;
    }

    /* Grid Area */
    .grid-container {
        background: #fff;
        border: 1px solid #e1e8ed;
        border-radius: 8px;
        box-shadow: 0 2px 4px rgba(0,0,0,0.02);
        padding: 15px;
        overflow: hidden;
    }

    /* Legacy / Required UI Elements */
	.comment{
      background-image: linear-gradient(120deg, #a1c4fd 0%, #c2e9fb 100%);
      color: #000;
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
    .textpanel p.h4{
   		margin-top: 8px;
    	margin-bottom: 6px;
    }
    .load-wrapp {
	    width: 100px;
	    height: 100px;
	    padding: 20px;
	    border-radius: 5px;
	    text-align: center;
	    background-color: #fff;
	    position:fixed;
	    z-index:9999;
	    top:50%;
	    left:50%;
	    transform:translate(-50%,-50%);
	    border:1px solid #000;
	}
	.spinner {
	    position: relative;
	    width: 45px;
	    height: 45px;
	    margin: 0 auto;
	}
	.bubble-1,
	.bubble-2 {
	    position: absolute;
	    top: 0;
	    width: 25px;
	    height: 25px;
	    border-radius: 100%;
	    background-color: #000;
	}
	.bubble-2 {
	    top: auto;
	    bottom: 0;
	}
	.load-9 .spinner {border:none;animation: loadingI 2s linear infinite;}
	.load-9 .bubble-1, .load-9 .bubble-2 {animation: bounce 2s ease-in-out infinite;}
	.load-9 .bubble-2 {animation-delay: -1.0s;}
	@keyframes loadingI {
	    100% {transform: rotate(360deg);}
	}
	@keyframes bounce  {
	  0%, 100% {transform: scale(0.0);}
	  50% {transform: scale(1.0);}
	}
</style>
</head>
<body>
	<div class="load-wrapp">
    	<div class="load-9">
        	<div class="spinner">
            	<div class="bubble-1"></div>
                <div class="bubble-2"></div>
            </div>
        </div>
    </div>
  <div class="container-fluid" style="padding-top: 15px;">
    
    <!-- Modern Horizontal Top Action Bar -->
    <div class="row rowgap">
      <div class="col-xs-12">
        <div class="top-action-bar">
            
            <!-- Standard Actions -->
  			<button type="button" class="action-btn" id="btnsubmit" data-toggle="tooltip" title="Submit">
                  <i class="fa fa-refresh"></i> Refresh
            </button>
          	<button type="button" class="action-btn" id="btnexcel" data-toggle="tooltip" title="Excel Export">
                  <i class="fa fa-file-excel-o"></i> Export
            </button>
            
            <div class="action-divider"></div>
            
            <!-- Stage Filters wrapped in warningpanel to preserve JS selector -->
            <div class="warningpanel">
                <div class="badge-wrapper">
                    <button type="button" class="action-btn" id="btnmrp" data-toggle="tooltip" title="Material Requirement Planning" data-filtervalue="N" data-datafield="mrp" data-filtertype="stringfilter" data-filtercondition="contains">
                        <i class="fa fa-filter"></i> MRP
                    </button>
                    <span class="badge badge-notify badge-mrp">3</span>
                </div>	
                <div class="badge-wrapper">
                    <button type="button" class="action-btn" id="btnwo" data-toggle="tooltip" title="Work Order" data-filtervalue="N" data-datafield="wo" data-filtertype="stringfilter" data-filtercondition="contains">
                        <i class="fa fa-filter"></i> WO
                    </button>
                    <span class="badge badge-notify badge-wo">3</span>
                </div>
                <div class="badge-wrapper">
                    <button type="button" class="action-btn" id="btnblnd" data-toggle="tooltip" title="Blending" data-filtervalue="N" data-datafield="blnd" data-filtertype="stringfilter" data-filtercondition="contains">
                        <i class="fa fa-filter"></i> BLND
                    </button>
                    <span class="badge badge-notify badge-blnd">3</span>
                </div>
                <div class="badge-wrapper">
                    <button type="button" class="action-btn" id="btnmr" data-toggle="tooltip" title="Material Request" data-filtervalue="N" data-datafield="mr" data-filtertype="stringfilter" data-filtercondition="contains">
                        <i class="fa fa-filter"></i> MR
                    </button>
                    <span class="badge badge-notify badge-mr">3</span>
                </div>
                <div class="badge-wrapper">
                    <button type="button" class="action-btn" id="btnmin" data-toggle="tooltip" title="Material Issue Note" data-filtervalue="N" data-datafield="min" data-filtertype="stringfilter" data-filtercondition="contains">
                        <i class="fa fa-filter"></i> MIN
                    </button>
                    <span class="badge badge-notify badge-min">3</span>
                </div>
                <div class="badge-wrapper">
                    <button type="button" class="action-btn" id="btnqa" data-toggle="tooltip" title="Quality Assurance" data-filtervalue="N" data-datafield="qa" data-filtertype="stringfilter" data-filtercondition="contains">
                        <i class="fa fa-filter"></i> QA
                    </button>
                    <span class="badge badge-notify badge-qa">3</span>
                </div>
                <div class="badge-wrapper">
                    <button type="button" class="action-btn" id="btnpc" data-toggle="tooltip" title="Production Complete" data-filtervalue="N" data-datafield="pc" data-filtertype="stringfilter" data-filtercondition="contains">
                        <i class="fa fa-filter"></i> PC
                    </button>
                    <span class="badge badge-notify badge-pc">3</span>
                </div>
                <div class="badge-wrapper">
                    <button type="button" class="action-btn" id="btnfp" data-toggle="tooltip" title="Finished Product" data-filtervalue="N" data-datafield="fp" data-filtertype="stringfilter" data-filtercondition="contains">
                        <i class="fa fa-filter"></i> FP
                    </button>
                    <span class="badge badge-notify badge-fp">3</span>
                </div>
                <div class="badge-wrapper">
                    <button type="button" class="action-btn" id="btndel" data-toggle="tooltip" title="Delivery" data-filtervalue="N" data-datafield="del" data-filtertype="stringfilter" data-filtercondition="contains">
                        <i class="fa fa-filter"></i> DEL
                    </button>
                    <span class="badge badge-notify badge-del">3</span>
                </div>
                <div class="badge-wrapper">
                    <button type="button" class="action-btn" id="btninv" data-toggle="tooltip" title="Invoice" data-filtervalue="N" data-datafield="inv" data-filtertype="stringfilter" data-filtercondition="contains">
                        <i class="fa fa-filter"></i> INV
                    </button>
                    <span class="badge badge-notify badge-inv">3</span>
                </div>
            </div>
            
        </div>
      </div>
    </div>
    
    <!-- Main Grid Content -->
    <div class="row">
      <div class="col-xs-12">
        <div class="grid-container">
            <div id="floormgmtgriddiv"><jsp:include page="floorMgmtGrid.jsp"></jsp:include></div>
        </div>
      </div>
    </div>

    <!-- Comments Modal-->
    <div id="modalcomments" class="modal fade" role="dialog">
      <div class="modal-dialog">
        <div class="modal-content">
          <div class="modal-header" style="background-color:#f8fafc; border-bottom: 1px solid #e1e8ed;">
            <button type="button" class="close" data-dismiss="modal">&times;</button>
            <h4 class="modal-title" style="font-weight: 600;">Comments</h4>
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
                          <button type="button" id="btncommentsend" class="btn btn-primary" style="height: 34px;">
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
    
  </div>

  <input type="hidden" name="jobcarddocno" id="jobcarddocno">
  <input type="hidden" name="jobcardvocno" id="jobcardvocno">
  <input type="hidden" name="z1count" id="z1count">
  <input type="hidden" name="z2count" id="z2count">
  <input type="hidden" name="z3count" id="z3count">
  <input type="hidden" name="z4count" id="z4count">
  <input type="hidden" name="z5count" id="z5count">
  <input type="hidden" name="z6count" id="z6count">
  <input type="hidden" name="z7count" id="z7count">
  <input type="hidden" name="z8count" id="z8count">
  <input type="hidden" name="z9count" id="z9count">
  <input type="hidden" name="z10count" id="z10count">
  <input type="hidden" name="z11count" id="z11count">
  <input type="hidden" name="z12count" id="z12count">
  <input type="hidden" name="z13count" id="z13count">
  <input type="hidden" name="z14count" id="z14count">
  
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@7.24.4/dist/sweetalert2.all.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.6-rc.0/js/select2.min.js"></script>
<script type="text/javascript">
    $(document).ready(function(){
        $('[data-toggle="tooltip"]').tooltip(); 
       
        $('.load-wrapp').hide();
        
        $('#btnsubmit').click(function(){
        	funGetCountData();
        	 $('.load-wrapp').show();
        	$('#floormgmtgriddiv').load('floorMgmtGrid.jsp?id=1');
        });
        
        $('#btnexcel').click(function(){
        	$("#floorMgmtGrid").excelexportjs({
        		containerid: "floorMgmtGrid",
        		datatype: 'json',
        		dataset: null,
        		gridId: "floorMgmtGrid",
        		columns: getColumns("floorMgmtGrid"),
        		worksheetName: "Floor Management List"
        	});
        });
       
        $('.actionpanel button,.detailpanel button,.otherpanel button').click(function(){
        	var jobcarddocno=$('#jobcarddocno').val();
        	if(jobcarddocno==""){
        		swal({
					type: 'error',
					title: 'Warning',
					text: 'Please select a document'
				});
        		return false;
        	}
        	var modaltarget=$(this).attr('data-target');
        	$(modaltarget).modal('show');
        });
      
        $('#btncommentsend').click(function(){
        	var txtcomment=$('#txtcomment').val();
        	var jobcarddocno=$('#jobcarddocno').val();
        	if(txtcomment==""){
        		swal({
					type: 'error',
					title: 'Warning',
					text: 'Please type in comment'
				});
        		return false;
        	}
        	if(jobcarddocno==""){
        		swal({
					type: 'error',
					title: 'Warning',
					text: 'Please select a document'
				});
        		return false;
        	}
        	saveComment();
        });
        
        $('.warningpanel div button').click(function(){
        	var gridrows=$('#floorMgmtGrid').jqxGrid('getrows');
        	if(gridrows.length==0){
        		swal({
					type: 'error',
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
        		$('#floorMgmtGrid').jqxGrid('removefilter',$(this).attr('data-datafield'), true);
        	}
        });
    });
  
    function addGridFilters(id,filtervalue,datafield,filtertype,filtercondition){
    	var filtergroup = new $.jqx.filter();
    	var filter_or_operator = 1;
    	var filter1 = filtergroup.createfilter(filtertype, filtervalue, filtercondition);

    	filtergroup.addfilter(filter_or_operator, filter1);
    	$("#floorMgmtGrid").jqxGrid('addfilter', datafield, filtergroup);
    	$("#floorMgmtGrid").jqxGrid('applyfilters');
 	}
 	
    function saveComment(){
    	var comment=$('#txtcomment').val();
    	var jobcarddocno=$('#jobcarddocno').val();
    	var x=new XMLHttpRequest();
		x.onreadystatechange=function(){
			if (x.readyState==4 && x.status==200)
			{
				var items=x.responseText.trim().split(",");
				getComments();		
			}
		}
		x.open("GET","saveComment.jsp?comment="+comment.replace(/ /g, "%20")+"&jobcarddocno="+jobcarddocno,true);
		x.send();
    }
    
    function getComments(){
    	var jobcarddocno=$('#jobcarddocno').val();
    	var x=new XMLHttpRequest();
		x.onreadystatechange=function(){
			if (x.readyState==4 && x.status==200)
			{
				$('.comments-container').html('');
				if(x.responseText.trim()!=""){
					var items=x.responseText.trim().split(",");
					var str='';
					for(var i=0;i<items.length;i++){
						str+='<div class="comment"><div class="msg"><p>'+items[i].split("::")[0]+'</p></div><div class="msg-details"><p>'+items[i].split("::")[1]+' - '+items[i].split("::")[2]+'</p></div></div>';
					}
					$('.comments-container').html($.parseHTML(str));		
				}
			}
		}
		x.open("GET","getComments.jsp?jobcarddocno="+jobcarddocno,true);
		x.send();
    }
    
    function funGetCountData(){
    	var brhid=$('#cmbbranch').val();
    	var x=new XMLHttpRequest();
		x.onreadystatechange=function(){
			if (x.readyState==4 && x.status==200)
			{
				var items=x.responseText.trim().split("::");
				$('.badge-mrp').text(items[0]);
				$('.badge-wo').text(items[1]);
				$('.badge-blnd').text(items[2]);
				$('.badge-mr').text(items[3]);
				$('.badge-min').text(items[4]);
				$('.badge-qa').text(items[5]);
				$('.badge-pc').text(items[6]);
				$('.badge-fp').text(items[7]);
				$('.badge-del').text(items[8]);
				$('.badge-inv').text(items[9]);
			}
		}
		x.open("GET","getCountData.jsp?brhid="+brhid,true);
		x.send();
    }
    
    function JSONToCSVCon(JSONData, ReportTitle, ShowLabel) {
        var arrData = typeof JSONData != 'object' ? JSON.parse(JSONData) : JSONData;
        var CSV = '';    
        CSV += ReportTitle + '\r\n\n';

        if (ShowLabel) {
            var row = "";
            for (var index in arrData[0]) {
                row += index + ',';
            }
            row = row.slice(0, -1);
            CSV += row + '\r\n';
        }
        
        for (var i = 0; i < arrData.length; i++) {
            var row = "";
            for (var index in arrData[i]) {
                row += '"' + arrData[i][index] + '",';
            }
            row.slice(0, row.length - 1);
            CSV += row + '\r\n';
        }

        if (CSV == '') {        
            alert("Invalid data");
            return;
        }   
        
        var fileName = "";
        fileName += ReportTitle.replace(/ /g,"_");   
        var uri = 'data:text/csv;charset=utf-8,' + escape(CSV);
        
        var link = document.createElement("a");    
        link.href = uri;
        link.style = "visibility:hidden";
        link.download = fileName + ".csv";
        
        document.body.appendChild(link);
        link.click();
        document.body.removeChild(link);
    }
</script>
</body>
</html>