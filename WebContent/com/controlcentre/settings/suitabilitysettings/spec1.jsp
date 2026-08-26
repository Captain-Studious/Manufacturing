<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<html>
<%
String contextPath=request.getContextPath();
%>
<%@page import="com.controlcentre.settings.suitabilitysettings.suitabilitymaster.ClsSuitabilityMasterDAO"%>
<%ClsSuitabilityMasterDAO DAO= new ClsSuitabilityMasterDAO(); %>
<% String name=request.getParameter("spec1"); 
String code=request.getParameter("specode1");

%>
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
		
		$('#yomsearchwindow').jqxWindow({
			width : '25%',
			height : '62%',
			maxHeight : '70%',
			maxWidth : '45%',
			title : 'Yom Search',
			position : {
				x : 420,
				y : 87
			},
			theme : 'energyblue',
			showCloseButton : true,
			keyboardCloseKey : 27
		});
		$('#yomsearchwindow').jqxWindow('close');
		$('#btnSearch').attr('disabled', true);
	    $("#date").jqxDateTimeInput({ width: '125px', height: '15px' ,formatString : "dd.MM.yyyy" });
	    
	    
		  
		 if($('#msg1').val()!=""){
		 	 
			   $.messager.alert('Message',$('#msg1').val());
			   
			   $('#msg1').val('');
			   
				  }
	    
	    $('#brandsearchwindow').jqxWindow({
			width : '25%',
			height : '62%',
			maxHeight : '70%',
			maxWidth : '45%',
			title : 'Brand Search',
			position : {
				x : 420,
				y : 87
			},
			theme : 'energyblue',
			showCloseButton : true,
			keyboardCloseKey : 27
		});
		$('#brandsearchwindow').jqxWindow('close');
		$('#modelsearchwindow').jqxWindow({
			width : '25%',
			height : '62%',
			maxHeight : '70%',
			maxWidth : '45%',
			title : 'Model Search',
			position : {
				x : 420,
				y : 87
			},
			theme : 'energyblue',
			showCloseButton : true,
			keyboardCloseKey : 27
		});
		$('#modelsearchwindow').jqxWindow('close');
		
		$('#submodelsearchwindow').jqxWindow({
			width : '25%',
			height : '62%',
			maxHeight : '70%',
			maxWidth : '45%',
			title : 'Type Search',
			position : {
				x : 420,
				y : 87
			},
			theme : 'energyblue',
			showCloseButton : true,
			keyboardCloseKey : 27
		});
		$('#submodelsearchwindow').jqxWindow('close');
		
		$('#brand').dblclick(function(){
			brandSearchContent("brandSearchGrid.jsp?yomfrm="+document.getElementById("yomfrm").value+"&yomto="+document.getElementById("yomto").value+"&dtype=other"); 
		});
		
		$('#model').dblclick(function(){
			var brandid=document.getElementById("brandid").value;
	 	   		modelSearchContent('modelSearchGrid.jsp?brandid='+brandid+"&yomfrm="+document.getElementById("yomfrm").value+"&yomto="+document.getElementById("yomto").value+'&dtype=other'); 
		});
		
		$('#submodel').dblclick(function(){
			var modelid=document.getElementById("modelid").value;
	 	   		submodelSearchContent('subModelSearchGrid.jsp?modelid='+modelid+"&yomfrm="+document.getElementById("yomfrm").value+"&yomto="+document.getElementById("yomto").value+'&dtype=other');
	 	   		
	 	   		
	 	   		
		});
		
	    <%if(!(name==null)) {%>
	    document.getElementById("formdet").innerText="<%=name%> Master(<%=code%>)";
		document.getElementById("formdetail").value="<%=name%> Master";
		document.getElementById("formdetailcode").value="<%=code%>";
		window.parent.formCode.value="<%=code%>";
		window.parent.formName.value="<%=name%>";
		document.getElementById("name").value="<%=name%>";
		<%}%>
		document.getElementById("name").value=window.parent.formName.value;
 		var databrand= '<%=DAO.suitSpec1load(session)%>';
             var num = 0; 
            var source =
            {
                datatype: "json",
                datafields: [
                          	{name : 'doc_no' , type: 'number' },
     						{name : 'spec', type: 'String'  },
     						{name : 'desc1', type: 'String'  },
     						{name : 'brand', type: 'String'  },
     						{name : 'brandid', type: 'String'  },
     						{name : 'model', type: 'String'  },
     						{name : 'modelid', type: 'String'  },
     						{name : 'submodel', type: 'String'  },
     						{name : 'submodelid', type: 'String'  },
                          	{name : 'date', type: 'date'  },
                          	
                          	{name : 'frmyomid', type: 'int'  },
                          	{name : 'fromyom', type: 'String'  },
                          	{name : 'toyomid', type: 'int'  },
                          	{name : 'toyom', type: 'String'  },
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
    
            $("#jqxSpec1Grid").jqxGrid(
                    {
                    	width: '100%',
                    	 height: 300,
                        source: dataAdapter,
                        showfilterrow: true,
                        filterable: true,
                        selectionmode: 'singlerow',
                        //Add row method
                        columns: [
        					{ text: 'DOC NO', datafield: 'doc_no', width: '5%' },
        					{ text: 'DATE',columntype: 'textbox', filtertype: 'input', datafield: 'date', width: '7%',cellsformat:'dd.MM.yyyy' },
        					{ text: 'Brand', datafield: 'brand', width: '13%' },
        					{ text: 'Model', datafield: 'model', width: '14%' },
        					{ text: 'Sub model', datafield: 'submodel', width: '12%' },
        					{ text: 'Brandid', datafield: 'brandid', width: '5%',hidden:true },
        					{ text: 'modelid', datafield: 'modelid', width: '5%',hidden:true },
        					{ text: 'submodelid', datafield: 'submodelid', width: '5%',hidden:true },
        					{ text: ''+document.getElementById("name").value,columntype: 'textbox', filtertype: 'input', datafield: 'spec', width: '13%' },
        					{ text: document.getElementById("name").value+'  Description',columntype: 'textbox', filtertype: 'input', datafield: 'desc1', width: '20%' },
        					
        					
        					{ text: 'YOM(From)',columntype: 'textbox', filtertype: 'input', datafield: 'fromyom', width: '8%' },
        					{ text: 'YOM(To)',columntype: 'textbox', filtertype: 'input', datafield: 'toyom', width: '8%' },
        					

        					{ text: 'YOM(From)id',columntype: 'textbox', filtertype: 'input', datafield: 'frmyomid', width: '28%'  ,hidden:true},
        					{ text: 'YOM(To)id',columntype: 'textbox', filtertype: 'input', datafield: 'toyomid', width: '28%' ,hidden:true},
        	              ]
                    });
            $('#jqxSpec1Grid').on('rowdoubleclick', function (event) {
                var rowindex1=event.args.rowindex;
                if($('#mode').val()=="view")
  				{
                $('#date').jqxDateTimeInput({disabled: false});
                $("#date").jqxDateTimeInput('val', $("#jqxSpec1Grid").jqxGrid('getcellvalue', rowindex1, "date"));
              //  $('#date').jqxDateTimeInput({disabled: true});
                document.getElementById("docno").value= $('#jqxSpec1Grid').jqxGrid('getcellvalue', rowindex1, "doc_no"); 
                document.getElementById("suitspec").value = $("#jqxSpec1Grid").jqxGrid('getcellvalue', rowindex1, "spec");
                document.getElementById("suitdesc").value = $("#jqxSpec1Grid").jqxGrid('getcellvalue', rowindex1, "desc1");
                document.getElementById("brand").value = $("#jqxSpec1Grid").jqxGrid('getcellvalue', rowindex1, "brand");
                document.getElementById("brandid").value = $("#jqxSpec1Grid").jqxGrid('getcellvalue', rowindex1, "brandid");
                document.getElementById("model").value = $("#jqxSpec1Grid").jqxGrid('getcellvalue', rowindex1, "model");
                document.getElementById("modelid").value = $("#jqxSpec1Grid").jqxGrid('getcellvalue', rowindex1, "modelid");
                document.getElementById("submodel").value = $("#jqxSpec1Grid").jqxGrid('getcellvalue', rowindex1, "submodel");
                document.getElementById("submodelid").value = $("#jqxSpec1Grid").jqxGrid('getcellvalue', rowindex1, "submodelid");
                
                
                document.getElementById("yomfrm").value = $("#jqxSpec1Grid").jqxGrid('getcellvalue', rowindex1, "fromyom");
                document.getElementById("yomto").value = $("#jqxSpec1Grid").jqxGrid('getcellvalue', rowindex1, "toyom");
                document.getElementById("yomfrmid").value = $("#jqxSpec1Grid").jqxGrid('getcellvalue', rowindex1, "frmyomid");
                document.getElementById("yomtoid").value = $("#jqxSpec1Grid").jqxGrid('getcellvalue', rowindex1, "toyomid");
          
  				}
                //document.getElementById("search").style.display="none";
               // $('#window').jqxWindow('hide');
            }); 
            
	$('#yomfrm').dblclick(function(){
    			
    			if($('#mode').val()=="view")
    				{
    				return 0;
    				}
    			
    			var yomfrm=document.getElementById("yomfrm").value;
    	 		var yomto=document.getElementById("yomto").value;
    	 		var type="frm";
    	 		yomSearchContent('yomSearchGrid.jsp?yomfrm='+yomfrm+'&yomto='+yomto+'&type='+type);   
    		});
    		
    		$('#yomto').dblclick(function(){
    			
    			if($('#mode').val()=="view")
    				{
    				return 0;
    				}
    			var yomfrm=document.getElementById("yomfrm").value;
    	 		var yomto=document.getElementById("yomto").value;
    	 		var type="to";
    	 		yomSearchContent('yomSearchGrid.jsp?yomfrm='+yomfrm+'&yomto='+yomto+'&type='+type);   
    		});
    		
        });

	function getYom(event,type){
		
		if($('#mode').val()=="view")
			{
			return 0;
			}
 		var yomfrm=document.getElementById("yomfrm").value;
 		var yomto=document.getElementById("yomto").value;
 	   	 var x= event.keyCode;
 	   	 if(x==114){
 	   		yomSearchContent('yomSearchGrid.jsp?yomfrm='+yomfrm+'&yomto='+yomto+'&type='+type);  	 }
 	    	 else{
 	   		 }
 	          	 }
		
		function yomSearchContent(url) {
			
		if($('#mode').val()=="view")
			{
			return 0;
			}
			$('#yomsearchwindow').jqxWindow('open');
			$.get(url).done(function(data) {
				$('#yomsearchwindow').jqxWindow('setContent', data);
				$('#yomsearchwindow').jqxWindow('bringToFront');
			});
		}
	function funReadOnly() {
		$('#frmspec1 input').attr('readonly', true);
		$('#date').jqxDateTimeInput({
			readonly : true
		});
		
		/* 	$('#jqxDateTimeInput').jqxDateTimeInput({ disabled: true}); */
	}
	function funRemoveReadOnly() {
		$('#frmspec1 input').attr('readonly', false);
		$('#date').jqxDateTimeInput({
			readonly : false
		});
		   
		  $('#yomfrm').attr('readonly', true);
		$('#yomto').attr('readonly', true);
		
		$('#docno').attr('readonly', true);
		$('#brand').attr('readonly', true);
		$('#model').attr('readonly', true);
		$('#submodel').attr('readonly', true);
	}

	function setValues() {
		if($('#datehidden').val()){
			$("#date").jqxDateTimeInput('val', $('#date').val());
		}
		 if($('#msg').val()!=""){
			   $.messager.alert('Message',$('#msg').val());
			  }
	}

	
	
	/* $(function(){   
        $('#frmspec1').validate({
                 rules: {
                	 brand: {
                	 required:true,
                	 maxlength:40
                	 },
                 
                 model: {
                	 required:true,
                	 maxlength:40
                	 },
                 
                	 submodel: {
                	 required:true,
                	 maxlength:40
                	 },
                 
                 suitspec: {
                	 required:true,
                	 maxlength:40
                	 }
                 },
                 messages: {
                	 brand: {
	                	  required:" *",
	                	  maxlength:"max 40 only"
	                  },
	                  model: {
	                	  required:" *",
	                	  maxlength:"max 40 only"
	                  },
	                  submodel: {
	                	  required:" *",
	                	  maxlength:"max 40 only"
	                  },
	                  suitspec: {
	                	  required:" *",
	                	  maxlength:"max 40 only"
	                  },
	                 }
	        });});
	
        */
	/*  $(function(){
	        $('#frmspec1').validate({
	                 rules: {
	                 brand: {
	                	 required:true,
	                	 maxlength:40
	                 },
            model: {
           	 required:true,
           	 maxlength:40
            },
	        model: {
	           	 required:true,
	           	 maxlength:40
	            },

	        model: {
	           	 required:true,
	           	 maxlength:40
	            }

	                 },
	                 messages: {
	                  brand: {
	                	  required:" *",
	                	  maxlength:"max 40 only"
	                  } 
	                 }
	        });}); */
	     function funNotify(){
	        	var yomfrm=$('#yomfrm').val(); 
		    	var yomto=$('#yomto').val();
		    	
		    	
		    	if(yomfrm=="")
    			{
    			 document.getElementById("errormsg").innerText="Select  Yom From ";  
				 document.getElementById("yomfrm").focus();
				 return 0; 
    			}
		    	
		    	if(yomto=="")
    			{
    			 document.getElementById("errormsg").innerText="Select  Yom To ";  
				 document.getElementById("yomto").focus();
				 return 0; 
    			}
		    	
		    	var brand=$('#brand').val(); 
		    	var model=$('#model').val();
		    	var submodel=$('#submodel').val();
		    	
		    	  
		    	
		    	if(brand=="")
    			{
    			 document.getElementById("errormsg").innerText="Select Brand ";  
				 document.getElementById("brand").focus();
				 return 0; 
    			}
		    	
		    	if(model=="")
    			{
    			 document.getElementById("errormsg").innerText="Select  Model ";  
				 document.getElementById("model").focus();
				 return 0; 
    			}
		    	
		    	
		    
		    	
		    	if(submodel=="")
    			{
    			 document.getElementById("errormsg").innerText="Select  Submodel ";  
				 document.getElementById("submodel").focus();
				 return 0; 
    			}
		    	chkdata();
			} 
		    	function chkdata() {
		    		
		    		 
		    		var x = new XMLHttpRequest();
		    		x.onreadystatechange = function() {
		    			if (x.readyState == 4 && x.status == 200) {
		    				items = x.responseText;
		    		 
		    				if(parseInt(items)==1)
		    					{
		    					document.getElementById("frmspec1").submit();
		    					
		    					
		    					}
		    				else
		    					{
		    					 document.getElementById("errormsg").innerText="  References Present Transaction  Restricted ";  
		    					return 0;
		    					}
		    				 
		    				
		    				} else {
		    			}
		    		}
		    		x.open("GET", "chkspec.jsp?docno="+document.getElementById("docno").value+"&yomfrm="+document.getElementById("yomfrm").value+"&yomto="+document.getElementById("yomto").value+"&brand="+document.getElementById("brandid").value+"&mode="+document.getElementById("mode").value+"&model="+document.getElementById("modelid").value+"&submodel="+document.getElementById("submodelid").value, true);
		    		x.send();
		    	}
	     function funFocus(){
	    	// document.getElementById("brand").focus();
	     }
	     
 
		  
	 	function getBrand(event){
	 	   	 var x= event.keyCode;
	 	   	 if(x==114){
	 	 	   	brandSearchContent("brandSearchGrid.jsp?yomfrm="+document.getElementById("yomfrm").value+"&yomto="+document.getElementById("yomto").value+"&dtype=other");  	 }
	 	    	 else{
	 	   		 }
	 	          	 }
	 	
	 	function getModel(event){
	 		var brandid=document.getElementById("brandid").value;
	 	   	 var x= event.keyCode;
	 	   	 if(x==114){
	 	   	 	modelSearchContent('modelSearchGrid.jsp?brandid='+brandid+"&yomfrm="+document.getElementById("yomfrm").value+"&yomto="+document.getElementById("yomto").value+'&dtype=other'); 
	 	 	    	 }
	 	    	 else{
	 	   		 }
	 	          	 }
	 	
	 	function getSubModel(event){
	 		var modelid=document.getElementById("modelid").value;
	 	   	 var x= event.keyCode;
	 	   	 if(x==114){
	 	   		submodelSearchContent('subModelSearchGrid.jsp?modelid='+modelid+"&yomfrm="+document.getElementById("yomfrm").value+"&yomto="+document.getElementById("yomto").value+'&dtype=other');	 }
	 	    	 else{
	 	   		 }
	 	          	 }

	 		function brandSearchContent(url) {
	 			
	 			if($('#mode').val()=="view")
	 				{
	 				return 0;
	 				}
	 			
	 			
	 			
	 			$('#brandsearchwindow').jqxWindow('open');
	 			$.get(url).done(function(data) {
	 				$('#brandsearchwindow').jqxWindow('setContent', data);
	 				$('#brandsearchwindow').jqxWindow('bringToFront');
	 			});
	 		}
	 	

	 		function modelSearchContent(url) {
	 			if($('#mode').val()=="view")
 				{
 				return 0;
 				}
 			
	 			$('#modelsearchwindow').jqxWindow('open');
	 			$.get(url).done(function(data) {
	 				$('#modelsearchwindow').jqxWindow('setContent', data);
	 				$('#modelsearchwindow').jqxWindow('bringToFront');
	 			});
	 		}
	 		
	 		
	 		
	 		 $(function(){   
	 		        $('#frmspec1').validate({
	 		                 rules: {
	 		                	brand:{
	 		                	 				required:true
	 		                 				},
	 		                 				submodel:{
	 		                	 				required:true
	 		                 				},
	 		                 				model:{
	 		                	 				required:true
	 		                 				},
	 		                 				
	 		                 				suitspec:{
	 		                	 required:true,
	 		                	 maxlength:75
	 		                 }
	 		                 },
	 		                 messages: {
	 		                	brand:{
	 		                	  required:" *"
	 		                  },
	 		                  
	 		                 model:{
	 		                	  required:" *"
	 		                  },
	 		                 submodel:{
	 		                	  required:" *"
	 		                  },
	 		                 suitspec:{
	 		                	  required:" *",
	 		                	  maxlength:"max 75 chars"
	 		                  }
	 		                 }
	 		        });});
	 		
	 		function submodelSearchContent(url) {
	 			if($('#mode').val()=="view")
 				{
 				return 0;
 				}
 			
	 			$('#submodelsearchwindow').jqxWindow('open');
	 			$.get(url).done(function(data) {
	 				$('#submodelsearchwindow').jqxWindow('setContent', data);
	 				$('#submodelsearchwindow').jqxWindow('bringToFront');
	 			});
	 		}
	 	 
</script>  
 
</head>
<body onLoad="setValues();" >
<form id="frmspec1" action="saveSuitspec1Action" method="get" autocomplete="off">
	<jsp:include page="../../../../header.jsp" />
	<br/> 
	<fieldset><legend>Specification Details</legend>
	<table width="100%">
<tr>
<td>
<%-- <table width="100%">
		<tr><td width="6%" align="right">Date</td>
			<td width="31%"  align="left"><div id="date" name="date"></div>
		  	</td>
			<td width="46%" align="right">Doc No.</td>
			<td width="17%">
					<input type="text" name="docno" id="docno" value='<s:property value="docno"/>' readonly  tabindex="-1">
			</td>
		</tr>
        </table> --%>
      <table width="100%"  >
      
			
  <tr>
  <td width="9%"><div align="right">Date</div></td>
  <td width="18%"><div id="date" name="date" value='<s:property value="date"/>'></div></td>
 
  <td  width="8%" align="right">Yom(From)</td>
<td width="16%"> 
 <input type="text" name="yomfrm"  id="yomfrm" placeholder="Press F3 for Search" readonly onKeyDown="getYom(event,'frm');" value='<s:property value="yomfrm"/>'></td>
 <td width="8%"><div align="right">Yom(To)</div></td>
 <td width="16%"><input type="text" name="yomto"    onKeyDown="getYom(event,'to');"  readonly="readonly" placeholder="Press F3 for Search" id="yomto" value='<s:property value="yomto"/>'> </td>
 
  <td width="8%" align="right">Doc No</td>
  <td width="17%"><input type="text" name="docno" value='<s:property value="docno"/>'  id="docno" readonly="true"  tabindex="-1"></td>
</tr>

<tr>
 <td width="9%"><div align="right">Brand</div></td> 
  
  <td><input type="text" name="brand"  id="brand"  style="width:100%;" placeholder="Press F3 for Search" readonly="true" onKeyDown="getBrand(event);" value='<s:property value="brand"/>'></td>
 

<td><div align="right">Model</div></td>
<td> 
 <input type="text" name="model"  id="model"  style="width:100%;" placeholder="Press F3 for Search" readonly onKeyDown="getModel(event);" value='<s:property value="model"/>'></td>
 <td><div align="right">Sub Model</div></td><td width="16%"><input type="text" name="submodel"  style="width:100%;" onKeyDown="getSubModel(event);" readonly="true" placeholder="Press F3 for Search" id="submodel" value='<s:property value="submodel"/>'></td>

<td>&nbsp;</td><td>&nbsp;</td>
</tr>

<tr><td width="9%" align="right">Specification</td>
			<td width="18%" align="left" ><input type="text" name="suitspec"  style="width:100%;" id="suitspec"  value='<s:property value="suitspec"/>' ></td>
			<td width="8%" align="right">Description</td>
	<td colspan="4"><input type="text" id="suitdesc" name="suitdesc" style="width:83.5%;" value='<s:property value="suitdesc"/>'/></td>
			
			<td>&nbsp;</td>
  </tr>	
			
	</table>
    <input
				type="hidden" name="mode" id="mode"
				value='<s:property value="mode"/>' /> <input type="hidden"
				name="deleted" id="deleted" value='<s:property value="deleted"/>' />
			<input type="hidden" id="msg" name="msg"
				value='<s:property value="msg"/>' />
				<input type="hidden" id="name" name="name"
				value='<s:property value="name"/>' />	
				
				<input type="hidden" id="brandid" name="brandid"
				value='<s:property value="brandid"/>' />	
				
				<input type="hidden" id="modelid" name="modelid"
				value='<s:property value="modelid"/>' />	
				
				<input type="hidden" id="submodelid" name="submodelid"
				value='<s:property value="submodelid"/>' />	
				
				
				<input type="hidden" id="msg1" name="msg1"
				value='<s:property value="msg1"/>' />
				
				<input type="hidden" id="yomfrmid" name="yomfrmid"  
				value='<s:property value="yomfrmid"/>' />	
				
				<input type="hidden" id="yomtoid" name="yomtoid"
				value='<s:property value="yomtoid"/>' />	
				</td> 
    </tr>
    </table>
	
	</fieldset>
    	
	</form>
<table width="100%">
      <tr>
      <td> <div id="jqxSpec1Grid"></div>  
</td>
  
      </tr>
    </table>
<br/>
<div id="yomsearchwindow">
			<div></div>
		</div>
			<div id="brandsearchwindow">
			<div></div>
			<div></div>
		</div>
		<div id="modelsearchwindow">
			<div></div>
			<div></div>
		</div>
		<div id="submodelsearchwindow">
			<div></div>
			<div></div>
		</div>

</body>
</html>