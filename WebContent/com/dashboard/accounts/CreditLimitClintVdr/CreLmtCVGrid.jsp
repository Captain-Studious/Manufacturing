<%@page import="com.dashboard.accounts.CreditLimitClintVdr.ClsCreLmtCVDAO"%>
<%ClsCreLmtCVDAO DAO= new ClsCreLmtCVDAO(); %>
<%   String branchval = request.getParameter("branchval")==null?"NA":request.getParameter("branchval").trim();    
     String atype = request.getParameter("atype"); 
     String accdocno = request.getParameter("accdocno")==null?"0":request.getParameter("accdocno").trim();
     String salesperson = request.getParameter("salesperson")==null?"0":request.getParameter("salesperson").trim();
     String category = request.getParameter("category")==null?"0":request.getParameter("category").trim();
    
	
     String clientStatus = request.getParameter("clientstatus")==null?"":request.getParameter("clientstatus").trim();
     String check = request.getParameter("check")==null?"0":request.getParameter("check");
     
     
     %> 
     
 
     
<style type="text/css">
  .advanceClass
  {
      background-color: #FBEFF5;
  }
  .balanceClass
  {
      background-color: #E0F8F1;
  }
  .unappliedClass
  {
     color: #FF0000;
  }
</style>
<script type="text/javascript">
      var data;
      var temp='<%=branchval%>';
  
     
	  	if(temp!='NA'){ 
	  		 
	  		 data='<%=DAO.ageingStatement(branchval,atype, accdocno, salesperson, category, clientStatus,check)%>';
	  		 
	  	}
  	
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
        	
        	var source =
            {
                datatype: "json",
                datafields: [
							{name : 'account_name' , type: 'String' },
							{name : 'contact_person' , type:'String'},
							{name : 'mobile_no' , type:'String'},
							{name : 'advance' , type:'number'},
							{name : 'balance' , type:'number'},
							{name : 'unapplied',type:'number'},
							{name : 'total' , type:'number'},
							/* {name : 'level_1' , type:'number'},
							{name : 'level_2' , type:'number'},
							{name : 'level_3' , type:'number'},
							{name : 'level_4' , type:'number'},
							{name : 'level_5' , type:'number'}, */
							{name : 'sal_name' , type:'String'},
							{name : 'account' , type:'int'},
							{name : 'branch_id' , type:'int'}
	                      ],
                          localdata: data,
               
                pager: function (pagenum, pagesize, oldpagenum) {
                    // callback called when a page or page size is changed.
                }
            };
            var dataAdapter = new $.jqx.dataAdapter(source,
            		 {
                		loadError: function (xhr, status, error) {
	                    alert(error);    
	                    }
		            });
            
            $("#CLCVGrid").jqxGrid(
            {
                width: '98%',
                height: 490,
                source: dataAdapter,
                rowsheight:25,
                filtermode:'excel',
                filterable: true,
                sortable: true,
                selectionmode: 'singlerow',
                editable: false,
                showaggregates: true,
                showstatusbar:true,
             	statusbarheight:25,
                
                columns: [
							{ text: 'Account Name', datafield: 'account_name', width: '15%' },
							{ text: 'Contact Person',  datafield: 'contact_person',  width: '15%' },
							{ text: 'Mobile No',  datafield: 'mobile_no',  width: '15%', aggregates: ['sum1'],aggregatesrenderer:rendererstring1 },
							{ text: 'Advance', datafield:'advance', width:'10%', cellsformat: 'd2',cellsalign:'right',align:'right', aggregates: ['sum'], aggregatesrenderer:rendererstring, cellclassname: 'advanceClass' },
							{ text: 'Balance', datafield:'balance', width:'10%', cellsformat: 'd2',cellsalign:'right',align:'right', aggregates: ['sum'], aggregatesrenderer:rendererstring, cellclassname: 'balanceClass' },
							{ text: 'Unapplied',  datafield: 'unapplied',  width: '10%', cellsformat: 'd2',cellsalign:'right',align:'right', aggregates: ['sum'], aggregatesrenderer:rendererstring, cellclassname: 'unappliedClass' },
							{ text: 'Total',  datafield: 'total',  width: '10%',cellsformat: 'd2',cellsalign:'right',align:'right', aggregates: ['sum'], aggregatesrenderer:rendererstring },
							/* { text: l1,  datafield: 'level_1',  width: '7%',cellsformat: 'd2',cellsalign:'right',align:'right', aggregates: ['sum'], aggregatesrenderer:rendererstring},
							{ text: l2,  datafield: 'level_2',  width: '7%',cellsformat: 'd2',cellsalign:'right',align:'right',aggregates: ['sum'], aggregatesrenderer:rendererstring },
							{ text: l3,  datafield: 'level_3',  width: '7%',cellsformat: 'd2',cellsalign:'right',align:'right', aggregates: ['sum'], aggregatesrenderer:rendererstring },
							{ text: l4,  datafield: 'level_4',  width: '7%',cellsformat: 'd2',cellsalign:'right',align:'right', aggregates: ['sum'], aggregatesrenderer:rendererstring },
							{ text: l5,  datafield: 'level_5',  width: '7%',cellsformat: 'd2',cellsalign:'right',align:'right', aggregates: ['sum'], aggregatesrenderer:rendererstring },
							 */{ text: 'Sales Person',  datafield: 'sal_name',  width: '15%' },
							{ text: 'Account No',  datafield: 'account', hidden: true, width: '8%'  },
							{ text: 'Branch Id',  datafield: 'branch_id', hidden: true, width: '8%'  },
						 ]
            });
            
            if(temp=='NA'){
                $("#CLCVGrid").jqxGrid("addrow", null, {});
            }
            
            var advance1="";var balance1="";var netbalance="";
             var rows = $("#CLCVGrid").jqxGrid('getrows');
            if(rows.length>0){
            	var advance=$('#CLCVGrid').jqxGrid('getcolumnaggregateddata', 'advance', ['sum'], true);
            	advance1=advance.sum.replace(/(\d+),(?=\d{3}(\D|$))/g, "$1");
            	var balance=$('#CLCVGrid').jqxGrid('getcolumnaggregateddata', 'balance', ['sum'], true);
            	balance1=balance.sum.replace(/(\d+),(?=\d{3}(\D|$))/g, "$1");
            }
            if(!isNaN(advance1 || balance1)){
            	netbalance= parseFloat(balance1) - parseFloat(advance1);
      		    funRoundAmt(netbalance,"txtnetbalance");
      		  }
      		 else{
		    	 funRoundAmt(0.00,"txtnetbalance");
		     }
            
            $("#overlay, #PleaseWait").hide();
            
            $('#CLCVGrid').on('rowdoubleclick', function (event) { 
            	  var rowindex1=event.args.rowindex;
            	  document.getElementById("txtacountno").value=$('#CLCVGrid').jqxGrid('getcellvalue', rowindex1, "account");
            	  document.getElementById("txtbranch").value=$('#CLCVGrid').jqxGrid('getcellvalue', rowindex1, "branch_id");
               }); 

        });

</script>
<div id="CLCVGrid"></div>
