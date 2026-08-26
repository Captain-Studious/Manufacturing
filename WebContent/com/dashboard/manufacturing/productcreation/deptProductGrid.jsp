<%@page import="javax.servlet.http.HttpServletRequest" %>
<%@page import="javax.servlet.http.HttpSession" %>
<%@page import="com.dashboard.manufacturing.productcreation.ClsProductCreationDAO" %>
<%ClsProductCreationDAO DAO=new ClsProductCreationDAO(); %>           
<%   
	String id = request.getParameter("id")==null?"0":request.getParameter("id").trim(); 
	String brch = request.getParameter("brch")==null?"":request.getParameter("brch").trim();    
	String from = request.getParameter("from")==null?"":request.getParameter("from").trim(); 
	String doc = request.getParameter("docno")==null?"":request.getParameter("docno").trim();
	String cond = request.getParameter("cond")==null?"":request.getParameter("cond").trim();
	String wqty = request.getParameter("wqty")==null?"":request.getParameter("wqty").trim();
	String mpsrno = request.getParameter("mpsrno")==null?"":request.getParameter("mpsrno").trim();
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
    
    	 bomdata='<%=DAO.deptload(id,mpsrno,wqty)%>';
     
     
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
	                    {name : 'psrno', type: 'String'  },
	                    {name : 'mpsrno', type: 'String'  },
						{name : 'pdesc', type: 'String'  },
						{name : 'dept', type: 'String'  },
						{name : 'deptid', type: 'String'  },
						{name : 'measure', type: 'number'  },
						{name : 'subcategory', type: 'String'  },
						{name : 'pdesc', type: 'String'  },
						{name : 'chkdesc', type: 'String'  },
						 {name : 'rowss', type: 'String'  },
						 {name : 'srchbtn', type: 'String'  },
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
   
   
    $("#jqxdeptGrid").jqxGrid(
    {
        width: '100%',
        height: 220,
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
        editable:true,
        columns: [   
                  { text: 'SL#', sortable: false, filterable: false, editable: false,       
                      groupable: false, draggable: false, resizable: false,    
                      datafield: 'sl', columntype: 'number', width: '4%' ,
                      cellsrenderer: function (row, column, value) {
                          return "<center><div style='margin:4px;'>" + (value + 1) + "</div></center>";   
                      }  
                    },
                   { text: 'Department', datafield: 'dept',  width: '15%',editable:false},
                   { text: 'Psrno', datafield: 'psrno',hidden:true,editable:false},   
                   { text: 'MPsrno', datafield: 'mpsrno',hidden:true,editable:false},
                   { text: 'rowss', datafield: 'rowss',hidden:true,editable:false},
                   { text: 'deptid', datafield: 'deptid',hidden:true,editable:false},
	               { text: 'Product ID', datafield: 'pid',columntype: 'custom',  width: '15%',editable:true,},    
	               { text: 'Product Name', datafield: 'pdesc',editable:true}, 
	               { text: 'Measure', datafield: 'measure',  width: '5%',editable:false, cellsformat: 'd3', cellsalign: 'right', align: 'right'}, 
	               { text: '',columntype: 'button', datafield: 'srchbtn',editable:false,  width: '5%'}, 
			   ]   		 
    });     
    $("#overlay, #PleaseWait").hide();   
     /* $('#jqxbomGrid').on('rowdoubleclick', function (event) {                  
            var rowindex2 = event.args.rowindex;                      
			document.getElementById("hidbrhid").value=$('#jqxbomGrid').jqxGrid('getcellvalue', rowindex2, "brhid");
			document.getElementById("hidvocno").value=$('#jqxbomGrid').jqxGrid('getcellvalue', rowindex2, "voc_no");     
            $('.textpanel p').text('Doc No '+$('#jqxbomGrid').jqxGrid('getcellvalue',rowindex2,'voc_no')+' - '+$('#jqxbomGrid').jqxGrid('getcellvalue', rowindex2, "tenant"));
        }); */
        
        $('#jqxdeptGrid').on('cellclick', function (event) {
        	//alert("in cellclick");
        	  var columnindex1=event.args.datafield;
        	  var rowindex2 = event.args.rowindex; 
        	  var dept=$('#jqxdeptGrid').jqxGrid('getcellvalue', rowindex2, "deptid");
        	  $('#rowindexg').val(rowindex2);
        	  if(columnindex1 == "srchbtn") {
        		  productSearchContent('productSearch.jsp?id='+1+'&deptid='+dept);
        	  }
        });
});
	
</script>
<div id="jqxdeptGrid"></div>