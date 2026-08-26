<%@page import="javax.servlet.http.HttpServletRequest" %>
<%@page import="javax.servlet.http.HttpSession" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@page import="com.productsearch.ClsProductSearchDAO"%>

 <%
 ClsProductSearchDAO DAO= new ClsProductSearchDAO(); 
String name = request.getParameter("name")==null?"0":request.getParameter("name");
String ldk = request.getParameter("ldk")==null?"0":request.getParameter("ldk");
 String code = request.getParameter("pcode")==null?"0":request.getParameter("pcode");
 String cat = request.getParameter("cat")==null?"0":request.getParameter("cat");
 String subcat = request.getParameter("subcat")==null?"0":request.getParameter("subcat");
 String brand = request.getParameter("brand")==null?"0":request.getParameter("brand");
 String docnos = request.getParameter("docnos")==null?"0":request.getParameter("docnos");
 String load = request.getParameter("load")==null?"0":request.getParameter("load");
 String frm = request.getParameter("frm")==null?"0":request.getParameter("frm");
 String gridname = request.getParameter("gridname")==null?"":request.getParameter("gridname");
 String gridrowindex = request.getParameter("gridrowindex")==null?"":request.getParameter("gridrowindex");
 System.out.println("FRM: "+frm);
 System.out.println("SubLDK: "+ldk);
%> 
 <script type="text/javascript">
 
  var  searchdata='<%=DAO.mainSrearch(session,name,code,brand,cat,subcat,docnos,load,ldk)%>'; 
 
        $(document).ready(function () { 
         
        	var frm='<%=frm%>';
             var num = 0; 
            var source = 
            {
                datatype: "json",
                datafields: [
                             
			 
     						{name : 'brand', type: 'String'  },
     						{name : 'category', type: 'String'  },
     						{name : 'subcategory', type: 'String'  }, 
      						{name : 'productcode', type: 'String'  },
      						{name : 'productname', type: 'string'  },
      						{name : 'docno', type: 'String'  },
      						{name : 'uom',type:'string'},
      						{name : 'uomid',type:'string'},
      						{name : 'density',type:'number'}
                          	],
                          	localdata: searchdata,
                          
          
				
                
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
            $("#jqxmainsearch").jqxGrid(
            {
                width: '100%',
                height: 345,
                source: dataAdapter,
                columnsresize: true,
               
           
                selectionmode: 'singlerow',
             
               
                //Add row method
	
     						
     					
     					
                columns: [
					{ text: 'Doc No', datafield: 'docno', width: '8%' },
					{ text: 'Product Code', datafield: 'productcode', width: '15%' },
					{ text: 'Product Name', datafield: 'productname', width: '35%' },
					{ text: 'Brand', datafield: 'brand', width: '15%' }, 
					{ text: 'Category', datafield: 'category', width: '14%' },
					{ text: 'Sub Category', datafield: 'subcategory', width: '13%'},
					{ text: 'UOM', datafield: 'uom', width: '13%',hidden:true},
					{ text: 'UOM Id', datafield: 'uomid', width: '13%',hidden:true},
					{ text: 'Density', datafield: 'density', width: '13%',hidden:true},
					]
            });
    
     
				            
				          $('#jqxmainsearch').on('rowdoubleclick', function (event) 
				            		{ 
				        	     var rowindex1=event.args.rowindex;
				        	     
				        	          if(frm=='DSE')
				        	    	   {
				        	    	    document.getElementById("hidproductid").value=$('#jqxmainsearch').jqxGrid('getcellvalue', rowindex1, "docno");
						         		document.getElementById("txtpartno").value=$('#jqxmainsearch').jqxGrid('getcellvalue', rowindex1, "productcode");
						        		document.getElementById("txtproductname").value=$('#jqxmainsearch').jqxGrid('getcellvalue', rowindex1, "productname");    
				        	    	   }
				        	     	  else if(frm=='STL')
			        	    	       {        
				        	    	    document.getElementById("name").value=$('#jqxmainsearch').jqxGrid('getcellvalue', rowindex1, "productcode");
					                    document.getElementById("searchdetails1").value=$('#jqxmainsearch').jqxGrid('getcellvalue', rowindex1, "productname");
					                    document.getElementById("psrno").value=$('#jqxmainsearch').jqxGrid('getcellvalue', rowindex1, "docno");
			        	    	       }
			        	    	       else if(frm=='PRDT')
			        	    	       {   
			        	    	       		var gridname='<%=gridname%>';
			        	    	       		var gridrowindex='<%=gridrowindex%>';
			        	    	       		if(gridname!="" && gridname!=null && gridname!="undefined"){
			        	    	       			if(gridname=='rawmaterialsGrid'){
			        	    	       				$('#rawmaterialsGrid').jqxGrid('setcellvalue',gridrowindex,'rmid',$('#jqxmainsearch').jqxGrid('getcellvalue', rowindex1, "productcode"));
			        	    	       				$('#rawmaterialsGrid').jqxGrid('setcellvalue',gridrowindex,'desc',$('#jqxmainsearch').jqxGrid('getcellvalue', rowindex1, "productname"));
			        	    	       				$('#rawmaterialsGrid').jqxGrid('setcellvalue',gridrowindex,'psrno',$('#jqxmainsearch').jqxGrid('getcellvalue', rowindex1, "docno"));
			        	    	       				$('#rawmaterialsGrid').jqxGrid('setcellvalue',gridrowindex,'uom',$('#jqxmainsearch').jqxGrid('getcellvalue', rowindex1, "uom"));
			        	    	       				$('#rawmaterialsGrid').jqxGrid('setcellvalue',gridrowindex,'uomid',$('#jqxmainsearch').jqxGrid('getcellvalue', rowindex1, "uomid"));
			        	    	       				$('#rawmaterialsGrid').jqxGrid('setcellvalue',gridrowindex,'density',parseFloat($('#jqxmainsearch').jqxGrid('getcellvalue', rowindex1, "density")).toFixed(4));
			        	    	       			
			        	    	       			}
			        	    	       			else if(gridname=='packmaterialsGrid'){
			        	    	       				$('#packmaterialsGrid').jqxGrid('setcellvalue',gridrowindex,'pid',$('#jqxmainsearch').jqxGrid('getcellvalue', rowindex1, "productcode"));
			        	    	       				$('#packmaterialsGrid').jqxGrid('setcellvalue',gridrowindex,'pdesc',$('#jqxmainsearch').jqxGrid('getcellvalue', rowindex1, "productname"));
			        	    	       				$('#packmaterialsGrid').jqxGrid('setcellvalue',gridrowindex,'psrno',$('#jqxmainsearch').jqxGrid('getcellvalue', rowindex1, "docno"));
			        	    	       				$('#packmaterialsGrid').jqxGrid('setcellvalue',gridrowindex,'uom',$('#jqxmainsearch').jqxGrid('getcellvalue', rowindex1, "uom"));
			        	    	       				$('#packmaterialsGrid').jqxGrid('setcellvalue',gridrowindex,'uomid',$('#jqxmainsearch').jqxGrid('getcellvalue', rowindex1, "uomid"));
			        	    	       			}
			        	    	       		}
			        	    	       		else{
			        	    	       			document.getElementById("productcode").value=$('#jqxmainsearch').jqxGrid('getcellvalue', rowindex1, "productcode");
					                    		document.getElementById("productname").value=$('#jqxmainsearch').jqxGrid('getcellvalue', rowindex1, "productname");
					                    		document.getElementById("psrno").value=$('#jqxmainsearch').jqxGrid('getcellvalue', rowindex1, "docno");
			        	    	       			document.getElementById("uom").value=$('#jqxmainsearch').jqxGrid('getcellvalue', rowindex1, "uom");
			        	    	       			document.getElementById("uomid").value=$('#jqxmainsearch').jqxGrid('getcellvalue', rowindex1, "uomid");
			        	    	       			document.getElementById("density").value=parseFloat($('#jqxmainsearch').jqxGrid('getcellvalue', rowindex1, "density")).toFixed(4);
			        	    	       		}
			        	    	       }
			        	    	 
				        		
				        		$('#productDetailsWindow').jqxWindow('close');
				               
				            
				            		 });	 
				           
        
                  }); 
				       
                       
    </script>
    <div id="jqxmainsearch"></div>
    
