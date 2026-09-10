 
<jsp:include page="../../../../includes.jsp"></jsp:include>    
<%@ taglib prefix="s" uri="/struts-tags" %>

<!DOCTYPE html>
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>GatewayERP(i)</title>
<link href="../../../../css/dashboard.css" media="screen" rel="stylesheet" type="text/css" /> 
<script type="text/javascript">


$(document).ready(function () {   
	
	    $("body").prepend('<div id="overlay" class="ui-widget-overlay" style="z-index: 1; display: none;"></div>');
	    $("body").prepend("<div id='PleaseWait' style='display: none;position:absolute; z-index: 1;top:180px;right:550px;'><img src='../../../../icons/31load.gif'/></div>");


	    $("#update").attr('disabled', true );
	    $('#branchlabel').hide();
	    $('#branchdiv').hide();
	   
	    $('#DetailsWindow').jqxWindow({width: '50%', height: '65%',  maxHeight: '80%' ,maxWidth: '60%' , title: 'Search',position: { x: 150, y: 120 } ,  showCloseButton: true, keyboardCloseKey: 27});
		 $('#DetailsWindow').jqxWindow('close');
	     
		 $('#part_no').dblclick(function(){
			 adjustmentSearchContent('lprMastersearch.jsp');
		  });
		 
// 		 $('#txtsdocno').dblclick(function(){
// 			 assignmentSearchContent('assignmentSearchGrid.jsp');
// 		  });
		 
// 	    var fromdates=new Date($('#fromdate').jqxDateTimeInput('getDate'));
// 	    var onemounth=new Date(new Date(fromdates).setMonth(fromdates.getMonth()-1)); 
	    
//         $('#fromdate').jqxDateTimeInput('setDate', new Date(onemounth));
// 	    $('#todate').on('change', function (event) {
			
// 	    var fromdates=new Date($('#fromdate').jqxDateTimeInput('getDate'));
		 
//         // out date
        
// 		var todates=new Date($('#todate').jqxDateTimeInput('getDate')); //del date
		 	 
// 		if(fromdates>todates){
			   
// 	    $.messager.alert('Message','To Date Less Than From Date  ','warning');   
			 
// 	    return false;
// 		  }   
// 	 });

});
function getAsset(event){
    var x= event.keyCode;
    if(x==114){
    	adjustmentSearchContent('lprMastersearch.jsp');
    }
    else{}
    }

function adjustmentSearchContent(url) {
    $('#DetailsWindow').jqxWindow('open');
	$.get(url).done(function (data) {
	$('#DetailsWindow').jqxWindow('setContent', data);
	$('#DetailsWindow').jqxWindow('bringToFront');
}); 
}

function funreload(event){
	 var branchval = document.getElementById("cmbbranch").value;
 	 var fromdate ="";
	 var todate ="";
	
	 
	 var aa="load";
	var psrno= document.getElementById("psrno").value;
	
	
	
	if(psrno=="")
		{
		
	 
		$.messager.alert('Message', '  Product is required ');
		 
		   
		    return 0;
		
		}
	 $("#overlay, #PleaseWait").show();
	 $("#lisrsd").load("listgrid.jsp?psrno="+psrno+"+branchval="+branchval+'&fromdate='+fromdate+'&todate='+todate+'&check='+aa);
	}

function funExportBtn(){
	 
	  	JSONToCSVCon(datas1,'StockAdjustment', true);
	 
}
function funupdates()
{
	
	$.messager.confirm('Message', 'Do you want to save changes?', function(r){
	 	  
	   	if(r==false)
	   	  {
	   		
	   	  }
	   	else
	   		{
	
	   	 save1();
	  
	   		} 
	    });
	
	  }





function save1()
{
	  //$("#listgridmain").jqxGrid('clearfilters');
	
	 var selectedrows = $("#listgridmain").jqxGrid('selectedrowindexes');
	  selectedrows = selectedrows.sort(function(a,b){return a - b});
	 // alert(selectedrows.length);
	  
		if(selectedrows.length=="0")
			{
		  $.messager.alert('Message','Select Items To be Processed','warning');   
		  return 0;
			}
	
	var aa=0;
	var bb=0;   
	var cc=0; 
	 
	//alert($('#gridlength').val());
	for(var i=0 ; i < selectedrows.length ; i++){   
		
		
		var zz=$('#listgridmain').jqxGrid('getcelltext', i, "aqty");
		var yy=$('#listgridmain').jqxGrid('getcelltext', i, "abatchno"); 
		var xx=$('#listgridmain').jqxGrid('getcelltext', i, "aexpdate");
		 
	 
		if(zz=="0" || zz==0) 
	 	   {
			$.messager.alert('Message','Adjust Qty is Zero ','warning');  
			 
			 
			   
		    return 0;
			
	 	   }
		
		
		if(zz=="" || zz==null || typeof(zz)=="undefiend") 
	 	   {
			 
			cc=1;
			break;
			
	 	   }
		if(yy=="" || yy==null || typeof(yy)=="undefiend") 
	 	   {
			 
			bb=1;
			break;
			
	 	   }
	 
			 
			if(xx=="" || xx==null || typeof(xx)=="undefiend") 
		 	   {
				 
				aa=1;
				break;
				
		 	   }
	
	
			
			

	}
			
			if(cc==1)
			{
				$.messager.alert('Message','Adjust Qty is required ','warning');  
			    return 0;
			}
 
			if(bb==1)
			{
		 
			$.messager.alert('Message','Adjust Batch No is required ','warning');  
			 return 0;
			
			}
	 	   		
			if(aa==1)
				{
			  $.messager.alert('Message','Adjust expiry date is required ','warning');  
			   return 0;
				
				}
	
	
	var list = new Array();
	 
    for(var i=0 ; i < selectedrows.length ; i++){ 
	   list.push($("#listgridmain").jqxGrid('getcellvalue',selectedrows[i],'stockid')+"::"+$("#listgridmain").jqxGrid('getcellvalue',selectedrows[i],'aqty')+"::"
			   +$("#listgridmain").jqxGrid('getcellvalue',selectedrows[i],'abatchno')+"::"+$("#listgridmain").jqxGrid('getcellText',selectedrows[i],'aexpdate')+"::");
		 
   	}
		
    save(list);
	
}

 function save(list){
	 
	  
	 
		var x=new XMLHttpRequest();
		x.onreadystatechange=function(){
			if (x.readyState==4 && x.status==200) 
				{
				 var items= x.responseText;
				 	var itemval=items.trim();
				//alert(itemval);
      if(parseInt(itemval)==1)
      			{
				 	$.messager.alert('Message', '  Record successfully Updated ', function(r){
					     
				     });
				 	 $("#update").attr('disabled', true );
 
				 	funreload(event);
				 	
					
				}
			else
				{
					$.messager.alert('Message', '  Not Updated ', function(r){
				     
			     });
				}  
		}
		}  
		
	 
	x.open("GET","savedata.jsp?doc_no="+document.getElementById("psrno").value+"&list="+list);
		x.send();
	}

 


</script>


<style>
/* ===== MASTER LAYOUT ===== */
html, body, #mainBG, .hidden-scrollbar {
    height: 100%;
    margin: 0;
    overflow: hidden;
    background-color: #f4f7f9;
}

.master-container {
    display: flex;
    width: 100%;
    height: 100vh;
    font-family: 'Segoe UI', 'Roboto', 'Arial', sans-serif;
}

/* ===== LEFT SIDEBAR ===== */
.sidebar-filters {
    width: 250px; 
    flex: 0 0 250px; 
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

/* Cards Layout Rules */
.filter-card {
    background: #f8fafc;
    border: 1px solid #e3e8ee;
    border-radius: 12px;
    padding: 15px;
    margin-bottom: 12px;
}

/* Internal Presentation Tables */
.filter-table {
    width: 100%;
    border-spacing: 0 10px;
}

.filter-table .label-cell {
    text-align: right;
    padding-right: 10px;
    font-size: 12px;
    color: #4e5e71;
    font-weight: 600;
    width: 70px;
}

/* ===== UNIFORM 24px INPUTS & SELECTS ===== */
input[type="text"], select,
.filter-table input[type="text"],
.filter-table select {
    width: 100%;
    height: 24px !important;             
    padding: 2px 8px !important;         
    border: 1px solid #ccd6e0 !important;
    border-radius: 4px !important;       
    font-size: 12px !important;          
    background-color: #ffffff;
    box-sizing: border-box;
    color: #333;
    outline: none;
}



/* ===== MASTER 30px BUTTON SYSTEM ===== */
.btn-submit {
    width: 100%;
    height: 30px !important;            
    padding: 0 12px !important;
    background: #2563eb !important;
    color: #fff !important;
    border: none !important;
    border-radius: 4px !important;
    font-size: 13px !important;
    font-weight: 600 !important;
    cursor: pointer;
    line-height: 30px !important;
    white-space: nowrap;
    text-align: center;
    transition: all 0.2s ease;
    box-shadow: none !important;
    display: inline-block;
    box-sizing: border-box;
    margin-bottom: 8px;
}

.btn-submit:hover {
    background: #1d4ed8 !important;
}

/* ===== RIGHT CONTENT AREA (Horizontally Aligned Heading) ===== */
.main-content-wrapper {
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

.scrollable-grid-area {
    flex: 1;
    padding: 15px 20px;
    overflow: auto; 
    box-sizing: border-box;
}
</style>
</head>
<body onload="getBranch();">
<div id="mainBG" class="homeContent" data-type="background"> 
<div class='hidden-scrollbar'>

<div class="master-container">

    <div class="sidebar-filters">
        <div class="sidebar-scroll-content">

            <div class="filter-card">
                <table class="filter-table">
                    <tr>
                        <td class="label-cell">Product</td>
                        <td>
                            <input type="text" id="part_no" name="part_no" readonly="readonly" placeholder="Press F3 to Search" value='<s:property value="part_no"/>' onkeydown="getAsset(event);"/>
                        </td>
                    </tr>
                    <tr>
                        <td class="label-cell"></td>
                        <td>
                            <input type="text" id="prdname" name="prdname" readonly="readonly" value='<s:property value="prdname"/>'>
                        </td>
                    </tr>
                </table>

                <hr style="border: 0; border-top: 1px solid #e1e8ed; margin: 15px 0;">

                <input type="button" class="btn-submit" name="Update" id="update" value="Update" onclick="funupdates()">
            </div>

            <div style="display:none;">
                <input type="hidden" id="psrno" name="psrno" value='<s:property value="psrno"/>' />
            </div>

        </div>
    </div>

    <div class="main-content-wrapper">
        
        <div class="top-toolbar-container">
            <jsp:include page="../../heading.jsp"></jsp:include>
        </div>

        <div class="scrollable-grid-area">
            <div id="lisrsd">
                <jsp:include page="listgrid.jsp"></jsp:include>
            </div>
        </div>

    </div>

</div>

<div id="DetailsWindow">
	<div></div><div></div>
</div>

</div>
</div>
</body>
</html>