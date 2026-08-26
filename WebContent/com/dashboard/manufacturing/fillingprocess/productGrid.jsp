<%@page import="javax.servlet.http.HttpServletRequest" %>
<%@page import="javax.servlet.http.HttpSession" %>
<%@page import="com.dashboard.manufacturing.fillingprocess.ClsFillingProcessDAO" %>
<%ClsFillingProcessDAO DAO=new ClsFillingProcessDAO(); %>                 
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
   // pdtdata=null;
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
        	            {name : 'descptn', type: 'String'  },
        	            {name : 'sorddoc', type: 'String'  },
        	            {name : 'workno', type: 'String'  },
        	            {name : 'otype', type: 'String'  },
	                    {name : 'salesorder', type: 'String'  },
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
						{name : 'fillstartmark', type: 'String'  },
						{name : 'fillendmark', type: 'String'  },
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
						{name : 'batchno', type: 'String'  },
						{name : 'minchk', type: 'String'  },
						{name : 'jvchk', type: 'String'  },
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
                   { text: 'Order No', datafield: 'salesorder',  width: '5%'},
                   { text: 'Type', datafield: 'otype',  width: '5%'},
	               { text: 'Product ID', datafield: 'pid',  width: '6%'},    
	               { text: 'Product Description', datafield: 'pdesc'}, 
	               { text: 'UOM', datafield: 'uom',  width: '5%'},
	               { text: 'Qty', datafield: 'qty',  width: '6%', cellsformat: 'd3', cellsalign: 'right', align: 'right'},  
	         
	               { text: 'Process', datafield: 'process',  width: '24%',hidden:true},
	               { text: 'sorddoc', datafield: 'sorddoc',  width: '24%',hidden:true},
	               { text: 'Start Time', datafield: 'fillstartmark',  width: '5%'},   
	               { text: 'End Time', datafield: 'fillendmark',  width: '5%'},
	               { text: 'Total Time', datafield: 'tottime',  width: '5%'},
	               { text: 'Batch No', datafield: 'batchno',  width: '5%'},
			   ]   		 
    });     
    $("#overlay, #PleaseWait").hide();
      $('#jqxpdpGrid').on('rowdoubleclick', function (event) {                 
            var rowindex2 = event.args.rowindex;                      
			var psrno=$('#jqxpdpGrid').jqxGrid('getcellvalue', rowindex2, "psrno");
			var work=$('#jqxpdpGrid').jqxGrid('getcellvalue', rowindex2, "salesorder");
			var qty=$('#jqxpdpGrid').jqxGrid('getcellvalue', rowindex2, "qty");
			var sorddoc=$('#jqxpdpGrid').jqxGrid('getcellvalue', rowindex2, "sorddoc");
			// $('#hidblendsheetno').val($('#jqxpdpGrid').jqxGrid('getcellvalue', rowindex2, "blendsheetno"));
			 //$('#hidmaterialrequestno').val($('#jqxpdpGrid').jqxGrid('getcellvalue', rowindex2, "materialrequestno"));
			  $('#hidsorddoc').val($('#jqxpdpGrid').jqxGrid('getcellvalue', rowindex2, "sorddoc"));
			 $('#hidgisno').val($('#jqxpdpGrid').jqxGrid('getcellvalue', rowindex2, "minchk"));
			 $('#hidqualityno').val($('#jqxpdpGrid').jqxGrid('getcellvalue', rowindex2, "qualityno"));
			 $('#hidcomptrno').val($('#jqxpdpGrid').jqxGrid('getcellvalue', rowindex2, "jvchk"));
			 
			$('#batchqty').val(qty);
			$('#hidpsrno').val(psrno);
			$('#hidordertype').val($('#jqxpdpGrid').jqxGrid('getcellvalue', rowindex2, "otype"));
			var dsc=$('#jqxpdpGrid').jqxGrid('getcellvalue', rowindex2, "pdesc");
			var batch=$('#jqxpdpGrid').jqxGrid('getcellvalue', rowindex2, "batchno");
			$('#hidgenuomid').val($('#jqxpdpGrid').jqxGrid('getcellvalue', rowindex2, "uomid"));
			$('#hidgenspecid').val($('#jqxpdpGrid').jqxGrid('getcellvalue', rowindex2, "specid"));
			$('#hidbatchno').val($('#jqxpdpGrid').jqxGrid('getcellvalue', rowindex2, "batchno"));
			$('#hiddescptn').val($('#jqxpdpGrid').jqxGrid('getcellvalue', rowindex2, "descptn"));
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
			 $('#lblclientstatushead').html(chkval);
			//$('#productdet').val($('#jqxpdpGrid').jqxGrid('getcellvalue', rowindex2, "pdesc"));
			 //$('#preproddiv').load("preProductionGrid.jsp?id="+1+"&docno="+psrno);
			// $('#productiondiv').load("productionCompleteGrid.jsp?id="+1+"&docno="+psrno);
			 $('#wrkdiv').load("workOrderLogGrid.jsp?id="+1+"&work="+work);
			 $('#bomdiv').load("bomGrid.jsp?id="+1+"&docno="+psrno+"&cond="+1+"&bqty="+qty+"&type="+$('#hidordertype').val()+"&workorder="+work);
			 $('#processdiv').load("processGrid.jsp?id="+1+"&docno="+psrno);
			 $('#hidgenproduct').val($('#jqxpdpGrid').jqxGrid('getcellvalue', rowindex2, "pdesc"));
			 funRoundAmt($('#jqxpdpGrid').jqxGrid('getcellvalue', rowindex2, "qty"),"hidgenqty");
			 $('#hidgenuom').val($('#jqxpdpGrid').jqxGrid('getcellvalue', rowindex2, "uom"));
			 funRoundAmt($('#jqxpdpGrid').jqxGrid('getcellvalue', rowindex2, "qty"),"batchqty");
			 $('#hidworkno').val($('#jqxpdpGrid').jqxGrid('getcellvalue', rowindex2, "salesorder"));
			    $('#jqxsubGrid').jqxGrid('setcellvalue', 0, "pdesc",$('#jqxpdpGrid').jqxGrid('getcellvalue', rowindex2, "salesorder"));
	            $('#jqxsubGrid').jqxGrid('setcellvalue', 1, "pdesc",$('#jqxpdpGrid').jqxGrid('getcellvalue', rowindex2, "otype"));
	            $('#jqxsubGrid').jqxGrid('setcellvalue', 2, "pdesc",$('#jqxpdpGrid').jqxGrid('getcellvalue', rowindex2, "pid"));
	            $('#jqxsubGrid').jqxGrid('setcellvalue', 3, "pdesc",$('#jqxpdpGrid').jqxGrid('getcellvalue', rowindex2, "pdesc"));
	            $('#jqxsubGrid').jqxGrid('setcellvalue', 4, "pdesc",$('#jqxpdpGrid').jqxGrid('getcellvalue', rowindex2, "qty"));
	            $('#jqxsubGrid').jqxGrid('setcellvalue', 5, "pdesc",$('#jqxpdpGrid').jqxGrid('getcellvalue', rowindex2, "uom"));
	            $('#jqxsubGrid').jqxGrid('setcellvalue', 6, "pdesc",$('#jqxpdpGrid').jqxGrid('getcellvalue', rowindex2, "batchno"));
				 $('#jqxsubGrid').jqxGrid('setcellvalue', 9, "pdesc",$('#jqxpdpGrid').jqxGrid('getcellvalue', rowindex2, "bomethod"));
	             $('#jqxsubGrid').jqxGrid('setcellvalue', 7, "pdesc",$('#jqxpdpGrid').jqxGrid('getcellvalue', rowindex2, "batchdate"));
	            $('#jqxsubGrid').jqxGrid('setcellvalue', 8, "pdesc",$('#jqxpdpGrid').jqxGrid('getcellvalue', rowindex2, "batchtime"));
	           // $('#jqxsubGrid').jqxGrid('setcellvalue', 6, "pdesc",$('#jqxpdpGrid').jqxGrid('getcellvalue', rowindex2, "batchdate"));
	           // $('#jqxsubGrid').jqxGrid('setcellvalue', 7, "pdesc",$('#jqxpdpGrid').jqxGrid('getcellvalue', rowindex2, "batchtime"));
	            // $('#jqxsubGrid').jqxGrid('setcellvalue', 7, "pdesc",$('#jqxpdpGrid').jqxGrid('getcellvalue', rowindex2, "pdesc"));
	           // $('#jqxsubGrid').jqxGrid('setcellvalue', 8, "pdesc",$('#jqxpdpGrid').jqxGrid('getcellvalue', rowindex2, "mtype"));
	           // $('#jqxsubGrid').jqxGrid('setcellvalue', 9, "pdesc",$('#jqxpdpGrid').jqxGrid('getcellvalue', rowindex2, "uom"));
	           // $('#jqxsubGrid').jqxGrid('setcellvalue', 10, "pdesc",$('#jqxpdpGrid').jqxGrid('getcellvalue',rowindex2, "uomid"));
			
        });     
});
</script>
<div id="jqxpdpGrid"></div>