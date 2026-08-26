<%@page import="javax.servlet.http.HttpServletRequest" %>
<%@page import="javax.servlet.http.HttpSession" %>
<%@page import="com.controlcentre.settings.suitabilitysettings.suitabilitymaster.ClsSuitabilityMasterDAO"%>
<%ClsSuitabilityMasterDAO DAO= new ClsSuitabilityMasterDAO(); %>

<%
	String dtype = request.getParameter("dtype") == null? "0": request.getParameter("dtype");
	 System.out.println("---dtype-----"+dtype);
	 

String yomfrm = request.getParameter("yomfrm")==null  ?"NA":request.getParameter("yomfrm").trim();

String yomto = request.getParameter("yomto")==null  ?"NA":request.getParameter("yomto").trim();
%>


<script type="text/javascript">
 	var uomrow='<%=request.getParameter("rowno") %>';
     var brandsearch= '<%=DAO.brandSearch(session,yomfrm,yomto) %>';
     
     var dtype='<%=dtype%>';
     
		$(document).ready(function () { 	
           
			var source =
            {
                datatype: "json",  
                datafields: [
                              {name : 'doc_no', type: 'string'  },
                              {name : 'brand', type: 'string'  }
                            ],
                       localdata: brandsearch,
                
                pager: function (pagenum, pagesize, oldpagenum) {
                    // callback called when a page or page size is changed.
                }
            };
         
            var dataAdapter = new $.jqx.dataAdapter(source);
            
            $("#brandsearch").jqxGrid(
            {
                width: '100%',
                height: 365,
                source: dataAdapter,
                showfilterrow: true, 
                filterable: true, 
                selectionmode: 'singlerow',
                       
                columns: [
                              { text: 'Doc_no', datafield: 'doc_no', width: '40%',hidden:true},
                              { text: 'Brand', datafield: 'brand', width: '100%' },
                              
						]
            });
            
             
          $('#brandsearch').on('rowdoubleclick', function (event) {
        	
                var rowindex1= event.args.rowindex;
                
                document.getElementById("brand").value=$('#brandsearch').jqxGrid('getcellvalue', rowindex1, "brand");
                document.getElementById("brandid").value=$('#brandsearch').jqxGrid('getcellvalue', rowindex1, "doc_no");
                
                
                if(dtype=="sut")
                {
                	document.getElementById("model").value="";
                	document.getElementById("modelid").value="";
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
                	document.getElementById("model").value="";
                	document.getElementById("modelid").value="";
                	document.getElementById("submodel").value="";
                	document.getElementById("submodelid").value="";
 
                }
                
                
              $('#brandsearchwindow').jqxWindow('close'); 
            }); 
        });
    </script>
    <div id="brandsearch"></div> 