<%@page import="javax.servlet.http.HttpServletRequest" %>
<%@page import="javax.servlet.http.HttpSession" %>
<%@page import="com.dashboard.manufacturing.productplaning.ClsproductplaningDAO" %>
<%ClsproductplaningDAO DAO=new ClsproductplaningDAO(); %> 
<%
String reqmasterdocno=request.getParameter("reqmasterdocno")==null?"0":request.getParameter("reqmasterdocno").trim();
String dtype=request.getParameter("dtype")==null?"0":request.getParameter("dtype").trim();
String dates=request.getParameter("dates")==null?"0":request.getParameter("dates").trim();
String cmbbilltype=request.getParameter("cmbbilltype")==null?"0":request.getParameter("cmbbilltype").trim();
String accdocno=request.getParameter("accdocno")==null?"0":request.getParameter("accdocno").trim();
String id = request.getParameter("id")==null?"0":request.getParameter("id").trim();
String productname = request.getParameter("productsname")==null?"0":request.getParameter("productsname");
String brandname = request.getParameter("brandsname")==null?"0":request.getParameter("brandsname");
String gridunit = request.getParameter("gridunit")==null?"0":request.getParameter("gridunit");
String gridprdname = request.getParameter("gridprdname")==null?"0":request.getParameter("gridprdname");
String gridcategory = request.getParameter("gridcategory")==null?"0":request.getParameter("gridcategory");
String gridssubcategory = request.getParameter("gridssubcategory")==null?"0":request.getParameter("gridssubcategory");
String dept = request.getParameter("deptid")==null?"0":request.getParameter("deptid");
String formchk = request.getParameter("formchk")==null?"0":request.getParameter("formchk");
%>
       <script type="text/javascript">
       var dtype='<%=dtype%>';
       var formchk='<%=formchk%>';
       var prddata;
       //console.log("From Inside Grid");
       //console.log(window.productdata);
      
    	   prddata= '<%=DAO.searchProduct(session,id,dept)%>';
    	   
    	  
    	    
       
		$(document).ready(function () {
			
            var source =
            {
                datatype: "json",
                datafields: [ 
                            {name : 'part_no', type: 'string'  },
                            {name : 'pdesc', type: 'string'  },
                            {name : 'doc_no', type: 'string'  },
                            {name : 'unit', type: 'string'  },
                            {name : 'unitid', type: 'string'  },
                            {name : 'psrno', type: 'string'  },
                            {name : 'method', type: 'string'  },
                             {name : 'qty', type: 'number'  },
                             {name : 'balqty', type: 'number'  },
                            {name : 'qutval', type: 'number'  },
                            {name : 'stock', type: 'number'  },
                            {name : 'saveqty', type: 'number'  },
                            {name : 'specid', type: 'string'  },
                            {name : 'unitprice', type: 'number'  },
                            {name : 'rowno', type: 'Int'  },
                            {name : 'discount', type: 'number'  },
                            {name : 'disper', type: 'number'  },
                            {name : 'total', type: 'number'  },
                            {name : 'nettotal', type: 'number'  },
                            {name : 'stockid', type: 'number'  },
                            {name : 'orderdiscper', type: 'string'    },
       						{name : 'orderamount', type: 'string'    },
       						{name : 'brandname', type: 'string'    },
       						{name : 'department', type: 'string'    },
       						{name : 'mtype', type: 'string'    },
       						{name : 'mtypeid', type: 'string'    },
       						{name : 'taxdocno', type: 'string'    },
       						{name : 'mainpsrno', type: 'string'    },
       						
                        ],
         
                		//  url: url1,
                 localdata: prddata,
                
                pager: function (pagenum, pagesize, oldpagenum) {
                    // callback called when a page or page size is changed.
                }
                                        
            };
           
            var dataAdapter = new $.jqx.dataAdapter(source);
            
            $("#prosearch").jqxGrid(
            {
                width: '100%',
                height: 500,
                source: dataAdapter,
                columnsresize: true,
                showfilterrow: true,
                filterable: true, 
                enabletooltips:true,
                selectionmode: 'singlerow',
            
                
            
                       
                columns: [
							
                          { text: '', sortable: false, filterable: false, editable: false,
                              groupable: false, draggable: false, resizable: false,cellsalign: 'center', align:'center',
                              datafield: 'sl', columntype: 'number', width: '4%',
                              cellsrenderer: function (row, column, value) {
                                  return "<center><div style='margin:4px;'>" + (value + 1) + "</div></center>";
                              }  
                            },
                       
                              { text: 'DOC NO', datafield: 'doc_no', width: '20%' ,hidden:true },
                              { text: 'Product', datafield: 'part_no', width: '28%' },
                              { text: 'Product Name', datafield: 'pdesc' },
                              { text: 'Method', datafield: 'method', width: '10%' ,hidden:true},
                              { text: 'Unitdoc', datafield: 'munit', width: '10%' , hidden:true },
                              { text: 'psrno', datafield: 'psrno', width: '10%' ,hidden:true},
                              
                              
                              
                              { text: 'Quantity', datafield: 'qty', width: '10%' ,cellsformat:'d2' ,hidden:true},
                              {text: 'qutval', datafield: 'qutval', width: '10%' , cellsformat:'d2' ,hidden:true},
  							{ text: 'pqty', datafield: 'pqty', width: '9%' ,  cellsformat:'d2' ,hidden:true },
  							{text: 'saveqty', datafield: 'saveqty', width: '10%', cellsformat:'d2'  ,hidden:true},
                             
  							{text: 'specid', datafield: 'specid', width: '10%' ,hidden:true  },
                             
  			                
  		 
  							{text: 'unitprice', datafield: 'unitprice', width: '10%'   ,  cellsformat:'d2' ,hidden:true  },
  							{text: 'discount', datafield: 'discount', width: '10%',hidden:true },
  							
  							{text: 'disper', datafield: 'disper', width: '10%'  ,  cellsformat:'d2'  ,hidden:true },
  							
  							
	                          {text: 'total', datafield: 'total', width: '10%' ,hidden:true  },
  							
  							{text: 'nettotal', datafield: 'nettotal', width: '10%' ,hidden:true  },
  							{text: 'stockid', datafield: 'stockid', width: '10%'  ,hidden:true  },
  							
  							
  							{text: 'orderdiscper', datafield: 'orderdiscper', width: '10%' ,hidden:true   },
  							{text: 'orderamount', datafield: 'orderamount', width: '10%'  ,hidden:true   },
  							
  							
  							{text: 'Brand', datafield: 'brandname', width: '10%',hidden:true},
  							{text: 'Department', datafield: 'department', width: '10%',hidden:true},
  							{text: 'Stock Qty', datafield: 'balqty', width: '10%',hidden:true},
  						    { text: 'Unit', datafield: 'unit', width: '10%' },
  						  { text: 'taxper', datafield: 'taxper', width: '10%', hidden:true}, 
  						  
  						  { text: 'taxdocno', datafield: 'taxdocno', width: '10%', hidden:true},
  						
  						  
  						  
  						
  							
						]
            })
             
            
        /*     $('#prosearch').on('cellclick', function (event) {
            	
            	 var rowindex2 = event.args.rowindex;
            	 
            	 alert(rowindex2);
            	
            });  */
            
            
          
          $('#prosearch').on('rowdoubleclick', function (event) {
        	
        	  // $('#serviecGrid').jqxGrid('render');
        	  var rowindex1 =$('#rowindexg').val();
            	// alert(rowindex1);
            	
                var rowindex2 = event.args.rowindex;
               if(parseInt(formchk)==1){
                	   $('#jqxpreProdGrid').jqxGrid('setcellvalue', rowindex1, "pid" ,$('#prosearch').jqxGrid('getcellvalue', rowindex2, "part_no"));
                       $('#jqxpreProdGrid').jqxGrid('setcellvalue', rowindex1, "pdesc" ,$('#prosearch').jqxGrid('getcellvalue', rowindex2, "pdesc"));       
                      // $('#jqxbomGrid').jqxGrid('setcellvalue', rowindex1, "psrno" ,$('#prosearch').jqxGrid('getcellvalue', rowindex2, "psrno"));  
                       
                       $('#jqxpreProdGrid').jqxGrid('setcellvalue', rowindex1, "psrno" ,$('#prosearch').jqxGrid('getcellvalue', rowindex2, "doc_no"));  
                       $('#jqxpreProdGrid').jqxGrid('setcellvalue', rowindex1, "uom" ,$('#prosearch').jqxGrid('getcellvalue', rowindex2, "unit"));
                       $('#jqxpreProdGrid').jqxGrid('setcellvalue', rowindex1, "uomid" ,$('#prosearch').jqxGrid('getcellvalue', rowindex2, "unitid"));
                       $('#jqxpreProdGrid').jqxGrid('setcellvalue', rowindex1, "specid" ,$('#prosearch').jqxGrid('getcellvalue', rowindex2, "specid"));
                       $("#jqxpreProdGrid").jqxGrid('addrow', null, {});
                        var chkrows=$("#jqxpreProdGrid").jqxGrid('getrows');
          			  var setrow=chkrows.length-1;
          			  //alert("lastrowindex==="+setrow);
          			  $('#jqxpreProdGrid').jqxGrid('setcellvalue', setrow, "srchbtn","Search"); 
               }
               if(parseInt(formchk)==2){
            	   $('#jqxqltyprcsGrid').jqxGrid('setcellvalue', rowindex1, "pid" ,$('#prosearch').jqxGrid('getcellvalue', rowindex2, "part_no"));
                   $('#jqxqltyprcsGrid').jqxGrid('setcellvalue', rowindex1, "pdesc" ,$('#prosearch').jqxGrid('getcellvalue', rowindex2, "pdesc"));       
                  // $('#jqxbomGrid').jqxGrid('setcellvalue', rowindex1, "psrno" ,$('#prosearch').jqxGrid('getcellvalue', rowindex2, "psrno"));  
                   
                   $('#jqxqltyprcsGrid').jqxGrid('setcellvalue', rowindex1, "psrno" ,$('#prosearch').jqxGrid('getcellvalue', rowindex2, "doc_no"));  
                   $('#jqxqltyprcsGrid').jqxGrid('setcellvalue', rowindex1, "uom" ,$('#prosearch').jqxGrid('getcellvalue', rowindex2, "unit"));
                   $('#jqxqltyprcsGrid').jqxGrid('setcellvalue', rowindex1, "uomid" ,$('#prosearch').jqxGrid('getcellvalue', rowindex2, "unitid"));
                   $('#jqxqltyprcsGrid').jqxGrid('setcellvalue', rowindex1, "specid" ,$('#prosearch').jqxGrid('getcellvalue', rowindex2, "specid"));
                   $("#jqxqltyprcsGrid").jqxGrid('addrow', null, {});
                    var chkrows=$("#jqxqltyprcsGrid").jqxGrid('getrows');
      			  var setrow=chkrows.length-1;
      			  //alert("lastrowindex==="+setrow);
      			  $('#jqxqltyprcsGrid').jqxGrid('setcellvalue', setrow, "srchbtn","Search"); 
           }
                       /* $('#jqxdeptGrid').jqxGrid('setcellvalue', rowindex1, "specid" ,$('#prosearch').jqxGrid('getcellvalue', rowindex2, "specid"));
                  	 	$('#jqxdeptGrid').jqxGrid('setcellvalue', rowindex1, "brandname" ,$('#prosearch').jqxGrid('getcellvalue', rowindex2, "brandname"));
                       $('#serviecGrid').jqxGrid('setcellvalue', rowindex1, "productid" ,$('#prosearch').jqxGrid('getcellvalue', rowindex2, "part_no"));
                       $('#serviecGrid').jqxGrid('setcellvalue', rowindex1, "productname" ,$('#prosearch').jqxGrid('getcellvalue', rowindex2, "productname"));
                       $('#serviecGrid').jqxGrid('setcellvalue', rowindex1, "prodoc" ,$('#prosearch').jqxGrid('getcellvalue', rowindex2, "doc_no"));
                       $('#serviecGrid').jqxGrid('setcellvalue', rowindex1, "unit" ,$('#prosearch').jqxGrid('getcellvalue', rowindex2, "unit"));
                       $('#serviecGrid').jqxGrid('setcellvalue', rowindex1, "unitdocno" ,$('#prosearch').jqxGrid('getcellvalue', rowindex2, "munit"));
                       $('#serviecGrid').jqxGrid('setcellvalue', rowindex1, "psrno" ,$('#prosearch').jqxGrid('getcellvalue', rowindex2, "psrno")); */
                     //  $("#serviecGrid").jqxGrid('selectcell',rowindex1, "qty");
                	 
                 
                 
                 
                 
          
              $('#sidesearchwndow').jqxWindow('close'); 
            }); 
           
            
       
        });
		
    </script>
    <div id="prosearch"></div>
    
    