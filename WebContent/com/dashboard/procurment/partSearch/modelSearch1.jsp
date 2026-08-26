<%@page import="javax.servlet.http.HttpServletRequest" %>
<%@page import="javax.servlet.http.HttpSession" %>
<%@page import="com.dashboard.procurment.partSearch.ClsPartSearchDAO"%>
<%ClsPartSearchDAO DAO= new ClsPartSearchDAO();%>
<%String temp=request.getParameter("id")==null?"0":request.getParameter("id");
String brandid=request.getParameter("brandid")==null?"0":request.getParameter("brandid");
System.out.println("==brandid===="+brandid);

String yomfrm = request.getParameter("yomfrm")==null  ?"NA":request.getParameter("yomfrm").trim();

String yomto = request.getParameter("yomto")==null  ?"NA":request.getParameter("yomto").trim();
%>
<%-- <jsp:include page="../../../../includes.jsp"></jsp:include>  --%>
<script type="text/javascript">
 
$(document).ready(function () {
   var id='<%=temp%>';
   var   modeldata='<%=DAO.suitmodelSearch(session,brandid,yomfrm,yomto)%>';
 
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
    	 
        var rowindex1 = event.args.rowindex;
        
        
        document.getElementById("modelid").value = $('#modelSearch').jqxGrid('getcellvalue', rowindex1, "doc_no");
    
         document.getElementById("model").value = $('#modelSearch').jqxGrid('getcellvalue', rowindex1, "model");
         
         
         document.getElementById("submodel").value ="";
         document.getElementById("submodelid").value ="";
         
         document.getElementById("bedsize").value ="";
         document.getElementById("spec1id").value ="";
         
         document.getElementById("enginsize").value ="";
         document.getElementById("spec2id").value ="";
         
         document.getElementById("cabinsize").value ="";
         document.getElementById("spec3id").value ="";
         
    
    	$('#modelwindow').jqxWindow('close');
    	});
});

	
	
</script>

<div id="modelSearch"></div>