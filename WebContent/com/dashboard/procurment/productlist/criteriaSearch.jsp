<%@page import="javax.servlet.http.HttpServletRequest" %>
<%@page import="javax.servlet.http.HttpSession" %>
<%@page import="com.dashboard.procurment.productlist.ClsProductlistDAO" %>
<%ClsProductlistDAO DAO= new ClsProductlistDAO();%>

<%-- <jsp:include page="../../../../includes.jsp"></jsp:include>  --%>
<script type="text/javascript">
 
$(document).ready(function () {
 
   var ptypedata;
   ptypedata='<%=DAO.criteriaSearch(session)%>';
	
    // prepare the data
    var source =
    {
        datatype: "json",
        datafields: [

                  		{name : 'doc_no',type:'number'},
                  		{name : 'crtname',type:'String'},
                  		
                  		
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
    
    
    $("#criteriaSearch").jqxGrid(
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
       				{ text:'Criteria',datafield:'crtname',width:'75%'}
       
                  /* { text: 'Idle Days', datafield: 'vrent', width: '8%' }, */
					]

    });
    
    $( "#btncrt" ).click(function() {
    	
    	var rows = $("#criteriaSearch").jqxGrid('selectedrowindexes');
   
    	if(rows!=""){
    		if(document.getElementById("searchdetails").value==""){
        		document.getElementById("searchdetails").value="CRTNAME";
        		document.getElementById("searchdetails").value+="\n---------------------------";
        		document.getElementById("hidcriteria").value="CRTNAME";
        	}
        	else{
        		document.getElementById("searchdetails").value+="\n\nCRTNAME";
        		document.getElementById("searchdetails").value+="\n---------------------------";
        		document.getElementById("hidcriteria").value+="\nCRTNAME";
        	}	
    	}
    	
		document.getElementById("hidcriteriaid").value="";
    	
    	for(var i=0;i<rows.length;i++){
    		var dummy=$('#criteriaSearch').jqxGrid('getcellvalue',rows[i],'crtname');
    		var docno=$('#criteriaSearch').jqxGrid('getcellvalue',rows[i],'doc_no');
    		document.getElementById("searchdetails").value+="\n"+dummy;
    		document.getElementById("hidcriteria").value+="\n"+dummy;
    		if(i==0){
    			document.getElementById("hidcriteriaid").value=docno;
    		}
    		else{
    			document.getElementById("hidcriteriaid").value+=","+docno;
    		}
    	}
   	
    	
    	
    	$('#criteriawindow').jqxWindow('close');
    	});
    
     $("#btncancel" ).click(function() {
    	$('#criteriawindow').jqxWindow('close');
    	});
});

	
	
</script>
<div align="center" style="padding-bottom:4px;"><button type="button" id="btncrt" name="btnok" class="myButton">OK</button>&nbsp;&nbsp;<button type="button" id="btncancel" name="btncancel" class="myButton" >Cancel</button></div>
<div id="criteriaSearch"></div>