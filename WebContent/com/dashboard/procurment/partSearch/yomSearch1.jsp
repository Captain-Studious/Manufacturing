<%@page import="javax.servlet.http.HttpServletRequest" %>
<%@page import="javax.servlet.http.HttpSession" %>
<%@page import="com.dashboard.procurment.partSearch.ClsPartSearchDAO"%>
<%ClsPartSearchDAO DAO= new ClsPartSearchDAO();%>

<%-- <jsp:include page="../../../../includes.jsp"></jsp:include>  --%>
<script type="text/javascript">
 
$(document).ready(function () {
 
   var yomdata;
 	   yomdata='<%=DAO.yomSearch(session)%>';
	
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
 
        var rowindex1 = event.args.rowindex;
        
        document.getElementById("yomid").value = $('#yomSearch').jqxGrid('getcellvalue', rowindex1, "doc_no");
        
        document.getElementById("yom").value = $('#yomSearch').jqxGrid('getcellvalue', rowindex1, "yom");
   	
 
    	$('#yomwindow').jqxWindow('close');
    	});
});

	
	
</script>

<div id="yomSearch"></div>