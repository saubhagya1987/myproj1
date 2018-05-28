<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://displaytag.sf.net" prefix="display"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<link href="<%=request.getContextPath()%>/images/favicon.ico" rel="shortcut icon">
<title>Query </title>

</head>
<body>
<style>
.queryattchmentbox{
display: none;
}
.comment{
text-align: left !important;
}
a:hover{
text-decoration: none !important;
}
#blanket{
height: 100%;
position: fixed;
}

</style>
	<jsp:include page="header.jsp" />

 <!-- Center part start -->
 <section>
     <div class="">
         <div class="main-content">
      <div class="main-contnet-inner">
        <div class="page-content">
                 	 	<div class="page-header clearfix">
                 	 	<h1 class="pull-left" id="panelBoxMessage"></h1>
                 	 	
                  		<div class="nav-search pull-right hide" id="">
							<form class="form-search">
								<span class="input-icon">
									<input type="text" placeholder="Search ..." class="nav-search-input" id="nav-search-input" autocomplete="off">
									<i class="ace-icon fa fa-search nav-search-icon"></i>
								</span>
							</form>
						</div>
						</div>
                  <div style="height: auto;" id="collapseFundSel" class="accordion-body pull-left serchboxnew collapse">
                    <div class="accordion-inner table-responsive">
                     <div style="width: 1211px;">
                        <!--1 search start -->
                       
                          <div class="filterbox searchpadding">
                            <div class="head">Filter </div>
                           <div class="drop_box_body">
                            <span class="searchtext"> Subject</span> 
                            <input name="text" type="text" id="fname" class="form-control" value="" /> 
                            <span class="searchtext"> Owner</span> 
                            <input name="text" type="text" id="fname" class="form-control" value="" />
                            <span class="searchtext"> Reference No</span> 
                            <input name="text" type="text" id="fname" class="form-control" value="" />
                           
                             <br>
                         	</div>
                         </div>
                        <div class="filterbox searchpadding">
                          <div class="head">Type</div>
                          <div class="drop_box_body">
                            <ul class="nav  nav-stacked">
                              <li>
                                <input id="15Large"  value="15Large" type="checkbox"  checked>
                               General</li>
                              <li>
                                <input id="15Large"  value="15Large" type="checkbox">
                                Action Plan</li>
                              <li>
                                <input id="15Large"  value="15Large" type="checkbox"  checked>
                                Plan Execution</li>
                              <li>
                                <input id="15Large"  value="15Large" type="checkbox">
                                Goal Related</li>
                              <li>
                                <input id="15Large"  value="15Large" type="checkbox" checked>
                                Portfolio Related</li>
                              <li>
                                <input id="15Large"  value="15Large" type="checkbox" checked>
                                Customer Service</li>
                                <li>
                                <input id="15Large"  value="15Large" type="checkbox" checked>
                                Financial Plan</li>
                                <li>
                                <input id="15Large"  value="15Large" type="checkbox">
                                Pathfinder tool related</li>
                             
                            </ul>
                          </div>
                        </div>
                         </div>
                          <div class="box_button pull-left">
                      <button type="button" id="updatefilterlist" class="btn">Show</button>
                    </div>
                    </div>
                       
                      
          
                    <!-- accordion-inner END -->
                
                   
                   
                  </div>
                  <!-- accordion-body END -->
	  	<div class="container-body">
        
        <!-- center -->
       
			
 <!-- center -->
<div class="topmenu pull-right margin_5px">
        	
<a href="<%=request.getContextPath()%>/addQuery.htm">
	<button data-params="{}" type="button" class="dbtn createNewBtn btn btn-primary btn-xs" title="New Query" alt="New Query"><i class="fa fa-plus"></i> New Query</button></a>
<button data-params="{}" type="button" class="dbtn deleteBtn btn btn-primary btn-xs" title="Delete" onclick="deleteQueries()"><i class="fa fa-trash"></i> Delete</button>
 </div>

<div class="topmenuleft" >
	<a onclick="openQueryPanel('inbox')" title="Inbox" alt="Inbox">Inbox <span class="badge badge-info">${unreadQueryInboxCount}</span></a>
	<a onclick="openQueryPanel('sentbox')" title="Sent" alt="Sent">Sent <span class="badge badge-info">${unreadQuerySentboxCount}</span></a>
</div>
<div class="clearfix"></div>

<div class="row jq_parent" id="display_table_lead">
		  <div id="toreload" class="tabular_break_word">
			<table id="grid-table">
                </table>
                <div id="grid-pager"></div>                        

        <div class="topmenuleft" >
		 
		  <div class="topmenuleft margin_5px" >
		  	<span>Export options:</span>
		  		<a class="margin_5px" onclick="getCSV()" title="Export in CSV" alt="Export in CSV"><i class="fa icon-csv bigger-170"></i></a>
		  		<a class="margin_5px" onclick="getXLS()" title="Export in Excel" alt="Export in Excel"><i class="fa fa-file-excel-o bigger-170"></i></a>
	 </div>
        <!-- Center--> 
     </div> 
   
    
    </div>
    
<div style="display: none;" id="blanket"></div>
<!-- -->
<div class="modal fade" id="popUpQuery" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">Query Comments</h4>
      </div>
      <div class="modal-body clearfix">
<div class="row">
 <div class="list-group pad-nesw3" id="queryDetailsDiv" >

	</div>
	<div id="lastCommentDiv"></div>
       </div></div></div></div></div>
<!--        </div> -->
    </div>
    
  
    
     
   </div>
   </div>
           	    <!-- accordion-group END -->
              </div>
           	  <!-- accordion  END -->
 
              
               <!-- accordion End -->
            </div >
          </div >   
<!-- Center part End -->          
<!-- </div> -->
<jsp:include page="../common/footer.jsp" />
<script type="text/javascript">
var list = new Array();
var queryId=0;
var statusList;
$(function() {
	$("#tags").keyup(function(event) {
		if (event.keyCode == 13) {
			$("#searchbtn").click();
		}
	});
	showSelectedTab('queryLink');
	var queryId=$('#queryIdToOpen').val();
	if(queryId!=0){
// 		viewQueryDetails(queryId);
		showAlertMessage1("Message",
				"<br/>Comment added successfully.",
				"information", showQueryDetails);
	}
// 	alert($('#queryPanelSession').val())
	if($('#queryPanelSession').val()=='inbox'){
		$('#panelBoxMessage').html('Query-Inbox');
	}else{
		$('#panelBoxMessage').html('Query-Sent');
	}
	
	$.ajax({
		type : "POST",
		url : $('#contextPath').val()+'/common/getPicklistValues.htm?codeTypeIds=22',
		success : function(result) {
			statusList=result;
			
		}
	});

	(function(d){d.Zebra_Dialog=function(g,k){var s={animation_speed:250,auto_close:!1,buttons:!0,custom_class:!1,keyboard:!0,max_height:0,message:"",modal:!0,overlay_close:!0,overlay_opacity:0.9,position:"center",reposition_speed:100,source:!1,title:"",type:"information",vcenter_short_message:!0,width:0,onClose:null},a=this;a.settings={};options={};"string"==typeof g&&(options.message=g);if("object"==typeof g||"object"==typeof k)options=d.extend(options,"object"==typeof g?g:k);a.init=function(){a.settings= d.extend({},s,options);a.isIE6="explorer"==j.name&&6==j.version||!1;a.settings.modal&&(a.overlay=jQuery("<div>",{"class":"ZebraDialogOverlay"}).css({position:a.isIE6?"absolute":"fixed",left:0,top:0,opacity:a.settings.overlay_opacity,"z-index":1E3}),a.settings.overlay_close&&a.overlay.bind("click",function(){a.close()}),a.overlay.appendTo("body"));a.dialog=jQuery("<div>",{"class":"ZebraDialog"+(a.settings.custom_class?" "+a.settings.custom_class:"")}).css({position:a.isIE6?"absolute":"fixed",left:0, top:0,"z-index":1001,visibility:"hidden"});!a.settings.buttons&&a.settings.auto_close&&a.dialog.attr("id","ZebraDialog_"+Math.floor(9999999*Math.random()));var e=parseInt(a.settings.width);!isNaN(e)&&(e==a.settings.width&&e.toString()==a.settings.width.toString()&&0<e)&&a.dialog.css({width:a.settings.width});a.settings.title&&jQuery("<h3>",{"class":"ZebraDialog_Title"}).html(a.settings.title).appendTo(a.dialog);e=jQuery("<div>",{"class":"ZebraDialog_BodyOuter"+(!a.settings.title?" ZebraDialog_NoTitle": "")+(!l()?" ZebraDialog_NoButtons":"")}).appendTo(a.dialog);a.message=jQuery("<div>",{"class":"ZebraDialog_Body"+(""!=m()?" ZebraDialog_Icon ZebraDialog_"+m():"")});0<a.settings.max_height&&(a.message.css("max-height",a.settings.max_height),a.isIE6&&a.message.attr("style","height: expression(this.scrollHeight > "+a.settings.max_height+' ? "'+a.settings.max_height+'px" : "85px")'));a.settings.vcenter_short_message?jQuery("<div>").html(a.settings.message).appendTo(a.message):a.message.html(a.settings.message); if(a.settings.source&&"object"==typeof a.settings.source){var b=a.settings.vcenter_short_message?d("div:first",a.message):a.message,c;for(c in a.settings.source)switch(c){case "ajax":var f="string"==typeof a.settings.source[c]?{url:a.settings.source[c]}:a.settings.source[c],g=jQuery("<div>").attr("class","ZebraDialog_Preloader").appendTo(b);f.success=function(a){g.remove();b.append(a);h(!1)};d.ajax(f);break;case "iframe":iframe_options=d.extend({width:"100%",height:"100%",marginheight:"0",marginwidth:"0", frameborder:"0"},"string"==typeof a.settings.source[c]?{src:a.settings.source[c]}:a.settings.source[c]);b.append(jQuery("<iframe>").attr(iframe_options));break;case "inline":b.append(a.settings.source[c])}}a.message.appendTo(e);if(c=l()){var n=jQuery("<div>",{"class":"ZebraDialog_Buttons"}).appendTo(a.dialog);d.each(c,function(e,b){var c=jQuery("<a>",{href:"javascript:logoutClick("+e+")","class":"ZebraDialog_Button"+e});d.isPlainObject(b)?c.html(b.caption):c.html(b);c.bind("click",function(){void 0!=b.callback&& b.callback(a.dialog);a.close(void 0!=b.caption?b.caption:b)});c.appendTo(n)});jQuery("<div>",{style:"clear:both"}).appendTo(n)}a.dialog.appendTo("body");d(window).bind("resize",h);a.settings.keyboard&&d(document).bind("keyup",p);a.isIE6&&d(window).bind("scroll",q);!1!==a.settings.auto_close&&(a.dialog.bind("click",function(){clearTimeout(a.timeout);a.close()}),a.timeout=setTimeout(a.close,a.settings.auto_close));h(!1);return a};a.close=function(e){a.settings.keyboard&&d(document).unbind("keyup",p); a.isIE6&&d(window).unbind("scroll",q);d(window).unbind("resize",h);a.overlay&&a.overlay.animate({opacity:0},a.settings.animation_speed,function(){a.overlay.remove()});a.dialog.animate({top:0,opacity:0},a.settings.animation_speed,function(){a.dialog.remove();if(a.settings.onClose&&"function"==typeof a.settings.onClose)a.settings.onClose(void 0!=e?e:"")})};var h=function(e){var b=d(window).width(),c=d(window).height(),f=a.dialog.width(),g=a.dialog.height(),f={left:0,top:0,right:b-f,bottom:c-g,center:(b- f)/2,middle:(c-g)/2};a.dialog_left=void 0;a.dialog_top=void 0;a.settings.modal&&a.overlay.css({width:b,height:c});d.isArray(a.settings.position)&&(2==a.settings.position.length&&"string"==typeof a.settings.position[0]&&a.settings.position[0].match(/^(left|right|center)[\s0-9\+\-]*$/)&&"string"==typeof a.settings.position[1]&&a.settings.position[1].match(/^(top|bottom|middle)[\s0-9\+\-]*$/))&&(a.settings.position[0]=a.settings.position[0].toLowerCase(),a.settings.position[1]=a.settings.position[1].toLowerCase(), d.each(f,function(b,e){for(var c=0;2>c;c++){var d=a.settings.position[c].replace(b,e);d!=a.settings.position[c]&&(0==c?a.dialog_left=eval(d):a.dialog_top=eval(d))}}));if(void 0==a.dialog_left||void 0==a.dialog_top)a.dialog_left=f.center,a.dialog_top=f.middle;a.settings.vcenter_short_message&&(b=a.message.find("div:first"),c=b.height(),f=a.message.height(),c<f&&b.css({"padding-top":(f-c)/2}));"boolean"==typeof e&&!1===e||0==a.settings.reposition_speed?a.dialog.css({left:a.dialog_left,top:a.dialog_top, visibility:"visible"}):a.dialog.css("visibility","visible").animate({left:a.dialog_left,top:a.dialog_top},a.settings.reposition_speed);a.dialog.find("a[class^=ZebraDialog_Button]:first").focus();a.isIE6&&setTimeout(r,500)},r=function(){var e=d(window).scrollTop(),b=d(window).scrollLeft();a.settings.modal&&a.overlay.css({top:e,left:b});a.dialog.css({left:a.dialog_left+b,top:a.dialog_top+e})},l=function(){if(!0!==a.settings.buttons&&!d.isArray(a.settings.buttons))return!1;if(!0===a.settings.buttons)switch(a.settings.type){case "question":a.settings.buttons= ["No","Yes"];break;default:a.settings.buttons=["Ok"]}return a.settings.buttons.reverse()},m=function(){switch(a.settings.type){case "confirmation":case "error":case "information":case "question":case "warning":return a.settings.type.charAt(0).toUpperCase()+a.settings.type.slice(1).toLowerCase();default:return!1}},p=function(e){27==e.which&&a.close();return!0},q=function(){r()},j={init:function(){this.name=this.searchString(this.dataBrowser)||"";this.version=this.searchVersion(navigator.userAgent)|| this.searchVersion(navigator.appVersion)||""},searchString:function(a){for(var b=0;b<a.length;b++){var c=a[b].string,d=a[b].prop;this.versionSearchString=a[b].versionSearch||a[b].identity;if(c){if(-1!=c.indexOf(a[b].subString))return a[b].identity}else if(d)return a[b].identity}},searchVersion:function(a){var b=a.indexOf(this.versionSearchString);if(-1!=b)return parseFloat(a.substring(b+this.versionSearchString.length+1))},dataBrowser:[{string:navigator.userAgent,subString:"MSIE",identity:"explorer", versionSearch:"MSIE"}]};j.init();return a.init()}})(jQuery);
	
});


function getXLS()
{
	    var value = GetURLParameter('value');
	    if (value==undefined){
	    	value='';
	    }
		window.location.href = $('#contextPath').val()+"/query/getQueryListXLS.htm?value="+value+'&pageSize='+$('#page').val();
}
function getCSV()
{
	    var value = GetURLParameter('value');
	    if (value==undefined){
	    	value='';
	    }
		window.location.href = $('#contextPath').val()+"/query/getQueryListCSV.htm?value="+value+'&pageSize='+$('#page').val();
}

function pagesizeurl(){	
	var pageSize=$('#page').val();	
	setResult('');	
}

function setResult(filterRuleCriteria){	
	  openPopupWebApp('centerLoadingImage', 25, 35);
	  var pageval =  $('#page').val();
	  $("#toreload").load('${pageContext.request.contextPath}/query/getQueryList.htm #toreload', {
	   object: '${object}',
	   queryPanel:$('#queryPanelSession').val(),
	   pageSize: $('#page').val(),//'${pageSize}', 
	   filterRule: filterRuleCriteria
	     }, function( response, status, xhr ) {
	      try{	    	

	        closePopupWebApp('');
	      }catch(e){
	         closePopupWebApp('');       
	      }
	     });
	 }

function showQueryDetails(){
	var queryId=$('#queryIdToOpen').val();
	if(queryId!=0){
		viewQueryDetails(queryId);
	}
}
function getFocusOnSearch()
{
	querysearch();
}

function querysearch()
{
   var value = $('#tags').val();
   
   window.location.href = $('#contextPath').val()+"/query/getQueryList.htm?value="+value+"&queryPanel="+$('#queryPanelSession').val();
}
/**
 * deletes multiple users after taking confirmation.
 */
function deleteQueries() {
	list = new Array();
	$('#grid-table :checked').each(function(i, obj) {
		list[i] = $(this).attr('id');
	});
	if (list.length == 0) {
		showAlertMessage1("Message",
				"Please select at least one Query to delete.",
				"information", doNothing);
	} else{
		var message = "";
		if (list.length == 1) {
			message = "Do you want to delete this Query?";
		} else {
			message = "Do you want to delete these Queries?";
		}
		showAlertMessage1("Message", "<br/>" + message, "question",
				doNothing1);
		$('.ZebraDialog_Button1').attr('href','javascript:deleteQueriesTrue()');
		$('.ZebraDialog_Button0').attr('href','javascript:doNothing()');

	}
}

function deleteQueriesTrue() {
	var message = "";
	if (list.length == 1) {
		message = "Query successfully deleted.";
	} else {
		message = "Queries successfully deleted.";
	}
	
	setTimeout(function() {
		$.ajax({
			type : 'POST',
			url : $('#contextPath').val()+"/query/deleteQuery.htm?queryIds=" + list,
			success : function(result) {
				if(result=='success'){
					localStorage.setItem('actionName',
							window.location.pathname);
					showAlertMessage1("Success",
							'<br/>' + message,
							"confirmation", redirectFunction1);
					
				}else{
					showAlertMessage1("Error",
							"The connection to the server has been lost. Please try again later.",
							"error", doNothing);
				}
				
			}
		});
	}, 500);
}


function openQueryPanel(queryPanel){
	$('#queryPanel').val(queryPanel);
	$('#querycountForm').submit();
}
function closeQueryDetailsDiv(){
	$('#queryDetailsDiv').hide();
	$('#popUpQuery').hide();
	$('#blanket').hide();
}

function saveQueryStatus(queryId){
	var message='Data saved successfully.';
	$.ajax({
		type : 'POST',
		url : $('#contextPath').val()+"/query/saveQueryStatus.htm?queryId=" + queryId+'&status='+$('#queryStatus').val(),
		success : function(result) {
			if(result>0){
				closeQueryDetailsDiv();
				
				localStorage.setItem('actionName',
						window.location.pathname);
				setTimeout(function() {
				showAlertMessage1("Success",
						'<br/>' + message,
						"confirmation", redirectFunction1);
				}, 50);
				
			}else{
				showAlertMessage1("Error",
						"The connection to the server has been lost. Please try again later.",
						"error", doNothing);
			}
			
		}
	});
}
function viewQueryDetails(queryId){
	console.log($('#contextPath').val()+'/'+$('#userPhoto').val())
	var commentAttachmentHtml='<div class="col-md-10 searchpadding padding_top" style="margin-right:50px;"><div class="space-4"></div><span id="commentAttachment1dailog"> <input class="btn btn-primary btn-xs" type="button" value="Choose File" name="Choose File" onclick="openFileDailog(\'commentAttachment1\')"> No file chosen </span><span id="commentAttachment1name"></span><div class="space-4"></div><span id="commentAttachment2dailog"> <input class="btn btn-primary btn-xs" type="button" value="Choose File" name="Choose File" onclick="openFileDailog(\'commentAttachment2\')"> No file chosen </span><span id="commentAttachment2name"></span><div class="space-4"></div> <span id="commentAttachment3dailog"> <input class="btn btn-primary btn-xs" type="button" value="Choose File" name="Choose File" onclick="openFileDailog(\'commentAttachment3\')"> No file chosen </span><span id="commentAttachment3name"></span><br /> <input type="file" name="commentAttachment" id="commentAttachment1" style="display: none;"> <input type="file" name="commentAttachment" id="commentAttachment2" style="display: none;"> <input type="file" name="commentAttachment" id="commentAttachment3" style="display: none;"> </div>';
	$.ajax({
		type : 'POST',
		url : $('#contextPath').val()+"/query/getQueryDetails.htm?queryId=" + queryId,
		success : function(result) {
			var queryData=result;
			var subject=queryData.subject;
			var queryOwnerName=queryData.queryOwnerName;
			var notes=queryData.notes;
			
		
			var lastUpdatedDate=queryData.lastUpdatedDate;
			var photoPath=queryData.photoPath;
			var attachment1DocId=queryData.attachment1DocId;
			var attachment2DocId=queryData.attachment2DocId;
			var attachment3DocId=queryData.attachment3DocId;
			var doc1Name=queryData.doc1Name;
			var doc2Name=queryData.doc2Name;
			var doc3Name=queryData.doc3Name;
			var queryCommentDatas=queryData.queryCommentDatas;
			var status=queryData.status;
			$('#queryDetailsDiv').empty();
			$('#queryDetailsDiv').append('<div class="commentlist" id="mainQueryDiv" style="overflow:auto;height:467px"></div>');
			$('#mainQueryDiv').append('<div class="col-md-12 pad-nesw2" ><div class="col-md-6"><div class="querymain"><div class="querypicbig" ><img id="queryDefaultImage" onerror="showDefaultImageOnError(id)"  style="width:80px;height:80px;" src="'+$('#contextPath').val()+'/'+photoPath+'"></div><div><p><b>'+subject+'</b><br><span>'+notes+'</span> <br/><span class="querydetail">'+lastUpdatedDate+' <br/>by '+queryOwnerName+'<br/><br/> <a onclick="openAttachments(\'queryattchmentbox\')" id="queryAttachmentLink" style="font-size:13px"> <img name="queryattchmentbox" src="'+ $('#contextPath').val()+ '/images/plus.gif">&nbsp;Attachment</a></span><div class="queryattchmentbox" id="queryattchmentbox"></div>  </p></div></div></div><div class="col-md-1">&nbsp;</div><div class="col-md-5 pull-right pad-nesw2 rightAlign" id="statusDiv"></div><div class="clearfix"></div></div>');
			$('#statusDiv').append('<div class="col-xs-pull-5 searchpadding padding_top paraTxt">  Current Status is <span class="label arrowed arrowed-right" id="queryStatusLabel"></span></a><div class="clearfix"></div><a href="#" class="btn btn-inverse btn-xs pull-right northspace1 inlineBlock" onClick="$(\'#queryStatus,#statuschangebutton\').show();$(\'#editstatus\').hide();$(\'#queryStatus\').val('+status+')"  id="editstatus"><i class="fa fa-pencil white"></i> Edit</a><br></div><div class="clr"></div><div class="space-4"></div><div class="col-xs-pull-5 searchpadding padding_top paraTxt" id="changeStatus" ><select name="Status" class="form-control" id="queryStatus"  style="display:none;" > </select></div><div class="space-4"></div><div class="col-xs-pull-12 searchpadding padding_top none paraTxt" id="statuschangebutton" style="float:right;"><input id="save1" class="btn dbtn btn-primary btn-xs" type="button" value="Save" name="Save" onclick="saveQueryStatus('+queryId+')">  <input id="cancel1" class="btn dbtn btn-primary btn-xs" type="button" value="Cancel" name="Cancel" onClick="$(\'#queryStatus,#statuschangebutton\').hide();$(\'#editstatus\').show()"></div>');
			$('#statuschangebutton').hide();
			
			$(statusList).each(function(i,obj) {
				var codeTypeId=obj.codeTypeId;
				var codeValue=obj.codeValue;
				var codevalueId=obj.codeValueId;
				$('#queryStatus').append('<option value="'+codevalueId+'">'+codeValue+'</option>');
				if(status==codevalueId){
					$('#queryStatusLabel').html(codeValue);
				    if(codeValue=='New'){
				    	$('#queryStatusLabel').addClass('label-info');
				    }else if(codeValue=='In Progress'){
				    	$('#queryStatusLabel').addClass('label-warning');
				    }else if(codeValue=='Responded'){
				    	$('#queryStatusLabel').addClass('label-success');
				    }else if(codeValue=='Closed'){
				    	$('#queryStatusLabel').addClass('label-danger');
				    }else if(codeValue=='Cancelled'){
				    	$('#queryStatusLabel').addClass('label-danger');
				    }
					
				}
			});
			
			$(queryCommentDatas).each(function(i,obj) {
				var commentText=obj.commentText;
				var commentOwner=obj.commentOwner;
				var createdDate=obj.createdDate;
				var photoPath=obj.photoPath;
				var doc1Id=obj.doc1Id;
				var doc2Id=obj.doc2Id;
				var doc3Id=obj.doc3Id;
				var doc1Name=obj.doc1Name;
				var doc2Name=obj.doc2Name;
				var doc3Name=obj.doc3Name;
				var queryCommentID=obj.queryCommentId;
				$('#mainQueryDiv').append('<div class="querymain"> <div class="well comment"><div class="querypic" ><img id="commentDefaultImage'+queryCommentID+'" onerror="showDefaultImageOnError(id)"  style="width:32px;height:32px;" src="'+$('#contextPath').val()+'/'+photoPath+'"></div><div><p><b>'+commentText+'</b><br><span class="querydetail">'+createdDate+' <br/>by '+commentOwner+'<br/><br/> <a onclick="openAttachments(\'commentattchmentbox'+queryCommentID+'\')" style="font-size:13px" id="commentAttachmentLink'+queryCommentID+'"><img name="commentattchmentbox'+queryCommentID+'" src="'+ $('#contextPath').val()+ '/images/plus.gif">&nbsp;Attachment</a></span><div class="queryattchmentbox" id="commentattchmentbox'+queryCommentID+'"></div>  </p></div></div></div>');
				if(doc1Id==0){
					$('#commentAttachmentLink'+queryCommentID).remove();
					$('#commentattchmentbox'+queryCommentID).remove();
				}else{
					$('#commentattchmentbox'+queryCommentID).append('<a onclick="downloadAttachment('+doc1Id+')">'+doc1Name+'</a><br/>');
					
					if(doc2Id!=0){
						$('#commentattchmentbox'+queryCommentID).append('<a onclick="downloadAttachment('+doc2Id+')">'+doc2Name+'</a><br/>');
					}
					if(doc3Id!=0){
						$('#commentattchmentbox'+queryCommentID).append('<a onclick="downloadAttachment('+doc3Id+')">'+doc3Name+'</a>');
					}
				}
			})
			if(attachment1DocId==0){
				$('#queryAttachmentLink').remove();
				$('#queryattchmentbox').remove();
				
			}else{
				$('#queryattchmentbox').append('<a onclick="downloadAttachment('+attachment1DocId+')">'+doc1Name+'</a><br/>');
				if(attachment2DocId!=0){
					$('#queryattchmentbox').append('<a onclick="downloadAttachment('+attachment2DocId+')">'+doc2Name+'</a><br/>');
				}
				if(attachment3DocId!=0){
					$('#queryattchmentbox').append('<a onclick="downloadAttachment('+attachment3DocId+')">'+doc3Name+'</a>');
				}
			}
			
			$('#mainQueryDiv').append('<form id="commentForm" enctype="multipart/form-data" method="post"><input type="hidden" name="queryId" value="'+queryId+'"><div class="querymain"> <div class="well comment"><div class="querypic" ><img id="commentDefaultImage0"   style="width:32px;height:32px;" onerror="showDefaultImageOnError(id)" src="'+$('#contextPath').val()+'/'+$('#userPhoto').val()+'"></div> <div class="queryrow"> <textarea  name="commentText" id="commentText" class="form-control" rows="2"></textarea></div> '+commentAttachmentHtml+' <br/><div class="clearfix"></div><div class="rightAlign"><div class="space-4"></div><input type="button" class="createNewBtn btn btn-primary btn-xs" value="  Add Comment" title="Add Comment" onclick="addComment()" alt="Add Comment"></div>   </div></div></form>');
				
			$('#commentAttachment1').change(function() {
				$('#commentAttachment1dailog').hide();
				$('#commentAttachment1name').html($('#commentAttachment1').val().substring($('#commentAttachment1').val().lastIndexOf('\\')+1)+' <a onclick="removeattachment(\'commentAttachment1\')">Remove</a>');
				$('#commentAttachment1name').show();
			});
			$('#commentAttachment2').change(function() {
				$('#commentAttachment2dailog').hide();
				$('#commentAttachment2name').html($('#commentAttachment2').val().substring($('#commentAttachment2').val().lastIndexOf('\\')+1)+' <a onclick="removeattachment(\'commentAttachment2\')">Remove</a>');
				$('#commentAttachment2name').show();
			});
			$('#commentAttachment3').change(function() {
				$('#commentAttachment3dailog').hide();
				$('#commentAttachment3name').html($('#commentAttachment3').val().substring($('#commentAttachment3').val().lastIndexOf('\\')+1)+' <a onclick="removeattachment(\'commentAttachment3\')">Remove</a>');
				$('#queryAttachment3name').show();
			});
			$('#span' + queryId).parent().attr('class','readmail');
			$('#span' + queryId).parent().siblings().attr('class','readmail');
			$('#queryDetailsDiv').show();
			$('#popUpQuery').modal('show') ;

		}
	});
}


function openAttachments(id){
	if($('#'+id).css('display')=='none'){
		$('#'+id).show();
		$('img[name="'+id+'"]').attr('src',$('#contextPath').val()+'/images/minus.gif');
	}else{
		$('#'+id).hide();
		$('img[name="'+id+'"]').attr('src',$('#contextPath').val()+'/images/plus.gif');
	}
}



function openFileDailog(id){
	$('#'+id).click();
}
function removeattachment(id){
	$('#'+id+'dailog').show();
	$('#'+id+'name').html('');
	$('#'+id+'name').hide();
	$('#'+id).val('');
}

function addComment(){
	var isValidated=true;
	if($('#commentText').val()==''){
		addCssStyles('commentText','Please enter Comment Text.');
		isValidated=false;
	}else{
			removeCssStyles('commentText');
		}
	
	var res=checkSelectedUserInHierarchy();

	if(res==true)
	{	
		if(isValidated==true){
				$('#commentForm').attr('action',$('#contextPath').val()+'/query/saveComment.htm');
				$('#commentForm').submit();
		}
	}
}


</script>
	<input id="contextPath" type="hidden" name="contextPath"
		value="<%=request.getContextPath()%>" />
	<form method="post" id="querycountForm" action="<%=request.getContextPath()%>/query/getQueryList.htm">
		<input type="hidden" id="queryPanel" name="queryPanel">
	</form>
	
	
	<form id="downloadAttachmentForm" method="post" action="<%=request.getContextPath()%>/common/downloadDocument.htm">
		<input type="hidden" name="docId" id="documentIdToDownload">
	</form>
	
	<% 
String commentResult="fail";
	int queryId=0;
	commentResult=session.getAttribute("CommentResult")==null?"fail":session.getAttribute("CommentResult").toString();
	queryId=session.getAttribute("QueryId")==null?0:Integer.parseInt(session.getAttribute("QueryId").toString());
if(commentResult.equals("success")){
	session.setAttribute("CommentResult","fail");
	session.setAttribute("QueryId",0);
	%>
	<input type="hidden" id="commentMessage" value="success"/>
	<input type="hidden" id="queryIdToOpen" value="<%=queryId%>"/>
	
	<%
}else{
	%>
	<input type="hidden" id="commentMessage" value="fail"/>
	<input type="hidden" id="queryIdToOpen" value="0"/>
	<%
}
%>
<%
String queryPanel="inbox";
queryPanel=session.getAttribute("queryPanel")==null?"inbox":session.getAttribute("queryPanel").toString();
session.setAttribute("queryPanel","inbox");
if(!queryPanel.equals("")){
%>
<input type="hidden" id="queryPanelSession" value="<%=queryPanel%>"/>
<%}else{ %>
<input type="hidden" id="queryPanelSession" value="inbox"/>
<%} %>
	<a href="#footer" id="focusFooter"></a>
<!-- inline scripts related to this page -->	
	<script type="text/javascript">
	var index ="";
			var grid_data = 
			[ 
				{id:"1",name:"Desktop Computer",note:"note",stock:"Yes",ship:"FedEx", sdate:"2007-12-03"},
				{id:"2",name:"Laptop",note:"Long text ",stock:"Yes",ship:"InTime",sdate:"2007-12-03"},
				{id:"3",name:"LCD Monitor",note:"note3",stock:"Yes",ship:"TNT",sdate:"2007-12-03"},
				{id:"4",name:"Speakers",note:"note",stock:"No",ship:"ARAMEX",sdate:"2007-12-03"},
				{id:"5",name:"Laser Printer",note:"note2",stock:"Yes",ship:"FedEx",sdate:"2007-12-03"},
				{id:"6",name:"Play Station",note:"note3",stock:"No", ship:"FedEx",sdate:"2007-12-03"},
				{id:"7",name:"Mobile Telephone",note:"note",stock:"Yes",ship:"ARAMEX",sdate:"2007-12-03"},
				{id:"8",name:"Server",note:"note2",stock:"Yes",ship:"TNT",sdate:"2007-12-03"},
				{id:"9",name:"Matrix Printer",note:"note3",stock:"No", ship:"FedEx",sdate:"2007-12-03"},
				{id:"10",name:"Desktop Computer",note:"note",stock:"Yes",ship:"FedEx", sdate:"2007-12-03"},
				{id:"11",name:"Laptop",note:"Long text ",stock:"Yes",ship:"InTime",sdate:"2007-12-03"},
				{id:"12",name:"LCD Monitor",note:"note3",stock:"Yes",ship:"TNT",sdate:"2007-12-03"},
				{id:"13",name:"Speakers",note:"note",stock:"No",ship:"ARAMEX",sdate:"2007-12-03"},
				{id:"14",name:"Laser Printer",note:"note2",stock:"Yes",ship:"FedEx",sdate:"2007-12-03"},
				{id:"15",name:"Play Station",note:"note3",stock:"No", ship:"FedEx",sdate:"2007-12-03"},
				{id:"16",name:"Mobile Telephone",note:"note",stock:"Yes",ship:"ARAMEX",sdate:"2007-12-03"},
				{id:"17",name:"Server",note:"note2",stock:"Yes",ship:"TNT",sdate:"2007-12-03"},
				{id:"18",name:"Matrix Printer",note:"note3",stock:"No", ship:"FedEx",sdate:"2007-12-03"},
				{id:"19",name:"Matrix Printer",note:"note3",stock:"No", ship:"FedEx",sdate:"2007-12-03"},
				{id:"20",name:"Desktop Computer",note:"note",stock:"Yes",ship:"FedEx", sdate:"2007-12-03"},
				{id:"21",name:"Laptop",note:"Long text ",stock:"Yes",ship:"InTime",sdate:"2007-12-03"},
				{id:"22",name:"LCD Monitor",note:"note3",stock:"Yes",ship:"TNT",sdate:"2007-12-03"},
				{id:"23",name:"Speakers",note:"note",stock:"No",ship:"ARAMEX",sdate:"2007-12-03"}
			];
			
			grid_data='${queryDatas}';
			index=JSON.parse(grid_data);
						
			var subgrid_data = 
			[
			 {id:"1", name:"sub grid item 1", qty: 11},
			 {id:"2", name:"sub grid item 2", qty: 3},
			 {id:"3", name:"sub grid item 3", qty: 12},
			 {id:"4", name:"sub grid item 4", qty: 5},
			 {id:"5", name:"sub grid item 5", qty: 2},
			 {id:"6", name:"sub grid item 6", qty: 9},
			 {id:"7", name:"sub grid item 7", qty: 3},
			 {id:"8", name:"sub grid item 8", qty: 8}
			];
			
			jQuery(function($) {
				var grid_selector = "#grid-table";
				var pager_selector = "#grid-pager";
				
				//resize to fit page size
				$(window).on('resize.jqGrid', function () {
					$(grid_selector).jqGrid( 'setGridWidth', $("#toreload").width() );
			    })
				//resize on sidebar collapse/expand
				var parent_column = $(grid_selector).closest('[class*="col-"]');
				$(document).on('settings.ace.jqGrid' , function(ev, event_name, collapsed) {
					if( event_name === 'sidebar_collapsed' || event_name === 'main_container_fixed' ) {
						//setTimeout is for webkit only to give time for DOM changes and then redraw!!!
						setTimeout(function() {
							$(grid_selector).jqGrid( 'setGridWidth', parent_column.width() );
						}, 0);
					}
			    })
				
				
				
			
			
			
				jQuery(grid_selector).jqGrid({
					//direction: "rtl",
			
					//subgrid options
					subGrid : false,
					//subGridModel: [{ name : ['No','Item Name','Qty'], width : [55,200,80] }],
					//datatype: "xml",
					subGridOptions : {
						//plusicon : "ace-icon fa fa-plus center bigger-110 blue",
						minusicon  : "ace-icon fa fa-minus center bigger-110 blue",
						openicon : "ace-icon fa fa-chevron-right center orange"
					},
					//for this example we are using local data
					subGridRowExpanded: function (subgridDivId, rowId) {
						var subgridTableId = subgridDivId + "_t";
						$("#" + subgridDivId).html("<table id='" + subgridTableId + "'></table>");
						$("#" + subgridTableId).jqGrid({
							datatype: 'local',
							data: subgrid_data,
							colNames: ['No','Item Name','Qty'],
							colModel: [
								{ name: 'id', width: 50 },
								{ name: 'name', width: 150 },
								{ name: 'qty', width: 50 }
							]
						});
					},
					
			
			
					data: index,
					datatype: "local",
					height: 250,
					colNames:[' ',' ',' ',' ','Subject','Query Type','Query From', 'Query For', 'Last Updated Date','Last Updated By','Status'],
					colModel:[
						/* {name:'myac',index:'', width:80, fixed:true, sortable:false, resize:false,
							formatter:'actions', 
							formatoptions:{ 
								keys:true,
								//delbutton: false,//disable delete button
								
								delOptions:{recreateForm: true, beforeShowForm:beforeDeleteCallback},
								//editformbutton:true, editOptions:{recreateForm: true, beforeShowForm:beforeEditCallback}
							}
						}, */
						{name:'checkbox',align:'center',width:'50px',index:'checkbox',sortable:false,formatter:function(cellvalue, options,rowObject) {
						    return '<input role="checkbox" type="checkbox"  class="cbox" id="'+rowObject.queryId+'" name="queryCb">';
						}},
						{name:'queryId',width:'50px',align:'center',index:'queryId',formatter:editQueryForQueryId},
						{name:'queryFromRecordType',index:'queryFromRecordType', hidden:true},
						{name:'contactType', index:'contactType', hidden:true},
						{name:'subject',index:'subject',width:'230px'},
						{name:'queryTypeName',index:'queryTypeName'},
						{name:'queryOwnerName',index:'queryOwnerName',formatter:function(cellvalue, options,cell){
							if(cell.queryFromRecordType == '14005'){
								return '<span><i class="fa icon-opportunity size-16"></i>'+cellvalue+'</span>';
							} else if(cell.contactType == '14006'){
								return '<span><i class="fa icon-premium_client size-16"></i>'+cellvalue+'</span>';
							} else if(cell.contactType == '14007'){
								return '<span><i class="fa fa-user size-16"></i>'+cellvalue+'</span>';
							} else {
								return '<span><i class="fa fa-user size-16"></i>'+cellvalue+'</span>';
							}
						}},
						{name:'queryFor',index:'queryFor',formatter:function(cellvalue, options,cell){
							if(cell.queryFromRecordType == '14005'){
								return '<span><i class="fa icon-opportunity size-16"></i>'+cellvalue+'</span>';
							} else if(cell.contactType == '14006'){
								return '<span><i class="fa icon-premium_client size-16"></i>'+cellvalue+'</span>';
							} else if(cell.contactType == '14007'){
								return '<span><i class="fa fa-user size-16"></i>'+cellvalue+'</span>';
							} else {
								return '<span><i class="fa fa-user size-16"></i>'+cellvalue+'</span>';
							}
						}},
						{name:'lastUpdatedDate',index:'lastUpdatedDate'},
						{name:'lastUpdatedByName',index:'lastUpdatedByName'},
						{name:'status',index:'status',formatter:doformatstatus} 
					], 
			
					viewrecords : true,
					rowNum:10,
					rowList:[10,20,50,100,1000],
					pager : pager_selector,
					altRows: true,
					//toppager: true,
					
// 					multiselect: true,
					//multikey: "ctrlKey",
			        multiboxonly: true,
			
					loadComplete : function() {
						var table = this;
						setTimeout(function(){
							if($('#selectAll').attr('id')==undefined)
							$('#jqgh_grid-table_checkbox').before('<br/><input  type="checkbox" id="selectAll">');
							updatePagerIcons(table);
							enableTooltips(table);
							$('#selectAll').click(function(event) {  //on click 
						        if(this.checked) { // check select status
						            $('.cbox').each(function(i,obj) { //loop through each checkbox
						                this.checked = true;  //select all checkboxes with class   "checkbox1"    
									$(obj).attr('checked','checked');
						            });
						        }else{
						            $('.cbox').each(function(i,obj) { //loop through each checkbox
						                this.checked = false; //deselect all checkboxes with class "checkbox1"
						            	$(obj).removeAttr('checked');
						            });         
						        }
						        $('#selectAll').checked = true;
						    });
							
						}, 0);
					},
			
					editurl: "/dummy.html",//nothing is saved
					caption: "",
			
					autowidth: true,
					shrinkToFit:false,
					height:'100%',
                    width:'100%',
                    scrollOffset:0,
					
			      
			
				});
				$(window).triggerHandler('resize.jqGrid');//trigger window resize to make the grid get the correct size
				
				
			
				//enable search/filter toolbar
				
				//jQuery(grid_selector).jqGrid('filterToolbar',{defaultSearch:true,stringResult:true})
				//jQuery(grid_selector).filterToolbar({});
			
			
				//switch element when editing inline
				function aceSwitch( cellvalue, options, cell ) {
					setTimeout(function(){
						$(cell) .find('input[type=checkbox]')
							.addClass('ace ace-switch ace-switch-5')
							.after('<span class="lbl"></span>');
					}, 0);
				}
				
				function doformatstatus( cellvalue, options, cell ) {
					if(cellvalue == 'New'){
						return  '<span class="label label-sm label-primary">'+cellvalue+'</span>';
					} else if(cellvalue == 'In Progress'){
						return  '<span class="label label-warning label-primary">'+cellvalue+'</span>';
					} else if(cellvalue == 'Responded'){
						return  '<span class="label label-success label-primary">'+cellvalue+'</span>';	
					}else if(cellvalue == 'Closed'){
						return  '<span class="label label-danger label-primary">'+cellvalue+'</span>';
					} else if(cellvalue == 'Cancelled'){
						return  '<span class="label label-danger label-primary">'+cellvalue+'</span>';
					}
				}
				
				function editQueryForQueryId( cellvalue, options, cell ){
					return '<a  onclick="viewQueryDetails('+cellvalue+')"><div title="Edit selected row" class="ui-pg-div ui-inline-edit" onmouseover="jQuery(this).addClass(\'ui-state-hover\');" onmouseout="jQuery(this).removeClass(\'ui-state-hover\')" ><span class="fa fa-eye size-16"></span></div></a>'; 
				}
				
				//enable datepicker
				function pickDate( cellvalue, options, cell ) {
					setTimeout(function(){
						$(cell) .find('input[type=text]')
								.datepicker({format:'yyyy-mm-dd' , autoclose:true}); 
					}, 0);
				}
			
			
				//navButtons
				jQuery(grid_selector).jqGrid('navGrid',pager_selector,
					{ 	//navbar options
						edit: false,
						editicon : 'ace-icon fa fa-pencil blue',
						add: false,
						addicon : 'ace-icon fa fa-plus-circle purple',
						del: false,
						delicon : 'ace-icon fa fa-trash-o red',
						search: true,
						searchicon : 'ace-icon fa fa-search orange',
						refresh: false,
						refreshicon : 'ace-icon fa fa-refresh green',
						view: false,
						viewicon : 'ace-icon fa fa-search-plus grey',
					},
					{
						//edit record form
						//closeAfterEdit: true,
						//width: 700,
						recreateForm: true,
						beforeShowForm : function(e) {
							var form = $(e[0]);
							form.closest('.ui-jqdialog').find('.ui-jqdialog-titlebar').wrapInner('<div class="widget-header" />')
							style_edit_form(form);
						}
					},
					{
						//new record form
						//width: 700,
						closeAfterAdd: true,
						recreateForm: true,
						viewPagerButtons: false,
						beforeShowForm : function(e) {
							var form = $(e[0]);
							form.closest('.ui-jqdialog').find('.ui-jqdialog-titlebar')
							.wrapInner('<div class="widget-header" />')
							style_edit_form(form);
						}
					},
					{
						//delete record form
						recreateForm: true,
						beforeShowForm : function(e) {
							var form = $(e[0]);
							if(form.data('styled')) return false;
							
							form.closest('.ui-jqdialog').find('.ui-jqdialog-titlebar').wrapInner('<div class="widget-header" />')
							style_delete_form(form);
							
							form.data('styled', true);
						},
						onClick : function(e) {
							//alert(1);
						}
					},
					{
						//search form
						recreateForm: true,
						afterShowSearch: function(e){
							var form = $(e[0]);
							form.closest('.ui-jqdialog').find('.ui-jqdialog-title').wrap('<div class="widget-header" />')
							style_search_form(form);
						},
						afterRedraw: function(){
							style_search_filters($(this));
						}
						,
						multipleSearch: true,
						/**
						multipleGroup:true,
						showQuery: true
						*/
					},
					{
						//view record form
						recreateForm: true,
						beforeShowForm: function(e){
							var form = $(e[0]);
							form.closest('.ui-jqdialog').find('.ui-jqdialog-title').wrap('<div class="widget-header" />')
						}
					}
				)
			
			
				
				function style_edit_form(form) {
					//enable datepicker on "sdate" field and switches for "stock" field
					form.find('input[name=sdate]').datepicker({format:'yyyy-mm-dd' , autoclose:true})
					
					form.find('input[name=stock]').addClass('ace ace-switch ace-switch-5').after('<span class="lbl"></span>');
							   //don't wrap inside a label element, the checkbox value won't be submitted (POST'ed)
							  //.addClass('ace ace-switch ace-switch-5').wrap('<label class="inline" />').after('<span class="lbl"></span>');
			
							
					//update buttons classes
					var buttons = form.next().find('.EditButton .fm-button');
					buttons.addClass('btn btn-xs').find('[class*="-icon"]').hide();//ui-icon, s-icon
					buttons.eq(0).addClass('btn-primary').prepend('<i class="ace-icon fa fa-check"></i>');
					buttons.eq(1).prepend('<i class="ace-icon fa fa-times"></i>')
					
					buttons = form.next().find('.navButton a');
					buttons.find('.ui-icon').hide();
					buttons.eq(0).append('<i class="ace-icon fa fa-chevron-left"></i>');
					buttons.eq(1).append('<i class="ace-icon fa fa-chevron-right"></i>');		
				}
			
				function style_delete_form(form) {
					var buttons = form.next().find('.EditButton .fm-button');
					buttons.addClass('btn btn-xs btn-white btn-round').find('[class*="-icon"]').hide();//ui-icon, s-icon
					buttons.eq(0).addClass('btn-danger').prepend('<i class="ace-icon fa fa-trash-o"></i>');
					buttons.eq(1).addClass('btn-default').prepend('<i class="ace-icon fa fa-times"></i>')
				}
				
				function style_search_filters(form) {
					form.find('.delete-rule').val('X');
					form.find('.add-rule').addClass('btn btn-xs btn-primary');
					form.find('.add-group').addClass('btn btn-xs btn-success');
					form.find('.delete-group').addClass('btn btn-xs btn-danger');
				}
				function style_search_form(form) {
					var dialog = form.closest('.ui-jqdialog');
					var buttons = dialog.find('.EditTable')
					buttons.find('.EditButton a[id*="_reset"]').addClass('btn btn-xs btn-info').find('.ui-icon').attr('class', 'ace-icon fa fa-retweet');
					buttons.find('.EditButton a[id*="_query"]').addClass('btn btn-xs btn-inverse').find('.ui-icon').attr('class', 'ace-icon fa fa-comment-o');
					buttons.find('.EditButton a[id*="_search"]').addClass('btn btn-xs btn-purple').find('.ui-icon').attr('class', 'ace-icon fa fa-search');
				}
				
				function beforeDeleteCallback(e) {
					var form = $(e[0]);
					if(form.data('styled')) return false;
					
					form.closest('.ui-jqdialog').find('.ui-jqdialog-titlebar').wrapInner('<div class="widget-header" />')
					style_delete_form(form);
					
					form.data('styled', true);
				}
				
				function beforeEditCallback(e) {
					var form = $(e[0]);
					form.closest('.ui-jqdialog').find('.ui-jqdialog-titlebar').wrapInner('<div class="widget-header" />')
					style_edit_form(form);
				}
			
											
				//replace icons with FontAwesome icons like above
				function updatePagerIcons(table) {
					var replacement = 
					{
						'ui-icon-seek-first' : 'ace-icon fa fa-angle-double-left bigger-140',
						'ui-icon-seek-prev' : 'ace-icon fa fa-angle-left bigger-140',
						'ui-icon-seek-next' : 'ace-icon fa fa-angle-right bigger-140',
						'ui-icon-seek-end' : 'ace-icon fa fa-angle-double-right bigger-140'
					};
					$('.ui-pg-table:not(.navtable) > tbody > tr > .ui-pg-button > .ui-icon').each(function(){
						var icon = $(this);
						var $class = $.trim(icon.attr('class').replace('ui-icon', ''));
						
						if($class in replacement) icon.attr('class', 'ui-icon '+replacement[$class]);
					})
				}
			
				function enableTooltips(table) {
					$('.navtable .ui-pg-button').tooltip({container:'body'});
					$(table).find('.ui-pg-div').tooltip({container:'body'});
				}
			
			
				$(document).one('ajaxloadstart.page', function(e) {
					$(grid_selector).jqGrid('GridUnload');
					$('.ui-jqdialog').remove();
				});
			});
		</script>
	
</body>




</html>