<%@page import="javax.servlet.http.HttpServletRequest" %>
<%@page import="javax.servlet.http.HttpSession" %>
<%@page import="com.controlcentre.settings.suitabilitysettings.suitabilitymaster.ClsSuitabilityMasterDAO"%>
<%ClsSuitabilityMasterDAO DAO= new ClsSuitabilityMasterDAO(); %>
<%String brandid=request.getParameter("brandid");%>
<script type="text/javascript">
 	var uomrow='<%=request.getParameter("rowno") %>';
 	
 	<%
	String dtype = request.getParameter("dtype") == null? "0": request.getParameter("dtype");
	 System.out.println("---dtype-----"+dtype);
	 
	 String yomfrm = request.getParameter("yomfrm")==null  ?"NA":request.getParameter("yomfrm").trim();

	 String yomto = request.getParameter("yomto")==null  ?"NA":request.getParameter("yomto").trim();
%>
var dtype='<%=dtype%>';

     var modelsearch= '<%=DAO.modelSearch(session,brandid,yomfrm,yomto) %>';
		$(document).ready(function () { 	
           
			var source =
            {
                datatype: "json",  
                datafields: [
                              {name : 'doc_no', type: 'string'  },
                              {name : 'model', type: 'string'  },
                              {name : 'brand', type: 'string'  }
                            ],
                       localdata: modelsearch,
                
                pager: function (pagenum, pagesize, oldpagenum) {
                    // callback called when a page or page size is changed.
                }
            };
         
            var dataAdapter = new $.jqx.dataAdapter(source);
            
            $("#modelsearch").jqxGrid(
            {
                width: '100%',
                height: 365,
                source: dataAdapter,
                showfilterrow: true, 
                filterable: true, 
                selectionmode: 'singlerow',
                       
                columns: [
                              { text: 'Doc_no', datafield: 'doc_no', hidden:true, width: '20%'},
                              { text: 'Model', datafield: 'model', width: '40%' },
                              { text: 'Brand', datafield: 'brand', width: '60%' },
						]
            });
            
            
          $('#modelsearch').on('rowdoubleclick', function (event) {
        	
                var rowindex1= event.args.rowindex;
                
                document.getElementById("model").value=$('#modelsearch').jqxGrid('getcellvalue', rowindex1, "model");
                document.getElementById("modelid").value=$('#modelsearch').jqxGrid('getcellvalue', rowindex1, "doc_no");
                
                if(dtype=="sut")
                {
                	 
                	document.getElementById("submodel").value="";
                	document.getElementById("submodelid").value="";

                	document.getElementById("esize").value="";
                	document.getElementById("esizeid").value="";
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
                else if(dtype=="other")
                {
                	 
                	document.getElementById("submodel").value="";
                	document.getElementById("submodelid").value="";
 
                }
              $('#modelsearchwindow').jqxWindow('close'); 
            }); 
        });
    </script>
    <div id="modelsearch"></div> 