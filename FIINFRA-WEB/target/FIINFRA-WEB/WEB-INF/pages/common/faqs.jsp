<!DOCTYPE html>
<html lang="en"><head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
<title>FAQ's</title>
 <!-- Just for debugging purposes. Don't actually copy this line! -->
    <!--[if lt IE 9]><script src="../../docs-assets/js/ie8-responsive-file-warning.js"></script><![endif]-->

    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
      <script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
    <![endif]-->
 <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
<!--<script src="js/jquery-1.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/bootstrap-responsive.js"></script>
<script src="js/bootstrap-responsive.min.js"></script>
<script src="js/bootstrap.js"></script>
<script src="js/holder.js"></script>
<script
	src='https://ajax.googleapis.com/ajax/libs/jquery/1.4/jquery.min.js'></script>
-->


<!-- -responsive css-->
<!--<link href="css/bootstrap.css" rel="stylesheet">
<link href="css/carousel.css" rel="stylesheet">
<link type="text/css" rel="stylesheet" href="css/popup.css" />
--><!-- -responsive css
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.5.1/jquery.min.js"></script>-->
<!--<script type="text/javascript" src="js/pop.js"></script>
<script src="<%=request.getContextPath()%>/js/jquery-1.9.1.js"></script>
<script src="<%=request.getContextPath()%>/js/jquery.ui.core.js"></script>
<script src="<%=request.getContextPath()%>/js/jquery.ui.widget.js"></script>
<script src="<%=request.getContextPath()%>/js/jquery.min.js"></script>
<link href="https://myffreedom.in/FFreedom_Portalimages/favicon.ico"
	rel="shortcut icon"><script src="<%=request.getContextPath()%>/js/jquery.ui.widget.js"></script>

<link href="https://myffreedom.in/FFreedom_Portalimages/favicon.ico" rel="shortcut icon">
-->
<style type="text/css">
.question{
cursor: pointer;
}
</style>
<jsp:include page="header.jsp" />
<!--[if IE]>
		<script src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script>
	<![endif]-->

<!--[if lt IE 9]>
	<script src="http://ie7-js.googlecode.com/svn/version/2.1(beta4)/IE9.js"></script>
	<![endif]-->
<script type="text/javascript">
 // var $ = jQuery.noConflict();
jQuery(document).ready(function(){
	viewFaqs();
	var allPanels = $('.query > .answer').hide();
	$('.query > .question > .q-block2').click(function() {
		allPanels.slideUp();
		$(this).parent().next().slideDown();
		return false;
	});
	/*$('.query .question').click(function() {
		$('.query > .question > .q-block2').css( "background", "" );
		$(this).css( "background", "#DCE9F8" );
		return false;
	});*/
});
</script>
<script>

function viewFaqs(){
	//alert('hh');
	$.ajax({
		type : 'GET',
		url : $('#contextPath').val()+"/faqs/getFaqsQuestionsList.htm",
		success : function(result){
			
			$('#faqListDiv').empty();
			$('#faqsModules').empty();			
			$('#faqsModules').append('<a class="list-group-item active" href="#">All FAQs</a>');	
			var currentModuleId=0;
// 			var firstModuleId=0;
			var j=0;
			$(result).each(
					function(i, obj) {		
			var FaqModuleId=obj.faqModuleID; 
			var FaqQuestionModuleName=obj.faqQuestionModuleName;
			var faqQuestion=obj.faqQuestion;
			var faqAnswer=obj.faqAnswer;
// 			if(firstModuleId==0)
// 				firstModuleId=FaqModuleId;
			if(currentModuleId!=FaqModuleId){
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
		$('#query'+FaqModuleId).append('<div id="accordion'+FaqModuleId+'" class="accordion-style1 panel-group"></div>');			
		
			//$('#accordion'+FaqModuleId).append('<div class="panel panel-default"><div class="panel-heading"><h4 class="panel-title"><a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion'+FaqModuleId+'" href="#collapseOne" aria-expanded="true"> <i class="bigger-110 ace-icon fa fa-angle-down" data-icon-hide="ace-icon fa fa-angle-down" data-icon-show="ace-icon fa fa-angle-right"></i><div class="question"> <div class="q-block">Q. '+(j+1)+'. </div> <div class="q-block2" alt="click to see answer" title="click to see answer">'+faqQuestion+'</div></div></a></h4></div><div class="panel-collapse collapse" id="" aria-expanded="false"><div class="panel-body"><div class="answer"> <div class="q-answer">A. </div> <div class="q-answer1">'+faqAnswer+'</div></div></div></div>');			
			$('#accordion'+FaqModuleId).append('<div class="panel panel-default"><div class="panel-heading"><h4 class="panel-title"><a style="padding:10px 5px" class="accordion-toggle normTxt clearfix" data-toggle="collapse" data-parent="#accordion'+FaqModuleId+'" href="#'+FaqModuleId+(j+1)+'" aria-expanded="false"> <div class="fl"><i style="width:16px" class="bigger-110 ace-icon fa fa-angle-right" data-icon-hide="ace-icon fa fa-angle-down" data-icon-show="ace-icon fa fa-angle-right"></i> Q. '+(j+1)+'.</div> <div class="fl westspace2" style="width:90%">'+faqQuestion+'</div></a></h4></div><div class="panel-collapse collapse" id="'+FaqModuleId+(j+1)+'" aria-expanded="false"><div class="panel-body"><div class="answer"> A. '+faqAnswer+'</div></div></div>');
			j+=1;			
		});
			//$('#footerTop').append('<div class="top"><a href="#homeLink">Top</a></div>');
// 			showFaqs(firstModuleId);
			/*var allPanels = $('.query > .answer').hide();
			$('.query > .question > .q-block2').click(function() {				
// 				allPanels.slideUp();
				$(this).parent().next().toggle();
				return false;
			});*/
			/*$('.accordion-style1').collapse({
				  toggle: true
				})*/


		}
	});
}

function showFaqs(id){
	$('.faqs').hide();
	$('div[name="'+id+'"]').show();
}
</script>

</head>
<body>

 <!-- Center part start -->
 <section>

    <div class="">
    	
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

<jsp:include page="footer.jsp" />

</body>
</html>