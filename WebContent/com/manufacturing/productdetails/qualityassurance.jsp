<%@page import="com.manufacturing.productdetails.*" %>
<% ClsMProductDetailsDAO DAO=new ClsMProductDetailsDAO(); %>
<% String docno = request.getParameter("docno")==null?"":request.getParameter("docno");
String id = request.getParameter("id")==null?"":request.getParameter("id");
%> 
<script type="text/javascript">

	    <%-- var data5= '<%=DAO.quotationLoading(cldocno) %>'; --%>
	var qualitydata='<%=DAO.qualityData(docno,id) %>';
		   
        $(document).ready(function () { 	
        	 
            // prepare the data
            var source =
            {
                datatype: "json",
                datafields: [
							{name : 'tstid', type: 'string' },
							{name : 'testid', type: 'string' },
     						{name : 'tstmthd', type: 'string'   },
     						{name : 'desc', type: 'string'  },
     						{name : 'limit', type: 'string'   },
     						{name : 'rowno',type:'number'}
     						
     					     					     						  											
                 ],
                 localdata: qualitydata,
                
                
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

            
            
            $("#qualityGrid").jqxGrid(
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
							{ text: 'Test.id.', datafield: 'tstid',editable:false},
							{ text: 'Test Id ', datafield: 'testid',hidden:true },			
							{ text: 'Description ', datafield: 'desc',editable:false },	
							{ text: 'Test Method', datafield: 'tstmthd', width: '8%',editable:true },	
							{ text: 'Limit', datafield: 'limit', width: '27%',editable:true },
							{ text: 'Row No', datafield: 'rowno',hidden:true }	
							
							
						 ],
            });
            
           $("#qualityGrid").on("celldoubleclick", function (event)
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
			    
			    if(dataField=="tstid"){
			    	testSearchContent('testSearchGrid.jsp?griddatafield='+dataField+'&gridname=qualityGrid&gridrowindex='+rowBoundIndex+'&dtype=PRDT&id=1');	
			    	$("#qualityGrid").jqxGrid('addrow', null, {});
			    }
			});
           
           $("#popupWindow4").jqxWindow({ width: 250, resizable: false,  isModal: true, autoOpen: false, cancelButton: $("#Cancel"), modalOpacity: 0.01 });
           // create context menu
              var contextMenu = $("#Menu4").jqxMenu({ width: 200, height: 25, autoOpenPopup: false, mode: 'popup'});
              $("#qualityGrid").on('contextmenu', function () {
                  return false;
              });
              
           $("#Menu4").on('itemclick', function (event) {
           	   var args = event.args;
                  var rowindex = $("#qualityGrid").jqxGrid('getselectedrowindex');
                  if ($.trim($(args).text()) == "Edit Selected Row") {
                      editrow = rowindex;
                      var offset = $("#qualityGrid").offset();
                      $("#popupWindow4").jqxWindow({ position: { x: parseInt(offset.left) + 60, y: parseInt(offset.top) + 60} });
                      // get the clicked row's data and initialize the input fields.
                      var dataRecord = $("#qualityGrid").jqxGrid('getrowdata', editrow);
                      // show the popup window.
                      $("#popupWindow4").jqxWindow('show');
                  }
                  else {
                      var rowid = $("#qualityGrid").jqxGrid('getrowid', rowindex);
                      $("#qualityGrid").jqxGrid('deleterow', rowid);
                  }
           });
           
           $("#qualityGrid").on('cellclick', function (event) {
               if (event.args.rightclick) {
    		   
                   $("#qualityGrid").jqxGrid('selectrow', event.args.rowindex);
                   var scrollTop = $(window).scrollTop();
                   var scrollLeft = $(window).scrollLeft();
                   contextMenu.jqxMenu('open', parseInt(event.args.originalEvent.clientX) + 5 + scrollLeft, parseInt(event.args.originalEvent.clientY) + 5 + scrollTop);
                   return false;
               
    		   }
           });
           
        });

</script>
<div id="qualityGrid"></div>
 <div id="popupWindow4">
 
 <div id='Menu4'>
        <ul>
            <li>Delete Selected Row</li>
        </ul>
       </div>
       </div>