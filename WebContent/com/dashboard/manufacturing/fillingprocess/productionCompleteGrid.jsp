<%@page import="javax.servlet.http.HttpServletRequest" %>
<%@page import="javax.servlet.http.HttpSession" %>
<%@page import="com.dashboard.manufacturing.fillingprocess.ClsFillingProcessDAO" %>
<%ClsFillingProcessDAO DAO=new ClsFillingProcessDAO(); %>           
<%   
	String id = request.getParameter("id")==null?"0":request.getParameter("id").trim(); 
	String order = request.getParameter("order")==null?"":request.getParameter("order").trim();    
	String type = request.getParameter("type")==null?"":request.getParameter("type").trim(); 
	String psrno = request.getParameter("psrno")==null?"":request.getParameter("psrno").trim();
	String fill = request.getParameter("fill")==null?"":request.getParameter("fill").trim();
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
     bomdata='<%=DAO.completegridload(id,order,type,psrno,fill)%>';
    
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
        	            {name : 'psrno', type: 'String'  },
			        	{name : 'specid', type: 'String'  },
			        	{name : 'uomid', type: 'String'  },               
	                    {name : 'uom', type: 'String'  },
	                    {name : 'pid', type: 'String'  },
	                    {name : 'qty', type: 'number'  },
	                    {name : 'issqty', type: 'number'  },
						{name : 'pdesc', type: 'String'  },
						{name : 'stock', type: 'number'  },
						{name : 'batch_no', type: 'String'  },
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
   
   
    $("#jqxproductionGrid").jqxGrid(
    {
        width: '100%',
        height: 170,
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
	               { text: 'Product ID', datafield: 'pid',  width: '15%', editable: false},    
	               { text: 'Description', datafield: 'pdesc', editable: false}, 
	               { text: 'Unit', datafield: 'uom',  width: '15%', editable: false}, 
	               { text: 'Batch', datafield: 'batch_no',  width: '15%', editable: false,hidden:true},
	               { text: 'Qty', datafield: 'qty',  width: '15%', cellsformat: 'd2', cellsalign: 'right', align: 'right', editable: false},
	               { text: 'Issue Qty', datafield: 'issqty',  width: '15%', cellsformat: 'd2', cellsalign: 'right', align: 'right', editable: true,hidden:true},
	               { text: 'Stockid', datafield: 'stockid',  width: '15%',hidden:true}, 
	               { text: 'Collqty', datafield: 'collqty',  width: '15%',hidden:true}, 
	               { text: 'specid', datafield: 'specid',  width: '15%',hidden:true},
	               { text: 'Stock', datafield: 'stock',  width: '15%', cellsformat: 'd2', cellsalign: 'right', align: 'right', editable: false,hidden:true}, 
			   ]   		 
    });     
    $("#overlay, #PleaseWait").hide();   
    $('#jqxproductionGrid').on('rowdoubleclick', function (event) {                  
        var rowindex2 = event.args.rowindex;                      
		document.getElementById("hidrow").value=rowindex2;
		document.getElementById("hidgispsrno").value=$('#jqxproductionGrid').jqxGrid('getcellvalue', rowindex2, "psrno");
		document.getElementById("hidgisunit").value=$('#jqxproductionGrid').jqxGrid('getcellvalue', rowindex2, "uomid");
        //$('.textpanel p').text('Doc No '+$('#jqxbomGrid').jqxGrid('getcellvalue',rowindex2,'voc_no')+' - '+$('#jqxbomGrid').jqxGrid('getcellvalue', rowindex2, "tenant"));
    });     
});
</script>
<div id="jqxproductionGrid"></div>