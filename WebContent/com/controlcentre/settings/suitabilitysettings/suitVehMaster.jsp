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
<style type="text/css">
 
.myButtons {
	-moz-box-shadow:inset 0px -1px 3px 0px #91b8b3;
	-webkit-box-shadow:inset 0px -1px 3px 0px #91b8b3;
	box-shadow:inset 0px -1px 3px 0px #91b8b3;
	background:-webkit-gradient(linear, left top, left bottom, color-stop(0.05, #768d87), color-stop(1, #6c7c7c));
	background:-moz-linear-gradient(top, #768d87 5%, #6c7c7c 100%);
	background:-webkit-linear-gradient(top, #768d87 5%, #6c7c7c 100%);
	background:-o-linear-gradient(top, #768d87 5%, #6c7c7c 100%);
	background:-ms-linear-gradient(top, #768d87 5%, #6c7c7c 100%);
	background:linear-gradient(to bottom, #768d87 5%, #6c7c7c 100%);
	filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#768d87', endColorstr='#6c7c7c',GradientType=0);
	background-color:#768d87;
	border:1px solid #566963;
	display:inline-block;
	cursor:pointer;
	color:#ffffff;
	
	font-size:8pt;
	
	padding:3px 17px;
	text-decoration:none;
	text-shadow:0px -1px 0px #2b665e;
}
.myButtons:hover {
	background:-webkit-gradient(linear, left top, left bottom, color-stop(0.05, #6c7c7c), color-stop(1, #768d87));
	background:-moz-linear-gradient(top, #6c7c7c 5%, #768d87 100%);
	background:-webkit-linear-gradient(top, #6c7c7c 5%, #768d87 100%);
	background:-o-linear-gradient(top, #6c7c7c 5%, #768d87 100%);
	background:-ms-linear-gradient(top, #6c7c7c 5%, #768d87 100%);
	background:linear-gradient(to bottom, #6c7c7c 5%, #768d87 100%);
	filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#6c7c7c', endColorstr='#768d87',GradientType=0);
	background-color:#6c7c7c;
}
.myButtons:active {
	position:relative;
	top:1px;
}

</style>
<script type="text/javascript">
	$(document).ready(function () {  
		$('#btnSearch').attr('disabled', true);
	    $("#date").jqxDateTimeInput({ width: '125px', height: '15px' ,formatString : "dd.MM.yyyy" });
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
			title : 'Sub Model Search',
			position : {
				x : 420,
				y : 87
			},
			theme : 'energyblue',
			showCloseButton : true,
			keyboardCloseKey : 27
		});
		$('#submodelsearchwindow').jqxWindow('close');
		
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
		
		
		$('#spec1searchwindow').jqxWindow({
			width : '25%',
			height : '65%',
			maxHeight : '70%',
			maxWidth : '45%',
			title : 'Spec Search',
			position : {
				x : 420,
				y : 87
			},
			theme : 'energyblue',
			showCloseButton : true,
			keyboardCloseKey : 27
		});
		$('#spec1searchwindow').jqxWindow('close');
		
		
		$('#spec2searchwindow').jqxWindow({
			width : '25%',
			height : '65%',
			maxHeight : '70%',
			maxWidth : '45%',
			title : 'Spec Search',
			position : {
				x : 420,
				y : 87
			},
			theme : 'energyblue',
			showCloseButton : true,
			keyboardCloseKey : 27
		});
		$('#spec2searchwindow').jqxWindow('close');
		
		
		$('#spec3searchwindow').jqxWindow({
			width : '25%',
			height : '65%',
			maxHeight : '70%',
			maxWidth : '45%',
			title : 'Spec Search',
			position : {
				x : 420,
				y : 87
			},
			theme : 'energyblue',
			showCloseButton : true,
			keyboardCloseKey : 27
		});
		$('#spec3searchwindow').jqxWindow('close');
		
		$('#clear').hide();
		
		
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
		
		$('#brand').dblclick(function(){
			
			if($('#mode').val()=="view")
				{
				return 0;
				}
			brandSearchContent('brandSearchGrid.jsp?dtype=sut'); 
		});
		
		$('#model').dblclick(function(){
			
			if($('#mode').val()=="view")
				{
				return 0;
				}
			var brandid=document.getElementById("brandid").value;
	 	   		modelSearchContent('modelSearchGrid.jsp?brandid='+brandid+"&dtype=sut");
		});
		
		$('#submodel').dblclick(function(){
			
			if($('#mode').val()=="view")
				{
				return 0;
				}
			var modelid=document.getElementById("modelid").value;
	 	   		submodelSearchContent('subModelSearchGrid.jsp?modelid='+modelid+"&dtype=sut");
		});
		
		$('#esize').dblclick(function(){
			var brandid=document.getElementById("brandid").value;
	 		var modelid=document.getElementById("modelid").value;
	 		var submodelid=document.getElementById("submodelid").value;
	 	   	spec2SearchContent('spec2SearchGrid.jsp?brandid='+brandid+'&modelid='+modelid+'&submodelid='+submodelid+"&dtype=sut");
		});
		
		$('#csize1').dblclick(function(){
			
			if($('#mode').val()=="view")
				{
				return 0;
				}
			var brandid=document.getElementById("brandid").value;
	 		var modelid=document.getElementById("modelid").value;
	 		var submodelid=document.getElementById("submodelid").value;
	 		
	 		var csize1id=document.getElementById("csize1id").value;
	 		var csize2id=document.getElementById("csize2id").value;
	 		var csize3id=document.getElementById("csize3id").value;
	 		var col="1";  
	 	   	
	 	   		spec3SearchContent('spec3SearchGrid.jsp?col='+col+'&brandid='+brandid+'&modelid='+modelid+'&submodelid='+submodelid+'&csize1id='+csize1id+'&csize2id='+csize2id+'&csize3id='+csize3id+'&dtype=sut');
		});
		
		$('#csize2').dblclick(function(){
			
			if($('#mode').val()=="view")
				{
				return 0;
				}
			var brandid=document.getElementById("brandid").value;
	 		var modelid=document.getElementById("modelid").value;
	 		var submodelid=document.getElementById("submodelid").value;
	 		
	 		var csize1id=document.getElementById("csize1id").value;
	 		var csize2id=document.getElementById("csize2id").value;
	 		var csize3id=document.getElementById("csize3id").value;
	 		var col="2";  
	 	   	
	 	   		spec3SearchContent('spec3SearchGrid.jsp?col='+col+'&brandid='+brandid+'&modelid='+modelid+'&submodelid='+submodelid+'&csize1id='+csize1id+'&csize2id='+csize2id+'&csize3id='+csize3id+'&dtype=sut');
		});
		
		$('#csize3').dblclick(function(){
			
			if($('#mode').val()=="view")
				{
				return 0;
				}
			var brandid=document.getElementById("brandid").value;
	 		var modelid=document.getElementById("modelid").value;
	 		var submodelid=document.getElementById("submodelid").value;
	 		
	 		var csize1id=document.getElementById("csize1id").value;
	 		var csize2id=document.getElementById("csize2id").value;
	 		var csize3id=document.getElementById("csize3id").value;
	 		var col="3";  
	 	   	
	 	   		spec3SearchContent('spec3SearchGrid.jsp?col='+col+'&brandid='+brandid+'&modelid='+modelid+'&submodelid='+submodelid+'&csize1id='+csize1id+'&csize2id='+csize2id+'&csize3id='+csize3id+'&dtype=sut'); 
		});
		
		$('#bsize1').dblclick(function(){
			
			if($('#mode').val()=="view")
				{
				return 0;
				}
			var brandid=document.getElementById("brandid").value;
	 		var modelid=document.getElementById("modelid").value;
	 		var submodelid=document.getElementById("submodelid").value;
	 		
	 		var bsize1id=document.getElementById("bsize1id").value;
	 		var bsize2id=document.getElementById("bsize2id").value;
	 		var bsize3id=document.getElementById("bsize3id").value;
	 		var col="1";  
	 	   
	 	   		spec1SearchContent('spec1SearchGrid.jsp?col='+col+'&brandid='+brandid+'&modelid='+modelid+'&submodelid='+submodelid+'&bsize1id='+bsize1id+'&bsize2id='+bsize2id+'&bsize3id='+bsize3id+'&dtype=sut');  	
		});
		
		$('#bsize2').dblclick(function(){
			
			if($('#mode').val()=="view")
				{
				return 0;
				}
			var brandid=document.getElementById("brandid").value;
	 		var modelid=document.getElementById("modelid").value;
	 		var submodelid=document.getElementById("submodelid").value;
	 		
	 		var bsize1id=document.getElementById("bsize1id").value;
	 		var bsize2id=document.getElementById("bsize2id").value;
	 		var bsize3id=document.getElementById("bsize3id").value;
	 		var col="2";  
	 	   
	 	   		spec1SearchContent('spec1SearchGrid.jsp?col='+col+'&brandid='+brandid+'&modelid='+modelid+'&submodelid='+submodelid+'&bsize1id='+bsize1id+'&bsize2id='+bsize2id+'&bsize3id='+bsize3id+'&dtype=sut'); 
		});
		
		$('#bsize3').dblclick(function(){
			
			if($('#mode').val()=="view")
				{
				return 0;
				}
			var brandid=document.getElementById("brandid").value;
	 		var modelid=document.getElementById("modelid").value;
	 		var submodelid=document.getElementById("submodelid").value;
	 		
	 		var bsize1id=document.getElementById("bsize1id").value;
	 		var bsize2id=document.getElementById("bsize2id").value;
	 		var bsize3id=document.getElementById("bsize3id").value;
	 		var col="3";  
	 	   
	 	   		spec1SearchContent('spec1SearchGrid.jsp?col='+col+'&brandid='+brandid+'&modelid='+modelid+'&submodelid='+submodelid+'&bsize1id='+bsize1id+'&bsize2id='+bsize2id+'&bsize3id='+bsize3id+'&dtype=sut'); 
		});
		
		document.getElementById("formdet").innerText="Suitabilty Vehicle Master(SVEH)";
		document.getElementById("formdetail").value="Suitabilty Vehicle Master";
		document.getElementById("formdetailcode").value="SVEH";
		window.parent.formCode.value="SVEH";
		window.parent.formName.value="Suitabilty Vehicle Master";
 		var databrand= '<%=DAO.suitSearchLoad(session)%>';
             var num = 0; 
            var source =
            {
                datatype: "json",
                datafields: [
{name : 'doc_no', type: 'string'  },     		
{name : 'model', type: 'string'  },
{name : 'modelid', type: 'int'   },
{name : 'submodel', type: 'string'  },
{name : 'submodelid', type: 'int'   },
{name : 'brand', type: 'string'   },
{name : 'brandid', type: 'int'   },
{name : 'yomfrm', type: 'string'   },
{name : 'yomto', type: 'string'   },
{name : 'yomfrmid', type: 'int'   },
{name : 'yomtoid', type: 'int'   },
{name : 'esize', type: 'string'   },
{name : 'esizeid', type: 'int'   },
{name : 'bsize1', type: 'string'   },
{name : 'bsize1id', type: 'int'   },
{name : 'bsize2', type: 'string'   },
{name : 'bsize2id', type: 'int'   },
{name : 'bsize3', type: 'string'   },
{name : 'bsize3id', type: 'int'   },
{name : 'csize1', type: 'string'   },
{name : 'csize1id', type: 'int'   },
{name : 'csize2', type: 'string'   },
{name : 'csize2id', type: 'int'   },
{name : 'csize3', type: 'string'   },
{name : 'csize3id', type: 'int'   },
{name : 'date', type: 'string'   },
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
    
            $("#jqxSuitGrid").jqxGrid(
                    {
                    	width: '220%',
                    	 height: 250,
                        source: dataAdapter,
                        showfilterrow: true,
                        filterable: true,
                        selectionmode: 'singlerow',
                        //Add row method
                        columns: [
{ text: 'doc_no', datafield: 'doc_no', hidden: true, width: '10%',cellsalign: 'center', align: 'center' },
{ text: 'Yom(From)', datafield: 'yomfrm', editable: false, width: '10%',cellsalign: 'center', align: 'center' },
{ text: 'Yomfrmid', datafield: 'yomfrmid', hidden:true, width: '15%',cellsalign: 'center', align: 'center' },
{ text: 'Yom(To)', datafield: 'yomto', editable: false, width: '10%',cellsalign: 'center', align: 'center' },
{ text: 'Yomtoid', datafield: 'yomtoid', hidden:true, width: '15%',cellsalign: 'center', align: 'center' },
{ text: 'typeid', datafield: 'typeid', width: '5%',hidden:true },
{ text: 'modelid', datafield: 'modelid', width: '5%',hidden:true },
{ text: 'brandid', datafield: 'brandid', width: '5%',hidden:true },
{ text: 'submodelid', datafield: 'submodelid', width: '5%',hidden:true },
{ text: 'Type', datafield: 'ptype', editable: false, width: '15%',cellsalign: 'center', align: 'center',hidden:true },
{ text: 'Brand', datafield: 'brand', editable: false, width: '15%',cellsalign: 'center', align: 'center' },
{ text: 'Model', datafield: 'model', editable: false, width: '15%',cellsalign: 'center', align: 'center' },
{ text: 'Sub Model', datafield: 'submodel', editable: false, width: '15%',cellsalign: 'center', align: 'center' },
{ text: 'EngineSize', datafield: 'esize', editable: false, width: '10%',cellsalign: 'center', align: 'center' },
{ text: 'spec2id', datafield: 'esizeid', hidden:true, width: '11%',cellsalign: 'center', align: 'center' },
{ text: 'BedSize1', datafield: 'bsize1', editable: false, width: '12%',cellsalign: 'center', align: 'center' },
{ text: 'BedSize2', datafield: 'bsize2', editable: false, width: '12%',cellsalign: 'center', align: 'center' },
{ text: 'BedSize3', datafield: 'bsize3', editable: false, width: '12%',cellsalign: 'center', align: 'center' },
{ text: 'bsize1id', datafield: 'bsize1id', hidden:true, width: '11%',cellsalign: 'center', align: 'center' },
{ text: 'bsize2id', datafield: 'bsize2id', hidden:true, width: '11%',cellsalign: 'center', align: 'center' },
{ text: 'bsize3id', datafield: 'bsize3id', hidden:true, width: '11%',cellsalign: 'center', align: 'center' },
{ text: 'CabinSize1', datafield: 'csize1', editable: false, width: '11%',cellsalign: 'center', align: 'center' },
{ text: 'csize1id', datafield: 'csize1id' , hidden:true, width: '12%',cellsalign: 'center', align: 'center' },
{ text: 'CabinSize2', datafield: 'csize2', editable: false, width: '11%',cellsalign: 'center', align: 'center' },
{ text: 'csize2id', datafield: 'csize2id' , hidden:true, width: '12%',cellsalign: 'center', align: 'center' },
{ text: 'CabinSize3', datafield: 'csize3', editable: false, width: '11%',cellsalign: 'center', align: 'center' },
{ text: 'csize3id', datafield: 'csize3id' , hidden:true, width: '12%',cellsalign: 'center', align: 'center' },
{ text: 'date', datafield: 'date' , hidden:true, width: '12%',cellsalign: 'center', align: 'center' },

        	              ]
                    });
            $('#jqxSuitGrid').on('rowdoubleclick', function (event) {
                var rowindex1=event.args.rowindex;
        		
    			if($('#mode').val()!="view")
    				{
    				return 0;
    				}
                document.getElementById("docno").value= $('#jqxSuitGrid').jqxGrid('getcellvalue', rowindex1, "doc_no"); 
                document.getElementById("yomfrm").value = $("#jqxSuitGrid").jqxGrid('getcellvalue', rowindex1, "yomfrm");
                document.getElementById("yomfrmid").value = $("#jqxSuitGrid").jqxGrid('getcellvalue', rowindex1, "yomfrmid");
                document.getElementById("yomto").value = $("#jqxSuitGrid").jqxGrid('getcellvalue', rowindex1, "yomto");
                document.getElementById("yomtoid").value = $("#jqxSuitGrid").jqxGrid('getcellvalue', rowindex1, "yomtoid");
                document.getElementById("brand").value = $("#jqxSuitGrid").jqxGrid('getcellvalue', rowindex1, "brand");
                document.getElementById("brandid").value = $("#jqxSuitGrid").jqxGrid('getcellvalue', rowindex1, "brandid");
                document.getElementById("model").value = $("#jqxSuitGrid").jqxGrid('getcellvalue', rowindex1, "model");
                document.getElementById("modelid").value = $("#jqxSuitGrid").jqxGrid('getcellvalue', rowindex1, "modelid");
                document.getElementById("submodel").value = $("#jqxSuitGrid").jqxGrid('getcellvalue', rowindex1, "submodel");
                document.getElementById("submodelid").value = $("#jqxSuitGrid").jqxGrid('getcellvalue', rowindex1, "submodelid");
                
                document.getElementById("esize").value= $('#jqxSuitGrid').jqxGrid('getcellvalue', rowindex1, "esize"); 
                document.getElementById("esizeid").value = $("#jqxSuitGrid").jqxGrid('getcellvalue', rowindex1, "esizeid");
                document.getElementById("bsize1").value = $("#jqxSuitGrid").jqxGrid('getcellvalue', rowindex1, "bsize1");
                document.getElementById("bsize1id").value = $("#jqxSuitGrid").jqxGrid('getcellvalue', rowindex1, "bsize1id");
                document.getElementById("bsize2").value = $("#jqxSuitGrid").jqxGrid('getcellvalue', rowindex1, "bsize2");
                document.getElementById("bsize2id").value = $("#jqxSuitGrid").jqxGrid('getcellvalue', rowindex1, "bsize2id");
                document.getElementById("bsize3").value = $("#jqxSuitGrid").jqxGrid('getcellvalue', rowindex1, "bsize3");
                document.getElementById("bsize3id").value = $("#jqxSuitGrid").jqxGrid('getcellvalue', rowindex1, "bsize3id");
                
                document.getElementById("csize1").value = $("#jqxSuitGrid").jqxGrid('getcellvalue', rowindex1, "csize1");
                document.getElementById("csize1id").value = $("#jqxSuitGrid").jqxGrid('getcellvalue', rowindex1, "csize1id");
                document.getElementById("csize2").value = $("#jqxSuitGrid").jqxGrid('getcellvalue', rowindex1, "csize2");
                document.getElementById("csize2id").value = $("#jqxSuitGrid").jqxGrid('getcellvalue', rowindex1, "csize2id");
                document.getElementById("csize3").value = $("#jqxSuitGrid").jqxGrid('getcellvalue', rowindex1, "csize3");
                document.getElementById("csize3id").value = $("#jqxSuitGrid").jqxGrid('getcellvalue', rowindex1, "csize3id");
                
                $("#date").jqxDateTimeInput('val', $("#jqxSuitGrid").jqxGrid('getcellvalue', rowindex1, "date"));
                //document.getElementById("search").style.display="none";
               // $('#window').jqxWindow('hide');
            }); 
        });
	
	function funReadOnly() {
		$('#frmvehSuit input').attr('readonly', true);
		$('#date').jqxDateTimeInput({
			readonly : true
		});
		$('#clear').hide();
		/* 	$('#jqxDateTimeInput').jqxDateTimeInput({ disabled: true}); */
	}
	function funRemoveReadOnly() {
		$('#frmvehSuit input').attr('readonly', true);
		$('#date').jqxDateTimeInput({
			readonly : false
		});
		/* $('#docno').attr('readonly', true);
		$('#brand').attr('readonly', true);
		$('#model').attr('readonly', true);
		$('#submodel').attr('readonly', true);
		
		$('#csize1').attr('readonly', true);
		$('#csize2').attr('readonly', true);
		$('#csize3').attr('readonly', true);
		
		$('#bsize1').attr('readonly', true);
		$('#bsize2').attr('readonly', true);
		$('#bsize3').attr('readonly', true);
		
		$('#esize').attr('readonly', true); */
		
		$('#clear').hide();
		
	}

	function setValues() {
		if($('#datehidden').val()){
			$("#date").jqxDateTimeInput('val', $('#date').val());
		}
		 if($('#msg').val()!=""){
			   $.messager.alert('Message',$('#msg').val());
			  }
	}
	

	     function funNotify(){
	    
	    	var yomfrm=$('#yomfrm').val(); 
	    	var yomto=$('#yomto').val();
	    	 
	    	/* if(parseInt(yomfrm) && isNaN(yomto)) 
	    		{ */
	    		if(parseInt(yomto)<parseInt(yomfrm))
	    			{
	    			 document.getElementById("errormsg").innerText="Yom To  Less Than Yom From ";  
					 document.getElementById("yomto").focus();
					 return 0; 
	    			}
	    	/* 	} */
	    	 
	    		return 1;
		} 
	     function funFocus(){
	    	 document.getElementById("yomfrm").focus();
	     }
	     
		 	function getBrand(event){
				
				if($('#mode').val()=="view")
					{
					return 0;
					}
		 	   	 var x= event.keyCode;
		 	   	 if(x==114){
		 	   		brandSearchContent('brandSearchGrid.jsp?dtype=sut');  	 }
		 	    	 else{
		 	   		 }
		 	          	 }
		 	
		 	function getModel(event){
				
				if($('#mode').val()=="view")
					{
					return 0;
					}
		 		var brandid=document.getElementById("brandid").value;
		 	   	 var x= event.keyCode;
		 	   	 if(x==114){
		 	   		modelSearchContent('modelSearchGrid.jsp?brandid='+brandid+"&dtype=sut");  	 }
		 	    	 else{
		 	   		 }
		 	          	 }
		 	
		 	function getSubModel(event){
				
				if($('#mode').val()=="view")
					{
					return 0;
					}
		 		var modelid=document.getElementById("modelid").value;
		 	   	 var x= event.keyCode;
		 	   	 if(x==114){
		 	   		submodelSearchContent('subModelSearchGrid.jsp?modelid='+modelid+"&dtype=sut");  	 }
		 	    	 else{
		 	   		 }
		 	          	 }
		 	
		 	
		 	function getEnignesize(event){
				
				if($('#mode').val()=="view")
					{
					return 0;
					}
		 		var brandid=document.getElementById("brandid").value;
		 		var modelid=document.getElementById("modelid").value;
		 		var submodelid=document.getElementById("submodelid").value;
		 		  
		 	   	 var x= event.keyCode;
		 	   	 if(x==114){
		 	   		spec2SearchContent('spec2SearchGrid.jsp?brandid='+brandid+'&modelid='+modelid+'&submodelid='+submodelid+"&dtype=sut");  	 }
		 	    	 else{
		 	   		 }
		 	          	 }
		 	
		 	function getBedSize(event,col){
				
				if($('#mode').val()=="view")
					{
					return 0;
					}
		 		var brandid=document.getElementById("brandid").value;
		 		var modelid=document.getElementById("modelid").value;
		 		var submodelid=document.getElementById("submodelid").value;
		 		
		 		var bsize1id=document.getElementById("bsize1id").value;
		 		var bsize2id=document.getElementById("bsize2id").value;
		 		var bsize3id=document.getElementById("bsize3id").value;
		 		  
		 	   	 var x= event.keyCode;
		 	   	 if(x==114){
		 	   		spec1SearchContent('spec1SearchGrid.jsp?col='+col+'&brandid='+brandid+'&modelid='+modelid+'&submodelid='+submodelid+'&bsize1id='+bsize1id+'&bsize2id='+bsize2id+'&bsize3id='+bsize3id+'&dtype=sut'); 	 }
		 	    	 else{
		 	   		 }
		 	          	 }
		 	
		 	
		 	function getCabinSize(event,col){
				
				if($('#mode').val()=="view")
					{
					return 0;
					}
		 		var brandid=document.getElementById("brandid").value;
		 		var modelid=document.getElementById("modelid").value;
		 		var submodelid=document.getElementById("submodelid").value;
		 		
		 		var csize1id=document.getElementById("csize1id").value;
		 		var csize2id=document.getElementById("csize2id").value;
		 		var csize3id=document.getElementById("csize3id").value;
		 		  
		 	   	 var x= event.keyCode;
		 	   	 if(x==114){
		 	   		spec3SearchContent('spec3SearchGrid.jsp?col='+col+'&brandid='+brandid+'&modelid='+modelid+'&submodelid='+submodelid+'&csize1id='+csize1id+'&csize2id='+csize2id+'&csize3id='+csize3id+'&dtype=sut'); 	 }
		 	    	 else{
		 	   		 }
		 	          	 }
		 	
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
		 		
		 		function spec1SearchContent(url) {
		 			
					if($('#mode').val()=="view")
						{
						return 0;
						}
		 			$('#spec1searchwindow').jqxWindow('open');
		 			$.get(url).done(function(data) {
		 				$('#spec1searchwindow').jqxWindow('setContent', data);
		 				$('#spec1searchwindow').jqxWindow('bringToFront');
		 			});
		 		}
		 		
		 		
		 		function spec2SearchContent(url) {
		 			
					if($('#mode').val()=="view")
						{
						return 0;
						}
		 			$('#spec2searchwindow').jqxWindow('open');
		 			$.get(url).done(function(data) {
		 				$('#spec2searchwindow').jqxWindow('setContent', data);
		 				$('#spec2searchwindow').jqxWindow('bringToFront');
		 			});
		 		}
		 		
		 		function spec3SearchContent(url) {
		 			
					if($('#mode').val()=="view")
						{
						return 0;
						}
		 			$('#spec3searchwindow').jqxWindow('open');
		 			$.get(url).done(function(data) {
		 				$('#spec3searchwindow').jqxWindow('setContent', data);
		 				$('#spec3searchwindow').jqxWindow('bringToFront');
		 			});
		 		}
		 		
		 function cleardata()
				 {
			 
			 if($('#mode').val()!="view")
				 {
					 document.getElementById("yomto").value="";
        			 document.getElementById("yomtoid").value="";
				 }
				 } 
		 
		 
	 
		 
		 
		 function cleardatas(val)
		 {
			 
			 if(parseInt(val)==1)
				 {
				
				 
				 
				 
				 
				 }
			 
			 
		 }
		 
		 
</script>  
 
</head>
<body onLoad="setValues();" >
<form id="frmvehSuit" action="savesuitvehaction" method="get" autocomplete="off">
	<jsp:include page="../../../../header.jsp" />
	<br/> 
	<fieldset><legend>Product Suitability Details</legend>
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
        <table width="100%">
        <!-- pattern=".{1,3}" required="required" -->
		<%-- <tr><td width="6%" align="right">Specification</td>
			<td width="31%" align="left" ><input type="text" name="suitspec" id="suitspec"  value='<s:property value="suitspec"/>' ></td>
			<td width="20%" align="right">Description</td>
				<td width="65%"><input type="text" id="suitdesc" name="suitdesc" style="width:50%;" value='<s:property value="suitdesc"/>'/></td>
			</tr> --%>
			
		<tr>
  <td width="12%"><div align="right">Date</div></td>
  <td width="11%"><div id="date" name="date" value='<s:property value="date"/>'></div></td>
  <td width="22%"><div align="right">Doc No</div></td>
  <td><input type="text" name="docno"  id="docno"  readonly="true"  value='<s:property value="docno"/>'></td>
  <%-- <td>Doc No</td>
  <td><input type="text" name="docno" value='<s:property value="docno"/>'  id="docno" readonly="true"  tabindex="-1"></td> --%>
</tr>

<tr><td><div align="right">Yom(From)</div></td> 
<td> 
 <input type="text" name="yomfrm"  id="yomfrm" placeholder="Press F3 for Search" readonly onKeyDown="getYom(event,'frm');" value='<s:property value="yomfrm"/>'></td>
 <td><div align="right">Yom(To)</div></td>
 <td width="19%"><input type="text" name="yomto"    onKeyDown="getYom(event,'to');"  readonly="readonly" placeholder="Press F3 for Search" id="yomto" value='<s:property value="yomto"/>'>&nbsp;
 &nbsp;&nbsp;<input type="button" id="clear"  value="Clear" class="myButtons" onclick="cleardata()" ></td>
</tr>             

<tr><td width="6%" align="right">Brand</td>
			<td width="31%" align="left" ><input type="text" name="brand" id="brand" style="width:60%;" placeholder="Press F3 for Search" readonly="true" onKeyDown="getBrand(event);"    value='<s:property value="brand"/>' ></td>
			<td width="20%" align="right">Model</td>
				<td width="65%"><input type="text" id="model" name="model" style="width:60%;" placeholder="Press F3 for Search" readonly onKeyDown="getModel(event);"  value='<s:property value="model"/>'/></td>
			</tr>
			
<tr><td width="6%" align="right">SubModel</td>
			<td width="31%" align="left" ><input type="text" name="submodel" style="width:60%;" id="submodel" onKeyDown="getSubModel(event);" readonly="true" placeholder="Press F3 for Search"  value='<s:property value="submodel"/>' ></td>
			<td width="20%" align="right">EngineSize</td>
				<td width="65%"><input type="text" id="esize" name="esize" style="width:60%;" onKeyDown="getEnignesize(event);" readonly="true" placeholder="Press F3 for Search" value='<s:property value="esize"/>'/></td>
			</tr>
			
<tr><td width="6%" align="right">Cabin Size1</td> 
			<td width="31%" align="left" ><input type="text" name="csize1" id="csize1" style="width:60%;" onKeyDown="getCabinSize(event,'1');" readonly="true" placeholder="Press F3 for Search"  value='<s:property value="csize1"/>' ></td>
			<td width="20%" align="right">Cabin Size2</td>
				<td width="65%"><input type="text" id="csize2" name="csize2" style="width:60%;" onKeyDown="getCabinSize(event,'2');" readonly="true" placeholder="Press F3 for Search" value='<s:property value="csize2"/>'/></td>
			</tr>	
			
<tr><td width="6%" align="right">Cabin Size3</td>
			<td width="31%" align="left" ><input type="text" name="csize3" id="csize3" style="width:60%;" onKeyDown="getCabinSize(event,'3');" readonly="true" placeholder="Press F3 for Search" value='<s:property value="csize3"/>' ></td>
			<td width="20%" align="right">Bed Size1</td>
				<td width="65%"><input type="text" id="bsize1" name="bsize1" style="width:60%;" onKeyDown="getBedSize(event,'1');" readonly="true" placeholder="Press F3 for Search" value='<s:property value="bsize1"/>'/></td>
			</tr>	
			
<tr><td width="6%" align="right">Bed Size2</td>
			<td width="31%" align="left" ><input type="text" name="bsize2" id="bsize2" style="width:60%;" onKeyDown="getBedSize(event,'2');" readonly="true" placeholder="Press F3 for Search" value='<s:property value="bsize2"/>' ></td>
			<td width="20%" align="right">Bed Size3</td>
				<td width="65%"><input type="text" id="bsize3" name="bsize3" style="width:60%;" onKeyDown="getBedSize(event,'3');" readonly="true" placeholder="Press F3 for Search" value='<s:property value="bsize3"/>'/></td>
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
				
				<input type="hidden" id="yomfrmid" name="yomfrmid"
				value='<s:property value="yomfrmid"/>' />	
				
				<input type="hidden" id="yomtoid" name="yomtoid"
				value='<s:property value="yomtoid"/>' />	
				
				<input type="hidden" id="brandid" name="brandid"
				value='<s:property value="brandid"/>' />	
				
				<input type="hidden" id="modelid" name="modelid"       
				value='<s:property value="modelid"/>' />	 
				
				<input type="hidden" id="submodelid" name="submodelid"  
				value='<s:property value="submodelid"/>' />	
				
				<input type="hidden" id="esizeid" name="esizeid"
				value='<s:property value="esizeid"/>' />	
				
				<input type="hidden" id="bsize1id" name="bsize1id"
				value='<s:property value="bsize1id"/>' />	
				
				<input type="hidden" id="bsize2id" name="bsize2id"
				value='<s:property value="bsize2id"/>' />	
				
				<input type="hidden" id="bsize3id" name="bsize3id"
				value='<s:property value="bsize3id"/>' />	
				
				<input type="hidden" id="csize1id" name="csize1id"
				value='<s:property value="csize1id"/>' />	
				
				<input type="hidden" id="csize2id" name="csize2id"
				value='<s:property value="csize2id"/>' />	
				
				<input type="hidden" id="csize3id" name="csize3id"
				value='<s:property value="csize3id"/>' />
				
				
				</td> 
    </tr>
    </table>
	
	</fieldset>
    	
	</form>
<table width="100%">
      <tr>
        <td width="3%">&nbsp;</td>
        <td width="42%">	 <div id="jqxSuitGrid"></div>  
</td>
        <td width="55%">&nbsp;</td>
      </tr>
    </table>
<br/>
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
		
		<div id="yomsearchwindow">
			<div></div>
			<div></div>
		</div>
		<div id="spec1searchwindow">
			<div></div>
			<div></div>
		</div>
		<div id="spec2searchwindow">
			<div></div>
			<div></div>
		</div>
		<div id="spec3searchwindow">
			<div></div>
			<div></div>
		</div>
		<div id="suitsearchwindow">
			<div></div>
			<div></div>
		</div>
		

</body>
</html>