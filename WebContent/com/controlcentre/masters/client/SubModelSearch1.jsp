<%@page import="javax.servlet.http.HttpServletRequest" %>
<%@page import="javax.servlet.http.HttpSession" %>
 <%@page import="com.controlcentre.masters.client.ClsClientDAO" %>
 
 <%
 
 ClsClientDAO ClsClientDAO=new ClsClientDAO();
 %>

<%
String brandid=request.getParameter("brandid")==null?"0":request.getParameter("brandid");
String smodelid=request.getParameter("modelid")==null?"0":request.getParameter("modelid");

System.out.println("==brandid===="+brandid);
System.out.println("==smodelid===="+smodelid);
%>
<%-- <jsp:include page="../../../../includes.jsp"></jsp:include>  --%>
<script type="text/javascript">
 
$(document).ready(function () {
	
   var submodeldata;
	   submodeldata='<%=ClsClientDAO.subModelSearch(session,brandid,smodelid)%>';
	    // prepare the data
    var source =
    {
        datatype: "json",
        datafields: [

                  		{name : 'doc_no',type:'number'},
                  		{name : 'submodel',type:'String'},
                  		{name : 'model',type:'String'},
                  		
                  		
                  		],
				    localdata: submodeldata,
        
        
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
    
    
    $("#submodelSearch").jqxGrid(
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
       				{ text:'Sub Model',datafield:'submodel',width:'100%'},
       				{ text:'Model',datafield:'model',width:'40%',hidden:true}
       
                  /* { text: 'Idle Days', datafield: 'vrent', width: '8%' }, */
					]

    });
    
    $('#submodelSearch').on('rowdoubleclick', function (event) {
   	 
 
    	var rowindex2 =$('#rowindex').val();
    	// alert(rowindex1);
        var rowindex1= event.args.rowindex;
        $('#vehdetgrid').jqxGrid('setcellvalue', rowindex2, "submodel" ,$('#submodelSearch').jqxGrid('getcellvalue', rowindex1, "submodel"));
        $('#vehdetgrid').jqxGrid('setcellvalue', rowindex2, "submodelid" , $('#submodelSearch').jqxGrid('getcellvalue', rowindex1, "doc_no"));
 
        
 
        $('#vehdetgrid').jqxGrid('setcellvalue', rowindex2, "bsize" ,'');
        $('#vehdetgrid').jqxGrid('setcellvalue', rowindex2, "bsizeid" , 0);
        
        
        $('#vehdetgrid').jqxGrid('setcellvalue', rowindex2, "esize" ,'');
        $('#vehdetgrid').jqxGrid('setcellvalue', rowindex2, "esizeid" , 0);
        
        
        $('#vehdetgrid').jqxGrid('setcellvalue', rowindex2, "csize" ,'');
        $('#vehdetgrid').jqxGrid('setcellvalue', rowindex2, "csizeid" , 0);
        
        
    	$('#submodelwindow').jqxWindow('close');
    	});
});

	
	
</script>

<div id="submodelSearch"></div>