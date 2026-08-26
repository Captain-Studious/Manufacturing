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
     						{name : 'pricegroup', type: 'string'   },
     					 
							{name : 'discount1', type: 'number' },
							
							{name : 'counts', type: 'number' },
							{name : 'olddiscount', type: 'number' },
							
                        ],
                         localdata: pmdata,  
                
                pager: function (pagenum, pagesize, oldpagenum) {
                    // callback called when a page or page size is changed.
                }
            };
            
           
            
            var dataAdapter = new $.jqx.dataAdapter(source);
            
            $("#jqxpmgt").jqxGrid(
            {
                width: '75%',
                height: 152,
                source: dataAdapter,
                editable: true,
                
                selectionmode: 'singlecell',  
                 handlekeyboardnavigation: function (event) { 
              
   },
                       
                columns: [
							{ text: 'Sr. No.',datafield: '',columntype:'number', width: '20%', cellsrenderer: function (row, column, value) {
							    return "<div style='margin:4px;'>" + (value + 1) + "</div>";
							}   },
							{ text: 'doc_no', datafield: 'catid', editable: false,  width: '18%',hidden:true },
							{ text: 'Category', datafield: 'cat_name', width: '55%', editable: false  },
							
							
							{ text: 'Discount %', datafield: 'olddiscount', cellsformat: 'd2', width: '25%', cellsalign: 'right', align: 'right', editable: false  },
							{ text: 'New Discount', datafield: 'discount1', cellsformat: 'd2', width: '20%', cellsalign: 'right', align: 'right',hidden:true, editable: false  },
							
							{ text: 'pricegroup', datafield: 'pricegroup',  width: '25%', cellsalign: 'right', align: 'right' ,hidden:true},
							{ text: 'counts', datafield: 'counts',  width: '25%', cellsalign: 'right', align: 'right' ,hidden:true },


				 
						]
            });
         
      
            $("#overlay, #PleaseWait").hide(); 
            
        });
</script>
<div id="jqxpmgt"></div>
 