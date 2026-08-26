<%@page import="javax.servlet.http.HttpServletRequest" %>
<%@page import="javax.servlet.http.HttpSession" %>
 <%@page import="com.procurement.purchase.purchaseorder.ClspurchaseorderDAO"%>
<%ClspurchaseorderDAO DAO= new ClspurchaseorderDAO(); 

String acno=request.getParameter("acno")==null || request.getParameter("acno")==""?"0":request.getParameter("acno");

%>


 
<script type="text/javascript">


var locdata= "";
<%-- '<%=DAO.searchbrand(acno) %>'; --%>   
        $(document).ready(function () { 
                     
            // prepare the data
            var source =
            {
                datatype: "json",
                datafields: [


                             {name : 'doc_no', type: 'String'  },    
      						{name : 'brandname', type: 'String'  },
      				 
                             
                             
                        ],
                		localdata: locdata, 
                
                pager: function (pagenum, pagesize, oldpagenum) {
                    // callback called when a page or page size is changed.
                }
                                        
            };
            
            var dataAdapter = new $.jqx.dataAdapter(source);
            
            $("#locgrid").jqxGrid(
            {
                width: '100%',
                height: 335,
                source: dataAdapter,
           
                selectionmode: 'singlerow',
                
                columns: [
                          
          				{ text: 'ID', datafield: 'doc_no', width: '20%',hidden:true},
    					{ text: 'Brand', datafield: 'brandname', width: '100%' }
										
						]
            });
            
             $('#locgrid').on('rowdoubleclick', function (event) {
                var rowindex1 = event.args.rowindex;
 
              //   txtlocationid
                 document.getElementById("errormsg").innerText="";
                document.getElementById("brandids").value = $('#locgrid').jqxGrid('getcellvalue', rowindex1, "doc_no");
                
                document.getElementById("brandnames").value = $('#locgrid').jqxGrid('getcellvalue', rowindex1, "brandname");
                $("#serviecGrid").jqxGrid('clear');
 			    $("#serviecGrid").jqxGrid('addrow', null, {});
                reloads();
              $('#brwindow').jqxWindow('close');  
        
            }); 
             
        });
    </script>
    <div id="locgrid"></div>