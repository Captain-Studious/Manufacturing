<%@page import="javax.servlet.http.HttpServletRequest" %>
<%@page import="javax.servlet.http.HttpSession" %>
<%@page import="com.dashboard.manufacturing.productplaning.ClsproductplaningDAO" %>
<%ClsproductplaningDAO DAO=new ClsproductplaningDAO(); %>                 
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
        	            {name : 'department', type: 'String'  },
        	            {name : 'sordoc', type: 'String'  },
	                    {name : 'workorder', type: 'String'  },
	                    {name : 'pid', type: 'String'  },
	                    {name : 'qty', type: 'number'  },
						{name : 'pdesc', type: 'String'  },
						{name : 'expdate', type: 'date'  },
						{name : 'pldate', type: 'date'  },
						{name : 'batchdate', type: 'String'  },
						{name : 'time', type: 'String'  },
						{name : 'process', type: 'String'  },
						{name : 'sttime', type: 'String'  },
						{name : 'endtime', type: 'String'  },
						{name : 'totaltime', type: 'String'  },
						{name : 'batchno', type: 'String'  },
						{name : 'psrno', type: 'String'  },
						{name : 'uom', type: 'String'  },
						{name : 'startmark', type: 'String'  },
						{name : 'endmark', type: 'String'  },
						{name : 'tottime', type: 'String'  },
						{name : 'blendsheetno', type: 'String'  },
						{name : 'materialrequestno', type: 'String'  },
						{name : 'gisno', type: 'String'  },
						{name : 'qualityno', type: 'String'  },
						{name : 'uomid', type: 'String'  },
						{name : 'specid', type: 'String'  },
						{name : 'bomdoc', type: 'String'  },
						{name : 'batchtime', type: 'String'  },
						{name : 'trno', type: 'String'  },
						{name : 'mnpsrno', type: 'String'  },
						{name : 'bomethod', type: 'String'  },
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
        height: 290,
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
                   { text: 'WorkOrder', datafield: 'workorder',  width: '5%'},   
	               { text: 'Product ID', datafield: 'pid',  width: '6%'},    
	               { text: 'Product Description', datafield: 'pdesc'}, 
	               { text: 'UOM', datafield: 'uom',  width: '5%'},
	               { text: 'Qty', datafield: 'qty',  width: '6%', cellsformat: 'd3', cellsalign: 'right', align: 'right'},  
	             /*   { text: 'Exp Date', datafield: 'expdate',  width: '5%',cellsformat:'dd.MM.yyyy' },
	               { text: 'Plan Date', datafield: 'pldate',  width: '5%',cellsformat:'dd.MM.yyyy' },
	               { text: 'Time', datafield: 'time',  width: '5%'}, */
	               { text: 'Process', datafield: 'process',  width: '24%'},
	               { text: 'Start Time', datafield: 'startmark',  width: '5%'},   
	               { text: 'End Time', datafield: 'endmark',  width: '5%'},
	               { text: 'Total Time', datafield: 'tottime',  width: '5%'},
	               { text: 'Batch No', datafield: 'batchno',  width: '6%'},
	               { text: 'sordoc', datafield: 'sordoc',  width: '6%',hidden:true},
	               { text: 'sorddoc', datafield: 'sorddoc',  width: '6%',hidden:true},
	               { text: 'department', datafield: 'department',  width: '6%',hidden:true},
	               { text: 'method', datafield: 'bomethod',  width: '6%',hidden:true},
	               { text: 'Batch Date', datafield: 'batchdate',  width: '5%',cellsformat:'dd.MM.yyyy'},     
			   ]   		 
    });     
    $("#overlay, #PleaseWait").hide();
      $('#jqxpdpGrid').on('rowdoubleclick', function (event) {                 
            var rowindex2 = event.args.rowindex;                      
			var psrno=$('#jqxpdpGrid').jqxGrid('getcellvalue', rowindex2, "psrno");
			var work=$('#jqxpdpGrid').jqxGrid('getcellvalue', rowindex2, "workorder");
			var qty=$('#jqxpdpGrid').jqxGrid('getcellvalue', rowindex2, "qty");
			var sorddoc=$('#jqxpdpGrid').jqxGrid('getcellvalue', rowindex2, "sorddoc");
			 $('#hidsordoc').val($('#jqxpdpGrid').jqxGrid('getcellvalue', rowindex2, "sordoc"));
			 $('#hidsorddoc').val($('#jqxpdpGrid').jqxGrid('getcellvalue', rowindex2, "sorddoc"));
			 $('#hidDept').val($('#jqxpdpGrid').jqxGrid('getcellvalue', rowindex2, "department"));
			 $('#hidblendsheetno').val($('#jqxpdpGrid').jqxGrid('getcellvalue', rowindex2, "blendsheetno"));
			 $('#hidmaterialrequestno').val($('#jqxpdpGrid').jqxGrid('getcellvalue', rowindex2, "materialrequestno"));
			 $('#hidgisno').val($('#jqxpdpGrid').jqxGrid('getcellvalue', rowindex2, "gisno"));
			 $('#hidqualityno').val($('#jqxpdpGrid').jqxGrid('getcellvalue', rowindex2, "qualityno"));
			 $('#hidcomptrno').val($('#jqxpdpGrid').jqxGrid('getcellvalue', rowindex2, "trno"));
			$('#batchqty').val(qty);
			$('#hidpsrno').val(psrno);
			$('#hidmnpsrno').val($('#jqxpdpGrid').jqxGrid('getcellvalue', rowindex2, "mnpsrno"));
			var dsc=$('#jqxpdpGrid').jqxGrid('getcellvalue', rowindex2, "pdesc");
			var batch=$('#jqxpdpGrid').jqxGrid('getcellvalue', rowindex2, "batchno");
			$('#hidgenuomid').val($('#jqxpdpGrid').jqxGrid('getcellvalue', rowindex2, "uomid"));
			$('#hidgenspecid').val($('#jqxpdpGrid').jqxGrid('getcellvalue', rowindex2, "specid"));
			$('#hidbatchno').val($('#jqxpdpGrid').jqxGrid('getcellvalue', rowindex2, "batchno"));
			$('#hidbomdoc').val($('#jqxpdpGrid').jqxGrid('getcellvalue', rowindex2, "bomdoc"));
			var chkval="Product : "+dsc+" Batch No : "+batch;
			 $('#lblclientstatus1').html(chkval);
			 $('#lblclientstatus2').html(chkval);
			 $('#lblclientstatus3').html(chkval);
			 $('#lblclientstatus4').html(chkval);
			 $('#lblclientstatus5').html(chkval);
			 $('#lblclientstatus6').html(chkval);
			 $('#lblclientstatus7').html(chkval);
			 $('#lblclientstatus8').html(chkval);
			 $('#lblclientstatus9').html(chkval);
			 $('#lblclientstatus10').html(chkval);
			 $('#lblclientstatushead').html(chkval);
			 $('#wrkdiv').load("workOrderLogGrid.jsp?id="+1+"&work="+work);
			//$('#productdet').val($('#jqxpdpGrid').jqxGrid('getcellvalue', rowindex2, "pdesc"));
			 //$('#preproddiv').load("preProductionGrid.jsp?id="+1+"&docno="+psrno);
			// $('#productiondiv').load("productionCompleteGrid.jsp?id="+1+"&docno="+psrno);
			 $('#bomdiv').load("bomGrid.jsp?id="+1+"&docno="+psrno+"&cond="+1+"&wqty="+qty+"&wono="+work);
			 $('#processdiv').load("processGrid.jsp?id="+1+"&docno="+psrno);
			 $('#hidgenproduct').val($('#jqxpdpGrid').jqxGrid('getcellvalue', rowindex2, "pdesc"));
			 funRoundAmt($('#jqxpdpGrid').jqxGrid('getcellvalue', rowindex2, "qty"),"hidgenqty");
			 $('#hidgenuom').val($('#jqxpdpGrid').jqxGrid('getcellvalue', rowindex2, "uom"));
			 funRoundAmt($('#jqxpdpGrid').jqxGrid('getcellvalue', rowindex2, "qty"),"batchqty");
			 $('#hidworkno').val($('#jqxpdpGrid').jqxGrid('getcellvalue', rowindex2, "workorder"));
			    $('#jqxsubGrid').jqxGrid('setcellvalue', 0, "pdesc",$('#jqxpdpGrid').jqxGrid('getcellvalue', rowindex2, "workorder"));
	            $('#jqxsubGrid').jqxGrid('setcellvalue', 1, "pdesc",$('#jqxpdpGrid').jqxGrid('getcellvalue', rowindex2, "pid"));
	            $('#jqxsubGrid').jqxGrid('setcellvalue', 2, "pdesc",$('#jqxpdpGrid').jqxGrid('getcellvalue', rowindex2, "pdesc"));
	            $('#jqxsubGrid').jqxGrid('setcellvalue', 3, "pdesc",$('#jqxpdpGrid').jqxGrid('getcellvalue', rowindex2, "qty"));
	            $('#jqxsubGrid').jqxGrid('setcellvalue', 4, "pdesc",$('#jqxpdpGrid').jqxGrid('getcellvalue', rowindex2, "uom"));
	            $('#jqxsubGrid').jqxGrid('setcellvalue', 5, "pdesc",$('#jqxpdpGrid').jqxGrid('getcellvalue', rowindex2, "batchno"));
	            $('#jqxsubGrid').jqxGrid('setcellvalue', 6, "pdesc",$('#jqxpdpGrid').jqxGrid('getcellvalue', rowindex2, "batchdate"));
	            $('#jqxsubGrid').jqxGrid('setcellvalue', 7, "pdesc",$('#jqxpdpGrid').jqxGrid('getcellvalue', rowindex2, "batchtime"));
	            $('#jqxsubGrid').jqxGrid('setcellvalue', 8, "pdesc",$('#jqxpdpGrid').jqxGrid('getcellvalue', rowindex2, "bomethod"));
	            // $('#jqxsubGrid').jqxGrid('setcellvalue', 7, "pdesc",$('#jqxpdpGrid').jqxGrid('getcellvalue', rowindex2, "pdesc"));
	           // $('#jqxsubGrid').jqxGrid('setcellvalue', 8, "pdesc",$('#jqxpdpGrid').jqxGrid('getcellvalue', rowindex2, "mtype"));
	           // $('#jqxsubGrid').jqxGrid('setcellvalue', 9, "pdesc",$('#jqxpdpGrid').jqxGrid('getcellvalue', rowindex2, "uom"));
	           // $('#jqxsubGrid').jqxGrid('setcellvalue', 10, "pdesc",$('#jqxpdpGrid').jqxGrid('getcellvalue',rowindex2, "uomid"));
			
        });     
});
</script>
<div id="jqxpdpGrid"></div>