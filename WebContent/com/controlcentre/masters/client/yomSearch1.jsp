<%@page import="javax.servlet.http.HttpServletRequest" %>
<%@page import="javax.servlet.http.HttpSession" %>
 <%@page import="com.controlcentre.masters.client.ClsClientDAO" %>
 
 <%
 
 ClsClientDAO ClsClientDAO=new ClsClientDAO();
 %>


<%-- <jsp:include page="../../../../includes.jsp"></jsp:include>  --%>
<script type="text/javascript">
 
$(document).ready(function () {
 
   var yomdata;
 	   yomdata='<%=ClsClientDAO.yomSearch(session)%>';
	
    // prepare the data
    var source =
    {
        datatype: "json",
        datafields: [

                  		{name : 'doc_no',type:'number'},
                  		{name : 'yom',type:'String'},
                  		
                  		
                  		],
				    localdata: yomdata,
        
        
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
    
    
    $("#yomSearch").jqxGrid(
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
       				{ text:'YOM',datafield:'yom',width:'100%'}
       
                  /* { text: 'Idle Days', datafield: 'vrent', width: '8%' }, */
					]

    });
    
    
    
    $('#yomSearch').on('rowdoubleclick', function (event) {
 
    
    	var rowindex2 =$('#rowindex').val();
    	// alert(rowindex1);
        var rowindex1= event.args.rowindex;
        $('#vehdetgrid').jqxGrid('setcellvalue', rowindex2, "yom" ,$('#yomSearch').jqxGrid('getcellvalue', rowindex1, "yom"));
        $('#vehdetgrid').jqxGrid('setcellvalue', rowindex2, "yomid" , $('#yomSearch').jqxGrid('getcellvalue', rowindex1, "doc_no"));
        
        
        
   	
 
    	$('#yomwindow').jqxWindow('close');
    	});
});

	
	
</script>

<div id="yomSearch"></div>