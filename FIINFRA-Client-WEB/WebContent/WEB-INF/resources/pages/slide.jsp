<%@page import="in.fiinfra.common.util.FiinfraUtility"%>
<%@page import="in.fiinfra.common.common.BaseRequest"%>
<%@page import="org.apache.commons.lang.StringUtils"%>
<%@page import="in.fiinfra.cp.common.util.AuthHandler"%>
<%@page import="in.fiinfra.common.diy.models.UserSession"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
   <!--****** Code for Banner sliding Start *****-->

 <script src="${pageContext.request.contextPath}/resources/js/plugin/jquery.Jcrop.min.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/jquery.Jcrop.css" type="text/css" /> 

<script>

var naturalWidth = 0;
var naturalHeight = 0;
var ratioW = 0;
var ratioH = 0;
var aspectRatio =  2.5/1;
function attachJCrop(){
	
	var JcropAPI = $('#preview').data('Jcrop');
	if(JcropAPI){
		JcropAPI.destroy();	
	}
	
	//var h = $('#preview').width() /aspectRatio ;
	//var imageHeight = $('#preview').height();
	//var y = (imageHeight/2)-(h/2);
	//alert(imageHeight +'  '+h +' '+y);
	$('#preview').Jcrop({
		minSize: [250, 100],
		setSelect:   [ 0, 100, 500, 200 ],
		bgFade: true,
		aspectRatio: aspectRatio,
		bgOpacity: .3,
	    onChange: function(c) {
	    	//console.log(ratioW+' '+ratioH+' '+c.x+'  '+c.y);
	    	$('[name="x"]').val(c.x * ratioW);
	    	$('[name="y"]').val(c.y* ratioH);
	    	$('[name="w"]').val(c.w* ratioW);
	    	$('[name="h"]').val(c.h* ratioH);
		},
		onSelect: function(c) {
	    	//console.log(ratioW+' '+ratioH+' '+c.x+'  '+c.y);
	    	$('[name="x"]').val(c.x * ratioW);
	    	$('[name="y"]').val(c.y* ratioH);
	    	$('[name="w"]').val(c.w* ratioW);
	    	$('[name="h"]').val(c.h* ratioH);
		},
	    bgColor: 'black',
	    bgOpacity: .3
	}

	);
	$('[name="x"]').val(0);
	$('[name="y"]').val(0);
	$('[name="w"]').val(900);
	$('[name="h"]').val(300);
}

function readURL(input) {
	if (input.files && input.files[0]) {
		var reader = new FileReader();
		

		reader.onload = function(e) {
			$('#preview').attr('src',
					e.target.result);
			attachJCrop();
			var image = $('#preview');

			var originalWidth = image[0].naturalWidth; 
			var originalHeight = image[0].naturalHeight;
			var w = $('#preview').width();
			var h = $('#preview').height();
			
			ratioW = (originalWidth)/(w);
			ratioH = (originalHeight)/(h);
			if(ratioW ==0){
				ratioW = 1;
			}
			if(ratioW ==0){
				ratioW = 1;
			}
			if(ratioH ==0){
				ratioH = 1;
			}
			
			//console.log(originalWidth +"  "+originalHeight +" "+w +"  "+h +"  "+ratioW +"  "+ratioH);
			
		}

		reader.readAsDataURL(input.files[0]);
	}
}
<% 
UserSession user = AuthHandler.getCurrentUser();
String imagePath = user.getDashboardPhoto();
String defaultBanner = request.getContextPath()+"/"+"resources/images/banner.png" ;
imagePath = FiinfraUtility.getImagePath(request, imagePath, "resources/images/banner.png");

%>

$(function() {
  
  var dialog, form;
  

	    // How easy is this??
   

	
  
  
  $( "#image_upload_dialog" ).dialog(
			  {
	                autoOpen: false,
	                    maxWidth:1000,
	                    maxHeight: 500,
	                    width:'auto',
	                    height:'auto',
					    dialogClass:'image_upload_dialog',
						modal: true,
	                    resizable: false,
	                    buttons: {
	                    "Save": function() {
	                    	if(!$("#upload").val()){
	                    		showMessage("Please Select Image",true);
	                    		return;
	                    	}
	                    	if($('[name="w"]').val()<=0 || $('[name="h"]').val()<=0){
	                    		showMessage("Please Select Correct crop size "+$('[name="w"]').val()+" "+$('[name="h"]').val(),true);
	                    		return;
	                    	}
	                    	$("body").addClass("loading");
		                    $("#profile-form").submit();
	                    
	    	                },
	        	            Cancel: function() {
	        	            	$("#upload").val('');
	        	            	$("#preview").attr('src','empty');	
	            	        $(this).dialog("close");
	                	    }
	                }
	                });
	            	  $(".image_upload_dialog.ui-dialog .ui-widget-header .ui-icon").text("X");
					 $(".image_upload_dialog.ui-dialog .ui-widget-header .ui-dialog-title").text("");
  
  $("#goal_condition75").hide();
  $("#goal_condition50").hide();
  $("#goal_condition25").hide();
  $("#risk_condition75").hide();
  $("#risk_condition50").hide();
  $("#risk_condition25").hide();
  
 
  
  $("#image_banner").attr("src", "<%=imagePath%>").error(function() {
	  $("#image_banner").attr("src", "<%=defaultBanner%>");
	});	 		  
  
  
  $("#upload").change(function() {
		readURL(this);
		//$('#preview').Jcrop();
	});
  
});



function openImageDialog(){
	$("#upload").val('');
	$("#preview").attr('src','');
	//$("#profile-form").reset();
	
	$("#upload").click();
	$( "#image_upload_dialog" ).dialog( "open" );
	
}


function showGoogleEarningLineChart(elementId, dataList){
	
	var data = google.visualization.arrayToDataTable(dataList);
	
	var options = {
	          title: 'Earning/Expenses',
	          height:270,
	          width:500,
	          
	          backgroundColor: { fill:'transparent' }
	
	        };

	var chart = new google.visualization.LineChart(document.getElementById(elementId));
	chart.draw(data, options);
}


     function showAchievementScale(data){
    	 var riskScale = data[1];
    	 var goalScale = data[0];
    	 
    	 //$(".completion").text(goalScale+'%');
    	 //$("#riskScale").text(riskScale+'%');
    	 //$("#successionScale").text(data[2]+'%');
    	 
    	 $("#overAllScale1").text(data[3]+'%');
    	 if(riskScale>=75){
    		 $("#goal_condition75").show();
    	 }
    	 else if(riskScale >=50){
    		 $("#risk_condition50").show();
    	 }
    	 else{
    		 $("#risk_condition25").show();
    	 }

    	 if(goalScale>=75){
    		 $("#goal_condition75").show();
    	 }
    	 else if(goalScale >=50){
    		 $("#goal_condition50").show();
    	 }
    	 else{
    		 $("#goal_condition25").show();
    	 }
    	 percentageGraph=["one","two","three","four","five","six","seven","eight","nine","ten"];
    	 var perVal=Math.round(data[3]/10);
    	 var html='';
    	 var d=data[3]/10;
    	 var crop=Math.round(d*18.2);
    	 var top=220-crop;
    	 $("#overAllScale1").css("top", top);
    	 for(var i=0;i<perVal;i++){
    		 
    		 html='<div class="level_bar '+percentageGraph[i]+' clearfix fl"></div>';
    		 $("#perBar").append(html);
    	 }
     	
    	 $("#family_invest").removeClass('family_invest_no');
    	 
	    var isInvestmentKnown=data[4];
	    var isMoneyKnown=data[5];
	    var isWillPrepared=data[6];//alert(isInvestmentKnown+"  "+isMoneyKnown+"  "+isWillPrepared);
	    if(isInvestmentKnown){
	    	//$("#family_invest").toggleClass('family_invest_yes');
	    	$("#family_invest").removeClass('family_invest_no').addClass('family_invest_yes');
	    	$("#family_invest_text").text('Your family know where you have invested your money.');
	    	
	    }
	    else{
	    	$("#family_invest").addClass('family_invest_no');
	    }
	    //alert(isMoneyKnown);
		if(isMoneyKnown){
			//$("#family_access_money").toggleClass('family_access_money_yes');
			$("#family_access_money").removeClass('family_access_money_no').addClass('family_access_money_yes');
			$("#family_access_text").text('Your Family have access to your money.');
		}
	    else{
	    	$("#family_access_money").addClass('family_access_money_no');
	    	
	    	
	    }

		if(isWillPrepared){
			//$("#family_will").toggleClass('family_will_yes');
			$("#family_will").removeClass('family_will_no').addClass('family_will_yes');
			$("#family_will_text").text('You have written will.');
		}
	    else{
	    	$("#family_will").addClass('family_will_no');
	    }
	    
     }



function showEarningExpensesChart(elementId, data,elementId2) {
	
	
	var color=['#fa87b6','#952754']
	var savingsGraphData=data[1];
	var income=data[2];
	$("#incomeAmount").text(income );

	if(savingsGraphData[0].data >0 || savingsGraphData[1].data >0){
		
	//renderPieChart(elementId2, savingsGraphData, "Saving Graph");
	var options = {
    	      
    	      height: 360,
    	      width :460,
    	      backgroundColor: { fill:'transparent' },
    	      
    	     
    	      colors : color,
    	      legend: 'none',
    	        pieSliceText: 'percentage',

    	    };
     showGooglePieChart('Saving',savingsGraphData,options,elementId2);


     showGoogleEarningLineChart(elementId, data[0]);
	}
	else{
		$('#earning_expenses1').empty();
		$('#earning_expenses1').html('<div class="no_data_message">No income/expenses data</div>')
		$("#incomeAmount").text("");
		$("#my_earnings_rs_unit").text("");
	}
	
 }
function showGoalChartGoogleAPI(elementId, data) {
	 
    var graphData = data[0];
    var goalData = data[1];
    
    
	  var chartData=[];
	  chartData[0] = [];
	  chartData[0][0] = 'Goal';
	  chartData[0][1] = 'Value';
		for(var i=1;i<graphData.length;i++){
			 chartData[i] = [];
			 chartData[i][0] = graphData[i].label;
			 chartData[i][1] = graphData[i].data;
			
			 
		 }
	  
 var graph = google.visualization.arrayToDataTable(chartData);

 var options = {
   title: '',
   backgroundColor: { fill:'transparent' },
   is3D: false,
   'legend':'left',
   /*legend:{position: 'top', textStyle: {color: 'blue', fontSize: 16},alignment:'start'},*/
   //chartArea:{top:0},
   colors:['red','#004411','blue','	black','#004211','#002411'],
   
   
 };

 var chart = new google.visualization.PieChart(document.getElementById('goalGraph'));
 chart.draw(graph, options);
}
 
function showGoalChart(elementId, data) {
	 
     var graphData = data[0];
     var goalData = data[1];
     var achievedGoalsCount=data[5];
     var achievableGoals=data[6];
     var regularInvestAmount=data[7];
     var closedPer = data[8];
     var totalGoal = data[9];
     
     if(graphData.length>1){
    	 
     $('#no-goal-data').hide();
     $("#achievedGoals").text(achievedGoalsCount);
     $("#totalGoals").text(totalGoal);
     $("#achievableGoals").text(achievableGoals);
     
     if(closedPer>0){
     $("#closerPercentage").text(closedPer);
     }
     else{
    	$('#goalPercentage').text("No assets have been allocated for remaining goals.") ;
     }
     $("#invest").text(regularInvestAmount);
     var options = {
   	      
   	      backgroundColor: { fill:'transparent' },
   	   	  pieSliceText: 'none',
   	  		 height: 400,
	      width :600,
	      pieSliceText: 'percentage',
	      colors:GRAPH_COLORS
	      
   	    };
    showGooglePieChart('Goals',graphData,options,elementId);
	
     }
     else{
    	 
    	 $('#goals1').empty();
    	 $('#goals1').html('<div class="no_data_message">NO Goal Data</div>');
    	 
     }
 	
     }
     
     var totalLoan=0;

     function showNetWorth(data){
    	 
    	 var assets=data[0];
    	 var loan=data[1];
    	 if(assets.length>0){
    		 var options = {
        	   	     
       	   	      backgroundColor: { fill:'transparent' },
       	   	   height: 400,
        	      width :600,
        	     pieSliceText: 'percentage',
       	   	colors:GRAPH_COLORS
       	   	    };
    		
    		 showGooglePieChart('Asset',data[0],options,'assetGraph');
    		 $("#networth_asset_amount").html(data[3]);
    	 }
    	 else{
    		 $('#assetGraph').empty();
    		 $('#assetData').append('<div class="no_data_message" style="margin-top:100px">No Asset data found</div>')
    		 /* $('#assetData').empty();
    		 $('#assetData').html('<div class="no_data_message">No Asset Data found</div>'); */
    		 
    	 }
 		if(loan.length>0){
 			var options2 = {
 		   	   	      
 		   	   	      backgroundColor: { fill:'transparent' },
 		   	   	height: 400,
 			      width :600,
 			      pieSliceText: 'percentage',
 		    		 
 		    			 colors:GRAPH_COLORS
 		   	   	    };
 		    	 
 		    	 showGooglePieChart('Loan',data[1],options2,'loanGraph');
 		    	// renderPieChart('assetGraph', data[0], 'Asset');
 		   // 	 renderPieChart('loanGraph', data[1], 'Loan');
 		    	 $("#networth_loan_amount").html(data[2]);
    	 }
    	 else{
    		 $('#loanGraph').empty();
    		 $('#loanData').append('<div class="no_data_message" style="margin-top:100px">No Loan data found</div>')
    	 }
    	  
    	
    	 
    	 
     }

function loadDivAjax(divId, url){
	
	 $(divId).load(url,
					function(response, status, xhr) {
						if (status == "error") {
							var msg = "Sorry but there was an error: ";
							$(divId).html(msg + xhr.status + " " + xhr.statusText);
				}
	});
}

	$(document).ready(function () {
		/* Equity*/
		//$(".azaxslides").hide();
		$("#earning_expenses").click(function () {
			//$ this.css("background-color","#f00");
			
		//	$(".ee_txt").css("color","#fff");
		//	$(".tn_txt").css("color","#3a3a3a");
		//	$(".g_txt").css("color","#3a3a3a");
		//	$(".as_txt").css("color","#3a3a3a");		
			
		//	$(".ee").addClass("aditya-test");
		//	$(".tn").addClass("aditya-test_non_act");
		//	$(".g").addClass("aditya-test_non_act");
		//	$(".as").addClass("aditya-test_non_act");
			
	
			 $.when($(".image").not("#earning_expenses1").fadeOut("slow")).done(function() {
				 $("#earning_expenses1").fadeIn("slow");

			  });
		   });
	
	
		$("#total_networth").click(function () {
			
			
		//	$(".ee_txt").css("color","#3a3a3a");
		//	$(".tn_txt").css("color","#fff");
		//	$(".g_txt").css("color","#3a3a3a");
		//	$(".as_txt").css("color","#3a3a3a");
			
		//	$(".ee").addClass("aditya-test_non_act");
		//	$(".tn").addClass("aditya-test");
		//	$(".g").addClass("aditya-test_non_act");
		//	$(".as").addClass("aditya-test_non_act");
		
			 $.when($(".image").not("#networth1").fadeOut("slow")).done(function() {
				 
				 $("#networth1").fadeIn("slow");
			  });
		   });
	
		$("#goals").click(function () {
			
		//	$(".ee_txt").css("color","#3a3a3a");
		//	$(".tn_txt").css("color","#3a3a3a");
		//	$(".g_txt").css("color","#fff");
		//	$(".as_txt").css("color","#3a3a3a");	
		
		//	$(".ee").addClass("aditya-test_non_act");
		//	$(".tn").addClass("aditya-test_non_act");
		//	$(".g").addClass("aditya-test");
		//	$(".as").addClass("aditya-test_non_act");
		
			 $.when($(".image").not("#goals1").fadeOut("slow")).done(function() {
			  $("#goals1").fadeIn("slow");
			  });
		   });
	    
		$(".banner-nav1").click(function () {
			$(".banner-nav1").not(this).addClass("inactive");
			$(".banner-nav1").not(this).removeClass("active");
			$(this).addClass("active");
			$(this).removeClass("inactive");
		  });
		
		$("#achievement_scale").click(function () {
			
		//	$(".ee_txt").css("color","#3a3a3a");
		//	$(".tn_txt").css("color","#3a3a3a");
		//	$(".g_txt").css("color","#3a3a3a");
		//	$(".as_txt").css("color","#fff");
			
			
		//	$(".ee").addClass("aditya-test_non_act");
		//	$(".tn").addClass("aditya-test_non_act");
		//	$(".g").addClass("aditya-test_non_act");
		//	$(".as").addClass("aditya-test");
			
			 $.when($(".image").not("#achievement_scale1").fadeOut("slow")).done(function() {
			    $("#achievement_scale1").fadeIn("slow");
			  });
		   });
		
	//	$("#div_dragger").click(function(){
	//		   $("#dragger").slideToggle("slow");
	//		  });
		
	//	$(document).ready(function(){{alert("I am an alert box!");
			  $("#div_dragger").click(function(){
			    $("#dragger").slideToggle("slow");
				$("#div_dragger span").animate("slow").toggleClass("div_dragger_up","slow");
				if($("#div_dragger span").hasClass("div_dragger_up"))
			{
			//	 $("#query_filter #query_typeSelectBoxIt .selectboxit-text").text("Query Type");
			//	 $("#query_filter #query_formSelectBoxIt .selectboxit-text").text("Query From");
			//	 $("#query_filter #query_forSelectBoxIt .selectboxit-text").text("Query For");
			//	$("#query_filter .common_input").val("");
			}
			  });
			//});
	});
</script>


<!--****** Code for Banner sliding  End*****-->

   	<div id="image_upload_dialog" class="look_feel" >
		 <form:form
   			action="${pageContext.request.contextPath}/profile/image/save"
   			method="POST" id="profile-form" enctype="multipart/form-data">
   			<input type="hidden" value="-1" name="x">
    		<input type="hidden" value="-1" name="y">
    		<input type="hidden" value="-1" name="w">
    		<input type="hidden" value="-1" name="h">
    
     		<div > <img style="width:400px;height:auto;float:center;"  id="preview" alt="" /></div>
    		
    		<div class="upload_btn">
    		<input class="northspace4" type="file" name="documentAttachment" capture="camera" accept="image/*" id="upload"/>
    		</div>    
    		<div style="margin:20px 0px 0px 30px;color:#3a3a3a;"><p style="font-size:12px !important;">Please upload the image of following dimensions for best results</p><p style="margin:5px 0px 0px 70px; font-size:12px !important;"> <span style="font-weight:bold">width:</span> 896 px -<span style="font-weight:bold"> height:</span> 300 px</p><p style="margin:5px 0px 0px 70px; font-size:12px !important;"> <span style="font-weight:bold">width:</span> 316 mm -<span style="font-weight:bold"> height:</span> 106 mm</p></div>
    	<div>
    	</div>
    	</form:form> 
    	</div>
    	
   	
	<div class="drag_parent">
		<div id="banner" class="clearfix">
		<div class="image clearfix" >
			<img id="image_banner" class="clearfix" src="<%=FiinfraUtility.getImagePath(request, imagePath, "/resources/images/banner.png") %>" /> 
			<a id ="add-image-btn" href="javascript:void(0)" ><div onclick="openImageDialog();" class="image-changer"><div class="add-image-btn-txt">Change Photo</div></div> </a>
		</div>
		
		
	
	    <div class="image clearfix fl azaxslides" id="goals1" >
	    
            <div id = "goalGraph" class="goal_piechart clearfix fl" style="margin-top:-50px ;margin-left:-100px"></div>
            <div class="goal_txt clearfix fr" style="width: 50%;margin-top: 20px !important;margin-right: 0px !important;">
              <!--   <p class="clearfix fl"><span class="title_txt_width clearfix fl">Total Goal Value :-</span><span class="magento_txt clearfix fl"> <label id="totalGoalValue"></label></span> </p>
                <p class="clearfix"><span class="title_txt_width clearfix fl">Upcoming Goals :-</span><span class="magento_txt clearfix fl"><label id="upcomingGoals"></label></span></p>
                <p class="clearfix"><span class="title_txt_width clearfix fl">Latest Goal Completion :-</span><span class="magento_txt clearfix fl"><label id="latestGoalCompleted"></label></span></p> -->
                <p style="margin-right: 20px !important"><span class="title_txt_width clearfix fl">Goal Achieved :- </span> <span class="achived_goals" id="achivedGoals1">&nbsp; <label id="achievedGoals"></label></span><span class="slash"> /</span><span class="total_goals" id="totalGoals"> </span></p>
                <p style="margin-right: 20px !important"><span id="goalPercentage" class="title_txt_width clearfix fl">You are  <span class="closer_percentage" id="closerPercentage"> X </span><span> % </span> close to <label id="achievableGoals"></label> more goals </span></p>
     			<p style="margin-right: 20px !important"><span class="title_txt_width clearfix fl">In discussions <span>invest </span><span class="invest" ><label id="invest"></label></span>additional <span>per month</span></span></p>      
            </div><!-- end of "goal_txt" -->
            <p class="details fr"><a href="${pageContext.request.contextPath}/portfolio/myGoals">Details...</a></p>
      </div><!-- End of Banner Goals1 -->
      
      <div class="image clearfix fl azaxslides" id="achievement_scale1" >
      
            <div class="overall_scale_bar_graph clearfix fl">
            	<span class="max_limit clearfix fl">100%</span>
                <!--div class="level_bar"></div-->
                <div class="current_scale" id="overAllScale1"></div>
                <div class="overall_bar clearfix fl" id="perBar">
                	<!-- <div class="level_bar one clearfix fl"></div>
                    <div class="level_bar two clearfix fl"></div>
                    <div class="level_bar three clearfix fl"></div>
                    <div class="level_bar four clearfix fl"></div>
                    <div class="level_bar five clearfix fl"></div>
                    <div class="level_bar six clearfix fl"></div>
                    <div class="level_bar seven clearfix fl"></div>
                    <div class="level_bar eight clearfix fl"></div>
                    <div class="level_bar nine clearfix fl"></div>
                    <div class="level_bar ten clearfix fl"></div> -->         
                </div>
                
                <span class="min_limit clearfix fl">0%</span>
                <span class="overall_scale clearfix fl">Overall Scale</span>                
            </div><!-- End of Banner overall_scale_bar_graph -->
            
            <div class="separator clearfix fl"></div>
            
            <div class="goal_risk clearfix fl azaxslides">
            	<div class="goal">
                	<h3>Goals</h3>
                	<div id="goal_condition75" class="condition75"><p class="highlighted">Congratulations !</p><p>You are almost there. You are <span class="completion"> </span> closer to your dream goal</p></div>
                    <div id="goal_condition50" class="condition50"><p class="highlighted">Go for it `</p><p>You are <span class="completion"> </span>&nbsp;closer to your dream goal</p></div>
                    <div id="goal_condition25" class="condition25"><p>You have taken first step.</p></div>
                </div><!-- end of goal -->
                
                <div class="separator_horizontal clearfix" fl></div> 
                              
                <div  class="risk">
                	<h3>Risk</h3>
                	<div id="risk_condition75" class="condition75"><p class="highlighted">Congratulations !</p><p>You are fully protected against all risks</p></div>
                    <div id="risk_condition50" class="condition50"><p class="highlighted">Go for it !</p><p>You are in control of all possible adversities</p></div>
                    <div id="risk_condition25" class="condition25"><p class="highlighted">Watchout !</p><p>A bit more precaution can help you to manage unforeseen risk</p></div>
                </div><!-- end of risk -->            	
            </div><!-- End of goal_risk -->
            
            <div class="separator clearfix fl"></div>
            
            <div class="succession clearfix fl">
            	<div class="fam_inv align"><div class="family_invest_no" id="family_invest"></div><p id = "family_invest_text" >Your family don't know where you have invested your money.</p></div>
                <div class="fam_inv align"><div class="family_access_money_no" id="family_access_money"></div><p id="family_access_text" >Your family don't have access to your money.</p></div>
                <div class="fam_inv align"><div class="family_will_no" id="family_will"></div><p id="family_will_text">You have not written will. You must!</p></div>
            </div><!-- End of succession -->
            
            <!-- <p class="details fr"><a href="#">Details...</a></p> -->
            
      </div><!-- End of Banner achievement_scale1 -->
      
      <div class="image clearfix fl" id="earning_expenses1" >
      <div id = "savingGraph"  class="earning_expenses_piechart clearfix fl" style="margin-top:-50px ;margin-left:-100px"></div>
       <div class="my_earnings clearfix fl" >
            <div class="my_earnings_icon align_icon clearfix"></div>
            <div class="my_earnings_txt clearfix">My Saving</div>
            <div class="my_earnings_rs clearfix"><span class="my_earnings_rs_cost"><label id="incomeAmount"></label> </span><span id="my_earnings_rs_unit" class="my_earnings_rs_unit">yr</span></div>
         </div>
         <div class="color-legends clearfix fl">
         <div class="earning-legend clearfix fl"></div><span>My Earnings</span>
         <br>
         <div class="expense-legend clearfix fl"></div><span>My Expenses</span>
       </div>  
         
          <div class="separator clearfix fl"></div>	
       
      <!-- <div  class="goal_piechart clearfix fl" style="width: 560px"></div> -->
      <div id = "earningExpensesGraph" class="earning_expenses_linechart clearfix fl" style="margin-top:-50px ;margin-left:-100px"></div>
        <p class="details fr"><a href="${pageContext.request.contextPath}/financial/savings">Details...</a></p>
      </div><!-- End of Banner earning_expenses1 -->
      
      
      <!-- End of Banner Goals1 -->
      
      <!--<div class="image clearfix" id="goals1" ></div>-->
      
      <div class="image clearfix fl" id="networth1" >      	
      	<div class="tn_own clearfix fl" id="assetData"> 
      		<div id = "assetGraph" class="goal_piechart clearfix fl" style="margin-top:-50px ;margin-left:-100px; width:100%;"></div>
      		<div class="i_owe clearfix fr"><p class="title">I OWN</p><p class="amount" id = "networth_asset_amount"></p></div>
      	</div><!-- end of tn_own -->
      	
	 	<div class="separator clearfix fl"></div>
	 	
	 	<div class="tn_owe clearfix fl" id="loanData"> 			
			<div class="i_own clearfix fl"><p class="title">I OWE</p><p class="amount" id = "networth_loan_amount"></p></div>
			<div id = "loanGraph" class="goal_piechart clearfix fl" style="margin-top:-110px ;margin-left:-30px"></div>
		</div><!-- end of tn_owe -->
		<p class="details clearfix fr"><a href="${pageContext.request.contextPath}/portfolio/myAssets">Details...</a></p>
				
	 <!-- div id = "loanGraph" class="goal_piechart clearfix fl"></div-->
      </div><!-- End of Banner networth1 -->
			

      
      <div class="banner-name-main clearfix fr"><!-- parenting for below "banner-nav" -->
        <div class="banner-nav clearfix">
          <div class="banner-nav1 clearfix ee azaxslides" id="earning_expenses">            
            <p class="ee_txt">Earning / Expenses</p>
          </div>
          <!-- end of "banner-nav1" class -->
          <div class="banner-nav1 clearfix tn azaxslides" id="total_networth">
            <p class="tn_txt">Total Networth</p>
          </div>
          <!-- end of "banner-nav1" class -->
          <div class="banner-nav1 clearfix g azaxslides" id="goals">
            <p class="g_txt">Goals</p>
          </div>
          <!-- end of "banner-nav1" class -->
          <div class="banner-nav1 clearfix as azaxslides" id="achievement_scale">
            <p class="as_txt">Achievement Scale</p>
          </div>
          <!-- end of "banner-nav1" class --> 
        </div>
        <!-- end of "banner-nav" id --> 
      </div>
      <!-- end of "banner-name-main" id --> 

</div></div>

		<!-- end of "banner" id -->

		<!--div id="shadow" class="clearfix fl"></div-->

		<div id="dragger">
		<ul class="">
			<li class="alert-bg"><a href="${pageContext.request.contextPath}/common/alerts"><img class="alert-ico"
					src="${pageContext.request.contextPath}/resources/images/transparent.png" />
				<p>Alert <span>(${alertCount})</span></p></a></li>
			<li class="enj-scale"><a href="${pageContext.request.contextPath}/question/feedback"><img class="enj-ico"
					src="${pageContext.request.contextPath}/resources/images/transparent.png" />
				<p>FeedBack</p></a></li>
			<li class="polls"><a href="${pageContext.request.contextPath}/question/polls"><img class="polls-ico"
					src="${pageContext.request.contextPath}/resources/images/transparent.png" />
				<p>Polls</p></a></li>
			<li class="faq"><a href="${pageContext.request.contextPath}/common/FAQs"><img class="faq-ico"
					src="${pageContext.request.contextPath}/resources/images/transparent.png" />
				<p>FAQs</p></a></li>
			<li class="quick-help"><a ><img class="qh-ico"
					src="${pageContext.request.contextPath}/resources/images/transparent.png" />
				<p>Quick Help</p></a></li>
			<li class="soft-adv"><a disabled><img class="softadv-ico"
					src="${pageContext.request.contextPath}/resources/images/transparent.png" disabled />
				<p>Soft Advice</p></a></li>
							 <li class="soft-adv"><a href="${pageContext.request.contextPath}/chat/chat"><img class="softadv-ico"
					src="${pageContext.request.contextPath}/resources/images/transparent.png" />
				<p>Soft Advice</p></a></li> 
				
		</ul>
        </div>
		<div id="div_dragger" class="clearfix"><span class="div_dragger"></span></div>
		<!-- end of "dragger" id -->
	
	<script>
	 var goalData;
	 var achivementScale;
	 var netWorth;
	 var earningExpenses;
	 $('.azaxslides').addClass('loading');
	 
		$.ajax({
			type : "GET",
			url : "${pageContext.request.contextPath}/portfolio/dashboard/ajax",
			contentType : "application/json; charset=utf-8",
			dataType : "json",
			success : function(data) {
				$('.azaxslides').removeClass('loading');
				//$(".azaxslides").show();
				showEarningExpensesChart('earningExpensesGraph',data['earningExpenses'],'savingGraph');
				showGoalChart('goalGraph',data['goalData']);
				showNetWorth(data['netWorth']);
				showAchievementScale(data['achivementScale']);
			},
			error : function(msg) {
				$('.azaxslides').removeClass('loading');
				//showMessage('An error occured while loading',true);
			}
		});
	 
	

	
	</script>


      	