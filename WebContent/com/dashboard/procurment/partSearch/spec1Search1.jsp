<%@page import="javax.servlet.http.HttpServletRequest" %>
<%@page import="javax.servlet.http.HttpSession" %>
<%@page import="com.dashboard.procurment.partSearch.ClsPartSearchDAO"%>
<%ClsPartSearchDAO DAO= new ClsPartSearchDAO();%>
<%-- <jsp:include page="../../../../includes.jsp"></jsp:include>  --%>
<script type="text/javascript">
<%
String brandid=request.getParameter("brandid")==null?"0":request.getParameter("brandid");
String modelid=request.getParameter("modelid")==null?"0":request.getParameter("modelid");
String submodelid=request.getParameter("submodelid")==null?"0":request.getParameter("submodelid");
String yomfrm = request.getParameter("yomfrm")==null  ?"NA":request.getParameter("yomfrm").trim();

String yomto = request.getParameter("yomto")==null  ?"NA":request.getParameter("yomto").trim();
%>
$(document).ready(function () {
  
   var spec1data;
  
	    spec1data='<%=DAO.suitSpec1Search(session,brandid,modelid,submodelid,yomfrm,yomto)%>';
	
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
 
        var rowindex1 = event.args.rowindex;
        document.getElementById("spec1id").value = $('#spec1Search').jqxGrid('getcellvalue', rowindex1, "doc_no");
        
        document.getElementById("bedsize").value = $('#spec1Search').jqxGrid('getcellvalue', rowindex1, "spec");
     
    	$('#spec1window').jqxWindow('close');
    	});
});

	
	
</script>

<div id="spec1Search"></div>