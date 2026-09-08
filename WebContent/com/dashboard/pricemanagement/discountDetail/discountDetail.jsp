<jsp:include page="../../../../includes.jsp"></jsp:include>    
<%@ taglib prefix="s" uri="/struts-tags" %>
<%
	String contextPath=request.getContextPath();
 %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>GatewayERP(i)</title>
<link href="../../../../css/dashboard.css" media="screen" rel="stylesheet" type="text/css" />  

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

/* ===== LEFT SIDEBAR ===== */
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

/* Cards */
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
    width: 60px;
}

/* ===== UNIFORM 24px INPUTS & SELECTS ===== */
input[type="text"], select,
.release-filter-table input[type="text"],
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
.release-filter-table input[readonly],
.release-filter-table input:disabled {
    background-color: #f3f6f9 !important;
    color: #555;
    border-color: #e1e8ed;
}

/* ===== BUTTONS ===== */
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
}

.btn-submit:hover {
    background: #1d4ed8;
}

.btn-submit:disabled {
    background: #9ca3af;
    cursor: not-allowed;
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
}

.split-bottom-area {
    display: flex;
    gap: 20px;
    margin-top: 20px;
}

.split-bottom-area > div {
    flex: 1;
}

.product-info-panel {
    background: #f8fafc;
    border: 1px solid #e3e8ee;
    border-radius: 8px;
    padding: 15px;
}

.product-info-table {
    width: 100%;
    border-collapse: collapse;
}

.product-info-table td {
    padding: 4px 0;
}

.product-info-label {
    font-size: 12px;
    font-weight: 600;
    color: #4e5e71;
    width: 30%;
}

.product-info-value {
    font-size: 13px;
    font-weight: 600;
    color: #2563eb;
}
</style>

<script type="text/javascript">

$(document).ready(function () {
	  $("body").prepend('<div id="overlay" class="ui-widget-overlay" style="z-index: 1; display: none;"></div>');
	  $("body").prepend("<div id='PleaseWait' style='display: none;position:absolute; z-index: 1;top:180px;right:550px;'><img src='../../../../icons/31load.gif'/></div>");
 
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
	 
	 $("#updatdata").attr("disabled",true);
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
});

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

function getname(event)
{
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
}

function funExportBtn(){
	JSONToCSVCon(dat1, 'General Review', true);
}

function funreload(event)
{
	  var fromdates=new Date($('#fromdate').jqxDateTimeInput('getDate'));
	  var todates=new Date($('#todate').jqxDateTimeInput('getDate')); 
	 	 
	  if(fromdates>todates){
		   $.messager.alert('Message','To Date Less Than From Date  ','warning');   
	       return false;
	  } 
	  else
	  {
		   var type=   $("#type option:selected").text().trim();
		   if(document.getElementById("name").value=="")
		   {
			   $.messager.alert('Message',' Search Your '+type ); 
			   document.getElementById("name").focus();
			   return 0;
		   }
    	 var barchval = document.getElementById("cmbbranch").value;
         var fromdate= $("#fromdate").val();
    	 var todate= $("#todate").val();
    	 var type=$("#type").val();
    	 var brandid=$("#brandid").val();
    	 var catid=$("#catid").val();
    	 var subcatid=$("#subcatid").val();                  
    	 var psrno=$("#psrno").val();  
    	   
    	 $("#overlay, #PleaseWait").show(); 
    	 var types="yes";
    	   
     	 $("#mainlistdiv").load("DiscountmainlistGrid.jsp?barchval="+barchval+"&fromdate="+fromdate+"&todate="+todate+"&type="+type+"&brandid="+brandid+"&catid="+catid+"&subcatid="+subcatid+"&psrno="+psrno+"&types="+types);
	  }
}
	
  function funCalculate()
  {
	  $("#updatdata").attr("disabled",false);
	  var discountval=document.getElementById("discountval").value;
	  
	  if(discountval=="" || typeof(discountval)=="undefined")
	  {
		  $.messager.alert('Message', ' Enter Max Discount ', function(r){});
		  return 0;
	  }
	  
	  var rows = $("#jqxpmgt").jqxGrid('getrows');
	  for(var i=0 ; i < rows.length ; i++){
	      var pricegroup=rows[i].pricegroup;
	      var counts=rows[i].counts;
	      	
	      if(pricegroup>0)
	      {
	     	if(pricegroup==1)
	    	{
	    	    $('#jqxpmgt').jqxGrid('setcellvalue', i, "discount1",discountval);
	    	}
	     	else {
                var allowdiscount=(parseFloat(discountval)/parseInt(counts))*(counts-pricegroup+1);
	     		$('#jqxpmgt').jqxGrid('setcellvalue', i, "discount1",allowdiscount);
	     	}
	      }
	  }
  }

  function save(listss){
		var x=new XMLHttpRequest();
		x.onreadystatechange=function(){
			if (x.readyState==4 && x.status==200)
			{
				 var items= x.responseText;
				 var itemval=items.trim();
				 	
                if(parseInt(itemval)==1)
                {
				 	$.messager.alert('Message', '  Record successfully Updated ', function(r){});
				 	funreload(event);
				    $("#jqxpmgt").jqxGrid('clear');
					 document.getElementById("name1").innerText="";
					 document.getElementById("name2").innerText="";
					 document.getElementById("name3").innerText="";
					 document.getElementById("productid").innerText="";
					 document.getElementById("productname").innerText="";
					 document.getElementById("productbrand").innerText="";
					 $("#updatdata").attr("disabled",true);  
				}
                else
                {
				    $.messager.alert('Message', '  Not Updated ', function(r){});
				}  
		    }
		}
	x.open("GET","pricesavedata.jsp?list="+listss+'&psrno='+document.getElementById("psrno").value+'&std_cost='+document.getElementById("std_cost").value+'&fixing='+document.getElementById("fixing").value+'&labourcharge='+document.getElementById("labourcharge").value);
		x.send();
  }

  function hidebranch()
  {
  }

  function clearnames()
  {
		 $("#mainlistgrid").jqxGrid('clear');
		  $("#mainlistgrid").jqxGrid('addrow', null, {});
		  $("#jqxpmgt").jqxGrid('clear');
		  document.getElementById("name1").innerText="";
			 document.getElementById("name2").innerText="";
			 document.getElementById("name3").innerText="";
			 document.getElementById("productid").innerText="";
			 document.getElementById("productname").innerText="";
			 document.getElementById("productbrand").innerText="";
			 document.getElementById("discountval").value="";
			 	
			 	document.getElementById("rowindexs").value="";
			 	document.getElementById("std_cost").value="";
			 	document.getElementById("psrno").value="";
			 	document.getElementById("labourcharge").value="";
				document.getElementById("fixing").value="";
				
			 document.getElementById("name").value="";
			 	document.getElementById("brandid").value="";
			 	document.getElementById("catid").value="";
			 	document.getElementById("subcatid").value="";
  }
	
  function funprocess()
  {
      $("#overlay, #PleaseWait").show();
      var rows = $("#mainlistgrid").jqxGrid('getrows');
      for(var i=0 ; i < rows.length ; i++){
          var std_cost=rows[i].std_cost;
          if(std_cost>0 && std_cost!="" && typeof(std_cost)!="undefined")
          {
              $('#mainlistgrid').jqxGrid('setcellvalue', i, "std_cost",0);
          }
          if(std_cost>0 && std_cost!="" && typeof(std_cost)!="undefined")
          {
              $('#mainlistgrid').jqxGrid('setcellvalue', i, "std_cost",std_cost);
              $('#mainlistgrid').jqxGrid('setcellvalue', i, "cellselects",1);
          }
      }
      $("#overlay, #PleaseWait").hide();
  }
</script>
</head>
<body onload="getBranch();hidebranch();">
    <div id="mainBG" class="homeContent" data-type="background"> 
        <div class="master-container">

            <div class="sidebar-filters">
                <div class="sidebar-scroll-content">
                    <div class="filter-card">
                        <table class="release-filter-table">
                            <tr>
                                <td class="label-cell">Type</td>
                                <td>
                                    <select id="type" name="type" onchange="clearnames()">
                                        <option value="BR">Brand</option>
                                        <option value="CA">Category</option>
                                        <option value="SC">Sub Category</option>
                                        <option value="PR">Product</option>
                                    </select>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2">
                                    <input type="text" id="name" placeholder="Press F3 for Search" readonly="readonly" onkeydown="getname(event);" name="name" value='<s:property value="name"/>'>
                                </td>
                            </tr>
                        </table>

                        <div style="display:none;">
                            <div id='fromdate' name='fromdate' value='<s:property value="fromdate"/>'></div>
                            <div id='todate' name='todate' value='<s:property value="todate"/>'></div>
                            <button type="button" class="icon" id="process" title="Process" onclick="funprocess();">
                                <img alt="process" src="<%=contextPath%>/icons/process2.png" width="18" height="18">
                            </button>
                            <input type="hidden" name="updatdata" id="updatdata" value="Update" onclick="funupdates()">
                        </div>

                        <input type="hidden" id="brandid" name="brandid">  
                        <input type="hidden" id="catid" name="catid">
                        <input type="hidden" id="subcatid" name="subcatid">      
                        <input type="hidden" id="psrno" name="psrno">
                        <input type="hidden" id="rowindexs" name="rowindexs">       
                        <input type="hidden" id="discountval" name="discountval">
                        <input type="hidden" id="std_cost" name="std_cost">
                        <input type="hidden" id="fixing" name="fixing">
                        <input type="hidden" id="labourcharge" name="labourcharge">
                    </div>
                </div>
            </div>

            <div class="main-content-area">
                
                <div class="top-toolbar-container">
                    <jsp:include page="../../heading.jsp"></jsp:include>
                </div>

                <div class="grid-content-container">
                    <div id="mainlistdiv" style="flex:1;"><jsp:include page="DiscountmainlistGrid.jsp"></jsp:include></div>
                    
                    <div class="split-bottom-area">
                        <div id="pricelistdiv"><jsp:include page="Discountpricelistgrid.jsp"></jsp:include></div>
                        
                        <div class="product-info-panel">
                            <table class="product-info-table">
                                <tr>
                                    <td class="product-info-label"><label id="name1"></label></td>
                                    <td class="product-info-value"><label id="productid"></label></td>
                                </tr>
                                <tr>
                                    <td class="product-info-label"><label id="name2"></label></td>
                                    <td class="product-info-value"><label id="productname"></label></td>
                                </tr>
                                <tr>
                                    <td class="product-info-label"><label id="name3"></label></td>
                                    <td class="product-info-value"><label id="productbrand"></label></td>
                                </tr>
                            </table>
                        </div>
                    </div>
                </div>

            </div>

        </div> 
        
        <div id="brandsearchwindow"><div></div><div></div></div>
        <div id="catsearchwindow"><div></div><div></div></div>
        <div id="subcatsearchwindow"><div></div><div></div></div>	
        <div id="productwindow"><div></div></div>

    </div>
</body>
</html>