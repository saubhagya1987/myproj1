<%@page import="in.fiinfra.cp.CommonUtils"%>
<%@page import="in.fiinfra.cp.IncomeData"%>
<%@page import="in.fiinfra.cp.ExpenseData"%>
<%@page import="java.util.List"%>

  <%
               List<IncomeData> lstIncome = (List<IncomeData>) request.getAttribute("lstIncome");
               List<ExpenseData> lstExpenses = (List<ExpenseData>) request.getAttribute("lstExpenses");

               %>   

  
 <script>
 
    var data = ${incomeData};
    var expenseData = ${expensesData};
    
    

  </script> 


<script>

function drawChart() {
	  
    var options = {
      
      backgroundColor: { fill:'transparent' },
      width:360,
      height:240,
      colors:GRAPH_COLORS,
      legend : {width:100, textStyle: {fontSize: 12}},
      pieSliceText: 'percentage'
    };
    
    var options2 = {
    	
    	      backgroundColor: { fill:'transparent' },
    	      width:360,
              height:240,
              colors:GRAPH_COLORS,
              pieSliceText: 'percentage',
    	      
    	      legend: {  alignment: 'start', textStyle: {fontSize: 12} },
    	      
    	    };
    
    showGooglePieChart('Expense',expenseData,options2,'flotcontainer-expenses-savings'); 
    showGooglePieChart('Income',data,options,'flotcontainer-income-savings');
    
  }
 

$(document).ready(function () {    
	
	var data = ${incomeData};
    var expenseData = ${expensesData};

    if(expenseData.length<1 && data.length<1){
    	
    	$('#savings-table').hide();
    	$('#net-savings').hide();
    	
    }
    
    if(data.length >=1){
    	$('#flotcontainer-income-savings').show();
    	$('#income-wiget').show();
    	$('#no-income-data').hide();
    	
    }
    else{
    	$('#flotcontainer-income-savings').hide();
    	$('#income-wiget').hide();
    	$('#no-income-data').show();
    	
    	
    }
   
    if(expenseData.length>=1){
    	
    	$('#flotcontainer-expenses-savings').show();
    	$('#expense-wiget').show();
    	$('#no-expense-data').hide();
    }
    else{
    	$('#flotcontainer-expenses-savings').hide();
    	$('#expense-wiget').hide();
    	$('#expense_ul').hide();
    	
    	$('#no-expense-data').show();
    }
    
    
    
	//showSaviegChart($('#flotcontainer-income-savings'), data, 'Income');
	//showSavingChart($('#flotcontainer-expenses-savings'), expenseData, 'Expenses');
            
     drawChart();
 
        });
</script>

</head>
     <div class="topmenu pull-right"> 
      
        	
		    <a href="${pageContext.request.contextPath}/financial/myExpenses" class="btn-primary btn-xs btn">My Expenses</a>
            <a href="${pageContext.request.contextPath}/financial/myIncome" class="btn-primary btn-xs btn">My Income</a> 
     </div><!-- end of "header-strip" id --> 
     
     <br/><br/>
     
     
    <!-- end of "inner-shadow-strip" id -->
        
    <div id="contents">
    	<!--div id="data-graph-bx"> <div id="data-graph" class="common_sliding_radio"> <span class="lbl_first lbl">Data</span> <span class="lbl_second lbl">Graph</span> </div>  <div class="clr"></div></div-->
    	
    	<div class="col-xs-12">
    	<div class="row">
    	<div class="col-md-6">
    	
    	<div class="widget-box">
    	<h3 class="block center">Income</h3>
    	<div id=no-income-data  >
       		<div class="no_data_message">There is no Income Defined by you</div>
       		</div>
       		<div >
       	<div>
           <div  id="flotcontainer-income-savings" style="margin-left: 72px !important;"></div>
            </div>
            
            	   
           <!-- Pie Chart -->
         </div><!-- end of "margin-box" class --> 
         </div> 
         		<div class="widget-box" id="income-wiget">
            
                      <div class="widget-body">
                    <div class="widget-main">
                	
                          <div id="income_ul">
                        <% 
               
               for(IncomeData n:lstIncome) {
            	   
            	   %>
                            <div class="col-md-12">
                          		<%-- <div class="icon_<%=n.getIncomeTypeId() %> clearfix fl"></div> --%>
                            	<span class="col-md-6"><%=n.getIncomeName() %></span>
                                <span class="col-md-6 fa fa-inr"><%=CommonUtils.formatAmountINR(CommonUtils.calculateAmountMonthly(n.getIncomeAmount(), n.getIncomeFrequencyId()))  %> </span>
                                <!--span class="up-arrow clearfix fl"></span-->
                             </div><br/><br/>
                         <%} %>    
                             
                             <br>
                             	
                        
                    
                  </div>
               
            	   
                          
                        </div>
                    <!-- /.widget-main --> 
                  </div>
                      <!-- /.widget-body -->
                      <div class="pull-right label label-lg arrowed-in-right arrowed-in hidden-xs" >
                                    <span class="">Net Income :</span>
                                    <span class="fa fa-inr"><%=request.getAttribute("totalMonthlyIncome") %> </span>
                                    <span class="">per month</span>
                                </div><!-- end of "net-income" class --> 
                    </div>
		</div>
     <div class="col-md-6">
     <div class="widget-box">
    	<h3 class="block center">Expenses</h3>
    	<div id=no-expense-data >
       		<div class="no_data_message" >There is no Expense Defined by you</div>
                  </div>
                  
             
                  
       	
       		 <div id="flotcontainer-expenses-savings"  style="margin-left: 72px !important;"></div>
       		 </div>     
       		 		<div class="widget-box" id="expense-wiget">
                      <div class="widget-body">
                    <div class="widget-main">
                         
                          <div id="expense_ul">
                        
                                          <% 
               
               for(ExpenseData n:lstExpenses) {
            	   
            	   %>
                            <div class="col-md-12">
                          		<%-- <div class="  icon_<%=n.getExpenseTypeID() %> clearfix fl"></div> --%>
                            	<span class="col-md-6"><%=n.getExpenseName() %></span>
                                <span class="col-md-6 fa fa-inr"><%=CommonUtils.formatAmountINR(CommonUtils.calculateAmountMonthly(n.getExpenseAmount(), n.getExpenseFrequencyID())) %></span>
                                <!--span class="up-arrow clearfix fl"></span-->
                             </div><br/><br/>
                         <%} %> 
                             
                           <div>
                         
                           
                             </div>  
                        </div>
                      
                         
                        </div>
       
                    <!-- /.widget-main --> 
                  </div>
                      <!-- /.widget-body --> 
                      <div class="pull-right label label-lg arrowed-in-right arrowed-in hidden-xs" >
                                    <span class="">Net Expenses :</span>
                                    <span class =""></span>
                                    <span class="fa fa-inr fl"><%=request.getAttribute("totalMonthlyExpenses") %> </span>
                                    <span class="">per month</span>
                                </div><!-- end of "net-income" class -->
                    </div>
	
    	</div>
        <!-- end of "graph-title" id -->        
        <!-- end of "graph-title" id --> 
        </div>
        </div>
         	<!--div class="devider clearfix fl"></div-->
                   
      </div>
      
           
               	                
                <div class="center">           
                <div id="net-savings" class="align-center label label-lg arrowed-in-right arrowed-in hidden-xs" style="margin-top: 36px;" >
                	<span class="">Net Saving :</span>
                    <span class="fa fa-inr"><%=request.getAttribute("totalMonthlySaving") %> </span>
                    <span class="">per month</span>
                </div><!-- end of "net-income" class -->
               </div>
               
               
              
           <!-- end of "inner-contents-graph" class -->     
    <!-- end of "contents" id -->
<!-- End of "wrapper" id -->
