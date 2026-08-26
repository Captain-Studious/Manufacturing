  <%@page import="javax.servlet.http.HttpServletRequest" %>
<%@page import="javax.servlet.http.HttpSession" %>
 
 <%@page import="com.dashboard.procurment.productsuittype.ClsproductSuittypeDAO"%>
 <% ClsproductSuittypeDAO searchDAO = new ClsproductSuittypeDAO(); 
 
    String doc_no = request.getParameter("doc_no")==null?"0":request.getParameter("doc_no").trim();
	 
  	
  	String gridtype = request.getParameter("cal")==null?"0":request.getParameter("cal").trim();
	String load = request.getParameter("load")==null?"0":request.getParameter("load").trim();
  	
  	
  	 
  	
  	
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
var partdata1;
 
	if(temp4!="NA"){
	  partdata1='<%=searchDAO.mainlistSearch(session,load,doc_no)%>';
	}
	else{
		partdata1;
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
				    localdata: partdata1,
        
        
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
    
    
   
   
    
    $("#mainlistgrid1").jqxGrid(
    {
        width: '98%',
        height: 225,
        source: dataAdapter,
      
        enableAnimations: true,
        filterable: true,
        showfilterrow: true,
        filtermode:'excel',
        columnsresize:true,
        sortable:true,
        selectionmode: 'checkbox',
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
                    { text: 'doc_no', datafield: 'doc_no',  width: '10%' ,hidden:true},
                      
                    { text: 'Branch', datafield: 'branch',  width: '12%' ,cellclassname:'advanceClass',hidden:true },
           	         { text: 'Product', datafield: 'product' ,  width: '12%'  ,cellclassname:'whiteClass'}, 
					 { text: 'Product Name', datafield: 'pdesc'   ,width: '36%',cellclassname:'whiteClass'},
					  { text: 'cellselect', datafield: 'cellselects',  width: '8%'    }, 
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
    
    
    
    $('#mainlistgrid1').on('rowunselect', function (event) {
    	
    	  var rowindex1= event.args.rowindex;
    	 $('#mainlistgrid1').jqxGrid('setcellvalue', rowindex1, "cellselects","0");
        });
   
    
    
    
    $('#mainlistgrid1').on('rowselect', function (event) {
    	
    	 var rowindex1= event.args.rowindex;
    	 $('#mainlistgrid1').jqxGrid('setcellvalue', rowindex1, "cellselects","1");
    });
    
    $('#mainlistgrid1').on('rowselect', function (event) {
     	
   	 $('#updatdata').attr("disabled", false);
		 
		
		  $('#cmbmastertype').attr("disabled", false);
  	  
  	 /*   var j=0;
		var rows = $("#mainlistgrid1").jqxGrid('getrows');
        var selectedrows=$("#mainlistgrid1").jqxGrid('selectedrowindexes');
        
       
		selectedrows = selectedrows.sort(function(a,b){return a - b});
        
		   for(var i=0 ; i < rows.length ; i++){
		 
				if(selectedrows[j]==i){
					
				 
					 $('#mainlistgrid1').jqxGrid('setcellvalue', j, "cellselects","1");
					 j++; 
				}
				else
					{
					 $('#mainlistgrid1').jqxGrid('setcellvalue', j, "cellselects","0");
					}
				
		   }   */
    });
    
    
/*     if(temps=="cal")
    	{
    $('#mainlistgrid1').jqxGrid('showcolumn', 'stkqty');
    	}
    else
    	{
    $('#mainlistgrid1').jqxGrid('hidecolumn', 'stkqty');
    	}
	 */
    $("#overlay, #PleaseWait").hide();
});


</script>
<div id="mainlistgrid1"></div>