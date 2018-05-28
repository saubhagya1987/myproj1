
<%@page import="in.fiinfra.cp.CommonUtils"%>
<%@page import="in.fiinfra.cp.ExpenseData"%>
<%@page import="java.util.List"%>
<script src="${pageContext.request.contextPath}/resources/js/highcharts.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/exporting.js"></script>
<script>

    var data = ${graphData};
      

</script>
<script>
$(document).ready(function () {    
           
            RenderPieChart('container',data );     
     /*
     $('#btnPieChart').live('click', function(){ 
         var data = [
                      ['My Salary', 50],
                      ['Wife Salary', 25],
                      ['Rent',  13],
                      ['Consulting', 11],

                  ];
             
            RenderPieChart('container', data);
     });*/
     
            function RenderPieChart(elementId, dataList) {
		var chartData=toChartData(dataList);
    		 
    	 new Highcharts.Chart({
                    chart: {
                        renderTo: elementId,
                        plotBackgroundColor: null,
                        plotBorderWidth: null,
                        plotShadow: false
                    }, title: {
                        text: 'Expenses'
                    },
                    tooltip: {
                        formatter: function () {
                            return '<b>' + this.point.name + '</b>: ' + Math.round(this.percentage)+ ' k';
                        }
                    },


                    plotOptions: {
                        pie: {
                            allowPointSelect: true,
                            cursor: 'pointer',
                            dataLabels: {
                                enabled: true,
                                color: '#000000',
                                connectorColor: '#000000',
                                formatter: function () {
                                    return '<b>' + this.point.name + '</b>: ' + Math.round(this.percentage) + ' k';
                                }
                            }
                        }
                    },
                    series: [{
                        type: 'pie',
                        name: 'Browser share',
                        data:chartData
                    }]
                });
            };
        });
</script>

<body>
<div id="wrapper" class="clearfix">
	     
  <div id="trapezoid" class="clearfix fr">
    <p>Welcome&nbsp;<span> Mr. Parag Takalkar</span></p>
  </div>
  <div id="header-strip" class="fl">
    <h3 class="clearfix fl">MY CASHFLOW : <span class="title_it"> MY EXPENSES</span></h3>	 
    <%-- <a href="${pageContext.request.contextPath}/financial/myIncome" class="add-income-btn clearfix fr"><img src="${pageContext.request.contextPath}/resources/images/transparent.png" />Add Expenses</a> --%>
    <a href="${pageContext.request.contextPath}/financial/savings" class="my-savings-btn clearfix fr"><img src="${pageContext.request.contextPath}/resources/images/transparent.png" />My Savings</a>
    <a href="${pageContext.request.contextPath}/financial/myIncome" class="my-income-btn clearfix fr"><img src="${pageContext.request.contextPath}/resources/images/transparent.png" />My Income</a>
  </div>
  <!-- end of "header-strip" id -->
  
  <div id="inner-shadow-strip"></div>
  <!-- end of "inner-shadow-strip" id -->
  
  <div id="contents">
  <div id="data-graph-bx"> 
    <div id="data-graph" class="common_sliding_radio"> <span class="lbl_first lbl">Data</span> <span class="lbl_second lbl">Graph</span> </div>  <div class="clr"></div></div>
  
      <% double total=0d;
               List<ExpenseData> lstExpense = (List<ExpenseData>) request.getAttribute("lstExpense");
               for(ExpenseData n:lstExpense) {
            	   total+=CommonUtils.calculateAmountYearly(n.getExpenseAmount(), n.getExpenseFrequencyID())  ;
            	   
               }%>    <div id="inner-contents-graph" class="clearfix fl">   	
      <div class="margin-box clearfix fl">       	
       <div id="container" style="min-width: 500px; height: 500px; margin: 0 auto"></div>
                           
                <div class="net-income clearfix fl" >
                	<span class="txt clearfix fl">Net Expenses :</span>
                    <img class ="rs clearfix fl" src="${pageContext.request.contextPath}/resources/images/transparent.png">
                    <span class="digit clearfix fl"><%=CommonUtils.formatAmountINR((Long) request.getAttribute("totalExpenseYearly")) %></span>
                    <span class="txt clearfix fl">per year</span>
                </div><!-- end of "net-expenses" class -->
           </div>     
        </div><!-- end of "margin-box" class --> 
    </div> <!-- end of "contents" id -->
  
  
</div>
<!-- End of "wrapper" id -->
