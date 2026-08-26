<%@page import="com.manufacturing.productdetails.*" %>
<% ClsMProductDetailsDAO DAO=new ClsMProductDetailsDAO(); %>
<% String docno = request.getParameter("docno")==null?"":request.getParameter("docno");
String id = request.getParameter("id")==null?"":request.getParameter("id");
%> 
<script type="text/javascript">

	    var prpackdata= '<%=DAO.getPRPackdata(docno,id) %>';
	  
	   
        $(document).ready(function () { 	
        	  
            // prepare the data
            var source =
            {
                datatype: "json",
                datafields: [
							{name : 'pid', type: 'string' },
     						{name : 'uom', type: 'string'   },
     						{name : 'pdesc', type: 'string'  },
     						{name : 'psize', type: 'number' },
     						{name : 'psrno',type:'number'},
     						{name : 'rowno',type:'number'},
     						{name : 'uomid', type: 'string'   },
     						
     					     					     						  											
                 ],
                 localdata: prpackdata,
                
                
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

            
            
            $("#packmaterialsGrid").jqxGrid(
            {
            	width: '100%',
                height: 250,
                source: dataAdapter,
                columnsresize: true,
                editable: true,
                disabled: true,
                sortable: true,
                selectionmode: 'singlecell',
                localization: {thousandsSeparator: ""},

                columns: [
                	{ text: 'No.', sortable: false, filterable: false, editable: false,
					    groupable: false, draggable: false, resizable: false,datafield: '',
					    columntype: 'number', width: '5%',cellsalign: 'center', align: 'center',
					    cellsrenderer: function (row, column, value) {
					  	  return "<center><div style='margin:4px;'>" + (value + 1) + "</div></center>";
				       }  
					},	
							{ text: 'PM.id.', datafield: 'pid',editable:false },			
							{ text: 'Description ', datafield: 'pdesc',editable:false },	
							{ text: 'Pack Size', datafield: 'psize', width: '8%',editable:true},	
							{ text: 'UOM', datafield: 'uom', width: '27%',editable:false },
							{ text: 'UOM Id', datafield: 'uomid', width: '27%',hidden:true },
							{ text:'PSRNO',datafield:'psrno',width:'20%',hidden:true},
							{ text: 'Row No', datafield: 'rowno',hidden:true }
							
							
						 ],
            });
            
           $("#packmaterialsGrid").on("celldoubleclick", function (event)
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
			    
			    if(dataField=="pid"){
			    	productSearchContent('../../productsearch/productSearch.jsp?frm=PRDT&ldk=4&gridname=packmaterialsGrid&gridrowindex='+rowBoundIndex);	
			    	$("#packmaterialsGrid").jqxGrid('addrow', null, {});
			    }
			}); 
           $("#popupWindow2").jqxWindow({ width: 250, resizable: false,  isModal: true, autoOpen: false, cancelButton: $("#Cancel"), modalOpacity: 0.01 });
           // create context menu
              var contextMenu = $("#Menu2").jqxMenu({ width: 200, height: 25, autoOpenPopup: false, mode: 'popup'});
              $("#packmaterialsGrid").on('contextmenu', function () {
                  return false;
              });
              
           $("#Menu2").on('itemclick', function (event) {
           	   var args = event.args;
                  var rowindex = $("#packmaterialsGrid").jqxGrid('getselectedrowindex');
                  if ($.trim($(args).text()) == "Edit Selected Row") {
                      editrow = rowindex;
                      var offset = $("#packmaterialsGrid").offset();
                      $("#popupWindow2").jqxWindow({ position: { x: parseInt(offset.left) + 60, y: parseInt(offset.top) + 60} });
                      // get the clicked row's data and initialize the input fields.
                      var dataRecord = $("#packmaterialsGrid").jqxGrid('getrowdata', editrow);
                      // show the popup window.
                      $("#popupWindow2").jqxWindow('show');
                  }
                  else {
                      var rowid = $("#packmaterialsGrid").jqxGrid('getrowid', rowindex);
                      $("#packmaterialsGrid").jqxGrid('deleterow', rowid);
                  }
           });
           
           $("#packmaterialsGrid").on('cellclick', function (event) {
               if (event.args.rightclick) {
    		   
                   $("#packmaterialsGrid").jqxGrid('selectrow', event.args.rowindex);
                   var scrollTop = $(window).scrollTop();
                   var scrollLeft = $(window).scrollLeft();
                   contextMenu.jqxMenu('open', parseInt(event.args.originalEvent.clientX) + 5 + scrollLeft, parseInt(event.args.originalEvent.clientY) + 5 + scrollTop);
                   return false;
               
    		   }
           });
        });

</script>
<div id="packmaterialsGrid"></div>
 <div id="popupWindow2">
 
 <div id='Menu2'>
        <ul>
            <li>Delete Selected Row</li>
        </ul>
       </div>
       </div>