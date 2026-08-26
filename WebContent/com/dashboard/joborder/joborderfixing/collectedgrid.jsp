<%@page import="javax.servlet.http.HttpServletRequest"%>
<%@page import="javax.servlet.http.HttpSession"%>
<% String contextPath=request.getContextPath();%>


<%@page import="com.dashboard.joborder.ClsjobOrderDAO"%>
<%ClsjobOrderDAO DAO= new ClsjobOrderDAO();%>
<%-- <%@page import="com.salesandmarketing.Sales.joborder.ClsJobOrderDAO"%>
<%ClsJobOrderDAO DAO= new ClsJobOrderDAO();%> --%>

<% 

String docno=request.getParameter("docno")==null?"0":request.getParameter("docno").trim();

 
String barchval=request.getParameter("barchvals")==null?"0":request.getParameter("barchvals").trim();

 

%>

 

<script type="text/javascript">
var collctdata;
$(document).ready(function () {
 
 
var temp='<%=docno%>';
 

 if(temp>0)
{
	
	collctdata='<%=DAO.collectedgridReload(barchval,docno)%>';  
	


} 
 
else
 
{   
	collctdata;

 } 
             

 
 var rendererstring2=function (aggregates){
  	var value=aggregates['sum2'];
  	return '<div style="float: right; margin: 4px;font-size:12px; overflow: hidden;">' + "  Total" + '</div>';
  }    



	  var rendererstring1=function (aggregates){
    	var value=aggregates['sum1'];
    	return '<div style="float: right; margin: 4px;font-size:12px; overflow: hidden;">' + "Net Total" + '</div>';
    }
	  
	  var cellclassname = function (row, column, value, data) {
  		if (data.chkqty==1) {
  			// document.getElementById("errormsg").innetText="Quantity Should not Be Zero";
              return "redClass";
          }
  		else{
  			//document.getElementById("errormsg").innetText="";
  		}
  		
  		 var ss= $('#collectedgrid').jqxGrid('getcellvalue', row, "qty");
         if(parseInt(ss)<=0)
 		{
 		
 		return "redClass";
 	
 		}
     
         

  		};
 
var rendererstring=function (aggregates){
	var value=aggregates['sum'];
	if(value==""||typeof(value)=="undefined"|| typeof(value)=="NaN")
	   {
		value=0.0;
	   }
	
	return '<div style="float: right; margin: 4px;font-size:12px; overflow: hidden;"> ' + value + '</div>';
}
 
             $('#gridtext').keyup(function(){
             	

 			      $("#prosearch").jqxGrid('clearfilters');
       		  
             
                 $('#part_no').val($(this).val());
                 var dataField = "part_no";
          applyFilter(dataField,$(this).val());  
                 
                 
                 
             });
             
         
             $('#gridtext1').keyup(function(){
             	

 			      $("#prosearch").jqxGrid('clearfilters');
     		  
           
               $('#productname').val($(this).val());
               var dataField = "productname";
    		   applyFilter(dataField,$(this).val());  
               
               
               
           });            
           	 
            var source =
            {
                datatype: "json",
                datafields: [
     						{name : 'productid', type: 'string' }, 
     						{name : 'productname', type: 'string'},
     						{name : 'unit', type: 'string'  },
     						{name : 'size', type: 'number'   },
     						{name : 'totqty', type: 'number'   },
     						{name : 'qty', type: 'number'   },
     						{name : 'outqty', type: 'number'   },
     						{name : 'oldqty', type: 'number'   },
     						{name : 'balqty', type: 'number'   },
     						{name : 'foc', type: 'int' },
     						{name : 'refqty', type: 'int'  },
							{name : 'totwtkg', type: 'number' },
							{name : 'kgprice', type: 'number'  },
     						{name : 'unitprice', type: 'number' },
     						{name : 'total', type: 'number' },
     						{name : 'discper', type: 'number' },
     						{name : 'dis', type: 'number' },
     						{name : 'netotal', type: 'number' },
     						{name : 'proid', type: 'string'    },
                    		{name : 'proname', type: 'string'    },
                    		{name : 'prodoc', type: 'number'    },
                    		{name : 'specid', type: 'number'    },
     						{name : 'unitdocno', type: 'number'    },
     						{name : 'psrno', type: 'number'    },
     						{name : 'stkid', type: 'number'    },
     						
     						{name : 'locid', type: 'number'    },
     						
     					    {name : 'brandname', type: 'string'  },
     					    {name : 'count', type: 'string'  },
     					   {name : 'allowdiscount', type: 'number'  },
     						{name : 'fixing', type: 'string'  },
     					   
     					   
                        ],
                        
                        
                       
                         localdata: collctdata,  
                
                pager: function (pagenum, pagesize, oldpagenum) {
                    // callback called when a page or page size is changed.
                }
            };
            
            		
            		
         		 
            		
            		
            var dataAdapter = new $.jqx.dataAdapter(source);
            
            $("#collectedgrid").jqxGrid(
            {
                width: '99.5%',
                height: 350,
                source: dataAdapter,
               
                editable: true,
                
               
                selectionmode: 'checkbox',
                
                
 
                columns: [
							{ text: 'Sr. No.', sortable: false, filterable: false, editable: false,
                              groupable: false, draggable: false, resizable: false,datafield: '',
                              columntype: 'number', width: '5%',cellsalign: 'center', align: 'center',cellclassname: cellclassname,
                              cellsrenderer: function (row, column, value) {
                            	  return "<center><div style='margin:4px;'>" + (value + 1) + "</div></center>";
                              }  
							},
							{ text: 'Product', datafield: 'productid' ,cellclassname: cellclassname,
	                          
							},
  							 
						{ text: 'Product Name', datafield: 'productname'  ,cellclassname: cellclassname 
							
							},	
							
							{text: 'Brand Name', datafield: 'brandname', width: '10%' , editable:false,cellclassname: cellclassname  },
							
							{ text: 'Unit', datafield: 'unit', width: '6%',editable:false,cellclassname: cellclassname },	
							{ text: 'Size', datafield: 'size', width: '7%',editable:false,cellclassname: cellclassname,hidden:true },
							{ text: 'Quantity', datafield: 'qty', width: '10%',cellclassname: cellclassname },
							
							
							{ text: 'Fixing', datafield: 'fixing', editable: true,  width: '10%',cellsalign: 'center', align: 'center'
							},
							{ text: 'oldqty', datafield: 'oldqty', width: '7%',cellclassname: cellclassname,hidden:true  },
							{ text: 'TOT. Qty', datafield: 'totqty', width: '7%',cellclassname: cellclassname ,hidden:true },
							{ text: 'FOC', datafield: 'foc', width: '7%',cellclassname: cellclassname,hidden:true },
							{ text: 'OUT. Qty', datafield: 'outqty', width: '7%',cellclassname: cellclassname ,hidden:true },
							{ text: 'Bal. Qty', datafield: 'balqty', width: '7%',cellclassname: cellclassname ,hidden:true },
							{ text: 'Total Weight KG', datafield: 'totwtkg', width: '10%',cellsformat: 'd2', cellsalign: 'right', align: 'right',cellclassname: cellclassname,hidden:true },
							{ text: 'KG Price', datafield: 'kgprice', width: '10%', cellsformat: 'd2', cellsalign: 'right', align: 'right',cellclassname: cellclassname,hidden:true  },
							{ text: 'Unit price', datafield: 'unitprice', width: '10%', cellsformat: 'd2', cellsalign: 'right', align: 'right',cellclassname: cellclassname,hidden:true  },
							{ text: 'Total', datafield: 'total', width: '10%', cellsformat: 'd2', cellsalign: 'right', align: 'right',editable:false,cellclassname: cellclassname,hidden:true  },
							{ text: 'allowdiscount', datafield: 'allowdiscount', width: '5%', cellsformat: 'd2', cellsalign: 'right', align: 'right',cellclassname: cellclassname ,hidden:true },
							
							{ text: 'Discount%', datafield: 'discper', width: '5%', cellsformat: 'd2', cellsalign: 'right', align: 'right',cellclassname: cellclassname ,hidden:true },
							{ text: 'Discount', datafield: 'dis', width: '10%', cellsformat: 'd2', cellsalign: 'right', align: 'right',aggregates: ['sum1'],aggregatesrenderer:rendererstring1,cellclassname: cellclassname,hidden:true },
							{ text: 'Net Total', datafield: 'netotal', width: '10%', cellsformat: 'd2', cellsalign: 'right', align: 'right',aggregates: ['sum'],aggregatesrenderer:rendererstring ,editable: false,cellclassname: cellclassname,hidden:true },
							{text: 'pid', datafield: 'proid', width: '10%',cellclassname: cellclassname,hidden:true }, 
  							{text: 'pname', datafield: 'proname', width: '10%',cellclassname: cellclassname,hidden:true },
  							{text: 'prodoc', datafield: 'prodoc', width: '10%',cellclassname: cellclassname,hidden:true },
							{text: 'unitdocno', datafield: 'unitdocno', width: '10%',cellclassname: cellclassname,hidden:true },
							{text: 'psrno', datafield: 'psrno', width: '10%',cellclassname: cellclassname,hidden:true},
							{text: 'specid', datafield: 'specid', width: '10%',cellclassname: cellclassname,hidden:true },
							{text: 'stockid', datafield: 'stkid', width: '10%',cellclassname: cellclassname,hidden:true },
							{text: 'eidtprice', datafield: 'eidtprice', width: '10%' ,hidden:true },
							
							
							{text: 'locid', datafield: 'locid', width: '10%'    ,hidden:true },
							
							{text: 'chkqty', datafield: 'chkqty', width: '10%' ,hidden:true  },
							{text: 'count', datafield: 'count', width: '10%'    ,hidden:true },
							
							
						]
            });
            
            $("#overlay, #PleaseWait").hide(); 
 
 
});

            
            
 
 
       
</script>
<div id="collectedgrid"></div>
<input type="hidden" id="rowindex">
<input type="hidden" id="datas">
<input type="hidden" id="datas1">
