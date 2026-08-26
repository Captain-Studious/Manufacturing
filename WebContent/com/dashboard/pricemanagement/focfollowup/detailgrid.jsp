
 
 <%@page import="com.dashboard.pricemanagement.focfollowup.ClasfocFollowupDAO"%>
 <% ClasfocFollowupDAO searchDAO = new ClasfocFollowupDAO(); 
 
 
  	String docno = request.getParameter("docno")==null?"NA":request.getParameter("docno").trim();
  	
  	 
 %> 
       
 
<script type="text/javascript">
 var temp4='<%=docno%>';
var datas;

 if(temp4!='NA')
{ 
	
	 datas='<%=searchDAO.detgridsearch(docno)%>'; 
	 
	 
	 
		// alert(enqdata); --%>
} 
else
{ 
	
	datas;
	
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

                     {name : 'doc_no', type: 'int'  },
                     {name : 'psrno', type: 'int'  },
                     {name : 'stockid', type: 'int'  },
                     {name : 'rowno', type: 'int'  },
                     
						{name : 'date', type: 'date'  },
					 
						{name : 'qty', type: 'number'  },
						
						{name : 'productid', type: 'String'  },
						{name : 'productname', type: 'String'  },
						{name : 'unit', type: 'String'  },
						{name : 'brandname', type: 'String'  },
						
						
						{name : 'dtype', type: 'String'  },
						
						{name : 'out_qty', type: 'number'  },
						{name : 'foc', type: 'number'  },
						{name : 'expfoc', type: 'number'  },
						
						{name : 'balqty', type: 'number'  },
						
						{name : 'amount', type: 'number'  },
						
						{name : 'total', type: 'number'  },
						
						{name : 'disper', type: 'number'  },
						{name : 'discount', type: 'number'  },
						{name : 'nettotal', type: 'number'  },
						
						{name : 'account', type: 'String'  },      
						{name : 'acname', type: 'String'  }, 
						
						{name : 'taxper', type: 'number'  }, 
						{name : 'taxamount', type: 'number'  }, 
						{name : 'nettaxamount', type: 'number'  }, 
						{name : 'expfocrvd', type: 'number'  }, 
						{name : 'cost_price', type: 'number'  }, 
						
						
						
						],
				    localdata: datas,
        
        
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
    
    
   
   
    
    $("#detgrid").jqxGrid(
    {
        width: '98%',
        height: 250,
        source: dataAdapter,
     /*    showaggregates:true, */
        enableAnimations: true,
        filtermode:'excel',
        filterable: true,
        sortable:true,
/*         
        showaggregates:true,
        showstatusbar:true, */
        
        statusbarheight: 21,
        
        selectionmode: 'checkbox',
        pagermode: 'default',
        editable: true,
        columns: [   
                  { text: 'SL#', sortable: false, filterable: false, editable: false,
                      groupable: false, draggable: false, resizable: false,
                      datafield: 'sl', columntype: 'number', width: '4%',
                      cellsrenderer: function (row, column, value) {
                          return "<center><div style='margin:4px;'>" + (value + 1) + "</div></center>";
                      }  
                    },	
                    
                     { text: 'Doc No',datafield: 'psrno', width: '5%', editable: false,hidden:true },
                     { text: 'Rowno',datafield: 'rowno', width: '5%', editable: false,hidden:true },
                     { text: 'stockid',datafield: 'stockid', width: '5%', editable: false ,hidden:true},
                     
                      
                     { text: 'cost_price', datafield: 'cost_price',  width: '13%' , editable: false,hidden:true}, 
          	         { text: 'Product Id', datafield: 'productid',  width: '11%' , editable: false}, 
          	         { text: 'Product Name', datafield: 'productname' , editable: false},
        	         { text: 'Brand Name', datafield: 'brandname',  width: '13%', editable: false },  
          	       
          	         { text: 'Unit', datafield: 'unit',  width: '5%', editable: false },  
          	         { text: 'Qty', datafield: 'qty',  width: '6%' ,cellsformat:'d2', editable: false},
          	        
		           	 { text: 'FOC', datafield: 'foc',  width: '6%' ,cellsformat:'d2' , editable: false },
		           	 { text: 'Exp FOC', datafield: 'expfoc',  width: '6%' ,cellsformat:'d2' , editable: false},
		           	 { text: 'Exp FOC Received', datafield: 'expfocrvd',  width: '10%' ,cellsformat:'d2',editable:true },
		           	 /*  { text: 'Total', datafield: 'total',  width: '10%' ,cellsformat:'d2',cellsalign: 'right', align:'right',aggregates: ['sum'],aggregatesrenderer:rendererstring},
		           	 { text: 'Discount %', datafield: 'disper',  width: '10%' ,cellsformat:'d2',cellsalign: 'right', align:'right',aggregates: ['sum'],aggregatesrenderer:rendererstring},
		           	 { text: 'Discount', datafield: 'discount',  width: '10%' ,cellsformat:'d2',cellsalign: 'right', align:'right',aggregates: ['sum'],aggregatesrenderer:rendererstring},
		             { text: 'Net Total', datafield: 'nettotal',  width: '10%' ,cellsformat:'d2',cellsalign: 'right', align:'right',aggregates: ['sum'],aggregatesrenderer:rendererstring},
		             { text: 'Tax %', datafield: 'taxper',  width: '10%' ,cellsformat:'d2',cellsalign: 'right', align:'right',hidden:true},
		             { text: 'Tax Amount', datafield: 'taxamount',  width: '10%' ,cellsformat:'d2',cellsalign: 'right',hidden:true, align:'right',aggregates: ['sum'],aggregatesrenderer:rendererstring},
		             { text: ' Total Amount', datafield: 'nettaxamount',  width: '10%' ,cellsformat:'d2',cellsalign: 'right',hidden:true, align:'right',aggregates: ['sum'],aggregatesrenderer:rendererstring},

						 */
		           	{text: 'Batch No', datafield: 'batch_no', width: '10%'  },
					{text: 'Exp Date', datafield: 'exp_date', width: '10%' ,columntype: 'datetimeinput', align: 'left', cellsalign: 'left',cellsformat:'dd.MM.yyyy'},	   
					
           	     
                     
 
					
					]
   
    });
    $("#overlay, #PleaseWait").hide();
    
   
    
    $('#detgrid').on('cellvaluechanged', function (event) {
    
    	
       	var datafield = event.args.datafield;
   		
		    var rowBoundIndex = args.rowindex;
		    
			  	 if(datafield=="expfocrvd")
				  {

			  if (document.getElementById('mr').checked)
			         {
	        		var expfoc=$('#detgrid').jqxGrid('getcellvalue', rowBoundIndex, "expfoc");	
	                var expfocrvd=$('#detgrid').jqxGrid('getcellvalue', rowBoundIndex, "expfocrvd");
	            	if(expfocrvd>expfoc)
	            		{
	               	    $('#detgrid').jqxGrid('setcellvalue', rowBoundIndex, "expfocrvd",expfoc);
	            	    $.messager.alert('Message',' Foc value not more than Actual Foc '+expfoc  ,'warning');   
	            		}
	    		     }
		        }
 
	 
 
    });
    
    
    
    
   });


</script>
<div id="detgrid"></div>