<%@page import="javax.servlet.http.HttpServletRequest" %>
<%@page import="javax.servlet.http.HttpSession" %>
<%@page import="com.dashboard.manufacturing.productplaning.ClsproductplaningDAO" %>
<%ClsproductplaningDAO DAO=new ClsproductplaningDAO(); %>           
<%   
	String id = request.getParameter("id")==null?"0":request.getParameter("id").trim(); 
	String brch = request.getParameter("brch")==null?"":request.getParameter("brch").trim();    
	String from = request.getParameter("from")==null?"":request.getParameter("from").trim(); 
	String doc = request.getParameter("docno")==null?"":request.getParameter("docno").trim();
	String cond = request.getParameter("cond")==null?"":request.getParameter("cond").trim();
	String wqty = request.getParameter("wqty")==null?"":request.getParameter("wqty").trim();
	String wono = request.getParameter("wono")==null?"":request.getParameter("wono").trim();
	String blndno = request.getParameter("blndno")==null?"":request.getParameter("blndno").trim();
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
     if(parseInt(temp)==2){
    	// alert("temp=="+temp);
    	 bomdata='<%=DAO.balancesheetload(id,doc,blndno)%>';
     }
     if(parseInt(temp)==1){
    	// alert("temp=="+temp);
    	 bomdata='<%=DAO.secondload(id,doc,wqty,wono)%>';
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
	                    {name : 'pid', type: 'String'  },
	                    {name : 'qty', type: 'number'  },
	                    {name : 'qtykg', type: 'number'  },
						{name : 'pdesc', type: 'String'  },
						{name : 'stdper', type: 'String'  },
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
        height: 220,
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
	               { text: 'Unit', datafield: 'uom',  width: '15%'}, 
	               { text: 'Std%', datafield: 'stdper',  width: '15%'}, 
	               { text: 'Qty(Kg)', datafield: 'qtykg',  width: '15%', cellsformat: 'd3', cellsalign: 'right', align: 'right'},
	               { text: 'Qty(Ltr)', datafield: 'qty',  width: '15%', cellsformat: 'd3', cellsalign: 'right', align: 'right'},
			   ]   		 
    });     
    $("#overlay, #PleaseWait").hide();   
     /* $('#jqxbomGrid').on('rowdoubleclick', function (event) {                  
            var rowindex2 = event.args.rowindex;                      
			document.getElementById("hidbrhid").value=$('#jqxbomGrid').jqxGrid('getcellvalue', rowindex2, "brhid");
			document.getElementById("hidvocno").value=$('#jqxbomGrid').jqxGrid('getcellvalue', rowindex2, "voc_no");     
            $('.textpanel p').text('Doc No '+$('#jqxbomGrid').jqxGrid('getcellvalue',rowindex2,'voc_no')+' - '+$('#jqxbomGrid').jqxGrid('getcellvalue', rowindex2, "tenant"));
        }); */    
});
</script>
<div id="jqxbomGrid"></div>