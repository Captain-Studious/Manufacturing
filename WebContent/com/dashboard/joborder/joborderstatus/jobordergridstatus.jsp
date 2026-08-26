
<%@page import="javax.servlet.http.HttpServletRequest" %>
<%@page import="javax.servlet.http.HttpSession" %>

<%@page import="com.dashboard.joborder.ClsjobOrderStatusDAO"%>
 
<% ClsjobOrderStatusDAO jobDAO = new ClsjobOrderStatusDAO();
 
String barchval = request.getParameter("barchval")==null?"NA":request.getParameter("barchval");
String cldocno = request.getParameter("cldocno")==null?"0":request.getParameter("cldocno");
String type = request.getParameter("type")==null?"0":request.getParameter("type");
 
%> 
<style type="text/css">
		 .redClass
   		 {
        		background-color:  #f0e68c;;
    	 }
    
   		 .yellowClass
   		 {
      		    background-color: #d0ddf2;
    	 }
    
    	.greyClass
   	    {
         	   background-color: #ffd9b3;
        }   
        .greenClass
   	    {
         	   background-color: #ebd5c7;
        }    
          .invClass
   	    {
         	   background-color: #fcf2b3;
        }    
          
        
          
</style>
 
 
<script type="text/javascript">
 
 		 var masdata1; 
		 var temp='<%=barchval%>';
 		 var type='<%=type%>';

 		if(temp!='NA')
		 {
 				 masdata1='<%=jobDAO.searchaStatusMaster(barchval,cldocno,type)%>';
		 }
 
		else
		 {
				 masdata1;
	 	  }
  			
 		 $(document).ready(function ()
  		 { 	 
     
   	   			  var num = 0; 
    			  var source =
     			  {
     		
        				datatype: "json",
      		  		    datafields: [
					
                 				 	{name : 'doc_no' , type: 'number' },
              						{name : 'brandname' , type: 'string' },
                					{name : 'modelname' , type: 'String' },
                					{name : 'submodel', type: 'string'  },
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
               						{name : 'brandname', type: 'string'  },
									{name : 'productid', type: 'string' }, 
									{name : 'productname', type: 'string'},
									{name : 'unit', type: 'string'  },
									{name : 'qty', type: 'number'   },
									{name : 'rdocno', type: 'number'   },
									{name : 'fixing', type: 'number'   },
									{name : 'stats', type: 'string'  },
									
									
									
									{name : 'fix', type: 'string'  },
									
                	
                  					],
          						localdata: masdata1,
         
         
        				 pager: function (pagenum, pagesize, oldpagenum)
        				 {
            					 // callback called when a page or page size is changed.
        				 }
    		 };
     
    					
    					
    		  var cellclassname = function (row, column, value, data)
    		  {    	
    						      						  
    					 if (data.fixing==1)
    					 {  					  			
    					         return "redClass";
    					 }  
    					 else if(data.fixing==2)
    					  {
    					  		 return "yellowClass";	
    					  }
    					  else if(data.fixing==3)
    					   {
    					  		  return "greenClass";	
    					   }
    					  else if(data.fixing==0)
    					  {
    					  		 return "greyClass";	
    					  }
    					  else if(data.fixing==4)
    					  {
    					  		 return "invClass";	
    					  }
    					        

    		  };
    		  var dataAdapter = new $.jqx.dataAdapter(source,
     		  {
         					loadError: function (xhr, status, error)
         					{
                 						alert(error);    
                 			}
	           }		
    		   );
   			   $("#jobgrid").jqxGrid(
    		   {
        					width: '100%',
         					height:520,
        					source: dataAdapter,
    						columnsresize: true,
       
        					selectionmode: 'singlerow',
        					pagermode: 'default',  

         					columns: [
              
                 
													{ text: 'Doc No', datafield: 'voc_no', width: '5%',cellclassname: cellclassname  },				
													{ text: 'Doc No', datafield: 'doc_no', width: '10%',hidden:true,cellclassname: cellclassname  },				
													{ text: 'Name', datafield: 'refname', width: '15%' ,cellclassname: cellclassname },
													{ text: 'Reg No', datafield: 'regno', width: '10%' ,cellclassname: cellclassname },
													{ text: 'Brand ', datafield: 'brandname', width: '15%',cellclassname: cellclassname },
													{ text: 'Model', datafield: 'modelname', width: '15%',cellclassname: cellclassname },
													
													{ text: 'Sub Model', datafield: 'submodel', width: '15%',cellclassname: cellclassname },
													
													
													{ text: 'Yom', datafield: 'yom', width: '5%' ,cellclassname: cellclassname },				
													{ text: 'brhid', datafield: 'brhid', width: '10%',hidden:true,cellclassname: cellclassname  },
				
				
													{ text: 'rdocno', datafield: 'rdocno' ,cellclassname: cellclassname,hidden:true},							
													{ text: 'Product', datafield: 'productid' ,cellclassname: cellclassname, width: '10%'},          							 
												  	{ text: 'Product Name', datafield: 'productname'  ,cellclassname: cellclassname, width: '25%' },							
																		
													{ text: 'Unit', datafield: 'unit', width: '6%',editable:false,cellclassname: cellclassname },	
													{ text: 'Quantity', datafield: 'qty',cellsformat:'d2' ,width: '6%',cellclassname: cellclassname },
													
													{ text: 'Fixing', datafield: 'fix', editable: false,  width: '10%',cellclassname: cellclassname  },
													{ text: 'Fixing', datafield: 'fixing', editable: true,  width: '10%',cellsalign: 'center', align: 'center',cellclassname: cellclassname,hidden:true  },
													{ text: 'Status', datafield: 'stats', width: '10%',editable:false,cellclassname: cellclassname },
				
										]
    		  
    					 }); $("#overlay, #PleaseWait").hide();
   					
 			});
	</script>
	<div id="jobgrid"></div>

    
   </body>
</html>
