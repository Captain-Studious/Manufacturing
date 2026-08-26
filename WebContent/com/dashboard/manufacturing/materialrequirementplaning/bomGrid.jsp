<%@page import="javax.servlet.http.HttpServletRequest" %>
<%@page import="javax.servlet.http.HttpSession" %>   
<%@page import="com.dashboard.manufacturing.materialrequirementplaning.ClsMaterialRequirementPlaningDAO" %>
<%ClsMaterialRequirementPlaningDAO DAO=new ClsMaterialRequirementPlaningDAO(); %>        
<%   
	String id = request.getParameter("id")==null?"0":request.getParameter("id").trim(); 
	String brch = request.getParameter("brch")==null?"":request.getParameter("brch").trim();    
	String from = request.getParameter("from")==null?"":request.getParameter("from").trim(); 
	String to = request.getParameter("to")==null?"":request.getParameter("to").trim();
	String docno = request.getParameter("docno")==null?"":request.getParameter("docno").trim();
	String psrno = request.getParameter("psrno")==null?"":request.getParameter("psrno").trim();
	String prdarray = request.getParameter("prdarray")==null?"":request.getParameter("prdarray").trim();
%>
<style type="text/css">
    .redClass
    {
        background-color:#DFFF00;      
    }
    
    .yellowClass
    {
        background-color: #FFBF00;  
    }
       
     .orangeClass
    {
        background-color: #FF7F50;
    }
     .magentaClass
    {
        background-color: #DE3163;
    }
     .blueClass
    {
        background-color: #40E0D0;
    }
    
    
     .color1Class
    {
        background-color:#F0FFFF;      
    }
    
    .color2Class
    {
        background-color:#89CFF0;  
    }
       
     .color3Class
    {
        background-color: #0000FF;
    }
     .color4Class
    {
        background-color: #7393B3;
    }
     .color5Class
    {
        background-color: #088F8F;
    }
     .color6Class
    {
        background-color:#0096FF;      
    }
    
    .color7Class
    {
        background-color: #5F9EA0;  
    }
       
     .color8Class
    {
        background-color: #0047AB;
    }
     .color9Class
    {
        background-color: #6495ED;
    }
     .color10Class
    {
        background-color: #6F8FAF;
    }
     .color11Class
    {
        background-color:#6082B6;      
    }
    
    .color12Class
    {
        background-color: #00A36C;  
    }
       
     .color13Class
    {
        background-color: #5D3FD3;
    }
     .color14Class
    {
        background-color: #008080;
    }
     .color15Class
    {
        background-color: #FF5733;
    }
</style>
<script type="text/javascript">        
     var bomdata;
     var colorchk="0";
     var j="0";
     bomdata='<%=DAO.secondload(docno,id,psrno)%>';  
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
        	             {name : 'sorddoc', type: 'String'  },
						{name : 'mtype', type: 'String'  },
						{name : 'pid', type: 'String'  },
						{name : 'nworkqty', type: 'number'  },
						{name : 'qty', type: 'number'  },
						{name : 'pdesc', type: 'String'  },
						{name : 'uom', type: 'String'  },
						{name : 'uomid', type: 'String'  },
						{name : 'stock', type: 'number'  },
						{name : 'resqty', type: 'number'  },
						{name : 'hidresqty', type: 'number'  },
						{name : 'balqty', type: 'number'  },
						{name : 'prdid', type: 'String'  }, 
						{name : 'specid', type: 'String'  },
						{name : 'worder', type: 'number'  },
						{name : 'hidworder', type: 'number'  },
						{name : 'chk2', type: 'String'  },
						{name : 'setdoc', type: 'String'  },
						{name : 'mainpsrno', type: 'String'  },
						{name : 'chkpsrno', type: 'String'  },
						{name : 'rawpsrno', type: 'String'  },
						{name : 'psrno', type: 'String'  },
						{name : 'mtypeid', type: 'String'  },
						{name : 'srchbtn', type: 'String'  },
						{name : 'mrpdoc', type: 'String'  },
						{name : 'rdocno', type: 'String'  },
						{name : 'rdtype', type: 'String'  },
						{name : 'bompsrno', type: 'String'  },
						{name : 'bomethod', type: 'String'  },
						
						],  
				    localdata: bomdata,            
            
        pager: function (pagenum, pagesize, oldpagenum) {
            // callback called when a page or page size is changed.
        }
    };
  
     var cellclassname = function (row, column, value, data) {
    	
    	 var psrnochk=data.setdoc;
    	 if(psrnochk==1){
			 if(psrnochk==data.setdoc){
        		 return "redClass";
        	 }
        	
		}
		
		if(psrnochk==2){
			 if(psrnochk==data.setdoc){
       		 return "orangeClass";
       	 }
       	
		}
		if(psrnochk==3){
			 if(psrnochk==data.setdoc){
       		 return "magentaClass";
       	 }
       	
		}
		if(psrnochk==4){
			 if(psrnochk==data.setdoc){
       		 return "blueClass";
       	 }
       	 
		}
		if(psrnochk==5){
			 if(psrnochk==data.setdoc){
      		 return "yellowClass";
      	 }
      	 
		}
		 if(psrnochk==6){
			 if(psrnochk==data.setdoc){
        		 return "color1Class";
        	 }
        	
		}
		
		if(psrnochk==7){
			 if(psrnochk==data.setdoc){
       		 return "color2Class";
       	 }
       	
		}
		if(psrnochk==8){
			 if(psrnochk==data.setdoc){
       		 return "color3Class";
       	 }
       	
		}
		if(psrnochk==9){
			 if(psrnochk==data.setdoc){
       		 return "color4Class";
       	 }
       	 
		}
		if(psrnochk==10){
			 if(psrnochk==data.setdoc){
      		 return "color5Class";
      	 }
      	 
		}
		 if(psrnochk==11){
			 if(psrnochk==data.setdoc){
        		 return "color6Class";
        	 }
        	
		}
		
		if(psrnochk==12){
			 if(psrnochk==data.setdoc){
       		 return "color7Class";
       	 }
       	
		}
		if(psrnochk==13){
			 if(psrnochk==data.setdoc){
       		 return "color8Class";
       	 }
       	
		}
		if(psrnochk==14){
			 if(psrnochk==data.setdoc){
       		 return "color9Class";
       	 }
       	 
		}
		if(psrnochk==15){
			 if(psrnochk==data.setdoc){
      		 return "color10Class";
      	 }
      	 
		}
		 if(psrnochk==16){
			 if(psrnochk==data.setdoc){
        		 return "color11Class";
        	 }
        	
		}
		
		if(psrnochk==17){
			 if(psrnochk==data.setdoc){
       		 return "color12Class";
       	 }
       	
		}
		if(psrnochk==18){
			 if(psrnochk==data.setdoc){
       		 return "color13Class";
       	 }
       	
		}
		if(psrnochk==19){
			 if(psrnochk==data.setdoc){
       		 return "color14Class";
       	 }
       	 
		}
		if(psrnochk==20){
			 if(psrnochk==data.setdoc){
      		 return "color15Class";
      	 }
      	 
		}
    }; 

    
    var dataAdapter = new $.jqx.dataAdapter(source,
    		 {
        		loadError: function (xhr, status, error) {
                alert(error);    
                }
		            
	            }		
    );
   
   
    $("#jqxbomGrid").jqxGrid(
    {
        width: '100%',
        height: 210,
        source: dataAdapter,
        enableAnimations: true,
        filterable: true,
        sortable:true,
        columnsresize: true,
       	selectionmode: 'checkbox',                 
       	showfilterrow: true,
        sortable:true,
        enabletooltips:true,                          
        pagermode: 'default',   
        editable:true,
        columns: [   
                  { text: 'SL#', sortable: false, filterable: false, editable: false,       
                      groupable: false, draggable: false, resizable: false,    
                      datafield: 'sl', columntype: 'number', width: '2%' ,
                      cellsrenderer: function (row, column, value) {
                          return "<center><div style='margin:4px;'>" + (value + 1) + "</div></center>";   
                      }  
                    },
                    { text: 'MRPDOC', datafield: 'mrpdoc',  width: '6%', editable: false,cellclassname: cellclassname,hidden:true}, 
                   { text: 'Product ID', datafield: 'pid',  width: '6%', editable: false,cellclassname: cellclassname},    
  	               { text: 'Product Description', datafield: 'pdesc', editable: false,cellclassname: cellclassname},
  	               { text: 'Material Type', datafield: 'mtype',  width: '6%', editable: false,cellclassname: cellclassname},
  	             { text: 'Material Type id', datafield: 'mtypeid',  width: '6%', editable: false,cellclassname: cellclassname,hidden:true},
  	               { text: 'UOM', datafield: 'uom',  width: '6%', editable: false,cellclassname: cellclassname}, 
  	             { text: 'UOMid', datafield: 'uomid',  width: '6%', editable: false,cellclassname: cellclassname,hidden:true}, 
  	               { text: 'BOM Cal Qty', datafield: 'qty',  width: '6%', editable: true,cellclassname: cellclassname, cellsformat: 'd3', cellsalign: 'right', align: 'right'}, 
  	               { text: 'Stock', datafield: 'stock',  width: '6%', editable: false,cellclassname: cellclassname, cellsformat: 'd3', cellsalign: 'right', align: 'right'}, 
  	               { text: 'Req. Qty', datafield: 'resqty',  width: '6%', editable: true,cellclassname: cellclassname, cellsformat: 'd3', cellsalign: 'right', align: 'right'}, 
  	               { text: 'WorkOrder. Qty', datafield: 'worder',  width: '6%', editable: true,cellclassname: cellclassname, cellsformat: 'd3', cellsalign: 'right', align: 'right'}, 
  	               { text: 'Bal. Qty', datafield: 'balqty',  width: '6%', editable: false,cellclassname: cellclassname, cellsformat: 'd3', cellsalign: 'right', align: 'right',hidden:true}, 
  	               { text: 'mainpsrno', datafield: 'mainpsrno',  width: '10%', editable: false,cellclassname: cellclassname,hidden:true}, 
  	               { text: 'chkpsrno', datafield: 'setdoc',  width: '10%', editable: false,cellclassname: cellclassname,hidden:true},
  	               { text: 'specid', datafield: 'specid',  width: '10%', editable: false,cellclassname: cellclassname,hidden:true},
  	               { text: 'checkpsrno', datafield: 'chkpsrno',  width: '10%', editable: false,cellclassname: cellclassname,hidden:true},
  	               { text: '',columntype: 'button', datafield: 'srchbtn',editable:false,  width: '5%'}, 
  	               // { text: '', datafield: 'chk',columntype:'checkbox',  width: '4%', editable: true,cellclassname: cellclassname}, 
	              /*  { text: 'Work Order',  datafield: 'worder',width:'10%',columntype:'dropdownlist',
						
						createeditor: function (row, column, editor) {  
							
                         billmodelist1 = ["Create Purchase Request","Create Blending Order"];
                       
							editor.jqxDropDownList({ autoDropDownHeight: true, source: billmodelist1 });
						
						},
				 	 initeditor: function (row, cellvalue, editor) {     
                        
						var terms = $('#jqxbomGrid').jqxGrid('getcellvalue', row, "worder");
						
							editor.jqxDropDownList({ autoDropDownHeight: true, source: billmodelist1 });
						
                      }, 
		    
		}, */
	               { text: 'Prd id', datafield: 'prdid', hidden:true, width: '6%'},
	               { text: 'bomethod', datafield: 'bomethod', hidden:true, width: '6%'},
	                
	               
			   ]   		 
    });     
    $("#overlay, #PleaseWait").hide(); 
    $("#jqxbomGrid").jqxGrid('addrow', null, {});
     var chkrows=$("#jqxbomGrid").jqxGrid('getrows');
     if(chkrows!=""){
       var setrow=chkrows.length-1;
	  //alert("lastrowindex==="+setrow);
	  $('#jqxbomGrid').jqxGrid('setcellvalue', setrow, "srchbtn","Search"); 
     }
    $("#jqxbomGrid").on('cellvaluechanged', function (event) 
            {
	        var datafield = event.args.datafield;
   		
	       var rowindex2 = event.args.rowindex;        
		//alert("datafield==="+datafield);
		 if(datafield=='resqty')
	 {
			// alert("rowindex2==="+rowindex2);
	var res= $('#jqxbomGrid').jqxGrid('getcellvalue', rowindex2, "resqty");
	var res1= $('#jqxbomGrid').jqxGrid('getcellvalue', rowindex2, "worder");
	var bal= $('#jqxbomGrid').jqxGrid('getcellvalue', rowindex2, "qty");
	if(parseFloat(res)>parseFloat(bal)){
		$.messager.alert('Message', '  Request Qty Cannot be Greater than Qty  ');
		$('#jqxbomGrid').jqxGrid('setcellvalue', rowindex2, "resqty",0);
	}
	else{
	if(parseFloat(res1)>0){
		var nwbal=parseFloat(bal)-parseFloat(res)-parseFloat(res1);
		$('#jqxbomGrid').jqxGrid('setcellvalue', rowindex2, "balqty",nwbal);
	}
	if(parseFloat(res)>0){
		var nwbal=parseFloat(bal)-parseFloat(res);
		$('#jqxbomGrid').jqxGrid('setcellvalue', rowindex2, "balqty",nwbal);
	}
	
	//alert("nwbal==="+nwbal);
	//$('#jqxthirdGrid').jqxGrid('setcellvalue', rowindex2, "balqty",0);
	
	} 
	 }
		 
		 if(datafield=='worder')
		 {
				// alert("rowindex2==="+rowindex2);
		var res= $('#jqxbomGrid').jqxGrid('getcellvalue', rowindex2, "resqty");
		var res1= $('#jqxbomGrid').jqxGrid('getcellvalue', rowindex2, "worder");
		var bal= $('#jqxbomGrid').jqxGrid('getcellvalue', rowindex2, "qty");
		if(parseFloat(res1)>parseFloat(bal)){
			$.messager.alert('Message', '  Blending Qty Cannot be Greater than Qty  ');
			$('#jqxbomGrid').jqxGrid('setcellvalue', rowindex2, "resqty",0);
		}
		else{		
			if(parseFloat(res1)>0){
				var nwbal=parseFloat(bal)-parseFloat(res)-parseFloat(res1);
				$('#jqxbomGrid').jqxGrid('setcellvalue', rowindex2, "balqty",nwbal);
			}
			if(parseFloat(res)>0){
				var nwbal=parseFloat(bal)-parseFloat(res);
				$('#jqxbomGrid').jqxGrid('setcellvalue', rowindex2, "balqty",nwbal);
			}
		} 
		 }
            }); 
    
    $("#jqxbomGrid").on('rowselect', function (event) 
            {
	        var datafield = event.args.datafield;
   		
	       var rowindex2 = event.args.rowindex;
	      
	    /*    if(typeof(res)==="undefined"){
	    	   $('#jqxbomGrid').jqxGrid('unselectrow',rowindex2);
	    	   $.messager.alert('Message', '  Request Qty not Entered ');
	       } */
            });
    
    $('#jqxbomGrid').on('cellclick', function (event) {
    	//alert("in cellclick");
    		
    	  var columnindex1=event.args.datafield;
    	  var rowindex2 = event.args.rowindex; 
    	  var pid=$('#jqxbomGrid').jqxGrid('getcellvalue', rowindex2, "pid");
    	 // alert("pid=="+pid);
    	  $('#rowindexg').val(rowindex2);
    	  
    	  if(columnindex1 == "srchbtn") {
    			var pdprows = $("#jqxpdpGrid").jqxGrid('getrows');
    	        var ppdetail= new Array();
    	        $('#jqxbomGrid').jqxGrid('selectrow', rowindex2);
    			var prdrows=$("#jqxpdpGrid").jqxGrid('selectedrowindexes');
    			//ppdselectedrows = selectedrows.sort(function(a,b){return a - b});
    	       //   alert("ppdselectedrows==="+prdrows);
    			var i=0;var temptrno="",finaltemp="0";           
    			var j=0;
    			//var tmpcount=ppdselectedrows.length;
    			for (var g=0; g < prdrows.length; g++) {

    				  var chk=prdrows[g];
    				
    				var deptid= pdprows[chk].deptid; 
    			
    				
    				if(!parseInt(finaltemp)==0) {
    					finaltemp=finaltemp+","+deptid;
    				}else {
    					finaltemp=deptid;
    				} 
    				} 
    			  productSearchContent("productSearch.jsp?id="+1+"&deptid="+finaltemp); 
    		    		  
    		 
    	  }
    });
});
</script>
<div id="jqxbomGrid"></div>