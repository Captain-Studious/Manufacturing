<%@page import="javax.servlet.http.HttpServletRequest" %>  
<%@page import="javax.servlet.http.HttpSession" %> 
<%@page import="com.dashboard.manufacturing.materialrequirementplaning.ClsMaterialRequirementPlaningDAO" %>
<%ClsMaterialRequirementPlaningDAO DAO=new ClsMaterialRequirementPlaningDAO(); %>                         
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
        	            {name : 'sorddoc', type: 'String'  },
        	            {name : 'deptid', type: 'String'  },
                        {name : 'otype', type: 'String'  },
						{name : 'orderno', type: 'String'  },
						{name : 'orderdoc', type: 'String'  },
						{name : 'refname', type: 'String'  },
						{name : 'date', type: 'date'  },
						{name : 'promdate', type: 'date'  },
						{name : 'pstatus', type: 'String'  },
						{name : 'workorder', type: 'String'  },
						{name : 'status', type: 'String'  },
						{name : 'expdate', type: 'date'  },
						{name : 'ovalue', type: 'number'  },       
						{name : 'nitem', type: 'String'  },
						{name : 'pdate', type: 'date'  },
						{name : 'doc_no', type: 'String'  },
						{name : 'tr_no', type: 'String'  },
						{name : 'mtype', type: 'String'  },
						{name : 'pid', type: 'String'  },
						{name : 'qty', type: 'number'  },
						{name : 'pdesc', type: 'String'  },
						{name : 'uom', type: 'String'  },
						{name : 'prdid', type: 'String'  },
						{name : 'balqty', type: 'number'  },
						{name : 'psrno', type: 'String'  },
						{name : 'brandname', type: 'String'  },
						{name : 'category', type: 'String'  },
						{name : 'subcategory', type: 'String'  },
						{name : 'chkpsrno', type: 'String'  },
						{name : 'descptn', type: 'String'  },
						{name : 'mrpno', type: 'String'  },
						{name : 'ltstqty', type: 'String'  },
						{name : 'ltstpsrno', type: 'String'  },
						{name : 'work', type: 'String'  },
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
        height: 250,
        source: dataAdapter,
        enableAnimations: true,
        filterable: true,
        sortable:true,
        columnsresize: true,
       	selectionmode: 'checkbox',                       
       	showfilterrow: true,
        sortable:true,
        enabletooltips:true,                          
        pagermode: 'default',   
        editable:false,
        columns: [   
                  { text: 'SL#', sortable: false, filterable: false, editable: false,       
                      groupable: false, draggable: false, resizable: false,    
                      datafield: 'sl', columntype: 'number', width: '3%' ,
                      cellsrenderer: function (row, column, value) {
                          return "<center><div style='margin:4px;'>" + (value + 1) + "</div></center>";   
                      }  
                    },
                   { text: 'Type', datafield: 'otype',  width: '3%'},   
	               { text: 'Order No', datafield: 'orderno',  width: '3%'},
	               { text: 'Work No', datafield: 'work',  width: '5%'},
	               { text: 'Date', datafield: 'date',  width: '5%',cellsformat:'dd.MM.yyyy' },
	                      
	               { text: 'Exp del Date', datafield: 'promdate',  width: '5%',cellsformat:'dd.MM.yyyy' },
	               { text: 'Product ID', datafield: 'pid',  width: '6%'},    
  	               { text: 'Product Description', datafield: 'pdesc'},
  	               { text: 'Description', datafield: 'descptn'},
  	               { text: 'Brand', datafield: 'brandname',  width: '6%'},
  	               { text: 'Category', datafield: 'category',  width: '6%'},
  	               { text: 'Sub Category', datafield: 'subcategory',  width: '6%'},
  	               { text: 'UOM', datafield: 'uom',  width: '3%'}, 
  	               { text: 'Qty', datafield: 'qty',  width: '4%', cellsformat: 'd2', cellsalign: 'right', align: 'right'}, 
  	               { text: 'Bal. Qty', datafield: 'balqty',  width: '4%', cellsformat: 'd2', cellsalign: 'right', align: 'right'},
  	               { text: 'Client', datafield: 'refname'},
  	             
  	             { text: 'Psrno', datafield: 'psrno',  width: '5%',hidden:true},
  	           { text: 'orderdoc', datafield: 'orderdoc',  width: '5%',hidden:true},
  	         { text: 'mrpno', datafield: 'mrpno',  width: '5%',hidden:true},  	         
  	       { text: 'ltstpsrno', datafield: 'ltstpsrno',  width: '5%',hidden:true},
	         { text: 'ltstqty', datafield: 'ltstqty',  width: '5%',hidden:true},
	         { text: 'deptid', datafield: 'deptid',  width: '5%',hidden:true},
	         { text: 'sorddoc', datafield: 'sorddoc',  width: '5%',hidden:true},
	              /*  { text: 'Order Value', datafield: 'ovalue',  width: '6%'},
	               { text: 'No of Item', datafield: 'nitem',  width: '6%'},
	               { text: 'Planned Status', datafield: 'pstatus',  width: '5%',hidden:true},   
	               { text: 'Planned Date', datafield: 'pdate',  width: '5%',cellsformat:'dd.MM.yyyy'},
	               { text: 'Work Orders', datafield: 'workorder',  width: '6%'},
	               { text: 'Status', datafield: 'status',  width: '6%'}, */
	                    
			   ]   		 
    });     
    $("#overlay, #PleaseWait").hide();
       $('#jqxpdpGrid').on('rowselect', function (event) {                 
            var rowindex2 = event.args.rowindex;                      
			var workid=$('#jqxpdpGrid').jqxGrid('getcellvalue', rowindex2, "work");
			$('#hidpdpworkno').val(workid);
			//$('#bomdiv').load("bomGrid.jsp?docno="+prodid+"&id="+1);
			//$('#processdiv').load("processGrid.jsp?docno="+prodid+"&id="+1);
        });    
});
</script>
<div id="jqxpdpGrid"></div>