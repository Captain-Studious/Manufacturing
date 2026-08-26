
 
 
 <%@page import="com.dashboard.pricemanagement.pricemanagementreview.ClsPriceManagementReviewDAO"%>
 <% ClsPriceManagementReviewDAO searchDAO = new ClsPriceManagementReviewDAO(); 
 
    String barchval = request.getParameter("barchval")==null?"NA":request.getParameter("barchval").trim();
 
 %> <style>
 

   .advanceClass
  {
      background-color: #FBEFF5;
  }
  .balanceClass
  {
      background-color: #E0F8F1;
  }
  .unappliedClass
  {
     color: #FF0000;
  }     
 </style>
<script type="text/javascript">
 var temp4='<%=barchval%>';
var datas1;

 if(temp4!='NA')
{ 
	 
	 datas1='<%=searchDAO.brandmaingrid(barchval)%>'; 
	 
	 
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
      
    var source =
    {
        datatype: "json",
        datafields: [   


                        {name : 'brand', type: 'String'  },
                        {name : 'minprice', type: 'number'  },
						{name : 'maxprice', type: 'number'  },
						{name : 'doc_no', type: 'number'  },
						
						 

						   {name : 'maxsale', type: 'number'  },
							{name : 'minsale', type: 'number'  },
						
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
        height: 520,
        source: dataAdapter,
        showaggregates:true,
        enableAnimations: true,
        filtermode:'excel',
        filterable: true,
        sortable:true,
        
        showaggregates:true,
        showstatusbar:true,
        
        statusbarheight: 21,
        
        selectionmode: 'singlerow',
        pagermode: 'default',
        editable:false,
        columns: [   
                  { text: 'SL#', sortable: false, filterable: false, editable: false,
                      groupable: false, draggable: false, resizable: false,
                      datafield: 'sl', columntype: 'number', width: '10%',
                      cellsrenderer: function (row, column, value) {
                          return " <div style='margin:4px;'>" + (value + 1) + "</div> ";
                      }  
                    },	
          
                   ///  part_no, productname, qty, costprice, stkqty, totalvalue, avgcost   maxprice minprice brand
                      
                      { text: 'doc_no', datafield: 'doc_no',  width: '13%' ,hidden:true},
           	         { text: 'Brand', datafield: 'brand',  minsale: '52%' ,aggregates: ['sum1'],aggregatesrenderer:rendererstring1},
           	         
           	          
           	   	     { text: 'Purchase Cost(Min)', datafield: 'minprice',  width: '12%' ,cellsformat:'d2' ,cellsalign: 'right',aggregates: ['sum'],aggregatesrenderer:rendererstring, align:'right' ,cellclassname:'balanceClass'},
 
		           	 { text: 'Purchase Cost(Max)', datafield: 'maxprice',  width: '12%',cellsformat:'d2' ,cellsalign: 'right',aggregates: ['sum'],aggregatesrenderer:rendererstring, align:'right',cellclassname:'advanceClass' },
		           	  
		           	 { text: 'Selling Price(Min)', datafield: 'minsale',  width: '12%' ,cellsformat:'d2' ,cellsalign: 'right',aggregates: ['sum'],aggregatesrenderer:rendererstring, align:'right' ,cellclassname:'balanceClass'},
		           	   
		           	 { text: 'Selling Price(Max)', datafield: 'maxsale',  width: '12%',cellsformat:'d2' ,cellsalign: 'right',aggregates: ['sum'],aggregatesrenderer:rendererstring, align:'right',cellclassname:'advanceClass' },
		           	

				 
					]
   
    });
 
    
    $('#mainlistgrid').on('rowdoubleclick', function (event) {
     
var rowindex2 = event.args.rowindex;
 
 document.getElementById("branddocno").value=$('#mainlistgrid').jqxGrid('getcellvalue', rowindex2, "doc_no");
 
 $("#sidelistgrid").jqxGrid({ disabled: false});

 $('#updatdata').attr('disabled', false);
 
 $("#sidelistdiv").load("listGrid.jsp?brandid="+document.getElementById("branddocno").value);
  
 $('#sidelistgrid').jqxGrid('setcellvalue', 0, "froms","0.00");
 	  
     });
 
    
    
   if(temp4=='NA')
    	{
    	  $("#mainlistgrid").jqxGrid('addrow', null, {});
    	}  
    
    $("#overlay, #PleaseWait").hide();
    
   
});


</script>
<div id="mainlistgrid"></div>