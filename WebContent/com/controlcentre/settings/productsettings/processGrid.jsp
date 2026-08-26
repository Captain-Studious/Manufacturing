<%@page import="com.controlcentre.settings.productsettings.productmaster.ClsProductMasterDAO"%>
<%@page import="javax.servlet.http.HttpServletRequest" %>
<%@page import="javax.servlet.http.HttpSession" %>
 <%
  ClsProductMasterDAO DAO= new ClsProductMasterDAO();   
  String id=request.getParameter("id")==null || request.getParameter("id").trim()==""?"0":request.getParameter("id").trim().toString();
  String docno=request.getParameter("docno")==null || request.getParameter("docno").trim()==""?"0":request.getParameter("docno").trim().toString();
%>
 <script type="text/javascript">   
 
 var dataprs='<%=DAO.processLoad(session,docno,id)%>';                                 
        $(document).ready(function () { 

        	var source = 
            {
                datatype: "json",
                datafields: [
                         
     						{name : 'rowno', type: 'int'  },
     						{name : 'test', type: 'String' },
     						{name : 'method', type: 'String' },
     						{name : 'limits', type: 'String' },    
     						{name : 'description', type: 'String' }   
                          	],
                          	localdata: dataprs,
                
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
            $("#jqxprsGrid").jqxGrid(  
            {
                width: '99%',
                height: 300,
                source: dataAdapter,
                selectionmode: 'singlerow',
                editable: true,
                columnsresize: true,
     			enabletooltips:true,	
     			showfilterrow:true,       
     			filterable:true,    
                
                columns: [
					 { text: 'Row No', datafield: 'rowno', width: '20%',hidden:true },    
					 { text: 'Test Name', datafield: 'test', width: '20%' },
					 { text: 'Description', datafield: 'description'},
					 { text: 'Method', datafield: 'method', width: '15%' },
					 { text: 'Limit', datafield: 'limits', width: '10%' },         
					]
            });   
            $("#jqxprsGrid").jqxGrid('addrow', null, {});                 
}); 
</script>
<div id="jqxprsGrid"></div>   
      