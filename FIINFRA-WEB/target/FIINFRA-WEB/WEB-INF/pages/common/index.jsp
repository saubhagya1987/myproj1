<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<title>Landing- Home page</title>
<link href="<%=request.getContextPath()%>/images/favicon.ico" rel="shortcut icon">
<!-- -responsive css-->

<link href="<%=request.getContextPath()%>/css/responsive-calendar.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/css/carousel.css" rel="stylesheet">
<script src="<%=request.getContextPath()%>/js/googleChartApi.js"></script>
<style>
.carousel,.carousel .item{ height:auto !important}
.carousel .item { background-color: #FFF !important; }
</style>

</head>
<body>
<jsp:include page="header.jsp" />
<section>
  <!--Axis Banner start -->
<!--  <div class="row " id="topBanner"></div>
-->  <!--Axis Banner End -->
  <div class="modal fade" id="commonpopup-header1" tabindex="-1" role="dialog" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id=""></h4>
      </div>
      <div class="modal-body">
         <div class="row">
      	<div class="form-group col-md-6 clearfix">
      	<h4>Configure CAMS, Karvy and Sundaram Passwords</h4>
      	</div>
       </div>
      <div class="row">
      	<div class="form-group col-md-6 clearfix">
        	<label class="col-sm-3 control-label no-padding-right" for="CAMS">CAMS </label>
        	<div class="col-sm-9">
            	<input type="password" id="CAMS" name="CAMS" validate="1" emsg="CAMS"
									class="input-large" placeholder="CAMS Password">
            </div>
       </div>
       </div>
       <div class="row">
       <div class="form-group col-md-6 clearfix">
        	<label class="col-sm-3 control-label no-padding-right" for="Karvy">Karvy  </label>
        	<div class="col-sm-9">
            	<input type="password" id="Karvy" name="Karvy" validate="1" emsg="Karvy"
									class="input-large" placeholder="Karvy Password">
            </div>
       </div>
       </div>
       <div class="row">
       <div class="form-group col-md-6 clearfix">
        	<label class="col-sm-3 control-label no-padding-right" for="Sundaram">Sundaram </label>
        	<div class="col-sm-9">
            	<input type="password" id="Sundaram" name="Sundaram" validate="1" emsg="Sundaram"
									class="input-large" placeholder="Sundaram Password">
            </div>
       </div>
    </div>
       <div class="row">
       <div class="form-group col-md-6 clearfix">
        	<label class="col-sm-3 control-label no-padding-right" for="Sundaram">Alternate Email </label>
        	<div class="col-sm-9">
            	<input type="text" id="contactEmail" name="contactEmail" validate="1" emsg="contactEmail"
									class="input-large" placeholder="Contact Email" value="${sessionScope.userSession.contactEmail}">
            </div>
       </div>      
        <label class="col-sm-3 control-label no-padding-right" for="Sundaram">/same as registered with Registrars </label>    
    </div>
    
      </div>
      <div class="modal-footer hide" id="commonpopup-header-footer1">
        <button type="button" class="btn btn-primary btn-xs" data-dismiss="modal" id="commonpopup-header-button-ok12">Close</button>
        <button type="button" class="btn btn-primary btn-xs" id="commonpopup-header-button-ok11">Save</button>
      </div>
    </div>
  </div>
</div>
  <!--landing banner start -->
  <div class="row">
    <div id="myCarousel" class="carousel slide" data-ride="carousel">
      <ol class="carousel-indicators">
        <li class="active" data-target="#myCarousel" data-slide-to="0" ></li>
        <li data-target="#myCarousel" data-slide-to="1" style="border: 1px solid #8a8b8a;"></li>
        <li data-target="#myCarousel" data-slide-to="2" style="border: 1px solid #8a8b8a;"></li>
        <li data-target="#myCarousel" data-slide-to="3" style="border: 1px solid #8a8b8a;"></li>
        <li data-target="#myCarousel" data-slide-to="4" style="border: 1px solid #8a8b8a;"></li>
        <li data-target="#myCarousel" data-slide-to="5" style="border: 1px solid #8a8b8a;"></li>
        <li data-target="#myCarousel" data-slide-to="6" style="border: 1px solid #8a8b8a;"></li>
        <li data-target="#myCarousel" data-slide-to="7" style="border: 1px solid #8a8b8a;"></li>
        <li data-target="#myCarousel" data-slide-to="8" style="border: 1px solid #8a8b8a;"></li>
      
      </ol>
      <div class="carousel-inner boxshadow">
       
        
        <div class="item row active">
          <div id="OppChartbyStatus" alt="oppChartbyStage" title="oppChartbyStage"; style="height: 300px;margin-top:30px;" class="col-md-6"></div>
          <div id="oppChartbySource" alt="oppChartbySource" title="oppChartbySource" style="height: 300px;margin-top:30px;" class="col-md-6"></div>
        </div>
        <div class="item row">
          <div id="oppChartbyStage" alt="OppChartbyStatus" title="OppChartbyStatus" style="height: 300px;margin-top:30px;" class="col-md-6" ></div>
          <div id="OppByConvertprobability" alt="OppByConvertprobability" title="OppByConvertprobability" style="height: 300px;margin-top:30px;" class="col-md-6"></div>
        </div>
        <div class="item row">
          <div  id="ClientByProfile" alt="ClientByProfile" title="ClientByProfile" style="height: 300px;margin-top:30px;" class="col-md-6"></div>
          <div id="ClientbyCategory" alt="oppChartbyStage" title="oppChartbyStage" style="height: 300px;margin-top:30px;" class="col-md-6"></div>
        </div>
     
        <div class="item row">
          <div  id="ClientByProfession" alt="ClientByProfession" title="ClientByProfession" style="height: 300px;margin-top:30px;" class="col-md-6"></div>
          <div id="ClientbyAge" alt="oppChartbyAge" title="oppChartbyAge" style="height: 300px;margin-top:30px;" class="col-md-6"></div>
        </div>
        <div class="item row">
          <div id="Taskbystatus" alt="Taskbystatus" title="Taskbystatus" style="height: 300px;margin-top:30px;" class="col-md-6"></div>
          <div id="TaskbyCategory" alt="TaskbyCategory" title="TaskbyCategory" style="height: 300px;margin-top:30px;" class="col-md-6"></div>
        </div>
        <div class="item row">
          <div  id="Taskbyowner" alt="Taskbyowner" title="Taskbyowner" style="height: 300px;margin-top:30px;" class="col-md-6"></div>
          <div   id="Taskbytarget" alt="Taskbytarget" title="Taskbytarget" style="height: 300px;margin-top:30px;" class="col-md-6"></div>
        </div>
        <div class="item row">
          <div id="GoalByType" alt="GoalByType" title="GoalByType" style="height: 300px;margin-top:30px;" class="col-md-6"></div>
        </div>
        <div class="item row">
          <div id="PingByChannel" alt="PingByChannel" title="PingByChannel" style="height: 300px;margin-top:30px;" class="col-md-6"></div>
          <div id="PingByContactType" alt="PingByContactType" title="PingByContactType" style="height: 300px;margin-top:30px;" class="col-md-6"></div>
        </div>
        <div class="item row">
          <div id="PingByTopTenTags" alt="PingByTopTenTags" title="PingByTopTenTags" style="height: 300px;margin-top:30px;" class="col-md-6"></div>
          <div id="PingByTopTenPings" alt="PingByTopTenPings" title="PingByTopTenPings" style="height: 300px;margin-top:30px;" class="col-md-6"></div>
        </div>
        
      
      </div>
    </div>
  </div>
  <!--landing banner end -->
  <!--News start-->
  <form name="indexForm" id="indexForm">
  <input type="hidden" name="notifyTemplateXML" id="notifyTemplateXML" value="">
  <input type="hidden" name="partyId" id="partyId" value="${sessionScope.userSession.partyId}">
  <%-- <input type="hidden" name="contactEmail" id="contactEmail" value="${sessionScope.userSession.contactEmail}"> --%>
  </form>
  <div class="row" style="margin-top:20px;">
    <div class="col-md-6 southspace3">
      <div class="tab_container southspace3" style="margin-top:0;padding:0px;">
        <div class="bs-docs-example boxshadownews" style="background-color:#fff;height: 100%">
          <ul id="myTab_new" class="nav nav-tabs padding-12 tab-color-blue background-blue">
            <li class="active" style="border-radius:none;"><a href="#portfolio" data-toggle="tab">PORTFOLIO/File Upload</a></li>
            
            
          </ul>
          <div id="portfolio_links" class="tab-content">
            <div class="tab-pane fade active in" id="">
              <ul id="">
              <li class="southspace1"><a onclick="showPasswordDialog();">MF Auto Upload Configuration</a></li>
              <li class="southspace1"><a onclick="window.location.href='<%=request.getContextPath()%>/et/getTxnSource.htm'">RTA File Uploads</a></li>
              <li class="southspace1"><a onclick="window.location.href='<%=request.getContextPath() %>/folio/openclientportfolio.htm'">Client Portfolio</a></li>
              <li class="southspace1"><a onclick="window.location.href='<%=request.getContextPath()%>/et/getbulkuploadtransactiohistorydetails.htm?queueId=0'">Transaction History</a></li>
             

 

              </ul>
             </div>
            
            
          </div>
        </div>
      </div>
      
      
      
      <div class="tab_container" style="margin-top:0;padding:0px;">
        <div class="bs-docs-example boxshadownews" style="background-color:#fff;height: 100%">
          <ul id="myTab" class="nav nav-tabs padding-12 tab-color-blue background-blue">
            <li class="active newsheading" style="border-radius:none;"  ><a href="#rssFeeds" data-toggle="tab">NEWS</a></li>
            <li class=" newsheading"><a href="#general" data-toggle="tab" >GENERAL</a></li>
            <li class=" newsheading"><a href="#broadcast"  data-toggle="tab" >BROADCAST</a></li>
          </ul>
          <div id="myTabContent" class="tab-content" style="height:325px; overflow-y:auto">
            <div class="tab-pane fade active in" id="rssFeeds">
              <ul id="rssFeeds1">
              </ul>
              &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; By<img src="<%=request.getContextPath()%>/images/moneycontrol_logo.png"></div>
            <div class="tab-pane fade" id="general">
              <ul id="axisLinks">
                <br>
                <li style="font-size: 12px"><a target="_blank" href="https://axismf.com/Downloads/BondMarketReview_Axis.pdf">Get an update on debt markets</a><br>
                  <br>
                </li>
                <li style="font-size: 12px"><a target="_blank" href="https://axismf.com/Mutual-Fund/Index.aspx ">Planning for child education? Try Pehla Kadam</a><br>
                  <br>
                </li>
                <li style="font-size: 12px"><a target="_blank" href="https://axismf.com/Mutual-Fund/Funda-Singhs-Fundas.aspx">Know Funda Singh's Fundas</a><br>
                  <br>
                </li>
                <li style="font-size: 12px"><a target="_blank" href="https://axismf.com/common/kalse.aspx">Understand how compound interest affects you with Kal Se calculator</a><br>
                  <br>
                </li>
                <li style="font-size: 12px"><a target="_blank" href="https://axismf.com/common/powerof1000.aspx">See the difference those extra 1000 rupees make in the long run. Try</a><br>
                  <br>
                </li>
                <li style="font-size: 12px"><a target="_blank" href="https://axismf.com/Flash/EatingoutTool.html">Did you know that cutting down on just 1 outing a month starting from age 25 could get you? Try Eating Out calculator</a><br>
                  <br>
                </li>
              </ul>
            </div>
            <div class="tab-pane fade" id="broadcast" style="height:473px;overflow-y: auto;">
              <ul id="broadCastMsg">
              </ul>
            </div>
          </div>
        </div>
      </div>
   
      
    </div>
    
    <div class="col-md-6 southspace3">
    <ul class="nav nav-tabs padding-12 tab-color-blue background-blue">
    
    <li class="active"><a href=".cal_container" data-toggle="tab">My Pending Task Calendar</a></li>
    </ul>
      
      <div class="tab-content"><div class="boxshadow tab-pane fade active in">
        <!--<div class="responsive-calendar">
          <div class="controls"><a class="pull-left" data-go="prev">
            <div class="btn btn-primary">Prev</div>
            </a>
            <h4 class="timeInfo"></h4>
            <a class="pull-right" data-go="next">
            <div class="btn btn-primary">Next</div>
            </a></div>
          <hr/>
          <div class="day-headers">
            <div class="day headernew">Mon</div>
            <div class="day headernew">Tue</div>
            <div class="day headernew">Wed</div>
            <div class="day headernew">Thu</div>
            <div class="day headernew">Fri</div>
            <div class="day headernew">Sat</div>
            <div class="day headernew">Sun</div>
          </div>
          <div class="days" data-group="days"></div>
        </div>-->
        <div id="calendar"></div>    
      </div></div>
    </div>
    
    
    
    
    

  </div>
  <!--News End-->
  
  
</section>


<script src="<%=request.getContextPath()%>/js/responsive-calendar.js"></script>
<script src="<%=request.getContextPath()%>/js/bootstrap-tab.js"></script>
<jsp:include page="footer.jsp" />

<script type="text/javascript">
			jQuery(function($) {






	/* initialize the calendar
	-----------------------------------------------------------------*/

	


})
		</script>

<script type="text/javascript">
    	
    
    
      $(document).ready(function () {
    	 $('#nav-search').removeClass('hide');
		 $('#breadcrumbs').removeClass('hide');
    	 
          getdatafortaskcalender();
          
          
          var task = getParameterByName('task');
 	     
 	     
 	     if (task == ''|| task ==null)
 	    	 {
 	    	 
 	    	 myTimer();
 	    	 
 	    	 }
          var isRTAFilePasswordSet = '${sessionScope.userSession.isRTAFilePasswordSet}';
          var message = "";
  		if (isRTAFilePasswordSet == 'false') {
  			message = "To auto-upload your transactions data, <span class='underlined pointer' onClick='showPwdDialog()' style='color:#000'>Click Here.</span>";
			
  			//showAlertMessage1("Message", "<br/>" + message, "question",doNothing1);
  			/* $('#commonpopup-header-button-ok').attr('href','javascript:showPwdDialog()'); */
  			//$('#commonpopup-header-button-ok').hide();
  			//$('#commonpopup-header-button-ok2').attr('href','javascript:doNothing1()');
  			//$('#commonpopup-header-button-ok2').html('Cancel');
  		    $("#blink").html(message);
		    $("#blink").fadeIn();
			
		
		   
			
  		//	blinkeffect1('#blink');
  		}
  		});
      
      /* function showPwdDialog() {
    	  doNothing1();
    	  showPasswordDialog('Configure Your password', '', '', closePasswordDialog);
    	  $('#commonpopup-header-button-ok11').attr('href','javascript:saveRtaFilePasswords()');
		  $('#commonpopup-header-button-ok12').attr('href','javascript:closePasswordDialog()');
      }
       */
      var myVar = setInterval(function(){myTimer()}, 3600000);
      function myTimer()
      {
      	
      		
         	$.ajax(
         			{
         					   				
         		  type: "POST",
         		     		  
         			  url: $('#contextPath').val()+"/common/getTaskAlert.htm",
         		 dataType: 'json',
      		  contentType: 'application/json',
      			   		  success:function(result)
         		  { 
      			
      									$(result).each(
      									function(i, obj) 
      									{
      											var createdby=obj.taskCreatedBy;
      											
      										    var subject=obj.subject;
      										    
      										    var priorityId=obj.priorityId;
      										    var statusName=obj.statusName;
      										
      										    
      										    if(createdby>0 && priorityId>0)
										    	{
										    	
							/* 			    	showAlertMessage("Success", "Reminder: You have " +createdby+" Pending task which will  finish  after two hours :" +subject+
										    			"You have "+priorityId+" Pending task  which will be end  on the tomorrow :"+statusName,	    			
										    													    			"confirmation", doNothing);	 */
										      	bootbox.dialog({
										      		
										      		
										      		
								   				  	message: "<span class='bigger-110'>You have </span>"+createdby+"<span>Pending task which will  finish  after two hours :</span> "+subject+
								   				  	    	"<span><br>You have </span>"+priorityId+"<span>Pending task which will finish tomorrow  :</span> "+statusName ,
								   					buttons: 			
								   					{
								   						"click" :
								   						{
								   							"label" : "OK!",
								   							"className" : "btn-xs btn-primary",
								   							"callback": function() {
								   				//				location.reload();
								   							}
								   						}
								   					}
								   				});
										    	}
										    else if(createdby>0 )
									    	{
										    	
										    	bootbox.dialog({
								   				  	message: "<span class='bigger-110'>You have </span>"+createdby+"<span>Pending task which will  finish  after two hours :</span> "+subject ,
								   					buttons: 			
								   					{
								   						"click" :
								   						{
								   							"label" : "OK!",
								   							"className" : "btn-xs btn-primary",
								   							"callback": function() {
								   				//				location.reload();
								   							}
								   						}
								   					}
								   				});
										    	
									  /*   	showAlertMessage("Success", "Reminder: You have " +createdby+" Pending task which will  finish  after two hours :" +subject,
									    													    			"confirmation", doNothing);	
									    	 */
									    	}
										    else if(priorityId>0 )
									    	{
										      	bootbox.dialog({
								   				  	message: "<span class='bigger-110'>You have </span>"+priorityId+"<span>Pending task which will finish tomorrow  :</span> "+statusName ,
								   					buttons: 			
								   					{
								   						"click" :
								   						{
								   							"label" : "OK!",
								   							"className" : "btn-xs btn-primary",
								   							"callback": function() {
								   				//				location.reload();
								   							}
								   						}
								   					}
								   				});
										    	
										    	
									    /* 	showAlertMessage("Success", "Reminder: You have "+priorityId+" Pending task which will finish tomorrow :"+statusName,
									    													    			"confirmation", doNothing);	 */
									    	
									    	}
      									/* 	    if(createdby>0 && priorityId>0)
      										    	{
      										    	showAlertMessage("Success", "Reminder: You have " +createdby+" Pending task which will finish after two hours:" +subject+
      										    		     										    			
      										    			
      										    			"You have "+priorityId+" Pending task which will finish tomorrow:"+statusName,	    			
      										    													    			"confirmation", doNothing);	
      										    	
      										    	}
      										    else if(createdby>0 )
      									    	{
      									    	showAlertMessage("Success", "Reminder: You have " +createdby+" Pending task which will finish after two hours:" +subject,
      									    													    			"confirmation", doNothing);	
      									    	
      									    	}
      										    else if(priorityId>0 )
      									    	{
      									    	showAlertMessage("Success", "Reminder: You have "+priorityId+" Pending task which will finish tomorrow :"+statusName,
      									    													    			"confirmation", doNothing);	
      									    	
      									    	} */
      			
      										
      							  
      						});
         		  }
         	
         	});
         

      	
      	
      	
      	
      	
      }
      function broadCastList(){

    	  $.ajax({	
  			type : "GET",			
  			url : $('#contextPath').val()+'/common/getBroadCastList.htm',  			
  			success : function(result) {
  				var msgTitle='';
  				var msgDescription='';

  				$('#broadCastMsg').empty();
  				$(result).each(
  						function(i, obj) {	
  				msgTitle=obj.broadCastTitle;
  				msgDescription=obj.broadCastDescription;
  				


  					$('#broadCastMsg').append('<li style="font-size: 12px">'+msgDescription+'<br><br></li>');	

  				});
  			}
  		});
  	
      }
      
      function getdatafortaskcalender() {
       		
  		
  		$.ajax({
  			type : "POST",
  			url : $('#contextPath').val()+'/partner/showPieChart.htm?type=Taskbydate',
  			success : function(result) {
  				var firstRow = new Array();	
  				firstRow.push('Goal');
  				firstRow.push('Goal By Type');
  				var title = 'Goal By Type  ';
 
  				var outerArray = create2dArrayforgoal(result);
  				
  				taskcalender(outerArray);

  			}
  		});
  	}
      
      function create2dArrayforgoal(result) {
  		isDataAvailable = false;
  		var innerArray = new Array();
  		var outerArray = new Array();
  		var date;
  		for ( var i = 0; i < result.length; i++) {

  			innerArray = new Array();
  			date= String.valueOf(result[i].title);
  			
  			
  			innerArray.push('{"title": "'+result[i].count+'", "start":"'+result[i].title+'","className": "label-important","url": "${pageContext.request.contextPath}/task/getTaskList.htm?value='+result[i].title+'"}');
  			//innerArray.push('"'+result[i].title+'": {"title": "'+result[i].count+'", "url": "${pageContext.request.contextPath}/task/getTaskList.htm?value='+result[i].title+'"}'  ); 
  			
  			outerArray.push(innerArray);
  			
  			
  		}
  		return outerArray;
  	}
      
      function taskcalender(outerArray) 
      {
    	  var start = "[";
    	  var outarray=outerArray.toString()+"]";
    	  var result = start.concat(outarray);
 	 var fullDate = new Date();console.log(fullDate);
		var twoDigitMonth = ((fullDate.getMonth().length+1) === 1)? (fullDate.getMonth()+1) : '0' + (fullDate.getMonth()+1);
		  /*$(".responsive-calendar").responsiveCalendar({
			  onDayClick: function(events) { 
				  var datevalue=$(this).attr('data-day')+'/'+$(this).attr('data-month')+'/'+$(this).attr('data-year');
				  addTaskFromHomePage(datevalue);  
			  },
				  	
         time: ''+fullDate.getFullYear()+'-'+twoDigitMonth+'',
         events:JSON.parse(result)         
		});*/
		//alert(result)
		var date = new Date();
		var d = date.getDate();
		var m = date.getMonth();
		var y = date.getFullYear();


		var calendar = $('#calendar').fullCalendar({
			//isRTL: true,
			 buttonHtml: {
				prev: '<i class="ace-icon fa fa-chevron-left"></i>',
				next: '<i class="ace-icon fa fa-chevron-right"></i>'
			},
		
			header: {
				left: 'prev,next today',
				center: 'title',
				right: 'month,agendaWeek,agendaDay'
			},
			events:/*[
					  {
							title: 'Car EMI',
							start: new Date(y, m, 1),
							allDay: true,
							className: 'label-important'
						  },
						  {
							title: 'Meeting with IFA',
							start: moment().subtract(5, 'days').format('YYYY-MM-DD'),
							end: moment().subtract(1, 'days').format('YYYY-MM-DD'),
							className: 'label-success'
						  },
						  {
							title: 'Housing EMI',
							start: new Date(y, m, d-3, 16, 0),
							allDay: true,
							className: 'label-info'
						  }
						]*/  
						JSON.parse(result) 
			,
			editable: true,
			droppable: true, // this allows things to be dropped onto the calendar !!!
			drop: function(date, allDay) { // this function is called when something is dropped
			
				// retrieve the dropped element's stored Event Object
				var originalEventObject = $(this).data('eventObject');
				var $extraEventClass = $(this).attr('data-class');
				
				// we need to copy it, so that multiple events don't have a reference to the same object
				var copiedEventObject = $.extend({}, originalEventObject);
				
				// assign it the date that was reported
				copiedEventObject.start = date;
				copiedEventObject.allDay = allDay;
				if($extraEventClass) copiedEventObject['className'] = [$extraEventClass];
				
				// render the event on the calendar
				// the last `true` argument determines if the event "sticks" (http://arshaw.com/fullcalendar/docs/event_rendering/renderEvent/)
				$('#calendar').fullCalendar('renderEvent', copiedEventObject, true);
				
				// is the "remove after drop" checkbox checked?
				if ($('#drop-remove').is(':checked')) {
					// if so, remove the element from the "Draggable Events" list
					$(this).remove();
				}
				
			}
			,
			selectable: true,
			selectHelper: true,
			select: function(start, end, allDay) {
				
			 /* 	bootbox.prompt("New Event Title:", function(title) {
					if (title !== null) {
						calendar.fullCalendar('renderEvent',
							{
								title: title,
								start: start,
								end: end,
								allDay: allDay,
								className: 'label-info'
							},
							true // make the event "stick"
						);
					}
				});  */
				
				/* var datevalue=new Date(start);
				var d = datevalue.getDate()+1;
				var m = datevalue.getMonth()+1;
				var y = datevalue.getFullYear();
				var hh = datevalue.getHours();
				var mm = datevalue.getMinutes();
				var ampm = datevalue.getTimezoneOffset() */
				//addTaskFromHomePage(d +"/"+m+"/"+y+" "+hh+":"+mm+" "+ampm); 
				//calendar.fullCalendar('unselect');
				
				//var output = new Date(start);
				var output = convertUTCDateToLocalDate(new Date(start));
				//alert("output::"+output.toLocaleString());
				var dd = output.getDate();
				var mm = output.getMonth()+1; //January is 0!
				var yyyy = output.getFullYear();
				var hours=output.getHours();
				var minute=output.getMinutes();
				if(dd<10) {
				    dd='0'+dd
				} 
				if(mm<10) {
				    mm='0'+mm
				} 
				if ( minute==0	||minute==1	||minute==2	||minute==3	||minute==4	||minute==5	||minute==6	||minute==7	||minute==8	||minute==9)
				{
					
				minute='0'+minute;
				}

				var mm1='';
				if(hours<12)
					{
					mm1="AM";
					}
				else
					{
					mm1="PM";
					hours=hours-12;
					}

				var today = dd+'/'+mm+'/'+yyyy+' '+hours+':'+ minute +' '+mm1;
				addTaskFromHomePage(today);
			}
			,
			eventClick: function(calEvent, jsEvent, view) {

				//display a modal
				/*var modal = 
				'<div class="modal fade">\
				  <div class="modal-dialog">\
				   <div class="modal-content">\
					 <div class="modal-body">\
					   <button type="button" class="close" data-dismiss="modal" style="margin-top:-10px;">&times;</button>\
					   <form class="no-margin">\
						  <label>Change event name &nbsp;</label>\
						  <input class="middle" autocomplete="off" type="text" value="' + calEvent.title + '" />\
						 <button type="submit" class="btn btn-xs btn-success"><i class="ace-icon fa fa-check"></i> Save</button>\
					   </form>\
					 </div>\
					 <div class="modal-footer">\
						<button type="button" class="btn btn-xs btn-danger" data-action="delete"><i class="ace-icon fa fa-trash-o"></i> Delete Event</button>\
						<button type="button" class="btn btn-xs" data-dismiss="modal"><i class="ace-icon fa fa-times"></i> Cancel</button>\
					 </div>\
				  </div>\
				 </div>\
				</div>';
			
			
				var modal = $(modal).appendTo('body');
				modal.find('form').on('submit', function(ev){
					ev.preventDefault();

					calEvent.title = $(this).find("input[type=text]").val();
					calendar.fullCalendar('updateEvent', calEvent);
					modal.modal("hide");
				});
				modal.find('button[data-action=delete]').on('click', function() {
					calendar.fullCalendar('removeEvents' , function(ev){
						return (ev._id == calEvent._id);
					})
					modal.modal("hide");
				});
				
				modal.modal('show').on('hidden', function(){
					modal.remove();
				});*/
				//var datevalue=$(this).attr('data-day')+'/'+$(this).attr('data-month')+'/'+$(this).attr('data-year');
				//alert(datevalue)
				 // addTaskFromHomePage(datevalue);  


				//console.log(calEvent.id);
				//console.log(jsEvent);
				//console.log(view);

				// change the border color just for fun
				//$(this).css('border-color', 'red');

			}
			
		});
  	}
		
      
      function claenderresponsive()
      {
    	  $(".responsive-calendar").responsiveCalendar({
              time: '2014-02',
              events: {
                "2014-02-18": {"number": 3, "url": "task.html","dayEvents": [{"name": "Important meeting"}]},
                "2014-02-26": {"number": 1, "url": "task.html","dayEvents": [{"name": "Important meeting"}]}, 
                "2014-02-03":{"number": 1, "url": "task.html","dayEvents": [{"name": "Important meeting"}]}, 
                "2014-03-12": {"number": 1,  "url": "task.html","dayEvents": [{"name": "Important meeting"}]}
    			}
    		});
    		
    	  }
      
      function showDiv(id){
    	  $('.tab-pane').hide();
    	  $('#'+id).show();
      }
      
      
      function addTaskFromHomePage(datevalue){
    	  window.location.href= $('#contextPath').val()+'/addtask.htm?datevalue='+datevalue;
      }
    </script>
    
<script>
  (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
  (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
  m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
  })(window,document,'script','//www.google-analytics.com/analytics.js','ga');

  ga('create', 'UA-48212643-1', 'fiinfra.in');
  ga('send', 'pageview');

</script>

<script type="text/javascript">


function myFunction()
{
alert("Thank you for writing to us. We will take prompt action on this ticket and revert to you shortly.");
}

</script>

<!--     Google charts start -->

<script type="text/javascript">


google.load("visualization", "1", {
 	packages : [ "corechart",'gauge']

});

$(document).ready(function(){
			readBuConfigurationXml();
		  $("#QuickLink").click(function(){
		  $("#QuickLinkMenu").slideToggle();
			});
			
	$.ajax({
		type : "GET",
		url : $('#contextPath').val()+'/common/RSSFeedsReader.htm',
		success:function(result){

			result=JSON.parse(result);
			
			var i=0;
			$('#rssFeeds1').empty();
			while(i<result.length){				
				var title=result[i];
				i+=1;
				var link=result[i];
				i+=1;
				$('#rssFeeds1').append('<li style="font-size: 12px"><a target="_blank" href="'+link+'">'+title+'</a><br><br></li>');
			}	
			broadCastList();

		}	
	});
	
	
	
	showSelectedTab('homeLink');
	/// slider code
	
	var $slider = $('.slider'); // class or id of carousel slider
	var $slide = 'li';  
	
	  var $transition_time = 1000; // 1 second
	  var $time_between_slides = 4000; // 4 seconds

	  function slides(){
	    return $slider.find($slide); 
	  }

	
	  // set active classes
	  slides().first().addClass('active');
	  slides().first().fadeIn($transition_time);

	  // auto scroll 
	  $interval = setInterval(
	    function(){
	      var $i = $slider.find($slide + '.active').index();

	      slides().eq($i).removeClass('active');
	      slides().eq($i).fadeOut($transition_time);

	      if (slides().length == $i + 1) $i = -1; // loop to start
	      slides().eq($i + 1).fadeIn($transition_time);
	      slides().eq($i + 1).addClass('active');
	    }
	    , $transition_time +  $time_between_slides 
	  );

	  
	  
	   
	  
	    displayClientByProfileChart(365, '365');
	    displayOppByStatusChart(365, '365');
 		displayOppBySourceChart(365, '365');
 		displayOppByStageChart(365, '365');
 		displayOppByConvertprobabilityChart(365, '365');
 		displayGoalByTypeChart(365, '365');
 		displayTaskbyTargetChart(365, '365');
 		displayTaskbyOwnerChart(365, '365');
 		displayTaskbyCategoryChart(365, '365');
 		displayTaskbyStatusChart(365, '365');
 		displayClientbyCategoryChart(365, '365');
 		displayClientByProfessionChart(365, '365');
 		displayClientByAgeChart(365, '365');
 		displayZimmaderiCloudsChart(365,'365');
 		displayPingsByChannel(365,'365');
 		displayPingsByContactType(365,'365');
 		displayPingsByToptenTags(365,'365');
 		displayPingsByToptenPing(365,'365');
 		displayZimmedariScore();
		
	
}) ;

  $(window).resize(function(){
        displayClientByProfileChart(365, '365');
	    displayOppByStatusChart(365, '365');
 		displayOppBySourceChart(365, '365');
 		displayOppByStageChart(365, '365');
 		displayOppByConvertprobabilityChart(365, '365');
 		displayGoalByTypeChart(365, '365');
 		displayTaskbyTargetChart(365, '365');
 		displayTaskbyOwnerChart(365, '365');
 		displayTaskbyCategoryChart(365, '365');
 		displayTaskbyStatusChart(365, '365');
 		displayClientbyCategoryChart(365, '365');
 		displayClientByProfessionChart(365, '365');
 		displayClientByAgeChart(365, '365');
 		displayZimmaderiCloudsChart(365,'365');
 		displayPingsByChannel(365,'365');
 		displayPingsByContactType(365,'365');
 		displayPingsByToptenTags(365,'365');
 		displayPingsByToptenPing(365,'365');
 		displayZimmedariScore();
});


function readBuConfigurationXml()
{
	
	var SectionName;
	var ImagePathForAdInDc1;
	var Url;
	var buIdInSession = $('#buId').val();
	
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
		        				  if(SectionName=='Top Section-Landing page')
		        				  {
			        				  $(obj).find('Configuration').each(function(i,obj){  
			        					  ImagePathForAdInDc1 =$(this).attr('ImagePath');	
				        			      Url = $(this).attr('Url');
				        			      if($.trim(ImagePathForAdInDc1)!='' && $.trim(ImagePathForAdInDc1)!=undefined)
				        			      	$('#topBanner').append('<div class="col-md-12" style="margin:20px 0;" ><img src="'+ImagePathForAdInDc1+'"  width="1131" height="115" class="img-responsive"> </div>');
				        			      else 
											$('#topBanner').css('margin-bottom','20px');				        			    
				        			  });   
			        			     
		        				  }
	        			  } 
	        		
	        		  });
	        		
	        		
	        	});
        }	
	 });	
}

	function displayOppByStatusChart(criteria, label) {
		isDataAvailable = true;
		$('#OppChartbyStatus').show();
		
		$.ajax({
			type : "POST",
			url : $('#contextPath').val()+'/partner/showPieChart.htm?type=status',
			success : function(result) {
				var firstRow = new Array();
				firstRow.push('Opp');
				firstRow.push('Opp By Status');
				var title = 'Opportunities By Status';
					
				var divId = 'OppChartbyStatus';
				var outerArray = create2dArray(result, firstRow);
				
				drawCharts(outerArray, title, divId);

			}
		});
	}
	
	function displayOppBySourceChart(criteria, label) {
		isDataAvailable = true;
		$('#oppChartbySource').show();
		
		$.ajax({
			type : "POST",
			url : $('#contextPath').val()+'/partner/showPieChart.htm?type=source',
			success : function(result) {
				var firstRow = new Array();
				firstRow.push('Opportunity1');
				firstRow.push('Opportunity By Source');
				var title = 'Opportunities By Source  ';
				
				var divId = 'oppChartbySource';
				var outerArray = create2dArray(result, firstRow);
				
				drawCharts(outerArray, title, divId);

			}
		});
	}
	
	
	
	function displayOppByStageChart(criteria, label) {
		isDataAvailable = true;
		$('#oppChartbyStage').show();
		
		$.ajax({
			type : "POST",
			url : $('#contextPath').val()+'/partner/showPieChart.htm?type=stage',
			success : function(result) {
				var firstRow = new Array();
				firstRow.push('Opportunity2');
				firstRow.push('Opportunity By Stage');
				var title = 'Opportunities By Stage  ';
						
				var divId = 'oppChartbyStage';

				var outerArray = create2dArray(result, firstRow);
				
				drawCharts(outerArray, title, divId);

			}
		});
	}
	
	function displayOppByConvertprobabilityChart(criteria, label) {
		isDataAvailable = true;
		$('#OppByConvertprobability').show();
		
		$.ajax({
			type : "POST",
			url : $('#contextPath').val()+'/partner/showPieChart.htm?type=convertProbab',
			success : function(result) {
				var firstRow = new Array();
				firstRow.push('Opportunity3');
				firstRow.push('Opportunity By Convertprobability');
				var title = 'Opportunities By Convertprobability  ';

				var divId = 'OppByConvertprobability';
				var outerArray = create2dArray(result, firstRow);
				
				drawCharts(outerArray, title, divId);

			}
		});
	}
	
	
	
	function displayClientByProfileChart(criteria, label) {
		
		isDataAvailable = true;
		$('#ClientByProfile').show();
	
		$.ajax({
			type : "POST",
			url : $('#contextPath').val()+'/partner/showPieChart.htm?type=clientprofile',
			success : function(result) {
				
				var firstRow = new Array();
				firstRow.push('Opportunity3');
				firstRow.push('Client By Profile');
				var title = 'Client By Profile  ';
				
				var divId = 'ClientByProfile';
				var outerArray = create2dArray(result, firstRow);
				
				drawCharts(outerArray, title, divId);

			}
		});
	}
	
	
	function displayClientByProfessionChart(criteria, label) {
		isDataAvailable = true;
		$('#ClientByProfession').show();
	
		$.ajax({
			type : "POST",
			url : $('#contextPath').val()+'/partner/showPieChart.htm?type=clientprofession',
			success : function(result) {
				var firstRow = new Array();
				firstRow.push('Client');
				firstRow.push('Client By Profession');
				var title = 'Client By Profession  ';
			
				var divId = 'ClientByProfession';
				var outerArray = create2dArray(result, firstRow);
				
				drawCharts(outerArray, title, divId);

			}
		});
	}
	
	function displayClientByAgeChart(criteria, label) {
		isDataAvailable = true;
		$('#ClientbyAge').show();
	
		$.ajax({
			type : "POST",
			url : $('#contextPath').val()+'/partner/showPieChart.htm?type=clientage',
			success : function(result) {
				var firstRow = new Array();
				firstRow.push('Client');
				firstRow.push('Client By Age');
				var title = 'Client By Age  ';
				
				var divId = 'ClientbyAge';
				var outerArray = create2dArray(result, firstRow);
				
				drawCharts(outerArray, title, divId);

			}
		});
	}
	
	
	function displayClientbyCategoryChart(criteria, label) {
		isDataAvailable = true;
		$('#ClientbyCategory').show();
	
		$.ajax({
			type : "POST",
			url : $('#contextPath').val()+'/partner/showPieChart.htm?type=clientCategory',
			success : function(result) {
				var firstRow = new Array();
				firstRow.push('Client');
				firstRow.push('Client By Category');
				var title = 'Client By Category  ';
		
				var divId = 'ClientbyCategory';
				var outerArray = create2dArray(result, firstRow);
				
				drawCharts(outerArray, title, divId);

			}
		});
	}
	
	
	function displayTaskbyStatusChart(criteria, label) {
		isDataAvailable = true;
		$('#Taskbystatus').show();
	
		$.ajax({
			type : "POST",
			url : $('#contextPath').val()+'/partner/showPieChart.htm?type=taskStatus',
			success : function(result) {
				var firstRow = new Array();
				firstRow.push('Task');
				firstRow.push('Task By Status');
				var title = 'Task By Status  ';
			
				var divId = 'Taskbystatus';
				var outerArray = create2dArray(result, firstRow);
				
				drawCharts(outerArray, title, divId);

			}
		});
	}
	
	function displayTaskbyCategoryChart(criteria, label) {
		isDataAvailable = true;
		$('#TaskbyCategory').show();
	
		$.ajax({
			type : "POST",
			url : $('#contextPath').val()+'/partner/showPieChart.htm?type=taskCategory',
			success : function(result) {
				var firstRow = new Array();
				firstRow.push('Task');
				firstRow.push('Task By Category');
				var title = 'Task By Category  ';
			
				var divId = 'TaskbyCategory';
				var outerArray = create2dArray(result, firstRow);
				
				drawCharts(outerArray, title, divId);

			}
		});
	}
	
	function displayTaskbyOwnerChart(criteria, label) {
		
		isDataAvailable = true;
		$('#Taskbyowner').show();
		$.ajax({
			type : "POST",
			url : $('#contextPath').val()+'/partner/showPieChart.htm?type=taskOwner',
			success : function(result) {
				
				var firstRow = new Array();
				firstRow.push('Task');
				firstRow.push('Task By Owner');
				var title = 'Task By Owner  ';
				
				var divId = 'Taskbyowner';
				var outerArray = create2dArray(result, firstRow);
				
				drawCharts(outerArray, title, divId);

			}
		});
	}
	
	function displayTaskbyTargetChart(criteria, label) {
		isDataAvailable = true;
		$('#Taskbytarget').show();
		
		$.ajax({
			type : "POST",
			url : $('#contextPath').val()+'/partner/showPieChart.htm?type=taskTarget',
			success : function(result) {
				var firstRow = new Array();
				firstRow.push('Task');
				firstRow.push('Task By Target');
				var title = 'Task By Target  ';
				
				var divId = 'Taskbytarget';
				var outerArray = create2dArray(result, firstRow);
				
				drawCharts(outerArray, title, divId);

			}
		});
	}
	
	function displayGoalByTypeChart(criteria, label) {
		isDataAvailable = true;
		$('#GoalByType').show();
	
		$.ajax({
			type : "POST",
			url : $('#contextPath').val()+'/partner/showPieChart.htm?type=goaltype',
			success : function(result) {
				var firstRow = new Array();
				firstRow.push('Goal');
				firstRow.push('Goal By Type');
				var title = 'Goal By Type  ';
			
				var divId = 'GoalByType';
				var outerArray = create2dArray(result, firstRow);
				
				drawCharts(outerArray, title, divId);

			}
		});
	}

	
	function displayZimmaderiCloudsChart(criteria, label) {
		isDataAvailable = true;
		var oppcount;
		var clientcount;
		var goalcount;
		
		$.ajax({
			type : "POST",
			url : $('#contextPath').val()+'/partner/showPieChart.htm?type=allRecords',
			success : function(result) {
				
				for ( var i = 0; i < result.length; i++) {
								
					if(result[i].title=='Opportunity')
						oppcount=result[i].count;
					if(result[i].title=='Client')
						clientcount=result[i].count;
					if(result[i].title=='goal')
						goalcount=result[i].count;
					
				}
				$('#oppcount').html(oppcount);
				$('#clientcount').html(clientcount);
				$('#goalcount').html(goalcount);

			}
		
		
		
		
		});
	}

	function displayPingsByChannel(criteria, label)
	{
		isDataAvailable = true;
		$('#PingByChannel').show();
		
		$.ajax({
			type : "POST",
			url : $('#contextPath').val()+'/partner/showPieChart.htm?type=pingbychannel',
			success : function(result) {
				var firstRow = new Array();
				firstRow.push('Opportunity2');
				firstRow.push('Pings By Channel');
				var title = 'Pings By Channel  ';
				
				var divId = 'PingByChannel';
				var outerArray = create2dArray(result, firstRow);
				
				drawCharts(outerArray, title, divId);

			}
		});
	}
	
	function displayPingsByContactType(criteria, label)
	{
		isDataAvailable = true;
		$('#PingByContactType').show();

		$.ajax({
			type : "POST",
			url : $('#contextPath').val()+'/partner/showPieChart.htm?type=pingbycontactType',
			success : function(result) {
				var firstRow = new Array();
				firstRow.push('Opportunity2');
				firstRow.push('Pings By Contact Type');
				var title = 'Pings By Contact Type  ';
	
				var divId = 'PingByContactType';
				var outerArray = create2dArray(result, firstRow);
				
				drawCharts(outerArray, title, divId);

			}
		});
	}
	function displayZimmedariScore()
	{
		
		isDataAvailable = true;
		$('#PingByTopTenTags').show();

		$.ajax({
			type : "POST",
			url : $('#contextPath').val()+'/partner/showPieChart.htm?type=ZimmedariScore',
			success : function(result) {
				for ( var i = 0; i < result.length; i++) {


					var count=parseFloat(result[i].count);
					$('#0').append("<img  src='https://chart.googleapis.com/chart?chs=440x230&cht=gm&chd=t:"+count+"&chxt=x,y&chxl=0:|"+count+"|1:|Starter Practice|Silver Practice|Platinum Practice&chls=3|15|1&chco=FF0000,FF8040,FFFF00,00FF00,00FFFF,0000FF,800080width='450' height='250' style='float:left;margin-top:10px';alt=\'Rank\' />");
					
				}
			}
		});
	}
	
	function displayPingsByToptenTags(criteria, label)
	{
		
		isDataAvailable = true;
		$('#PingByTopTenTags').show();
		
		$.ajax({
			type : "POST",
			url : $('#contextPath').val()+'/partner/showPieChart.htm?type=pingbyTopTenTags',
			success : function(result) {
				
				var firstRow = new Array();
				firstRow.push('Opportunity2');
				firstRow.push('Pings By Top Ten Tags');
				var title = 'Pings By Top Ten Tags  ';
				
				var divId = 'PingByTopTenTags';
				var outerArray = create2dArray(result, firstRow);
				
				drawCharts(outerArray, title, divId);

			}
		});
	}
	
	function displayPingsByToptenPing(criteria, label)
	{
		isDataAvailable = true;
		$('#PingByTopTenPings').show();
		
		$.ajax({
			type : "POST",
			url : $('#contextPath').val()+'/partner/showPieChart.htm?type=pingbyTopTenPings',
			success : function(result) {
				var firstRow = new Array();
				firstRow.push('Opportunity2');
				firstRow.push('Pings By Top Ten Pings');
				var title = 'Pings By Top Ten Pings  ';
			
				var divId = 'PingByTopTenPings';
				var outerArray = create2dArray(result, firstRow);
				
				drawCharts(outerArray, title, divId);

			}
		});
	}
	
	function create2dArray(result, firstRow) {
			
		isDataAvailable = false;
		var innerArray = new Array();
		var outerArray = new Array();
		innerArray.push(firstRow[0]);
		innerArray.push(firstRow[1]);
		outerArray.push(innerArray);
		for ( var i = 0; i < result.length; i++) {

			innerArray = new Array();
			innerArray.push(result[i].title);
			innerArray.push(parseFloat(result[i].count));
			outerArray.push(innerArray);
		
			if (result[i].value != 0) {
				isDataAvailable = true;
			}
		}
		return outerArray;
	}

	function drawCharts(outerArray, title, divId) {
	
		var data = google.visualization.arrayToDataTable(outerArray);
		var options = {
			backgroundColor: 'transparent',	
			title : title,
			is3D: true
			,height: 300
			,width: '100%'
	
		};

		var chart = new google.visualization.PieChart(document
				.getElementById(divId));
		chart.draw(data, options);

	}
	
	function searchObjects(){
		var searchText=$('#searchText').val();
		if(searchText==''){
			addCssStyles('searchText', 'Please enter some text to search.');
		}else{
			removeCssStyles('searchText');
			window.location.href='<%=request.getContextPath()%>/common/getSearchList.htm?serachText='+searchText
		}
		
	}
	function convertUTCDateToLocalDate(date) {
	    var newDate = new Date(date.getTime()+date.getTimezoneOffset()*60*1000);

	    var offset = date.getTimezoneOffset() / 60;
	    var hours = date.getHours();

	    newDate.setHours(hours - offset);

	    return newDate;   
	}
	
	</script>

</body>
</html>
