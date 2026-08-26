<%@page import="com.operations.clientrelations.clientreview.ClsClientReviewDAO" %>
<% ClsClientReviewDAO DAO=new ClsClientReviewDAO(); %>
<% String cldocno = request.getParameter("cldocno")==null?"0":request.getParameter("cldocno"); %> 

<script type="text/javascript">

	    <%-- var data5= '<%=DAO.quotationLoading(cldocno) %>'; --%>
	    var data5 = [
	        {
	           "rmid": "PURE WATER","desc": "PURE WATER","qty": "540.00","uom": "LTR","std": "54.00","prcs": "PRE-BLEND1","note": "Water Phase"
	        }
	    ];
        $(document).ready(function () { 	

            // prepare the data
            var source =
            {
                datatype: "json",
                datafields: [
							{name : 'rmid', type: 'string' },
     						{name : 'uom', type: 'string'   },
     						{name : 'desc', type: 'string'  },
     						{name : 'note', type: 'string'   },
     						{name : 'prcs', type: 'string' },
     						{name : 'qty', type: 'number' },
     						{name : 'std', type: 'number' }
     					     					     						  											
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

            
            
            $("#rawmaterialsGrid").jqxGrid(
            {
            	width: '100%',
                height: 250,
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
							{ text: 'RM.id.', datafield: 'rmid', width: '15%' },			
							{ text: 'Description ', datafield: 'desc', width: '15%' },	
							{ text: 'Quantity', datafield: 'qty', width: '8%',cellsformat: 'd2',cellsalign:'right',align:'right' },	
							{ text: 'UOM', datafield: 'uom', width: '27%' },	
							{ text: 'Std%', datafield: 'std', width: '8%',cellsformat: 'd2',cellsalign:'right',align:'right' },	
							{ text: 'Process', datafield: 'prcs', width: '6%' },	
							{ text: 'Note', datafield: 'note' }
							
						 ],
            });
            
           
        });

</script>
<div id="rawmaterialsGrid"></div>
 