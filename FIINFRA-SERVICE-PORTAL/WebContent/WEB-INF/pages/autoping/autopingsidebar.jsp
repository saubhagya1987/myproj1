<div class="col-md-3 sidebar-offcanvas" role="navigation" style="margin-top:10px; padding-left:10px;" >
	<div class="list-group">
		<a class="list-group-item active" >AutoPings</a>
      		<a href="<%=request.getContextPath()%>/autoping/getAutoPings.htm" class="list-group-item" id="SPAutoPingLibManagerLink">AutoPing Library Manager </a>
      		<a href="<%=request.getContextPath()%>/autoping/getAutoPingEvent.htm" class="list-group-item" id="SPAutoPingEventListLink">Event List </a>
      		<a href="<%=request.getContextPath()%>/autoping/getAutoPingScheduled.htm" class="list-group-item" id="SPAutoPingViewScheduledLink">View Scheduled AutoPing</a>
			
	</div>
</div>
<script>
	$(function() {
   		showSelectedTab('autopingLink');
	})
</script>

