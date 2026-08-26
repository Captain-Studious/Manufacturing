<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title> </title>
 
 
<style type="text/css">



#classdiv
{

 background-color: #F7F0BA;
}
</style>

<script type="text/javascript">
$(document).ready(function() {
	
});

function funapplyamounts()
{
 

	var x = new XMLHttpRequest();
	x.onreadystatechange = function() {
		if (x.readyState == 4 && x.status == 200) {
			var items = x.responseText.trim();	
 
			if(parseInt(items)==11)
				{
				
				  $.messager.alert('Message', 'Applied Successfully ' ,'Success');   
					$('#applywindow').jqxWindow('close'); 
				 
				 
				}
			else if(parseInt(items)==10)
			{
			
			  
				  $.messager.alert('Message', 'Already Applied' ,'warning');   
					$('#applywindow').jqxWindow('close'); 
			 
			}
			else
				{
				  $.messager.alert('Message', 'Not Applied' ,'warning');   
	 	 		  
				}
		  
			
			
			
		} else {
		}
	}
	x.open("GET","invapplysave.jsp?masterdoc_no="+document.getElementById("masterdoc_no").value, true);
	x.send();


}


function funapplyClose()
{
	$('#applywindow').jqxWindow('close'); 
	}


</script>
</head>
<body > 
 <div  id="classdiv" >
<br>
<br>
<table width="100%">

<tr>

<td colspan="2" align="center">
Do you want to apply corresponding to invoice
  </td>
</tr>

<tr>

<td colspan="2" align="center">
&nbsp;
  </td>
</tr>
<tr>

<td colspan="2" align="center">
&nbsp;
  </td>
</tr>

<tr>
<td align="center" width="50%">
 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
 &nbsp;&nbsp;&nbsp;&nbsp; <button class="myButton" type="button" id="btnapply" name="btnapply" onclick="funapplyamounts()">YES</button>
  </td>
 
  <td align="center" width="50%">
  <button class="myButton" type="button" id="btnapply" name="btnapply" onclick="funapplyClose();">NO</button>&nbsp;&nbsp;&nbsp;&nbsp;
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  </td>
  
</tr>

</table>
<br>
 
 
</div>
</body>
</html>