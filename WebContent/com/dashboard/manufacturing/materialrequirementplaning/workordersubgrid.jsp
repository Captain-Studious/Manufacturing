<%@page import="javax.servlet.http.HttpServletRequest" %>
<%@page import="javax.servlet.http.HttpSession" %>   
<%@page import="com.dashboard.manufacturing.materialrequirementplaning.ClsMaterialRequirementPlaningDAO" %>
<%ClsMaterialRequirementPlaningDAO DAO=new ClsMaterialRequirementPlaningDAO(); %>        
<%   
	String id = request.getParameter("id")==null?"0":request.getParameter("id").trim(); 
	String brch = request.getParameter("brch")==null?"":request.getParameter("brch").trim();    
	String from = request.getParameter("from")==null?"":request.getParameter("from").trim(); 
	String to = request.getParameter("to")==null?"":request.getParameter("to").trim();
	String docno = request.getParameter("docno")==null?"":request.getParameter("docno").trim();
	String prdarray = request.getParameter("prdarray")==null?"":request.getParameter("prdarray").trim();
%>
<style type="text/css">
 
</style>
<script type="text/javascript">        
     var bomdata;
     var colorchk="0";
     var j="0";
   <%--   bomdata='<%=DAO.secondload(docno,id)%>';   --%>
	$(document).ready(function () {
	
        	
        	
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
						{name : 'uomid', type: 'String'  },
						{name : 'worder', type: 'number'  },
						{name : 'mainpsrno', type: 'String'  },
						{name : 'rawpsrno', type: 'String'  },
						{name : 'psrno', type: 'String'  },
						{name : 'mtypeid', type: 'String'  },
						{name : 'remarks', type: 'String'  },
						{name : 'rdocno', type: 'String'  },
						{name : 'rdtype', type: 'String'  },
						{name : 'bompsrno', type: 'String'  },
						{name : 'sorddoc', type: 'String'  },
						],  
				    localdata: bomdata,            
            
        pager: function (pagenum, pagesize, oldpagenum) {
            // callback called when a page or page size is changed.
        }
    };
  
   /*  $("#jqxwrkGrid").on("bindingcomplete", function (event) { 
    
    });
 */
    
    var dataAdapter = new $.jqx.dataAdapter(source,
    		 {
        		loadError: function (xhr, status, error) {
                alert(error);    
                }
		            
	            }		
    );
   
   
    $("#jqxwrkGrid").jqxGrid(
    {
        width: '100%',
        height: 300,
        source: dataAdapter,
        enableAnimations: true,
        filterable: true,
        sortable:true,
        columnsresize: true,
       	selectionmode: 'singlerow',                 
       	showfilterrow: true,
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
                   { text: 'Product ID', datafield: 'pid',  width: '10%', editable: false},    
  	               { text: 'Product Description', datafield: 'pdesc', editable: false},
  	               { text: 'Material Type', datafield: 'mtype',  width: '10%', editable: false},
  	               { text: 'UOM', datafield: 'uom',  width: '6%', editable: false}, 
  	               { text: 'Qty', datafield: 'worder',  width: '9%', editable: false, cellsformat: 'd2', cellsalign: 'right', align: 'right'},  
  	               { text: 'Remarks', datafield: 'remarks',  width: '15%', editable: true},
  	               { text: 'psrno', datafield: 'psrno',  width: '10%', editable: false,hidden:true}, 
  	               { text: 'uomid', datafield: 'uomid',  width: '10%', editable: false,hidden:true}, 
  	             { text: 'rdocno', datafield: 'rdocno',  width: '10%', editable: false,hidden:true}, 
  	           { text: 'rdtype', datafield: 'rdtype',  width: '10%', editable: false,hidden:true}, 
  	         { text: 'bompsrno', datafield: 'bompsrno',  width: '10%', editable: false,hidden:true}, 
  	       { text: 'sorddoc', datafield: 'sorddoc',  width: '10%', editable: false,hidden:true},
  	     { text: 'mainpsrno', datafield: 'mainpsrno',  width: '10%', editable: false,hidden:true},
  	   { text: 'bomethod', datafield: 'bomethod',  width: '10%', editable: false,hidden:true},
			   ]   		 
    });   
   // $("#jqxwrkGrid").jqxGrid('addrow', null, {});
    $("#overlay, #PleaseWait").hide();   
    $("#jqxwrkGrid").on('cellvaluechanged', function (event) 
            {
	        var datafield = event.args.datafield;
   		
	       var rowindex2 = event.args.rowindex;        
		//alert("datafield==="+datafield);
		
            }); 
    
    
});
</script>
<div id="jqxwrkGrid"></div>