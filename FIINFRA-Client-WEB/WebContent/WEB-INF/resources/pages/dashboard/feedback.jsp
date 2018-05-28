
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@page import="in.fiinfra.question.OptionData"%>
<%@page import="in.fiinfra.question.QuestionData"%>
<%@page import="org.aspectj.weaver.patterns.TypePatternQuestions.Question"%>
<%@page import="in.fiinfra.cp.CommonUtils"%>

<%@page import="org.apache.commons.lang.StringUtils"%>
<%@page import="in.fiinfra.common.common.CodeValueData"%>
<%@page import="in.fiinfra.cp.ExpenseData"%>
<%@page import="in.fiinfra.common.diy.models.KeyValue"%>
<%@page import="java.util.List"%>



<script>

function bindOption(options, qType){
	
	
	if("85004"== qType){
		$('#questionTypeChoice').hide();
		$('#questionTypeOption').show();

	}
	if("85001"== qType){
		$('#questionTypeChoice').show();
		$('#questionTypeOption').hide();
	}
	
	var opNo = 0;
	for(var i=1;i<=9;i++){
		++opNo;
		$('#chk'+opNo).prop('checked',false);
		$('#option'+opNo).prop('checked',false);
		$('#spanChk'+opNo).removeClass('white_checkbox_checked');
		$('#spanOption'+opNo).removeClass('common_radio_button_checked');
		$('#divChk'+opNo).hide();
		$('#divOption'+opNo).hide();
		$('#chk'+opNo).val('');
		$('#option'+opNo).val('');
		$('#lblChk'+opNo).text('');
		$('#lblOption'+opNo).text('');
			
	}
	
	var cond ;
	if(options.length <=2){
		cond = [1,7] ;
		
		$('.customCSS_exp_bx_in').removeClass('topMargin_2');	
		$('.mon_house_exp_bx').removeClass('mon_house_exp_bx').addClass('radio_parent');
		$('.five_radio_exp_bx').removeClass('five_radio_exp_bx').addClass('radio_parent');
		$('.three_radio_exp_bx').removeClass('three_radio_exp_bx').addClass('radio_parent');
		$('.feeback_bx_in').removeClass('feeback_bx_in').addClass('feeback_bx_in1');
		$('.feeback_bx_in6').removeClass('feeback_bx_in6').addClass('feeback_bx_in1');
		
		$('.three_radio_exp_bx_in_left').removeClass('three_radio_exp_bx_in_left').addClass('mon_house_exp_bx_in_left');
		 $('.three_radio_exp_bx_in_center').removeClass('three_radio_exp_bx_in_center fl').addClass('mon_house_exp_bx_in_center');
		 $('.three_radio_exp_bx_in_right').removeClass('three_radio_exp_bx_in_right fl').addClass('mon_house_exp_bx_in_right');
		 
		 $('.five_radio_exp_bx_in_left').removeClass('five_radio_exp_bx_in_left fl').addClass('mon_house_exp_bx_in_left');
		 $('.five_radio_exp_bx_in_center').removeClass('five_radio_exp_bx_in_center fl').addClass('mon_house_exp_bx_in_center');
		 $('.five_radio_exp_bx_in_right').removeClass('five_radio_exp_bx_in_right fl').addClass('mon_house_exp_bx_in_right');
		
	}
	else if(options.length <=3){
		cond = [3,4,8]; 
		
		 
		 $('.mon_house_exp_bx_in_left').removeClass('mon_house_exp_bx_in_left').addClass('three_radio_exp_bx_in_left');
		 $('.mon_house_exp_bx_in_center').removeClass('mon_house_exp_bx_in_center').addClass('three_radio_exp_bx_in_center fl');
		 $('.mon_house_exp_bx_in_right').removeClass('mon_house_exp_bx_in_right').addClass('three_radio_exp_bx_in_right fl');
		 
		 $('.five_radio_exp_bx_in_left').removeClass('five_radio_exp_bx_in_left fl').addClass('three_radio_exp_bx_in_left');
		 $('.five_radio_exp_bx_in_center').removeClass('five_radio_exp_bx_in_center fl').addClass('three_radio_exp_bx_in_center fl');
		 $('.five_radio_exp_bx_in_right').removeClass('five_radio_exp_bx_in_right fl').addClass('three_radio_exp_bx_in_right fl');
		 
		 $('.customCSS_exp_bx_in').addClass('topMargin_2');
		$('.radio_parent').removeClass('radio_parent').addClass('three_radio_exp_bx');
		$('.five_radio_exp_bx').removeClass('five_radio_exp_bx').addClass('three_radio_exp_bx');
		$('.mon_house_exp_bx').removeClass('mon_house_exp_bx').addClass('three_radio_exp_bx');
		$('.feeback_bx_in1').removeClass('feeback_bx_in1').addClass('feeback_bx_in');
		$('.feeback_bx_in6').removeClass('feeback_bx_in6').addClass('feeback_bx_in');
		$('#').removeClass('feeback_bx_in6').addClass('feeback_bx_in');
	}

	else if(options.length ==4){
		
		cond = [1,7,5,9];
		
		$('.customCSS_exp_bx_in').removeClass('topMargin_2');
		$('.three_radio_exp_bx').removeClass('three_radio_exp_bx').addClass('mon_house_exp_bx');
		$('.radio_parent').removeClass('radio_parent').addClass('mon_house_exp_bx');
		$('.five_radio_exp_bx').removeClass('five_radio_exp_bx').addClass('mon_house_exp_bx');
		$('.feeback_bx_in').removeClass('feeback_bx_in').addClass('feeback_bx_in1');
		$('.feeback_bx_in6').removeClass('feeback_bx_in6').addClass('feeback_bx_in1');
		
		$('.three_radio_exp_bx_in_left').removeClass('three_radio_exp_bx_in_left').addClass('mon_house_exp_bx_in_left');
		 $('.three_radio_exp_bx_in_center').removeClass('three_radio_exp_bx_in_center fl').addClass('mon_house_exp_bx_in_center');
		 $('.three_radio_exp_bx_in_right').removeClass('three_radio_exp_bx_in_right fl').addClass('mon_house_exp_bx_in_right');
		 
		 $('.five_radio_exp_bx_in_left').removeClass('five_radio_exp_bx_in_left fl').addClass('mon_house_exp_bx_in_left');
		 $('.five_radio_exp_bx_in_center').removeClass('five_radio_exp_bx_in_center fl').addClass('mon_house_exp_bx_in_center');
		 $('.five_radio_exp_bx_in_right').removeClass('five_radio_exp_bx_in_right fl').addClass('mon_house_exp_bx_in_right');
		 
		
	}
	else if(options.length ==5){
		
		cond = [1,2,7,3,4];
		
		$('.customCSS_exp_bx_in').removeClass('topMargin_2');
		
		$('.three_radio_exp_bx').removeClass('three_radio_exp_bx').addClass('five_radio_exp_bx');
		$('.mon_house_exp_bx').removeClass('mon_house_exp_bx').addClass(' five_radio_exp_bx');
		$('.radio_parent').removeClass('radio_parent').addClass('five_radio_exp_bx');
		
		$('.feeback_bx_in1').removeClass('feeback_bx_in1').addClass('feeback_bx_in');
		$('.feeback_bx_in6').removeClass('feeback_bx_in6').addClass('feeback_bx_in');
		
		$('.three_radio_exp_bx_in_left').removeClass('three_radio_exp_bx_in_left').addClass('five_radio_exp_bx_in_left fl');
		 $('.three_radio_exp_bx_in_center').removeClass('three_radio_exp_bx_in_center fl').addClass('five_radio_exp_bx_in_center fl');
		 $('.three_radio_exp_bx_in_right').removeClass('three_radio_exp_bx_in_right fl').addClass('five_radio_exp_bx_in_right fl');
		 
		 $('.mon_house_exp_bx_in_right').removeClass('mon_house_exp_bx_in_right').addClass('five_radio_exp_bx_in_right fl ');
		 $('.mon_house_exp_bx_in_center').removeClass('mon_house_exp_bx_in_center').addClass('five_radio_exp_bx_in_center fl');
		 $('.mon_house_exp_bx_in_left').removeClass('mon_house_exp_bx_in_left').addClass('five_radio_exp_bx_in_left fl');
	}
	else if(options.length ==6){
		
		cond = [1,2,3,4,5,6];
		
		$('.customCSS_exp_bx_in').removeClass('topMargin_2');
		$('.three_radio_exp_bx').removeClass('three_radio_exp_bx').addClass('mon_house_exp_bx');
		$('.five_radio_exp_bx').removeClass('five_radio_exp_bx').addClass('mon_house_exp_bx');
		$('.radio_parent').removeClass('radio_parent').addClass('mon_house_exp_bx');
		
		$('.feeback_bx_in1').removeClass('feeback_bx_in1').addClass('feeback_bx_in6');
		$('.feeback_bx_in').removeClass('feeback_bx_in').addClass('feeback_bx_in6');
		
		$('.three_radio_exp_bx_in_left').removeClass('three_radio_exp_bx_in_left').addClass('mon_house_exp_bx_in_left');
		 $('.three_radio_exp_bx_in_center').removeClass('three_radio_exp_bx_in_center fl').addClass('mon_house_exp_bx_in_center');
		 $('.three_radio_exp_bx_in_right').removeClass('three_radio_exp_bx_in_right fl').addClass('mon_house_exp_bx_in_right');
		 
		 $('.five_radio_exp_bx_in_left').removeClass('five_radio_exp_bx_in_left fl').addClass('mon_house_exp_bx_in_left');
		 $('.five_radio_exp_bx_in_center').removeClass('five_radio_exp_bx_in_center fl').addClass('mon_house_exp_bx_in_center');
		 $('.five_radio_exp_bx_in_right').removeClass('five_radio_exp_bx_in_right fl').addClass('mon_house_exp_bx_in_right');
		 
		
	}
	
	else if(options.length ==7){
		cond = [1,2,7,3,4,8,6];
		
		$('.customCSS_exp_bx_in').removeClass('topMargin_2');
		$('.three_radio_exp_bx').removeClass('three_radio_exp_bx').addClass('mon_house_exp_bx');
		$('.radio_parent').removeClass('radio_parent').addClass('mon_house_exp_bx');
		$('.five_radio_exp_bx').removeClass('five_radio_exp_bx').addClass('mon_house_exp_bx');
		$('.feeback_bx_in1').removeClass('feeback_bx_in1').addClass('feeback_bx_in');
		
		$('.three_radio_exp_bx_in_left').removeClass('three_radio_exp_bx_in_left').addClass('mon_house_exp_bx_in_left');
		 $('.three_radio_exp_bx_in_center').removeClass('three_radio_exp_bx_in_center fl').addClass('mon_house_exp_bx_in_center');
		 $('.three_radio_exp_bx_in_right').removeClass('three_radio_exp_bx_in_right fl').addClass('mon_house_exp_bx_in_right');
		 
		 $('.five_radio_exp_bx_in_left').removeClass('five_radio_exp_bx_in_left fl').addClass('mon_house_exp_bx_in_left');
		 $('.five_radio_exp_bx_in_center').removeClass('five_radio_exp_bx_in_center fl').addClass('mon_house_exp_bx_in_center ');
		 $('.five_radio_exp_bx_in_right').removeClass('five_radio_exp_bx_in_right fl').addClass('mon_house_exp_bx_in_right ');
		 
		
	}
	else {
		cond = [1,2,7,3,4,8,5,6,9];
		
		$('.customCSS_exp_bx_in').removeClass('topMargin_2');
		$('.three_radio_exp_bx').removeClass('three_radio_exp_bx').addClass('mon_house_exp_bx');
		$('.radio_parent').removeClass('radio_parent').addClass('mon_house_exp_bx');
		$('.five_radio_exp_bx').removeClass('five_radio_exp_bx').addClass('mon_house_exp_bx');
		
		$('.feeback_bx_in1').removeClass('feeback_bx_in1').addClass('feeback_bx_in');
		
		$('.three_radio_exp_bx_in_left').removeClass('three_radio_exp_bx_in_left').addClass('mon_house_exp_bx_in_left ');
		 $('.three_radio_exp_bx_in_center').removeClass('three_radio_exp_bx_in_center fl').addClass('mon_house_exp_bx_in_center ');
		 $('.three_radio_exp_bx_in_right').removeClass('three_radio_exp_bx_in_right fl').addClass('mon_house_exp_bx_in_right ');
		 
		 $('.five_radio_exp_bx_in_left').removeClass('five_radio_exp_bx_in_left fl').addClass('mon_house_exp_bx_in_left ');
		 $('.five_radio_exp_bx_in_center').removeClass('five_radio_exp_bx_in_center fl').addClass('mon_house_exp_bx_in_center ');
		 $('.five_radio_exp_bx_in_right').removeClass('five_radio_exp_bx_in_right fl').addClass('mon_house_exp_bx_in_right ');
		 
		
	}
	
	
	opNo = 0;
	for(var i=0;i<options.length;i++){
		var opNo = cond[i];
		$('#chk'+opNo).prop('checked',false);
		$('#option'+opNo).prop('checked',false);
		$('#spanOption'+opNo).removeClass('common_radio_button_checked');
		$('#spanChk'+opNo).removeClass('white_checkbox_checked'); 
		 
		if("85001"== qType){
			$('#divChk'+opNo).show();
			 $('#chk'+opNo).val(options[i]['optionId']);
			 $('#lblChk'+opNo).text(options[i]['optionText']);

			 if(options[i].selected== true){
				 $('#spanChk'+opNo).addClass('white_checkbox_checked');
				 $('#chk'+opNo).prop('checked',true);
			 }
		 }
		else if("85004" == qType){
			$('#divOption'+opNo).show();
			 $('#option'+opNo).val(options[i]['optionId']);
			 $('#lblOption'+opNo).text(options[i]['optionText']);

			 if(options[i].selected== true){
				 $('#spanOption'+opNo).addClass();
				 $('#option'+opNo).prop('checked',true);
			 }
			 
		}
	}
	for(;opNo<=4;opNo++){
		$('divOption'+opNo).hide();
		$('divChk'+opNo).hide();
	}

}

function bindQuestions(question){
	
	//alert(JSON.stringify(question));
	var qType = question['questionTypeId'];
	//alert(qType);
	sectionId=question['sectionId'];
	$(".active").removeClass("active"); 
	$("#"+sectionId).addClass("active");	
	/* if(tempSectionId==sectionId){
		
		$("#"+z).addClass( "active" );
	}else{
		z++;
		tempSectionId=sectionIds[z];
	} */
	//alert(JSON.stringify(question));
	//$("#questionOptions").empty();
	$("#txtQuestion").text(question['question']);
	var qId =$("#questionId").val(question['questionId']);
	var options=question['options'];
	
	//$("#questionOptions").empty();
	
	bindOption(options,qType);
	
	var myScore = 0;
	for(var i=0;i<index;i++){
		//alert(scores[i]);
		myScore += scores[i] ;
	}
	$('#currentQuestion').text(index+1);
	$('#totalQuestion').text(" / "+data1.length);
	if(index ==0){
		$("#prev").hide();
	}
	else{
		$("#prev").show();
	}

 }


</script>

<!--Slider Starts -->

<!--Common Custom checkbox -->
<script>
$(document).ready(function(){
  $("body").on("click",".common_custom_checkbox",function(){
    $(this).toggleClass("white_checkbox_checked");
	
	 if ($(this).next( ".default_checkbox" ).is(":checked")) {
		
       $(this).next( ".default_checkbox" ).prop("checked", false);
    } else {
       $(this).next( ".default_checkbox" ).prop("checked", true);
	
    }
	
  });
 
});
</script>
<script>
$(document).ready(function(){
  $("body").on("click",".common_radio_button",function(){
    $(".common_radio_button").removeClass("common_radio_button_checked");
	$(this).addClass();
	
	 if ($(this).next( ".default_radio" ).is(":checked")) {
		
       $(this).next( ".default_radio" ).prop("checked", false);
	   
    } else {
       $(this).next( ".default_radio" ).prop("checked", true);
	
    }
	
  });
});
</script>

<script>

var data1=${questionList};

//alert(JSON.stringify(data1));
var index=0;
var flag=-1;
var x=0;

var sectionId;
var sectionIds=[];
var oldSectionId;
var scores  = [];
var temp=data1[0]['sectionId'];
sectionIds[0]=temp;
for(var j=0;j<data1.length;j++){
	if(data1[j]['sectionId']!=sectionIds[x]){
		x++;
		sectionIds[x]=data1[j]['sectionId'];
	}
}
for(var i=0;i<data1.length;i++){
	scores [i] = 0;
}
 $(document).ready(function() {
	//  $('.add_docs_bx_slider').bxSlider();
		  
	 
$('#prev').click(function(){
	//alert('Previous');
	$("#validMessage").text("");
	if(index-1>flag){
		/* $("#validMessage").text(""); */
		saveSelecteOptions(false);
		
		//$('.add_docs_bx_slider').bxSlider();
	}else{
		
		$("#validMessage").text("You are at First Question !!");
	}
	
	
});
$('#next').click(function(e){
	e.preventDefault();
	$("#validMessage").text("");
	 if(data1[index]['mandatory']==true){
		 var found = false;
		 $('input[type=checkbox]').each(function () {
			  if(this.checked){ 
				 found = true;
			}
		  });
 		$('input[type=radio]').each(function () {
			 if(this.checked){
				 found = true;
			}
		  });
	 
		 if(!found){
			 $("#validMessage").text("Please Answer This Question");
			 return  ;
		 }
	}
	saveSelecteOptions(true);
	 

	});


/* $(".section_type").click(function(e){
		e.preventDefault();
	   	sectionIdIndex = $(this).prop('id');
	   	for(var i=0;i<6;i++){
       		if(i!=sectionIdIndex){
       			$("#"+i).removeClass( "active" );
       		}
       	}
       	document.getElementById(sectionIdIndex).classList.add('active');
       	if(sectionIdIndex==6){
       		saveSelecteOptions(true);	
       	}
       	
		
  }); */

});

 

 function saveSelecteOptions(next){
	 var options=data1[index]['options'];
	 var qId=data1[index]['questionId'];
	 $("#qId").val(qId);
	 $("#questionnaireId").val(data1[index]['questionnaireId']);
	 for(var i=0;i<options.length;i++){
		 
		// alert($('#chk'+(i+1)).is(':checked'));
		
		 if($('#chk'+(i+1)).is(':checked') || $('#option'+(i+1)).is(':checked') ){
			 options[i].selected = true; 
		 }
		 else{
			 options[i].selected =  false;
		 }
		 
	 }
	 
	 //alert('Save Called');
	 var data = {};
	 data['questionId'] = $('#qId').val();
	 data['questionnaireId'] = $('#questionnaireId').val();
	 var checked = $.map($( "input:checked" ), function(n, i){ return n.value;}).join(',');
	 data['selectedOptions'] =	 checked;
	 //alert(JSON.stringify(data));
	 $(".add_document_slider").addClass("loading");
	 
	 $.ajax(
			    {
			        url : "${pageContext.request.contextPath}/question/answer/save",
			        type: "POST",
			        
			        data : data,
			        success:function(data, textStatus, jqXHR)
			        {	
			        	
			        	$(".add_document_slider").removeClass("loading");
			        	if(next){
		        			navigateToNext();
			        	}
			        	else{
			        		navigateToPrev();
			        	}
			        	
			    		bindQuestions(data1[index]);
			        	//scores[index] = data.score;
			        },
			        error: function(jqXHR, textStatus, errorThrown)
			        {	
			        	$(".add_document_slider").removeClass("loading");
			        	console.log(errorThrown);
			        	showMessage('Error while saving Answer',true);
			        }
			    });
		
 }

 function navigateToNext(){
	 var curQuestion = data1[index];
	 if(curQuestion.sectionId != sectionId){
		 index = 0;
	 }
	 var next = getNextIndex(index);
	 
	 if(next ==-1){
			var myScore = 0;
			for(var i=0;i<index;i++){
				//alert(scores[i]);
				myScore += scores[i] ;
			}
			$("body").addClass("loading");
			
			window.location = "${pageContext.request.contextPath}/question/feedback/submit";
		 //last
	 }
	 else{
		 index = next;
		 bindQuestions(data1[index]);
		 
	 }
	 

 }
 
function navigateToPrev(){
	 flag=-1;
	 var next = getPrevIndex(index);
	 if(next ==flag){
			$("#prtgValue").text("No Previous Element");
			$( "#dialog" ).dialog( "open" );

		 //last
	 }
	 else{
		 index = next;
		 bindQuestions(data1[index]);
		 
	 }
 }
 
 function getNextIndex(index){

	 for(var i=index+1;i<data1.length;i++){
		 var q = data1[i];
		 var pQId = q.parentQuestionId;
		 var pQOpId = q.parentQuestionOpId;
		 /* if(sectionId != q.sectionId){
			 continue;
		 } */
		 
		 if(q.parentQuestionId <=0){
			 return i;
		 }
		 for(var j=0;i<index;j++){
			 if(data[j].questionId == pQId){
				 for(var k=0;k<data[j].option.length;k++){
					 if(data[j].option[k].optionId == pQOpId && data[j].option[k].selected == true ){
						 return i;
					 }
				 }
			 }
		 }
		 
	 }
	 return -1;	 
 }

 function getPrevIndex(index){

	 for(var i=index-1;i>-1;i--){
		 var q = data1[i];
		 var pQId = q.parentQuestionId;
		 var pQOpId = q.parentQuestionId;
		 /* if(sectionId != q.sectionId){
			 continue;
		 } */

		 
		 if(q.parentQuestionId <=0){
			 return i;
		 }
		 for(var j=0;i<index;j++){
			 if(data[j].questionId == pQId){
				 for(var k=0;k<data[j].option.length;k++){
					 if(data[j].option[k].optionId == pQOpId && data[j].option[k].selected == true ){
						 return i;
					 }
				 }
			 }
		 }
		 
	 }
	 return -1;	 
 }

</script>
 <script>
$(function() {
$( "#dialog" ).dialog({
		autoOpen: false,
		show: {
		effect: "scale",
		duration: 1000
		},
		hide: {
			effect: "explode",
			duration: 1000
		}
		});
		
});
</script>
<!--Common Custom checkbox ends-->

<div id="contents">
    <section class="in_content" id="feedback_main">
      <div class="feeback_bx_in">

			<div class="space"></div><div class="space"></div>
			<div>
				<!-- #section:plugins/fuelux.wizard.steps -->
				<ul class="steps">
					<li data-step="1" id="1"><span class="step">1</span> <span
						class="title">Wellness<br/>Test</span></li>

					<li data-step="2" id="2"><span class="step">2</span> <span
						class="title">Data<br/>Collection</span></li>

					<li data-step="3" id="3"><span class="step">3</span> <span
						class="title">Financial /<br/>Action Plan</span></li>

					<li data-step="4" id="4"><span class="step">4</span> <span
						class="title">Execution</span></li>
						
					<li data-step="5" id="5"><span class="step">5</span> <span
						class="title">Reporting</span></li>
						
					<li data-step="6" id="6"><span class="step">6</span> <span
						class="title">Review</span></li>
						
					<li data-step="7" id="7"><span class="step">7</span> <span
						class="title">Feedback</span></li>
				</ul>

				<!-- /section:plugins/fuelux.wizard.steps -->
			</div>

			<!-- <div class="navigation ">
          <ul>
            <li class="nav_one  section_type" id="1" ><span class="fl">Wellness<br/>Test</span></li>
            <li class="nav_two  section_type" id="2"><span class="fl">Data<br/>Collection</span></li>
            <li class="nav_three section_type" id="3"><span class="fl">Financial /<br/>Action Plan</span></li>
            <li class="nav_four section_type" id="4"><span class="fl">Execution</span></li>
            <li class="nav_five section_type" id="5"><span class="fl">Reporting</span></li>
            <li class="nav_six section_type" id="6"><span class="fl">Review</span></li>
            <li class="nav_seven section_type" id="7"><span class="fl">Feedback</span></li>
          </ul>
        </div> -->
      
      <form id="selectedOptions">
      <input type="hidden" name="questionId" id="qId"/>
      	<input type="hidden" name="questionnaireId" id="questionnaireId"/>
        <!-- <div class="label" id="txtQuestion"></div> -->


	<div class="widget-box" style="height:250px">
				<div class="widget-header widget-header-blue widget-header-flat">
					<h4 class="widget-title" id="txtQuestion"></h4>

					<div class="widget-toolbar">
						<label class="green"> 
							
								<span id="currentQuestion"></span>
								<span id="totalQuestion"></span>
							
						</label>
					</div>
				</div>




				<!-- </label> -->
        
            <div class="add_document_slider">
            
            
            <!-- <a class="bx-prev" id="prev" ></a>
               <a class="bx-next" id="next" ></a> -->
               <!-- <div class="notification"><div id="currentQuestion" class="one"></div><span id="totalQuestion" class="two"></span></div> -->
              <ul class="add_docs_bx_slider">
               
                <li>
                  <div class="mon_house_exp_bx">
                    <div id="questionOptions" class="customCSS_exp_bx_in">
                    			<div id="questionTypeChoice" class="mon_house_exp_bx">
												
													<div class="col-md-4" id="divChk1">
														
															<span id="spanChk1" ></span>
															<input type="checkbox" id="chk1" 
																name="selectedOptions" />
															<!-- <input type="checkbox" id="chk1"> -->
														
														<span id="lblChk1"></span>
														<!-- <label id="lblChk1"></label> -->
													</div>
													
													<div class="col-md-4" id="divChk2">
														
															<span id="spanChk2" ></span>
															<input type="checkbox" id="chk2" 
																name="selectedOptions" />
														<span id="lblChk2"></span>
														<!-- <label id="lblChk2"></label> -->
													</div>
													
													<div class="col-md-4"  id="divChk3">
														
															<span id="spanChk3" ></span>
															<input type="checkbox" id="chk3" 
																name="selectedOptions" />
														<span id="lblChk3"></span>
														<!-- <label id="lblChk3"></label> -->
													</div>
													
													<div class="col-md-4" id="divChk4">
														
															<span id="spanChk4" ></span>
															<input type="checkbox" id="chk4" 
																name="selectedOptions" />
														<span id="lblChk4"></span>
														<!-- <label id="lblChk4"></label> -->
													</div>
													
													<div class="col-md-4" id="divChk5">
														
															<span id="spanChk5" ></span>
															<input type="checkbox" id="chk5" 
																name="selectedOptions" />
														<span id="lblChk5"></span>
														<!-- <label id="lblChk5" style="line-height: 15px !important"></label> -->
													</div>
												
													<div class="col-md-4" id="divChk6">
														
															<span id="spanChk6" ></span>
															<input type="checkbox" id="chk6" 
																name="selectedOptions" />
														<span id="lblChk6"></span>
														<!-- <label id="lblChk6"></label> -->
													</div>
												
													<div class="col-md-4" id="divChk7">
														
															<span id="spanChk7" ></span>
															<input type="checkbox" id="chk7" 
																name="selectedOptions" />
														<span id="lblChk7"></span>
														<!-- <label id="lblChk7"></label> -->
													</div>
													
													<div class="col-md-4" id="divChk8">
														
															<span id="spanChk8" ></span>
															<input type="checkbox" id="chk8" 
																name="selectedOptions" />
														<span id="lblChk8"></span>
														<!-- <label id="lblChk8"></label> -->
													</div>
													<div class="col-md-4" id="divChk9">
														
															<span id="spanChk9" ></span>
															<input type="checkbox" id="chk9" 
																name="selectedOptions" />
														<span id="lblChk9"></span>
														<!-- <label id="lblChk9"></label> -->
													</div>
													
													
													
													</div>
												
                    
                    
                      <div id="questionTypeOption" class="mon_house_exp_bx">


												
													<div class="col-md-4" id="divOption1">
														
															<span id="spanOption1" ></span>
															<input type="radio" id="option1" name="selectedOptions"/>
														
														<span id="lblOption1"></span>
														<!-- <label id="lblOption1"></label> -->
													</div>
													
													<div class="col-md-4" id="divOption2">
														
															<span id="spanOption2"></span>
															<input type="radio" id="option2" name="selectedOptions"/>
														
														<span id="lblOption2"></span>
														<!-- <label id="lblOption2"></label> -->
													</div>
													
													<div class="col-md-4" id="divOption3">
														
															<span id="spanOption3" ></span>
															<input type="radio" id="option3" name="selectedOptions" />
														
														<span id="lblOption3"></span>
														<!-- <label id="lblOption3"></label> -->
													</div>
													
													<div class="col-md-4" id="divOption4">
														
															<span id="spanOption4"></span>
															<input type="radio" id="option4" name="selectedOptions"/>
														
														<span id="lblOption4"></span>
														<!-- <label id="lblOption4"></label> -->
													</div>
																										
													<div class="col-md-4" id="divOption5">
														
															<span id="spanOption5"></span>
															<input type="radio" id="option5" name="selectedOptions" />
														
														<span id="lblOption5"></span>
														<!-- <label id="lblOption5"></label> -->
													</div>
													
													<div class="col-md-4" id="divOption6">
														
															<span id="spanOption6"></span>
															<input type="radio" id="option6" name="selectedOptions"/>
														
														<span id="lblOption6"></span>
														<!-- <label id="lblOption6"></label> -->
													</div>
												
													<div class="col-md-4" id="divOption7">
														
															<span id="spanOption7" ></span>
															<input type="radio" id="option7" name="selectedOptions"/>
														
														<span id="lblOption7"></span>
														<!-- <label id="lblOption7"></label> -->
													</div>
													
													<div class="col-md-4" id="divOption8">
														
															<span id="spanOption8" ></span>
															<input type="radio" id="option8" name="selectedOptions"/>
														
														<span id="lblOption8"></span>
														<!-- <label id="lblOption8"></label> -->
													</div>
													
													<div class="col-md-4" id="divOption9">
														
															<span id="spanOption9"></span>
															<input type="radio" id="option9" name="selectedOptions"/>
														
														<span id="lblOption9"></span>
														<!-- <label id="lblOption9"></label> -->
													</div>
													




											</div>
                  </div>
                  </div>
                </li>
              </ul>
            </div>
         </div>
        </form>
			<div class="wizard-actions">
				<!-- #section:plugins/fuelux.wizard.buttons -->
				<button class="btn-primary btn-xs btn fl" id="prev">
					<i class="ace-icon fa fa-arrow-left"></i> Prev
				</button>

				<button class="btn-primary btn-xs btn fr" id="next">
					Next <i class="ace-icon fa fa-arrow-right icon-on-right"></i>
				</button>

				<!-- /section:plugins/fuelux.wizard.buttons -->
			</div>
		</div>
      <!-- DC submenu Ends--> 
      
    </section>
    <div class="clr"></div>
    
    <!-- end of "inner-contents" id --> 
  </div>
  <!-- end of "contents" id -->
  
  
<div class="modal"><!-- Place at bottom of page --></div>
<!-- End of "wrapper" id -->
<script>
  var test=0;
  	bindQuestions(data1[index]);
  	if(test==0){
  		$("#0").addClass('active');
  		test++;
  	}
</script>
  
