<%@page import="javax.servlet.http.HttpServletRequest" %>
<%@page import="javax.servlet.http.HttpSession" %>   
<%@page import="com.dashboard.manufacturing.salesordermanagement.ClsSalesOrderManagementDAO" %>
<%ClsSalesOrderManagementDAO DAO=new ClsSalesOrderManagementDAO(); %>            
<%   
	String id = request.getParameter("id")==null?"0":request.getParameter("id").trim(); 
	String brch = request.getParameter("brch")==null?"":request.getParameter("brch").trim();    
	String maindocno = request.getParameter("maindocno")==null?"":request.getParameter("maindocno").trim(); 
	String docno = request.getParameter("docno")==null?"":request.getParameter("docno").trim();
	String stkdoc = request.getParameter("stkdoc")==null?"":request.getParameter("stkdoc").trim();
	String type = request.getParameter("dtype")==null?"":request.getParameter("dtype").trim();
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
     var trddata;
     trddata='<%=DAO.thirdload(docno,maindocno,id,stkdoc,type)%>';      
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
						{name : 'orderno', type: 'String'  },
						{name : 'refname', type: 'String'  },
						{name : 'qty', type: 'number'  },
						{name : 'resqty', type: 'number'  },
						{name : 'toberesqty', type: 'number'  },
						{name : 'oldbalqty', type: 'number'  }, 
						{name : 'psrno', type: 'String'  },
						{name : 'prdid', type: 'String'  },
						{name : 'brhid', type: 'String'  },
						{name : 'specno', type: 'String'  },
						{name : 'rdocno', type: 'String'  },
						{name : 'unitdoc', type: 'String'  },
						{name : 'tr_no', type: 'String'  }, 
						{name : 'voc', type: 'String'  }, 
						{name : 'collqty', type: 'String'  },
						{name : 'stockid', type: 'String'  },
						],  
				    localdata: trddata,            
            
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
   
   
    $("#jqxthirdGrid").jqxGrid(
    {
        width: '99%',
        height: 130,
        source: dataAdapter,
        enableAnimations: true,
        filterable: true,
        sortable:true,
        columnsresize: true,
       	selectionmode: 'singlecell',                 
       	//showfilterrow: true,
        sortable:true,
        enabletooltips:true,                          
        pagermode: 'default',   
        editable:true,
        columns: [   
                  { text: 'SL#', sortable: false, filterable: false, editable: false,       
                      groupable: false, draggable: false, resizable: false,    
                      datafield: 'sl', columntype: 'number', width: '4%' ,
                      cellsrenderer: function (row, column, value) {
                          return "<center><div style='margin:4px;'>" + (value + 1) + "</div></center>";   
                      }  
                    },
  	               { text: 'Order No', datafield: 'orderno',  width: '6%', editable: false},
  	               { text: 'Client', datafield: 'refname', editable: false},
  	               { text: 'Qty', datafield: 'qty',  width: '6%', editable: false, cellsformat: 'd3', cellsalign: 'right', align: 'right'}, 
	               { text: 'To Be Res. Qty', datafield: 'toberesqty',  width: '6%', editable: true, cellsformat: 'd3', cellsalign: 'right', align: 'right'},
	               { text: 'Res. Qty', datafield: 'resqty',  width: '6%', editable: false, cellsformat: 'd3', cellsalign: 'right', align: 'right'},
	               { text: 'Bal. Qty', datafield: 'oldbalqty',  width: '6%', editable: false, cellsformat: 'd3', cellsalign: 'right', align: 'right'},
	               { text: 'psrno', datafield: 'psrno',  width: '6%', editable: true,hidden:true},
	               { text: 'brhid', datafield: 'brhid',  width: '6%', editable: true,hidden:true},
	               { text: 'specno', datafield: 'specno',  width: '6%', editable: true,hidden:true},
	               { text: 'prdid', datafield: 'prdid',  width: '6%', editable: true,hidden:true},
	               { text: 'rdocno', datafield: 'rdocno',  width: '6%', editable: true,hidden:true},
	               { text: 'unitdoc', datafield: 'unitdoc',  width: '6%', editable: true,hidden:true},
	               { text: 'tr_no', datafield: 'tr_no',  width: '6%',hidden:true},
  	               { text: 'voc', datafield: 'voc',  width: '6%',hidden:true},
  	               { text: 'Collqty', datafield: 'collqty',  width: '15%',hidden:true}, 
  	               { text: 'Stockid', datafield: 'stockid',  width: '15%',hidden:true},
			   ]   		 
    });     
    $("#overlay, #PleaseWait").hide();   
      $('#jqxthirdGrid').on('celldoubleclick', function (event) {                  
            var rowindex2 = event.args.rowindex;                      
            document.getElementById("hidrow").value=rowindex2;
			document.getElementById("hidgispsrno").value=$('#jqxthirdGrid').jqxGrid('getcellvalue', rowindex2, "psrno");
			document.getElementById("hidgisunit").value=$('#jqxthirdGrid').jqxGrid('getcellvalue', rowindex2, "unitdoc");
			document.getElementById("hidbrhid").value=$('#jqxthirdGrid').jqxGrid('getcellvalue', rowindex2, "brhid");
        });
        
        $("#jqxthirdGrid").on('cellvaluechanged', function (event) 
                {
 	        var datafield = event.args.datafield;
       		
 	       var rowindex2 = event.args.rowindex;        
   		//alert("datafield==="+datafield);
   		 if(datafield=='toberesqty')
		 {
   			// alert("rowindex2==="+rowindex2);
		var res= $('#jqxthirdGrid').jqxGrid('getcellvalue', rowindex2, "toberesqty");
		var bal= $('#jqxthirdGrid').jqxGrid('getcellvalue', rowindex2, "oldbalqty");
		if(parseFloat(res)>parseFloat(bal)){
			$.messager.alert('Message', '  Reserve Qty Cannot be Greater than Qty  ');
			$('#jqxthirdGrid').jqxGrid('setcellvalue', rowindex2, "toberesqty",0);
		}
		else{		
		var nwbal=parseFloat(bal)-parseFloat(res);
		//alert("nwbal==="+nwbal);
		//$('#jqxthirdGrid').jqxGrid('setcellvalue', rowindex2, "balqty",0);
		$('#jqxthirdGrid').jqxGrid('setcellvalue', rowindex2, "oldbalqty",nwbal);
		} 
		 }
                });
});
</script>
<div id="jqxthirdGrid"></div>