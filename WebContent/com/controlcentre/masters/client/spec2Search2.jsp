<%@page import="javax.servlet.http.HttpServletRequest" %>
<%@page import="javax.servlet.http.HttpSession" %>
 <%@page import="com.controlcentre.masters.client.ClsClientDAO" %>
 
 <%
 
 ClsClientDAO ClsClientDAO=new ClsClientDAO();
 %>
<%-- <jsp:include page="../../../../includes.jsp"></jsp:include>  --%>
<%
String brandid=request.getParameter("brandid")==null?"0":request.getParameter("brandid");
String modelid=request.getParameter("modelid")==null?"0":request.getParameter("modelid");
String submodelid=request.getParameter("submodelid")==null?"0":request.getParameter("submodelid");
%>
<script type="text/javascript">
 
$(document).ready(function () {
   
   var spec2data;
   
	   spec2data='<%=ClsClientDAO.suitSpec2Search(session,brandid,modelid,submodelid)%>';
	
    // prepare the data
    var source =
    {
        datatype: "json",
        datafields: [

                  		{name : 'doc_no',type:'number'},
                  		{name : 'spec',type:'String'},
                  		
                  		
                  		],
				    localdata: spec2data,
        
        
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
    
    
    $("#spec2Search").jqxGrid(
    {
        width: '100%',
        height: 382,
        source: dataAdapter,
 
        showfilterrow: true,
        filterable: true,
        selectionmode: 'singlerow',
       sortable:false,
        columns: [
               
				
       				{ text: 'Doc No',datafield:'doc_no',width:'20%',hidden:true},
       				{ text:'Engin Size',datafield:'spec',width:'100%'}
       
                  /* { text: 'Idle Days', datafield: 'vrent', width: '8%' }, */
					]

    });
    
    $('#spec2Search').on('rowdoubleclick', function (event) {
    	 
/*         var rowindex1 = event.args.rowindex;
        document.getElementById("spec2id").value = $('#spec2Search').jqxGrid('getcellvalue', rowindex1, "doc_no");
        
        document.getElementById("enginsize").value = $('#spec2Search').jqxGrid('getcellvalue', rowindex1, "spec"); */
        
        
     	var rowindex2 =$('#rowindex').val();
    	// alert(rowindex1);
        var rowindex1= event.args.rowindex;
        $('#vehdetgrid').jqxGrid('setcellvalue', rowindex2, "esize" ,$('#spec2Search').jqxGrid('getcellvalue', rowindex1, "spec"));
        $('#vehdetgrid').jqxGrid('setcellvalue', rowindex2, "esizeid" , $('#spec2Search').jqxGrid('getcellvalue', rowindex1, "doc_no"));
     
        
     
    	$('#spec2window').jqxWindow('close');
    	});
});

	
	
</script>

<div id="spec2Search"></div>