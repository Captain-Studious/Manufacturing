
 
 
 <%@page import="com.dashboard.pricemanagement.pricemanagementreview.ClsPriceManagementReviewDAO"%>
 <% ClsPriceManagementReviewDAO searchDAO = new ClsPriceManagementReviewDAO(); 
 
    String barchval = request.getParameter("barchval")==null?"NA":request.getParameter("barchval").trim();
	String fromdate = request.getParameter("fromdate")==null?"0":request.getParameter("fromdate").trim();
  	String todate = request.getParameter("todate")==null?"0":request.getParameter("todate").trim();
  
  	String acno = request.getParameter("acno")==null?"NA":request.getParameter("acno").trim();
  	String doc_no = request.getParameter("doc_no")==null?"NA":request.getParameter("doc_no").trim();
  	
  	String statusselect = request.getParameter("statusselect")==null?"0":request.getParameter("statusselect").trim();
 %> 
       
 
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
        
        showaggregates:true,
        showstatusbar:true,
        
        statusbarheight: 21,
        
        selectionmode: 'singlerow',
        pagermode: 'default',
        editable:false,
        columns: [   
                  { text: 'SL#', sortable: false, filterable: false, editable: false,
                      groupable: false, draggable: false, resizable: false,
                      datafield: 'sl', columntype: 'number', width: '4%',
                      cellsrenderer: function (row, column, value) {
                          return "<center><div style='margin:4px;'>" + (value + 1) + "</div></center>";
                      }  
                    },	
          
                   ///  part_no, productname, qty, costprice, stkqty, totalvalue, avgcost 
                      
                      { text: 'psrno', datafield: 'psrno',  width: '13%' ,hidden:true},
           	         { text: 'Product Id', datafield: 'part_no',  width: '13%' },
           	         { text: 'Product Name', datafield: 'productname',  width: '30%' },  
           	         { text: 'Unit', datafield: 'unit',  width: '5%' },
           	         { text: 'Qty', datafield: 'qty',  width: '8%' ,cellsformat:'d2',aggregates: ['sum1'],aggregatesrenderer:rendererstring1},
           	   	     { text: 'Cost Per Unit', datafield: 'costprice',  width: '10%' ,cellsformat:'d2' ,cellsalign: 'right', align:'right',aggregates: ['sum'],aggregatesrenderer:rendererstring},
           	         { text: 'Stock Qty', datafield: 'stkqty',  width: '10%' ,cellsformat:'d2'},
		           	 { text: 'Total value', datafield: 'totalvalue',  width: '10%',cellsformat:'d2',aggregates: ['sum'],aggregatesrenderer:rendererstring,cellsalign: 'right', align:'right' },
		           	 { text: 'Avg Purchase Cost', datafield: 'avgcost',  width: '10%' ,cellsformat:'d2',cellsalign: 'right', align:'right',aggregates: ['sum'],aggregatesrenderer:rendererstring},
		            	
 
					
					]
   
    });
    
    $('#mainlistgrid').on('rowdoubleclick', function (event) {
     
var rowindex2 = event.args.rowindex;
 

var barchval = document.getElementById("cmbbranch").value;
 
var psrno=$('#mainlistgrid').jqxGrid('getcellvalue', rowindex2, "psrno");
document.getElementById("psrno").value=psrno;
  $("#overlay, #PleaseWait").show();
 $("#pricelistdiv").load("pricelistgrid.jsp?barchval="+barchval+"&psrno="+psrno);

	
 	  
     });
 
    
    
   if(temp4=='NA')
    	{
    	  $("#mainlistgrid").jqxGrid('addrow', null, {});
    	}  
    
    $("#overlay, #PleaseWait").hide();
    
   
});


</script>
<div id="mainlistgrid"></div>