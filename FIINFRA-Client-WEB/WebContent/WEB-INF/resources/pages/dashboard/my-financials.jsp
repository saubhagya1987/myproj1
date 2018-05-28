

<%@page import="in.fiinfra.cp.FinancialData"%>
<%@page import="java.util.List"%>
<script src="${pageContext.request.contextPath}/resources/js/highcharts.js"></script>


<script type="text/javascript">
var data = ${series};
var category = ${category};
$(function () {
        $('#container').highcharts({
            title: {
                text: 'Income Versues Expenses',
                x: -20 //center
            },
            subtitle: {
                text: 'Income Versues Expenses',
                x: -20
            },
            xAxis: {
                categories: category
            },
            yAxis: {
            	
                title: {
                    text: 'Amount (in 1000)'
                },
                plotLines: [{
                    value: 0,
                    width: 1,
                    color: '#808080'
                }]
            },
            tooltip: {
                valueSuffix: ' K'
            },
            legend: {
                layout: 'vertical',
                align: 'right',
                verticalAlign: 'middle',
                borderWidth: 0
            },
            series: data
        });
    });
    

		</script>
<%	List<FinancialData>	lstFinancials= (List<FinancialData>)request.getAttribute("lstFinancials"); %>

<div id="wrapper" class="clearfix">
  <div id="header-strip" class="fl"></div>
 
  <div id="inner-shadow-strip"></div>
  <div id="contents">
   <div id="inner_contents_my_income_data"> 
      <!--title starts-->
      <div class="my_income_title_bx">
      <ul>
          <li class="input_title_two fl" style="color: blue;">Age</li>
          <li class="input_title_two fl" style="color: blue;">Expense </li>
          <li class="input_title_two fl" style="color: blue;">Income</li>
          
          </ul><br/>
          <hr/>
          
 <%for(FinancialData f:lstFinancials){
	 %>
	 <ul>
	<li class="input_title_two fl" ><%=f.getAge() %></li>
	<li class="input_title_two fl"><%=f.getExpenses() %></li>
	<li class="input_title_two fl"><%=f.getIncome() %></li>
	<br/>
	</ul>
	 
 <%}  %>
 
 </div>
 </div>
 </div>
</div>
<div id="container" style="min-width: 310px; height: 400px; margin: 0 auto"></div>


