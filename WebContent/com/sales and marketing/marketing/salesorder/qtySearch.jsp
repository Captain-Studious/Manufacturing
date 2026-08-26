 <%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<html>
<head>
 
<% String contextPath=request.getContextPath();%>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>GatewayERP(i)</title>
<%--   <jsp:include page="../../../../includes.jsp"></jsp:include>   --%> 
<style>
 <link href="<%=contextPath%>/css/body.css" media="screen" rel="stylesheet" type="text/css" />
</style>
<style>
/* .myButtons {
	background:-webkit-gradient(linear, left top, left bottom, color-stop(0.05, #7d5d3b), color-stop(1, #634b30));
	background:-moz-linear-gradient(top, #7d5d3b 5%, #634b30 100%);
	background:-webkit-linear-gradient(top, #7d5d3b 5%, #634b30 100%);
	background:-o-linear-gradient(top, #7d5d3b 5%, #634b30 100%);
	background:-ms-linear-gradient(top, #7d5d3b 5%, #634b30 100%);
	background:linear-gradient(to bottom, #7d5d3b 5%, #634b30 100%);
	filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#7d5d3b', endColorstr='#634b30',GradientType=0);
	background-color:#7d5d3b;
	-moz-border-radius:1px;
	-webkit-border-radius:1px;
	border-radius:1px;
	display:inline-block;
	cursor:pointer;
	color:#ffffff;
	font-family:Arial;
	font-size:12px;
	padding:3px 17px;
	text-decoration:none;
}
.myButtons:hover {
	background:-webkit-gradient(linear, left top, left bottom, color-stop(0.05, #634b30), color-stop(1, #7d5d3b));
	background:-moz-linear-gradient(top, #634b30 5%, #7d5d3b 100%);
	background:-webkit-linear-gradient(top, #634b30 5%, #7d5d3b 100%);
	background:-o-linear-gradient(top, #634b30 5%, #7d5d3b 100%);
	background:-ms-linear-gradient(top, #634b30 5%, #7d5d3b 100%);
	background:linear-gradient(to bottom, #634b30 5%, #7d5d3b 100%);
	filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#634b30', endColorstr='#7d5d3b',GradientType=0);
	background-color:#634b30;
}
.myButtons:active {
	position:relative;
	top:1px;
}
 */
 .myButtons {
	background:-webkit-gradient(linear, left top, left bottom, color-stop(0.05, #7892c2), color-stop(1, #476e9e));
	background:-moz-linear-gradient(top, #7892c2 5%, #476e9e 100%);
	background:-webkit-linear-gradient(top, #7892c2 5%, #476e9e 100%);
	background:-o-linear-gradient(top, #7892c2 5%, #476e9e 100%);
	background:-ms-linear-gradient(top, #7892c2 5%, #476e9e 100%);
	background:linear-gradient(to bottom, #7892c2 5%, #476e9e 100%);
	filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#7892c2', endColorstr='#476e9e',GradientType=0);
	background-color:#7892c2;
	border:1px solid #4e6096;
	display:inline-block;
	cursor:pointer;
	color:#ffffff;
	font-family:Arial;
	font-size:12px;
	padding:2px 7px;
	text-decoration:none;
}
.myButtons:hover {
	background:-webkit-gradient(linear, left top, left bottom, color-stop(0.05, #476e9e), color-stop(1, #7892c2));
	background:-moz-linear-gradient(top, #476e9e 5%, #7892c2 100%);
	background:-webkit-linear-gradient(top, #476e9e 5%, #7892c2 100%);
	background:-o-linear-gradient(top, #476e9e 5%, #7892c2 100%);
	background:-ms-linear-gradient(top, #476e9e 5%, #7892c2 100%);
	background:linear-gradient(to bottom, #476e9e 5%, #7892c2 100%);
	filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#476e9e', endColorstr='#7892c2',GradientType=0);
	background-color:#476e9e;
}
.myButtons:active {
	position:relative;
	top:1px;
}      

        

</style>
	<script type="text/javascript">

	 
	<%
	 String psrno=request.getParameter("psrno")==null?"0":request.getParameter("psrno");

	 String locid=request.getParameter("locid")==null?"0":request.getParameter("locid");
	 
	 String unit=request.getParameter("unit")==null?"0":request.getParameter("unit");
	 
	
	 String mode=request.getParameter("mode")==null?"0":request.getParameter("mode");
	 String value=request.getParameter("value")==null?"0":request.getParameter("value");
	 
	  
	 
	 System.out.println("====psrno======="+psrno);
	 System.out.println("====unit===qqq===="+unit);
	 
	%>
	$(document).ready(function () { 
	  
		 
		   
	});   
		   
  	function loadSearchss() {
 		
 
 		 

		

		getdatas();
 

	}
	function getdatas(aa){
		var aa="yes";
		 var psrno='<%=psrno%>';
	 var locid='<%=locid%>';
		var reftype=$("#cmbreftype").val();
		var rowno=$("#rowvalss").val();
		
		 var mode='<%=mode%>';
		 var value='<%=value%>';
		 var unit='<%=unit%>';
		 
		
	
			 $("#qtysearchdiv").load('qtysubSearch.jsp?aa='+aa+'&rowno='+rowno+'&reftype='+reftype+'&psrno='+psrno+'&locid='+locid+'&mode='+mode+'&value='+value+"&unit="+unit);
		

		}  
	
	
	function searchdata()
	{
		
		  var rows = $('#qtysearchgrid').jqxGrid('getrows');
          var temp="";
          var temp2="0";
          var temp3="0";
/*           var aa=0;
          for(var i=0 ; i < rows.length ; i++){
      	    
              if(rows[i].chk==true)
           	   
           	   {
           	   
           	  aa=1;
           	   
           	   }
               	    
               	   } 
          
          if(parseInt(aa)==0)
        	  {
        	  
        	  document.getElementById("errormsg").innerText="Choose at least one request";
        		 

        		 return 0;
        	  }
           */
          
          
          
           for(var i=0 ; i < rows.length ; i++){
        	    
       if(rows[i].chk==true)
    	   
    	   {
    	   
    	   var qty=0;
    	   var foc=0;
    	   if(rows[i].qty=="" ||rows[i].qty==null || typeof(rows[i].qty)=="undefiend") 
  	 	   {
    		   qty=0; 
  	 	   }
    	   else
    		   {
    		   
    		   qty=rows[i].qty;
    		   }
     	   if(rows[i].foc=="" ||rows[i].foc==null || typeof(rows[i].foc)=="undefiend") 
  	 	   {
     		  foc=0; 
  	 	   }
    	   else
    		   {
    		   
    		   foc=rows[i].foc;
    		   }
     	   
     	   
     	   if(parseFloat(qty) || parseFloat(foc))
     		   {
     		   
     		  temp=temp+rows[i].batch_no+" @@ "+qty+" @@ "+foc+" @@ "+$('#qtysearchgrid').jqxGrid('getcelltext', i, "exp_date" )+" @@@ ";
         	 
       	   temp2=parseFloat(temp2)+parseFloat(qty);
       	   temp3=parseFloat(temp3)+parseFloat(foc);
     		   
     		   }
    	   
    	  
    	   }
        	    
        	   }
          
        
           
           $('#jqxSalesOrder').jqxGrid('setcellvalue', $("#rowvalss").val(), "collectqty" ,temp);
           
           $('#jqxSalesOrder').jqxGrid('setcellvalue', $("#rowvalss").val(), "qty" ,temp2);
 
           $('#jqxSalesOrder').jqxGrid('setcellvalue', $("#rowvalss").val(), "foc" ,temp3);
 	 $('#bacthWindow').jqxWindow('close');  
	    
           
          
	}
	
	
	
	
	function chkfocs()
	{
	 
		
	 
		
		  var rows = $('#qtysearchgrid').jqxGrid('getrows');
         
          var aa=0;
          for(var i=0 ; i < rows.length ; i++){
      	    
              if(rows[i].chk==true)
           	   
           	   {
           	   
           	  aa=1;
           	   
           	   }
               	    
               	   } 
          
          if(parseInt(aa)==0)
        	  {
        	  
        	  document.getElementById("errormsg").innerText="Choose at least one request";
        		 

        		 return 0;
        	  }
          
		
		if(document.getElementById("focvalidate").value==1)
			{
			checkfocqty();
			}
		else
			{
			searchdata();
			}
		
		
		

	        
		
	} 
	
	
	
	
	function checkfocqty()
	{
		
  	  var temp="";
      var temp2="0";
      var temp3="0";
 	 var psrno='<%=psrno%>';
 	 var unit='<%=unit%>';
	  var rows = $('#qtysearchgrid').jqxGrid('getrows');
       for(var i=0 ; i < rows.length ; i++){
    	    
           if(rows[i].chk==true)
        	   
        	   {
        	   
        	   var qty=0;
        	   var foc=0;
        	   if(rows[i].qty=="" ||rows[i].qty==null || typeof(rows[i].qty)=="undefiend") 
      	 	   {
        		   qty=0; 
      	 	   }
        	   else
        		   {
        		   
        		   qty=rows[i].qty;
        		   }
         	   if(rows[i].foc=="" ||rows[i].foc==null || typeof(rows[i].foc)=="undefiend") 
      	 	   {
         		  foc=0; 
      	 	   }
        	   else
        		   {
        		   
        		   foc=rows[i].foc;
        		   }
        	   
        	   
        	 
        	   temp2=parseFloat(temp2)+parseFloat(qty);
        	   temp3=parseFloat(temp3)+parseFloat(foc);
        	   }
            	    
            	   }
              
		
		   var x=new XMLHttpRequest();
		   x.onreadystatechange=function(){
		   if (x.readyState==4 && x.status==200)
		    {
		      var items= x.responseText.trim();
		    
		    
		       
                       
		    	  
		    	  if(temp3>items)
		    		  {
		    	  
		    		  document.getElementById("errormsg").innerText=" Allowed Foc :  "+items;
		        		 

		        		 return 0;
		    	  
		    	  
		    	     }
		    	  else
		    		  {
		    		  searchdata();
		    		  }
		    	  }
		     
		       } 
		   x.open("GET","checkfocqty.jsp?qty="+temp2+"&psrno="+psrno+"&unit="+unit,true);
			x.send();
		 
		      	
		
	}
	
	
	

	</script>
<body bgcolor="#E0ECF8">
<div id=search>
<table width="100%" >
  <tr >
   <td>
 
    </td>
  </tr>
  <tr>
  <td>
    
  <table width="100%" >
  
        <tr> 
    
    <td align="right"  width="50%" ><input type="button" name="searchss" id="searchss" class="myButton" value="Search"  onclick="loadSearchss()">
     <td align="left"  width="50%" >&nbsp;&nbsp;<input type="button" name="searchs" id="searchs" class="myButtons" value="Submit"  onclick="chkfocs()">
     
</td>

 

    </tr> 
    
    </table>
 

    
    
    
  </td>

  <tr>
    <td colspan="8" align="right">
    
    <div id="qtysearchdiv">
      
   <jsp:include  page="qtysubSearch.jsp"></jsp:include> 
   
   </div>
    </td>
  </tr>
</table>
  </div>
</body>
</html>