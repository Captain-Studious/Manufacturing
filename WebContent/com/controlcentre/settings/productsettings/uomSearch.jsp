<%@page import="com.controlcentre.settings.productsettings.productmaster.ClsProductMasterDAO"%>
<%@page import="javax.servlet.http.HttpServletRequest" %>
<%@page import="javax.servlet.http.HttpSession" %>
 <%
 ClsProductMasterDAO DAO= new ClsProductMasterDAO();                        
 String id =request.getParameter("id")==null?"":request.getParameter("id");     
%> 

 <script type="text/javascript">
  var uomdata;       
  uomdata='<%=DAO.uomSearch(session)%>';                                        
               
        $(document).ready(function () { 
         
             var num = 0; 
            var source = 
            {
                datatype: "json",
                datafields: [
     						{name : 'uom', type: 'String'  },
     						{name : 'doc_no', type: 'String'  },
                          	],
                          	localdata: uomdata,
                
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
            $("#jqxuomSearch").jqxGrid(
            {
                width: '100%',
                height: 280,
                source: dataAdapter,
                columnsresize: true,
                selectionmode: 'singlerow',
                //Add row method
                columns: [
					  { text: 'DOC NO', datafield: 'doc_no', width: '40%' },
					  { text: 'UOM', datafield: 'uom', width: '60%' }, 
					]
            });
            $('#jqxuomSearch').on('rowdoubleclick', function (event){ 
				        	  var rowindex1=event.args.rowindex;
				               document.getElementById("ecuom").value=$('#jqxuomSearch').jqxGrid('getcellvalue', rowindex1, "doc_no");
				               document.getElementById("ecuoms").value=$('#jqxuomSearch').jqxGrid('getcellvalue', rowindex1, "uom");    
				               $('#uomSearchWindow').jqxWindow('close');           
			});	  
		 }); 
    </script>
    <div id="jqxuomSearch"></div>   