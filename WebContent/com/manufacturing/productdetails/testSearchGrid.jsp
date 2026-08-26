<%-- <jsp:include page="../../../includeso.jsp"></jsp:include> --%>
<%@page import="com.manufacturing.productdetails.*"%>
<%
ClsMProductDetailsDAO DAO= new ClsMProductDetailsDAO(); 
String griddatafield = request.getParameter("griddatafield")==null?"":request.getParameter("griddatafield");
String gridname = request.getParameter("gridname")==null?"":request.getParameter("gridname");
String gridrowindex = request.getParameter("gridrowindex")==null?"":request.getParameter("gridrowindex");
String dtype = request.getParameter("dtype")==null?"":request.getParameter("dtype");
String id = request.getParameter("id")==null?"":request.getParameter("id");

%> 
<script type="text/javascript">
var testsearchdata=[];
var id='<%=id%>';
if(id=="1"){
	testsearchdata='<%=DAO.getTestSearch(id)%>';
}
var dtype='<%=dtype%>';        
        $(document).ready(function () { 
         
        	
            var source = 
            {
                datatype: "json",
                datafields: [
                             
			 
     						{name : 'doc_no', type: 'number'  },
     						{name : 'name', type: 'String'  },
     						{name : 'description', type: 'String'  }
      						
                          	],
                          	localdata: testsearchdata,
                          
          
				
                
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
            $("#testSearchGrid").jqxGrid(
            {
                width: '100%',
                height: 345,
                source: dataAdapter,
                columnsresize: true,
                filterable:true,
                showfilterrow:true,
           
                selectionmode: 'singlerow',
             
               
                //Add row method
	
     						
     					
     					
                columns: [
					{ text: 'Doc No', datafield: 'doc_no', width: '10%' },
					{ text: 'Name', datafield: 'name', width: '20%' },
					{ text: 'Description', datafield: 'description', width: '70%' }
					
					
					
					]
            });
    
     		$('#testSearchGrid').on('rowdoubleclick', function (event) 
			{ 
				var rowindex=event.args.rowindex;
				var griddatafield='<%=griddatafield%>';
				var gridname='<%=gridname%>';
				var gridrowindex='<%=gridrowindex%>'; 
				console.log(rowindex+"::"+griddatafield+"::"+gridname+"::"+gridrowindex);
				$('#'+gridname).jqxGrid('setcellvalue',gridrowindex,griddatafield,$('#testSearchGrid').jqxGrid('getcellvalue',rowindex,'name'));
				$('#'+gridname).jqxGrid('setcellvalue',gridrowindex,'testid',$('#testSearchGrid').jqxGrid('getcellvalue',rowindex,'doc_no'));
				if(gridname=="qualityGrid"){
					$('#'+gridname).jqxGrid('setcellvalue',gridrowindex,'desc',$('#testSearchGrid').jqxGrid('getcellvalue',rowindex,'description'));
				}
				if(gridname=="inprocessGrid"){
					$('#'+gridname).jqxGrid('setcellvalue',gridrowindex,'desc1',$('#testSearchGrid').jqxGrid('getcellvalue',rowindex,'description'));
				}
				$('#testwindow').jqxWindow('close');
			});	 
				           
        
                  }); 
				       
                       
    </script>
    <div id="testSearchGrid"></div>
    
