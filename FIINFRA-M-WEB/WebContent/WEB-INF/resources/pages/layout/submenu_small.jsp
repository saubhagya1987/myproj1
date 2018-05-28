<script>
$(document).ready(function(){
	var smallMenuLinks = "${smallMenuLinks}";
	var pieces = smallMenuLinks.split(",");
	if(pieces != ""){
		for(var i=0;i<pieces.length;i++){
			$("."+pieces[i]).attr("href","#");
			$("."+pieces[i]).addClass("inactiveLink");
			if(pieces[i].indexOf("save")>-1)
			{
				document.forms[0].action = "";
			}
		}
	}
	
});

function myConfiguration(){
	var nodeID = '${nodeId}';
	if(nodeID>0)
	{
		$("#successDialog").html("Please select partner first from Hierarchy");
		$( "#successDialog").dialog( "open" );
	}
	else{
	window.location.replace("${pageContext.request.contextPath}/partner/personal/info");
	};
}

function misReports(){
	var nodeID = '${nodeId}';
	if(nodeID>0)
	{
		$("#successDialog").html("Please select partner first from Hierarchy");
		$( "#successDialog").dialog( "open" );
		
	}
	else{
	window.location.replace("${pageContext.request.contextPath}/report/reports");
	};
}

</script>
<%-- 
<h4 class="heading">
												<a
													href="${pageContext.request.contextPath}/partner/dashboard?flag=0">Partner
													Dashboard</a>
											</h4>
											<div class="menu_section">
												<ul class="clearfix reset">
													<li class="menu my_config myConfigurationLink"><a
														href="#" onclick="myConfiguration();" class="anch"><span
															class="thumb"></span><span class="txt">My
																Configuration</span></a></li>
													<li class="menu goals goalsLink"><a
														href="${pageContext.request.contextPath}/partner/goals"
														class="anch"><span class="thumb"></span><span
															class="txt">Goals</span></a></li>
													<li class="menu contacts contactsLink"><a
														href="${pageContext.request.contextPath}/partner/contacts"
														class="anch"><span class="thumb"></span><span
															class="txt">Contacts</span></a></li>
													<li class="menu report misReportsLink"><a href="#"
														onclick="misReports();" class="anch"><span
															class="thumb"></span><span class="txt">MIS Reports</span></a></li>
													<li class="menu task taskLink"><a
														href="${pageContext.request.contextPath}/partner/tasklist"
														class="anch"><span class="thumb"></span><span
															class="txt">Tasks</span></a></li>
													<li class="menu query queryLink"><a
														href="${pageContext.request.contextPath}/query/list"
														class="anch"><span class="thumb"></span><span
															class="txt">Raise a Query</span></a></li>
													<li class="menu alert alertsLink"><a
														href="${pageContext.request.contextPath}/alert/showAlerts"
														class="anch"><span class="thumb"></span><span
															class="txt">Alerts</span></a></li>
													<li class="menu chat chatLink"><a
														href="${pageContext.request.contextPath}/partner/chat"
														class="anch"><span class="thumb"></span><span
															class="txt">Chat</span></a></li>
												</ul>
											</div> --%>




        
