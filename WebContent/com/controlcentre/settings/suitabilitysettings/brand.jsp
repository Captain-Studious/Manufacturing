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
			
	    document.getElementById("formdet").innerText="Suitabilty Brand(SBRD)";
		document.getElementById("formdetail").value="Suitabilty Brand";
		document.getElementById("formdetailcode").value="SBRD";
		window.parent.formCode.value="SBRD";
		window.parent.formName.value="Suitabilty Brand";
 		var databrand= '<%=DAO.prdbrandLoad(session)%>';
             var num = 0; 
            var source =
            {
                datatype: "json",
                datafields: [
                          	{name : 'doc_no' , type: 'number' },
     						{name : 'brandname', type: 'String'  },
     						{name : 'desc1', type: 'String'  },
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
    
            $("#jqxBrandSearch1").jqxGrid(
                    {
                    	width: '100%',
                    	 height: 300,
                        source: dataAdapter,
                        showfilterrow: true,
                        filterable: true,
                        selectionmode: 'singlerow',
                        //Add row method
                        columns: [
                                  
                                  
                              	
                               
        					{ text: 'DOC NO', datafield: 'doc_no', width: '8%' },
        					{ text: 'DATE',columntype: 'textbox', filtertype: 'input', datafield: 'date', width: '12%',cellsformat:'dd.MM.yyyy' },
        					{ text: 'BRAND',columntype: 'textbox', filtertype: 'input', datafield: 'brandname', width: '20%' },
        					{ text: 'BRAND DESCRIPTION',columntype: 'textbox', filtertype: 'input', datafield: 'desc1', width: '40%' },
        					
        					{ text: 'YOM(From)',columntype: 'textbox', filtertype: 'input', datafield: 'fromyom', width: '10%' },
        					{ text: 'YOM(To)',columntype: 'textbox', filtertype: 'input', datafield: 'toyom', width: '10%' },
        					

        					{ text: 'YOM(From)id',columntype: 'textbox', filtertype: 'input', datafield: 'frmyomid', width: '28%'  ,hidden:true},
        					{ text: 'YOM(To)id',columntype: 'textbox', filtertype: 'input', datafield: 'toyomid', width: '28%' ,hidden:true},
        					
        	              ]
                    });
            $('#jqxBrandSearch1').on('rowdoubleclick', function (event) {
                var rowindex1=event.args.rowindex;
                if($('#mode').val()=="view")
				{
                document.getElementById("docno").value= $('#jqxBrandSearch1').jqxGrid('getcellvalue', rowindex1, "doc_no"); 
                document.getElementById("brand").value = $("#jqxBrandSearch1").jqxGrid('getcellvalue', rowindex1, "brandname");
                document.getElementById("branddesc").value = $("#jqxBrandSearch1").jqxGrid('getcellvalue', rowindex1, "desc1");
                 
                   
                document.getElementById("yomfrm").value = $("#jqxBrandSearch1").jqxGrid('getcellvalue', rowindex1, "fromyom");
                document.getElementById("yomto").value = $("#jqxBrandSearch1").jqxGrid('getcellvalue', rowindex1, "toyom");
                document.getElementById("yomfrmid").value = $("#jqxBrandSearch1").jqxGrid('getcellvalue', rowindex1, "frmyomid");
                document.getElementById("yomtoid").value = $("#jqxBrandSearch1").jqxGrid('getcellvalue', rowindex1, "toyomid");
                
                
                
                $('#date').jqxDateTimeInput({disabled: false});
                $("#date").jqxDateTimeInput('val', $("#jqxBrandSearch1").jqxGrid('getcellvalue', rowindex1, "date"));
                $('#date').jqxDateTimeInput({disabled: true});
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
		$('#frmSBrand input').attr('readonly', true);
		/* $('#date').jqxDateTimeInput({
			readonly : true
		}); */
		 $('#date').jqxDateTimeInput({disabled: true});
		
		
		
		
		/* 	$('#jqxDateTimeInput').jqxDateTimeInput({ disabled: true}); */
	}
	function funRemoveReadOnly() {
		$('#frmSBrand input').attr('readonly', false);
	/* 	$('#date').jqxDateTimeInput({
			readonly : false
		}); */
		
		
		   
		  $('#yomfrm').attr('readonly', true);
		$('#yomto').attr('readonly', true);
		
		$('#docno').attr('readonly', true);
		 $('#date').jqxDateTimeInput({disabled: false});
		if($('#mode').val()=="D")
			{
			 $('#date').jqxDateTimeInput({disabled: false});
			/*  $('#date').jqxDateTimeInput({
					readonly : true
				}); */
			}
		
		
		
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
	/* 	if($('#datehidden').val()){
			$("#date").jqxDateTimeInput('val', $('#date').val());
		} */
		
  		 
		 if($('#msg').val()!=""){
		 	 
		   $.messager.alert('Message',$('#msg').val());
			  }
		

			
	
		
	}
	
	 $(function(){
	        $('#frmSBrand').validate({
	                 rules: {
	                	 brand: {
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
	        });});
	
	
	
	/*  $(function(){
	        $('#frmBrand').validate({
	                 rules: {
	                 brand: {
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
		    	if($('#mode').val()=="A")
		    		{
		    		return 1;
		    		}
		    	else
		    		{
		    		chkbrand();
		    		}
	    		
		} 
	        
	    	function chkbrand() {
	    		
	    		 
	    		var x = new XMLHttpRequest();
	    		x.onreadystatechange = function() {
	    			if (x.readyState == 4 && x.status == 200) {
	    				items = x.responseText;
	    		 
	    				if(parseInt(items)==1)
	    					{
	    					document.getElementById("frmSBrand").submit();
	    					
	    					
	    					}
	    				else
	    					{
	    					 document.getElementById("errormsg").innerText=" References Present Edit Restricted  ";  
	    					return 0;
	    					}
	    				 
	    				
	    				} else {
	    			}
	    		}
	    		x.open("GET", "chkbrand.jsp?docno="+document.getElementById("docno").value+"&yomfrm="+document.getElementById("yomfrm").value+"&yomto="+document.getElementById("yomto").value, true);
	    		x.send();
	    	}
	        
	        
	     function funFocus(){
	    	// document.getElementById("brand").focus();
	     }
	  
</script>  
 
</head>
<body onLoad="setValues();" >
<form id="frmSBrand" action="saveSuitbrandAction" method="get" autocomplete="off">
	<jsp:include page="../../../../header.jsp" />
	<br/> 
	<fieldset><legend> Suitability Brand </legend> 
	<table width="100%">
<tr>
<td>
<table width="100%" >
		<tr><td width="5%" align="right">Date</td>
			<td width="19%"  align="left"><div id="date" name="date"   value='<s:property value="date"/>' ></div>
	  	  </td>
		  	
 <td  width="7%" align="right">Yom(From)</td>
<td width="17%"> 
 <input type="text" name="yomfrm"  id="yomfrm" placeholder="Press F3 for Search" readonly onKeyDown="getYom(event,'frm');" value='<s:property value="yomfrm"/>'></td>
 <td width="6%"><div align="right">Yom(To)</div></td>
 <td width="14%"><input type="text" name="yomto"    onKeyDown="getYom(event,'to');"  readonly="readonly" placeholder="Press F3 for Search" id="yomto" value='<s:property value="yomto"/>'> </td>
			<td   width="7%" align="right">Doc No.</td>
<td width="25%">
<input type="text" name="docno" id="docno" value='<s:property value="docno"/>' readonly  tabindex="-1">
			</td>
  </tr>
      
		<tr><td width="5%" align="right">Brand</td>
			<td width="19%" align="left" ><input type="text" name="brand"  style="width:80%;" id="brand"  value='<s:property value="brand"/>' ></td>
			<td width="7%" align="right">Description</td>
		  <td colspan="5"><input type="text" id="branddesc" name="branddesc" style="width:50%;" value='<s:property value="branddesc"/>'/></td>
  </tr>
	</table>
    <input
				type="hidden" name="mode" id="mode"
				value='<s:property value="mode"/>' /> <input type="hidden"
				name="deleted" id="deleted" value='<s:property value="deleted"/>' />
			<input type="hidden" id="msg" name="msg"
				value='<s:property value="msg"/>' /></td> 
				
				
				<input type="hidden" id="msg1" name="msg1"  
				value='<s:property value="msg1"/>' />
						
				<input type="hidden" id="yomfrmid" name="yomfrmid"  
				value='<s:property value="yomfrmid"/>' />	
				
				<input type="hidden" id="yomtoid" name="yomtoid"
				value='<s:property value="yomtoid"/>' />	
    </tr>
    </table>
	
	</fieldset>
    	
	</form>
<table width="100%">
      <tr>
    
        <td  >	 <div id="jqxBrandSearch1"></div>  
</td>
       
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
	
<div id="yomsearchwindow">
			<div></div>
		</div>
</body>
</html>