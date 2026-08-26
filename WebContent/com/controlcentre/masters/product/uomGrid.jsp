<%@page import="javax.servlet.http.HttpServletRequest" %>
<%@page import="javax.servlet.http.HttpSession" %>
<%@page import="com.controlcentre.masters.product.ClsProductDAO"%>
<% String contextPath=request.getContextPath();%>
<%ClsProductDAO DAO= new ClsProductDAO(); 
String psrno=request.getParameter("docno")==null?"0":request.getParameter("docno").toString();
%>
<script type="text/javascript">
		var uomdata;
		var psrno='<%=psrno%>';
		if(psrno>=0){
			uomdata='<%=DAO.prduomLoad(session,psrno)%>'; 
		}
        $(document).ready(function () { 
        	
            // prepare the data
            var source =
            {
                datatype: "json",
                datafields: [
     						{name : 'slno', type: 'number' }, 
     						{name : 'unit', type: 'string'   },
     						{name : 'unitid', type: 'int'   },
     						{name : 'fr', type: 'number'  },
     						{name : 'weight', type: 'number'   },
     						{name : 'volumn', type: 'number'   },
     						{name : 'thickness', type: 'number' },
     						{name : 'len', type: 'number'  },
							{name : 'width', type: 'number' }
							
                        ],
                         localdata: uomdata,  
                
                pager: function (pagenum, pagesize, oldpagenum) {
                    // callback called when a page or page size is changed.
                }
            };
            
            $('#jqxUomGrid').on('bindingcomplete', function (event) {
           
            	
            	  
            	});
            
            
            var dataAdapter = new $.jqx.dataAdapter(source);
            
            $("#jqxUomGrid").jqxGrid(
            {
                width: '100%',
                height: 90,
                source: dataAdapter,
                editable: true,
                showaggregates: true,
                editmode: 'selectedcell',
                selectionmode: 'singlecell',
                pagermode: 'default',
                 handlekeyboardnavigation: function (event) {
                    var rows = $('#jqxUomGrid').jqxGrid('getrows');
                       var rowlength= rows.length;
                       var cell = $('#jqxUomGrid').jqxGrid('getselectedcell');
                       if (cell != undefined && cell.datafield == 'width' && cell.rowindex == rowlength - 1) {
                           var key = event.charCode ? event.charCode : event.keyCode ? event.keyCode : 0; 
                           if (key == 9) {                                                        
                               var commit = $("#jqxUomGrid").jqxGrid('addrow', null, {});
                               rowlength++;                           
                           }
                       }
   },
                       
                columns: [
							{ text: 'Sr. No.',datafield: '',columntype:'number', width: '6%', cellsrenderer: function (row, column, value) {
	                               return "<div style='margin:4px;'>" + (value + 1) + "</div>";
                            }   },
							{ text: 'Unit', datafield: 'unit', editable: false,  width: '18%',cellsalign: 'center', align: 'center' },
							{ text: 'Unitid', datafield: 'unitid',hidden:true,  width: '18%',cellsalign: 'center', align: 'center' },
							{ text: 'Fr', datafield: 'fr',  width: '10%',cellsformat: 'd2',cellsalign: 'right', align: 'right', 
								cellbeginedit: function (row) {
					               if (row==0)
					                {
					                     return false;
					                }} },	
							{ text: 'Weight', datafield: 'weight', width: '15%',cellsformat: 'd2',cellsalign: 'right', align: 'right' },	
							{ text: 'Volumn', datafield: 'volumn', width: '15%',cellsformat: 'd2',cellsalign: 'right', align: 'right' },
							{ text: 'Thickness', datafield: 'thickness', width: '12%',cellsformat: 'd2',cellsalign: 'right', align: 'right' },
							{ text: 'Length', datafield: 'len',  width: '12%',cellsformat: 'd2',cellsalign: 'right', align: 'right' },
							{ text: 'Width', datafield: 'width', width: '12%',cellsformat: 'd2',cellsalign: 'right', align: 'right' },

						]
            });
           
            $('#jqxUomGrid').on('cellclick', function (event) {

            	var rowBoundIndex = event.args.rowindex;
            	var datafield = event.args.datafield;
 		       if(datafield=="unit")
 		    	   {
 		    	  unitSearchContent('unitSearchGrid.jsp?rowno='+rowBoundIndex);
 		    	   }
 		                 	  
                  });
            $("#popupWindow").jqxWindow({ width: 250, resizable: false,  isModal: true, autoOpen: false, cancelButton: $("#Cancel"), modalOpacity: 0.01 });
            // create context menu
               var contextMenu = $("#Menu").jqxMenu({ width: 200, height: 25, autoOpenPopup: false, mode: 'popup'});
               $("#jqxUomGrid").on('contextmenu', function () {
                   return false;
               });
               
            $("#Menu").on('itemclick', function (event) {
            	   var args = event.args;
                   var rowindex = $("#jqxUomGrid").jqxGrid('getselectedrowindex');
                   if ($.trim($(args).text()) == "Edit Selected Row") {
                       editrow = rowindex;
                       var offset = $("#jqxUomGrid").offset();
                       $("#popupWindow").jqxWindow({ position: { x: parseInt(offset.left) + 60, y: parseInt(offset.top) + 60} });
                       // get the clicked row's data and initialize the input fields.
                       var dataRecord = $("#jqxUomGrid").jqxGrid('getrowdata', editrow);
                       // show the popup window.
                       $("#popupWindow").jqxWindow('show');
                   }
                   else {
                       var rowid = $("#jqxUomGrid").jqxGrid('getrowid', rowindex);
                       $("#jqxUomGrid").jqxGrid('deleterow', rowid);
                   }
            });
            
            $("#jqxUomGrid").on('cellclick', function (event) {
                if (event.args.rightclick) {
     		   
                    $("#jqxUomGrid").jqxGrid('selectrow', event.args.rowindex);
                    var scrollTop = $(window).scrollTop();
                    var scrollLeft = $(window).scrollLeft();
                    contextMenu.jqxMenu('open', parseInt(event.args.originalEvent.clientX) + 5 + scrollLeft, parseInt(event.args.originalEvent.clientY) + 5 + scrollTop);
                    return false;
                
     		   }
            });
            
            if($('#mode').val()=='view')
	         {
          	$("#jqxUomGrid").jqxGrid({
   			disabled : true
   		});
	           }
            
            
        });
</script>
<div id="jqxUomGrid"></div>
<div id="popupWindow">
 
 <div id='Menu'>
        <ul>
            <li>Delete Selected Row</li>
        </ul>
       </div>
       </div>
