<!DOCTYPE html>
<html lang="en"><head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
<title>Financial Plan - Personal Information</title>
</head>
<body>

<jsp:include page="../../common/header.jsp" />
<jsp:include page="../../common/common_popup.jsp" />
 
<input type="hidden" name="dcInputUsername" id="dcInputUsername" value="${sessionScope.dcInputUsername}">	
<input type="hidden" name="dcInputDocId_AnalysisReport" id="dcInputDocId_AnalysisReport" value="${sessionScope.dcInputDocId_AnalysisReport}">
<input type="hidden" name="redirectToPage" id="redirectToPage" value="${sessionScope.redirectToClient}">
 <script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery.caret.js"></script>
	
<script src="<%=request.getContextPath()%>/js/jquery.form.js"></script>
<script type="text/javascript">
//var $jq_1_9_2 = $.noConflict();

$(document).ready(
		function() {
//				$('#dcinputname').attr('margin-left','5px');
			$('#dcinputname').append($('#dcInputUsername').val());
			
		});
</script>
 	
 <!-- Center part start -->
 <section>
    <div class="container ">
    	<div class="container-head">
        
          <div class="col-md-12" style="text-align: right;">
          <span style="float:left; font-weight:bold;" id="dcinputname"> Financial Plan for&nbsp;<i class="opportunityicon" > </i> </span>  
          <span> 
          <input class="dcbutton" type="button" value="Exit"  id="exit" onclick="redirectToOpportunity()"  name="Exit"> </span>
        </div >
      </div >
       
        <div class="container-body " style="padding:5px;">
        
        </div>
	  	<div class="container-body">
      <div class="col-md-12">
       	<div class="col-md-3" style="padding-left:10px;"><img src="<%=request.getContextPath()%>/images/${sessionScope.userSession.themeName}/personalinfo.jpg" ></div>
      	<div class="col-md-6 dchead " style="padding-left:10px;">FINANCIAL PLAN </div>
      <div class="col-md-3" style="text-align:right;"><img src="<%=request.getContextPath()%>/images/${sessionScope.userSession.themeName}/personalinfo.gif"></div>
      </div>
      
        <!-- center -->
     
  <jsp:include page="sidebar.jsp">
		<jsp:param name="param1" value="personalInfo" />
	</jsp:include>
        <div class="col-md-9"  style="margin-top:10px; padding-left:10px;"  >
			
 <!-- center -->
        
         <div class="list-group">
        		<a class="list-group-item active" href="#">Personal Information</a>
                <!-- accordion start-->
           <!-- accordion  END -->
           <!-- accordion End -->
                
           <div class="list-group-item">
       
   	

		<form id="personalInfoForm" method="post" enctype="multipart/form-data" action="<%=request.getContextPath()%>/dc/saveDCPersonalInfoDetails.htm">
								<div class="row">
									<!-- About You Start-->
									<img
										src="<%=request.getContextPath()%>/images/${sessionScope.userSession.themeName}/aboutYouAxis.png"
										class="img-responsive">

									<div class="widget-box" style="margin-top: 10px;">
										<div class="widget-header">
											<h5 class="widget-title">Your Photo (Optional)</h5>
										</div>

										<div class="widget-body">
											<div class="widget-main clearfix">
												<div class="row">
													<div class="form-group col-md-6 clearfix">                
													<img
														src="<%=request.getContextPath()%>/images/shubhachintak/chatuser.png"
														onerror="showDefaultImageOnError(id)" id="photoImage"
														style="width: 50%; height: 50%">
													<label id="photoFileName"></label>
													</div>													
												</div>
												<div class="row">
													<div class="form-group col-md-6 clearfix">
														<!-- <button class="btn-primary btn " type="button" id="Change"
														name="Change" onclick="$('#contactPhoto').click()">Change</button> -->
														<input type="file" name="contactPhoto" class="hide" id="contactPhoto">

													</div>
												</div>
											</div>									
									</div>
								</div>
								<!-- end-->
								<div class="space-8"></div>
								
    <div class="widget-box" style="margin-top: 10px;">
        	<div class="widget-header">
				<h5 class="widget-title"><a id="aboutus"></a>Personal Details</h5>
			</div>
			<div class="widget-body">
			<div class="widget-main clearfix">
			 <div class="row">
              <div class="form-group col-md-12 clearfix">
               <div class="col-sm-3">
                  <select name="salutationID" id="salutationID" class="input-xxlarge">
                  </select>
                </div>
                <div class="col-sm-9">
                  <input type="text" id="name" name="name" class="input-xxlarge" readonly="readonly" placeholder="Name"/>
                </div>
              </div>            
            </div>
			
			<div class="row">
              <div class="form-group col-md-12 clearfix">              
                <label class="col-sm-3" for="dob" class="input-xxlarge">Date of Birth <span class="red">*</span></label>
               	<div class="col-md-9">
             		<input type="text" class="input-xxlarge" title="Date Of Birth" name="dob" id="dob" validate="2" emsg="Date Of Birth">
           		 </div>             
              </div>            
            </div>

			<div class="row">
              <div class="form-group col-md-12 clearfix">              
                <label class="col-sm-3" for="dob" class="input-xxlarge">Contact No. </label>
               	<div class="col-md-9">
             		<input type="text" class="input-xxlarge" title="Contact No." onkeydown="allowIntegersOnly(id,event)" name="contactMobile" id="contactMobile" emsg="Contact No.">
           		 </div>             
              </div>            
            </div>

            <div class="row">
              <div class="form-group col-md-12 clearfix">              
                <label class="col-sm-3" for="dob" class="input-xxlarge">Email <span class="red">*</span></label>
               	<div class="col-md-9">
             		<input type="text" class="input-xxlarge" title="Email" name="contactEmail" id="contactEmail" validate="3" emsg="Email">
           		 </div>             
              </div>            
            </div>
            
			<div class="row">
              <div class="form-group col-md-12 clearfix">              
                <label class="col-sm-3" for="panNo" class="input-xxlarge">PAN No.</label>
               	<div class="col-md-9">
             		<input type="text" class="input-xxlarge" name="panNo" id="panNo" validate="pan" emsg="PAN No.">
           		 </div>             
              </div>            
            </div>
                      
            <div class="row">
              <div class="form-group col-md-12 clearfix">              
                <label class="col-sm-3" for="occupation" class="input-xxlarge">Occupation</label>
               	<div class="col-md-9">
             		<select name="occupation" id="occupation" class="input-xxlarge"></select>
           		 </div>             
              </div>            
            </div>
            
         
         	<div class="row">
              <div class="form-group col-md-12 clearfix">              
                <label class="col-sm-3" for="experience" class="input-xxlarge">Exp. in years </label>
               	<div class="col-md-9">
             		<input type="text" class="input-xxlarge" name="experience" id="experience" maxlength="3" onkeydown="allowIntegersOnly(id,event)" emsg="Exp. in years">
           		 </div>             
              </div>            
            </div>
            
             <div class="row">
              <div class="form-group col-md-12 clearfix">              
                <label class="col-sm-3" for="organization" class="input-xxlarge">Organization</label>
               	<div class="col-md-9">
             		<input type="text" class="input-xxlarge" name="organization" id="organization" emsg="Organization">
           		 </div>             
              </div>            
            </div>   
                	
            </div>                 
            </div>                      
          </div>
          
          <div class="space-8"></div>
            <!-- About You Start-->
          <div class="widget-box" style="margin-top:10px;">
        	<div class="widget-header">
        	 	<h5 class="widget-title"><a id="immediatefamily"></a>Your Immediate Family</h5>
        	</div>
          <div class="widget-body">
         	<div class="widget-main clearfix">
          	<table class="table table-striped" cellpadding="1" cellspacing="3" id="immediateFamilyTable">
                    <tr>
                      <td width="17%"><strong>Relationship</strong></td>
                      <td width="20%"><strong>First Name</strong></td>
                      <td width="20%"><strong>Last Name</strong></td>
                      <td width="15%"><strong>Work Profession</strong></td>
                      <td width="15%"><strong>DOB</strong></td>
                      <td width="12%"><strong>Age</strong></td>
<!--                       <td width="22%">&nbsp;</td> -->
                    </tr>
                    <tr id="spouseRow">
                      <td width="17%">Spouse</td>
                      <td width="20%"><input name="spouseName" style="width: 70% !important;" class="form-control  pull-left" type="text" id="spouseName"  value="" onkeyup="nospecialCharacters(id,event)" width="200px">
                      &nbsp;<a class="choose2" href="#" id="lookup" onclick="showClientPopup(${sessionScope.userSession.partyId},'spouseName');"><i class="ace-icon glyphicon glyphicon-search northspace2" title="Click here to select from existing contact"></i></a></td>
                      <td width="20%"><input style="box-shadow:none;width: 70% !important;" name="spouseLname" class="form-control  pull-left" type="text" id="spouseLname"  value="" ></td>
                      <td width="15%"><select style="box-shadow:none;width: 90%;margin-left:-15px; !important;" validate="workprofessionSpouse" emsg="PAN No" name="workprofessionSpouse" class="form-control  pull-left"  id="workprofessionSpouse"   width="50px"></select></td>
                      <td width="15%"><input name="spouseDob" validate="date" emsg="DOB" onchange="setAgeFromDOB('spouseDob','')" class="form-control  pull-left dob" type="text" id="spouseDob"  value=""  width="200px"></td>
                      <td width="12%">
                        <input name="spouseAge" readonly="readonly" class="form-control  pull-left" type="text" id="spouseAge"  value="" width="100px !important;" maxlength="3" onkeydown="allowIntegersOnly(id,event)"/>                     </td>
                        <input type="hidden" id="spousePartyId" value="0"><input type="hidden" name="spouseSelectedFromContact" id="spouseSelectedFromContact" value="false">                      
                    </tr>                   
               </table>
          	   </div>         	  	
            </div>                                      
          </div>
          <!-- end-->          
          <div class="space-8"></div>
          
          <!-- Extended -->
           <div class="widget-box" style="margin-top:10px;">
        	<div class="widget-header">
        	 	<h5 class="widget-title"><a id="extendedfamily"></a>Parents, In-laws and Siblings</h5>
        	</div>
          <div class="widget-body">
          	<div class="widget-main clearfix">
            <table class="table table-striped" cellpadding="1" cellspacing="3" id="extendedFamilyTable">
              <tr>
                <td width="17%"><strong>Relationship</strong></td>
                      <td width="20%"><strong>First Name</strong></td>
                      <td width="20%"><strong>Last Name</strong></td>
                      <td width="15%"><strong>Work Profession</strong></td>
                      <td width="15%"><strong>DOB</strong></td>
                      <td width="12%"><strong>Age</strong></td>
              </tr>
              <tr>
                <td width="17%">Mother</td>
                <td width="20%"><input name="motherName" style="width: 70% !important;" class="form-control  pull-left" type="text" id="motherName" onkeyup="nospecialCharacters(id,event)">
                &nbsp;<a class="choose2" href="#" id="lookupmother" onclick="showClientPopup(${sessionScope.userSession.partyId},id);"><i class="ace-icon glyphicon glyphicon-search northspace2" title="Click here to select from existing contact"></i></a></td>
                 <td width="20%"><input style="box-shadow:none;width: 70% !important;" name="motherLname" class="form-control  pull-left" type="text" id="motherLname"  value="" ></td>
                  <td width="15%"><select style="box-shadow:none;width: 90%;margin-left:-15px; !important;" validate="workprofessionMother" emsg="PAN No" name="workprofessionMother" class="form-control  pull-left"  id="workprofessionMother"   width="50px"></select></td>
                 <td width="15%" ><input name="motherDob" validate="date" emsg="DOB" onchange="setAgeFromDOB('motherDob','')" class="form-control  pull-left dob" type="text" id="motherDob"  value=""  ></td>
                <td width="12%"><input name="motherAge" readonly="readonly" class="form-control  pull-left" type="text" id="motherAge"  value="" width="100px !important;" maxlength="3" onkeydown="allowIntegersOnly(id,event)"/>
                </td><input type="hidden" id="motherPartyId" value="0"><input type="hidden" name="motherSelectedFromContact" id="motherSelectedFromContact" value="false">
<!--                 <td>&nbsp;</td> -->
              </tr>
              <tr>
                <td width="17%">Father</td>
                <td width="20%" style="width: 300px"><input name="fatherName" style="width: 70% !important;" class="form-control  pull-left" type="text" id="fatherName" onkeyup="nospecialCharacters(id,event)" >
                &nbsp;<a class="choose2" href="#" id="father" onclick="showClientPopup(${sessionScope.userSession.partyId},id);"><i class="ace-icon glyphicon glyphicon-search northspace2" title="Click here to select from existing contact"></i></a></td>
               <td width="20%"><input style="box-shadow:none;width: 70% !important;" name="fatherLname" class="form-control  pull-left" type="text" id="fatherLname"  value="" ></td>
                <td width="15%"><select style="box-shadow:none;width: 90%;margin-left:-15px; !important;" validate="workprofessionFather" emsg="PAN No" name="workprofessionFather" class="form-control  pull-left"  id="workprofessionFather"   width="50px"></select></td>
                <td width="15%"><input name="fatherDob" validate="date" emsg="DOB"  onchange="setAgeFromDOB('fatherDob','')" class="form-control  pull-left dob" type="text" id="fatherDob"  value=""  ></td>
                <td width="12%"><input name="fatherAge" readonly="readonly" class="form-control  pull-left" type="text" id="fatherAge"  value="" width="100px !important;" maxlength="3" onkeydown="allowIntegersOnly(id,event)"/>
                </td> <input type="hidden" id="fatherPartyId" value="0"><input type="hidden" name="fatherSelectedFromContact" id="fatherSelectedFromContact" value="false">
<!--                 <td>&nbsp;</td> -->
              </tr>
              <tr>
                <td width="17%">Mother in law </td>
                <td width="20%" style="width: 300px"><input name="motherInLawName" style="width: 70% !important;" class="form-control  pull-left" type="text" id="motherInLawName" onkeyup="nospecialCharacters(id,event)">
				&nbsp;<a class="choose2" href="#" id="motherInLaw" onclick="showClientPopup(${sessionScope.userSession.partyId},id);"><i class="ace-icon glyphicon glyphicon-search northspace2" title="Click here to select from existing contact"></i></a></td>
                <td width="20%"><input style="box-shadow:none;width: 70% !important;" name="motherInLawLname" class="form-control  pull-left" type="text" id="motherInLawLname"  value="" ></td>
                <td width="15%"><select style="box-shadow:none;width: 90%;margin-left:-15px; !important;" validate="workprofessionMotherInLow" emsg="PAN No" name="workprofessionMotherInLow" class="form-control  pull-left"  id="workprofessionMotherInLow"   width="50px"></select></td>
                <td width="15%"><input name="motherInLawDob" validate="date" emsg="DOB"  onchange="setAgeFromDOB('motherInLawDob','')" class="form-control  pull-left dob" type="text" id="motherInLawDob"  value=""  ></td>
                <td width="12%"><input name="motherInLawAge" readonly="readonly" class="form-control  pull-left" type="text" id="motherInLawAge"  value="" width="100px !important;" maxlength="3" onkeydown="allowIntegersOnly(id,event)"/>
                </td><input type="hidden" id="motherInLawPartyId" value="0"><input type="hidden" name="motherInLawSelectedFromContact" id="motherInLawSelectedFromContact" value="false">
<!--                 <td>&nbsp;</td> -->
              </tr>
              <tr id="fatherInLawRow">
                <td width="17%">Father in law </td>
                <td width="20%"><input name="fatherInLawName" style="width: 70% !important;" class="form-control  pull-left" type="text" id="fatherInLawName"  value="" onkeyup="nospecialCharacters(id,event)">
               &nbsp;<a class="choose2" href="#" id="fatherInLaw" onclick="showClientPopup(${sessionScope.userSession.partyId},id);"><i class="ace-icon glyphicon glyphicon-search northspace2" title="Click here to select from existing contact"></i></a></td>
               <td width="20%"><input style="box-shadow:none;width: 70% !important;" name="fatherInLawLname" class="form-control  pull-left" type="text" id="fatherInLawLname"  value="" ></td>
               <td width="15%"><select style="box-shadow:none;width: 90%;margin-left:-15px; !important;" validate="workprofessionFatherInLow" emsg="PAN No" name="workprofessionFatherInLow" class="form-control  pull-left"  id="workprofessionFatherInLow"   width="50px"></select></td>
                <td width="15%"><input name="fatherInLawDob" validate="date" emsg="DOB"  onchange="setAgeFromDOB('fatherInLawDob','')" class="form-control  pull-left dob" type="text" id="fatherInLawDob"  value=""  ></td>
                <td width="12%"><input name="fatherInLawAge" readonly="readonly" class="form-control  pull-left" type="text" id="fatherInLawAge"  value="" width="100px !important;" maxlength="3" onkeydown="allowIntegersOnly(id,event)"/>
                </td><input type="hidden" id="fatherInLawPartyId" value="0"><input type="hidden" name="fatherInlowSelectedFromContact" id="fatherInlowSelectedFromContact" value="false">
<!--                 <td>&nbsp;</td> -->
              </tr>
               <tr id="hufRow">
                <td width="17%">HUF </td>
                <td width="20%"><input name="huf" style="width: 70% !important;" class="form-control  pull-left" type="text" id="huf" value="" onkeyup="nospecialCharacters(id,event)" >
                &nbsp;<a class="choose2" href="#" id="huf" onclick="showClientPopup(${sessionScope.userSession.partyId},id);"><i class="ace-icon glyphicon glyphicon-search northspace2" title="Click here to select from existing contact"></i></a></td>
                 <td width="20%"><input style="box-shadow:none;width: 70% !important;" name="HUFLname" class="form-control  pull-left" type="text" id="HUFLname"  value="" ></td>
                <td width="15%"><select style="box-shadow:none;width: 90%;margin-left:-15px; !important;" validate="workprofessionHuf" emsg="PAN No" name="workprofessionHuf" class="form-control  pull-left"  id="workprofessionHuf"   width="50px"></select></td>
                <td width="15%"><input name="hufDob" validate="date" emsg="DOB"  onchange="setAgeFromDOB('hufDob','')" class="form-control  pull-left dob" type="text" id="hufDob"  value=""  ></td>
                <td width="12%"><input name="hufAge" readonly="readonly" class="form-control  pull-left" type="text" id="hufAge"  value="" width="100px !important;" maxlength="3" onkeydown="allowIntegersOnly(id,event)"/>
                </td>
                <input type="hidden" id="HUFPartyId" value="0"> <input type="hidden" name="hufSelectedFromContact" id="hufSelectedFromContact" value="false">
<!--                 <td>&nbsp;</td> -->
              </tr>
              
            </table>
            </div>
            
          </div>                                      
          </div>
          
            <div class="space-8"></div>
          <!-- end-->
           <div class="topmenu pull-right"> 
           	<button class="btn-primary btn btn-xs" type="button" id="Save" name="Save" onclick="savePersonalInfo(0)">Save</button>           	 
           	<button class="btn-primary btn btn-xs" type="button" id="Cancel" name="Cancel" onclick="redirectDcInput()">Cancel</button>
           	<button class="btn-primary btn btn-xs" type="button" id="Next" name="Next" onclick="savePersonalInfo(1)">Next</button>            
        </div> 
        </div>
        <input type="hidden" name="familyMemberXml" id="familyMemberXml">
       </form>
        
        
    </div>
</div>
</div></div>      	<br/><br/>
       	</div>
</div>
      
<!-- Center part End -->          

<jsp:include page="../../common/footer.jsp" />
<script>
var immediateFamilyList;
var extendedFamilyList;
var isImageSelected=0;
var workProfessionSelect;

$(function() {
	personalInfoReady();
	
});

function personalInfoReady(){
	$('tr[name="child"]').remove();
	$('tr[name="sibbling"]').remove();
	
	try{
		$('.dob').datepicker({
			changeMonth : true,
			changeYear : true,
			maxDate : '0',
			yearRange : "1900:2200",
			dateFormat : "dd/mm/yy"

		});
		}catch(e){
			try{
			$jq_1_9_1('.dob').datepicker({
				changeMonth : true,
				changeYear : true,
				maxDate : '0',
				yearRange : "1900:2200",
				dateFormat : "dd/mm/yy"

			});
			}catch(e){
				$jq_1_9_2('.dob').datepicker({
					changeMonth : true,
					changeYear : true,
					maxDate : '0',
					yearRange : "1900:2200",
					dateFormat : "dd/mm/yy"

				});
			}
		}
	
	
	$.ajax({
		type : "POST",
		url : $('#contextPath').val()+'/common/getPicklistValues.htm?codeTypeIds=81,65',
		success : function(result) {
			$('#salutationID').empty();
			$('#salutationID').append('<option value="0">--Select--</option>');
			$('#occupation').empty();
			$('#occupation').append('<option value="0">--Select--</option>');
			$('#workprofessionSpouse').append('<option value="0">---Select---</option>');
			$('#workprofessionMother').append('<option value="0">---Select---</option>');
			$('#workprofessionFather').append('<option value="0">---Select---</option>');
			$('#workprofessionMotherInLow').append('<option value="0">---Select---</option>');
			$('#workprofessionFatherInLow').append('<option value="0">---Select---</option>');
			$('#workprofessionHuf').append('<option value="0">---Select---</option>');
			workProfessionSelect = '<select style="box-shadow:none;width: 90%;margin-left:-15px; !important;" validate="workprofession" emsg="PAN No" name="workprofession"  class="form-control  pull-left" id="workprofession"   width="50px">';
			workProfessionSelect+='<option value="0">--Select--</option>';
			$(result).each(function(i,obj) {
				var codeTypeId=obj.codeTypeId;
				var codeValue=obj.codeValue;
				var codevalueId=obj.codeValueId;
// 				salutation-81
				if(codeTypeId==81){
				$('#salutationID').append('<option value="'+codevalueId+'">'+codeValue+'</option>');
				} else if(codeTypeId==65){
				$('#occupation').append('<option value="'+codevalueId+'">'+codeValue+'</option>');
				$('#workprofessionSpouse').append('<option value="'+codevalueId+'">'+codeValue+'</option>');
				$('#workprofessionMother').append('<option value="'+codevalueId+'">'+codeValue+'</option>');
				$('#workprofessionFather').append('<option value="'+codevalueId+'">'+codeValue+'</option>');
				$('#workprofessionMotherInLow').append('<option value="'+codevalueId+'">'+codeValue+'</option>');
				$('#workprofessionFatherInLow').append('<option value="'+codevalueId+'">'+codeValue+'</option>');
				$('#workprofessionHuf').append('<option value="'+codevalueId+'">'+codeValue+'</option>');
				workProfessionSelect+='<option value="'+codevalueId+'">'+codeValue+'</option>';
				}
			});
				$.ajax({
					type : "POST",
					url : $('#contextPath').val()+'/dc/getDCPersonalInfoDetails.htm',
					success : function(result) {
						var salutationID=result.salutationID;
						var name=result.name;
						//alert('name='+name)
						var panNo=result.panNo;
						var contactMobile=result.contactMobile;
						var contactEmail=result.contactEmail;
						var dob=result.dob;//
						var occupation=result.occupation;
						var organization=result.organization;
						var experience=result.experience;
						var photo=result.photo;
						var spouseName=result.spouseName;
						var spouseDob=result.spouseDob;
						var spouseAge=result.spouseAge;
						var motherName=result.motherName;
						var motherDob=result.motherDob;
						var motherAge=result.motherAge;
						var fatherName=result.fatherName;
						var fatherDob=result.fatherDob;
						var fatherAge=result.fatherAge;
						var motherInLawName=result.motherInLawName;
						var motherInLawDob=result.motherInLawDob;
						var motherInLawAge=result.motherInLawAge;
						var fatherInLawName=result.fatherInLawName;
						var fatherInLawDob=result.fatherInLawDob;
						var fatherInLawAge=result.fatherInLawAge;
						var hufDob = result.hufDob;
						var huf = result.huf;
						var hufAge = result.hufAge;
						
						
						
						var familyMemberDataList=result.familyMemberDataList;
						var occupationList = result.occupationList;
						
// 						alert(photo)
						if(photo!=''){
							$('#photoImage').attr('src',$('#contextPath').val()+'/'+photo);
						}
						
						
						$('#salutationID').val(salutationID);
						$('#name').val(name);
						$('#panNo').val(panNo);
						$('#contactMobile').val(contactMobile);
						$('#contactEmail').val(contactEmail);
						$('#dob').val(dob);
						
						$('#organization').val(organization);
						if(experience!=0)
						$('#experience').val(experience);
						try{
							$('#dob').datepicker({
								changeMonth : true,
								changeYear : true,
								maxDate : '0',
								yearRange : "1900:2200",
								dateFormat : "dd/mm/yy"

							});
							}catch(e){
								try{
								$jq_1_9_1('#dob').datepicker({
									changeMonth : true,
									changeYear : true,
									maxDate : '0',
									yearRange : "1900:2200",
									dateFormat : "dd/mm/yy"

								});
								}catch(e){
									$jq_1_9_2('#dob').datepicker({
										changeMonth : true,
										changeYear : true,
										maxDate : '0',
										yearRange : "1900:2200",
										dateFormat : "dd/mm/yy"

									});
								}
							}
// 						$('#spouseDob').val(spouseDob);
// 						$('#motherDob').val(motherDob);
// 						$('#fatherDob').val(fatherDob);
// 						$('#motherInLawDob').val(motherInLawDob);
// 						$('#fatherInLawDob').val(fatherInLawDob);
						
						
						
						
// 						$('#spouseName').val(spouseName);
// 						if(spouseName.trim()==' ' || spouseName.trim()== '')
// 						{
						
// 						}
// 						else{
// 							$('#lookup').hide();
// 						}
// // 						if(spouseAge!=0)
// 						$('#spouseAge').val(spouseAge);
// 						$('#motherName').val(motherName);
// 						if(motherName.trim()=='')
// 						{
							
// 						}
// 						else{
							
// 							$('#lookupmother').hide();
// 						}
						
// // 						if(motherAge!=0)
// 						$('#motherAge').val(motherAge);
// 						$('#fatherName').val(fatherName);
// 						if(fatherName.trim()=='')
// 						{
							
// 						}
// 						else{
							
// 							$('#father').hide();
// 						}
// // 						if(fatherAge!=0)
// 						$('#fatherAge').val(fatherAge);
// 						$('#motherInLawName').val(motherInLawName);
// 						if(motherInLawName.trim()=='')
// 						{
							
// 						}
// 						else{
							
// 							$('#motherInLaw').hide();
// 						}
// // 						if(motherInLawAge!=0)
// 						$('#motherInLawAge').val(motherInLawAge);
// 						$('#fatherInLawName').val(fatherInLawName);
// 						if(fatherInLawName.trim()=='')
// 						{
							
// 						}
// 						else{
							
// 							$('#fatherInLaw').hide();
// 						}
// // 						if(fatherInLawAge!=0)
// 						$('#fatherInLawAge').val(fatherInLawAge);
						
// 						$('#huf').val(huf);
// 						if(huf.trim()=='')
// 						{
							
// 						}
// 						else{
							
// 							$('#huf').hide();
// 						}
// // 						if(fatherInLawAge!=0)
// 						$('#hufAge').val(hufAge);
// 						$('#hufDob').val(hufDob);

						
						var childCounter=0;
						var sibblingCounter=0;
						var isAnyChild=0;
						var isAnySibbling=0;
// 						alert(familyMemberDataList.length)
						$(familyMemberDataList).each(function(i,obj) {
							var firstName=obj.firstName;
							var lastName=obj.lastName;
							var dob=obj.dob;
							var age=obj.age==0?0:obj.age;
							var relationshipId=obj.relationshipId;
							var familyType=obj.familyType;
							var partyId=obj.partyId;
							var workProfession= obj.workProfession;
// 							alert(partyId)
							if(relationshipId==26001){
//	 							alert('Hi'+lastName);
//	 							alert('Hello'+panNo);
								$('#spouseDob').val(dob);
							$('#spouseName').val(firstName);
							$('#spouseLname').val(lastName);
						
							$('#spouseAge').val(age);
							$('#spousePartyId').val(partyId);
							$('#workprofessionSpouse').val(workProfession);
								if(partyId=='' || partyId==0 || partyId=='0')
									{
									
									}
								else{
									$('#lookup').hide();
								}
								
							}else if(relationshipId==26011){
								$('#motherDob').val(dob);
								$('#motherName').val(firstName);
								$('#motherLname').val(lastName);
							
//		 						if(motherAge!=0)
								$('#motherAge').val(age);
								$('#motherPartyId').val(partyId);
								$('#workprofessionMother').val(workProfession);
								
								if(partyId=='' || partyId==0 || partyId=='0')
								{
									
								}
								else{
									
									$('#lookupmother').hide();
								}
							}else if(relationshipId==26010){
								$('#fatherName').val(firstName);
								$('#fatherLname').val(lastName);
							
//		 						if(fatherAge!=0)
								$('#fatherAge').val(age);
								$('#fatherDob').val(dob);
								$('#fatherPartyId').val(partyId);
								$('#workprofessionFather').val(workProfession);
								if(partyId=='' || partyId==0 || partyId=='0')
								{
								
								}
								else{
									$('#father').hide();
								}
							}else if(relationshipId==26005){
								$('#motherInLawName').val(firstName);
								$('#motherInLawLname').val(lastName);
								
//		 						if(motherInLawAge!=0)
								$('#motherInLawAge').val(age);
								$('#motherInLawDob').val(dob);
								$('#motherInLawPartyId').val(partyId);
								$('#workprofessionMotherInLow').val(workProfession);
								if(partyId=='' || partyId==0 || partyId=='0')
								{
								
								}
								else{
									$('#motherInLaw').hide();
								}
							}else if(relationshipId==26014){
								$('#fatherInLawName').val(firstName);
								$('#fatherInLawLname').val(lastName);
							
//		 						if(fatherInLawAge!=0)
								$('#fatherInLawAge').val(age);
								$('#fatherInLawDob').val(dob);
								$('#fatherInLawPartyId').val(partyId);
								$('#workprofessionFatherInLow').val(workProfession);
								if(partyId=='' || partyId==0 || partyId=='0')
								{
								
								}
								else{
									$('#fatherInLaw').hide();
								}
							}else if(relationshipId==26015){
								$('#huf').val(firstName);
								$('#HUFLname').val(lastName);
								
//		 						if(fatherInLawAge!=0)
								$('#hufAge').val(age);
								$('#hufDob').val(dob);
								$('#HUFPartyId').val(partyId);
								$('#workprofessionHuf').val(workProfession);
								if(partyId=='' || partyId==0 || partyId=='0')
								{
								//alert('in if')
								}
								else{
									//alert('in else');
									$('#huf1').hide();
								}
							}else{

							if(familyType==26002){
								isAnyChild=1;
								childCounter+=1;
// 									$('#immediateFamilyTable').append('<tr id="childRow'+childCounter+'" name="child"><td><span id="child1" >Child '+childCounter+'</span></td><td><input name="childname" type="text" id="childname'+childCounter+'" width="200px" class="form-control  pull-left"  value="'+name+'" /></td><td><input name="childage" class="form-control  pull-left" type="text" id="childage'+childCounter+'"  value="'+age+'" /></td><td width="22%" ><a  onClick="addRow(\'child\');" alt="Add Child" title="Add Child" id="childplusicon"> <i class="addicon"  style="display: inline;"> </i></a></td></tr>');
									$('#immediateFamilyTable').append('<tr id="childRow'+childCounter+'" name="child"><td width="17%"> <span id="child1" >Child '+childCounter+'</span></td><td  width="20%"><input name="childname" type="text" id="childname'+childCounter+'" onkeyup="nospecialCharacters(id,event)" style="width:70% !important;" width="200px" class="form-control  pull-left"  value="'+firstName+'" /><input type="hidden" id="partyIdchild'+childCounter+'"  value="'+partyId+'"></td><td width="20%"><input style="box-shadow:none;width: 70% !important;" name="childLname" class="form-control  pull-left" type="text" id="childLname'+childCounter+'"  value="'+lastName+'" ></td><td width="15%">'+workProfessionSelect+'</td><td width="15%"><input name="childDob" validate="date" emsg="DOB"  value="'+dob+'" onchange="setAgeFromDOB(name,'+childCounter+')" class="form-control  pull-left dob" type="text" id="childDob'+childCounter+'"  value=""  width="200px"></td><td  width="12%"><input readonly="readonly" name="childage" class="form-control  pull-left" type="text" id="childage'+childCounter+'"  value="'+age+'" maxlength="3" onkeydown="allowIntegersOnly(id,event)"/></td><td width="22%" id="tdchild'+childCounter+'"></td></tr>');
									$('#childRow'+childCounter + ' #workprofession ').val(workProfession);
							}else if(familyType==26004){
								isAnySibbling=1;
								sibblingCounter+=1;
									$('#extendedFamilyTable').append('<tr id="sibblingRow'+sibblingCounter+'" name="sibbling"><td width="17%">Sibling '+sibblingCounter+'</td><td   width="20%"><input name="sibblingname" class="form-control  pull-left" type="text" id="sibblingname'+sibblingCounter+'" onkeyup="nospecialCharacters(id,event)" style="width:70% !important;"  value="'+firstName+'" / width="200px"><input type="hidden" id="partyIdsibbling'+sibblingCounter+'"  value="'+partyId+'"></td><td width="20%"><input style="box-shadow:none;width: 70% !important;" name="sibblingLname" class="form-control  pull-left" type="text" id="sibblingLname'+sibblingCounter+'"  value="'+lastName+'" ></td><td width="15%">'+workProfessionSelect+'</td><td width="15%"><input name="sibblingDob" validate="date" emsg="DOB"  value="'+dob+'" onchange="setAgeFromDOB(name,'+sibblingCounter+')" class="form-control  pull-left dob" type="text" id="sibblingDob'+sibblingCounter+'"  value=""  width="200px"></td></td><td   width="12%"><input name="sibblingage" readonly="readonly" class="form-control  pull-left" type="text" id="sibblingage'+sibblingCounter+'"  value="'+age+'" width="100px !important;" maxlength="3" onkeydown="allowIntegersOnly(id,event)"/></td><td width="22%" id="tdsibbling'+sibblingCounter+'"></td></tr>');
									$('#sibblingRow'+sibblingCounter + ' #workprofession ').val(workProfession);
							}
							}
						});
						
						$('#occupation').val(occupation);
						if(isAnyChild==1){
							$('#tdchild'+childCounter).append('<a  onClick="addRow(\'child\');" alt="Add Child" title="Add Child" id="childplusicon"> <i class="ace-icon glyphicon glyphicon-plus"></i></a>');
						}else{
							childCounter=1;
							$('#immediateFamilyTable').append('<tr id="childRow'+childCounter+'" name="child"><td width="17%"><span id="child1" >Child '+childCounter+'</span></td><td  width="20%"><input name="childname" style="width: 70% !important;" type="text" id="childname'+childCounter+'" onkeyup="nospecialCharacters(id,event)" width="200px" class="form-control  pull-left"   /><input type="hidden" id="partyIdchild'+childCounter+'"  value="0"><input type="hidden" name="childSelectedFromContact'+childCounter+'" id="childSelectedFromContact'+childCounter+'" value="false"> <a class="choose2" href="#" id="lookupchild'+childCounter+'" onclick="showClientPopup(${sessionScope.userSession.partyId},id);" ><i class="ace-icon glyphicon glyphicon-search northspace2" title="Click here to select from existing contact"></i></a></td><td width="20%"><input style="box-shadow:none;width: 70% !important;" name="childLname" class="form-control  pull-left" type="text" id="childLname'+childCounter+'"   ></td><td width="15%">'+workProfessionSelect+'</td><td width="15%"><input name="childDob" class="form-control  pull-left dob" validate="date" emsg="DOB"  onchange="setAgeFromDOB(name,'+childCounter+')" type="text" id="childDob'+childCounter+'"  value=""  width="200px"></td></td><td   width="12%"><input name="childage" readonly="readonly" class="form-control  pull-left" type="text" id="childage'+childCounter+'"   maxlength="3" onkeydown="allowIntegersOnly(id,event)"/></td><td width="22%" id="tdchild'+childCounter+'"></td></tr>');
							$('#tdchild'+childCounter).append('<a  onClick="addRow(\'child\');" alt="Add Child" title="Add Child" id="childplusicon"> <i class="ace-icon glyphicon glyphicon-plus"></i></a>');
						}
						
						if(isAnySibbling==1){
							$('#tdsibbling'+sibblingCounter).append('<a  onClick="addRow(\'sibbling\');" alt="Add Child" title="Add Child" id="sibblingplusicon"> <i class="ace-icon glyphicon glyphicon-plus"></i></a>');
						}else{
							sibblingCounter=1;
							$('#extendedFamilyTable').append('<tr id="sibblingRow'+sibblingCounter+'" name="sibbling"><td width="17%">Sibling '+sibblingCounter+'</td><td   width="20%"><input name="sibblingname" style="width: 70% !important;"  class="form-control  pull-left" type="text" id="sibblingname'+sibblingCounter+'" onkeyup="nospecialCharacters(id,event)" width="200px"><input type="hidden" id="partyIdsibbling'+sibblingCounter+'"  value="0"><input type="hidden" name="sibblingSelectedFromContact'+sibblingCounter+'" id="sibblingSelectedFromContact'+sibblingCounter+'" value="false"><a class="choose2" href="#" id="lookupsibbling'+sibblingCounter+'" onclick="showClientPopup(${sessionScope.userSession.partyId},id);"><i class="ace-icon glyphicon glyphicon-search northspace2" title="Click here to select from existing contact"></i></a></td><td width="20%"><input style="box-shadow:none;width: 70% !important;" name="sibblingLname" class="form-control  pull-left" type="text" id="sibblingLname'+sibblingCounter+'"  ></td><td width="15%">'+workProfessionSelect+'</td><td width="15%"><input name="sibblingDob" type="text" class="form-control  pull-left dob" validate="date" emsg="DOB"  onchange="setAgeFromDOB(name,'+sibblingCounter+')" id="sibblingDob'+childCounter+'"  value=""  width="200px"></td></td><td   width="12%"><input name="sibblingage" readonly="readonly" class="form-control  pull-left" type="text" id="sibblingage'+sibblingCounter+'"   width="100px !important;" maxlength="3" onkeydown="allowIntegersOnly(id,event)"/></td><td width="22%" id="tdsibbling'+sibblingCounter+'"></td></tr>');
							$('#tdsibbling'+sibblingCounter).append('<a  onClick="addRow(\'sibbling\');" alt="Add Child" title="Add Child" id="sibblingplusicon"> <i class="ace-icon glyphicon glyphicon-plus"></i></a>');
						}
						try{
							$('.dob').datepicker({
								changeMonth : true,
								changeYear : true,
								maxDate : '0',
								yearRange : "1900:2200",
								dateFormat : "dd/mm/yy"

							});
							}catch(e){
								try{
								$jq_1_9_1('.dob').datepicker({
									changeMonth : true,
									changeYear : true,
									maxDate : '0',
									yearRange : "1900:2200",
									dateFormat : "dd/mm/yy"

								});
								}catch(e){
									$jq_1_9_2('.dob').datepicker({
										changeMonth : true,
										changeYear : true,
										maxDate : '0',
										yearRange : "1900:2200",
										dateFormat : "dd/mm/yy"

									});
								}
							}
					}
				});
			}});
}

function addRow(name){
	
	var totalRow = $('tr[name="'+name+'"]').size();
	if(name=='child'){
		$('#childplusicon').remove();
		$('#immediateFamilyTable').append('<tr id="childRow'+(totalRow+1)+'" name="child"><td width="17%"><span id="child1" >Child '+(totalRow+1)+'</span></td><td  width="20%"><input name="childname" type="text" style="width: 70% !important;" id="childname'+(totalRow+1)+'" onkeyup="nospecialCharacters(id,event)" width="200px" class="form-control  pull-left"   /><input type="hidden" id="partyIdchild'+(totalRow+1)+'"  value="0"><input type="hidden" name="childSelectedFromContact'+(totalRow+1)+'" id="childSelectedFromContact'+(totalRow+1)+'" value="false"> <a class="choose2" href="#" id="lookupchild'+(totalRow+1)+'" onclick="showClientPopup(${sessionScope.userSession.partyId},id);"><i class="ace-icon glyphicon glyphicon-search northspace2" title="Click here to select from existing contact"></i></a></td><td width="20%"><input style="box-shadow:none;width: 70% !important;" name="childLname" class="form-control  pull-left" type="text" id="childLname'+(totalRow+1)+'"   ></td><td width="15%">'+workProfessionSelect+'</td><td width="15%"><input name="childDob" class="form-control  pull-left dob" onchange="setAgeFromDOB(name,'+(totalRow+1)+')" validate="date" emsg="DOB"  type="text" id="childDob'+(totalRow+1)+'"  value=""  width="200px"></td></td><td   width="12%"><input name="childage" readonly="readonly" type="text" id="childage'+(totalRow+1)+'"  class="form-control  pull-left" maxlength="3" onkeydown="allowIntegersOnly(id,event)"/></td><td width="22%"><a id="childplusicon" onClick="addRow(\'child\');" alt="Add Child" title="Add Child"> <i class="ace-icon glyphicon glyphicon-plus"></i></a></td></tr>');
	}else{
		$('#sibblingplusicon').remove();
		$('#extendedFamilyTable').append('<tr id="sibblingRow'+(totalRow+1)+'" name="sibbling"><td width="17%">Sibling '+(totalRow+1)+'</td><td   width="20%"><input name="sibblingname" style="width: 70% !important;" class="form-control  pull-left" type="text" id="sibblingname'+(totalRow+1)+'" onkeyup="nospecialCharacters(id,event)"  width="200px"><input type="hidden" id="partyIdsibbling'+(totalRow+1)+'"  value="0"><input type="hidden" name="sibblingSelectedFromContact'+(totalRow+1)+'" id="sibblingSelectedFromContact'+(totalRow+1)+'" value="false"><a class="choose2" href="#" id="lookupsibbling'+(totalRow+1)+'" onclick="showClientPopup(${sessionScope.userSession.partyId},id);"><i class="ace-icon glyphicon glyphicon-search northspace2" title="Click here to select from existing contact"></i></a></td><td width="20%"><input style="box-shadow:none;width: 70% !important;" name="sibblingLname" class="form-control  pull-left" type="text" id="sibblingLname'+(totalRow+1)+'"  ></td><td width="15%">'+workProfessionSelect+'</td> <td width="15%"><input name="sibblingDob" class="form-control  pull-left dob" onchange="setAgeFromDOB(name,'+(totalRow+1)+')" validate="date" emsg="DOB"  type="text" id="sibblingDob'+(totalRow+1)+'"  value=""  width="200px"></td></td><td   width="12%"><input name="sibblingage" readonly="readonly" class="form-control  pull-left" type="text" id="sibblingage'+(totalRow+1)+'"   width="100px !important;" maxlength="3" onkeydown="allowIntegersOnly(id,event)"/></td><td width="22%"><a id="sibblingplusicon"  onClick="addRow(\'sibbling\');" alt="Add More " title="Add Sibbling"> <i class="ace-icon glyphicon glyphicon-plus"></i></a></td></tr>');
	}
	try{
		$('.dob').datepicker({
			changeMonth : true,
			changeYear : true,
			maxDate : '0',
			yearRange : "1900:2200",
			dateFormat : "dd/mm/yy"

		});
		}catch(e){
			try{
			$jq_1_9_1('.dob').datepicker({
				changeMonth : true,
				changeYear : true,
				maxDate : '0',
				yearRange : "1900:2200",
				dateFormat : "dd/mm/yy"

			});
			}catch(e){
				$jq_1_9_2('.dob').datepicker({
					changeMonth : true,
					changeYear : true,
					maxDate : '0',
					yearRange : "1900:2200",
					dateFormat : "dd/mm/yy"

				});
			}
		}
}


$('#contactPhoto').change(function() {
	var extensionToCheck=$('#contactPhoto').val().substring(($('#contactPhoto').val()
			.lastIndexOf('.') + 1));
	if (extensionToCheck == 'jpg' || extensionToCheck == 'jpeg'
		|| extensionToCheck == 'png' || extensionToCheck == 'gif'
		|| extensionToCheck == 'ioc' || extensionToCheck == 'bmp'
		|| extensionToCheck == 'psd' || extensionToCheck == 'tif'
		|| extensionToCheck == 'pspimage' || extensionToCheck == 'thm'
		|| extensionToCheck == 'yuv' || extensionToCheck == 'ai'
		|| extensionToCheck == 'drw' || extensionToCheck == 'eps'
		|| extensionToCheck == 'ps' || extensionToCheck == 'svg') {
		$('#photoFileName').html($('#contactPhoto').val().substring($('#contactPhoto').val().lastIndexOf('\\')+1));
		isImageSelected=1;
	}else{
// 		alert('please select valid image');
		showAlertMessage1("Error", "Please Select Valid Image." + '\n', "confirmation", doNothing);
		$('#contactPhoto').val('');
		$('#photoFileName').html('');
		isImageSelected=0;
	}
	
	
// 	$('#photoImage').hide();
})

function savePersonalInfo(isNext){
	var isValidated=true;
	var isPopupOpen=false;
	var partyIdArray = new Array();
	isValidated=validateInputForm('personalInfoForm');
	if(isValidated==false){
		isPopupOpen=true;
	}
	var id;
	var count=0;
	var experience=$('#experience').val();
	if(experience=='' || experience==undefined)
		$('#experience').val(0);
	if($('#spouseAge').val()=='' || $('#spouseAge').val()==undefined)
		$('#spouseAge').val(0);
	if($('#motherAge').val()=='' || $('#motherAge').val()==undefined)
		$('#motherAge').val(0);
	if($('#fatherAge').val()=='' || $('#fatherAge').val()==undefined)
		$('#fatherAge').val(0);
	if($('#motherInLawAge').val()=='' || $('#motherInLawAge').val()==undefined)
		$('#motherInLawAge').val(0);
	if($('#fatherInLawAge').val()=='' || $('#fatherInLawAge').val()==undefined)
		$('#fatherInLawAge').val(0);
	
	if($('#hufAge').val()=='' || $('#hufAge').val()==undefined)
		$('#hufAge').val(0);
	
	if($('#spouseLname').val()!==''){
		$('#spouseLname').css('border-color','grey');
		$('#spouseLname').removeAttr('title');
	}else if($('#spouseDob').val()!=''){
		$('#spouseLname').css('border-color','red');
		$('#spouseLname').attr('title', 'Please Enter Last Name.');
		isValidated=false;
	}else if($('#spouseName').val()!=''){
		$('#spouseLname').css('border-color','red');
		$('#spouseLname').attr('title', 'Please Enter Last Name.');
		isValidated=false;
	}
	else if($('#workprofessionSpouse').val()!='0'){
		$('#spouseLname').css('border-color','red');
		$('#spouseLname').attr('title', 'Please Enter Last Name.');
		isValidated=false;
	}
	else{
		$('#spouseLname').css('border-color','grey');
		$('#spouseLname').removeAttr('title');
		
	}
	
	if($('#motherLname').val()!==''){
		$('#motherLname').css('border-color','grey');
		$('#motherLname').removeAttr('title');
	}else if($('#motherDob').val()!=''){
		$('#motherLname').css('border-color','red');
		$('#motherLname').attr('title', 'Please Enter Last Name.');
		isValidated=false;
	}else if($('#motherName').val()!=''){
		$('#motherLname').css('border-color','red');
		$('#motherLname').attr('title', 'Please Enter Last Name.');
		isValidated=false;
	}
	else if($('#workprofessionMother').val()!='0'){
		$('#motherLname').css('border-color','red');
		$('#motherLname').attr('title', 'Please Enter Last Name.');
		isValidated=false;
	}
	else{
		$('#motherLname').css('border-color','grey');
		$('#motherLname').removeAttr('title');
		
	}
	
	if($('#fatherLname').val()!==''){
		$('#fatherLname').css('border-color','grey');
		$('#fatherLname').removeAttr('title');
	}else if($('#fatherDob').val()!=''){
		$('#fatherLname').css('border-color','red');
		$('#fatherLname').attr('title', 'Please Enter Last Name.');
		isValidated=false;
	}else if($('#fatherName').val()!=''){
		$('#fatherLname').css('border-color','red');
		$('#fatherLname').attr('title', 'Please Enter Last Name.');
		isValidated=false;
	}else if($('#workprofessionFather').val()!='0'){
		$('#fatherLname').css('border-color','red');
		$('#fatherLname').attr('title', 'Please Enter Last Name.');
		isValidated=false;
	}
	else{
		$('#fatherLname').css('border-color','grey');
		$('#fatherLname').removeAttr('title');
		
	}
	
	if($('#motherInLawLname').val()!==''){
		$('#motherInLawLname').css('border-color','grey');
		$('#motherInLawLname').removeAttr('title');
	}else if($('#motherInLawDob').val()!=''){
		$('#motherInLawLname').css('border-color','red');
		$('#motherInLawLname').attr('title', 'Please Enter Last Name.');
		isValidated=false;
	}else if($('#motherInLawName').val()!=''){
		$('#motherInLawLname').css('border-color','red');
		$('#motherInLawLname').attr('title', 'Please Enter Last Name.');
		isValidated=false;
	}else if($('#workprofessionMotherInLow').val()!='0'){
		$('#motherInLawLname').css('border-color','red');
		$('#motherInLawLname').attr('title', 'Please Enter Last Name.');
		isValidated=false;
	}
	else{
		$('#motherInLawLname').css('border-color','grey');
		$('#motherInLawLname').removeAttr('title');
		
	}
	
	if($('#fatherInLawLname').val()!==''){
		$('#fatherInLawLname').css('border-color','grey');
		$('#fatherInLawLname').removeAttr('title');
	}else if($('#fatherInLawDob').val()!=''){
		$('#fatherInLawLname').css('border-color','red');
		$('#fatherInLawLname').attr('title', 'Please Enter Name.');
		isValidated=false;
	}else if($('#fatherInLawName').val()!=''){
		$('#fatherInLawLname').css('border-color','red');
		$('#fatherInLawLname').attr('title', 'Please Enter Last Name.');
		isValidated=false;
	}
	else if($('#workprofessionFatherInLow').val()!='0'){
		$('#fatherInLawLname').css('border-color','red');
		$('#fatherInLawLname').attr('title', 'Please Enter Last Name.');
		isValidated=false;
	}
	else{
		$('#fatherInLawLname').css('border-color','grey');
		$('#fatherInLawLname').removeAttr('title');
		
	}
	console.log('huf dob='+$('#hufDob').val())
	if($('#HUFLname').val()!==''){
		$('#HUFLname').css('border-color','grey');
		$('#HUFLname').removeAttr('title');
	}else if($('#hufDob').val()!='' ){
		$('#HUFLname').css('border-color','red');
		$('#HUFLname').attr('title', 'Please Enter Last Name.');
		isValidated=false;
	}else if($('#huf').val()!=''){
		$('#HUFLname').css('border-color','red');
		$('#HUFLname').attr('title', 'Please Enter Last Name.');
		isValidated=false;
	}
	else if($('#workprofessionHuf').val()!='0'){
		$('#HUFLname').css('border-color','red');
		$('#HUFLname').attr('title', 'Please Enter Last Name.');
		isValidated=false;
	}
	else{
		$('#HUFLname').css('border-color','grey');
		$('#HUFLname').removeAttr('title');
		
	}
	var familyMemberXml="";
	
	
	if(isValidated==true){
		var isselectedSpouse=$('#spouseSelectedFromContact').val();
		
		if($('#spouseLname').val()!=''){
		familyMemberXml+='<FamilyMember>';
		familyMemberXml+='<RelationshipId>26001</RelationshipId>';			
		familyMemberXml+='<Name>'+$('#spouseName').val()+'</Name>';
		//familyMemberXml+='<PanNo>'+$('#spousePAN').val()+'</PanNo>';
		familyMemberXml+='<DOB>'+$('#spouseDob').val()+'</DOB>';
		familyMemberXml+='<Age>'+$('#spouseAge').val()+'</Age>';
		familyMemberXml+='<PartyId>'+$('#spousePartyId').val()+'</PartyId>';
		familyMemberXml+='<selectedFromContact>'+isselectedSpouse+'</selectedFromContact>';	
		familyMemberXml+='<WorkProfession>'+$('#workprofessionSpouse').val()+'</WorkProfession>';
		familyMemberXml+='<LName>'+$('#spouseLname').val()+'</LName>';
		familyMemberXml+='</FamilyMember>';
		}
		if($('#motherLname').val()!=''){
		familyMemberXml+='<FamilyMember>';
		familyMemberXml+='<RelationshipId>26011</RelationshipId>';
		familyMemberXml+='<Name>'+$('#motherName').val()+'</Name>';
		//familyMemberXml+='<PanNo>'+$('#motherPAN').val()+'</PanNo>';
		familyMemberXml+='<DOB>'+$('#motherDob').val()+'</DOB>';
		familyMemberXml+='<Age>'+$('#motherAge').val()+'</Age>';
		familyMemberXml+='<PartyId>'+$('#motherPartyId').val()+'</PartyId>';
		familyMemberXml+='<selectedFromContact>'+$('#motherSelectedFromContact').val()+'</selectedFromContact>';	
		familyMemberXml+='<WorkProfession>'+$('#workprofessionMother').val()+'</WorkProfession>';
		familyMemberXml+='<LName>'+$('#motherLname').val()+'</LName>';
		familyMemberXml+='</FamilyMember>';
		}
		if($('#fatherLname').val()!=''){
		familyMemberXml+='<FamilyMember>';
		familyMemberXml+='<RelationshipId>26010</RelationshipId>';
		familyMemberXml+='<Name>'+$('#fatherName').val()+'</Name>';
		//familyMemberXml+='<PanNo>'+$('#fatherPAN').val()+'</PanNo>';
		familyMemberXml+='<DOB>'+$('#fatherDob').val()+'</DOB>';
		familyMemberXml+='<Age>'+$('#fatherAge').val()+'</Age>';
		familyMemberXml+='<PartyId>'+$('#fatherPartyId').val()+'</PartyId>';
		familyMemberXml+='<selectedFromContact>'+$('#fatherSelectedFromContact').val()+'</selectedFromContact>';
		familyMemberXml+='<WorkProfession>'+$('#workprofessionFather').val()+'</WorkProfession>';
		familyMemberXml+='<LName>'+$('#fatherLname').val()+'</LName>';
		familyMemberXml+='</FamilyMember>';
		}
		if($('#motherInLawLname').val()!=''){
		familyMemberXml+='<FamilyMember>';
		familyMemberXml+='<RelationshipId>26005</RelationshipId>';
		familyMemberXml+='<Name>'+$('#motherInLawName').val()+'</Name>';
		//familyMemberXml+='<PanNo>'+$('#motherInLawPAN').val()+'</PanNo>';
		familyMemberXml+='<DOB>'+$('#motherInLawDob').val()+'</DOB>';
		familyMemberXml+='<Age>'+$('#motherInLawAge').val()+'</Age>';
		familyMemberXml+='<PartyId>'+$('#motherInLawPartyId').val()+'</PartyId>';
		familyMemberXml+='<selectedFromContact>'+$('#motherInLawSelectedFromContact').val()+'</selectedFromContact>';	
		familyMemberXml+='<WorkProfession>'+$('#workprofessionMotherInLow').val()+'</WorkProfession>';
		familyMemberXml+='<LName>'+$('#motherInLawLname').val()+'</LName>';
		familyMemberXml+='</FamilyMember>';
		}
		if($('#fatherInLawLname').val()!=''){
		familyMemberXml+='<FamilyMember>';
		familyMemberXml+='<RelationshipId>26014</RelationshipId>';
		familyMemberXml+='<Name>'+$('#fatherInLawName').val()+'</Name>';
		//familyMemberXml+='<PanNo>'+$('#fatherInLawPAN').val()+'</PanNo>';
		familyMemberXml+='<DOB>'+$('#fatherInLawDob').val()+'</DOB>';
		familyMemberXml+='<Age>'+$('#fatherInLawAge').val()+'</Age>';
		familyMemberXml+='<PartyId>'+$('#fatherInLawPartyId').val()+'</PartyId>';
		familyMemberXml+='<selectedFromContact>'+$('#fatherInlowSelectedFromContact').val()+'</selectedFromContact>';	
		familyMemberXml+='<WorkProfession>'+$('#workprofessionFatherInLow').val()+'</WorkProfession>';
		familyMemberXml+='<LName>'+$('#fatherInLawLname').val()+'</LName>';
		familyMemberXml+='</FamilyMember>';
		}
		if($('#HUFLname').val()!=''){
		familyMemberXml+='<FamilyMember>';
		familyMemberXml+='<RelationshipId>26015</RelationshipId>';
		familyMemberXml+='<Name>'+$('#huf').val()+'</Name>';
		//familyMemberXml+='<PanNo>'+$('#HUFPAN').val()+'</PanNo>';
		familyMemberXml+='<DOB>'+$('#hufDob').val()+'</DOB>';
		familyMemberXml+='<Age>'+$('#hufAge').val()+'</Age>';
		familyMemberXml+='<PartyId>'+$('#HUFPartyId').val()+'</PartyId>';
		familyMemberXml+='<selectedFromContact>'+$('#hufSelectedFromContact').val()+'</selectedFromContact>';	
		familyMemberXml+='<WorkProfession>'+$('#workprofessionHuf').val()+'</WorkProfession>';
		familyMemberXml+='<LName>'+$('#HUFLname').val()+'</LName>';
		familyMemberXml+='</FamilyMember>';
		}
	}
	
	$('input[name="childname"]').each(function(i,obj) {
		var isValidRow=true;
		id=$(obj).attr('id');
		count=id.substring(id.indexOf('childname')+9);
		var name=$(obj).val();
		var firstName = $('#childLname'+count).val();
		var dob=$('#childDob'+count).val();
		var age=$('#childage'+count).val();
		var partyId=$('#partyIdchild'+count).val();
		var workprofession =$('#childRow'+count + ' #workprofession ').val();
		//alert('name='+name+',firstname='+firstName)
		if(firstName=='')
			{
			$('#childage'+count).val(0)
			age=0
			}
		
		if(age=='' || age==undefined)
			age=0;
		if(firstName!==''){
			isValidRow=true;
			$('#childLname'+count).css('border-color','grey');
			$('#childLname'+count).removeAttr('title');
		}else if(age!=0){
			$('#childLname'+count).css('border-color','red');
			$('#childLname'+count).attr('title', 'Please Enter Last Name.');
			isValidRow=false;
		}else if(name!=''){
			$('#childLname'+count).css('border-color','red');
			$('#childLname'+count).attr('title', 'Please Enter Last Name.');
			isValidRow=false;
		}
		
		else if(workprofession!='0'){
			$('#childLname'+count).css('border-color','red');
			$('#childLname'+count).attr('title', 'Please Enter Last Name.');
			isValidRow=false;
		}
		else{
			$('#childLname'+count).css('border-color','grey');
			$('#childLname'+count).removeAttr('title');
			
		}
		var isChilSelectedFromContact = $('#childSelectedFromContact'+count).val();
		if(isValidRow==true && firstName!==''){
			if(isChilSelectedFromContact==undefined || isChilSelectedFromContact=='undefined')
			{
			isChilSelectedFromContact=false;
			}
			familyMemberXml+='<FamilyMember>';
			familyMemberXml+='<RelationshipId>26002</RelationshipId>';
			familyMemberXml+='<Name>'+name+'</Name>';
			familyMemberXml+='<DOB>'+dob+'</DOB>';
			familyMemberXml+='<Age>'+age+'</Age>';
			familyMemberXml+='<PartyId>'+partyId+'</PartyId>';
			familyMemberXml+='<selectedFromContact>'+isChilSelectedFromContact+'</selectedFromContact>';
			familyMemberXml+='<WorkProfession>'+workprofession+'</WorkProfession>';
			familyMemberXml+='<LName>'+firstName+'</LName>';
			familyMemberXml+='</FamilyMember>';
			if(partyId==0)
			{
			
			}
		else{
			partyIdArray.push(partyId);
		}
		}else if(isValidRow==false){
			isValidated=false;
		}
		
	});
	count=0;
	$('input[name="sibblingname"]').each(function(i,obj) {
		var isValidRow=true;
		id=$(obj).attr('id');
		count=id.substring(id.indexOf('sibblingname')+12);
		var name=$(obj).val();
		var firstName = $('#sibblingLname'+count).val();
		var dob=$('#sibblingDob'+count).val();
		var age=$('#sibblingage'+count).val();
		var partyId=$('#partyIdsibbling'+count).val();
		var workprofession =$('#sibblingRow'+count + ' #workprofession ').val();
		if(firstName=='')
		{
		$('#sibblingage'+count).val(0)
		age=0
		}
		
		if(age=='' || age==undefined)
			age=0;
		if(firstName!==''){
			isValidRow=true;
			$('#sibblingLname'+count).css('border-color','grey');
			$('#sibblingLname'+count).removeAttr('title');
		}else if(age!=0){
			$('#sibblingLname'+count).css('border-color','red');
			$('#sibblingLname'+count).attr('title', 'Please Enter Last Name.');
			isValidRow=false;
		}else if(name!=''){
			$('#sibblingLname'+count).css('border-color','red');
			$('#sibblingLname'+count).attr('title', 'Please Enter Last Name.');
			isValidRow=false;
		}
		else if(workprofession!='0'){
			$('#sibblingLname'+count).css('border-color','red');
			$('#sibblingLname'+count).attr('title', 'Please Enter Last Name.');
			isValidRow=false;
		}
		else{
			$('#sibblingLname'+count).css('border-color','grey');
			$('#sibblingLname'+count).removeAttr('title');
			
		}
		var isSibblingSelectedFromContact = $('#sibblingSelectedFromContact'+count).val();
		if(isValidRow==true && firstName!==''){
			if(isSibblingSelectedFromContact==undefined || isSibblingSelectedFromContact=='undefined')
			{
				isSibblingSelectedFromContact=false;
			}
			familyMemberXml+='<FamilyMember>';
			familyMemberXml+='<RelationshipId>26004</RelationshipId>';
			familyMemberXml+='<Name>'+name+'</Name>';
			familyMemberXml+='<DOB>'+dob+'</DOB>';
			familyMemberXml+='<Age>'+age+'</Age>';
			familyMemberXml+='<PartyId>'+partyId+'</PartyId>';
			familyMemberXml+='<selectedFromContact>'+isSibblingSelectedFromContact+'</selectedFromContact>';
			familyMemberXml+='<WorkProfession>'+workprofession+'</WorkProfession>';
			familyMemberXml+='<LName>'+firstName+'</LName>';
			familyMemberXml+='</FamilyMember>';

			if(partyId==0)
				{
				
				}
			else{
				partyIdArray.push(partyId);
			}
		}else if(isValidRow==false){
			isValidated=false;
		}
		
	});
	if($('#spousePartyId').val()==0)
	{
	
	}
	else{
		partyIdArray.push($('#spousePartyId').val());
	}
	
	if($('#motherPartyId').val()==0)
	{
	
	}
	else{
		partyIdArray.push($('#motherPartyId').val());
	}
	if($('#fatherPartyId').val()==0)
	{
	
	}
	else{
		partyIdArray.push($('#fatherPartyId').val());
	}
	
	if($('#motherInLawPartyId').val()==0)
	{
	
	}
	else{
		partyIdArray.push($('#motherInLawPartyId').val());
	}
	if($('#fatherInLawPartyId').val()==0)
	{
	
	}
	else{
	partyIdArray.push($('#fatherInLawPartyId').val());
}

	if($('#HUFPartyId').val()==0)
	{
	
	}
	else{
		partyIdArray.push($('#HUFPartyId').val());
	}
	
	iValidateDuplicateParty=checkIfArrayIsUnique(partyIdArray);
	if(iValidateDuplicateParty==true && isPopupOpen==false)
	{
		showAlertMessage("Error", "<br/>Duplicate Family Member Selected.", "error", doNothing);	
	return ;
	}
// 	familyMemberXml+="/<Root>";
	$('#familyMemberXml').val(familyMemberXml);
	console.log('familyMemberXml:---'+familyMemberXml);
	
// 	enctype="multipart/form-data"
// 	var contactPhoto=$('#contactPhoto');
// 	isValidated=false;
var isDatacollectionChange = $('#dcInputDocId_AnalysisReport').val();
	if(isImageSelected==0 && isValidated==true){
		$.ajax({
			type : "POST",
			url : $('#contextPath').val()+'/dc/saveDCPersonalInfoDetails.htm',
			data:$('#personalInfoForm').serialize(),
			success : function(msg) {
				var result=msg[0];
				var isPanExist=msg[1];
				var isFamilyMemberPresent=msg[2];
// 				alert('isPanExist='+isPanExist);
// 				alert('result='+result);
// 				alert('isFamilyMemberPresent='+isFamilyMemberPresent);
            	
            	 if(isFamilyMemberPresent==1)
				{
				showAlertMessage("Error","You Can not delete family members which are present in sections.", 'error', doNothing);
				}
            	else{
				if(result=='success' && isImageSelected==1){
            		$('#photoImage').attr('src',$('#contextPath').val()+'/'+msg[1]);
            		if(isNext==1){
//             			localStorage.setItem('actionName',$('#contextPath').val()+'/DCFutureFinancialExpectationShubhchintak.htm');
            			localStorage.setItem('actionName',$('#contextPath').val()+'/RiskProfile.htm');
//             			showAlertMessage("Success", "<br/>Data saved successfully.", "confirmation", redirectFunction);
            			redirectFunction();
            		}else{
            			
            			//alert('doc id in personal info='+isDocIdAvailable);
            			if(isDatacollectionChange==0 || isDatacollectionChange=='0' || isDatacollectionChange==null )
            				{
            				showAlertMessage("Success", "<br/>Data saved successfully.", "confirmation", reloadPage);
            				
            				}
            			else{
            				showAlertMessage("Success", "<br/>Data saved successfully.Please click on Generate Report if you would like to see the revised Analysis Report.", "confirmation", reloadPage);		
            			}
            			
            		}
            		
            		$('#contactPhoto').val('');
            		$('#photoFileName').html('');
            		isImageSelected=0;
            	}else if(result=='success'){
            		if(isNext==1){
//             			localStorage.setItem('actionName',$('#contextPath').val()+'/DCFutureFinancialExpectationShubhchintak.htm');
						localStorage.setItem('actionName',$('#contextPath').val()+'/RiskProfile.htm');
//             			showAlertMessage("Success", "<br/>Data saved successfully.", "confirmation", redirectFunction);
						redirectFunction();
            		}else{
            			if(isDatacollectionChange==0 || isDatacollectionChange=='0' || isDatacollectionChange==null )
        				{
        				showAlertMessage("Success", "<br/>Data saved successfully.", "confirmation", reloadPage);	
//         				setTimeout(function(){
// 							disableOpportunityDiv("familyDetailsForm");
// 							  foo();
// 							},3000);
        				}
        			else{
        				showAlertMessage("Success", "<br/>Data saved successfully.Please click on Generate Report if you would like to see the revised Analysis Report.", "confirmation", reloadPage);		
        			}
            		}
            	}
            	}
			}
			
		});
	}else if(isValidated==true){
		$jq_1_9_2('#personalInfoForm').ajaxForm({
            success: function(msg) {
            	var result=msg[0];
            	if(result=='success' && isImageSelected==1){
            		$('#photoImage').attr('src',$('#contextPath').val()+'/'+msg[1]);
            		if(isNext==1){
//             			localStorage.setItem('actionName',$('#contextPath').val()+'/DCFutureFinancialExpectationShubhchintak.htm');
						localStorage.setItem('actionName',$('#contextPath').val()+'/RiskProfile.htm');
//             			showAlertMessage("Success", "<br/>Data saved successfully.", "confirmation", redirectFunction);
						redirectFunction();
						//isNewAnalysisReportGenerationRequired(1)
            		}else{
            			if(isDatacollectionChange==0 || isDatacollectionChange=='0' || isDatacollectionChange==null )
        				{
        				showAlertMessage("Success", "<br/>Data saved successfully.", "confirmation", reloadPage);	
        				}
        			else{
        				showAlertMessage("Success", "<br/>Data saved successfully.Please click on Generate Report if you would like to see the revised Analysis Report.", "confirmation", reloadPage);		
        			}
            		}
            		$('#contactPhoto').val('');
            		$('#photoFileName').html('');
            		isImageSelected=0;
            	}else if(result=='success'){
            		if(isNext==1){
//             			localStorage.setItem('actionName',$('#contextPath').val()+'/DCFutureFinancialExpectationShubhchintak.htm');
						localStorage.setItem('actionName',$('#contextPath').val()+'/RiskProfile.htm');
//             			showAlertMessage("Success", "<br/>Data saved successfully.", "confirmation", redirectFunction);
						redirectFunction();
            		}else{
            			if(isDatacollectionChange==0 || isDatacollectionChange=='0' || isDatacollectionChange==null )
        				{
        				showAlertMessage("Success", "<br/>Data saved successfully.", "confirmation", reloadPage);	
        				}
        			else{
        				showAlertMessage("Success", "<br/>Data saved successfully.Please click on Generate Report if you would like to see the revised Analysis Report.", "confirmation", reloadPage);		
        			}
            		}
            	}
//             	disableProfileDiv(id)
            },
            error: function(msg) {
            }, onComplete: function (data) {
            }
        }).submit();
	}else if(isPopupOpen==false){
		showAlertMessage("Error",
				"There are some validation errors on the page please check to proceed further.",
				"error", doNothing);
	}
	
}

function showClientPopup(partyId,Id){
	//alert('partyId='+partyId)
	//if(isEditFamilyMember==1){
	
	var searchString="";
	var isFromProfile=true;
	partyId=$('#partyIdFromRequest').val();
	  openPopupWebApp('centerLoadingImage', 25, 35);
// 	  $('#basecontactPartyIdForMerge').val(partyId);
	//  localStorage.setItem("basecontactPartyIdForMerge", partyId);
	var name;
		$.ajax({
		  url: $('#contextPath').val()+"/et/quickSearchContacts.htm?searchString="+searchString,
		  method:"post",
		  success:function(result){
			  $('#contactsDetails').empty();
			  $('#contactsDetails').append('<thead> <tr> <th class="thead">Select</th> <th class="thead"> <a href="#">First Name</a></th> <th class="thead"> <a href="#">Last Name</a></th><th class="thead"><a href="#">Pan No</a></th>  <th class="thead"> <a href="#">DOB</a></th><th class="thead"><a href="#">Age </a></th> </tr></thead>');
			  $(result).each(function(i,obj){
					var object = {};
					object.value = obj.partyId;
					name=obj.name;
					var fname = obj.fName;
					var lname = obj.lName;
					var name=fname +','+lname
					var panno=obj.panNo;
					var dob=obj.dob;
					var age=obj.age;
					var recordTypeId=obj.recordTypeId;
					//alert('')
					if(panno=='')
			  		{
						panno='0';	
			  		}
					if(dob=='')
						{
						dob='0'
						}
					if(age=='')
			  		{
						age='0'	
			  		}
					var contactIcon;
					var title;
					if(recordTypeId==14005)
					{
						contactIcon="opportunityicon";
						title="Opportunity";
					}
				else if(recordTypeId==14006)
					{
					contactIcon="pclienticon";
					title="Client";
					}
				else{
					contactIcon="clienticon";
					title="PremiumClient"
				}
					$('#contactsDetails').append('<tbody>');
					$('#contactsDetails').append("<tr><td><span class='thead'><a href='#' title='"+name+"' name='"+dob+"' id='"+panno+"'  onclick='showSelectedContactDetails("+Id+","+obj.partyId+",title,id,name,"+obj.age+");'>Select</a></td> <td ><i class="+contactIcon+" title="+title+"></i>"+fname+"</td> <td>"+lname+"</td> <td>"+obj.panNo+"</td> <td>"+obj.dob+"</td> <td>"+obj.age+"</td> </tr>");
					
					//$('#contactsDetails').append("<tr><td><span class='thead'><a href='#' title='"+name+"' name='"+dob+"' id='"+panno+"'  onclick='showSelectedContactDetails("+Id+","+obj.partyId+",title,id,name,"+obj.age+");'>Select</a></td> <td >"+name+"</td> <td>"+obj.panNo+"</td> <td>"+obj.dob+"</td> <td>"+obj.age+"</td> </tr>");
					$('#contactsDetails').append('</tbody>');
					
			 }); 
			$('#rowId').val(Id) ;
				
		  }
		});
	
	
	
	openClientPopup();
	//}
// 	$.ajax({
// 		type : 'POST',
// 		url : $('#contextPath').val()+"/client/getClientListToMerge.htm?contactpartyId=" + partyId+'&isAllClients='+isAllClients,
// 		success : function(result) {
// 			var firstname=result.firstName;
// 			alert('firstname='+firstname);
// 		}
// 	});
	
}
function showSelectedContactDetails(rowId,partyid,name,panno,dob,age)
{
	var nameArray =new Array();
	
	nameArray= name.split(',');
	//alert('nameArray='+nameArray)
	var fname= nameArray[0];
	var lname= nameArray[1];
	cloeseClientPopup();
	//senableClientDiv("familyDetailsForm");
	if(dob==0 || dob=='0')
		{
		dob="";
		}
	if(panno==0 || panno=='0')
	{
		panno="";
	}
	if(panno==0 || panno=='0')
	{
		panno="";
	}
	if(age==0 || age=='0')
	{
		age="";
	}
// 	alert('rowId='+rowId);
// 	alert('partyid='+partyid);
// 	alert('name='+name);
// 	alert('panno='+panno);
// 	alert('dob='+dob);
// 	alert('age='+age);
var isChild= false;
var isSibaling=false
var childCounter;
var siblingCounter;
var abc=$('#rowId').val().substring(11,12);
//alert('abc='+abc);
if($('#rowId').val().contains("lookupchild"))
	{
	isChild=true;
	childCounter=$('#rowId').val().substring(11,12);
	}
	if($('#rowId').val().contains("lookupsibbling"));
	{
	isSibaling=true;
	siblingCounter=$('#rowId').val().substring(14,15);
	}
// 	alert('isChild='+isChild)
// 	alert('counter='+childCounter);
// 	alert('isSibaling='+isSibaling)
// 	alert('siblingCounter='+siblingCounter);
// 	alert('rowId='+$('#rowId').val());
	var rowId = $('#rowId').val();
	//alert('rowId='+rowId);
	//alert('rowId='+rowId);
	//alert('isChild='+isChild)
	if(rowId=='spouseName'){
		$('#spouseDob').val(dob);
		$('#spouseName').val(fname);
		$('#spouseLname').val(lname)
		$('#spouseAge').val(age);
		$('#spousePartyId').val(partyid);
		$('#spouseSelectedFromContact').val(true);
		disebleRow(rowId)
	}
	else if(rowId=='lookupmother'){
		//alert('in mother if');
		$('#motherDob').val(dob);
		$('#motherName').val(fname);
		$('#motherLname').val(lname)
	
		$('#motherAge').val(age);
		$('#motherPartyId').val(partyid);
		$('#motherSelectedFromContact').val(true);
		disebleRow(rowId)
	}
	else if(rowId=='father')
	{
		$('#fatherName').val(fname);
		$('#fatherLname').val(lname);
	
//		if(fatherAge!=0)
	$('#fatherAge').val(age);
	$('#fatherDob').val(dob);
	$('#fatherPartyId').val(partyid);
	$('#fatherSelectedFromContact').val(true);
	disebleRow(rowId)
	}
else if(rowId=='motherInLaw')
{
	$('#motherInLawName').val(fname);
	$('#motherInLawLname').val(lname)
	
//		if(motherInLawAge!=0)
	$('#motherInLawAge').val(age);
	$('#motherInLawDob').val(dob);
	$('#motherInLawPartyId').val(partyid);
	$('#motherInLawSelectedFromContact').val(true);
	disebleRow(rowId)
}
else if(rowId=='fatherInLaw')
{
	$('#fatherInLawName').val(fname);
	$('#fatherInLawLname').val(lname);

//		if(fatherInLawAge!=0)
	$('#fatherInLawAge').val(age);
	$('#fatherInLawDob').val(dob);
	$('#fatherInLawPartyId').val(partyid);
	$('#fatherInlowSelectedFromContact').val(true);
	disebleRow(rowId)
}
else if(rowId=='huf1')
	{
	$('#huf').val(fname);
	$('#HUFLname').val(lname);
	$('#huf').show();
//		if(fatherInLawAge!=0)
	$('#hufAge').val(age);
	$('#hufDob').val(dob);
	$('#HUFPartyId').val(partyid);
	$('#hufSelectedFromContact').val(true);
	disebleRow(rowId)
	}
	
	else if(isChild==true)
		{
		$('#childname'+childCounter).val(fname)
		$('#childLname'+childCounter).val(lname)

		$('#childDob'+childCounter).val(dob)
		$('#childage'+childCounter).val(age)
		$('#partyIdchild'+childCounter).val(partyid)
		$('#childSelectedFromContact'+childCounter).val(true);
		disebleMultipleRow(childCounter,isChild,'child')
		}
	else if(isSibaling==true)
	{
		$('#sibblingname'+siblingCounter).val(fname);
		$('#sibblingLname'+siblingCounter).val(lname);

	$('#sibblingDob'+siblingCounter).val(dob);
	$('#sibblingage'+siblingCounter).val(age);
	$('#partyIdsibbling'+siblingCounter).val(partyid);
	$('#sibblingSelectedFromContact'+siblingCounter).val(true);
	disebleMultipleRow(siblingCounter,isSibaling,'sibling')
	}
	
	
}
function disebleRow(rowId)
{
	if(rowId=='spouseName'){
		$('#spouseDob').attr('disabled','disabled');
		$('#spouseName').attr('disabled','disabled');
		$('#spouseLname').attr('disabled','disabled');
		$('#spouseAge').attr('disabled','disabled');
	
	
		
	}
	else if(rowId=='lookupmother'){
		//alert('in mother if');
		$('#motherDob').attr('disabled','disabled');
		$('#motherName').attr('disabled','disabled');
		$('#motherLname').attr('disabled','disabled');
// 		$('#motherPAN').attr('disabled','disabled');
		$('#motherAge').attr('disabled','disabled');
		
		
	}
	else if(rowId=='father')
	{
	$('#fatherName').attr('disabled','disabled');
	$('#fatherLname').attr('disabled','disabled');
//		if(fatherAge!=0)
	$('#fatherAge').attr('disabled','disabled');
	$('#fatherDob').attr('disabled','disabled');

	}
else if(rowId=='motherInLaw')
{
	$('#motherInLawName').attr('disabled','disabled');
	$('#motherInLawLname').attr('disabled','disabled');
//	$('#motherInLawPAN').attr('disabled','disabled');
//		if(motherInLawAge!=0)
	$('#motherInLawAge').attr('disabled','disabled');
	$('#motherInLawDob').attr('disabled','disabled');

	
}
else if(rowId=='fatherInLaw')
{
	$('#fatherInLawName').attr('disabled','disabled');
	$('#fatherInLawLname').attr('disabled','disabled');
	//$('#fatherInLawPAN').attr('disabled','disabled');
//		if(fatherInLawAge!=0)
	$('#fatherInLawAge').attr('disabled','disabled');
	$('#fatherInLawDob').attr('disabled','disabled');
	
}
else if(rowId=='huf1')
	{
	$('#huf').attr('disabled','disabled');
	$('#HUFLname').attr('disabled','disabled');
	$('#huf').show();
//		if(fatherInLawAge!=0)
	$('#hufAge').attr('disabled','disabled');
	$('#hufDob').attr('disabled','disabled');

	}
	
}
//disebleMultipleRow(siblingCounter,isSibaling,'sibling')
function disebleMultipleRow(counter,type,mRow)
{
	//alert('counter='+counter + ' ,type='+type+'  ,mRow='+mRow)
	if(type==true && mRow=='child')
	{
	$('#childname'+counter).attr('disabled','disabled');
	$('#childLname'+counter).attr('disabled','disabled');
	$('#childDob'+counter).attr('disabled','disabled');
	$('#childage'+counter).attr('disabled','disabled');
	
	}
else if(type==true && mRow=='sibling')
{
$('#sibblingname'+counter).attr('disabled','disabled');
$('#sibblingLname'+counter).attr('disabled','disabled');
$('#sibblingDob'+counter).attr('disabled','disabled');
$('#sibblingage'+counter).attr('disabled','disabled');

}
}
	

</script>
<div class="modal fade" id="popUpOpenClient" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">Contacts</h4>
      </div>
      <div class="modal-body">
        <div class="row"><br>
          <br>
          <div class="list-group" id="changePasswordDetailsDiv" >
            <form id="mergeClientForm" class="clearfix" style="height:350px;overflow: auto">
              <input type="hidden" name="rowId" id="rowId" value="">
              <div class="table-responsive" id="display_table_lead" style="border:none;float: left;">
                <table class="table table-hover table-bordered table-striped" cellpadding="0" cellspacing="0" id="contactsDetails">
                  <thead>
                    <tr>
                      <th class="thead">Select</th>
                      <th class="thead"><a href="#">First Name</a></th>
                      <th class="thead"><a href="#">Last Name</a></th>
                      <th class="thead"><a href="#">Pan No</a></th>
                      <th class="thead"><a href="#">DOB</a></th>
                      <th class="thead"><a href="#">Age</a></th>
                    </tr>
                  </thead>
                </table>
              </div>
              <input type="hidden" id="basecontactPartyIdForMerge" name="c" value="${sessionScope.contactPartyIdForMerge}">
            </form>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>
</body>
</html>