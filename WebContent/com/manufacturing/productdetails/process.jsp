<%@page import="com.manufacturing.productdetails.*" %>
<% ClsMProductDetailsDAO DAO=new ClsMProductDetailsDAO(); %>
<% String docno = request.getParameter("docno")==null?"":request.getParameter("docno");
String id = request.getParameter("id")==null?"":request.getParameter("id");
%> 
<script type="text/javascript">

	    <%-- var data5= '<%=DAO.quotationLoading(cldocno) %>'; --%>
	  var processdata='<%=DAO.getProcessData(docno,id) %>';
        $(document).ready(function () { 	
        	  
            // prepare the data
            var source =
            {
                datatype: "json",
                datafields: [
							{name : 'prcsid', type: 'string' },
							{name : 'processid', type: 'string' },
     						{name : 'desc', type: 'string'  },
     						{name : 'mtype', type: 'string' },
     						{name : 'machineid',type:'number'},
     						{name : 'rowno',type:'number'}
     						
     					     					     						  											
                 ],
                 localdata: processdata,
                
                
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

            
            
            $("#processGrid").jqxGrid(
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
							{ text: 'Process.id.', datafield: 'prcsid',editable:false },	
							{ text: 'Process Id', datafield: 'processid',hidden:true },
							{ text: 'Description ', datafield: 'desc',editable:false },		
							{ text: 'M.Type', datafield: 'mtype', width: '27%',editable:false },
							{ text: 'Machine Id', datafield: 'machineid', width: '27%',hidden:true },
							{ text: 'Row No', datafield: 'rowno',hidden:true }	
						
							
						 ],
            });
            
           $("#processGrid").on("celldoubleclick", function (event)
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
			    
			    if(dataField=="prcsid"){
			    	processSearchContent('processSearchGrid.jsp?griddatafield='+dataField+'&gridname=processGrid&gridrowindex='+rowBoundIndex+'&dtype=PRDT&id=1');	
			    	$("#processGrid").jqxGrid('addrow', null, {});
			    }
			    else if(dataField=="mtype"){
			    	machineSearchContent('machineSearchGrid.jsp?griddatafield='+dataField+'&gridname=processGrid&gridrowindex='+rowBoundIndex+'&dtype=PRDT&id=1');
			    }
			}); 
           
           $("#popupWindow3").jqxWindow({ width: 250, resizable: false,  isModal: true, autoOpen: false, cancelButton: $("#Cancel"), modalOpacity: 0.01 });
           // create context menu
              var contextMenu = $("#Menu3").jqxMenu({ width: 200, height: 25, autoOpenPopup: false, mode: 'popup'});
              $("#processGrid").on('contextmenu', function () {
                  return false;
              });
              
           $("#Menu3").on('itemclick', function (event) {
           	   var args = event.args;
                  var rowindex = $("#processGrid").jqxGrid('getselectedrowindex');
                  if ($.trim($(args).text()) == "Edit Selected Row") {
                      editrow = rowindex;
                      var offset = $("#processGrid").offset();
                      $("#popupWindow3").jqxWindow({ position: { x: parseInt(offset.left) + 60, y: parseInt(offset.top) + 60} });
                      // get the clicked row's data and initialize the input fields.
                      var dataRecord = $("#processGrid").jqxGrid('getrowdata', editrow);
                      // show the popup window.
                      $("#popupWindow3").jqxWindow('show');
                  }
                  else {
                      var rowid = $("#processGrid").jqxGrid('getrowid', rowindex);
                      $("#processGrid").jqxGrid('deleterow', rowid);
                  }
           });
           
           $("#processGrid").on('cellclick', function (event) {
               if (event.args.rightclick) {
    		   
                   $("#processGrid").jqxGrid('selectrow', event.args.rowindex);
                   var scrollTop = $(window).scrollTop();
                   var scrollLeft = $(window).scrollLeft();
                   contextMenu.jqxMenu('open', parseInt(event.args.originalEvent.clientX) + 5 + scrollLeft, parseInt(event.args.originalEvent.clientY) + 5 + scrollTop);
                   return false;
               
    		   }
           });
           
        });

</script>
<div id="processGrid"></div>
<div id="popupWindow3">
 
 <div id='Menu3'>
        <ul>
            <li>Delete Selected Row</li>
        </ul>
       </div>
       </div>
 