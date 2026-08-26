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
<link href="https://fonts.googleapis.com/css?family=Rubik" rel="stylesheet" />
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

.status {
	color: #FD8725;
	font-family: comic sans ms;
	font-size: 15px;
	font-weight: bold;
}

  </style>
  <style>
.hidden-scrollbar {
  /* // overflow: auto; */
  height: 630px;
    overflow-x: hidden;
    
} 

</style>  
</head>      <!-- onload="getBranch();" -->    
<body> 
<div class='hidden-scrollbar'>                              
  <div class="container-fluid">
    <div class="row" >
      <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">            
        <div class="primarypanel custompanel" style="margin-left:2px;">
        
            
              <div class="row" > 
               <input id="one" type="radio" name="radios" onchange="showGrids(1);"onclick="$(this).attr('value', this.checked ? 1 : 0)" >
               <label for="one">ADD</label>
	           <input id="two" type="radio" name="radios" onchange="showGrids(2);" onclick="$(this).attr('value', this.checked ? 1 : 0)" >
	           <label for="two">VIEW</label>
           
             </div>
     </div>
     <span></span>
      <div class="primarypanel custompanel" style="margin-left:20px;">
     <div id="border1">  
	  			<button type="button" class="btn btn-default btnStyle" id="btnsubmit"  data-toggle="tooltip" title="Submit" data-placement="bottom"><i class="fa fa-refresh iconStyle" aria-hidden="true"></i></button>    
	          	<button type="button" class="btn btn-default btnStyle" id="btnexcel" data-toggle="tooltip" title="Excel Export" data-placement="bottom"><i class="fa fa-file-excel-o " aria-hidden="true"></i></button>    
                <button type="button" class="btn btn-default btnStyle" id="btncalc"  data-toggle="tooltip" onclick="funcalculate();" title="Calculate" data-placement="bottom"><i class="fa fa-calculator" aria-hidden="true"></i></button>
            </div>                                    
	  	 </div>
	  	 
	  	 <div class="otherpanel custompanel"  style="margin-left:5px;">             
           <div id="border1">
                <button type="button" class="btn btn-default btnStyle" id="btnattachs" data-toggle="modal" data-target="#modalattach" ><i class="fa fa-download" aria-hidden="true" data-toggle="tooltip" title="Attach" data-placement="bottom"></i></button>
	            <button type="button" class="btn btn-default btnStyle" id="btncomment"  data-toggle="modal"  data-tooltip="tooltip" title="Comments" data-placement="bottom"><i class="fa fa-comments" aria-hidden="true"></i></button>
	         <!--    <button type="button" class="btn btn-default btnStyle" id="btnsalesman"  data-toggle="modal" data-target="#modalsalesman" data-tooltip="tooltip" title="Date Statistics" data-placement="bottom"><i class="fa fa-bar-chart" aria-hidden="true"></i></button>
	            <button type="button" class="btn btn-default btnStyle" id="btnclient"  data-toggle="modal" data-target="#modalclient" data-tooltip="tooltip" title="Client Statistics" data-placement="bottom"><i class="fa fa-bar-chart" aria-hidden="true"></i></button> -->
           </div>                                            
	  	  </div>
	  	  <h6 class="modal-title" style="text-align:left"><label class="status" id="lblclientstatushead" name="lblclientstatushead"></label></h6>
        </div>                         
      
      </div>      
           
    <div class="row" style="padding-top:5px;">          
      <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">          
        <div id="productdiv" class="borderStyle"><jsp:include page="ProductGrid.jsp"></jsp:include></div>                     
      </div>
    </div> 
     <div class="row" style="padding-top:5px;">  
      <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
      <button type="button" class="btn btn-default" id="updatebtn"  onclick="funReserve();" style="background-color:green;color:yellow">Update</button>          
        <div id="deptdiv" class="borderStyle"><jsp:include page="deptProductGrid.jsp"></jsp:include></div>
           
           
                             
      </div>
     </div> 
      <div class="row" style="padding-top:5px;">  
      <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">          
        <div id="thirddiv" class="borderStyle"><jsp:include page="viewProductGrid.jsp"></jsp:include></div>                     
      </div>
     </div>
      <div id="sidesearchwndow">
	   <div ></div>
	</div>
      </div> 
     <!-- Comments Modal-->     
</div>
            
          
    <!-- Client Details Modal-->
       <input type="hidden" name="hidbrhid" id="hidbrhid">  
       <input type="hidden" name="srvdetmtrno" id="srvdetmtrno"> 
		<input type="hidden" name="hidpsrno" id="hidpsrno"> 
		<input type="hidden" name="hidvoc" id="hidvoc"> 
		<input type="hidden" name="hidprdid" id="hidprdid"> 
		<input type="hidden" name="srvdetmtrnonw" id="srvdetmtrnonw"> 
		<input type="hidden" name="hidcomments" id="hidcomments"> 
		<input type="hidden" name="hidtype" id="hidtype"> 
		<input type="hidden" name="rowindexg" id="rowindexg"> 
  <!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script> -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@7.24.4/dist/sweetalert2.all.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.6-rc.0/js/select2.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/js-cookie@2/src/js.cookie.min.js"></script>
<script type="text/javascript">   
    $(document).ready(function(){ 
    	//funprimseexceed();
    	document.getElementById("one").checked=true;
    	$('#productdiv').show();
		$('#deptdiv').show();
		$('#updatebtn').show();
		$('#thirddiv').hide();
    $('[data-tooltip="tooltip"]').tooltip();
        /*  $("#promdate").jqxDateTimeInput({ width: '85px', height: '15px', formatString:"dd.MM.yyyy"}); */
    	 $("body").prepend('<div id="overlay" class="ui-widget-overlay" style="z-index: 1; display: none;"></div>');
	     $("body").prepend("<div id='PleaseWait' style='display: none;position:absolute; z-index: 1;top:180px;right:550px;'><img src='../../../../icons/31load.gif'/></div>");
	     $('#sidesearchwndow').jqxWindow({ width: '55%', height: '92%',  maxHeight: '85%' ,maxWidth: '80%' ,title: 'Product Search ' , position: { x: 300, y: 0 }, keyboardCloseKey: 27});
	     $('#sidesearchwndow').jqxWindow('close');   
	     $('[data-toggle="tooltip"]').tooltip(); 
    	 
    	 $('#btnattachs').click(function(){ 
         	funAttachs(event); 
         	
         });
        $('#btnsubmit').click(function(){     
        	       	 
            funload(); 
           // $('#salmdiv').load('salesmanGrid.jsp?id='+1);   
           // $('#crmdiv').load('clientGrid.jsp?id='+1);      
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
    
    function showGrids(id){
    	if(parseInt(id)==1){
    		$('#two').val(0);
    	}
    	if(parseInt(id)==2){
    		$('#one').val(0);
    	}
    	var chk=$('#one').val();
    	var chk2=$('#two').val();
    	//alert("in showgrid==chk=="+chk+"==chk2=="+chk2);
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
    	 //alert(url);
    		 $.get(url).done(function (data) {
    			 
    			 $('#sidesearchwndow').jqxWindow('open');
    		$('#sidesearchwndow').jqxWindow('setContent', data);
    
    	}); 
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
    	var chk2=$('#two').val();
        if(parseInt(chk2)==1){
        	 $('#thirddiv').load("viewProductGrid.jsp?id="+1);
        }
        else{
        	 $('#productdiv').load("ProductGrid.jsp?id="+1);       
        }
	  
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

			
				var rows=$("#jqxdeptGrid").jqxGrid('getrows');
			//alert("selectedrowslength====="+selectedrows.length);
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
	 							var desc=	rows[chk].pdesc;
	 							
	 							var measure=rows[chk].measure;
	 							var deptid=rows[chk].deptid;
	 							
	 							var rowno=rows[chk].rowss;
	 							
	 						//  alert("row==="+rowno);
	 						  
	 						  //var rowno=0;
	 						  
	 						 purchasearray.push(psrno+" :: "+desc+" :: "+measure+" :: "+rowno+" :: "+deptid+" :: ");
	 						  
	 					  }
	 					  
	 					//  alert("purchasearray=="+purchasearray);
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
