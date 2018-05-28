<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<script type="text/javascript">
$(function(){
	var SectionName;
	var ImagePathFooterFacebook;
	var Url="";
	var isUrl="";
	var buIdInSession = $('#buIdInSession').val();
	$.ajax({
        type: "GET",
        url : $('#contextPath').val()
		+ '/xml/BuConfuguration.xml',
        
        dataType: "xml",
        success: function(xml) {
	        	$(xml).find('Bu').each(function(i,obj){
	        		var buId= $(this).attr('Id');
	        		  $(obj).find('Section').each(function(i,obj){
	        			  SectionName = $(this).attr('Name');
	        			  if(buId==buIdInSession){
		        				  if(SectionName=='Footer Facebook Url')
		        				  {
			        				  $(obj).find('Configuration').each(function(i,obj){  
			        				  	  ImagePathForAdInDc1 = $(this).attr('ImagePath');
			        				  	  isUrl =  $(this).attr('isUrl');
				        			      Url = $(this).attr('Url');
				        			  });   
			        			     
		        				  }
	        			  } 
	        							       			  
	        		  });
	        		
	        		
	        	});
	       
		if(isUrl=="1"){
			 $('#faceBookUrl').attr('href',Url);
		}
		else{
			 $('#faceBookUrl').hide();
		}
		    			 
        }	
	 });	
});
</script>

<input type="hidden" id="buIdInSession" value="${sessionScope.userSession.buId}"/>
<!--<div style="height: 70px;"></div>-->

</div>
<!-- page-content-ends -->
</div>
<!-- main-content-inner ends -->
</div>
<!-- main-content ends -->
<div class="clearfix"></div>
<!-- Linkbar Starts -->
<div id="linkbar" class="sidebar responsive menu-min sidebar-fixed sidebar-scroll hidden-sm hidden-md hidden-lg" data-sidebar="true" data-sidebar-scroll="true" data-sidebar-hover="true" style="right:0"> 
  <script type="text/javascript">
					try{ace.settings.check('sidebar' , 'fixed')}catch(e){}
				</script> 
   
  
  <!-- #section:basics/sidebar.layout.minimize -->
  <div class="sidebar-toggle sidebar-collapse" id="sidebar-collapse"> <i class="ace-icon fa fa-angle-double-left" data-icon1="ace-icon fa fa-angle-double-right" data-icon2="ace-icon fa fa-angle-double-left"></i> </div>
  
  <!-- /section:basics/sidebar.layout.minimize --> 
  <script type="text/javascript">
					try{ace.settings.check('sidebar' , 'collapsed')}catch(e){}
				</script> 
  
  <!-- /.sidebar-shortcuts -->
  <ul class="nav nav-list" style="top: 0px;">
  <c:choose >
                    <c:when test="${sessionScope.userSession.headOfNode==true}"> 
    <li class="" id="hierarchyDiv"><a class="hierarchy-submenu-btn"> <i class="menu-icon fa fa-sitemap"></i> <span class="menu-text" class="headerLocateName"><c:choose >
                        <c:when test="${sessionScope.locationName==''}"> ${sessionScope.name} </c:when>
                        <c:when test="${sessionScope.name=='' or sessionScope.locationName!=''}"> ${sessionScope.locationName} </c:when>
                        <c:otherwise> ${sessionScope.userSession.name} </c:otherwise>
                      </c:choose> </span> 
                      </a> <b class="arrow"></b> </li>
     </c:when>                     
        </c:choose>
    <li class="" id="taskLink"> <a href="<%=request.getContextPath()%>/task/getTaskList.htm"> <i class="menu-icon fa fa-tasks size-21"></i> <span class="menu-text"> Tasks </span> </a> <b class="arrow"></b> </li>
    
    <li class="" id="mailBoxLink"> <a href="<%=request.getContextPath()%>/mailbox.htm" target="_blank"> <i class="menu-icon fa fa-envelope icon-animated-vertical"></i> <span class="menu-text"> Email </span> </a> <b class="arrow"></b> </li>
    
    <li class="" id=""> <a style="height:53px" id="transactions" class="clearfix" onClick='showPwdDialog()'> <i class="menu-icon fa fa-upload"></i> <span class="menu-text"> Auto-upload transactions data</span> </a> <b class="arrow"></b> </li>
    
    <li class="" id="interactivePlanningToolHomeLink"> <a href="<%=request.getContextPath()%>/common/goTOInteractivePlanningTool.htm"> <i class="menu-icon fa fa-calendar"></i> <span class="menu-text"> Interactive Planner </span> </a> <b class="arrow"></b> </li>
    
    <li class="" id="websiteLink"> <a href="http://websites.fiinfra.in/" target="_blank"> <i class="menu-icon fa fa-desktop"></i> <span class="menu-text"> Website </span> </a> <b class="arrow"></b> </li>
    
    <li class="" id=""> <a href="<%=request.getContextPath()%>/whatsnew.htm" target="_blank"> <i class="menu-icon fa fa-exclamation"></i> <span class="menu-text"> What's New? </span> </a> <b class="arrow"></b> </li>
    
    <li class="" id=""> <a href="<%=request.getContextPath()%>/downloads.htm" target="_blank"> <i class="menu-icon fa fa-download"></i> <span class="menu-text"> Downloads </span> </a> <b class="arrow"></b> </li>
    
    <li class="" id=""> <a href="<%=request.getContextPath()%>/faqs.htm" target="_blank"> <i class="menu-icon fa fa-question"></i> <span class="menu-text"> FAQ's </span> </a> <b class="arrow"></b> </li>
      
    <li class="" id=""> <a class="contact_details"> <i class="menu-icon fa fa-phone"></i> <span class="menu-text"> Contact </span> </a> <b class="arrow"></b> </li>
    
    <li  class="trouble_ticket"> <a > <i class="menu-icon fa fa-ticket"></i> <span class="menu-text"> Log Trouble Ticket </span> </a> <b class="arrow"></b> </li>
  </ul>
  <!-- /.nav-list --> 
  
  
</div>
<!-- Linkbar Ends -->
<div class="footer">
  <div class="footer-inner"> 
    <!-- #section:basics/footer -->
    <div class="footer-content"> <span class="paraTxt"><img src="<%=request.getContextPath()%>/images/finfra_logo.png" style="width:76px;margin-top:-3px;">&nbsp; <!--<span class="blue bolder">FIINFRA</span> Pvt. Ltd.--> All Rights Reserved 2015 </span> &nbsp;<span class="action-buttons" style="vertical-align: -1px;"> <a href="" id="faceBookUrl" target="_blank"> <i class="ace-icon fa fa-facebook-square text-primary bigger-130"></i> </a> </span> </div>
    
    <!-- /section:basics/footer --> 
  </div>
</div>
<a href="#" id="btn-scroll-up" class="btn-scroll-up btn btn-xs btn-inverse">
				<i class="ace-icon fa fa-angle-double-up icon-only bigger-110"></i>
			</a>
</div>
<!-- main-container ends --> 
<!-- basic scripts --> 
<script type="text/javascript">
			if('ontouchstart' in document.documentElement) document.write("<script src='${_cdn}/assets/js/jquery.mobile.custom.js'>"+"<"+"/script>");
		</script> 
	
<!-- page specific plugin scripts --> 

<!--[if lte IE 8]>
		  <script src="../assets/js/excanvas.js"></script>
		<![endif]--> 
<script src="${_cdn}/assets/js/bootstrap.min.js"></script> 
<script src="${_cdn}/assets/js/jquery-ui.min.js"></script> 
<script src="${_cdn}/assets/js/jquery.ui.touch-punch.js"></script> 
<script src="${_cdn}/assets/js/markdown/markdown.js"></script>
<script src="${_cdn}/assets/js/markdown/bootstrap-markdown.js"></script>
<script src="${_cdn}/assets/js/jquery.hotkeys.js"></script>
<script src="${_cdn}/assets/js/bootstrap-wysiwyg.js"></script>
<script src="${_cdn}/assets/js/bootbox.js"></script> 
<script src="${_cdn}/assets/js/jqGrid/jquery.jqGrid.src.js"></script> 
<script src="${_cdn}/assets/js/jqGrid/i18n/grid.locale-en.js"></script> 
<script src="${_cdn}/assets/js/jquery.easypiechart.js"></script> 
<script src="${_cdn}/assets/js/jquery.sparkline.js"></script> 
<script src="${_cdn}/assets/js/flot/jquery.flot.min.js"></script> 
<script src="${_cdn}/assets/js/flot/jquery.flot.pie.min.js"></script> 
<script src="${_cdn}/assets/js/flot/jquery.flot.resize.min.js"></script> 
<script src="${_cdn}/assets/js/date-time/moment.min.js"></script>
<script src="${_cdn}/assets/js/fullcalendar.min.js"></script>
<%-- <script src="${_cdn}/assets/js/date-time/bootstrap-datetimepicker.min.js"></script> --%> 
<script src="${_cdn}/assets/js/date-time/bootstrap-datetimepicker.js"></script>
<script src="${_cdn}/assets/js/ace/elements.colorpicker.js"></script>
<script src="${_cdn}/assets/js/jquery.inputlimiter.1.3.1.js"></script>
<script src="${_cdn}/assets/js/jquery.maskedinput.js"></script>
<script src="${_cdn}/assets/js/ace/elements.wysiwyg.js"></script>
<script src="${_cdn}/assets/js/ace/elements.wizard.js"></script>
<script src="${_cdn}/assets/js/jsapi.js"></script>

<!-- ace scripts --> 
<script src="${_cdn}/assets/js/ace/elements.scroller.js"></script> 
<script src="${_cdn}/assets/js/ace/elements.colorpicker.js"></script> 
<script src="${_cdn}/assets/js/ace/elements.fileinput.js"></script> 
<script src="${_cdn}/assets/js/ace/elements.typeahead.js"></script> 
<script src="${_cdn}/assets/js/ace/elements.wysiwyg.js"></script> 
<script src="${_cdn}/assets/js/ace/elements.spinner.js"></script> 
<script src="${_cdn}/assets/js/ace/elements.treeview.js"></script> 
<script src="${_cdn}/assets/js/ace/elements.wizard.js"></script> 
<script src="${_cdn}/assets/js/ace/elements.aside.js"></script> 
<script src="${_cdn}/assets/js/ace/ace.js"></script> 
<script src="${_cdn}/assets/js/ace/ace.ajax-content.js"></script> 
<script src="${_cdn}/assets/js/ace/ace.touch-drag.js"></script> 
<script src="${_cdn}/assets/js/ace/ace.sidebar.js"></script> 
<script src="${_cdn}/assets/js/ace/ace.sidebar-scroll-1.js"></script> 
<script src="${_cdn}/assets/js/ace/ace.submenu-hover.js"></script> 
<script src="${_cdn}/assets/js/ace/ace.widget-box.js"></script> 
<script src="${_cdn}/assets/js/ace/ace.settings.js"></script> 
<script src="${_cdn}/assets/js/ace/ace.settings-rtl.js"></script> 
<script src="${_cdn}/assets/js/ace/ace.settings-skin.js"></script> 
<script src="${_cdn}/assets/js/ace/ace.widget-on-reload.js"></script> 
<script src="${_cdn}/assets/js/ace/ace.searchbox-autocomplete.js"></script> 
<script src="${_cdn}/assets/js/ace/ace.searchbox-autocomplete.js"></script>

<script type="text/javascript">
			function makeEditor(id){
	
	function showErrorAlert (reason, detail) {
		var msg='';
		if (reason==='unsupported-file-type') { msg = "Unsupported format " +detail; }
		else {
		}
		$('<div class="alert"> <button type="button" class="close" data-dismiss="alert">&times;</button>'+ 
		 '<strong>File upload error</strong> '+msg+' </div>').prependTo('#alerts');
	}

	//but we want to change a few buttons colors for the third style
	$('#'+id).ace_wysiwyg({
		toolbar:
		[
			'font',
			null,
			'fontSize',
			null,
			{name:'bold', className:'btn-info'},
			{name:'italic', className:'btn-info'},
			{name:'strikethrough', className:'btn-info'},
			{name:'underline', className:'btn-info'},
			null,
			{name:'insertunorderedlist', className:'btn-success'},
			{name:'insertorderedlist', className:'btn-success'},
			{name:'outdent', className:'btn-purple'},
			{name:'indent', className:'btn-purple'},
			null,
			{name:'justifyleft', className:'btn-primary'},
			{name:'justifycenter', className:'btn-primary'},
			{name:'justifyright', className:'btn-primary'},
			{name:'justifyfull', className:'btn-inverse'},
			null,
			{name:'createLink', className:'btn-pink'},
			{name:'unlink', className:'btn-pink'},
			null,
			{name:'insertImage', className:'btn-success'},
			null,
			'foreColor',
			null,
			{name:'undo', className:'btn-grey'},
			{name:'redo', className:'btn-grey'}
		],
		'wysiwyg': {
			fileUploadError: showErrorAlert
		}
	}).prev().addClass('wysiwyg-style2');
	
	
	$('#'+id).css({'height':'200px'}).ace_wysiwyg({
		toolbar_place: function(toolbar) {
			return $(this).closest('.widget-box')
			       .find('.widget-header').prepend(toolbar)
				   .find('.wysiwyg-toolbar').addClass('inline');
		},
		toolbar:
		[
			'bold',
			{name:'italic' , title:'Change Title!', icon: 'ace-icon fa fa-leaf'},
			'strikethrough',
			null,
			'insertunorderedlist',
			'insertorderedlist',
			null,
			'justifyleft',
			'justifycenter',
			'justifyright'
		],
		speech_button: false
	});
	
	


	$('[data-toggle="buttons"] .btn').on('click', function(e){
		var target = $(this).find('input[type=radio]');
		var which = parseInt(target.val());
		var toolbar = $('#editor1').prev().get(0);
		if(which >= 1 && which <= 4) {
			toolbar.className = toolbar.className.replace(/wysiwyg\-style(1|2)/g , '');
			if(which == 1) $(toolbar).addClass('wysiwyg-style1');
			else if(which == 2) $(toolbar).addClass('wysiwyg-style2');
			if(which == 4) {
				$(toolbar).find('.btn-group > .btn').addClass('btn-white btn-round');
			} else $(toolbar).find('.btn-group > .btn-white').removeClass('btn-white btn-round');
		}
	});


	//RESIZE IMAGE
	
	/* Add Image Resize Functionality to Chrome and Safari
	   webkit browsers don't have image resize functionality when content is editable
	   so let's add something using jQuery UI resizable
	   another option would be opening a dialog for user to enter dimensions. */
	if ( typeof jQuery.ui !== 'undefined' && ace.vars['webkit'] ) {
		
		var lastResizableImg = null;
		function destroyResizable() {
			if(lastResizableImg == null) return;
			lastResizableImg.resizable( "destroy" );
			lastResizableImg.removeData('resizable');
			lastResizableImg = null;
		}

		var enableImageResize = function() {
			$('.wysiwyg-editor')
			.on('mousedown', function(e) {
				var target = $(e.target);
				if( e.target instanceof HTMLImageElement ) {
					if( !target.data('resizable') ) {
						target.resizable({
							aspectRatio: e.target.width / e.target.height,
						});
						target.data('resizable', true);
						
						if( lastResizableImg != null ) {
							//disable previous resizable image
							lastResizableImg.resizable( "destroy" );
							lastResizableImg.removeData('resizable');
						}
						lastResizableImg = target;
					}
				}
			})
			.on('click', function(e) {
				if( lastResizableImg != null && !(e.target instanceof HTMLImageElement) ) {
					destroyResizable();
				}
			})
			.on('keydown', function() {
				destroyResizable();
			});
	    }

		enableImageResize();
	}
}
		</script>
</body>
</html>