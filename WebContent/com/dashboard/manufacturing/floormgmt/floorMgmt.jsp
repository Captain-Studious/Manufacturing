<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
   
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
    .custompanel{
      border:1px solid #ccc;
      float: left;
      display: inline-block;
      margin-top: 10px; 
      margin-right: 10px;
      padding-right: 10px;
      padding-left: 10px;
      padding-top: 10px;
      padding-bottom: 10px;
      border-radius: 8px;
    }
    /*.custompanel .buttoncontainer{
    	clear:both;
    	float:left;
    	display:inline-block;
    }
     .custompanel div{
    	float: left;
      	display: inline-block;
      	margin:0;
      	padding:0;
      	width:auto;
    }
    .custompanel button{
       border:none;
    }*/
    .badge-notify{
	   position:absolute;right:-5px;top:-8px;z-index:2;background-color:red;
	} 
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
	    float: left;
	    width: 100px;
	    height: 100px;
	    margin: 0 10px 10px 0;
	    padding: 20px 20px 20px;
	    border-radius: 5px;
	    text-align: center;
	    background-color: #fff;
	    position:absolute;
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
  <div class="container-fluid">
    <div class="row rowgap">
      <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
        <div class="primarypanel custompanel">
  			<button type="button" class="btn btn-default" id="btnsubmit" data-toggle="tooltip" title="Submit" data-placement="bottom"><i class="fa fa-refresh" aria-hidden="true"></i></button>
          	<button type="button" class="btn btn-default" id="btnexcel" data-toggle="tooltip" title="Excel Export" data-placement="bottom"><i class="fa fa-file-excel-o " aria-hidden="true"></i></button>
        	
        </div>
        
        <div class="warningpanel custompanel">
          <div class="btn-group" role="group">
          	<button type="button" class="btn btn-default" id="btnmrp" data-toggle="tooltip" title="MRP" data-placement="bottom" data-filtervalue="N" data-datafield="mrp" data-filtertype="stringfilter" data-filtercondition="contains">MRP</button>
          	<span class="badge badge-notify badge-mrp">3</span>
          </div>	
          <div class="btn-group" role="group">
          	<button type="button" class="btn btn-default" id="btnwo" data-toggle="tooltip" title="WO" data-placement="bottom" data-filtervalue="N" data-datafield="wo" data-filtertype="stringfilter" data-filtercondition="contains">WO</button>
          	<span class="badge badge-notify badge-wo">3</span>
          </div>
          <div class="btn-group" role="group">
          	<button type="button" class="btn btn-default" id="btnblnd" data-toggle="tooltip" title="BLND" data-placement="bottom" data-filtervalue="N" data-datafield="blnd" data-filtertype="stringfilter" data-filtercondition="contains">BLND</button>
          	<span class="badge badge-notify badge-blnd">3</span>
          </div>
          <div class="btn-group" role="group">
          	<button type="button" class="btn btn-default" id="btnmr" data-toggle="tooltip" title="MR" data-placement="bottom" data-filtervalue="N" data-datafield="mr" data-filtertype="stringfilter" data-filtercondition="contains">MR</button>
          	<span class="badge badge-notify badge-mr">3</span>
          </div>
          <div class="btn-group" role="group">
          	<button type="button" class="btn btn-default" id="btnmin" data-toggle="tooltip" title="MIN" data-placement="bottom" data-filtervalue="N" data-datafield="min" data-filtertype="stringfilter" data-filtercondition="contains">MIN</button>
          	<span class="badge badge-notify badge-min">3</span>
          </div>
          <div class="btn-group" role="group">
          	<button type="button" class="btn btn-default" id="btnqa" data-toggle="tooltip" title="QA" data-placement="bottom" data-filtervalue="N" data-datafield="qa" data-filtertype="stringfilter" data-filtercondition="contains">QA</button>
          	<span class="badge badge-notify badge-qa">3</span>
          </div>
        	 <div class="btn-group" role="group">
          	<button type="button" class="btn btn-default" id="btnpc" data-toggle="tooltip" title="PC" data-placement="bottom" data-filtervalue="N" data-datafield="pc" data-filtertype="stringfilter" data-filtercondition="contains" >PC</button>
          	<span class="badge badge-notify badge-pc">3</span>
          </div>
          <div class="btn-group" role="group">
          	<button type="button" class="btn btn-default" id="btnfp" data-toggle="tooltip" title="FP" data-placement="bottom" data-filtervalue="N" data-datafield="fp" data-filtertype="stringfilter" data-filtercondition="contains">FP</button>
          	<span class="badge badge-notify badge-fp">3</span>
          </div>
          <div class="btn-group" role="group">
          	<button type="button" class="btn btn-default" id="btndel" data-toggle="tooltip" title="DEL" data-placement="bottom" data-filtervalue="N" data-datafield="del" data-filtertype="stringfilter" data-filtercondition="contains">DEL</button>
          	<span class="badge badge-notify badge-del">3</span>
          </div>
           <div class="btn-group" role="group">
          	<button type="button" class="btn btn-default" id="btninv" data-toggle="tooltip" title="INV" data-placement="bottom" data-filtervalue="N" data-datafield="inv" data-filtertype="stringfilter" data-filtercondition="contains">INV</button>
          	<span class="badge badge-notify badge-inv">3</span>
          </div>
        </div>
       
      </div>
    </div>
    <div class="row">
      <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
        <div id="floormgmtgriddiv"><jsp:include page="floorMgmtGrid.jsp"></jsp:include></div>
      </div>
    </div>


    <!-- Vehicle Movement Modal-->
   

    <!-- Comments Modal-->
    <div id="modalcomments" class="modal fade" role="dialog">
      <div class="modal-dialog">
        <div class="modal-content">
          <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal">&times;</button>
            <h4 class="modal-title">Comments</h4>
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
  
  
  <!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script> -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@7.24.4/dist/sweetalert2.all.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.6-rc.0/js/select2.min.js"></script>
<script type="text/javascript">
    $(document).ready(function(){
        $('[data-toggle="tooltip"]').tooltip(); 
       
      /*   $("#baymovupdateindate").jqxDateTimeInput({ width: '125px', height: '15px', formatString:"dd.MM.yyyy"});
        $("#baymovupdateintime").jqxDateTimeInput({ width: '80px', height: '15px', formatString:"HH:mm",showCalendarButton:false});
        $("#baymovupdateoutdate").jqxDateTimeInput({ width: '125px', height: '15px', formatString:"dd.MM.yyyy"});
        $("#baymovupdateouttime").jqxDateTimeInput({ width: '80px', height: '15px', formatString:"HH:mm",showCalendarButton:false}); */
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
    	/* if(id=="btnoverdue" || id=="btnextendeddate"){
			var d=new Date();
			var day=d.getDate();
			var month=d.getMonth();
			var year=d.getFullYear();    		
    		filtervalue=new Date(year,month,day);
    		filter_or_operator=0;
    	}  */
    	//var filtercondition = 'contains';
    	var filter1 = filtergroup.createfilter(filtertype, filtervalue, filtercondition);

    	filtergroup.addfilter(filter_or_operator, filter1);
    	//filtergroup.addfilter(filter_or_operator, filter2);r
    	// add the filters.
    	$("#floorMgmtGrid").jqxGrid('addfilter', datafield, filtergroup);
    	// apply the filters.
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
			else
			{
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
			else
			{
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
			/* 	for(var i=1,j=6;i<=14;i++,j++){
					$('#z'+i+'count').val(items[j]);
				} */
			}
			else
			{
			}
		}
		x.open("GET","getCountData.jsp?brhid="+brhid,true);
		x.send();
    }
    
     
function JSONToCSVCon(JSONData, ReportTitle, ShowLabel) {

    var arrData = typeof JSONData != 'object' ? JSON.parse(JSONData) : JSONData;
    
   // alert("arrData");
    var CSV = '';    
    //Set Report title in first row or line
    
    CSV += ReportTitle + '\r\n\n';

    //This condition will generate the Label/Header
    if (ShowLabel) {
        var row = "";
        
        //This loop will extract the label from 1st index of on array
        for (var index in arrData[0]) {
            
            //Now convert each value to string and comma-seprated
            row += index + ',';
        }

        row = row.slice(0, -1);
        
        //append Label row with line break
        CSV += row + '\r\n';
    }
    
    //1st loop is to extract each row
    for (var i = 0; i < arrData.length; i++) {
        var row = "";
        
        //2nd loop will extract each column and convert it in string comma-seprated
        for (var index in arrData[i]) {
            row += '"' + arrData[i][index] + '",';
        }

        row.slice(0, row.length - 1);
        
        //add a line break after each row
        CSV += row + '\r\n';
    }

    if (CSV == '') {        
        alert("Invalid data");
        return;
    }   
    
    //Generate a file name
    var fileName = "";
    //this will remove the blank-spaces from the title and replace it with an underscore
    fileName += ReportTitle.replace(/ /g,"_");   
    
    //Initialize file format you want csv or xls
    var uri = 'data:text/csv;charset=utf-8,' + escape(CSV);
    
    // Now the little tricky part.
    // you can use either>> window.open(uri);
    // but this will not work in some browsers
    // or you will not get the correct file extension    
    
    //this trick will generate a temp <a /> tag
    var link = document.createElement("a");    
    link.href = uri;
    
    //set the visibility hidden so it will not effect on your web-layout
    link.style = "visibility:hidden";
    link.download = fileName + ".csv";
    
    //this part will append the anchor tag and remove it after automatic click
    document.body.appendChild(link);
    link.click();
    document.body.removeChild(link);
}
  </script>
</body>
</html>
