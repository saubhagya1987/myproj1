
<%@page import="in.fiinfra.cp.CommonUtils"%>
<%@page import="in.fiinfra.cp.IncomeData"%>
<%@page import="java.util.List"%>

<script src="${pageContext.request.contextPath}/resources/js/highcharts.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/exporting.js"></script>

	
 <script>
 
    var data = ${graphData};
  /* var data=[
	//  ['My Salary',50],
  ['Wife Salary', 25],
  ['Rent',  11],                         
  ['Consulting', 14],
]; */
</script> 


<script>

$(document).ready(function () {    
	
		
            RenderPieChart('container', data);     
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
     

        });
</script>



<div id="wrapper" class="clearfix">
	    
     <div id="header-strip" class="fl"> 
        	<h3 class="clearfix fl">MY CASHFLOW : <span class="title_it"> MY PORTFOLIO</span></h3>
     <img class="short-menu clearfix fr"  src="${pageContext.request.contextPath}/resources/images/transparent.png" />
     <%-- <a href="#" class="add-income-btn clearfix fr"><img src="${pageContext.request.contextPath}/resources/images/transparent.png" />Add Income</a> --%>
     <a href="${pageContext.request.contextPath}/financial/savings" class="my-savings-btn clearfix fr"><img src="${pageContext.request.contextPath}/resources/images/transparent.png" />My Savings</a>
     <a href="${pageContext.request.contextPath}/financial/myExpenses" class="my-expenses-btn clearfix fr"><img src="${pageContext.request.contextPath}/resources/images/transparent.png" />My Expenses</a>
     </div><!-- end of "header-strip" id --> 
      
     
     
     
     <div id="inner-shadow-strip"></div><!-- end of "inner-shadow-strip" id -->
        
    <div id="contents">
    	<div id="data-graph-bx">
      <div id="data-graph" class="common_sliding_radio data-graph-income"><span class="lbl_first lbl">Data</span><span class="lbl_second lbl">Graph</span></div>
      <div class="clr"></div>
      
      <!--div id="data-graph-margin" style="position:relative; z-index:2;top: -22px;left: 7px; opacity:0.0;"><span class="lbl_first lbl"><a  href="#">Data</a></span><span class="lbl_second lbl"><a  href="${pageContext.request.contextPath}/financial/income/graph>Graph</a></span></div-->
      <div class="clr"></div>
      
      
    </div>
    	
        <!--div class="graph-title clearfix fl">Income</div--><!-- enf of "graph-title" id -->        
        
        <div id="inner-contents-graph" class="clearfix fl">
        	
        	<div class="margin-box clearfix fl">
      	  
           <div id="container" style="min-width: 500px; height: 500px; margin: 0 auto"></div>
                <div class="net-income clearfix fl" >
                	<span class="txt clearfix fl">Net Income :</span>
                    <img class ="rs clearfix fl" src="${pageContext.request.contextPath}/resources/images//transparent.png">
                    <span class="digit clearfix fl"><%=CommonUtils.formatAmountINR((Long) request.getAttribute("totalYearlyIncome")) %></span>
                    <span class="txt clearfix fl">per year</span>
                </div><!-- end of "net-expenses" class -->
           </div>     
        </div><!-- end of "margin-box" class --> 
    </div> <!-- end of "contents" id -->
     

    
</div><!-- End of "wrapper" id -->
