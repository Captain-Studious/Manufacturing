<%@page import="javax.servlet.http.HttpServletRequest" %>
<%@page import="javax.servlet.http.HttpSession" %>
 <%@page import="com.controlcentre.masters.client.ClsClientDAO" %>
 
 <%
 
 ClsClientDAO ClsClientDAO=new ClsClientDAO();
 %>
<%
String brandid=request.getParameter("brandid")==null?"0":request.getParameter("brandid");
String modelid=request.getParameter("modelid")==null?"0":request.getParameter("modelid");
String submodelid=request.getParameter("submodelid")==null?"0":request.getParameter("submodelid");
%>
<script type="text/javascript">
 
$(document).ready(function () {
   
   var spec3data;
   
	   spec3data='<%=ClsClientDAO.suitSpec3Search(session,brandid,modelid,submodelid)%>';
	
    // prepare the data
    var source =
    {
        datatype: "json",
        datafields: [

                  		{name : 'doc_no',type:'number'},
                  		{name : 'spec',type:'String'},
                  		
                  		
                  		],
				    localdata: spec3data,
        
        
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
    
    
    $("#spec3Search").jqxGrid(
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
       				{ text:'Cabin Size',datafield:'spec',width:'100%'}
       
                  /* { text: 'Idle Days', datafield: 'vrent', width: '8%' }, */
					]

    });
    
 
    $('#spec3Search').on('rowdoubleclick', function (event) {
/*    	 
        var rowindex1 = event.args.rowindex;
        document.getElementById("spec3id").value = $('#spec3Search').jqxGrid('getcellvalue', rowindex1, "doc_no");
        
        document.getElementById("cabinsize").value = $('#spec3Search').jqxGrid('getcellvalue', rowindex1, "spec");
        
         */
        
     	var rowindex2 =$('#rowindex').val();
    	// alert(rowindex1);
        var rowindex1= event.args.rowindex;
        $('#vehdetgrid').jqxGrid('setcellvalue', rowindex2, "csize" ,$('#spec3Search').jqxGrid('getcellvalue', rowindex1, "spec"));
        $('#vehdetgrid').jqxGrid('setcellvalue', rowindex2, "csizeid" , $('#spec3Search').jqxGrid('getcellvalue', rowindex1, "doc_no"));
     
        
     
        
     
    	$('#spec3window').jqxWindow('close');
    	});
});

	
	
</script>

<div id="spec3Search"></div>