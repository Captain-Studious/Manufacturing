
 <%@page import="com.dashboard.pricemanagement.pricefixing.ClspriceFixingDAO"%>
 <% ClspriceFixingDAO searchDAO = new ClspriceFixingDAO(); 
  	String psrno = request.getParameter("psrno")==null?"0":request.getParameter("psrno").trim();
 %> 
       
 
<script type="text/javascript">
 var temp4='<%=psrno%>';
var datas;

 if(temp4!='NA')
{ 
	
	 datas='<%=searchDAO.listgridsearch(psrno)%>'; 
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
        datafields: [   //  tr_no voc_no  accname
                     
 
                      
						 
						{name : 'vnd', type: 'String'  }, 
						 {name : 'date', type: 'String'  },
						{name : 'qty', type: 'number'  },
						{name : 'foc', type: 'number'  },
						{name : 'unitprice', type: 'number'  },
						
						  
				 
			 
						
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
    
    
   
   
    
    $("#sidelistgrid").jqxGrid(
    {
        width: '100%',
        height: 200,
        source: dataAdapter,
      
         selectionmode: 'singlerow',
        pagermode: 'default',
          editable: false,
        columns: [   
                
                  
                  
              	 
				
			     { text: 'SL#', sortable: false, filterable: false, editable: false,
                    groupable: false, draggable: false , resizable: false ,
                    datafield: 'sl', columntype: 'number', width: '5%',
                    cellsrenderer: function (row, column, value) {
                        return "<center><div style='margin:4px;'>" + (value + 1) + "</div></center>";
                    }  
                  },	
                 
         
                     { text: 'Vendor',datafield: 'vnd', width: '45%' },
                     { text: 'Date', datafield: 'date',  width: '12%' },
                     { text: 'Qty', datafield: 'qty',  width: '12%' ,cellsformat:'d2' },
                     { text: 'FOC', datafield: 'foc',  width: '12%',cellsformat:'d2',aggregates: ['sum1'],aggregatesrenderer:rendererstring1 },
                     { text: 'Unit Price', datafield: 'unitprice',  width: '14%',cellsformat:'d2',aggregates: ['sum'],aggregatesrenderer:rendererstring },
           	  
					
					]
   
    });
    
    $("#overlay, #PleaseWait").hide();
 
    
    
    if(temp4=='NA')
     	{ 
     	  $("#sidelistgrid").jqxGrid('addrow', null, {});
     	}  
    
   
});


</script>
<div id="sidelistgrid"></div>