$(document).ready(function() {
		 try{

		 getdatafortaskcalender();
		 getdataforpendingquery();
		// getdataforrecentchat();
		 getdataforlastlogin();
		 getdataforopenexetracker();
		 getdataforentityaccounts();
		 getdataforexecution();
		 getdatafordatacollection();
		// getactivitytracker();
		 getactivitytype();
		 getactivitycontext();
		 geteditactivitytype();
		 geteditactivitycontext();
	//getreasonForRating();
		 }
		 catch(err) {
			console.log(err);
		 }
		 
		
		 
		 function getactivitycontext(){
			 $.ajax({
					
					type : "POST", 
					url :$('#contextPath').val()+"/dashboard/showPartnerActivityContext.htm",
					//dataType: 'json',
					contentType : 'application/json',
					success : function(result) {
						$('#activityContextId').append('<option value="">--Select--</option>');
						 $.each( result, function( index, value ) {
							var codeValue=value.codeValue;
							var codeValueId=value.codeValueId;
							//alert(codeValue)
							$("#activityContextId").append('<option value="'+codeValueId+'" >'+codeValue+'</option>')
						 });
						}
					});
		 }
		 function  getactivitytype(){
		 
			 $.ajax({
					
					type : "POST", 
					url :$('#contextPath').val()+"/dashboard/showPartnerActivityType.htm",
					//dataType: 'json',
					contentType : 'application/json',
					success : function(result) {
						$('#activityTypeId').append('<option value="">--Select--</option>');
						 $.each( result, function( index, value ) {
							var codeValue=value.codeValue;
							var codeValueId=value.codeValueId;
							//alert(codeValueId)
							
							$("#activityTypeId").append('<option value="'+codeValueId+'" >'+codeValue+'</option>')
						 });
						}
					});
		 }
		 
		
		 function geteditactivitycontext(){
			 $.ajax({
					
					type : "POST", 
					url :$('#contextPath').val()+"/dashboard/showPartnerActivityContext.htm",
					//dataType: 'json',
					contentType : 'application/json',
					success : function(result) {
						$('#editactivityContextId').append('<option value="">--Select--</option>');
						 $.each( result, function( index, value ) {
							var codeValue=value.codeValue;
							var codeValueId=value.codeValueId;
							//alert(codeValue)
							$("#editactivityContextId").append('<option value="'+codeValueId+'" >'+codeValue+'</option>')
						 });
						}
					});
		 }
		 function  geteditactivitytype(){
		 
			 $.ajax({
					
					type : "POST", 
					url :$('#contextPath').val()+"/dashboard/showPartnerActivityType.htm",
					//dataType: 'json',
					contentType : 'application/json',
					success : function(result) {
						$('#editactivityTypeId').append('<option value="">--Select--</option>');
						 $.each( result, function( index, value ) {
							var codeValue=value.codeValue;
							var codeValueId=value.codeValueId;
							//alert(codeValueId)
							
							$("#editactivityTypeId").append('<option value="'+codeValueId+'" >'+codeValue+'</option>')
						 });
						}
					});
		 }
		 function getdatafordatacollection(){
			//alert("Data Collection...............");
			 var partyID = $('#partyID').val();
			 
			 $.ajax({
					
					type : "POST", 
					url :$('#contextPath').val()+"/dashboard/showPartnerDataCollection.htm?partyID="+partyID,
					//dataType: 'json',
					contentType : 'application/json',
					success : function(result) {
						//alert(result)
						 $.each( result, function( index, value ) {
							 var duration =value.duration;
							 var dataCollectionActivated =value.dataCollectionActivated;
							 var dataCollectionCompleted=value.dataCollectionCompleted;
							 var opportunities=value.opportunities;
							 var goals=value.goals;
							 var goalAmount=value.goalAmount;
							 var investmentAmount=value.investmentAmount;
							 var potentialRevenue=value.potentialRevenue;
							 
							// alert(dataCollectionActivated);
							// alert(dataCollectionCompleted);
							// alert(opportunities);
							// alert(goals)
							// alert(goalAmount);
							// alert(investmentAmount);
							// alert(potentialRevenue);
							 var row=document.createElement('tr'); 
							 $(row).append("<td style='background-color:#EEE;'>"+duration+"</td>")
				            	 .append("<td>"+ dataCollectionActivated +"</td>")
							  	 .append("<td>"+dataCollectionCompleted+"</td>")
							     .append("<td>"+opportunities+"</td>")
							     .append("<td>"+goals+"</td>")
							     .append("<td>"+goalAmount+"</td>")
							     .append("<td>"+investmentAmount+"</td>")
							     .append("<td>"+potentialRevenue+"</td>")
				            	 .append("</tr>");
		                      $("#datacollection").append(row);
							
							 
						/* 	var row=document.createElement('tr'); 
							  $(row).append("<td style='background-color:#EEE;'>"+duration+"</td>")
							  .append("<td>" + dataCollectionActivated + "</td>")
							  .append("<td>" + dataCollectionCompleted + "</td>")
							  .append("<td>" + opportunities + "</td>")
							  .append("<td>" + goals + "</td>")
							  .append("<td>" + goalAmount + "</td>")
							  .append("<td>" + investmentAmount + "</td>")
							  .append("<td>" + potentialRevenue + "</td>")
							  .append("</tr>");
		                      $("#datacollection").append(row);  */
						 });
					}
			 });
		 }
		 
		
		 
		 
		 function getdataforexecution(){
			// alert("EXECUTION...............");
			 var partyID = $('#partyID').val();
			 
			 $.ajax({
					
					type : "POST", 
					url :$('#contextPath').val()+"/dashboard/showPartnerExecution.htm?partyID="+partyID,
					//dataType: 'json',
					contentType : 'application/json',
					success : function(result) {
						//alert(result)
						if(result != 0){
						 $.each( result, function( index, value ) {
							 var duration=value.duration;
							 var executionOpen=value.executionOpen;
							 var executionCompleted=value.executionCompleted;
							 var investmentAmount=value.investmentAmount;
							 var actualRevenue=value.actualRevenue;
							 var row=document.createElement('tr');
				
							 var row=document.createElement('tr'); 
							 $(row).append("<td style='background-color:#EEE;'>"+duration+"</td>")
							  .append("<td>" + executionOpen + "</td>")
							  .append("<td>" + executionCompleted + "</td>")
							  .append("<td>" + investmentAmount + "</td>")
							  .append("<td>" + actualRevenue + "</td>")
							  .append("</tr>");
		                      $("#execution").append(row); 
						 });
						}
						else{
							//alert("no data")
							$("#error").append("Records not found");
						}
					}
			 });
		 }
	
		 //alert("HIEEEEEEEEEEEEEEEE");
		 
		 function getdataforentityaccounts(){
			// alert("In Entity & Accounts")
			 var partyID = $('#partyID').val();
			 $.ajax({
					
					type : "POST", 
					url :$('#contextPath').val()+"/dashboard/showPartnerEntAccnts.htm?partyID="+partyID,
					//dataType: 'json',
					contentType : 'application/json',
					success : function(result) {
						//alert(result)
						 $.each( result, function( index, value ) {
							 var duration=value.duration;
							 var oppnumbers=value.oppnumbers;
							 var clientnumbers=value.clientnumbers;
							 var premiumnumbers=value.premiumnumbers;
							 var folionumbers=value.folionumbers;
							 var row=document.createElement('tr');
				
							 var row=document.createElement('tr'); 
							 $(row).append("<td style='background-color:#EEE;'>"+duration+"</td>")
							  .append("<td>" + oppnumbers + "</td>")
							  .append("<td>" + clientnumbers + "</td>")
							  .append("<td>" + premiumnumbers + "</td>")
							  .append("<td>" + folionumbers + "</td>")
							  .append("</tr>");
		                      $("#entitiesAccnts").append(row); 
						 });
					}
			 });
		 }
		 
		 
		 
		 function  getdataforopenexetracker(){
			 	var partyID = $('#partyID').val();
				// alert(partyID)
				  $.ajax({
			
						type : "POST", 
						url :$('#contextPath').val()+"/dashboard/showPartnerExeTracker.htm?partyID="+partyID,
						//dataType: 'json',
						contentType : 'application/json',
						success : function(result) {
							//alert("SDannnnn")
						//alert(result)
						if(result != 0){
						 $.each( result, function( index, value ) {
							 var lastName=value.lastName;
							 var productName=value.productName;
							 var status=value.status;
							 var date=value.date;
							 var opportunity=value.opportunity;
							 var txnType=value.txnType;
							 var txnamount=value.txnamount;
							 var elapseddays=value.elapseddays;
							  var row=document.createElement('tr');
		                      $(row).append("<td><i class='opportunityicon' title='Opportunity'></i>"+ value.lastName +"</td>")
		                        .append("<td>" + value.date + "</td>")
		                       .append("<td>" + value.opportunity + "</td>")
		                       .append("<td>" + value.txnType + "</td>")	
		                       .append("<td>" + productName + "</td>")
		                       .append("<td>" + txnamount + "</td>")
		                       .append("<td>" + elapseddays + "</td>")
		                       .append("<td class='table table-hover table-bordered table-striped'><span class='label label-success'>"+status+"</span></td>")
		                       .append("</tr>");
		                      $("#topexetracker").append(row); 
						 });
						}else{
							$("#error-msg2").append("<span class='label label-danger'>Records not found</span>");
						}
						}
				  });
		 }
		 function getdataforlastlogin(){
			 
			// alert("Last 10 login")
		 	var partyID = $('#partyID').val();
			// alert(partyID)
			  $.ajax({
		
					type : "POST", 
					url :$('#contextPath').val()+"/dashboard/showPartnerLastLogin.htm?partyID="+partyID,
					//dataType: 'json',
					contentType : 'application/json',
					success : function(result) {
						
					//alert(result);
					if(result != 0){
						 $.each( result, function( index, value ) {
							 
						
							  var code =value.codeValue;
							  //alert(code);
							  if(code == "Opportunity"){
								  var row=document.createElement('tr');
			                      $(row).append("<td><i class='opportunityicon' title='Opportunity'></i>"+ value.lastName +"</td>")
			                       /* .append("<td>" + value.codeValue + "</td>") */
			                       .append("<td>" + value.lastCurrentDateLogin + "</td>")
			                       .append("<td>" + value.lastCurrentDateTime + "</td>")
			                       .append("</tr>");
			                      $("#topuser").append(row); 
							  }
							  else if(code == "Client"){
								  var row=document.createElement('tr');
			                      $(row).append("<td><i class='clienticon' title='Client'></i>"+ value.lastName +"</td>")
			                       /* .append("<td>" + value.codeValue + "</td>") */
			                       .append("<td>" + value.lastCurrentDateLogin + "</td>")
			                       .append("<td>" + value.lastCurrentDateTime + "</td>")
			                       .append("</tr>");
			                      $("#topuser").append(row);
							  }
							  else{
								  var row=document.createElement('tr');
			                      $(row).append("<td><i class='pclienticon' title='PClient'></i>"+ value.lastName +"</td>")
			                       /* .append("<td>" + value.codeValue + "</td>") */
			                       .append("<td>" + value.lastCurrentDateLogin + "</td>")
			                       .append("<td>" + value.lastCurrentDateTime + "</td>")
			                       .append("</tr>");
			                      $("#topuser").append(row);
							  }
						 });
					}else{
						 $("#error-msg1").append("<span class='label label-danger'>Records not found</span>");
					}
					}
			 });
		 }
		 

		 
		 
		 function getdataforpendingquery() {
			 
			 var partyID = $('#partyID').val();
			 //alert(partyID)
			 //alert($('#contextPath').val())
			 $.ajax({
		
					type : "POST", 
					url :$('#contextPath').val()+"/dashboard/showPartnerPendingQuery.htm?partyID="+partyID,
					//dataType: 'json',
					contentType : 'application/json',
					success : function(result) {
						//alert(result);	
						if(result != 0){
						 $.each(result, function( index, value ){
							// alert(value.subject);
							 //alert(value.status);
							// alert(value.queryOwnerName);
							// alert(value.lastUpdatedDate);
							 
							 var subject=value.subject;
							 var status=value.status;
							 var queryOwnerName=value.queryOwnerName;
							 var lastUpdatedDate=value.lastUpdatedDate;
							 $('#queryAdvList').append('<li class="list-group-item" style="border:none; padding-left: 0;">	<span class=" pull-right " ><span class="label label-info">'+status+'</span></span><i class="pull-left muted icon-bar-chart" style="margin-top:.3em;"></i><div style="border-bottom:1px solid #eee; padding-bottom:10px;"><p class="title"><a href="#"> '+subject+'</a></p><p class="info"> By <a href="#">'+queryOwnerName+',</a>'+lastUpdatedDate+' </a></p></div></li>');
							 
						 });
						}else{
							$("#queryAdvList").append("</br></br><span class='label label-danger'>Records not found</span>");
						}
						
					}
			 });
			 
		 }
		    
		    
			
		    function getdatafortaskcalender() { 
		    //	alert('hi');
		    	 var partyID = $('#partyID').val();
		    	//alert(partyID)
		    	//alert($('#contextPath').val())
				$.ajax({
		
					type : "POST", 
					url :$('#contextPath').val()+"/dashboard/showAdvTaskAlert.htm?partyID="+partyID,
					//dataType: 'json',
					contentType : 'application/json',
					success : function(result) {
						//alert(result)
						var firstRow = new Array();	
		  				firstRow.push('Goal');
		  				firstRow.push('Goal By Type');
		  				var title = 'Goal By Type:  ';
		  						//+ $("#leadSourceRange option:selected").text();
		  				var outerArray = create2dArrayforgoal(result);
		  				//alert('before'+outerArray);
		  				renderCalendar(outerArray);
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
		 
		  			//alert(result[i].count);
		  			//innerArray.push(result[i].title);
//	 	  			innerArray.push('"'+result[i].taskDate+'": {"title": "'+result[i].taskSubject+'", "url": "${pageContext.request.contextPath}/task/showPendingTask.htm?value='+result[i 	].taskDate+'"}'  ); 
		  			//innerArray.push('"'+result[i].taskDate+'": {"title": "'+result[i].taskSubject+'", "startdate":"'+result[i].taskDate+'"}');
		  			innerArray.push('{"title": "'+result[i].taskSubject+'", "start":"'+result[i].taskDate+'"}');	
		  			outerArray.push(innerArray);
		  			//alert(outerArray);
		  			
		  		}
		  		//outerArray.splice(-1,1)
		  		//outerArray.push('}');
		  		return outerArray;
		  	}
		
		
		
		
		
		
		
		
			var currentLangCode = 'en';

			// build the language selector's options
			$.each($.fullCalendar.langs, function(langCode) {
				$('#lang-selector').append(
					$('<option/>')
						.attr('value', langCode)
						.prop('selected', langCode == currentLangCode)
						.text(langCode)
				);
			});

			// rerender the calendar when the selected option changes
			$('#lang-selector').on('change', function() {
				if (this.value) {
					currentLangCode = this.value;
					$('#calendar').fullCalendar('destroy');
					renderCalendar(outerArray);
				}
			});

			function renderCalendar(outerArray) {
				
				
				      var start = "["
			    	  var outarray=outerArray.toString()+"]";
			    	  var result = start.concat(outarray);
			    	  var today_date = new Date();
			    		today_Date_Str=today_date.getFullYear()+"-"+((today_date.getMonth() < 9) ? "0" : "") + String(today_date.getMonth() + 1);
			    	//  alert(result);
			    	  
			//	alert("hieeeeeeee");
			//	alert('outerarray    '+outerArray)
				$('#calendar').fullCalendar({
					header: { 	
						left: 'prev,next today',
						center: 'title',
						right: 'month,agendaWeek,agendaDay'
					},
					defaultDate: today_Date_Str,
					lang: currentLangCode,
					buttonIcons: false, // show the prev/next text
					weekNumbers: true,
					editable: true,
					events: JSON.parse(result)
						/* {
							title: 'All Day Event',
							start: '2014-06-01'
						},
						{
							title: 'Long Event',
							start: '2014-06-07',
							end: '2014-06-10'
						},
						{
							id: 999,
							title: 'Repeating Event',
							start: '2014-06-09T16:00:00'
						},
						{
							id: 999,
							title: 'Repeating Event',
							start: '2014-06-16T16:00:00'
						},
						{
							title: 'Meeting',
							start: '2014-06-12T10:30:00',
							end: '2014-06-12T12:30:00'
						},
						{
							title: 'Lunch',
							start: '2014-06-12T12:00:00'
						},
						{
							title: 'Birthday Party',
							start: '2014-06-13T07:00:00'
						},
						{
							title: 'Click for Google',
							url: 'http://google.com/',
							start: '2014-06-28'
						} */
					
				});
			}

			
			
		});