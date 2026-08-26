<%@page import="javax.servlet.http.HttpServletRequest" %>
<%@page import="javax.servlet.http.HttpSession" %>
<%@page import="com.manufacturing.productdetails.*"%>

 <%
 ClsMProductDetailsDAO DAO= new ClsMProductDetailsDAO(); 

String searchdocno = request.getParameter("searchdocno")==null?"":request.getParameter("searchdocno");
String searchdate = request.getParameter("searchdate")==null?"":request.getParameter("searchdate");
String searchproductcode = request.getParameter("searchproductcode")==null?"":request.getParameter("searchproductcode");
String searchproductname = request.getParameter("searchproductname")==null?"":request.getParameter("searchproductname");
String id = request.getParameter("id")==null?"0":request.getParameter("id");
%> 
 <script type="text/javascript">
 var id='<%=id%>';
 

 var mastersearchdata='<%=DAO.getMasterSearch(searchdocno,searchdate,searchproductcode,searchproductname,id)%>';
 	
 	//alert("mastersearchdata=="+mastersearchdata);
 
 //alert($('#mode').val());
        $(document).ready(function () { 
         
            var source = 
            {
                datatype: "json",
                datafields: [
                             
			 
     						{name : 'doc_no', type: 'string'  },
     						{name : 'voc_no', type: 'string'  },
     						{name : 'date', type: 'date'  }, 
      						{name : 'productcode', type: 'string'  },
      						{name : 'productname', type: 'string'  },
      						{name : 'method', type: 'string'  },
      						{name : 'technote', type: 'string'  },
      						{name : 'safetymeasure', type: 'string'  },
      						{name : 'uomid', type: 'string'  },
      						{name : 'uom', type: 'string'  },
      						{name : 'volume', type: 'string'  },
      						{name : 'qualityper', type: 'string'  },
      						{name : 'durhrs', type: 'string'  },
      						{name : 'activeprocess', type: 'string'  },
      						{name : 'labour', type: 'number'  },
      						{name : 'overhead', type: 'number'  },
      						{name : 'others', type: 'number'  },
      						{name : 'psrno', type: 'number'  },
      						{name : 'sectype', type: 'string'  },
      						
                          	],
                          	localdata: mastersearchdata,
                          
          
				
                
                pager: function (pagenum, pagesize, oldpagenum) {
                   
                }
            };
            
            var dataAdapter = new $.jqx.dataAdapter(source);
            $("#masterSearchGrid").jqxGrid(
            {
                width: '100%',
                height: 345,
                source: dataAdapter,
                columnsresize: true,
                selectionmode: 'singlerow',
             
               
                //Add row method
	
     						
     					
     					
                columns: [
					{ text: 'Doc No', datafield: 'doc_no', width: '8%',hidden:true },
					{ text: 'Doc No', datafield: 'voc_no', width: '10%' },
					{ text: 'Date', datafield: 'date', width: '10%',cellsformat:'dd.MM.yyyy' },
					{ text: 'Product Code', datafield: 'productcode', width: '30%' },
					{ text: 'Product Name', datafield: 'productname', width: '50%' },
					{ text: 'Method', datafield: 'method', width: '35%',hidden:true },
					{ text: 'Safety Measure', datafield: 'safetymeasure', width: '35%',hidden:true },
					{ text: 'Tech Note', datafield: 'technote', width: '35%',hidden:true },
					{ text: 'uom', datafield: 'uom', width: '35%',hidden:true },
					{ text: 'uomid', datafield: 'uomid', width: '35%',hidden:true },
					{ text: 'volume', datafield: 'volume', width: '35%',hidden:true },
					{ text: 'qualityper', datafield: 'qualityper', width: '35%',hidden:true },
					{ text: 'durhrs', datafield: 'durhrs', width: '35%',hidden:true },
					{ text: 'activeprocess', datafield: 'activeprocess', width: '35%',hidden:true },
					{ text: 'labour', datafield: 'labour', width: '35%',hidden:true,cellsformat:'d2' },
					{ text: 'overhead', datafield: 'overhead', width: '35%',hidden:true,cellsformat:'d2' },
					{ text: 'others', datafield: 'others', width: '35%',hidden:true,cellsformat:'d2' },
					{ text: 'psrno', datafield: 'psrno', width: '35%',hidden:true}
					
					]
            });
    
     
				            
          $('#masterSearchGrid').on('rowdoubleclick', function (event) 
          { 
        	var rowindex=event.args.rowindex;
        	document.getElementById("docno").value=$('#masterSearchGrid').jqxGrid('getcellvalue',rowindex,'doc_no');
        	document.getElementById("psrno").value=$('#masterSearchGrid').jqxGrid('getcellvalue',rowindex,'psrno');
        	document.getElementById("vocno").value=$('#masterSearchGrid').jqxGrid('getcellvalue',rowindex,'voc_no');
        	//document.getElementById("date").value=$('#masterSearchGrid').jqxGrid('getcellvalue',rowindex,'date');
        	//document.getElementById("productcode").value=$('#masterSearchGrid').jqxGrid('getcellvalue',rowindex,'productcode');
        	//document.getElementById("productname").value=$('#masterSearchGrid').jqxGrid('getcellvalue',rowindex,'productname');
        	//document.getElementById("method").value=$('#masterSearchGrid').jqxGrid('getcellvalue',rowindex,'method');
        	//document.getElementById("safetymeasure").value=$('#masterSearchGrid').jqxGrid('getcellvalue',rowindex,'safetymeasure');
        	//document.getElementById("technote").value=$('#masterSearchGrid').jqxGrid('getcellvalue',rowindex,'technote');
        	//document.getElementById("uom").value=$('#masterSearchGrid').jqxGrid('getcellvalue',rowindex,'uom');
        	//document.getElementById("uomid").value=$('#masterSearchGrid').jqxGrid('getcellvalue',rowindex,'uomid');
        	//document.getElementById("volume").value=$('#masterSearchGrid').jqxGrid('getcellvalue',rowindex,'volume');
        	//document.getElementById("qualitypercent").value=$('#masterSearchGrid').jqxGrid('getcellvalue',rowindex,'qualityper');
        	//document.getElementById("duration").value=$('#masterSearchGrid').jqxGrid('getcellvalue',rowindex,'durhrs');
        	//document.getElementById("hidchkactiveprocess").value=$('#masterSearchGrid').jqxGrid('getcellvalue',rowindex,'activeprocess');
        	
        	//document.getElementById("labour").value=$('#masterSearchGrid').jqxGrid('getcellvalue',rowindex,'labour');
        	//document.getElementById("overhead").value=$('#masterSearchGrid').jqxGrid('getcellvalue',rowindex,'overhead');
        	//document.getElementById("others").value=$('#masterSearchGrid').jqxGrid('getcellvalue',rowindex,'others');
        	//document.getElementById("hidsectype").value=$('#masterSearchGrid').jqxGrid('getcellvalue',rowindex,'sectype');
        	//document.getElementById("sectype").value=$('#masterSearchGrid').jqxGrid('getcellvalue',rowindex,'sectype');
        	//var docno=document.getElementById("docno").value;
        	//$('#jqxRawMaterials').attr('disabled', true);
        	//$('#jqxRawMaterials').load('rawmaterials.jsp?docno='+docno+'&id=1');
			//$('#jqxPackMaterials').load('packingmaterials.jsp?docno='+docno+'&id=1');
			//$('#jqxProcess').load('process.jsp?docno='+docno+'&id=1');
			//$('#jqxQualityAssurance').load('qualityassurance.jsp?docno='+docno+'&id=1');
			//$('#jqxInProcess').load('inprocess.jsp?docno='+docno+'&id=1');
			
        	$('#window').jqxWindow('close');
        	funSetlabel();
            document.getElementById("frmProductDetails").submit();
          });	 
				           
        
                  }); 
				       
                       
    </script>
    <div id="masterSearchGrid"></div>
    
