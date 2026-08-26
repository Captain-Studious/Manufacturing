
 <%@page import="com.dashboard.procurment.productsuitabilty.ClsproductSuitabiltyDAO"%>
 <% ClsproductSuitabiltyDAO searchDAO = new ClsproductSuitabiltyDAO(); 
 
    String doc_no = request.getParameter("doc_no")==null?"NA":request.getParameter("doc_no").trim();
	 
 %> 
       
 
<script type="text/javascript">
 var temp4='<%=doc_no%>';
var datas;
 
 if(temp4!='NA')
{ 
	
	 datas='<%=searchDAO.listgridsearch(doc_no)%>'; 
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
                     
 
                         
						 
						{name : 'types', type: 'String'  }, 
						
						{name : 'counts', type: 'String'  }, 
						{name : 'suitstatus', type: 'String'  }, 
						  
						
				 
			 
						
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
                
         
                   
         			 
                     { text: 'Type', datafield: 'types',  width: '75%'  ,aggregates: ['sum1'],aggregatesrenderer:rendererstring1},
 
                     { text: 'Count',datafield: 'counts', width: '25%'  ,aggregates: ['sum'],aggregatesrenderer:rendererstring},
                     { text: 'suitstatus',datafield: 'suitstatus', width: '25%'  ,hidden:true},
                     
					]
   
    });
    
    $("#overlay, #PleaseWait").hide();
    $('#sidelistgrid').on('rowdoubleclick', function (event) {
        
   	 var rowindex2= event.args.rowindex;
    	var suitstatus= $('#sidelistgrid').jqxGrid('getcellvalue', rowindex2, "suitstatus");
    	 var doc_no=document.getElementById("cmbmastertype").value;
    		 
    		 var psrno=document.getElementById("psrno").value ;
    		 
    		 
    		 
    		 
       	  $("#suitlistgrid").jqxGrid('clear');
		  $("#mainlistgrid").jqxGrid('clear');
		  
		  document.getElementById("name1").innerText="";
	 	 document.getElementById("name2").innerText="";
	  
	 	 document.getElementById("productid").innerText="";
	 	 document.getElementById("productname").innerText="";
    		 
    	 var load="load";
   
    	   $("#overlay, #PleaseWait").show();
    	  $("#mainlistdiv").load("mainlistGrid.jsp?&doc_no="+doc_no+"&load="+load+"&psrno="+psrno+"&suitstatus="+suitstatus);
    	 
    	 	
    	 	  
    	     });
   
    if(temp4=='0')
    { 
    	$("#sidelistgrid").jqxGrid('addrow', null, {});
	}  
   

 
    
   
});


</script>
<div id="sidelistgrid"></div>