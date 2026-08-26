<%@page import="javax.servlet.http.HttpServletRequest" %>
<%@page import="javax.servlet.http.HttpSession" %>          
<%   
	String id = request.getParameter("id")==null?"0":request.getParameter("id").trim(); 
	String brch = request.getParameter("brch")==null?"":request.getParameter("brch").trim();    
	String from = request.getParameter("from")==null?"":request.getParameter("from").trim(); 
	String to = request.getParameter("to")==null?"":request.getParameter("to").trim();
%>
<style type="text/css">
    .redClass
    {
        background-color: #FFEBEB;      
    }
    
    .yellowClass
    {
        background-color: #FFFFD1;  
    }
       
     .orangeClass
    {
        background-color: #FFEBC2;
    }
    
</style>
<script type="text/javascript">        
       var sapdata;

	$(document).ready(function () {
	 var rendererstring=function (aggregates){
               	var value=aggregates['sum'];
               	if(typeof(value) == "undefined"){
               		value=0.00;
               	}
               	return '<div style="float: right; margin: 4px;font-size:10px; overflow: hidden;">' + " " + '' + value + '</div>';
               }
        	
        	var rendererstring1=function (aggregates){
                var value1=aggregates['sum1'];
                return '<div style="float: right; margin: 4px;font-size:12px; overflow: hidden;">' + " Total : " + '</div>';
               }  
    // prepare the data
    var source =
    {
        datatype: "json",
        datafields: [           
	                        {name : 'vndid', type: 'String'  },
	                        {name : 'vendor', type: 'String'  },
							{name : 'bno', type: 'String'  },
							{name : 'bdate', type: 'date'  },    
							{name : 'finalcost', type: 'number'  },
							{name : 'status', type: 'String'  },
							{name : 'totalqty', type: 'String'  },
							{name : 'qaaqty', type: 'String'  },
							{name : 'qalqty', type: 'String'  },
							{name : 'lossval', type: 'String'  },
							{name : 'location', type: 'String'  },
							{name : 'pfhatch', type: 'String'  },
							{name : 'lqfhatch', type: 'String'  },
							{name : 'cfhatch', type: 'String'  },    
						],  
				    localdata: sapdata,
            
        pager: function (pagenum, pagesize, oldpagenum) {
            // callback called when a page or page size is changed.
        }
    };
  
   /*  var cellclassname = function (row, column, value, data) {
		 if (data.confirm ==1) {          
            return "yellowClass";
        }
    }; */

    
    var dataAdapter = new $.jqx.dataAdapter(source,
    		 {
        		loadError: function (xhr, status, error) {
                alert(error);    
                }
		            
	            }		
    );
   
   
    $("#jqxqapGrid").jqxGrid(
    {
        width: '100%',
        height: 480,
        source: dataAdapter,
        enableAnimations: true,
        filtermode:'excel',
        filterable: true,
        sortable:true,
        columnsresize: true,
       	selectionmode: 'singlerow',                 
       	showfilterrow: true,
        sortable:true,
        enabletooltips:true,                          
        pagermode: 'default',   
        editable:false,
        columns: [   
                  { text: 'SL#', sortable: false, filterable: false, editable: false,           
                      groupable: false, draggable: false, resizable: false,    
                      datafield: 'sl', columntype: 'number', width: '4%' ,
                      cellsrenderer: function (row, column, value) {
                          return "<center><div style='margin:4px;'>" + (value + 1) + "</div></center>";   
                      }  
                    },
               { text: 'Vendor ID', datafield: 'vndid',  width: '6%'},    
               { text: 'Vendor', datafield: 'vednor',  width: '20%'}, 
               { text: 'Batch No', datafield: 'bno',  width: '6%'}, 
               { text: 'Batch Expiry', datafield: 'bdate',  width: '6%',cellsformat:'dd.MM.yyyy' },    
               { text: 'Total Qty', datafield: 'totalqty',  width: '6%'},  
               { text: 'QA Approved Qty', datafield: 'qaaqty',  width: '7%'},                   
               { text: 'QA Loss Qty', datafield: 'qalqty',  width: '7%'},   
               { text: 'Loss Value', datafield: 'lossval',  width: '7%',cellsalign:'right',cellsformat:'d2',align:'right', aggregates: ['sum'], aggregatesrenderer:rendererstring },
	           { text: 'Status', datafield: 'status',  width: '10%'}, 
	           { text: 'Location', datafield: 'location',  width: '10%'},     
	           { text: 'Prod from hatch', datafield: 'pfhatch',  width: '7%'},   
	           { text: 'Loss qty from hatch', datafield: 'lqfhatch',  width: '7%'},                        
	           { text: 'Cost from incubation', datafield: 'cfhatch',  width: '7%'},           
	           { text: 'Final Cost', datafield: 'finalcost',  width: '7%',cellsalign:'right',cellsformat:'d2',align:'right', aggregates: ['sum'], aggregatesrenderer:rendererstring },
			   ]  
    });     
    $("#overlay, #PleaseWait").hide();
     /* $('#jqxqapGrid').on('rowdoubleclick', function (event) {                 
            var rowindex2 = event.args.rowindex;                      
			document.getElementById("hidbrhid").value=$('#jqxqapGrid').jqxGrid('getcellvalue', rowindex2, "brhid");
			document.getElementById("hidvocno").value=$('#jqxqapGrid').jqxGrid('getcellvalue', rowindex2, "voc_no");     
            $('.textpanel p').text('Doc No '+$('#jqxqapGrid').jqxGrid('getcellvalue',rowindex2,'voc_no')+' - '+$('#jqxqapGrid').jqxGrid('getcellvalue', rowindex2, "tenant"));
        }); */    
});
</script>
<div id="jqxqapGrid"></div>