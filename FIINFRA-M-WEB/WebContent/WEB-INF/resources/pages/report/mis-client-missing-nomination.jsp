<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@page import="in.fiinfra.partner.controller.PartnerProfileController"%>
<%@page import="in.fiinfra.common.diy.models.UserSession"%> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
        <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <!--<meta name="viewport" content="width=device-width,initial-scale=1">-->
        <meta name="viewport" content="width=1024">
        <title>MIS CLient Missing Nomination</title>
         <script src="<%=request.getContextPath()%>/resources/js/common/common.js"></script>
        <script src="<%=request.getContextPath()%>/resources/js/report.js"></script>
       
  <%--       
             <% 
UserSession user = (UserSession) request.getSession().getAttribute("userSession");
   String theme = PartnerProfileController.getThemePath(user);
%>
<%if(theme != null){ %>
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/theme/<%=theme %>" />
<%} %> --%>

        <!-- Filter section toggle starts -->
        <script>
        $(document).ready(function(){
        	 $('.common_in_content').slimScroll();
        $(".backButtonId").append('<a href="javascript:history.back()" class="backButton"><span class="view_back">Back</span></a>');
          $("#mis_reports_box .div_dragger").click(function(){          
           $("#client_holding_reort_filter").slideToggle("slow");
            $(".div_dragger span").animate("slow").toggleClass("div_dragger_up","slow");
            if($(".div_dragger span").hasClass("div_dragger_up"))
            {
             $("#client_holding_reort_filter #statusSelectBoxIt .selectboxit-text").text("Status");
             $("#client_holding_reort_filter #typeSelectBoxIt .selectboxit-text").text("Type");
             $("#client_holding_reort_filter #sourceSelectBoxIt .selectboxit-text").text("Source");
            $("#client_holding_reort_filter .common_input").val("");
            }
          });
        });
        </script>
        <!-- Filter section toggle ends -->
		<!-- Custom Selectbox starts -->
		<script>
$(document).ready(function(){
  	$( "#tabs" ).tabs();
	$(function() {
     $( ".datepicker" ).datepicker({
	  dateFormat: "dd-M-yy",
      showOn: "button",
	  buttonText: '',
	  changeMonth: true,
      changeYear: true
     });
	  $( ".ui-datepicker-trigger" ).wrap( "<div class='datepicker-trigger-parent'></div>" );
  });
  
    $("select").selectBoxIt();
	 // Calls the selectBoxIt method on your HTML select box
	 
 
});
</script>
		<!-- Custom Selectbox Ends -->

        </head>

        <body>
        <jsp:include page="../chat/common_popup.jsp" />
<!-- Wrapper starts-->
<div class="" id="mis_reports"> 
          <!-- Main starts-->
          
          <section class="main"> 
    <!-- Header Starts-->
    
    <!-- Header Ends--> 
    
    <!-- Common_content Starts-->
    <section class="content common_content">
    <input  type="hidden" id="abc"   placeholder="Quick Search" style="width: 300px;">
          <%--  <jsp:include page="../layout/submenu_small.jsp"></jsp:include> --%>
              <!-- Common_in_contnet starts-->
              <section id="mis_reports_box" class="in_content common_in_content clearfix mis_reports_bx_in">
        <div id="client_holding_reort_filter">
                  <ul class="reset clearfix parameters">
            <li class="first"><label class="fl"> Client Name</label>
               <input type="text" class="common_input" id="quickSearch" onkeyup="getContactList(event)" placeholder="Quick Search"/>
               <input type="hidden" class="common_input" id="quickSearchHidden"  placeholder="Quick Search"/>
                    </li>
                  </ul>
                  
              <div class="space"></div>
              <ul class="col-lg-3 col-lg-offset-9">
                   <li class="seven btn-group">
                       <input type="submit" value="Search" class="btn btn-pink" onclick="getAdvisorWiseClientFolioMissingNomination(${sessionScope.userSession.partyId})">
                    </li>
           </ul>
          
                  
                  <div class="clr"></div>
                </div>
        <div class="div_dragger"><span></span></div>
        
        
        <!--Container Starts-->
         <!--Container Starts-->
        <div id="downloadOptions" align="right" style="display: none;margin-right: 30px;">
			
					<br><br>
					<%-- Download Report as:
					 <a class="pdficon" title="Download in Pdf" alt="Download in Pdf"href="#" onclick="downClientFolioMissNom('pdf',${sessionScope.userSession.partyId})"></a>
					 <a class="excelicon" title="Download in Excel" alt="Download in Excel"href="#" onclick="downClientFolioMissNom('xls',${sessionScope.userSession.partyId})"></a>
					 <a class="docicon" title="Download in Doc" alt="Download in Doc" href="#" onclick="downClientFolioMissNom('doc',${sessionScope.userSession.partyId})"></a>
				 --%></div>
        <div id="reportview" style="margin-top: 50px;">
        <div id="gen2"></div>
			

		</div>
                
        <!--Container Ends-->
                
      </section>
              <!-- Common_in_contnet ends-->
              <div class="overlay"></div>
            </section>
    <!-- Common_content Ends--> 
    
  </section>
          <!-- Main ends--> 
        </div>
<!-- Wrapper ends-->

<script>
var partyId=0;
$(function() {
	  $(document).ajaxStop(function() {
			closePopupWebApp('');
		});

		$(document).ajaxStart(function() {
			openPopupWebApp('centerLoadingImage', 25, 35);
		});
})


function validate(e){
// 	if($('#quickSearchHidden').val()==0){
// 		$("#successDialog").html("Please enter valid Client Name.");
//  		$( "#successDialog").dialog( "open" );	
// 		e.preventdefault();
// 	}
}


function getAdvisorWiseClientFolioMissingNomination(partyid){
	
    var ClientpartyId = $('#quickSearchHidden').val();
		var partnerId = partyid;
	
	if ((ClientpartyId == '')||(ClientpartyId == 'NULL'))
    {
		ClientpartyId=0;
    } 
	
	
var reportLink= $('#abc').val();
url =reportLink+"AdvisorWiseClientFolioMissingNomination&rs:Command=Render&rc:Parameters=false&partnerId="+partnerId+"&partyId="+ClientpartyId+"&loggedpartyId="+partnerId+"";
var reportview2 = "<iframe src="+url+" width='1010' height='840'></iframe>";

$("#gen2").html(reportview2); 

}

$(document).ready(function(){

    $.ajax({
           type :'GET',
        url : $('#contextPath').val() +"/report/urlForReport.htm",
           success : function(result)
           {
                  $('#abc').val(result);
                 
                
      }
      });
  });

function reset(){
	$('#quickSearchHidden').val(0);
	$('#quickSearch').val('');
}

</script>
</body>
</html>
