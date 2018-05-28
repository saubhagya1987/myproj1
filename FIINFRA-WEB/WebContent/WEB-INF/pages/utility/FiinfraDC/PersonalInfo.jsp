<!DOCTYPE html>
<html lang="en"><head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
<title>Data Collection- Personal Information</title>
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
    <script src="<%=request.getContextPath()%>/js/jquery-1.js"></script>
    <script src="<%=request.getContextPath()%>/js/bootstrap.min.js"></script>
     <script src="<%=request.getContextPath()%>/js/bootstrap-responsive.js"></script>
      <script src="<%=request.getContextPath()%>/js/bootstrap-responsive.min.js"></script>
       <script src="<%=request.getContextPath()%>/js/bootstrap.js"></script>
    <script src="<%=request.getContextPath()%>/js/holder.js"></script>

    


<!-- -responsive css-->
<link href="<%=request.getContextPath()%>/css/bootstrap.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/css/carousel.css" rel="stylesheet">
<link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/css/popup.css" />
<link href="<%=request.getContextPath()%>/css/Ffreedom_dc.css" rel="stylesheet">
<!-- -responsive css-->
<script src="<%=request.getContextPath()%>/js/jquery.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/pop.js"></script>
	<script src="<%=request.getContextPath()%>/js/jquery-1.9.1.js"></script>
	<script src="<%=request.getContextPath()%>/js/jquery.ui.core.js"></script>
	<script src="<%=request.getContextPath()%>/js/jquery.ui.widget.js"></script>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/js/jquery.caret.js"></script>

<script src="<%=request.getContextPath()%>/js/jquery.form.js"></script>
<link href="<%=request.getContextPath()%>/images/favicon.ico" rel="shortcut icon">



<!--[if IE]>
		<script src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script>
	<![endif]-->

<!--[if lt IE 9]>
	<script src="http://ie7-js.googlecode.com/svn/version/2.1(beta4)/IE9.js"></script>
	<![endif]-->
<script type="text/javascript">
var $jq_1_9_2 = $.noConflict();
$(document)
.ready(
		function() {
//				$('#dcinputname').attr('margin-left','5px');
			$('#dcinputname').append($('#dcInputUsername').val());
			
		});
</script>
</head>
<body>

<jsp:include page="../../common/header.jsp" />
<jsp:include page="../../common/common_popup.jsp" />
 <input type="hidden" name="dcInputUsername" id="dcInputUsername" value="${sessionScope.dcInputUsername}">
   


 	
 <!-- Center part start -->
 <section>
 

 
     
    <div class="container white">
    	<div class="container-head">
        
          <div class="col-md-12" style="text-align: right;">
          <span style="float:left; font-weight:bold;" id="dcinputname"> Data Collection for&nbsp;<i class="opportunityicon" > </i> </span>  
          <span> 
          <input class="dcbutton" type="button" value="Exit"  id="exit" onclick="redirectToOpportunity()"  name="Exit"> </span>
        </div >
      </div>
       
        <div class="container-body " style="padding:5px;">
        
        </div>
	  	<div class="container-body">
      <div class="col-md-12">
       	<div class="col-md-3" style="padding-left:10px;"><img src="<%=request.getContextPath()%>/images/personalinfo.jpg" ></div>
      	<div class="col-md-6 dchead " style="padding-left:10px;">DATA COLLECTION </div>
      <div class="col-md-3" style="text-align:right;"><img src="<%=request.getContextPath()%>/images/personalinfo.gif"></div>
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
		<div class="row"><!-- About You Start-->
        <img src="<%=request.getContextPath()%>/images/aboutYouAxis.png"   class="img-responsive">
        <div class="panel panel-default" style="margin-top:10px;">
        
          <div class="panel-heading"><a id="photo"></a> Your Photo (Optional)</div>
          <div class="panel-body">
            <div class="col-md-4 searchpadding padding_top">
            <img src="<%=request.getContextPath()%>/images/chatuser.png" onerror="showDefaultImageOnError(id)" id="photoImage" style="width: 50%;height:50%"><br><label id="photoFileName"></label><br/>
            <input value="Change" class="btn dbtn"  type="button" style="float:left;margin-left:-2px;" onclick="$('#contactPhoto').click()">
            </div>
            <div class="col-md-8 searchpadding padding_top">
             
            </div>
            <input type="file" name="contactPhoto" id="contactPhoto" style="display: none">
           
                	
                	
            </div>                                      
          </div>
        <!-- end-->
    <div class="panel panel-default" style="margin-top:10px;">
        
          <div class="panel-heading"><a id="aboutus"></a> Personal Details</div>
          <div class="panel-body">
            <div class="col-md-4 searchpadding padding_top">
            <select name="salutationID" id="salutationID" class="form-control" style="width:100px;">
                  </select></div>
            <div class="col-md-8 searchpadding padding_top">
             <input type="text" class="form-control" title="Name" readonly="readonly" name="name" id="name" validate="1" emsg="Name">
            </div>
            
            <div class="col-md-4 searchpadding padding_top">Date of Birth <span class="red">*</span>	</div>
            <div class="col-md-8 searchpadding padding_top">
             <input type="text" class="form-control" title="Date Of Birth" name="dob" id="dob" validate="2" emsg="Date Of Birth">
            </div>   
            <div class="col-md-4 searchpadding padding_top">Contact No.</div>
            <div class="col-md-8 searchpadding padding_top">
             <input type="text" class="form-control" title="Contact No." name="contactMobile" onkeydown="allowIntegersOnly(id,event)" id="contactMobile"  emsg="Contact No.">
            </div>
            
             <div class="col-md-4 searchpadding padding_top">Email <span class="red">*</span></div>
            <div class="col-md-8 searchpadding padding_top">
             <input type="text" class="form-control" title="Email" name="contactEmail" id="contactEmail" validate="3" emsg="Email">
            </div>
            <div class="col-md-4 searchpadding padding_top">PAN No</div>
            <div class="col-md-8 searchpadding padding_top">
             <input name="panNo" type="text" id="panNo"   validate="pan" emsg="PAN No"/>
            </div>
            
            <div class="col-md-4 searchpadding padding_top">Occupation</div>
            <div class="col-md-8 searchpadding padding_top">
<!--              <input type="text" class="form-control" title="Occupation" name="occupation" id="occupation" > -->
 <select title="Occupation" name="occupation" id="occupation"></select>
            </div>  
         
            <div class="col-md-4 searchpadding padding_top">Exp. in years</div>
            <div class="col-md-8 searchpadding padding_top ">
            	<input type="text" class="form-control  pull-left" title="Experience" width="300" name="experience" id="experience" maxlength="3" onkeydown="allowIntegersOnly(id,event)"> </div>
                
              <div class="col-md-4 searchpadding padding_top">Organization</div>
            <div class="col-md-8 searchpadding padding_top ">
            	<input type="text" class="form-control  pull-left" title="Organization"  width="300" name="organization" id="organization"> </div>
                	
                	
            </div>                                      
          </div>
          
            <!-- About You Start-->
            <div class="panel panel-default" style="margin-top:10px;">
            <div class="panel-heading"><a id="immediatefamily"></a>Your Immediate Family</div>
          <div class="panel-body">
          	<table class="table table-striped" cellpadding="5" cellspacing="5" id="immediateFamilyTable">
                    <tr>
                      <td width="17%"><strong>Relationship</strong></td>
                      <td width="50%"><strong>Name</strong></td>
                      <td width="18%"><strong>DOB</strong></td>
                  		<td width="12%"><strong>Age</strong></td>
<!--                       <td width="22%">&nbsp;</td> -->
                    </tr>
                    <tr id="spouseRow">
                      <td width="17%">Spouse</td>
                      <td width="50%"><input name="spouseName" class="form-control  pull-left" type="text" id="spouseName"  value=" "  width="200px"></td>
                      <td width="18%"><input name="spouseDob" validate="date" emsg="DOB"  onchange="setAgeFromDOB('spouseDob','')" class="form-control  pull-left dob" type="text" id="spouseDob"  value=""  width="200px"></td>
                      <td width="12%">
                        <input name="spouseAge" readonly="readonly" class="form-control  pull-left" type="text" id="spouseAge"  value="" width="100px !important;" maxlength="3" onkeydown="allowIntegersOnly(id,event)"/>                     </td>
                      
                    </tr>
                   
                  </table>
          
         	
                	
                	
            </div>                                      
          </div>
          <!-- end-->
           <div class="panel panel-default" style="margin-top:10px;">
        
          <div class="panel-heading"><a id="extendedfamily"></a>Parents, In-laws and Siblings</div>
          <div class="panel-body">
            <table class="table table-striped" cellpadding="5" cellspacing="5" id="extendedFamilyTable">
              <tr>
                <td width="17%"><strong>Relationship</strong></td>
                <td width="50%" ><strong>Name</strong></td>
                 <td width="18%"><strong>DOB</strong></td>
                <td width="12%"><strong>Age</strong></td>
<!--                 <td width="22%">&nbsp;</td> -->
              </tr>
              <tr>
                <td width="17%">Mother</td>
                <td width="50%"><input name="motherName" class="form-control  pull-left" type="text" id="motherName"  value="" ></td>
                 <td width="18%" ><input name="motherDob" validate="date" emsg="DOB"  onchange="setAgeFromDOB('motherDob','')" class="form-control  pull-left dob" type="text" id="motherDob"  value=""  ></td>
                <td width="12%"><input name="motherAge" readonly="readonly" class="form-control  pull-left" type="text" id="motherAge"  value="" width="100px !important;" maxlength="3" onkeydown="allowIntegersOnly(id,event)"/>
                </td>
<!--                 <td>&nbsp;</td> -->
              </tr>
              <tr>
                <td width="17%">Father</td>
                <td width="50%" style="width: 300px"><input name="fatherName" class="form-control  pull-left" type="text" id="fatherName"  value="" ></td>
                <td width="18%"><input name="fatherDob" validate="date" emsg="DOB"  onchange="setAgeFromDOB('fatherDob','')" class="form-control  pull-left dob" type="text" id="fatherDob"  value=""  ></td>
                <td width="12%"><input name="fatherAge" readonly="readonly" class="form-control  pull-left" type="text" id="fatherAge"  value="" width="100px !important;" maxlength="3" onkeydown="allowIntegersOnly(id,event)"/>
                </td>
<!--                 <td>&nbsp;</td> -->
              </tr>
              <tr>
                <td width="17%">Mother in law </td>
                <td width="50%" style="width: 300px"><input name="motherInLawName" class="form-control  pull-left" type="text" id="motherInLawName"  value=""></td>
                <td width="18%"><input name="motherInLawDob" validate="date" emsg="DOB"  onchange="setAgeFromDOB('motherInLawDob','')" class="form-control  pull-left dob" type="text" id="motherInLawDob"  value=""  ></td>
                <td width="12%"><input name="motherInLawAge" readonly="readonly" class="form-control  pull-left" type="text" id="motherInLawAge"  value="" width="100px !important;" maxlength="3" onkeydown="allowIntegersOnly(id,event)"/>
                </td>
<!--                 <td>&nbsp;</td> -->
              </tr>
              <tr id="fatherInLawRow">
                <td width="17%">Father in law </td>
                <td width="50%"><input name="fatherInLawName" class="form-control  pull-left" type="text" id="fatherInLawName"  value=" "></td>
                <td width="18%"><input name="fatherInLawDob" validate="date" emsg="DOB"  onchange="setAgeFromDOB('fatherInLawDob','')" class="form-control  pull-left dob" type="text" id="fatherInLawDob"  value=""  ></td>
                <td width="12%"><input name="fatherInLawAge" readonly="readonly" class="form-control  pull-left" type="text" id="fatherInLawAge"  value="" width="100px !important;" maxlength="3" onkeydown="allowIntegersOnly(id,event)"/>
                </td>
<!--                 <td>&nbsp;</td> -->
              </tr>
              
              
            </table>
          </div>                                      
          </div>
          <!-- end-->
           <div class="topmenu">            
 <input class="btn dbtn" type="button" value="Save" name="Save" onclick="savePersonalInfo(0)"> 

    <a onclick="redirectDcInput()"> <input class="btn dbtn" type="button" value="Cancel" name="Cancel"> </a> 
    <a > <input class="btn dbtn" type="button" value="Next" name="Next" onclick="savePersonalInfo(1)"></a>      
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

$(function() {
	personalInfoReady();
	
});

function personalInfoReady(){
	$('tr[name="child"]').remove();
	$('tr[name="sibbling"]').remove();
	
	$jq_1_9_1('.dob').datepicker({
		changeMonth : true,
		changeYear : true,
		maxDate : '0',
		yearRange : "1900:2200",
		dateFormat : "dd/mm/yy"

	});
	
	
	$.ajax({
		type : "POST",
		url : $('#contextPath').val()+'/common/getPicklistValues.htm?codeTypeIds=81,65',
		success : function(result) {
			$('#salutationID').empty();
			$('#salutationID').append('<option value="0">--Select--</option>');
			$('#occupation').empty();
			$('#occupation').append('<option value="0">--Select--</option>');
			$(result).each(function(i,obj) {
				var codeTypeId=obj.codeTypeId;
				var codeValue=obj.codeValue;
				var codevalueId=obj.codeValueId;
// 				salutation-81
				if(codeTypeId==81){
				$('#salutationID').append('<option value="'+codevalueId+'">'+codeValue+'</option>');
				} else if(codeTypeId==65){
				$('#occupation').append('<option value="'+codevalueId+'">'+codeValue+'</option>');
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
// 						
						$('#organization').val(organization);
						if(experience!=0)
						$('#experience').val(experience);
						$jq_1_9_1('#dob').datepicker({
							changeMonth : true,
							changeYear : true,
							maxDate : '0',
							yearRange : "1900:2200",
							dateFormat : "dd/mm/yy"

						});
						$('#spouseDob').val(spouseDob);
						$('#motherDob').val(motherDob);
						$('#fatherDob').val(fatherDob);
						$('#motherInLawDob').val(motherInLawDob);
						$('#fatherInLawDob').val(fatherInLawDob);
						
						$('#spouseName').val(spouseName);
// 						if(spouseAge!=0)
						$('#spouseAge').val(spouseAge);
						$('#motherName').val(motherName);
// 						if(motherAge!=0)
						$('#motherAge').val(motherAge);
						$('#fatherName').val(fatherName);
// 						if(fatherAge!=0)
						$('#fatherAge').val(fatherAge);
						$('#motherInLawName').val(motherInLawName);
// 						if(motherInLawAge!=0)
						$('#motherInLawAge').val(motherInLawAge);
						$('#fatherInLawName').val(fatherInLawName);
// 						if(fatherInLawAge!=0)
						$('#fatherInLawAge').val(fatherInLawAge);
						var childCounter=0;
						var sibblingCounter=0;
						var isAnyChild=0;
						var isAnySibbling=0;
// 						alert(familyMemberDataList.length)
						$(familyMemberDataList).each(function(i,obj) {
							var name=obj.name;
							var dob=obj.dob;
							var age=obj.age==0?0:obj.age;
							var relationshipId=obj.relationshipId;
							var familyType=obj.familyType;
							var partyId=obj.partyId;
// 							alert(partyId)
							if(familyType=='immediate'){
								isAnyChild=1;
								childCounter+=1;
// 									$('#immediateFamilyTable').append('<tr id="childRow'+childCounter+'" name="child"><td><span id="child1" >Child '+childCounter+'</span></td><td><input name="childname" type="text" id="childname'+childCounter+'" width="200px" class="form-control  pull-left"  value="'+name+'" /></td><td><input name="childage" class="form-control  pull-left" type="text" id="childage'+childCounter+'"  value="'+age+'" /></td><td width="22%" ><a  onClick="addRow(\'child\');" alt="Add Child" title="Add Child" id="childplusicon"> <i class="addicon"  style="display: inline;"> </i></a></td></tr>');
									$('#immediateFamilyTable').append('<tr id="childRow'+childCounter+'" name="child"><td width="17%"> <span id="child1" >Child '+childCounter+'</span></td><td  width="50%"><input name="childname" type="text" id="childname'+childCounter+'" width="200px" class="form-control  pull-left"  value="'+name+'" /><input type="hidden" id="partyIdchild'+childCounter+'"  value="'+partyId+'"></td><td width="18%"><input name="childDob" validate="date" emsg="DOB"  value="'+dob+'" onchange="setAgeFromDOB(name,'+childCounter+')" class="form-control  pull-left dob" type="text" id="childDob'+childCounter+'"  value=""  width="200px"></td><td  width="12%"><input readonly="readonly" name="childage" class="form-control  pull-left" type="text" id="childage'+childCounter+'"  value="'+age+'" maxlength="3" onkeydown="allowIntegersOnly(id,event)"/></td><td width="22%" id="tdchild'+childCounter+'"></td></tr>');
							}else{
								isAnySibbling=1;
								sibblingCounter+=1;
									$('#extendedFamilyTable').append('<tr id="sibblingRow'+sibblingCounter+'" name="sibbling"><td width="17%">Sibling '+sibblingCounter+'</td><td   width="50%"><input name="sibblingname" class="form-control  pull-left" type="text" id="sibblingname'+sibblingCounter+'"  value="'+name+'" / width="200px"><input type="hidden" id="partyIdsibbling'+sibblingCounter+'"  value="'+partyId+'"></td><td width="18%"><input name="sibblingDob" validate="date" emsg="DOB"  value="'+dob+'" onchange="setAgeFromDOB(name,'+sibblingCounter+')" class="form-control  pull-left dob" type="text" id="sibblingDob'+sibblingCounter+'"  value=""  width="200px"></td></td><td   width="12%"><input name="sibblingage" readonly="readonly" class="form-control  pull-left" type="text" id="sibblingage'+sibblingCounter+'"  value="'+age+'" width="100px !important;" maxlength="3" onkeydown="allowIntegersOnly(id,event)"/></td><td width="22%" id="tdsibbling'+sibblingCounter+'"></td></tr>');
							}
						});
						
						$('#occupation').val(occupation);
						if(isAnyChild==1){
							$('#tdchild'+childCounter).append('<a  onClick="addRow(\'child\');" alt="Add Child" title="Add Child" id="childplusicon"> <i class="addicon"  style="display: inline;"> </i></a>');
						}else{
							childCounter=1;
							$('#immediateFamilyTable').append('<tr id="childRow'+childCounter+'" name="child"><td width="17%"><span id="child1" >Child '+childCounter+'</span></td><td  width="50%"><input name="childname" type="text" id="childname'+childCounter+'" width="200px" class="form-control  pull-left"   /><input type="hidden" id="partyIdchild'+childCounter+'"  value="0"></td><td width="18%"><input name="childDob" class="form-control  pull-left dob" validate="date" emsg="DOB"  onchange="setAgeFromDOB(name,'+childCounter+')" type="text" id="childDob'+childCounter+'"  value=""  width="200px"></td></td><td   width="12%"><input name="childage" readonly="readonly" class="form-control  pull-left" type="text" id="childage'+childCounter+'"   maxlength="3" onkeydown="allowIntegersOnly(id,event)"/></td><td width="22%" id="tdchild'+childCounter+'"></td></tr>');
							$('#tdchild'+childCounter).append('<a  onClick="addRow(\'child\');" alt="Add Child" title="Add Child" id="childplusicon"> <i class="addicon"  style="display: inline;"> </i></a>');
						}
						
						if(isAnySibbling==1){
							$('#tdsibbling'+sibblingCounter).append('<a  onClick="addRow(\'sibbling\');" alt="Add Child" title="Add Child" id="sibblingplusicon"> <i class="addicon"  style="display: inline;"> </i></a>');
						}else{
							sibblingCounter=1;
							$('#extendedFamilyTable').append('<tr id="sibblingRow'+sibblingCounter+'" name="sibbling"><td width="17%">Sibling '+sibblingCounter+'</td><td   width="50%"><input name="sibblingname" class="form-control  pull-left" type="text" id="sibblingname'+sibblingCounter+'"   / width="200px"><input type="hidden" id="partyIdsibbling'+sibblingCounter+'"  value="0"></td><td width="18%"><input name="sibblingDob" type="text" class="form-control  pull-left dob" validate="date" emsg="DOB"  onchange="setAgeFromDOB(name,'+sibblingCounter+')" id="sibblingDob'+childCounter+'"  value=""  width="200px"></td></td><td   width="12%"><input name="sibblingage" readonly="readonly" class="form-control  pull-left" type="text" id="sibblingage'+sibblingCounter+'"   width="100px !important;" maxlength="3" onkeydown="allowIntegersOnly(id,event)"/></td><td width="22%" id="tdsibbling'+sibblingCounter+'"></td></tr>');
							$('#tdsibbling'+sibblingCounter).append('<a  onClick="addRow(\'sibbling\');" alt="Add Child" title="Add Child" id="sibblingplusicon"> <i class="addicon"  style="display: inline;"> </i></a>');
						}
						$jq_1_9_1('.dob').datepicker({
							changeMonth : true,
							changeYear : true,
							maxDate : '0',
							yearRange : "1900:2200",
							dateFormat : "dd/mm/yy"

						});
					}
				});
			}});
}

function addRow(name){
	
	var totalRow = $('tr[name="'+name+'"]').size();
	if(name=='child'){
		$('#childplusicon').remove();
		$('#immediateFamilyTable').append('<tr id="childRow'+(totalRow+1)+'" name="child"><td width="17%"><span id="child1" >Child '+(totalRow+1)+'</span></td><td  width="50%"><input name="childname" type="text" id="childname'+(totalRow+1)+'" width="200px" class="form-control  pull-left"   /><input type="hidden" id="partyIdchild'+(totalRow+1)+'"  value="0"></td><td width="18%"><input name="childDob" class="form-control  pull-left dob" onchange="setAgeFromDOB(name,'+(totalRow+1)+')" validate="date" emsg="DOB"  type="text" id="childDob'+(totalRow+1)+'"  value=""  width="200px"></td></td><td   width="12%"><input name="childage" readonly="readonly" type="text" id="childage'+(totalRow+1)+'"  class="form-control  pull-left" maxlength="3" onkeydown="allowIntegersOnly(id,event)"/></td><td width="22%"><a id="childplusicon" onClick="addRow(\'child\');" alt="Add Child" title="Add Child"> <i class="addicon"  style="display: inline;"> </i></a></td></tr>');
	}else{
		$('#sibblingplusicon').remove();
		$('#extendedFamilyTable').append('<tr id="sibblingRow'+(totalRow+1)+'" name="sibbling"><td width="17%">Sibling '+(totalRow+1)+'</td><td   width="50%"><input name="sibblingname" class="form-control  pull-left" type="text" id="sibblingname'+(totalRow+1)+'"   width="200px"><input type="hidden" id="partyIdsibbling'+(totalRow+1)+'"  value="0"></td><td width="18%"><input name="sibblingDob" class="form-control  pull-left dob" onchange="setAgeFromDOB(name,'+(totalRow+1)+')" validate="date" emsg="DOB"  type="text" id="sibblingDob'+(totalRow+1)+'"  value=""  width="200px"></td></td><td   width="12%"><input name="sibblingage" readonly="readonly" class="form-control  pull-left" type="text" id="sibblingage'+(totalRow+1)+'"   width="100px !important;" maxlength="3" onkeydown="allowIntegersOnly(id,event)"/></td><td width="22%"><a id="sibblingplusicon"  onClick="addRow(\'sibbling\');" alt="Add More " title="Add Sibbling"> <i class="addicon"  style="display: inline;"> </i></a></td></tr>');
	}
	$jq_1_9_1('.dob').datepicker({
		changeMonth : true,
		changeYear : true,
		maxDate : '0',
		yearRange : "1900:2200",
		dateFormat : "dd/mm/yy"

	});
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
		alert('please select valid image');
		$('#contactPhoto').val('');
		$('#photoFileName').html('');
		isImageSelected=0;
	}
	
	
// 	$('#photoImage').hide();
})

function savePersonalInfo(isNext){
	var isValidated=true;
	var isPopupOpen=false;
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
	
	if($('#spouseName').val()!==''){
		$('#spouseName').css('border-color','grey');
		$('#spouseName').removeAttr('title');
	}else if($('#spouseAge').val()!=0){
		$('#spouseName').css('border-color','red');
		$('#spouseName').attr('title', 'Please Enter Name.');
		isValidated=false;
	}else{
		$('#spouseName').css('border-color','grey');
		$('#spouseName').removeAttr('title');
		
	}
	
	if($('#motherName').val()!==''){
		$('#motherName').css('border-color','grey');
		$('#motherName').removeAttr('title');
	}else if($('#motherAge').val()!=0){
		$('#motherName').css('border-color','red');
		$('#motherName').attr('title', 'Please Enter Name.');
		isValidated=false;
	}else{
		$('#motherName').css('border-color','grey');
		$('#motherName').removeAttr('title');
		
	}
	
	if($('#fatherName').val()!==''){
		$('#fatherName').css('border-color','grey');
		$('#fatherName').removeAttr('title');
	}else if($('#fatherAge').val()!=0){
		$('#fatherName').css('border-color','red');
		$('#fatherName').attr('title', 'Please Enter Name.');
		isValidated=false;
	}else{
		$('#fatherName').css('border-color','grey');
		$('#fatherName').removeAttr('title');
		
	}
	
	if($('#motherInLawName').val()!==''){
		$('#motherInLawName').css('border-color','grey');
		$('#motherInLawName').removeAttr('title');
	}else if($('#motherInLawAge').val()!=0){
		$('#motherInLawName').css('border-color','red');
		$('#motherInLawName').attr('title', 'Please Enter Name.');
		isValidated=false;
	}else{
		$('#motherInLawName').css('border-color','grey');
		$('#motherInLawName').removeAttr('title');
		
	}
	
	if($('#fatherInLawName').val()!==''){
		$('#fatherInLawName').css('border-color','grey');
		$('#fatherInLawName').removeAttr('title');
	}else if($('#fatherInLawAge').val()!=0){
		$('#fatherInLawName').css('border-color','red');
		$('#fatherInLawName').attr('title', 'Please Enter Name.');
		isValidated=false;
	}else{
		$('#fatherInLawName').css('border-color','grey');
		$('#fatherInLawName').removeAttr('title');
		
	}
	
	
	var familyMemberXml="";
	$('input[name="childname"]').each(function(i,obj) {
		var isValidRow=true;
		id=$(obj).attr('id');
		count=id.substring(id.indexOf('childname')+9);
		var name=$(obj).val();
		var dob=$('#childDob'+count).val();
		var age=$('#childage'+count).val();
		var partyId=$('#partyIdchild'+count).val();
		if(age=='' || age==undefined)
			age=0;
		if(name!==''){
			isValidRow=true;
			$(obj).css('border-color','grey');
			$(obj).removeAttr('title');
		}else if(age!=0){
			$(obj).css('border-color','red');
			$(obj).attr('title', 'Please Enter Name.');
			isValidRow=false;
		}else{
			$(obj).css('border-color','grey');
			$(obj).removeAttr('title');
			
		}
		if(isValidRow==true && name!==''){
			familyMemberXml+='<FamilyMember>';
			familyMemberXml+='<RelationshipId>26002</RelationshipId>';
			familyMemberXml+='<Name>'+name+'</Name>';
			familyMemberXml+='<DOB>'+dob+'</DOB>';
			familyMemberXml+='<Age>'+age+'</Age>';
			familyMemberXml+='<PartyId>'+partyId+'</PartyId>';
			familyMemberXml+='</FamilyMember>';
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
		var dob=$('#sibblingDob'+count).val();
		var age=$('#sibblingage'+count).val();
		var partyId=$('#partyIdsibbling'+count).val();
		if(age=='' || age==undefined)
			age=0;
		if(name!==''){
			isValidRow=true;
			$(obj).css('border-color','grey');
			$(obj).removeAttr('title');
		}else if(age!=0){
			$(obj).css('border-color','red');
			$(obj).attr('title', 'Please Enter Name.');
			isValidRow=false;
		}else{
			$(obj).css('border-color','grey');
			$(obj).removeAttr('title');
			
		}
		if(isValidRow==true && name!==''){
			familyMemberXml+='<FamilyMember>';
			familyMemberXml+='<RelationshipId>26004</RelationshipId>';
			familyMemberXml+='<Name>'+name+'</Name>';
			familyMemberXml+='<DOB>'+dob+'</DOB>';
			familyMemberXml+='<Age>'+age+'</Age>';
			familyMemberXml+='<PartyId>'+partyId+'</PartyId>';
			familyMemberXml+='</FamilyMember>';
		}else if(isValidRow==false){
			isValidated=false;
		}
		
	});
// 	familyMemberXml+="/<Root>";
	$('#familyMemberXml').val(familyMemberXml);
// 	enctype="multipart/form-data"
// 	var contactPhoto=$('#contactPhoto');

	if(isImageSelected==0 && isValidated==true){
		$.ajax({
			type : "POST",
			url : $('#contextPath').val()+'/dc/saveDCPersonalInfoDetails.htm',
			data:$('#personalInfoForm').serialize(),
			success : function(msg) {
				var result=msg[0];
            	if(result=='success' && isImageSelected==1){
            		$('#photoImage').attr('src',$('#contextPath').val()+'/'+msg[1]);
            		if(isNext==1){
//             			localStorage.setItem('actionName',$('#contextPath').val()+'/DCFutureFinancialExpectationFiinfra.htm');
						localStorage.setItem('actionName',$('#contextPath').val()+'/RiskProfileFiinfra.htm');
//             			showAlertMessage("Success", "<br/>Data saved successfully.", "confirmation", redirectFunction);
						redirectFurther();
            		}else{
            			showAlertMessage("Success", "<br/>Data saved successfully.", "confirmation", personalInfoReady);
            		}
            		
            		$('#contactPhoto').val('');
            		$('#photoFileName').html('');
            		isImageSelected=0;
            	}else if(result=='success'){
            		if(isNext==1){
            			localStorage.setItem('actionName',$('#contextPath').val()+'/RiskProfileFiinfra.htm');
//             			localStorage.setItem('actionName',$('#contextPath').val()+'/DCFutureFinancialExpectationFiinfra.htm');
            			
//             			showAlertMessage("Success", "<br/>Data saved successfully.", "confirmation", redirectFunction);
					redirectFurther();
            		}else{
            			showAlertMessage("Success", "<br/>Data saved successfully.", "confirmation", personalInfoReady);
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
//             			localStorage.setItem('actionName',$('#contextPath').val()+'/DCFutureFinancialExpectationFiinfra.htm');
						localStorage.setItem('actionName',$('#contextPath').val()+'/RiskProfileFiinfra.htm');
            			showAlertMessage("Success", "<br/>Data saved successfully.", "confirmation", redirectFunction);
            		}else{
            			showAlertMessage("Success", "<br/>Data saved successfully.", "confirmation", personalInfoReady);
            		}
            		$('#contactPhoto').val('');
            		$('#photoFileName').html('');
            		isImageSelected=0;
            	}else if(result=='success'){
            		if(isNext==1){
//             			localStorage.setItem('actionName',$('#contextPath').val()+'/DCFutureFinancialExpectationFiinfra.htm');
						localStorage.setItem('actionName',$('#contextPath').val()+'/RiskProfileFiinfra.htm');
            			showAlertMessage("Success", "<br/>Data saved successfully.", "confirmation", redirectFunction);
            		}else{
            			showAlertMessage("Success", "<br/>Data saved successfully.", "confirmation", personalInfoReady);
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

</script>

</body>
</html>