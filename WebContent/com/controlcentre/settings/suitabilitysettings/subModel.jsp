<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>GatewayERP(i)</title>
<%@page import="com.controlcentre.settings.suitabilitysettings.suitabilitymaster.ClsSuitabilityMasterDAO"%>
<%ClsSuitabilityMasterDAO DAO= new ClsSuitabilityMasterDAO(); %>
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
    	  $("#date").jqxDateTimeInput({ width : '125px', height : '15px', formatString : "dd.MM.yyyy" });  
    	  
    	  
     	  
  		 if($('#msg1').val()!=""){
 		 	 
 			   $.messager.alert('Message',$('#msg1').val());
 			   
 			   $('#msg1').val('');
 			   
 				  }  
    	 getBrand();
    	 
     	    document.getElementById("formdet").innerText="Suitabilty Sub Model(SSMOD)";
			document.getElementById("formdetail").value="Suitabilty Sub Model";
			document.getElementById("formdetailcode").value="SSMOD";
			window.parent.formCode.value="SSMOD";
			window.parent.formName.value="Suitabilty Sub Model"; 
          var data= '<%=DAO.submodellist(session) %>';
              
              var num = 0; 
              var source =
              {
                  datatype: "json",
                  datafields: [
                            	{name : 'doc_no' , type: 'int' },
       						{name : 'model', type: 'String'  },
                            	{name : 'date', type: 'date'  },
                            	{name : 'brandname',type:'String'},
                            	{name : 'brandid1',type:'String'},
                            	{name : 'modelname',type:'String'},
                            	{name : 'modelid',type:'String'},
                            	
                            	
                               	{name : 'frmyomid', type: 'int'  },
                              	{name : 'fromyom', type: 'String'  },
                              	{name : 'toyomid', type: 'int'  },
                              	{name : 'toyom', type: 'String'  },
                   ],
                   localdata: data,
                  
                  
                  pager: function (pagenum, pagesize, oldpagenum) {
                      // callback called when a page or page size is changed.
                  }
              };
              
              var dataAdapter = new $.jqx.dataAdapter(source,
              		 {
                  		loadError: function (xhr, status, error) {
  	                    alert(error);    
  	                    }
  		            }		
              );
      


              $("#jqxsubModelSearch").jqxGrid(
                      {
                      	width: '100%',
                          height: 350,
                          source: dataAdapter,
                          showfilterrow: true,
                          filterable: true,
                          selectionmode: 'singlerow',
                        //  pagermode: 'default',
                          sortable: true,
                          //pageable: true,
                          altrows:true,
                          //Add row method
                          columns: [
          					{ text: 'Doc No' , datafield: 'doc_no', width: '10%' },
          					{ text: 'Date' ,datafield:'date',width: '10%',cellsformat:'dd.MM.yyyy'},
          					{ text: 'Brand ID' , datafield: 'brandid1', width: '30%', hidden:true },
          					{ text: 'Sub Model'  , datafield: 'model', width: '20%' },
          					
          					{ text: 'Brand' , datafield: 'brandname', width: '20%' },
          					{ text: 'Model' , datafield: 'modelname', width: '20%' },
          					{ text: 'YOM(From)',columntype: 'textbox', filtertype: 'input', datafield: 'fromyom', width: '10%' },
        					{ text: 'YOM(To)',columntype: 'textbox', filtertype: 'input', datafield: 'toyom', width: '10%' },
        					

        					{ text: 'YOM(From)id',columntype: 'textbox', filtertype: 'input', datafield: 'frmyomid', width: '28%'  ,hidden:true},
        					{ text: 'YOM(To)id',columntype: 'textbox', filtertype: 'input', datafield: 'toyomid', width: '28%' ,hidden:true},
          					
          					{ text: 'model ID' , width: '30%' ,hidden:true},
          	              ]
                      });

              $('#jqxsubModelSearch').on('rowdoubleclick', function (event) 
              		{
  		            	var rowindex1=event.args.rowindex;
  		               
  		            	
  		            	if($('#mode').val()=="view")
  	    				{
  		            $('#frmSubModel select').attr('disabled', false);
  		    		$('#date').jqxDateTimeInput({disabled: false});
  		                $("#date").jqxDateTimeInput('val',$("#jqxsubModelSearch").jqxGrid('getcellvalue', rowindex1, "date"));
  		               /*  $('#brand').val($("#jqxsubModelSearch").jqxGrid('getcellvalue', rowindex1, "brand")) ;
  		              $('#brandid').val($("#jqxsubModelSearch").jqxGrid('getcellvalue', rowindex1, "brandid1")) ;
  		            */
  		          
  		            
		                document.getElementById("yomfrm").value = $("#jqxsubModelSearch").jqxGrid('getcellvalue', rowindex1, "fromyom");
		                document.getElementById("yomto").value = $("#jqxsubModelSearch").jqxGrid('getcellvalue', rowindex1, "toyom");
		                document.getElementById("yomfrmid").value = $("#jqxsubModelSearch").jqxGrid('getcellvalue', rowindex1, "frmyomid");
		                document.getElementById("yomtoid").value = $("#jqxsubModelSearch").jqxGrid('getcellvalue', rowindex1, "toyomid");
		                
		                
		                
  		              $('#brand').val($("#jqxsubModelSearch").jqxGrid('getcellvalue', rowindex1, "brandid1")) ;
  		            $('#brandid').val($("#jqxsubModelSearch").jqxGrid('getcellvalue', rowindex1, "brandid1")) ;
  		         
  		         	getBrand();
  		              getModel();
  		           
  		              $('#model').val($("#jqxsubModelSearch").jqxGrid('getcellvalue', rowindex1, "modelid")) ;
  		            $('#modelid').val($("#jqxsubModelSearch").jqxGrid('getcellvalue', rowindex1, "modelid")) ;
  		            
  		            document.getElementById("docno").value= $('#jqxsubModelSearch').jqxGrid('getcellvalue', rowindex1, "doc_no"); 
		                document.getElementById("submodel").value = $("#jqxsubModelSearch").jqxGrid('getcellvalue', rowindex1, "model");
  		              $('#frmSubModel select').attr('disabled', true);
  		    		$('#date').jqxDateTimeInput({disabled: true});
  		    		
  	    				}
  		    		
  		    		
  		    		
              		 }); 
              $("#jqxsubModelSearch").jqxGrid('hidecolumn', 'brandid'); 
              //$("#jqxModelSearch").jqxGrid('hidecolumn', 'brandid'); 
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
      function funSearchLoad(){
			changeContent('modelSearch.jsp', $('#window')); 
		 }

	function funReadOnly() {
		$('#frmSubModel input').attr('readonly', true);
		$('#frmSubModel select').attr('disabled', true);
		$('#date').jqxDateTimeInput({disabled: true});
		/* $('#jqxDateTimeInput').jqxDateTimeInput({ disabled: true}); */
		
	}
	function funRemoveReadOnly() {
		$('#frmSubModel input').attr('readonly', false);
		$('#frmSubModel select').attr('disabled', false);
		$('#date').jqxDateTimeInput({disabled: false});
		$('#docno').attr('readonly', true);
		  $('#yomfrm').attr('readonly', true);
			$('#yomto').attr('readonly', true);
			

	}

	function getBrand() {
		var x = new XMLHttpRequest();
		x.onreadystatechange = function() {
			if (x.readyState == 4 && x.status == 200) {
				items = x.responseText;
				items = items.split('***');
				var brandItems = items[0].split(",");
				var brandidItems = items[1].split(",");
				var optionsbrand = '<option value="">--Select--</option>';
				for (var i = 0; i < brandItems.length; i++) {
					optionsbrand += '<option value="' + brandidItems[i] + '">'
							+ brandItems[i] + '</option>';
					 //document.getElementById("brandid").value=brandidItems[i];
				}
				
				
				$("select#brand").html(optionsbrand);
				
				if($('#brandid').val()!="")
				{
					$('#brand').val($('#brandid').val());	
				}	
				
				
				} else {
			}
		}
		x.open("GET", "getBrand.jsp?yomfrm="+document.getElementById("yomfrm").value+"&yomto="+document.getElementById("yomto").value, true);
		x.send();
	}
	
	function funFocus(){
		//document.getElementById("brand").focus();
	}
	 $(function(){
	        $('#frmSubModel').validate({
	                 rules: {
	                 			brand:{
	                	 				required:true
	                 				},
	                 				submodel:{
	                	 				required:true
	                 				},
	                 model:{
	                	 required:true,
	                	 maxlength:20
	                 }
	                 },
	                 messages: {
	                  brand:{
	                	  required:" *"
	                  },
	                  submodel:{
	                	  required:" *"
	                  },
	                  model:{
	                	  required:" *",
	                	  maxlength:"max 20 chars"
	                  }
	                 }
	        });});
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
		    	
		    	
		    	if(document.getElementById("brand").value=="")
    			{
    			 document.getElementById("errormsg").innerText="Select Brand ";  
				 document.getElementById("brand").focus();
				 return 0; 
    			}
		    	
		    	
		    	if(document.getElementById("model").value=="")
    			{
    			 document.getElementById("errormsg").innerText="Select  Model ";  
				 document.getElementById("model").focus();
				 return 0; 
    			}
		    	
		    	if(document.getElementById("submodel").value=="")
    			{
    			 document.getElementById("errormsg").innerText="Select  submodel ";  
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
	    					document.getElementById("frmSubModel").submit();
	    					
	    					
	    					}
	    				else
	    					{
	    					 document.getElementById("errormsg").innerText="  References Present Transaction  Restricted ";  
	    					return 0;
	    					}
	    				 
	    				
	    				} else {
	    			}
	    		}
	    		x.open("GET", "chksubmodel.jsp?docno="+document.getElementById("docno").value+"&yomfrm="+document.getElementById("yomfrm").value+"&yomto="+document.getElementById("yomto").value+"&brand="+document.getElementById("brand").value+"&mode="+document.getElementById("mode").value+"&model="+document.getElementById("model").value, true);
	    		x.send();
	    	}
	        
	function setValues() {
		

		
if ($('#brandid').val() != null) {
 
	$('#brand').val($('#brandid').val());
 
	getModel();
}		
//getModel();
if ($('#modelid').val() != null) {
	
	
 
	$('#model').val($('#modelid').val());
} 
if($('#msg').val()!=""){
	   $.messager.alert('Message',$('#msg').val());
	  }
	}
	
	function getModel() {
		
		var id=$('#brand').val();
	 if(id==null)
		 {
		 id=$('#brandid').val();
		 }
	
		var x = new XMLHttpRequest();
		x.onreadystatechange = function() {
			if (x.readyState == 4 && x.status == 200) {
				items = x.responseText;
				items = items.split('####');
				var brandItems = items[0].split(",");
				var brandidItems = items[1].split(",");
				var optionsbrand = '<option value="">--Select--</option>';
				for (var i = 0; i < brandItems.length; i++) {
					optionsbrand += '<option value="' + brandidItems[i] + '">'
							+ brandItems[i] + '</option>';
					/* document.getElementById("brandid").value=brandidItems[i]; */
				}
				
				
				$("select#model").html(optionsbrand);
				if ($('#modelid').val() != null) {
					
					
					//alert("ghcj");
					$('#model').val($('#modelid').val());
				}
				} else {
			}
		}
		x.open("GET", "getModel.jsp?id="+id+"&yomfrm="+document.getElementById("yomfrm").value+"&yomto="+document.getElementById("yomto").value, true);
		x.send();
	}

	function chkyom()
	{
		
	var yom= document.getElementById("yomfrmid").value;
	var yomto= document.getElementById("yomtoid").value;
	
	if(yom=="")
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
 
	 getBrand();
	 
		
		

	}
	
	
	function chkyom2()
	{
		
		var brand= $('#brand').val();
	var yom= document.getElementById("yomfrmid").value;
	var yomto= document.getElementById("yomtoid").value;
	
	if(yom=="")
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
	 if(brand=="")
		{
		 document.getElementById("errormsg").innerText="Select  Brand ";  
		 document.getElementById("brand").focus();
		 return 0; 
		}
		 
	 
	 
 
	 getModel();
	 
		
		

	}
	
	
</script>
</head>
<body onLoad="setValues();"><div id="mainBG" class="homeContent" data-type="background">
<form id="frmSubModel" action="saveSuitsubmodelAction"  autocomplete="off">
<jsp:include page="../../../../header.jsp" /><br/> 
<fieldset><legend>Suitability Sub Model </legend>
<table width="100%" >
<tr>
  <td width="7%" ><div align="right">Date</div></td>
  <td width="20%"><div id="date" name="date" value='<s:property value="date"/>'></div></td>
  
    
  <td  width="7%" align="right">Yom(From)</td>
<td width="17%"> 
 <input type="text" name="yomfrm"  id="yomfrm" placeholder="Press F3 for Search" readonly onKeyDown="getYom(event,'frm');" value='<s:property value="yomfrm"/>'></td>
 <td width="7%"><div align="right">Yom(To)</div></td>
 <td width="18%"><input type="text" name="yomto"    onKeyDown="getYom(event,'to');"  readonly="readonly" placeholder="Press F3 for Search" id="yomto" value='<s:property value="yomto"/>'> </td>
	
 
  <td width="6%" align="right">Doc No</td>
  <td width="18%"><input type="text" name="docno" value='<s:property value="docno"/>'  id="docno" readonly  tabindex="-1"></td>
</tr>

<tr>


 <td width="7%"><div align="right">Brand</div></td>
  <td><select name="brand" id="brand" onchange="getModel()" onfocus="chkyom();" style="width:99%;" ></select></td>
<td><div align="right">Model</div></td>
<td> 
<!-- <option value="">--Select--</option> -->
 <select name="model" id="model" style="width:100%;"   onfocus="chkyom2();"  ></select></td>
 <td><div align="right">Sub Model</div></td><td colspan="3"><input type="text" name="submodel" style="width:40%;" id="submodel" value='<s:property value="submodel"/>'></td>
</tr>

 
			 
	
			
</table>
<input type="hidden" name="mode" id="mode" value='<s:property value="mode"/>' /> 
<input type="hidden" id="brandid" name="brandid" value='<s:property value="brandid"/>'>  
	<input type="hidden" id="yomfrmid" name="yomfrmid"  
				value='<s:property value="yomfrmid"/>' />	
				
				<input type="hidden" id="yomtoid" name="yomtoid"
				value='<s:property value="yomtoid"/>' />
<input type="hidden" id="modelid" name="modelid" value='<s:property value="modelid"/>'>
<input type="hidden" name="deleted" id="deleted" value='<s:property value="deleted"/>' />
<input type="hidden" id="msg" name="msg" value='<s:property value="msg"/>' />
	<input type="hidden" id="msg1" name="msg1"
				value='<s:property value="msg1"/>' />
		<input type="hidden" id="txtforsearch" name="txtforsearch"
				value='<s:property value="txtforsearch"/>' />
					<input type="hidden" id="hidcurrencytype" name="hidcurrencytype"
				value='<s:property value="hidcurrencytype"/>' />
					<input type="hidden" id="txttorate" name="txttorate"
				value='<s:property value="txttorate"/>' />			
				
</fieldset>    
</form>
<br/>
<div id="yomsearchwindow">
			<div></div>
		</div>
<div id="jqxsubModelSearch"></div>
<%-- <div id="window">
	<div id="windowHeader" class="windowHead">
		<span> <img src="../../../../icons/search_new.png" alt="" style="margin-right: 15px" />Search</span>
	</div>
	<div id="windowContent" class="windowCont" style="overflow: hidden;">
		<jsp:include page="modelSearch.jsp"></jsp:include>
	</div></div> --%>
	
</div>
</body>
</html>