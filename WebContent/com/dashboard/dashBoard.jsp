<!DOCTYPE html>
<% String contextPath=request.getContextPath();%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>GatewayERP(i)</title>
<jsp:include page="../../includes.jsp"></jsp:include>

<style>
.redClass
{
   color: #FF0000;            
}
</style>

<script type="text/javascript">
/*function addTab(title, url){
	if ($('../../menu.jsp #tt').tabs('exists', title)){
		alert("exist");
		$('../../menu.jsp #tt').tabs('select', title);
	} else {
		alert("addtab"); 
	 var content = '<iframe scrolling="auto" frameborder="0"  src="'+url+'" style="width:100%;height:100%;"></iframe>';
		$('../../menu.jsp #tt').tabs('add',{
			title:title,
			content:content,
			closable:true
			/* showCloseButtons: true 
		 });
		alert("ens");
	} 
}
*/
        $(document).ready(function () {
        	$('#db').hide();$("#btnPrevious").hide();$("#btnRemove").hide();
            /* Partial Pie Chart Starts*/
            
            var data =
                [
                    { category: 'Exterior', per: 45.6 },
                    { category: 'General', per: 24.6 },
                    { category: 'Interior', per: 20.4 },
                    { category: 'Performance', per: 6.1 },
                    { category: 'Suspension', per: 3.3 },
                ];
            
            var dataStatCounter = data;
        
            var charts = [
                { title: '', label: 'Stat', dataSource: dataStatCounter }
            ];
            for (var i = 0; i < charts.length; i++) {
                var chartSettings = {
                    source: charts[i].dataSource,
                    title: 'Inventory',
                    description: charts[i].title,
                    enableAnimations: true,
                    showLegend: true,
                    showBorderLine: true,
                    padding: { left: 5, top: 5, right: 5, bottom: 5 },
                    titlePadding: { left: 0, top: 0, right: 0, bottom: 10 },
                    colorScheme: 'scheme02',
                    seriesGroups: [
                        {
                            type: 'pie',
                            showLegend: true,
                            enableSeriesToggle: true,
                            series:
                                [
                                    {
                                        dataField: 'per',
                                        displayText: 'category',
                                        showLabels: true,
                                        labelRadius: 140,
                                        labelLinesEnabled: true,
                                        labelLinesAngles: true,
                                        labelsAutoRotate: false,
                                        initialAngle: 0,
                                        radius: 110,
                                        minAngle: 0,
                                        maxAngle: 180,
                                        centerOffset: 0,
                                        offsetY: 110,
                                        formatFunction: function (value, itemIdx, serieIndex, groupIndex) {
                                            if (isNaN(value))
                                                return value;
                                            return value + '%';
                                        }
                                    }
                                ]
                        }
                    ]
                };
                // select container and apply settings
                var selector = '#inventory' + (i + 1);
                $(selector).jqxChart(chartSettings);
            } // for
            
           /* Partial Pie Ends */
           
              /* Sales starts */
            /* ------------------------- */

            var data3= [{"amount":"100","month":"Jan"},
                        {"amount":"500","month":"Feb"},
                        {"amount":"200","month":"Mar"},
                        {"amount":"98","month":"Apr"},
                        {"amount":"100","month":"May"},
                        {"amount":"150","month":"Jun"},
                        {"amount":"200","month":"Jul"},
                        {"amount":"310","month":"Aug"},
                        {"amount":"505","month":"Sep"},
                        {"amount":"108","month":"Oct"},
                        {"amount":"94","month":"Nov"},
                        {"amount":"100","month":"Dec"}];

            $(document).ready(function () {
	            // prepare chart data as an array            
	            var source =
	            {
	                datatype: "json",
	                datafields: [
	                    { name: 'amount' },
	                    { name: 'month' }
	                ],
	                localdata: data3
	            };
	            
	            var dataAdapter = new $.jqx.dataAdapter(source,
	            		 {
	                		loadError: function (xhr, status, error) {
		                    alert(error);    
		                    }
				            
			            } );
	            
	            // prepare jqxChart settings
	            var settings = {
	                title: "Sales",
	                description: "",
	                showLegend: true,
	                enableAnimations: true,
	                padding: { left: 5, top: 5, right: 5, bottom: 5 },
	                titlePadding: { left: 30, top: 0, right: 0, bottom: 5 },
	                source: dataAdapter,
	                xAxis:
	                    {
	                        dataField: 'month',
	                        //textRotationAngle: -75,
	                        gridLines: { visible: false },
	                        showGridLines: false,
	                        valuesOnTicks: false,
	                    },
	                colorScheme: 'scheme01',
	                columnSeriesOverlap: false,
	                seriesGroups:
	                    [
	                        {
	                            type: 'column',
	                            columnsGapPercent: 15,
	                            seriesGapPercent: 10,
	                            columnsMaxWidth: 20,
	                            columnsMinWidth: 1,
	                            skipOverlappingPoints: false,
	                            valueAxis:
	                            {
	                                visible: true,
	                                minValue: 0,
	                                description: 'Amount',
	                                title: { text: 'Month' },
	                            },
	                            series: [
	                                    { dataField: 'amount', displayText: 'Month' }
	                                ]
	                        }
	                    ]
	            };
	            // setup the chart
	            $('#sales').jqxChart(settings);
	        });
            /* ------------------------- */
            /* Sales Ends */
                  
            /* Bar Chart Starts */
            /* ----------------------------------- */
            var days = [
	                { "day":"Mon" },
	                { "day":"Tue" },
	                { "day":"Wed" },
	                { "day":"Thu" },
	                { "day":"Fri" },
	                { "day":"Sat" },
	                { "day":"Sun" }
	            ];

	            var purchase = [
	                 { "purchase":"30" },
	                 { "purchase":"25" },
	                 { "purchase":"30" },
	                 { "purchase":"35" },
	                 { "purchase": "20" },
	                 { "purchase": "30" },
	                 { "purchase": "60" }
	            ];

	            var sales = [
	                 { "sales":"15" },
	                 { "sales":"25" },
	                 { "sales":"20" },
	                 { "sales":"25" },
	                 { "sales":"20" },
	                 { "sales":"20" },
	                 { "sales":"45" }
	            ];
      
      settings = {
          title: "ABC Analysis",
          description: "",
          enableAnimations: true,
          showLegend: true,
          /* padding: { left: 5, top: 5, right: 10, bottom: 5 },
          titlePadding: { left: 0, top: 0, right: 0, bottom: 10 }, */
          padding: { left: 5, top: 5, right: 40, bottom: 5 },
          titlePadding: { left: 35, top: 0, right: 0, bottom: 10 },
          source: days,
          source: days,
          xAxis:
          {
              dataField: 'day',
              gridLines: { visible: true }
          },
          colorScheme: 'scheme02',
          seriesGroups:
              [
                  {
                      type: 'stackedline',
                      source: purchase,
                      valueAxis:
                      {
                          visible: true,
                           title: { text: 'Purchase' } 
                      },
                      series: [
                            { dataField: 'purchase', displayText: 'Purchase' }
                      ]
                  },
                  {
                      type: 'stackedline',
                      source: sales,
                      valueAxis:
                      {
                          visible: true,
                           title: { text: 'Sales' } 
                      },
                      series: [
                              { dataField: 'sales', displayText: 'Sales' }
                      ]
                  }
              ]
      };
      
      $("#abcanalysis").jqxChart(settings); 
            /* -------------------------------------- */
            /* Bar Chart Ends */
            
            /* Color change Chart Starts */
            /* ------------------------------------------ */
            var data4= [{"quantity":"50","idledays":"5"},
                        {"quantity":"500","idledays":"112"},
                        {"quantity":"80","idledays":"247"},
                        {"quantity":"258","idledays":"365"},
                        {"quantity":"96","idledays":"521"},
                        {"quantity":"350","idledays":"847"},
                        {"quantity":"101","idledays":"965"},
                        {"quantity":"50","idledays":"1277"},
                        {"quantity":"205","idledays":"1488"},
                        {"quantity":"408","idledays":"1688"},
                        {"quantity":"94","idledays":"1870"},
                        {"quantity":"700","idledays":"1908"}];

            var source =
            {
                datatype: "json",
                datafields: [
                    { name: 'idledays' },
                    { name: 'quantity' }
                ],
                localdata: data4
            };
            
            var dataAdapter = new $.jqx.dataAdapter(source,
           		 {
               		loadError: function (xhr, status, error) {
	                    alert(error);    
	                    }
			            
		            } );
            
            settings = {
                title: "Sales Order",
                description: "",
                borderLineWidth: 1,
                showBorderLine: true,
                enableAnimations: true,
                showLegend: false,
                padding: { left: 5, top: 5, right: 10, bottom: 5 },
                titlePadding: { left: 0, top: 0, right: 0, bottom: 10 },
                source: dataAdapter,
                categoryAxis:
                {
                    description: 'Days',
                    dataField: 'idledays',
                    textRotationAngle: -75,
                    formatFunction: function (value, itemIndex, serie, group) {
                        return value;
                    },
                    valuesOnTicks: false
                },
                colorScheme: 'scheme06',
                seriesGroups:
                [
                    {
                        type: 'line',
                        valueAxis:
                        {
                            description: 'Quantity',
                            formatFunction: function (value) {
                                return value /* + '%' */;
                            }
                        },
                        series:
						    [
                                {
                                    dataField: 'quantity',
                                    displayText: 'No. of Days',
                                    // Modify this function to return desired colors.
                                    // jqxChart will call the function for each data point.
                                    // Sequential points that have the same color will be
                                    // grouped automatically in a line segment
                                    colorFunction: function (value, itemIndex, serie, group) {
                                        return (value < 0) ? '#FF0000' : '#00FF00';
                                    }
                                }
                            ]
                    }
                ]
            };
            $("#idleDays").jqxChart(settings); 
            /* -------------------------------- */
            /* Color change Chart Ends */
            
         
            
            /* Stacked Chart Starts */
            /* ----------------------------- */
            <%-- var data5= '<%= com.dashboard.ClsDashBoardDAO.stackedchart() %>';
           // alert(data5);  
            var source =
            {
                datatype: "json",
                datafields: [
                    { name: 'dramount' },
                    { name: 'ldramount' }
                ],
                 localdata: data5
            }; 
            
            var dataAdapter = new $.jqx.dataAdapter(source,
              		 {
                  		loadError: function (xhr, status, error) {
   	                    alert(error);    
   	                    }
   			            
   		            } );
            
            var settings = {
                 title: "Amounts",
                 //description: "Amounts",
                 padding: { left: 5, top: 5, right: 5, bottom: 5 },
                 titlePadding: { left: 0, top: 0, right: 0, bottom: 10 },
                 source: dataAdapter,
                 enableAnimations: true,
                 xAxis:
                         {
                             dataField: '',
                             description: '',
                             showGridLines: true,
                             showTickMarks: true
                         },
                 seriesGroups:
                         [
                             {
                             type: 'stackedcolumn',
                             columnsGapPercent: 100,
                             valueAxis: {
                                 description: 'Value',
                                 logarithmicScale: true,
                                 logarithmicScaleBase: 2,
                                 unitInterval: 1,
                                 tickMarksInterval: 1,
                                 gridLinesInterval: 1,
                                 formatSettings: { decimalPlaces: 3 },
                                 horizontalTextAlignment: 'right'
                             },
                             series: [
                                         { dataField: 'dramount', displayText: 'Dr Amount' },
                                         { dataField: 'ldramount', displayText: 'Ldr Amount' }
                                     ]
                             }
                         ]
             };
             $('#stackedChart').jqxChart(settings); --%>
             /* ------------------------------------------ */
             /* Stacked Chart Ends */
            
        });
        
        
    </script>
    
<style>
.hidden-scrollbar {
  overflow: auto;
  height: 580px;
}
</style>

    
</head>
<body style="background-color: #fff;">
<div class='hidden-scrollbar' >
<table  width="100%">
<tr><td width="30%">
<table  width="100%">
		    <tr><td>&nbsp;</td></tr> 
			<tr><td><div id='inventory1' style="width: 100%; height: 190px;"></div></td></tr>
			<tr><td><div id='sales' style="width: 100%; height: 170px;"></div></td></tr>
			<tr><td><div id='idleDays' style="width: 100%; height: 170px;"></div></td></tr>

</table></td>
<td width="40%"> 
			<table width="100%" >
			<tr><td>&nbsp;</td></tr>
			    <tr><td colspan="2"><center><img src="../../icons/gw.png" onclick="location.reload ();" style="width:50%;height:30px;"></center></td></tr>  
			 	 <tr>
			 	 	<td width="50%"><div><jsp:include page="dashboardGridMaster.jsp"></jsp:include></div></td>
			  		<td width="50%">
			  			<div id="dashboardGridDetail1"><jsp:include page="dashboardGridDetails.jsp"></jsp:include></div>
			  		</td> 
			  	</tr>
			  </table>
</td>
<td width="30%">
		<table  width="100%">
		<tr><td>&nbsp;</td></tr>
		<tr><td><div id='abcanalysis' style="width: 97%; height: 190px;"></div></td></tr>
		<tr rowspan="2"><td><fieldset style="background-color: #FFF8B3;"><div><jsp:include page="toDoList.jsp"></jsp:include></div></fieldset></td></tr> 
	    <!-- <tr><td><div id="chart1" style="width: 97%; height: 170px;"></div></td></tr>
		<tr><td><div id='stackedChart' style="width: 97%; height: 170px;"></div></td></tr> -->
		</table>
</td>
</tr></table> 
</div> 

</body>
</html>