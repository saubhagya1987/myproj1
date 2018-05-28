<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@page import="in.fiinfra.partner.controller.PartnerProfileController"%>
<%@page import="in.fiinfra.common.diy.models.UserSession"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<!--<meta name="viewport" content="width=device-width,initial-scale=1">-->
<title>Chat</title>
<!-- Custom Selectbox starts -->

<style>
.none { display: none; }
#chat_list {/*overflow: auto;*/ }
a { cursor: pointer; }
#chat_list .footer .footer-right { width: 18% !important; }
.pointer { cursor: pointer; }
/*.file_link{
margin: 5px 0px 0px 0px;
font-family: "allerregular";
color: #952754;
 font-weight: bold;
font-size: 12px;
}*/
.bottommargin { margin-bottom: 5px !important; }
.leftmargin { margin-left: 10px; }
/*.redcolor{color: #952754;}*/
.filter_browse_file, .filter_link_url, .browse_file, .link_url { display: none; }
/*.div_dragger { z-index: 999 !important; }*/
.content .chat_thread .chat_thread_right .comment_no { font-size: 15px !important; }
</style>
<script>
var backFlag = false;
$(document).ready(function(){
	 
// 	setTimeout("$('#dialog1').dialog('close')",3000);
  
 	
	 // Calls the selectBoxIt method on your HTML select box
    });
</script>
<!-- Custom Selectbox Ends -->
<!-- Placeholder for selectbox starts -->
<script>
$(document).ready(function(){
  $(".footer").hide();
  $(".selectboxit-container").click(function(){
	$(".selectboxit-option-first").remove();
	
  
});	
});

$(".add_docs_btn_back").click(function(){
	if(backFlag == false) {
		javascript:location.href="${pageContext.request.contextPath}/partner/dashboard?flag=0";
	} else {
		javascript:location.href="${pageContext.request.contextPath}/partner/chat";
	}
	
  
});	
</script>
<!-- Placeholder for selectbox Ends -->
<!-- Filter section toggle starts -->
<script>
$(document).ready(function(){
   $(".wrapper").addClass("chat_wrapper");
  $("#chat_list .div_dragger").click(function(){
   $("#chat_filter").slideToggle("slow");
     $(":selectBox-selectBoxIt").each(function(){
    $(this).data('selectBox-selectBoxIt').refresh();
     });
	$(".div_dragger span").animate("slow").toggleClass("div_dragger_up","slow");
	if($(".div_dragger span").hasClass("div_dragger_up"))
	{
	 $("#chat_filter #statusSelectBoxIt .selectboxit-text").text("Select Contact");
	 $("#chat_filter #typeSelectBoxIt .selectboxit-text").text("Select Name");
	$("#chat_filter .common_input").val("");
	}
  });
});
</script>
<!-- Filter section toggle ends -->
<!-- custom scroll to "common_in_content" -->
<script>

/**
 * @param id
 *            id of popup to be opened
 * @param halfHeightOfPopup
 *            half the hieght of the popup to be opened
 * @param halfWidhtOfPopup
 *            half the width of popup to be opend opens the popup having the id
 *            equals to received id at the center of window
 */
function openPopupWebApp(id, halfHeightOfPopup, halfWidhtOfPopup) {
	$('#shadow_div_web_app').show();
	$('#common_popup_div').show();
	$('#' + id).show();
	var height = ($(window).height() / 2) - halfHeightOfPopup;
	$('#' + id).css('margin-top', height);
	var width = ($(window).width() / 2) - halfWidhtOfPopup;
	$('#' + id).css('margin-left', width);
	// alert(id);

}

/**
 * @param id
 *            id of popup to be closed close the popup having the id equals to
 *            received id
 */
function closePopupWebApp(id) {

	$('#common_popup_div').hide();
	$('#' + id).hide();
	// $("#loadingImage_backPage").css({
	// opacity: 1.0
	// });
	$('#shadow_div_web_app').hide();
}
$(document).ready(function(){
  
  $('.common_in_content').slimScroll();
	 $('#chat_list .content').slimScroll();
	//$('#chat_list .container .value').perfectScrollbar();
  });
var startValue=0;
var isNoMoreChar=false;
var selectedType='post';
var parentChatId=0;
var chatType='chat';

  $(function() {
	  $( "#chatOnRelatedPartyId" ).change(function() {
		  getChatList($(this).val());
		});
	  		$(".post").click(function(){
				$(".browse_file").hide(1000);
				$(".link_url").hide(1000);
				
				$(".filter_browse_file").hide(1000);
				$(".filter_link_url").hide(1000);
				
				$('.post').addClass('chattypepostbottom');
				$('.filter_post').addClass('chattypepost');
				
				$('.link').removeClass('chattypelinkbottom');
				$('.filter_link').removeClass('chattypelink');
				
				$('.file').removeClass('chattypefilebottom');
				$('.filter_file').removeClass('chattypefile');
				selectedType='post';
			});
			
			$(".file").click(function(){
				$(".browse_file").show(1000);
				$(".link_url").hide(1000);
				
				$(".filter_browse_file").show(1000);
				$(".filter_link_url").hide(1000);
				
				$('.post').removeClass('chattypepostbottom');
				$('.filter_post').removeClass('chattypepost');
				
				$('.link').removeClass('chattypelinkbottom');
				$('.filter_link').removeClass('chattypelink');
				
				$('.file').addClass('chattypefilebottom');
				$('.filter_file').addClass('chattypefile');
				selectedType='file';
				
			});
			
			$(".link").click(function(){
				$(".browse_file").hide(1000);
				$(".link_url").show(1000);
				
				$(".filter_browse_file").hide(1000);
				$(".filter_link_url").show(1000);
				
				$('.post').removeClass('chattypepostbottom');
				$('.filter_post').removeClass('chattypepost');
				
				$('.link').addClass('chattypelinkbottom');
				$('.filter_link').addClass('chattypelink');
				
				$('.file').removeClass('chattypefilebottom');
				$('.filter_file').removeClass('chattypefile');
				selectedType='link';
			});
			
			
			
			
			$(".filter_post").click(function(){
				$(".filter_browse_file").hide(1000);
				$(".filter_link_url").hide(1000);
				
				$(".browse_file").hide(1000);
				$(".link_url").hide(1000);
				
				$('.post').addClass('chattypepostbottom');
				$('.filter_post').addClass('chattypepost');
				
				$('.link').removeClass('chattypelinkbottom');
				$('.filter_link').removeClass('chattypelink');
				
				$('.file').removeClass('chattypefilebottom');
				$('.filter_file').removeClass('chattypefile');
				selectedType='post';
			});
			
			$(".filter_file").click(function(){
				$(".filter_browse_file").show(1000);
				$(".filter_link_url").hide(1000);
				
				$(".browse_file").show(1000);
				$(".link_url").hide(1000);
				
				$('.post').removeClass('chattypepostbottom');
				$('.filter_post').removeClass('chattypepost');
				
				$('.link').removeClass('chattypelinkbottom');
				$('.filter_link').removeClass('chattypelink');
				
				$('.file').addClass('chattypefilebottom');
				$('.filter_file').addClass('chattypefile');
				selectedType='file';
			});
			
			$(".filter_link").click(function(){
				$(".filter_browse_file").hide(1000);
				$(".filter_link_url").show(1000);
				
				$(".browse_file").hide(1000);
				$(".link_url").show(1000);
				
				$('.post').removeClass('chattypepostbottom');
				$('.filter_post').removeClass('chattypepost');
				
				$('.link').addClass('chattypelinkbottom');
				$('.filter_link').addClass('chattypelink');
				
				$('.file').removeClass('chattypefilebottom');
				$('.filter_file').removeClass('chattypefile');
				selectedType='link';
			});
	  $(document).ajaxStop(function() {
			closePopupWebApp('');
		});

		$(document).ajaxStart(function() {
			openPopupWebApp('centerLoadingImage', 25, 35);
		});
	  $.ajax({
			type : "POST",
			url : '${pageContext.request.contextPath}/partner/getPicklistValues?codeTypeIds=15',
			success : function(result) {
				$('#contactType').empty();
				$('#contactType').append('<option value="0">Contact Type</option>');
				$(result).each(function(i,obj) {
					var codeTypeId=obj.codeTypeId;
					var codeValue=obj.codeValue;
					var codevalueId=obj.codeValueId;
					$('#contactType').append('<option value="'+codevalueId+'">'+codeValue+'</option>');
					
				});
				 $("select").selectBoxIt();
// 				 $('#chatListUl').empty();
				getChatList('${sessionScope.userSession.partyId}');
				$contentLoadTriggered = false;
				$('.ps-container').scroll(function(){
					if($(this)[0].scrollHeight - $(this).scrollTop() == $(this).outerHeight()) {
						if(parentChatId==0)
						startValue=startValue+1;
						partyId = $('#chatOnRelatedPartyId').val();
						if(partyId=='0' || partyId=='null' || partyId==null)
							{
								partyId ='${sessionScope.userSession.partyId}';	
							}
						$contentLoadTriggered = true;
						if(isNoMoreChar==false)
						getChatList(partyId);
					}
					});
			}});
});
  
  
function getChatList(partyId){
	parentChatId=0;
	chatType='chat';
	$('#chatDetailsDiv').empty();
	$.ajax({
		type : "POST",
		url : '${pageContext.request.contextPath}/partner/getChatList?partyId='+partyId+'&startValue='+startValue,
		success : function(result) {
			result = JSON.parse(result);
			var chatterList=result[0];
			var commentList=result[1];
			if(chatterList.length==0) {
				isNoMoreChar=true;
				$('#chatListUl').append("No data found");
			}
			$(chatterList).each(function(i, obj) {
					var chatid=obj.chatid;
					var userphotoFileName=obj.userphotoFileName;
					var postedBy=obj.postedBy;
					var postedToUserType=obj.postedToUserType;
					var postedFor=obj.postedFor;
					var chatText=obj.chatText;
					var createdDate=obj.createdDate;
					var commentCount=obj.commentCount;
					var imageString=userphotoFileName==''?'<img class="chatuserimg" src="${pageContext.request.contextPath}/resources/images/chatuser.png">':'<img class="chatuserimg" onerror="$(this).attr(\'src\',\'${pageContext.request.contextPath}/resources/images/chatuser.png\')" src="${pageContext.request.contextPath}/app/images'+userphotoFileName+'">';
					$('#chatListUl').append('<li > <div class="chat_thread clearfix fl" id="innerchatdiv'+chatid+'"> </div></li>');
					$('#innerchatdiv'+chatid).append('<div class="chat_thread_left clearfix fl"><div class="image_container">'+imageString+'</div><span class="name">'+postedBy+'</span><span class="date">'+createdDate+'</span></div> <div class="separator clearfix fl"></div>');
					$('#innerchatdiv'+chatid).append('<div class="chat_thread_middle clearfix fl bottommargin"><span class ="thread_header pointer openThreadLink" onclick="loadChatDetails('+chatid+','+startValue+')" >'+chatText+'</span> <span class="commentor">'+postedToUserType+' '+postedFor+'</span><span class="comment fl" id="comment'+chatid+'"></span></div>');
					$('#innerchatdiv'+chatid).append('<div class="chat_thread_right clearfix fr"><div class="comment_no_bg clearfix"><div class="comment_no">'+commentCount+'</div></div><div class="date_time clearfix fr"><span class="comment_date" id="commentdate'+chatid+'"></span></div> </div>');
					if(obj.type=='Content'){
						$('#innerchatdiv'+chatid).append('<div class="file_link pointer " id="document'+chatid+'"></div>');
						if(obj.attachment1DocumentId !=0){
							$('#document'+chatid).append('<span class="leftmargin" onclick="downloadAttachment('+obj.attachment1DocumentId+')" title="'+obj.contentFileName1+'">'+obj.contentFileName1+'</span>');
							}
							if(obj.attachment2DocumentId !=0){
								$('#document'+chatid).append('<span class="leftmargin" onclick="downloadAttachment('+obj.attachment2DocumentId+')" title="'+obj.contentFileName2+'">'+obj.contentFileName2+'</span>');	
							}
							if(obj.attachment3DocumentId !=0){
								$('#document'+chatid).append('<span class="leftmargin" onclick="downloadAttachment('+obj.attachment3DocumentId+')" title="'+obj.contentFileName3+'">'+obj.contentFileName3+'</span>');
							}
					}
					else if(obj.type=='Link'){
						$('#innerchatdiv'+chatid).append('<div class="file_link pointer" ><a class="leftmargin redcolor" target="_blank"  href="'+obj.chatURL+'" title="'+obj.chatURL+'">'+obj.chatURL+'</a></div>');
					}
						
			});
			
			$(commentList).each(function(i, commentobj) {
				var parentChatID=commentobj.parentChatID;
				var userphotoFileName=commentobj.userphotoFileName;
				var createdBy=commentobj.createdBy;
				var chatText=commentobj.chatText;
				var createdDate=commentobj.createdDate;
				var partyId=commentobj.partyId;
				var imageString=userphotoFileName==''?'<img class="chatuserimg" src="${pageContext.request.contextPath}/resources/images/chatuser.png">':'<img class="chatuserimg" src="${pageContext.request.contextPath}/app/images'+userphotoFileName+'">';
// 				if($('#comment'+parentChatID).html()==''){
					$('#comment'+parentChatID).html(chatText);
					$('#commentdate'+parentChatID).html(createdDate);
// 				}
			});
		}
 });
}

function loadChatDetails(chatIdToShow,startValue1){
	parentChatId=chatIdToShow;
	chatType='comment';
	startValue=startValue1;
	partyId = $('#chatOnRelatedPartyId').val();
	if(partyId=='0' || partyId=='null' || partyId==null)
		{
			partyId ='${sessionScope.userSession.partyId}';	
		}
	$('#chatListUl').empty();
	$('#chatDetailsDiv').empty();
	backFlag = true;
	$("#chat_filter").slideToggle("slow");
	$('.div_dragger').hide();
	$(".footer").show();
	$.ajax({
		type : "POST",
		url : '${pageContext.request.contextPath}/partner/getChatList?partyId='+partyId+'&startValue='+startValue1,
		success : function(result) {
			result = JSON.parse(result);
			var chatterList=result[0];
			var commentList=result[1];
			//startValue=0;
			
			$(chatterList).each(function(i, obj) {
					var chatid=obj.chatid;
					var userphotoFileName=obj.userphotoFileName;
					var postedBy=obj.postedBy;
					var postedToUserType=obj.postedToUserType;
					var postedFor=obj.postedFor;
					var chatText=obj.chatText;
					var createdDate=obj.createdDate;
					var imageString=userphotoFileName==''?'<img class="chatuserimg" src="${pageContext.request.contextPath}/resources/images/chatuser.png">':'<img class="chatuserimg" onerror="$(this).attr(\'src\',\'${pageContext.request.contextPath}/resources/images/chatuser.png\')" src="${pageContext.request.contextPath}/app/images'+userphotoFileName+'">';
// 					alert(chatIdToShow+'---------'+chatid)
					if(chatIdToShow==chatid){
// 						alert('in if')
					var imageString=userphotoFileName==''?'<img class="chatuserimg" src="${pageContext.request.contextPath}/resources/images/chatuser.png">':'<img class="chatuserimg" onerror="$(this).attr(\'src\',\'${pageContext.request.contextPath}/resources/images/chatuser.png\')" src="${pageContext.request.contextPath}/app/images'+userphotoFileName+'">';
					$('#chatListUl').append('<li > <div class="chat_thread clearfix fl" id="innerchatdiv'+chatid+'"> </div></li>');
					$('#innerchatdiv'+chatid).append('<div class="chat_thread_left clearfix fl"><div class="image_container">'+imageString+'</div><span class="name">'+postedBy+'</span><span class="date">'+createdDate+'</span></div> <div class="separator clearfix fl"></div>');
					$('#innerchatdiv'+chatid).append('<div class="chat_thread_middle clearfix fl bottommargin"><span class ="thread_header openThreadLink">'+chatText+'</span><span class="commentor">'+postedToUserType+' '+postedFor+'</span><span class="comment fl" id="comment'+chatid+'"></span></div>');
					$('#innerchatdiv'+chatid).append('<div class="chat_thread_right clearfix fl"><div class="date_time clearfix fr"><span class="comment_date" id="commentdate'+chatid+'"></span></div> </div>');
						//$('#chatDetailsDiv').append('<div class="first_user_bx fl clearfix"> <div class="user_pic fl">'+imageString+'</div><div class="user_comment fl"><div class="title">'+postedBy+'</div><div class="txt">'+chatText+'</div><div class="file_link pointer bottommargin" id="fileDiv'+chatid+'"></div><div class="date">'+createdDate+'</div></div></div>');
					}
					if(obj.type=='Content'){
						$('#innerchatdiv'+chatid).append('<div class="file_link pointer" style="margin-top:50px" id="document'+chatid+'"></div>');
						if(obj.attachment1DocumentId !=0){
// 							$('#fileDiv'+chatid).append('<span class="leftmargin" onclick="downloadAttachment('+obj.attachment1DocumentId+')" title="'+obj.contentFileName1+'">'+obj.contentFileName1+'</span>');
							$('#document'+chatid).append('<span class="leftmargin redcolor" onclick="downloadAttachment('+obj.attachment1DocumentId+')" title="'+obj.contentFileName1+'">'+obj.contentFileName1+'</span>');
							}
							if(obj.attachment2DocumentId !=0){
// 								$('#fileDiv'+chatid).append('<span class="leftmargin" onclick="downloadAttachment('+obj.attachment2DocumentId+')" title="'+obj.contentFileName2+'">'+obj.contentFileName2+'</span>');	
								$('#document'+chatid).append('<span class="leftmargin redcolor" onclick="downloadAttachment('+obj.attachment2DocumentId+')" title="'+obj.contentFileName2+'">'+obj.contentFileName2+'</span>');
							}
							if(obj.attachment3DocumentId !=0){
// 								$('#fileDiv'+chatid).append('<span class="leftmargin" onclick="downloadAttachment('+obj.attachment3DocumentId+')" title="'+obj.contentFileName3+'">'+obj.contentFileName3+'</span>');
								$('#document'+chatid).append('<span class="leftmargin redcolor" onclick="downloadAttachment('+obj.attachment3DocumentId+')" title="'+obj.contentFileName3+'">'+obj.contentFileName3+'</span>');
							}
					}
					else if(obj.type=='Link'){
// 						$('#fileDiv'+chatid).append('<a class="leftmargin redcolor" target="_blank"  href="'+obj.chatURL+'" title="'+obj.chatURL+'">'+obj.chatURL+'</a>');
						$('#innerchatdiv'+chatid).append('<div class="file_link pointer" style="margin-top:50px" id="document'+chatid+'"><a class="leftmargin redcolor"   target="_blank"  href="'+obj.chatURL+'" title="'+obj.chatURL+'">'+obj.chatURL+'</a></div>');
					}
						
			});
			$(commentList).each(function(i, commentobj) {
				var parentChatID=commentobj.parentChatID;
				var userphotoFileName=commentobj.userphotoFileName;
				var createdBy=commentobj.createdBy;
				var chatText=commentobj.chatText;
				var createdDate=commentobj.createdDate;
				var partyId=commentobj.partyId;
				var commentChatId=commentobj.commentChatId;
				var imageString=userphotoFileName==''?'<img class="chatuserimg" src="${pageContext.request.contextPath}/resources/images/chatuser.png">':'<img class="chatuserimg" onerror="$(this).attr(\'src\',\'${pageContext.request.contextPath}/resources/images/chatuser.png\')" src="${pageContext.request.contextPath}/app/images'+userphotoFileName+'">';
				if(chatIdToShow==parentChatID){
					if(partyId=='${sessionScope.userSession.partyId}')
					$('#chatDetailsDiv').append('<div class="first_user_bx fl clearfix"> <div class="user_pic fl">'+imageString+'</div><div class="user_comment fl"><div class="title">'+createdBy+'</div><div class="txt">'+chatText+'</div><div class="file_link pointer bottommargin" id="fileDiv'+commentChatId+'"></div><div class="date">'+createdDate+'</div></div></div>');
					else
					$('#chatDetailsDiv').append('<div class="second_user_bx fr clearfix"> <div class="user_pic fr">'+imageString+'</div><div class="user_comment fl"><div class="title">'+createdBy+'</div><div class="txt">'+chatText+'</div><div class="file_link pointer bottommargin" id="fileDiv'+commentChatId+'"></div><div class="date">'+createdDate+'</div></div></div>');
					
					if(commentobj.commentType=='Content'){
						if(commentobj.attachment1DocumentId !=0){
							$('#fileDiv'+commentChatId).append('<span class="leftmargin" onclick="downloadAttachment('+commentobj.attachment1DocumentId+')" title="'+commentobj.contentFileName1+'">'+commentobj.contentFileName1+'</span>');
							}
							if(commentobj.attachment2DocumentId !=0){
								$('#fileDiv'+commentChatId).append('<span class="leftmargin" onclick="downloadAttachment('+commentobj.attachment2DocumentId+')" title="'+commentobj.contentFileName2+'">'+commentobj.contentFileName2+'</span>');	
							}
							if(commentobj.attachment3DocumentId !=0){
								$('#fileDiv'+commentChatId).append('<span class="leftmargin" onclick="downloadAttachment('+commentobj.attachment3DocumentId+')" title="'+commentobj.contentFileName3+'">'+commentobj.contentFileName3+'</span>');
							}
					}
					else if(commentobj.commentType=='Link'){
						$('#fileDiv'+commentChatId).append('<a class="leftmargin redcolor" target="_blank"  href="'+commentobj.chatURL+'" title="'+commentobj.chatURL+'">'+commentobj.chatURL+'</a>');
					}
				}
				
				
				
			});
			isNoMoreChar=true;
			$(".ps-container").animate({
		          scrollTop: -350
		     });
		}
 });
}

function getUserList() {
	var recordType = $('#contactType').val();
	$('#chatOnRelatedPartyIdLi').empty();
	$('#chatOnRelatedPartyIdLi').append('<select id="chatOnRelatedPartyId" class="none"></select>');
	$( "#chatOnRelatedPartyId" ).change(function() {
		$('#chatListUl').empty();  
		startValue=0;
		getChatList($(this).val());
		});
	if(recordType!=0){
	$.ajax({
		type : "POST",
		url : '${pageContext.request.contextPath}/partner/getUserList?recordType=' + recordType,
			success : function(result) {
			result = JSON.parse(result);
			
			$('#chatOnRelatedPartyId').empty();
			$('#chatOnRelatedPartyId').append(
			'<option value="0">Contact</option>');
			$(result).each(
					function(i, obj) {
						$('#chatOnRelatedPartyId').append(
								'<option value="'+obj.partyId+'">'
										+ obj.name + '</option>');
					});
			$("#chatOnRelatedPartyId").show();
			 $("#chatOnRelatedPartyId").selectBoxIt();
			 
		}
	});
	}else{
		$('#chatOnRelatedPartyId').empty();
		$("#chatOnRelatedPartyId").show();
		 $("#chatOnRelatedPartyId").selectBoxIt();
	}
}

function downloadAttachment(docId){
	if(docId==0){
		$("#successDialog").html("Document is not available.");
	}else{
		$('#documentIdToDownload').removeAttr('disabled');
		$('#documentIdToDownload').val(docId);
		$('#downloadAttachmentForm').submit();
	}
	
	
}


function saveChat(section){
	var nodeID = '${nodeId}';
	if(nodeID>0)
	{
		$("#successDialog").html("Please select partner first from Hierarchy");
		$( "#successDialog").dialog( "open" );
		return true;
	}
	
		
	var isValidated=true;
	var feedLinkPost;
	var feedFilePost;
	var feedLinkURL;
	var chatInput;
	var isFilePost=0;
	var storedData;
	var isTagging='false';
	var post='';
	
	if(section=='top'){
		if(selectedType=='post')
		chatInput=$('#chatInput').val();
		else if(selectedType=='link')
		feedLinkPost=$('#chatInput').val();
		else if(selectedType=='file'){
		feedFilePost=$('#chatInput').val();
		isFilePost=1;
		}
		feedLinkURL=$('#chatLink').val();
		 storedData = $('#chatInput').data('label');
		 post= $('#chatInput').val();
	}else{
		if(selectedType=='post')
		chatInput=$('#chatInput1').val();
		else if(selectedType=='link')
		feedLinkPost=$('#chatInput1').val();
		else if(selectedType=='file'){
			feedFilePost=$('#chatInput1').val();
			isFilePost=1;
		}
		feedLinkURL=$('#chatLink1').val();
		storedData = $('#chatInput1').data('label');
		post= $('#chatInput1').val();
	}
	
	
	var re = /(http(s)?:\\)?([\w-]+\.)+[\w-]+[.com|.in|.org]+(\[\?%&=]*)?/;
	
	var contactType = $('#contactType').val();
	var partyId = $('#chatOnRelatedPartyId').val();
	if(contactType=='0' && parentChatId==0){
		$("#successDialog").html("Please select Contact Type.");
 		$( "#successDialog").dialog( "open" );	
 		isValidated=false;
	}else if(partyId=='0' && parentChatId==0){
		$("#successDialog").html("Please select Contact.");
 		$( "#successDialog").dialog( "open" );	
 		isValidated=false;
	}else if($('#chatInput').val()=='' && section=='top'){
		$("#successDialog").html("Please enter some text for chat.");
 		$( "#successDialog").dialog( "open" );	
		isValidated=false;
	}else if($('#chatInput1').val()=='' && section!='top'){
		$("#successDialog").html("Please enter some text for chat.");
 		$( "#successDialog").dialog( "open" );	
		isValidated=false;
	}else if(selectedType=='link' && feedLinkURL==''){
		$("#successDialog").html("Please enter link URL.");
 		$( "#successDialog").dialog( "open" );	
		isValidated=false;
	}else if(selectedType=='link' && !re.test(feedLinkURL)) {
		$("#successDialog").html("Please enter valid link URL.");
 		$( "#successDialog").dialog( "open" );	
		isValidated=false;
	}else if(selectedType=='file'){
		if(section=='top'){
			if($('#filter_chatAttachment1').val()=='' && $('#filter_chatAttachment2').val()=='' && $('#filter_chatAttachment3').val()==''){
				$("#successDialog").html("Please select at least one attachment.");
		 		$( "#successDialog").dialog( "open" );	
				isValidated=false;
			}
		}else{
			if($('#chatAttachment1').val()=='' && $('#chatAttachment2').val()=='' && $('#chatAttachment3').val()==''){
				$("#successDialog").html("Please select at least one attachment.");
		 		$( "#successDialog").dialog( "open" );	
				isValidated=false;
			}
		}
		
	}
	if(isValidated==true){
		if(feedLinkURL.indexOf('http')==-1){
			feedLinkURL='http://'+feedLinkURL;
		}
		var selectedUserName = new Array(); 
		selectedUserName=post.split(";");
		for(var i=0;i<selectedUserName.length;i++)
			{
			selectedUserName[i]=selectedUserName[i].replace('@[','');
			selectedUserName[i]=selectedUserName[i].replace(']','');
			selectedUserName[i]=$.trim(selectedUserName[i]);
			}
		var userNames = new Array();
		    console.log(storedData);
			var i=0;
		    $(storedData).each(function(){  
		    	userNames[i]=this.value;
		    	i=i+1;
		    });
		    var xmlStringUserName='<Root>';
		    for (var i=0;i<userNames.length;i++)
		    	{
		    		for(var j=0;j<selectedUserName.length;j++)
		    			{
			    			if(userNames[i]==selectedUserName[j])
				    		{
				    			xmlStringUserName +='<user><username>'+userNames[i]+'</username></user>';	
				    		}	
		    			}
		    		 isTagging='true';
		    	}
		    xmlStringUserName +='</Root>';
//	 	    alert(xmlStringUserName)
		    $('#xmlStringUserName').val(xmlStringUserName);
		    $('#isTagging').val(isTagging);
		
		$('#chatOnRelatedPartyIdToSend').val(partyId);
		$('#contact').val(contactType);
		$('#parentChatId').val(parentChatId);
		$('#chatType').val(chatType);
		var msg='';
		if(parentChatId==0){
			$('#feedItemPost').val(chatInput);
			$('#feedLinkPost').val(feedLinkPost);
			$('#feedLinkURL').val(feedLinkURL);
			$('#feedFilePost').val(feedFilePost);
		}else{
			$('#feedItemComment').val(chatInput);
			$('#feedLinkComment').val(feedLinkPost);
			$('#feedLinkCommentURL').val(feedLinkURL);
			$('#feedFileComment').val(feedFilePost);
		}
		
		
		if(isFilePost==0){
			
			$.ajax({
				type : "POST",
				url : '${pageContext.request.contextPath}/partner/saveChat',
				data:$('#chatForm').serialize(),
				success : function(result) {
					result = JSON.parse(result);
					if(result=='success')
// 					$("#chatMessage").html("Chat posted successfully.");
					$("#successDialog").html("Chat posted successfully.");
					else
// 					$("#chatMessage").html('The connection to the server has been lost. Please try again later.');
					$("#successDialog").html("The connection to the server has been lost. Please try again later.");
	// 				$('#chatDialog').show();
// 					$(".overlay").fadeIn();
					$( "#successDialog").dialog( "open" );
					setTimeout(function(){closeChatDialog()}, 3000);
// 					$("#chatDialog").fadeIn();
				}
			});
		}else{
			$('#attachmentDiv').empty();
			if(section=='top'){
				$('#attachmentDiv').append($('#filter_chatAttachment1'));
				$('#attachmentDiv').append($('#filter_chatAttachment2'));
				$('#attachmentDiv').append($('#filter_chatAttachment3'));
				$('#filter_browse_file').empty();
				$('#filter_browse_file').append('<input type="file" class="common_btn"  value="Browse" name="chatAttachment" id="filter_chatAttachment1">');
				$('#filter_browse_file').append('<input type="file" class="common_btn"  value="Browse" name="chatAttachment" id="filter_chatAttachment2">');
				$('#filter_browse_file').append('<input type="file" class="common_btn"  value="Browse" name="chatAttachment" id="filter_chatAttachment3">');
				
			}else{
				$('#attachmentDiv').append($('#chatAttachment1'));
				$('#attachmentDiv').append($('#chatAttachment2'));
				$('#attachmentDiv').append($('#chatAttachment3'));
				$('#browse_file').empty();
				$('#browse_file').append('<input type="file" class="common_btn"  value="Browse" name="chatAttachment" id="chatAttachment1">');
				$('#browse_file').append('<input type="file" class="common_btn"  value="Browse" name="chatAttachment" id="chatAttachment2">');
				$('#browse_file').append('<input type="file" class="common_btn"  value="Browse" name="chatAttachment" id="chatAttachment3">');
			}
			
			if(parentChatId!=0){
				$('#attachmentDiv input').attr('name','commentAttachment');
			}
			
			 $('#chatForm').ajaxForm({
		            success: function(result) {
		            	result = JSON.parse(result);
		            	if(result=='success')
//		 					$("#chatMessage").html("Chat posted successfully.");
							$("#successDialog").html("Chat posted successfully.");
							else
//		 					$("#chatMessage").html('The connection to the server has been lost. Please try again later.');
							$("#successDialog").html("The connection to the server has been lost. Please try again later.");
			// 				$('#chatDialog').show();
//		 					$(".overlay").fadeIn();
							$( "#successDialog").dialog( "open" );
							setTimeout(function(){closeChatDialog()}, 3000);
		            },
		            error: function(msg) {
		            }, onComplete: function (data) {
		            }
		        }).submit();
			
		}
	}
}

function closeChatDialog(){
// 	$('#chatDialog').hide();
	$(".overlay").fadeOut("slow");
	$("#chatDialog").fadeOut("slow");
	$('#chatInput').val('');
	$('#chatLink').val('http://');
	
	$('#chatInput1').val('');
	$('#chatLink1').val('http://');
	if(parentChatId==0){
		startValue=0;
	$( "#chatOnRelatedPartyId" ).change();
	}else{
		loadChatDetails(parentChatId,startValue);
	}
}

function split( val ) {
	 return val.split( /;\s*/ );
  }
function extractLast( term ) {
		 return split( term ).pop();
	}
String.prototype.contains = function(it) {
	return this.indexOf(it) != -1;
};
Array.prototype.contains = function(obj) {
	var i = this.length;
	while (i--) {
		if (this[i] == obj) {
			return true;
		}
	}
	return false;
}

function getUserForTagging(name,chatId,inputId)
{
 	var post = $("#"+inputId).val();
	var extractedText;
	var inputString;
	if(((parentChatId!=0)||($('#chatOnRelatedPartyId').val()!='0' && $('#contactType').val()!='0')) && $("#"+inputId).val()!=''){
	extractedText=extractLast(post);
	if (/\s/.test(extractedText)) {
		 
	}
	else if(extractedText==null || extractedText=='' || extractedText==' ')
	{

	}
	else if(!extractedText.contains('@'))
	{

	}
	else{	
		inputString=extractedText.substring(1);
		 if(inputString==null || inputString=='' || inputString==' ')
			{

			}else{
				
		$.ajax({
			type : "POST",
			url : '${pageContext.request.contextPath}/partner/getUserForTaggingList?post='+extractedText+'&partyId=${sessionScope.userSession.partyId}', // Database name search 
			success : function(result) {
				var i = 0;
				result = JSON.parse(result);
				userTypesList = result[0];
				var userLabelValueList = new Array();
				index = 0; 
				
				var selectedUserName = new Array(); 
				selectedUserName=post.split(";");
				
				for(var j=0;j<selectedUserName.length;j++)
					{
					selectedUserName[j]=selectedUserName[j].replace('@[','');
					selectedUserName[j]=selectedUserName[j].replace(']','');
					selectedUserName[j]=$.trim(selectedUserName[j]);
					}
				
				$(userTypesList).each(function(){
					if(index<userTypesList.length){
						if (selectedUserName
								.contains(userTypesList[index+1])) {
//							alert('in if'+userTypesList[index+1]);
						}else{
					var object = {};
					object.label = userTypesList[index];
					object.value = userTypesList[index+1];
//					alert('in else'+userTypesList[index]);
//					alert('in else'+userTypesList[index+1]);
					userLabelValueList.push(object);
						}
					index+=2;
					}  
				});
				console.log(userLabelValueList);
				$(".tagging")
			    // don't navigate away from the field on tab when selecting an item
			    .bind( "keydown", function( event ) {
			      if ( event.keyCode === $.ui.keyCode.TAB &&
			    	$( this ).data( "ui-autocomplete" ).menu.active ) {
			        event.preventDefault();
			      }
			    })
			   
			    
			    .autocomplete({
			      minLength: 0,
			      source: function( request, response ) {
			       last=extractLast(request.term);
			       if(last==null || last=='' || last==' ')
					{
						return false;
					}
			       if(!last.contains('@'))
			    	   {
			    	   
			    	   }else{
			       response( $.ui.autocomplete.filter(userLabelValueList, '') );}
			      },
			      focus: function() {
			        // prevent value inserted on focus
			        return false;
			      },
			     
			      select: function( event, ui ) {
			        var terms = split( this.value );
			        console.log('terms='+terms);
			        terms.pop();
			        // add the selected item 
			        terms.push('@['+ui.item.value+']');
					a=ui.item.value;
			        // add placeholder to get the comma-and-space at the end
			        terms.push( "" );
			        this.value = terms.join( "; " );
			        var labelArr = $(this).data('label') || new Array();
			        labelArr.push(ui.item);
			        $(this).data('label',labelArr);
			        console.log($(this).data());
			        return false;
			      }
			    });

			}
		});
		}
			}
	}
}
</script>
<!-- custom scroll to "common_in_content" -->
<!-- Filter section toggle ends -->

</head>
<div id="chatDialog" class="common_custom_modal_aa" style="width: 239px;height: 84px;">
  <!--   <span class="close" onclick="closeChatDialog();">X</span> -->
  <div class="modal_content" style="background: rgba(241, 241, 241, 0.99)">
    <div class="aa_up" id="chatMessage" style="height: 39px"></div>
    <div class="aa_down"><a style="margin-left: 50px;" href="#" onClick="closeChatDialog();" class="aa_yes">Ok</a></div>
  </div>
</div>

<body>
<jsp:include page="common_popup.jsp" />
<!-- Common_content Starts-->
<section class="content common_content">
 <%--  <jsp:include page="../layout/submenu_small.jsp"></jsp:include> --%>
  <!-- Common_in_contnet starts-->
  <section id="chat_list" class="in_content common_in_content clearfix">
    <div id="chat_filter">
      <ul class="reset clearfix parameters first">
        <li class="first lbl">Filter / Create Thread</li>
        <li class="first">
          <select id="contactType" onchange="getUserList()">
          </select>
        </li>
        <li class="second" id="chatOnRelatedPartyIdLi">
          <select id="chatOnRelatedPartyId">
            <option value="0">Contact</option>
          </select>
        </li>
      </ul>
      <ul class="reset clearfix parameters second">
        <li class="fourth">
          <textarea  class="common_input tagging" id="chatInput" onkeyup="getUserForTagging(event,0,id)" name="" cols="" rows=""></textarea>
        </li>
      </ul>
      <div class="filter_browse_file clearfix fl" id="filter_browse_file" class="clearfix fl">
      <input type="file" class="common_btn"  value="Browse" name="chatAttachment" id="filter_chatAttachment1">
      <input type="file" class="common_btn"  value="Browse" name="chatAttachment" id="filter_chatAttachment2">
      <input type="file" class="common_btn"  value="Browse" name="chatAttachment" id="filter_chatAttachment3">
    </div>
    <div class="filter_link_url clearfix fl" id="filter_link_url" class="clearfix fl">
    <p>Link URL</p>
    <input type="text" name="link" value="http://" id="chatLink" class="common_input" />
    </div>
    <ul class="reset clearfix action third">
      <li class="fl"><a class="filter_link link1 fl shareLinkFilterLink"><span class="txt">Link</span></a></li>
      <li class="fl"><a class="filter_file file1 fl shareFileFilterLink"><span class="txt">File</span></a></li>
      <li class="fl"><a class="filter_post post1 fl chattypepost sharepostFilterLink"><span class="txt">Post</span></a></li>
       <div class="clr"></div>  
      <li>
        <input type="submit" value="Create Thread" onclick="saveChat('top')" class="common_btn fr createThreadLink">
      </li>
    </ul>
    <div class="clr"></div>
    </div>
    <div class="div_dragger filterChatLink"><span></span></div>
    <!-- Chat Content Starts-->
    <div class="content">
      <ul id="chatListUl">
      </ul>
      <div id="chatDetailsDiv"></div>
    </div>
    <!-- end of "content"-->
    
    <div class="footer">
      <div class="footer-left fl">
        <textarea name="" class="tagging" cols="" rows="" id="chatInput1" onkeyup="getUserForTagging(event,0,id)"></textarea>
        <input type="submit" value="Share" onclick="saveChat('bottom')" class="common_btn fr shareChatLink">
      </div>
      <div class="footer-right fr"> <a class="link fl shareLinkLink"><span class="txt">Link</span></a> <a class="file fl shareFileLink"><span class="txt">File</span></a> <a class="post fl chattypepostbottom sharePostLink"><span class="txt">Post</span></a></div>
      <div class="browse_file clearfix fl" id="browse_file" class="clearfix fl">
      <input type="file" class="common_btn" value="Browse" name="chatAttachment" id="chatAttachment1">
      <input type="file" class="common_btn" value="Browse" name="chatAttachment" id="chatAttachment2">
      <input type="file" class="common_btn" value="Browse" name="chatAttachment" id="chatAttachment3">
    </div>
    <div class="link_url clearfix fl" id="link_url" class="clearfix fl">
    <p>Link URL</p>
    <input type="text" name="link" value="http://"  id="chatLink1" class="common_input"/>
    </div>
    </div>
    <!-- Chat Content Ends--> 
    
  </section>
  <div class="overlay"></div>
</section>
<form id="chatForm" enctype="multipart/form-data" method="post" action="<%=request.getContextPath() %>/partner/saveChat">
  <input type="hidden" id="xmlStringUserName" name="xmlStringUserName" value="">
  <input type="hidden" name="isTagging" id="isTagging" value="false"/>
  <input type="hidden" name="feedItemPost" id="feedItemPost"/>
  <input type="hidden" id="parentChatId" name="parentChatId" value="0">
  <input type="hidden" id="chatType" name="chatType" value="chat">
  <input type="hidden" id="chatOnRelatedPartyIdToSend" name="chatOnRelatedPartyId" >
  <input type="hidden" id="contact" name="contact" >
  <input type="hidden" id="feedLinkURL" name="feedLinkURL" >
  <input type="hidden" id="feedLinkPost" name="feedLinkPost" >
  <input type="hidden" id="feedFilePost" name="feedFilePost" >
  <input type="hidden" id="feedItemComment" name="feedItemComment" >
  <input type="hidden" id="feedFileComment" name="feedFileComment" >
  <input type="hidden" id="feedLinkComment" name="feedLinkComment" >
  <input type="hidden" id="feedLinkCommentURL" name="feedLinkCommentURL" >
  <div class="none" id="attachmentDiv"> </div>
</form>
<form id="downloadAttachmentForm" method="post" action="<%=request.getContextPath()%>/partner/downloadDocument">
  <input type="hidden" name="docId" id="documentIdToDownload">
</form>
</body>
</html>
