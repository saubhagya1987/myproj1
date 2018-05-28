<%@page import="java.util.List"%>
<%@page import="in.fiinfra.common.common.TeamMemberData"%>
<%@page import="in.fiinfra.common.common.ProfileData"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<script>
	$(document).ready(
			function() {
				
				var rbsLinks = "${rbsLinks}";
				var pieces = rbsLinks.split(",");
				if(pieces != ""){
					for(var i=0;i<pieces.length;i++){
						if(pieces[i]=="saveMyProfileLink"){
							$("#profile-form").attr("action","#");
						}
						$("."+pieces[i]).attr("href","#");
						$("."+pieces[i]).addClass("inactiveLink");
					}
				}
				
				// my profile active link
				if ($("#my_pro_services_team").is(":visible")) {
					$(".my_profile_links li.seventh").addClass("active");
				}
                 $('.wrapper').addClass("my_profile_wrapper");
				// Calls the selectBoxIt method on your HTML select box	
				$("select").selectBoxIt();
				//	custom scroll 
				$('.data_content').slimScroll();
				// Calls the selectBoxIt method on your HTML select box	
				/* my_profile_links starts*/
				$(".my_profile_links .arrow").click(function() {

					slide();
				});

				function slide() {
					if ($(".my_profile_links .arrow").hasClass("push_in")) {
						$(".my_profile_links").animate({
							left : '-123px'
						});
						$(".my_profile_links .arrow").animate("slow")
								.removeClass("push_in");
					} else {
						$(".my_profile_links").animate({
							left : '0'
						});
						$(".my_profile_links .arrow").animate("slow").addClass(
								"push_in");
					}
				}
				/* my_profile_links ends*/

			});
</script>

<script>
	function saveProfile(action) {
		$('#action').val(action);
		$('#profile-form').submit();
	}
</script>

<!-- Common_in_contnet starts-->
<section class="in_content common_in_content clearfix my_profile_parent"
	id="my_pro_services_team">
	<div class="header_strip">My Assgined Service Team</div>
	<section id="service_team_details" class="clearfix">
		<div class="my_profile_links">
			<div class="arrow"></div>
			<ul class="reset clearfix">
				<li class="first"><a
					href="${pageContext.request.contextPath}/partner/personal/info?viewId=1" class="changeProfilePersonalInfoLink">Personal
						Info</a></li>
				<li class="second"><a
					href="${pageContext.request.contextPath}/partner/personal/info?viewId=2" class="changeProfileAddressLink">Address</a></li>
				<li class="third"><a
					href="${pageContext.request.contextPath}/partner/personal/info?viewId=3" class="changeProfileBankDetailsLink">Bank
						Details</a></li>
				<li class="fourth"><a
					href="${pageContext.request.contextPath}/partner/personal/info?viewId=4" class="changeProfileServicesLink">Services</a></li>
				<li class="fifth"><a
					href="${pageContext.request.contextPath}/partner/personal/info?viewId=5" class="changeProfileMyFinancialProductLink">My
						Financial Product</a></li>
				<li class="sixth"><a
					href="${pageContext.request.contextPath}/partner/personal/info?viewId=6" class="changeProfileMyUserAccountLink">My
						User Account</a></li>
				<li class="seventh"><a
					href="${pageContext.request.contextPath}/partner/personal/info?viewId=7" class="changeProfileMyTeamLink">My
						Team</a></li>
			</ul>
		</div>
		<div id="service" class="">
			<form:form action="${pageContext.request.contextPath}/partner/profile/save"
		commandName="profileData" method="POST" id="profile-form">
			<input name="viewId" type="hidden" value = "${viewId}"/>
			<form:input path ="partyId" type ="hidden"/>
			
		<%	ProfileData bean = (ProfileData) request
								.getAttribute("profileData");
		
		List<TeamMemberData> teamData = bean.getTeamMemberDataList();	
		
		%>
			<ul class="reset clearfix headings">
				<li class="first">Team</li>
				<li class="second">Name</li>
				<li class="third">Mobile No.</li>
				<li class="fourth">Email ID/ Website</li>
			</ul>
<div class="data_content">
	<%
			
	for(TeamMemberData t:teamData){
			%>
				<ul class="reset clearfix data">
					<li class="first"><%=t.getLabel() %></li>
					<li class="second"><%=t.getName() %></li>
					<li class="third"><%=t.getMobileNo() %></li>
					<li class="fourth"><%=t.getEmail() %></li>
				</ul>
			<%} %>
			</div>
			</form:form>
		</div>
	</section>
</section>
<!-- Common_in_contnet ends -->
<!-- Common footer starts -->
<section class="common_footer_actions">
	<div id="main_actions" class="clearfix">
		<ul class="reset clearfix fr btn_grup3">
			 <li class="fl list"><a onClick="saveProfile('new')"
				class="anch save inactiveLink saveMyProfileLink"><span class="txt">Save</span></a></li> 
			<li class="fl list"><a href="${pageContext.request.contextPath}/partner/dashboard?flag=0" class="anch cancel"><span
					class="txt">Cancel</span></a></li>
			<!--   <li class="fl list"><a href="#" class="anch skip"><span class="txt">Skip</span></a></li>-->
		</ul>

	</div>
	<a href="${pageContext.request.contextPath}/partner/personal/info?viewId=6" class="back navgation"><span
		class="txt">Back</span></a> <a href="${pageContext.request.contextPath}/partner/dashboard?flag=0"
		class="next navgation"><span class="txt">Next</span></a>
</section>
