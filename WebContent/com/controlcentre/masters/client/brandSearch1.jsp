<%@page import="javax.servlet.http.HttpServletRequest" %>
<%@page import="javax.servlet.http.HttpSession" %>
 <%@page import="com.controlcentre.masters.client.ClsClientDAO" %>
 
 <%
 
 ClsClientDAO ClsClientDAO=new ClsClientDAO();
 %>

<%String temp=request.getParameter("id")==null?"0":request.getParameter("id");
%>
<%-- <jsp:include page="../../../../includes.jsp"></jsp:include>  --%>
<script type="text/javascript">
 
$(document).ready(function () {
    
	 var   branddata='<%=ClsClientDAO.suitbrandSearch(session)%>';
	
 
 // prepare the data
    var source =
    {
        datatype: "json",
        datafields: [

                  		{name : 'doc_no',type:'number'},
                  		{name : 'brand',type:'String'},
                  		
                  		
                  		],
				    localdata: branddata,
        
        
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
    
    
    $("#brandSearch").jqxGrid(
    {
        width: '100%',
        height: 382,
        source: dataAdapter,
 
        
        filterable: true,
        showfilterrow: true,
        selectionmode: 'siglerow',
       sortable:false,
        columns: [
               
				
       				{ text: 'Doc No',datafield:'doc_no',width:'20%',hidden:true},
       				{ text:'Brand',datafield:'brand',width:'100%'}
       
                 
					]

    });
    
 
    $('#brandSearch').on('rowdoubleclick', function (event) {
 
 
        
    	var rowindex2 =$('#rowindex').val();
    	// alert(rowindex1);
        var rowindex1= event.args.rowindex;
        $('#vehdetgrid').jqxGrid('setcellvalue', rowindex2, "brand" ,$('#brandSearch').jqxGrid('getcellvalue', rowindex1, "brand"));
        $('#vehdetgrid').jqxGrid('setcellvalue', rowindex2, "brandid" , $('#brandSearch').jqxGrid('getcellvalue', rowindex1, "doc_no"));
        
        
        
        $('#vehdetgrid').jqxGrid('setcellvalue', rowindex2, "model" ,'');
        $('#vehdetgrid').jqxGrid('setcellvalue', rowindex2, "modelid" , 0);
        
        $('#vehdetgrid').jqxGrid('setcellvalue', rowindex2, "submodel" ,'');
        $('#vehdetgrid').jqxGrid('setcellvalue', rowindex2, "submodelid" ,0);
        
        
        
        $('#vehdetgrid').jqxGrid('setcellvalue', rowindex2, "bsize" ,'');
        $('#vehdetgrid').jqxGrid('setcellvalue', rowindex2, "bsizeid" , 0);
        
        
        $('#vehdetgrid').jqxGrid('setcellvalue', rowindex2, "esize" ,'');
        $('#vehdetgrid').jqxGrid('setcellvalue', rowindex2, "esizeid" , 0);
        
        
        $('#vehdetgrid').jqxGrid('setcellvalue', rowindex2, "csize" ,'');
        $('#vehdetgrid').jqxGrid('setcellvalue', rowindex2, "csizeid" , 0);
        
        
        
 
    	
    	$('#brandwindow').jqxWindow('close');
    	});
    
 
});

	
	
</script>

<div id="brandSearch"></div>