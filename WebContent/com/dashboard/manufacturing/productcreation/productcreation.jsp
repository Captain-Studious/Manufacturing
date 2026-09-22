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
    box-shadow: 0 1px 3px rgba(0,0,0,0.1);
    transition: background 0.2s;
    margin-bottom: 10px;
}

.btn-update-green:hover {
    background-color: #059669;
    color: #fff;
}

/* ===== EXISTING STYLES ===== */
.modalStyle {      
    background-color:#33b5e5; 
    padding: 10px; 
}
.borderStyle{  
    margin-bottom: 0;
    background: #fff;
    border: 1px solid #e1e8ed;
    border-radius: 8px;
    box-shadow: 0 2px 4px rgba(0,0,0,0.02);
    overflow: hidden;
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
    font-family: 'Segoe UI', Tahoma, sans-serif;
    font-size: 15px;
    font-weight: bold;
    margin: 0;
}
.hidden-scrollbar {
    height: 630px;
    overflow-x: hidden;
} 
</style>  
</head>       
<body> 
<div class='hidden-scrollbar'>                              
  <div class="container-fluid">
      
    <div class="row">
      <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">            
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

            <button type="button" class="action-btn" id="btnattachs" data-toggle="modal" data-target="#modalattach" data-tooltip="tooltip" title="Attach">
                <i class="fa fa-paperclip"></i> Attach
            </button>
            <button type="button" class="action-btn" id="btncomment" data-toggle="modal" data-tooltip="tooltip" title="Comments">
                <i class="fa fa-comments"></i> Comments
            </button>

            <div style="margin-left: auto;">
                <label class="status" id="lblclientstatushead" name="lblclientstatushead"></label>
            </div>
            
        </div>                         
      </div>      
    </div>
           
    <div class="row" style="padding-top:5px;">          
      <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">          
        <div id="productdiv" class="borderStyle"><jsp:include page="ProductGrid.jsp"></jsp:include></div>                     
      </div>
    </div> 

    <div class="row" style="padding-top:15px;">  
      <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
        <button type="button" id="updatebtn" class="btn-update-green" onclick="funReserve();">
            <i class="fa fa-check"></i> Update Selected
        </button>          
        <div id="deptdiv" class="borderStyle"><jsp:include page="deptProductGrid.jsp"></jsp:include></div>
      </div>
    </div> 

    <div class="row" style="padding-top:15px;">  
      <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">          
        <div id="thirddiv" class="borderStyle"><jsp:include page="viewProductGrid.jsp"></jsp:include></div>                     
      </div>
    </div>

    <div id="sidesearchwndow">
	   <div></div>
	</div>
      
    <div id="modalcomments" class="modal fade" role="dialog">
      <div class="modal-dialog">
        <div class="modal-content">
          <div class="modal-header modalStyle">     
            <button type="button" class="close" data-dismiss="modal">&times;</button>  
            <h4 class="modal-title" style="text-align:center; color:#fff;">Comments</h4>
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

    <input type="hidden" name="hidbrhid" id="hidbrhid">  
    <input type="hidden" name="srvdetmtrno" id="srvdetmtrno"> 
    <input type="hidden" name="hidpsrno" id="hidpsrno"> 
    <input type="hidden" name="hidvoc" id="hidvoc"> 
    <input type="hidden" name="hidprdid" id="hidprdid"> 
    <input type="hidden" name="srvdetmtrnonw" id="srvdetmtrnonw"> 
    <input type="hidden" name="hidcomments" id="hidcomments"> 
    <input type="hidden" name="hidtype" id="hidtype"> 
    <input type="hidden" name="rowindexg" id="rowindexg"> 

  </div>
</div>

<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@7.24.4/dist/sweetalert2.all.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.6-rc.0/js/select2.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/js-cookie@2/src/js.cookie.min.js"></script>
<script type="text/javascript">   
    $(document).ready(function(){ 
    	document.getElementById("one").checked=true;
    	$('#productdiv').show();
		$('#deptdiv').show();
		$('#updatebtn').show();
		$('#thirddiv').hide();
        $('[data-tooltip="tooltip"]').tooltip();
        
    	 $("body").prepend('<div id="overlay" class="ui-widget-overlay" style="z-index: 1000; display: none;"></div>');
	     $("body").prepend("<div id='PleaseWait' style='display: none;position:absolute; z-index: 1001;top:50%;left:50%;transform:translate(-50%,-50%);'><img src='../../../../icons/31load.gif'/></div>");
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
</script>   
</body>    
</html>