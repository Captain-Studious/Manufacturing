
<%@page import="javax.servlet.http.HttpServletRequest" %>
<%@page import="javax.servlet.http.HttpSession" %>
<%@page import="com.dashboard.joborder.ClsjobOrderDAO"%>
<%ClsjobOrderDAO DAO= new ClsjobOrderDAO();%>
 <%
String barchval = request.getParameter("barchval")==null?"NA":request.getParameter("barchval");
String cldocno = request.getParameter("cldocno")==null?"0":request.getParameter("cldocno");
String type = request.getParameter("type")==null?"0":request.getParameter("type");
 
%> 

 <script type="text/javascript">
 
 var masdata; 
 var temp='<%=barchval%>';
 var type='<%=type%>';

 if(temp!='NA')
	 {
  masdata='<%=DAO.searchMaster(barchval,cldocno,type)%>';
	 }
 
 else
	 {
	 masdata;
	 }
  $(document).ready(function () { 	 
     
      var num = 0; 
     var source =
     {
     		
         datatype: "json",
         datafields: [
					
                   	{name : 'doc_no' , type: 'number' },
                   	{name : 'brandname' , type: 'string' },
                	{name : 'modelname' , type: 'String' },
                	{name : 'submodel' , type: 'String' },
                	
                	{name : 'yom' , type: 'String' },
                    {name : 'refname' , type: 'String' },
                   	{name : 'name' , type: 'String' },
                   	{name : 'address' , type: 'String' },
                 	{name : 'cldocno' , type: 'String' },
                 	{name : 'regno' , type: 'number' },
                	{name : 'brdid' , type: 'number' },
                	{name : 'modelid' , type: 'number' },
                 	{name : 'yomid' , type: 'number' },
                	{name : 'brhid' , type: 'number' },
                	
                	{name : 'voc_no' , type: 'number' },
                 	
                	
                   	],
          localdata: masdata,
         
         
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
         width: '99.5%',
         height: 200,
         source: dataAdapter,
         columnsresize: true,
       editable:false,
        selectionmode: 'singlerow',
         pagermode: 'default',
      

         columns: [
              
                 
				{ text: 'Doc No', datafield: 'voc_no', width: '8%'},
				
				{ text: 'Doc No', datafield: 'doc_no', width: '10%',hidden:true },
				
				{ text: 'Name', datafield: 'refname', width: '25%' },
				{ text: 'Reg No', datafield: 'regno', width: '8%' },
				{ text: 'Brand ', datafield: 'brandname', width: '18%'},
				{ text: 'Model', datafield: 'modelname', width: '18%'},
				
				{ text: 'Sub Model', datafield: 'submodel', width: '18%'},
				
				
				
				{ text: 'Yom', datafield: 'yom', width: '5%' },
				
				{ text: 'brhid', datafield: 'brhid', width: '10%',hidden:true },
				
				
				
				]
     });
     $("#overlay, #PleaseWait").hide(); 
     $('#mainlistgrid').on('rowdoubleclick', function (event) {
         
     	 var rowindex1 = event.args.rowindex;
     	 
     	 $("#updatdata").attr('disabled', false );
    	 var barchval = $('#mainlistgrid').jqxGrid('getcellvalue', rowindex1, "brhid");
       
    	 
    	 var docno=$('#mainlistgrid').jqxGrid('getcellvalue', rowindex1, "doc_no");
    	  
    	   $("#overlay, #PleaseWait").show(); 
    	   
    	   if(type=="issue")
    		   {
     	  $("#sublistdiv").load("sublistGrid.jsp?barchvals="+barchval+"&docno="+docno);
     	  
     		  
     	  }
    	   else if(type=="col")
		   {
    		   $("#sublistdiv2").load("collectedgrid.jsp?barchvals="+barchval+"&docno="+docno);
		   }
     	 
     	 
         
        
     	 });
     
     

 });
</script>
<div id="mainlistgrid"></div>

    
    </body>
</html>
