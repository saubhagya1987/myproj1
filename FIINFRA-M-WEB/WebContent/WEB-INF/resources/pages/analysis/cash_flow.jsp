<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@page import="in.fiinfra.Analysis.AnalysisController"%>
<%@page import="in.fiinfra.common.diy.models.UserSession"%>




<!-- Wrapper starts-->
<div class="page-content">
<div class="analysis_cashflow">
            	<!-- <h2 class="heading">Your Cashflow Ratios</h2> -->
            	
	           	<div class="space"> 
	           		<%-- <ul class="clearfix reset " id="surplus">
	            		<li class="left_col head top">Particulars</li><li class="right_col head top">Amount in <img alt="Rs " src="${pageContext.request.contextPath}/resources/images/rupee-symbol_small.png"> (Per Month)</li>
			            <li class="left_col">Your Income</li><li class="right_col"><span class="amount fr">${analysisAns[0] }</span></li>
			            <li class="left_col">Your Expense</li><li class="right_col"><span class="amount fr">${analysisAns[1] }</span></li>
			           <li class="left_col">Your Loan Repayment</li><li class="right_col"><span class="amount fr">${analysisAns[2] }</span></li>
			            <li class="left_col head">Surplus</li>
			           <c:choose>
			           <c:when test="${fn:startsWith(analysisAns[3], '-')}">			    
			           		<li class="right_col head"><span class="amount fr" style="color: red;">${analysisAns[3]}</span></li>
			           	</c:when>
			           	<c:otherwise>			
			           		<li class="right_col head"><span class="amount fr" style="color: blue;">${analysisAns[3] }</span></li>
			           	</c:otherwise>
			           </c:choose>
			           </li>
			            <span class="amount" style="color: blue;<c:if test="<%Double.parseDouble(${analysisAns[3]})%><0 ">color: red;</c:if>" >/-</li>
	            	</ul>          
	            	<p class="note">By reducing expenses or increasing income your surplus will improve</p> --%>
	            	</div>  
	            	
	            	<div class="row">
	            	<div class="col-sm-12">
	            	<form class="form-horizontal well well-sm clearfix" role="form">
	            	
	            	
	            

	<h4 class="col-sm-2 no-padding-right pink ">Income :</h4>
	 	            	
	            	<div class="col-sm-2 col-xs-12">
	            	<h6 class="col-sm-12 no-padding-left pink" >Source 1</h6>
               		<input type="text" id="form-field-2" placeholder="" class="col-sm-12 col-xs-11" value="${cashflowdata.source1}">
               		
               		
               		
             		</div>
             		
             			<div class="col-sm-2 col-xs-12">
             			<h6 class="col-sm-12 no-padding-left pink">Source 2</h6><br>
               		<input type="text" id="form-field-2" placeholder="" class="col-sm-12 col-xs-11" value="${cashflowdata.source2}">
               		
               		
             		</div>
             		
	            	<div class="col-sm-2 col-xs-12">
	            	<h6 class="col-sm-12 no-padding-left pink">Source 3</h6><br>
               		<input type="text" id="form-field-2" placeholder="" class="col-sm-12 col-xs-11" value="${cashflowdata.source3}">
               		
               		
             		</div>
	            	
	            	<div class="col-sm-2 col-xs-12">
	            	<h6 class="col-sm-12 no-padding-left pink">Total Income</h6><br>
               		<input type="text" id="form-field-2" placeholder="" class="col-sm-12 col-xs-11" value="${cashflowdata.totIncomeSource}">
               		
               		
             		</div>
	            	
	            	
	            	</form>
	            	</div>
	            	</div>
	            	
	            	<div class="row">
	            	<div class="col-sm-12">
	            	<form class="form-horizontal well well-sm clearfix" role="form">
	            	
	            	
	            

	<h4 class="col-sm-2 no-padding-right pink ">Expenses :</h4>
	 	            	
	            	<div class="col-sm-2 col-xs-12">
	            	<h5 class="col-sm-12 no-padding-left pink">Regular Expenses</h5><br>
               		<input type="text" id="form-field-2" placeholder="" class="col-sm-12 col-xs-11" value="${cashflowdata.totExpenseAmount}">
               		
               		
               		
             		</div>
             		
             		
	            	<div class="col-sm-2 col-xs-12">
	            	<h6 class="col-sm-12 no-padding-left pink">EMI</h6><br>
               		<input type="text" id="form-field-2" placeholder="" class="col-sm-12 col-xs-11" value="${cashflowdata.totEMI}">
               		
               		
             		</div>
             		
	            	<div class="col-sm-2 col-xs-12">
	            	<h6 class="col-sm-12 no-padding-left pink">Premiums</h6><br>
               		<input type="text" id="form-field-2" placeholder="" class="col-sm-12 col-xs-11" value="${cashflowdata.totPremiums}">
               		
               		
             		</div>
	            	
	            	<div class="col-sm-2 col-xs-12">
	            	<h6 class="col-sm-12 no-padding-left pink">Total Expenses</h6><br>
               		<input type="text" id="form-field-2" placeholder="" class="col-sm-12 col-xs-11" value="${cashflowdata.totExpenses}">
               		
               		
             		</div>
	            	
	            	
	            	</form>
	            	</div>
	            	</div>
	            	
	            	
	            	
	            	
	            	<div class="row">
	            	<div class="col-sm-12">
	            	<form class="form-horizontal well well-sm clearfix" role="form">
	            	
	            	
				<h4 class="col-sm-2 no-padding-right pink ">Surplus :</h4>
	 	            	
	            	<div class="col-sm-2 col-xs-12">
	            	<h5 class="col-sm-12 no-padding-left pink">Savings</h5><br>
               		<input type="text" id="form-field-2" placeholder="" class="col-sm-12 col-xs-11" value="${cashflowdata.savingRatio}">
               		
               		
               		
             		</div>
             		
             		
	            	<div class="col-sm-2 col-xs-12">
	            	<h6 class="col-sm-12 no-padding-left pink">Surplus</h6><br>
               		<input type="text" id="form-field-2" placeholder="" class="col-sm-12 col-xs-11" value="${cashflowdata.surplus}">
               		
               		
             		</div>
             		
	            	<div class="col-sm-2 col-xs-12">
	            	<h6 class="col-sm-12 no-padding-left pink">Current Investment</h6><br>
               		<input type="text" id="form-field-2" placeholder="" class="col-sm-12 col-xs-11" value="${cashflowdata.currentInvest}">
               		
               		
             		</div>
	            	
	            	<div class="col-sm-2 col-xs-12">
	            	<h6 class="col-sm-12 no-padding-left pink">Net Surplus</h6><br>
               		<input type="text" id="form-field-2" placeholder="" class="col-sm-12 col-xs-11" value="${cashflowdata.netSurplusAmt}">
               		
               		
             		</div>
	            	
	            	
	            	</form>
	            	</div>
	            	</div>
	            	
	            
	            	
	            	<div class="row">
							<div class="col-xs-12">
								<!-- PAGE CONTENT BEGINS -->
								<div class="row">
									<div class="col-xs-12">
										<table id="sample-table-1" class="table table-striped table-bordered table-hover">
											<thead>
												<tr>
													
													<th>Cash-Flow Analysis Ratio</th>
													<th class="center">Healthy</th>
													<th class="center">Average</th>
													<th class="center">Unhealty</th>
												</tr>
											</thead>

											<tbody>

											<tr>
													<td>
														Surplus Ratio (Expenses/Income)
													</td>

													<c:choose>
														<c:when test="${cashflowdata.surPlusRatioStatus eq 'H'}">
															<td class="center">${cashflowdata.surplusRatio} %<i class="ace-icon fa fa-smile-o bigger-200 green"></i></td><td></td><td></td>
														</c:when>
														<c:when test="${cashflowdata.surPlusRatioStatus eq 'A'}">
															<td></td><td class="center">${cashflowdata.surplusRatio} %<i class="ace-icon fa fa-meh-o bigger-200 orange"></i></td><td></td>
														</c:when>
														<c:otherwise>
															<td></td><td></td><td class="center">${cashflowdata.surplusRatio} %<i class="ace-icon fa fa-frown-o bigger-200 red"></i></td>
														</c:otherwise>
													</c:choose>

												</tr>
												<tr>
													

													<td>Savings Ratio (Savings/Income)</td>
													<c:choose>
														<c:when test="${cashflowdata.savingRatioStatus eq 'H'}">
															<td class="center">${cashflowdata.savingRatio} %<i class="ace-icon fa fa-smile-o bigger-200 green"></i></td><td></td><td></td>
														</c:when>
														<c:when test="${cashflowdata.savingRatioStatus eq 'A'}">
															<td></td><td class="center">${cashflowdata.savingRatio} %<i class="ace-icon fa fa-meh-o bigger-200 orange"></i></td><td></td>
														</c:when>
														<c:otherwise>
															<td></td><td></td><td class="center">${cashflowdata.savingRatio} %<i class="ace-icon fa fa-frown-o bigger-200 red"></i></td>
														</c:otherwise>
													</c:choose>

												
												
												</tr>

												<tr>
													

													<td>EMI/Income Ratio</td>
													<c:choose>
														<c:when test="${cashflowdata.emiRatioStatus eq 'H'}">
															<td class="center">${cashflowdata.emiRatio} %<i class="ace-icon fa fa-smile-o bigger-200 green"></i></td><td></td><td></td>
														</c:when>
														<c:when test="${cashflowdata.emiRatioStatus eq 'A'}">
															<td></td><td class="center">${cashflowdata.emiRatio} %<i class="ace-icon fa fa-meh-o bigger-200 orange"></i></td><td></td>
														</c:when>
														<c:otherwise>
															<td></td><td></td><td class="center">${cashflowdata.emiRatio} %<i class="ace-icon fa fa-frown-o bigger-200 red"></i></td>
														</c:otherwise>
													</c:choose>
												
												
												</tr>

												<tr>
													

													<td>Liquidity Ratio (Liquid Assets/Net Worth)</td>
													<c:choose>
														<c:when test="${cashflowdata.liquididyRatioStatus eq 'H'}">
															<td class="center">${cashflowdata.liquidityRatio} %<i class="ace-icon fa fa-smile-o bigger-200 green"></i></td><td></td><td></td>
														</c:when>
														<c:when test="${cashflowdata.liquididyRatioStatus eq 'A'}">
															<td></td><td class="center">${cashflowdata.liquidityRatio} %<i class="ace-icon fa fa-meh-o bigger-200 orange"></i></td><td></td>
														</c:when>
														<c:otherwise>
															<td></td><td></td><td class="center">${cashflowdata.liquidityRatio} %<i class="ace-icon fa fa-frown-o bigger-200 red"></i></td>
														</c:otherwise>
													</c:choose>
												
												
												</tr>
												
												
												<tr>
													

													<td>Solvency Ratio (Outstanding Debt/Net Worth)</td>
													<c:choose>
														<c:when test="${cashflowdata.solvencyRatioStatus eq 'H'}">
															<td class="center">${cashflowdata.solvencyRatio} %<i class="ace-icon fa fa-smile-o bigger-200 green"></i></td><td></td><td></td>
														</c:when>
														<c:when test="${cashflowdata.solvencyRatioStatus eq 'A'}">
															<td></td><td class="center">${cashflowdata.solvencyRatio} %<i class="ace-icon fa fa-meh-o bigger-200 orange"></i></td><td></td>
														</c:when>
														<c:otherwise>
															<td></td><td></td><td class="center">${cashflowdata.solvencyRatio} %<i class="ace-icon fa fa-frown-o bigger-200 red"></i></td>
														</c:otherwise>
													</c:choose>
												
												</tr>
												
												
												<tr>
													

													<td>Debt Asset Ratio (Outstanding Debt/All Assets)</td>
													<c:choose>
														<c:when test="${cashflowdata.debtAssetRatioStatus eq 'H'}">
															<td class="center">${cashflowdata.debtAssetRatio} %<i class="ace-icon fa fa-smile-o bigger-200 green"></i></td><td></td><td></td>
														</c:when>
														<c:when test="${cashflowdata.debtAssetRatioStatus eq 'A'}">
															<td></td><td class="center">${cashflowdata.debtAssetRatio} %<i class="ace-icon fa fa-meh-o bigger-200 orange"></i></td><td></td>
														</c:when>
														<c:otherwise>
															<td></td><td></td><td class="center">${cashflowdata.debtAssetRatio} %<i class="ace-icon fa fa-frown-o bigger-200 red"></i></td>
														</c:otherwise>
													</c:choose>
												
												
												</tr>
											</tbody>
										</table>
									</div><!-- /.span -->
								</div><!-- /.row -->

							</div><!-- /.col -->
						</div><!-- /.row -->
						
						
						
	            	
	            	<!-- <ui class="clearfix reset ">
	            		<li class="fl head" style="float: left;width:100px !important;margin:0px 5px !important;"> Income :</li>
	            		<li class="fl" style="float: left;"><input type="text" style="width: 184px !important;" class="common_input2" readonly="readonly" name="income1" value=""></li>
	            		<li class="fl" style="float: left;"><input type="text" style="width: 184px !important;" class="common_input2" readonly="readonly" name="income2" value=""></li>
	            		<li class="fl" style="float: left;"><input type="text" style="width: 184px !important;" class="common_input2" readonly="readonly" name="income3" value=""></li>
	            		<li class="fl" style="float: left;"><input type="text" style="width: 184px !important;" class="common_input2" readonly="readonly" name="totalincome" value=""></li>
	            	</ui>
	            	<span style="margin: 0px 111px;">Source1</span>
	            	<span style="margin: 0px 46px;">Source2</span>
	            	<span style="margin: 0px 108px;">Source3</span>
	            	<span style="margin: 0px 49px;">Total Income</span> -->
	           <!--  	<br/><br/>
	            	<ui class="clearfix reset ">
	            		<li class="fl head" style="float: left;width:100px !important;margin:0px 5px !important;"> Expenses :</li>
	            		<li class="fl" style="float: left;"><input type="text" style="width: 184px !important;" class="common_input2" readonly="readonly" name="expense" value=""></li>
	            		<li class="fl" style="float: left;"><input type="text" style="width: 184px !important;" class="common_input2" readonly="readonly" name="emi" value=""></li>
	            		<li class="fl" style="float: left;"><input type="text" style="width: 184px !important;" class="common_input2" readonly="readonly" name="premium" value=""></li>
	            		<li class="fl" style="float: left;"><input type="text" style="width: 184px !important;" class="common_input2" readonly="readonly" name="totalexpense" value=""></li>
	            	</ui> -->
	            	<!-- <span style="margin: 0px 112px;">Regular Expense</span>
	            	<span style="margin: 0px -12px;">EMI</span>
	            	<span style="margin: 0px 197px;">Premiums</span>
	            	<span style="margin: 0px -53px;">Total Expense</span>
	            	<br/><br/> -->
	            	<!-- <ui class="clearfix reset ">
	            		<li class="fl head" style="float: left;width:100px !important;margin:0px 5px !important;"> Surplus :</li>
	            		<li class="fl" style="float: left;"><input type="text" style="width: 184px !important;" class="common_input2" readonly="readonly" name="surplus" value=""></li>
	            	</ui> -->
	          
	                    
            
            	 
			</div>
			
			</div>
			
		
			
			
  <section class="common_footer_actions">
      <div class="row">
        <div class="col-sm-1 col-xs-3">
          <button class="btn btn-app btn-transparent btn-xs inactiveLink"> <i class="ace-icon fa fa-long-arrow-left bigger-240"></i> Back </button>
        </div>
        
        
        <div class="col-sm-10 col-xs-6">
          <div class="col-sm-1 col-xs-0"></div>
          <div class="col-sm-4 col-xs-4">
            <button class="btn btn-app btn-transparent btn-xs activeLink"> <i class="ace-icon fa fa-search bigger-200"></i> Analysis </button>
            <button class="btn btn-app btn-transparent btn-xs inactiveLink"> <i class="ace-icon fa fa-lightbulb-o bigger-200"></i> Suggestion </button>
            <button class="btn btn-app btn-transparent btn-xs inactiveLink"> <i class="ace-icon fa fa-hand-o-up bigger-200"></i> Action Plan </button>
          </div>
          <div class="col-sm-3 col-xs-4">
            <button class="btn btn-app btn-transparent btn-xs inactiveLink"> <i class="ace-icon fa fa-file-code-o bigger-200"></i>Add Notes </button>
            <button class="btn btn-app btn-transparent btn-xs inactiveLink"> <i class="ace-icon fa fa-newspaper-o bigger-200"></i>Add Doc </button>
          </div>
          <div class="col-sm-4 col-xs-4">
            <button class="btn btn-app btn-transparent btn-xs inactiveLink" onClick="addnote()"> <i class="ace-icon fa fa-save bigger-200"></i> Save </button>
            
           <li class="fl list"><a href="${pageContext.request.contextPath}/partner/datacollection/cash-flow/${partyId}" class="anch cancel"><span class="txt">Cancel</span></a></li>
        <%--     <li class="fl list"><a href="${pageContext.request.contextPath}/partner/datacollection/cash-flow/${partyId}" class="anch cancel"><span class="txt">Cancel</span></a></li> --%>
            <button class="btn btn-app btn-transparent btn-xs-two"> <i class="ace-icon fa fa-close bigger-200"></i> Back to <br/> Cashflow </button>
            <button class="btn btn-app btn-transparent btn-xs inactiveLink"> <i class="ace-icon fa fa-forward bigger-200"></i> Skip </button>
          </div>
          <div class="col-sm-1 col-xs-0"></div>
          <div class="col-sm-1 col-xs-0"></div>
        </div>
        <div class="col-sm-1 col-xs-3">
          <button class="btn btn-app btn-transparent btn-xs inactiveLink"> <i class="ace-icon fa fa-long-arrow-right bigger-240"></i> Next </button>
        </div>
      </div>
    </section>
	  
<!-- Wrapper ends--> 

<!-- <script>
$(document).ready(function(){
	$('.second_column').slimScroll();
});
</script> -->