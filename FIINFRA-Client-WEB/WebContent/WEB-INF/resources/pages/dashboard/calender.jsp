<%@page import="in.fiinfra.cp.common.model.CommonRequest"%>
<%@page import="java.util.Calendar"%>
<%@page import="in.fiinfra.cp.CommonUtils"%>
<%@page import="in.fiinfra.cp.CalenderData"%>
<%@page import="java.util.List"%>
 <%-- <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/fullcalendar.css" />
<link href="${pageContext.request.contextPath}/resources/css/responsive-calendar.css" rel="stylesheet">
<script src="${pageContext.request.contextPath}/resources/js/plugin/responsive-calendar.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/plugin/bootstrap.min.js"></script> --%>
<%List<CalenderData> lst=(List<CalenderData>) request.getAttribute("calender"); %>

<% %>
<script type="text/javascript">

	 
			jQuery(function($) {
	var calendarData = ${calendarData};
	var result = [];
    var keys = Object.keys(calendarData);
    keys.forEach(function(key){
        result.push(calendarData[key]);
    });
	var innerArray=new Array();
	var outerArray = new Array();
	for(var i=0;i<result.length;i++)
		{
		innerArray.push('{"title": "'+result[i].title+" event"+'", "start":"'+result[i].start+'"}');
		outerArray.push(innerArray);
		}

		var start = "["
		var outarray = innerArray.toString() + "]";
		var result = start.concat(outarray);

		var calendar = $('#calendar').fullCalendar({
			//isRTL: true,
			buttonHtml : {
				prev : '<i class="ace-icon fa fa-chevron-left"></i>',
				next : '<i class="ace-icon fa fa-chevron-right"></i>'
			},
			header : {
				left : 'prev, today',
				center : 'title',
				right : 'next'
			},
			events : JSON.parse(result),
			/* [{	title:'event',
				start:'2015-02-19'
			}] */
			eventColor : 'RED',
			editable : false,
			selectable : true,
			selectHelper : true,

		});
	});
</script> 

<%-- <script type="text/javascript">
  var calendarData = ${calendarData};
  var today = '<%= CommonUtils.format(Calendar.getInstance().getTime(), "yyyy-MM-dd") %>' ;
  
      $(document).ready(function () {
        $("#calendar").fullCalendar({
          time: today,
          events: calendarData
        });
      });
  </script> --%>



  <!-- end of "header" id -->
  <!-- end of "nav-menu" id -->
  <%-- <div id="header-strip" class="fl">
  <jsp:include page="../menu.jsp"></jsp:include>
    <h3 class="clearfix fl">MY CALENDAR</h3>
    </div> --%>
  <!-- end of "header-strip" id -->
  
 <!--  <div id="inner-shadow-strip"></div> -->
  <!-- end of "inner-shadow-strip" id -->
  <!-- <legend>MY CALENDAR</legend> -->
  <div id="contents">
    <section class="in_content clearfix" id="calender_main">
      <div class="calender_main_bx_in">
      <% CommonRequest q = (CommonRequest) request.getAttribute("q"); %>
     
        <div class="col-xs-12" align="center">
              <a class="btn btn-primary" href="${pageContext.request.contextPath}/common/calender?filter=Today"><div <%="Today".equalsIgnoreCase(q.getFilter()) ?" active":"" %> "><i class="fa fa-calendar fa-2x"></i><span class="menu-text">Todays Events</span> </div></a>
              <a class="btn btn-primary" href="${pageContext.request.contextPath}/common/calender?filter=W"><div <%="W".equalsIgnoreCase(q.getFilter()) ?" active":"" %>"> <i class="fa fa-calendar fa-2x"></i><span class="menu-text">This Week Events</span></div></a>
              <a class="btn btn-primary" href="${pageContext.request.contextPath}/common/calender?filter=M"><div  <%="M".equalsIgnoreCase(q.getFilter()) ?" active":"" %>"><i class="fa fa-calendar fa-2x"></i><span class="menu-text"> This Month Events</span></div></a>
              <a class="btn btn-primary" href="${pageContext.request.contextPath}/common/calender?filter=All"><div  <%="All".equalsIgnoreCase(q.getFilter()) ?" active":"" %>"><i class="fa fa-calendar fa-2x"></i><span class="menu-text"> All Events</span></div></a>
        </div>
      
       
       
              <!-- Responsive calendar - START -->
    	<!-- <div class="responsive-calendar">
        <div class="controls">
            <a class="pull-left" data-go="prev"><div class="btn btn-primary">Prev</div></a>
            <h4><span data-head-year></span> <span data-head-month></span></h4>
            <a class="pull-right" data-go="next"><div class="btn btn-primary">Next</div></a>
        </div><hr/>
        <div class="day-headers">
          <div class="day header">Mon</div>
          <div class="day header">Tue</div>
          <div class="day header">Wed</div>
          <div class="day header">Thu</div>
          <div class="day header">Fri</div>
          <div class="day header">Sat</div>
          <div class="day header">Sun</div>
        </div>
        <div class="days" data-group="days">
          
        </div>
      </div> -->
      <div class="col-xs-12">
				<div class="col-md-4">
            <div class="space"></div>
            
            <!-- #section:plugins/data-time.calendar -->
            <div id="calendar"></div>
            
            <!-- /section:plugins/data-time.calendar --></div>
				<!-- Responsive calendar - END -->
        
        
          <div class="col-md-8">
          <%if ( lst!=null && !lst.isEmpty()) { %>
            <!-- <div class="my_calender_title_bx">
              <ul>
                <li class="input_title_one fl"> Date </li>
                <li class="input_title_two fl"><span>Time</span></li>
                <li class="input_title_three fl"><span>Days to go</span></li>
                <li class="input_title_four fl"><span>Type</span></li>
                <li class="input_title_five fl"><span>Event</span></li>
                <div class="clr"></div>
              </ul>
            </div> -->
            <br>
            
            <table id="sample-table-1" class="table table-striped table-bordered table-hover">
											<thead>
												<tr>
													<th class="hidden-480">Date</th>
													<th class="hidden-480">Time</th>
													<th class="hidden-480">Days to go</th>
													<th class="hidden-480">Type</th>
													<th class="hidden-480">Event</th>
												</tr>
											</thead>
            <tbody>
            
           <% 
          for(CalenderData b:lst){
        	  %>
          
            <%-- <div class="my_calender_txt_bx">
              <div class="my_calender_txt_bx_in">
                <ul>
                  <li class="input_txt_one fl"><%= CommonUtils.formatDate(b.getEventDate())%></li>
                  <li class="input_txt_two fl"><span><%= CommonUtils.formatTime(b.getEventDate())%></span></li>
                  <li class="input_txt_three fl"><span><%= CommonUtils.getGapInDays(b.getEventDate()) %> </span></li>
                  <li class="input_txt_four fl"><span><%= b.getEventType() %></span></li>
                  <li class="input_txt_five fl"><span><%= b.getEvent() %></span></li>
                  <div class="clr"></div>
                </ul>
              </div>
            </div> --%>
            
            
												<tr>
													<td class="hidden-480"><%= CommonUtils.formatDate(b.getEventDate())%></td>
													<td class="hidden-480"><%= CommonUtils.formatTime(b.getEventDate())%></td>
													<td class="hidden-480"><%= CommonUtils.getGapInDays(b.getEventDate()) %></td>
													<td class="hidden-480"><%= b.getEventType() %></td>
													<td class="hidden-480"><%= b.getEvent() %></td>
												</tr>
											
            
            
            
          <%} %>  
          </tbody>
          </table>
            <a href="${pageContext.request.contextPath}/common/calender/csv" class="export fr" class="my-docs-btn clearfix fr btn btn-success"> Export To Outlook</a>
          </div>
       </div>
      </div>
      <!-- DC submenu Ends--> 
      
    </section>
    
    <%}else{ %>
    <div class="clr"></div> <div class="no_data_message northspace5"><%=request.getAttribute("noDataMsg")%></div> 
    <% }%>
    <!-- end of "inner-contents" id -->  
 </div>
  <!-- end of "contents" id -->


