
<%@page import="com.dashboard.procurment.stockadjustment.ClsstockAdjustment" %>
<%ClsstockAdjustment cfar=new ClsstockAdjustment();

 

String productid=request.getParameter("productid")==null?"0":request.getParameter("productid");
String load=request.getParameter("aa")==null?"0":request.getParameter("aa");
String name=request.getParameter("name")==null?"0":request.getParameter("name");


%>


 

<script type="text/javascript">
  
	   var fleetdata='<%=cfar.assetdetails(productid,load,name)%>';
		$(document).ready(function () { 	
           
            var source =
            {
                datatype: "json",
                datafields: [
							{name : 'psrno', type: 'string'  },
                            {name : 'productid', type: 'string'  },
                            {name : 'name', type: 'string'  }
                           ],
                            localdata: fleetdata,
                
                pager: function (pagenum, pagesize, oldpagenum) {
                    // callback called when a page or page size is changed.
                }
                                        
            };
         
            var dataAdapter = new $.jqx.dataAdapter(source);
            
            $("#prdsearch").jqxGrid(
            {
                width: '100%',
                height: 357,
                source: dataAdapter,
                columnsresize: true,
               /*  showfilterrow: true, 
                filterable: true,  */
                selectionmode: 'singlerow',
                       
                columns: [
                          	  { text: 'Srno', datafield: 'psrno', width: '20%',hidden:true},
                              { text: 'ProductId', datafield: 'productid', width: '40%'},
                              { text: 'Name', datafield: 'name', width: '60%' },
						]
            });
            
          $('#prdsearch').on('rowdoubleclick', function (event) {
           
                var rowindex2 = event.args.rowindex;  
                document.getElementById("psrno").value=$('#prdsearch').jqxGrid('getcellvalue', rowindex2, "psrno");
                document.getElementById("part_no").value=$('#prdsearch').jqxGrid('getcellvalue', rowindex2, "productid");
                document.getElementById("prdname").value=$('#prdsearch').jqxGrid('getcellvalue', rowindex2, "name");
               
              $('#DetailsWindow').jqxWindow('close'); 
            }); 
        });
    </script>
    <div id="prdsearch"></div>