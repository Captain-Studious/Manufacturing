<%@page import="javax.servlet.http.HttpServletRequest" %>
<%@page import="javax.servlet.http.HttpSession" %>
 
 <%@page import="com.dashboard.pricemanagement.pricemanagementreview.ClsPriceManagementReviewDAO"%>
 <% ClsPriceManagementReviewDAO searchDAO = new ClsPriceManagementReviewDAO(); 
  String contextPath=request.getContextPath();%>
<% 
String psrno=request.getParameter("psrno")==null?"0":request.getParameter("psrno").toString();
%>
<script type="text/javascript">
 
 
  var psrno='<%=psrno%>';
if(psrno>0){
	var pmdata='<%=searchDAO.pricelistgridsearch(psrno)%>'; 
 
	 
}
else{  
	var pmdata;
  }   

        $(document).ready(function () { 
        
     
            // prepare the data
            var source =
            {
                datatype: "json",
                datafields: [
     						 {name : 'slno', type: 'number' }, 
     						 
     						{name : 'catid', type: 'string'  },        
     						{name : 'cat_name', type: 'string'   },
     						{name : 'price1', type: 'number'   },
     						{name : 'price2', type: 'number' },
     						{name : 'price3', type: 'number'  },
							{name : 'discount1', type: 'number' },
							{name : 'discount2', type: 'number' },
							{name : 'discount3', type: 'number' },
							{name : 'newprice1', type: 'number' },
							{name : 'newprice2', type: 'number' },
							{name : 'newprice3', type: 'number'  }
							
                        ],
                         localdata: pmdata,  
                
                pager: function (pagenum, pagesize, oldpagenum) {
                    // callback called when a page or page size is changed.
                }
            };
            
           
            
            var dataAdapter = new $.jqx.dataAdapter(source);
            
            $("#jqxpmgt").jqxGrid(
            {
                width: '100%',
                height: 152,
                source: dataAdapter,
                editable: true,
                
                selectionmode: 'singlecell',  
                 handlekeyboardnavigation: function (event) { 
              
   },
                       
                columns: [
							{ text: 'Sr. No.',datafield: '',columntype:'number', width: '4%', cellsrenderer: function (row, column, value) {
	                               return "<div style='margin:4px;'>" + (value + 1) + "</div>";
                            }   },
							{ text: 'doc_no', datafield: 'catid', editable: false,  width: '18%',hidden:true },
							{ text: 'Category', datafield: 'cat_name', editable: false  },
							  
							{ text: 'Max Rate1', datafield: 'price1', cellsformat: 'd2', width: '7%', cellsalign: 'right', align: 'right',columngroup:'rate' },
							{ text: 'New  Max Rate1', datafield: 'newprice1', cellsformat: 'd2', width: '8%', cellsalign: 'right', align: 'right',columngroup:'rate' },
							{ text: 'Mid Rate2', datafield: 'price2', cellsformat: 'd2', width: '7%', cellsalign: 'right', align: 'right' ,columngroup:'rate'},
							{ text: 'New  Max Rate2', datafield: 'newprice2', cellsformat: 'd2', width: '8%', cellsalign: 'right', align: 'right',columngroup:'rate' },
							{ text: 'Min Rate3', datafield: 'price3', cellsformat: 'd2', width: '7%', cellsalign: 'right', align: 'right',columngroup:'rate' },
							{ text: 'New  Max Rate3', datafield: 'newprice3', cellsformat: 'd2', width: '8%', cellsalign: 'right', align: 'right',columngroup:'rate' },
							
							{ text: 'Discount 1', datafield: 'discount1', cellsformat: 'd2', width: '7%', cellsalign: 'right', align: 'right',columngroup:'discount' },
							{ text: 'Discount 2', datafield: 'discount2', cellsformat: 'd2', width: '7%', cellsalign: 'right', align: 'right',columngroup:'discount' },
							{ text: 'Discount 3', datafield: 'discount3', cellsformat: 'd2', width: '7%', cellsalign: 'right', align: 'right' ,columngroup:'discount'},
				 
						], columngroups: 
	             			[
	               				{ text: 'Rate', align: 'center', name: 'rate',width: '20%' },
	               				{ text: 'Discount', align: 'center', name: 'discount',width: '10%' },
	               				{ text: 'FOC', align: 'center', name: 'foc',width: '10%' }
	             			]
            });
         
      
            $("#overlay, #PleaseWait").hide(); 
            
        });
</script>
<div id="jqxpmgt"></div>
