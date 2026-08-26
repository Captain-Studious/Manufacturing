<% String contextPath=request.getContextPath();%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>GatewayERP(i)</title>
<jsp:include page="../../../../includes.jsp"></jsp:include>
 
<script type="text/javascript">

$(document).ready(function () { 
	//$('#btnSearch').attr('disabled', true);   
	$("#date").jqxDateTimeInput({width : '109px',height : '21',formatString : "dd.MM.yyyy"});
      		document.getElementById("formdet").innerText="Processes(PRS)";
    		document.getElementById("formdetail").value="Processes";
    		document.getElementById("formdetailcode").value="PRS";
    		window.parent.formCode.value="PRS";
    		window.parent.formName.value="Processes";
  });
function funSearchLoad(){
	changeContent('processSearch.jsp', $('#window'));    
 }
	function funFocus(){
		document.getElementById("processes").focus();
	}
	
	function funReadOnly() {
		$('#frmprs input').attr('readonly', true);
		$('#date').jqxDateTimeInput({ disabled: true}); 
	}
	
	function funRemoveReadOnly() {
		$('#frmprs input').attr('readonly', false);
		$('#date').jqxDateTimeInput({ disabled: false}); 
		$('#docno').attr('readonly', true);
		
	}
	
	function setValues() {
		if($('#date').val()){
			$("#date").jqxDateTimeInput('val', $('#date').val());
		}
		if($('#msg').val()!=""){
			$.messager.alert('Message',$('#msg').val());
		}    
		var docno=$("#docno").val();                        
		$('#prsdiv').load("processGrid.jsp?docno="+docno+"&id="+1);        
	}
	    
	function funNotify(){
		if(document.getElementById("processes").value==''){
			document.getElementById("errormsg").innerText="Name is Mandatory.";
			return false;
		}
		document.getElementById("errormsg").innerText="";
		var rows = $("#jqxprsGrid").jqxGrid('getrows');
			 var length=0;
			 for(var i=0 ; i < rows.length ; i++){       
				var chk=rows[i].test;
				if(typeof(chk) != "undefined" && typeof(chk) != "NaN" && chk != ""){
					newTextBox = $(document.createElement("input"))
				    .attr("type", "dil")
				    .attr("id", "test"+length)
				    .attr("name", "test"+length)
					.attr("hidden", "true");
					length=length+1;
					
				newTextBox.val(rows[i].test+"::"+rows[i].description+":: "+rows[i].method+":: "+rows[i].limits+":: "+rows[i].rowno);
				newTextBox.appendTo('form');        
				}
			  }
			$('#prsgridlen').val(length);                        
		 return 1;
	}
	
	function funChkButton() {
		   /* funReset(); */
		  }
		  

</script>
</head>
<!-- onload="setValues();" -->
<body onload="setValues();">
<div id="mainBG" class="homeContent" data-type="background">
<form id="frmprs" action="saveprsAction" method="post" autocomplete="off" >
	<jsp:include page="../../../../header.jsp" />
	<br/> 
<fieldset><legend>Process Details</legend>    
<table width="100%">
  <tr>
    <td width="5%" align="right">Date</td>
    <td width="16%"><div id="date" name="date" value='<s:property value="date"/>'></div></td>
    <td width="10%">&nbsp;</td>
    <td colspan="3">&nbsp;</td>   
    <td align="right">Doc No.</td>
    <td width="5%"><input type="text" id="docno" name="docno" value='<s:property value="docno"/>' readonly tabindex="-1"></td>
  </tr>
  <tr>
    <td align="right">Name</td>
    <td><input type="text" name="processes" id="processes" style="width: 99%" value='<s:property value="processes"/>' ></td> 
    <td align="right" width="10%">Description</td>
    <td colspan="5" align="left"><input type="text" name="prodesc" id="prodesc" style="width: 99%" value='<s:property value="prodesc"/>' ></td>           
   </tr>
  <tr>    
	<td><input type="hidden" name="mode" id="mode" value='<s:property value="mode"/>' /> 
	<input type="hidden" name="deleted" id="deleted" value='<s:property value="deleted"/>' />
	<input type="hidden" name="prsgridlen" id="prsgridlen" value='<s:property value="prsgridlen"/>' />          
	<input type="hidden" id="msg" name="msg" value='<s:property value="msg"/>' /></td>
  </tr>       
</table>
</fieldset>

<table width="100%">
  <tr>
   <td>
   
   <div id="prsdiv"><jsp:include page="processGrid.jsp"></jsp:include></div>    
   </td>
  </tr>
</table>


</form>
</div>
<br/> 
	
</body>
</html>