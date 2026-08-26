
 
 
 <%@page import="com.dashboard.pricemanagement.pricemanagementreview.ClsPriceManagementReviewDAO"%>
 <% ClsPriceManagementReviewDAO searchDAO = new ClsPriceManagementReviewDAO();

 
  
 String accountname = request.getParameter("accountname")==null?"0":request.getParameter("accountname");
 String mob = request.getParameter("mob")==null?"0":request.getParameter("mob");
  

 
 String check = request.getParameter("check")==null?"0":request.getParameter("check");
%> 

<script type="text/javascript">
        
        

   var data2='<%=searchDAO.clientsudeseaarch(accountname,mob,check) %>'; 

        $(document).ready(function () { 
                     
            // prepare the data
            var source =
            {
                datatype: "json",
                datafields: [
                            {name : 'cldocno', type: 'int'   },
     						{name : 'refname', type: 'string'   },
     			 
     						{name : 'mobile', type: 'number'  },
     						
     						
                        ],
                		localdata: data2, 
                
                pager: function (pagenum, pagesize, oldpagenum) {
                    // callback called when a page or page size is changed.
                }
                                        
            };
            
            var dataAdapter = new $.jqx.dataAdapter(source);
            
            $("#jqxAccountsSearch").jqxGrid(
            {
                width: '100%',
                height: 350,
                source: dataAdapter,
                selectionmode: 'singlerow',
                localization: {thousandsSeparator: ""},
                
                columns: [
                            { text: 'Doc No', hidden : true, datafield: 'cldocno', width: '5%' },
							{ text: 'Name', datafield: 'refname', width: '60%' },
							 
							{ text: 'MOB', datafield: 'mobile', width: '40%' },
			 
						]
            });
            
             $('#jqxAccountsSearch').on('rowdoubleclick', function (event) {
                var rowindex1 = event.args.rowindex;
                
             
                document.getElementById("cldocno").value = $('#jqxAccountsSearch').jqxGrid('getcellvalue', rowindex1, "cldocno");
            
                 document.getElementById("clientname").value = $('#jqxAccountsSearch').jqxGrid('getcellvalue', rowindex1, "refname");
              
              $('#accountSearchwindow').jqxWindow('close');  
              
            });  
        });
    </script>
    <div id="jqxAccountsSearch"></div>
    
    
    
    
    
    
    
    
    
    
    
    
    