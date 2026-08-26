<!--<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

</body>
</html>-->

 
 
 <%@page import="com.dashboard.procurment.productgrading.ClsProductgradingDAO"%>
 <% ClsProductgradingDAO searchDAO = new ClsProductgradingDAO(); 
 
    String barchval = request.getParameter("barchval")==null?"NA":request.getParameter("barchval").trim();
	String fromdate = request.getParameter("fromdate")==null?"0":request.getParameter("fromdate").trim();
  	String todate = request.getParameter("todate")==null?"0":request.getParameter("todate").trim();
  	
 
  	String lodid = request.getParameter("lodid")==null?"0":request.getParameter("lodid").trim();
  	
  	String type = request.getParameter("type")==null?"0":request.getParameter("type").trim();
  	
 	String brandid = request.getParameter("brandid")==null?"0":request.getParameter("brandid").trim();
 	String catid = request.getParameter("catid")==null?"0":request.getParameter("catid").trim();
 	String subcatid = request.getParameter("subcatid")==null?"0":request.getParameter("subcatid").trim();
 	String psrno = request.getParameter("psrno")==null?"0":request.getParameter("psrno").trim();
  	

	String hidbrandid = request.getParameter("hidbrandid")==null?"0":request.getParameter("hidbrandid").trim();
	String hidtypeid = request.getParameter("hidtypeid")==null?"0":request.getParameter("hidtypeid").trim();
	String hideptid = request.getParameter("hideptid")==null?"0":request.getParameter("hideptid").trim();
	String hidcatid = request.getParameter("hidcatid")==null?"0":request.getParameter("hidcatid").trim();
	String hidsubcatid = request.getParameter("hidsubcatid")==null?"0":request.getParameter("hidsubcatid").trim();
 	    
	String hidproductid = request.getParameter("hidproductid")==null?"0":request.getParameter("hidproductid").trim();
	
	String choosetype = request.getParameter("choosetype")==null?"0":request.getParameter("choosetype").trim();
	
	
	
	
	
  	    
 %> 
  <!--  <style type="text/css">
    .redClass
    {
 /*    background-color: #ffe4e1;   */
         background-color: #f0ffff;  
        
        	
    }
    
    .yellowClass
    {
        background-color: #FFFFD1;
    }
    
    .greyClass
    {
        background-color: #f8e0f7;
    }
    
    
    
    
    
              
</style>-->


<style type="text/css">
    .redClass
    {
 /*    background-color: #ffe4e1;   */
         background-color: #f0ffff;  
        
        	
    }
    
    .yellowClass
    {
        background-color: #FFFFD1;
    }
    
    .greyClass
    {
        background-color: #f0ffff;
    }
    
    .saveClass
    {
        background-color: #f8e0f7;
    }
    
    
    
    
              
</style>     
 


       
<script type="text/javascript">
 var temp4='<%=barchval%>';
var datas1;
var dat1;

 if(temp4!='NA')
{ 
	 
	 datas1='<%=searchDAO.productgradinggridsearch(barchval,fromdate,todate,type,brandid,catid,subcatid,psrno,lodid,hidbrandid,hidtypeid,hideptid,hidcatid,hidsubcatid,hidproductid,choosetype)%>';  
	 dat1='<%=searchDAO.productgradinggridsearchex(barchval,fromdate,todate,type,brandid,catid,subcatid,psrno,lodid,hidbrandid,hidtypeid,hideptid,hidcatid,hidsubcatid,hidproductid,choosetype)%>';  
	 
} 
else
{ 
	
	datas1;
	
	}  

$(document).ready(function () {
	  var rendererstring1=function (aggregates){
         	var value=aggregates['sum1'];
         	return '<div style="float: right; margin: 4px;font-size:12px; overflow: hidden;">' + " Total" + '</div>';
         }    
      
   var rendererstring=function (aggregates){
   	var value=aggregates['sum'];
   	return '<div style="float: right; margin: 4px;font-size:12px; overflow: hidden;"> ' + value + '</div>';
   }
  /* var cellclassname = function (row, column, value, data) {
		if (data.cellselects==1) {
			 
        return "redClass";
    }
		else{
			 
		}
		 
		
		}; */
		var cellclassname = function (row, column, value, data) {
	  		
			  
			  if (data.averagesalespermonth>=0) {
		 			 
		            return "redClass";
		        }
			  
			  if (data.averagepurchasepermonth>=0) {
				 
	           return "greyClass";
	       }
	 		//if (data.cellselects1==1) {
				 
	          // return "redClass";
	       //}
	 		
	 		 
	 		
	 		};

    var source =
    {
        datatype: "json",
        datafields: [   


                        {name : 'product', type: 'String'  },
                        {name : 'description', type: 'String'  },
                        {name : 'psrno', type: 'String'  },
						{name : 'productname', type: 'String'  },
						{name : 'purchasequantity', type: 'number'  },
						{name : 'salequantity', type: 'number'  },
						{name : 'stockquantity', type: 'number'  },
						{name : 'averagesalespermonth', type: 'number'  },
						{name : 'averagepurchasepermonth', type: 'number'  },
						{name : 'turndays', type: 'number'  },
						
						{name : 'stockprice', type: 'number'  },
						
							 
							 
						
						],
				    localdata: datas1,
        
        
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
    
    
   
   
    
    $("#mainlistgrid").jqxGrid(
    {
        width: '100%',
        height: 570,
        source: dataAdapter,
        showaggregates:true,
        enableAnimations: true,
        filtermode:'excel',
        filterable: true,
        sortable:true,
        editable:true,
        showaggregates:true,
        showstatusbar:true,
        
        statusbarheight: 21,
        
        selectionmode: 'checkbox',
        pagermode: 'default',
         
        columns: [   	
                  { text: 'SL#', sortable: false, filterable: false, editable: false,
                      groupable: false, draggable: false, resizable: false,
                      datafield: 'sl', columntype: 'number', width: '4%',
                      cellsrenderer: function (row, column, value) {
                          return "<center><div style='margin:4px;'>" + (value + 1) + "</div></center>";
                      }  
                    },	
                   
                                 
                     
                     { text: 'Product', datafield: 'product',  width: '9%' ,editable: false},
                     { text: 'Product Name', datafield: 'productname' ,width:'25.2%',editable: false},
                     { text: 'Gradation', datafield: 'description' ,editable: false,width:'6%'},
                     { text: 'Psr No', datafield: 'psrno' ,editable: false,width:'7%',hidden:true},
                     { text: 'Purch Qty', datafield: 'purchasequantity',  width: '6%' ,editable: false,cellsalign:'right',cellsformat:'d2'},
                     { text: 'Sale Qty', datafield: 'salequantity',  width: '6%' ,editable: false,cellsalign:'right',cellsformat:'d2'},
                     { text: 'Stock Qty', datafield: 'stockquantity',  width: '8%' ,editable: false,cellsalign:'right',cellsformat:'d2'},
                     { text: 'Stock Value', datafield: 'stockprice',  width: '7%' ,editable: false,cellsalign:'right',cellsformat:'d2'},
                     
                     { text: 'Avg Sales/ Mnth', datafield: 'averagesalespermonth',  width: '8%',cellsformat:'d2' ,cellsalign:'right',editable: false,cellclassname: cellclassname},
                     { text: 'Avg Purch / Mnth', datafield: 'averagepurchasepermonth',  width: '8%',cellsformat:'d2' ,cellsalign:'right',editable: false,cellclassname: cellclassname},
                     { text: 'Turn-Around Days', datafield: 'turndays',  width: '10%' ,cellsalign:'right',editable: false,cellsformat:'d2',cellclassname: cellclassname},
            
                   
					]
   
    }); 
     $('#mainlistgrid').on('cellclick', function (event) {
    	
  	  var datafield = event.args.datafield;
    	var rowindex2 = event.args.rowindex;
    	
     	if(datafield=="std_cost")
		{
    	var std_cost=$('#mainlistgrid').jqxGrid('getcellvalue', rowindex2, "std_cost");
    	var brandid=$('#mainlistgrid').jqxGrid('getcellvalue', rowindex2, "brandid");
    	var psrno=$('#mainlistgrid').jqxGrid('getcellvalue', rowindex2, "psrno");
   
		 
  	var sal_marginss=$('#mainlistgrid').jqxGrid('getcellvalue', rowindex2, "sal_margin");

    	
   	if(std_cost>0 && (sal_marginss=="" ||typeof(sal_marginss)=="undefined") )
   		{

    		var x=new XMLHttpRequest();
    		x.onreadystatechange=function(){
    			if (x.readyState==4 && x.status==200)
    				{
    				 var items= x.responseText.trim();
    				 	 
    				 	var itemval=items.split("::");
 
    				 	var salesmargin=itemval[0];
    				 	
    				 	var psellingprice=$('#mainlistgrid').jqxGrid('getcellvalue', rowindex2, "psellingprice");
    				 	$('#mainlistgrid').jqxGrid('setcellvalue', rowindex2, "sal_margin",salesmargin);
    				 	
    				 	var sellingprice=parseFloat(std_cost)*(1+(parseFloat(salesmargin)/100));
    					$('#mainlistgrid').jqxGrid('setcellvalue', rowindex2, "sellingprice",sellingprice);
    				//	$('#mainlistgrid').jqxGrid('setcellvalue', rowindex2, "psellingprice",psellingprice);
    					
    					var variation1=parseFloat(sellingprice)-parseFloat(psellingprice);
    					$('#mainlistgrid').jqxGrid('setcellvalue', rowindex2, "variation1",variation1);
    					$('#mainlistgrid').jqxGrid('setcellvalue', rowindex2, "fixing",sellingprice);
    			 
    					var profitper=((parseFloat(sellingprice)-parseFloat(std_cost))/(parseFloat(sellingprice))*100);
     
    			 
    					
 						$('#mainlistgrid').jqxGrid('setcellvalue', rowindex2, "profitper1",profitper);
    					
    		}
    		}
    	x.open("GET","getprice.jsp?std_cost="+std_cost+'&brandid='+brandid+"&psrno="+psrno);
    		x.send();
    		
    		
    		}
		}
    
    });
    
  
  
     $('#mainlistgrid').on('celldoubleclick', function (event) {
     
var rowindex2 = event.args.rowindex;
 
var datafield = event.args.datafield;
var psrno=$('#mainlistgrid').jqxGrid('getcellvalue', rowindex2, "psrno");
 

document.getElementById("psrno").value=psrno;
	document.getElementById("rowindexs").value=rowindex2;
	document.getElementById("discountval").value=$('#mainlistgrid').jqxGrid('getcellvalue', rowindex2, "maxdiscount");
	
	document.getElementById("std_cost").value=$('#mainlistgrid').jqxGrid('getcellvalue', rowindex2, "std_cost");
	document.getElementById("fixing").value=$('#mainlistgrid').jqxGrid('getcellvalue', rowindex2, "fixing");
	document.getElementById("labourcharge").value=$('#mainlistgrid').jqxGrid('getcellvalue', rowindex2, "labourcharge");
if(datafield=="std_cost" || datafield=="fixing" || datafield=="maxdiscount")
	{
	 
	}
else
	{

var barchval = document.getElementById("cmbbranch").value;
 
var psrno=$('#mainlistgrid').jqxGrid('getcellvalue', rowindex2, "psrno");


document.getElementById("name1").innerText="Product Id";
document.getElementById("name2").innerText="Product Name";
document.getElementById("name3").innerText="Type ";
document.getElementById("productid").innerText=": "+$('#mainlistgrid').jqxGrid('getcellvalue', rowindex2, "part_no");
document.getElementById("productname").innerText=": "+$('#mainlistgrid').jqxGrid('getcellvalue', rowindex2, "productname");
document.getElementById("productbrand").innerText=": "+$('#mainlistgrid').jqxGrid('getcellvalue', rowindex2, "brandname");


 
 
document.getElementById("psrno").value=psrno;

$("#updatdata").attr("disabled",true);

/* document.getElementById("rowindexs").value=$('#mainlistgrid').jqxGrid('getcellvalue', rowindex2, "rowindex2");
document.getElementById("discountval").value=$('#mainlistgrid').jqxGrid('getcellvalue', rowindex2, "psrno");
 */
 

  $("#overlay, #PleaseWait").show();
 $("#pricelistdiv").load("pricelistgrid.jsp?barchval="+barchval+"&psrno="+psrno);

	}
 	  
     });  
  
    $('#mainlistgrid').on('cellvaluechanged', function (event) {
        var datafield = event.args.datafield;
    	var rowindex2 = event.args.rowindex;
    	
    	$("#updatdata").attr("disabled",true);
    	var std_cost=$('#mainlistgrid').jqxGrid('getcellvalue', rowindex2, "std_cost");
    	var brandid=$('#mainlistgrid').jqxGrid('getcellvalue', rowindex2, "branddoc");
    	var psrno=$('#mainlistgrid').jqxGrid('getcellvalue', rowindex2, "psrno");
    	
        var type= $('#type').val();
    	 
    	
    	document.getElementById("psrno").value=psrno;



    	document.getElementById("rowindexs").value=rowindex2;
    	document.getElementById("discountval").value=$('#mainlistgrid').jqxGrid('getcellvalue', rowindex2, "maxdiscount");
    	
    	document.getElementById("std_cost").value=$('#mainlistgrid').jqxGrid('getcellvalue', rowindex2, "std_cost");
    	document.getElementById("fixing").value=$('#mainlistgrid').jqxGrid('getcellvalue', rowindex2, "fixing");
    	document.getElementById("labourcharge").value=$('#mainlistgrid').jqxGrid('getcellvalue', rowindex2, "labourcharge");
    	
    	
    	if(datafield=="std_cost")
    		{
    		
    		var x=new XMLHttpRequest();
    		x.onreadystatechange=function(){
    			if (x.readyState==4 && x.status==200)
    				{
    				 var items= x.responseText.trim();
    				 	 
    				 	var itemval=items.split("::");
 
    				 	var salesmargin=itemval[0];
    				 	
    				 	var psellingprice=$('#mainlistgrid').jqxGrid('getcellvalue', rowindex2, "psellingprice");
    				 	$('#mainlistgrid').jqxGrid('setcellvalue', rowindex2, "sal_margin",salesmargin);
    				 	
    				 	var sellingprice=parseFloat(std_cost)*(1+(parseFloat(salesmargin)/100));
    					$('#mainlistgrid').jqxGrid('setcellvalue', rowindex2, "sellingprice",sellingprice);
    				//	$('#mainlistgrid').jqxGrid('setcellvalue', rowindex2, "psellingprice",psellingprice);
    					
    					var variation1=parseFloat(sellingprice)-parseFloat(psellingprice);
    					$('#mainlistgrid').jqxGrid('setcellvalue', rowindex2, "variation1",variation1);
    					$('#mainlistgrid').jqxGrid('setcellvalue', rowindex2, "fixing",sellingprice);
    			 
    					var profitper=((parseFloat(sellingprice)-parseFloat(std_cost))/(parseFloat(sellingprice))*100);
     
    			 
    					
 						$('#mainlistgrid').jqxGrid('setcellvalue', rowindex2, "profitper1",profitper);
    					
    		}
    		}
    	x.open("GET","getprice.jsp?std_cost="+std_cost+'&brandid='+brandid+"&psrno="+psrno);
    		x.send();
    		
    		
    		}
    	
       	if(datafield=="maxdiscount")
		{
    		var barchval = document.getElementById("cmbbranch").value;
    	$("#pricelistdiv").load("pricelistgrid.jsp?barchval="+barchval+"&psrno="+psrno);
    	}
    
    });
    
 
   if(temp4=='NA')
    	{ 
    	  $("#mainlistgrid").jqxGrid('addrow', null, {});
    	}  
    
    $("#overlay, #PleaseWait").hide();
    
   
});


</script>
<div id="mainlistgrid"></div>