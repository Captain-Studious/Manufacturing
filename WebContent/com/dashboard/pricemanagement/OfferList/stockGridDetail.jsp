
 
 <%@page import="com.dashboard.pricemanagement.OfferList.ClsOfferListDAO"%>
 <% ClsOfferListDAO searchDAO = new ClsOfferListDAO(); 
   
    String barchval = request.getParameter("barchval")==null?"NA":request.getParameter("barchval").trim();	 
  	String psrno = request.getParameter("psrno")==null?"NA":request.getParameter("psrno").trim();  	
  	String statusselect = request.getParameter("statusselect")==null?"0":request.getParameter("statusselect").trim();
  	 String type = request.getParameter("type")==null?"NA":request.getParameter("type").trim();	 
   	String fromdates = request.getParameter("fromdates")==null?"NA":request.getParameter("fromdates").trim();  	
   	String todates = request.getParameter("todates")==null?"NA":request.getParameter("todates").trim();
	String brandid = request.getParameter("brandid")==null?"0":request.getParameter("brandid").trim();
	String catid = request.getParameter("catid")==null?"0":request.getParameter("catid").trim();
	String subcatid = request.getParameter("subcatid")==null?"0":request.getParameter("subcatid").trim();
   	
   	
   	
   
 %> 
    
       
 
<script type="text/javascript">
var temp4='<%=barchval%>';
var temp1='<%=fromdates%>';
var temp2='<%=todates%>';
var temp3='<%=psrno%>';
var temp5='<%=statusselect%>';
var temp6='<%=type%>';
var temp7='<%=brandid%>';
var temp8='<%=catid%>';
var temp9='<%=subcatid%>';
//alert(temp4+" "+temp1+" "+ temp2+" "+ temp3+" "+ temp5 +" "+temp6 +" "+temp7+" "+ temp8 +" "+temp9);
var datas1;

 if(temp4!='NA')
{ 
	 datas1='<%=searchDAO.stkclerlist(barchval,statusselect,psrno,fromdates,todates,type,brandid,catid,subcatid)%>';
	 
	 datasstockclearExcel='<%=searchDAO.stkclerlistExcel(barchval,statusselect,psrno,fromdates,todates,type,brandid,catid,subcatid)%>';
}
else
{ 
	
	datas1;
	
	}  

$(document).ready(function () {
	 /*  var rendererstring1=function (aggregates){
         	var value=aggregates['sum1'];
         	return '<div style="float: right; margin: 4px;font-size:12px; overflow: hidden;">' + " Total" + '</div>';
         }    
       */
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
                     
 
        
					 
{name : 'productid', type: 'String'  },
{name : 'productname', type: 'String'  },
{name : 'brandname', type: 'String'  },
{name : 'clrfromdate', type: 'date'  },
{name : 'clrtodate', type: 'date'  },
{name : 'fixingprice', type: 'number'  },
{name : 'clrprice', type: 'number'  },
{name : 'avail_qty', type: 'number'  },
						
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
    
    
   
   
    
    $("#stockclerdetail").jqxGrid(
    {
        width: '98%',
        height: 500,
        source: dataAdapter,
       // showaggregates:true,
        enableAnimations: true,
        filtermode:'excel',
        filterable: true,
        sortable:true,
        columnsresize: true,
        //showaggregates:true,
        //showstatusbar:true,
        
       // statusbarheight: 21,
        
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
                 
           	         { text: 'Product Id', datafield: 'productid',  width: '8%' }, 
           	         { text: 'Product Name', datafield: 'productname',  width: '26%' },
           	   	   	 {text: 'Brand Name', datafield: 'brandname', width: '15%' ,},
           	         { text: 'Valid From', datafield: 'clrfromdate',  width: '9%',cellsformat:'dd-MM-yyyy'},
		           	 { text: 'Valid To', datafield: 'clrtodate',  width: '9%',cellsformat:'dd-MM-yyyy' },
		           	{ text: 'Available Qty', datafield: 'avail_qty',  width: '8%',cellsformat:'d2'},
		           	 { text: 'Fixing Price', datafield: 'fixingprice',  width: '10%' ,cellsformat:'d2',cellsalign: 'right', align:'right'},
			         { text: 'Clearance Price', datafield: 'clrprice',  width: '10%' ,cellsformat:'d2',cellsalign: 'right', align:'right'},
			         
		           ]
   
    });
    $("#overlay, #PleaseWait").hide();
    
    
	});


	</script>
<div id="stockclerdetail"></div>