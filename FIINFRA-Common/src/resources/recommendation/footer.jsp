<script type="text/javascript">
   if('ontouchstart' in document.documentElement) document.write("<script src='${_cdn}/assets/js/jquery.mobile.custom.js'>"+"<"+"/script>");
  </script> 

<!-- page specific plugin scripts --> 

<!--[if lte IE 8]>
    <script src="../assets/js/excanvas.js"></script>
  <![endif]--> 
<%-- <script src="${_cdn}/assets/js/bootstrap.min.js"></script>  --%>
<script src="${_cdn}/assets/js/jquery-ui.min.js"></script> 
<%-- <script src="${_cdn}/assets/js/jquery-ui.custom.js"></script>  --%>
	
<script src="${_cdn}/assets/js/jquery.ui.touch-punch.js"></script> 
<script src="${_cdn}/assets/js/bootbox.js"></script> 
<script src="${_cdn}/assets/js/jqGrid/jquery.jqGrid.src.js"></script> 
<script src="${_cdn}/assets/js/jqGrid/i18n/grid.locale-en.js"></script> 
<script src="${_cdn}/assets/js/jquery.easypiechart.js"></script> 
<script src="${_cdn}/assets/js/jquery.sparkline.js"></script> 
<script src="${_cdn}/assets/js/flot/jquery.flot.min.js"></script> 
<script src="${_cdn}/assets/js/flot/jquery.flot.pie.min.js"></script> 
<script src="${_cdn}/assets/js/flot/jquery.flot.resize.min.js"></script> 
<script src="${_cdn}/assets/js/date-time/moment.min.js"></script>
<%-- <script src="${_cdn}/assets/js/date-time/bootstrap-datepicker.min.js"></script>  --%>
<script src="${_cdn}/assets/js/date-time/bootstrap-datetimepicker.min.js"></script> 
<script src="${_cdn}/assets/js/jquery.inputlimiter.1.3.1.js"></script>
<script src="${_cdn}/assets/js/chosen.jquery.min.js"></script>


<jsp:include page="../common/footer.jsp" />

<script type="text/javascript">
   
var config = {
	      '.chosen-select'           : {},
	      '.chosen-select-deselect'  : {allow_single_deselect:true},
	      '.chosen-select-no-single' : {disable_search_threshold:10},
	      '.chosen-select-no-results': {no_results_text:'Oops, nothing found!'},
	      '.chosen-select-width'     : {width:"95%"}
	    }
	    for (var selector in config) {
	      $(selector).chosen(config[selector]);
	    }
	    
	////////////////ScrollBar////////////
  	/* $('.page-content').ace_scroll({
		size: 380
    });
	
	$('.analysis_cashflow').ace_scroll({
	size: 414
 	});
	 */
	$('#vaccation').ace_scroll({
		size: 360
	 	});
	// $('.panel-body').ace_scroll({size: 225});
	$('.EP_cnt').ace_scroll({size: 350});
	 $('.scrollable_data').ace_scroll({size: 350});
	 
	$('#risk_cover_tab,#loans_tab,#emergency_planning_tab,#goal_plan_tab,#tax_planning_tab,#succession_planning_tab,#vacation_planning_tab').ace_scroll({
		size: 360
	 	});
		
	 	
  </script>