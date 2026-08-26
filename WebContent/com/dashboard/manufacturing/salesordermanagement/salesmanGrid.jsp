<%@page import="com.dashboard.manufacturing.salesordermanagement.ClsSalesOrderManagementDAO" %>
<%ClsSalesOrderManagementDAO DAO=new ClsSalesOrderManagementDAO(); %> 
<%@page import="javax.servlet.http.HttpServletRequest" %>
<%@page import="javax.servlet.http.HttpSession" %>   
 <%
     String id=request.getParameter("id")==null?"0":request.getParameter("id").toString();
 %>                
<script type="text/javascript">              
var slmdata;    
slmdata='<%=DAO.salesmanGridLoad(session,id) %>';                        
     
$(document).ready(function(){

        var source =
        {
            datatype: "json",    
            datafields: [
                      	{name : 'val' , type: 'string'},
                      	{name : 'sval' , type: 'string'},
 						{name : 'date', type: 'date'},
                      	 
             ],
             localdata: slmdata,
            
            
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



        $("#jqxsalmGrid").jqxGrid(   
                {
                	width: '100%',
                    height: 300,
                    source: dataAdapter,
                    showfilterrow: true,
                    filterable: true,
                    selectionmode: 'singlerow',
                  	editable:false,
                    altrows:true,
                     columnsresize: true,
                    //Add row method
                    columns: [
						{ text: 'SrNo.',datafield: '',columntype:'number', width: '7%',cellsrenderer: function (row, column, value) {
						    return "<center><div style='margin:4px;'>" + (value + 1) + "</div></center>";
						}   },      
    					{ text: 'Date',datafield: 'date',cellsformat:'dd.MM.yyyy'},
    					{ text: 'SOR',datafield: 'val', width: '15%',cellsalign:'right',align:'right'},
    					{ text: 'STKO',datafield: 'sval', width: '15%',cellsalign:'right',align:'right'},
    	              ]                 
                });      
	});
</script>
<div id="jqxsalmGrid"></div>