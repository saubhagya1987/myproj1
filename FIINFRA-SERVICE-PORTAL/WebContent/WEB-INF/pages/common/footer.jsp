<div class="white" id="showSecErrDiv" style="display:none;">
	<span style="text-align:center;display: inline-block; width:100%;margin-top:150px;font-weight:bold;font-size:15px;color:green">You are not authorized to view this page, please contact admin.</span>
</div>

<!--<div class="row">
	<div class="bottomstrip" style="width:100%">
		<div class="container"  style="width:100%">
			<div id="powerby">
				<img src="<%=request.getContextPath()%>/images/finfra_logo.png">
			</div>
			<div class="copyright">
				©2014 Freedom Wealth Solutions Pvt. Ltd. All Rights Reserved. | <a
					href="#" onClick=>Terms Of Use </a>| <a href="#">Privacy Policy</a>
			</div>
		</div>
	</div>
</div>-->



</div><!-- /.page-content -->
				</div>
			</div><!-- /.main-content -->

			<div class="footer">
  <div class="footer-inner"> 
    <!-- #section:basics/footer -->
    <div class="footer-content"> <span class="bigger-120"><img src="<%=request.getContextPath()%>/images/finfra_logo.png" style="width: 74px; margin-top:-2px;"> <!-- <span class="blue bolder">FIINFRA</span> Pvt. Ltd.-->&nbsp; All Rights Reserved 2015 </span> <span class="action-buttons"> <a href="" id="faceBookUrl" target="_blank"> <i class="ace-icon fa fa-facebook-square text-primary bigger-150"></i> </a> </span> </div>
    
    <!-- /section:basics/footer --> 
  </div>
</div>

			<a href="#" id="btn-scroll-up" class="btn-scroll-up btn btn-sm btn-inverse">
				<i class="ace-icon fa fa-angle-double-up icon-only bigger-110"></i>
			</a>
		</div><!-- /.main-container -->
        
        
        
<!-- basic scripts --> 
<!--<script type="text/javascript" src="<%=request.getContextPath()%>/js/pop.js"></script> -->
<%-- <script src="<%=request.getContextPath()%>/js/toggles.js"></script> 
<script src="<%=request.getContextPath()%>/js/perfect-scrollbar.js"></script> 
<script src="<%=request.getContextPath()%>/js/selectboxit.js"></script>  --%>
<!--<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery.caret.js"></script> -->
<%-- <script src="<%=request.getContextPath()%>/js/jquery.form.js"></script>  --%>
<!--<script src="<%=request.getContextPath()%>/js/common.js"></script> -->
<script type="text/javascript">
   if('ontouchstart' in document.documentElement) document.write("<script src='${_cdn}/assets/js/jquery.mobile.custom.js'>"+"<"+"/script>");
  </script> 
<%-- <script type="text/javascript" src="<%=request.getContextPath()%>/js/nicEdit.js"></script>  --%>
 

<script>

jQuery(function($) {
	$('.dialogs,.comments').ace_scroll({
					size: 300
                    });


})
                    </script>
                    
                    
<script type="text/javascript">
			
			
function fileUpload(id){
	
	
	$('#'+id).ace_file_input({
	
	//$('#id-input-file-1 , #id-input-file-2, #templateAttachment1, #templateAttachment2 , #templateAttachment3').ace_file_input({
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
		
		function makeEditor(id){
	
	function showErrorAlert (reason, detail) {
		var msg='';
		if (reason==='unsupported-file-type') { msg = "Unsupported format " +detail; }
		else {
			//console.log("error uploading file", reason, detail);
		}
		$('<div class="alert"> <button type="button" class="close" data-dismiss="alert">&times;</button>'+ 
		 '<strong>File upload error</strong> '+msg+' </div>').prependTo('#alerts');
	}

	//$('#editor1').ace_wysiwyg();//this will create the default editor will all buttons
	//#quetext is in faqlist.jsp  for add question text.
	//#anstext is in faqlist.jsp  for add Answer text.
	//#editque is in faqlist.jsp  for edit question text.
	//#editans is in faqlist.jsp  for edit Answer text.
	//but we want to change a few buttons colors for the third style
	/* $('#editor1,#editor2,#editor3,#quetext,#anstext,#editque,#editans,#disclaimer,#emailsign,#dndtemplate').ace_wysiwyg({ */
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
	/* 		{name:'insertImage', className:'btn-success'},
			null, */
			'foreColor',
			null,
			{name:'undo', className:'btn-grey'},
			{name:'redo', className:'btn-grey'}
		],
		'wysiwyg': {
			fileUploadError: showErrorAlert
		}
	}).prev().addClass('wysiwyg-style2');

	
	/**
	//make the editor have all the available height
	$(window).on('resize.editor', function() {
		var offset = $('#editor1').parent().offset();
		var winHeight =  $(this).height();
		
		$('#editor1').css({'height':winHeight - offset.top - 10, 'max-height': 'none'});
	}).triggerHandler('resize.editor');
	*/
	

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
	
	//Add Image Resize Functionality to Chrome and Safari
	//webkit browsers don't have image resize functionality when content is editable
	//so let's add something using jQuery UI resizable
	//another option would be opening a dialog for user to enter dimensions.
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

		/**
		//or we can load the jQuery UI dynamically only if needed
		if (typeof jQuery.ui !== 'undefined') enableImageResize();
		else {//load jQuery UI if not loaded
			$.getScript($path_assets+"/js/jquery-ui.custom.min.js", function(data, textStatus, jqxhr) {
				enableImageResize()
			});
		}
		*/
	}

	
}
		</script>
        
<!--Input File Type-->

        <script type="text/javascript">
			jQuery(function($) {
			
			
				$( "#input-size-slider" ).css('width','200px').slider({
					value:1,
					range: "min",
					min: 1,
					max: 8,
					step: 1,
					slide: function( event, ui ) {
						var sizing = ['', 'input-sm', 'input-lg', 'input-mini', 'input-small', 'input-medium', 'input-large', 'input-xlarge', 'input-xxlarge'];
						var val = parseInt(ui.value);
						$('#form-field-4').attr('class', sizing[val]).val('.'+sizing[val]);
					}
				});
			
				$( "#input-span-slider" ).slider({
					value:1,
					range: "min",
					min: 1,
					max: 12,
					step: 1,
					slide: function( event, ui ) {
						var val = parseInt(ui.value);
						$('#form-field-5').attr('class', 'col-xs-'+val).val('.col-xs-'+val);
					}
				});
			
			
				
				//"jQuery UI Slider"
				//range slider tooltip example
			
				
			
				//pre-show a file name, for example a previously selected file
				//$('#id-input-file-1').ace_file_input('show_file_list', ['myfile.txt'])
			
			
				
				
				//$('#id-input-file-3')
				//.ace_file_input('show_file_list', [
					//{type: 'image', name: 'name of image', path: 'http://path/to/image/for/preview'},
					//{type: 'file', name: 'hello.txt'}
				//]);
			
				
				
			
				//dynamically change allowed formats by changing allowExt && allowMime function

			

			});
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
<script src="${_cdn}/assets/js/chosen.jquery.min.js"></script>
<script src="${_cdn}/assets/js/jqGrid/i18n/grid.locale-en.js"></script> 
<script src="${_cdn}/assets/js/jquery.easypiechart.js"></script> 
<script src="${_cdn}/assets/js/jquery.sparkline.js"></script> 
<script src="${_cdn}/assets/js/flot/jquery.flot.min.js"></script> 
<script src="${_cdn}/assets/js/flot/jquery.flot.pie.min.js"></script> 
<script src="${_cdn}/assets/js/flot/jquery.flot.resize.min.js"></script> 
<script src="${_cdn}/assets/js/date-time/moment.min.js"></script>
 <%-- <script src="${_cdn}/assets/js/date-time/bootstrap-datepicker.min.js"></script> --%>  
 <script src="${_cdn}/assets/js/date-time/bootstrap-datetimepicker.js"></script>  
<script src="${_cdn}/assets/js/fullcalendar.js"></script> 
<script src="${_cdn}/assets/js/ace/elements.colorpicker.js"></script>
<script src="${_cdn}/assets/js/jquery.inputlimiter.1.3.1.js"></script>
<script src="${_cdn}/assets/js/jquery.maskedinput.js"></script>
<script src="${_cdn}/assets/js/ace/elements.wysiwyg.js"></script>
<script src="${_cdn}/assets/js/ace/elements.wizard.js"></script>



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



<script>
		jQuery(function($) {
				
			
			
				if(!ace.vars['touch']) {
					$('.chosen-select').chosen({allow_single_deselect:true}); 
					//resize the chosen on window resize
			
					$(window)
					.off('resize.chosen')
					.on('resize.chosen', function() {
						$('.chosen-select').each(function() {
							 var $this = $(this);
							 $this.next().css({'width': $this.parent().width()});
						})
					}).trigger('resize.chosen');
					//resize chosen on sidebar collapse/expand
					$(document).on('settings.ace.chosen', function(e, event_name, event_val) {
						if(event_name != 'sidebar_collapsed') return;
						$('.chosen-select').each(function() {
							 var $this = $(this);
							 $this.next().css({'width': $this.parent().width()});
						})
					});
			
			
					$('#chosen-multiple-style .btn').on('click', function(e){
						var target = $(this).find('input[type=radio]');
						var which = parseInt(target.val());
						if(which == 2) $('#form-field-select-4').addClass('tag-input-style');
						 else $('#form-field-select-4').removeClass('tag-input-style');
					});
				}
        });
		
		
                </script>
