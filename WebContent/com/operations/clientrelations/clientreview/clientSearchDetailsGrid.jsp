<%@page import="javax.servlet.http.HttpServletRequest" %>
<%@page import="javax.servlet.http.HttpSession" %>
 <%
 String accountno = request.getParameter("accountno")==null?"0":request.getParameter("accountno");
 String accountname = request.getParameter("accountname")==null?"0":request.getParameter("accountname");
 String mobile = request.getParameter("mobile")==null?"0":request.getParameter("mobile");
 String currency = request.getParameter("currency")==null?"0":request.getParameter("currency");
 String check = request.getParameter("check")==null?"0":request.getParameter("check");
%> 
<%@page import="com.operations.clientrelations.clientreview.ClsClientReviewDAO"%>
<%ClsClientReviewDAO ClsClientReviewDAO= new ClsClientReviewDAO();%>
 <script type="text/javascript">
 
	var clientData='<%=ClsClientReviewDAO.clientDetailsSearch(session, accountno, accountname, mobile, currency, check)%>';
 	$(document).ready(function () { 

 		var source = 
         {
             datatype: "json",
             datafields: [
                           {name : 'doc_no', type: 'int'   },
  						   {name : 'account', type: 'string'   },
  						   {name : 'description', type: 'string'  },
  						   {name : 'currency', type: 'string'  },
  						   {name : 'mobile', type: 'string'  },
  						   {name : 'curid', type: 'int'  },
  						   {name : 'rate', type: 'string'  },
  						   {name : 'cldocno', type: 'int'  },
  						   {name : 'spcl_notes', type: 'string'  }
                       	],
                       	localdata: clientData,
             
             pager: function (pagenum, pagesize, oldpagenum) {
                
             }
         };
         
         var dataAdapter = new $.jqx.dataAdapter(source,
         		 {
             		loadError: function (xhr, status, error) {
                  alert(error);    
                  }
           }		
         );
         $("#jqxClientDetailsSearch").jqxGrid(
         {
             width: '100%',
             height: 303,
             source: dataAdapter,
             selectionmode: 'singlerow',
  			 editable: false,
  			 columnsresize: true,
  			 localization: {thousandsSeparator: ""},
  			
             columns: [
						{ text: 'Doc No',  datafield: 'doc_no', hidden:true, width: '5%' },
						{ text: 'Account', datafield: 'account', width: '25%' },
						{ text: 'Account Name', datafield: 'description', width: '50%' },
						{ text: 'Currency', datafield: 'currency', width: '10%' },
						{ text: 'Mobile', datafield: 'mobile', width: '15%' },
						{ text: 'Currency Id', hidden: true, datafield: 'curid', width: '5%' },
						{ text: 'Rate', hidden: true, datafield: 'rate', width: '5%' },
						{ text: 'Cldocno', hidden: true, datafield: 'cldocno', width: '5%' },
						{ text: 'Spcl Notes', hidden: true, datafield: 'spcl_notes', width: '5%' },
				       ]
               });
        
    	   $('#jqxClientDetailsSearch').on('rowdoubleclick', function (event) {
               var rowindex1 = event.args.rowindex;
            	   document.getElementById("txtaccno").value = $('#jqxClientDetailsSearch').jqxGrid('getcellvalue', rowindex1, "doc_no");
	               document.getElementById("txtclientname").value = $('#jqxClientDetailsSearch').jqxGrid('getcellvalue', rowindex1, "description");
	               document.getElementById("txtcldocno").value = $('#jqxClientDetailsSearch').jqxGrid('getcellvalue', rowindex1, "cldocno");
	               document.getElementById("txtdescription").value = $('#jqxClientDetailsSearch').jqxGrid('getcellvalue', rowindex1, "spcl_notes");
	          
	               $('#frmClientReview input').attr('readonly', true );
	       		   $("#jqxFinancialComments").jqxGrid({ disabled: false});
	       		   $("#jqxNonFinancialComments").jqxGrid({ disabled: false});
	       		   $("#jqxOperation").jqxGrid({ disabled: false});
	       		   $("#jqxQuotation").jqxGrid({ disabled: false});
	       		   $("#jqxAccidentDamage").jqxGrid({ disabled: false});
	       		   $('#txtdescription').attr('readonly', false);
	       		   $("#btnbalance").show();
	       		   
	       		
	       		var accno=$('#txtaccno').val();
	       		getAccountBalance(accno);
	       		
	       		var cldocno=$('#txtcldocno').val();
	        	if(cldocno != ""){
		    	    $("#operationDiv").load("operationGrid.jsp?cldocno="+cldocno);
	        	
	            	$("#nonFinancialCommentsDiv").load("nonFinancialCommentsGrid.jsp?cldocno="+cldocno);
	        	
	          	    $("#quotationDiv").load("quotationGrid.jsp?cldocno="+cldocno);
	          	
	          	    $("#accidentDamageDiv").load("accidentDamageHistoryGrid.jsp?cldocno="+cldocno);
	          	}
	        	
	       		var accno=$('#txtaccno').val();
	        	if(accno != ""){
	            	var indexVal = document.getElementById("txtcldocno").value;
		    	    $("#paymentFollowUpDiv").load("paymentFollowUpGrid.jsp?accountno="+accno+'&cldocno='+indexVal);
	        	}
	        	
	        	
	       		
    	      $('#clientWindow').jqxWindow('close'); 
           });  
				           
}); 
				       
                       
</script>
   
<div id="jqxClientDetailsSearch"></div>
    