<%@page import="com.operations.clientrelations.clientreview.ClsClientReviewDAO" %>
<% ClsClientReviewDAO DAO=new ClsClientReviewDAO(); %>
<% String cldocno = request.getParameter("id")==null?"0":request.getParameter("id"); %> 

<script type="text/javascript">

	    <%-- var data5= '<%=DAO.quotationLoading(cldocno) %>'; --%>
	   
        $(document).ready(function () { 
        	var chk='<%=cldocno%>';
        	var data5 =null;
        	if(chk==1){
        	  data5 = [
     	        {
     	           "prcs": "ProcessA","stdate": "02-03-2021 10:00","edate": "02-03-2021 19:00"
     	        },
     	       {
      	           "prcs": "ProcessB","stdate": "04-03-2021 14:00","edate": "04-03-2021 19:00"
      	        },
      	      {
      	           "prcs": "ProcessC","stdate": "03-03-2021 08:00","edate": "05-03-2021 13:00"
      	        }
     	    ];
        	}
            // prepare the data
            var source =
            {
                datatype: "json",
                datafields: [
							{name : 'prcs', type: 'string' },
     						{name : 'stdate', type: 'string'   },
     						{name : 'edate', type: 'string'  }
     						
     						
     					     					     						  											
                 ],
                 localdata: data5,
                
                
                pager: function (pagenum, pagesize, oldpagenum) {
                    // callback called when a page or page size is changed.
                }
                                        
            };
            
            var dataAdapter = new $.jqx.dataAdapter(source,
            		 {
                		loadError: function (xhr, status, error) {
	                    alert(error);    
	                    }
			            
		            } );

            
            
            $("#jqxprcsGrid").jqxGrid(
            {
            	width: '100%',
                height: 160,
                source: dataAdapter,
                columnsresize: true,
                editable: false,
                sortable: true,
                selectionmode: 'singlerow',
                localization: {thousandsSeparator: ""},

                columns: [
                	
							{ text: 'Process', datafield: 'prcs', width: '20%' },			
							{ text: 'Starttime ', datafield: 'stdate' },	
							{ text: 'Endtime', datafield: 'edate' }	
						
							
							
						 ],
            });
            
           
        });

</script>
<div id="jqxprcsGrid"></div>
 <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

</body>
</html>