
 
 
 <%@page import="com.dashboard.pricemanagement.discountDetail.ClsDiscountDetailDAO"%>
 <% ClsDiscountDetailDAO searchDAO = new ClsDiscountDetailDAO(); 
 
    String barchval = request.getParameter("barchval")==null?"NA":request.getParameter("barchval").trim();
	String fromdate = request.getParameter("fromdate")==null?"0":request.getParameter("fromdate").trim();
  	String todate = request.getParameter("todate")==null?"0":request.getParameter("todate").trim();
  
 
  	
  	String type = request.getParameter("type")==null?"0":request.getParameter("type").trim();
  	
 	String brandid = request.getParameter("brandid")==null?"0":request.getParameter("brandid").trim();
 	String catid = request.getParameter("catid")==null?"0":request.getParameter("catid").trim();
 	String subcatid = request.getParameter("subcatid")==null?"0":request.getParameter("subcatid").trim();
 	String psrno = request.getParameter("psrno")==null?"0":request.getParameter("psrno").trim();
  	
	String types = request.getParameter("types")==null?"0":request.getParameter("types").trim();
  	
  	
 	
 	
  	    
 %> 
  <style type="text/css">
    .redClass
    {
 /*    background-color: #ffe4e1;   */
         background-color: #f0ffff;  
        
        	
    }
    
    .yellowClass
    {
        background-color: #FFFFD1;
    }
    
    .greyClass
    {
        background-color: #f8e0f7;
    }
    
    
    
    
    
              
</style>       
<script type="text/javascript">
 var temp4='<%=barchval%>';
var datas1;
var dat1;

 if(temp4!='NA')
{ 
	 
	 
	 <%-- dat1='<%=searchDAO.genaralmainlistgridsearchExcel(barchval,fromdate,todate,type,brandid,catid,subcatid,psrno)%>';  --%>
	 datas1='<%=searchDAO.discountDetailgridsearch(barchval,type,brandid,catid,subcatid,psrno,types)%>'; 
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
   var cellclassname = function (row, column, value, data) {
		if (data.cellselects==1) {
			 
        return "redClass";
    }
		else{
			 
		}
		 
		
		};  
    var source =
    {
        datatype: "json",
        datafields: [   


                        {name : 'doc_no', type: 'String'  },
                        {name : 'fixingprice', type: 'number'  },
						{name : 'brandname', type: 'String'  },
						{name : 'productid', type: 'String'  },
						{name : 'productname', type: 'String'  },
					 
							 
							 
						
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
    
    
   
   
    
    $("#mainlistgrid").jqxGrid(
    {
        width: '98%',
        height: 380,
        source: dataAdapter,
 
        enableAnimations: true,
        filtermode:'excel',
        filterable: true,
        sortable:true,
        editable:true,
 
        
   
        
        selectionmode: 'singlerow',
        pagermode: 'default',
         
        columns: [   	
                  { text: 'SL#', sortable: false, filterable: false, editable: false,
                      groupable: false, draggable: false, resizable: false,cellclassname: cellclassname,
                      datafield: 'sl', columntype: 'number', width: '10%',
                      cellsrenderer: function (row, column, value) {
                          return "<div style='margin:4px;'>" + (value + 1) + "</div></center>";
                      }  
                    },	
                  
                                 
                     { text: 'psrno', datafield: 'doc_no',  width: '12%' ,hidden:true,cellclassname: cellclassname},
                     { text: 'Product Id', datafield: 'productid',  width: '12%' ,editable: false,cellclassname: cellclassname},
                     { text: 'Product Name', datafield: 'productname',editable: false,cellclassname: cellclassname }, 
           	   		 { text: 'Brand', datafield: 'brandname',  width: '17%' ,editable: false,cellclassname: cellclassname},

           	         
           	   	     { text: 'Price', datafield: 'fixingprice',  width: '14%' ,cellsformat:'d2' ,cellsalign: 'right', align:'right',editable: false,cellclassname: cellclassname},
           	       
					]
   
    }); 

 
 
    $('#mainlistgrid').on('rowdoubleclick', function (event) {
    	var rowindex2 = event.args.rowindex;
    	var psrno=$('#mainlistgrid').jqxGrid('getcellvalue', rowindex2, "doc_no");
    	document.getElementById("name1").innerText="Product Id";
    	document.getElementById("name2").innerText="Product Name";
    	document.getElementById("name3").innerText="Type ";
    	document.getElementById("productid").innerText=": "+$('#mainlistgrid').jqxGrid('getcellvalue', rowindex2, "productid");
    	document.getElementById("productname").innerText=": "+$('#mainlistgrid').jqxGrid('getcellvalue', rowindex2, "productname");
    	document.getElementById("productbrand").innerText=": "+$('#mainlistgrid').jqxGrid('getcellvalue', rowindex2, "brandname");
        
    	var barchval = document.getElementById("cmbbranch").value;
    $("#pricelistdiv").load("Discountpricelistgrid.jsp?barchval="+barchval+"&psrno="+psrno);

    });

    
    
    
   if(temp4=='NA')
    	{ 
    	  $("#mainlistgrid").jqxGrid('addrow', null, {});
    	}  
    
    $("#overlay, #PleaseWait").hide();
    
   
});


</script>
<div id="mainlistgrid"></div>