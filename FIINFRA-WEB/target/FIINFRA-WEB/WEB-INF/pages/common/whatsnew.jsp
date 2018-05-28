<!DOCTYPE html> 
<html lang="en"><head>
<link href="<%=request.getContextPath()%>/images/favicon.ico" rel="shortcut icon">
<title>What's New</title>

<script type="text/javascript">
var $j = jQuery.noConflict();
$j(document).ready(function(){	
	var allPanels = $j('.query > .answer').hide();		
	$j('.query > .question > .q-block2').click(function() {		
		//allPanels.slideUp();		
		$j(this).parent().next().toggle();		
		return false;
	});	
});
</script>

</head>
<body>
<jsp:include page="header.jsp" />
	
 <!-- Center part start -->
 <section>
 
     
    <div class="">
	  	<div class="container-body">
        <!-- center -->
       <div class="page-header">
							<h1>
								What's New
								
							</h1>
						</div>
        <div class=" col-md-3 sidebar-offcanvas" role="navigation" style="margin-top:20px;">
            <div class="list-group">
                <a class="list-group-item active" href="#">New</a>
                <a class="list-group-item" href="#ReleaseNotes"> Release 3.0 Mega Launch </a>
                       	</div>
       
        
     </div>
<div class="col-md-9"  style="margin-top:20px; padding-bottom:20px;">
	<div>
		  <div class="faq">
    
             <div class="query">				          
           <div class="list-group">
           <a class="list-group-item active" id="ReleaseNotes">Release 3.0 Mega Launch</a>
           
           
           <div class="list-group-item">
           <div class="query">
            	<div class="question">
                <div class="q-block2" alt="Release 3.0 Mega Launch" title="Release 3.0 Mega Launch">Release 3.0 Mega Launch </div>            	                	
                	&nbsp;&nbsp;<a href="<%=request.getContextPath()%>/releaseNotes.htm"  target="_blank"> Release 3.0 Notes</a>
                                          	 
                </div>
            
                <div style="display: none;" class="answer">
                  <div class="q-answer1">
					
											
						
						
	              </div>
                 </div>
           </div>
           
           </div>
           
           </div>
           
         </div>   
      </div>    
       
      </div>
       </div>
       
         <br/>  <br/>
       	</div>
      </div>
	      </section>
<!-- Center part End -->          

<jsp:include page="../common/footer.jsp" />

</body>
</html>