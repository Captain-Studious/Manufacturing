<%@page import="javax.servlet.http.HttpServletRequest" %>
<%@page import="javax.servlet.http.HttpSession" %>
<%@page import="com.dashboard.procurment.partSearch.ClsPartSearchDAO"%>
<%ClsPartSearchDAO DAO= new ClsPartSearchDAO();%>
<%String temp=request.getParameter("id")==null?"0":request.getParameter("id");
String yomfrm = request.getParameter("yomfrm")==null  ?"NA":request.getParameter("yomfrm").trim();

String yomto = request.getParameter("yomto")==null  ?"NA":request.getParameter("yomto").trim();

%>
<%-- <jsp:include page="../../../../includes.jsp"></jsp:include>  --%>
<script type="text/javascript">
 
$(document).ready(function () {
    
	 var   branddata='<%=DAO.suitbrandSearch(session,yomfrm,yomto)%>';
	
 
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
       
                  /* { text: 'Idle Days', datafield: 'vrent', width: '8%' }, */
					]

    });
    
 
    $('#brandSearch').on('rowdoubleclick', function (event) {
 
        var rowindex1 = event.args.rowindex;
        
        
        document.getElementById("brandid").value = $('#brandSearch').jqxGrid('getcellvalue', rowindex1, "doc_no");
    
         document.getElementById("brand").value = $('#brandSearch').jqxGrid('getcellvalue', rowindex1, "brand");
         
         document.getElementById("model").value ="";
         document.getElementById("modelid").value ="";
         
         document.getElementById("submodel").value ="";
         document.getElementById("submodelid").value ="";
         
         document.getElementById("bedsize").value ="";
         document.getElementById("spec1id").value ="";
         
         document.getElementById("enginsize").value ="";
         document.getElementById("spec2id").value ="";
         
         document.getElementById("cabinsize").value ="";
         document.getElementById("spec3id").value ="";
 
         
    	
    	$('#brandwindow').jqxWindow('close');
    	});
    
 
});

	
	
</script>

<div id="brandSearch"></div>