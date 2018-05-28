<%@page import="in.fiinfra.common.common.ProfileData"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<script>
	$(document).ready(
			function() {
			var rbsLinks = '${rbsLinks}';
			var pieces = rbsLinks.split(",");
			if(pieces != ""){
				for(var i=0;i<pieces.length;i++){
					$("."+pieces[i]).attr("href","#");
					$("."+pieces[i]).addClass("inactiveLink");
				}
				$("#profile-form").attr("action","#");
			}					
				// my profile active link
				if ($("#my_pro_services").is(":visible")) {
					$(".my_profile_links li.fourth").addClass("active");
				}

				// Status yes / no 	
				$('.toggle').toggles();
				$(".status").on('toggle', function(e, active) {
					
					
					if (active) {
						;
						$(this).next(".status_val").prop("checked", true);
						$(this).find(".toggle-on").text("ON");

					} else {

						$(this).next(".status_val").prop("checked", false);
						$(this).find(".toggle-off").text("OFF");

					}

				});
								
				$('.toggle').each(function () {
					if($(this).next(".orignal_checkbox").is(':checked')){
						$(this).toggles({ on: true});
						$(this).find(".toggle-on").text("ON");
					}
					else{
						$(this).toggles({ on: false});
						$(this).find(".toggle-off").text("OFF");
					}

				});

                 $('.wrapper').addClass("my_profile_wrapper");
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
				    $('.not_clickable').off('click');
					$('#my_pro_services #service .data li.third .value').perfectScrollbar();


			});
</script>

<script>
	function saveProfile(action) {
		$('#isEmailActivated').prop('checked') ?$('#isEmailActivated').val("1"):$('#isEmailActivated').val("0");
		$('#isSmsActivated').prop('checked') ?$('#isSmsActivated').val("1"):$('#isSmsActivated').val("0");
		$('#isWebsiteActivated').prop('checked') ?$('#isWebsiteActivated').val("1"):$('#isWebsiteActivated').val("0");
		$('#isBackOfficeActivated').prop('checked') ?$('#isBackOfficeActivated').val("1"):$('#isBackOfficeActivated').val("0");
		$('#autoPlanEnabled').prop('checked') ?$('#isAutoPlanEnabled').val("1"):$('#isAutoPlanEnabled').val("0");
		$('#profile-form').submit();
	}
</script>
<!-- Common_in_contnet starts-->
<section class="in_content common_in_content clearfix my_profile_parent"
	id="my_pro_services">
	<div class="header_strip">Services</div>
	<section id="service_details" class="clearfix">
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
				 <li class="fifth" id="products"><a
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
		<%
		ProfileData profileData=(ProfileData)request.getAttribute("profileData");
		String isAutoPlan = profileData.getAutoPlanEnabled(); 
		%>
		<div id="service" class="">
			<form:form action="${pageContext.request.contextPath}/partner/saveAutoPlanConfiguration"
		commandName="profileData" method="POST" id="profile-form">
			<input name="viewId" type="hidden" value = "${viewId}"/>
			<form:input path ="partyId" type ="hidden"/>
			<input type="hidden" name="isAutoPlanEnabled" id="isAutoPlanEnabled" value="1">
			<ul class="reset clearfix headings">
				<li class="first">Type</li>
				<li class="second">Status</li>
				<li class="third">Address</li>
				<li class="fourth">Activated On</li>
				<li class="fifth">Last Accessed On</li>
			</ul>
			<div class="data_content">
				<ul class="reset clearfix data">
					<li class="first">Email</li>
					<li class="second">
						<div class="toggle status not_clickable"></div> <!-- <input type="checkbox"
						name="status" value="" class="status_val orignal_checkbox" /> -->
					<input type="checkbox" name="isEmailActivated" id="isEmailActivated" class="status_val orignal_checkbox not_clickable" 
					 <%=profileData.getIsEmailActivated()==1?"checked":"" %> />	

					</li>
					<li class="third"><div class="value"><%=profileData.getServiceEmailId() %></div></li>
					<li class="fourth"><%=profileData.getEmailActivationDate() %> </li>
					<li class="fifth"><%=profileData.getServiceEmailIdLastAccessedDate() %></li>
				</ul>

				<ul class="reset clearfix data">
					<li class="first">SMS</li>
					<li class="second">
						 <div class="toggle status not_clickable"></div> <!--<input type="checkbox"
						name="status" value="" class="status_val orignal_checkbox" /> -->
						<input type="checkbox" name="isSmsActivated" id="isSmsActivated" class="status_val orignal_checkbox not_clickable" 
					 <%=profileData.getIsSmsActivated()==1?"checked":"" %> />	

					</li>
					<li class="third"><div class="value"><%=""%></div></li>
					<li class="fourth"><%=profileData.getSmsActivationDate() %></li>
					<li class="fifth"><%="" %></li>
				</ul>

				<ul class="reset clearfix data">
					<li class="first">Website</li>
					<li class="second">
						<div class="toggle status not_clickable"></div> <!-- <input type="checkbox"
						name="status" value="" class="status_val orignal_checkbox" /> -->
					
					<input type="checkbox" name="isWebsiteActivated" id="isWebsiteActivated" class="status_val orignal_checkbox not_clickable" 
					 <%=profileData.getIsWebsiteActivated()==1?"checked":"" %> />	
					

					</li>
					<li class="third"><div class="value"><%=profileData.getWebsiteUrl() %></div></li>
					<li class="fourth"><%=profileData.getWebsiteActivationDate() %></li>
					<li class="fifth"><%=profileData.getWebsiteLastAccessedDate() %> </li>
				</ul>

				<ul class="reset clearfix data">
					<li class="first">MF Backoffice</li>
					<li class="second">
						<div class="toggle status not_clickable"></div> <!-- <input type="checkbox"
						name="status" value="" class="status_val orignal_checkbox" /> -->
						<input type="checkbox" name="isBackOfficeActivated" id="isBackOfficeActivated" class="status_val orignal_checkbox not_clickable" 
					 <%=profileData.getIsBackOfficeActivated()==1?"checked":"" %> />	

					</li>
					<li class="third"><div class="value"><%="" %></div></li>
					<li class="fourth"><%=profileData.getBackOfficeActivationDate() %></li>
					<li class="fifth"><%=profileData.getBackOfficeLastAccessedDate() %></li>
				</ul>
				
			 <ul class="reset clearfix data">
					<li class="first">Auto Plan Generation</li>
					<li class="second">
						<div class="toggle status "></div> <!-- <input type="checkbox"
						name="status" value="" class="status_val orignal_checkbox" /> -->
					<input type="checkbox" name="autoPlanEnabled" id="autoPlanEnabled" class="status_val orignal_checkbox " 
					 <%=isAutoPlan.equals("1")?"checked":"" %> />	

					</li>
					<li class="third"><div class="value"></div></li>
					<li class="fourth"></li>
					<li class="fifth"></li>
				</ul> 

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
				class="anch save  saveMyProfileLink"><span class="txt">Save</span></a></li>
			<li class="fl list"><a href="${pageContext.request.contextPath}/partner/dashboard?flag=0" class="anch cancel"><span
					class="txt">Cancel</span></a></li>
			<!--   <li class="fl list"><a href="#" class="anch skip"><span class="txt">Skip</span></a></li>-->
		</ul>
	</div>
	<a href="${pageContext.request.contextPath}/partner/personal/info?viewId=3" class="back navgation"><span
		class="txt">Back</span></a> <a href="${pageContext.request.contextPath}/partner/personal/info?viewId=6"
		class="next navgation"><span class="txt">Next</span></a>
</section>
