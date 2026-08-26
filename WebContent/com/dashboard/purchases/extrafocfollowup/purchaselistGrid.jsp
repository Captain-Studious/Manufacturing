
 
 <%@page import=" com.dashboard.purchases.extrafocfollowup.ClsExtrafocFollowupDAO"%>
 <% ClsExtrafocFollowupDAO searchDAO = new ClsExtrafocFollowupDAO(); 
 
    String barchval = request.getParameter("barchval")==null?"NA":request.getParameter("barchval").trim();
	String fromdate = request.getParameter("fromdate")==null?"0":request.getParameter("fromdate").trim();
  	String todate = request.getParameter("todate")==null?"0":request.getParameter("todate").trim();
  
  	String acno = request.getParameter("acno")==null?"NA":request.getParameter("acno").trim();
  	
  	String statusselect = request.getParameter("statusselect")==null?"0":request.getParameter("statusselect").trim();
 %> 
       
 
<script type="text/javascript">
 var temp4='<%=barchval%>';
var datas1;

 if(temp4!='NA')
{ 
	 
	 datas1='<%=searchDAO.purchaselistsearch(barchval,fromdate,todate,statusselect,acno)%>'; 
	 datas2='<%=searchDAO.purchaselistsearchEx(barchval,fromdate,todate,statusselect,acno)%>'; 
	 
	 
	 
		// alert(enqdata); --%>
} 
else
{ 
	
	datas1;
	
	}  

$(document).ready(function () {
	  var rendererstring1=function (aggregates){
         	var value=aggregates['sum1'];
         	return '<div style="float: right; margin: 4px;font-size:12px; overflow: hidden;">' + " Total" + '</div>';
         }    
      
   var rendererstring=function (aggregates){
   	var value=aggregates['sum'];
   	return '<div style="float: right; margin: 4px;font-size:12px; overflow: hidden;"> ' + value + '</div>';
   }
      
    var source =
    {
        datatype: "json",
        datafields: [   
                     
                        {name : 'doc_no', type: 'int'  },
                        {name : 'voc_no', type: 'int'  },
						{name : 'date', type: 'date'  },
						{name : 'refno', type: 'String'  },
						{name : 'dtype', type: 'String'  },
						{name : 'account', type: 'String'  },      
						{name : 'acname', type: 'String'  }, 
						
						{name : 'description', type: 'String'  }, 
						
						
						],
				    localdata: datas1,
        
        
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
    
    
   
   
    
    $("#purchaselist").jqxGrid(
    {
        width: '98%',
        height: 250,
        source: dataAdapter,
     /*    showaggregates:true, */
        enableAnimations: true,
        filtermode:'excel',
        filterable: true,
        sortable:true,
/*         
        showaggregates:true,
        showstatusbar:true, */
        
        statusbarheight: 21,
        
        selectionmode: 'singlerow',
        pagermode: 'default',
        editable:false,
        columns: [   
                  { text: 'SL#', sortable: false, filterable: false, editable: false,
                      groupable: false, draggable: false, resizable: false,
                      datafield: 'sl', columntype: 'number', width: '4%',
                      cellsrenderer: function (row, column, value) {
                          return "<center><div style='margin:4px;'>" + (value + 1) + "</div></center>";
                      }  
                    },	
          
                    { text: 'Doc Nos',datafield: 'doc_no', width: '10%' ,hidden:true},
                     { text: 'Doc No',datafield: 'voc_no', width: '7%' },
         			 { text: 'Date', datafield: 'date', width: '10%',cellsformat:'dd.MM.yyyy'},
         			 { text: 'Ref No',datafield: 'refno', width: '10%' },
         			 
         		     { text: 'Account', datafield: 'account',  width: '10%'  },
                     { text: 'Account Name', datafield: 'acname',  width: '22%'  },
                     { text: 'Description', datafield: 'description'  },
           	     
                     
 
					
					]
   
    });
    $("#overlay, #PleaseWait").hide();
    
    $('#purchaselist').on('rowdoubleclick', function (event) {
    
        
    	var rowindex2 = event.args.rowindex;
	var doc_no=$('#purchaselist').jqxGrid('getcellvalue', rowindex2, "doc_no");
	

	 
	
	document.getElementById("docno").value=doc_no;

	// $("#updatdata").attr("disabled",false); 
	 
	$("#listdiv2").load("detailgrid.jsp?docno="+doc_no);
	
	
  
	 $("#updatdata").attr("disabled",false); 
	 
	 
    
	
	
	
	
	 
    });
   
});


</script>
<div id="purchaselist"></div>