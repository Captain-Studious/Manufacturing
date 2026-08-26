<%@page import="javax.servlet.http.HttpServletRequest" %>
<%@page import="javax.servlet.http.HttpSession" %>
<%@page import="com.dashboard.manufacturing.productplaning.ClsproductplaningDAO" %>
<%ClsproductplaningDAO DAO=new ClsproductplaningDAO(); %>           
<%   
	String id = request.getParameter("id")==null?"0":request.getParameter("id").trim(); 
	String brch = request.getParameter("brch")==null?"":request.getParameter("brch").trim();    
	String from = request.getParameter("from")==null?"":request.getParameter("from").trim(); 
	String doc = request.getParameter("docno")==null?"":request.getParameter("docno").trim();
	String wqty = request.getParameter("wqty")==null?"":request.getParameter("wqty").trim();
	String wono = request.getParameter("wono")==null?"":request.getParameter("wono").trim();
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
     bomdata='<%=DAO.qualityinprocessload(id,doc)%>';
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
	                    {name : 'uom', type: 'String'  },
	                    {name : 'uomid', type: 'String'  },
	                    {name : 'pid', type: 'String'  },
	                    {name : 'qty', type: 'number'  },
						{name : 'pdesc', type: 'String'  },
						{name : 'psrno', type: 'String'  },
						{name : 'srchbtn', type: 'String'  },
						  {name : 'qtykg', type: 'number'  },
						  {name : 'stdper', type: 'String'  },
						  {name : 'issueqty', type: 'number'  },
						  {name : 'brandname', type: 'String'  },
						  {name : 'tobeissued', type: 'number'  },
						  {name : 'specid', type: 'String'  },
						  {name : 'stockid', type: 'String'  },
						  {name : 'collqty', type: 'String'  },
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
   
   
    $("#jqxqltyprcsGrid").jqxGrid(
    {
        width: '100%',
        height: 250,
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
	               { text: 'Product ID', datafield: 'pid',  width: '12%',editable:false},
	               { text: 'Psrno', datafield: 'psrno',editable:false,hidden:true},
	               { text: 'Description', datafield: 'pdesc',editable:false}, 
	               { text: 'Brand', datafield: 'brandname',editable:false,  width: '15%'}, 
	               { text: 'Unit', datafield: 'uom',  width: '8%',editable:false}, 
	               { text: 'Uomid', datafield: 'uomid',editable:false,hidden:true},
	              /*  { text: ' Qty', datafield: 'qty',  width: '10%', cellsformat: 'd3',editable:false, cellsalign: 'right', align: 'right'}, */
	               { text: 'Issued Qty', datafield: 'issueqty',  width: '10%', cellsformat: 'd3',editable:false, cellsalign: 'right', align: 'right'},
	               { text: 'To be Issued', datafield: 'tobeissued',  width: '10%', cellsformat: 'd3',editable:true, cellsalign: 'right', align: 'right'},    
	               { text: '',columntype: 'button', datafield: 'srchbtn',editable:false,  width: '10%'},
	               { text: 'Stockid', datafield: 'stockid',hidden:true}, 
	               { text: 'Collqty', datafield: 'collqty',hidden:true},
	               { text: 'specid', datafield: 'specid',hidden:true},
	               ]   		 
    });     
    $("#overlay, #PleaseWait").hide();
    $("#jqxqltyprcsGrid").jqxGrid('addrow', null, {});
     var chkrows=$("#jqxqltyprcsGrid").jqxGrid('getrows');
    setTimeout(function(){
    if(chkrows!=""){
	  var setrow=chkrows.length-1;
	  //alert("lastrowindex==="+setrow);
	  $('#jqxqltyprcsGrid').jqxGrid('setcellvalue', setrow, "srchbtn","Search"); 
    }
    }, 1000); 
    $('#jqxqltyprcsGrid').on('cellclick', function (event) {
    	//alert("in cellclick");
    		
    	  var columnindex1=event.args.datafield;
    	  var rowindex2 = event.args.rowindex; 
    	  var pid=$('#jqxqltyprcsGrid').jqxGrid('getcellvalue', rowindex2, "pid");
    	 // alert("pid=="+pid);
    	  $('#rowindexg').val(rowindex2);
    	  if(columnindex1 == "srchbtn") {
    		
    			  productSearchContent('productSearch.jsp?id='+1+"&formchk="+2); 
    		 
    			 
    			 
    			  
    			  
    		  
    		 
    	  }
    });
      $('#jqxqltyprcsGrid').on('rowdoubleclick', function (event) {                  
            var rowindex2 = event.args.rowindex;                      
        	document.getElementById("hidrow").value=rowindex2;
			document.getElementById("hidgispsrno").value=$('#jqxqltyprcsGrid').jqxGrid('getcellvalue', rowindex2, "psrno");
			document.getElementById("hidgisunit").value=$('#jqxqltyprcsGrid').jqxGrid('getcellvalue', rowindex2, "uomid");
        });  
});
</script>
<div id="jqxqltyprcsGrid"></div>