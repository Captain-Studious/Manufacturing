  
<%--   <jsp:include page="../../../../includes.jsp"></jsp:include>   --%>

<%@page import="javax.servlet.http.HttpServletRequest" %>
<%@page import="javax.servlet.http.HttpSession" %>
 <%

 
 
 String aa=request.getParameter("aa")==null?"0":request.getParameter("aa");

 
 
 String psrno=request.getParameter("psrno")==null?"0":request.getParameter("psrno");

 String unit=request.getParameter("unit")==null?"0":request.getParameter("unit");
 
 String trno=request.getParameter("temptrno")==null?"0":request.getParameter("temptrno");
 String tempchk=request.getParameter("tempchk")==null?"0":request.getParameter("tempchk");
 
 System.out.println("==aa=="+aa);
 
%>


 
<%@page import="com.sales.InventoryTransfer.materialissuenote.ClsMaterialIssueNoteDAO"%>
<% ClsMaterialIssueNoteDAO searchDAO = new ClsMaterialIssueNoteDAO(); %> 
 
 
 
 
<script type="text/javascript">



            	
        $(document).ready(function () { 	
        	var Reqmaster11;

        	var temps='<%=aa%>';

        	if(temps=='YES')
        		{
        		Reqmaster11= '<%=searchDAO.searchbatch(session,psrno,unit,aa,tempchk,trno) %>'; 
        		}
        	else
        		{
        		Reqmaster11; 
        		}

        	 
 
                     
            // prepare the data
            var source =
            {
                datatype: "json",
                datafields: [
                                
                             {name : 'qty', type: 'number'},
                             {name : 'setqty', type: 'number'},
                             {name : 'foc', type: 'number'}, 
     		 				{name : 'stkqty', type: 'number'},
     						{name : 'exp_date', type: 'string'  },
     						{name : 'stockid', type: 'int'   },
     						{name : 'cost_price', type: 'number'  },
     						{name : 'batch_no', type: 'string'  },
     						 
     						{name : 'chk', type: 'bool'  },
                 ],
                 localdata: Reqmaster11,
                
                
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

            
            
            $("#batgrid").jqxGrid(
            {
                width: '100%',
                height: 350,
                source: dataAdapter,
                editable: true,
                selectionmode: 'singlecell',
                pagermode: 'default',
             
                
          
          

                       
                columns: [      
                            { text: ' ', datafield: 'chk',columntype: 'checkbox',  width: '12%',cellsalign: 'center', align: 'center'},
                            
                          
                            { text: 'Qty', datafield: 'qty', width: '15%' ,cellsformat:'d2' },	
                            { text: 'FOC', datafield: 'foc', width: '15%' ,cellsformat:'d2' },	
							{ text: 'stkqty', datafield: 'stkqty', width: '15%'  ,cellsformat:'d2'  },
							{ text: 'setqty', datafield: 'setqty', width: '15%'  ,cellsformat:'d2'  },
							{ text: 'stockid', datafield: 'stockid', width: '10%', editable: false  },
							{ text: 'Cost Price', datafield: 'cost_price', width: '20%' , editable: false,cellsalign: 'right', align: 'right',cellsformat:'d2'  }	,
							{ text: 'Batch No', datafield: 'batch_no', width: '35%' , editable: false}	,
							 
							{ text: 'Expiry Date', datafield: 'exp_date', width: '23%' , editable: false},
						
											
							
							
			              ]
               
            });
          
      
   
        });
    </script>
    <div id=batgrid></div>