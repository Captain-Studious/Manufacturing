 
 

<%@page import="javax.servlet.http.HttpServletRequest" %>
<%@page import="javax.servlet.http.HttpSession" %>
 
  <%@page import="com.controlcentre.masters.client.ClsClientDAO" %>
 
 <%
 
 ClsClientDAO ClsClientDAO=new ClsClientDAO();
 %>

 <script type="text/javascript">
 
 var radata;
<%--  if('NA' != '<%=item%>')  {
	 radata = '<%=item%>';
 } 
  --%>
  var value = '<%=request.getParameter("getsalesman")%>';
  var rowIndex = '<%=request.getParameter("rowBoundIndex")%>';
  radata='<%=ClsClientDAO.salSearch()%>';
        $(document).ready(function () { 
         //	var url1;
        	 
        		//  url1='disclient.jsp'; 
        		 
        	
             var num = 0; 
            var source = 
            {
                datatype: "json",
                datafields: [

     						{name : 'salesmancode', type: 'String'  },
     						{name : 'salesmanname', type: 'String'  },
     						
     						{name : 'doc_no', type: 'String'  },
     						
     						
     						
                          	],
                          	localdata: radata,
                          //	 url: url1,
          
				
                
                pager: function (pagenum, pagesize, oldpagenum) {
                   
                }
            };
            
            var dataAdapter = new $.jqx.dataAdapter(source,
            		 {
                		loadError: function (xhr, status, error) {
	                    alert(error);    
	                    }
		            }		
            );
            $("#jqxareasearch").jqxGrid(
            {
                width: '100%',
                height: 350,
                source: dataAdapter,
                columnsresize: true,
                selectionmode: 'singlerow',
            
            
     					
                columns: [
					{ text: 'SL#', sortable: false, filterable: false, editable: false,hidden:true,
                              groupable: false, draggable: false, resizable: false,
                              datafield: '', columntype: 'number', width: '4%',
                              cellsrenderer: function (row, column, value) {
                                  return "<center><div style='margin:4px;'>" + (value + 1) + "</div></center>";
                              }
					},
					{ text: 'SALESMAN CODE', datafield: 'salesmancode', width: '45%' },
					{ text: 'SALESMAN NAME', datafield: 'salesmanname', width: '55%' },
					{ text: 'DOC NO', datafield: 'doc_no', width: '50%',hidden:true }
					
					
					 
					
					]
            });
    
            //$("#jqxareasearch").jqxGrid('addrow', null, {});
      
				            
				/*          $('#jqxareasearch').on('rowdoubleclick', function (event) 
				            		{ 
				              	var rowindex1=event.args.rowindex;
				            	  var temp="";
				            	  temp=temp+$('#jqxareasearch').jqxGrid('getcellvalue', rowindex1, "country_name");
				                temp=temp+","+$('#jqxareasearch').jqxGrid('getcellvalue', rowindex1, "region_name");
				                //temp=temp+","+$('#jqxareasearch').jqxGrid('getcellvalue', rowindex1, "region_name");
				                
				                if(value==0)
				            	   {
				                	
						            	document.getElementById("txtareadet").value=temp; 
						                document.getElementById("txtareaid").value=$('#jqxareasearch').jqxGrid('getcellvalue', rowindex1, "areadocno");
						               document.getElementById("txtarea").value=$('#jqxareasearch').jqxGrid('getcellvalue', rowindex1, "area");
				            	   }
				              
				               
				               
				               if(value==1)
				            	   {
				            	  
				               			$('#cpDetailsGrid').jqxGrid('setcellvalue', rowIndex, "area",$('#jqxareasearch').jqxGrid('getcellvalue', rowindex1, "area"));
				               			$('#cpDetailsGrid').jqxGrid('setcellvalue', rowIndex, "areaid",$('#jqxareasearch').jqxGrid('getcellvalue', rowindex1, "areadocno"));
				            	   }
				              
				                $('#areainfowindow').jqxWindow('close');
				               
				            
				            		 }); 	 */ 
				           
				            		 
				            		  $('#jqxareasearch').on('rowdoubleclick', function (event) 
							            		{ 
				            				var rowindex1=event.args.rowindex;
				            			  document.getElementById("txtsalesman").value=$('#jqxareasearch').jqxGrid('getcellvalue', rowindex1, "salesmanname");
				            			  document.getElementById("salid").value=$('#jqxareasearch').jqxGrid('getcellvalue', rowindex1, "doc_no");
				            			  
				            			  $('#salesmaninfowindow').jqxWindow('close');
							            		  }); 
                  }); 
				       
                       
    </script>
    <div id="jqxareasearch"></div>
    
    </body>
</html>