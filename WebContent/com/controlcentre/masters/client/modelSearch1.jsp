<%@page import="javax.servlet.http.HttpServletRequest" %>
<%@page import="javax.servlet.http.HttpSession" %>
 <%@page import="com.controlcentre.masters.client.ClsClientDAO" %>
 
 <%
 
 ClsClientDAO ClsClientDAO=new ClsClientDAO();
 %>

<%String temp=request.getParameter("id")==null?"0":request.getParameter("id");
String brandid=request.getParameter("brandid")==null?"0":request.getParameter("brandid");
System.out.println("==brandid===="+brandid);
%>
<%-- <jsp:include page="../../../../includes.jsp"></jsp:include>  --%>
<script type="text/javascript">
 
$(document).ready(function () {
   var id='<%=temp%>';
   var   modeldata='<%=ClsClientDAO.suitmodelSearch(session,brandid)%>';
 
    // prepare the data
    var source =
    {
        datatype: "json",
        datafields: [

                  		{name : 'doc_no',type:'number'},
                  		{name : 'model',type:'String'},
                  		{name : 'brand',type:'String'},
                  		
                  		
                  		],
				    localdata: modeldata,
        
        
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
    
    
    $("#modelSearch").jqxGrid(
    {
        width: '100%',
        height: 382,
        source: dataAdapter,
 
      
        filterable: true,
        showfilterrow: true,
        selectionmode: 'singlerow',
       sortable:false,
        columns: [
               
				
       				{ text: 'Doc No',datafield:'doc_no',width:'20%',hidden:true},
       				{ text:'Model',datafield:'model',width:'100%'},
       				{ text:'Brand',datafield:'brand',width:'40%',hidden:true}
       
                  /* { text: 'Idle Days', datafield: 'vrent', width: '8%' }, */
					]

    });
    $('#modelSearch').on('rowdoubleclick', function (event) {
    	 
        
    	var rowindex2 =$('#rowindex').val();
    	// alert(rowindex1);
        var rowindex1= event.args.rowindex;
        $('#vehdetgrid').jqxGrid('setcellvalue', rowindex2, "model" ,$('#modelSearch').jqxGrid('getcellvalue', rowindex1, "model"));
        $('#vehdetgrid').jqxGrid('setcellvalue', rowindex2, "modelid" , $('#modelSearch').jqxGrid('getcellvalue', rowindex1, "doc_no"));
        
        
        $('#vehdetgrid').jqxGrid('setcellvalue', rowindex2, "submodel" ,'');
        $('#vehdetgrid').jqxGrid('setcellvalue', rowindex2, "submodelid" ,0);
        
        
        
        $('#vehdetgrid').jqxGrid('setcellvalue', rowindex2, "bsize" ,'');
        $('#vehdetgrid').jqxGrid('setcellvalue', rowindex2, "bsizeid" , 0);
        
        
        $('#vehdetgrid').jqxGrid('setcellvalue', rowindex2, "esize" ,'');
        $('#vehdetgrid').jqxGrid('setcellvalue', rowindex2, "esizeid" , 0);
        
        
        $('#vehdetgrid').jqxGrid('setcellvalue', rowindex2, "csize" ,'');
        $('#vehdetgrid').jqxGrid('setcellvalue', rowindex2, "csizeid" , 0);
        
        
    	$('#modelwindow').jqxWindow('close');
    	});
});

	
	
</script>

<div id="modelSearch"></div>