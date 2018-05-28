<%@page import="in.fiinfra.query.model.CommonUtils"%>
<%@page import="in.fiinfra.partner.models.FpHolder"%>
<%@page import="org.apache.commons.lang.StringUtils"%>
<%@page import="in.fiinfra.common.diy.models.KeyValue"%>
<%@page import="java.util.Map"%>
<%@page import="in.fiinfra.partner.models.ProductOffering"%>
<%@page import="in.fiinfra.common.common.CodeValueData"%>
<%@page import="java.util.List"%>
<%@page import="in.fiinfra.common.common.ProfileData"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<script>
	$(document)
			.ready(
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
						if ($("#my_pro_fin_prod").is(":visible")) {
							$(".my_profile_links li.fifth").addClass("active");
						}

						//Manufacturer Default Starts
						$("#financial_product")
								.on(
										"click",
										".add",
										function() {
											var selectName =  $(this).parent().find('select').attr('name');
											var select = $(this).parent().find('#manufacturers').html();
											
											//$('#fin_prod').perfectScrollbar('update');
											$(this).prev(".close").fadeIn(
													"slow");
											//$(this).parent().after(newSection);
 											$(this)
													.parent()
													.after(
															"<div class='new_section'><select id='manufacturers'name ='"+ selectName+ "' class='new_select'>"+select+"</select><div class='close dynamic_close'>X</div><div class='add dynamic_add'>+</div></div>");
 
											// Calls the selectBoxIt method on your HTML select box	
											$(".new_select").selectBoxIt();
											$(this).fadeOut("slow");

											//close button for first manufacturer start
											var count_section_add = $(this)
													.parent()
													.closest(".fourth")
													.find(
															"span[role='combobox']").length;
											if (count_section_add == 2) {

												$(this).parent().find(".close")
														.removeClass(
																"last_close");

											}
											//close button for first manufacturer end

										});

						// Close Button of default manufacturer selectbox
						$("#financial_product")
								.on(
										"click",
										".close",
										function() {
											var count_section = $(this)
													.parent()
													.closest(".fourth")
													.find(
															"span[role='combobox']").length;
											if (count_section == 2) {
												$(this).parent()
														.siblings("div").find(
																".close")
														.addClass("last_close");

											} else {
												$(this).parent()
														.siblings("div").find(
																".close")
														.removeClass(
																"last_close");
											}
											//close button for first manufacturer end
											if ($(this).parent().is(
													':last-child')) {

												$(this).parent().prev("div")
														.children(".add")
														.fadeIn("slow");
											}
											$(this).parent().remove();

										});
						//Manufacturer Ends

						// offer yes / no 	
						$('.toggle').toggles();
						$(".offer").on(
								'toggle',
								function(e, active) {
									if (active) {
										;
										var id1 = $(this).next(".offer_val").attr("id");
										var val1 = id1.split("_");
										var num = val1[1];
										$("#pro"+num).addClass("required");
										$(this).next(".offer_val").prop(
												"checked", true);

									} else {
										var id1 = $(this).next(".offer_val").attr("id");
										var val1 = id1.split("_");
										var num = val1[1];
										$("#pro"+num).removeClass("required");
										$(this).next(".offer_val").prop(
												"checked", false);											
									}
								});
						
						$('.toggle').each(function () {
							var ids = $(this).next(".orignal_checkbox").attr("id");
							var values = ids.split('_');
							var number = values[1];
							if($(this).next(".orignal_checkbox").is(':checked')){
								$("#pro"+number).addClass("required");
								$(this).toggles({ on: true});
							}
							else{
								$("#pro"+number).removeClass("required");
								$(this).toggles({ on: false});
							}
						});
												
						 $('.wrapper').addClass("my_profile_wrapper");
						// Calls the selectBoxIt method on your HTML select box	
						$("select").selectBoxIt();
						//	custom scroll 
						$('#fin_prod').slimScroll();
						// Calls the selectBoxIt method on your HTML select box	
						/* my_profile_links starts*/
						$(".my_profile_links .arrow").click(function() {

							slide();
						});

						function slide() {
							if ($(".my_profile_links .arrow").hasClass(
									"push_in")) {
								$(".my_profile_links").animate({
									left : '-123px'
								});
								$(".my_profile_links .arrow").animate("slow")
										.removeClass("push_in");
							} else {
								$(".my_profile_links").animate({
									left : '0'
								});
								$(".my_profile_links .arrow").animate("slow")
										.addClass("push_in");
							}
						}						
						$("#profile-form").validate();
						$("li").addClass('rel');
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
	id="my_pro_fin_prod">
	<div class="header_strip">Financial Products</div>
	<section id="financial_product" class="clearfix">
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
		<div id="fin_prod" class="">
			<form:form
				action="${pageContext.request.contextPath}/partner/profile/save"
				commandName="products" method="POST" id="profile-form">
				<input name="viewId" type="hidden" value="${viewId}" />
				<form:input path ="partyId" type ="hidden"/>
				<ul class="reset clearfix headings">
					<li class="first">Asset Class</li>
					<li class="second">Do You Offer This ?</li>
					<li class="third">Service Code</li>
					<li class="fourth">Manufacturer</li>
				</ul>
				<%
					ProfileData profileData=(ProfileData) request.getAttribute("profileData");
					FpHolder fp = (FpHolder) request.getAttribute("products");
	            	ProductOffering[] productOffering=fp.getProducts();
				    Map<Integer,List<KeyValue>> manufacturers= (Map<Integer,List<KeyValue>>)request.getAttribute("manufacturers");
				    int index = 0;
				    for(ProductOffering p:productOffering){
				%>
				<input name ="products[<%=index %>].assetClass" type ="hidden" value="<%=p.getAssetClass()%>"/>
				<input name ="products[<%=index %>].seq" type ="hidden" value="<%=p.getSeq()%>"/>
				
				<div id = "data_content" class="data_content">
					<ul class="reset clearfix data">
						<li id ="assestName" class="first"><%=p.getAssetName()%></li>
						<li class="second">
							<div class="toggle offer"></div> <input type="checkbox" id="pro_<%=index %>"
							name="products[<%=index %>].active" class="offer_val orignal_checkbox" <%=p.isActive()?"checked":"" %> />
						</li>
						<li class="third"><input id="pro<%=index %>" name="products[<%=index %>].serviceCode" class="common_input" value="<%=CommonUtils.emptyIfNull(p.getServiceCode())%>" /></li>
						<li id = <%=p.getAssetName() %> class="fourth"><div class="default_parent">
						<% int counter = 0; 
						String[] mfgParties = p.getMfgParties();
						if(mfgParties ==null){
							mfgParties = new String[1];
						}
						for(int i=0;i<mfgParties.length;i++){ 
						%>
							<% if(i>0){ %>
							<div class='new_section'>	
							<% }%>
								<select id="manufacturers" name="products[<%=index %>].mfgParties" >
								<option value=-1>--Select--</option>
									<%
										List<KeyValue> lst = (List<KeyValue>) manufacturers.get(p.getAssetClass()); 
									 for(KeyValue idv:lst){
									%>
									<option value='<%=idv.getId()%>' <%=StringUtils.equals(""+idv.getId(), mfgParties[i]) ?"selected":"" %>> <%=idv.getName()%></option>
									<%
										}
									%>
								</select>
								
								<%if(i>0){ %>
								<div class="close dynamic_close">X</div>
								<%} %>
								<%if(i==mfgParties.length-1){ %>
								<div class="add dynamic_add">+</div>
								<%} %>
								<% if(i>0){ %>
								</div>
								<%} %>
								<% }%>															
							</div></li>
					</ul>

					<% index++;
						}
					%>
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
				class="anch save saveMyProfileLink"><span class="txt">Save</span></a></li>
			<li class="fl list"><a
				href="${pageContext.request.contextPath}/partner/dashboard?flag=0"
				class="anch cancel"><span class="txt">Cancel</span></a></li>			
		</ul>		
	</div>
	<a
		href="${pageContext.request.contextPath}/partner/personal/info?viewId=4"
		class="back navgation"><span class="txt">Back</span></a> <a
		href="${pageContext.request.contextPath}/partner/personal/info?viewId=6"
		class="next navgation"><span class="txt">Next</span></a>
</section>
