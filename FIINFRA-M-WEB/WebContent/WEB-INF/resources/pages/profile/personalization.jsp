<%@page import="in.fiinfra.common.util.FiinfraUtility"%>
<%@page import="in.fiinfra.common.common.BaseRequest"%>
<%@page import="org.apache.commons.lang.StringUtils"%>
<%@page import="in.fiinfra.partner.models.Theme"%>
<%@page import="java.util.List"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@page import="in.fiinfra.common.common.ProfileData"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@page import="in.fiinfra.common.diy.models.UserSession"%>
<%@page import="java.io.File"%>
<%@ taglib prefix="core" uri="http://java.sun.com/jsp/jstl/core" %>


<!-- Custom Selectbox starts -->
<%-- <script src="${pageContext.request.contextPath}/resources/js/plugin/jquery.bxslider.js"></script>
 --%>
<script>

var initialData = [];
var finalData = [];

function checkDataInitial(){
	initialData = [];
	initialData.push($("#smsSignature").val());
	initialData.push($("#emailCommunicationName").val());
	initialData.push($("#emailCommunicationId").val());
	initialData.push($("#emailSignature").val());
	initialData.push($("#logoId").val());
	initialData.push($('.selceted').attr('id'));
}
function checkDataFinal(){
	finalData = [];
	finalData.push($("#smsSignature").val());
	finalData.push($("#emailCommunicationName").val());
	finalData.push($("#emailCommunicationId").val());
	finalData.push($("#emailSignature").val());
	finalData.push($("#logoId").val());
	finalData.push($('.selceted').attr('id'));
}

function gotPic(event) {
    if(event.target.files.length == 1 && 
       event.target.files[0].type.indexOf("image/") == 0) {
        $("#previewPane").attr("src",URL.createObjectURL(event.target.files[0]));
    }
}

	$(document).ready(function() {
		
		var rbsLinks = "${rbsLinks}";
		var pieces = rbsLinks.split(",");
		if(pieces != ""){
			for(var i=0;i<pieces.length;i++){
				if(pieces[i]=="savePersonalizationLink"){
					$("personalization-form").attr("action","#");
				}
				$("."+pieces[i]).attr("href","#");
				$("."+pieces[i]).addClass("inactiveLink");
			}			
		}
		
		$("#tabs").tabs();
		$("select").selectBoxIt();
		// Calls the selectBoxIt method on your HTML select box
		
		$("#logoId").on("change",gotPic);
		var buttons = $( "#dialog1" ).dialog( "option", "buttons" );
		// setter
		$("#dialog1").dialog("option", "buttons", [{
		   text: "Ok",
		   click: function () {
			   $(this).dialog('close');
		   }
		}]);
		$(document).on("dialogopen", "#dialog1", function(event, ui) {
			setTimeout("$('#dialog1').dialog('close')",3000);
		});
		
		$("#confirmDialog .close").click(function(){
	 	    $(".overlay").fadeOut("slow");
	 	 $("#confirmDialog").fadeOut("slow");
	 	  }); 

		checkDataInitial();
	});
	function cancel(url){
		var content = nicEditors.findEditor('emailSignature').getContent();
    	$("#emailSignature").val(content);
		 checkDataFinal();
			if(initialData.toString() == finalData.toString()){ 
				javascript:location.href=url;
			 }else{
				 
				 $(".aa_up").html("<spring:message code='dataChanged' />");
					$(".aa_yes").click(function(){
					cancelPage(url);
					});	
					$(".overlay").fadeIn();
					$("#confirmDialog").fadeIn();
			} 
		}
		function back(url){
			javascript:location.href=url;
		}

		function cancelPage(url){
			javascript:location.href=url;
		}
		function alertMessage(msg)
		{
			$("#dialog1").html(msg);
			$( "#dialog1").dialog( "open" );
		}
		
		function closeDialog(){
			  $(".overlay").fadeOut("slow");
			     $("#confirmDialog").fadeOut("slow");
		}	
		
</script>
<script>
	function saveProfile(action) {
    	var f = $("#logoId").val();
    	if(f.length >0){
    	var extension = f.split('.').pop().toUpperCase();
    	if (extension!="PNG" && extension!="JPG" && extension!="GIF" && extension!="JPEG"){
    		$("#successDialog").html("Not a valid image file.");
	 		$( "#successDialog").dialog( "open" );
    		$( "#logoId" ).focus();
    		return ;
    	   
    	}
    	}
    	var content = nicEditors.findEditor('emailSignature').getContent();
    	$("#emailSignature").val(content);    	
    	checkDataFinal();
    	if(initialData.toString() == finalData.toString()){ 
    		alertMessage("You haven't changed any data yet. Please make some changes then save.");
    	}
    	else {
			$('#personalization-form').submit();
    	}
    	
	}
</script>
<script>
$(document).ready(function(){
  	$( "#tabs" ).tabs();
  	$( "#tabs a" ).click(function(e){
  		var curTab = $('.ui-tabs-active');
        curTabIndex = curTab.index();
        $("#refer").val(curTabIndex);      
  	});
    $("select").selectBoxIt();
	 // Calls the selectBoxIt method on your HTML select box
	 
	  $( "#site_theme" ).one( "click", function() {
       $('.bxslider').bxSlider({infiniteLoop:false}); 
});

 
});
</script>
<script>
$(document).ready(function(){
  
	$('#personalization-form').validate();
	$("#Per_Con .close").click(function(){
    $(".overlay").fadeOut("slow");
	$("#Per_Con").fadeOut("slow");
	 });

});
</script>

<!--Map Pop-up Boxs -->
<script>
function applyTheme(element,themeId){
	$('#theme').val(themeId);
    $( "#personalization #tabs-3 .bxslider .theme").removeClass("selceted");
	$(element).closest(".theme").addClass("selceted");

}

function previewTheme(element,themeSrc){
    $(".overlay").fadeIn();
    $('#themePreview').attr('src',themeSrc);
	$("#Per_Con").fadeIn();
}

$(document).ready(function(){
// image uplaod starts
if( "${activeTab}" == "1" ) {
	$("#tab2").click();		
} else if( "${activeTab}" == "2" ) {
	$("#tab3").click();
}
 $(".browse_btn").click(function(){

 $("#upload").click();
 
     function readURL(input) {
        if (input.files && input.files[0]) {
            var reader = new FileReader();
            
            reader.onload = function (e) {
			$(".photo_frame p").animate("slow").css("display","none");
                $('#preview').attr('src', e.target.result);
				$(".photo_frame img").animate("slow").css("display","block");
            };
            
            reader.readAsDataURL(input.files[0]);
        }
    }
    
    $("#upload").change(function(){
        readURL(this);
    });
});
// image uplaod ends

});

function removeLogo(){
	alertMessage("Your logo removed successfully.");
	window.location.replace('${pageContext.request.contextPath}/partner/profile/removeLogo?activeTab=1');
}

</script>
<!-- Custom Selectbox Ends -->
	<!-- Wrapper starts-->
	<div class="" id="personalization">
		<!-- Main starts-->
		<%
			ProfileData profileData = (ProfileData) request
					.getAttribute("profileData");
		%>
		
		<%
  			String photoPath = null;
  			UserSession userSession = (UserSession) request.getSession().getAttribute("userSession"); 
  			if(userSession != null){
  				if(userSession.getPartyId().equals(request.getSession().getAttribute("oldPartyID"))){
  				photoPath = userSession.getLogo();
  				}
  				else{
  					photoPath = profileData.getLogo();
  				}
  			}
  		%>
  	
		<section class="main">
			<div id="dialog1" class="common_dialog" style="text-align: center;"> </div>
				<div id="confirmDialog" class="common_custom_modal_aa"> <span class="close">X</span>
			  <div class="modal_content">
			    <div class="aa_up">
			      <spring:message code="dataChanged" />
			    </div>
			    <div class="aa_down"> <a style="cursor:pointer;" class="aa_yes">Yes </a> <a style="cursor:pointer;" onclick="closeDialog();" class="aa_no">No</a> </div>
			  </div>
			</div>
			<form:form	action="${pageContext.request.contextPath}/partner/profile/save"
				commandName="profileData" method="POST" id="personalization-form" enctype="multipart/form-data">
				<input name="viewId" type="hidden" value="8" />
				<form:input path="partyId" type="hidden" />
				<input type="hidden" name="refer" id="refer" value="0" />
					<section class="in_content common_in_content clearfix goals_bx_in">
						<!-- inside goal page class-->
						<div style="padding: 10px;">
							<div id="tabs">
								<ul>
									<li><a href="#tabs-1" id="tab1" class="personalizationMyInfoLink">My Info</a></li>
									<li><a href="#tabs-2" id="tab2" class="personalizationMyLogoLink">My Logo</a></li>
									<li id="site_theme"><a href="#tabs-3" id="tab3" class="personalizationThemeLink">Theme</a></li>
								</ul>
								<div id="tabs-1" class="tab_border">

									<div class="fl one_col">
										<ul class="reset clearfix second_col_ul">
											<li class="clearfix"><label class="form_label">Email
													Signature</label>
											<form:textarea class="txt-editor" path="emailSignature"
													id="emailSignature" cols="" rows=""></form:textarea></li>
													
											<li class="clearfix"><label class="form_label">SMS
													Signature</label> <form:input path="smsSignature"
													placeholder="Your SMS signature" class="common_input" />
											<li class="clearfix"><label class="form_label">Communication
													Name</label>
											<form:input placeholder="Name" class="common_input" id="emailCommunicationName"
													type="text" path="emailCommunicationName" />
												<div class="clr"></div></li>
											<li class="clearfix rel"><label class="form_label">Communication
													Email</label>
											<form:input placeholder="E-mail ID" class="common_input email" id="emailCommunicationId"
													type="text" path="emailCommunicationId" /></li>
											
											
										</ul>
										<div class="clr"></div>
									</div>

								</div>
								<div id="tabs-2" class="tab_border">
									<p>
									
									<%
										String x = "D:/Ffreedom-DI/images/"+photoPath;
										File file = new File(x);
									%>
									<% if (file.exists() && !file.isDirectory()) { %> 
									<div class="upload_logo_bg">
										<img style="width:140px; height:61px;" id="previewPane" src="${pageContext.request.contextPath}<%="/app/images/"+photoPath%>" />
										</div>
										<%} else { %>
										<div class="upload_logo_bg">
										<img style="width:140px; height:61px;" id="previewPane" src="${pageContext.request.contextPath}/resources/images/temp_logo.png" />
										</div>
										<%} %>
									<div class="upload_btn">
										<form:input class="common_btn" type="file" capture="camera" accept="image/*"
											path="image" id="logoId" />
									</div>
									<core:choose>
										<core:when test="${empty userSession.logo}">
											<div style="position: absolute; top: 157px; line-height: 21px; left: 364px; width: 200px;" class="fl list inactiveLink"><div class="fl" style="background: url(/FIINFRA-M-WEB/resources/images/delete_query_two.png) ; height: 20px; width: 20px; margin-right: 10px;"></div>
											<a onClick="removeLogo();" class="anch save"><span class="txt">Remove Logo</span></a>
											
											</div>
										</core:when>
										<core:otherwise>
											<div style="position: absolute; top: 157px; line-height: 21px; left: 364px; width: 200px;" class="fl list"><div class="fl" style="background: url(/FIINFRA-M-WEB/resources/images/delete_query_two.png) ; height: 20px; width: 20px; margin-right: 10px;"></div><a onClick="removeLogo();"
										class="anch save"><span class="txt">Remove Logo</span></a></div>
										</core:otherwise>
									</core:choose>
									<div style="margin:20px 0px 0px 62px; font-size:12px; color:#3a3a3a;"><p>File with extension .jpeg, .jpg, .png or .bmp are allowed</p></div>
									<div style="margin:20px 0px 0px 62px; font-size:12px; color:#3a3a3a;"><p>Please upload the image of following dimensions for best results</p><p style="margin:5px 0px 0px 70px;"> <span style="font-weight:bold">width:</span> 140 px -<span style="font-weight:bold"> height:</span> 61 px</p><p style="margin:5px 0px 0px 70px;"> <span style="font-weight:bold">width:</span> 37 mm -<span style="font-weight:bold"> height:</span> 16 mm</p></div>
								</div>
								<div id="tabs-3" class="tab_border">
									<form:input type="hidden"	path="theme" />
								
									<ul class="bxslider">
										
										<% 
										 List<Theme> themes =(List<Theme>) request.getAttribute("themes");
										 
										 for(int i=0;i<themes.size();i++){
											 
										%>
										<li class="view_section">
										<% 
										for(int j=0;j<themes.size()&&j<6;j++){
											Theme theme = themes.get(i);
										
										%>
										
										
											<div class="theme <%=profileData.getTheme()==theme.getThemeId()?"selceted":"" %>" id="<%=theme.getThemeId()%>">
												<div class="thumb">
													<img src="${pageContext.request.contextPath}/resources/images/<%=theme.getThumbnail()%>"  />
												</div>
												<div class="action clearfix">
													<a  class="fl preview" onClick="previewTheme(this,'${pageContext.request.contextPath}/resources/images/<%=theme.getIcon()%>'); return false;"> Preview</a>
													<a  class="fr apply" onClick="applyTheme(this,'<%=theme.getThemeId()%>'); return false;"> Apply</a>
												</div>
											</div>
											<%
											i++;	
										}%>

										</li>
										<%} %>
								</ul>
								
								
								</div>
							</div>
							</div>
					</section>
					<!-- Common_in_contnet ends-->
					<!-- Common footer starts -->
					<section class="common_footer_actions">
						<div id="main_actions" class="clearfix">
							<ul class="reset clearfix fr btn_grup3">

								<li class="fl list"><a onClick="saveProfile('new')"
									class="anch save savePersonalizationLink"><span class="txt">Save</span></a></li>
								<li class="fl list"><a href="#"
									onClick="cancel('${pageContext.request.contextPath}/partner/dashboard?flag=0');" class="anch cancel"><span class="txt">Cancel</span></a></li>
								
							</ul>
						</div>
						<%-- <a href="${pageContext.request.contextPath}/partner/dashboard" class="back navgation"><span class="txt">Back</span></a>
						<a href="${pageContext.request.contextPath}/partner/dashboard"
							class="next navgation"><span class="txt">Next</span></a> --%>
					</section>

					<!-- Common footer ends -->
					<div class="overlay"></div>
				
				<!-- Common_content Ends-->
			</form:form>
		</section>
		<!-- Main ends-->
		<!--pop up box-->
    <div id="Per_Con" class="common_custom_modal_edu_con">
      <span class="close">X</span>
       <img id = 'themePreview' src="${pageContext.request.contextPath}/resources/images/orchid_green_template.jpg" ></div>     
														
    </div>
    
    <script type="text/javascript">
    
    $(document).ready(function(){
    	new nicEditor({maxHeight : 100,fullPanel : true,iconsPath : '${pageContext.request.contextPath}/resources/images/nicEditorIcons.gif'}).panelInstance('emailSignature');
   	});
    
    
</script>
    
  <!--pop up box-->
