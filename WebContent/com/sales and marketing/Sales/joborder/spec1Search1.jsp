<%@page import="javax.servlet.http.HttpServletRequest" %>
<%@page import="javax.servlet.http.HttpSession" %>
 <%@page import="com.controlcentre.masters.client.ClsClientDAO" %>
 
 <%
 
 ClsClientDAO ClsClientDAO=new ClsClientDAO();
 %>
<%-- <jsp:include page="../../../../includes.jsp"></jsp:include>  --%>
<script type="text/javascript">
<%
String brandid=request.getParameter("brandid")==null?"0":request.getParameter("brandid");
String modelid=request.getParameter("modelid")==null?"0":request.getParameter("modelid");
String submodelid=request.getParameter("submodelid")==null?"0":request.getParameter("submodelid");
%>
$(document).ready(function () {
  
   var spec1data;
  
	    spec1data='<%=ClsClientDAO.suitSpec1Search(session,brandid,modelid,submodelid)%>';
	
    // prepare the data
    var source =
    {
        datatype: "json",
        datafields: [

                  		{name : 'doc_no',type:'number'},
                  		{name : 'spec',type:'String'},
                  		
                  		
                  		],
				    localdata: spec1data,
        
        
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
    
    
    $("#spec1Search").jqxGrid(
    {
        width: '100%',
        height: 382,
        source: dataAdapter,
 
        showfilterrow: true,
        filterable: true,
        selectionmode: 'Singlerow',
       sortable:false,
        columns: [
               
				
       				{ text: 'Doc No',datafield:'doc_no',width:'20%',hidden:true},
       				{ text:'Bed Size',datafield:'spec',width:'100%'}
       
                  /* { text: 'Idle Days', datafield: 'vrent', width: '8%' }, */
					]

    });
    
    $('#spec1Search').on('rowdoubleclick', function (event) {
 
        var rowindex1= event.args.rowindex;
        
        
        document.getElementById("bsize").value =$('#spec1Search').jqxGrid('getcellvalue', rowindex1, "spec");
        document.getElementById("bsizeid").value= $('#spec1Search').jqxGrid('getcellvalue', rowindex1, "doc_no");
        
  
     
    	$('#spec1window').jqxWindow('close');
    	});
});

	
	
</script>

<div id="spec1Search"></div>