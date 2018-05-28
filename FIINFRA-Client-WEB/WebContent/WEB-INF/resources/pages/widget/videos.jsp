<%-- <script>
$( "#video_first_dialog .bxslider" ).addClass("clearfix");
$("#login #media .video").click(function(){
		 $(".overlay").fadeIn();
		 $("#video_first_dialog").animate("slow").css("visibility","visible");
		$("#video_first_dialog iframe").animate("slow").css("display","block");
	 
		$("#video_first_dialog .close").click(function(){
     		$(".overlay").fadeOut("slow");
			$ ("#video_first_dialog iframe").animate("slow").css("display","none");
			$("#video_first_dialog").animate("slow").css("visibility","hidden");
  		});
   });
$("#video_first_dialog .video_parent").click(function(){
	var x=$(this).find('iframe').attr("src");
	var y=x.replace("&controls=0&showinfo=0&modestbranding=1","");
	$("#video_dialog iframe").attr("src",y);
	$("#video_dialog").show();
});

$("#video_dialog .close").click(function(){
 	$("#video_dialog").hide();
  	$("#video_dialog iframe").attr("src","");
});

$('#video_first_dialog').find('iframe').each(function(){
	var url = $(this).attr("src");
  	$(this).attr("src",url+"?wmode=transparent&controls=0&showinfo=0&modestbranding=1");
	$(this).attr("wmode","Opaque");
	}); 
</script>
<ul>
                    	<li><iframe width="220" height="125" style="margin:15px 0px 0px 5% ;" src="//www.youtube.com/embed/FukN2rgY6fs?list=PLEhtzo1XHPL14G3WfYJDbV4Vjys11Vi1u" frameborder="0" allowfullscreen></iframe>
                    	</li>
						<li><iframe width="220" height="125" style="margin:15px 0px 0px 5% ;" src="//www.youtube.com/embed/0d30lAgu7kA?list=PLEhtzo1XHPL14G3WfYJDbV4Vjys11Vi1u" frameborder="0" allowfullscreen></iframe></li>
						<li><a class="fr video box" href="#" id="opener" class="more_video">see more...</a></li>						
 </ul>

<script>
  $(function() {
	  var myPos = [ $(window).width() / 5, 10 ];
	  
    $( "#video_dialog" ).dialog({
      autoOpen: false,
      width:900,
      title: 'Videos',
      position: myPos,
      show: {
        effect: "blind",
        duration: 1000
      },
      hide: {
        effect: "explode",
        duration: 1000
      }
    });
 
    $( "#opener" ).click(function() {
      $( "#video_dialog" ).dialog( "open" );
    });
  });
  </script>                  
                  
<div id="video_dialog" class="common_custom_modal"><!--  <span class="close">X</span> -->
  <div class="modal_content">
  	<div style="margin:  auto 0;">
    <iframe width="257" height="160" src="//www.youtube.com/embed/eogk7bYdfG4" frameborder="0" allowfullscreen></iframe>
    <iframe width="257" height="160" src="//www.youtube.com/embed/hiPKU6k0u0Q" frameborder="0" allowfullscreen></iframe>  
    <iframe width="257" height="160" src="//www.youtube.com/embed/J9nT9t7tXx8" frameborder="0" allowfullscreen></iframe>
    </div> 
  </div>
</div>
<div id="video_first_dialog" class="common_custom_modal">
  <h3 class="modal_heading">Videos<span class="close">X</span></h3>
  <div class="modal_content">
    <ul class="bxslider">
   <li> <div class="thumb_slide clearfix">
      <a href="#" class="video_parent">
        <div class="video">
		<iframe width="197" height="98" src="//www.youtube.com/embed/eogk7bYdfG4" frameborder="0" allowfullscreen></iframe></div>
        <div class="desc">Building wealth - Have you hit your peak saving phase? Investor Education Video by Moneykraft</div>
      </a>
    
      <a href="#" class="video_parent">
        <div class="video"><iframe width="197" height="98" src="//www.youtube.com/embed/hiPKU6k0u0Q" frameborder="0" allowfullscreen></iframe></div>
        <div class="desc">Mutual Fund Constituents: Investor Education Video by Moneykraft</div>
      </a>
     
      <a href="#" class="video_parent">
        <div class="video"><iframe width="197" height="98" src="//www.youtube.com/embed/J9nT9t7tXx8" frameborder="0" allowfullscreen></iframe></div>
        <div class="desc">What is an Equity Fund? : Investor Education Video by Moneykraft</div>
      </a>
      <div class="btm">
        <div class="inner"> </div>
      </div>
    </div></li>
   
    </ul>
  </div>
</div>
<div class="video1">
   <a href="https://www.youtube.com/watch?v=kk_eU_Sirvc">
	<img
		src="${pageContext.request.contextPath}/resources/images/video.png" /></a>
</div>
<div class="video2">
  <a href="https://www.youtube.com/watch?v=939muCoVIy4">
	<img
		src="${pageContext.request.contextPath}/resources/images/video.png" /></a>
</div>
<a href="https://www.youtube.com/watch" class="more_video">see more...</a>
 --%>
 
 <div class="col-md-12 col-xs-12">
                <div class="space"></div>
                <div class="widget-box">
                      <div class="widget-header">
                    <h4 class="widget-title lighter smaller">Videos</h4>
                  </div>
                      <div class="widget-body">
                    <div class="widget-main no-padding">
                          <div class="row"><div class="col-md-4"><iframe frameborder="0" width="100%" height="auto" src="https://www.youtube.com/embed/watch?v=DNx-tgueYmQ&index=4&list=PLEhtzo1XHPL14G3WfYJDbV4Vjys11Vi1u"></iframe></div>
                          
                          <div class="col-md-4"><iframe frameborder="0" width="100%" height="auto" src="https://www.youtube.com/embed/watch?v=C61JSm6omTU&index=6&list=PLEhtzo1XHPL14G3WfYJDbV4Vjys11Vi1u"></iframe>

                          <!--<iframe frameborder="0" width="100%" height="auto" src="//www.youtube.com/embed/CQTJevJBDHM?list=PLEhtzo1XHPL14G3WfYJDbV4Vjys11Vi1u"></iframe>-->
                          </div>
                           <div class="col-md-4"><iframe frameborder="0" width="100%" height="auto" src="https://www.youtube.com/embed/watch?v=CQTJevJBDHM&index=1&list=PLEhtzo1XHPL14G3WfYJDbV4Vjys11Vi1u&showinfo=0"></iframe>

                          <!--<iframe frameborder="0" width="100%" height="auto" src="//www.youtube.com/embed/CQTJevJBDHM?list=PLEhtzo1XHPL14G3WfYJDbV4Vjys11Vi1u"></iframe>-->
                          </div>
                          </div>
                          <div > 
                        <!--<div class="pull-left">
                              <div style="padding:8px;">
                            <iframe frameborder="0" width="100%" height="" src="https://www.youtube.com/embed/watch?v=DNx-tgueYmQ&index=4&list=PLEhtzo1XHPL14G3WfYJDbV4Vjys11Vi1u"></iframe>
                          </div>
                            </div>--> 
                        <!--<div class="pull-left">
                            <div style="padding:8px;">  <iframe frameborder="0"  width="100%" height="" src="https://www.youtube.com/embed/watch?v=C61JSm6omTU&index=6&list=PLEhtzo1XHPL14G3WfYJDbV4Vjys11Vi1u"></iframe>
                            </div>  </div>  <div class="clearfix"></div>--> 
                        
                      </div>
                          <form>
                        <div class="form-actions clearfix">
                              <div class="input-group pull-right"> <a href="" class="">See More</a> </div>
                            </div>
                      </form>
                        </div>
                    <!-- /.widget-main --> 
                  </div>
                      <!-- /.widget-body --> 
                    </div>
              </div>