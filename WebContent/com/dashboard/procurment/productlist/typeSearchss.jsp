<%@page import="javax.servlet.http.HttpServletRequest" %>
<%@page import="javax.servlet.http.HttpSession" %>
<%@page import="com.dashboard.procurment.productlist.ClsProductlistDAO" %>
<%ClsProductlistDAO DAO= new ClsProductlistDAO();%>

<%-- <jsp:include page="../../../../includes.jsp"></jsp:include>  --%>
<script type="text/javascript">
 
$(document).ready(function () {
 
   var ptypedata;
   ptypedata='<%=DAO.prodTypeSearch(session)%>';
	
    // prepare the data
    var source =
    {
        datatype: "json",
        datafields: [

                  		{name : 'doc_no',type:'number'},
                  		{name : 'type',type:'String'},
                  		
                  		
                  		],
				    localdata: ptypedata,
        
        
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
    
    
    $("#prdTypeSearch").jqxGrid(
    {
        width: '100%',
        height: 310,
        source: dataAdapter,
        showaggregates:true,
        filtermode:'excel',
        filterable: true,
        selectionmode: 'checkbox',
       sortable:false,
        columns: [
               
				
       				{ text: 'Doc No',datafield:'doc_no',width:'20%'},
       				{ text:'PRDTYPE',datafield:'type',width:'75%'}
       
                  /* { text: 'Idle Days', datafield: 'vrent', width: '8%' }, */
					]

    });
    
    $( "#btntype" ).click(function() {
    	
    	var rows = $("#prdTypeSearch").jqxGrid('selectedrowindexes');
   
    	if(rows!=""){
    		if(document.getElementById("searchdetails").value==""){
        		document.getElementById("searchdetails").value="PRDTYPE";
        		document.getElementById("searchdetails").value+="\n---------------------------";
        		document.getElementById("hidprdtype").value="PRDTYPE";
        	}
        	else{
        		document.getElementById("searchdetails").value+="\n\nPRDTYPE";
        		document.getElementById("searchdetails").value+="\n---------------------------";
        		document.getElementById("hidprdtype").value+="\nPRDTYPE";
        	}	
    	}
    	
		document.getElementById("hidprdtypeid").value="";
    	
    	for(var i=0;i<rows.length;i++){
    		var dummy=$('#prdTypeSearch').jqxGrid('getcellvalue',rows[i],'type');
    		var docno=$('#prdTypeSearch').jqxGrid('getcellvalue',rows[i],'doc_no');
    		document.getElementById("searchdetails").value+="\n"+dummy;
    		document.getElementById("hidprdtype").value+="\n"+dummy;
    		if(i==0){
    			document.getElementById("hidprdtypeid").value=docno;
    		}
    		else{
    			document.getElementById("hidprdtypeid").value+=","+docno;
    		}
    	}
   	
    	
    	
    	$('#typewindow').jqxWindow('close');
    	});
    
     $("#btncancel" ).click(function() {
    	$('#typewindow').jqxWindow('close');
    	});
});

	
	
</script>
<div align="center" style="padding-bottom:4px;"><button type="button" id="btntype" name="btnok" class="myButton">OK</button>&nbsp;&nbsp;<button type="button" id="btncancel" name="btncancel" class="myButton" >Cancel</button></div>
<div id="prdTypeSearch"></div>