
<%@page import="com.dashboard.procurment.stockadjustment.ClsstockAdjustment" %>
<%ClsstockAdjustment cfar=new ClsstockAdjustment(); %>
<% 
String id=request.getParameter("check")==null?"0":request.getParameter("check");
String psrno=request.getParameter("psrno")==null?"0":request.getParameter("psrno");
%>
<style type="text/css">
 
  
  

 .sl
  {
      background-color:#FCEFCE;
  }
  
 .prd
  {
      background-color:#ffe0cc;
  }
  
 .pr
  {
      background-color:#EBEBC1;
  }
  
    
   .advanceClass5
  {
      background-color: #FCC4F7;
  }
   .advanceClass4
  {
       background-color: #efd4f7;
  }
   .advanceClass3
  {
     
      background-color: #C4F3F5        ;
  }
   .advanceClass2
  {
      background-color:/*  #bed9f4; */ #CFECF1    ;  
  }
   .advanceClass1
  {
      background-color:   #eff4be;  ;
  }
   .advanceClass
  {
      background-color: #FBEFF5;
  }
  .balanceClass
  {
      background-color: #E0F8F1;
  }
  .unappliedClass
  {
     color: #FF0000;
  }     
</style>
<script type="text/javascript">
var datas1;
 
$(document).ready(function () {
 
	  datas1='<%=cfar.gridDataLoad(psrno,id)%>'; 
	 
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
						{name : 'psrno', type: 'number'  },
                        {name : 'date', type: 'date'  },
						{name : 'productid', type: 'String'  },
						{name : 'productname', type: 'String'  },
						{name : 'dtype', type: 'String'  },
						{name : 'stockqty', type: 'number'  },
						{name : 'batch_no', type: 'String'  },
						{name : 'exp_date', type: 'date'  },
						{name : 'aqty', type: 'number'  },
						{name : 'abatchno', type: 'string'  },
						{name : 'aexpdate', type: 'date'  },
						
						{name : 'stockid', type: 'String'  },
						
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
    
    $("#listgridmain").jqxGrid(
    {
        width: '98%',
        height: 500,
        source: dataAdapter,
       
        enableAnimations: true,
      /*   filtermode:'excel',
        filterable: true,
        showfilterrow: true, */
        sortable:true,
        columnsresize: true,
        showaggregates:true,
        showstatusbar:true,
        
        statusbarheight: 21,
        selectionmode: 'checkbox',
        pagermode: 'default',
        editable:true,
        columns: [   
                  { text: 'SL#', sortable: false, filterable: false, editable: false,
                      groupable: false, draggable: false, resizable: false,
                      datafield: 'sl', columntype: 'number', width: '4%' ,
                      cellsrenderer: function (row, column, value) {
                          return "<left><div style='margin:4px;'>" + (value + 1) + "</div></left>";
                      }  
                    },
                    { text: 'stockid', datafield: 'stockid', width: '6%' ,editable: false,hidden:true },
         			 { text: 'DATE', datafield: 'date', width: '6%' ,cellsformat:'dd.MM.yyyy' ,editable: false },
         			 { text: 'PRODUCT_ID',datafield: 'productid', width: '12%'  ,editable: false},
         			 { text: 'PRODUCT NAME', datafield: 'productname' ,editable: false },
         			 { text: 'DTYPE',datafield: 'dtype', width: '4%',aggregates: ['sum1'],aggregatesrenderer:rendererstring1 ,editable: false},
         		     { text: 'STOCK QTY', datafield: 'stockqty',  width: '6%',cellsformat: 'd2' ,editable: false,aggregates: ['sum'],aggregatesrenderer:rendererstring,cellsalign: 'left', align: 'left' },
                     { text: 'BATCH NO', datafield: 'batch_no',  width: '13%' ,editable: false },
                     { text: 'EXP_DATE', datafield: 'exp_date',  width: '6%',editable: false,cellsformat:'dd.MM.yyyy'  },
                     { text: 'ADJ_QTY', datafield: 'aqty',  width: '8%',cellsformat: 'd2',hidden:true ,editable: false,aggregates: ['sum'],aggregatesrenderer:rendererstring  ,cellclassname:'advanceClass'},
           	         { text: 'ADJ_BATCH NO', datafield: 'abatchno',  width: '14%' ,editable: true  ,cellclassname:'advanceClass1'}, 
           	         { text: 'ADJ_EXPDATE', datafield: 'aexpdate',  width: '8%',columntype: 'datetimeinput' ,cellsformat:'dd.MM.yyyy' ,editable: true ,cellclassname:'balanceClass'},
           	         ]
   
    });
    $("#overlay, #PleaseWait").hide();
  
    
    $("#listgridmain").on('cellvaluechanged', function (event) 
            {
            	var datafield = event.args.datafield;
        		
           	 $("#update").attr('disabled', false );
    		    var rowBoundIndex = args.rowindex;
    		    
    		    
    		    if(datafield=="aqty"){
    		    	    		    	
    		    var acqty=$('#listgridmain').jqxGrid('getcellvalue', rowBoundIndex, "aqty");
    		    var stockqty=$('#listgridmain').jqxGrid('getcellvalue', rowBoundIndex, "stockqty");
    		    
    		    if(parseFloat(acqty)>parseFloat(stockqty))
    		    	{
    		    	
    		    	 $.messager.alert('Message','Adjust Qty value not more than Stock Qty '+stockqty,'warning');  
    		    	 $('#listgridmain').jqxGrid('setcellvalue', rowBoundIndex, "aqty",stockqty);
  				   
 				    return 0;
 				
    		    	}
    		    	
    		    	
    		    	
    		    	
    		    }
    		    
    		    
            });
    
   
});


</script>
<div id="listgridmain"></div>