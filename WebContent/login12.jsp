
<%@ taglib uri="/struts-tags" prefix="s"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html >
<html>
<head>
<% String contextPath=request.getContextPath();%>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="css/mystyle.css">
    
    <link rel="stylesheet" href="css/loginreset.css">

    
        <link rel="stylesheet" href="css/loginstyle.css">



<link rel="shortcut icon" href="<%=contextPath+"/"%>gatelogo.ico" > 
<title>Gateway ERP(Integrated) Copyright &#169; 2017 GW INNOVATIONS PVT. LTD.</title>
<script type="text/javascript" src="js/jquery-1.11.1.min.js"></script>
<script type="text/javascript" src="<%=contextPath%>/js/jquery.easyui.min.js"></script>
<script type="text/javascript" src="js/index.js"></script>


<link rel="stylesheet" type="text/css" href="<%=contextPath%>/css/easyui.css">
<link rel="stylesheet" type="text/css" href="<%=contextPath%>/css/icon.css">


<link rel="stylesheet" type="text/css" href="<%=contextPath%>/css/loginreset.css">
<link rel="stylesheet" type="text/css" href="<%=contextPath%>/css/loginstyle.css">
<script>
$(document).ready(function () {
	
	if($('#msg').val()!="" ) {
		$.messager.alert('Login Failed',$('#msg').val());
	}
	
	 $('body').keydown(function (evt) {
		  if (evt.keyCode == 8) {
			  var d = event.srcElement || event.target;
		        if ((d.tagName.toUpperCase() === 'INPUT' && 
		             (
		                 d.type.toUpperCase() === 'TEXT' ||
		                 d.type.toUpperCase() === 'PASSWORD' || 
		                 d.type.toUpperCase() === 'FILE' || 
		                 d.type.toUpperCase() === 'EMAIL' || 
		                 d.type.toUpperCase() === 'SEARCH' || 
		                 d.type.toUpperCase() === 'DATE' )
		             ) || 
		             d.tagName.toUpperCase() === 'TEXTAREA') {
		            doPrevent = d.readOnly || d.disabled;
		        }
		        else {
		            doPrevent = true;
		        }
		    }
		    if (doPrevent) {
		        event.preventDefault();
			}
	}); 

	
    $("input").not($(":button")).keypress(function (evt) {
        if (evt.keyCode == 13) {
            iname = $(this).val();
            if (iname !== 'Submit') {
                var fields = $(this).parents('form:eq(0),body').find('button, input, textarea, select');
                var index = fields.index(this);
                if (index > -1 && (index + 1) < fields.length) {
                    fields.eq(index + 1).focus();
                }
                return false;
            }
        }
    });
});


function getComp()
{
	var x=new XMLHttpRequest();
	var items,cmpItems;
	x.onreadystatechange=function(){
		if (x.readyState==4 && x.status==200)
			{
		        items= x.responseText;
		        items=items.split('####');
		        var cmpItems = items[0].split(",");
		        var cmpIdItems = items[1].split(",");
	        	var optionscmp = '';
		       for ( var i = 0; i < cmpItems.length; i++) {
		    	   optionscmp += '<option value="' + cmpIdItems[i] + '">' + cmpItems[i] + '</option>';
		        }
		        	$("select#company").html(optionscmp);
			}
		else
			{
			}
	}
	x.open("GET","getCompany.jsp",true);
	x.send();
}
  
</script> 

</head>
<body background="icons/tradingicon.jpg" style="overflow:hidden;background-repeat: no-repeat;background-size:cover;" autocomplete="off" onload="getComp();"> 


<div class="container">
  <div class="info">
     <br>
  </div>
</div>
<div class="form">
  <div class="thumbnail"><img  height="50" width="100"  src="icons/complogo.jpg"/></div>
   <form class="login-form" method="post" action="login" autocomplete="off">
 
  <select name="company" id="company" ></select>
    <input type="text" name="userid" placeholder="username"/>
    <input type="password" name="password" name="password" placeholder="password"/>
    <button  type="submit">LOGIN</button>
  
    <input type="hidden" id="msg" name="msg"  value='<s:property value="msg"/>'/>
  </form>
</div>








<%-- 	<div class="content">
	   <form method="post" action="login" autocomplete="off">
	   
	       <div class="wrap">
		<div class="avatar">
      <img src="icons/comlogo.jpg">
		</div>
		<select name="company" id="company" ></select>
		
		<input type="text" name="userid" value="" placeholder="Username" required>
		
		<!-- <input type="text" placeholder="username" required> -->
		<div class="bar">
		
			<i><br></i>
		</div>
		<input type="password" name="password" value="" placeholder="Password" required>
	<!-- 	<input type="password" placeholder="password" required> -->
		 
		<button>Sign in</button>
	</div>
	   
	   
		<table class="loginTable" border="0" align="center" cellpadding="10" cellspacing="0">
		<tr>
		    <td colspan="3"><select name="company" id="company" ></select></td>
		</tr>
		<tr>
		    <td width="150"><p style="margin-left:20px;">USERNAME</p></td>
			<td style="width:10px;">:</td>
			<td width="110"><input type="text" name="userid" value="" placeholder="Username" autofocus></td>
		</tr>
		<tr>
		    <td><p style="margin-left:20px;">PASSWORD</p></td>
			<td>:</td>
			<td><input type="password" name="password" value="" placeholder="Password"></td>
		</tr>
		<tr>
			<td colspan="3" style="text-align:center;"><input class="buttonStyle" type="submit" id="btnlogin" name="commit" value="Login"  onclick=""/></td>
		</tr>
	</table>
	<input type="hidden" id="msg" name="msg"  value='<s:property value="msg"/>'/>
		</form>
	</div> --%>
</body>
</html>