
<%@page import="org.apache.commons.lang.StringUtils"%>
<%@page import="in.fiinfra.common.utility.GoalData"%>
<%@page import="in.fiinfra.cp.CommonUtils"%>
<%@page import="java.util.Calendar"%>
<%@page import="in.fiinfra.cp.common.CpConstants"%>
<%@page import="java.util.List"%>
<%@page import="in.fiinfra.cp.AssetData"%>
<%@page import="java.util.Map"%>
  <!-- Custom Selectbox starts -->
  <script>
  $(document).ready(function() {
  	$( "#tabs" ).tabs();
	$(function() {
     $( ".datepicker" ).datepicker({
	  dateFormat: "dd-M-yy",
      showOn: "button",
	  buttonText: '',
	  changeMonth: true,
      changeYear: true
     });
	  $( ".ui-datepicker-trigger" ).wrap( "<div class='datepicker-trigger-parent'></div>" );
  });
  
   /*  $("select").selectBoxIt(); */
	 // Calls the selectBoxIt method on your HTML select box
	 
 
});
</script>
  <!-- Custom Selectbox Ends -->
  <script>
$(document).ready(function(){

  $(".selectboxit-container ").click(function(){
    //$('#personal_details_accordian').perfectScrollbar("update");
	//$('#contact_details_accordian').perfectScrollbar("update");
//	$('.family_details').perfectScrollbar("update");
	});
	 $(".thumb_select_ul a").click(function(){
		//alert("hi");
    $(this).children(".categoery").toggleClass("applicable");
}) 
}) 
</script>

  <!-- custom scroll to "common_in_content" -->
  <script>
$(document).ready(function(){
	  //Tracker Details Rating value Slider
	  createSlider('#Conversion_Probability',0,100,1,"#C_P_Value")
	  createSlider('#opportunity_rating',1,3,1,"")
	  
	  
  });

</script>
  <!-- custom scroll to "common_in_content" -->

  <script>
  $(function() {
    $( "#Profile_Info_Tab" ).accordion({
		heightStyle: "content",
    autoHeight: false,
    clearStyle: true, 
		
		});
	
	 // Preferred Product Count Intlalized	
	var count=3;
	
	//Add Button Starts
  $(".family_details").on("click", ".add", function() {
	   $(this).fadeOut();
	   count++;
	   
	$(this).prev(".close").fadeIn();
	
	$(this).parent().closest("ul").after("<ul class='reset clearfix Family_Details_col clearfix'><li class='clearfix li_one'><input name='input' type='text' class='common_input' placeholder='First Name'/></li><li class='clearfix li_two'><input name='input' type='text' class='common_input' placeholder='Last Name'/></li><li class='clearfix li_three'><input id='birth_date"+count+"' name='input' type='text' placeholder='dd-mmm-yyyy' class='birth_date common_input5 datepicker' disabled/></li><li class='clearfix li_five'><select name='category2'><option>Select</option><option>Father</option><option>Mother</option><option>Wife</option><option>Son</option></select></li><li class='clearfix li_six'><span class='common_input3'></span><div class='close'>x</div><div class='add'>+</div></li></ul>");
	   //Preferred Product Count Written
	 $("select").selectBoxIt();
	 // createSlider("#your_age"+count,0,100,1,"#age"+count);

  
   $( ".ui-datepicker-trigger" ).wrap( "<div class='datepicker-trigger-parent fl'></div>" );
     
	  $('.EP_cnt').perfectScrollbar('update');
	 
	  
	});

  });
  </script>
  <script>
  function showGraph(){
		// var data =  getIncomeData();
		if(data.length>0){
		 drawChart(data);
		}
		else{
			$('#container').hide();
			$('#nodata').show();
		}
	 }
  
 /*  $(document).ready(function(){
		
	    $(".data-graph-asset").slider({
	        min: 1,
	        max: 2,
	        step: 1,
	        slide: function (event, ui) {
	            //$("#data-graph .ui-slider-handle").empty();
	            if (ui.value == 1) {
	            	$("#data-graph .ui-slider-handle").css("margin-left", "2px");
	                //$("#data-graph .ui-slider-handle").css("margin-left", "2px");
	                $("#data-graph .ui-slider-handle").text("Data");
	                $("#inner-contents-graph").hide();
	                $("#my_assets").show();
	                $("#nodata").hide();
	                
				
	            } else if (ui.value == 2) {
	            	$("#data-graph .ui-slider-handle").css("margin-left", "-42px");
	               //$("#data-graph .ui-slider-handle").css("margin-left", "-42px");
	               $("#data-graph .ui-slider-handle").text("Graph");
	               $("#inner-contents-graph").show();
	               $("#my_assets").hide();
	               
	               showGraph();

	               //RenderPieChart('container', data); 
	            }
	        }
	    });
	    $("#data-graph .ui-slider-handle").css("margin-left", "2px");
	    $("#data-graph .ui-slider-handle").text("Data");
	    $("#inner-contents-graph").hide();
		

		
	  }); */
  </script>
  
  <script>
  
  
  var data = ${graphData};


  function drawChart(graphData) {
	  var options = {
			  title: 'My Assets',
		      backgroundColor: { fill:'transparent' },
		      width:600,
		      height:400,
		      colors:GRAPH_COLORS,
		      legend : {width:100, textStyle: {fontSize: 12}},
		      pieSliceText: 'percentage',
		      chartArea: { left: 150, top: 10, width: "80%", height: "100%"},
		        backgroundColor: { stroke: "#5A5A5A", strokeWidth: 2},

		        // add this line
		        pieSliceBorderColor : "#5A5A5A"
		    };
		    
		    showGooglePieChart('Asset',data,options,'container');

   }
  </script>
  <script>
  function communicateIFA(key){
  /* showConfirm("Are you sure; you want to communicate amount change to your IFA?", function() {
		window.location.href="${pageContext.request.contextPath}/portfolio/sendToIFA?ifa="+key;
	}); */
  
  bootbox.confirm("Are you sure; you want to communicate amount change to your IFA?", function(result) {
		if(result==true)
			{
			window.location.href="${pageContext.request.contextPath}/portfolio/sendToIFA?ifa="+key;
			}
		else
			{
			
			}
		  /* Example.show("Confirm result: "+result); */
		}); 
  
  }
  </script>
  
<script>

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
				$("#inner-contents-graph").hide();
				$("#my_assets").show();
				}
			else
				{
				$("#my_assets").hide();
				$("#inner-contents-graph").show();
				 showGraph();
				}
		});
	})

</script>
  
<!-- end of "header" id -->
<!-- end of "nav-menu" id -->

<%-- <div>
  
   <!--  <legend>MY ASSETS</legend> -->
    <!--<a href="#" class="my-asset-btn clearfix fr"><img src="../images/transparent.png" />My Assets</a>-->
    <a href="${pageContext.request.contextPath}/portfolio/myLoan"  class="my-loan-btn clearfix fr"><img src="${pageContext.request.contextPath}/resources/images/transparent.png"/>My Loans</a> </div> --%>
<!-- end of "header-strip" id -->
<br/><br/>


<!-- end of "inner-shadow-strip" id -->
<% Map<String,List<AssetData>> map= (Map<String,List<AssetData>>)request.getAttribute("mapAsset"); %>
<div id="contents">
 <!-- <div id="data-graph-bx">
      <div id="data-graph" class="common_sliding_radio data-graph-asset"> <span class="lbl_first lbl">Data</span> <span class="lbl_second lbl">Graph</span> </div>
      <div class="clr"></div>
    </div>  --><!-- <br/><br/> -->

	<span class="col-sm-1 fr"> <label class="pull-right inline">
		 <input	id="id-button-borders" checked="" type="checkbox" class="ace ace-switch ace-switch-5" /> <span class="lbl middle"></span>
	</label>
	</span>
	<br>

	<section class="in_content clearfix" id="my_assets">
    <div style="padding:10px 10px 0;">
      	<div class="tabbable">
											<ul class="nav nav-tabs" id="myTab4">
												<li class="active">
													<a data-toggle="tab" href="#tabs-1">Bank Deposit</a>
												</li>

												<li>
													<a data-toggle="tab" href="#tabs-2">Retirement Fund</a>
												</li>

												<li>
													<a data-toggle="tab" href="#tabs-3">Mutual Fund</a>
												</li>
												<li >
													<a data-toggle="tab" href="#tabs-4">Gold</a>
												</li>

												<li>
													<a data-toggle="tab" href="#tabs-5">Property</a>
												</li>

												<li>
													<a data-toggle="tab" href="#tabs-6">Stock</a>
												</li>
											</ul>
      
      
      <div class="tab-content">
        <div id="tabs-1" class="tab-pane in active"> 
        <!--title starts-->
      	
        <div class="sen_msg_txt fl"> You have declared <span class="fa fa-inr fa-2x sen_msg" ><%=request.getAttribute("deposits")!=null? CommonUtils.formatAmountINR((Double) request.getAttribute("deposits")):"0" %></span> <span ></span> of  <span class="sen_msg_txtm">Bonds, Deposits, Others</span> in Financial Plan</div>
        <div class="topmenu pull-right">
         <a href="#" onclick="communicateIFA('deposits')" class="btn-primary btn-xs btn"> Communicate change in amount to your IFA</a>
         </div>
       	<br><br><br>
       
        <div class="my_fd_title_main_title">Fixed Deposits</div>
        <!-- <div class="my_fd_title_bx">
            <ul>
            <li class="input_title_one fl">Owner</li>
            <li class="input_title_two fl">Commence-<br>
                ment Date</li>
            <li class="input_title_three fl">Maturity Date</li>
            <li class="input_title_four fl">Amt Deposited</li>
            <li class="input_title_five fl">Maturity Value</li>
            <li class="input_title_six fl">Bank Name</li>
            no account data for FD and RD
             <li class="input_title_six_two fl">Account No</li>
            li class="input_title_eight fl">FD Receipt No</li
            <li class="input_title_eight_two fl">Linked Goals</li>
            <li class="input_title_nine fl">Edit</li>
            
            <div class="clr"></div>
          </ul>
          </div> -->
					<div style="width: 100%; overflow-x: auto; overflow-y: auto;">
					<% List<AssetData> lstBankFixedDeposits=map.get("FD"); 
        if(lstBankFixedDeposits!=null){%>
						<table class="ListTable table table-striped table-bordered table-hover center">
							<thead>
									<tr align="left">
									<th width="10%">Owner</th>
									<th width="10%">Commence<br/>ment Date</th>
									<th width="10%">Maturity Date</th>
									<th width="7%">Amt Deposited</th>
									<th width="7%">Maturity Value</th>
									<th width="7%">Bank Name</th>
								No Account Data For FD And RD
									
									<th width="8%">Account No</th>
									<th width="9%">FD Receipt<br/>No</th>
									<th width="8%">Linked Goals</th>
									<th width="7%" class="hidden-480">Actions</th>
								</tr>
							</thead>
							<!--title ends-->
							<!--txt starts-->



				<tbody>

							
							
								<%
        	for(AssetData a:lstBankFixedDeposits){
        %>

								
								<%-- 	<ul>
										<li class="input_txt_one fl"><%=a.getOwnerParty() %></li>
										<li class="input_txt_two fl"><%=CommonUtils.format(a.getInvestmentDate(), "dd-MMM-yyyy") %>
										</li>
										<li class="input_txt_three fl"><%=CommonUtils.format(a.getMaturityDate(), "dd-MMM-yyyy") %>
										</li>
										<li class="input_txt_four fl"><%=CommonUtils.formatAmountINR(a.getInvestmentValue(),true) %>
										</li>
										<li class="input_txt_five fl"><%=CommonUtils.formatAmountINR(a.getMaturityAmount(),true) %>
										</li>
										<li class="input_txt_six fl"><%=CommonUtils.emptyIfNull(a.getBankName()) %></li>
										<li class="input_txt_six_two fl"><%=CommonUtils.emptyIfNull(a.getAccountFolioNo()) %></li>
										<!-- li class="input_txt_eight fl"><%=CommonUtils.emptyIfNull(a.getAccountPolicyNo()) %>
                </li-->
										 <li class="input_txt_eight_two fl">
                <div class="my_portfolio_grt_bx"> 
                     <% for(GoalData g:a.getGoals()){ %>
                	<div class="small_<%=g.getGoalTypeId()%>_icon"> </div>  
                <%} %> 
                
                <div class="clr"></div></div> </li>
										<li class="input_txt_nine fl"><a
											href="${pageContext.request.contextPath}/portfolio/asset/addUpdate/?assetClassId=<%=CpConstants.BANK_DEPOSIT_FD %>&assetId=<%=a.getPartyAssetId() %>"
											class="my_asset_edit_row" " class="my_asset_edit_row"> </a></li>

										<div class="clr"></div>
									</ul> --%>
									
									<tr align="left">
			   
				<td><%=a.getOwnerParty() %></td>
				<td><%=CommonUtils.format(a.getInvestmentDate(), "dd-MMM-yyyy") %></td>
			    <td><%=CommonUtils.format(a.getMaturityDate(), "dd-MMM-yyyy") %></td>
				<td><%=CommonUtils.formatAmountINR(a.getInvestmentValue(),true) %></td>
				<td><%=CommonUtils.formatAmountINR(a.getMaturityAmount(),true) %></td>
				<td><%=CommonUtils.emptyIfNull(a.getBankName()) %></td>
				<td><%=CommonUtils.emptyIfNull(a.getAccountFolioNo()) %></td>
				<td><%=CommonUtils.emptyIfNull(a.getAccountPolicyNo()) %></td>
				<td><% for(GoalData g:a.getGoals()){ %>
                	<div class="small_<%=g.getGoalTypeId()%>_icon"> </div>  
                <%} %> </td>
               	<td>
				<div >
				<a class="fa fa-pencil fa-lg has-tip [tip-top tip-bottom tip-left tip-right] [radius round]" data-options="show_on:large" title="Click here to Edit" href="${pageContext.request.contextPath}/portfolio/asset/addUpdate/?assetClassId=<%=CpConstants.BANK_DEPOSIT_FD %>&assetId=<%=a.getPartyAssetId() %>"></a>
				<a class="fa fa-trash fa-lg has-tip [tip-top tip-bottom tip-left tip-right] [radius round]" data-options="show_on:large" title="Click here to Delete"  href="${pageContext.request.contextPath}/portfolio/asset/delete/?assetClassId=<%=CpConstants.BANK_DEPOSIT_FD %>&assetId=<%=a.getPartyAssetId() %>" onclick="return myConfirm(this.href);"></a>
			</div>
				</td>							

				
			</tr>
						<% }%>
		<%}else{ %>
      
        
        <div class="no_data_message" align="center">No Data</div> 
      
      <%} %>

</tbody>
</table>





							<!--*----------Recurring Deposits--------------*-->
							<div class="my_fd_title_main_title">Recurring Deposits</div>
							<!--title starts-->
						<!-- 	<div class="my_rd_title_bx">
								<ul>
									<li class="input_title_one fl">Owner</li>
									<li class="input_title_two fl">Commence-<br> ment
										Date
									</li>
									<li class="input_title_three fl">Maturity Date</li>
									<li class="input_title_four fl">Monthly Deposit</li>
									<li class="input_title_five fl">Bank Name</li>
									<li class="input_title_five_two fl">Account No</li>

									<li class="input_title_seven fl">Interest Rate %</li>
									<li class="input_title_seven_two fl">Linked Goals</li>
									<li class="input_title_eight fl">Edit</li>

									<div class="clr"></div>
								</ul>
							</div> -->
							<% List<AssetData> lstBankRecurringDeposits=map.get("RD"); 
        if(lstBankRecurringDeposits!=null){
        	%>
								<table class="ListTable table table-striped table-bordered table-hover">
							<thead>
									<tr align="left">
									<th width="10%">Owner</th>
									<th width="10%">Commence<br/>ment Date</th>
									<th width="10%">Maturity Date</th>
									<th width="7%">Monthly Deposit</th>
									<th width="7%">Bank Name</th>
									<th width="8%">Account No</th>
									<th width="9%">Interest Rate %</th>
									<th width="8%">Linked Goals</th>
									<th width="7%" class="hidden-480">Actions</th>
								</tr>
							</thead>
							<!--title ends-->
							<!--txt starts-->

							<%-- <% List<AssetData> lstBankRecurringDeposits=map.get("RD"); 
        if(lstBankRecurringDeposits!=null){
        	%>
							<div class="my_rd_li_bx first_row">
								<%
        	for(AssetData a:lstBankRecurringDeposits){
        %>
								<div class="my_rd_li_bx_in">
									<ul>
										<li class="input_txt_one fl"><%=a.getOwnerParty() %></li>
										<li class="input_txt_two fl"><%=CommonUtils.format(a.getInvestmentDate(), "dd-MMM-yyyy") %>
										</li>
										<li class="input_txt_three fl"><%=CommonUtils.format(a.getMaturityDate(), "dd-MMM-yyyy") %>
										</li>
										<li class="input_txt_four fl"><%=CommonUtils.formatAmountINR(a.getSipAmount(),true) %></li>
										<li class="input_txt_five fl"><%=CommonUtils.emptyIfNull(a.getBankName()) %></li>
										<li class="input_txt_five_two fl"><%=CommonUtils.emptyIfNull(a.getAccountPolicyNo()) %></li>
										<li class="input_txt_seven fl"><%=a.getInterestRate() %></li>
										<li class="input_txt_seven_two fl">
                <div class="my_portfolio_grt_bx"> 
                     <% for(GoalData g:a.getGoals()){ %>
                	<div class="small_<%=g.getGoalTypeId()%>_icon"> </div>
                <%} %> 
                <div class="clr"></div></div> </li>
										<li class="input_txt_eight fl"><a
											href="${pageContext.request.contextPath}/portfolio/asset/addUpdate/?assetClassId=<%=CpConstants.BANK_DEPOSIT_RD %>&assetId=<%=a.getPartyAssetId() %>"
											class="my_asset_edit_row" class="my_asset_edit_row"> </a></li>

										<div class="clr"></div>
									</ul>
								</div>
								<%}%>
							</div>
							<%
        
        }   else{%>
							<div class="no_data_message">No Data</div>
							<%} %>
 --%>
 
 
 
 
 
 		<tbody>

							
						
								<%
        	for(AssetData a:lstBankRecurringDeposits){
        %>

									
										<tr align="left">
			   
				<td><%=a.getOwnerParty() %></td>
				<td><%=CommonUtils.format(a.getInvestmentDate(), "dd-MMM-yyyy") %>
					</td>
			    <td><%=CommonUtils.format(a.getMaturityDate(), "dd-MMM-yyyy") %></td>
				<td><%=CommonUtils.formatAmountINR(a.getSipAmount(),true) %></td>
				<td><%=CommonUtils.emptyIfNull(a.getBankName()) %></td>
				<td><%=CommonUtils.emptyIfNull(a.getAccountPolicyNo()) %></td>
				<td><%=a.getInterestRate() %></td>
				 <% for(GoalData g:a.getGoals()){ %>
                	<%=g.getGoalTypeId()%>_icon">
                <%} %> 
                <td></td>
               
				<td>
				<div>
						
								<a class="fa fa-pencil fa-lg has-tip [tip-top tip-bottom tip-left tip-right] [radius round]" data-options="show_on:large" title="Click here to Edit" href="${pageContext.request.contextPath}/portfolio/asset/addUpdate/?assetClassId=<%=CpConstants.BANK_DEPOSIT_RD %>&assetId=<%=a.getPartyAssetId() %>"></a>&nbsp;&nbsp;
					
								<a class="fa fa-trash fa-lg has-tip [tip-top tip-bottom tip-left tip-right] [radius round]" data-options="show_on:large" title="Click here to Delete" href="${pageContext.request.contextPath}/portfolio/asset/delete/?assetClassId=<%=CpConstants.BANK_DEPOSIT_FD %>&assetId=<%=a.getPartyAssetId() %>" onclick="return myConfirm(this.href);"></a>
						

						</div>
				</td>
				
			</tr>
						<% }%>
		<%}else{ %>
      
        
        <div class="no_data_message" align="center">No Data</div> 
      
      <%} %>

</tbody>
</table>
 
 

							<!-- txt ends-->

							<!--*----------Savings Account--------------*-->
							<div class="my_fd_title_main_title">Savings</div>
							<!--title starts-->
							<!-- <div class="my_savings_title_bx clearfix">
								<ul>
									<li class="input_title_one fl">Owner</li>
									<li class="input_title_two fl">Current Balance</li>
									<li class="input_title_three fl">Bank Name</li>
									<li class="input_title_three_two fl">Account No</li>
									<li class="input_title_four fl">Edit</li>


								</ul>
							</div> -->
							<% List<AssetData> lstBankSavings=map.get("SAVING"); 
        if(lstBankSavings!=null){
        	%>
							<table class="ListTable table table-striped table-bordered table-hover">
							<thead>
									<tr align="left">
									<th width="10%">Owner</th>
									<th width="10%">Current Balance</th>
									<th width="7%">Bank Name</th>
									<th width="8%">Account No</th>
									<th width="7%" class="hidden-480">Actions</th>
								</tr>
							</thead>
							<!--title ends-->
							<!--txt starts-->

				<tbody>
							
							
								<%
        	for(AssetData a:lstBankSavings){
        %>
							<%-- 	<div class="my_savings_li_bx_in">
									<ul>
										<li class="input_txt_one fl"><%=a.getOwnerParty() %></li>
										<li class="input_txt_two fl"><%=CommonUtils.formatAmountINR(a.getCurrentValue(),true) %></li>
										<li class="input_txt_three fl"><%=CommonUtils.emptyIfNull(a.getBankName()) %></li>
										<li class="input_txt_three_two fl"><%=CommonUtils.emptyIfNull(a.getAccountNumber()) %></li>
										<li class="input_txt_four fl"><a
											href="${pageContext.request.contextPath}/portfolio/asset/addUpdate/?assetClassId=<%=CpConstants.BANK_DEPOSIT_SAVING %>&assetId=<%=a.getPartyAssetId() %>"
											class="my_asset_edit_row"> </a></li>

										<div class="clr"></div>
									</ul>
									<!-- txt ends-->
								</div> --%>
								
								
								
														<tr align="left">
			   
				<td><%=a.getOwnerParty() %></td>
				<td><%=CommonUtils.formatAmountINR(a.getCurrentValue(),true) %>
					</td>
			    <td><%=CommonUtils.emptyIfNull(a.getBankName()) %></td>
				<td><%=CommonUtils.emptyIfNull(a.getAccountNumber()) %></td>
				<%-- <td><a href="${pageContext.request.contextPath}/portfolio/asset/addUpdate/?assetClassId=<%=CpConstants.BANK_DEPOSIT_SAVING %>&assetId=<%=a.getPartyAssetId() %>"
											class="my_asset_edit_row"> </a></td> --%>
				<td class="">
				<div>
							
								<a class="fa fa-pencil fa-lg has-tip [tip-top tip-bottom tip-left tip-right] [radius round]" data-options="show_on:large" title="Click here to Edit" href="${pageContext.request.contextPath}/portfolio/asset/addUpdate/?assetClassId=<%=CpConstants.BANK_DEPOSIT_SAVING %>&assetId=<%=a.getPartyAssetId() %>"></a>&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								<a class="fa fa-trash fa-lg has-tip [tip-top tip-bottom tip-left tip-right] [radius round]" data-options="show_on:large" title="Click here to Delete" href="${pageContext.request.contextPath}/portfolio/asset/delete/?assetClassId=<%=CpConstants.BANK_DEPOSIT_FD %>&assetId=<%=a.getPartyAssetId() %>" onclick="return myConfirm(this.href);"></a>
							

						</div>
				</td>
           

				
			</tr>
<% }%>
		<%}else{ %>
      
        
        <div class="no_data_message" align="center">No Data</div> 
      
      <%} %>

</tbody>
</table>



							<!-- txt ends-->
                          <div class="topmenu pull-right">
							<a href="${pageContext.request.contextPath}/portfolio/asset/bankDeposit/?assetClassId=<%=CpConstants.BANK_DEPOSIT_FD%> " class="btn-primary btn-xs btn">
									Add More</a>
                           </div>
							<div class="clr"></div>
					</div>
					
					</div>
					
				
			
					<!-- Tabs 1 Ends--> 
        
        <!-- Tabs 2-->
        <div id="tabs-2" class="tab-pane"> 
        <!--title starts-->
      
         <div class="sen_msg_txt fl">You have declared <span class="fa fa-inr fa-2x sen_msg"><%=request.getAttribute("dcRetirement")!=null?CommonUtils.formatAmountINR((Double)request.getAttribute("dcRetirement")):"0" %></span> <span ></span> of  <span class="sen_msg_txtm">Provident Fund, Pension, NPS and Others</span> in Financial Plan</div> 
         <div class="topmenu pull-right">
           <a href="#" onclick="communicateIFA('retirement')" class="btn-primary btn-xs btn"> Communicate change in amount to your IFA</a>
          </div><br><br><br>
        <div class="my_ppf_title_main_title">Public Provident Fund (PPF)</div>
     <!--    <div class="my_ppf_title_bx">
            <ul>
            <li class="input_title_one fl">Owner</li>
            <li class="input_title_two fl">Maturity Date</li>
            <li class="input_title_three fl">Accumulated Amt</li>
            <li class="input_title_four fl">Annual Contribution</li>
              <li class="input_title_four_two fl">Linked Goals</li>
            
            <li class="input_title_five fl">Edit</li>
            
            <div class="clr"></div>
          </ul>
          </div> -->
          
           <% List<AssetData> lstPPfs=map.get("PPF"); 
        if(lstPPfs!=null){%>
          
						<table class="ListTable table table-striped table-bordered table-hover">
							<thead>
									<tr align="left">
									<th width="10%">Owner</th>
									<th width="10%">Maturity Date</th>
									<th width="7%">Accumulated Amt</th>
									<th width="7%">Annual Contribution</th>
									<th width="7%">Linked Goals</th>
									<th width="7%" class="hidden-480">Actions</th>
								</tr>
							</thead>
        <!--title ends--> 
        <!--txt starts-->
        
        
       
        <%
        	for(AssetData a:lstPPfs){
        %>
        
         <%--    <div class="my_ppf_li_bx_in">
            <ul>
                <li class="input_txt_one fl"><%=a.getOwnerParty() %></li>
                <li class="input_txt_two fl"> <%=CommonUtils.format(a.getMaturityDate(),"dd-MMM-yyyy") %> </li>
                <li class="input_txt_three fl"><%=CommonUtils.formatAmountINR(a.getCurrentValue(),true) %> </li>
                <li class="input_txt_four fl"><%=CommonUtils.formatAmountINR(a.getSipAmount(),true) %></li>
                 <li class="input_txt_four_two fl"><div class="my_portfolio_grt_bx"> 
                 <% for(GoalData g:a.getGoals()){ %>
                	<div class="small_<%=g.getGoalTypeId()%>_icon"> </div>
                <%} %> 
                <div class="clr"></div></div></li>
                <li class="input_txt_five fl"><a href="${pageContext.request.contextPath}/portfolio/asset/addUpdate/?assetClassId=<%=CpConstants.RETIREMENT_FUND_PPF %>&assetId=<%=a.getPartyAssetId() %>" class="my_asset_edit_row"> </a> </li>
                
              </ul>
            <!-- txt ends--> 
            
          </div> --%>
          
          
          	<tr align="left">
			   
				<td><%=a.getOwnerParty() %></td>
				<td><%=CommonUtils.format(a.getMaturityDate(),"dd-MMM-yyyy") %>
					</td>
			    <td><%=CommonUtils.formatAmountINR(a.getCurrentValue(),true) %></td>
				<td><%=CommonUtils.formatAmountINR(a.getSipAmount(),true) %></td>
				<td>  <% for(GoalData g:a.getGoals()){ %>
                	<%=g.getGoalTypeId()%>_icon"> 
                <%} %></td>
				
               
               <td>
               <div>
					<a class="fa fa-pencil fa-lg has-tip [tip-top tip-bottom tip-left tip-right] [radius round]" data-options="show_on:large" title="Click here to Edit"  href="${pageContext.request.contextPath}/portfolio/asset/addUpdate/?assetClassId=<%=CpConstants.RETIREMENT_FUND_PPF %>&assetId=<%=a.getPartyAssetId() %>"></a>&nbsp;&nbsp;
					<a class="fa fa-trash fa-lg has-tip [tip-top tip-bottom tip-left tip-right] [radius round]" data-options="show_on:large" title="Click here to Delete"  href="${pageContext.request.contextPath}/portfolio/asset/delete/?assetClassId=<%=CpConstants.BANK_DEPOSIT_FD %>&assetId=<%=a.getPartyAssetId() %>" onclick="return myConfirm(this.href);"></a>
				</div>
               </td>
		</tr>
         <% }%>
		<%}else{ %>
      
        
        <div class="no_data_message" align="center">No Data</div> 
      
      <%} %>

</tbody>
</table>
         
        <!--*----------Employees Provident Funds --------------*-->
         
        <div class="my_epf_title_main_title">Others</div>
        <!--title starts-->
      <!--   <div class="my_epf_title_bx">
            <ul>
            <li class="input_title_one fl">Owner</li>
            <li class="input_title_five fl">Description</li>
            <li class="input_title_two fl">Retirement Year</li>
            <li class="input_title_three fl">Accumulated Amt</li>
            <li class="input_title_four fl">Monthly Contribution</li>
            <li class="input_title_six fl">Edit</li>
            
            <div class="clr"></div>
          </ul>
          </div> -->
          <% List<AssetData> lstEPfs=map.get("EPF"); 
        if(lstEPfs!=null){%> 
          <table class="ListTable table table-striped table-bordered table-hover">
							<thead>
									<tr align="left">
									<th width="10%">Owner</th>
									<th width="10%">Description</th>
									<th width="7%">Retirement Year</th>
									<th width="7%">Accumulated Amt</th>
									<th width="7%">Monthly Contribution</th>
									<th width="7%" class="hidden-480">Actions</th>
								</tr>
							</thead>
        
        <!--title ends--> 
        <!--txt starts-->
             <tbody>
      
        
        <%
        	for(AssetData a:lstEPfs){
        %>
       
           <%--  <div class="my_epf_li_bx_in">
            <ul>
                <li class="input_txt_one fl"><%=a.getOwnerParty() %></li>
                <li class="input_txt_five fl"><%= a.getDescription() %><div class="my_portfolio_grt_bx">                                
                <div class="clr"></div></div></li>
                <li class="input_txt_two fl"> <%=a.getRetirementYear() %> </li>
                <li class="input_txt_three fl"><%=CommonUtils.formatAmountINR(a.getCurrentValue(),true) %></li>
                <li class="input_txt_four fl"><%=CommonUtils.formatAmountINR(a.getSipAmount(),true) %></li>
                
                
                <li class="input_txt_six fl"><a href="${pageContext.request.contextPath}/portfolio/asset/addUpdate/?assetClassId=<%=CpConstants.RETIREMENT_FUND_EPF %>&assetId=<%=a.getPartyAssetId() %>" class="my_asset_edit_row"> </a> </li>
                
              </ul>
            <!-- txt ends--> 
            </div>
         <%}%>
          </div>
          <%
        
        } else{%>
          <!-- <div class="no_data_message">No Data</div> -->
         <%} %> --%>
          	<tr align="left">
			   
				<td><%=a.getOwnerParty() %></td>
				<td><%= a.getDescription() %><div class="my_portfolio_grt_bx">
					</td>
			    <td><%=a.getRetirementYear() %></td>
				<td><%=CommonUtils.formatAmountINR(a.getCurrentValue(),true) %></td>
				<td> <%=CommonUtils.formatAmountINR(a.getSipAmount(),true) %></td>
				
               
									<td>
										<div >
							
												<a class="fa fa-pencil fa-lg has-tip [tip-top tip-bottom tip-left tip-right] [radius round]" data-options="show_on:large" title="Click here to Edit"  href="${pageContext.request.contextPath}/portfolio/asset/addUpdate/?assetClassId=<%=CpConstants.RETIREMENT_FUND_EPF %>&assetId=<%=a.getPartyAssetId() %>"></a>&nbsp;&nbsp;
												<a class="fa fa-trash fa-lg has-tip [tip-top tip-bottom tip-left tip-right] [radius round]" data-options="show_on:large" title="Click here to Delete"  href="${pageContext.request.contextPath}/portfolio/asset/delete/?assetClassId=<%=CpConstants.BANK_DEPOSIT_FD %>&assetId=<%=a.getPartyAssetId() %>" onclick="return myConfirm(this.href);"></a>
										</div>
									</td>
								</tr>
         <%
         	}
         %>
		<%
			}else{
		%>


<div class="no_data_message" align="center">No Data</div> 
  <%} %>

</tbody>
</table>

         
         
         
     
        
        <!-- txt ends--> 
         <div class="topmenu pull-right">
							<a href="${pageContext.request.contextPath}/portfolio/asset/retirementFund/?assetClassId=<%=CpConstants.RETIREMENT_FUND_EPF%> " class="btn-primary btn-xs btn">
									Add More</a>
                           </div>
        
        <div class="clr"></div>
        
      </div>
        <!-- Tabs 2 Ends--> 
        
        <!-- Tabs 3-->
        <div id="tabs-3" class="tab-pane"> 
        <!--title starts-->
       
         <div class="sen_msg_txt fl">You have declared <span class="fa fa-inr fa-2x sen_msg"><%=request.getAttribute("dcMF")!=null? CommonUtils.formatAmountINR((Double)request.getAttribute("dcMF")):"0" %></span> <span ></span> of  <span class="sen_msg_txtm" >Mutual Fund</span> in Financial Plan</div>
         <div class="topmenu pull-right">
          <a href="#" onclick="communicateIFA('mf')" class="btn-primary btn-xs btn"> Communicate change in amount to your IFA</a>
         </div><br><br><br>
      <!--   <div class="my_mf_title_bx">
            <ul>
            <li class="input_title_one fl">Owner</li>
            <li class="input_title_two fl">Folio No</li>
            <li class="input_title_three fl">Fund Name</li>
            <li class="input_title_four fl">Units</li>
            <li class="input_title_five fl">SIP Amount</li>
            <li class="input_title_six fl">SIP Date</li>
             <li class="input_title_six_two fl">Linked Goals</li>
            <li class="input_title_seven fl">Edit</li>
           
            <div class="clr"></div>
          </ul>
          </div> -->
          
         
          <div class="my_fd_title_main_title">Mutual Fund</div>
           <% List<AssetData> lstMFs=map.get("MF"); 
        if(lstMFs!=null){%>
          <table class="ListTable table table-striped table-bordered table-hover">
							<thead>
									<tr align="left">
									<th width="10%">Owner</th>
									<th width="10%">Folio No</th>
									<th width="7%">Fund Name</th>
									<th width="7%">Units</th>
									<th width="7%">SIP Amount</th>
									<th width="7%">SIP Date</th>
									<th width="7%">Linked Goals</th>
									<th width="7%" class="hidden-480">Actions</th>
								</tr>
							</thead>
        <!--title ends--> 
        
        <!--*----------Mutual Funds --------------*-->
        
        
        <tbody>
         
        
        <%
        	for(AssetData a:lstMFs){
        %>
            <!--txt starts-->
            
    <%--         <div class="my_mf_li_bx_in">
            <ul>
                <li class="input_txt_one fl"><%=a.getOwnerParty() %></li>
                <li class="input_txt_two fl"> <%=CommonUtils.emptyIfNull(a.getAccountFolioNo()) %> </li>
                <li class="input_txt_three fl"><%=CommonUtils.emptyIfNull(a.getProductName()) %></li>
                <li class="input_txt_four fl"><%=a.getTotalUnitsQty() %></li>
                <li class="input_txt_five fl"><%= CommonUtils.formatAmountINR(a.getSipAmount(), true) %></li>
                <li class="input_txt_six fl"><%=CommonUtils.emptyIfNull(CommonUtils.format(a.getSipStartDate(), "dd"))  %></li>
                <li class="input_txt_six_two fl">
                <div class="my_portfolio_grt_bx">
                <% for(GoalData g:a.getGoals()){ %>
                	<div class="small_<%=g.getGoalTypeId()%>_icon"> </div>  
                <%} %>
                <div class="clr"></div></div></li>
                
                <li class="input_txt_seven fl"><a href="${pageContext.request.contextPath}/portfolio/asset/addUpdate/?assetClassId=<%=CpConstants.MUTUAL_FUND %>&assetId=<%=a.getPartyAssetId() %>" class="my_asset_edit_row"> </a> </li>
               
              </ul>
              <div class="clr"></div>
          </div>
            
         <%}%>
          </div>
          <%
        
        }  else{%>
          <div class="no_data_message">No Data</div>
         <%} %>
           --%>
           
           
           	<tr align="left">
			   
				<td><%=a.getOwnerParty() %></td>
				<td><%=CommonUtils.emptyIfNull(a.getAccountFolioNo()) %>
					</td>
			    <td><%=CommonUtils.emptyIfNull(a.getProductName()) %></td>
				<td><%=a.getTotalUnitsQty() %></td>
				<td><%= CommonUtils.formatAmountINR(a.getSipAmount(), true) %></td>
				<td><%=CommonUtils.emptyIfNull(CommonUtils.format(a.getSipStartDate(), "dd"))  %></td>
				<td> <% for(GoalData g:a.getGoals()){ %>
                <%=g.getGoalTypeId()%>_icon">
                <%} %></td>
               
               <td>
               <div>
																<a class="fa fa-pencil fa-lg has-tip [tip-top tip-bottom tip-left tip-right] [radius round]" data-options="show_on:large" title="Click here to Edit"  href="${pageContext.request.contextPath}/portfolio/asset/mutualFund/?assetClassId=<%=CpConstants.MUTUAL_FUND %>&assetId=<%=a.getPartyAssetId() %>"></a>&nbsp;&nbsp;
																<a class="fa fa-trash fa-lg has-tip [tip-top tip-bottom tip-left tip-right] [radius round]" data-options="show_on:large" title="Click here to Delete"  href="${pageContext.request.contextPath}/portfolio/asset/delete/?assetClassId=<%=CpConstants.BANK_DEPOSIT_FD %>&assetId=<%=a.getPartyAssetId() %>" onclick="return myConfirm(this.href);"></a>
														

															
														</div>
               </td>
		</tr>
         <% }%>
		<%}else{ %>
		<div class="no_data_message" align="center">No Data</div>	

  <%} %>

</tbody>
</table>
           
           
           
           
          <div class="topmenu pull-right">
            <a href="${pageContext.request.contextPath}/portfolio/asset/mutualFund/?assetClassId=<%=CpConstants.MUTUAL_FUND%> " class="btn-primary btn-xs btn">Add More</a>
        </div>
        <div class="clr"></div>
        
      </div>
        <!-- Tabs 3 Ends--> 
        
        <!-- Tabs 4--> 
        <!--*----------Gold --------------*-->
        <div id="tabs-4" class="tab-pane"> 
        <!--title starts-->
         <div class="sen_msg_txt fl" >You have declared <span class="fa fa-inr fa-2x sen_msg"><%=request.getAttribute("dcGOLD")!=null?CommonUtils.formatAmountINR((Double) request.getAttribute("dcGOLD")):"0" %></span> <span ></span> of <span class="sen_msg_txtm">Gold</span> in Financial Plan</div>
         <div class="topmenu pull-right">
        <a href="#" onclick="communicateIFA('gold')" class="btn-primary btn-xs btn"> Communicate change in amount to your IFA</a>
		</div><br><br><br>
      <!--   <div class="my_gold_title_bx">
            <ul>
            <li class="input_title_one fl">Owner</li>
            <li class="input_title_two fl">Current Value</li>
            <li class="input_title_three fl">Yearly Investment</li>
            <li class="input_title_three_two fl">Linked Goals</li>
            
            <li class="input_title_four fl">Edit</li>
           
            <div class="clr"></div>
          </ul>
          </div> -->
           
          	<div class="my_fd_title_main_title">Gold</div>
          	<% List<AssetData> lstGolds=map.get("GOLD"); 
        if(lstGolds!=null){%>
          	<table class="ListTable table table-striped table-bordered table-hover">
							<thead>
									<tr align="left">
									<th width="10%">Owner</th>
									<th width="10%">Current Value</th>
									<th width="7%">Yearly Investment</th>
								
									<th width="7%">Linked Goals</th>
									<th width="7%" class="hidden-480">Edit</th>
								</tr>
							</thead>
							<!--title ends-->
							<!--txt starts-->



				<tbody>
        <!--title ends-->
        
       
        
       
        <%
        	for(AssetData a:lstGolds){
        %>
        
            <!--txt starts-->
            
         <%--    <div class="my_gold_li_bx_in">
            
            <ul>
                <li class="input_txt_one fl"><%=a.getOwnerParty() %></li>
                <li class="input_txt_two fl"><%=CommonUtils.formatAmountINR(a.getCurrentValue(),true) %></li>
                <li class="input_txt_three fl"><%=CommonUtils.formatAmountINR(a.getSipAmount(),true) %></li>
                <li class="input_txt_three_two fl"><div class="my_portfolio_grt_bx"> 
                
                                <% for(GoalData g:a.getGoals()){ %>
                	<div class="small_<%=g.getGoalTypeId()%>_icon"> </div>  
                <%} %>
                <div class="clr"></div></div></li>
                <li class="input_txt_four fl"><a href="${pageContext.request.contextPath}/portfolio/asset/addUpdate/?assetClassId=<%=CpConstants.GOLD %>&assetId=<%=a.getPartyAssetId() %>" class="my_asset_edit_row"> </a> </li>
               
              </ul>
          
            <!-- txt ends--> 
            <div class="clr"></div>
         </div> 
        <%}%>
          </div>
          </div>
          <%
        
        } else{%>
           <div class="no_data_message">No Data</div>
          <%} %>
            --%>
            
            
            
                	<tr align="left">
			   
				<td><%=a.getOwnerParty() %></td>
				<td><%=CommonUtils.formatAmountINR(a.getCurrentValue(),true) %>
					</td>
			    <td><%=CommonUtils.formatAmountINR(a.getSipAmount(),true) %></td>
				<td> <% for(GoalData g:a.getGoals()){ %>
                	<%=g.getGoalTypeId()%>_icon">iv>  
                <%} %></td>
               <td>
               <div>
																<a class="fa fa-pencil fa-lg has-tip [tip-top tip-bottom tip-left tip-right] [radius round]" data-options="show_on:large" title="Click here to Edit" href="${pageContext.request.contextPath}/portfolio/asset/addUpdate/?assetClassId=<%=CpConstants.GOLD %>&assetId=<%=a.getPartyAssetId() %>"></a>&nbsp;&nbsp;
																<a class="fa fa-trash fa-lg has-tip [tip-top tip-bottom tip-left tip-right] [radius round]" data-options="show_on:large" title="Click here to Delete" href="${pageContext.request.contextPath}/portfolio/asset/delete/?assetClassId=<%=CpConstants.BANK_DEPOSIT_FD %>&assetId=<%=a.getPartyAssetId() %>" onclick="return myConfirm(this.href);"></a>
														</div>
               </td>
		</tr>
         <% }%>
         </tbody>
         </table>
		<%}else{ %>

<div class="no_data_message" align="center">No Data</div>
  <%} %>


        <div class="topmenu pull-right">
        <a href="${pageContext.request.contextPath}/portfolio/asset/gold/?assetClassId=<%=CpConstants.GOLD%> " class="btn-primary btn-xs btn">Add More</a>
        </div>
        <div class="clr"></div>
       
          </div>
        
        <!--*----------Gold Ends --------------*--> 
        <!-- Tabs 4 Ends--> 
        
        <!-- Tabs 5--> 
        <!--*----------Property --------------*-->
        <div id="tabs-5" class="tab-pane"> 
        <!--title starts-->
         <div class="sen_msg_txt fl">You have declared<span class="fa fa-inr fa-2x sen_msg"><%=request.getAttribute("dcProperty") !=null? CommonUtils.formatAmountINR((Double)request.getAttribute("dcProperty")):"0"%></span> <span ></span> of <span class="sen_msg_txtm">Property</span> in Financial Plan</div>
         <div class="topmenu pull-right">
        <a href="#" onclick="communicateIFA('property')" class="btn-primary btn-xs btn"> Communicate change in amount to your IFA</a>
       </div><br><br><br>
       <!--  <div class="my_property_title_bx">
            <ul>
            <li class="input_title_one fl">Owner</li>
            <li class="input_title_two fl">Bought in the year</li>
            <li class="input_title_three fl">Current Value</li>
            <li class="input_title_four fl">Linked Goals</li>
            
            <li class="input_title_five fl">Edit</li>
            
            <div class="clr"></div>
          </ul>
          </div> -->
        <!--title ends-->
        
         
        
        <div class="my_fd_title_main_title">Property</div>
        <% List<AssetData> lstEstates=map.get("PROPERTY"); 
        if(lstEstates!=null){%>
        <table id="dynamic-table" class="table table-striped table-bordered table-hover">
												<thead>
														<tr align="left">
														<th class="hidden-480">Owner</th>
														<th class="hidden-480">Bought in the year</th>
														<th class="hidden-480">Current Value</th>
														<th class="hidden-480">Description</th>
														<th class="hidden-480">Edit</th>

														
													</tr>
												</thead>
        
        
        
        <tbody>
													
        
        
        <%
        	for(AssetData a:lstEstates){
        %>
            <!--txt starts-->
            
            <% Calendar c=Calendar.getInstance();
            c.setTime(a.getInvestmentDate());%>
            <%-- <div class="my_property_li_bx_in">
            <ul>
                <li class="input_txt_one fl"><%=a.getOwnerParty() %></li>
                <li class="input_txt_two fl"> <%=c.get(Calendar.YEAR) %> </li>
                <li class="input_txt_three fl"><%=CommonUtils.formatAmountINR(a.getCurrentValue(),true) %></li>
                 <li class="input_txt_four fl"><div class="my_portfolio_grt_bx">
                                 <% for(GoalData g:a.getGoals()){ %>
                	<div class="small_<%=g.getGoalTypeId()%>_icon"> </div>
                <%} %> 
                <div class="clr"></div></div></li>  
                <li class="input_txt_five fl"><a href="${pageContext.request.contextPath}/portfolio/asset/addUpdate/?assetClassId=<%=CpConstants.PROPERTY %>&assetId=<%=a.getPartyAssetId() %>" class="my_asset_edit_row"> </a> </li>
               
              </ul> --%>

									<tr align="left">
									<td class="hidden-480"><%=a.getOwnerParty()%></td>
									<td class="hidden-480"><%=c.get(Calendar.YEAR)%></td>
									<td class="hidden-480"><%=CommonUtils.formatAmountINR(a.getCurrentValue(),true)%></td>
									<td class="hidden-480"><%=a.getDescription()%></td>

									<td>
										<div >
											<a class="fa fa-pencil fa-lg has-tip [tip-top tip-bottom tip-left tip-right] [radius round]" data-options="show_on:large" title="Click here to Edit"href="${pageContext.request.contextPath}/portfolio/asset/addUpdate/?assetClassId=<%=CpConstants.PROPERTY %>&assetId=<%=a.getPartyAssetId() %>">
													</a>&nbsp;&nbsp;
											<a  class="fa fa-trash fa-lg has-tip [tip-top tip-bottom tip-left tip-right] [radius round]" data-options="show_on:large" title="Click here to Edit" href="${pageContext.request.contextPath}/portfolio/asset/delete/?assetClassId=<%=CpConstants.BANK_DEPOSIT_FD %>&assetId=<%=a.getPartyAssetId() %>" onclick="return myConfirm(this.href);">
												</a>
										


										</div>
									</td>

								</tr>



								<%
									}
								%>
          </tbody>
          </table>
            <!-- txt ends--> 
            
             
            
         
          
          
          <%
        
        } else{%>
       
       <div class="no_data_message" align="center">No Data</div>
          <%} %>
        <div class="topmenu pull-right">
       <a href="${pageContext.request.contextPath}/portfolio/asset/property/?assetClassId=<%=CpConstants.PROPERTY%> " class="btn-primary btn-xs btn">Add More</a>
        </div>
        <div class="clr"></div>
        
          </div>
        
        <!--*----------Property Ends --------------*--> 
        <!-- Tabs 5 Ends--> 
        
        <!-- Tabs 6--> 
        <!--*----------Property --------------*-->
        <div id="tabs-6" class="tab-pane"> 
        <!--title starts-->
        <div class="sen_msg_txt fl">You have declared <span class="fa fa-inr fa-2x sen_msg"><%=request.getAttribute("dcStock")!=null?CommonUtils.formatAmountINR((Double) request.getAttribute("dcStock")):"0" %></span> <span ></span> of <span class="sen_msg_txtm">Stock</span> in Financial Plan</div>
        <div class="topmenu pull-right">
        <a href="#" onclick="communicateIFA('stock')" class="btn-primary btn-xs btn"> Communicate change in amount to your IFA</a>
       </div><br><br><br>
              <!--  <div class="my_stock_title_bx">
            <ul>
            <li class="input_title_one fl">Owner</li>
            <li class="input_title_two fl">Stock Name</li>
            <li class="input_title_three fl">Quantity</li>
            <li class="input_title_four fl">Total Current Value</li>
            <li class="input_title_four_two fl">Linked Goals</li>
            <li class="input_title_five fl">Edit</li>
            
            <div class="clr"></div>
          </ul>
          </div> -->
        <!--title ends-->
        
         
       
        
        <div class="my_fd_title_main_title">Stock</div>
         <% List<AssetData> lstStocks=map.get("STOCK"); 
        int totalStockVal=0;
        if(lstStocks!=null){%>
        <table id="dynamic-table" class="table table-striped table-bordered table-hover">
												<thead>
														<tr align="left">
														<th class="hidden-480">Owner</th>
														<th class="hidden-480">Stock Name</th>
														<th class="hidden-480">Quantity</th>
														<th class="hidden-480">Total Current Value</th>
														<th class="hidden-480">Edit</th>
														
													</tr>
												</thead>
        
        <tbody>
        
        <%
        	for(AssetData a:lstStocks){
        		totalStockVal+=a.getCurrentValue();
        %>
            <!--txt starts-->
             <%-- <div class="white_bg">
            <div class="my_stock_li_bx_in">
            <ul>
                <li class="input_txt_one fl"><%=a.getOwnerParty() %></li>
                <li class="input_txt_two fl"><%=a.getAssetName() %></li>
                <li class="input_txt_three fl"><%=a.getTotalUnitsQty() %></li>
                <li class="input_txt_four fl"><%=CommonUtils.formatAmountINR(a.getCurrentValue(),true) %></li>
                <li class="input_txt_four_two fl"><div class="my_portfolio_grt_bx"> 
                                <% for(GoalData g:a.getGoals()){ %>
                	<div class="small_<%=g.getGoalTypeId()%>_icon"> </div>  
                <%} %>
                <div class="clr"></div></div></li>
                <li class="input_txt_five fl"><a href="${pageContext.request.contextPath}/portfolio/asset/addUpdate/?assetClassId=<%=CpConstants.STOCK %>&assetId=<%=a.getPartyAssetId() %>" class="my_asset_edit_row"> </a> </li>
                
              </ul>
          </div>
        <div class="clr"></div>
		 </div> --%>
            										<tr align="left">
														<td class="hidden-480"><%=a.getOwnerParty() %></td>
														<td class="hidden-480"><%=a.getAssetName() %></td>
														<td class="hidden-480"><%=a.getTotalUnitsQty() %></td>
														<td class="hidden-480"><%=CommonUtils.formatAmountINR(a.getCurrentValue(),true) %></td>
														<td>
														<div>
															

													
																<a class="fa fa-pencil fa-lg has-tip [tip-top tip-bottom tip-left tip-right] [radius round]" data-options="show_on:large" title="Click here to Edit"  href="${pageContext.request.contextPath}/portfolio/asset/addUpdate/?assetClassId=<%=CpConstants.STOCK %>&assetId=<%=a.getPartyAssetId() %>"></a>&nbsp;&nbsp;
														
																<a class="fa fa-trash fa-lg has-tip [tip-top tip-bottom tip-left tip-right] [radius round]" data-options="show_on:large" title="Click here to Delete" href="${pageContext.request.contextPath}/portfolio/asset/delete/?assetClassId=<%=CpConstants.BANK_DEPOSIT_FD %>&assetId=<%=a.getPartyAssetId() %>" onclick="return myConfirm(this.href);"></a>
													
															
														</div>
														</td>
													</tr>
													<%}%>
            </tbody>
         </table>
          <%
        
        } else{%>
           <div class="no_data_message" align="center">No Data</div>
          <%} %>
          
          <div class="sen_msg_txt">Total Stock Value  <span class="sen_msg_bld_txt">Rs <%=totalStockVal %> </span></div>
          <div class="topmenu pull-right">
           <a href="${pageContext.request.contextPath}/portfolio/asset/stock/?assetClassId=<%=CpConstants.STOCK%>" class="btn-primary btn-xs btn">Add More</a>
           </div>
        <div class="clr"></div>
        
      </div>
        
        <!--*----------Stock Ends --------------*--> 
        <!-- Tabs 6 Ends--> 
        
      </div>
      </div>
    <!-- end of "contents" id -->
  </div>
  </section>
  <div id="nodata" style="display: none">
  <div class="clr"></div>
     <div class="no_data_message">There is no Asset Defined by you</div>
  </div>
  <div id="inner-contents-graph" class="clearfix fl">
        	<div class="margin-box clearfix fl">
           <div id="container" style="min-width: 500px; height: 500px; margin: 0 auto"></div>
     </div>     
        </div>
  
 </div>
 