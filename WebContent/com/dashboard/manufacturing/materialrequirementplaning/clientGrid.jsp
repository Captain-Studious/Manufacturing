<%@page import="com.dashboard.manufacturing.materialrequirementplaning.ClsMaterialRequirementPlaningDAO" %>
<%ClsMaterialRequirementPlaningDAO DAO=new ClsMaterialRequirementPlaningDAO(); %>   
<%@page import="javax.servlet.http.HttpServletRequest" %>
<%@page import="javax.servlet.http.HttpSession" %>   
 <%
     String id=request.getParameter("id")==null?"0":request.getParameter("id").toString();
 %>                
<script type="text/javascript">              
var crmdata;    
crmdata='<%=DAO.clientGridLoad(session,id) %>';                          
     
$(document).ready(function(){

        var source =
        {
            datatype: "json",    
            datafields: [
                      	{name : 'val' , type: 'string'},
                      	{name : 'sval' , type: 'string'},
 						{name : 'refname', type: 'string'},
                      	 
             ],
             localdata: crmdata,
            
            
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



        $("#jqxcrmGrid").jqxGrid(   
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
    					{ text: 'Client',datafield: 'refname'},
    					{ text: 'SOR',datafield: 'val', width: '9%',cellsalign:'right',align:'right'},
    					{ text: 'STKO',datafield: 'sval', width: '9%',cellsalign:'right',align:'right'},
    	              ]                 
                });      
	});
</script>
<div id="jqxcrmGrid"></div>