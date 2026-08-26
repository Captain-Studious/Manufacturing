<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<html>
<%
String contextPath=request.getContextPath();
%>
<%@page import="com.controlcentre.settings.suitabilitysettings.suitabilitymaster.ClsSuitabilityMasterDAO"%>
<%ClsSuitabilityMasterDAO DAO= new ClsSuitabilityMasterDAO(); %>
<head>
<title>GatewayERP(i)</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<jsp:include page="../../../../includes.jsp"></jsp:include>
<style>
form label.error {
color:red;
  font-weight:bold;

}
</style>
<script type="text/javascript">
	$(document).ready(function () {  
		$('#btnSearch').attr('disabled', true);
		$('#btnEdit').attr('disabled', true);
		$('#btnDelete').attr('disabled', true);
		
		  
	    $("#date").jqxDateTimeInput({ width: '125px', height: '15px' ,formatString : "dd.MM.yyyy" });
	    
	    document.getElementById("formdet").innerText="Year Of Manufacturer(SYOM)";
		document.getElementById("formdetail").value="Year Of Manufacturer";
		document.getElementById("formdetailcode").value="SYOM";
		window.parent.formCode.value="SYOM";
		window.parent.formName.value="Year Of Manufacturer";
 		var databrand= '<%=DAO.suitYomLoad(session)%>';
             var num = 0; 
            var source =
            {
                datatype: "json",
                datafields: [
                          	{name : 'doc_no' , type: 'number' },
     						{name : 'yom', type: 'String'  },
                          	{name : 'date', type: 'date'  }
                 ],
               localdata: databrand,
                //url: "/searchDetails",
                pager: function (pagenum, pagesize, oldpagenum) {
                    // callback called when a page or page size is changed.
                }
            };
            var dataAdapter = new $.jqx.dataAdapter(source,
            		 {
                		loadError: function (xhr, status, error) {
	                   // alert(error);    
	                    }
		            }		
            );
    
            $("#jqxYomGrid").jqxGrid(
                    {
                    	width: 850,
                    	height: 300,
                        source: dataAdapter,
                        showfilterrow: true,
                        filterable: true,
                        selectionmode: 'singlerow',
                        //Add row method
                        columns: [
        					{ text: 'DOC NO', datafield: 'doc_no', width: '20%' },
        					{ text: 'YEAR OF MANUFACTURER',columntype: 'textbox', filtertype: 'input', datafield: 'yom', width: '50%' },
        					{ text: 'DATE',columntype: 'textbox', filtertype: 'input', datafield: 'date', width: '30%',cellsformat:'dd.MM.yyyy' }
        	              ]
                    });
            $('#jqxYomGrid').on('rowdoubleclick', function (event) {
                var rowindex1=event.args.rowindex;
                document.getElementById("docno").value= $('#jqxYomGrid').jqxGrid('getcellvalue', rowindex1, "doc_no"); 
                document.getElementById("yom").value = $("#jqxYomGrid").jqxGrid('getcellvalue', rowindex1, "yom");
                $('#date').jqxDateTimeInput({disabled: false});
                $("#date").jqxDateTimeInput('val', $("#jqxYomGrid").jqxGrid('getcellvalue', rowindex1, "date"));
                $('#date').jqxDateTimeInput({disabled: true});
                //document.getElementById("search").style.display="none";
               // $('#window').jqxWindow('hide');
            }); 
        });
	function funSearchLoad(){
		changeContent('brandSearch.jsp', $('#window')); 
	 }
	/* function funReset() {
		$(this).closest('form').find("input[type=text]").val("");
		//$('#frmBrand').trigger("reset");
		//document.getElementById("frmBrand").reset();
		//document.getElementById("docno").value="";
		//document.getElementById("brand").value="";
	} */
	function funReadOnly() {
		$('#frmYom input').attr('readonly', true);
		$('#date').jqxDateTimeInput({
			readonly : true
		});
		$('#date').jqxDateTimeInput({disabled: true});
		/* 	$('#jqxDateTimeInput').jqxDateTimeInput({ disabled: true}); */
	}
	function funRemoveReadOnly() {
		$('#frmYom input').attr('readonly', false);
		$('#date').jqxDateTimeInput({
			readonly : false
		});
		$('#docno').attr('readonly', true);
		$('#date').jqxDateTimeInput({disabled: false});
	}
/* 	function show_image(src, width, height, alt,position,norepeat) {
	    var img = document.createElement("img");
	    img.src = src;
	    img.width = width;
	    img.height = height;
	    img.alt = alt;
	    img.position=position;
	    img.repeat=norepeat;

	    // This next line will just add it to the <body> tag
	    document.body.appendChild(img);
	} */
	function setValues() {
		if($('#datehidden').val()){
			$("#date").jqxDateTimeInput('val', $('#date').val());
		}
		 if($('#msg').val()!=""){
			   $.messager.alert('Message',$('#msg').val());
			  }
	}
	
	 $(function(){
	        $('#frmYom').validate({
	                 rules: {
	                	 yom: {
	                	 required:true,
	                	 maxlength:40
	                 }
	                 },
	                 messages: {
	                	 yom: {
	                	  required:" *",
	                	  maxlength:"max 40 only"
	                  } 
	                 }
	        });});
	     function funNotify(){
	    
	    		return 1;
		} 
	     function funFocus(){
	    	 document.getElementById("yom").focus();
	     }
	  
</script>  
 
</head>
<body onLoad="setValues();" >
<form id="frmYom" action="saveSuityomAction" method="get" autocomplete="off">
	<jsp:include page="../../../../header.jsp" />
	<br/> 
	<fieldset><legend> Year Of Manufacturer</legend>
	<table width="100%">
  <tr>
    <td width="5%" align="right">Date</td>
    <td width="16%"><div id="date" name="date" value='<s:property value="date"/>'></div></td>
    <td colspan="3" align="right">Doc No.</td>
    <td width="30%"><input type="text" id="docno" name="docno" value='<s:property value="docno"/>' readonly tabindex="-1"></td>
  </tr>
  <tr>
    <td align="right">YOM</td>
    <td><input type="text" name="yom" id="yom" placeholder="Year of Manufact." value='<s:property value="yom"/>' ></td>
   <td><input type="hidden" name="mode" id="mode" value='<s:property value="mode"/>' /> 
<input type="hidden" name="deleted" id="deleted" value='<s:property value="deleted"/>' />
<input type="hidden" id="msg" name="msg" value='<s:property value="msg"/>' /></td>
  </tr>
</table>
	
	</fieldset>
    	
	</form>
<table width="100%">
      <tr>
        <td width="3%">&nbsp;</td>
        <td width="42%">	 <div id="jqxYomGrid"></div>  
</td>
        <td width="55%">&nbsp;</td>
      </tr>
    </table>
<br/>
		<%-- 	<div id="window">
				<div id="windowHeader" class="windowHead">
					<span> <img src="../../../../icons/search_new.png" alt="" style="margin-right: 15px" />Search
					</span>
				</div>
				<div id="windowContent" class="windowCont" style="overflow: hidden;">
					<jsp:include page="brandSearch.jsp"></jsp:include>
				</div></div>
	 --%>
	

</body>
</html>