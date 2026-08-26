<%@page import="com.operations.clientrelations.clientreview.ClsClientReviewDAO" %>
<% ClsClientReviewDAO DAO=new ClsClientReviewDAO(); %>
<% String cldocno = request.getParameter("id")==null?"0":request.getParameter("id"); %> 

<script type="text/javascript">

	    <%-- var data5= '<%=DAO.quotationLoading(cldocno) %>'; --%>
	   
        $(document).ready(function () { 
        	var chk='<%=cldocno%>';
        	var data5 =null;
        	if(chk==1){
        	  data5 = [
     	        {
     	           "tstid": "COLOR","desc": "color","tstmthd": "Visual","limit": "PearlWhite","tstval": "testedval","remk": "remarks"
     	        }
     	    ];
        	}
            // prepare the data
            var source =
            {
                datatype: "json",
                datafields: [
							{name : 'tstid', type: 'string' },
     						{name : 'tstmthd', type: 'string'   },
     						{name : 'desc', type: 'string'  },
     						{name : 'tstval', type: 'string'   },
     						{name : 'remk', type: 'string'   }
     						
     					     					     						  											
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

            
            
            $("#qualityGrid").jqxGrid(
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
                	{ text: 'No.', sortable: false, filterable: false, editable: false,
					    groupable: false, draggable: false, resizable: false,datafield: '',
					    columntype: 'number', width: '5%',cellsalign: 'center', align: 'center',
					    cellsrenderer: function (row, column, value) {
					  	  return "<center><div style='margin:4px;'>" + (value + 1) + "</div></center>";
				       }  
					},	
							{ text: 'Test.id.', datafield: 'tstid' },			
							{ text: 'Description ', datafield: 'desc' },	
							{ text: 'Test Method', datafield: 'tstmthd', width: '8%' },	
							{ text: 'Limit', datafield: 'limit', width: '27%' },
							{ text: 'Test Value', datafield: 'tstval', width: '20%' },
							{ text: 'Remarks', datafield: 'remk', width: '30%' }
							
							
						 ],
            });
            
           
        });

</script>
<div id="qualityGrid"></div>
 