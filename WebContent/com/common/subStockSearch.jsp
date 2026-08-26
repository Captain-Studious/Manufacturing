<%@page import="javax.servlet.http.HttpServletRequest" %>
<%@page import="javax.servlet.http.HttpSession" %>
<%@page import="com.controlcentre.masters.product.ClsProductDAO"%>

 <%
 ClsProductDAO DAO= new ClsProductDAO(); 
String name = request.getParameter("name")==null?"0":request.getParameter("name");
 String code = request.getParameter("pcode")==null?"0":request.getParameter("pcode");
 String cat = request.getParameter("cat")==null?"0":request.getParameter("cat");
 String subcat = request.getParameter("subcat")==null?"0":request.getParameter("subcat");
 String brand = request.getParameter("brand")==null?"0":request.getParameter("brand");
 
%> 
 <script type="text/javascript">
 
  var stockdata;
 stockdata='<%=DAO.mainSrearch(session,name,code,brand,cat,subcat)%>'; 
 
        $(document).ready(function () { 
         
        	
             var num = 0; 
            var source = 
            {
                datatype: "json",
                datafields: [
                             
              
     						{name : 'brand', type: 'String'  },
     						{name : 'category', type: 'String'  },
     						{name : 'subcategory', type: 'String'  }, 
      						{name : 'productcode', type: 'String'  },
      						{name : 'productname', type: 'String'  },
      						{name : 'brname', type: 'String'  },
      						{name : 'locname', type: 'String'  },
      						{name : 'balstk', type: 'String'  },
      						{name : 'costprice', type: 'String'  },
      						{name : 'psrno', type: 'String'  },
      						{name : 'stockid', type: 'String'  }
      						
                          	],
                          	localdata: stockdata,
                          
          
				
                
                pager: function (pagenum, pagesize, oldpagenum) {
                   
                }
            };
            
            var dataAdapter = new $.jqx.dataAdapter(source,
            		 {
                		loadError: function (xhr, status, error) {
	                    alert(error);    
	                    }
		            }		
            );
            $("#jqxmainstocksearch").jqxGrid(
            {
                width: '100%',
                height: 330,
                source: dataAdapter,
                columnsresize: true,
               
           
                selectionmode: 'singlerow',
             
               
                //Add row method
	
     						
     					
     					
                columns: [
					{ text: 'Product Code', datafield: 'productcode', width: '8%' },
					{ text: 'Product Name', datafield: 'productname', width: '25%' },
					{ text: 'Brand', datafield: 'brand', width: '13%' }, 
					{ text: 'Category', datafield: 'category', width: '13%' },
					{ text: 'Sub Category', datafield: 'subcategory', width: '13%'},
					{ text: 'Branch', datafield: 'brname', width: '13%'},
					{ text: 'Location', datafield: 'locname', width: '13%'},
					{ text: 'Stock', datafield: 'balqty', width: '10%'},
					{ text: 'Price', datafield: 'costprice', width: '12%'},
					{ text: 'psrno', datafield: 'psrno', width: '12%',hidden:true},
					{ text: 'stkid', datafield: 'stkid', width: '12%',hidden:true},
					
					
					]
            });
    
          /*   $("#jqxmainstocksearch").jqxGrid('addrow', null, {}); */
      
				            
				          $('#jqxmainstocksearch').on('rowdoubleclick', function (event) 
				            		{ 
				        	  var rowindex1=event.args.rowindex;
				            	
				         document.getElementById("docno").value=$('#jqxmainstocksearch').jqxGrid('getcellvalue', rowindex1, "docno");
				         document.getElementById("txtproductname").value=$('#jqxmainstocksearch').jqxGrid('getcellvalue', rowindex1, "cldocno");
				                    
				                  
				                $('#window').jqxWindow('close');
				               
				                $('#frmProduct txtproductname').attr('disabled', false);
				                $('#frmProduct docno').attr('disabled', false); 
				                funSetlabel();
				                
				                $('#frmProduct input').attr('disabled', false ); 
				                
				                document.getElementById("frmProduct").submit();
				            	
				               
				            
				            		 });	 
				           
        
                  }); 
				       
                       
    </script>
    <div id="jqxmainstocksearch"></div>
    
