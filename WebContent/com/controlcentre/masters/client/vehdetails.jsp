 <%@page import="javax.servlet.http.HttpServletRequest" %>
<%@page import="javax.servlet.http.HttpSession" %>
 <%@page import="com.controlcentre.masters.client.ClsClientDAO" %>
 
 <%
 
 ClsClientDAO ClsClientDAO=new ClsClientDAO();
 
String cldocno=request.getParameter("cldocno")==null?"0":request.getParameter("cldocno").toString();
 

%>
<script type="text/javascript">
		 var vdata;  
        $(document).ready(function () { 
        	var cldocno='<%=cldocno%>';
 
        	
    		if(cldocno>=0){
    			vdata='<%=ClsClientDAO.prdsuitLoad(session,cldocno)%>'; 
    		}


    		// prepare the data  
            var source =
            {
                datatype: "json",
                datafields: [
     						
{name : 'regno', type: 'string'  },
{name : 'model', type: 'string'  },
{name : 'modelid', type: 'int'   },
{name : 'submodel', type: 'string'  },
{name : 'submodelid', type: 'int'   },
{name : 'brand', type: 'string'   },
{name : 'brandid', type: 'int'   },
{name : 'yom', type: 'string'   },

{name : 'yomid', type: 'int'   },
{name : 'esize', type: 'string'   },
{name : 'esizeid', type: 'int'   },
{name : 'bsize', type: 'string'   },
{name : 'bsizeid', type: 'int'   },

{name : 'csize', type: 'string'   },
{name : 'csizeid', type: 'int'   },

{name : 'forms', type: 'string'   },


{name : 'doc_no', type: 'string'   },


     						
							
                        ],
                         localdata: vdata,  
                
                pager: function (pagenum, pagesize, oldpagenum) {
                    // callback called when a page or page size is changed.
                }
            };
            
            var dataAdapter = new $.jqx.dataAdapter(source);
            
            $("#vehdetgrid").jqxGrid(
            {
                width: '100%',
                height: 150,
                source: dataAdapter,
                editable: true,
                disabled:true,
                columnsresize: true,
                selectionmode: 'singlecell',
                handlekeyboardnavigation: function (event) {
                 
                	
                	
                	
               	 var cell1 = $('#vehdetgrid').jqxGrid('getselectedcell');
            	 if (cell1 != undefined && cell1.datafield == 'brand') {  
            	
                    var key = event.charCode ? event.charCode : event.keyCode ? event.keyCode : 0; 
                    if (key == 114) { 
                    	
                     	 document.getElementById("rowindex").value = cell1.rowindex;
                   
                    	                   
                  	  brandSearchContent('brandSearch1.jsp');
                  	 $('#vehdetgrid').jqxGrid('render');
                    	 
                    	 
                    }
                    }
               
            	 	
               	 var cell1 = $('#vehdetgrid').jqxGrid('getselectedcell');
            	 if (cell1 != undefined && cell1.datafield == 'model') {  
            	
                    var key = event.charCode ? event.charCode : event.keyCode ? event.keyCode : 0; 
                    if (key == 114) { 
                    	
                     	 document.getElementById("rowindex").value = cell1.rowindex;
                   
                    	                   
                     	var  brandval=$('#vehdetgrid').jqxGrid('getcellvalue', cell1.rowindex, "brandid");
                        
                     	 modelSearchContent('modelSearch1.jsp?brandid='+brandval);
                  	 $('#vehdetgrid').jqxGrid('render');
                    	 
                    	 
                    }
                    }
               
            	 
         	 	
               	 var cell1 = $('#vehdetgrid').jqxGrid('getselectedcell');
            	 if (cell1 != undefined && cell1.datafield == 'submodel') {  
            	
                    var key = event.charCode ? event.charCode : event.keyCode ? event.keyCode : 0; 
                    if (key == 114) { 
                    	
                     	 document.getElementById("rowindex").value = cell1.rowindex;
                   
                    	                   
                     	  var  brandid=$('#vehdetgrid').jqxGrid('getcellvalue',  cell1.rowindex, "brandid");
                       	  var  modelid=$('#vehdetgrid').jqxGrid('getcellvalue',  cell1.rowindex, "modelid");
                       	            	   
                       
                       	 subModelSearchContent('SubModelSearch1.jsp?modelid='+modelid+'&brandid='+brandid, $('#submodelwindow'));
                  	 $('#vehdetgrid').jqxGrid('render');
                    	 
                    	 
                    }
                    }
            	 

               	 var cell1 = $('#vehdetgrid').jqxGrid('getselectedcell');
            	 if (cell1 != undefined && cell1.datafield == 'yom') {  
            	
                    var key = event.charCode ? event.charCode : event.keyCode ? event.keyCode : 0; 
                    if (key == 114) { 
                    	
                     	 document.getElementById("rowindex").value = cell1.rowindex;
                   
                 
                      	  $('#vehdetgrid').jqxGrid('clearselection');
                      	yomSearchContent('yomSearch1.jsp');
                  	 $('#vehdetgrid').jqxGrid('render');
                    	 
                    	 
                    }
                    }
            	 
            	 
            	 
             	 var cell1 = $('#vehdetgrid').jqxGrid('getselectedcell');
            	 if (cell1 != undefined && cell1.datafield == 'bsize') {  
            	
                    var key = event.charCode ? event.charCode : event.keyCode ? event.keyCode : 0; 
                    if (key == 114) { 
                    	
                     	 document.getElementById("rowindex").value = cell1.rowindex;
                   
                 
                      	  $('#vehdetgrid').jqxGrid('clearselection');
                      	   
                   	   var  brandid=$('#vehdetgrid').jqxGrid('getcellvalue', cell1.rowindex, "brandid");
                       	  var  modelid=$('#vehdetgrid').jqxGrid('getcellvalue', cell1.rowindex, "modelid");
                       	  var  submodelid=$('#vehdetgrid').jqxGrid('getcellvalue', cell1.rowindex, "submodelid");
                   	   
                   
                       	  spec1SearchContent('spec1Search1.jsp?modelid='+modelid+'&brandid='+brandid+"&submodelid="+submodelid, $('#spec1window'));
                    	 
                    	 
                    }
                    }
                	
            	 
             	 var cell1 = $('#vehdetgrid').jqxGrid('getselectedcell');
            	 if (cell1 != undefined && cell1.datafield == 'esize') {  
            	
                    var key = event.charCode ? event.charCode : event.keyCode ? event.keyCode : 0; 
                    if (key == 114) { 
                    	
                     	 document.getElementById("rowindex").value = cell1.rowindex;
                   
                 
                      	  $('#vehdetgrid').jqxGrid('clearselection');
                      	   
                      	   var  brandid=$('#vehdetgrid').jqxGrid('getcellvalue', rowindextemp, "brandid");
                      	  var  modelid=$('#vehdetgrid').jqxGrid('getcellvalue', rowindextemp, "modelid");
                      	  var  submodelid=$('#vehdetgrid').jqxGrid('getcellvalue', rowindextemp, "submodelid");
                      
                      	 spec2SearchContent('spec2Search2.jsp?modelid='+modelid+'&brandid='+brandid+"&submodelid="+submodelid, $('#spec2window'));
                    	 
                    }
                    }
            	 
            	 
               	
            	 
             	 var cell1 = $('#vehdetgrid').jqxGrid('getselectedcell');
            	 if (cell1 != undefined && cell1.datafield == 'csize') {  
            	
                    var key = event.charCode ? event.charCode : event.keyCode ? event.keyCode : 0; 
                    if (key == 114) { 
                    	
                     	 document.getElementById("rowindex").value = cell1.rowindex;
                   
                 
                      	  $('#vehdetgrid').jqxGrid('clearselection');
                      	   
                      	  var  brandid=$('#vehdetgrid').jqxGrid('getcellvalue', rowindextemp, "brandid");
                     	  var  modelid=$('#vehdetgrid').jqxGrid('getcellvalue', rowindextemp, "modelid");
                     	  var  submodelid=$('#vehdetgrid').jqxGrid('getcellvalue', rowindextemp, "submodelid");
                      
                     	 spec3SearchContent('spec3Search3.jsp?modelid='+modelid+'&brandid='+brandid+"&submodelid="+submodelid, $('#spec3window'));
                    	 
                    }
                    }
                		
                		
                	
                	
   },      
                columns: [
							{ text: 'Sr. No.',datafield: '',columntype:'number', width: '4%', cellsrenderer: function (row, column, value) {
	                               return "<div style='margin:4px;'>" + (value + 1) + "</div>";
                            }   },
                         
                            { text: 'Reg No', datafield: 'regno', editable: true, width: '8%' },
                            { text: 'Yom', datafield: 'yom', width: '7%' , editable: false},
                            { text: 'Yomid', datafield: 'yomid', editable: false,  width: '10%' ,hidden:true},
                          
                            { text: 'modelid', datafield: 'modelid', width: '5%'  ,hidden:true },
                            { text: 'brandid', datafield: 'brandid', width: '5%'  ,hidden:true },
                            { text: 'submodelid', datafield: 'submodelid', width: '5%'  ,hidden:true },
                      
                            { text: 'Brand', datafield: 'brand', editable: false, width: '16%'  },
                            { text: 'Model', datafield: 'model', editable: false, width: '16%'  },
                            { text: 'Sub Model', datafield: 'submodel', editable: false, width: '15%' },
                            { text: 'EngineSize', datafield: 'esize', editable: false, width: '12%' },
                            { text: 'esizeid', datafield: 'esizeid' , width: '11%' ,hidden:true  },
                            { text: 'BedSize', datafield: 'bsize', editable: false, width: '11%' },
                           
                            { text: 'bsizeid', datafield: 'bsizeid' , width: '11%' ,hidden:true },
                          
                            { text: 'CabinSize', datafield: 'csize', editable: false, width: '11%'  },
                            
                            
                            { text: 'csizeid', datafield: 'csizeid'  , width: '12%'  ,hidden:true },
                            
                            { text: 'doc_no', datafield: 'doc_no'  , width: '12%'  ,hidden:true  },
                         

                            { text: 'froms', datafield: 'forms', editable: false, width: '11%'   ,hidden:true  },
	
							
						

						]
            });
      		 
           
            
            if($("#mode").val()=='A' || $("#mode").val()=='E')
            	{
        		$('#vehdetgrid').jqxGrid({ disabled: false});
            	}
            
            $("#vehdetgrid").on('cellvaluechanged', function (event) 
         		   {
         		        		  
         		       var rowBoundIndex = args.rowindex;
         		       
         		      var rows = $('#vehdetgrid').jqxGrid('getrows');
                      var rowlength= rows.length;
                      if(rowBoundIndex==rowlength-1)
                      {
                      	  $("#vehdetgrid").jqxGrid('addrow', null, {});	
                      }
         		       
            
         		  }); 
/*             $("#vehdetgrid").on('cellclick', function (event) 
             		{
         
         	   var rowindextemp2 = event.args.rowindex;
                document.getElementById("rowindex").value = rowindextemp2;
               
                if(event.args.columnindex ==1)
             	   {
             	
                $("#vehdetgrid").jqxGrid('clearselection');
             	   }
                if(event.args.columnindex ==3)
         	   {
         	
                $("#vehdetgrid").jqxGrid('clearselection');
         	   } 
                if(event.args.columnindex ==6)
         	   {
         	
                $("#vehdetgrid").jqxGrid('clearselection');
         	   } 
                
                     }); 
 */
            $('#vehdetgrid').on('celldoubleclick', function (event) {
              
            	var datafield = event.args.datafield;
            	if(datafield=="yom")
 	    	   { 
            		
              	 var rowindextemp = event.args.rowindex;
              	    document.getElementById("rowindex").value = rowindextemp;  
              	  $('#vehdetgrid').jqxGrid('clearselection');
              	yomSearchContent('yomSearch1.jsp');
              	
              		  } 
              	  
            	if(datafield=="brand")
  	    	   { 

         	 var rowindextemp = event.args.rowindex;
         	    document.getElementById("rowindex").value = rowindextemp;  
         		  $('#vehdetgrid').jqxGrid('clearselection');
         	 
         
         	  brandSearchContent('brandSearch1.jsp');
         	
         		  } 
         	  
            	if(datafield=="model")
   	    	   { 

          	 var rowindextemp = event.args.rowindex;
          	    document.getElementById("rowindex").value = rowindextemp;  
          		  $('#vehdetgrid').jqxGrid('clearselection');
          	   var  brandval=$('#vehdetgrid').jqxGrid('getcellvalue', rowindextemp, "brandid");
          
          	 modelSearchContent('modelSearch1.jsp?brandid='+brandval);
          	
          		  } 
        	  
               	if(datafield=="submodel")
    	    	   { 

           	 var rowindextemp = event.args.rowindex;
           	    document.getElementById("rowindex").value = rowindextemp;  
           		  $('#vehdetgrid').jqxGrid('clearselection');
           	   var  brandid=$('#vehdetgrid').jqxGrid('getcellvalue', rowindextemp, "brandid");
           	  var  modelid=$('#vehdetgrid').jqxGrid('getcellvalue', rowindextemp, "modelid");
           	            	   
           
           	 subModelSearchContent('SubModelSearch1.jsp?modelid='+modelid+'&brandid='+brandid, $('#submodelwindow'));
           	
           		  } 
         	  
               	if(datafield=="bsize")
 	    	   { 

        	 var rowindextemp = event.args.rowindex;
        	    document.getElementById("rowindex").value = rowindextemp;  
        		  $('#vehdetgrid').jqxGrid('clearselection');
 
        	   
        	   
        	   var  brandid=$('#vehdetgrid').jqxGrid('getcellvalue', rowindextemp, "brandid");
            	  var  modelid=$('#vehdetgrid').jqxGrid('getcellvalue', rowindextemp, "modelid");
            	  var  submodelid=$('#vehdetgrid').jqxGrid('getcellvalue', rowindextemp, "submodelid");
        	   
        
            	  spec1SearchContent('spec1Search1.jsp?modelid='+modelid+'&brandid='+brandid+"&submodelid="+submodelid, $('#spec1window'));
        	
        		  } 
               	
              	if(datafield=="esize")
  	    	   { 

         	 var rowindextemp = event.args.rowindex;
         	    document.getElementById("rowindex").value = rowindextemp;  
         		  $('#vehdetgrid').jqxGrid('clearselection');
           	   var  brandid=$('#vehdetgrid').jqxGrid('getcellvalue', rowindextemp, "brandid");
         	  var  modelid=$('#vehdetgrid').jqxGrid('getcellvalue', rowindextemp, "modelid");
         	  var  submodelid=$('#vehdetgrid').jqxGrid('getcellvalue', rowindextemp, "submodelid");
         
         	 spec2SearchContent('spec2Search2.jsp?modelid='+modelid+'&brandid='+brandid+"&submodelid="+submodelid, $('#spec2window'));
         	
         		  } 
             	if(datafield=="csize")
   	    	   { 

          	 var rowindextemp = event.args.rowindex;
          	    document.getElementById("rowindex").value = rowindextemp;  
          		  $('#vehdetgrid').jqxGrid('clearselection');
           	   var  brandid=$('#vehdetgrid').jqxGrid('getcellvalue', rowindextemp, "brandid");
         	  var  modelid=$('#vehdetgrid').jqxGrid('getcellvalue', rowindextemp, "modelid");
         	  var  submodelid=$('#vehdetgrid').jqxGrid('getcellvalue', rowindextemp, "submodelid");
          
         	 spec3SearchContent('spec3Search3.jsp?modelid='+modelid+'&brandid='+brandid+"&submodelid="+submodelid, $('#spec3window'));
          	
          		  } 
              	  
                  }); 
            
          
            
            
          
        });
</script>

<div id="vehdetgrid"></div>




   