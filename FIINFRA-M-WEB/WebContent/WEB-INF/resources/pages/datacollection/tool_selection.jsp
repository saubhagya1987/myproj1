<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<!--<meta name="viewport" content="width=device-width,initial-scale=1">-->
<title>Tool Selection</title>
<style>
#confirmDCDialog { display: block; height: 150px; display: none; width: 355px; box-shadow: 0 0 15px 1px #757575; }
#confirmDCDialog .aa_down{ width: 255px !important;  }
</style>
<script>
	$(document).ready(function() {
		var dcToolId = '${selectedDCTool}';
		if (dcToolId == 522001) {
			$('#tool_selection .column_left').addClass('inactiveLink');			
			$('#tool_selection .column_middle .theme').addClass('selected');
		} else if (dcToolId == 522002) {
			$('#tool_selection .column_left').addClass('inactiveLink');
			$('#tool_selection .column_middle').addClass('inactiveLink');
			$('#tool_selection .column_right .theme').addClass('selected');
		} else if (dcToolId == 522003) {
			$('#tool_selection .column_left .theme').addClass('selected');
		}
			

	});

	function update(dcTool, dcfeeder) {
		var dcToolId = '${selectedDCTool}';
		/* if (dcTool == 522001 && dcfeeder.indexOf('PP') == 0)//Financial Planner
		{
			$(".overlay").fadeIn();
			$("#confirmDCDialog").fadeIn();
			$(".aa_up").html("You have selected Financial Planner - Basic Version. Please confirm your choice");
			$(".aa_yes").click(function() {
				confirm();
			});
		} */
		if (dcTool == 522003 && dcfeeder.indexOf('QD') == 0)//Financial Planner
		{
			$(".overlay").fadeIn();
			$("#confirmDCDialog").fadeIn();
			$(".aa_up").html("You have selected Financial Planner - Quick Financial Plan. Please confirm your choice");
			$(".aa_yes").click(function() {
				confirm();
			});
		} 
		else if (dcTool == 522001 && dcToolId==522003 && dcfeeder.indexOf('FPT') == 0)//Interactive Financial Planner - Detailed Version
		{
			$(".overlay").fadeIn();
			$("#confirmDCDialog").fadeIn();
			$(".aa_up").html("You have chosen to switch from Quick Financial Planner version to basic version. Please note you will not be able to switch back to Quick Financial Planner version. Please confirm your choice");
			$(".aa_yes").click(function() {
				confirm();
			});
		}
		else if (dcTool == 522001 && dcfeeder.indexOf('FPT') == 0)//Interactive Financial Planner
		{
			$(".overlay").fadeIn();
			$("#confirmDCDialog").fadeIn();
			$(".aa_up").html("You have selected Interactive Financial Planner - Basic Version tool. Please confirm your choice.");
			$(".aa_yes").click(function() {
				confirm();
			});
		}
		else if (dcTool == 522002 && dcToolId==0 && dcfeeder.indexOf('FPT Detailed') == 0)//Interactive Financial Planner - Detailed Version(already selected)
		{
			$(".overlay").fadeIn();
			$("#confirmDCDialog").fadeIn();
			$(".aa_up").html("You have selected	Interactive Financial Planner - Detailed Version. Please note you will not be able to switch back to Quick Financial Planner or basic versions. Please confirm your choice");
			$(".aa_yes").click(function() {
				confirm();
			});
		}
		else if (dcTool == 522002 && dcToolId==522001 && dcfeeder.indexOf('FPT Detailed') == 0)//Interactive Financial Planner - Detailed Version
		{
			$(".overlay").fadeIn();
			$("#confirmDCDialog").fadeIn();
			$(".aa_up").html("You have chosen to switch from basic version to detailed version. Please note you will not be able to switch back to basic versions. Please confirm your choice");
			$(".aa_yes").click(function() {
				confirm();
			});
		}
		else if (dcTool == 522002 && dcToolId==522002 && dcfeeder.indexOf('FPT Detailed') == 0)//Interactive Financial Planner - Detailed Version (already selected)
		{
			confirm();
		} 
		else if (dcTool == 522002 && dcToolId==522003 && dcfeeder.indexOf('FPT Detailed') == 0)//Interactive Financial Planner - Detailed Version
		{
			$(".overlay").fadeIn();
			$("#confirmDCDialog").fadeIn();
			$(".aa_up").html("You have chosen to switch from Quick Financial Planner version to detailed version. Please note you will not be able to switch back to Quick Financial Planner or basic versions. Please confirm your choice");
			$(".aa_yes").click(function() {
				confirm();
			});
		}
		
		function confirm() {
			window.location
			.replace("${pageContext.request.contextPath}/partner/updateDcTool?partyId=${contactPartyId}&name=${headerName}&recordType=${recordTypeId}&selectedDCTool="
					+ dcTool + "&dcToolFeeder=" + dcfeeder);
		}
		
	}

	function closeDialog() {
		$(".overlay").fadeOut("slow");
		$("#confirmDCDialog").fadeOut("slow");
	}
</script>
</head>

<body>
	<div id="tool_selection_main">
			<section class="content common_content">
				<%-- <jsp:include page="../layout/submenu_small.jsp"></jsp:include> --%>
				<section class="in_content clearfix" id="tool_selection">


					<!-- DC submenu Ends-->
					
						
										
					
					
					
						

											
													
													
													<div class="container-fluid">
															<div class="row">
															<div class="col-md-4">	
													<div class="column_left heightt">
														


							<div class="theme">
								<a href="#" class="thumb" onclick="update(522003,'QD');">
									<div style="top: 90px; left: 90px; position: absolute;">
										<img
											src="${pageContext.request.contextPath}/resources/images/basic_user.png" width="" height="" alt="">
									</div>

										</a>
							</div>
					

							<div class="title theme_color">Financial Planner - Quick Financial Plan</div>
							<div class="des">Planning tool to collect the data in Quick Way</div>
						</div>
						
							</div>
							
							
							<div class="col-md-4">										
						<div class="column_middle heightt">
						
							<div class="theme">
								<a href="#" class="thumb" onclick="update(522001,'FPT');">
									<div style="top: 80px; left: 110px; position: absolute;">
										<img
											src="${pageContext.request.contextPath}/resources/images/tab_icon.png" width="" height="" alt="">
									</div>

										</a>
							</div>
							

							<div class="title theme_color ">Interactive Financial Planner - Basic
								Version</div>
							<div class="des">An Interactive planning tool with flexible
								navigation to collect data at summary level including Income,
								expense, assets, liability & insurance information</div>

						</div>
						
							</div>
							
							
						<div class="col-md-4">	
						<div class="column_right clearfix heightt">
						
						
							<div class="theme">
								<a href="#" class="thumb" onclick="update(522002,'FPT Detailed');">
									<div style="top: 70px; left: 130px; position: absolute;">
										<img
											src="${pageContext.request.contextPath}/resources/images/advanced_user.png" width="" height="" alt="">
									</div>

											</a>
							</div>
							    

							<div class="title theme_color">Interactive Financial Planner - Detailed
								Version</div>
							<div class="des">An Interactive planning tool to capture
								Income, expense, assets, liability and insurance information in
								detail and allocate assets to specific goals at asset level.</div>

						</div>
						</div></div>
						</div>
						 
					
					
					<div id="confirmDCDialog" class="common_custom_modal_aa">
						<span class="close" onclick="closeDialog();">X</span>
						<div class="modal_content">
							<div class="aa_up" style="text-align: center; height:89px !important;">text</div>
							<div class="aa_down" id="yes">
								<a style="cursor: pointer;" onclick="doAction();" class="aa_yes">Confirm
								</a> <a style="cursor: pointer;" onclick="closeDialog();"
									class="aa_no">Cancel</a>
							</div>
						</div>
					</div>
					
				</section>
			</section>
			<div class="clr"></div>
		
	</div>
	<div class="overlay"></div>
</body>

</html>
