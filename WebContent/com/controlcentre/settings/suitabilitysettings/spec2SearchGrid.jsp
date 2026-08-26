<%@page import="javax.servlet.http.HttpServletRequest" %>
<%@page import="javax.servlet.http.HttpSession" %>
<%@page import="com.controlcentre.settings.suitabilitysettings.suitabilitymaster.ClsSuitabilityMasterDAO"%>
<%ClsSuitabilityMasterDAO DAO= new ClsSuitabilityMasterDAO();%>
<%String submodelid=request.getParameter("submodelid")==null?"0":request.getParameter("submodelid").toString();%>
<%String brandid=request.getParameter("brandid")==null?"0":request.getParameter("brandid").toString();%>
<%String modelid=request.getParameter("modelid")==null?"0":request.getParameter("modelid").toString();%>
<script type="text/javascript">
 	var uomrow='<%=request.getParameter("rowno") %>';
 	
 	<%
	String dtype = request.getParameter("dtype") == null? "0": request.getParameter("dtype");
	 System.out.println("---dtype-----"+dtype);
%>
var dtype='<%=dtype%>';
 	
     var spec2search= '<%=DAO.suitSpec2Search(session,brandid,modelid,submodelid) %>';
		$(document).ready(function () { 	
           
			var source =
            {
                datatype: "json",  
                datafields: [
                              {name : 'doc_no', type: 'string'  },
                              {name : 'spec', type: 'string'  }
                            ],
                       localdata: spec2search,
                
                pager: function (pagenum, pagesize, oldpagenum) {
                    // callback called when a page or page size is changed.
                }
            };
         
            var dataAdapter = new $.jqx.dataAdapter(source);
            
            $("#spec2search").jqxGrid(
            {
                width: '100%',
                height: 375,
                source: dataAdapter,
                showfilterrow: true, 
                filterable: true, 
                selectionmode: 'singlerow',
                       
                columns: [
                              { text: 'Doc_no', datafield: 'doc_no', width: '40%',hidden:true},
                              { text: 'Spec', datafield: 'spec', width: '100%' },
                              
						]
            });
            
            //$("#spec2search").jqxGrid('addrow', null, {});     
          $('#spec2search').on('rowdoubleclick', function (event) {
        	
                var rowindex1= event.args.rowindex;
                
               document.getElementById("esize").value=$('#spec2search').jqxGrid('getcellvalue', rowindex1, "spec");
               document.getElementById("esizeid").value=$('#spec2search').jqxGrid('getcellvalue', rowindex1, "doc_no");
               
               
               if(dtype=="sut")
               {
               	 
            
                
               	document.getElementById("csize1").value="";
               	document.getElementById("csize1id").value="";
               	document.getElementById("csize2").value="";
               	document.getElementById("csize2id").value="";
               	document.getElementById("csize3").value="";
               	document.getElementById("csize3id").value="";

               	document.getElementById("bsize1").value="";
               	document.getElementById("bsize1id").value="";
               	document.getElementById("bsize2").value="";
               	document.getElementById("bsize2id").value="";
               	document.getElementById("bsize3").value="";
               	document.getElementById("bsize3id").value="";
               }
               
                
              $('#spec2searchwindow').jqxWindow('close'); 
            }); 
        });
    </script>
    <div id="spec2search"></div> 