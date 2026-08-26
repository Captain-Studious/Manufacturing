<%@page import="com.manufacturing.productdetails.*" %>
<% ClsMProductDetailsDAO DAO=new ClsMProductDetailsDAO(); %>
<% String docno = request.getParameter("docno")==null?"":request.getParameter("docno");
String id = request.getParameter("id")==null?"":request.getParameter("id");
%> 
<script type="text/javascript">
	var processqadata='<%=DAO.getProcessQAData(docno,id)%>';
	    <%-- var data5= '<%=DAO.quotationLoading(cldocno) %>'; --%>
	  
        $(document).ready(function () { 	
        	  
            // prepare the data
            var source =
            {
                datatype: "json",
                datafields: [
							{name : 'prid', type: 'string' },
							{name : 'processid', type: 'string' },
							{name : 'testid', type: 'string' },
     						{name : 'tstid', type: 'string'   },
     						{name : 'desc', type: 'string'  },
     						{name : 'desc1', type: 'string'  },
     						{name : 'testmethod',type:'string'},
     						{name : 'limit',type:'number'},
     						{name : 'rowno',type:'number'}
     						
     					     					     						  											
                 ],
                 localdata: processqadata,
                
                
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

            
            
            $("#inprocessGrid").jqxGrid(
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
							{ text: 'Process.id.', datafield: 'prid',editable:false },		
							{ text: 'Process Id', datafield: 'processid',hidden:true },		
							{ text: 'Description ', datafield: 'desc',editable:false },	
							{ text: 'Test.id', datafield: 'tstid', width: '8%',editable:false},	
							{ text: 'Test Id', datafield: 'testid', width: '8%',hidden:true},
							{ text: 'Description', datafield: 'desc1', width: '27%' ,editable:false},
							{ text: 'Test Method', datafield: 'testmethod', width: '10%' ,editable:true},
							{ text: 'Limit', datafield: 'limit', width: '8%',editable:true },	
							{ text: 'Row No', datafield: 'rowno',hidden:true }
							
						 ],
            });
            
           $("#inprocessGrid").on("celldoubleclick", function (event)
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
			    
			    if(dataField=="prid"){
			    	processSearchContent('processSearchGrid.jsp?griddatafield='+dataField+'&gridname=inprocessGrid&gridrowindex='+rowBoundIndex+'&dtype=PRDT&id=1');	
			    	$("#inprocessGrid").jqxGrid('addrow', null, {});
			    }
			    else if(dataField=="tstid"){
			    	testSearchContent('testSearchGrid.jsp?griddatafield='+dataField+'&gridname=inprocessGrid&gridrowindex='+rowBoundIndex+'&dtype=PRDT&id=1');
			    }
			    else if(dataField=="mtype"){
			    	machineSearchContent('machineSearchGrid.jsp?griddatafield='+dataField+'&gridname=processGrid&gridrowindex='+rowBoundIndex+'&dtype=PRDT&id=1');
			    }
			});
           
           $("#popupWindow5").jqxWindow({ width: 250, resizable: false,  isModal: true, autoOpen: false, cancelButton: $("#Cancel"), modalOpacity: 0.01 });
           // create context menu
              var contextMenu = $("#Menu5").jqxMenu({ width: 200, height: 25, autoOpenPopup: false, mode: 'popup'});
              $("#inprocessGrid").on('contextmenu', function () {
                  return false;
              });
              
           $("#Menu5").on('itemclick', function (event) {
           	   var args = event.args;
                  var rowindex = $("#inprocessGrid").jqxGrid('getselectedrowindex');
                  if ($.trim($(args).text()) == "Edit Selected Row") {
                      editrow = rowindex;
                      var offset = $("#inprocessGrid").offset();
                      $("#popupWindow5").jqxWindow({ position: { x: parseInt(offset.left) + 60, y: parseInt(offset.top) + 60} });
                      // get the clicked row's data and initialize the input fields.
                      var dataRecord = $("#inprocessGrid").jqxGrid('getrowdata', editrow);
                      // show the popup window.
                      $("#popupWindow5").jqxWindow('show');
                  }
                  else {
                      var rowid = $("#inprocessGrid").jqxGrid('getrowid', rowindex);
                      $("#inprocessGrid").jqxGrid('deleterow', rowid);
                  }
           });
           
           $("#inprocessGrid").on('cellclick', function (event) {
               if (event.args.rightclick) {
    		   
                   $("#inprocessGrid").jqxGrid('selectrow', event.args.rowindex);
                   var scrollTop = $(window).scrollTop();
                   var scrollLeft = $(window).scrollLeft();
                   contextMenu.jqxMenu('open', parseInt(event.args.originalEvent.clientX) + 5 + scrollLeft, parseInt(event.args.originalEvent.clientY) + 5 + scrollTop);
                   return false;
               
    		   }
           });
           
        });

</script>
<div id="inprocessGrid"></div>
<div id="popupWindow5">
 
 <div id='Menu5'>
        <ul>
            <li>Delete Selected Row</li>
        </ul>
       </div>
       </div>
 