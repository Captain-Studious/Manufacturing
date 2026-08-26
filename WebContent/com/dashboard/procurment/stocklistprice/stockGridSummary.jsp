
 
 <%@page import="com.dashboard.procurment.stocklist.ClsStocklistDAO"%>
 <% ClsStocklistDAO searchDAO = new ClsStocklistDAO(); 
 
    String barchval = request.getParameter("barchval")==null?"NA":request.getParameter("barchval").trim();
	String psrno = request.getParameter("psrno")==null?"NA":request.getParameter("psrno").trim();
	String statusselect = request.getParameter("statusselect")==null?"0":request.getParameter("statusselect").trim();
	String load = request.getParameter("load")==null?"0":request.getParameter("load").trim();
	String locid = request.getParameter("locid")==null?"0":request.getParameter("locid").trim();
	String hidbrand = request.getParameter("hidbrand")==null?"0":request.getParameter("hidbrand").trim();
	String hidtype = request.getParameter("hidtype")==null?"0":request.getParameter("hidtype").trim();
	String hidproduct = request.getParameter("hidproduct")==null?"0":request.getParameter("hidproduct").trim();
	String hidcat = request.getParameter("hidcat")==null?"0":request.getParameter("hidcat").trim();
	String hidsubcat = request.getParameter("hidsubcat")==null?"0":request.getParameter("hidsubcat").trim();
	String hidept = request.getParameter("hidept")==null?"0":request.getParameter("hidept").trim();
	String zeroqty = request.getParameter("zeroqty")==null?"0":request.getParameter("zeroqty").trim();
	
	String todate = request.getParameter("todate")==null?"0":request.getParameter("todate").trim();
	
	String expupto = request.getParameter("expupto")==null?"0":request.getParameter("expupto").trim();
	
	
	
	System.out.println("===expupto===="+expupto);   
 %> 
       
 
<script type="text/javascript">
 var temp4='<%=barchval%>';
var datas;

 if(temp4!='NA')
{ 
	
	 datas='<%=searchDAO.stocklist(barchval,load,locid,hidbrand,hidtype,hidproduct,hidcat,hidsubcat,hidept,zeroqty,todate,expupto)%>'; 
	 
	 datass='<%=searchDAO.stockExcellist(barchval,statusselect,psrno,load)%>'; 
		// alert(enqdata); --%>
} 
else
{ 
	
	datas;
	
	}  

$(document).ready(function () {
	  var rendererstring1=function (aggregates){
         	var value=aggregates['sum1'];
         	return '<div style="float: right; margin: 4px;font-size:12px; overflow: hidden;">' + " Total" + '</div>';
         }    
      
   var rendererstring=function (aggregates){
   	var value=aggregates['sum'];
	if(value==""||typeof(value)=="undefined"|| typeof(value)=="NaN")
	   {
		value=0.0;
	   }
   	return '<div style="float: right; margin: 4px;font-size:12px; overflow: hidden;"> ' + value + '</div>';
   }
      
    var source =
    {
        datatype: "json",
        datafields: [   
                     
 
        
					 
						{name : 'qty', type: 'number'  },
						
						{name : 'productid', type: 'String'  },
						{name : 'productname', type: 'String'  },
					 
	 
						
						{name : 'amount', type: 'number'  },
						
						{name : 'brandname', type: 'String'  },
						
						
						],
				    localdata: datas,
        
        
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
    
    
   
   
    
    $("#stocklistgrid").jqxGrid(
    {
        width: '98%',
        height: 500,
        source: dataAdapter,
        showaggregates:true,
        enableAnimations: true,
        filtermode:'excel',
        filterable: true,
        sortable:true,
        
        showaggregates:true,
        showstatusbar:true,
        
        statusbarheight: 21,
        
        selectionmode: 'singlerow',
        pagermode: 'default',
        editable:false,
        columns: [   
                  { text: 'SL#', sortable: false, filterable: false, editable: false,
                      groupable: false, draggable: false, resizable: false,
                      datafield: 'sl', columntype: 'number', width: '5%',
                      cellsrenderer: function (row, column, value) {
                          return "<center><div style='margin:4px;'>" + (value + 1) + "</div></center>";
                      }  
                    },	
          
                 
           	         { text: 'Product Id', datafield: 'productid',  width: '17%' }, 
           	         { text: 'Product Name', datafield: 'productname',  width: '38%' },
           	   	   {text: 'Brand Name', datafield: 'brandname', width: '18%' ,},
           	         { text: ' Qty', datafield: 'qty',  width: '10%' ,cellsformat:'d2',aggregates: ['sum1'],aggregatesrenderer:rendererstring1},
 
		           	 
		           	 { text: 'Amount', datafield: 'amount',  width: '12%' ,cellsformat:'d2',cellsalign: 'right', align:'right',aggregates: ['sum'],aggregatesrenderer:rendererstring},
		           	 
	 
 
					
					]
   
    });
    $("#overlay, #PleaseWait").hide();
    
    
});


</script>
<div id="stocklistgrid"></div>