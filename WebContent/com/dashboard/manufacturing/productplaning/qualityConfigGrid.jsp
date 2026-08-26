<%@page import="com.dashboard.manufacturing.productplaning.ClsproductplaningDAO" %>
<%ClsproductplaningDAO DAO=new ClsproductplaningDAO(); %> 
<% String docno = request.getParameter("docno")==null?"":request.getParameter("docno");
String id = request.getParameter("id")==null?"":request.getParameter("id");
String chk = request.getParameter("chk")==null?"":request.getParameter("chk");
%> 
<script type="text/javascript">
	var processqadata='<%=DAO.getQualityConfGridMaster(docno,id,chk)%>';
	    <%-- var data5= '<%=DAO.quotationLoading(cldocno) %>'; --%>
	  
        $(document).ready(function () { 	
       var temp='<%=id%>';
       //showhidgridclm(); 	  
            // prepare the data
            var source =
            {
                datatype: "json",
                datafields: [
							{name : 'test', type: 'string' },
							{name : 'method', type: 'string' },
							{name : 'spec', type: 'string' },
     						{name : 'unit', type: 'string'   },
     						{name : 'testres', type: 'string'  },
     						{name : 'qlno', type: 'string'  },
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

            
            
            $("#jqxqacnfGrid").jqxGrid(
            {
            	width: '100%',
                height: 250,
                source: dataAdapter,
                columnsresize: true,
                editable: true,
                sortable: true,
                selectionmode: 'checkbox',
                localization: {thousandsSeparator: ""},

                columns: [
                	{ text: 'No.', sortable: false, filterable: false, editable: false,
					    groupable: false, draggable: false, resizable: false,datafield: '',
					    columntype: 'number', width: '5%',cellsalign: 'center', align: 'center',
					    cellsrenderer: function (row, column, value) {
					  	  return "<center><div style='margin:4px;'>" + (value + 1) + "</div></center>";
				       }  
					},	
							{ text: 'Test', datafield: 'test', width: '20%',editable:false },		
							{ text: 'Method', datafield: 'method', width: '20%' },		
							{ text: 'Unit ', datafield: 'unit',editable:false, width: '5%' },	
							{ text: 'Specification', datafield: 'spec',editable:true},	
							{ text: 'Test Result', datafield: 'testres', width: '20%',editable:true},
							
							
						 ],
            });
            
           
           
        });
        

</script>
<div id="jqxqacnfGrid"></div>

 