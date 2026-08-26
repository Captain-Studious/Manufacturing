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
       var shpdata;

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
						{name : 'tqty', type: 'String'  },
						{name : 'cost', type: 'String'  },
						{name : 'tweight', type: 'String'  },
						{name : 'bno', type: 'String'  },
						{name : 'exdate', type: 'date'  },    
						{name : 'sku', type: 'String'  },
						{name : 'status', type: 'String'  }, 
						{name : 'bproducts', type: 'String'  },
						{name : 'wastage', type: 'String'  },
						{name : 'fqty', type: 'String'  },
						{name : 'fcost', type: 'number'  },
						{name : 'pbatch', type: 'String'  },
						{name : 'tweight', type: 'number'  },
						],          
				    localdata: shpdata,
            
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
   
   
    $("#jqxshpGrid").jqxGrid(
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
               { text: 'Batch No', datafield: 'bno',  width: '6%'}, 
               { text: 'Total Qty', datafield: 'tqty',  width: '6%'}, 
               { text: 'Cost', datafield: 'cost',  width: '6%'},        
               { text: 'Total in Weight', datafield: 'tweight',  width: '6%',cellsalign:'right',cellsformat:'d2',align:'right', aggregates: ['sum'], aggregatesrenderer:rendererstring }, 
               { text: 'Status', datafield: 'status',  width: '10%'}, 
               { text: 'Sku', datafield: 'sku',  width: '6%'}, 
               { text: 'Bi Products', datafield: 'bproducts'},        
               { text: 'Wastage', datafield: 'wastage',  width: '8%'},         
               { text: 'Final Qty', datafield: 'fqty',  width: '6%'},       
               { text: 'Final Cost', datafield: 'fcost',  width: '6%',cellsalign:'right',cellsformat:'d2',align:'right', aggregates: ['sum'], aggregatesrenderer:rendererstring },  
               { text: 'Production Batch', datafield: 'pbatch',  width: '6%'},    
	           { text: 'Expiry Date', datafield: 'exdate',  width: '6%',cellsformat:'dd.MM.yyyy'},   
	            
			   ]   		 
    });     
    $("#overlay, #PleaseWait").hide();
     /* $('#jqxshpGrid').on('rowdoubleclick', function (event) {                 
            var rowindex2 = event.args.rowindex;                      
			document.getElementById("hidbrhid").value=$('#jqxshpGrid').jqxGrid('getcellvalue', rowindex2, "brhid");
			document.getElementById("hidvocno").value=$('#jqxshpGrid').jqxGrid('getcellvalue', rowindex2, "voc_no");     
            $('.textpanel p').text('Doc No '+$('#jqxshpGrid').jqxGrid('getcellvalue',rowindex2,'voc_no')+' - '+$('#jqxshpGrid').jqxGrid('getcellvalue', rowindex2, "tenant"));
        }); */    
});
</script>
<div id="jqxshpGrid"></div>      