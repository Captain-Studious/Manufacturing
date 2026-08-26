   
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
<%-- <script type="text/javascript" src="../../js/dashboard.js"></script> --%> 

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

		$(document).ready(function ()
		{
	
				 $("#fromdate").jqxDateTimeInput({ width: '125px', height: '15px',formatString:"dd.MM.yyyy"});
				 $("#todate").jqxDateTimeInput({ width: '125px', height: '15px',formatString:"dd.MM.yyyy"});	
				 $('#eventOfferDiv').show();
			 	 $('#stockClearanceDiv').hide();
	 			 document.getElementById('radoffer').checked=true;
	  			 $("body").prepend('<div id="overlay" class="ui-widget-overlay" style="z-index: 1; display: none;"></div>');
	     		 $("body").prepend("<div id='PleaseWait' style='display: none;position:absolute; z-index: 1;top:180px;right:550px;'><img src='../../../../icons/31load.gif'/></div>");
				 $('#fromdate').on('change', function (event) 
				 {
	 		
			   				var fromdates=new Date($('#fromdate').jqxDateTimeInput('getDate'));
			 
			 				 // out date
			 	 			var todates=new Date($('#todate').jqxDateTimeInput('getDate')); //del date
			 	 
			   				if(fromdates>todates)
			   				{
				   
				   					$.messager.alert('Message','To Date Less Than From Date  ','warning'); 			   
			   						return false;
			  				}   
			 	 
			 	 
			 
			 	 
		 		});
		 
		 
		 		$('#todate').on('change', function (event)
		 		{
			 
			   				var fromdates=new Date($('#fromdate').jqxDateTimeInput('getDate'));
			 
			  				// out date
			 	 			var todates=new Date($('#todate').jqxDateTimeInput('getDate')); //del date
			 	 
			   				if(fromdates>todates)
			   				{
				   
				   					$.messager.alert('Message',' To Date Less Than  From Date  ','warning'); 			   
			   						return false;
			  				}  			 	 
		 		});
		 
		 
		 		$("#updatdata").attr("disabled",true);
				$('#catsearchwindow').jqxWindow({
											width : '25%',
											height : '58%',
											maxHeight : '70%',
											maxWidth : '45%',
											title : 'Category Search',
											position : {
														x : 420,
														y : 87
														},
											theme : 'energyblue',
											showCloseButton : true,
											keyboardCloseKey : 27
											});
			
				$('#catsearchwindow').jqxWindow('close');
				
				$('#subcatsearchwindow').jqxWindow({
											width : '25%',
											height : '58%',
											maxHeight : '70%',
											maxWidth : '45%',
											title : 'Sub Category Search',
											position : {
														x : 420,
														y : 87
														},
											theme : 'energyblue',
											showCloseButton : true,
											keyboardCloseKey : 27
												});
				
			$('#subcatsearchwindow').jqxWindow('close');
			
			$('#brandsearchwindow').jqxWindow({
											width : '25%',
											height : '58%',
											maxHeight : '70%',
											maxWidth : '70%',
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
				
			    $('#productwindow').jqxWindow({ width: '50%',
			    								height: '62%',
												maxHeight: '80%',
												maxWidth: '50%' , 
												title: 'Product Search' ,
												position: { x: 250, y: 60 },
												keyboardCloseKey: 27});
			    $('#productwindow').jqxWindow('close');   
			
			   
				 
				$('#name').dblclick(function()
				{
				 		if($('#type').val()=="BR")
					 	{
					 		brandFormSearchContent('brandFormSearchGrid.jsp');  
					 	} 
				 		else if($('#type').val()=="CA")
					 	{
							catFormSearchContent('catFormSearchGrid.jsp'); 
					 	}
				 		else if($('#type').val()=="SC")
					 	{
					 		subCatFormSearchContent('subCatFormSearchGrid.jsp');
					 	}
				 		else if($('#type').val()=="PR")
						{
							productSearchContent('productSearch.jsp');
				 		}				
				}); 
	 
		
		});

		
		
		function funExportBtn()
		{
				if (document.getElementById('radoffer').checked) 
				{      JSONToCSVCon(offerListExcel, 'Offer List', true);
	   					//$("#stocklistgrid").jqxGrid('exportdata', 'xls', 'Strock List');
				}
	 			else if (document.getElementById('radstock').checked) 
	 			{
	 				JSONToCSVCon(datasstockclearExcel, 'Stock Clearance', true);
						//$("#stocklistgriddet").jqxGrid('exportdata', 'xls', 'Strock List');
				}
	 	}


		function brandFormSearchContent(url) 
		{
				$('#brandsearchwindow').jqxWindow('open');
				$.get(url).done(function(data) 
				{
					$('#brandsearchwindow').jqxWindow('setContent', data);
					$('#brandsearchwindow').jqxWindow('bringToFront');
				});
		 }
		 function subCatFormSearchContent(url) 
		 {
					$('#subcatsearchwindow').jqxWindow('open');
					$.get(url).done(function(data) 
					{
							$('#subcatsearchwindow').jqxWindow('setContent', data);
							$('#subcatsearchwindow').jqxWindow('bringToFront');
					});
		 }
		 function catFormSearchContent(url) 
		 {
					$('#catsearchwindow').jqxWindow('open');
					$.get(url).done(function(data)
					{
							$('#catsearchwindow').jqxWindow('setContent', data);
							$('#catsearchwindow').jqxWindow('bringToFront');
					});
		}

		function productSearchContent(url) 
		{
					$('#productwindow').jqxWindow('open');
	    			$.get(url).done(function (data) 
	    			{
							//alert(data);
	  						$('#productwindow').jqxWindow('setContent', data);

					}); 
		}


		function getname(event)
		{
				if($('#type').val()=="BR")
			    {
	 					brandFormSearchContent('brandFormSearchGrid.jsp');  
	 			} 
				else if($('#type').val()=="CA")
			  	{
	 					catFormSearchContent('catFormSearchGrid.jsp'); 
	 			}
				else if($('#type').val()=="SC")
	 			{
	 					subCatFormSearchContent('subCatFormSearchGrid.jsp');
	 			}
				else if($('#type').val()=="PR")
				{
						productSearchContent('productSearch.jsp');
				}
	
	
		}

		function funreload(event)
		{

	 			var fromdates=new Date($('#fromdate').jqxDateTimeInput('getDate'));	 
		  		// out date
	 			var todates=new Date($('#todate').jqxDateTimeInput('getDate')); //del date 	 
	   			if(fromdates>todates)
	   			{		   
		   				$.messager.alert('Message','To Date Less Than From Date  ','warning');		 
	  					return false;
	  			} 
	   			else
				{
	   			/* 		var type=   $("#type option:selected").text().trim();
	   			   
	   			   		if(document.getElementById("name").value=="")
	   				    {
	   				   
	   				   		$.messager.alert('Message',' Search Your '+type ); 
	   				   		document.getElementById("name").focus();
	   				   		return 0;
	   				   }
	   				 */
				 		var barchval = document.getElementById("cmbbranch").value;     
						 var statusselect=$("#statusselect").val();	 
			 			var psrno=$("#psrno").val(); 
			 			var type=$('#type').val();
				 		var brandid=$("#brandid").val();
				 		var catid=$("#catid").val();
				 		var subcatid=$("#subcatid").val(); 	 
					    var fromdates=$("#fromdate").val();		 				 
				 		var todates=$("#todate").val();
			 	
				 		if (document.getElementById('radoffer').checked)
				 		{	   
			  			
			 			 		$("#overlay, #PleaseWait ").show();
			 					/*  alert("1");
			 			 		alert("barchval="+barchval+"statusselect="+statusselect+"psrno="+psrno+"type="+type+"fromdates="+fromdates+"todates="+todates+"brandid="+brandid+"catid="+catid+"subcatid="+subcatid);
			  			 		*/// $("#eventOfferDiv").load("eventOffergrid.jsp?barchval="+barchval+"&statusselect="+statusselect+"&psrno="+psrno+"&type="+type+"&fromdates="+fromdates+"&todates="+todates);
				 
				  		 		$("#eventOfferDiv").load("eventOffergrid.jsp?barchval="+barchval+"&statusselect="+statusselect+"&psrno="+psrno+"&type="+type+"&fromdates="+fromdates+"&todates="+todates+"&brandid="+brandid+"&catid="+catid+"&subcatid="+subcatid);
				 
				 		}
		 		 		else if (document.getElementById('radstock').checked) 
		 			  	{
		 				
		 					 	$("#overlay, #PleaseWait").show();
				  		 		$("#stockClearanceDiv").load("stockGridDetail.jsp?barchval="+barchval+"&statusselect="+statusselect+"&psrno="+psrno+"&type="+type+"&fromdates="+fromdates+"&todates="+todates+"&brandid="+brandid+"&catid="+catid+"&subcatid="+subcatid);
				  		 
			 	 		} 
		 		}
	  
		}
	
	
		function getname(event)
		{
				if($('#type').val()=="BR")
	 			{
	 				brandFormSearchContent('brandFormSearchGrid.jsp');  
	 			} 
				else if($('#type').val()=="CA")
	 			{
	 				catFormSearchContent('catFormSearchGrid.jsp'); 
	 			}
				else if($('#type').val()=="SC")
	 			{
	 				subCatFormSearchContent('subCatFormSearchGrid.jsp');
	 			}
				else if($('#type').val()=="PR")
				{
	 				productSearchContent('productSearch.jsp');
				}
		}
		
		function  funcleardata()
		{
	 			document.getElementById('psrno').value="";
	 			document.getElementById('radoffer').checked=true; 
	 			document.getElementById("cmbbranch").value="a";
		}
	
		function fundisable()
		{	
				if (document.getElementById('radoffer').checked) 
				{		
		  				$('#eventOfferDiv').show();
		   				$('#stockClearanceDiv').hide();		  
				}
	 			else if (document.getElementById('radstock').checked) 
	 			{
		 
		  				$('#eventOfferDiv').hide();
		 			 	$('#stockClearanceDiv').show();
		 
				}
	 	}
	 
	 
		function clearnames()
		{
	
	 			document.getElementById("name").value="";
				document.getElementById("name").value="";
				document.getElementById("psrno").value="";
				document.getElementById("brandid").value="";
				document.getElementById("catid").value="";
				document.getElementById("subcatid").value=""; 
			
	
		}




		</script>
	</head>
	<body onload="getBranch();">
		<div id="mainBG" class="homeContent" data-type="background"> 
			<div class='hidden-scrollbar'>
				<table width="100%" >
					<tr>
						<td width="20%" >
    						<fieldset style="background: #ECF8E0;">
								<table width="100%" >
									<jsp:include page="../../heading.jsp"></jsp:include>		
	 									<tr><td colspan="2">&nbsp;</td></tr> 
 										<tr><td colspan="2" align="center"><input type="radio" id="radoffer" name="revent" onchange="fundisable();" value="radoffer"><label for="radoffer" class="branch">Event Offer</label>&nbsp;
								    									   <input type="radio" id="radstock" name="revent" onchange="fundisable();" value="radstock"><label for="radstock" class="branch">Stock Clearance</label></td></tr>
	 									<tr><td  align="right" ><label class="branch">From</label></td><td align="left"><div id='fromdate' name='fromdate' value='<s:property value="fromdate"/>'></div>
                    						</td>
                    				    </tr>
                     					<tr><td  align="right" ><label class="branch">To</label></td><td align="left"><div id='todate' name='todate' value='<s:property value="todate"/>'></div>
                    																				</td>
                    					</tr>   
  										<tr><td colspan="2">&nbsp;</td></tr>
  										<tr><td  align="right" ><label class="branch">Type</label></td><td  align="left"   ><select id="type" style="width: 75%;height:20PX;"   name="type" onchange="clearnames()">
  																																		<option value="">--Select--</option>
  																																	<option value="BR">Brand</option>
  																																	<option value="CA">Category</option>
  																																	<option value="SC">Sub Category</option>
  																																	<option value="PR">Product</option>
  
  																															</select>
  																										</td>
  										</tr>
   										<tr> <td  align="center" colspan="2"><input type="text" id="name" name="name" style="width: 100%;height:20PX;"  style="width: 75%;"  placeholder="Press F3 for Search" readonly="readonly" onKeyDown="getname(event);"  value='<s:property value="name"/>'> </td></tr>
   										<tr><td colspan="2">&nbsp;</td></tr>
 										<tr><td colspan="2">&nbsp;</td></tr>
 										<tr><td colspan="2">&nbsp;</td></tr>     
										<tr>
											<td colspan="2"><div id='paychaaaaa' style="width: 100% ; align:right; height: 150px;"></div></td>
										</tr>	
								</table>
							</fieldset>	
	 						<input type="hidden" id="statusselect" name="statusselect" value='<s:property value="statusselect"/>'>
   							<input type="hidden" id="acno" name="acno" value='<s:property value="acno"/>'>
    						<input type="hidden" id="brandid" name="brandid" >  
       						<input type="hidden" id="catid" name="catid" >
       						<input type="hidden" id="subcatid" name="subcatid" > 
       						<input type="hidden" id="psrno" name="psrno" > 
						</td>
						<td width="80%">
							<table width="100%">
								<tr>
			 						<td><div id="eventOfferDiv"><jsp:include page="eventOffergrid.jsp"></jsp:include></div></td>
								</tr>
		    					<tr><td><div id="stockClearanceDiv">
												 <jsp:include page="stockGridDetail.jsp"></jsp:include> 
										</div>
									</td>
							   </tr> 
							</table>
						</td>
					</tr>
				</table>
			</div>
  			<div id="brandsearchwindow">
				<div></div>
				<div></div>
			</div>		
			<div id="catsearchwindow">
				<div></div>
				<div></div>
			</div>		
			<div id="subcatsearchwindow">
				<div></div>
				<div></div>
			</div>	
			<div id="productwindow">
				<div></div>
			</div>
		</div>
	</body>
</html>