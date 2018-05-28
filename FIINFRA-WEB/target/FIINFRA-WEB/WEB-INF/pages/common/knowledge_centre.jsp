<!DOCTYPE html>
<html lang="en">
<head>
<title>Knowledge Centre</title>
<script type="text/javascript">
var file_url;

$j(document).ready(function(){		
	viewKnowledgeCenter();	
});

function viewKnowledgeCenter(){		
	$.ajax({						
		type : 'GET',
		url : $('#contextPath').val()+'/KnowledgeCentre.xml',	
		dataType: "xml",
	       success: function(xml) {	    	  
	        	$(xml).find('BU').each(function(i,obj){
	        		var buId= $(this).attr('ID');
	        		if(buId==1){
	        			
	        			$(obj).find('knowledge_center').each(function(i,obj){
	        			
	        				   var title = $(this).find('title').text();
	        				   var description = $(this).find('description').text();
	        				    file_url = $(this).find('file_url').text();
	        				
	        				   
 	        				  $("#processFlowTitle").html(title);
 	        				  $('#processFlowImg').attr('src',$('#contextPath').val()+'/images/'+file_url)	;	
 	        				 	
	        			   });
	        		}
	        		else{
	        			
	        		}
	        	});       		
		}
		
	});
}

</script>

<!--[if IE]>
		<script src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script>
	<![endif]-->

<!--[if lt IE 9]>
	<script src="http://ie7-js.googlecode.com/svn/version/2.1(beta4)/IE9.js"></script>
	<![endif]-->

</head>
<body>
<jsp:include page="header.jsp" />
        <div class="container">
          <div class="container-head"> Knowledge Centre </div>
          <div class="container-body"> 
            <!-- center -->
            
            <div class=" col-md-3 sidebar-offcanvas" role="navigation" style="margin-top:20px;">
              <div class="list-group"> <a class="list-group-item active" href="#">Knowledge Centre</a> <a class="list-group-item" href="#processFlowTitle"> Process Work Flow</a> </div>
            </div>
            <div id="KCImage">
              <div class="col-md-9"  style="margin-top:10px; padding-bottom:20px;">
                <div class="faq">
                  <h5 id="processFlowTitle"></h5>
                  <div class="query"> <img src="" id="processFlowImg" class="img-responsive"> </div>
                </div>
              </div>
            </div>
            <div class="top" style="margin-bottom: 10px;"><a href="#processFlowTitle">Top</a></div>
            <br/>
            <br/>
          </div>
        </div>
        
        <!-- Center part End -->
        
        <jsp:include page="../common/footer.jsp" />

</body>
</html>