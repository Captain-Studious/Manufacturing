
 
 
 <%@page import="com.dashboard.pricemanagement.pricemanagementreview.ClsPriceManagementReviewDAO"%>
 <% ClsPriceManagementReviewDAO searchDAO = new ClsPriceManagementReviewDAO(); 
 
    String barchval = request.getParameter("barchval")==null?"NA":request.getParameter("barchval").trim();
 
 %>  
<script type="text/javascript">
 var temp4='<%=barchval%>';
var datas1;

 if(temp4!='NA')
{ 
	 
	  datas1='<%=searchDAO.searchSalesPerson()%>'; 
	 
	 
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


                        {name : 'doc_no', type: 'String'  },
                        {name : 'sal_name', type: 'number'  },
						{name : 'mob_no', type: 'number'  },
						{name : 'mail', type: 'string'  },
						{name : 'username', type: 'string'  },
						{name : 'category', type: 'string'  },
						{name : 'usgper', type: 'number'  },
						
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
        
        selectionmode: 'singlerow',
        pagermode: 'default',
        editable:false,
        columns: [   
                  { text: 'SL#', sortable: false, filterable: false, editable: false,
                      groupable: false, draggable: false, resizable: false,
                      datafield: 'sl', columntype: 'number', width: '4%',
                      cellsrenderer: function (row, column, value) {
                          return " <div style='margin:4px;'>" + (value + 1) + "</div> ";
                      }  
                    },	
          
                   
                      
                      { text: 'doc_no', datafield: 'doc_no',  width: '13%' ,hidden:true},
           	         { text: 'Sales Person', datafield: 'sal_name',  width: '26%'  },
           	  	        { text: 'Mob', datafield: 'mob_no',  width: '10%' },
           	  	   { text: 'Email', datafield: 'email',  width: '15%' },
           	          
           	   	     { text: 'User', datafield: 'username',  width: '22%' },
 
		           	 { text: 'Category', datafield: 'category',  width: '15%'  },
		           	  
		           	 { text: 'Default User %', datafield: 'usgper',cellsformat:'d2',  width: '8%' },
		           	   
		          
		           	

				 
					]
   
    });
 
    
    $('#mainlistgrid').on('rowdoubleclick', function (event) {
     
var rowindex2 = event.args.rowindex;
 
 document.getElementById("saldocno").value=$('#mainlistgrid').jqxGrid('getcellvalue', rowindex2, "doc_no");
 
 document.getElementById("salname").value=$('#mainlistgrid').jqxGrid('getcellvalue', rowindex2, "sal_name");
 
 
 
 
 $('#user').attr('disabled', false);
 $('#salname').attr('disabled', false);
 $('#cat').attr('disabled', false);
 $('#usgper').attr('disabled', false);
 
 $('#user').attr('readonly', true);
 $('#salname').attr('readonly', true);
 
 $('#updatdata').attr('disabled', false);
 	  
     });
 
    
    
   if(temp4=='NA')
    	{
    	  $("#mainlistgrid").jqxGrid('addrow', null, {});
    	}  
    
    $("#overlay, #PleaseWait").hide();
    
   
});


</script>
<div id="mainlistgrid"></div>