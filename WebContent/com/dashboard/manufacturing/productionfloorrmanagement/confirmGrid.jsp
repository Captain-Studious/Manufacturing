<%@page import="com.operations.clientrelations.clientreview.ClsClientReviewDAO" %>
<% ClsClientReviewDAO DAO=new ClsClientReviewDAO(); %>
<% String cldocno = request.getParameter("id")==null?"0":request.getParameter("id"); %> 

<script type="text/javascript">

	    <%-- var data5= '<%=DAO.quotationLoading(cldocno) %>'; --%>
	   
        $(document).ready(function () { 
        	var chk='<%=cldocno%>';
        	//alert("chk=="+chk);
        	var data5 =null;
        	if(chk==1){
        	 data5= [
     	        {
     	           "bno": "12345","desc": "Product1","bdate": "01-02-2021","prid": "01","prcs": "ProcessA","pm": "Machine13","flsuper": "Nitin","qltyass": "Yes","rdyfl": "remarks"
     	        },
     	       {
     	           "bno": "13335","desc": "Product3","bdate": "31-12-2020","prid": "03","prcs": "ProcessC","pm": "Machine13","flsuper": "Nitin","qltyass": "No","rdyfl": "remarks"
     	        },
     	      {
    	           "bno": "14445","desc": "Product1","bdate": "31-12-2020","prid": "01","prcs": "ProcessA","pm": "Machine13","flsuper": "Nitin","qltyass": "No","rdyfl": "remarks"
    	        },
     	     {
   	           "bno": "12345","desc": "Product2","bdate": "01-02-2021","prid": "02","prcs": "ProcessB","pm": "Machine13","flsuper": "Nitin","qltyass": "No","rdyfl": "remarks"
   	        }
     	    ];
        	}
            // prepare the data
            var source =
            {
                datatype: "json",
                datafields: [
							{name : 'bno', type: 'string' },
     						{name : 'bdate', type: 'string'   },
     						{name : 'desc', type: 'string'  },
     						{name : 'prid', type: 'string'   },    						
     						{name : 'prcs', type: 'string'   },
     						{name : 'pm', type: 'string'   },
     						{name : 'flsuper', type: 'string'   },
     						{name : 'qltyass', type: 'string'   },
     						{name : 'rdyfl', type: 'string'   }
     						
     						
     					     					     						  											
                 ],
                 localdata: data5,
                
                
                pager: function (pagenum, pagesize, oldpagenum) {
                    // callback called when a page or page size is changed.
                }
                                        
            };
            
            var dataAdapter = new $.jqx.dataAdapter(source,
            		 {
                		loadError: function (xhr, status, error) {
	                    alert(error);    
	                    }
			            
		            } );

            
            
            $("#jqxcnfrmGrid").jqxGrid(
            {
            	width: '100%',
                height: 160,
                source: dataAdapter,
                columnsresize: true,
                editable: false,
                sortable: true,
                selectionmode: 'singlerow',
                localization: {thousandsSeparator: ""},

                columns: [
                	        { text: 'Batch No.', datafield: 'bno', width: '5%' },
							{ text: 'Batch Date', datafield: 'bdate', width: '5%' },			
							{ text: 'ProdID ', datafield: 'prid', width: '5%' },	
							{ text: 'Description', datafield: 'desc' },	
							{ text: 'Process', datafield: 'prcs' },
							{ text: 'P&M', datafield: 'pm', width: '8%' },
							{ text: 'FloorSupervisor', datafield: 'flsuper', width: '8%' },
							{ text: 'QualityAssurance', datafield: 'qltyass', width: '8%' },
							{ text: 'ReadytoFill', datafield: 'rdyfl', width: '8%' }
							
						 ],
            });
            
           
        });

</script>
<div id="jqxcnfrmGrid"></div>
 