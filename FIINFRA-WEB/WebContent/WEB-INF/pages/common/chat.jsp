<%@ page contentType="text/html; charset=UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
<link href="<%=request.getContextPath()%>/images/favicon.ico" rel="shortcut icon">
<title>Chat</title>
</head>
<body>
<jsp:include page="header.jsp" />
        <input id="contextPath" type="hidden" name="contextPath" 
		value="<%=request.getContextPath()%>" />
        <input type="hidden" name="roleId" value="7" id="roleId" />
        
        <!-- Center part start -->
        <section>
          <div class="">
            <div class="container-head">
              <div class="col-md-12" style="text-align: right;">
                <div class="page-header clearfix">
                  <h1 class="pull-left">Chat</h1>
                </div>
                <div class="dropdown" >
                  <div class="dropdown-menu fright thead serchboxnew" >
                    <form class="form-signin" role="form">
                      <div class="selectlistauto" style="color: #000;font-size: 12px;line-height: 20px;">
                        <label class="radio-inline">
                          <input type="radio" id="optionsRadios" value="option1">
                          Client </label>
                        <label class="radio-inline">
                          <input type="radio" id="optionsRadios" value="option2">
                          Opportunity </label>
                      </div>
                      <div class="selectlistauto">
                        <select name="Saving" class="form-control">
                          <option>Search By Client : </option>
                          <option>Priyanka Test</option>
                          <option>Mahesh Test</option>
                          <option>Aditi Test</option>
                          <option>Yog Test</option>
                          <option> Test Raj sawant</option>
                          <option>Test virtual lead</option>
                        </select>
                      </div>
                      <div style="float:left;  margin-left:10px;"></div>
                    </form>
                  </div>
                </div>
                <div class="col-md-3">&nbsp; </div>
              </div>
            </div>
            <div class="container-body"> 
              <!--center -->
              <form   id="chatForm" name="chatForm" enctype="multipart/form-data" method="post">
                <input type="hidden" id="xmlStringUserName" name="xmlStringUserName">
                <input type="hidden" name="isTagging" 
		id="isTagging" />
                <div class="row mainchatbox " >
                  <div class="col-md-9 westspace6 southspace3" > <span > <a href="#" class="strong btn btn-primary btn-xs btn-inverse" id="post">Post <i class="fa fa-comment bigger-130 "></i></a> <a href="#" class="strong btn btn-primary btn-xs " id="file">File <i class="fa fa-file bigger-130 "></i></a> <a href="#" class="strong btn btn-primary btn-xs " id="link">Link <i class="fa fa-link bigger-130"></i></a> <br>
                    <br>
                    <span class="label label-gray arrowed-right arrowed-in strong">Contact</span>&nbsp;
                    <select type="button" name="contact" id="contact" value="10"
							onchange="getUserList()">
                    </select>
                    <select type="button" name="chatOnRelatedPartyId" id="chatOnRelatedPartyId">
                      <option value="0">--Select--</option>
                    </select>
                    <input  type="button" class="btn btn-primary btn-xs" value="Show" title="Show" alt="Show" onclick="retiveAllChats('Show')">
                  </div>
                </div>
                <div id="partner_chatter_newPost" class="row mainchatbox itemdiv dialogdiv"  style="display: none;">
                  <div class="user"> <img src="<%=request.getContextPath()%>/app/images${sessionScope.userSession.photo}" onerror="showDefaultImageOnError(id)" id="loginUserphoto"></div>
                  <div class="comment body clearfix">
                    <div class="col-md-12">
                      <div class="col-md-10">
                        <div class="chatbox">
                          <div class="chattercontent">
                            <textarea class="form-control custom-width tagging" name="feedItemPost" id="feedItemPost" rows="3" onkeyup="getUserForTagging(event,id);"  placeholder="comment " style="height: 50px; margin-left:00px; "></textarea>
                            <br>
                            <input type="button" value="Share" class="btn btn-inverse btn-xs" onclick="saveChat('Post');" title="Share" style="float: left !important;">
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
                <div id="partner_chatter_newPostFile" class="row mainchatbox itemdiv dialogdiv"  style="display: none;">
                  <div class="user"> <img src="images/chatuser.png"></div>
                  <div class="comment body clearfix">
                    <div class="col-md-12">
                      <div class="col-md-10">
                        <div class="chatbox">
                          <div class="chattercontent">
                            <textarea class="form-control custom-width tagging" name="feedFilePost" id="feedFilePost" rows="3" onkeyup="getUserForTagging(event,id);" placeholder="comment " style="height: 50px; margin-left:00px; "></textarea>
                            <br>
                            <span class="col-md-6" id="feedCommentphotosspan">
	                             <input type="file" name="chatAttachment" id="feedCommentphoto1" >
	                             <input type="file" name="chatAttachment" id="feedCommentphoto2" >
	                             <input type="file" name="chatAttachment" id="feedCommentphoto3" >
                            </span>
                            <br>
                            </div>
                           
                        </div>
                      </div>
                     
                        <div class="col-md-6">
                         <div class="space"></div>
                             <input type="button" value="Share" class="btn btn-inverse btn-xs" onclick="saveChat('File');" title="Share" style="float: left !important;">
                        </div>
                            
                    </div>
                  </div>
                </div>
                <div id="partner_chatter_newPostLink" class="row mainchatbox itemdiv dialogdiv"  style="display: none;">
                  <div class="user"><img src="images/chatuser.png"></div>
                  <div class="comment body clearfix">
                    <div class="col-md-12">
                      <div class="col-md-10">
                        <div class="chatbox">
                          <div class="chattercontent">
                            <textarea class="form-control custom-width tagging" name="feedLinkPost" id="feedLinkPost" onkeyup="getUserForTagging(event,id);" rows="3" placeholder="comment " style="height: 50px; margin-left:00px; "></textarea>
                            <br>
                            <span > Link URL :
                            <input type="text" name="feedLinkURL" id="feedLinkURL" class="input-xxlarge" value="http://" maxlength="1000">
                            <input type="button" value="Share" class="btn btn-inverse btn-xs" onclick="saveChat('Link');" title="Share" >
                            </span> </div>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
                <div id="chatterData"> </div>
                <textarea id="feedItemComment"  name="feedItemComment" rows="3" style="display: none;"></textarea>
                <textarea id="feedFileComment"  name="feedFileComment" rows="3" style="display: none;"></textarea>
                <textarea id="feedLinkComment"  name="feedLinkComment" rows="3" style="display: none;"></textarea>
                <input type="hidden" name="feedLinkCommentURL" id="feedLinkCommentURL">
                <input type="hidden" id="chatType" name="chatType" >
                <input type="hidden" id="parentChatId" name="parentChatId" >
              </form>
              <form id="downloadAttachmentForm" method="post" action="<%=request.getContextPath()%>/common/downloadDocument.htm">
                <input type="hidden" name="docId" id="documentIdToDownload">
              </form>
            </div>
          </div>
        </section>
        <!-- Center part End -->
        
        <jsp:include page="../common/footer.jsp" />
<script>

function enableTf(){
$("#commect1, #file, #link").show();	


}
function enableTf1(){
$("#commect2, #file2, #link2").show();	


}

</script>
<script type="text/javascript">



$(document).ready(function() {
	showSelectedTab('chatLink');
	retriveDataForContactandType();
	retiveAllChats("");
	$("#partner_chatter_newPost").show();
	$("#post").click(function() {
	
		$("#partner_chatter_newPost").show("fast");
		$("#partner_chatter_newPostFile").hide();
		$("#feedFilePost").val('');
		$("#feedLinkPost").val('');
		$("#feedLinkURL").val('');
		$("#feedLinkName").val('');
		$("#feedCommentphoto").val('');
		$("#partner_chatter_newPostLink").hide();
		$("#post").addClass('btn-inverse');
		$("#post").removeClass('btn-primary');
		$("#file").removeClass('btn-inverse');
		$("#file").addClass('btn-primary');
		$("#link").removeClass('btn-inverse');
		$("#link").addClass('btn-primary');
	});
	$("#file").click(function() {
		$("#partner_chatter_newPost").hide();
		$("#partner_chatter_newPostFile").show("fast");
		$("#partner_chatter_newPostLink").hide();
		$("#feedItemPost").val('');
		$("#feedLinkPost").val('');
		$("#feedLinkURL").val('');
		$("#feedLinkName").val('');
		$("#post").removeClass('btn-inverse');
		$("#post").addClass('btn-primary');
		$("#file").addClass('btn-inverse');
		$("#file").removeClass('btn-primary');
		$("#link").removeClass('btn-inverse');
		$("#link").addClass('btn-primary');
	});
	$("#link").click(function() {
		$("#partner_chatter_newPost").hide();
		$("#partner_chatter_newPostFile").hide();
		$("#partner_chatter_newPostLink").show("fast");
		
		$("#feedLinkURL").val("http://");
		$("#feedFilePost").val('');
		$("#feedCommentphoto").val('');
		$("#feedItemPost").val('');
		$("#post").removeClass('btn-inverse');
		$("#post").addClass('btn-primary');
		$("#file").removeClass('btn-inverse');
		$("#file").addClass('btn-primary');
		$("#link").addClass('btn-inverse');
		$("#link").removeClass('btn-primary');

	});
	$("#Ipost").click(function() {
		$("#partner_chatter_newPost").show("fast");
		$("#partner_chatter_newPostFile").hide();
		$("#feedFilePost").val('');
		$("#feedLinkPost").val('');
		$("#feedLinkURL").val('');
		$("#feedLinkName").val('');
		$("#feedCommentphoto").val('');
		$("#partner_chatter_newPostLink").hide();
		$("#Ipost").addClass('btn-inverse');
		$("#Ipost").removeClass('btn-primary');
		$("#Fpost").removeClass('btn-inverse');
		$("#Fpost").addClass('btn-primary');
		$("#Lpost").removeClass('btn-inverse');
		$("#Lpost").addClass('btn-primary');
	});
	$("#Fpost").click(function() {
		$("#partner_chatter_newPost").hide();
		$("#partner_chatter_newPostFile").show("fast");
		$("#partner_chatter_newPostLink").hide();
		$("#feedItemPost").val('');
		$("#feedLinkPost").val('');
		$("#feedLinkURL").val('');
		$("#feedLinkName").val('');
		$("#Ipost").removeClass('btn-inverse');
		$("#Ipost").addClass('btn-primary');
		$("#Fpost").addClass('btn-inverse');
		$("#Fpost").removeClass('btn-primary');
		$("#Lpost").removeClass('btn-inverse');
		$("#Lpost").addClass('btn-primary');
	});
	$("#Lpost").click(function() {
		$("#partner_chatter_newPost").hide();
		$("#partner_chatter_newPostFile").hide();
		$("#partner_chatter_newPostLink").show("fast");
		$("#feedLinkURL").val("http://");
		$("#feedFilePost").val('');
		$("#feedCommentphoto").val('');
		$("#feedItemPost").val('');
		$("#Ipost").removeClass('btn-inverse');
		$("#Ipost").addClass('btn-primary');
		$("#Fpost").removeClass('btn-inverse');
		$("#Fpost").addClass('btn-primary');
		$("#Lpost").addClass('btn-inverse');
		$("#Lpost").removeClass('btn-primary');

	});
	
	$('#feedCommentphoto1').change(function() {
		$('#chatAttachment1dailog').hide();
		$('#chatAttachment1name').html($('#feedCommentphoto1').val().substring($('#feedCommentphoto1').val().lastIndexOf('\\')+1)+' <a onclick="removeattachment(\'feedCommentphoto1\')">Remove</a>');
		$('#chatAttachment1name').show();
	});
	$('#feedCommentphoto2').change(function() {
		$('#chatAttachment2dailog').hide();
		$('#chatAttachment2name').html($('#feedCommentphoto2').val().substring($('#feedCommentphoto2').val().lastIndexOf('\\')+1)+' <a onclick="removeattachment(\'feedCommentphoto2\')">Remove</a>');
		$('#chatAttachment2name').show();
	});
	$('#feedCommentphoto3').change(function() {
		$('#chatAttachment3dailog').hide();
		$('#chatAttachment3name').html($('#feedCommentphoto3').val().substring($('#feedCommentphoto3').val().lastIndexOf('\\')+1)+' <a onclick="removeattachment(\'feedCommentphoto3\')">Remove</a>');
		$('#chatAttachment3name').show();
	});

});
function openFileDailog(id){
	$('#'+id).click();
}
function removeattachment(id){
	$('#'+id+'dailog').show();
	$('#'+id+'name').html('');
	$('#'+id+'name').hide();
	$('#'+id).val('');
}

/* Function Use to load all Contat type. */
function retriveDataForContactandType() {
	var roleId = $('#roleId').val();

	var loggedInUserPartyId = $('#partyIdHidden').val();
	$.ajax({
		type : "POST",
		url : $('#contextPath').val()
				+ '/common/getContactDetailsList.htm?roleId=' + roleId
				+ '&loggedInUserPartyId=' + loggedInUserPartyId,
		success : function(result) {
			result = JSON.parse(result);
			$('#contact').empty();
			$('#contact').append(
			' <option value="0">--Select--</option>');
			$(result).each(
					function(i, obj) {
						var codeValueId = obj.codeValueId;
						var codeValue = obj.codeValue;
						$('#contact').append(
								'<option value="'+codeValueId+'">'
										+ codeValue + '</option>');
					});
		}
	});
}

/* Function used to show commentbox as per user click on comment type. */
function showCommentBox(id,commentType) {
	$('#feedItemCommentDiv'+id).hide();
	if(commentType=='fCpost')
		{     
			$('#feedItemCommentDiv'+id).show();
			$('#feedFileComment'+id).val('');
			$('#feedLinkComment'+id).val('');
			$('#feedLinkCommentURL'+id).val('');
			$('#feedFileCommentDiv'+id).hide();
			$('#feedLinkCommentDiv'+id).hide();
			$("#fCpost"+id).addClass('grey');
			$("#fileCPost"+id).removeClass('grey');
			$("#linkCPost"+id).removeClass('grey');
			
		}
	else if(commentType=='fileCPost')
		{
			$('#feedItemComment'+id).val('');
			$('#feedLinkComment'+id).val('');
			$('#feedLinkCommentURL'+id).val('');
			$('#feedFileCommentDiv'+id).show();
			$('#feedItemCommentDiv'+id).hide();
			$('#feedLinkCommentDiv'+id).hide();
			$("#fCpost"+id).removeClass('grey');
			$("#fileCPost"+id).addClass('grey');
			$("#linkCPost"+id).removeClass('grey');
			
		}
	else{
			$('#feedItemComment'+id).val('');
			$('#feedFileComment'+id).val('');
			$('#feedLinkCommentDiv'+id).show();
			$('#feedItemCommentDiv'+id).hide();
			$('#feedFileCommentDiv'+id).hide();
			$("#fCpost"+id).removeClass('grey');
			$("#fileCPost"+id).removeClass('grey');
			$("#linkCPost"+id).addClass('grey');
		}
}

/* Function used to give ajax call and fetch all chat and comments details.
   Later used to build daynamic UI for Chat and Comments. */
function retiveAllChats(button)
{
	var isValidated=true;
	var startValue=0;
	var loggedInUserPartyId;
	var recordType = $('#contact').val();
	var chatOnRelatedPartyId= $('#chatOnRelatedPartyId').val();

	


	if(button=='Show')
		{
			 loggedInUserPartyId = $('#chatOnRelatedPartyId').val();	
			// alert('loggedInUserPartyId='+loggedInUserPartyId)
			if(recordType=='0')
	{
		addCssStyles('contact','Please select contact.');
		if(isValidated==true){
			isValidated=false;
			showAlertMessage("Error","There are some validation errors,please check to proceed further.", 'error', doNothing);
		}
	}
else{
	removeCssStyles('contact');
}
if(recordType !='0' )
{
	if(chatOnRelatedPartyId=='0')
		{
			addCssStyles('chatOnRelatedPartyId','Please select User.');
			if(isValidated==true){
				isValidated=false;
				showAlertMessage("Error","There are some validation errors,please check to proceed further.", 'error', doNothing);
			}
		}
	else{
		removeCssStyles('contact');
	}
}
		}
	else{
			 loggedInUserPartyId = $('#partyIdHidden').val();	
			// alert('loggedInUserPartyId='+loggedInUserPartyId);
		}
	//alert('loggedInUserPartyId='+loggedInUserPartyId);
	if(loggedInUserPartyId==0)
		{
		return;
		}
	var chatPosterImage;
	var commentPosterImage
$('#chatterData').empty();
	$.ajax({
		type : "POST",
		url : $('#contextPath').val()
				+ '/common/getAllchatsAndCommentList.htm?loggedInUserPartyId='+loggedInUserPartyId+'&startValue='+startValue,
		success : function(result) {
			result = JSON.parse(result);
			var chatterList=result[0];
			var commentList=result[1];
			var basePathChat=result[2];
			//alert("basePathChat="+basePathChat)
			$(chatterList).each(
					function(i, obj) {
						chatPosterImage=basePathChat+obj.userphotoFileName;	
						//alert(chatPosterImage);
						$('#chatterData').append('<div class="row mainchatbox itemdiv dialogdiv" id="mainChatter'+obj.chatid+'"></div>');
						$('#mainChatter'+obj.chatid).append("<div class='user'><img src='${pageContext.request.contextPath}/app/images"+obj.userphotoFileName+"' id='chatDefaultImage"+obj.chatid+"' onerror='showDefaultImageOnError(id)'></div><div class='comment body clearfix'  id='chat"+obj.chatid+"'>");

						$("#chat"+obj.chatid).append("<div class='col-md-12' id='col-md-9"+obj.chatid+"'>");
						$("#col-md-9"+obj.chatid).append("<div class='chatarow' id='chatarow"+obj.chatid+"'>");
					
						$("#col-md-9"+obj.chatid).append("<div class='col-md-10' id='col-md-10"+obj.chatid+"'>");
						$("#col-md-10"+obj.chatid).append("<div class='chatbox' id='chatbox"+obj.chatid+"'>");
						$("#chatbox"+obj.chatid).append("<div class='chattercontent' id='chattercontent"+obj.chatid+"'>");
						$("#chattercontent"+obj.chatid).append("<p id='p"+obj.chatid+"'><a onclick='viewOpportunityProfileDetails(${data.partyId})'>"+obj.postedBy+" </a> Posted On "+obj.postedToUserType+" <a >"+obj.postedFor+"</a><br><h3>"+obj.chatText+"</h3>");
						$("#chattercontent"+obj.chatid).append("</p>");
						if(obj.type=='Text')
							{
								
							}
						else if(obj.type=='Content')
							{
								if(obj.attachment1DocumentId !=0){
								$("#chattercontent"+obj.chatid).append("<p class='date'><a  style='float: left;' onclick='downloadAttachment("+obj.attachment1DocumentId+")' title='"+obj.contentFileName1+"'>"+obj.contentFileName1+"</a></p><br>  ");
								}
								if(obj.attachment2DocumentId !=0){
									$("#chattercontent"+obj.chatid).append("<p class='date'><a  style='float: left;' onclick='downloadAttachment("+obj.attachment2DocumentId+")' title='"+obj.contentFileName2+"'>"+obj.contentFileName2+"</a></p><br>  ");	
								}
								if(obj.attachment3DocumentId !=0){
								$("#chattercontent"+obj.chatid).append("<p class='date'><a  style='float: left;' onclick='downloadAttachment("+obj.attachment3DocumentId+")' title='"+obj.contentFileName3+"'>"+obj.contentFileName3+"</a></p><br>");
								}
							}
						else{
							$("#chattercontent"+obj.chatid).append("<p><a target='_blank'  href='"+obj.chatURL+"' title='"+obj.chatURL+"'>"+obj.chatURL+"</a></p>");
						}
						$("#chattercontent"+obj.chatid).append("<div class='date' >"+obj.createdDate+" </div>");
						$("#chattercontent"+obj.chatid).append("<span style='float:left;margin-top:10px;' id='mainSpan"+obj.chatid+"'>");
						$("#mainSpan"+obj.chatid).append('<i class="fa fa-comment bigger-160 grey" id="fCpost'+obj.chatid+'" onclick="showCommentBox('+obj.chatid+',\'fCpost\')" title="Comment" alt="Comment"></i>');
						
						$("#mainSpan"+obj.chatid).append('<i class="fa fa-file bigger-130 westspace3" src="images/file_icon.png"  id="fileCPost'+obj.chatid+'" onclick="showCommentBox('+obj.chatid+',\'fileCPost\')" title="File" alt="File"></i>');
						$("#mainSpan"+obj.chatid).append('<i class="fa fa-link bigger-130 westspace3" id="linkCPost'+obj.chatid+'" onclick="showCommentBox('+obj.chatid+',\'linkCPost\')" title="Link" alt="Link"></i> </span>  <br> <br></p>');
						
						$("#chattercontent"+obj.chatid).append("<div class='row' id='feedItemCommentDiv"+obj.chatid+"' >");
						$("#feedItemCommentDiv"+obj.chatid).append("<textarea class='form-control custom-width tagging' id='feedItemComment"+obj.chatid+"' onkeyup='getUserForTagging(event,"+obj.chatid+");'  rows='3' placeholder='comment' style='height: 50px; margin-left:00px; '></textarea><br>");
						$("#chattercontent"+obj.chatid).append("</div>");
						
						$("#chattercontent"+obj.chatid).append("<div class='row' id='feedFileCommentDiv"+obj.chatid+"' style='display:none;' >");
						$("#feedFileCommentDiv"+obj.chatid).append("<textarea class='form-control custom-width tagging' id='feedFileComment"+obj.chatid+"'  onkeyup='getUserForTagging(event,"+obj.chatid+");' rows='3' placeholder='comment' style='height: 50px; margin-left:00px;'></textarea><br>");
						$("#feedFileCommentDiv"+obj.chatid).append("<span class='col-md-6'><input type='file' name='commentAttachment' id='feedCommentphoto1"+obj.chatid+"'><input type='file' name='commentAttachment' id='feedCommentphoto2"+obj.chatid+"'><input type='file' name='commentAttachment' id='feedCommentphoto3"+obj.chatid+"'><br></span>");
						$("#feedFileCommentDiv"+obj.chatid).append("<input type='hidden' name='partyIdOfCurrentFeed"+obj.chatid+"' id='partyIdOfCurrentFeed"+obj.chatid+"' value='"+obj.chatOnRelatedPartyId+"'>");
						$("#chattercontent"+obj.chatid).append("</div>");
						$("#chattercontent"+obj.chatid).append("<div class='row' id='feedLinkCommentDiv"+obj.chatid+"' style='display:none'>");
						$("#feedLinkCommentDiv"+obj.chatid).append("<textarea class='form-control custom-width tagging'  id='feedLinkComment"+obj.chatid+"' rows='3' onkeyup='getUserForTagging(event,"+obj.chatid+");' placeholder='comment' style='height: 50px; margin-left:00px;'></textarea>");
		                $("#feedLinkCommentDiv"+obj.chatid).append("<br><span> Link URL : <input type='text'  id='feedLinkCommentURL"+obj.chatid+"' class='input-xxlarge southspace2' value='http://' maxlength='1000'></span>");
						$("#chattercontent"+obj.chatid).append("</div>");
						$("#chattercontent"+obj.chatid).append("<input type='button' value='Share' class='btn btn-inverse btn-xs' onclick='setCommentDataToCommentForm("+obj.chatid+");' title='Share'>");
						
						
						$("#chatbox"+obj.chatid).append("</div>");/*end of chattercontent*/
						$("#col-md-10"+obj.chatid).append("</div>");/*end of chatbox*/
						$("#col-md-9"+obj.chatid).append("</div>");/*end of col-md-10*/
						$("#chat"+obj.chatid).append("</div>");/*end of col-md-9*/
						$("#mainChatter").append("</div>");/*end of chat*/
						$("#chat"+obj.chatid).append('<div class="row" id="mainComment'+obj.chatid+'"></div>');	
					});
			$(commentList).each(
					function(i, commentobj) {
					
						$('#chatterData').append("<div id='mainComment"+commentobj.commentChatId+"'>");
						$('#mainComment'+commentobj.parentChatID).append(" <div class='comment row' id='comment"+commentobj.commentChatId+"' >");
						$("#comment"+commentobj.commentChatId).append("<div class='col-md-1'></div>");
						$("#comment"+commentobj.commentChatId).append("<div class='col-md-10 itemdiv dialogdiv' id='col-md-9"+commentobj.commentChatId+"'>");
						$("#col-md-9"+commentobj.commentChatId).append("<div class='body southspace1 col-md-10 clearfix fn' id='col-md-10"+commentobj.commentChatId+"'>");
						$("#col-md-10"+commentobj.commentChatId).append("<div class='chatboxcomment' id='chatboxcomment"+commentobj.commentChatId+"'>");
						$("#chatboxcomment"+commentobj.commentChatId).append("<div class='chattercontent' id='chattercontent"+commentobj.commentChatId+"'>");
						$("#chattercontent"+commentobj.commentChatId).append('<div class="col-md-1 pull-left"><img src="${pageContext.request.contextPath}/app/images'+commentobj.userphotoFileName+'" onerror="showDefaultImageOnError(id)" id="chatDefaultImage'+commentobj.commentChatId+'" style="width:28px;height:28px">&nbsp; &nbsp;</div>');
						$("#chattercontent"+commentobj.commentChatId).append("<div class='col-md-11' id='col-md-11"+commentobj.commentChatId+"' >");
						$("#col-md-11"+commentobj.commentChatId).append("<p id='p"+commentobj.commentChatId+"'><a >"+commentobj.createdBy+" </a> ");
						$("#col-md-11"+commentobj.commentChatId).append("<div class='coment' id='chatComment"+commentobj.commentChatId+"'>"+commentobj.chatText+"</div>");
						if(commentobj.commentType=='Text')
						{
							
						}
					else if(commentobj.commentType=='Content')
						{
							if(commentobj.attachment1DocumentId !=0){
							$("#col-md-11"+commentobj.commentChatId).append("<p class='date'><a  style='float: left;' onclick='downloadAttachment("+commentobj.attachment1DocumentId+")' title='"+commentobj.contentFileName1+"'>"+commentobj.contentFileName1+"</a></p><br> ");
							}
							if(commentobj.attachment2DocumentId !=0){
								$("#col-md-11"+commentobj.commentChatId).append("<p class='date'><a  style='float: left;' onclick='downloadAttachment("+commentobj.attachment2DocumentId+")' title='"+commentobj.contentFileName2+"'>"+commentobj.contentFileName2+"</a></p><br>");	
							}
							if(commentobj.attachment3DocumentId !=0){
							$("#col-md-11"+commentobj.commentChatId).append("<p class='date'><a  style='float: left;' onclick='downloadAttachment("+commentobj.attachment3DocumentId+")' title='"+commentobj.contentFileName3+"'>"+commentobj.contentFileName3+"</a></p><br>");
							}
						}
					else{
						$("#col-md-11"+commentobj.commentChatId).append("<p><a target='_blank'  href='"+commentobj.chatURL+"' title='"+commentobj.chatURL+"'>"+commentobj.chatURL+"</a></p>");
					}
						$("#chatComment"+commentobj.commentChatId).append("<div class='date'>"+commentobj.createdDate+"</div>");
						$("#chattercontent"+commentobj.commentChatId).append("</div>");/* end of div col-md-11*/
						$("#chatboxcomment"+commentobj.commentChatId).append("</div>");/* end of div chattercontent*/
						$("#col-md-10"+commentobj.commentChatId).append("</div>");/* end of div chatboxcomment*/
						$("#col-md-9"+commentobj.commentChatId).append("</div>");/* end of div col-md-10*/
						$("#comment"+commentobj.commentChatId).append("</div>");/* end of div col-md-9*/
						$('#mainComment'+commentobj.parentChatID).append("</div>");
						$('#chatterData').append("</div>");
					});
			
			$contentLoadTriggered = false;
			$('input[type="file"]').ace_file_input({
				no_file:'No File ...',
				btn_choose:'Choose',
				btn_change:'Change',
				droppable:false,
				onchange:null,
				thumbnail:false //| true | large
				//whitelist:'gif|png|jpg|jpeg'
				//blacklist:'exe|php'
				//onchange:''
				//
			});
		}
	});	
	$contentLoadTriggered = false;
		$(window).scroll(function(){
			if ($(window).scrollTop() == $(document).height() - $(window).height()){
				startValue=startValue+1;

				loggedInUserPartyId = $('#chatOnRelatedPartyId').val();
				if(loggedInUserPartyId=='0')
					{
						loggedInUserPartyId = $('#partyIdHidden').val();	
					}
				$contentLoadTriggered = true;
				$.ajax({
					type : "POST",
					url : $('#contextPath').val()
							+ '/common/getAllchatsAndCommentList.htm?loggedInUserPartyId=' + loggedInUserPartyId+'&startValue='+startValue,
					success : function(result) {
						result = JSON.parse(result);
						var chatterList=result[0];
						var commentList=result[1];
						
						$(chatterList).each(
								function(i, obj) {
									$('#chatterData').append('<div class="row mainchatbox itemdiv dialogdiv" id="mainChatter'+obj.chatid+'"></div>');
									$('#mainChatter'+obj.chatid).append("<div class='user'><img src='${pageContext.request.contextPath}/app/images"+obj.userphotoFileName+"' onerror='showDefaultImageOnError(id)' id='chatDefaultImage"+obj.chatid+"'></div><div class='comment body clearfix' id='chat"+obj.chatid+"'>");
									$("#chat"+obj.chatid).append("<div class='col-md-9' id='col-md-9"+obj.chatid+"'>");
									$("#col-md-9"+obj.chatid).append("<div class='chatarow' id='chatarow"+obj.chatid+"'>");
									$("#col-md-9"+obj.chatid).append("<div class='col-md-10' id='col-md-10"+obj.chatid+"'>");
									$("#col-md-10"+obj.chatid).append("<div class='chatbox' id='chatbox"+obj.chatid+"'>");
									$("#chatbox"+obj.chatid).append("<div class='chattercontent' id='chattercontent"+obj.chatid+"'>");
									$("#chattercontent"+obj.chatid).append("<p id='p"+obj.chatid+"'><a >"+obj.postedBy+" </a> Posted On "+obj.postedToUserType+" <a >"+obj.postedFor+"</a><br><h3>"+obj.chatText+"</h3>");
									$("#chattercontent"+obj.chatid).append("</p>");
									if(obj.type=='Text')
										{
											
										}
									else if(obj.type=='Content')
										{
											if(obj.attachment1DocumentId !=0){
											$("#chattercontent"+obj.chatid).append("<p class='date'><a  style='float: left;' onclick='downloadAttachment("+obj.attachment1DocumentId+")' title='"+obj.contentFileName1+"'>"+obj.contentFileName1+"</a></p><br>  ");
											}
											if(obj.attachment2DocumentId !=0){
												$("#chattercontent"+obj.chatid).append("<p class='date'><a  style='float: left;' onclick='downloadAttachment("+obj.attachment2DocumentId+")' title='"+obj.contentFileName2+"'>"+obj.contentFileName2+"</a></p><br>  ");	
											}
											if(obj.attachment3DocumentId !=0){
											$("#chattercontent"+obj.chatid).append("<p class='date'><a  style='float: left;' onclick='downloadAttachment("+obj.attachment3DocumentId+")' title='"+obj.contentFileName3+"'>"+obj.contentFileName3+"</a></p><br>");
											}
										}
									else{
										$("#chattercontent"+obj.chatid).append("<p><a target='_blank'  href='"+obj.chatURL+"' title='"+obj.chatURL+"'>"+obj.chatURL+"</a></p>");
									}
									$("#chattercontent"+obj.chatid).append("<div class='date' >"+obj.createdDate+" </div>");
									$("#chattercontent"+obj.chatid).append("<span style='float:left;margin-top:10px;' id='mainSpan"+obj.chatid+"'>");
									$("#mainSpan"+obj.chatid).append('<i class="fa fa-comment bigger-160 grey" id="fCpost'+obj.chatid+'" onclick="showCommentBox('+obj.chatid+',\'fCpost\')" title="Comment" alt="Comment"></i>');
									
									$("#mainSpan"+obj.chatid).append('<i class="fa fa-file bigger-130 westspace3 westspace3" src="images/file_icon.png"  id="fileCPost'+obj.chatid+'" onclick="showCommentBox('+obj.chatid+',\'fileCPost\')" title="File" alt="File"></i>');
									$("#mainSpan"+obj.chatid).append('<i class="fa fa-link bigger-130 westspace3" id="linkCPost'+obj.chatid+'" onclick="showCommentBox('+obj.chatid+',\'linkCPost\')" title="Link" alt="Link"></i></span>  <br> <br></p>');
									
									$("#chattercontent"+obj.chatid).append("<div class='row' id='feedItemCommentDiv"+obj.chatid+"' >");
									$("#feedItemCommentDiv"+obj.chatid).append("<textarea class='form-control' id='feedItemComment"+obj.chatid+"'   rows='3' placeholder='comment' style='height: 50px; margin-left:00px; '></textarea><br>");
									$("#chattercontent"+obj.chatid).append("</div>");
									
									$("#chattercontent"+obj.chatid).append("<div class='row' id='feedFileCommentDiv"+obj.chatid+"' style='display:none;' >");
									$("#feedFileCommentDiv"+obj.chatid).append("<textarea class='form-control' id='feedFileComment"+obj.chatid+"'  rows='3' placeholder='comment' style='height: 50px; margin-left:00px;'></textarea><br>");
									$("#feedFileCommentDiv"+obj.chatid).append("<span class='col-md-6'><input type='file' name='commentAttachment' id='feedCommentphoto1"+obj.chatid+"'><input type='file' name='commentAttachment' id='feedCommentphoto2"+obj.chatid+"'><input type='file' name='commentAttachment' id='feedCommentphoto3"+obj.chatid+"'><br></span>");
									$("#chattercontent"+obj.chatid).append("</div>");
									$("#chattercontent"+obj.chatid).append("<div class='row' id='feedLinkCommentDiv"+obj.chatid+"' style='display:none'>");
									$("#feedLinkCommentDiv"+obj.chatid).append("<textarea class='form-control'  id='feedLinkComment"+obj.chatid+"' rows='3' placeholder='comment' style='height: 50px; margin-left:00px;'></textarea>");
					                $("#feedLinkCommentDiv"+obj.chatid).append("<br><span> Link URL : <input type='text'  id='feedLinkCommentURL"+obj.chatid+"' class='input-xxlarge southspace2' value='http://' maxlength='1000'></span>");
									$("#chattercontent"+obj.chatid).append("</div>");
									$("#chattercontent"+obj.chatid).append("<input type='button' value='Share' class='btn btn-inverse btn-xs' onclick='setCommentDataToCommentForm("+obj.chatid+");' title='Share' >");
									
									$("#chatbox"+obj.chatid).append("</div>");/*end of chattercontent*/
									$("#col-md-10"+obj.chatid).append("</div>");/*end of chatbox*/
									$("#col-md-9"+obj.chatid).append("</div>");/*end of col-md-10*/
									$("#chat"+obj.chatid).append("</div>");/*end of col-md-9*/
									$("#mainChatter").append("</div>");/*end of chat*/
									$('#mainChatter'+obj.chatid).append('<div class="row" id="mainComment'+obj.chatid+'"></div>');	
								});
						$(commentList).each(
								function(i, commentobj) {
									$('#chatterData').append("<div id='mainComment"+commentobj.commentChatId+"'>");
									$('#mainComment'+commentobj.parentChatID).append(" <div class='comment row' id='comment"+commentobj.commentChatId+"' >");
									$("#comment"+commentobj.commentChatId).append("<div class='col-md-1'></div>");
									$("#comment"+commentobj.commentChatId).append("<div class='col-md-10 itemdiv dialogdiv' id='col-md-9"+commentobj.commentChatId+"'>");
									$("#col-md-9"+commentobj.commentChatId).append("<div class='body southspace1 col-md-10 clearfix fn' id='col-md-10"+commentobj.commentChatId+"'>");
									$("#col-md-10"+commentobj.commentChatId).append("<div class='chatboxcomment body clearfix' id='chatboxcomment"+commentobj.commentChatId+"'>");
									$("#chatboxcomment"+commentobj.commentChatId).append("<div class='chattercontent' id='chattercontent"+commentobj.commentChatId+"'>");
									$("#chattercontent"+commentobj.commentChatId).append('<div class="col-md-1 pull-left"><img src="${pageContext.request.contextPath}/app/images'+commentobj.userphotoFileName+'" onerror="showDefaultImageOnError(id)" id="chatDefaultImage'+commentobj.commentChatId+'" style="width:28px;height:28px">&nbsp; &nbsp;</div>');
									$("#chattercontent"+commentobj.commentChatId).append("<div class='col-md-11' id='col-md-11"+commentobj.commentChatId+"' >");
									$("#col-md-11"+commentobj.commentChatId).append("<p id='p"+commentobj.commentChatId+"'><a >"+commentobj.createdBy+" </a> ");
									$("#col-md-11"+commentobj.commentChatId).append("<div class='coment' id='chatComment"+commentobj.commentChatId+"'>"+commentobj.chatText+"</div>");
									if(commentobj.commentType=='Text')
									{
										
									}
								else if(commentobj.commentType=='Content')
									{
										if(commentobj.attachment1DocumentId !=0){
										$("#col-md-11"+commentobj.commentChatId).append("<p class='date'><a  style='float: left;' onclick='downloadAttachment("+commentobj.attachment1DocumentId+")' title='"+commentobj.contentFileName1+"'>"+commentobj.contentFileName1+"</a></p><br> ");
										}
										if(commentobj.attachment2DocumentId !=0){
											$("#col-md-11"+commentobj.commentChatId).append("<p class='date'><a  style='float: left;' onclick='downloadAttachment("+commentobj.attachment2DocumentId+")' title='"+commentobj.contentFileName2+"'>"+commentobj.contentFileName2+"</a></p><br>");	
										}
										if(commentobj.attachment3DocumentId !=0){
										$("#col-md-11"+commentobj.commentChatId).append("<p class='date'><a  style='float: left;' onclick='downloadAttachment("+commentobj.attachment3DocumentId+")' title='"+commentobj.contentFileName3+"'>"+commentobj.contentFileName3+"</a></p><br>");
										}
									}
								else{
									$("#col-md-11"+commentobj.commentChatId).append("<p><a target='_blank'  href='"+commentobj.chatURL+"' title='"+commentobj.chatURL+"'>"+commentobj.chatURL+"</a></p>");
								}
									$("#chatComment"+commentobj.commentChatId).append("<div class='date'>"+commentobj.createdDate+"</div>");
									$("#chattercontent"+commentobj.commentChatId).append("</div>");/* end of div col-md-11*/
									$("#chatboxcomment"+commentobj.commentChatId).append("</div>");/* end of div chattercontent*/
									$("#col-md-10"+commentobj.commentChatId).append("</div>");/* end of div chatboxcomment*/
									$("#col-md-9"+commentobj.commentChatId).append("</div>");/* end of div col-md-10*/
									$("#comment"+commentobj.commentChatId).append("</div>");/* end of div col-md-9*/
									$('#mainComment'+commentobj.parentChatID).append("</div>");
									$('#chatterData').append("</div>");
								});
						
						$contentLoadTriggered = false;
						
						$('input[type="file"]').ace_file_input({
							no_file:'No File ...',
							btn_choose:'Choose',
							btn_change:'Change',
							droppable:false,
							onchange:null,
							thumbnail:false //| true | large
							//whitelist:'gif|png|jpg|jpeg'
							//blacklist:'exe|php'
							//onchange:''
							//
						});
					}
				
				
				});	
			}
			}); 
	
}
/* function to fetch list of users for chat*/
function getUserList() {
	var recordType = $('#contact').val();
	var loggedInUserPartyId = $('#partyIdHidden').val();
	var buId =	$('#buId').val();
	$.ajax({
		type : "POST",
		url : $('#contextPath').val()
				+ '/common/getUserList.htm?loggedInUserPartyId='
				+ loggedInUserPartyId + '&recordType=' + recordType,
		success : function(result) {
			result = JSON.parse(result);
			
			$('#chatOnRelatedPartyId').empty();
			$('#chatOnRelatedPartyId').append(
			'<option value="0">--Select--</option>');
			$(result).each(
					function(i, obj) {
						$('#chatOnRelatedPartyId').append(
								'<option value="'+obj.partyId+'">'
										+ obj.name + '</option>');
					});
		}
	});
}
/*This function is used to save chat before it validates*/
function saveChat(type) {
	/*This storedData is key value pair of selected tagging user with Name and Partyid*/
	var feedItemPost = $("#feedItemPost").val();
	var feedFilePost = $("#feedFilePost").val();
	var feedLinkPost = $("#feedLinkPost").val();
	if(type=="Post"){
		 if((feedItemPost == "")){$('#feedItemPost').css('border','1px solid red');
		 showAlertMessage("Error","There are some validation errors, please check to proceed further.", 'error', doNothing);
		 }
	}
	if(type=="File"){
		 if((feedFilePost == "")){$('#feedFilePost').css('border','1px solid red');
		 showAlertMessage("Error","There are some validation errors, please check to proceed further.", 'error', doNothing);
		 } 
	}
	if(type=="Link"){
		  if((feedLinkPost == "")){$('#feedLinkPost').css('border','1px solid red');
		  showAlertMessage("Error","There are some validation errors, please check to proceed further.", 'error', doNothing);
		  } 
		 
	}
	
	
	var FeedCommentLinkName = $("#FeedCommentLinkName").val();
	var recordType = $('#contact').val();
	var chatOnRelatedPartyId= $('#chatOnRelatedPartyId').val();

	var post='';
	var storedData;
	var isTagging='false';
	 if ((feedItemPost != "") && (feedLinkPost == "" || feedFilePost==""))
	{
		 post=feedItemPost;
		 storedData = $('#feedItemPost').data('label');
	}
	else if ((feedFilePost!="") && (feedItemPost == "" || feedLinkPost == ""))
	{
		post=feedFilePost;
		storedData = $('#feedFilePost').data('label');
	}
	else
	{
		post=feedLinkPost;
		storedData = $('#feedLinkPost').data('label');
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
	    console.log(xmlStringUserName);
	
	    $('#xmlStringUserName').val(xmlStringUserName);
	    $('#isTagging').val(isTagging);
	    
	var chatType="chat";
	$('#chatType').val('chat');
	var isValidated=true;

	
	if(isTagging=='false')
		{
		if(recordType=='0')
			{
				addCssStyles('contact','Please select contact.');
				if(isValidated==true){
					isValidated=false;
					showAlertMessage("Error","There are some validation errors,please check to proceed further.", 'error', doNothing);
				}
			}
		else{
			removeCssStyles('contact');
		}
	if(recordType !='0' )
		{
			if(chatOnRelatedPartyId=='0')
				{
					addCssStyles('chatOnRelatedPartyId','Please select User.');
					if(isValidated==true){
						isValidated=false;
						showAlertMessage("Error","There are some validation errors,please check to proceed further.", 'error', doNothing);
					}
				}
			else{
				removeCssStyles('contact');
			}
		}
		}
	var res=checkSelectedUserInHierarchy();
	if(res==true)
	{	
		if(isValidated==true || isTagging=='true'){
		
		
		if(feedItemPost!='' || feedFilePost!='' || feedLinkPost!=''){
			document.chatForm.action =$('#contextPath').val()+'/common/insertChatRecord.htm';
			document.chatForm.method = "post";
			document.chatForm.submit();
		}
		else{
			
			}
		}
	}
}
/* This function is used to set daynamic comment details to a savechat form and save comment*/
function setCommentDataToCommentForm(chatId)
{
	var post;
	var extractedText;
	var inputString;
	var isTagging='false';
	$('#chatForm').append($('#feedCommentphoto1'+chatId));
	$('#chatForm').append($('#feedCommentphoto2'+chatId));
	$('#chatForm').append($('#feedCommentphoto3'+chatId));
	$('#feedItemComment').val($('#feedItemComment'+chatId).val());
	$('#feedFileComment').val($('#feedFileComment'+chatId).val());
	$('#feedLinkComment').val( $('#feedLinkComment'+chatId).val());
	$('#feedLinkCommentURL').val($('#feedLinkCommentURL'+chatId).val());
	$('#chatType').val('comment');
	$('#parentChatId').val(chatId);
	
	
	var feedItemComment=$('#feedItemComment'+chatId).val();
	var feedFileComment =$('#feedFileComment'+chatId).val();
	var feedLinkComment=$('#feedLinkComment'+chatId).val();
	var feedLinkCommentURL=$('#feedLinkCommentURL'+chatId).val();
	
	
	var isValidated=true;
	
	if ((feedItemComment != "") && (feedFileComment == "" || feedFileComment==""))
	{
		post=feedItemComment;
		 storedData = $('#feedItemComment').data('label');
	}
	else if ((feedFileComment!="") && (feedItemComment == "" || feedLinkComment == ""))
	{
		post=feedFileComment;
		 storedData = $('#feedFileComment').data('label');
	}
	else
	{
		post=feedLinkComment;
		 storedData = $('#feedLinkComment').data('label');
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
	  

	    $('#xmlStringUserName').val(xmlStringUserName);
	    $('#isTagging').val(isTagging);
	
	if($('#feedItemComment'+chatId).val()!='' || $('#feedFileComment'+chatId).val()!='' ||  $('#feedLinkComment'+chatId).val()!='')
		{
			document.chatForm.action =$('#contextPath').val()+'/common/insertChatRecord.htm';
			document.chatForm.method = "post";
			document.chatForm.submit();
		}
	else{
	}
}

function split( val ) {
	 return val.split( /;\s*/ );
   }
function extractLast( term ) {
		 return split( term ).pop();
	}
/*Function used to retrive tagging details */ 
 function getUserForTagging(name,chatId)
 {
  	var feedItemPost = $("#feedItemPost").val();
	var feedFilePost = $("#feedFilePost").val();
	var feedLinkPost = $("#feedLinkPost").val();
	var feedItemComment=$('#feedItemComment'+chatId).val();
	var feedFileComment =$('#feedFileComment'+chatId).val();
	var feedLinkComment=$('#feedLinkComment'+chatId).val();
	var feedLinkCommentURL=$('#feedLinkCommentURL'+chatId).val();
	var partyIdOfCurrentFeed=$('#partyIdOfCurrentFeed'+chatId).val();
	var post;
	var extractedText;
	var inputString;
	var partyIdLoggedInUser= $('#partyIdHidden').val();
	if(feedItemPost=="" && feedLinkPost=="" && feedFilePost=="")
	{
		/*This will recognize that Tagging is done from comment box*/	
		tagOnRelatedPartyId=partyIdOfCurrentFeed;
		if ((feedItemComment != "") && (feedFileComment == "" || feedFileComment==""))
		{
			post=feedItemComment;
		}
		else if ((feedFileComment!="") && (feedItemComment == "" || feedLinkComment == ""))
		{
			post=feedFileComment;
		}
		else
		{
			post=feedLinkComment;
		}
		
	}
	else if ((feedItemPost != "") && (feedLinkPost == "" || feedFilePost==""))
	{
		post=feedItemPost;
	}
	else if ((feedFilePost!="") && (feedItemPost == "" || feedLinkPost == ""))
	{
		post=feedFilePost;
	}
	else
	{
		post=feedLinkPost;
	}
	//alert('partyIdLoggedInUser====='+partyIdLoggedInUser);
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
				
				//alert('extractedText='+extractedText+"   input string="+inputString);
				
				
		$.ajax({
			type : "POST",
			url : $('#contextPath').val()
					+ '/common/getUserForTaggingList.htm?post='+extractedText+'&partyId='+partyIdLoggedInUser, // Database name search 
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
// 							alert('in if'+userTypesList[index+1]);
						}else{
					var object = {};
					object.label = userTypesList[index];
					object.value = userTypesList[index+1];
// 					alert('in else'+userTypesList[index]);
// 					alert('in else'+userTypesList[index+1]);
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
 
</script>
</body>
</html>