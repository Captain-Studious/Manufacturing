  
<%--   <jsp:include page="../../../../includes.jsp"></jsp:include>   --%>

<%@page import="javax.servlet.http.HttpServletRequest" %>
<%@page import="javax.servlet.http.HttpSession" %>
 <%

 
 
 String aa=request.getParameter("aa")==null?"0":request.getParameter("aa");

 
 String reftype=request.getParameter("reftype")==null?"0":request.getParameter("reftype");

 String rowno=request.getParameter("rowno")==null?"0":request.getParameter("rowno");
 String psrno=request.getParameter("psrno")==null?"0":request.getParameter("psrno");

 String locid=request.getParameter("locid")==null?"0":request.getParameter("locid");
 
 

 String mode=request.getParameter("mode")==null?"0":request.getParameter("mode");
 String value=request.getParameter("value")==null?"0":request.getParameter("value");
 String unit=request.getParameter("unit")==null?"0":request.getParameter("unit");
 
 
%>


 
<%@page import="com.sales.marketing.salesorder.ClsSalesOrderDAO"%>
<%ClsSalesOrderDAO DAO= new ClsSalesOrderDAO();%>
 
 
 
 
<script type="text/javascript">



            	
        $(document).ready(function () { 	
        	var Reqmaster;

        	var temps='<%=aa%>';

        	if(temps=='yes')
        		{
        	  Reqmaster= '<%=DAO.searchqty(session,reftype,psrno,locid,aa,mode,value) %>'; 
        		}
        	else
        		{
        		Reqmaster; 
        		}

        	 
 
                     
            // prepare the data
            var source =
            {
                datatype: "json",
                datafields: [
                                
                             {name : 'qty', type: 'number'}, 
                             {name : 'foc', type: 'number'}, 
     		 				{name : 'stkqty', type: 'number'},
     						{name : 'exp_date', type: 'date'  },
     						{name : 'stockid', type: 'int'   },
     						{name : 'cost_price', type: 'number'  },
     						{name : 'batch_no', type: 'string'  },
     						 
     						{name : 'chk', type: 'bool'  },
                 ],
                 localdata: Reqmaster,
                
                
                pager: function (pagenum, pagesize, oldpagenum) {
                    // callback called when a page or page size is changed.
                }
                                        
            };
            
            var dataAdapter = new $.jqx.dataAdapter(source,
            		 {
                		loadError: function (xhr, status, error) {
	                    alert(error);    
	                    }
			            
		            }		
            );

            
            
            $("#qtysearchgrid").jqxGrid(
            {
                width: '100%',
                height: 350,
                source: dataAdapter,
                editable: true,
                selectionmode: 'singlecell',
                pagermode: 'default',
             
                
          
          

                       
                columns: [      
                            { text: ' ', datafield: 'chk',columntype: 'checkbox',  width: '5%',cellsalign: 'center', align: 'center'},
                            
                          
                            { text: 'Qty', datafield: 'qty', width: '15%' ,cellsformat:'d2' },	
                            { text: 'FOC', datafield: 'foc', width: '15%' ,cellsformat:'d2' },	
							{ text: 'Stock Qty', datafield: 'stkqty', width: '15%'  ,cellsformat:'d2', editable: false  },
							
							{ text: 'stockid', datafield: 'stockid', width: '10%', editable: false,hidden:true },
							{ text: 'Cost Price', datafield: 'cost_price', width: '20%' , editable: false,cellsalign: 'right', align: 'right',cellsformat:'d2',hidden:true }	,
							{ text: 'Batch No', datafield: 'batch_no' , editable: false}	,
							 
							{ text: 'Expiry Date', datafield: 'exp_date', width: '12%' ,cellsformat:'dd.MM.yyyy', editable: false},
						
											
							
							
			              ]
               
            });
            $("#qtysearchgrid").on('cellclick', function (event) 
            		{
      	  document.getElementById("errormsg").innerText="" ;
            		});  
        
            $("#qtysearchgrid").on('cellvaluechanged', function (event) 
            		{
            		
           	 var rowindextemp = event.args.rowindex;
            	  var df=event.args.datafield;
            	  if(df == "qty")
             		  { 
             		  
            		  var qty=$('#qtysearchgrid').jqxGrid('getcellvalue', rowindextemp, "qty"); 
            		  var stkqty=$('#qtysearchgrid').jqxGrid('getcellvalue', rowindextemp, "stkqty"); 
            		  var foc=$('#qtysearchgrid').jqxGrid('getcellvalue', rowindextemp, "foc"); 
            		  
            		  if(foc==""||typeof(foc)=="undefined"|| typeof(foc)=="NaN")
            			  {
            			  foc=0;
            			  }
            	 
            		 
            		  if((parseFloat(qty)+parseFloat(foc))>parseFloat(stkqty))
            			  {
            			  
            				 document.getElementById("errormsg").innerText="Quantity should not be greater than available quantity "+(stkqty-foc);
            				 
            				 $('#qtysearchgrid').jqxGrid('setcellvalue', rowindextemp, "qty",(stkqty-foc)); 
            			  return 0;
            			  
            			  }
            		  
             		  }
            	
            	  if(df == "foc")
         		  { 
         		 
        		  var qty=$('#qtysearchgrid').jqxGrid('getcellvalue', rowindextemp, "qty"); 
        		  var stkqty=$('#qtysearchgrid').jqxGrid('getcellvalue', rowindextemp, "stkqty"); 
        		  var foc=$('#qtysearchgrid').jqxGrid('getcellvalue', rowindextemp, "foc"); 
        		  
        		  if(qty==""||typeof(qty)=="undefined"|| typeof(qty)=="NaN")
        			  {
        			  qty=0;
        			  }
        	 
        		  
        		  if((parseFloat(qty)+parseFloat(foc))>parseFloat(stkqty))
        			  {
        			  
        				 document.getElementById("errormsg").innerText="Foc should not be greater than available Foc " +(stkqty-qty);
        				 
        				 $('#qtysearchgrid').jqxGrid('setcellvalue', rowindextemp, "foc",(stkqty-qty)); 
        			  return 0;
        			  
        			  }
        		  
        		  
         		  }
        	
            	
            	
            	
            		    
            		});  
            
            
      
   
        });
    </script>
    <div id=qtysearchgrid></div>
 