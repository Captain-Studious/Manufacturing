<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<html>
<%
String contextPath=request.getContextPath();
%>
<%@page import="com.controlcentre.settings.productsettings.productmaster.ClsProductMasterDAO"%>
<%ClsProductMasterDAO DAO= new ClsProductMasterDAO(); %>
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
	    $("#date").jqxDateTimeInput({ width: '109px', height: '21px' ,formatString : "dd.MM.yyyy" });
	    $('#faiSearchWindow').jqxWindow({width: '25%', height: '58%',  maxHeight: '70%' ,maxWidth: '25%' , title: 'Fixed Asset ID Search',position: { x: 420, y: 87 } , theme: 'energyblue', showCloseButton: true, keyboardCloseKey: 27});
		$('#faiSearchWindow').jqxWindow('close');
		$('#uomSearchWindow').jqxWindow({width: '25%', height: '58%',  maxHeight: '70%' ,maxWidth: '25%' , title: 'UOM Search',position: { x: 420, y: 87 } , theme: 'energyblue', showCloseButton: true, keyboardCloseKey: 27});
		$('#uomSearchWindow').jqxWindow('close');
	    $('#btnSearch').attr('disabled', true);
	    document.getElementById("formdet").innerText="Machinery(MCY)";    
		document.getElementById("formdetail").value="Machinery";   
		document.getElementById("formdetailcode").value="MCY";
		window.parent.formCode.value="MCY";         
		window.parent.formName.value="Machinery";
		
		$('#mdfaids').dblclick(function(){
			  faiSearchContent("faiSearch.jsp");
		});
		$('#ecuoms').dblclick(function(){
			  uomSearchContent("uomSearch.jsp");
		});
		
 		var datamcy= '<%=DAO.prdmcyLoad(session)%>';             
             var num = 0; 
            var source =
            {
                datatype: "json",
                datafields: [
                          	{name : 'doc_no' , type: 'number' },
     						{name : 'name', type: 'String'  },
     						{name : 'desc1', type: 'String'  },
                          	{name : 'date', type: 'date'  },
                          	{name : 'machineid', type: 'String'  },
                          	{name : 'mdname', type: 'String'  },
                          	{name : 'mdtype', type: 'String'  },
                          	{name : 'mdusage', type: 'String'  },
                          	{name : 'mdfaid', type: 'String'  },
                          	{name : 'ecenergytype', type: 'String'  },
                          	{name : 'ecunit', type: 'String'  },
                          	{name : 'ecvalue', type: 'String'  },
                          	{name : 'eccapacity', type: 'String'  },
                          	{name : 'ectype', type: 'String'  },
                          	{name : 'ecuom', type: 'String'  },
                          	{name : 'ecuoms', type: 'String'  },
                          	{name : 'mdfaids', type: 'String'  },
                 ],
               localdata: datamcy,
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
    
            $("#jqxmcySearch").jqxGrid(
                    {
                    	width: 1100,
                    	height:200,
                        source: dataAdapter,
                        showfilterrow: true,
                        filterable: true,
                        selectionmode: 'singlerow',
                        enabletooltips:true,      
                        //Add row method
                        columns: [               
									{ text: 'Doc No', datafield: 'doc_no', width: '5%' },
									{ text: 'Name', datafield: 'name', width: '15%' },
									{ text: 'Description', datafield: 'desc1', width: '20%' },
									{ text: 'Date', datafield: 'date', width: '6%',cellsformat:'dd.MM.yyyy' },
									{ text: 'Machine ID', datafield: 'machineid', width: '6%' },   
									{ text: 'Name', datafield: 'mdname', width: '15%' },
									{ text: 'Type', datafield: 'mdtype', width: '8%' },
									{ text: 'Usage', datafield: 'mdusage', width: '10%' },
									{ text: 'Fixed Asset ID', datafield: 'mdfaids', width: '6%' },
									{ text: 'Fixed Asset ID', datafield: 'mdfaid', width: '6%',hidden:true },
									{ text: 'Energy Type', datafield: 'ecenergytype', width: '8%' },
									{ text: 'Unit', datafield: 'ecunit', width: '8%' },
									{ text: 'Value', datafield: 'ecvalue', width: '6%' },
									{ text: 'Capacity', datafield: 'eccapacity', width: '6%' },
									{ text: 'Type', datafield: 'ectype', width: '8%' },
									{ text: 'Uom', datafield: 'ecuoms', width: '7%' },
									{ text: 'Uom', datafield: 'ecuom', width: '7%',hidden:true },               
        	              ]    
                    });   
            $('#jqxmcySearch').on('rowdoubleclick', function (event) {         
                var rowindex1=event.args.rowindex;
                document.getElementById("docno").value= $('#jqxmcySearch').jqxGrid('getcellvalue', rowindex1, "doc_no"); 
                document.getElementById("machinery").value = $("#jqxmcySearch").jqxGrid('getcellvalue', rowindex1, "name");
                document.getElementById("mcydesc").value = $("#jqxmcySearch").jqxGrid('getcellvalue', rowindex1, "desc1");
                $("#date").jqxDateTimeInput('val', $("#jqxmcySearch").jqxGrid('getcellvalue', rowindex1, "date"));
                document.getElementById("machineid").value = $("#jqxmcySearch").jqxGrid('getcellvalue', rowindex1, "machineid");
                document.getElementById("mdname").value = $("#jqxmcySearch").jqxGrid('getcellvalue', rowindex1, "mdname");
                document.getElementById("mdtype").value = $("#jqxmcySearch").jqxGrid('getcellvalue', rowindex1, "mdtype");
                document.getElementById("mdusage").value = $("#jqxmcySearch").jqxGrid('getcellvalue', rowindex1, "mdusage");
                document.getElementById("mdfaid").value = $("#jqxmcySearch").jqxGrid('getcellvalue', rowindex1, "mdfaid");
                document.getElementById("ecenergytype").value = $("#jqxmcySearch").jqxGrid('getcellvalue', rowindex1, "ecenergytype");
                document.getElementById("ecunit").value = $("#jqxmcySearch").jqxGrid('getcellvalue', rowindex1, "ecunit");
                document.getElementById("ecvalue").value = $("#jqxmcySearch").jqxGrid('getcellvalue', rowindex1, "ecvalue");
                document.getElementById("eccapacity").value = $("#jqxmcySearch").jqxGrid('getcellvalue', rowindex1, "eccapacity");
                document.getElementById("ectype").value = $("#jqxmcySearch").jqxGrid('getcellvalue', rowindex1, "ectype");
                document.getElementById("ecuom").value = $("#jqxmcySearch").jqxGrid('getcellvalue', rowindex1, "ecuom");         
                //document.getElementById("search").style.display="none";             
               // $('#window').jqxWindow('hide');
            }); 
        });
	function faiSearchContent(url) {
	    $('#faiSearchWindow').jqxWindow('open');
		$.get(url).done(function (data) {
		$('#faiSearchWindow').jqxWindow('setContent', data);
		$('#faiSearchWindow').jqxWindow('bringToFront');
	}); 
	}
	function uomSearchContent(url) {
	    $('#uomSearchWindow').jqxWindow('open');
		$.get(url).done(function (data) {
		$('#uomSearchWindow').jqxWindow('setContent', data);
		$('#uomSearchWindow').jqxWindow('bringToFront');   
	}); 
	}
	 function getFai(event){
         var x= event.keyCode;
         if(x==114){
        	 faiSearchContent("faiSearch.jsp");      
         }
         else{}
         }
	 function getUom(event){       
         var x= event.keyCode;
         if(x==114){
        	 uomSearchContent("uomSearch.jsp");
         }
         else{}
         }
	function funSearchLoad(){
		//changeContent('brandSearch.jsp', $('#window')); 
	 }
	/* function funReset() {
		$(this).closest('form').find("input[type=text]").val("");
		//$('#frmBrand').trigger("reset");
		//document.getElementById("frmBrand").reset();
		//document.getElementById("docno").value="";
		//document.getElementById("brand").value="";
	} */
	function funReadOnly() {               
		$('#frmMcy input').attr('readonly', true);
		$('#date').jqxDateTimeInput({
			readonly : true
		});
		$('#date').jqxDateTimeInput({disabled: true});
		
		/* 	$('#jqxDateTimeInput').jqxDateTimeInput({ disabled: true}); */
	}
	function funRemoveReadOnly() {
		$('#frmMcy input').attr('readonly', false);
		$('#date').jqxDateTimeInput({
			readonly : true
		});
		$('#date').jqxDateTimeInput({disabled: false});
		$('#docno').attr('readonly', true);
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
	
	/* $(function(){
	        $('#frmMcy').validate({
	                  rules: {
	                	 machinery: {
	                	 required:true,
	                	 maxlength:40
	                 }
	                 },
	                 messages: {
	                	  machinery: {
	                	  required:" *",
	                	  maxlength:"max 40 only"
	                  } 
	                 }
	        });}); */  
	     function funNotify(){
	    
	    		return 1;
		} 
	     function funFocus(){
	    	 document.getElementById("machinery").focus();
	     }
	  
</script>  
 
</head>
<body onLoad="setValues();" >      
<form id="frmMcy" action="savemcyAction" method="get" autocomplete="off">   
	<jsp:include page="../../../../header.jsp" />
	<br/> 
	<fieldset><legend> Machinery Details</legend>        
	<table width="100%">
<tr>
<td>
<table width="100%">
		<tr><td width="6%" align="right">Date</td>
			<td width="31%"  align="left"><div id="date" name="date"></div></td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td width="46%" align="right">Doc No.</td>
			<td width="17%"><input type="text" name="docno" id="docno" value='<s:property value="docno"/>' readonly  tabindex="-1"></td>
		</tr>
       
        <!-- pattern=".{1,3}" required="required" -->
		<tr><td width="6%" align="right">Name</td>
			<td width="31%" align="left" ><input type="text" name="machinery" id="machinery"   style="width:99%;" value='<s:property value="machinery"/>' ></td>
			<td width="20%" align="right">Description</td>
				<td width="65%" colspan="3"><input type="text" id="mcydesc" name="mcydesc" style="width:99%;" value='<s:property value="mcydesc"/>'/></td>
			</tr>
  </table>   
        <input type="hidden" name="mode" id="mode" value='<s:property value="mode"/>' /> 
        <input type="hidden" name="deleted" id="deleted" value='<s:property value="deleted"/>' />   
		<input type="hidden" id="msg" name="msg" value='<s:property value="msg"/>' /></td> 
    </tr>
    </table>  
	<fieldset><legend> Machine Details</legend> 
		<table width="100%">
			<tr><td width="6%" align="right">Machine ID</td>   
				<td width="31%" align="left" ><input type="text" name="machineid" id="machineid"  value='<s:property value="machineid"/>' ></td>
				<td width="6%" align="right">Name</td>
				<td width="31%" align="left" ><input type="text" name="mdname" id="mdname"  value='<s:property value="mdname"/>' ></td>
				<td width="6%" align="right">Type</td>   
				<td width="31%" align="left" ><input type="text" name="mdtype" id="mdtype"  value='<s:property value="mdtype"/>' ></td>    
			</tr>
			<tr><td width="6%" align="right">Usage</td>  
				<td width="31%" align="left" ><input type="text" name="mdusage" id="mdusage"  value='<s:property value="mdusage"/>' ></td>
				<td width="20%" align="right">Fixed Asset ID</td>
				<td width="65%"><input type="hidden" id="mdfaid" name="mdfaid" style="width:50%;" value='<s:property value="mdfaid"/>'/>
				<input type="text" id="mdfaids" name="mdfaids" style="width:50%;" readonly  onkeydown="getFai(event);" placeholder="Fixed Asset ID Search" value='<s:property value="mdfaids"/>'/></td>   
				</tr>   
	    </table>     
	</fieldset>
	<table width="100%">    
	    <tr>
		    <td width="50%">     
			    <fieldset><legend> Energy Consumption</legend> 
					<table width="100%">
						<tr><td width="6%" align="right">Energy Type</td>      
							<td width="31%" align="left" ><input type="text" name="ecenergytype" id="ecenergytype"  value='<s:property value="ecenergytype"/>' ></td>
							<td width="6%" align="right">Unit</td>
							<td width="31%" align="left" ><input type="text" name="ecunit" id="ecunit"  value='<s:property value="ecunit"/>' ></td>
							<td width="6%" align="right">Value</td>   
							<td width="31%" align="left" ><input type="text" name="ecvalue" id="ecvalue"  value='<s:property value="ecvalue"/>' ></td>    
						</tr>       
				    </table> 
		        </fieldset>          
		    </td>
		    <td width="50%">     
			    <fieldset><legend> Capacity Details</legend>       
					<table width="100%">
						<tr><td width="6%" align="right">Capacity(Prod./ Hrs)</td>      
							<td width="31%" align="left" ><input type="text" name="eccapacity" id="eccapacity"  value='<s:property value="eccapacity"/>' ></td>
							<td width="6%" align="right">Type</td>
							<td width="31%" align="left" ><input type="text" name="ectype" id="ectype"  value='<s:property value="ectype"/>' ></td>
							<td width="6%" align="right">Uom</td>             
							<td width="31%" align="left" ><input type="hidden" name="ecuom" id="ecuom"  value='<s:property value="ecuom"/>' >
							<input type="text" name="ecuoms" id="ecuoms"  onkeydown="getUom(event);" readonly placeholder="UOM Search" value='<s:property value="ecuoms"/>' ></td>    
						</tr>   
				    </table> 
		        </fieldset>      
		    </td>
	    </tr>  
	</table>
	</fieldset>
    	
	</form>
<table width="100%">
      <tr>
        <td width="3%">&nbsp;</td>
        <td width="42%"><div id="jqxmcySearch"></div>  
</td>
        <td width="55%">&nbsp;</td>
      </tr>
    </table>
<br/>
<div id="faiSearchWindow">     
	<div></div><div></div>
</div> 
<div id="uomSearchWindow">
	<div></div><div></div>
</div> 
</body>
</html>