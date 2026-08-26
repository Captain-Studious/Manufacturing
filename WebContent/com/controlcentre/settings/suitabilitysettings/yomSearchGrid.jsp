<%@page import="javax.servlet.http.HttpServletRequest" %>
<%@page import="javax.servlet.http.HttpSession" %>
<%@page import="com.controlcentre.settings.suitabilitysettings.suitabilitymaster.ClsSuitabilityMasterDAO"%>
<%ClsSuitabilityMasterDAO DAO= new ClsSuitabilityMasterDAO();%>
<%String type=request.getParameter("type");%>
<%String yomfrm=request.getParameter("yomfrm")==null?"0":request.getParameter("yomfrm").toString();%>
<%String yomto=request.getParameter("yomto")==null?"0":request.getParameter("yomto").toString();%>
<%String barnd=request.getParameter("barnd")==null?"0":request.getParameter("barnd").toString();%>



<script type="text/javascript">
 	var uomrow='<%=request.getParameter("rowno") %>';
 	var type='<%=request.getParameter("type") %>';
     var yomsearch= '<%=DAO.yomSearch(session,type,yomfrm,yomto) %>';
		$(document).ready(function () { 	
           
			var source =
            {
                datatype: "json",  
                datafields: [
                              {name : 'doc_no', type: 'string'  },
                              {name : 'yom', type: 'string'  }
                            ],
                       localdata: yomsearch,
                
                pager: function (pagenum, pagesize, oldpagenum) {
                    // callback called when a page or page size is changed.
                }
            };
         
            var dataAdapter = new $.jqx.dataAdapter(source);
            
            $("#yomsearch").jqxGrid(
            {
                width: '100%',
                height: 365,
                source: dataAdapter,
                showfilterrow: true, 
                filterable: true, 
                selectionmode: 'singlerow',
                       
                columns: [
                              { text: 'Doc_no', datafield: 'doc_no', width: '40%',hidden:true},
                              { text: 'Yom', datafield: 'yom', width: '100%' },
                              
						]
            });
            
             
          $('#yomsearch').on('rowdoubleclick', function (event) {
        	
                var rowindex1= event.args.rowindex;
           	 document.getElementById("errormsg").innerText="";  
                if(type=="frm"){
                	document.getElementById("yomfrm").value=$('#yomsearch').jqxGrid('getcellvalue', rowindex1, "yom");
         			 document.getElementById("yomfrmid").value=$('#yomsearch').jqxGrid('getcellvalue', rowindex1, "doc_no");
         			document.getElementById("yomto").value="";
         			document.getElementById("yomtoid").value="";
         			
         			
         		 
         			
         			
         			
                }
                else if(type=="to"){
                	document.getElementById("yomto").value=$('#yomsearch').jqxGrid('getcellvalue', rowindex1, "yom");
        			 document.getElementById("yomtoid").value=$('#yomsearch').jqxGrid('getcellvalue', rowindex1, "doc_no");
                }
                                
              $('#yomsearchwindow').jqxWindow('close'); 
            }); 
        });
    </script>
    <div id="yomsearch"></div> 