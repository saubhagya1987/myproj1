<!DOCTYPE html>
<html lang="en"><head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
<title>FAQ's</title>
 



<script>

function viewFaqs(){
	//alert('hh');
	$.ajax({
		type : 'GET',
		url : $('#contextPath').val()+"/faq/loadFaqListsAdmin1.htm",
		success : function(result){
			
			$('#faqListDiv').empty();
			$('#faqsModules').empty();			
			$('#faqsModules').append('<a class="list-group-item active" onclick="reloads()">All FAQs</a>');	
			var currentModuleId=0;
			var firstModuleId=0;
			var j=0;
			$(result).each(
					function(i, obj) {		
			var FaqModuleId=obj.faqModuleID; 
			var FaqQuestionModuleName=obj.codeValue;
			var faqQuestion=obj.faqQuestionText;
			var faqAnswer=obj.faqAnswerText;
	 	 	if(currentModuleId!=FaqModuleId)
			{
				j=0;
			}
			currentModuleId=FaqModuleId;
			if($('#'+FaqModuleId).html()==undefined || $('#'+FaqModuleId).html()==null){
				$('#faqsModules').append('<a id="'+FaqModuleId+'"  onclick="showFaqs(id)" class="list-group-item"><strong>'+FaqQuestionModuleName+'</strong></a>');
				if(i==0){
					$('#faqListDiv').append('<div class="list-group nomargin"><a class="list-group-item active">FAQs</a><div class="faq faqs list-group-item" id="'+FaqModuleId+'" name="'+FaqModuleId+'"> <h5 class="strong">'+FaqQuestionModuleName+'</h5> <div class="query" id="query'+FaqModuleId+'"> </div></div>');
					
				}else{
					$('#faqListDiv').append('<div class="faq faqs list-group-item nomargin" id="'+FaqModuleId+'" name="'+FaqModuleId+'" > <h5 class="strong">'+FaqQuestionModuleName+'</h5> <div class="query" id="query'+FaqModuleId+'"></div>');				
// 					$('#query'+FaqModuleId).append('<div class="top"><a href="#homeLink">Top</a></div>');
					
				}				
				
				
			}	
			//.accordion-style1.panel-group .panel-heading .accordion-toggle.collapsed
			/* $('#query'+FaqModuleId).append('<div class="accordion-style1.panel-group"> <div class="accordion-style1.panel-group">Q. '+(j+1)+'. </div> <div class="q-block2" alt="click to see answer" title="click to see answer">'+faqQuestion+'</div></div> <div class="answer"> <div class="q-answer">A. </div> <div class="q-answer1">'+faqAnswer+'</div></div>'); */
			
			 $('#query'+FaqModuleId).append('<div  id="accordion" class="accordion-style1 panel-group"> Q. '+(j+1)+'. <div class="panel panel-default"><div class="panel-heading"><h4 class="panel-title"> <a class="accordion-toggle collapsed" data-toggle="collapse" data-parent="#accordion" href="#'+FaqModuleId+'a'+(j+1)+'"><i class="ace-icon fa fa-angle-right bigger-110" data-icon-hide="ace-icon fa fa-angle-down" data-icon-show="ace-icon fa fa-angle-right"></i>'+faqQuestion+'</a></h4></div> </div> <div class="panel-collapse collapse in  " id="'+FaqModuleId+'a'+(j+1)+'">A.  <div class="panel-body ">'+faqAnswer+'</div></div></div>'); 
			
				/* <a class="accordion-toggle collapsed" data-toggle="collapse" data-parent="#accordion" href="#collapseTwo">
				<i class="ace-icon fa fa-angle-right bigger-110" data-icon-hide="ace-icon fa fa-angle-down" data-icon-show="ace-icon fa fa-angle-right"></i>
				&nbsp;Group Item #2
			</a>
			 */
			

			
			
			
			
			
			
			
			
			
			
			
			j=j+1;
			
			 
			 
			 //$('#'+FaqModuleId+'a'+(j+1)).hide();
			 
		});
			$('#footerTop').append('<div class="top"><a href="#" onclick="tops();">Top</a></div>');
			/* var allPanels = $('.query > .panel-collapse collapse in > .panel-body').hide(); */
			
			
			
		/* 	
			$('.query > .question > .q-block2').click(function()
					{				
// 				allPanels.slideUp();
				$(this).parent().next().toggle();
				return false;
			}); */
			/*$('.accordion-style1').collapse({
				  toggle: true
				})*/


		}
	});
	
	
}

function tops()
{
	 $("#footerTop").scrollTop();
}
function showFaqs(id){
	$('.faqs').hide();
	$('div[name="'+id+'"]').show();
}
function showFaqs1()
{
	viewFaqs();
}
function reloads()
{
	location.reload();
}
</script>

</head>
<body>
<jsp:include page="../common/header.jsp" />
 
 




    <div class="container">
    	
        <div class="page-header clearfix">
            <h1 class="pull-left">FAQ's</h1>
            
          </div>
	  	<div class="container-body">
        <!-- center -->
       
	   <div class=" col-md-3 sidebar-offcanvas"   role="navigation" style="margin-top:20px;">
            <div class="list-group" style="padding-left:10px;" id="faqsModules">
            </div>               
     	</div>
        
        
        
        
        
        
        <div class="col-md-9" style="margin-top:20px; padding-bottom:20px;" id="faqListDiv">
        
        
		<div>

      </div>
       </div>
      	<div class="col-md-9" style="margin-top:-20px; margin-left: 270px; padding-bottom:10px;" id="footerTop"></div>
         <br/>  <br/>
       	</div>
       	<br/>       	
      </div>
      
<!-- Center part End -->          









	<footer>
	  <jsp:include page="../common/footer.jsp" />

	</footer>
</body>

<script type="text/javascript">
 
jQuery(document).ready(function(){
	viewFaqs();
	var allPanels = $('.accordion-style1 panel-group > .panel-collapse collapse in  ').hide();
/* 	$('.query > .question > .q-block2').click(function() {
		allPanels.slideUp();
		$(this).parent().next().slideDown();
		return false;
	}); */
	
});
</script>
</html>