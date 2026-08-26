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
       var vdata;

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
							{name : 'cost', type: 'number'  },
							{name : 'date', type: 'date'  },
							{name : 'bno', type: 'String'  },
						],  
				    localdata: vdata,
            
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
   
   
    $("#jqxvaccGrid").jqxGrid(
    {
        width: '100%',
        height: 250,
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
                    { text: 'Batch No', datafield: 'bno',  width: '29%'},              
                    { text: 'Date', datafield: 'date',cellsformat:'dd.MM.yyyy',  width: '33%'},     
                    { text: 'Cost', datafield: 'cost', cellsalign:'right',cellsformat:'d2',align:'right', aggregates: ['sum'], aggregatesrenderer:rendererstring },                   
                    ]          
    });     
    $("#overlay, #PleaseWait").hide();   
     /* $('#jqxvaccGrid').on('rowdoubleclick', function (event) {                 
            var rowindex2 = event.args.rowindex;                      
			document.getElementById("hidbrhid").value=$('#jqxvaccGrid').jqxGrid('getcellvalue', rowindex2, "brhid");
			document.getElementById("hidvocno").value=$('#jqxvaccGrid').jqxGrid('getcellvalue', rowindex2, "voc_no");     
            $('.textpanel p').text('Doc No '+$('#jqxvaccGrid').jqxGrid('getcellvalue',rowindex2,'voc_no')+' - '+$('#jqxvaccGrid').jqxGrid('getcellvalue', rowindex2, "tenant"));
        }); */    
});
</script>
<div id="jqxvaccGrid"></div>   