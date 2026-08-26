<%@page import="javax.servlet.http.HttpServletRequest" %>
<%@page import="javax.servlet.http.HttpSession" %>    
<%@page import="com.dashboard.manufacturing.salesordermanagement.ClsSalesOrderManagementDAO" %>
<%ClsSalesOrderManagementDAO DAO=new ClsSalesOrderManagementDAO(); %>           
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
     var pdtdata;
     pdtdata='<%=DAO.productload(id)%>';              
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
							{name : 'otype', type: 'String'  },
							{name : 'orderno', type: 'String'  },
							{name : 'refname', type: 'String'  },
							{name : 'contact', type: 'String'  },
							{name : 'tele', type: 'String'  },
							{name : 'mail', type: 'String'  },
							{name : 'orderref', type: 'String'  },
							{name : 'expdate', type: 'date'  },
							{name : 'ovalue', type: 'number'  },       
							{name : 'nitem', type: 'String'  },
							{name : 'priority', type: 'String'  },
							{name : 'pdate', type: 'date'  },
							{name : 'salesman', type: 'String'  },
							{name : 'curstatus', type: 'String'  },
							{name : 'doc_no', type: 'String'  },
							{name : 'tr_no', type: 'String'  },
							{name : 'promdate', type: 'date'  },
							{name : 'priority', type: 'String'  },
						],  
				    localdata: pdtdata,            
            
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
   
   
    $("#jqxpdpGrid").jqxGrid(   
    {
        width: '100%',
        height: 160,
        source: dataAdapter,
        enableAnimations: true,
        filterable: true,
        sortable:true,
        columnsresize: true,
       	selectionmode: 'checkbox',                       
       	//showfilterrow: true,
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
                   { text: 'Order Type', datafield: 'otype',  width: '6%'},
                   { text: 'Order No', datafield: 'orderno',  width: '6%'},
                   { text: 'Client', datafield: 'refname'},
                   { text: 'Contact', datafield: 'contact',  width: '10%'},   
	               { text: 'Telephone', datafield: 'tele',  width: '6%'},
	               { text: 'Email', datafield: 'mail',  width: '6%'},
	               { text: 'Order Reference', datafield: 'orderref',  width: '6%'},
	               { text: 'Exp. Del. Date', datafield: 'expdate',  width: '5%',cellsformat:'dd.MM.yyyy' },
	               { text: 'Order Value', datafield: 'ovalue',  width: '6%'},
	               { text: 'No of Item', datafield: 'nitem',  width: '6%'},
	               { text: 'Priority', datafield: 'priority',  width: '5%'},   
	               { text: 'Promise Date', datafield: 'promdate',  width: '5%',cellsformat:'dd.MM.yyyy'},
	               { text: 'Salesman', datafield: 'salesman',  width: '6%'},
	               { text: 'Cur. Status', datafield: 'curstatus',  width: '6%'},      
	                    
			   ]   		 
    });     
    $("#overlay, #PleaseWait").hide();
     /* $('#jqxpdpGrid').on('rowdoubleclick', function (event) {                 
            var rowindex2 = event.args.rowindex;                      
			document.getElementById("hidbrhid").value=$('#jqxpdpGrid').jqxGrid('getcellvalue', rowindex2, "brhid");
			document.getElementById("hidvocno").value=$('#jqxpdpGrid').jqxGrid('getcellvalue', rowindex2, "voc_no");     
            $('.textpanel p').text('Doc No '+$('#jqxpdpGrid').jqxGrid('getcellvalue',rowindex2,'voc_no')+' - '+$('#jqxpdpGrid').jqxGrid('getcellvalue', rowindex2, "tenant"));
        }); */    
});
</script>
<div id="jqxpdpGrid"></div>