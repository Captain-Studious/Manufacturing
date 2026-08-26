<%@page import="javax.servlet.http.HttpServletRequest" %>
<%@page import="javax.servlet.http.HttpSession" %>   
<%@page import="com.dashboard.manufacturing.materialrequirementplaning.ClsMaterialRequirementPlaningDAO" %>
<%ClsMaterialRequirementPlaningDAO DAO=new ClsMaterialRequirementPlaningDAO(); %>          
<%   
	String id = request.getParameter("id")==null?"0":request.getParameter("id").trim(); 
	String brch = request.getParameter("brch")==null?"":request.getParameter("brch").trim();    
	String from = request.getParameter("from")==null?"":request.getParameter("from").trim(); 
	String to = request.getParameter("to")==null?"":request.getParameter("to").trim();
	String maindocno = request.getParameter("maindocno")==null?"":request.getParameter("maindocno").trim(); 
	String docno = request.getParameter("docno")==null?"":request.getParameter("docno").trim();
%>
<style type="text/css">
    .redClass
    {
        background-color: #FFEBEB;      
    }
    
    .yellowClass
    {
        background-color: #FFFFD1;  
    }
       
     .orangeClass
    {
        background-color: #FFEBC2;
    }
    
</style>
<script type="text/javascript">           
     var prsdata;
     prsdata='<%=DAO.thirdload(docno,maindocno,id)%>';
	$(document).ready(function () {
	 var rendererstring=function (aggregates){
               	var value=aggregates['sum'];
               	if(typeof(value) == "undefined"){
               		value=0.00;
               	}
               	return '<div style="float: right; margin: 4px;font-size:10px; overflow: hidden;">' + " " + '' + value + '</div>';
               }
        	
        	var rendererstring1=function (aggregates){
                var value1=aggregates['sum1'];
                return '<div style="float: right; margin: 4px;font-size:12px; overflow: hidden;">' + " Total : " + '</div>';
               }  
    // prepare the data
    var source =
    {
        datatype: "json",
        datafields: [                  
							{name : 'mtype', type: 'String'  },
							{name : 'pid', type: 'String'  },
							{name : 'qty', type: 'String'  },
							{name : 'pdesc', type: 'String'  },
							{name : 'uom', type: 'String'  },
							{name : 'stock', type: 'String'  },
							{name : 'resqty', type: 'String'  },
							{name : 'balqty', type: 'String'  },
							{name : 'proprocess', type: 'String'  },
							{name : 'chk2', type: 'String'  },
						],  
				    localdata: prsdata,            
            
        pager: function (pagenum, pagesize, oldpagenum) {
            // callback called when a page or page size is changed.
        }
    };
  
   /*  var cellclassname = function (row, column, value, data) {
		 if (data.confirm ==1) {          
            return "yellowClass";
        }
    }; */

    
    var dataAdapter = new $.jqx.dataAdapter(source,
    		 {
        		loadError: function (xhr, status, error) {
                alert(error);    
                }
		            
	            }		
    );
   
   
    $("#jqxprocessGrid").jqxGrid(
    {
        width: '100%',
        height: 190,
        source: dataAdapter,
        enableAnimations: true,
        filterable: true,
        sortable:true,
        columnsresize: true,
       	selectionmode: 'singlecell',                 
       	showfilterrow: true,
        sortable:true,
        enabletooltips:true,                          
        pagermode: 'default',   
        editable:true,
        columns: [   
                  { text: 'SL#', sortable: false, filterable: false, editable: false,       
                      groupable: false, draggable: false, resizable: false,    
                      datafield: 'sl', columntype: 'number', width: '4%' ,
                      cellsrenderer: function (row, column, value) {
                          return "<center><div style='margin:4px;'>" + (value + 1) + "</div></center>";   
                      }  
                    },
                   { text: 'Product ID', datafield: 'pid',  width: '6%', editable: false},    
 	               { text: 'Product Description', datafield: 'pdesc', editable: false},
 	               { text: 'Material Type', datafield: 'mtype',  width: '6%', editable: false},   
 	               { text: 'UOM', datafield: 'uom',  width: '6%', editable: false}, 
 	               { text: 'Qty', datafield: 'qty',  width: '6%', editable: false}, 
 	               { text: 'Stock', datafield: 'stock',  width: '6%', editable: false}, 
 	               { text: 'Ord. Qty', datafield: 'resqty',  width: '6%', editable: true}, 
 	               { text: 'Bal. Qty', datafield: 'balqty',  width: '6%', editable: false}, 
 	               { text: '', datafield: 'chk',columntype:'checkbox',  width: '4%', editable: false}, 
 	             
 	              { text: 'Procurement Process',  datafield: 'proprocess',width:'10%',columntype:'dropdownlist',
						
						createeditor: function (row, column, editor) {  
							
                          billmodelist1 = ["Create Purchase Request","Create Blending Order"];
                        
							editor.jqxDropDownList({ autoDropDownHeight: true, source: billmodelist1 });
						
						},
				 	 initeditor: function (row, cellvalue, editor) {     
                         
						var terms = $('#jqxprocessGrid').jqxGrid('getcellvalue', row, "proprocess");
						
							editor.jqxDropDownList({ autoDropDownHeight: true, source: billmodelist1 });
						
                       }, 
		    
		},
 	              
			   ]   		 
    });     
    $("#overlay, #PleaseWait").hide();
    $("#jqxprocessGrid").on('cellvaluechanged', function (event) 
            {
	        var datafield = event.args.datafield;
   		
	       var rowindex2 = event.args.rowindex;        
		//alert("datafield==="+datafield);
		 if(datafield=='resqty')
	 {
			// alert("rowindex2==="+rowindex2);
	var res= $('#jqxprocessGrid').jqxGrid('getcellvalue', rowindex2, "resqty");
	var bal= $('#jqxprocessGrid').jqxGrid('getcellvalue', rowindex2, "qty");
	if(parseFloat(res)>parseFloat(bal)){
		$.messager.alert('Message', '  Order Qty Cannot be Greater than Qty  ');
		$('#jqxprocessGrid').jqxGrid('setcellvalue', rowindex2, "resqty",0);
	}
	else{		
	var nwbal=parseFloat(bal)-parseFloat(res);
	//alert("nwbal==="+nwbal);
	//$('#jqxthirdGrid').jqxGrid('setcellvalue', rowindex2, "balqty",0);
	$('#jqxprocessGrid').jqxGrid('setcellvalue', rowindex2, "balqty",nwbal);
	} 
	 }
            });
     /* $('#jqxprocessGrid').on('rowdoubleclick', function (event) {                  
            var rowindex2 = event.args.rowindex;                      
			document.getElementById("hidbrhid").value=$('#jqxprocessGrid').jqxGrid('getcellvalue', rowindex2, "brhid");
			document.getElementById("hidvocno").value=$('#jqxprocessGrid').jqxGrid('getcellvalue', rowindex2, "voc_no");     
            $('.textpanel p').text('Doc No '+$('#jqxprocessGrid').jqxGrid('getcellvalue',rowindex2,'voc_no')+' - '+$('#jqxprocessGrid').jqxGrid('getcellvalue', rowindex2, "tenant"));
        }); */    
});
</script>
<div id="jqxprocessGrid"></div>