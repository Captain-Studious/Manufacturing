 
 
 
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
         background-color: #f0e68c;  
        
        	
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
        	   
           datas='<%=searchDAO.clientmgtreports(barchval,fromdate,todate,cldocno)%>';
           datas1='<%=searchDAO.clientsearchExcelExport(barchval,fromdate,todate,cldocno)%>'; 
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
                localdata:  datas,
                datafields:
                [
                    { name: 'date', type: 'date' },
                    { name: 'user_name', type: 'string' },
                    { name: 'refname', type: 'string' },
                    { name: 'per_mob', type: 'string' },
                    { name: 'oldcat', type: 'string' },
                    { name: 'newcat', type: 'string' },
                    { name: 'type', type: 'string' }
                    
                    
                ],
                datatype: "json",
                updaterow: function (rowid, rowdata) {
                    // synchronize with the server - send update command   
                }
            };
            
            var dataAdapter = new $.jqx.dataAdapter(source);
            // initialize jqxGrid 
            $("#listgrid").jqxGrid(
            {
                width: '100%',
				height: 500,
                source: dataAdapter,
                selectionmode: 'singlerow',
                sortable:true,
                columnsresize: true,
                filtermode:'excel',
                filterable: true,
              
                columns: [ 
					{ text: 'SL#', sortable: false, filterable: false, editable: false,
					    groupable: false, draggable: false, resizable: false,cellclassname: cellclassname,
					    datafield: 'sl', columntype: 'number', width: '5%',
					    cellsrenderer: function (row, column, value) {
					        return "<center><div style='margin:4px;'>" + (value + 1) + "</div></center>";
					    }  
					  },
					  
                  { text: 'Name',  datafield: 'refname', width: '26%' ,cellclassname: cellclassname  }, 
                  { text: 'Mobile',  datafield: 'per_mob', width: '10%' ,cellclassname: cellclassname  },
                  { text: 'Date',   datafield: 'date', width: '6%' ,cellclassname: cellclassname ,cellsformat:'dd.MM.yyyy' },
                  { text: 'User',   datafield: 'user_name', width: '14%' ,cellclassname: cellclassname  },
                  { text: 'New Category',   datafield: 'newcat', width: '12%' ,cellclassname: cellclassname  },
                  { text: 'Old Category',   datafield: 'oldcat', width: '12%' ,cellclassname: cellclassname  },
                  { text: 'Type',   datafield: 'type', width: '15%' ,cellclassname: cellclassname  },
               
                ],
				 
				
            });
            
            $("#overlay, #PleaseWait").hide();
            
        });
   
    </script>
 
 <div id="listgrid"></div>