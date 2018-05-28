<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@page import="in.fiinfra.common.diy.models.UserSession"%>
<%@page import="in.fiinfra.common.common.BaseRequest"%>
<%@page import="org.apache.commons.lang.StringUtils"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<!--<meta name="viewport" content="width=device-width,initial-scale=1">-->
<title>Vacation Planning</title>
<%-- <link href="<%=request.getContextPath()%>/css/bootstrap.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/css/partner_setup.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/css/partner.css" rel="stylesheet">
    <script src="<%=request.getContextPath()%>/js/bootstrap.min.js"></script>
     <script src="<%=request.getContextPath()%>/js/bootstrap-responsive.js"></script>
      <script src="<%=request.getContextPath()%>/js/bootstrap-responsive.min.js"></script>
       <script src="<%=request.getContextPath()%>/js/bootstrap.js"></script>

<link rel="shortcut icon" href="${pageContext.request.contextPath}/images/favicon.ico" />
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/diy/basic.css" />
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/diy/jquery-ui.css" />
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/diy/toggles.css" />
<link href="${pageContext.request.contextPath}/css/diy/custom.css" rel="stylesheet" type="text/css">
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/diy/main.css" />
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/diy/responsive.css" />
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/diy/selectboxlt.css" /> --%>
<script src="${pageContext.request.contextPath}/js/diy/plugin/jquery-1.11.0.min.js"></script>
<%-- <script src="${pageContext.request.contextPath}/js/diy/plugin/jquery-ui.js"></script>
<script src="${pageContext.request.contextPath}/js/diy/plugin/jquery.ui.touch-punch.js"></script>
<script src="${pageContext.request.contextPath}/js/diy/plugin/toggles.js"></script>
<script src="${pageContext.request.contextPath}/js/diy/plugin/jquery.slimscroll.js"></script>
<script src="${pageContext.request.contextPath}/js/diy/my_account_submenu.js"></script>
<script src="${pageContext.request.contextPath}/js/diy/jquery_ui_range_slider.js"></script>
<script src="${pageContext.request.contextPath}/js/diy/plugin/selectboxit.js"></script>
<script src="${pageContext.request.contextPath}/js/diy/plugin/jquery.form.js"></script>
<script src="${pageContext.request.contextPath}/js/diy/plugin/perfect-scrollbar.js"></script>
<script src="${pageContext.request.contextPath}/js/diy/common_modal.js"></script>
 <link href="<%=request.getContextPath()%>/css/${sessionScope.userSession.themeName}/${sessionScope.userSession.themeName}.css" rel="stylesheet"> --%>
<style>
#vaccation_planning + .common_footer_actions .btn_grup3 {width: 221px;}
.heading_icon{line-height: 63px !important;}
.heading_icon .bigger-100 {font-size: 90% !important;}
</style>
<!-- <style>
#confirmDialog {
display: block;
height: 130px;
display: none;
width: 355px;
box-shadow: 0 0 15px 1px #757575;
}
</style> -->
<script>

var index=0;
function activateSecurity(){
// 	alert('hiiii----${sessionScope.idList}')
// alert($('#idList').val())
	var controllIds=$('#idList').val().split(',');
	$(controllIds).each(function(){
		//alert(this.replace("[", "").replace("]", ""))
		if(this.replace("[", "").replace("]", "").replace(" ", "")!='')
		$('.'+this.replace("[", "").replace("]", "").replace(" ", "")).remove();	
	});
}
$(document).ready(function(){
//$('#vaccation').slimScroll();
activateSecurity()
/* $("#successDialog").dialog();
$(document).on("dialogopen", "#successDialog", function(event, ui) {
	setTimeout("$('#successDialog').dialog('close')",3000);
}); */

/* $("#confirmDialog .close").click(function(){
    $(".overlay").fadeOut("slow");
	$("#confirmDialog").fadeOut("slow");
	 }); */
			
<c:if test="${not empty success}">
$(".modal-body").html("<spring:message code="${success}" />");
$(".btn-success1").html("OK");
$(".btn-success1").on('click',function(){
	closeDialog();
});		
$(".btn-danger1").hide();
$('#confirmDialog').modal('show');
</c:if>

<c:if test="${not empty error}">
$(".modal-body").html("<spring:message code="${error}" />");
$(".btn-success1").html("OK");
$(".btn-success1").on('click',function(){
	closeDialog();
});		
$(".btn-danger1").hide();
$('#confirmDialog').modal('show');
</c:if>

 /* $("select#productCategory").selectBoxIt({
	//populate: {"data":${productCategoryDropDownData}}
});  */

var list = ${productCategoryDropDownData};
	 $.each(list, function( index, value ) {
	  //alert( index + ": " + value );
	  var obj=value;
	  $("#productCategory")
	     .append($("<option></option>")
	    .attr("value",obj.value)
	    .text(obj.text));
	    
	 });
	 

$("select#companyName").bind({
	"change": function(){
		$("#manufactureIdHidden").val(this.value);
		 $.ajax({
				url: "${pageContext.request.contextPath}/partner/getComapnyNames",
				type : "GET",
				data : {'categoryId' : $("#categoryidHidden").val(), 'manufactureId' : $("#manufactureIdHidden").val()},
				 success: function(msg){
					 $("#productName").empty();
						//$("#productName").data("selectBox-selectBoxIt").add({ value: "-1", text: " --Select--"});
					  $("#productName")
			          .append($("<option></option>")
			          .attr("value",item.value)
			          .text(item.text));
				 }
			      });

						/* var selectBox = $("#companyName").selectBoxIt().data('selectBox-selectBoxIt');			    
					    selectBox.selectOption(selectedValue); */
				 }
		 });
		
	
/* $("select#companyName").selectBoxIt({
	populate: {"data":[
	                     {"value":"-1","text":"---Select---"}
	                   ]}
});
$("select#productName").selectBoxIt({
	populate: {"data":[
	                     {"value":"-1","text":"---Select---"}
	                   ]}
}); */

$("#companyName")
.append($("<option></option>")
.attr("value","-1")
.text('-- Select --'));

$("#productName")
.append($("<option></option>")
.attr("value","-1")
.text('-- Select --'));

	//Tax planning input Starts
	index = ${noOfDropDownsAtBeginning};
	$("#noOfDropDownRowsHidden").val(index);
	$("#vaccation").on("click", ".addRow", function() {
	index = index + 1;
	$("#noOfDropDownRowsHidden").val(index);
	//totalDropDowns = 
//	alert(index);
	  $(this).prev(".delRow").fadeIn("slow");
	
	  $(this).parent().closest(".form-group").after("<div class='form-group'><div class='row' ><div class='col-sm-3 col-xs-12' ><div class='header_strip hidden-md visible-xs'><div class='row'><div class='col-md-3 col-xs-12'>Product Category</div></div></div><select id='productCategory_"+index+"' name='productCategory_"+index+"' class=' form-control'></select><div class='hr14'></div></div><div class='col-sm-3 col-xs-12' ><div class='header_strip hidden-md visible-xs'><div class='row'><div class='col-md-3 col-xs-12'>Company Name</div></div></div><select id='companyName_"+index+"' name='companyName_"+index+"' class=' form-control'></select><div class='hr14'></div></div><div class='col-sm-3 col-xs-12' ><div class='header_strip hidden-md visible-xs'><div class='row'><div class='col-md-3 col-xs-12'>Product Name</div></div></div><select id='productName_"+index+"' name='productName_"+index+"' class=' form-control'></select><div class='hr14'></div></div><div class='col-sm-3 col-xs-12'><div class='btn btn-xs btn-grey delRow' id='close_"+index+"'>  <i class='ace-icon fa fa-close bigger-110 icon-only'></i> </div> <div class='btn btn-xs btn-light addRow' id='add_"+index+"'> <i class='ace-icon fa fa-plus bigger-110 icon-only'></i> </div></div></div></div>");
	    var productcategoryDropDownId = "#productCategory_"+ index;
	    var companyNameDropDownId = "#companyName_"+ index;
	    var productNameDropDown = "#productName_"+ index;
	    // $("select#productCategory").selectBoxIt({
	     /* $(productcategoryDropDownId).selectBoxIt({
	    		populate: {"data":${productCategoryDropDownData}}
	    	});
	     $(companyNameDropDownId).selectBoxIt({
	    		populate: {"data":[
	    		                     {"value":"-1","text":"---Select---"}
	    		                   ]}
	    	});
	    	$(productNameDropDown).selectBoxIt({
	    		populate: {"data":[
	    		                     {"value":"-1","text":"---Select---"}
	    		                   ]}
	    	}); */
	    	var list = ${productCategoryDropDownData};
	     	 $.each(list, function( index, value ) {
	     	  //alert( index + ": " + value );
	     	  var obj=value;
	     	  $(productcategoryDropDownId)
	     	     .append($("<option></option>")
	     	    .attr("value",obj.value)
	     	    .text(obj.text));
	     	    
	     	 });
	     	 
	     	$(companyNameDropDownId)
	       .append($("<option></option>")
	       .attr("value","-1")
	       .text('-- Select --'));
	      
	      $(productNameDropDown)
	       .append($("<option></option>")
	       .attr("value","-1")
	       .text('-- Select --'));
	      
	    	$( "body" ).on( "change", productcategoryDropDownId , function(){
				$("#categoryidHidden").val(this.value);
		//		alert(this.id);
				var nextDropDown = this.id.split('_');
				var companyNameDropDown = "#companyName_"+ nextDropDown[1];
				var productNameDropDown = "#productName_"+ nextDropDown[1];
				$(productNameDropDown).empty();
				 $(productNameDropDown)
		    		.append($("<option></option>")
		    		.attr("value","-1")
		    		.text('-- Select --'));
				 
				 $.ajax({
					url: "${pageContext.request.contextPath}/partner/getComapnyNames",
					type : "GET",
					data : {'categoryId' : $("#categoryidHidden").val()},
					 success: function(msg){
						 $(companyNameDropDown).empty();
							//$(companyNameDropDown).data("selectBox-selectBoxIt").add({ value: "-1", text: " --Select--"});
							$.each(msg, function(index, item) {					
								//$(companyNameDropDown).data("selectBox-selectBoxIt").add({ value: item.value, text: item.text });
								$(companyNameDropDown)
						          .append($("<option></option>")
						          .attr("value",item.value)
						          .text(item.text));
						     
							});

							/*  var selectBox = $("#companyName").selectBoxIt().data('selectBox-selectBoxIt');			    
						    selectBox.selectOption(selectedValue); */ 
					 }
				});
			});
	    	$( "body" ).on( "change", companyNameDropDownId , function(){
				$("#manufactureIdHidden").val(this.value);
			//	alert(this.id);
				var nextDropDown = this.id.split('_');
				var productNameDropDown = "#productName_"+ nextDropDown[1];
				$.ajax({
					url: "${pageContext.request.contextPath}/partner/getProductNames",
					type : "GET",
					data : {'categoryId' : $("#categoryidHidden").val(), 'manufactureId' : $("#manufactureIdHidden").val()},
					 success: function(msg){
						 $(productNameDropDown).empty();
							//$(productNameDropDown).data("selectBox-selectBoxIt").add({ value: "-1", text: " --Select--"});
							$.each(msg, function(index, item) {					
								$(productNameDropDown)
							     .append($("<option></option>")
							     .attr("value",item.value)
							     .text(item.text));					
							});

							/*  var selectBox = $("#companyName").selectBoxIt().data('selectBox-selectBoxIt');			    
						    selectBox.selectOption(selectedValue); */ 
					 }
				});
			});
	    	validateProduct(productNameDropDown);
	  /* $("select").selectBoxIt({
		  populate: {"data":[
		                     {"text":"SelectBoxIt is:","value":"SelectBoxIt is:"},
		                     {"text":"a jQuery Plugin","value":"a jQuery Plugin"},
		                     {"text":"a Select Box Replacement","value":"a Select Box Replacement"},
		                     {"text":"a Stateful UI Widget","value":"a Stateful UI Widget"}
		                   ]}
	  }); */
	  $(this).fadeOut("fast");
	  
	 //close button for first Tax planning input start
	var count_section_add = $(this).parent().closest("section").find(".form-group").length-1;
	if(count_section_add==2)
	  {
		
		$(this).parent().find(".delRow").removeClass("last_close");
	   
	  }
	  //close button for Tax planning input end
	$("#noOfDropDownRowsHidden").val(index);
	  
	});

// Close Button of default Tax planning input 
$("#vaccation").on("click", ".delRow", function() {
	 
   //  var manuf_parent=$(this).parent();
	//close button for first Tax planning input start
	var count_section = $(this).parent().closest("section").find(".form-group").length;
	if(count_section==2)
	  {
		//$(this).parent().closest("ul").siblings("ul").find(".close").addClass("last_close");
		$("#vaccation").find(".form-group").find(".delRow").fadeOut();
	   
	  }
	  else
	  {
		//$(this).parent().closest("ul").siblings("ul").find(".close").removeClass("last_close");  
	  }
	//close button for first Tax planning input end
	
//	alert($(this).parent().closest("ul").find("li"));
	/* $(this).parent().closest("ul").remove();
	$("#vaccation").find("ul.first_ul").last().find(".add").fadeIn("slow"); */
	$(this).parent().closest(".form-group").remove();
	$("#vaccation").find(".form-group").last().find(".addRow").fadeIn("slow");
	
});	
//Manufacturer Ends

});


function displayMsg(msg){
	$(".modal-body").html(msg);
		$(".btn-success1").html("Ok");
		$(".btn-success1").on('click',function(){closeDialog();});
		$(".btn-danger1").hide();
		$('#confirmDialog').modal('show');
}

/* function displayMsg(msg){
	$("#successDialog").html(msg);
	 $( "#successDialog").dialog( "open" );
}
function closeDialog(){
	$(".overlay").fadeOut("slow");
	$("#confirmDialog").fadeOut("slow");
} */
function performReset(){
	window.location.href="${pageContext.request.contextPath}/partner/goalPlanSetDefault/vacationPlanning?sectionTypeId=${sectionTypeId}";
}
function setDefaultValues(){
	if("${recordTypeId}"==14003){
		$(".modal-body").html("<spring:message code='successionPlanning.dataReset' />");
		$(".btn-danger1").show();
		$(".btn-success1").html("Yes");
		$(".btn-success1").on('click',function(){performReset();});			
		$('#confirmDialog').modal('show');		
	}else{		
		$(".modal-body").html("Data already restored!!!");
		$(".btn-success1").html("Ok");
		$(".btn-success1").on('click',function(){closeDialog();});
		$(".btn-danger1").hide();
		$('#confirmDialog').modal('show');	
	}
}

function closeDialog(){
	$("#confirmDialog").modal('hide');
}
function confirmCancel(msg){
$(".modal-body").html(msg);
$(".btn-danger1").show();
$(".btn-success1").html("Yes");
$(".btn-success1").on('click',function(){
	$('#vacationPlanningform').attr('action', '${pageContext.request.contextPath}/partner/recommendation');
	$("#vacationPlanningform").submit();
});			
$('#confirmDialog').modal('show');
}

</script>
</head>

<body> 
<jsp:include page="header.jsp"></jsp:include>

<%HttpSession hes=request.getSession();%>
<input type="text" name="partyId" id="partyId" value="<%=hes.getAttribute("partyId")%>">

<input type="hidden" id="idList" value="${sessionScope.idList}"/>
<div class="">
	<!-- <div class="container-head">
		<div class="col-md-12" style="text-align: right;"><span style="float:left;">Partner Setup </span></div >
    </div>
    <div class="container-body " style="padding:5px;">
	    
	   
    </div> -->
	<div class="">
<!-- Wrapper starts-->
<div class="wrapper" id="vacation_planning_parent"> 
  <!-- Main starts-->
  <section class="main"> 
     
 	<!-- Header Starts-->
    <header class="common_header inner_header">
     
      <div class="page_header">
        <h1 class="heading clearfix">

          <span class="head_txt">Vacation Planning</span><span class="heading_icon"><i class="ace-icon fa icon-vacation-planning bigger-100"></i></span>
         <button class="btn btn-sm btn-warning pull-right set_default" onclick="setDefaultValues();">
												<i class="ace-icon fa fa-fire bigger-110"></i>
												<span class="bigger-110 no-text-shadow">Set Default</span>
											</button>
		  </h1>
          
      </div>
    </header>
    <!-- Header Ends--> 
    
    
    <div class="space hidden-xs"></div>
    <!-- Common_content Starts-->
    <section class="content common_content">
     <!-- Common_in_contnet starts-->
      <section class="in_content common_in_content clearfix my_profile_parent" id="vaccation_planning">
      <form method="post" name="vacationPlanningform" id="vacationPlanningform" action="<c:url value="/partner/saveVacationPlanings.htm"/>">
        <div class="header_strip hidden-xs">
			<div class="row">
				<div class="col-md-3">Product Category</div>
				<div class="col-md-3">Company Name</div>
				<div class="col-md-3">Product Name</div>
			</div>
		</div>
		<div class="space hidden-md visible-xs"></div>
        <div id="vaccation" >
						<c:forEach items="${adviceRecommendationsList}"  varStatus="loopCounter" var="vacation">
						
							<div class="form-group">            
             				<div class="row" >
								 <div class="col-sm-3 col-xs-12" >
								 <div class="header_strip hidden-md visible-xs">
              					 <div class="row"><div class="col-md-3 col-xs-12">Product Category</div></div></div>
					          	 <select id="productCategory_${loopCounter.count}" name="productCategory_${loopCounter.count}" class=" form-control"></select><div class="hr14"></div>
					          	</div>
					          
								 <div class="col-sm-3 col-xs-12" >
								 <div class="header_strip hidden-md visible-xs">
              					 <div class="row"><div class="col-md-3 col-xs-12">Company Name</div></div></div>
								 <select id="companyName_${loopCounter.count}" name="companyName_${loopCounter.count}" class=" form-control"></select><div class="hr14"></div>
								 </div>
								 
								<div class="col-sm-3 col-xs-12" >
								<div class="header_strip hidden-md visible-xs">
              					<div class="row"><div class="col-md-3 col-xs-12">Product Name</div></div></div>
								<select id="productName_${loopCounter.count}" name="productName_${loopCounter.count}" class=" form-control"></select><div class="hr14"></div>
								</div>
								<div class="col-sm-3 col-xs-12">
									<%-- <div class="close" id="close_${loopCounter.count}">X</div>
									<div class="add" id="add_${loopCounter.count}">+</div> --%>
									<div class="btn btn-xs btn-grey delRow" id="close_${loopCounter.count}">  <i class="ace-icon fa fa-close bigger-110 icon-only"></i> </div> 
									<div class="btn btn-xs btn-light addRow" id="add_${loopCounter.count}"> <i class="ace-icon fa fa-plus bigger-110 icon-only"></i> </div>
								</div>
							</div>
							</div>
							 <input type="hidden" name="categoryidIncoming_${loopCounter.count}" id="categoryidIncoming_${loopCounter.count}"  value="${vacation.categoryId}"/>
							 <input type="hidden" name="companyNameIncoming_${loopCounter.count}" id="companyNameIncoming_${loopCounter.count}" value="${vacation.manufacturerId}"/>
							 <input type="hidden" name="productNameIncoming_${loopCounter.count}" id="productNameIncoming_${loopCounter.count}" value="${vacation.productId}"/>
							 <%-- <input name="companyNameDD_${loopCounter.count}" id="companyNameDD_${loopCounter.count}" type="hidden" value="${companynameDropDownData0}"/> --%>
							 <input name="companyNameDD_${loopCounter.count}" id="companyNameDD_${loopCounter.count}" type="hidden" />
							 <input type="hidden" name="id${loopCounter.count}" id="id${loopCounter.count}" value="${vacation.id}"  />
						</c:forEach>	
						</div>
        <input name="categoryidHidden" id="categoryidHidden" type="hidden" value="0"/>
        <input name="manufactureIdHidden" id="manufactureIdHidden" type="hidden" value="0"/>
        <input name="noOfDropDownRowsHidden" id="noOfDropDownRowsHidden" type="hidden" value="0"/>
        <!-- <input name="productCategoryValuesFinal" id="productCategoryValuesFinal" type="hidden" value="0"/>
        <input name="companyNameValuesFinal" id="companyNameValuesFinal" type="hidden" value="0"/>
        <input name="productNameValuesFinal" id="productNameValuesFinal" type="hidden" value="0"/>
        <input name="productCategoryValuesInitial" id="productCategoryValuesInitial" type="hidden" value="0"/>
        <input name="companyNameValuesInitial" id="companyNameValuesInitial" type="hidden" value="0"/>
        <input name="productNameValuesInitial" id="productNameValuesInitial" type="hidden" value="0"/> -->
        <input type="hidden" name="id" id="id" value="${id}"  />
        <input type="hidden" name="recordTypeId" id="recordTypeId" value="${recordTypeId}"  />
        </form>
      </section>
      <section class="common_footer_actions">
							<div class="row">
								<div class="col-sm-1 col-xs-3">
									<a href="${pageContext.request.contextPath}/partner/taxPlanning.htm"><div class="btn btn-app btn-transparent btn-xs" >
										<i class="ace-icon fa icon-back bigger-240 red"></i> Back
									</div></a>
								</div>


								<div class="col-sm-10 col-xs-6">
									<div class="col-sm-1 col-xs-0"></div>
									<div class="col-sm-4 col-xs-0"></div>
									<div class="col-sm-3 col-xs-12">
									
									<c:choose>
						        		<c:when test="${sessionScope.userSession.buId!='27829' || (sessionScope.userSession.buId=='27829' && sessionScope.userSession.roleId=='212')}">
							              <div class="btn btn-app btn-transparent btn-xs" onclick="formSubmit();">
											<i class="ace-icon fa icon-save bigger-200"></i> Save
										  </div>
						              </c:when>
             					 </c:choose>
										<div class="btn btn-app btn-transparent btn-xs" onclick="formCancel();">
											<i class="ace-icon fa icon-cancel bigger-200"></i> Cancel
										</div>
									</div>
									<div class="col-sm-4 col-xs-0"></div>
									<div class="col-sm-1 col-xs-0"></div>
									<div class="col-sm-1 col-xs-0"></div>
								</div>
								<div class="col-sm-1 col-xs-3">
									<a href="${pageContext.request.contextPath}/partner/successionPlanning.htm"><div class="btn btn-app btn-transparent btn-xs">
										<i class="ace-icon fa icon-next bigger-240 red"></i>
										Next
									</div></a>
								</div>
							</div>
						</section>
						
      <!-- Common_in_contnet ends --> 
      <!-- Common footer starts -->
      <%-- <section class="common_footer_actions">
        <div id="main_actions" class="clearfix">
          <ul class="reset clearfix fr btn_grup3">
           <c:choose>
        		<c:when test="${sessionScope.userSession.buId!='27829' || (sessionScope.userSession.buId=='27829' && sessionScope.userSession.roleId=='212')}">
              <li class="fl list"><a href="#" class="saveVacationPlanningLink" onclick="formSubmit();"><input class="dbtn" value="Save" type="button"></a></li>
              </c:when>
              </c:choose>
            <li class="fl list"><a href="#" class=" " onclick="formCancel();"><input class="dbtn" value="Cancel" type="button"></a></li>
<!--             <li class="fl list"><a href="#" class=" "><input class="dbtn" value="Skip" type="button"></a></li> -->
          </ul>
        </div>
        <a href="${pageContext.request.contextPath}/partner/taxPlanning.htm" class="back navgation" ><input class="dbtn" value="Back" type="button"></a> 
        <a href="${pageContext.request.contextPath}/partner/successionPlanning.htm" class="next navgation" ><input class="dbtn" value="Next" type="button">
        </section> --%>
      
      <!-- Common footer ends -->
      <div class="overlay"></div>
    </section>
    <!-- Common_content Ends--> 
  </section>
  <!-- Main ends--> 
</div>
<!-- Wrapper ends-->
<!-- <div id="successDialog" class="common_dialog" style="text-align: center;"> </div>
<div id="confirmDialog" class="common_custom_modal_aa">
  <span class="close">X</span>
  <div class="modal_content"> 
    <div class="aa_up">
        Do you really want to delete this data?</div>
     
         <div class="aa_down"> <a style="cursor:pointer;" class="aa_yes">Yes </a> 
         <a style="cursor:pointer;" onclick="closeDialog();" class="aa_no">No</a> </div>


  </div>
</div> -->

<div class="modal fade" id="confirmDialog" tabindex="-1" role="dialog" aria-labelledby="basicModal" aria-hidden="true">
    		<div class="modal-dialog">
       		<div class="modal-content">
            <div class="modal-body">
                <label> You already have ${foundGoal} ${goalTypeString}/s defined. Do you want to modify existing goal ?</label>
             </div>
            <div class="modal-footer">
             <button  class="btn btn-sm btn-success1 btn-primary"><i class="ace-icon fa fa-check bigger-110"></i>Yes</button>
  		       <button onclick="closeDialog();" class="btn btn-sm btn-danger1 btn-primary"><i class="ace-icon fa fa-close bigger-110"></i>No</button>
		             </div>
    </div>
  </div>
</div>

</div>
</div>
<!-- Footer start -->
<jsp:include page="../common/footer.jsp" />
<!-- Footer end -->
</body>
<script type="text/javascript">
$(document).ready(function(){
	var idTemp2 = "#id2";
	var idTemp1 = "#id1";
	//alert($(idTemp1).val());
	//alert($(idTemp2).val());
	var noOfDropDowns = ${noOfDropDownsAtBeginning};
	if(noOfDropDowns != 0){
		for(var i =0;i<noOfDropDowns; i++){
			var companynameDropDownDataVar = "companynameDropDownData"+i;
			//does not work
			//var data = $("#companyNameDD_1").val();
			//alert('calling checkDropDown'+data);
			//checkDropDown(companynameDropDownDataVar);
			//alert(companynameDropDownDataVar);
			var companynameDropDownDataVarJson = "";//${companynameDropDownDatavar};
			//alert('${companynameDropDownDatavar}');
			var productcategoryDropDownId = "#productCategory_"+(i+1);
			var companyNameDropDownId = "#companyName_"+(i+1);
			var list = ${productCategoryDropDownData};
		  	 $.each(list, function( index, value ) {
		  	  //alert( index + ": " + value );
		  	  var obj=value;
		  	  /* $(productcategoryDropDownId)
		  	     .append($("<option></option>")
		  	    .attr("value",obj.value)
		  	    .text(obj.text)); */
		  	    
		  	  $(productcategoryDropDownId).append(
					'<option value="'+obj.value+'">'
							+ obj.text
							+ '</option>');
		  	    
		  	 });
			var categorySelect = "#categoryidIncoming_"+(i+1);
			var companyNameSelect = "#companyNameIncoming_"+(i+1);
			var productNameSelect = "#productNameIncoming_"+(i+1);
			$(productcategoryDropDownId).val($(categorySelect).val());    
		    //selectBox.selectOption($(categorySelect).val());
		    $("#categoryidHidden").val($(categorySelect).val());
			var companyNameDropDown = "#companyName_"+(i+1);
			var productNameDropDown = "#productName_"+(i+1);
			//var showDropDown = $("#companyNameDD_1").val();
			var categoryIdPassed = $(categorySelect).val();
			var companyNameIdPassed = $(companyNameSelect).val();
			/* $(companyNameDropDown).selectBoxIt({
					populate: function() {
						var deferred = $.Deferred(),
			            arr = [],
			            x = -1;
						$.ajax({
							type : "GET",
							url : "${pageContext.request.contextPath}/partner/getComapnyNames",
							data : {'categoryId' : categoryIdPassed},
							contentType : "application/json; charset=utf-8",
							dataType : "json",
						}).done(function(data) {
				            while(++x < data.length) {
				                arr.push(data[x]);
				            }
				            deferred.resolve(arr);
				        });
				        return deferred;
					}
			}); */
			/* var selectBox = $(companyNameDropDownId).selectBoxIt().data('selectBox-selectBoxIt');			    
		    selectBox.selectOption($(companyNameSelect).val()); */
		    //$(companyNameDropDown).selectBoxIt();
		    
			//$(productNameDropDown).selectBoxIt();
			jsonPopulateCompanyName("${pageContext.request.contextPath}/partner/getComapnyNames", $(categorySelect).val(), companyNameDropDown, companyNameDropDown, $(companyNameSelect).val());
			//checkDropDown($(categorySelect).val());
			
			jsonPopulateProductName("${pageContext.request.contextPath}/partner/getProductNames", $(categorySelect).val(), $(companyNameSelect).val(), productNameDropDown, productNameDropDown, $(productNameSelect).val());			
			
			validateProduct(productNameDropDown);
			
			if(i == (noOfDropDowns-1)){
				$("#add_"+(i+1)).fadeIn("slow");	
				$("#close_"+(i+1)).fadeIn("slow");				
			} else{
				$("#add_"+(i+1)).fadeOut("slow");	
				$("#close_"+(i+1)).fadeIn("slow");				
			}
			if(noOfDropDowns == 1){
				$("#close_"+(i+1)).fadeOut("slow");
			}
		}
	}else{
		var productcategoryDropDownId = "#productCategory_"+(i+1);
		var companyNameDropDownId = "#companyName_"+(i+1);
		/* $(productcategoryDropDownId).selectBoxIt({
			populate: {"data": ${productCategoryDropDownData}},
		}); */
		var companyNameDropDown = "#companyName_"+(i+1);
		var productNameDropDown = "#productName_"+(i+1);
		/* $(companyNameDropDown).selectBoxIt({
			populate: {"data":[
  		                     {"value":"-1","text":"---Select---"}
  		                   ]}
		});
		$(productNameDropDown).selectBoxIt({
			populate: {"data":[
  		                     {"value":"-1","text":"---Select---"}
  		                   ]}
		}); */
		
		var list = ${productCategoryDropDownData};
	  	 $.each(list, function( index, item ) {
	  	  $(productcategoryDropDownId)
	  	     .append($("<option></option>")
	  	   .attr("value",item.value)
	  	  .text(item.text));
	  	    
	  	 });
	  	 
	  	$(companyNameDropDownId)
	    .append($("<option></option>")
	    .attr("value","-1")
	    .text('-- Select --'));
	   
	   $(productNameDropDown)
	    .append($("<option></option>")
	    .attr("value","-1")
	    .text('-- Select --'));
	   
		$( "body" ).on( "change", productcategoryDropDownId , function(){
			$("#categoryidHidden").val(this.value);
			//alert(this.id);
			var nextDropDown = this.id.split('_');
			var companyNameDropDown = "#companyName_"+ nextDropDown[1];
			$("#vacationPlanningform").ajaxSubmit({
				url: "${pageContext.request.contextPath}/partner/getComapnyNames",
				type : "GET",
				data : {'categoryId' : $("#categoryidHidden").val()},
				 success: function(msg){
					 $(companyNameDropDown).empty();
						/* $(companyNameDropDown).data("selectBox-selectBoxIt").add({ value: "-1", text: " --Select--"}); */
						$.each(msg, function(index, item) {					
							$(companyNameDropDown)
						     .append($("<option></option>")
						     .attr("value",item.value)
						     .text(item.text));					
						});

						/*  var selectBox = $("#companyName").selectBoxIt().data('selectBox-selectBoxIt');			    
					    selectBox.selectOption(selectedValue); */ 
				 }
			});
		});
		 $( "body" ).on( "change", companyNameDropDownId , function(){
			$("#manufactureIdHidden").val(this.value);
			//alert(this.id);
			var nextDropDown = this.id.split('_');
			var productNameDropDown = "#productName_"+ nextDropDown[1];
			$("#vacationPlanningform").ajaxSubmit({
				url: "${pageContext.request.contextPath}/partner/getProductNames",
				type : "GET",
				data : {'categoryId' : $("#categoryidHidden").val(), 'manufactureId' : $("#manufactureIdHidden").val()},
				 success: function(msg){
					 $(productNameDropDown).empty();
						/* $(productNameDropDown).data("selectBox-selectBoxIt").add({ value: "-1", text: " --Select--"}); */
						$.each(msg, function(index, item) {					
							$(productNameDropDown)
						     .append($("<option></option>")
						     .attr("value",item.value)
						     .text(item.text));				
						});

						$(productNameDropDown).val(selectedValue);
				 }
			});
		}); 
		 validateProduct(productNameDropDown);
	}
	$("select").each(function(){
		
		//alert(this.id);
		//var productcategoryDropDownId = this.id;
		var productcategoryDropDownId = "#"+this.id;
		if(productcategoryDropDownId.indexOf("productCategory")>-1){
			//alert('applying on change for productCategory');
			$( "body" ).on( "change", productcategoryDropDownId , function(){
				
				$("#categoryidHidden").val(this.value);
				//alert(this.id);
				var nextDropDown = this.id.split('_');
				var companyNameDropDown = "#companyName_"+ nextDropDown[1];
				var productNameDropDown = "#productName_"+ nextDropDown[1];
				$("#vacationPlanningform").ajaxSubmit({
					url: "${pageContext.request.contextPath}/partner/getComapnyNames",
					type : "GET",
					data : {'categoryId' : $("#categoryidHidden").val()},
					 success: function(msg){
						 $(companyNameDropDown).empty();
							//$(companyNameDropDown).data("selectBox-selectBoxIt").add({ value: "-1", text: " --SelectCompany--"});
							$.each(msg, function(index, item) {					
								$(companyNameDropDown)
							     .append($("<option></option>")
							     .attr("value",item.value)
							     .text(item.text));					
							});
							$(productNameDropDown).empty();
							$(productNameDropDown)
					    	.append($("<option></option>")
					    	.attr("value","-1")
					    	.text('-- Select --'));
					 }
				});
			});
		}
		
		});
	checkDataAtStart();
	
    $(function() {

		$(document).ajaxStop(function() {
			 $('#page_loader').fadeOut();
		});

		$(document).ajaxStart(function() {
			 $('#page_loader').fadeIn();
		});

	});
	
});

var validationFlag=1;

	 function companyNameUpdate(){
		//alert('companyNameUpdate');
		$("#categoryidHidden").val(this.value);
		 $("#vacationPlanningform").ajaxSubmit({
				url: "${pageContext.request.contextPath}/partner/getComapnyNames",
				type : "GET",
				data : {'categoryId' : $("#categoryidHidden").val()},
				 success: function(msg){
					 $("#companyName").empty();
						//$("#companyName").data("selectBox-selectBoxIt").add({ value: "-1", text: " --Select--"});
						$.each(msg, function(index, item) {					
							$("#companyName")
						     .append($("<option></option>")
						     .attr("value",item.value)
						     .text(item.text));					
						});

						$("#companyName").val(selectedValue);
				 }
		 });
		 return false;
	}; 
	function formSubmit(){
		checkDataAtSubmit();
		if(validationFlag==1){
			$("#vacationPlanningform").submit();	
		}else if(validationFlag==0){
			displayMsg("<spring:message code='fillDataCorrectly' />");
		}else if(validationFlag==-1){
			displayMsg("<spring:message code='deleteDataGT0' />");
		}
	}
	function formCancel(){
		checkDataAtSubmit();
		//alert($("#productCategoryValuesInitial").val() != $("#productCategoryValuesFinal").val());
		//alert($("#companyNameValuesInitial").val() != $("#productCategoryValuesFinal").val());
		//alert($("#productCategoryValuesInitial").val() != $("#productCategoryValuesFinal").val());
		if(($("#productCategoryValuesInitial").val() != $("#productCategoryValuesFinal").val()) || ($("#companyNameValuesInitial").val() != $("#companyNameValuesFinal").val()) ||
				($("#productNameValuesInitial").val() != $("#productNameValuesFinal").val())){
				var r = confirmCancel("The data has changed. Are you sure you want to exit.");
		}else {
			$('#vacationPlanningform').attr('action', '${pageContext.request.contextPath}/partner/recommendation');
			$("#vacationPlanningform").submit();
		}
	}
	function back(){
		$('#vacationPlanningform').attr('action', '${pageContext.request.contextPath}/partner/recommendation');
		$("#vacationPlanningform").submit();
	}
	function next(){
		$('#vacationPlanningform').attr('action', '${pageContext.request.contextPath}/partner/successionPlanning');
		$("#vacationPlanningform").submit();
	}
	function checkDataAtStart(){
		var productCategoryValues = [];
		var companyNameValues = [];
		var productNameValues = [];
		var noOfDropDowns = $("#noOfDropDownRowsHidden").val();
		for(var i =1; i <= noOfDropDowns; i++){
			var productCategoryDropDown = "#productCategory_"+i;
			var companyNameDropDown = "#companyName_"+i;
			var productNameDropDown = "#productName_"+i;
			productCategoryValues.push($(productCategoryDropDown).val());
			companyNameValues.push($(companyNameDropDown).val());
			productNameValues.push($(productNameDropDown).val());
		}
 		/* $("#productCategoryValuesInitial").val(productCategoryValues);
		$("#companyNameValuesInitial").val(companyNameValues);
		$("#productNameValuesInitial").val(productNameValues); */ 
		
	}
	function checkDataAtSubmit(){
		var productCategoryValues = [];
		var companyNameValues = [];
		var productNameValues = [];
		validationFlag=1;
		var productCount=0;
		var noOfDropDowns = $("#noOfDropDownRowsHidden").val();
		for(var i =1; i <= noOfDropDowns; i++){
			var productCategoryDropDown = "#productCategory_"+i;
			var companyNameDropDown = "#companyName_"+i;
			var productNameDropDown = "#productName_"+i;
				if($(productCategoryDropDown).val() && $(productCategoryDropDown).val()!=-1){
					if($(productCategoryDropDown).val() == null){
						productCategoryValues.push(-1);
						validationFlag=0;
					}else{
					productCategoryValues.push($(productCategoryDropDown).val());
					}
					if($(companyNameDropDown).val() == null){
						companyNameValues.push(-1);
						validationFlag=0;
					}else{
						companyNameValues.push($(companyNameDropDown).val());
					}
					if($(productNameDropDown).val() == null){
						productNameValues.push(-1);
						validationFlag=0;
					}else{
						productNameValues.push($(productNameDropDown).val());
					}
					if($(companyNameDropDown).val()==-1 || $(productNameDropDown).val()==-1){
						validationFlag=0;
					}	

					productCount=productCount+1;
				}					
		}
		if(productCount==0){
			validationFlag=-1;
		}	
 		/* $("#productCategoryValuesFinal").val(productCategoryValues);
		$("#companyNameValuesFinal").val(companyNameValues);
		$("#productNameValuesFinal").val(productNameValues); */
		
	}
	function jsonPopulateCompanyName(url, data, dropdown, fieldName, selectedValue) {
		$(dropdown).empty();
		//$(dropdown).data("selectBox-selectBoxIt").add({ value: "-1", text: " -- Select --"});
		$(dropdown)
    	.append($("<option></option>")
    	.attr("value","-1")
    	.text('-- Select --'));
		$.ajax({
				type : "GET",
				url : url,
				data : {'categoryId' : data},
				contentType : "application/json; charset=utf-8",
				dataType : "json",
				success : function(msg) {
					$.each(msg, function(index, item) {					
						$(dropdown)
					     .append($("<option></option>")
					     .attr("value",item.value)
					     .text(item.text));					
					});

					$(dropdown).val(selectedValue);
				    //------
				    //var productcategoryDropDownId = "#"+this.id;
						$( "body" ).on( "change", dropdown , function(){
							$("#manufactureIdHidden").val(this.value);
							//alert($(productcategoryDropDownId).val());
							var nextDropDown = this.id.split('_');
							var productNameDropDown = "#productName_"+ nextDropDown[1];
							var productcategoryDropDown = "#productCategory_"+ nextDropDown[1];
						//	alert($(productcategoryDropDown).val());
							 $.ajax({
								url: "${pageContext.request.contextPath}/partner/getProductNames",
								type : "GET",
								data : {'categoryId' : $(productcategoryDropDown).val(), 'manufactureId' : $("#manufactureIdHidden").val()},
								 success: function(msg){
									 $(productNameDropDown).empty();
										//$(productNameDropDown).data("selectBox-selectBoxIt").add({ value: "-1", text: " --SelectProduct--"});
										$.each(msg, function(index, item) {					
											$(productNameDropDown)
										     .append($("<option></option>")
										     .attr("value",item.value)
										     .text(item.text));					
										});

										    //var selectBox = $("#companyName").selectBoxIt().data('selectBox-selectBoxIt');			    
									    //selectBox.selectOption(selectedValue);    
								 }
							});
						});
				    //--------
				},
				error : function(msg) {
					$('.result').html(msg.d);
				}
			});
		return false;
	}
	function jsonPopulateProductName(url, categoryId, manufactureId, dropdown, fieldName, selectedValue) {
		$(dropdown).empty();
		//$(dropdown).data("selectBox-selectBoxIt").add({ value: "-1", text: " -- Select --"});
		
		$.ajax({
				type : "GET",
				url : url,
				data : {'categoryId' : categoryId, 'manufactureId' : manufactureId},
				contentType : "application/json; charset=utf-8",
				dataType : "json",
				success : function(msg) {
					$.each(msg, function(index, item) {					
						$(dropdown)
					     .append($("<option></option>")
					     .attr("value",item.value)
					     .text(item.text));		
					});

					$(dropdown).val(selectedValue);
				},
				error : function(msg) {
					$('.result').html(msg.d);
				}
			});
		return false;
	}
	function validateProduct(productNameDropDown){
		$( "body" ).on( "change", productNameDropDown , function(){
			 var pieces=this.id.split("_");
			 var dropDownId="#productName_"+pieces[1];
			 var selectedProduct=$(dropDownId+" option:selected").text();
			 var noOfDropDowns = $("#noOfDropDownRowsHidden").val();
				for(var i =1; i <= noOfDropDowns; i++){
					var productNameDropDown = "#productName_"+i;
					if($(dropDownId).val()!="-1" && dropDownId!=productNameDropDown){
						if($(dropDownId).val()==$(productNameDropDown).val()){
							$(dropDownId).val("-1");
							/* var selectBox = $(dropDownId).selectBoxIt().data('selectBox-selectBoxIt');			    
							selectBox.selectOption("-1");
							 */displayMsg("You have already selected "+selectedProduct+" product.");
						}
					}
				}
		 });
	}
	function checkDropDown(categoryId){
	//	alert('in checkDropDown'+categoryId);
		//var data = ${companyNameDD_0};
		$.ajax({
			type : "GET",
			url : "/partner/getComapnyNames",
			data : {'categoryId' : categoryId},
			contentType : "application/json; charset=utf-8",
			dataType : "json",
			success : function(msg) {
				//populate: {"data": [{"value":-1,"text":"---select---"},{"value":48012,"text":"File Tax Returns"},{"value":48013,"text":"Advanced Tax"}]},
				//var jsonString = "data"+":[{"+"value"+":"+item.value+","text":"---Selects---"}
			    		                  // ]
				$.each(msg, function(index, item) {	
			//	alert('in success'+item.text);
				});
			},
			error : function(msg) {
				$('.result').html(msg.d);
			}
		});
	}
</script>
</html>
