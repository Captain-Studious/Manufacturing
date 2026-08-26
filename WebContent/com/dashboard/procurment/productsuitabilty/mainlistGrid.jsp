<%@page import="javax.servlet.http.HttpServletRequest" %>
<%@page import="javax.servlet.http.HttpSession" %>
 
 <%@page import="com.dashboard.procurment.productsuitabilty.ClsproductSuitabiltyDAO"%>
 <% ClsproductSuitabiltyDAO searchDAO = new ClsproductSuitabiltyDAO(); 
 
    String doc_no = request.getParameter("doc_no")==null?"0":request.getParameter("doc_no").trim();
	 
  	
  	String gridtype = request.getParameter("cal")==null?"0":request.getParameter("cal").trim();
	String load = request.getParameter("load")==null?"0":request.getParameter("load").trim();
  	
	String psrno = request.getParameter("psrno")==null?"0":request.getParameter("psrno").trim();
	String suitstatus = request.getParameter("suitstatus")==null?"0":request.getParameter("suitstatus").trim();
	System.out.println("==suitstatus==="+suitstatus);
	System.out.println("==doc_no==="+doc_no);

  	
 %> 
           	  
 <style>
 
  

 .sl
  {
     /*  background-color:#FCEFCE; */
  }
  
 .prd
  {
     /*  background-color:#ffe0cc; */
  }
  
 .pr
  {
      /* background-color:#EBEBC1; */
  }
  
    
   .advanceClass5
  {
      /* background-color: #FCC4F7; */
  }
   .advanceClass4
  {
      /*  background-color: #efd4f7; */
  }
   .advanceClass3
  {
     
     /*  background-color: #C4F3F5        ; */
  }
   .advanceClass2
  {
     /*  background-color: #CFECF1    ;   */
  }
   .advanceClass1
  {
     /*  background-color:   #eff4be;  ; */
  }
   .advanceClass
  {
    /*   background-color: #FBEFF5; */
  }
  .balanceClass
  {
    /*   background-color: #E0F8F1; */
  }
  .unappliedClass
  {
    /*  color: #FF0000; */
  } 
      .whiteClass
    {
      /*   background-color: #fff; */
    }
        
 </style>
<script type="text/javascript">
 var temp4='<%=doc_no%>';
var partdata;
 
	if(temp4!="NA"){
	  partdata='<%=searchDAO.mainlistSearch(session,load,doc_no,psrno,suitstatus)%>';
	}
	else{
		partdata;
	}

$(document).ready(function () {
    // prepare the data
    var source =
    {
        datatype: "json",
        datafields: [   
                     
                     

						{name : 'doc_no', type: 'String'  },
                        {name : 'product', type: 'String'  },
                        {name : 'pdesc', type: 'String'  },
                        {name : 'type', type: 'String'  },
						{name : 'brand', type: 'String'  },
						{name : 'unit', type: 'String'  },
						{name : 'cat', type: 'String'  },
						{name : 'scat', type: 'String'  },
						{name : 'dept', type: 'String'  },
						{name : 'sbrand', type: 'String'},
						{name : 'smodel', type: 'String'},
						{name : 'submodel', type: 'String'},
						{name : 'branch', type: 'String'},
						{name : 'yomfrm', type: 'String' },
						{name : 'yomto', type: 'String' },
						{name : 'esize', type: 'string'   },
						{name : 'bsize1', type: 'string'   },
						{name : 'bsize2', type: 'string'   },
						{name : 'bsize3', type: 'string'   },
						{name : 'csize1', type: 'string'   },
						{name : 'csize2', type: 'string'   },
						{name : 'csize3', type: 'string'   },
						{name : 'stkqty', type: 'number'   },
						
						{name : 'fixingprice', type: 'number'   },
						{name : 'lbrchg', type: 'number'   },
						
						{name : 'clrprice', type: 'number'   },
						
						
						
						],
				    localdata: partdata,
        
        
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
    
    
   
   
    
    $("#mainlistgrid").jqxGrid(
    {
        width: '98%',
        height: 250,
        source: dataAdapter,
      
        enableAnimations: true,
        filterable: true,
        showfilterrow: true,
        filtermode:'excel',
        columnsresize:true,
        sortable:true,
        selectionmode: 'singlerow',
        pagermode: 'default',
        editable:false,
        columns: [   
                  
                  
                  { text: 'SL#', sortable: false, filterable: false, editable: false,
                      groupable: false, draggable: false, resizable: false  ,cellclassname:'whiteClass',
                      datafield: 'sl', columntype: 'number' , width: '4%',
                      cellsrenderer: function (row, column, value) {
                          return "<center><div style='margin:4px;'>" + (value + 1) + "</div></center>";
                      }  
                    },
                    { text: 'doc_no', datafield: 'doc_no',  width: '10%',hidden:true },
                      
                    { text: 'Branch', datafield: 'branch',  width: '12%' ,cellclassname:'advanceClass',hidden:true },
           	         { text: 'Product', datafield: 'product' ,  width: '12%'  ,cellclassname:'whiteClass'}, 
					 { text: 'Product Name', datafield: 'pdesc'   ,width: '36%',cellclassname:'whiteClass'},
					  { text: 'cellselect', datafield: 'cellselects',  width: '8%',hidden:true    }, 
					 { text: 'Type',datafield: 'type' , width: '10%' ,cellclassname:'sl',hidden:true  },
					 { text: 'Department',datafield: 'dept', width: '10%' ,cellclassname:'sl' ,hidden:true },
				     { text: 'Brand',datafield: 'brand' , width: '12%' ,cellclassname:'whiteClass' },
					 { text: 'Category', datafield: 'cat', width: '13%'  ,cellclassname:'advanceClass4'},
					 { text: 'SubCategory', datafield: 'scat', width: '13%' ,cellclassname:'advanceClass4'},
					 { text: 'Stock Qty', datafield: 'stkqty',  width: '6%',cellsformat:'d2' ,cellclassname:'advanceClass5',hidden:true },
					 
					 { text: 'Selling Price', datafield: 'fixingprice',  width: '7%',cellsformat:'d2' ,cellclassname:'advanceClass5',cellsalign: 'right', align:'right'  },
					 { text: 'Fixing Price', datafield: 'lbrchg',  width: '7%',cellsformat:'d2' ,cellclassname:'advanceClass5' ,cellsalign: 'right', align:'right' },
					 { text: 'Clear Price', datafield: 'clrprice',  width: '7%',cellsformat:'d2' ,cellclassname:'advanceClass5' ,cellsalign: 'right', align:'right' },
					 
					 
					 
 				]
   
    });
    
    
 
    
    
    $('#mainlistgrid').on('rowdoubleclick', function (event) {
    	
    	 var rowindex2= event.args.rowindex;
      	 $("#updatdata").attr("disabled",false);
    	 document.getElementById("name1").innerText="Product :";
    	 document.getElementById("name2").innerText="Product Name :";
     
    	 document.getElementById("productid").innerText=$('#mainlistgrid').jqxGrid('getcellvalue', rowindex2, "product");
    	 document.getElementById("productname").innerText=$('#mainlistgrid').jqxGrid('getcellvalue', rowindex2, "pdesc");
    	 
    	 document.getElementById("prdno").value=$('#mainlistgrid').jqxGrid('getcellvalue', rowindex2, "product");
    	 document.getElementById("prdname").value=$('#mainlistgrid').jqxGrid('getcellvalue', rowindex2, "pdesc");
    	 
    	 
    	 
    	  document.getElementById("prddocno").value=$('#mainlistgrid').jqxGrid('getcellvalue', rowindex2, "doc_no");
    	 
      	 var doc_no=document.getElementById("cmbmastertype").value;
		 
      	 var prddocno=$('#mainlistgrid').jqxGrid('getcellvalue', rowindex2, "doc_no");
      	 
      	 var suitstatus='<%=suitstatus%>';
      	 
		 
	 var load="load";

	   $("#overlay, #PleaseWait").show();
	  $("#mainlistdiv1").load("suitGrid.jsp?&doc_no="+doc_no+"&load="+load+"&suitstatus="+suitstatus+"&prddocno="+prddocno);
	  

    	 
    	  
    });
 
    
 
    $("#overlay, #PleaseWait").hide();
});


</script>
<div id="mainlistgrid"></div>