<%@page import="com.dashboard.manufacturing.fillingprocess.ClsFillingProcessDAO" %>
<%ClsFillingProcessDAO DAO=new ClsFillingProcessDAO(); %> 
<% String docno = request.getParameter("docno")==null?"":request.getParameter("docno");
String id = request.getParameter("id")==null?"":request.getParameter("id");
String chk = request.getParameter("chk")==null?"":request.getParameter("chk");
%> 
<script type="text/javascript">
	 var processqadata='<%=DAO.getProcessQAData(docno,id,chk)%>'; 
	    <%-- var data5= '<%=DAO.quotationLoading(cldocno) %>'; --%>
	 
        $(document).ready(function () { 	
       var temp='<%=id%>';
       //showhidgridclm(); 	  
            // prepare the data
            var source =
            {
                datatype: "json",
                datafields: [
							
							{name : 'testid', type: 'string' },
     						{name : 'tstid', type: 'string'   },    						
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

            
            
            $("#qasubGrid").jqxGrid(
            {
            	width: '100%',
                height: 250,
                source: dataAdapter,
                columnsresize: true,
                editable: true,
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
							
							{ text: 'Test.id', datafield: 'tstid', width: '15%',editable:false},	
							{ text: 'Test Id', datafield: 'testid', width: '8%',hidden:true},
							{ text: 'Description', datafield: 'desc1', width: '27%' ,editable:false},
							{ text: 'Test Method', datafield: 'testmethod', width: '30%' ,editable:true},
							{ text: 'Limit', datafield: 'limit', width: '30%',editable:true },	
							{ text: 'Row No', datafield: 'rowno',hidden:true }
							
						 ],
            });
            
           
           
        });
        

</script>
<div id="qasubGrid"></div>

 