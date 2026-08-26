
 
 <%@page import="com.dashboard.pricemanagement.pricemanagementreview.ClsPriceManagementReviewDAO"%>
 <% ClsPriceManagementReviewDAO searchDAO = new ClsPriceManagementReviewDAO(); 
 
    String brandid = request.getParameter("brandid")==null?"NA":request.getParameter("brandid").trim();
 
 %> 
       
 
<script type="text/javascript">
 var temp4='<%=brandid%>';
var datas;
 if(temp4!='NA')
	 {
	 
	 
	 datas='<%=searchDAO.brandmargin(brandid)%>'; 
 }
 else
	 {
	 datas;
	 }


$(document).ready(function () {
	  
    var source =
    {
        datatype: "json",
        datafields: [   //  tr_no voc_no  accname
                     
 
                        {name : 'froms', type: 'number'  },    
						 
						{name : 'tos', type: 'number'  }, 
						{name : 'permargin', type: 'number'  },
						
						  						
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
        height: 300,
        source: dataAdapter,
        
        disabled:true,
        editable:true,
      
        selectionmode: 'singlecell', 
        pagermode: 'default',
       
        columns: [   
                
         
                     { text: 'Std Cost From',datafield: 'froms', width: '35%',editable:false ,cellsformat:'d2' ,cellsalign: 'right', align:'right' },
                     { text: 'TO', datafield: 'tos',  width: '35%'   ,cellsformat:'d2' ,cellsalign: 'right', align:'right'},
                     { text: '% Of Margin', datafield: 'permargin',  width: '30%'   ,cellsformat:'d2' ,cellsalign: 'left', align:'left' },
           	  
					
					]
   
    });

    $('#sidelistgrid').on('cellvaluechanged', function (event) {
        var datafield = event.args.datafield;
    	var rowindex2 = event.args.rowindex;
    	  var rows = $('#sidelistgrid').jqxGrid('getrows');
    	    var rowlength= rows.length;
    	 
    	 
    	 if(datafield=="tos"){
    		 
    		 var from=$('#sidelistgrid').jqxGrid('getcellvalue', rowindex2, "froms");
    		 
    		 var to=$('#sidelistgrid').jqxGrid('getcellvalue', rowindex2, "tos");
    		 
    		 if(to<=from)
    			 {
    			 
    			 if(to!="")
    				 {
    				$.messager.alert('Message', 'To Amount Less Than From Amount ', function(r){
					     
				     });
    				 }
    				
    				 $('#sidelistgrid').jqxGrid('setcellvalue',rowindex2, "tos",'');
    			 }
    		 else
    			 {
    			 if(rowindex2==rowlength-1)
     	    	{  
     	    $("#sidelistgrid").jqxGrid('addrow', null, {});
     	     
     	    	} 
    			 $('#sidelistgrid').jqxGrid('setcellvalue',rowindex2+1, "froms",parseFloat(to)+.01);
    			 }	
    		 
    		 
        
    		 
    	
    	 }
 
    	 
 

    	 	  
    	     });

    
    if(temp4!='NA')
	 {
    	 
    	 $("#sidelistgrid").jqxGrid({ disabled: false});
    	 $("#sidelistgrid").jqxGrid('addrow', null, {});
    	 $('#sidelistgrid').jqxGrid('setcellvalue', 0, "froms","0.00");
	 }
    
    var rows = $('#sidelistgrid').jqxGrid('getrows');
    var rowlength= rows.length;
    if(rowlength==0)
    	{  
    $("#sidelistgrid").jqxGrid('addrow', null, {});
    
    
    
    	} 
 
    
   
});


</script>
<div id="sidelistgrid"></div>