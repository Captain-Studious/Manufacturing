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

.filter-card-header {
    margin-top: 0;
    font-size: 13px;
    color: #4e5e71;
    margin-bottom: 15px;
    font-weight: 600;
    border-bottom: 1px solid #e1e8ed;
    padding-bottom: 8px;
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

/* Action buttons layout */
.release-actions {
    display: flex;
    gap: 10px;
    justify-content: center;
    margin-top: 15px;
}

.release-actions .btn-submit {
    min-width: 80px;
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
    padding: 15px;
    overflow: auto; 
    box-sizing: border-box;
}
</style>

<script type="text/javascript">

$(document).ready(function () {
    $('#userwindow').jqxWindow({ width: '30%', height: '55%',  maxHeight: '75%' ,maxWidth: '50%' , title: 'User Search' ,position: { x: 200, y: 70 }, keyboardCloseKey: 27});
    $('#userwindow').jqxWindow('close');  
    $("body").prepend('<div id="overlay" class="ui-widget-overlay" style="z-index: 1; display: none;"></div>');
    $("body").prepend("<div id='PleaseWait' style='display: none;position:absolute; z-index: 1;top:180px;right:550px;'><img src='../../../../icons/31load.gif'/></div>");
 
    $("#fromdate").jqxDateTimeInput({ width: '100%', height: '24px',formatString:"dd.MM.yyyy"});
    $("#todate").jqxDateTimeInput({ width: '100%', height: '24px',formatString:"dd.MM.yyyy"});
    var fromdates=new Date($('#fromdate').jqxDateTimeInput('getDate'));
    var onemounth=new Date(new Date(fromdates).setMonth(fromdates.getMonth()-1)); 
	    
    $('#fromdate').jqxDateTimeInput('setDate', new Date(onemounth));
	   
    $('#user').dblclick(function(){
		usersearchcontent('searchuser.jsp?'); 
    });
});

function getuser(event){
	 var x= event.keyCode;
	 if(x==114){
	    usersearchcontent('searchuser.jsp?');   
     }
} 

function usersearchcontent(url) {
	  $('#userwindow').jqxWindow('open');
       $.get(url).done(function (data) {
      $('#userwindow').jqxWindow('setContent', data);
	}); 
}

function funExportBtn(){
}

function funreload(event)
{
	 var barchval = document.getElementById("cmbbranch").value;
	 $("#overlay, #PleaseWait").show();
	 $("#mainlistdiv").load("mainlistGrid.jsp?barchval="+barchval);    
}
	
 function funupdate()
 {
	 	var listss = new Array();
	 	var rows = $("#sidelistgrid").jqxGrid('getrows');
	   for(var i=0 ; i < rows.length-1 ; i++){
		   if((rows[i].tos>0) ||  (rows[i].tos=0))
		   { 
		       if((rows[i].permargin>0) ||  (rows[i].permargin=0))
		       { 
	               listss.push(rows[i].froms+"::"+rows[i].tos+"::"+rows[i].permargin); 
		       }
		   }
	   }
	   ajaxcall(listss); 
 }
    
  function updatedatass(){
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
				 	hidebranch();
				}
                else
                {
				    $.messager.alert('Message', '  Not Updated ', function(r){});
				}           
		    }
		}
	x.open("GET","savedata.jsp?saldocno="+document.getElementById("saldocno").value+'&userdocno='+document.getElementById("userdocno").value+'&cat='+document.getElementById("cat").value+'&usgper='+document.getElementById("usgper").value);
		x.send();
	}  
	
	function hidebranch()
	{
		document.getElementById("branddocno").value="";
		document.getElementById("user").value="";
		document.getElementById("salname").value="";
		document.getElementById("cat").value="1";
		document.getElementById("usgper").value="";
		document.getElementById("saldocno").value="";
		document.getElementById("userdocno").value="";
		
		$('#updatdata').attr('disabled', true);
		$('#user').attr('disabled', true);
		$('#salname').attr('disabled', true);  
		$('#cat').attr('disabled', true);
		$('#usgper').attr('disabled', true);
	}
	
	function getcat() {
		var x = new XMLHttpRequest();
		x.onreadystatechange = function() {
			if (x.readyState == 4 && x.status == 200) {
				var items = x.responseText;
				items = items.split('####');
				
				var catid  = items[0].split(",");
				var cat = items[1].split(",");
			 	var optionsbranch = ' ';  
				for (var i = 0; i < cat.length; i++) {
					optionsbranch += '<option value="' + catid[i].trim() + '">'
							+ cat[i] + '</option>';
				}
				$("select#cat").html(optionsbranch);
			}
		}
		x.open("GET","getcat.jsp", true);
		x.send();
	}	
</script>
</head>
<body onload="getBranch();hidebranch();getcat();">
    <div id="mainBG" class="homeContent" data-type="background"> 
        <div class="master-container">

            <div class="sidebar-filters">
                <div class="sidebar-scroll-content">
                    
                    <div class="filter-card">
                        <h4 class="filter-card-header">User & Usage Data</h4>
                        <table class="release-filter-table">
                            <tr>
                                <td class="label-cell">Salesman</td>
                                <td>
                                    <input type="text" id="salname" name="salname" value='<s:property value="salname"/>'>
                                </td>
                            </tr>
                            <tr>
                                <td class="label-cell">User</td>
                                <td>
                                    <input type="text" id="user" placeholder="Press F3 to Search" name="user" onkeydown="getuser(event);" value='<s:property value="user"/>'>
                                </td>
                            </tr>
                            <tr>
                                <td class="label-cell">Category</td>
                                <td>
                                    <select id="cat" name="cat">
                                        <option></option>
                                    </select>
                                </td>
                            </tr>
                            <tr>
                                <td class="label-cell">Def.usage %</td>
                                <td>
                                    <input type="number" id="usgper" name="usgper" value='<s:property value="usgper"/>'>
                                </td>
                            </tr>
                        </table>
                        
                        <div class="release-actions">
                            <button type="button" class="btn-submit" name="updatdata" id="updatdata" onclick="updatedatass();">Update</button>
                        </div>
                    </div>

                    <div style="display: none;">
                        <div id='fromdate' name='fromdate' value='<s:property value="fromdate"/>'></div>
                        <div id='todate' name='todate' value='<s:property value="todate"/>'></div>
                    </div>
                    <input type="hidden" name="branddocno" id="branddocno" value='<s:property value="branddocno"/>'>
                    <input type="hidden" name="saldocno" id="saldocno" value='<s:property value="saldocno"/>'>        
                    <input type="hidden" name="userdocno" id="userdocno" value='<s:property value="userdocno"/>'>
                    
                </div>
            </div>

            <div class="main-content-area">
                
                <div class="top-toolbar-container">
                    <jsp:include page="../../heading.jsp"></jsp:include> 
                </div>

                <div class="grid-content-container">
                    <div id="mainlistdiv"><jsp:include page="mainlistGrid.jsp"></jsp:include></div>
                </div>

            </div>

        </div> 
        
        <div id="userwindow">
           <div></div>
        </div>

    </div>
</body>
</html>