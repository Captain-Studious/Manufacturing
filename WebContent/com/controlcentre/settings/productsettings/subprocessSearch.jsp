<%@page import="com.controlcentre.settings.productsettings.productmaster.ClsProductMasterDAO"%>
<%@page import="javax.servlet.http.HttpServletRequest" %>
<%@page import="javax.servlet.http.HttpSession" %>
 <%
 ClsProductMasterDAO DAO= new ClsProductMasterDAO();                        
 String sclname = request.getParameter("sclname")==null?"":request.getParameter("sclname");
 String rno = request.getParameter("rno")==null?"":request.getParameter("rno");
 String id =request.getParameter("id")==null?"":request.getParameter("id");   
%> 

 <script type="text/javascript">
  var loadprsdata;       
  loadprsdata='<%=DAO.mainPRSSearch(session,rno,sclname,id)%>';                       
               
        $(document).ready(function () { 
         
             var num = 0; 
            var source = 
            {
                datatype: "json",
                datafields: [
     						{name : 'name', type: 'String'  },
     						{name : 'doc_no', type: 'String'  },
      						{name : 'description', type: 'String'  },
                          	],
                          	localdata: loadprsdata,
                
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
            $("#jqxmainprssearch").jqxGrid(
            {
                width: '100%',
                height: 280,
                source: dataAdapter,
                columnsresize: true,
                selectionmode: 'singlerow',
                //Add row method
                columns: [
					  { text: 'DOC NO', datafield: 'doc_no', width: '30%' },
					  { text: 'NAME', datafield: 'name', width: '40%' }, 
					  { text: 'DESCRIPTION', datafield: 'description'},    
					]
            });
            $('#jqxmainprssearch').on('rowdoubleclick', function (event){ 
				        	  var rowindex1=event.args.rowindex;
				               document.getElementById("docno").value=$('#jqxmainprssearch').jqxGrid('getcellvalue', rowindex1, "doc_no");
				               document.getElementById("processes").value=$('#jqxmainprssearch').jqxGrid('getcellvalue', rowindex1, "name");    
				               document.getElementById("prodesc").value=$('#jqxmainprssearch').jqxGrid('getcellvalue', rowindex1, "description");
				               $('#window').jqxWindow('close');        
				               funSetlabel(); 
				               var docno=$('#jqxmainprssearch').jqxGrid('getcellvalue', rowindex1, "doc_no");                          
				       		   $('#prsdiv').load("processGrid.jsp?docno="+docno+"&id="+1);   
			});	  
		 }); 
    </script>
    <div id="jqxmainprssearch"></div>   