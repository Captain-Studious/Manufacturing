
 
 <%@page import="com.dashboard.procurment.productsuittype.ClsproductSuittypeDAO"%>
 <% ClsproductSuittypeDAO searchDAO = new ClsproductSuittypeDAO(); 
 
    String barchval = request.getParameter("barchval")==null?"NA":request.getParameter("barchval").trim();
	 
 %> 
       
 
<script type="text/javascript">
 var temp4='<%=barchval%>';
var datas;
 
 if(temp4!='NA')
{ 
	
	 datas='<%=searchDAO.listgridsearch()%>'; 
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
   	return '<div style="float: left; margin: 4px;font-size:12px; overflow: hidden;"> ' + value + '</div>';
   }
      
    var source =
    {
        datatype: "json",
        datafields: [   // doc_no  mastertype
                     
 
                        {name : 'doc_no', type: 'String'  },
						 
						{name : 'mastertype', type: 'String'  }, 
						
						{name : 'counts', type: 'String'  }, 
						 
						  
						
				 
			 
						
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
        height: 187,
        source: dataAdapter,
        rowsheight:20,
        showaggregates:true,
        showstatusbar:true,
        
        statusbarheight: 21,
       
        selectionmode: 'singlerow',
        pagermode: 'default',
       
        columns: [   
                
         
                     { text: 'Doc No',datafield: 'doc_no', width: '10%',hidden:true },
         			 
                     { text: 'Type', datafield: 'mastertype',  width: '75%'  ,aggregates: ['sum1'],aggregatesrenderer:rendererstring1},
 
                     { text: 'Count',datafield: 'counts', width: '25%'  ,aggregates: ['sum'],aggregatesrenderer:rendererstring},
         			 
					
					]
   
    });
    
    $("#overlay, #PleaseWait").hide();
    $('#sidelistgrid').on('rowdoubleclick', function (event) {
        
    	var rowindex2 = event.args.rowindex;
    	
 
    	 var doc_no=$('#sidelistgrid').jqxGrid('getcellvalue', rowindex2, "doc_no");
    	 var load="load";
   
    	   $("#overlay, #PleaseWait").show();
    	  $("#mainlistdiv").load("mainlistGrid.jsp?&doc_no="+doc_no+"&load="+load);
    	 
    	 	
    	 	  
    	     });
   
    if(temp4=='0')
    { 
    	$("#sidelistgrid").jqxGrid('addrow', null, {});
	}  
   

 
    
   
});


</script>
<div id="sidelistgrid"></div>