<!DOCTYPE html>
<html lang="en">
<head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">
<title>Landing- Home page</title>
</head>
<body>
<jsp:include page="../common/header.jsp" />
<input id="contextPath" type="hidden" name="contextPath"
		value="<%=request.getContextPath()%>" />
<input type="hidden" id="buId" value="${sessionScope.userSession.buId}"/>
<input type="hidden" id="partyId" value="${sessionScope.userSession.partyId}"/>
<input type="hidden" id="roleId" value="${sessionScope.userSession.roleId}"/>		

<div class="row">
  <div class="col-md-12">
    <div class="row">
       <!-- Start Top 10 Partners -->	
      <div class="col-md-6">
        <div class="space"></div>
        <div class="widget-box widget-color-dark">
          <div class="widget-header">
            <h4 class="widget-title lighter smaller">Top 10 Partners</h4>
            <div class="widget-toolbar no-border">
            	 <select  id="toppartnerlistid" onchange="gettoppartner(this.value);">
	       		 </select>
			</div>
           </div>
          <div class="widget-body">
            <div class="widget-main no-padding">
              <table id="toppartner" class="table table-striped table-bordered table-hover">
                
              </table>
            </div>
            </div>
        </div>
      </div>
      <!-- End Top 10 Partners -->
      
       <!-- Start Top 10 Contact Login -->	
      <div class="col-md-6">
        <div class="space"></div>
        <div class="widget-box widget-color-dark">
          <div class="widget-header">
            <h4 class="widget-title lighter smaller">Top 10 Contact Login</h4>
          </div>
          <div class="widget-body">
            <div class="widget-main no-padding">
              <!-- #section:pages/dashboard.conversations -->
              <table id="topuser" class="table table-striped table-bordered table-hover">
                <thead>
                  <tr>
                    <th>Name</th>
                    <th>Login Date</th>
                    <th class="hidden-480">Time</th>
                  </tr>
                </thead>
                <tbody>
                 
                </tbody>
              </table>
             </div>
            </div>
        </div>
      </div>
       <!-- End Top 10 Contact Login -->	
    </div>
  </div>
</div>
<!-- End 1st row -->

<div class="row">
	  <div class="col-md-4">
	    <div class="space"></div>
	    <div class="widget-box">
	        <div class="widget-header">
	           <h4 class="widget-title lighter smaller">Query</h4>
	         </div>
	         <div class="widget-body">
	           <div class="widget-main no-padding"> 
	               <div class="dialogs">
	                   <div id="queryList" class="query dialogdiv">
	                    </div>
	               </div>
	           </div>
	         </div>
	     </div>
	  </div>
   	 <div class="col-md-4">
         <div class="space"></div>
            <div class="widget-box">
               <div class="widget-header">
                <h4 class="widget-title lighter smaller">News</h4>
              </div>
               <div class="widget-body">
               <div class="widget-main no-padding"> 
                   <div class="dialogs">
	                    <div id="rssFeeds1" class="testimonail dialogdiv"> 
	                 	 </div>
                  	</div>
               </div>
                </div>
             </div>
      </div>
     <div class="col-md-4">
		<h3 class="row header smaller lighter blue">
			<span class="col-sm-7">
				<i class="ace-icon fa fa-calendar-o"></i> Task Calender
			</span>
			<span class="col-sm-5">
			<label class="pull-right inline">
				<small class="muted">Stacked:</small>
					<input id="id-pills-stacked" checked="" type="checkbox" class="ace ace-switch ace-switch-5" />
				<span class="lbl middle"></span>
		 	</label>
		 	</span>
		</h3>
    	<div class="nav-pills" id="calendar"></div>
       <div class="nav nav-pills hide widget-box widget-color-transparent">
          <div class="widget-body">
            <div class="widget-main no-padding scrollable">
              <!-- #section:pages/dashboard.conversations -->
              <table id="taskdetails" class="table table-striped table-bordered table-hover">
                <thead>
                  <tr>
                    <th>Task Owner</th>
                    <th>Subject</th>
                     <th>Date</th>
                      <th>Priority</th>
                    <th class="hidden-480">Status</th>
                  </tr>
                </thead>
                <tbody>
              
                </tbody>
              </table>
           </div>
          </div>
        </div> 
 	</div>
</div>
<!-- End 2nd row -->


<div class="row">
	<!-- Start General -->
  <div class="col-md-4">
     <div class="space"></div>
        <div class="widget-box">
            <div class="widget-header">
               <h4 class="widget-title lighter smaller">General</h4>
             </div>
             <div class="widget-body">
                <div class="widget-main no-padding"> 
                    <div class="dialogs">
                     <div class="testimonail dialogdiv"> 
                     	<a target="_blank" href="https://axismf.com/Downloads/BondMarketReview_Axis.pdf" class="body">
                     	 <div class="name">Get an update on debt markets</div>
                     	 <div class="text"></div>
                        </a>
                        <a target="_blank" href="https://axismf.com/Mutual-Fund/Index.aspx " class="body">
                        <div class="name">Planning for child education? Try Pehla Kadam</div>
                        <div class="text"></div>
                       </a>
                       
                        <a target="_blank" href="https://axismf.com/Mutual-Fund/Funda-Singhs-Fundas.aspx" class="body"> 
                      	<div class="name">Know Funda Singh's Fundas</div>
                      	<div class="text"></div>
                      	</a> 
                      	
                      	<a target="_blank" href="https://axismf.com/common/kalse.aspx" class="body">
                      	<div class="name">Understand how compound interest affects you with Kal Se calculator</div> 
                      	<div class="text"></div>
                        </a>
                      
                       <a target="_blank" href="https://axismf.com/common/powerof1000.aspx" class="body">
                     	<div class="name">See the difference those extra 1000 rupees make in the long run. Try</div>
                     	<div class="text"></div>
                      </a> 
                      
                      <a target="_blank" href="https://axismf.com/Flash/EatingoutTool.html" class="body">
                      <div class="name">Did you know that cutting down on just 1 outing a month starting
                       from age 25 could get you? Try Eating Out calculator</div> 
                       <div class="text"></div>
                      </a> 
                     </div>
                  </div>
               </div>
            </div>
       	</div>
    </div>
    <!-- End General -->
    
    <!-- Start Broadcast -->
    <div class="col-md-4">
       <div class="space"></div>
          <div class="widget-box">
              <div class="widget-header">
                <h4 class="widget-title lighter smaller">Broadcast</h4>
              </div>
              <div class="widget-body">
                <div class="widget-main no-padding"> 
                   <div class="dialogs">
                   		 <div id="broadCastMsg" class="testimonail dialogdiv"> 
                   		</div>
                  </div>
                </div>
             </div>
         </div>
    </div>
    <!-- end Broadcast -->
    
  <!-- Start  gup shup -->
  <div class="col-md-4">
	  <div class="space"></div>
	    <div class="widget-box">
	      <div class="widget-header">
	        <h4 class="widget-title lighter smaller">Gup-Shup</h4>
	      </div>
	      <div class="widget-body">
	        <div class="widget-main no-padding">
	          <div class="dialogs">
	          <div id="gupshupMsg" class="dialogs">
	          </div>
	        </div>
	       </div>
	      </div>
	    </div>
	</div>
</div>
  <!-- end 3rd row -->

<!-- End gup shup -->
<div id="switch" style="display: none;">
  <div id="popupwrapper_contactform"
			style="width: 250px; height: 160px;">
    <div class="heading_contactform">
      <h3>Message</h3>
    </div>
    <div id="poptable_contactform"
				style="width: 250px; height: 120px; padding: 5px;">Switching
      your session from Biz Unit Shubchintak to Biz Unit FFreedom.</div>
  </div>
</div>

<footer>
  <jsp:include page="../common/footer.jsp" />
</footer>
<script type="text/javascript">
$(document).ready(function () {


getPicklistValues();
gettoppartner(0);
gettopcurrentuser();
getdataforpendingquery();
getnewslist();
getTaskDetails();
broadCastList();
getshuplist();


//dropdown right side partner
function getPicklistValues(){
	$.ajax({
		type : "GET",
		url:$('#contextPath').val()+'/faq/getPicklistValues.htm?codeTypeIds=190',
		success : function(result) {
			 $.each( result, function( index, value ) {
					var codeValue=value.codeValue;
					var codeValueId=value.codeValueId;
					$("#toppartnerlistid").append('<option value="'+codeValueId+'" >'+codeValue+'</option>')
				 });
		}
	});	
}



//News
function getnewslist(){
	$.ajax({
		type : "POST",
		url : $('#contextPath').val() + '/user/RSSFeedsReader.htm',
		dataType: 'json',
		contentType : 'application/json',
		success : function(result) {
			
			if(result != null){
				 result=JSON.parse(result);
				
				var i=0;
				$('#rssFeeds1').empty();
				while(i<result.length){				
					var title=result[i];
					i+=1;
					var link=result[i];
					i+=1;
					var pubDate=result[i];
					var publishDate = pubDate.substring(0, 26); 
					i+=1;
					$('#rssFeeds1').append('<a class="body" target="_blank" href="'+link+'"><div class="name">'+title+'</div><div class="text">'+publishDate+'  by moneycontrol.com</div>  </a>');
					}	
				
				}else{
				
				 $('#rssFeeds1').append("<span class='label label-danger'>Records not found</span>");
				}
		}

	});
}


//last 10 contact login
function gettopcurrentuser() {
	var roleId=jQuery('#roleId').val();
	$.ajax({

		type : "POST",
		url : $('#contextPath').val() + '/user/showCurrentLoginList.htm',
		dataType: 'json',
		contentType : 'application/json',
		success : function(result) {
			if(result != 0){
				  $.each( result, function( index, value ) {
					 
     			
					  var code =value.codeValue;
					  var recordTypeId=value.recordTypeId;
					  var userName=value.userName;
					  
					  if(roleId == 1 || roleId == 5){
						
						  var row=document.createElement('tr');
							$(row).append("<td><a href='"+contextPath+"/loginonbehalf/getUserInfo.htm?userName="+userName+"&recordTypeId="+recordTypeId+"&GOTO=profile'>"+ value.lastName +"</a></td>")
					                       /* .append("<td>" + value.codeValue + "</td>") */
					                       .append("<td>" + value.lastCurrentDateLogin + "</td>")
					                       .append("<td class='hidden-480'>" + value.lastCurrentDateTime + "</td>")
					                       .append("</tr>");
					                      $("#topuser").append(row);
						 
	                      
					  }else{
						  var row=document.createElement('tr');
							$(row).append("<td>"+ value.lastName +"</td>")
					                       /* .append("<td>" + value.codeValue + "</td>") */
					                       .append("<td>" + value.lastCurrentDateLogin + "</td>")
					                       .append("<td class='hidden-480'>" + value.lastCurrentDateTime + "</td>")
					                       .append("</tr>");
					                      $("#topuser").append(row);
						 
					  }
					 
                    
				  });
			}else{
				  $("#error-msg2").append("<span class='label label-danger'>Records not found</span>");
			}	
			
		}
	});
}


//broadcast
function broadCastList(){
	$.ajax({

		type : "POST",
		url : $('#contextPath').val() + '/dashboard/getBroadCastList.htm',
		dataType: 'json',
		contentType : 'application/json',
		success : function(result) {
				$('#broadCastMsg').empty();
				if(result != 0){
				$.each( result, function( index, value ) {
					 var title=value.broadCastTitle;
					 var description=value.broadCastDescription;
					 $('#broadCastMsg').append('<a class="body"><div class="name">'+title+'</div><div class="text">'+description+'</div></a>')
				});
			}
			else{
				$('#broadCastMsg').append("</br><span class='label label-danger'>Records not found</span>");
			}
		}
	});
}

//Pending Query

function getdataforpendingquery(){

	$.ajax({
		type : "POST",
		url : $('#contextPath').val() + '/dashboard/showpendingQuery.htm',
		dataType: 'json',
		contentType : 'application/json',
		success : function(result) {
			if(result != 0){
				$('#queryList').empty();
			
			 $.each(result, function( index, value ){
				 var subject=value.subject;
				 var status=value.status;
				 var queryOwnerName=value.queryOwnerName;
				 var lastUpdatedDate=value.lastUpdatedDate;
			 $('#queryList').append('<a class="body" href="#"> <span class="pull-right"><span class="label label-success">'+status+'</span></span> <div class="text">'+subject+'</div><span class="time"> by </span><span class="name">'+queryOwnerName+'</span><span class="time"> On '+lastUpdatedDate+'</span> </a>');
				
			});
			}
			 else{
				 $('#queryList').append("</br></br><span class='label label-danger'>Records not found</span>");
			 }
		}
	});
}

//task details

function getTaskDetails(){
	$.ajax({
		type : "POST",
		url : $('#contextPath').val() + '/dashboard/showTaskDetails.htm',
		dataType: 'json',
		contentType : 'application/json',
		success : function(result) {
		 if(result != 0){
		  $.each( result, function( index, value ) {
			 var row=document.createElement('tr');
              $(row).append("<td>"+ value.lastname +"</td>")
               .append("<td><a href='${pageContext.request.contextPath}/partnersp/getTaskList.htm'>" + value.taskSubject + "</a></td>") 
               .append("<td>" + value.taskDate + "</td>")
               .append("<td>" + value.taskPriority + "</td>")
               .append("<tdclass='hidden-480'><span class='label label-danger'>" + value.status + "</span></td>")
               .append("</tr>");
              $("#taskdetails").append(row); 
		  });
		 }else{
			 $("#error").append("<span class='label label-danger'>Records not found</span>");
		 }
		}
	});
}

//gupshup

function getshuplist(){
	 var contextPath=$('#contextPath').val();
	 var partyId=$('#partyId').val();
	   $.ajax({
			type : "POST", 
			url :$('#contextPath').val()+"/dashboard/showGupShupList.htm",
			//dataType: 'json',
			contentType : 'application/json',
			success : function(result) {
				$('#gupshupMsg').empty();
				if(result != 0){
				$.each( result, function( index, value ) {
					 var postId=value.postId;
					 var postUrl=value.postUrl;
					 var postText=value.postText;
					 var postPerson=value.postPerson;
		             var createDate=value.createDate; 
		             var postPartyId=value.postPartyId;
		           	 $("#gupshupMsg").append('<div class="itemdiv dialogdiv"><div class="user"><img src="${_cdn}/assets/avatars/avatar.png"></div><div class="body"><div class="time"><i class="ace-icon fa fa-clock-o"></i><span class="green">'+createDate+'</span></div><div class="name"><a href="#">'+postPerson+'</a></div><div class="text">'+postUrl+'</div> <div class="tools"><a href="#" class="btn btn-minier btn-info"><i class="icon-only ace-icon fa fa-share"></i></a></div></div></div>');
		     		});
			
				}
				else{
					$('#gupshupMsg').append("</br><span class='label label-danger'>Records not found</span>");
				}
			}
		});
}



});

//document read end here


//top 10 partners
function gettoppartner(sel) {

	 var id;
	 if(sel==0){
		 id = 190001;
	 }else{
	 	id=$('#toppartnerlistid').val();
	 }
	var selectBased;
	var contextPath=jQuery('#contextPath').val();
	var roleId=jQuery('#roleId').val();
	$.ajax({
		type : "POST",
		url : $('#contextPath').val() + '/dashboard/showTopPartnerList.htm?selectBased='+id,
		//dataType: 'json',
		contentType : 'application/json',
		success : function(result) {
			if(result != 0){
				 $('#toppartner').empty();
				 $("#toppartner").append('<thead><tr><th>Name</th><th>Count</th><th class="hidden-480">Last Acess Date Time</th></tr></th>');
				 $.each(result, function( index, value )
						{		
							 var userName=value.userName;
							 var row=document.createElement('tr');
								 if(roleId == 1 || roleId == 5){
								       $(row).append("<td><a href='"+contextPath+"/loginonbehalf/getPartnerInfo.htm?userName="+userName+"&GOTO=profile'>" + value.lastName + "</a></td>")
				                         .append("<td>" + value.client + "</td>")
				                         .append("<td>" + value.lastSuccessfullLogin + "</td>")
				                         .append("</tr>");       
				        				  $("#toppartner").append(row);  
								 }else{
									  $(row).append("<td>" + value.lastName + "</td>")
				                 		.append("<td>" + value.client + "</td>")
		                         		.append("<td>" + value.lastSuccessfullLogin + "</td>")
		                         		.append("</tr>");       
		        						  $("#toppartner").append(row);
								 }
	          });
			
				}
			  else{
				  $("#error-msg1").empty();
				  $("#error-msg1").append("<span class='label label-danger'>Records not found</span>");
				}
		}

	});
}
</script>
<!-- calender script -->
<script type="text/javascript">



function getUrlVars()
{
    var vars = [], hash;
    var hashes = window.location.href.slice(window.location.href.indexOf('?') + 1).split('&');
    for(var i = 0; i < hashes.length; i++)
    {
        hash = hashes[i].split('=');
        vars.push(hash[0]);
        vars[hash[0]] = hash[1];
    }
    
    return vars;
}


$(document).ready(function () 
		{
	var data=getUrlVars();
if(data=='task')
	{
	
	}
else
	{
	myTimer();
	}
	
	//data= getParameterByName('task');
	
		
		});




var myVar = setInterval(function(){myTimer()}, 3600000);

function doNothing()
{
 	
}
function myTimer()
{
	
   	$.ajax(
   			{
   		  type: "POST",
   			  url: $('#contextPath').val()+"/partnersp/getTaskAlert.htm",
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
										      		
										      		
										      		
								   				  	message: "<span class='bigger-110'>You have </span>"+createdby+"<span> Pending task which will finish after two hours:</span> "+subject+
								   				  	    	"<span><br>You have </span>"+priorityId+"<span> Pending task which will finish tomorrow:</span> "+statusName ,
								   					buttons: 			
								   					{
								   						"click" :
								   						{
								   							"label" : "OK!",
								   							"className" : "btn-sm btn-primary",
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
								   				  	message: "<span class='bigger-110'>You have </span>"+createdby+"<span> Pending task which will finish after two hours:</span> "+subject ,
								   					buttons: 			
								   					{
								   						"click" :
								   						{
								   							"label" : "OK!",
								   							"className" : "btn-sm btn-primary",
								   							"callback": function() {
								   				//				location.reload();
								   							}
								   						}
								   					}
								   				});
										    	
									
									    	}
										    else if(priorityId>0 )
									    	{
										      	bootbox.dialog({
								   				  	message: "<span class='bigger-110'>You have </span>"+priorityId+"<span> Pending task which will finish tomorrow:</span> "+statusName ,
								   					buttons: 			
								   					{
								   						"click" :
								   						{
								   							"label" : "OK!",
								   							"className" : "btn-sm btn-primary",
								   							"callback": function() {
								   				//				location.reload();
								   							}
								   						}
								   					}
								   				});
										    	
										    	
									    	
									    	}
						});
   		  }
   	});
}

			jQuery(function($) {
				
				
			
				
				getdatafortaskcalender();

				
				
				function getdatafortaskcalender() {
					$.ajax({
						type : "POST",
						url : $('#contextPath').val() + '/dashboard/showTaskAlert.htm',
						contentType : 'application/json',
						success : function(result) {
							//alert(result);
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
			  			date= String.valueOf(result[i].taskSubject);
			  			innerArray.push('{"title": "'+result[i].taskCount+'", "start":"'+result[i].taskDate+'","className": "label-important"}');	
			  			outerArray.push(innerArray);
			  		}
			  		return outerArray;
			  	}
			  	function taskcalender(outerArray) 
			    {
			  	  
			  		 var start = "["
				    	  var outarray=outerArray.toString()+"]";
				    	  var result = start.concat(outarray);
				    	  //alert(result);
				
/* initialize the external events
	-----------------------------------------------------------------*/

	$('#external-events div.external-event').each(function() {

		// create an Event Object (http://arshaw.com/fullcalendar/docs/event_data/Event_Object/)
		// it doesn't need to have a start or end
		var eventObject = {
			title: $.trim($(this).text()) // use the element's text as the event title
		};

		// store the Event Object in the DOM element so we can get to it later
		$(this).data('eventObject', eventObject);

		// make the event draggable using jQuery UI
		$(this).draggable({
			zIndex: 999,
			revert: true,      // will cause the event to go back to its
			revertDuration: 0  //  original position after the drag
		});
		
	});

	/* initialize the calendar
	-----------------------------------------------------------------*/

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
		events: /* [
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
		] */
		JSON.parse(result),
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
			
			bootbox.prompt("New Event Title:", function(title) {
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
			});
			

			calendar.fullCalendar('unselect');
		}
		,
		eventClick: function(calEvent, jsEvent, view) {

			//display a modal
			var modal = 
			'<div class="modal fade">\
			  <div class="modal-dialog">\
			   <div class="modal-content">\
				 <div class="modal-body">\
				   <button type="button" class="close" data-dismiss="modal" style="margin-top:-10px;">&times;</button>\
				   <form class="no-margin">\
					  <label>Change event name &nbsp;</label>\
					  <input class="middle" autocomplete="off" type="text" value="' + calEvent.title + '" />\
					 <button type="submit" class="btn btn-sm btn-success"><i class="ace-icon fa fa-check"></i> Save</button>\
				   </form>\
				 </div>\
				 <div class="modal-footer">\
					<button type="button" class="btn btn-sm btn-danger" data-action="delete"><i class="ace-icon fa fa-trash-o"></i> Delete Event</button>\
					<button type="button" class="btn btn-sm" data-dismiss="modal"><i class="ace-icon fa fa-times"></i> Cancel</button>\
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
			});


			//console.log(calEvent.id);
			//console.log(jsEvent);
			//console.log(view);

			// change the border color just for fun
			//$(this).css('border-color', 'red');

		}
		
	});

			    }
})
			
</script>
<script type="text/javascript">
		jQuery(function($) {
		// pills
		 $('#id-pills-stacked').removeAttr('checked').on('click', function(){
                           $('.nav-pills').toggleClass('hide');
	                });
			$('.scrollable').each(function () {
				var $this = $(this);
				$(this).ace_scroll({
					size: $this.attr('data-size') || 310,
				});
			});
			$('.scrollable-horizontal').each(function () {
				var $this = $(this);
				$(this).ace_scroll(
				  {
					horizontal: true,
					styleClass: 'scroll-top',//show the scrollbars on top(default is bottom)
					size: $this.attr('data-size') || 500,
					mouseWheelLock: true
				  }
				).css({'padding-top': 12});
			});
			
			$(window).on('resize.scroll_reset', function() {
				$('.scrollable-horizontal').ace_scroll('reset');
			});
		
		});
	</script>
</body>

</html>