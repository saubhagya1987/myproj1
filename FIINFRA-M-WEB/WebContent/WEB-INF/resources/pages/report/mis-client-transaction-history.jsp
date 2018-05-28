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
<title>MIS Client Transaction History</title>
 <script src="<%=request.getContextPath()%>/resources/js/common/common.js"></script>
        <script src="<%=request.getContextPath()%>/resources/js/report.js"></script>
<%--         <script src="<%=request.getContextPath()%>/resources/js/ jquery-1.7.1.js"></script> --%>
       
        
             <% 
UserSession user = (UserSession) request.getSession().getAttribute("userSession");
   String theme = PartnerProfileController.getThemePath(user);
%>
<%if(theme != null){ %>
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/theme/<%=theme %>" />
<%} %>

<!-- Filter section toggle starts -->
<script>
        $(document).ready(function(){
		 $(".wrapper").addClass('client_transaction_history');	
		 $('.common_in_content').slimScroll();
		 $(".backButtonId").append('<a href="javascript:history.back()" class="backButton"><span class="view_back">Back</span></a>');
          $("#mis_reports_box .div_dragger").click(function(){
           $("#client_holding_reort_filter").slideToggle("slow");
		    $(":selectBox-selectBoxIt").each(function(){
              $(this).data('selectBox-selectBoxIt').refresh();
             });
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
	  dateFormat: "dd-mm-yy",
      showOn: "button",
	  buttonText: '',
	  changeMonth: true,
      changeYear: true
     });
	  $( ".ui-datepicker-trigger" ).wrap( "<div class='datepicker-trigger-parent'></div>" );
  });
  
   
	 // Calls the selectBoxIt method on your HTML select box
	 
 
});
</script>
<!-- Custom Selectbox Ends -->
<style>
.none{
display: none;
}
</style>
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
            <li class="first">
              <label class="fl"> Client Name</label>
              <input type="text" class="common_input" id="quickSearch" onkeyup="getContactList(event);" onblur="addCompanyId(); addInvestorStartDate();" onclick="setval();" placeholder="Quick Search"/>
              <input type="hidden" class="common_input" id="quickSearchHidden"    placeholder="Quick Search"/>
            </li>
          </ul>
          <div class="row">
          	   <div class="col-xs-12">
          <ul class="reset clearfix parameters spacing">
            <li class="col-xs-3">
              <label class="">Company Name</label>
              <select name="companyId" id="companyId"  class="selectboxit-text" onclick="addProductId();"><option>---All---</option></select>
            </li>
            
             <li class="col-xs-3">
              <label class="">Product Name</label>
              <select name="productId" id="productId"  class="selectboxit-text" onchange="addInvestorStartDate();"><option>---All---</option></select>
            </li>
            <li class="col-xs-3">
              <label class="">Start Date</label>
              <input type="text" class="common_input5 datepicker" name="Startdatename" id="from" placeholder="dd/mmm/yyyy"  disabled>
            </li>
            <li class="col-xs-3">
              <label class="">End Date</label>
              <input type="text" class="common_input5 datepicker" name="Enddatename" id="to" placeholder="dd/mmm/yyyy"  disabled>
            </li>
           
          </ul>
          </div>
          </div>
          
          
        
          
          
          
          
          
          
          
        <%--   <ul class="reset clearfix action">
            <li>
              <input type="reset" class="common_btn" onclick="reset()">
            </li>
            <li>
              <input type="submit" value="Search" class="common_btn" onclick="validate(event);getAdvisorWiseTransactionStatement(${sessionScope.userSession.partyId},${sessionScope.nodeId})">
            </li>
          </ul> --%>
          
           <div class="space"></div>
      <ul class="col-lg-3 col-lg-offset-9">
             <li class="btn-group">
				<input type="submit" value="Search" class="btn btn-pink" id="searchBtn" onClick="validate(event);getAdvisorWiseTransactionStatement(${sessionScope.userSession.partyId},${sessionScope.nodeId})"/>
              </li>
                <li class="btn-group"> 
              <input type="button" value="Reset" class="btn btn-pink" onclick="reset()"> 
                  </li>                     
      </ul>  
    
          <div class="clr"></div>
        </div>
        <div class="div_dragger"><span></span></div>
        
        <!--Container Starts-->
        <div id="downloadOptions" align="right" style="display: none;margin-right: 30px;">
			
					<br><br>
					</div>
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
<script>
/* var partyId=0;
var selectBox;
var fullDate = new Date();console.log(fullDate);
var twoDigitMonth = ((fullDate.getMonth().length) == 1)? '0'+(fullDate.getMonth()+1) :  (fullDate.getMonth()+1);
var twoDigitDate = fullDate.getDate()+"";if(twoDigitDate.length==1) twoDigitDate="0" +twoDigitDate;
var currentDate = twoDigitDate + "-" + twoDigitMonth + "-" + fullDate.getFullYear();console.log(currentDate);
var toDate = twoDigitDate + "-" + twoDigitMonth + "-" + (fullDate.getFullYear()-1);
$(function() {
	  $(document).ajaxStop(function() {
			closePopupWebApp('');
		});

		$(document).ajaxStart(function() {
			openPopupWebApp('centerLoadingImage', 25, 35);
		});
		$.ajax({
	          type: "POST",
	         // url: $('#contextPath').val()+'/birtReport/getCodeValueDescription.htm',
	         url:$('#contextPath').val() +"/report/getCompanyId.htm?partyid='+$('#quickSearchHidden').val()",
	          dataType: 'json',
	          contentType: 'application/json',
	             success:function(result)
	          { 
	            //result = JSON.parse(result);
	            //alert('result='+result);
	           
	            $(result).each(function(i, obj) 
	            		{
	            	var module=obj.lastName;
            		var moduleid=obj.partyID;
	          
	   
	              $('#companyId').append('<option value="'+ moduleid+'">'+ module + '</option>');
	            	
	            		});
	            
	            
	           var abc=$('#companyId').val();
	        	if(abc==0)
	        		{
	        		$('#productId').empty();
	        		$('#productId').append('<option value="0">---All---</option>');
	        		}
	        	else
	        		{
	            
	            $.ajax
	  	      ({
	  	                  
	  	          type: "POST",
	  	         // url: $('#contextPath').val()+'/birtReport/getCodeValueDescription.htm',
	  	         url:$('#contextPath').val() +"/report/getProductId.htm?compartyid='+$('#companyId').val()+"&partyid="+$('#quickSearchHidden').val()",
	  	          dataType: 'json',
	  	          contentType: 'application/json',
	  	             success:function(result)
	  	          { 
	  	            //result = JSON.parse(result);
	  	            //alert('result='+result);
	  	            $('#productId').empty();
	  	            $('#productId').append('<option value=0>Select Product Name</option>');
	  	            $(result).each(function(i, obj) 
	  	            		{
	  	            	var module=obj.productName;
	            		var moduleid=obj.productId;
	  				  
	            	
	            		$('#productId').append('<option value="'+ moduleid+'">'+ module + '</option>');
	  	            		});
	  	            
	  	            
	  	          
	  	          $("select").show();
	  	         selectBox= $("select").selectBoxIt();
	  			var fullDate = new Date();console.log(fullDate);
	  			var twoDigitMonth = ((fullDate.getMonth().length) == 1)? '0'+(fullDate.getMonth()+1) :  (fullDate.getMonth()+1);
	  			var twoDigitDate = fullDate.getDate()+"";if(twoDigitDate.length==1) twoDigitDate="0" +twoDigitDate;
	  			
 	  		
	  			
	  			var currentDate = twoDigitDate + "-" + twoDigitMonth + "-" + fullDate.getFullYear();console.log(currentDate);
	  			$('#to').val(currentDate);
	  			var toDate = twoDigitDate + "-" + twoDigitMonth + "-" + (fullDate.getFullYear()-1);
	  			$('#from').val(toDate);
	  	            
	  	          }
	  	       
	  	       });
	        		}
	          }
	       
	       });
})
 */
 
 
 function addCompanyId()
 {
 	
 	
 	//alert($('#quickSearchHidden').val());
 	//var id=$('#quickSearchHidden').val();
 	//alert(id);
    $.ajax
   ({
               
       Type: "POST",
       url:$('#contextPath').val()+'/report/getCompanyId.htm?partyid='+$('#quickSearchHidden').val(),
       dataType: 'json',
       contentType: 'application/json',
       success:function(result)
       { 
         //result = JSON.parse(result);
         
         $(result).each(function(i, obj){
         

	            //$('#companyId').empty();
	            //$('#companyId').append('<option value="0">All</option>');
	            
         		var module=obj.lastName;
         		var moduleid=obj.partyID;

           		$('#companyId').append('<option value="'+ moduleid+'">'+ module + '</option>');
           			
         	
         	});
         
       	}
    
    });
  
   
  }
 
 
 function addProductId()
 {
 	//alert($('#companyId').val());
 	//alert($('#quickSearchHidden').val());
 	//var id=$('#quickSearchHidden').val();
 	//alert(id);
 var abc=$('#companyId').val();
	if(abc==0)
		{
		$('#productId').empty();
		$('#productId').append('<option value="0">---All---</option>');
		}
	else
		{
 	
    $.ajax
   ({
               
       Type: "POST",
       url:$('#contextPath').val()+'/report/getProductId.htm?compartyid='+$('#companyId').val()+"&partyid="+$('#quickSearchHidden').val(),
       dataType: 'json',
       contentType: 'application/json',
       success:function(result)
       { 
         //result = JSON.parse(result);
         
         $(result).each(function(i, obj){
         

	            $('#productId').empty();
	            $('#productId').append('<option value="0">---Select Product Name---</option>');
	            
         		var module=obj.productName;
         		var moduleid=obj.productId;

           		$('#productId').append('<option value="'+ moduleid+'">'+ module + '</option>');
           			
         	
         	});
         
       	}
    
    });
  
		}
  }
 
 
 function addInvestorStartDate()
 {
 	//var abc=$('#productId').val();
 	//alert(abc);
 	//alert($('#quickSearchHidden').val());
 	
    $.ajax
   ({
               
       Type: "POST",
       url:'${pageContext.request.contextPath}/report/getInvestorStartDate.htm?productId='+$('#productId').val()+"&partyid="+$('#quickSearchHidden').val(),
       dataType: 'json',
       contentType: 'application/json',
       success:function(result)
       { 
         
         
         $(result).each(function(i, obj){
         

	            $('#from').empty();
	           
         		var module=obj.startDate;
         		
         		//alert("StartDate="+module);
         		
         		$('#from').val(module);
         		
         		
         	});
         
       	}
    
    });
		
  }
 
 
 $(function() {
	    $( "#from" ).datepicker({
	    	  dateFormat: "dd-mm-yy",
	      defaultDate: "+1w",
	     // changeMonth: true,
	      changeMonth: true,
	      changeYear: true,
	      numberOfMonths: 1,
	      yearRange:"1980:2025",
	      onClose: function( selectedDate ) {
	        $( "#to" ).datepicker( "option", "minDate", selectedDate );
	      }
	    });
	    $( "#to" ).datepicker({
	    	  dateFormat: "dd-mm-yy",
	      defaultDate: "+1w",
	      changeMonth: true,
	      changeYear: true,
	      changeMonth: true,
	      yearRange:"1980:2025",
	      onClose: function( selectedDate ) {
	        $( "#from" ).datepicker( "option", "maxDate", selectedDate );
	      }
	    });
	    
	    $(function() {
	        var date = new Date(); // replace with your date
	        $("#to").val(getCurrentDate());
	   });
	    
	    
	    $(function() {
	        var date = new Date(); // replace with your date
	        $("#from").val(getLastDate());
	   });
	  });
	  	  	  
function getCurrentDate(){
	  today_date = new Date();
	 // alert(today_date)

	  today_Date_Str = ((today_date.getDate() < 10) ? "0" : "") + String(today_date.getDate()) + "-" +((today_date.getMonth() < 9) ? "0" : "") + String(today_date.getMonth() + 1)+ "-" +today_date.getFullYear();
	  var last_Date_Str;	
	  last_Date_Str=((today_date.getDate() < 10) ? "0" : "") + String(today_date.getDate()) + "-" +((today_date.getMonth() < 9) ? "0" : "") + String(today_date.getMonth() + 1)+ "-" +String(today_date.getFullYear()-1);
		
	 // alert("Last year"+last_Date_Str)		
	  return today_Date_Str;
	}

	function getLastDate(){
		 today_date = new Date();
		 var last_Date_Str;	
		 last_Date_Str=((today_date.getDate() < 10) ? "0" : "") + String(today_date.getDate()) + "-" +((today_date.getMonth() < 9) ? "0" : "") + String(today_date.getMonth() + 1)+ "-" +String(today_date.getFullYear()-1);
		 // alert("Lasttt year"+last_Date_Str)

		 return last_Date_Str;
	}
	  
	
	 function setval()
	  {
	  		$('#productId').empty();
			$('#productId').append('<option value="0">---All---</option>');
			$('#companyId').empty();
			$('#companyId').append('<option value="0">---All---</option>');
			$("#from").val(getLastDate());
			$('#to').val(getCurrentDate());
	  }

	  function serval1()
	  {
	  	 $('#quickSearch').val('');
	  	 $('#quickSearchHidden').val('');
		 $('#productId').empty();
	  	 $('#productId').append('<option value="0">---All---</option>');
	  	 $('#companyId').empty();
	  	 $('#companyId').append('<option value="0">---All---</option>');
	  	 $("#from").val(getLastDate());
	  	 $('#to').val(getCurrentDate());
	  }

function validate(e){
	if($('#quickSearchHidden').val()==0){
		$("#successDialog").html("Please enter valid Client Name.");
 		$( "#successDialog").dialog( "open" );	
		e.preventdefault();
	}
}


function getAdvisorWiseTransactionStatement(partyid,nodeId){
		 var ClientpartyId = $('#quickSearchHidden').val();
		var issuer_id = $('#companyId').val(); 
		var Product_id = $('#productId').val(); 
		StartDate1 = $('#from').val();
		EndDate1 = $('#to').val();
		var partner_id = partyid;
		
		if ((ClientpartyId == '')||(ClientpartyId == 'NULL'))
	    {
			ClientpartyId=0;
	    } 
		var dt = StartDate1.split("-");
		var day = dt[0];
		var mn = dt[1];
		var yr = dt[2];
		StartDate = mn+"-"+day+"-"+yr;
		
		var dt = EndDate1.split("-");
		var day = dt[0];
		var mn = dt[1];
		var yr = dt[2];
		EndDate = mn+"-"+day+"-"+yr;
		
		  var reportLink= $('#abc').val(); 
		  url =reportLink+"AdvisorWiseTransactionStatement&rs:Command=Render&rc:Parameters=false&Partner_id="+partner_id+"&start_date="+StartDate+"&end_date="+EndDate+"&Party_id="+ClientpartyId+"&nodeId="+nodeId+"&Product_id="+Product_id+"&issuer_id="+issuer_id+"&partnerId="+partner_id+"&loggedpartyId="+partner_id+"";
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
	$('#to').val(currentDate);
	$('#from').val(toDate);
	$('select').val(0);
// 	$('select').data("selectBoxIt").refresh();
	$(selectBox).selectBoxIt('selectOption', 0);
// 	 $("select").selectBoxIt();
}

</script>
<!-- Wrapper ends-->
</body>
</html>
