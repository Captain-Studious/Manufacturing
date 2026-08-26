<%@page import="com.controlcentre.settings.productsettings.productmaster.ClsProductMasterDAO"%>
<%@page import="javax.servlet.http.HttpServletRequest" %>
<%@page import="javax.servlet.http.HttpSession" %>
 <%
 ClsProductMasterDAO DAO= new ClsProductMasterDAO();                        
 String id =request.getParameter("id")==null?"":request.getParameter("id");     
%> 

 <script type="text/javascript">
  var faidata;       
  faidata='<%=DAO.faiSearch(session)%>';                                      
               
        $(document).ready(function () { 
         
             var num = 0; 
            var source = 
            {
                datatype: "json",
                datafields: [
     						{name : 'fai', type: 'String'  },
     						{name : 'doc_no', type: 'String'  },
                          	],
                          	localdata: faidata,
                
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
            $("#jqxfaiSearch").jqxGrid(
            {
                width: '100%',
                height: 280,
                source: dataAdapter,
                columnsresize: true,
                selectionmode: 'singlerow',
                //Add row method
                columns: [
					  { text: 'DOC NO', datafield: 'doc_no', width: '40%' },
					  { text: 'FIXED ASSET ID', datafield: 'fai', width: '60%' }, 
					]
            });
            $('#jqxfaiSearch').on('rowdoubleclick', function (event){ 
				        	  var rowindex1=event.args.rowindex;
				               document.getElementById("mdfaid").value=$('#jqxfaiSearch').jqxGrid('getcellvalue', rowindex1, "doc_no");
				               document.getElementById("mdfaids").value=$('#jqxfaiSearch').jqxGrid('getcellvalue', rowindex1, "fai");    
				               $('#faiSearchWindow').jqxWindow('close');           
			});	  
		 }); 
    </script>
    <div id="jqxfaiSearch"></div>   