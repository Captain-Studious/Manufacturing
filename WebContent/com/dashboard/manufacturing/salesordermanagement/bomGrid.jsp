<%@page import="javax.servlet.http.HttpServletRequest" %>
<%@page import="javax.servlet.http.HttpSession" %> 
<%@page import="com.dashboard.manufacturing.salesordermanagement.ClsSalesOrderManagementDAO" %>
<%ClsSalesOrderManagementDAO DAO=new ClsSalesOrderManagementDAO(); %>              
<%   
	String id = request.getParameter("id")==null?"0":request.getParameter("id").trim(); 
	String brch = request.getParameter("brch")==null?"":request.getParameter("brch").trim();    
	String from = request.getParameter("from")==null?"":request.getParameter("from").trim(); 
	String to = request.getParameter("to")==null?"":request.getParameter("to").trim();
	String docno = request.getParameter("docno")==null?"":request.getParameter("docno").trim();
	String stkdoc = request.getParameter("stkdoc")==null?"":request.getParameter("stkdoc").trim();
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
     var bomdata;
     bomdata='<%=DAO.secondload(docno,id,stkdoc)%>';      
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
						{name : 'mtype', type: 'String'  },
						{name : 'pid', type: 'String'  },
						{name : 'qty', type: 'number'  },
						{name : 'pdesc', type: 'String'  },
						{name : 'uom', type: 'String'  },
						{name : 'stock', type: 'number'  },
						{name : 'resqty', type: 'number'  },
						{name : 'balqty', type: 'number'  },
						{name : 'prdid', type: 'String'  }, 
						{name : 'tr_no', type: 'String'  }, 
						{name : 'voc', type: 'String'  },
						{name : 'dtype', type: 'String'  },
						{name : 'descptn', type: 'String'  },
						],  
				    localdata: bomdata,            
            
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
   
   
    $("#jqxbomGrid").jqxGrid(
    {
        width: '100%',
        height: 130,
        source: dataAdapter,
        enableAnimations: true,
        filterable: true,
        sortable:true,
        columnsresize: true,
       	selectionmode: 'singlerow',                      
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
                   { text: 'Product ID', datafield: 'pid',  width: '6%'},    
  	               { text: 'Product Description', datafield: 'pdesc',  width: '25%'},
  	               { text: 'Description', datafield: 'descptn',  width: '25%'},
  	               { text: 'Material Type', datafield: 'mtype',  width: '10%'},
  	               { text: 'UOM', datafield: 'uom',  width: '6%'}, 
  	               { text: 'Qty', datafield: 'qty',  width: '6%',cellsformat:'d3', cellsalign: 'right', align: 'right'}, 
  	               { text: 'Stock', datafield: 'stock',  width: '6%',cellsformat:'d3', cellsalign: 'right', align: 'right'}, 
  	               { text: 'Res. Qty', datafield: 'resqty',  width: '6%',cellsformat:'d3', cellsalign: 'right', align: 'right'}, 
  	               { text: 'Bal. Qty', datafield: 'balqty',  width: '6%',cellsformat:'d3', cellsalign: 'right', align: 'right'},
  	               
  	               { text: 'Prd id', datafield: 'prdid',  width: '6%',hidden:true},
  	               { text: 'tr_no', datafield: 'tr_no',  width: '6%',hidden:true},
  	               { text: 'voc', datafield: 'voc',  width: '6%',hidden:true},
  	               { text: 'dtype', datafield: 'dtype',  width: '6%',hidden:true},
			   ]   		 
    });     
    $("#overlay, #PleaseWait").hide();   
    $('#jqxbomGrid').on('rowdoubleclick', function (event) {   
    	
  	    $('#jqxthirdGrid').jqxGrid('clear');
            var rowindex2 = event.args.rowindex;                      
			var docno=$('#jqxbomGrid').jqxGrid('getcellvalue', rowindex2, "prdid");  
			var type=$('#jqxbomGrid').jqxGrid('getcellvalue', rowindex2, "dtype");
			document.getElementById("hidtype").value=$('#jqxbomGrid').jqxGrid('getcellvalue', rowindex2, "dtype");
			document.getElementById("hidprdid").value=$('#jqxbomGrid').jqxGrid('getcellvalue', rowindex2, "prdid");
			$('#thirddiv').load("thirdGrid.jsp?docno="+docno+"&maindocno="+$('#srvdetmtrno').val()+"&stkdoc="+$('#srvdetmtrnonw').val()+"&dtype="+type+"&id="+1); 
			
     });   
});
</script>
<div id="jqxbomGrid"></div>