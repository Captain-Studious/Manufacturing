 
 
 
 <%@page import="com.dashboard.pricemanagement.pricemanagementreview.ClsPriceManagementReviewDAO"%>
 <% ClsPriceManagementReviewDAO searchDAO = new ClsPriceManagementReviewDAO();
 
 
    String barchval = request.getParameter("barchval")==null?"NA":request.getParameter("barchval").trim();
	String fromdate = request.getParameter("fromdate")==null?"0":request.getParameter("fromdate").trim();
 	String todate = request.getParameter("todate")==null?"0":request.getParameter("todate").trim();
 	
 	String cldocno = request.getParameter("cldocno")==null?"0":request.getParameter("cldocno").trim();
 	
 	
 	 
 
 %>
 
  <style type="text/css">
    .redClass
    {
 /*    background-color: #ffe4e1;   */
    /*      background-color: #f0e68c;   */
    
    
      background-color: #f8e0f7;   
        
        	
    }
    
    .yellowClass
    {
        background-color: #FFFFD1;
    }
    
    .greyClass
    {
        background-color: #D8D8D8;
    }
    
    
    
              
</style>      
 
<script type="text/javascript">
		
   $(document).ready(function () {
	  
	   var datas;
            // prepare the data
           var temp='<%=barchval%>';
            
           if(temp!="NA")
        	   {
        	   
           datas='<%=searchDAO.clientsearch(barchval,fromdate,todate,cldocno)%>';
        	   }
           else
        	   {
        	   datas;
        	   }
           var cellclassname = function (row, column, value, data) {
   			if (data.cellselects==1) {
   				 
   	          return "redClass";
   	      }
   			else{
   				 
   			}
   			 
   			
   			};
            var source =
            {
                localdata: datas,
                datafields:
                [
                    { name: 'category', type: 'string' },
                    { name: 'refname', type: 'string' },
                    { name: 'per_mob', type: 'string' },
                    { name: 'address', type: 'string' },
                    { name: 'mail1', type: 'string' },
                    { name: 'cldocno', type: 'string' }
                    
                    
                ],
                datatype: "json",
                updaterow: function (rowid, rowdata) {
                    // synchronize with the server - send update command   
                }
            };
            
            var dataAdapter = new $.jqx.dataAdapter(source);
            // initialize jqxGrid 
            $("#client").jqxGrid(
            {
                width: '100%',
				height: 500,
                source: dataAdapter,
                selectionmode: 'checkbox',
              
                columns: [
					{ text: 'SL#', sortable: false, filterable: false, editable: false,
					    groupable: false, draggable: false, resizable: false,cellclassname: cellclassname,
					    datafield: 'sl', columntype: 'number', width: '4%',
					    cellsrenderer: function (row, column, value) {
					        return "<center><div style='margin:4px;'>" + (value + 1) + "</div></center>";
					    }  
					  },	
                  { text: 'Name',  datafield: 'refname', width: '25%' ,cellclassname: cellclassname  }, 
                  { text: 'Address',  datafield: 'address', width: '28%' ,cellclassname: cellclassname  },
                  { text: 'Mobile',  datafield: 'per_mob', width: '10%' ,cellclassname: cellclassname  },
                  { text: 'Email Id',   datafield: 'mail1', width: '15%' ,cellclassname: cellclassname  },
                  { text: 'Category',   datafield: 'category', width: '15%' ,cellclassname: cellclassname  },
                  
                  { text: 'cldocno',   datafield: 'cldocno', width: '15%' ,cellclassname: cellclassname,hidden:true  },
                  
                  
                  
                  { text: 'cellselect', datafield: 'cellselects',  width: '8%'  ,cellclassname: cellclassname ,hidden:true },
                ],
				 
				
            });
            
            $("#overlay, #PleaseWait").hide();		
            
            
            $('#client').on('rowunselect', function (event) {
            	var rowindex2 = event.args.rowindex;
             	
             	
            	 $('#client').jqxGrid('setcellvalue', rowindex2, "cellselects","0");
            	  
            });
            
            
            
            
            $('#client').on('rowselect', function (event) {
            	
          
             
        		 
        		 $('#updatdata1').attr("disabled", false);
        		 $('#cat').attr("disabled", false);
            
             	var rowindex2 = event.args.rowindex;
             	
             	
             	 $('#client').jqxGrid('setcellvalue', rowindex2, "cellselects","1");
            });
            
            
            
        });
   
    </script>
 
 <div id="client"></div>