 <%@page import="com.dashboard.pricemanagement.pricefixing.ClspriceFixingDAO"%>
 <% ClspriceFixingDAO searchDAO = new ClspriceFixingDAO();
 
 
  	
  	String psrno = request.getParameter("psrno")==null?"0":request.getParameter("psrno").trim();
 %> 
       
 
<script type="text/javascript">
 var temp4='<%=psrno%>';
var datas2;

 if(temp4!='NA')
{ 
	
	 datas2='<%=searchDAO.foclistgridsearch(psrno)%>'; 
		// alert(enqdata); --%>
} 
else
{ 
	
	datas2;
	
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
                     
 
                      
						 
	 
						{name : 'qty', type: 'number'  },
						{name : 'foc', type: 'number'  },
					 
						
						  
				 
			 
						
						],
				    localdata: datas2,
        
        
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
    
    
   
   
    
    $("#savelistgrid").jqxGrid(
    {
        width: '70%',
        height: 200,
        source: dataAdapter,
        rowsheight:20,
         selectionmode: 'singlerow',
        pagermode: 'default',
          editable: true,
        columns: [   
                
                  
                  
              	 
				
			     { text: 'SL#', sortable: false, filterable: false, editable: false,
                    groupable: false, draggable: false , resizable: false ,
                    datafield: 'sl', columntype: 'number', width: '9%',
                    cellsrenderer: function (row, column, value) {
                        return "<center><div style='margin:4px;'>" + (value + 1) + "</div></center>";
                    }  
                  },	
                 
         
                     
                     { text: 'Qty', datafield: 'qty',  width: '45%' ,cellsformat:'d2' },
                     
                     { text: 'FOC', datafield: 'foc',  width: '45%',cellsformat:'d2'  }, 
					
					]
   
    });
    
    $("#overlay, #PleaseWait").hide();
 
    
    $('#savelistgrid').on('cellvaluechanged', function (event) {
		     var rowindex1=event.args.rowindex;
		     var rows = $('#savelistgrid').jqxGrid('getrows');
             var rowlength= rows.length;
             if(rowindex1 == rowlength - 1)
             	{  
          	  
             $("#savelistgrid").jqxGrid('addrow', null, {});
             
          
       
             	}    
		     
		     
		 }); 
    
    
   
     	  $("#savelistgrid").jqxGrid('addrow', null, {});
     	 
     	 
    
   
});


</script>
<div id="savelistgrid"></div>