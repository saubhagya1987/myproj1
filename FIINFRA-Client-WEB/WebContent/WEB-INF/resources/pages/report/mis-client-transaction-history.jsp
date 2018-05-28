<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
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
       
        

<!-- Filter section toggle starts -->
<script>
        $(document).ready(function(){
		 $(".wrapper").addClass('client_transaction_history');	
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
       <jsp:include page="../layout/submenu_small.jsp"></jsp:include>
      <!-- Common_in_contnet starts-->
      <section id="mis_reports_box" class="in_content common_in_content clearfix mis_reports_bx_in">
        <div id="client_holding_reort_filter">
          <ul class="reset clearfix parameters">
            <li class="first">
              <label class="fl"> Client Name</label>
              <input type="text" class="common_input" id="quickSearch" onkeyup="getContactList(event)" placeholder="Quick Search"/>
              <input type="hidden" class="common_input" id="quickSearchHidden"    placeholder="Quick Search"/>
            </li>
            <li class="second">
              <label class="fl">Transaction Type</label>
              <select name="txntypeId" id="txntypeId"  class="none">
                
              </select>
            </li>
            <li class="third">
              <label class="fl">Issuer Name</label>
              <select name="issurerId" id="issurerId"  class="none">
              </select>
            </li>
          </ul>
          <ul class="reset clearfix parameters spacing">
            <li class="fourth">
              <label class="fl">Start Date</label>
              <input type="text" class="common_input5 datepicker" name="Startdatename" id="from" placeholder="dd/mmm/yyyy"  disabled>
            </li>
            <li class="second">
              <label class="fl">End Date</label>
              <input type="text" class="common_input5 datepicker" name="Enddatename" id="to" placeholder="dd/mmm/yyyy"  disabled>
            </li>
            <li class="fifth">
              <label class="fl">Transaction Flow</label>
              <select name="txnflow"	id="txnflow"  class="none">
              <option value=0>All Select</option>
                					 <option value=1>Inflow</option>
               						 <option value=-1>Outflow</option>
              </select>
            </li>
          </ul>
          <ul class="reset clearfix action">
            <li>
              <input type="reset" class="common_btn" onclick="reset()">
            </li>
            <li>
              <input type="submit" value="Search" class="common_btn" onclick="validate(event);getClientTxnHistory('ClientTransactionHistory.rptdesign')">
            </li>
          </ul>
          <div class="clr"></div>
        </div>
        <div class="div_dragger"><span></span></div>
        
        <!--Container Starts-->
        <div id="downloadOptions" align="right" style="display: none;margin-right: 30px;">
			
					<br><br>
					Download Report as:
					 <a class="pdficon" title="Download in Pdf" alt="Download in Pdf"href="#" onclick="downClientTxnHistory('pdf',${sessionScope.userSession.partyId})"></a>
					 <a class="excelicon" title="Download in Excel" alt="Download in Excel"href="#" onclick="downClientTxnHistory('xls',${sessionScope.userSession.partyId})"></a>
					 <a class="docicon" title="Download in Doc" alt="Download in Doc" href="#" onclick="downClientTxnHistory('doc',${sessionScope.userSession.partyId})"></a>
				</div>
        <div id="reportview" style="margin-top: 50px;">
			

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
var partyId=0;
var selectBox;
var fullDate = new Date();console.log(fullDate);
var twoDigitMonth = ((fullDate.getMonth().length+1) === 1)? (fullDate.getMonth()+1) : '0' + (fullDate.getMonth()+1);
var twoDigitDate = fullDate.getDate()+"";if(twoDigitDate.length==1) twoDigitDate="0" +twoDigitDate;
var currentDate = twoDigitDate + "/" + twoDigitMonth + "/" + fullDate.getFullYear();console.log(currentDate);
var toDate = twoDigitDate + "/" + twoDigitMonth + "/" + (fullDate.getFullYear()-1);
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
	         url:'${pageContext.request.contextPath}/partner/getPicklistValues.htm?codeTypeIds=502',
	          dataType: 'json',
	          contentType: 'application/json',
	             success:function(result)
	          { 
	            //result = JSON.parse(result);
	            //alert('result='+result);
	            $('#txntypeId').empty();
	            $('#txntypeId').append('<option value=0>All Select</option>');
	            $(result).each(function(i, obj) 
	            		{
	            	var module=obj.codeValue;
					var moduleid=obj.codeValueId;
	          
	   
	              $('#txntypeId').append('<option value="'+ moduleid+'">'+ module + '</option>');
	            	
	            		});
	            
	            $.ajax
	  	      ({
	  	                  
	  	          type: "POST",
	  	         // url: $('#contextPath').val()+'/birtReport/getCodeValueDescription.htm',
	  	         url:'${pageContext.request.contextPath}/report/getIssuerID.htm',
	  	          dataType: 'json',
	  	          contentType: 'application/json',
	  	             success:function(result)
	  	          { 
	  	            //result = JSON.parse(result);
	  	            //alert('result='+result);
	  	            $('#issurerId').empty();
	  	            $('#issurerId').append('<option value=0>All Select</option>');
	  	            $(result).each(function(i, obj) 
	  	            		{
	  	            	var module=obj.lastName;
	  					var moduleid=obj.partyID;
	  				  
	  	              $('#issurerId').append('<option value="'+ moduleid+'">'+ module + '</option>');
	  	            	
	  	            		});
	  	          $("select").show()
	  	         selectBox= $("select").selectBoxIt();
	  			var fullDate = new Date();console.log(fullDate);
	  			var twoDigitMonth = ((fullDate.getMonth().length+1) === 1)? (fullDate.getMonth()+1) : '0' + (fullDate.getMonth()+1);
	  			var twoDigitDate = fullDate.getDate()+"";if(twoDigitDate.length==1) twoDigitDate="0" +twoDigitDate;
	  			
	  			switch(fullDate.getMonth()+1) {
	  			case 1: twoDigitMonth = "Jan";
	  			break;
	  			case 2: twoDigitMonth = "Feb";
	  			break;
	  			case 3: twoDigitMonth = "Mar";
	  			break;
	  			case 4: twoDigitMonth = "Apr";
	  			break;
	  			case 5: twoDigitMonth = "May";
	  			break;
	  			case 6: twoDigitMonth = "Jun";
	  			break;
	  			case 7: twoDigitMonth = "July";
	  			break;
	  			case 8: twoDigitMonth = "Aug";
	  			break;
	  			case 9: twoDigitMonth = "Sep";
	  			break;
	  			case 10: twoDigitMonth = "Oct";
	  			break;
	  			case 11: twoDigitMonth = "Nov";
	  			break;
	  			case 12:twoDigitMonth = "Dec";
	  			}
	  			
	  			var currentDate = twoDigitDate + "-" + twoDigitMonth + "-" + fullDate.getFullYear();console.log(currentDate);
	  			$('#to').val(currentDate);
	  			var toDate = twoDigitDate + "-" + twoDigitMonth + "-" + (fullDate.getFullYear()-1);
	  			$('#from').val(toDate);
	  	            
	  	          }
	  	       
	  	       });
	          }
	       
	       });
})


function validate(e){
	if($('#quickSearchHidden').val()==0){
		$("#successDialog").html("Please enter valid Client Name.");
 		$( "#successDialog").dialog( "open" );	
		e.preventdefault();
	}
}

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
