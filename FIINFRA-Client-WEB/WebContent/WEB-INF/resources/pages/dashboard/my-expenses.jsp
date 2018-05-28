
<%@page import="in.fiinfra.cp.CommonUtils"%>
<%@page import="in.fiinfra.common.common.BaseRequest"%>
<%@page import="org.apache.commons.lang.StringUtils"%>
<%@page import="in.fiinfra.common.common.CodeValueData"%>
<%@page import="in.fiinfra.cp.ExpenseData"%>
<%@page import="in.fiinfra.cp.IncomeData"%>
<%@page import="in.fiinfra.common.diy.models.KeyValue"%>


<%@page import="java.util.List"%>
<title>My Expenses</title>
<style>
a.right {
   
   text-align: right;
  margin-left: 160px;
}
</style>

<%List<CodeValueData> expTypes= (List<CodeValueData>) request.getAttribute("expenseTypes"); 
List<ExpenseData> expData= (List<ExpenseData>) request.getAttribute("lstExpense");

     %>


<script>
var expenseData = ${expensesData};
  </script>


<script>

	/***** My Expenses *****/
	var showGraphPage = <%=request.getParameter("graph") != null ?"true":"false"%>;
var expenseTypes = [];
var leaving = true;
var data = ${graphData};
	
	    $(".data-graph-expenses").slider({
	        min: 1,
	        max: 2,
	        step: 1,
	        slide: function (event, ui) {
	            //$("#data-graph .ui-slider-handle").empty();
	            if (ui.value == 1) {
	            	$(".add-income-btn").show();
	                $("#data-graph .ui-slider-handle").css("margin-left", "2px");
	                $("#data-graph .ui-slider-handle").text("Data");
	               $("#inner-contents-graph").hide();
	               $("#inner_contents_my_expenses_data").show();
	               ensureData();
				
	            } else if (ui.value == 2) {
	            	$(".add-income-btn").hide();
	                $("#data-graph .ui-slider-handle").css("margin-left", "-42px");
	               $("#data-graph .ui-slider-handle").text("Graph");
	               $("#inner-contents-graph").show();
	               $("#inner_contents_my_expenses_data").hide();
	              // RenderPieChart('container', data); 
	              
	               showGraph();
	            }
	        }

	    });
	    
	    
	    if(!showGraphPage){
		    $("#data-graph .ui-slider-handle").css("margin-left", "2px");
		    $("#data-graph .ui-slider-handle").text("Data");
		    $("#inner-contents-graph").hide();
	    }
	    else{
        	$(".add-income-btn").hide();
            $("#data-graph .ui-slider-handle").css("margin-left", "-42px");
           $("#data-graph .ui-slider-handle").text("Graph");
           $("#inner-contents-graph").show();
           $("#inner_contents_my_expenses_data").hide();
           showGraph();
	       $(".data-graph-expenses").slider('value',2);
	      
	
	    
	    
	 
 };
</script>
<script>
  function communicateIFA(){
	  
	  
  /* showConfirm("Are you sure; you want to communicate amount change to your IFA?", function() {
		window.location.href="${pageContext.request.contextPath}/portfolio/sendToIFA?ifa=expense";
	}); */
  
  bootbox.confirm("Are you sure; you want to communicate amount change to your IFA?", function(result) {
		if(result==true)
			{
			window.location.href="${pageContext.request.contextPath}/portfolio/sendToIFA?ifa=expense";
			}
		else
			{
			
			}
		  /* Example.show("Confirm result: "+result); */
		}); 
  
  
  }
  </script>
  
  <script>
  function drawChart() {
	  
	    var options = {
	      
	      backgroundColor: { fill:'transparent' },
	      width:600,
	      height:400,
	      colors:GRAPH_COLORS,
	      legend : {width:100, textStyle: {fontSize: 12}},
	      pieSliceText: 'percentage'
	    };
	    
	    var options2 = {
	    		title: 'My Expenses',	
	    	      backgroundColor: { fill:'transparent' },
	    	      width:600,
	              height:400,
	              colors:GRAPH_COLORS,
	              pieSliceText: 'percentage',
	    	      
	    	      legend: {  alignment: 'start', textStyle: {fontSize: 12} },
	    	      chartArea: { left: 150, top: 10, width: "80%", height: "100%"},
	  	        backgroundColor: { stroke: "#5A5A5A", strokeWidth: 2},

	  	        // add this line
	  	        pieSliceBorderColor : "#5A5A5A"
	    	      
	    	    };
	    
	    showGooglePieChart('Expense',expenseData,options2,'inner-contents-graph'); 
	  }
  
	jQuery(function($) {
		$('#loading-btn').on(ace.click_event, function () {
			var btn = $(this);
			btn.button('loading')
			setTimeout(function () {
				btn.button('reset')
			}, 2000)
			});
		$('#id-button-borders').attr('checked' , 'checked').on('click', function(){
			$('#default-buttons .btn').toggleClass('no-border');
			if(this.checked)
				{
				$("#graphBorder").hide();
				$("#inner-contents-graph").hide();
				$("#sample-table-1").show();
				}
			else
				{
				$("#sample-table-1").hide();
				$("#graphBorder").show();
				$("#inner-contents-graph").show();
				drawChart();
				}
		});
	})

</script>

  <div class="sen_msg_txt fl">You have declared <span class="fa fa-inr fa-2x sen_msg"><%= request.getAttribute("dcExpense")!=null? CommonUtils.formatAmountINR((Double) request.getAttribute("dcExpense")) :"0"%></span> <span class="sen_msg_txtm"> Per Month</span> of  <span class="sen_msg_txtm">Total Expense</span> in Financial Plan </div> &nbsp;
  <a href="#" class="btn-primary btn-xs btn" onclick="communicateIFA()">Communicate change in amount to your IFA</a> 
  
<div class="topmenu pull-right"> 
 <a href="${pageContext.request.contextPath}/financial/myExpense/addUpdate" class="btn-primary btn-xs btn">Add Expenses</a></div>
  <div id="contents">
  <!-- <label>
              <input name="switch-field-1" class="ace ace-switch ace-switch-2" type="checkbox">
              <span class="lbl"></span>
             </label> -->
  
   <!-- <div id="data-graph-bx">
      <div id="data-graph" class="common_sliding_radio data-graph-expenses"><span class="lbl_first lbl">Data</span><span class="lbl_second lbl">Graph</span></div>
      <div class="clr"></div>
  
    </div>  -->
    <br>
    <span class="col-sm-1 fr"> <label class="pull-right inline">
		 <input	id="id-button-borders" checked="" type="checkbox" class="ace ace-switch ace-switch-5" /> <span class="lbl middle"></span>
	</label>
	</span>

	<div class="row">
	<div id="graphBorder" class="col-xs-12" style="display: none">
		<div class="col-md-3"></div>
		<div class="col-md-5">
			<!-- <div class="widget-box"> -->
			<div id="inner-contents-graph"></div>
			<!-- </div> -->
		</div>
	</div>
</div>
	<%
		String inflationStartRange = (String) request
				.getAttribute("inflationStartRange");
		String inflationEndRange = (String) request
				.getAttribute("inflationEndRange");

		String inflationRate = (String) request
				.getAttribute("inflationRate");
		double leftPercentage = (CommonUtils.getPercentage(
				Double.valueOf(inflationStartRange),
				Double.valueOf(inflationEndRange),
				Double.valueOf(inflationRate))) * .87;
	%>
  <% if( !expData.isEmpty()){ %>
          <table id="sample-table-1"
										class="table table-striped table-bordered table-hover">
										<thead>
											<tr>
												<!-- <th class="hidden-480 center">Income Category</th> -->
												<th class="">Expense Type</th>
												<th class="">Amount</th>
												<th class="">Period</th>
												<th class="">Actions</th>
											</tr>
										</thead>
										
								 		<tbody>
											<% for(ExpenseData n:expData){%>
											<tr>
												<%-- <td class="hidden-480 center"><%=CommonUtils.emptyIfNull(n.getIncomeType()) %></td> --%>
												<td class=""><%=n.getExpenseName() %></td>
												<td class=""><%=CommonUtils.formatAmountINR(n.getExpenseAmount(),true) %></td>
												<td class=""><%=n.getExpenseFrequency() %></td>
												<td class=""><div>
             
														
															<a class="fa fa-pencil fa-lg has-tip [tip-top tip-bottom tip-left tip-right] [radius round]" data-options="show_on:large" title="Click here to Edit" href="${pageContext.request.contextPath}/financial/myExpense/addUpdate?expenseId=<%=n.getPartyExpenseID()%>">
															</a>&nbsp;&nbsp;
														

												
														<a class="fa fa-trash fa-lg has-tip [tip-top tip-bottom tip-left tip-right] [radius round]" data-options="show_on:large" title="Click here to Delete"  href="${pageContext.request.contextPath}/financial/expense/delete?expenseId=<%=n.getPartyExpenseID() %>" onclick="return myConfirm(this.href);">
														</a>&nbsp;&nbsp;
													

														<a class="fa fa-question fa-lg has-tip [tip-top tip-bottom tip-left tip-right] [radius round]" data-options="show_on:large" title="Click here to Add Question" href="${pageContext.request.contextPath}/query/add?refTypeId=111013&<%=BaseRequest.encode("returnUrl", "/financial/myExpenses")%>&refId=<%=n.getPartyExpenseID() %>">
														</a>&nbsp;&nbsp;
														
														<a class="icon-add-notes fa-lg has-tip [tip-top tip-bottom tip-left tip-right] [radius round]" data-options="show_on:large" title="Click here to Add Notes" href="${pageContext.request.contextPath}/notes/note?refTypeId=111013&<%=BaseRequest.encode("returnUrl", "/financial/myIncome")%>&refId=<%=n.getPartyExpenseID() %>">
															</a>
														
													<%-- 	
														<button class="btn btn-xs btn-success">
														<a href="${pageContext.request.contextPath}/notes/note?refTypeId=111013&<%=BaseRequest.encode("returnUrl", "/financial/Expenses")%>&refId='+partyExpenseID">
															<i class="ace-icon fa fa-flag bigger-120"></i></a>
														</button> --%>
            </div></td>
																									
              
											
												
											</tr>
											
											<%}%> 
											</tbody> 
									</table>
        
    
   <div class="fr">
        
      
       <div class="pull-left label label-lg arrowed-in-right arrowed-in hidden-xs"> <span>Net Income:</span>

                  <div class="fa fa-inr" id = "totalMonthly"><%=request.getAttribute("totalExpenseYearly") %></div>

          <span>per year</span></div>
    </div>
  <!-- end of "contents" id -->
  
</div>
<!-- End of "wrapper" id -->
<%}else{ %>
<div id="nodata">
  <div class="clr"></div>
     <div class="no_data_message">There is no Expense Defined by you</div>
  
  </div>
<%}%>