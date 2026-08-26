<%@page import="javax.servlet.http.HttpServletRequest" %>
<%@page import="javax.servlet.http.HttpSession" %>
<%@page import="com.dashboard.manufacturing.fillingprocess.ClsFillingProcessDAO" %>
<%ClsFillingProcessDAO DAO=new ClsFillingProcessDAO(); %>        
<%   
	String id = request.getParameter("id")==null?"0":request.getParameter("id").trim(); 
	String brch = request.getParameter("brch")==null?"":request.getParameter("brch").trim();    
	String from = request.getParameter("from")==null?"":request.getParameter("from").trim(); 
	String doc = request.getParameter("docno")==null?"":request.getParameter("docno").trim();
	String cond = request.getParameter("cond")==null?"":request.getParameter("cond").trim();
	String qty = request.getParameter("qty")==null?"":request.getParameter("qty").trim();
	String bqty = request.getParameter("bqty")==null?"":request.getParameter("bqty").trim();
	String type = request.getParameter("type")==null?"":request.getParameter("type").trim();
	String order = request.getParameter("workorder")==null?"":request.getParameter("workorder").trim();
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
     
     var temp='<%=cond%>';
     if(parseInt(temp)==0){
    	// alert("temp=="+temp);
    	<%--  bomdata='<%=DAO.balancesheetload(id,doc)%>'; --%>
    	
     }
     if(parseInt(temp)==1){
    	// alert("temp=="+temp);
    	  bomdata='<%=DAO.secondload(id,doc,qty,bqty,type,order)%>'; 
    	
     }
     
    
     
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
						{name : 'brandname', type: 'String'  },
						{name : 'specid', type: 'String'  },
						{name : 'psrno', type: 'String'  },
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
   
   
    $("#jqxgisGrid").jqxGrid(
    {
        width: '100%',
        height: 150,
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
        editable:false,
        columns: [   
                  { text: 'SL#', sortable: false, filterable: false, editable: false,       
                      groupable: false, draggable: false, resizable: false,    
                      datafield: 'sl', columntype: 'number', width: '4%' ,
                      cellsrenderer: function (row, column, value) {
                          return "<center><div style='margin:4px;'>" + (value + 1) + "</div></center>";   
                      }  
                    },
	               { text: 'Product ID', datafield: 'pid',  width: '15%'},    
	               { text: 'Description', datafield: 'pdesc'}, 
	               { text: 'Brand', datafield: 'brandname',  width: '15%'}, 
	               { text: 'Unit', datafield: 'uom',  width: '15%'}, 
	               { text: 'Stockid', datafield: 'stockid',  width: '15%',hidden:true}, 
	               { text: 'Collqty', datafield: 'collqty',  width: '15%',hidden:true}, 
	               { text: 'specid', datafield: 'specid',  width: '15%',hidden:true},
	               { text: 'Qty', datafield: 'qty',  width: '15%', cellsformat: 'd3', cellsalign: 'right', align: 'right'},    
			   ]   		 
    });     
    $("#overlay, #PleaseWait").hide();   
      $('#jqxgisGrid').on('rowdoubleclick', function (event) {                  
            var rowindex2 = event.args.rowindex;                      
			document.getElementById("hidrow").value=rowindex2;
			document.getElementById("hidgispsrno").value=$('#jqxgisGrid').jqxGrid('getcellvalue', rowindex2, "psrno");
			document.getElementById("hidgisunit").value=$('#jqxgisGrid').jqxGrid('getcellvalue', rowindex2, "uomid");
            //$('.textpanel p').text('Doc No '+$('#jqxbomGrid').jqxGrid('getcellvalue',rowindex2,'voc_no')+' - '+$('#jqxbomGrid').jqxGrid('getcellvalue', rowindex2, "tenant"));
        });     
});
</script>
<div id="jqxgisGrid"></div>