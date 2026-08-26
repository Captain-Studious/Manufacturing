
 
 
 <%@page import="com.dashboard.pricemanagement.pricemanagementreview.ClsPriceManagementReviewDAO"%>
 <% ClsPriceManagementReviewDAO searchDAO = new ClsPriceManagementReviewDAO(); 
 
    String barchval = request.getParameter("barchval")==null?"NA":request.getParameter("barchval").trim();
	String fromdate = request.getParameter("fromdate")==null?"0":request.getParameter("fromdate").trim();
  	String todate = request.getParameter("todate")==null?"0":request.getParameter("todate").trim();
  
  	String acno = request.getParameter("acno")==null?"NA":request.getParameter("acno").trim();
  	
  	
	String doc_no = request.getParameter("doc_no")==null?"NA":request.getParameter("doc_no").trim();
  	
  	String statusselect = request.getParameter("statusselect")==null?"0":request.getParameter("statusselect").trim();
 %> 
       
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
    
    .whiteClass
    {
        background-color: #fff;
    }
    
    
    
    
    
              
</style>    
<script type="text/javascript">
 var temp4='<%=barchval%>';
var datas1;

 if(temp4!='NA')
{ 
	 
	 datas1='<%=searchDAO.mainlistgridsearch(barchval,fromdate,todate,statusselect,doc_no)%>'; 
		// alert(enqdata); --%>
	 
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
   var cellclassname = function (row, column, value, data) {
		if (data.curmaxdiscount>0) {
			 
	        return "redClass";
	    }
			else{
				  return "whiteClass";	 
			}
			 
		 
		
		}; 
    var source =
    {
        datatype: "json",
        datafields: [   


                        {name : 'psrno', type: 'String'  },
                        {name : 'part_no', type: 'String'  },
						{name : 'productname', type: 'String'  },
						{name : 'unit', type: 'String'  },
						{name : 'qty', type: 'number'  },
						{name : 'costprice', type: 'number'  },
						{name : 'stkqty', type: 'number'  },
						{name : 'totalvalue', type: 'number'  },
						{name : 'avgcost', type: 'number'  },
						
						 {name : 'brandname', type: 'String'  },
						 {name : 'brandid', type: 'String'  },
					 
							{name : 'variation', type: 'number'  },
							
							 {name : 'std_cost', type: 'number'  },
							 
							 {name : 'sal_margin', type: 'number'  },
							 {name : 'sellingprice', type: 'number'  },
							 {name : 'psellingprice', type: 'number'  },
							 {name : 'variation1', type: 'number'  },
							 {name : 'fixing', type: 'number'  },
							
							 {name : 'profitper1', type: 'String'  },
							 {name : 'maxdiscount', type: 'number'  },
							 
							 {name : 'cellselects', type: 'int'  },
							 
							 {name : 'curmaxdiscount', type: 'number'  },
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
        width: '98%',
        height: 380,
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
        
        selectionmode: 'singlecell',
        pagermode: 'default',
         
        columns: [   	
                  { text: 'SL#', sortable: false, filterable: false, editable: false,
                      groupable: false, draggable: false, pinned: true, resizable: false,cellclassname: cellclassname,
                      datafield: 'sl', columntype: 'number', width: '4%',
                      cellsrenderer: function (row, column, value) {
                          return "<center><div style='margin:4px;'>" + (value + 1) + "</div></center>";
                      }  
                    },	
          
                                 
                     { text: 'psrno', datafield: 'psrno',  width: '10%' ,hidden:true,cellclassname: cellclassname},
                     { text: 'Product Id', datafield: 'part_no', pinned: true,  width: '10%' ,editable: false,cellclassname: cellclassname},
           	         { text: 'brandid', datafield: 'brandid',  width: '10%' ,hidden:true,cellclassname: cellclassname },
           	         { text: 'Product Name', datafield: 'productname', pinned: true,  width: '28%',editable: false ,cellclassname: cellclassname}, 
           	   		 { text: 'Brand', datafield: 'brandname',  width: '15%' ,editable: false/* ,cellclassname: cellclassname */},
           	         { text: 'Unit', datafield: 'unit',  width: '4%',editable: false/* ,cellclassname: cellclassname */ },
           	         { text: 'Qty', datafield: 'qty',  width: '4%' ,cellsformat:'d2',aggregates: ['sum1'],aggregatesrenderer:rendererstring1,editable: false/* ,cellclassname: cellclassname */},
           	   	     { text: 'Cost Per Unit', datafield: 'costprice',  width: '7%' ,cellsformat:'d2' ,cellsalign: 'right', align:'right',aggregates: ['sum'],aggregatesrenderer:rendererstring,editable: false/* ,cellclassname: cellclassname */},
           	         { text: 'Stock Qty', datafield: 'stkqty',  width: '5%' ,cellsformat:'d2',editable: false/* ,cellclassname: cellclassname */},
		           	 { text: 'Total Value', datafield: 'totalvalue',  width: '8%',cellsformat:'d2',aggregates: ['sum'],aggregatesrenderer:rendererstring,cellsalign: 'right', align:'right',editable: false/* ,cellclassname: cellclassname */ },
		           	 { text: 'Avg Purchase Cost', datafield: 'avgcost',  width: '9%' ,cellsformat:'d2',cellsalign: 'right', align:'right',aggregates: ['sum'],aggregatesrenderer:rendererstring,editable: false/* ,cellclassname: cellclassname */},
		         	 { text: 'Variation', datafield: 'variation',  width: '6%' ,cellsformat:'d2',cellsalign: 'right', align:'right',aggregates: ['sum'],aggregatesrenderer:rendererstring,editable: false/* ,cellclassname: cellclassname */},	
           	         { text: 'Std_Cost', datafield: 'std_cost',  width: '8%'  ,editable:true,cellsformat:'d2' ,cellsalign: 'right', align:'right',aggregates: ['sum'],aggregatesrenderer:rendererstring/* ,cellclassname: cellclassname */ },
           	  		 { text: 'Sales Margin', datafield: 'sal_margin',  width: '8%' ,cellsformat:'d2'  ,editable: false/* ,cellclassname: cellclassname */}, 
         	  		 { text: 'Selling Price', datafield: 'sellingprice',  width: '8%' ,cellsformat:'d2' ,cellsalign: 'right', align:'right',aggregates: ['sum'],aggregatesrenderer:rendererstring,editable: false/* ,cellclassname: cellclassname */}, 
         	  		 { text: 'Present Selling Price', datafield: 'psellingprice',  width: '10%' ,cellsformat:'d2' ,cellsalign: 'right', align:'right',aggregates: ['sum'],aggregatesrenderer:rendererstring,editable: false/* ,cellclassname: cellclassname */}, 
         	  		 { text: 'Variation', datafield: 'variation1',  width: '8%' ,cellsformat:'d2' ,cellsalign: 'right', align:'right',aggregates: ['sum'],aggregatesrenderer:rendererstring,editable: false/* ,cellclassname: cellclassname */},
         	  		 { text: 'Final Price ', datafield: 'fixing',  width: '8%',cellsformat:'d2' ,cellsalign: 'right', align:'right',aggregates: ['sum'],aggregatesrenderer:rendererstring /* ,cellclassname: cellclassname */},  	 
         	         { text: 'Profit% On Selling Price', datafield: 'profitper1',  width: '8%',cellsformat:'d2',editable: false,cellclassname: "greyClass",cellsalign: 'right', align:'right'},  	 
         	        { text: 'Cur.Max Discount', datafield: 'curmaxdiscount',  width: '9%',cellsformat:'d2',editable: false,cellclassname: cellclassname,cellsalign: 'right', align:'right'},
         	         
         	         { text: 'New Max Discount', datafield: 'maxdiscount',  width: '8%',cellsformat:'d2',cellclassname: "yellowClass" ,cellsalign: 'right', align:'right'},  	 
         	       	 { text: 'cellselect', datafield: 'cellselects',  width: '8%' ,hidden:true  },
         	
					]
   
    }); 
    
    /* $('#mainlistgrid').on('cellclick', function (event) {
    	
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
      				 	
      				 	var psellingprice=itemval[1];
      				 	$('#mainlistgrid').jqxGrid('setcellvalue', rowindex2, "sal_margin",salesmargin);
      				 	
      				 	var sellingprice=parseFloat(std_cost)*(1+(parseFloat(salesmargin)/100));
      					$('#mainlistgrid').jqxGrid('setcellvalue', rowindex2, "sellingprice",sellingprice);
      					$('#mainlistgrid').jqxGrid('setcellvalue', rowindex2, "psellingprice",psellingprice);
      					
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
      
    
     */
    
     $('#mainlistgrid').on('celldoubleclick', function (event) {
     
var rowindex2 = event.args.rowindex;
 
var datafield = event.args.datafield;
var psrno=$('#mainlistgrid').jqxGrid('getcellvalue', rowindex2, "psrno");
document.getElementById("psrno").value=psrno;



document.getElementById("rowindexs").value=rowindex2;
document.getElementById("discountval").value=$('#mainlistgrid').jqxGrid('getcellvalue', rowindex2, "maxdiscount");

document.getElementById("std_cost").value=$('#mainlistgrid').jqxGrid('getcellvalue', rowindex2, "std_cost");
document.getElementById("fixing").value=$('#mainlistgrid').jqxGrid('getcellvalue', rowindex2, "fixing");
if(datafield=="std_cost" || datafield=="fixing" || datafield=="maxdiscount")
	{
	 
	}
else
	{

var barchval = document.getElementById("cmbbranch").value;
 
var psrno=$('#mainlistgrid').jqxGrid('getcellvalue', rowindex2, "psrno");


document.getElementById("name1").innerText="Product Id";
document.getElementById("name2").innerText="Product Name";
document.getElementById("name3").innerText="Brand ";
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
    	var brandid=$('#mainlistgrid').jqxGrid('getcellvalue', rowindex2, "brandid");
    	var psrno=$('#mainlistgrid').jqxGrid('getcellvalue', rowindex2, "psrno");
    	
       
    	document.getElementById("psrno").value=psrno;



    	document.getElementById("rowindexs").value=rowindex2;
    	document.getElementById("discountval").value=$('#mainlistgrid').jqxGrid('getcellvalue', rowindex2, "maxdiscount");
    	
    	document.getElementById("std_cost").value=$('#mainlistgrid').jqxGrid('getcellvalue', rowindex2, "std_cost");
    	document.getElementById("fixing").value=$('#mainlistgrid').jqxGrid('getcellvalue', rowindex2, "fixing");
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
    			 
    					var profitper=((parseFloat(psellingprice)-parseFloat(std_cost))/(parseFloat(psellingprice))*100);
     
    			 
    					
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
    	
     	if(datafield=="fixing")
		{
    		var fixing=$('#mainlistgrid').jqxGrid('getcellvalue', rowindex2, "fixing");
    		var profitper=((parseFloat(fixing)-parseFloat(std_cost))/(parseFloat(fixing))*100);
    		$('#mainlistgrid').jqxGrid('setcellvalue', rowindex2, "profitper1",profitper);
		}
    
    });
    
    

    $('#mainlistgrid').on('cellclick', function (event) {
        var datafield = event.args.datafield;
    	var rowindex2 = event.args.rowindex;
    	
       	if(datafield=="std_cost")
   		{
   		
    	var std_cost=$('#mainlistgrid').jqxGrid('getcellvalue', rowindex2, "std_cost");
    	var brandid=$('#mainlistgrid').jqxGrid('getcellvalue', rowindex2, "brandid");
    	var psrno=$('#mainlistgrid').jqxGrid('getcellvalue', rowindex2, "psrno");
    	
       
    	document.getElementById("psrno").value=psrno;



    	document.getElementById("rowindexs").value=rowindex2;
    	document.getElementById("discountval").value=$('#mainlistgrid').jqxGrid('getcellvalue', rowindex2, "maxdiscount");
    	
    	document.getElementById("std_cost").value=$('#mainlistgrid').jqxGrid('getcellvalue', rowindex2, "std_cost");
    	document.getElementById("fixing").value=$('#mainlistgrid').jqxGrid('getcellvalue', rowindex2, "fixing");
 
    	
    	
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
    			 
    					var profitper=((parseFloat(psellingprice)-parseFloat(std_cost))/(parseFloat(psellingprice))*100);
     
    			 
    					
 						$('#mainlistgrid').jqxGrid('setcellvalue', rowindex2, "profitper1",profitper);
    					
    		}
    		}
    		x.open("GET","getprice.jsp?std_cost="+std_cost+'&brandid='+brandid+"&psrno="+psrno);
    		x.send();
    		
    		
    		
    		}
    	
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