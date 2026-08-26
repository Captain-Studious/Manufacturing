  
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
 String masterdoc_no=request.getParameter("masterdoc_no")==null?"0":request.getParameter("masterdoc_no");
 String unit=request.getParameter("unit")==null?"0":request.getParameter("unit");
 
 
%>


  <%@page import="javax.servlet.http.HttpServletRequest" %>
<%@page import="javax.servlet.http.HttpSession" %>
<%@page import="com.procurement.purchase.purchaseinvoice.ClspurchaseinvoiceDAO"%>
<% ClspurchaseinvoiceDAO purchaseDAO = new ClspurchaseinvoiceDAO(); %> 
 
 
 
<script type="text/javascript">



            	
        $(document).ready(function () { 	
        	var Reqmaster;

        	var temps='<%=mode%>';

        	if(temps=='E')
        		{
        		  Reqmaster= "";
         		 <%--  '<%=purchaseDAO.searchBatch(session,psrno,mode,masterdoc_no) %>'; --%>  
        	  
        	 
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
     		 			 
     						{name : 'exp_date', type: 'date'  },
     						{name : 'stockid', type: 'int'   },
     					 
     						{name : 'batch_no', type: 'string'  },
     						 
     						 
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

            
            
            $("#batchsearchgrid").jqxGrid(
            {
                width: '100%',
                height: 350,
                source: dataAdapter,
                editable: true,
                selectionmode: 'singlecell',
                pagermode: 'default',
             
                
          
          

                       
                columns: [      
                         
                          
                            { text: 'Qty', datafield: 'qty', width: '20%' ,cellsformat:'d2' },	
                            { text: 'FOC', datafield: 'foc', width: '20%' ,cellsformat:'d2' },	
						 
							{ text: 'Batch No', datafield: 'batch_no', width: '45%' , editable: true}	,
							 
							{ text: 'Expiry Date', datafield: 'exp_date', width: '15%'  ,columntype: 'datetimeinput',cellsformat:'dd.MM.yyyy', editable: true},
						
											
							
							
			              ]
               
            });
            $("#batchsearchgrid").jqxGrid('addrow', null, {});
            $("#batchsearchgrid").on('cellclick', function (event) 
            		{
      	  document.getElementById("errormsg").innerText="" ;
            		});  
            
            
            
            
            $("#batchsearchgrid").on('cellvaluechanged', function (event) 
                    {
                 	
            
            var rows = $('#batchsearchgrid').jqxGrid('getrows');
            
       	 var rowindextemp = event.args.rowindex;
            
            var rowlength= rows.length;
            if(rowindextemp == rowlength-1)
            	{  
            $("#batchsearchgrid").jqxGrid('addrow', null, {});
            	} 
            		});  
            	 
            
            $("#popupWindow").jqxWindow({ width: 250, resizable: false,  isModal: true, autoOpen: false, cancelButton: $("#Cancel"), modalOpacity: 0.01 });
            // create context menu
               var contextMenu = $("#Menu").jqxMenu({ width: 200, height: 25, autoOpenPopup: false, mode: 'popup'});
               $("#batchsearchgrid").on('contextmenu', function () {
                   return false;
               });
               
            $("#Menu").on('itemclick', function (event) {
            	   var args = event.args;
                   var rowindex = $("#batchsearchgrid").jqxGrid('getselectedrowindex');
                   if ($.trim($(args).text()) == "Edit Selected Row") {
                       editrow = rowindex;
                       var offset = $("#batchsearchgrid").offset();
                       $("#popupWindow").jqxWindow({ position: { x: parseInt(offset.left) + 60, y: parseInt(offset.top) + 60} });
                       // get the clicked row's data and initialize the input fields.
                       var dataRecord = $("#batchsearchgrid").jqxGrid('getrowdata', editrow);
                       // show the popup window.
                       $("#popupWindow").jqxWindow('show');
                   }
                   else {
                       var rowid = $("#batchsearchgrid").jqxGrid('getrowid', rowindex);
                       $("#batchsearchgrid").jqxGrid('deleterow', rowid);
                       
                       
                   }
               });
               
               $("#batchsearchgrid").on('rowclick', function (event) {
                   if (event.args.rightclick) {
        		   if(document.getElementById("mode").value=="A" || document.getElementById("mode").value=="E"){
                       $("#batchsearchgrid").jqxGrid('selectrow', event.args.rowindex);
                       var scrollTop = $(window).scrollTop();
                       var scrollLeft = $(window).scrollLeft();
                       contextMenu.jqxMenu('open', parseInt(event.args.originalEvent.clientX) + 5 + scrollLeft, parseInt(event.args.originalEvent.clientY) + 5 + scrollTop);
                       return false;
                   }
        		   }
               });
      
   
        });
    </script>
    
  <div id="batchsearchgrid"></div>

    <div id="popupWindow">
 <div id='Menu'>
        <ul>
            <li>Delete Selected Row</li>
        </ul>
       </div>
       </div>
  
 