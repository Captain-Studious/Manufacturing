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
	 String masterdoc_no=request.getParameter("masterdoc_no")==null?"0":request.getParameter("masterdoc_no");
	 
	  
	 
	 System.out.println("====psrno======="+psrno);
	 System.out.println("====mode===qqq===="+mode);
	 
	%>
	$(document).ready(function () { 
	  var ss='<%=mode%>';
	  var masterdoc_no1='<%=masterdoc_no%>';
	  var psrno1='<%=psrno%>';
	  
	  if(ss=="E")
		  {

			 $("#searchdiv1").load('batchsubSearch.jsp?psrno='+psrno1+'&mode='+ss+"&masterdoc_no="+masterdoc_no1);
		

		  }
		 
		   
	});   
		   
 
	
	
	function searchdata()
	{
		
		  var rows = $('#batchsearchgrid').jqxGrid('getrows');
          var temp="";
          var temp2="0";
          var temp3="0";
          var aa=0;
          var bb=0;
          for(var i=0 ; i < rows.length ; i++){
        	  
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
     	   
     	   if(parseFloat(qty)>0 || parseFloat(foc))
     		   {
     		   
     		   if(rows[i].batch_no=="" ||rows[i].batch_no==null || typeof(rows[i].batch_no)=="undefiend") 
      	 	   {
         		  aa=1;
         		  break;
      	 	   }
     		   
     		   if(rows[i].exp_date=="" ||rows[i].exp_date==null || typeof(rows[i].exp_date)=="undefiend") 
      	 	   {
         		  bb=1;
         		  break;
      	 	   }
     		   
     		   
     		   }
     	   
        	  
          }
          
          
          if(aa==1)
        	  {
        		document.getElementById("errormsg").innerText="Batch No Is Required ";
        		 
        		return 0;
        	  }
          
          
          if(bb==1)
        	  {
        		document.getElementById("errormsg").innerText="Expiry Date Is Required ";
        		 
        		return 0;
        	  } 
          
           for(var i=0 ; i < rows.length ; i++){
 
    	   
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
     	   
     	   
     	   if(parseFloat(qty)>0 || parseFloat(foc)>0)
     		   {
     		   
     		  temp=temp+rows[i].batch_no+" @@ "+qty+" @@ "+foc+" @@ "+$('#batchsearchgrid').jqxGrid('getcelltext', i, "exp_date" )+" @@@ ";
         	 
       	   temp2=parseFloat(temp2)+parseFloat(qty);
       	   temp3=parseFloat(temp3)+parseFloat(foc);
     		   
     		   }
    	   
    	  
     
        	    
        	   }
           
           var dd=$('#serviecGrid').jqxGrid('getcellvalue', $("#rowindex").val(), "qty");
           var ee=$('#serviecGrid').jqxGrid('getcellvalue', $("#rowindex").val(), "foc");
           if(dd=="" ||dd==null || typeof(dd)=="undefiend") 
  	 	   {
        	   dd=0; 
  	 	   }
           if(ee=="" ||ee==null || typeof(ee)=="undefiend") 
  	 	   {
        	   ee=0; 
  	 	   }
           
           if(parseFloat(dd)!=parseFloat(temp2))
        	   {
        	   document.getElementById("errormsg").innerText=" Quantity Does Not Match ";
      		 
       		return 0;
        	   }
           if(parseFloat(ee)!=parseFloat(temp3))
    	   {
        	   document.getElementById("errormsg").innerText=" Foc Does Not Match ";
      		 
       		return 0;
    	   }
        
           
           $('#serviecGrid').jqxGrid('setcellvalue', $("#rowindex").val(), "colbatch" ,temp);
           
 
 	 $('#bacthWindow').jqxWindow('close');  
	    
           
          
	}
	
	
	
 
 
	

	</script>
<body bgcolor="#E0ECF8">
<div id=search>
<table width="100%" >
 

  <tr>
    <td colspan="8" align="right">
    
    <div id="searchdiv1">
      
   <jsp:include  page="batchsubSearch.jsp"></jsp:include> 
   
   </div>
    </td>
  </tr>
    <tr>
  <td>
    
  <table width="100%" >
  
        <tr> 
    
    
     <td align="center"  width="100%" >&nbsp;&nbsp;<input type="button" name="searchs" id="searchs" class="myButtons" value="Submit"  onclick="searchdata()">
     
</td>

 

    </tr> 
    
    </table>
 

    
    
    
  </td>
</table>
<br> 
  </div>
</body>
</html>