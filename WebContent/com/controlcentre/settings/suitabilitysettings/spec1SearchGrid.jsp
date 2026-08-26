<%@page import="javax.servlet.http.HttpServletRequest" %>
<%@page import="javax.servlet.http.HttpSession" %>
<%@page import="com.controlcentre.settings.suitabilitysettings.suitabilitymaster.ClsSuitabilityMasterDAO"%>
<%ClsSuitabilityMasterDAO DAO= new ClsSuitabilityMasterDAO();%>
<%String submodelid=request.getParameter("submodelid")==null?"0":request.getParameter("submodelid").toString();%>
<%String brandid=request.getParameter("brandid")==null?"0":request.getParameter("brandid").toString();%>
<%String modelid=request.getParameter("modelid")==null?"0":request.getParameter("modelid").toString();%>
<%String bsize1id=request.getParameter("bsize1id")==null?"0":request.getParameter("bsize1id").toString();%>
<%String bsize2id=request.getParameter("bsize2id")==null?"0":request.getParameter("bsize2id").toString();%>
<%String bsize3id=request.getParameter("bsize3id")==null?"0":request.getParameter("bsize3id").toString();%>
<%String col=request.getParameter("col")==null?"0":request.getParameter("col").toString();%>
<script type="text/javascript">
 	var col='<%=request.getParameter("col") %>';
 	<%
	String dtype = request.getParameter("dtype") == null? "0": request.getParameter("dtype");
	 System.out.println("---dtype-----"+dtype);
%>
 	
     var spec1search= '<%=DAO.suitSpec1Search(session,brandid,modelid,submodelid,bsize1id,bsize2id,bsize3id) %>';
		$(document).ready(function () { 	
           
			var source =
            {
                datatype: "json",  
                datafields: [
                              {name : 'doc_no', type: 'string'  },
                              {name : 'spec', type: 'string'  }
                            ],
                       localdata: spec1search,
                
                pager: function (pagenum, pagesize, oldpagenum) {
                    // callback called when a page or page size is changed.
                }
            };
         
            var dataAdapter = new $.jqx.dataAdapter(source);
            
            $("#spec1search").jqxGrid(
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
            
            
          $('#spec1search').on('rowdoubleclick', function (event) {
        	
                var rowindex1= event.args.rowindex;
                if(col=="1"){
                	document.getElementById("bsize1").value=$('#spec1search').jqxGrid('getcellvalue', rowindex1, "spec");
                	document.getElementById("bsize1id").value=$('#spec1search').jqxGrid('getcellvalue', rowindex1, "doc_no");
                	
                	

               	 if(dtype=="sut")
                    {
                    	
                    	 
                    	document.getElementById("bsize2").value="";
                    	document.getElementById("bsize2id").value="";
                    	document.getElementById("bsize3").value="";
                    	document.getElementById("bsize3id").value="";
                    }
                }
                if(col=="2"){
                	document.getElementById("bsize2").value=$('#spec1search').jqxGrid('getcellvalue', rowindex1, "spec");
                	document.getElementById("bsize2id").value=$('#spec1search').jqxGrid('getcellvalue', rowindex1, "doc_no");
               	 if(dtype=="sut")
                 {
                 	
                 	 
                 	 
                 	document.getElementById("bsize3").value="";
                 	document.getElementById("bsize3id").value="";
                 }
                }
                if(col=="3"){
                	document.getElementById("bsize3").value=$('#spec1search').jqxGrid('getcellvalue', rowindex1, "spec");
                	document.getElementById("bsize3id").value=$('#spec1search').jqxGrid('getcellvalue', rowindex1, "doc_no");
                }
                
                
              $('#spec1searchwindow').jqxWindow('close'); 
            }); 
        });
    </script>
    <div id="spec1search"></div> 