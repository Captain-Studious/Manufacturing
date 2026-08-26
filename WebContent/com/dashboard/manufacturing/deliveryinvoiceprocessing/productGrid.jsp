<%@page import="javax.servlet.http.HttpServletRequest" %>  
<%@page import="javax.servlet.http.HttpSession" %> 
<%@page import="com.dashboard.manufacturing.deliveryinvoiceprocessing.ClsDeliveryInvoiceProcessingDAO" %>
<%ClsDeliveryInvoiceProcessingDAO DAO=new ClsDeliveryInvoiceProcessingDAO(); %>                         
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
			        	{name : 'rsvqtychk', type: 'String'  },
			        	{name : 'rsvstockid', type: 'String'  },
        	            {name : 'brhid', type: 'String'  },
        	            {name : 'branchname', type: 'String'  },
        	            {name : 'ddoc', type: 'String'  },
        	            {name : 'curid', type: 'String'  },
                        {name : 'rate', type: 'String'  },
        	            {name : 'specid', type: 'String'  },
                        {name : 'otype', type: 'String'  },
						{name : 'orderno', type: 'String'  },
						{name : 'orderdoc', type: 'String'  },
						{name : 'refname', type: 'String'  },
						{name : 'date', type: 'date'  },
						{name : 'promdate', type: 'date'  },
						{name : 'unitprice', type: 'String'  },
						{name : 'workorder', type: 'String'  },
						{name : 'status', type: 'String'  },
						{name : 'expdate', type: 'date'  },
						{name : 'ovalue', type: 'number'  },       
						{name : 'nettotal', type: 'String'  },
						{name : 'pdate', type: 'date'  },
						{name : 'doc_no', type: 'String'  },
						{name : 'clacno', type: 'String'  },
						{name : 'disper', type: 'String'  },
						{name : 'pid', type: 'String'  },
						{name : 'qty', type: 'number'  },
						{name : 'pdesc', type: 'String'  },
						{name : 'uom', type: 'String'  },
						{name : 'uomid', type: 'String'  },
						{name : 'discount', type: 'String'  },
						{name : 'netotal', type: 'String'  },
						{name : 'total', type: 'String'  },
						{name : 'stockid', type: 'string'  },
						{name : 'foc', type: 'String'  },
						{name : 'clientid', type: 'String'  },
						{name : 'locid', type: 'String'  },
						{name : 'chkpsrno', type: 'String'  },
						{name : 'descptn', type: 'String'  },
						{name : 'taxper', type: 'String'  },
						{name : 'taxamount', type: 'String'  },
						{name : 'psrno', type: 'String'  },
						{name : 'delno', type: 'String'  },
						{name : 'invno', type: 'String'  },
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
        height: 490,
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
                      datafield: 'sl', columntype: 'number', width: '4%' ,
                      cellsrenderer: function (row, column, value) {
                          return "<center><div style='margin:4px;'>" + (value + 1) + "</div></center>";   
                      }  
                    },
                   { text: 'Type', datafield: 'otype',  width: '5%'},   
	               { text: 'Order No', datafield: 'orderno',  width: '5%'},
	               { text: 'Date', datafield: 'date',  width: '5%',cellsformat:'dd.MM.yyyy' },
	                      
	               { text: 'Branch', datafield: 'branchname',  width: '5%'},
	               { text: 'brhid', datafield: 'brhid',  width: '5%',hidden:true},
	               { text: 'Client', datafield: 'refname',  width: '19%'},
	               { text: 'Product ID', datafield: 'pid',  width: '6%'},    
  	               { text: 'Product Description', datafield: 'pdesc'},
  	               { text: 'Brand', datafield: 'brandname',  width: '6%'},
  	              /*  { text: 'Category', datafield: 'category',  width: '6%'},
  	               { text: 'Sub Category', datafield: 'subcategory',  width: '6%'}, */
  	               { text: 'UOM', datafield: 'uom',  width: '4%'}, 
  	               { text: 'Qty', datafield: 'qty',  width: '4%', cellsformat: 'd2', cellsalign: 'right', align: 'right'}, 
  	             /*   { text: 'Bal. Qty', datafield: 'balqty',  width: '6%', cellsformat: 'd2', cellsalign: 'right', align: 'right'}, */
  	             
  	             { text: 'Description', datafield: 'descptn',  width: '19%'},
  	             { text: 'Psrno', datafield: 'psrno',  width: '5%',hidden:true},
  	           { text: 'orderdoc', datafield: 'orderdoc',  width: '5%',hidden:true},
  	         { text: 'clacno', datafield: 'clacno',  width: '5%',hidden:true},  	         
  	       { text: 'ltstpsrno', datafield: 'ltstpsrno',  width: '5%',hidden:true},
	         { text: 'taxper', datafield: 'taxper',  width: '5%',hidden:true},
	         { text: 'taxamount', datafield: 'taxamount',  width: '5%',hidden:true},
	         { text: 'clientid', datafield: 'clientid',  width: '5%',hidden:true},
	         { text: 'nettotal', datafield: 'nettotal',  width: '5%',hidden:true},
	         { text: 'delno', datafield: 'delno',  width: '5%',hidden:true},
	         { text: 'invno', datafield: 'invno',  width: '5%',hidden:true},
	         { text: 'curid', datafield: 'curid',  width: '5%',hidden:true},
	         { text: 'rate', datafield: 'rate',  width: '5%',hidden:true},
	         { text: 'stockid', datafield: 'stockid',  width: '5%',hidden:true},
	              /*  { text: 'Order Value', datafield: 'ovalue',  width: '6%'},
	               { text: 'No of Item', datafield: 'nitem',  width: '6%'},
	               { text: 'Planned Status', datafield: 'pstatus',  width: '5%',hidden:true},   
	               { text: 'Planned Date', datafield: 'pdate',  width: '5%',cellsformat:'dd.MM.yyyy'},
	               { text: 'Work Orders', datafield: 'workorder',  width: '6%'},
	               { text: 'Status', datafield: 'status',  width: '6%'}, */
	                    
			   ]   		 
    });     
    $("#overlay, #PleaseWait").hide();
    $("#jqxpdpGrid").on('rowselect', function (event) 
            {
	        var datafield = event.args.datafield;
   		
	       var rowindex2 = event.args.rowindex;
	      var clientid=$('#jqxpdpGrid').jqxGrid('getcellvalue', rowindex2, "clientid");
	      var brhid=$('#jqxpdpGrid').jqxGrid('getcellvalue', rowindex2, "brhid");
	      var brchname=$('#jqxpdpGrid').jqxGrid('getcellvalue', rowindex2, "branchname");
	      var delno=$('#jqxpdpGrid').jqxGrid('getcellvalue', rowindex2, "delno");
	      $('#hiddelno').val(delno);
	      $('#hidbrchid').val(brhid);
	      $('#hidbrchname').val(brchname);
	   	 var rows = $("#jqxpdpGrid").jqxGrid('getrows');
	   	var selectedrows=$("#jqxpdpGrid").jqxGrid('selectedrowindexes');
		selectedrows = selectedrows.sort(function(a,b){return a - b});
	 	for (var i = 0; i <selectedrows.length; i++) {
	 		 var chk=selectedrows[i];
	 		// alert("length=="+selectedrows.length);
	 		if(selectedrows.length>1){
	 		if(parseInt(chk)!=parseInt(rowindex2)){
	 			// alert("inside====chk=="+chk+"==rowindex2=="+rowindex2);
	 			var clientidchk=$('#jqxpdpGrid').jqxGrid('getcellvalue', chk, "clientid");
	 			var brhidchk=$('#jqxpdpGrid').jqxGrid('getcellvalue', chk, "brhid");
	 			if(parseInt(clientid)!=parseInt(clientidchk)){
	 				// alert("inside====clientid=="+clientid+"==rowindex2=="+clientidchk);
	 				 $('#jqxpdpGrid').jqxGrid('unselectrow',rowindex2);
	 		    	   $.messager.alert('Message', ' Documents With Diffrent Customers Not Allowed ');
	 		    	   break;
	 			}
	 			 if(parseInt(brhid)!=parseInt(brhidchk)){
	 				 $('#jqxpdpGrid').jqxGrid('unselectrow',rowindex2);
	 		    	   $.messager.alert('Message', ' Documents With Diffrent Branch Not Allowed  ');
	 		    	   break;
	 			} 
	 		}
	 		}
	 	}
	    /*    if(typeof(res)==="undefined"){
	    	   $('#jqxbomGrid').jqxGrid('unselectrow',rowindex2);
	    	   $.messager.alert('Message', '  Request Qty not Entered ');
	       } */
            });
});
</script>
<div id="jqxpdpGrid"></div>