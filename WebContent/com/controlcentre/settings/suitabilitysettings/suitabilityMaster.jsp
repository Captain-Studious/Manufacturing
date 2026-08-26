
<%
	String contextPath = request.getContextPath();
%>
<%String name="Krishnan"; %>
<!DOCTYPE>
<html>
<head>

<title>GatewayERP(i)</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link href="../../../../css/main.css" rel="stylesheet" type="text/css" />
<link href="../../../../css/body.css" media="screen" rel="stylesheet"
	type="text/css" />
<link href="../../../../css/myButton.css" rel="stylesheet"
	type="text/css" />
<style>
#whole {
	width: 100%;
}

#header {
	background-color: #E0ECF8;
	color: black;
	text-align: left;
	height: 7%;
	width: 3% padding:0px;
}

#nav {
	line-height: 30px;
	background-color: #E0ECF8;
	height: 90.5%;
	width: 5%;
	float: left;
	position: absolute;
}

#comiframe {
	float: right;
	width: 98.5%;
	height: 98%;
	color: #eeeeee;
}

</style>

<script type="text/javascript">
	
function getSpecName() {
	var x = new XMLHttpRequest();
	x.onreadystatechange = function() {
		if (x.readyState == 4 && x.status == 200) {
			items = x.responseText;
			items = items.split('###');

			document.getElementById("spec1").value = items[0].trim();
			document.getElementById("spec2").value = items[1].trim();
			document.getElementById("spec3").value = items[2].trim();
			document.getElementById("specode1").value = items[3].trim();
			document.getElementById("specode2").value = items[4].trim();
			document.getElementById("specode3").value = items[5].trim();
			//$("#nav").load();
			/* document.getElementById("spec4").value = items[3]; */
			
		} else {
		}
	}
	x.open("GET", "getSpecName.jsp", true);
	x.send();
}
	
</script>

</head>
<body onLoad="getSpecName();">
	<div id="mainBG" class="homeContent" data-type="background">
		<div id="header">
			<h3>Suitability Master</h3>

		</div>

		<div id="nav">
			<table>
				<%-- <tr>
					<td><input type="button" name="btntype" class="myButton"
						value="Type" style="width: 90px; outline: none;"
						on
						click='document.getElementById("iframe2").src="<%=contextPath%>/com/controlcentre/settings/suitabilitysettings/typeMaster.jsp";'></td>
				</tr> --%>
				 <tr>
					<td><input type="button" name="btnyom" class="myButton" 
						value="YOM" style="width: 90px;"
						onclick='document.getElementById("iframe2").src="<%=contextPath%>/com/controlcentre/settings/suitabilitysettings/yom.jsp";'></td>
				</tr>
				<tr>
					<td><input type="button" name="btnbrand"  class="myButton"
						value="Brand" style="width: 90px;"
						onclick='document.getElementById("iframe2").src="<%=contextPath%>/com/controlcentre/settings/suitabilitysettings/brand.jsp";'></td>
				</tr>
				<tr>
					<td><input type="button" name="btncategory" class="myButton"
						value="Model" style="width: 90px;"
						onclick='document.getElementById("iframe2").src="<%=contextPath%>/com/controlcentre/settings/suitabilitysettings/model.jsp";'></td>
				</tr>
				<tr>
					<td><input type="button" name="btncategory" class="myButton"
						value="Sub model" style="width: 90px;"
						onclick='document.getElementById("iframe2").src="<%=contextPath%>/com/controlcentre/settings/suitabilitysettings/subModel.jsp";'></td>
				</tr>
				
				<tr>
					<td><input type="button" name="btndept" id="spec1" class="myButton"
						 style="width: 90px;" 
						onclick='document.getElementById("iframe2").src="<%=contextPath%>/com/controlcentre/settings/suitabilitysettings/spec1.jsp?spec1="+document.getElementById("spec1").value+"&specode1="+document.getElementById("specode1").value;'></td>
				</tr>
				<tr>
					<td><input type="button" name="btnbs" id="spec2" class="myButton"
						 style="width: 90px;"
						onclick='document.getElementById("iframe2").src="<%=contextPath%>/com/controlcentre/settings/suitabilitysettings/spec2.jsp?spec2="+document.getElementById("spec2").value+"&specode2="+document.getElementById("specode2").value;'></td>
				</tr> 
				
				<tr>
					<td><input type="button" name="btnbc" id="spec3" class="myButton"
						 style="width: 90px;"
						onclick='document.getElementById("iframe2").src="<%=contextPath%>/com/controlcentre/settings/suitabilitysettings/spec3.jsp?spec3="+document.getElementById("spec3").value+"&specode3="+document.getElementById("specode3").value;'></td>
				</tr>
				
				 <%-- <tr>
					<td><input type="button" name="btnveh" class="myButton" hidden="true"
						value="Suit Master" style="width: 90px;"
						onclick='document.getElementById("iframe2").src="<%=contextPath%>/com/controlcentre/settings/suitabilitysettings/suitVehMaster.jsp";'></td>
				</tr> --%>
				

			</table>
			<input type="hidden" id="formName" name="formName" value="000" /> <input
				type="hidden" id="formCode" name="formCode" value="COM" /> <input
				type="hidden" id="branchid" name="branchid" value='' /> 
				<input type="hidden" id="mode" name="mode"  />
				
				<input type="hidden" id="specode1" name="specode1"  />
				<input type="hidden" id="specode2" name="specode2"  />
				<input type="hidden" id="specode3" name="specode3"  />
		</div>
		<div id="comiframe">

			<iframe width="100%" height="100%" id="iframe2" align="right"
				frameborder="0" marginwidth="100%" scrolling="no"
				src="<%=contextPath%>/com/controlcentre/settings/suitabilitysettings/yom.jsp"></iframe>
		</div>
		<script>
			function resizeIframeToFitContent(iframe) {
				// This function resizes an IFrame object
				// to fit its content.
				// The IFrame tag must have a unique ID attribute.
				iframe.height = document.frames[iframe.iframe2].document.body.scrollHeight;
			}
		</script>
	</div>
</body>
</html>