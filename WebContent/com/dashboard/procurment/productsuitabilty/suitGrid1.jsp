  <%@page import="javax.servlet.http.HttpServletRequest" %>
<%@page import="javax.servlet.http.HttpSession" %>
 
 <%@page import="com.dashboard.procurment.productsuitabilty.ClsproductSuitabiltyDAO"%>
 <% ClsproductSuitabiltyDAO searchDAO = new ClsproductSuitabiltyDAO(); 
 
    String doc_no = request.getParameter("doc_no")==null?"0":request.getParameter("doc_no").trim();
	 
  	
  	String gridtype = request.getParameter("cal")==null?"0":request.getParameter("cal").trim();
	String load = request.getParameter("load")==null?"0":request.getParameter("load").trim();
  	
	
	String suitstatus = request.getParameter("suitstatus")==null?"0":request.getParameter("suitstatus").trim();
	

	String prddocno = request.getParameter("prddocno")==null?"0":request.getParameter("prddocno").trim();
	
	
	
	
  	 
  	
  	
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
	  partdata1='<%=searchDAO.suitlistSearch(session,load,doc_no,suitstatus,prddocno)%>';
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
                     
                     
 
{name : 'brand', type: 'string'   },
{name : 'brandid', type: 'int'   },
{name : 'model', type: 'string'  },
{name : 'modelid', type: 'int'   },
{name : 'submodel', type: 'string'  },
{name : 'submodelid', type: 'int'   },
{name : 'yomfrm', type: 'string'   },
{name : 'yomto', type: 'string'   },
{name : 'yomfrmid', type: 'int'   },
{name : 'yomtoid', type: 'int'   },

{name : 'yomfrm1', type: 'string'   },
{name : 'yomto1', type: 'string'   },
{name : 'yomfrmid1', type: 'int'   },
{name : 'yomtoid1', type: 'int'   },


{name : 'esize', type: 'string'   },
{name : 'esizeid', type: 'int'   },
{name : 'bsize', type: 'string'   },
{name : 'bsizeid', type: 'int'   },
 
{name : 'csize', type: 'string'   },
{name : 'csizeid', type: 'int'   },
{name : 'suitstatus', type: 'int'   },
						
					
						
						],
				    localdata: partdata1,
        
        
        pager: function (pagenum, pagesize, oldpagenum) {
            // callback called when a page or page size is changed.
        }
    };
  
    $("#suitlistgrid").on("bindingcomplete", function (event) {
        // your code here.
       
        var rows=$('#suitlistgrid').jqxGrid('getrows');
        
        for(var i=0;i<rows.length;i++){
         var reciept=$('#suitlistgrid').jqxGrid('getcellvalue',i,'suitstatus');
         if(reciept!="undefined" && reciept!=null && reciept!="" && typeof(reciept)!="undefined"){
          $('#suitlistgrid').jqxGrid('selectrow', i);
         }
        }
       });

    
    var dataAdapter = new $.jqx.dataAdapter(source,
    		 {
        		loadError: function (xhr, status, error) {
                alert(error);    
                }
		            
	            }		
    );
    
    
   
   
    
    $("#suitlistgrid").jqxGrid(
    {
        width: '98%',
        height: 272,
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
        
        handlekeyboardnavigation: function (event) {
           	
       	 var cell1 = $('#suitlistgrid').jqxGrid('getselectedcell');
       	 if (cell1 != undefined && cell1.datafield == 'yomfrm1') {  
       	
               var key = event.charCode ? event.charCode : event.keyCode ? event.keyCode : 0; 
               if (key == 114) {  
                	/*  document.getElementById("rowindex").value = cell1.rowindex; */
                	 var suitrows = $("#suitlistgrid").jqxGrid('getrows').length;	
                		var type="frm";
            	    	var yomfrm=$('#suitlistgrid').jqxGrid('getcellvalue',cell1.rowindex, "yomfrm1");
            	    	var yomto=$('#suitlistgrid').jqxGrid('getcellvalue',cell1.rowindex, "yomtoid1");
            	    	yomSearchContent('yomSearchGrid.jsp?rowno='+cell1.rowindex+'&type='+type+'&yomfrm='+yomfrm+'&yomto='+yomto+'&suitrows='+suitrows);
               
               	 $('#suitlistgrid').jqxGrid('render');
               }
               }
          
      	 if (cell1 != undefined && cell1.datafield == 'yomto1') { 
       	
            var key = event.charCode ? event.charCode : event.keyCode ? event.keyCode : 0; 
            if (key == 114) {  
            
            	 var suitrows = $("#suitlistgrid").jqxGrid('getrows').length;	
         		var type="to";
     	    	var yomfrm=$('#suitlistgrid').jqxGrid('getcellvalue',cell1.rowindex, "yomfrm1");
     	    	var yomto=$('#suitlistgrid').jqxGrid('getcellvalue',cell1.rowindex, "yomtoid1");
     	    	yomSearchContent('yomSearchGrid.jsp?rowno='+cell1.rowindex+'&type='+type+'&yomfrm='+yomfrm+'&yomto='+yomto+'&suitrows='+suitrows);
           	 $('#suitlistgrid').jqxGrid('render');
            }
         }
   
     
         }, 
     
        
        
        columns: [   
                  
                  
                  { text: 'SL#', sortable: false, filterable: false, editable: false,
                      groupable: false, draggable: false, resizable: false  ,cellclassname:'whiteClass',
                      datafield: 'sl', columntype: 'number' , width: '3%',
                      cellsrenderer: function (row, column, value) {
                          return "<center><div style='margin:4px;'>" + (value + 1) + "</div></center>";
                      }  
                    },
                    
                    
                    
                    { text: 'suitstatus', datafield: 'suitstatus', editable: false, width: '8%',cellsalign: 'center', align: 'center',hidden:true },
                    
                    { text: 'Yom(From)', datafield: 'yomfrm', editable: false, width: '7%'  },
                    { text: 'Yomfrmid', datafield: 'yomfrmid', width: '15%',hidden:true  },
                    { text: 'Yom(To)', datafield: 'yomto', editable: false, width: '7%'  },
                    { text: 'Yomtoid', datafield: 'yomtoid', width: '15%',hidden:true },
                    
                    
                    
                    { text: 'Pyom(From)', datafield: 'yomfrm1', editable: false, width: '8%'  }, 
                    { text: 'Yomfrmid', datafield: 'yomfrmid1', width: '15%' ,hidden:true },
                    { text: 'Pyom(To)', datafield: 'yomto1', editable: false, width: '8%'  },
                    { text: 'Yomtoid', datafield: 'yomtoid1', width: '15%' ,hidden:true },
                
                 
                    { text: 'Brand', datafield: 'brand', editable: false, width: '15%'  },
                    { text: 'brandid', datafield: 'brandid', width: '5%',hidden:true },
                    { text: 'Model', datafield: 'model', editable: false, width: '15%'  },
                    { text: 'modelid', datafield: 'modelid', width: '5%' ,hidden:true},
                    
                    { text: 'Sub Model', datafield: 'submodel',  width: '15%',editable: false  },
                    { text: 'submodelid', datafield: 'submodelid', width: '5%',hidden:true },
                
             
                  
                   
                    { text: 'EngineSize', datafield: 'esize', editable: false, width: '10%' },
                    { text: 'esizeid', datafield: 'esizeid', width: '11%',hidden:true },
                    { text: 'BedSize', datafield: 'bsize', editable: false , width: '10%' },
                    
                    { text: 'bsizeid', datafield: 'bsizeid', width: '11%',hidden:true  },
                   
                    { text: 'CabinSize', datafield: 'csize', editable: false , width: '10%'  },
                    { text: 'csizeid', datafield: 'csizeid', width: '12%',hidden:true  },
                
					 
					 
 				]
   
    });
    
    
    $('#suitlistgrid').on('rowselect', function (event) {

   	 $("#updatdata").attr("disabled",false);
   	 
    });
    
    
    
    $('#suitlistgrid').on('celldoubleclick', function (event) {

    	var rowBoundIndex = event.args.rowindex;
    	var datafield = event.args.datafield;
    	if(datafield=="yomfrm1")
 	   { 
 
    	var suitrows = $("#suitlistgrid").jqxGrid('getrows').length;	
	    	var type="frm";
	    	
	    	var yomfrmold=$('#suitlistgrid').jqxGrid('getcellvalue',rowBoundIndex, "yomfrm");
	    	var yomtoold=$('#suitlistgrid').jqxGrid('getcellvalue',rowBoundIndex, "yomto");
	    	
	    	var yomfrm=$('#suitlistgrid').jqxGrid('getcellvalue',rowBoundIndex, "yomfrm1");
	    	var yomto=$('#suitlistgrid').jqxGrid('getcellvalue',rowBoundIndex, "yomto1");
	    	yomSearchContent('yomSearchGrid.jsp?rowno='+rowBoundIndex+'&type='+type+'&yomfrm='+yomfrm+'&yomto='+yomto+'&suitrows='+suitrows+'&yomfrmold='+yomfrmold+'&yomtoold='+yomtoold);
 	   }
	    
	   if(datafield=="yomto1")
	   { 
		  var suitrows = $("#suitlistgrid").jqxGrid('getrows').length;
		  
		 
		  
		  var yomfrm=$('#suitlistgrid').jqxGrid('getcellvalue',rowBoundIndex, "yomfrm1");
		  
		  var type="to";
		  var yomto=$('#suitlistgrid').jqxGrid('getcellvalue',rowBoundIndex, "yomto1");
		  
	    	var yomfrmold=$('#suitlistgrid').jqxGrid('getcellvalue',rowBoundIndex, "yomfrm");
	    	var yomtoold=$('#suitlistgrid').jqxGrid('getcellvalue',rowBoundIndex, "yomto");
		  
    yomSearchContent('yomSearchGrid.jsp?rowno='+rowBoundIndex+'&type='+type+'&yomfrm='+yomfrm+'&yomto='+yomto+'&suitrows='+suitrows+'&yomfrmold='+yomfrmold+'&yomtoold='+yomtoold);
	   }
    
	   
	   
    });
    $("#overlay, #PleaseWait").hide();
});
 
   


</script>
<div id="suitlistgrid"></div>