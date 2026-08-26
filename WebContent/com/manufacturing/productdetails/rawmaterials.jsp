<%@page import="com.manufacturing.productdetails.*" %>
<% ClsMProductDetailsDAO DAO=new ClsMProductDetailsDAO(); %>
<% String docno = request.getParameter("docno")==null?"":request.getParameter("docno");
String id = request.getParameter("id")==null?"":request.getParameter("id");
%> 

<script type="text/javascript">

	    <%-- var data5= '<%=DAO.quotationLoading(cldocno) %>'; --%>
	var rawmatdata='<%=DAO.getPRDetailRaw(docno,id) %>';
        $(document).ready(function () { 	
        	 
            // prepare the data
        	  var rendererstring2=function (aggregates){
               	var value=aggregates['sum2'];
               	return '<div style="float: right; margin: 4px;font-size:12px; overflow: hidden;">' + "  Total" + '</div>';
               } 
            var rendererstring=function (aggregates) {
         	var value=aggregates['sum'];
         	return '<div style="float: right; margin: 4px;font-size:12px; overflow: hidden;"> ' + value + '</div>';
         }
            var source =
            {
                datatype: "json",
                datafields: [
							{name : 'rmid', type: 'string' },
     						{name : 'uom', type: 'string'   },
     						{name : 'desc', type: 'string'  },
     						{name : 'note', type: 'string'   },
     						{name : 'prcs', type: 'string' },
     						{name : 'qtykg', type: 'number' },
     						{name : 'qtyltr', type: 'number' },
     						{name : 'std', type: 'number' },
     						{name : 'density', type: 'number' },
     						{name : 'psrno',type:'number'},
     						{name : 'rowno',type:'number'},
     						{name : 'uomid',type:'number'},
     						{name : 'processid',type:'number'}
     					     					     						  											
                 ],
                 localdata: rawmatdata,
                
                
                pager: function (pagenum, pagesize, oldpagenum) {
                    // callback called when a page or page size is changed.
                }
                                        
            };
            

            
            var dataAdapter = new $.jqx.dataAdapter(source,
            		 {
                		loadError: function (xhr, status, error) {
	                    alert(error);    
	                    }
			            
		            } );

            
            
            $("#rawmaterialsGrid").jqxGrid(
            {
            	width: '100%',
                height: 250,
                source: dataAdapter,
                columnsresize: true,
                editable: true,
                disabled: true,
                sortable: true,
                selectionmode: 'singlecell',
                showaggregates:true,
                showstatusbar:true,
                statusbarheight: 21,
                pagermode: 'default',
                columns: [
                	{ text: 'No.', sortable: false, filterable: false, editable: false,
					    groupable: false, draggable: false, resizable: false,datafield: '',
					    columntype: 'number', width: '5%',cellsalign: 'center', align: 'center',
					    cellsrenderer: function (row, column, value) {
					  	  return "<center><div style='margin:4px;'>" + (value + 1) + "</div></center>";
				       }  
					},	
							{ text: 'RM.id.', datafield: 'rmid',editable:false },			
							{ text: 'Description ', datafield: 'desc',editable:false,aggregates: ['sum2'],aggregatesrenderer:rendererstring2 },	
							{ text: 'Std%', datafield: 'std', width: '8%',cellsformat: 'd3',cellsalign:'right',align:'right',editable:true,aggregates: ['sum'],aggregatesrenderer:rendererstring },
							{ text: 'Quantity(kg)', datafield: 'qtykg', width: '8%',cellsformat: 'd3',cellsalign:'right',align:'right',editable:false},
							{ text: 'Density', datafield: 'density',cellsformat: 'd3',cellsalign:'right',align:'right', width: '8%',editable:false},
							{ text: 'Quantity(ltr)', datafield: 'qtyltr', width: '8%',cellsformat: 'd3',cellsalign:'right',align:'right',editable:false},
								
							{ text: 'UOM', datafield: 'uom', width: '8%',editable:false,hidden:true  },	
							{ text: 'UOM Id', datafield: 'uomid', width: '8%',hidden:true },	
								
							{ text: 'Process', datafield: 'prcs', width: '6%',editable:false },	
							{ text: 'Process Id', datafield: 'processid', width: '6%',hidden:true },
							{ text: 'Note', datafield: 'note',editable:true },
							{ text: 'PSRNO', datafield: 'psrno',hidden:true },
							{ text: 'Row No', datafield: 'rowno',hidden:true }
							
						 ],
            });
            
           	$("#rawmaterialsGrid").on("celldoubleclick", function (event)
			{
			    // event arguments.
			    var args = event.args;
			    // row's bound index.
			    var rowBoundIndex = args.rowindex;
			    // row's visible index.
			    var rowVisibleIndex = args.visibleindex;
			    // right click.
			    var rightClick = args.rightclick; 
			    // original event.
			    var ev = args.originalEvent;
			    // column index.
			    var columnIndex = args.columnindex;
			    // column data field.
			    var dataField = args.datafield;
			    // cell value
			    var value = args.value;
			    
			    if(dataField=="rmid"){
			    	productSearchContent('../../productsearch/productSearch.jsp?frm=PRDT&ldk=3&gridname=rawmaterialsGrid&gridrowindex='+rowBoundIndex);	
			    	$("#rawmaterialsGrid").jqxGrid('addrow', null, {});
			    }
			    else if(dataField=="prcs"){
			    	processSearchContent('processSearchGrid.jsp?griddatafield='+dataField+'&gridname=rawmaterialsGrid&gridrowindex='+rowBoundIndex+'&dtype=PRDT&id=1');
			    }
			}); 
           	
            $("#popupWindow").jqxWindow({ width: 250, resizable: false,  isModal: true, autoOpen: false, cancelButton: $("#Cancel"), modalOpacity: 0.01 });
            // create context menu
               var contextMenu = $("#Menu").jqxMenu({ width: 200, height: 25, autoOpenPopup: false, mode: 'popup'});
               $("#rawmaterialsGrid").on('contextmenu', function () {
                   return false;
               });
               
            $("#Menu").on('itemclick', function (event) {
            	   var args = event.args;
                   var rowindex = $("#rawmaterialsGrid").jqxGrid('getselectedrowindex');
                   if ($.trim($(args).text()) == "Edit Selected Row") {
                       editrow = rowindex;
                       var offset = $("#rawmaterialsGrid").offset();
                       $("#popupWindow").jqxWindow({ position: { x: parseInt(offset.left) + 60, y: parseInt(offset.top) + 60} });
                       // get the clicked row's data and initialize the input fields.
                       var dataRecord = $("#rawmaterialsGrid").jqxGrid('getrowdata', editrow);
                       // show the popup window.
                       $("#popupWindow").jqxWindow('show');
                   }
                   else {
                       var rowid = $("#rawmaterialsGrid").jqxGrid('getrowid', rowindex);
                       $("#rawmaterialsGrid").jqxGrid('deleterow', rowid);
                   }
            });
            
            $("#rawmaterialsGrid").on('cellclick', function (event) {
                if (event.args.rightclick) {
     		   
                    $("#rawmaterialsGrid").jqxGrid('selectrow', event.args.rowindex);
                    var scrollTop = $(window).scrollTop();
                    var scrollLeft = $(window).scrollLeft();
                    contextMenu.jqxMenu('open', parseInt(event.args.originalEvent.clientX) + 5 + scrollLeft, parseInt(event.args.originalEvent.clientY) + 5 + scrollTop);
                    return false;
                
     		   }
            });
            
             $("#rawmaterialsGrid").on('cellvaluechanged', function (event) 
                    {
                 	   
                 	   
                 	   
                    	var datafield = event.args.datafield;
                		
            		    var rowBoundIndex = event.args.rowindex;
            		    if(datafield=="std")
          	 		  {
            		   
            		    	var qty=$('#rawmaterialsGrid').jqxGrid('getcellvalue', rowBoundIndex, "qty");
            		    	var std=$('#rawmaterialsGrid').jqxGrid('getcellvalue', rowBoundIndex, "std");
            		    	var density=$('#rawmaterialsGrid').jqxGrid('getcellvalue', rowBoundIndex, "density");
            		    	var vol=document.getElementById("volume").value;
            		    	var kg=document.getElementById("txtkg").value;
            		    	var calc1=parseFloat(kg)*(parseFloat(std)/100);
            		    	
            		    	 var calcs=(parseFloat(kg)*(parseFloat(std)/100)/parseFloat(density));
            		    	
            		    	$('#rawmaterialsGrid').jqxGrid('setcellvalue', rowBoundIndex, "qtykg",0);
            		    	$('#rawmaterialsGrid').jqxGrid('setcellvalue', rowBoundIndex, "qtyltr",0);
            		    	$('#rawmaterialsGrid').jqxGrid('setcellvalue', rowBoundIndex, "qtykg",calc1);
            		    	$('#rawmaterialsGrid').jqxGrid('setcellvalue', rowBoundIndex, "qtyltr",calcs);
            	 		  }
            		    
                    }); 
            
           	
        });

</script>
<div id="rawmaterialsGrid"></div>
<div id="popupWindow">
 
 <div id='Menu'>
        <ul>
            <li>Delete Selected Row</li>
        </ul>
       </div>
       </div>
 