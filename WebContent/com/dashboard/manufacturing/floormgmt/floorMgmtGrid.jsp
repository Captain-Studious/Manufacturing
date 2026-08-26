<%@page import="com.dashboard.manufacturing.floormgmt.*" %>
<%ClsFloorMgmtDAO floordao=new ClsFloorMgmtDAO();
String id=request.getParameter("id")==null?"":request.getParameter("id");
String brhid=request.getParameter("brhid")==null?"":request.getParameter("brhid");
%>
<style>
	.yellowClass{
		background-color:#FDFF79;
	}
	.greenClass{
		background-color:#79FFA0;
	}
	.blueClass{
		background-color:#79B6FF;
	}
	.redClass{
		background-color:#FF8579;
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
var id='<%=id%>';
var floordata=[];
if(id=="1"){
	floordata='<%=floordao.getFloorMgmtData(id)%>';
}
var rendererstring=function (aggregates){
	var value=aggregates['sum'];
	if(value=="undefined" || typeof(value)=="undefined"){
		value="0.00";
	}
	return '<div style="float: right; margin: 4px;font-size:12px; overflow: hidden;">' + value + '</div>';
}
	$(document).ready(function(){
        
        var source =
        {
            datatype: "json",
            datafields: [
                      	{name : 'orderno' , type: 'string'},
 						{name : 'ordertype', type: 'string'},
						{name : 'pid', type: 'string'},
 						{name : 'pdesc', type:'string'},
 						{name : 'client',type:'string'},
 						{name : 'qty',type:'number'},
                      	{name : 'orderdate',type:'date'},
                      	{name : 'mrp',type:'string'},
                      	{name : 'wo',type:'string'},
                      	{name : 'blnd',type:'string'},
                      	{name : 'mr',type:'string'},
                      	{name : 'min',type:'string'},
                      	{name : 'qa',type:'string'},
                      	{name : 'pc',type:'string'},
                      	{name : 'fp',type:'string'},
                      	{name : 'del',type:'string'},
                      	{name : 'inv',type:'string'}
                      
                      	
             ],
             localdata: floordata,
            
            
            pager: function (pagenum, pagesize, oldpagenum) {
                // callback called when a page or page size is changed.
            }
        };
        
        var cellclassname = function (row, column, value, data) {
        	/*if(data.z1.includes("P")){
            	return "redClass";
            }*/
        };
         var cellclassname1 = function (row, column, value, data) {
        	var cssClassName="";
        	var zonedata=data.mrp;
        	if(zonedata!="undefined" && zonedata!="" && zonedata!=null && typeof(zonedata)!="undefined"){
            	cssClassName="yellowClass";
            }
            if(data.mrp.includes("Y")){
            	cssClassName="greenClass";
            }
            if(data.mrp.includes("N")){
            	cssClassName="redClass";
            }
         /*    if(data.z1.includes("N")){
            	cssClassName="redClass";
            } */
            return cssClassName;
        };
        var cellclassname2 = function (row, column, value, data) {
        	var cssClassName="";
        	var zonedata=data.wo;
        	if(zonedata!="undefined" && zonedata!="" && zonedata!=null && typeof(zonedata)!="undefined"){
            	cssClassName="yellowClass";
            }
            if(data.wo.includes("Y")){
            	cssClassName="greenClass";
            }
            if(data.wo.includes("N")){
            	cssClassName="redClass";
            }
          
            return cssClassName;
        };
        var cellclassname3 = function (row, column, value, data) {
        	var cssClassName="";
        	var zonedata=data.blnd;
        	if(zonedata!="undefined" && zonedata!="" && zonedata!=null && typeof(zonedata)!="undefined"){
            	cssClassName="yellowClass";
            }
            if(data.blnd.includes("Y")){
            	cssClassName="greenClass";
            }
            if(data.blnd.includes("N")){
            	cssClassName="redClass";
            }
            
            return cssClassName;
        };
        var cellclassname4 = function (row, column, value, data) {
        	var cssClassName="";
        	var zonedata=data.mr;
        	if(zonedata!="undefined" && zonedata!="" && zonedata!=null && typeof(zonedata)!="undefined"){
            	cssClassName="yellowClass";
            }
            if(data.mr.includes("Y")){
            	cssClassName="greenClass";
            }
            if(data.mr.includes("N")){
            	cssClassName="redClass";
            }
            
            return cssClassName;
        };
        var cellclassname5 = function (row, column, value, data) {
        	var cssClassName="";
        	var zonedata=data.min;
        	if(zonedata!="undefined" && zonedata!="" && zonedata!=null && typeof(zonedata)!="undefined"){
            	cssClassName="yellowClass";
            }
            if(data.min.includes("Y")){
            	cssClassName="greenClass";
            }
            if(data.min.includes("N")){
            	cssClassName="redClass";
            }
           
            return cssClassName;
        };
        var cellclassname6 = function (row, column, value, data) {
        	var cssClassName="";
        	var zonedata=data.qa;
        	if(zonedata!="undefined" && zonedata!="" && zonedata!=null && typeof(zonedata)!="undefined"){
            	cssClassName="yellowClass";
            }
            if(data.qa.includes("Y")){
            	cssClassName="greenClass";
            }
            if(data.qa.includes("N")){
            	cssClassName="redClass";
            }
            
            return cssClassName;
        };
        var cellclassname7 = function (row, column, value, data) {
        	var cssClassName="";
        	var zonedata=data.pc;
        	if(zonedata!="undefined" && zonedata!="" && zonedata!=null && typeof(zonedata)!="undefined"){
            	cssClassName="yellowClass";
            }
            if(data.pc.includes("Y")){
            	cssClassName="greenClass";
            }
            if(data.pc.includes("N")){
            	cssClassName="redClass";
            }
           
            return cssClassName;
        };
        var cellclassname8 = function (row, column, value, data) {
        	var cssClassName="";
        	var zonedata=data.fp;
        	if(zonedata!="undefined" && zonedata!="" && zonedata!=null && typeof(zonedata)!="undefined"){
            	cssClassName="yellowClass";
            }
            if(data.fp.includes("Y")){
            	cssClassName="greenClass";
            }
            if(data.fp.includes("N")){
            	cssClassName="redClass";
            }
           
            return cssClassName;
        };
        var cellclassname9 = function (row, column, value, data) {
        	var cssClassName="";
        	var zonedata=data.del;
        	if(zonedata!="undefined" && zonedata!="" && zonedata!=null && typeof(zonedata)!="undefined"){
            	cssClassName="yellowClass";
            }
            if(data.del.includes("Y")){
            	cssClassName="greenClass";
            }
            if(data.del.includes("N")){
            	cssClassName="redClass";
            }
           
            return cssClassName;
        };
        var cellclassname10 = function (row, column, value, data) {
        	var cssClassName="";
        	var zonedata=data.inv;
        	if(zonedata!="undefined" && zonedata!="" && zonedata!=null && typeof(zonedata)!="undefined"){
            	cssClassName="yellowClass";
            }
            if(data.inv.includes("Y")){
            	cssClassName="greenClass";
            }
            if(data.inv.includes("N")){
            	cssClassName="redClass";
            }
           
            return cssClassName;
        };
       
        var dataAdapter = new $.jqx.dataAdapter(source,
        		 {
            		loadError: function (xhr, status, error) {
                    alert(error);    
                    }
	            }		
        );



        $("#floorMgmtGrid").jqxGrid(
                {
                	width: '100%',
                    height: 500,
                    source: dataAdapter,
                    showfilterrow: true,
                    filterable: true,
                    selectionmode: 'singlerow',
                  	editable:false,
                    altrows:true,
                    sortable:true,
                    columnsresize: true,
                    showaggregates:true,
                	showstatusbar:true,
                    //Add row method
                    columns: [
						{ text: 'Sr. No.',datafield: '',columntype:'number', width: '3%',pinned:true,cellclassname: cellclassname,cellsrenderer: function (row, column, value) {
						    return "<center><div style='margin:4px;'>" + (value + 1) + "</div></center>";
						}   },      
    					{ text: 'Order No',datafield: 'orderno', width: '5%',cellclassname: cellclassname},
    					{ text: 'Type',datafield: 'ordertype', width: '5%',cellclassname: cellclassname},
    					{ text: 'Date',datafield: 'orderdate', width: '5%',cellclassname: cellclassname,cellsformat:'dd.MM.yyyy'},
    					{ text: 'Client',datafield: 'client', width: '10%' ,cellclassname: cellclassname},
    					{ text: 'Product ID',datafield: 'pid', width: '8%',cellclassname: cellclassname},
    					{ text: 'Product Name',datafield: 'pdesc' ,cellclassname: cellclassname},
    					{ text: 'Qty',datafield: 'qty', width: '5%' ,cellclassname: cellclassname,cellsformat:'d3',cellsalign:'right',align:'right'},
    					{ text: 'MRP', datafield: 'mrp', width: '4%',cellclassname: cellclassname1,
    						/* renderer: function (defaultText, alignment, height) {
    							//alert(defaultText+"::"+alignment+"::"+height);
    							var count=$('#z1count').val();
    							if(count==''){
    								count='0';
    							}
        						return '<div style="padding-bottom: 2px; overflow: hidden; text-overflow: ellipsis; text-align: left; margin-left: 4px; margin-right: 2px; margin-bottom: 4px; margin-top: 4px;text-transform:capitalize;">'+defaultText+' ('+count+')</div>';
    						},
    						rendered: function (element) {
                          		$(element).jqxTooltip({ position: 'mouse', content: "Waiting" });
                      		} */
    					},
    					{ text: 'WO', datafield: 'wo', width: '4%',cellclassname: cellclassname2,
    						/* renderer: function (defaultText, alignment, height) {
    							//alert(defaultText+"::"+alignment+"::"+height);
    							var count=$('#z2count').val();
    							if(count==''){
    								count='0';
    							}
        						return '<div style="padding-bottom: 2px; overflow: hidden; text-overflow: ellipsis; text-align: left; margin-left: 4px; margin-right: 2px; margin-bottom: 4px; margin-top: 4px;text-transform:capitalize;">'+defaultText+' ('+count+')</div>';
    						},
    						rendered: function (element) {
                          		$(element).jqxTooltip({ position: 'mouse', content: "Waiting 2" });
                      		} */
    					},
    					{ text: 'BLND', datafield: 'blnd', width: '4%',cellclassname: cellclassname3,
    						/* renderer: function (defaultText, alignment, height) {
    							//alert(defaultText+"::"+alignment+"::"+height);
    							var count=$('#z3count').val();
    							if(count==''){
    								count='0';
    							}
        						return '<div style="padding-bottom: 2px; overflow: hidden; text-overflow: ellipsis; text-align: left; margin-left: 4px; margin-right: 2px; margin-bottom: 4px; margin-top: 4px;text-transform:capitalize;">'+defaultText+' ('+count+')</div>';
    						},
    						rendered: function (element) {
                          		$(element).jqxTooltip({ position: 'mouse', content: "Denting" });
                      		} */
    					},
    					{ text: 'MR', datafield: 'mr', width: '4%',cellclassname: cellclassname4,
    						/* renderer: function (defaultText, alignment, height) {
    							//alert(defaultText+"::"+alignment+"::"+height);
    							var count=$('#z4count').val();
    							if(count==''){
    								count='0';
    							}
        						return '<div style="padding-bottom: 2px; overflow: hidden; text-overflow: ellipsis; text-align: left; margin-left: 4px; margin-right: 2px; margin-bottom: 4px; margin-top: 4px;text-transform:capitalize;">'+defaultText+' ('+count+')</div>';
    						},
    						rendered: function (element) {
                          		$(element).jqxTooltip({ position: 'mouse', content: "Preparation" });
                      		} */
    					},
    					{ text: 'MIN', datafield: 'min', width: '4%',cellclassname: cellclassname5,
    						/* renderer: function (defaultText, alignment, height) {
    							//alert(defaultText+"::"+alignment+"::"+height);
    							var count=$('#z5count').val();
    							if(count==''){
    								count='0';
    							}
        						return '<div style="padding-bottom: 2px; overflow: hidden; text-overflow: ellipsis; text-align: left; margin-left: 4px; margin-right: 2px; margin-bottom: 4px; margin-top: 4px;text-transform:capitalize;">'+defaultText+' ('+count+')</div>';
    						},
    						rendered: function (element) {
                          		$(element).jqxTooltip({ position: 'mouse', content: "Painting" });
                      		} */
    					},
    					{ text: 'QA', datafield: 'qa', width: '4%',cellclassname: cellclassname6,
    					/* 	renderer: function (defaultText, alignment, height) {
    							//alert(defaultText+"::"+alignment+"::"+height);
    							var count=$('#z6count').val();
    							if(count==''){
    								count='0';
    							}
        						return '<div style="padding-bottom: 2px; overflow: hidden; text-overflow: ellipsis; text-align: left; margin-left: 4px; margin-right: 2px; margin-bottom: 4px; margin-top: 4px;text-transform:capitalize;">'+defaultText+' ('+count+')</div>';
    						},
    						rendered: function (element) {
                          		$(element).jqxTooltip({ position: 'mouse', content: "Polish" });
                      		} */
    					},
    					{ text: 'PC', datafield: 'pc', width: '4%',cellclassname: cellclassname7,
    						/* renderer: function (defaultText, alignment, height) {
    							//alert(defaultText+"::"+alignment+"::"+height);
    							var count=$('#z7count').val();
    							if(count==''){
    								count='0';
    							}
        						return '<div style="padding-bottom: 2px; overflow: hidden; text-overflow: ellipsis; text-align: left; margin-left: 4px; margin-right: 2px; margin-bottom: 4px; margin-top: 4px;text-transform:capitalize;">'+defaultText+' ('+count+')</div>';
    						},
    						rendered: function (element) {
                          		$(element).jqxTooltip({ position: 'mouse', content: "Fit Out" });
                      		} */
    					},
    					{ text: 'FP', datafield: 'fp', width: '4%',cellclassname: cellclassname8,
    					/* 	renderer: function (defaultText, alignment, height) {
    							//alert(defaultText+"::"+alignment+"::"+height);
    							var count=$('#z8count').val();
    							if(count==''){
    								count='0';
    							}
        						return '<div style="padding-bottom: 2px; overflow: hidden; text-overflow: ellipsis; text-align: left; margin-left: 4px; margin-right: 2px; margin-bottom: 4px; margin-top: 4px;text-transform:capitalize;">'+defaultText+' ('+count+')</div>';
    						},
    						rendered: function (element) {
                          		$(element).jqxTooltip({ position: 'mouse', content: "Mec Waiting" });
                      		} */
    					},
    					{ text: 'DEL', datafield: 'del', width: '4%',cellclassname: cellclassname9,
    						/* renderer: function (defaultText, alignment, height) {
    							//alert(defaultText+"::"+alignment+"::"+height);
    							var count=$('#z9count').val();
    							if(count==''){
    								count='0';
    							}
        						return '<div style="padding-bottom: 2px; overflow: hidden; text-overflow: ellipsis; text-align: left; margin-left: 4px; margin-right: 2px; margin-bottom: 4px; margin-top: 4px;text-transform:capitalize;">'+defaultText+' ('+count+')</div>';
    						},
    						rendered: function (element) {
                          		$(element).jqxTooltip({ position: 'mouse', content: "Mechanical" });
                      		} */
    					},
    					{ text: 'INV', datafield: 'inv', width: '4%',cellclassname: cellclassname10,
    					/* 	renderer: function (defaultText, alignment, height) {
    							//alert(defaultText+"::"+alignment+"::"+height);
    							var count=$('#z10count').val();
    							if(count==''){
    								count='0';
    							}
        						return '<div style="padding-bottom: 2px; overflow: hidden; text-overflow: ellipsis; text-align: left; margin-left: 4px; margin-right: 2px; margin-bottom: 4px; margin-top: 4px;text-transform:capitalize;">'+defaultText+' ('+count+')</div>';
    						},
    						rendered: function (element) {
                          		$(element).jqxTooltip({ position: 'mouse', content: "Washing" });
                      		} */
    					},
    				
						
						
    	              ]
                });
        $('.load-wrapp').hide();
				$('#floorMgmtGrid').on('rowdoubleclick', function (event) 
				{ 
				    var args = event.args;
				    // row's bound index.
				    var boundIndex = args.rowindex;
				    // row's visible index.
				    var visibleIndex = args.visibleindex;
				    // right click.
				    var rightclick = args.rightclick; 
				    // original event.
				    var ev = args.originalEvent;
				    
				  /*   $('#jobcarddocno').val($('#floorMgmtGrid').jqxGrid('getcellvalue',boundIndex,'jobdocno'));
				    $('#jobcardvocno').val($('#floorMgmtGrid').jqxGrid('getcellvalue',boundIndex,'jobvocno'));
					var rowsno=$('#floorMgmtGrid').jqxGrid('getcellvalue', boundIndex, 'rowno');
				    getComments();
				    getBays($('#jobcarddocno').val());
				    $('#baymovgriddiv').load('bayMovGrid.jsp?id=1&jobcarddocno='+$('#jobcarddocno').val());
				     $('#partsdetailsgriddiv').load("partsDetailsGrid.jsp?id="+1+"&rowno="+rowsno+"&jobcarddocno="+$('#jobcarddocno').val());
				   	$('#jobworkersgriddiv').load('jobWorkersGrid.jsp?id=1&jobcarddocno='+$('#jobcarddocno').val());
					$('#selectedteamsgriddiv').load('selectedTeamsGrid.jsp?id=1&jobcarddocno='+$('#jobcarddocno').val());
				   	$('.textpanel p').text('Job Card '+$('#jobcardvocno').val()+' with Reg No '+$('#floorMgmtGrid').jqxGrid('getcellvalue',boundIndex,'regno')); */
				
				});
	});
</script>
<div id="floorMgmtGrid"></div>