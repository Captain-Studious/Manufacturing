<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
 <% String contextPath=request.getContextPath();%>

<html>
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
 #psearch {
 
background:#FAEBD7;
 
}
.btn {
  background: #3498db;
  background-image: -webkit-linear-gradient(top, #3498db, #2980b9);
  background-image: -moz-linear-gradient(top, #3498db, #2980b9);
  background-image: -ms-linear-gradient(top, #3498db, #2980b9);
  background-image: -o-linear-gradient(top, #3498db, #2980b9);
  background-image: linear-gradient(to bottom, #3498db, #2980b9);
  -webkit-border-radius: 28;
  -moz-border-radius: 28;
  border-radius: 28px;
  font-family: Arial;
  color: #ffffff;
  font-size: 10px;
  padding: 4px 15px 6px 17px;
  text-decoration: none;
}
.textbox {
    border: 0;
    height: 25px;
    width: 20%;
    border-radius: 5px;
    -moz-border-radius: 5px;
    -webkit-border-radius: 5px;
    box-shadow: 1px 1px 0 0 #E0ECF8, 5px 5px 40px 2px #E0ECF8 inset;
    -moz-box-shadow: 1px 1px 0 0 #E0ECF8, 5px 5px 40px 2px #E0ECF8 inset;
    -webkit-box-shadow: 1px 1px 0 0 #E0ECF8, 5px 5px 40px 2px #E0ECF8 inset;
    -webkit-background-clip: padding-box;
    outline: 0;
}
 #divname {
     
    background-color: #e2c791;
    box-shadow: 10px 10px grey;
     position:fixed;z-index:1000;right:30px;top:100px;  
}
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


$(document).ready(function () {  
    
	   /* Date */ 	
	    
	   		 $('#btnvaluechange').hide();
	   
	   	  
       $("#masterdate").jqxDateTimeInput({  width: '125px', height: '15px', formatString:"dd.MM.yyyy"});
     
       $('#accountSearchwindow').jqxWindow({ width: '50%', height: '62%',  maxHeight: '75%' ,maxWidth: '50%' , title: 'Account Search' ,position: { x: 150, y: 60 }, keyboardCloseKey: 27});
	   $('#accountSearchwindow').jqxWindow('close');
	     $('#searchwndow').jqxWindow({ width: '50%', height: '55%',  maxHeight: '85%' ,maxWidth: '80%' ,title: 'Product Search' , position: { x: 250, y: 120 }, keyboardCloseKey: 27});
	     $('#searchwndow').jqxWindow('close');  
	       $('#sidesearchwndow').jqxWindow({ width: '55%', height: '90%',  maxHeight: '90%' ,maxWidth: '80%' ,title: 'Product Search ' , position: { x: 600, y: 0 }, keyboardCloseKey: 27});
	     $('#sidesearchwndow').jqxWindow('close');   
	     
	     
	     
	     $('#searchwindow').jqxWindow({ width: '50%', height: '60%',  maxHeight: '75%' ,maxWidth: '50%' , title: ' Search' ,position: { x: 500, y: 60 }, keyboardCloseKey: 27});
		   $('#searchwindow').jqxWindow('close'); 
	 
		   
		   
		   $('#importwindow').jqxWindow({ width: '30%', height: '24.4%',  maxHeight: '85%' ,maxWidth: '80%' ,title: 'Import Options' , position: { x: 500, y: 200 }, theme: 'energyblue', showCloseButton: false});
		     $('#importwindow').jqxWindow('close');   
		     
		     
		     $('#locationwindow').jqxWindow({ width: '30%', height: '55%',  maxHeight: '75%' ,maxWidth: '50%' , title: 'Location Search' ,position: { x: 200, y: 70 }, keyboardCloseKey: 27});
		     $('#locationwindow').jqxWindow('close');  
			   

		 
		   
		   $('#itemdocno').dblclick(function(){

				  if($("#mode").val() == "A" || $("#mode").val() == "E")
					  {
			 
				//itemtype,itemdocno,itemname
				  
		  	    $('#searchwindow').jqxWindow('open');
		  	
				if(document.getElementById("itemtype").value=="1")
					{
					refsearchContent('costCodeSearchGrid.jsp?docno='+document.getElementById("itemtype").value); 	
					}
				
				
				
	    		else if(document.getElementById("itemtype").value=="6")
				{
				 refsearchContent('fleetGrid.jsp?'); 	
				}
			
		  	  	  	  
		  	
	    		else
				{
				 refsearchContent('costunitsearch.jsp?docno='+document.getElementById("itemtype").value); 	
				} 
					  }
			  }); 
			  
			   $('#txtlocation').dblclick(function(){
				   
					  if($("#mode").val() == "A" || $("#mode").val() == "E")
						  {
					   
				  	    $('#locationwindow').jqxWindow('open');
				  	
				  	  locationsearchContent('searchlocation.jsp?'); 
						  }
					  
			  	  
		          
	                     }); 
		   

				 $('#masterdate').on('change', function (event) {
					  
					    var maindate = $('#masterdate').jqxDateTimeInput('getDate');
					  	 if ($("#mode").val() == "A" || $("#mode").val() == "E" ) {   
					    funDateInPeriodchk(maindate);
					  	 }
					   });




 
  
});


 

	  
	  
	  function getitem(event){
	      	 var x= event.keyCode;
	      	 if(x==114){

	      		  $('#searchwindow').jqxWindow('open');
	      			
	      		if(document.getElementById("itemtype").value=="1") //com/search/costunit/costCodeSearchGrid.jsp
				{
				refsearchContent('costCodeSearchGrid.jsp?docno='+document.getElementById("itemtype").value); 	
				}
	      		
	    		else if(document.getElementById("itemtype").value=="6")
				{
				 refsearchContent('fleetGrid.jsp?'); 	
				}
			
	      		
			else
				{
				 refsearchContent('costunitsearch.jsp?docno='+document.getElementById("itemtype").value); 	
				}
			

	      		 
	      		  
	      	 
	      	 }
	      	 else{
	      		 }
	      	 }  
	      	  function refsearchContent(url) {
	           //alert(url);
	              $.get(url).done(function (data) {
	      //alert(data);
	            $('#searchwindow').jqxWindow('setContent', data);

	      	}); 
	        	}
	  
	  
      function productSearchContent(url) {
     	 //alert(url);
     		 $.get(url).done(function (data) {
     			 
     			 $('#sidesearchwndow').jqxWindow('open');
     		$('#sidesearchwndow').jqxWindow('setContent', data);
     
     	}); 
     	} 

      function getloc(event){
      	 var x= event.keyCode;
      	 if(x==114){
      	  $('#locationwindow').jqxWindow('open');
      	
      	  locationsearchContent('searchlocation.jsp?');   }
      	 else{
      		 }
      	 }  
      	  function locationsearchContent(url) {
           //alert(url);
              $.get(url).done(function (data) {
      //alert(data);
            $('#locationwindow').jqxWindow('setContent', data);

      	}); 
        	}


function funReset(){
	//$('#frmMin')[0].reset(); 
}
function funReadOnly(){
	$('#frmMin input').attr('readonly', true );
	$('#frmMin select').attr('disabled', true );
	 $('#masterdate').jqxDateTimeInput({ disabled: true});
	 
		$("#serviecGrid").jqxGrid({ disabled: true});
		
		 $('#psearch').attr('disabled', true );
		 $('#setbtn').attr('disabled', true ); 
 
 $('#btnvaluechange').hide();
 
	
}
function funRemoveReadOnly(){
	reloads();    
	 chkmultiqty();
	 chkproductconfig();
	 document.getElementById("editdata").value="";
	$('#frmMin input').attr('readonly', false );
/* 	$('#serviecGrid').jqxGrid('setcolumnproperty', 'discount',  "editable", true); */
	$('#frmMin select').attr('disabled', false );
    
		 $('#btnvaluechange').hide();
		 
		 $('#txtlocation').attr('readonly', true);
		 
		 $('#itemdocno').attr('readonly', true);
		 $('#itemname').attr('readonly', true);
		 
		 $('#clientname').attr('readonly', true);
			$('#psearch').attr('disabled', false );
			   $('#setbtn').attr('disabled', false ); 
		 $('#site').attr('readonly', true);
		 
		 
		// itemname  clientname site
		 
		 
	  
	 $('#masterdate').jqxDateTimeInput({ disabled: false});
	 
 
	 
	$('#docno').attr('readonly', true);
	 
	 $("#serviecGrid").jqxGrid({ disabled: false});

 
	 
	if ($("#mode").val() == "A") {
		  //$('#chkdiscount').attr('disabled', false);
		$('#masterdate').val(new Date());
	 
			 $("#serviecGrid").jqxGrid('clear');
			    $("#serviecGrid").jqxGrid('addrow', null, {});
				 $('#itemname').attr('readonly', true);
				 
				 $('#clientname').attr('readonly', true);
				 
				 $('#site').attr('readonly', true);
				 
		   
	   }
	
  	if ($("#mode").val() == "E") {
		 $('#btnvaluechange').show();
		$("#serviecGrid").jqxGrid({ disabled: true});
	}  
}
function funcheckaccinvendor()
{
	if(document.getElementById("puraccid").value=="")
		{
		 document.getElementById("errormsg").innerText="Search Vendor";  
		 document.getElementById("puraccid").focus();
	       
	        return 0;
		}
	
}


function funFocus(){
	 
   	$('#masterdate').jqxDateTimeInput('focus'); 	    		
}
function funDateInPeriodchk(value){
    var styear = new Date(window.parent.txtaccountperiodfrom.value);
    var edyear = new Date(window.parent.txtaccountperiodto.value);
    var mclose = new Date(window.parent.monthclosed.value);
    mclose.setHours(0,0,0,0);
    edyear.setHours(0,0,0,0);
    styear.setHours(0,0,0,0);
    var currentDate = new Date(new Date());
 
     if(value>currentDate){
     document.getElementById("errormsg").innerText="Future Date, Transaction Restricted. ";
    
     return 0;
    } 
    
    document.getElementById("errormsg").innerText="";
   
     return 1;
 }



function funNotify(){	
	   


	var maindate = $('#masterdate').jqxDateTimeInput('getDate');
	   var validdate=funDateInPeriodchk(maindate);
	   if(validdate==0){
	   return 0; 
	   }

	if(document.getElementById("txtlocation").value=="")
	{

	 document.getElementById("errormsg").innerText="Search Location";  
	 document.getElementById("txtlocation").focus();
	   
	    return 0;
	}
		 
	else
		{
		  document.getElementById("errormsg").innerText="";
		}
		   
	  if(parseInt(document.getElementById("multimethod").value)==1)
		{	
		  chkstock();
		}
	  else
		  {
	 save();
		  }
	  
	  
	}


function chkstock()
{

		var rows = $("#serviecGrid").jqxGrid('getrows');
		var list = new Array();
		 
	   for(var i=0 ; i < rows.length; i++){
		 
		   if(parseInt(rows[i].prodoc)>0)  
		   { 
		 
		   list.push(rows[i].prodoc+"::"+rows[i].specid+"::"+rows[i].qty+"::"+rows[i].unitdocno+"::"+rows[i].oldqty);
		 
		   }
	   }
			 
	  ajaxcallchk(list);
	   
}
	   

	 function ajaxcallchk(list){
		 var branch=document.getElementById("brchName").value;
		 var location=document.getElementById("txtlocationid").value;
		 var mode=$('#mode').val();
		 	
		 	var x=new XMLHttpRequest();
		 	x.onreadystatechange=function(){
		 		if (x.readyState==4 && x.status==200)
		 			{
		 			 var items= x.responseText.trim();
		  
		 	 
		 		   
		 		    if(parseInt(items)==1)
			           {
		 		    	document.getElementById("errormsg").innerText=" Does Not Have Sufficient Stock !!";  
		 		        return 0;
			           }
		 		    else  if(parseInt(items)==2)
		 		    	{
		 		    	document.getElementById("errormsg").innerText=" error!!";  
		 		        return 0;
		 		    	
		 		    	}
			       

				           
			           
			           else
			        	   {
			        	   save();
			        	   }
			           
		 			    
		 			}
		 		  //type,description,remarks,lbrcost,partscost,total
		 	}
		 	 x.open("GET","validateqty.jsp?list="+list+"&branch="+branch+"&mode="+mode+"&location="+location+"&date="+document.getElementById("masterdate").value,true);
				x.send();
			        
		 }


function save(){	
 
  

 
 

 
var rows = $("#serviecGrid").jqxGrid('getrows');
   $('#serviecGridlength').val(rows.length);
  //alert($('#gridlength').val());
  for(var i=0 ; i < rows.length ; i++){
	  
	 
	  
			   var myvar = rows[i].psrno; 
				   newTextBox = $(document.createElement("input"))  
				      .attr("type", "dil")
				      .attr("id", "sertest"+i)
				      .attr("name", "sertest"+i)
				      .attr("hidden", "true");         
				  
				  /* newTextBox.val(rows[i].psrno+"::"+rows[i].prodoc+" :: "+rows[i].unitdocno+" :: "+rows[i].qty+" :: "
						   +rows[i].unitprice+" :: "+rows[i].total+" :: "+rows[i].discount+" :: "+rows[i].nettotal+" :: "+rows[i].saveqty+" :: "+rows[i].checktype+" :: "+rows[i].specid+" :: ");
				 */ /* discount  disper */    /* 	 cost_price   savecost_price */
				 if((!myvar =="undefined") || (!myvar =="")){
					 //alert("myvar==="+myvar);
				 newTextBox.val(rows[i].psrno+" :: "+rows[i].prodoc+" :: "+rows[i].unitdocno+" :: "+rows[i].qty+" :: "  
						   +rows[i].saveqty+" :: "+rows[i].checktype+" :: "+rows[i].specid+" :: "+rows[i].foc+" :: "+rows[i].cost_price+" :: "+rows[i].savecost_price+" :: "+rows[i].stockid+" :: "+rows[i].batchid);
				 }
				 
				// alert(newTextBox.val());
				  newTextBox.appendTo('form');
				  
		   
 
   
  }   
	  
	    
	    	   
	    		$("#serviecGrid").jqxGrid({ disabled: false});
			 
			 
	    		$("#frmMin").submit();
			 
			   
	   
	
	return 1;
} 

function calculatedata(val)
{

}

function funwarningopen(){
	   $.messager.confirm('Confirm', 'Transaction Will Affect Already Inserted Values.', function(r){
	       if (r){
	     
		 		  document.getElementById("editdata").value="Editvalue";
		 		 $('#psearch').attr('disabled', false );
		 		$('#setbtn').attr('disabled', false );  
	    		$("#serviecGrid").jqxGrid({ disabled: false});
	    		  $("#serviecGrid").jqxGrid('addrow', null, {});
	    		    if($('#reftypeval').val()!="DIR")
		  	  		  {  
		  	  		
		  	  		 
		  	    			//$('#psearch').attr('disabled', true );
		  	    		    //$('#setbtn').attr('disabled', true );  
		  	    			
		  	  		  }
		  	    		else
		  	    			{  
		  	    			//$('#psearch').attr('disabled', false );
		  	    		   // $('#setbtn').attr('disabled', false );  
		  	    			
		  	    			}
	       }
	      });
	   }

function funChkButton() {
	

}

function funSearchLoad(){
	changeContent('mainsearch.jsp'); 
}
function getCurrencyIds(){
	   
	      
	        }
	   
	   function getRatevalue(angel)
	   {
	   
	      
	        }
	   
	   
	   function combochange()
	   {
		   
 
		   
		   
		   
		   
		   
			
	   }

	   function setValues() {
		   var minval=$('#mineditval').val();
		   if(parseInt(minval)==0){
			  // alert("mineditval==="+minval);
			   $('#btnEdit').attr('disabled', true);
		   }
			if($('#hidmasterdate').val()){
				$("#masterdate").jqxDateTimeInput('val', $('#hidmasterdate').val());
			}
			
			 
			
		 	var dis=document.getElementById("masterdoc_no").value;
			if(dis>0)
				{     
				//alert("");
				//funchkforedit();
		 	 var indexval1 = document.getElementById("masterdoc_no").value;   

	     	  		  
		 	
		 	var locationid=document.getElementById("txtlocationid").value;
	     	  		 
	     	  		 $("#sevdesc").load("serviecgrid.jsp?purdoc="+indexval1+"&locationid="+locationid+"&date="+document.getElementById("masterdate").value);
	     	  		
				 } 

				 if($('#msg').val()!=""){
				   $.messager.alert('Message',$('#msg').val());
				  } 
				
    		combochange();
    		document.getElementById("formdet").innerText=$('#formdetail').val()+" ("+$('#formdetailcode').val().trim()+")";
				//  getCurrencyId();
				
		} 
	   function funPrintBtn(){
	 	  
	 	   if (($("#mode").val() == "view") && $("#masterdoc_no").val()!="") {
	 	  
	 	   var url=document.URL;
 
	        var reurl=url.split("saveActionMin");
	        
	        $("#docno").prop("disabled", false);                
	        var dtype=$('#formdetailcode').val();
	  
	/* var win= window.open(reurl[0]+"printGrn?docno="+document.getElementById("masterdoc_no").value+"&dtype="+dtype,"_blank","top=250,left=310,Width=800,Height=800,location=no,scrollbars=no,toolbar=yes");
	     
	win.focus(); */ 
	         var win= window.open(reurl[0]+"PRINTgin?docno="+document.getElementById("masterdoc_no").value+"&dtype="+dtype,"_blank","top=250,left=310,Width=800,Height=800,location=no,scrollbars=no,toolbar=yes");
		     
	    	win.focus(); 
	 	   } 
	 	  
	 	   else {
		    	      $.messager.alert('Message','Select a Document....!','warning');
		    	      return false;
		    	     }
		    	
	 	}
	$(function(){
        $('#frmMin').validate({
                rules: { 
              
                	delterms:{maxlength:200},
                	purdesc:{maxlength:200},
                	payterms:{maxlength:200},
                	/* refno:{required:true}, */
                	puraccid:{required:true}
                 },
                 messages: {
                	 delterms: {maxlength:"  Max 200 chars"},
                	 purdesc: {maxlength:"  Max 200 chars"},
                	 payterms: {maxlength:"  Max 200 chars"},
               /*  	 refno: {required:" * required"}, */
                	 puraccid: {required:" *"}
                 }
        });});
    function isNumber(evt) {
        var iKeyCode = (evt.which) ? evt.which : evt.keyCode
        if (iKeyCode != 46 && iKeyCode > 31 && (iKeyCode < 48 || iKeyCode > 57))
        	{
     	   document.getElementById("errormsg").innerText=" Enter Numbers Only";  
           
            return false;
        	}
        document.getElementById("errormsg").innerText="";  
        return true;
    }
 
 
 function funrefdisslno()
 {
	 
	 
 }
 
	 
		function funchkforedit()
	    {
		

		
			var x = new XMLHttpRequest();
			x.onreadystatechange = function() {
				if (x.readyState == 4 && x.status == 200) {
					var items = x.responseText.trim();	
					if(parseInt(items)>0)
						{
						
						 $("#btnEdit").attr('disabled', true );
						 $("#btnDelete").attr('disabled', true ); 
						 
						 
						 
						}
					else
						{
						 
						}
				  
					
					
					
				} else {
				}
			}
			x.open("GET", "linkchk.jsp?masterdoc_no="+document.getElementById("masterdoc_no").value, true);
			x.send();
		
		
		}
	 
	function removemsg()
	{
		 document.getElementById("errormsg").innerText="";
		
	}
	
	 function gettype(){ 
		 
			
			   var x=new XMLHttpRequest();
			   x.onreadystatechange=function(){
			   if (x.readyState==4 && x.status==200)
			    {
			      items= x.responseText;
			       
			      items=items.split('####');
			           var docno=items[0].split(",");
			           var type=items[1].split(",");
			        
			           var optionstype = '';
 
			
			           for ( var i = 0; i < type.length; i++) {
			        	   optionstype += '<option value="' + docno[i] + '">' + type[i] + '</option>';
				        }
			          
			            $("select#type").html(optionstype); 	
			            
			        
			            if($('#hidetype').val()!="")
						  {
						  
						  
						  $('#type').val($('#hidetype').val());   
						  
						  }
					 
			  
			    }
			       }
			   x.open("GET","gettype.jsp?",true);
				x.send();
			        
			      
			        }
	 
	 function getitemtype(){ 
		 
			
		   var x=new XMLHttpRequest();
		   x.onreadystatechange=function(){
		   if (x.readyState==4 && x.status==200)
		    {
		      items= x.responseText;
		       
		      items=items.split('####');
		           var docno=items[0].split(",");
		           var type=items[1].split(",");
		        
		           var optionstype = '';

		
		           for ( var i = 0; i < type.length; i++) {
		        	   optionstype += '<option value="' + docno[i] + '">' + type[i] + '</option>';
			        }
		            
		            $("select#itemtype").html(optionstype); 	
		            
		        
		            if($('#hideitemtype').val()!="")
					  {
					  
					  
					  $('#itemtype').val($('#hideitemtype').val());   
					  
					  }
				 
		  
		    }
		       }
		   x.open("GET","getitem.jsp?",true);
			x.send();
		        
		      
		        }
	 
	 
	 function cleardata()
	 {
		 document.getElementById("itemdocno").value="";
		 document.getElementById("itemname").value="";
		 document.getElementById("clientname").value="";
	 
		 document.getElementById("cldocno").value="";
		 document.getElementById("siteid").value="";
		 document.getElementById("site").value="";
		 
	 
	 }
		function setgrid()
		 {
			
		//alert("in set grd");	   
			 
			 var temppsrno=document.getElementById("temppsrno").value; 
			 var unit=document.getElementById("unit").value; 
			 
			 
	 
       	  
   		var rows1 = $("#serviecGrid").jqxGrid('getrows');
 	    var aa=0;
 	    for(var i=0;i<rows1.length;i++){
 	 
 	    	
 	    	 
 		   if(parseInt(rows1[i].prodoc)==parseInt(temppsrno))
 			   {
 		  
				 if((parseInt(document.getElementById("multimethod").value)==1))
				{	
					   
   			   if(parseInt(rows1[i].unitdocno)==parseInt(unit))
   			   {
   				   
   				   aa=1;
       			   break;
   			   }
				}
				 else
					 {
 			   
 			   aa=1;
 			   break;
					 }
 			   }
 		   else{
 			   
 			   aa=0;
 		       } 
 	    }
			 
 	   if(parseInt(aa)==1)
		   {
		   
			//document.getElementById("errormsg").innerText="You have already select this product";
			  

				 
		    // document.getElementById("jqxInput1").focus();
			 
		 //  return 0;
		   
		   
		   
		   }
	   else
		   {
		   document.getElementById("errormsg").innerText="";
		   }
	    
			
			
			
			 var rows = $('#serviecGrid').jqxGrid('getrows');
			  
		 	 
		     var rowlength= rows.length;
			 

		     
		  /*    if(document.getElementById("multi").checked)
			 {
		    	
		    	 
		    	 
		    	 
		    	 $('#serviecGrid').jqxGrid('setcellvalue', rowlength-1, "chkbox",true);
				 $('#serviecGrid').jqxGrid('setcellvalue',  rowlength-1, "batch_no",'');
				  $('#serviecGrid').jqxGrid('setcellvalue',  rowlength-1, "exp_date",'');
				  
				 
				  if(document.getElementById("colbatch").value=="")
					  {
					  document.getElementById("errormsg").innerText="Multi_Batch Details Is Required ";
		        		 
		        		return 0;
					  }
				  
				  
				  $('#serviecGrid').jqxGrid('setcellvalue',  rowlength-1, "colbatch", document.getElementById("colbatch").value);
				     
		    	 
		    	 
		     }
		     else
		    	 {
		    	 
		    	 
		    	 $('#serviecGrid').jqxGrid('setcellvalue', rowlength-1, "chkbox",false);
				 $('#serviecGrid').jqxGrid('setcellvalue',  rowlength-1, "batch_no", document.getElementById("batch").value);
				 
			 
				 if(parseInt(document.getElementById("expchk").value)==1)
					 {
					 
					  var  exp_date=document.getElementById("expdate").value;
					 
					 
					   if(exp_date=="" ||exp_date==null || typeof(exp_date)=="undefiend") 
		      	 	   {
							 document.getElementById("errormsg").innerText="Expiry Date Is Required ";
			        		 
				        		return 0;
		      	 	   }
		     		   
					 
			 
					 
					 
					 
					   $('#serviecGrid').jqxGrid('setcellvalue',  rowlength-1, "exp_date", $('#expdate').jqxDateTimeInput('getDate'));
					 }else
						 {
						 $('#serviecGrid').jqxGrid('setcellvalue',  rowlength-1, "exp_date", "1990.01.01");
						 }
				 
				 
				
				 
		    	 
		    	 } */
		    	 var vals= document.getElementById("stockid").value;
		    	 //alert("vals==="+vals);
		    	 if(vals=="undefined"){
		    		// alert("vals===inside");
		    		 document.getElementById("stockid").value="0";
		    	 }
		    	  var rowg=$('#rowindexg').val();
			     //alert("rowg1=========="+rowg);
			      if(document.getElementById("rowindexg").value!="" && !(document.getElementById("rowindexg").value==null) && !(document.getElementById("rowindexg").value=="undefiend")){
			    	  document.getElementById("hidload").value=1; 
			    	  $('#serviecGrid').jqxGrid('setcellvalue',  rowg, "proid", document.getElementById("jqxInput").value);
					     $('#serviecGrid').jqxGrid('setcellvalue', rowg, "proname", document.getElementById("jqxInput1").value);
					     $('#serviecGrid').jqxGrid('setcellvalue',  rowg, "brandname", document.getElementById("brand").value);
					    // $('#serviecGrid').jqxGrid('setcellvalue',  rowlength-1, "foc", document.getElementById("focs").value);
					    
					     $('#serviecGrid').jqxGrid('setcellvalue',  rowg, "unitdocno", document.getElementById("unit").value);
					     if(document.getElementById("unit").value>0)
					     {
					     $('#serviecGrid').jqxGrid('setcellvalue',  rowg, "unit", $("#unit option:selected").text());
					     }
					     $('#serviecGrid').jqxGrid('setcellvalue',  rowg, "psrno", document.getElementById("temppsrno").value);
					     $('#serviecGrid').jqxGrid('setcellvalue', rowg, "prodoc", document.getElementById("temppsrno").value);
					     $('#serviecGrid').jqxGrid('setcellvalue',  rowg, "specid", document.getElementById("tempspecid").value);
					     $('#serviecGrid').jqxGrid('setcellvalue', rowg, "productid" ,document.getElementById("jqxInput").value);
					     $('#serviecGrid').jqxGrid('setcellvalue',  rowg, "productname", document.getElementById("jqxInput1").value);
					     $('#serviecGrid').jqxGrid('setcellvalue',  rowg, "qty", document.getElementById("quantity").value);
					     $('#serviecGrid').jqxGrid('setcellvalue',  rowg, "stockid", document.getElementById("stockid").value);
					     $('#serviecGrid').jqxGrid('setcellvalue',  rowg, "batchid", document.getElementById("hidbatch").value);
					     document.getElementById("rowindexg").value="";
					     document.getElementById("hidload").value=0;
			      }
			      else{
			    	  document.getElementById("hidload").value=1;
			    	  $('#serviecGrid').jqxGrid('setcellvalue',  rowlength-1, "proid", document.getElementById("jqxInput").value);
		     $('#serviecGrid').jqxGrid('setcellvalue',  rowlength-1, "proname", document.getElementById("jqxInput1").value);
		     $('#serviecGrid').jqxGrid('setcellvalue',  rowlength-1, "brandname", document.getElementById("brand").value);
		    // $('#serviecGrid').jqxGrid('setcellvalue',  rowlength-1, "foc", document.getElementById("focs").value);
		    
		     $('#serviecGrid').jqxGrid('setcellvalue',  rowlength-1, "unitdocno", document.getElementById("unit").value);
		     if(document.getElementById("unit").value>0)
		     {
		     $('#serviecGrid').jqxGrid('setcellvalue',  rowlength-1, "unit", $("#unit option:selected").text());
		     }
		     $('#serviecGrid').jqxGrid('setcellvalue',  rowlength-1, "psrno", document.getElementById("temppsrno").value);
		     $('#serviecGrid').jqxGrid('setcellvalue',  rowlength-1, "prodoc", document.getElementById("temppsrno").value);
		     $('#serviecGrid').jqxGrid('setcellvalue',  rowlength-1, "specid", document.getElementById("tempspecid").value);
		     $('#serviecGrid').jqxGrid('setcellvalue', rowlength-1, "productid" ,document.getElementById("jqxInput").value);
		     $('#serviecGrid').jqxGrid('setcellvalue',  rowlength-1, "productname", document.getElementById("jqxInput1").value);
		     $('#serviecGrid').jqxGrid('setcellvalue',  rowlength-1, "qty", document.getElementById("quantity").value);
		     $('#serviecGrid').jqxGrid('setcellvalue',  rowlength-1, "stockid", document.getElementById("stockid").value);
		     $('#serviecGrid').jqxGrid('setcellvalue',  rowlength-1, "batchid", document.getElementById("hidbatch").value);
		     document.getElementById("hidload").value=0;
			      }
		     /*  


		     
		     if(document.getElementById("multi").checked)
			 {
		    	
		    	 
		    	 
		    	 
		    	 $('#serviecGrid').jqxGrid('setcellvalue', rowlength-1, "chkbox",true);
				 $('#serviecGrid').jqxGrid('setcellvalue',  rowlength-1, "batch_no",'');
				  $('#serviecGrid').jqxGrid('setcellvalue',  rowlength-1, "exp_date",'');
				  
				 
				  if(document.getElementById("colbatch").value=="")
					  {
					  document.getElementById("errormsg").innerText="Multi_Batch Details Is Required ";
		        		 
		        		return 0;
					  }
				  
				  
				  $('#serviecGrid').jqxGrid('setcellvalue',  rowlength-1, "colbatch", document.getElementById("colbatch").value);
				     
		    	 
		    	 
		     }
		     else
		    	 {
		    	 
		    	 
		    	 $('#serviecGrid').jqxGrid('setcellvalue', rowlength-1, "chkbox",false);
				 $('#serviecGrid').jqxGrid('setcellvalue',  rowlength-1, "batch_no", document.getElementById("batch").value);
				 
			 
				 if(parseInt(document.getElementById("expchk").value)==1)
					 {
					 
					  var  exp_date=document.getElementById("expdate").value;
					 
					 
					   if(exp_date=="" ||exp_date==null || typeof(exp_date)=="undefiend") 
		      	 	   {
							 document.getElementById("errormsg").innerText="Expiry Date Is Required ";
			        		 
				        		return 0;
		      	 	   }
		     		   
					 
			 
					 
					 
					 
					   $('#serviecGrid').jqxGrid('setcellvalue',  rowlength-1, "exp_date", $('#expdate').jqxDateTimeInput('getDate'));
					 }else
						 {
						 $('#serviecGrid').jqxGrid('setcellvalue',  rowlength-1, "exp_date", "1990.01.01");
						 }
				 
				 
				
				 
		    	 
		    	 }
				  
				  */ 
				   document.getElementById("jqxInput").value ="";
				   document.getElementById("jqxInput1").value="";
				   document.getElementById("brand").value=""; 
		           document.getElementById("collqty").value ="";
				   document.getElementById("quantity").value ="";
				   document.getElementById("stockid").value ="";
				   document.getElementById("unit").value ="";
				  /*  document.getElementById("focs").value="";
			  	   document.getElementById("batch").value="";
				   document.getElementById("colbatch").value=""; */
				    document.getElementById("temppsrno").value="";
				     document.getElementById("tempspecid").value="";
				     
				      
				     /*  
				      
				      document.getElementById("multi").checked=false;
					 	 document.getElementById("batch").value="";
						 document.getElementById("colbatch").value="";
						 
						 
						  $('#batch').attr('readonly', false);
						 $('#expdate').jqxDateTimeInput({ disabled: false});
						 $('#expdate').val(null);
						  */
						  clearprd();						
			 		 $("#serviecGrid").jqxGrid('addrow', null, {});
		    		 document.getElementById("jqxInput1").focus();
		 
		 }
		 function getunit(val){ 
			 
				
			   var x=new XMLHttpRequest();
			   x.onreadystatechange=function(){
			   if (x.readyState==4 && x.status==200)
			    {
			      items= x.responseText;
			       
			      items=items.split('####');
			           var docno=items[0].split(",");
			           var type=items[1].split(",");
			        
			           var optionstype;

			
			           for ( var i = 0; i < type.length; i++) {
			        	   optionstype += '<option value="' + docno[i] + '">' + type[i] + '</option>';
				        }
			            
			            $("select#unit").html(optionstype); 	
			            
			            
			         
			  
			    }
			       }
			   x.open("GET","getunit.jsp?psrno="+val,true);
				x.send();
		}
		 function reloads()
			{  
		    var locid =document.getElementById("txtlocationid").value;      
	        var date =$('#masterdate').val();    
	        var id=1;
	 		 $("#part").load('part.jsp?locid='+locid+"&date="+date+"&id="+id);
	 		 $("#pnames").load('name.jsp?locid='+locid+"&date="+date+"&id="+id);  
			}   
	 
		 function loaddatass()
		 {
			 
				$("#batgrid").jqxGrid('clear'); 
			 
			 
			   $('#prdetails').find('input[type=text]').each(function(){
				     
				      $(this).val("");
				       });
			   
			   
			   
			 
			 var temppsrno=document.getElementById("temppsrno").value; 
			 var unit=document.getElementById("unit").value; 
			 var temptrno=document.getElementById("prevloadtrno").value; 
			 
			 if(unit==null || unit=="")
				 {
				 document.getElementById("errormsg").innerText="Unit Is Required";  
				   document.getElementById("unit").focus();
				     
				      return 0;
				 }
			 
			 
	 
           	  
       		var rows1 = $("#serviecGrid").jqxGrid('getrows');
     	    var aa=0;
     	    for(var i=0;i<rows1.length;i++){
     	 
     	    	
     	    	 
     		   if(parseInt(rows1[i].prodoc)==parseInt(temppsrno))
     			   {
     		  
				 if((parseInt(document.getElementById("multimethod").value)==1))
   				{	
					   
       			   if(parseInt(rows1[i].unitdocno)==parseInt(unit))
       			   {
       				   
       				   aa=1;
           			   break;
       			   }
   				}
				 else
					 {
     			   
     			   aa=1;
     			   break;
					 }
     			   }
     		   else{
     			   
     			   aa=0;
     		       } 
     	    }
			 
     	   if(parseInt(aa)==1)
    		   {
    		   
    		//	document.getElementById("errormsg").innerText="You have already select this product";
    			  
 
				 
		    // document.getElementById("jqxInput1").focus();
    			 
    		 //  return 0;
    		   
    		   
    		   
    		   }
    	   else
    		   {
    		   document.getElementById("errormsg").innerText="";
    		   }
     	  var tempchk="";
     	 if($('#editdata').val()=="Editvalue"){
     	 	//alert("in view");
     	 	tempchk="1";
     	 }
			 
			 
	   		 $("#batchdiv").load('batchdet.jsp?psrno='+temppsrno+'&unit='+unit+'&temptrno='+temptrno+'&tempchk='+tempchk+"&aa=YES");
	   		  setTimeout(function() {
	   		     loaddatass1();
	   		  }, 1000);
		 }
		 function loaddatass1()
		 {
			 
			 document.getElementById("qty1").value="";
			 //document.getElementById("foc1").value="";
			 document.getElementById("stkqty1").value="";
			 document.getElementById("bt1").value="";
			 document.getElementById("ed1").value="";
			 document.getElementById("stkid1").value="";
			 
			 document.getElementById("qty2").value="";
			 //document.getElementById("foc2").value="";
			 document.getElementById("stkqty2").value="";
			 document.getElementById("bt2").value="";
			 document.getElementById("ed2").value="";
			 document.getElementById("stkid2").value="";
			 
			 
			 document.getElementById("qty3").value="";
			// document.getElementById("foc3").value="";
			 document.getElementById("stkqty3").value="";
			 document.getElementById("bt3").value="";
			 document.getElementById("ed3").value="";
			 document.getElementById("stkid3").value="";
			 
			 
			 document.getElementById("qty4").value="";
			// document.getElementById("foc4").value="";
			 document.getElementById("stkqty4").value="";
			 document.getElementById("bt4").value="";
			 document.getElementById("ed4").value="";
			 document.getElementById("stkid4").value="";
			 
			 
			 
			 document.getElementById("qty5").value="";
			// document.getElementById("foc5").value="";
			 document.getElementById("stkqty5").value="";
			 document.getElementById("bt5").value="";
			 document.getElementById("ed5").value="";
			 document.getElementById("stkid5").value="";
			 
			 
			 
			 document.getElementById("qty6").value="";
			// document.getElementById("foc6").value="";
			 document.getElementById("stkqty6").value="";
			 document.getElementById("bt6").value="";
			 document.getElementById("ed6").value="";
			 document.getElementById("stkid6").value="";
			 
			 
			 
			 document.getElementById("qty7").value="";
			// document.getElementById("foc7").value="";
			 document.getElementById("stkqty7").value="";
			 document.getElementById("bt7").value="";
			 document.getElementById("ed7").value="";
			 document.getElementById("stkid7").value="";
			 
			 
			 
			 document.getElementById("qty8").value="";
			 //document.getElementById("foc8").value="";
			 document.getElementById("stkqty8").value="";
			 document.getElementById("bt8").value="";
			 document.getElementById("ed8").value="";
			 document.getElementById("stkid8").value="";
			 
			 
			 
			 
			 document.getElementById("qty9").value="";
			// document.getElementById("foc9").value="";
			 document.getElementById("stkqty9").value="";
			 document.getElementById("bt9").value="";
			 document.getElementById("ed9").value="";
			 document.getElementById("stkid9").value="";
			 
			 
			 
			 document.getElementById("qty10").value="";
			// document.getElementById("foc10").value="";
			 document.getElementById("stkqty10").value="";
			 document.getElementById("bt10").value="";
			 document.getElementById("ed10").value="";
			 document.getElementById("stkid10").value="";
			
			 document.getElementById("collqty").value="";
			 
			 
	   		$('#bt1').attr('readonly', true);
	   		$('#bt2').attr('readonly', true);
	   		$('#bt3').attr('readonly', true);
	   		$('#bt4').attr('readonly', true);
	   		$('#bt5').attr('readonly', true);
	   		$('#bt6').attr('readonly', true);
	   		$('#bt7').attr('readonly', true);
	   		$('#bt8').attr('readonly', true);
	   		$('#bt9').attr('readonly', true);
	   		$('#bt10').attr('readonly', true);
	   		$('#ed1').attr('readonly', true);
	   		$('#ed2').attr('readonly', true);
	   		$('#ed3').attr('readonly', true);
	   		$('#ed4').attr('readonly', true);
	   		$('#ed5').attr('readonly', true);
	   		$('#ed6').attr('readonly', true);
	   		$('#ed7').attr('readonly', true);
	   		$('#ed8').attr('readonly', true);
	   		$('#ed9').attr('readonly', true);
	   		$('#ed10').attr('readonly', true);
	  		$('#stkqty1').attr('readonly', true);
	   		$('#stkqty2').attr('readonly', true);
	   		$('#stkqty3').attr('readonly', true);
	   		$('#stkqty4').attr('readonly', true);
	   		$('#stkqty5').attr('readonly', true);
	   		$('#stkqty6').attr('readonly', true);
	   		$('#stkqty7').attr('readonly', true);
	   		$('#stkqty8').attr('readonly', true);
	   		$('#stkqty9').attr('readonly', true);
	   		$('#stkqty10').attr('readonly', true);
			   	 $('.trhideclass1').hide();
				 $('.trhideclass2').hide();
				 $('.trhideclass3').hide();
				 $('.trhideclass4').hide();
				 $('.trhideclass5').hide();
				 $('.trhideclass6').hide();
				 $('.trhideclass7').hide();
				 $('.trhideclass8').hide();
				 $('.trhideclass9').hide();
				 $('.trhideclass10').hide();
			   		
	   	  var rows = $('#batgrid').jqxGrid('getrows');
          var kk=0;
           for(var i=0 ; i < rows.length ; i++){
        	   kk=kk+1;
        	   var id1=".trhideclass"+kk;
        	   var id3="bt"+kk;
        	   var id4="ed"+kk;
        	   var id5="stkqty"+kk;
        	   var id6="stkid"+kk;
        	   var id7="qty"+kk;
        	   $(""+id1).show();	
			   document.getElementById(""+id3).value= $('#batgrid').jqxGrid('getcellvalue', i, "batch_no");
        	   document.getElementById(""+id4).value= $('#batgrid').jqxGrid('getcelltext', i, "exp_date");
        	   document.getElementById(""+id5).value= $('#batgrid').jqxGrid('getcellvalue', i, "stkqty");
        	   document.getElementById(""+id6).value= $('#batgrid').jqxGrid('getcellvalue', i, "stockid");
        	   if($('#editdata').val()=="Editvalue"){
        		   document.getElementById(""+id7).value= $('#batgrid').jqxGrid('getcellvalue', i, "setqty");
        	   }
        	  
               }
           		$('#divname').show();
           
          		 document.getElementById("qty1").focus();
				 }
		 
		 function clearprd()
			{
				
				$("#batgrid").jqxGrid('clear'); 
				 document.getElementById("qty1").value="";
				// document.getElementById("foc1").value="";
				 document.getElementById("stkqty1").value="";
				 document.getElementById("bt1").value="";
				 document.getElementById("ed1").value="";
				 document.getElementById("stkid1").value="";
				 
				 document.getElementById("qty2").value="";
				// document.getElementById("foc2").value="";
				 document.getElementById("stkqty2").value="";
				 document.getElementById("bt2").value="";
				 document.getElementById("ed2").value="";
				 document.getElementById("stkid2").value="";
				 
				 
				 document.getElementById("qty3").value="";
				// document.getElementById("foc3").value="";
				 document.getElementById("stkqty3").value="";
				 document.getElementById("bt3").value="";
				 document.getElementById("ed3").value="";
				 document.getElementById("stkid3").value="";
				 
				 
				 document.getElementById("qty4").value="";
				// document.getElementById("foc4").value="";
				 document.getElementById("stkqty4").value="";
				 document.getElementById("bt4").value="";
				 document.getElementById("ed4").value="";
				 document.getElementById("stkid4").value="";
				 
				 
				 
				 document.getElementById("qty5").value="";
				// document.getElementById("foc5").value="";
				 document.getElementById("stkqty5").value="";
				 document.getElementById("bt5").value="";
				 document.getElementById("ed5").value="";
				 document.getElementById("stkid5").value="";
				 
				 
				 
				 document.getElementById("qty6").value="";
				// document.getElementById("foc6").value="";
				 document.getElementById("stkqty6").value="";
				 document.getElementById("bt6").value="";
				 document.getElementById("ed6").value="";
				 document.getElementById("stkid6").value="";
				 
				 
				 
				 document.getElementById("qty7").value="";
				// document.getElementById("foc7").value="";
				 document.getElementById("stkqty7").value="";
				 document.getElementById("bt7").value="";
				 document.getElementById("ed7").value="";
				 document.getElementById("stkid7").value="";
				 
				 
				 
				 document.getElementById("qty8").value="";
				// document.getElementById("foc8").value="";
				 document.getElementById("stkqty8").value="";
				 document.getElementById("bt8").value="";
				 document.getElementById("ed8").value="";
				 document.getElementById("stkid8").value="";
				 
				 
				 
				 
				 document.getElementById("qty9").value="";
				// document.getElementById("foc9").value="";
				 document.getElementById("stkqty9").value="";
				 document.getElementById("bt9").value="";
				 document.getElementById("ed9").value="";
				 document.getElementById("stkid9").value="";
				 
				 
				 
				 document.getElementById("qty10").value="";
				// document.getElementById("foc10").value="";
				 document.getElementById("stkqty10").value="";
				 document.getElementById("bt10").value="";
				 document.getElementById("ed10").value="";
				 document.getElementById("stkid10").value="";
				
				 document.getElementById("collqty").value="";
				 
				
			}
		 
		 function chkstocksval(value,tf)
			{
				if(parseFloat(value)>0)
					{
					  var id5="qty"+tf;
		       	 //  var id6="foc"+tf;
		       	 
		       	   var id7="stkqty"+tf;
					var qty=0;
					var foc=0;
		       	if(parseFloat(document.getElementById(""+id5).value)>0)
				   {
		       		qty=document.getElementById(""+id5).value;
				   }
		       	
		     /* 	if(parseFloat(document.getElementById(""+id6).value)>0)
				   {
		     		foc=document.getElementById(""+id6).value;
				   } */
					
		     	
		     	if(parseFloat(document.getElementById(""+id7).value)<(parseFloat(qty)))
		     		{
		     		 document.getElementById("errormsg").innerText="Quantity Plus Foc  should not be greater than available stock quantity";
		     		document.getElementById(""+id5).value=0;
		     		//document.getElementById(""+id6).value=0;
		     		document.getElementById(""+id5).focus();
		     		return 0;
		     		}
		     	else
		     		{
		     		document.getElementById("errormsg").innerText="";
		     		}
		       	
		       	
		       	
					
					}
				
				
			}
		 
		 function closes()
			{
				 
				   $('#prdetails').find('input[type=text]').each(function(){
					     
					      $(this).val("");
					       });
				   
				   
				 $('#divname').hide();
				
			}
		
		 
		 function  chkfocss()
		 
		 {
           
         var ss=0;
         var totqty=0;
         var totfoc=0;
         var stkqty=0;
         var stkid="";
         
         
         var temp="";
         var rows = $('#batgrid').jqxGrid('getrows');
	   	  
           for(var i=0 ; i < rows.length ; i++){
        	   
        	   
        	     	   ss=ss+1;
               var aa=0; 
               var bb=0;
        	   
        	   var id5="qty"+ss;
        	  // var id6="foc"+ss;
        	   var id7="bt"+ss;
        	   var id8="ed"+ss;
        	   var id9="stkid"+ss;
        	   
        	   if(parseFloat(document.getElementById(""+id5).value)>0)
        		   {
        		   totqty=parseFloat(totqty)+parseFloat(document.getElementById(""+id5).value);
        		   
        		   
        		   aa=document.getElementById(""+id5).value;
        		   }
        	   
        	  /*  if(parseFloat(document.getElementById(""+id6).value)>0)
    		   {
        		   totfoc=parseFloat(totfoc)+parseFloat(document.getElementById(""+id6).value);
        		   bb=parseFloat(document.getElementById(""+id6).value);
    		   } */
        	   
        	   
        	   if(parseFloat(document.getElementById(""+id5).value)>0 )
        		   {
        		   temp=temp+document.getElementById(""+id7).value+" @@ "+aa+" @@ "+bb+" @@ "+document.getElementById(""+id8).value+" @@@ ";
        		   }
    		   if(!document.getElementById(""+id7).value=="")
    		   {
    			   stkid=stkid+document.getElementById(""+id7).value+" @@ "+document.getElementById(""+id5).value+" @@@ ";
    			   
    		   }
        	   
        	  
              }
           
          
        //   alert("batchnnnnnnnnno======"+stkid);
           
           if(document.getElementById("focvalidate").value==1)
			{
			checkfocqty(totfoc,totqty,temp,stkid);
			}
		else
			{
			 document.getElementById("collqty").value=temp;
	           document.getElementById("quantity").value=totqty;
	           document.getElementById("stockid").value=stkid;
	           //document.getElementById("focs").value=totfoc;
	           $('#divname').hide();
	           calculatedata();
	           
			}
           
			 
		 }
		 
		 function checkfocqty(temp3,temp2,collqty)
			{
				
		   
				 var psrno=document.getElementById("temppsrno").value; 
				 var unit=document.getElementById("unit").value;
		    		
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
				    		  document.getElementById("collqty").value=collqty;
					           document.getElementById("quantity").value=temp2;
					           document.getElementById("stockid").value=stkid;
					          // document.getElementById("focs").value=temp3;
					           $('#divname').hide();
					           calculatedata();
				    		  }
				    	  }
				     
				       } 
				   x.open("GET","checkfocqty.jsp?qty="+temp2+"&psrno="+psrno+"&unit="+unit,true);
					x.send();
				 
				
				
			}
			
			
			function checkfocqtyss(temp2,psrno,unit,rs)
			{
				   var x=new XMLHttpRequest();
				   x.onreadystatechange=function(){
				   if (x.readyState==4 && x.status==200)
				    {
				      var items= x.responseText.trim();
				    
				      $('#serviecGrid').jqxGrid('setcellvalue',rs,"foc",items);
				        		  
				    	      
				    	  }
				     
				       } 
				   x.open("GET","checkfocqty.jsp?qty="+temp2+"&psrno="+psrno+"&unit="+unit,true);
					x.send();
				 
				
				
			}
			
			
			
			
			
			function checkfocqtys(temp2)
			{
				
		   
				 var psrno=document.getElementById("temppsrno").value; 
				 var unit=document.getElementById("unit").value;
		    		
				   var x=new XMLHttpRequest();
				   x.onreadystatechange=function(){
				   if (x.readyState==4 && x.status==200)
				    {
				      var items= x.responseText.trim();
				    	 if(parseFloat(items)>0)
				    		 {
				    		 document.getElementById("focs").value=parseInt(items);
				    		 document.getElementById("focs").focus();
				    		  var input = document.getElementById("focs");
				    		  input.focus();
				              input.setSelectionRange(0,0);
				    		 }
				    	 else
				    		 {
				    		 document.getElementById("focs").value="";
				    		 document.getElementById("focs").focus();
				    		 var input = document.getElementById("focs");
				    		  input.focus();
				              input.setSelectionRange(0,0);
				    		 }
				    		 
				        		  
				    	      
				    	  }
				     
				       } 
				   x.open("GET","checkfocqty.jsp?qty="+temp2+"&psrno="+psrno+"&unit="+unit,true);
					x.send();
				 
				
				
			}
</script>  
</head>
<body onLoad="setValues();gettype();getitemtype();" >


<div id="mainBG" class="homeContent" data-type="background">
<form id="frmMin" action="saveActionMin" method="post" autocomplete="off">  
<jsp:include page="../../../../header.jsp" />  
<jsp:include page="multiqty.jsp"></jsp:include><br/> 
	<fieldset>
<table width="100%"    > 
  <tr>
    <td width="6%" align="right">Date</td>
    <td width="11%"><div id="masterdate" name="masterdate" value='<s:property value="masterdate"/>'></div>
      <input type="hidden" name="hidmasterdate" id="hidmasterdate" value='<s:property value="hidmasterdate"/>'>
      
                     
      </td>
       <td width="7%" align="right">Type</td>
    <td width="13%"><select  id="type" name="type" style="width:90%;" > 
    <option>
     </option>
    
    </select></td>
            <td align="right" width="6%">Location</td> 
    <td colspan="3"  ><input type="text" id="txtlocation" name="txtlocation" style="width:90%;" placeholder="Press F3 to Search" value='<s:property value="txtlocation"/>'  onkeydown="getloc(event);"/>
      <input type="hidden" id="txtlocationid" name="txtlocationid" value='<s:property value="txtlocationid"/>'/></td>
    <td width="4%" align="right">Ref No</td>
    <td width="15%"><input type="text" name="refno" id="refno" style="width:90%;" value='<s:property value="refno"/>'></td>
 
   
    <td width="9%" align="right">Doc No</td>
    <td width="12%"><input type="text" name="docno" id="docno" tabindex="-1" value='<s:property value="docno"/>' readonly></td>
  </tr>

    <%--  <tr>
   
        <td width="6%" align="right">&nbsp;</td>
        <td colspan="9"><select  id="itemtype" name="itemtype" style="width:15%;" onchange="cleardata()"> 
    <option>
     </option>   
                             
    </select>  
    <input type="text" id="itemdocno" placeholder="Press F3 to Search"  name="itemdocno"  value='<s:property value="itemdocno"/>' >
    
    <input type="text" id="itemname" name="itemname" style="width:43%;"   value='<s:property value="itemname"/>' onkeydown="getitem(event);">
    </td>
    <td>&nbsp;</td><td>&nbsp;</td> 
    </tr> --%>
    <tr>
         <td width="6%" align="right">Batch No</td>    
    <td colspan="10"  ><input type="text" id="batchno" name="batchno"  style="width:42%;" value='<s:property value="batchno"/>'  />
     
      </td>
 
  
  </tr>
   
  <tr>
    <td   align="right">Description</td>
    <td colspan="11"><input type="text" name="purdesc" id="purdesc" value='<s:property value="purdesc"/>' style="width:55.7%;"> &nbsp;&nbsp;&nbsp;
   <button class="myButton" type="button" id="btnvaluechange" name="btnvaluechange" onclick="funwarningopen();">Value Change</button></td>
  </tr>
</table>
  <input type="text" name="gridtext" id="gridtext"  style="width:0%;height:0%;"  class="textbox"  value='<s:property value="gridtext"/>'  />   
  
    <input type="text" name="gridtext1" id="gridtext1"  style="width:0%;height:0%;"  class="textbox" value='<s:property value="gridtext1"/>' />  
 
 </fieldset>
 <br>
  <fieldset id="psearch">
 
 <legend>Item Details</legend>
 
   <table width="100% "  >   
   <tr> 
   <td align="center">Product ID</td>
   <td align="center" colspan="2">Product Name</td>
   <td align="center" style="width:15%;"  >Brand</td>
   <td align="center">Unit</td>
    <td align="center">&nbsp;</td> 
   <td  width="6%" align="center">Qty</td>
  <!--  <td align="center" class="ff">FOC</td>
  <td align="center" class="ff1">Multi_Batch</td> 
   <td align="center" class="ff2">Batch</td>
      <td align="center" class="ff3">ExpDate</td>  --> 
    <td align="center">&nbsp;</td>  
   </tr>
 
   
    <tr><td align="center"><div id="part"><jsp:include page="part.jsp"></jsp:include></div> </td>
 <td colspan="2" align="center"> <div id="pnames"><jsp:include page="name.jsp"></jsp:include></div> </td> 
 <td align="center" >   <input type="text" id="brand"   > <input type="hidden" id="collqty"   ></td>
<td align="center"> <select    id="unit"   >   </select>      </td> 
 
<td align="center"> <input type="button" id="loads" class="myButtons" value="Load Data" onclick="loaddatass()">     </td>  
<td width="6%" align="center">  <input type="text" id="quantity"   onblur="funRoundAmt(this.value,this.id);" onkeypress="javascript:return isNumber1 (event);" style="text-align: left;" onchange="calculatedata(this.id);"  ></td>
<td align="center" class="ff"><input type="hidden" id="focs"  onblur="funRoundAmt(this.value,this.id);"  style="width:82%;" onkeypress="javascript:return isNumber1 (event);"     ><input type="hidden" id="stockid"  onblur="funRoundAmt(this.value,this.id);"  style="width:82%;" onkeypress="javascript:return isNumber1 (event);"     ></td>
 
 
   <td align="center" class="ff1"> 
   <input type="hidden" id="multi" style="text-align: right;" onchange="chkmultis()" > </td>
 
   <td align="center" class="ff2"> 
   <input type="hidden" id="batch"    onkeydown="getbatch(event)" > </td>
<td  class="ff3"><div id="expdate" hidden:"true" name="expdate" value='<s:property value="expdate"/>'></div> </td> 
 
  <td align="center"  class="ff3">
     <input type="hidden" id="cleardata">
 &nbsp; <input type="button" id="setbtn"  class="btn" onclick="setgrid()" value="ADD" ></td>

 </tr>
 
   
   </table> 
   </fieldset> 
   
   <div id="divname" hidden="true">
   <table width="100%" id="prdetails"> 
   
   <tr style="height: 25px" bgcolor="#e5ab69">  
   <td align="center"> <font color="#fff"><b>Quantity</b></font></td> <td  align="center"><font color="#fff"><b>Stock Qty</b></font></td>  <td  align="center"><font color="#fff"><b>Batch No</b></font></td><td  align="center"><font color="#fff"><b>Expiry Date</b></font></td><td  align="center" hidden="true"></td> </tr>
     <tr  class="trhideclass1">
   <td > <input type="text" id="qty1" onchange="chkstocksval(this.value,1)" ></td>     <td><input type="text"  tabindex="-1"id="stkqty1"></td> <td><input type="text" tabindex="-1"  id="bt1"></td><td><input type="text" tabindex="-1"  id="ed1"></td><td><input type="hidden" id="stkid1"></td> </tr>
       <tr class="trhideclass2">
   <td>  <input type="text" id="qty2" onchange="chkstocksval(this.value,2)"></td>    <td><input type="text"  tabindex="-1"id="stkqty2"></td>   <td><input type="text" tabindex="-1"  id="bt2"></td><td><input type="text" tabindex="-1"  id="ed2"></td>  <td><input type="hidden" id="stkid2"></td> </tr>
         <tr class="trhideclass3">
   <td>  <input type="text" id="qty3" onchange="chkstocksval(this.value,3)"></td>    <td><input type="text" tabindex="-1"id="stkqty3"></td>    <td><input type="text" tabindex="-1"  id="bt3"></td><td><input type="text" tabindex="-1"  id="ed3"></td>  <td><input type="hidden" id="stkid3"></td> </tr>
      <tr class="trhideclass4">
   <td>  <input type="text" id="qty4" onchange="chkstocksval(this.value,4)"></td>    <td><input type="text" tabindex="-1"  id="stkqty4"></td>   <td><input type="text" tabindex="-1"  id="bt4"></td><td><input type="text" tabindex="-1"  id="ed4"></td>  <td><input type="hidden" id="stkid4"></td> </tr>
     <tr class="trhideclass5">
   <td>  <input type="text" id="qty5" onchange="chkstocksval(this.value,5)"></td>   <td><input type="text" tabindex="-1" id="stkqty5"></td>   <td><input type="text" tabindex="-1"  id="bt5"></td><td><input type="text" tabindex="-1"   id="ed5"></td>   <td><input type="hidden" id="stkid5"></td> </tr>
       <tr class="trhideclass6">
   <td>  <input type="text" id="qty6" onchange="chkstocksval(this.value,6)"></td>     <td><input type="text" tabindex="-1" id="stkqty6"></td>  <td><input type="text" tabindex="-1"  id="bt6"></td><td><input type="text" tabindex="-1"  id="ed6"></td>  <td><input type="hidden" id="stkid6"></td> </tr>
      <tr class="trhideclass7">
   <td>  <input type="text" id="qty7" onchange="chkstocksval(this.value,7)"></td>     <td><input type="text" tabindex="-1" id="stkqty7"></td>  <td><input type="text" tabindex="-1"  id="bt7"></td><td><input type="text" tabindex="-1"  id="ed7"></td><td><input type="hidden" id="stkid7"></td> </tr>
      <tr class="trhideclass8">
   <td>  <input type="text" id="qty8" onchange="chkstocksval(this.value,8)"></td>     <td><input type="text" tabindex="-1" id="stkqty8"></td>   <td><input type="text" tabindex="-1"  id="bt8"></td><td><input type="text" tabindex="-1"  id="ed8"></td><td><input type="hidden" id="stkid8"></td> </tr>   <tr>
  <tr class="trhideclass9">
   <td>  <input type="text" id="qty9" onchange="chkstocksval(this.value,9)"></td>     <td><input type="text" tabindex="-1" id="stkqty9"></td> <td><input type="text"  tabindex="-1"  id="bt9"></td><td><input type="text" tabindex="-1"  id="ed9"></td>  <td><input type="hidden" id="stkid9"></td> </tr>
      <tr class="trhideclass10">
   <td>  <input type="text" id="qty10" onchange="chkstocksval(this.value,10)"></td>    <td><input type="text" tabindex="-1" id="stkqty10"></td>   <td><input type="text" tabindex="-1"  id="bt10"></td><td><input type="text" tabindex="-1"  id="ed10"> </td><td><input type="hidden" id="stkid10"></td> </tr>
  
       <tr>  <td colspan="7" > &nbsp; </td></tr>
  
  
   <tr> <td colspan="7" align="center"> 
   
    
      <input type="button" name="searchs1" id="searchs1" class="myButtons" value="Submit"  onclick="chkfocss()">
      
      
      
       <input type="button" name="searchss1" id="searchss1" class="myButton" value="Close" onclick="closes()"  >
   
   </td>
          <tr>  <td > &nbsp; </td> <td > &nbsp; </td> <td > &nbsp; </td> <td > &nbsp; </td> <td > &nbsp; </td> <td > &nbsp; </td> <td > &nbsp; </td></tr>
   
   </table>
   
   
   </div>
   
   
<div id="batchdiv"  hidden="true"  ><jsp:include page="batchdet.jsp"></jsp:include></div> 
   
 
 
    <div id="sevdesc" ><jsp:include page="serviecgrid.jsp"></jsp:include></div>
     



 
<table width="100%">
<tr>
<td align="right">&nbsp;</td><td><input type="hidden" name="productTotal" readonly="readonly" id="productTotal" value='<s:property value="productTotal"/>'    style="width:50%;text-align: right;"></td>

 <td><input type="hidden" name="prddiscount" id="prddiscount" value='<s:property value="prddiscount"/>'   onkeypress="javascript:return isNumber (event);"  style="width:51%;text-align: right;"></td>
<%-- <td align="right">Discount</td><td><input type="checkbox"  value="0" id="chkdiscount" name="chkdiscount" onchange="fundisable()"    onclick="$(this).attr('value', this.checked ? 1 : 0)" ></td>
<td align="right">Discount %</td><td><input type="text" name="descPercentage" id="descPercentage" value='<s:property value="descPercentage"/>'   onblur="funRoundAmt(this.value,this.id);" onkeypress="javascript:return isNumber (event);"  style="width:50%;text-align: right;"></td>
    <td align="center"><button type="button" class="icon" id="btnCalculate" title="Calculate" onclick="funcalcu();">
       <img alt="Calculate" src="<%=contextPath%>/icons/calculate_new.png">
      </button> 
      </td> --%>
  <%-- <td align="right">Discount Value</td><td><input type="text" name="descountVal" id="descountVal" value='<s:property value="descountVal"/>' onblur="funvalcalcu();" onkeypress="javascript:return isNumber (event);"  style="width:51%;text-align: right;"></td> --%>  
<%-- <td align="right">Round of</td><td><input type="text" name="roundOf" id="roundOf" value='<s:property value="roundOf"/>' onblur="roundval();funRoundAmt(this.value,this.id);" onkeypress="javascript:return isNumber (event);"  style="width:51%;text-align: right;"></td> --%>
<td align="right">&nbsp;</td><td><input type="hidden" name="netTotaldown" readonly="readonly" id="netTotaldown" value='<s:property value="netTotaldown"/>'  onblur="funRoundAmt(this.value,this.id);" onkeypress="javascript:return isNumber (event);"  style="width:50%;text-align: right;"></td>
 
<%-- <td align="right">&nbsp;<td><td width="10%" align="right"><label >Order Value :</label></td><td><input type="text" class="textbox" id="orderValue" readonly="readonly" tabindex="-1" name="orderValue" style="width:73%;" value='<s:property value="orderValue"/>'/></td> --%>
 
 
</tr>


</table>
 





<%--  <fieldset>
   <legend>Summary</legend>  
<table width="100%">
<tr>
<td align="right">Product</td><td><input type="text" name="productTotal" readonly="readonly" id="productTotal" value='<s:property value="productTotal"/>'    style="width:50%;text-align: right;"></td>
<td align="right">Discount</td><td><input type="checkbox"  value="0" id="chkdiscount" name="chkdiscount" onchange="fundisable()"    onclick="$(this).attr('value', this.checked ? 1 : 0)" ></td>
<td align="right">Discount %</td><td><input type="text" name="descPercentage" id="descPercentage" value='<s:property value="descPercentage"/>'   onblur="funRoundAmt(this.value,this.id);" onkeypress="javascript:return isNumber (event);"  style="width:50%;text-align: right;"></td>
    <td align="center"><button type="button" class="icon" id="btnCalculate" title="Calculate" onclick="funcalcu();">
       <img alt="Calculate" src="<%=contextPath%>/icons/calculate_new.png">
      </button> 
      </td>
<td align="right">Discount Value</td><td><input type="text" name="descountVal" id="descountVal" value='<s:property value="descountVal"/>' onblur="funvalcalcu();" onkeypress="javascript:return isNumber (event);"  style="width:51%;text-align: right;"></td>
<td align="right">Round of</td><td><input type="text" name="roundOf" id="roundOf" value='<s:property value="roundOf"/>' onblur="roundval();funRoundAmt(this.value,this.id);" onkeypress="javascript:return isNumber (event);"  style="width:51%;text-align: right;"></td>
<td align="right">Net Total</td><td><input type="text" name="netTotaldown" readonly="readonly" id="netTotaldown" value='<s:property value="netTotaldown"/>'  onblur="funRoundAmt(this.value,this.id);" onkeypress="javascript:return isNumber (event);"  style="width:50%;text-align: right;"></td>
 
</tr>


</table>
</fieldset> --%>


 <input type="hidden" id="costtr_no" name="costtr_no"  value='<s:property value="costtr_no"/>'/> 

 <input type="hidden" id="hideitemtype" name="hideitemtype"  value='<s:property value="hideitemtype"/>'/> 
	 <input type="hidden" id="hidetype" name="hidetype"  value='<s:property value="hidetype"/>'/>
	 <input type="hidden" id="masterdoc_no" name="masterdoc_no"  value='<s:property value="masterdoc_no"/>'/>

 
<input type="hidden" id="refmasterdoc_no" name="refmasterdoc_no"  value='<s:property value="refmasterdoc_no"/>'/>
     <input type="hidden" id="msg" name="msg"  value='<s:property value="msg"/>'/>
     <input type="hidden" id="mode" name="mode"  value='<s:property value="mode"/>'/>   
    

     <input type="hidden" id="rowval" name="rowval"  value='<s:property value="rowval"/>'/>   <!-- for refno  slno set grid -->
               <input type="hidden" id="accdocno" name="accdocno"  value='<s:property value="accdocno"/>'/>  
              <input type="hidden" id="descgridlenght" name="descgridlenght"  value='<s:property value="descgridlenght"/>'/>    
         <input type="hidden" id="cmbcurrval" name="cmbcurrval"  value='<s:property value="cmbcurrval"/>'/>    
          <input type="hidden" id="acctypeval" name="acctypeval"  value='<s:property value="acctypeval"/>'/>  
           <input type="hidden" id="reftypeval" name="reftypeval"  value='<s:property value="reftypeval"/>'/>  
           
           <input type="hidden" id="mineditval" name="mineditval"  value='<s:property value="mineditval"/>'/>
           <input type="hidden" id="deleted" name="deleted"  value='<s:property value="deleted"/>'/>
           
            <input type="hidden" id="acctypegrid" name="acctypegrid"  value='<s:property value="acctypegrid"/>'/>
           
            <input type="hidden" id="serviecGridlength" name="serviecGridlength"  value='<s:property value="serviecGridlength"/>'/>  
          
                <input type="hidden" id="hidelocation" name="hidelocation"  value='<s:property value="hidelocation"/>'/>
                  <input type="hidden" id="editdata" name="editdata"  value='<s:property value="editdata"/>'/>
                <input type="hidden" id="productchk" name="productchk"  value='<s:property value="productchk"/>'/>
            <input type="hidden" id="temppsrno" >  
        <input type="hidden" id="tempspecid" > 
        <input type="hidden" id="tempunitdocno" > 
            <input type="hidden" id="focvalidate" > 
              <input type="hidden" id="rowindexg" > 
              <input type="hidden" id="hidload" > 
               <input type="hidden" id="prevloadtrno" > 
               <input type="hidden" id="hidbatch" > 
          
</form>
 <div id="searchwindow">
   <div ></div>
</div>
  <div id="accountSearchwindow">
	   <div ></div>
	</div>
	  <div id="sidesearchwndow">
	   <div ></div>
	</div>
		  <div id="importwindow">
	   <div ></div>
	</div>
		  <div id="searchwndow">
	   <div ></div>
	</div>
		  <div id="locationwindow">
	   <div ></div>
	</div>
	
</div>
</body>
</html>