<!DOCTYPE html>
<%@page import="in.fiinfra.common.diy.models.KeyValue"%>
<%@page import="in.fiinfra.cp.common.util.AuthHandler"%>
<%@page import="in.fiinfra.common.diy.models.UserSession"%>
<%@page import="in.fiinfra.cp.common.model.ReportRequest"%>
<%@page import="in.fiinfra.common.util.FiinfraUtility"%>
<%@page import="org.apache.commons.lang.StringUtils"%>
<%@page import="in.fiinfra.common.common.DocumentData"%>
<%@page import="java.util.List"%>
<%@page import="in.fiinfra.birt.models.IssuerId"%>
<%List<IssuerId> lst = (List<IssuerId>) request.getAttribute("issuers"); 
   List<IssuerId> companyId = (List<IssuerId>) request.getAttribute("companyID");
 %>

<!-- custom scroll to "common_in_content" -->
<style>
    .bx-prev.disabled, .bx-next.disabled {display: none !important}
 
</style> 
<link rel="stylesheet"	href="${pageContext.request.contextPath}/resources/css/diy/basic.css"	type="text/css" />
<script>

var reportURL ="${ssrsUrl}&${paramUrl}";

<% ReportRequest req = (ReportRequest) request.getAttribute("q"); 
  String name = req.getName();
  UserSession user = AuthHandler.getCurrentUser();
%>
$(document).ready(function(){
	 $("#from").val(getLastDate());
  	 $('#to').val(getCurrentDate());
	$("body").on("click", ".submit_btn", function() {
		generateReport();
	});
});

	

function addProductId()
{
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
              
      Type: "GET",
      url:"${pageContext.request.contextPath}/report/getProductId?compartyid="+abc,
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
               
          		$('#productId').append('<option value="'+moduleid+'">'+ module + '</option>');
          			
        	});
        
      	}
   
   });
 
	}
 }

function addInvestorStartDate()
{
	var ab=$('#productId').val();
	//alert(abc);
	//alert($('#quickSearchHidden').val());
	
   $.ajax
  ({
              
      Type: "POST",
      url:"${pageContext.request.contextPath}/report/getInvestorStartDate?productId="+ab,
      dataType: 'json',
      contentType: 'application/json',
      success:function(result)
      { 
        
        
        $(result).each(function(i, obj){
        

            $('#from').empty();
           
        		var module=obj.startDate;
        		
        	
        		
        		$('#from').val(module);
        		
        		
        	});
        
      	}
   
   });
	
 }



function generateReport() {
	/* var from = $("#from").datepicker("getDate");
	var to = $("#to").datepicker("getDate");
	var today = new Date();
	
	
	if(from == null || from > today) {
		  showMessage('Please Enter Valid Start Date ',true);
		  return;
	}
	else if(to == null || to > today || to < from) {
		  showMessage('Please Enter Valid End Date ',true);
		  return;
	}
	else{ */
	
	var productId = $('#productId').val(); 
	var companyId = $('#companyId').val(); 
	var StartDate = $('#from').val();
	var EndDate = $('#to').val();
	
	 
	if ((productId == '')||(productId == 'NULL')||(productId == '---All---'))
    {
		productId=0;
    } 
	if ((companyId == '')||(companyId == 'NULL')||(companyId == '---All---'))
    {
		companyId=0;
    } 

	var dt = StartDate.split("-");
	var day = dt[0];
	var mn = dt[1];
	var yr = dt[2];
	StartDate1 = mn+"-"+day+"-"+yr;
	
	var dt = EndDate.split("-");
	var day = dt[0];
	var mn = dt[1];
	var yr = dt[2];
	EndDate1 = mn+"-"+day+"-"+yr;

	var url = reportURL+"&start_date="+StartDate1+"&end_date="+EndDate1+"&Product_id="+productId+"&issuer_id="+companyId;
	
	console.log('URL >>>'+url);

	
    $("body").addClass("loading");
	  $("#reportview").attr("src", url);
	  $('#reportview').load(function(){
		  $('body').removeClass('loading');
	 $('#reportContainer').show();  
	 });
	 
	$("#CTH").hide();

}
function setFrameLoaded()
{
   $('body').removeClass('loading');
   
}

</script>   



<!-- custom scroll to "common_in_content" -->

<!-- Custom Selectbox starts -->
<!-- <script>
$(document).ready(function(){
    
    $('#frmReportSearch').validate({
        rules: {
        	startDate: { 
            required: true
        	},
        	endDate:{ 
             required: true
        }
        },
        messages: {
        	startDate:"Enter Some Value",
        	endDate: "Enter Some Value"
        }   
       
    });
	 // Calls the selectBoxIt method on your HTML select box
    });
    
</script> -->
<script>
/* $(function() {
    $( ".datepicker" ).datepicker({
	  dateFormat: "dd-mm-yy",
     showOn: "button",
	  buttonText: '',
	yearRange: "-100:+0",
	  changeMonth: true,
     changeYear: true,
     maxDate:'0'
    });
	  $( ".ui-datepicker-trigger" ).wrap( "<div class='datepicker-trigger-parent'></div>" );
 }); */
 
 
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
 
</script>
<!-- Custom Selectbox Ends -->

<!--Slider Starts -->


<!--Slider Starts -->



<!-- Wrapper starts-->

<div id="header-strip" class="fl">
    <h3 class="clearfix fl">REPORT: <span class="title_it">${reportTitle}</span></h3>
    <a class="add_docs_back_btn" href="${pageContext.request.contextPath}/report/myReports">Back</a>
   <%--  <jsp:include page="../menu.jsp"></jsp:include> --%>
    </div>
    
  <!-- end of "header-strip" id -->
  <div id="inner-shadow-strip"></div>
  <!-- Main starts-->
    <!-- Common_content Starts-->

       
      <!-- Common_in_contnet starts-->
      <section class="in_content add-document common_in_content clearfix" style="margin-top:-50px">
        <div class="add_docs_parent">
          <div class="add_documents_parent_inside">
            
            <!-- Second Column Starts-->
            <div class="Third_column"> 
              <!--Custom News Modal-->
              <div class="add_document_slider clearfix">
                
                    <div class="list_bx">
	<form id = "frmReportSearch">				
				<div id="CTH" class="fl">
        <ul>
          <li>
            <label>Company Name</label>
            
            <select id="companyId" name="companyId" onclick="addProductId();" ><option>---All---</option>
             <% for(IssuerId c:companyId){ %>
              <option value="<%=c.getPartyID()%>"><%= c.getLastName() %></option>
              <%} %> 
              </select>
          </li>
          <li>
          <label>Product Name</label>
            <select name="productId" id="productId" style="display:inline-block !important;" onchange="addInvestorStartDate();"><option>---All---</option></select>
          
          </li>
          <li>
           <label class="fl">Start Date</label>
             <input id = "from" type="text" class="grt_bx datepicker" name="startDate" data-date-format="dd-mm-yyyy" >
          </li>
          <li>
           <label class="fl">End Date</label>
              <input id = "to" type="text" class="grt_bx datepicker" name="endDate" data-date-format="dd-mm-yyyy">
          </li>
          <li><input type="button" value="Search" class="submit_btn common_btn" ></li>
        </ul>
       <!--  <ul class="reset clearfix action">
          <li>
            <input type="button" value="Search" class="submit_btn common_btn" >
          </li>
        </ul> -->
       
        <div class="clr"></div>
         
      </div>
      </form>              
                    <div id = "reportContainer" style = "display:block;" class="img  img2 center" > 
                    
                    <iframe id="reportview" onload='setFrameLoaded();' height='370'width='1000'></iframe>  
                    </div>
                      
                    </div>
                    <div class="clr"></div>
              </div>
            </div>
                   <!-- <div class="clr"></div>
                   <div class="CTH_bx"> <iframe></iframe>
      </div> -->
   <!-- Second Column Ends--> 
          </div>
        </div>
      </section>
    <div class="clr"></div>
    <!-- Common_content Ends--> 
    
    <div class="modal"><!-- Place at bottom of page --></div>

  <!-- Main ends--> 
