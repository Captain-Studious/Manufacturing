<%@page import="javax.servlet.http.HttpServletRequest" %>
<%@page import="javax.servlet.http.HttpSession" %>
<%@page import="com.controlcentre.settings.suitabilitysettings.suitabilitymaster.ClsSuitabilityMasterDAO"%>
<%ClsSuitabilityMasterDAO DAO= new ClsSuitabilityMasterDAO();%>
<%String submodelid=request.getParameter("submodelid")==null?"0":request.getParameter("submodelid").toString();%>
<%String brandid=request.getParameter("brandid")==null?"0":request.getParameter("brandid").toString();%>
<%String modelid=request.getParameter("modelid")==null?"0":request.getParameter("modelid").toString();%>
<%String csize1id=request.getParameter("csize1id")==null?"0":request.getParameter("csize1id").toString();%>
<%String csize2id=request.getParameter("csize2id")==null?"0":request.getParameter("csize2id").toString();%>
<%String csize3id=request.getParameter("csize3id")==null?"0":request.getParameter("csize3id").toString();%>
<%String col=request.getParameter("col")==null?"0":request.getParameter("col").toString();%>
<script type="text/javascript">
 	var col='<%=request.getParameter("col") %>';
 	<%
	String dtype = request.getParameter("dtype") == null? "0": request.getParameter("dtype");
	 System.out.println("---dtype-----"+dtype);
%>
var dtype='<%=dtype%>';
 	
     var spec3search= '<%=DAO.suitSpec3Search(session,brandid,modelid,submodelid,csize1id,csize2id,csize3id)%>';
		$(document).ready(function () { 	
           
			var source =
            {
                datatype: "json",  
                datafields: [
                              {name : 'doc_no', type: 'string'  },
                              {name : 'spec', type: 'string'  }
                            ],
                       localdata: spec3search,
                
                pager: function (pagenum, pagesize, oldpagenum) {
                    // callback called when a page or page size is changed.
                }
            };
         
            var dataAdapter = new $.jqx.dataAdapter(source);
            
            $("#spec3search").jqxGrid(
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
            
           // $("#spec3search").jqxGrid('addrow', null, {});   
          $('#spec3search').on('rowdoubleclick', function (event) {
        	
                var rowindex1= event.args.rowindex;
                
                if(col=="1"){
                	document.getElementById("csize1").value=$('#spec3search').jqxGrid('getcellvalue', rowindex1, "spec");
                	document.getElementById("csize1id").value=$('#spec3search').jqxGrid('getcellvalue', rowindex1, "doc_no");
                	
                	 if(dtype=="sut")
                     {
                     	 
                  
                      
                     	 
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
                     
                	
                	
                	
                }
                if(col=="2"){
                	document.getElementById("csize2").value=$('#spec3search').jqxGrid('getcellvalue', rowindex1, "spec");
                	document.getElementById("csize2id").value=$('#spec3search').jqxGrid('getcellvalue', rowindex1, "doc_no");
                	
                	 if(dtype=="sut")
                     {
                     	 
                  
                      
                     	 
                     	document.getElementById("csize3").value="";
                     	document.getElementById("csize3id").value="";

                     	document.getElementById("bsize1").value="";
                     	document.getElementById("bsize1id").value="";
                     	document.getElementById("bsize2").value="";
                     	document.getElementById("bsize2id").value="";
                     	document.getElementById("bsize3").value="";
                     	document.getElementById("bsize3id").value="";
                     }
                     
                }
                if(col=="3"){
                	document.getElementById("csize3").value=$('#spec3search').jqxGrid('getcellvalue', rowindex1, "spec");
                	document.getElementById("csize3id").value=$('#spec3search').jqxGrid('getcellvalue', rowindex1, "doc_no");
                	
                	
                	 if(dtype=="sut")
                     {
                     	 
                  
                      
                     

                     	document.getElementById("bsize1").value="";
                     	document.getElementById("bsize1id").value="";
                     	document.getElementById("bsize2").value="";
                     	document.getElementById("bsize2id").value="";
                     	document.getElementById("bsize3").value="";
                     	document.getElementById("bsize3id").value="";
                     }
                     
                	
                }
                
              $('#spec3searchwindow').jqxWindow('close'); 
            }); 
        });
    </script>
    <div id="spec3search"></div> 