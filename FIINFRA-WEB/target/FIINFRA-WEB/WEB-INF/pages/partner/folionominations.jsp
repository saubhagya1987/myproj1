<!DOCTYPE html>
<html lang="en"><head>
<link href="<%=request.getContextPath()%>/images/favicon.ico" rel="shortcut icon">
<meta http-equiv="content-type" content="text/html; charset=UTF-8">

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
	<title>Nomination  List</title>
	<style type="text/css">
	/*do not delete it*/
	.ui-autocomplete{
		z-index:1050 !important;
	}
	.ui-jqgrid ui-widget ui-widget-content ui-corner-all{
	width : 100% 
	}
	</style>
</head>
<body>
<input type="hidden" id="folioNo" />
<input type="hidden" id="nomineePartyId"/>
<input type="hidden" id="clientId"/>
<!--css popup window start 2-->

<!-- <div style="display: none; width:650px; height:620px; top:100px; overflow: auto;z-index: 9999999" id="popUpAlertaddnote" class="alert"> -->


    
    <!-- delete-->
    
    


 
	


<!--css popup window 2 close-->
 <jsp:include page="../common/header.jsp"></jsp:include>

 <!-- Center part start -->
	<section>
		<div class="">
			<div class="main-content">
				<div class="main-contnet-inner">
					<div class="page-content">
						<div class="page-header clearfix">
							<h1 class="pull-left">Nominees For : ${param.assetName}</h1>
						</div>
						</div>
						<div class="container-body">
							<div class="topmenu row rightAlign">
								<div class="list-group">
									<div class="topmenu">
										<div class="pull-right">
											<button id="StocksAddLink"
												class="southspace1 westspace1 northspace1 eastspace1 dbtn importNewBtn btn btn-primary btn-xs"
												onclick="history.go(-1);">
												<i class=" ace-icon fa fa-chevron-circle-left"></i>Back
											</button>


											<button class="southspace1 westspace1 northspace1 eastspace1 dbtn importNewBtn btn btn-primary btn-xs"
												title="Add Nominee" onclick="addNote();">
												<i class="fa fa-plus"></i> Add Nominee
											</button>

											<button class="southspace1 westspace1 northspace1 eastspace1 dbtn importNewBtn btn btn-primary btn-xs"
												title="Delete Nominee" onclick="deleteNominee();">
												<i class="fa fa-trash"></i> Delete Nominee
											</button>
										</div>
										</div>

										
										<div class="clearfix"></div>
                    <div class="clearfix"></div>
                    <div class="jq_parent row" id="display_table_lead" style="border: none;">
                    <div class="clearfix"></div>
                        <div id="toreload" class="col-md-12 table-responsive tabular_break_word">

                        <table id="grid-table" ></table>
                        <div id="grid-pager"></div>
                      
                        
                        <!-- Center--> 
                      </div>
                    </div>
                  </div>
						</div>
					</div>
				</div>
			</div>
	<div class="clearfix"></div>
						
						
	</section>
	<input type="hidden" name="confirmdelete" id="confirmdelete">				
								
								


  	
  	<!-- modal pop up for add nominee -->
<div class="modal fade" id="popUpAddNominee" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  	<div class="modal-dialog">
    	<div class="modal-content">
      		<div class="modal-header">
        		<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        		<h4 class="modal-title" id="myModalLabel">Add/Edit Nominee</h4> 
      		</div> 
      		<div id="success-msg"></div><!-- success msg display -->
      		<div id="form-box">
      				<form class="form-horizontal" id="addNomineeForm">
      				<div class="modal-body">
						<div class="form-group">
							<label class="control-label col-xs-12 col-sm-3 no-padding-right" for="name">Name :<span class="red">*</span></label>
							 <div class="col-xs-12 col-sm-9">
								<div class="clearfix">
									<input type="text" name="name" id="name"  class="form-control" placeholder="Name">
								</div>
							</div>
						</div>
						<div class="space-2"></div>
						<div class="form-group">
							<label class="control-label col-xs-12 col-sm-3 no-padding-right" for="relationship">Relationship :<span class="red">*</span></label>
							 <div class="col-xs-12 col-sm-9">
								<div class="clearfix">
									<select name="relationship" class="form-control" style="width:300px; float:left;" id="relationship">
         							</select>
								</div>
							</div>
						</div>
						<div class="space-2"></div>
						<div class="form-group">
							<label class="control-label col-xs-12 col-sm-3 no-padding-right" for="dob">Date of Birth	(Age) :</label>
							 <div class="col-xs-12 col-sm-9">
								<div class="clearfix">
									<input type="text" class="form-control" placeholder="dd/mm/yyyy" id="dob" readonly/>
								</div>
							</div>
						</div>
						<div class="space-2"></div>
						<div class="form-group">
							<label class="control-label col-xs-12 col-sm-3 no-padding-right" for="address1">Address :</label>
							 <div class="col-xs-12 col-sm-9">
								<div class="clearfix">
									<textarea class="form-control" id="address1" placeholder="Enter Address"></textarea>
								</div>
							</div>
						</div>
						<div class="space-2"></div>
						<div class="form-group">
							<label class="control-label col-xs-12 col-sm-3 no-padding-right" for="state">State :</label>
							 <div class="col-xs-12 col-sm-9">
								<div class="clearfix">
									<input type="text" class="form-control" id="state"  onBlur="getCities(this.value,'city')">
								</div>
							</div>
						</div>
						<div class="space-2"></div>
						<div class="form-group">
							<label class="control-label col-xs-12 col-sm-3 no-padding-right" for="city">City :</label>
							 <div class="col-xs-12 col-sm-9">
								<div class="clearfix">
									<input type="text" class="form-control" id="city" >
								</div>
							</div>
						</div>
						<div class="space-2"></div>
						<div class="form-group">
							<label class="control-label col-xs-12 col-sm-3 no-padding-right" for="country">Country :</label>
							 <div class="col-xs-12 col-sm-9">
								<div class="clearfix">
									<input type="text" class="form-control" id="country" >
								</div>
							</div>
						</div>
						<div class="space-2"></div>
					</div><!-- modal body end -->
					<div class="modal-footer">
						    <button  class="btn btn-xs btn-primary" onClick="updateNominations(1,'Add');"><i class='ace-icon fa fa-plus'></i>Save & Close</button>
							<button  class="btn btn-xs btn-danger" data-dismiss="modal"><i class='ace-icon fa fa-times'></i>Cancel</button> 
					</div>
					</form>
			</div>
		</div>
	</div>
</div>
			
  		<!-- modal pop up for add nominee ends-->
  		  <div class="modal fade" id="deletenote" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  			<div class="modal-dialog">
   			 <div class="modal-content">
      		<div class="modal-header">
       			 <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        		<h4 class="modal-title" id="myModalLabel">Delete Record</h4> 
        		</div>
		<!-- <div id="deletenote"> -->
			<div class="modal-body">Do you want to delete this selected records? Please confirm.
			</div>
					<div class="modal-footer">						
									 
									
								<button id="" class="btn btn-sm btn-primary"  onclick="deleteNominees();" >Yes</button>
								<button id="" class="btn btn-sm btn-danger"  class="close" data-dismiss="modal" >No</button>

					</div>
					<div class="clearfix"></div>
				</div>
			</div>
		</div>
  
    <!-- delete-->
    
     <!-- Edit-->
    <!-- <div id="editnote"> -->
 <div class="modal fade" id="editnote" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close" onClick="$('#editnote').modal('hide');"> <span aria-hidden="true">&times;</span></button>
        <h3 class="modal-title" id="myModalLabel">Edit Nominee </h3>
      </div>
      <div class="modal-body">
    	<form id="editNominee" name="editNominee" class="form-horizontal">
    	<div id="popupwrapper_contactform">
   	
				
		<div class="form-group">
          <label class="control-laabel col-xs-12 col-sm-3 no-padding-right" for="NomineeName">Name<span class="red">*</span></label>    
          <div class="col-xs-12 col-sm-9">
                   
           <input type="text" id="nameEdit" class="form-control">                    
           
         
          </div>
         </div>
         <div class="space-2"></div>
		
				
				
		<div class="form-group">
          <label class="control-laabel col-xs-12 col-sm-3 no-padding-right" for="NomineeName">Relationship<span class="red">*</span></label>    
          <div class="col-xs-12 col-sm-9">
           <div class="clearfix">           
           <select name="Saving" class="form-control" style="width:300px; float:left;" id="relationshipEdit"> </select>                    
           
           </div>
          </div>
         </div>
         <div class="space-2"></div>
         
    
				
		<div class="form-group">
          <label class="control-laabel col-xs-12 col-sm-3 no-padding-right" for="NomineeName">Date of Birth	(Age)</label>    
          <div class="col-xs-12 col-sm-9">
           <div class="clearfix">           
          <input type="text" class="form-control" placeholder="05/12/1980 " id="dobEdit" readonly="readonly" validate="1">                
           
           </div>
          </div>
         </div>
         <div class="space-2"></div>

        <div class="form-group">
          <label class="control-laabel col-xs-12 col-sm-3 no-padding-right" for="NomineeName">Address</label>    
          <div class="col-xs-12 col-sm-9">
           <div class="clearfix">           
          <input type="text" class="form-control" placeholder=" " id="address1Edit">                
           
           </div>
          </div>
         </div>
         <div class="space-2"></div>
        		
        		

        		
        <div class="form-group">
          <label class="control-laabel col-xs-12 col-sm-3 no-padding-right" for="NomineeName">State</label>    
          <div class="col-xs-12 col-sm-9">
           <div class="clearfix">           
          <input type="text" class="form-control" placeholder=" " id="stateEdit"  onBlur="getCities(this.value,'cityEdit')">              
           
           </div>
          </div>
         </div>
         <div class="space-2"></div>
 
	
        <div class="form-group">
          <label class="control-laabel col-xs-12 col-sm-3 no-padding-right" for="NomineeName">City</label>    
          <div class="col-xs-12 col-sm-9">
           <div class="clearfix">           
         <input type="text" class="form-control" placeholder=" " id="cityEdit">             
           
           </div>
          </div>
         </div>
         <div class="space-2"></div>
        
	
       <div class="form-group">
          <label class="control-laabel col-xs-12 col-sm-3 no-padding-right" for="NomineeName">Country</label>    
          <div class="col-xs-12 col-sm-9">
           <div class="clearfix">           
         <input type="text" class="form-control" placeholder=" " id="countryEdit">          
           
           </div>
          </div>
         </div>
         <div class="space-2"></div>
        
        
	
			
		<div class=" col-xs-12 ">
         <div class="form-group clearfix">
         <div class="modal-footer">
         <button id="Save" value="Save" class="btn btn-xs btn-primary" onclick="updateNominations(0,'Edit');">Save</button>
         <button id="Cancel" value="Cancel" class="btn btn-xs btn-primary" onclick="">Cancel</button>
            
         </div>    
            </div>
         </div>        
      <div class="clearfix"></div>
			
			
			</form>
		</div>
	
		</div>
		
		</div>
		</div>
		
		
		  <div class="modal fade" id="deletenote" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
     <div class="modal-dialog">
       <div class="modal-content">
        <div class="modal-header">
           <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
          <h4 class="modal-title" id="myModalLabel">Message</h4>
         Do you want to delete this selected records? Please confirm.
     <div style="float:right;">
     
       <button data-bb-handler="confirm" type="button" class="btn btn-primary btn-sm" id="Yes" onclick="deleteNominees();"> Yes</button>
       <button data-bb-handler="cancel" type="button" class="btn btn-sm btn-danger"
        type="button" class="close" data-dismiss="modal" aria-label="Close"><i class="ace-icon fa fa-close"></i> No</button> 
     
      </div>
          </div>.     
    </div>
   </div>
   </div>
  <!--   <div id="deletenote">
    <div id="popupwrapper_contactform" style="height:100px;width:250px;">
   		
  		<div class="heading_contactform"><h3> Message</h3></div>
        <div id="poptable_contactform" style="padding:10px; height:100px;">
        	Do you want to delete this selected records? Please confirm.
 </div>
  <div class="topbuttonholder">
        	<form><input class="dbtn" value="Yes" id="Yes" type="button" onclick="deleteNominees()">	
            <input class="dbtn" value="No" id="No" type="button">
           	</form>	
        </div>
        </div>
	</div> -->
    
    <!-- delete-->
    
     <!-- Edit-->
    <!-- <div id="editnote"> -->
    <div class="modal fade" id="editnote" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close" onClick="resetval();$('#editnote').modal('hide');"> <span aria-hidden="true">&times;</span></button>
        <h3 class="modal-title" id="myModalLabel">Edit Nominee </h3>
      </div>
      <div class="modal-body">
    	<form id="editNominee" name="editNominee" class="form-horizontal">
    	<div id="popupwrapper_contactform">
   		
  			<!-- <div class="heading_contactform"><h3> Edit Nominee </h3></div> -->
  			<!-- <div class="form-group">
          <label class="control-laabel col-xs-12 col-sm-3 no-padding-right" for="PartnerName">Partner Name<span class="red">*</span></label>    
          <div class="col-xs-12 col-sm-9">
           <div class="clearfix">           
           <input type="text" id="addquickSearchpart"  name="searchString" onfocus="addquickSearchPartner(this);" placeholder="Quick Search"  autofocus  onchange="autovalid(0);" onkeyup="onkeyupforaddpartner();">                    
           <input type="hidden" id="addquickSearchHiddenpart" name="partnerId" placeholder="Quick Search" >
           </div>
          </div>
         </div>
         <div class="space-2"></div> -->
  			
  			
  			<!-- <div class="form-group">
  			
      		<div id="poptable_contactform" style="padding:10px; height:400px;">
        		<span  class="searchpadding padding_top" style="float:left; width:150px;"> Name  <span class="red">*</span> </span>
				<span  class="searchpadding padding_top" style="float:left;width:300px;">
					<input type="text" class="form-control" placeholder="Rajat " id="nameEdit" validate="1">
				</span>
				 <div class="space-2"></div>
	        	
				</div> -->
				
		<div class="form-group">
          <label class="control-laabel col-xs-12 col-sm-3 no-padding-right" for="NomineeName">Name<span class="red">*</span></label>    
          <div class="col-xs-12 col-sm-9">
                   
           <input type="text" id="nameEdit" class="form-control">                    
           
         
          </div>
         </div>
         <div class="space-2"></div>
				
				
				<!-- <span class="searchpadding padding_top" style="float:left; width:150px;">Relationship <span class="red">*</span> </span>
				<span  class="searchpadding padding_top" style="float:left; width:300px;">
					<select name="Saving" class="form-control" style="width:300px; float:left;" id="relationshipEdit"> </select>
				</span>
				<div class="clearfix"></div> -->
				
				
		<div class="form-group">
          <label class="control-laabel col-xs-12 col-sm-3 no-padding-right" for="NomineeName">Relationship<span class="red">*</span></label>    
          <div class="col-xs-12 col-sm-9">
           <div class="clearfix">           
           <select name="Saving" class="form-control" style="width:300px; float:left;" id="relationshipEdit"> </select>                    
           
           </div>
          </div>
         </div>
         <div class="space-2"></div>
         
         
				       
			<!-- 	<span class="searchpadding padding_top" style="float:left; width:150px;">Date of Birth	(Age)  </span>
				<span  class="searchpadding padding_top" style="float:left; width:200px;">
					<input type="text" class="form-control" placeholder="05/12/1980 " id="dobEdit" readonly="readonly" validate="1">
				</span>
				<span class="searchpadding padding_top" style="float:left;margin-top: 7px;">
				</span>
				<div class="clearfix"></div> -->
				
		<div class="form-group">
          <label class="control-laabel col-xs-12 col-sm-3 no-padding-right" for="NomineeName">Date of Birth	(Age)</label>    
          <div class="col-xs-12 col-sm-9">
           <div class="clearfix">           
          <input type="text" class="form-control" placeholder="05/12/1980 " id="dobEdit" readonly="readonly" validate="1">                
           
           </div>
          </div>
         </div>
         <div class="space-2"></div>

        	
        
  
				<!-- <span  class="searchpadding padding_top" style="float:left; width:150px;"> Address  </span>
				<span  class="searchpadding padding_top" style="float:left;width:300px;">
					<input type="text" class="form-control" placeholder=" " id="address1Edit">
				</span>
				
        		<div class="clearfix"></div>  -->
        <div class="form-group">
          <label class="control-laabel col-xs-12 col-sm-3 no-padding-right" for="NomineeName">Address</label>    
          <div class="col-xs-12 col-sm-9">
           <div class="clearfix">           
          <input type="text" class="form-control" placeholder=" " id="address1Edit">                
           
           </div>
          </div>
         </div>
         <div class="space-2"></div>
        		
        		
        		
				<!-- <span  class="searchpadding padding_top" style="float:left; width:150px;">     </span>     
				<span  class="searchpadding padding_top" style="float:left;width:300px;">
					<input type="text" class="form-control" placeholder=" " id="address2Edit">
				</span>
        		<div class="clearfix"></div> 
				<span  class="searchpadding padding_top" style="float:left; width:150px;">         </span>
				<span  class="searchpadding padding_top" style="float:left;width:300px;">
					<input type="text" class="form-control" placeholder=" " id="address3Edit">
				</span>
        		<div class="clearfix"></div>  -->
        		
        <div class="form-group">
          <label class="control-laabel col-xs-12 col-sm-3 no-padding-right" for="NomineeName">State</label>    
          <div class="col-xs-12 col-sm-9">
           <div class="clearfix">           
          <input type="text" class="form-control" placeholder=" " id="stateEdit"  onBlur="getCities(this.value,'cityEdit')">              
           
           </div>
          </div>
         </div>
         <div class="space-2"></div>

				<!-- <span  class="searchpadding padding_top" style="float:left; width:150px;">  State         </span>
				<span  class="searchpadding padding_top" style="float:left;width:300px;">
					<input type="text" class="form-control" placeholder=" " id="stateEdit"  onBlur="getCities(this.value,'cityEdit')">
				</span>
				<span class="searchpadding padding_top" style="float:left;margin-top: 7px;">
					<i class="searchiconblue"></i>
				</span>
        		<div class="clearfix"></div>       -->   
        		
        <div class="form-group">
          <label class="control-laabel col-xs-12 col-sm-3 no-padding-right" for="NomineeName">City</label>    
          <div class="col-xs-12 col-sm-9">
           <div class="clearfix">           
         <input type="text" class="form-control" placeholder=" " id="cityEdit">             
           
           </div>
          </div>
         </div>
         <div class="space-2"></div>
        
				<!-- <span  class="searchpadding padding_top" style="float:left; width:150px;"> City      </span>
				<span  class="searchpadding padding_top" style="float:left;width:300px;">
					<input type="text" class="form-control" placeholder=" " id="cityEdit">
				</span>
				<span class="searchpadding padding_top" style="float:left;margin-top: 7px;">
					<i class="searchiconblue"></i>
				</span>
        		<div class="clearfix"></div>  -->
        		
       <div class="form-group">
          <label class="control-laabel col-xs-12 col-sm-3 no-padding-right" for="NomineeName">Country</label>    
          <div class="col-xs-12 col-sm-9">
           <div class="clearfix">           
         <input type="text" class="form-control" placeholder=" " id="countryEdit">          
           
           </div>
          </div>
         </div>
         <div class="space-2"></div>
        
        
				<!-- <span  class="searchpadding padding_top" style="float:left; width:150px;"> Country        </span>
				 <span  class="searchpadding padding_top" style="float:left;width:300px;">
					<input type="text" class="form-control" placeholder=" " id="countryEdit">
				</span>
				<span class="searchpadding padding_top" style="float:left;margin-top: 7px;">
					<i class="searchiconblue"></i>
				</span>
				<div class="clearfix"></div>   -->
        	</div>
			<!-- <div class="topbuttonholder">
				<input class="dbtn" value="Save" id="Save" type="button" onClick="updateNominations(0,'Edit');">	
			    <input class="dbtn" value="Cancel" id="Cancel" type="button" onClick="popup('popUpAlertaddnote')">	
			</div> -->
			
			
		<div class=" col-xs-12 ">
         <div class="form-group clearfix">
         <div class="modal-footer">
         <button id="SPAddNewTestimonialLink" value="Save" class="btn btn-xs btn-primary" onclick="updateNominations(0,'Edit');">Save</button>
         <button id="SPDeleteFAQLink" value="Cancel" class="btn btn-xs btn-primary" onclick="">Cancel</button>
            
         </div>    
            </div>
         </div>        
      <div class="clearfix"></div>
			
			
			</form>
		</div>
	
		</div>
		
		</div>
		</div>






<jsp:include page="../common/footer.jsp" />

<script src="<%=request.getContextPath()%>/js/jquery.validate.min.js"></script>
<script>
 
 function updateNominations(flag,addEdit){
		
		var validator=$('#addNomineeForm').validate({
			errorElement: 'div',
			errorClass: 'help-block',
			focusInvalid: false,
			ignore: "",
			 icon: {
			valid: 'glyphicon glyphicon-ok',
			invalid: 'glyphicon glyphicon-remove',
			validating: 'glyphicon glyphicon-refresh'
			},
			rules: {
	 			
	 			name: {
	 				required: true
	 			},
	 			relationship: {
	 				required: true
	 			}
	 		},

	 		messages: {
	 			name: "Please enter name.",
	 			relationship:"Please select Relation."
	 		},


			highlight: function (e) {
				$(e).closest('.form-group').removeClass('has-info').addClass('has-error');
			},

			success: function (e) {
				$(e).closest('.form-group').removeClass('has-error');//.addClass('has-info');
				$(e).remove();
			},

			errorPlacement: function (error, element) {
				if(element.is('input[type=checkbox]') || element.is('input[type=radio]')) {
					var controls = element.closest('div[class*="col-"]');
					if(controls.find(':checkbox,:radio').length > 1) controls.append(error);
					else error.insertAfter(element.nextAll('.lbl:eq(0)').eq(0));
				}
				else if(element.is('.select2')) {
					error.insertAfter(element.siblings('[class*="select2-container"]:eq(0)'));
				}
				else if(element.is('.chosen-select')) {
					error.insertAfter(element.siblings('[class*="chosen-container"]:eq(0)'));
				}
				else error.insertAfter(element.parent());
			},

			submitHandler: function (form) {
				
				if(validator.form()){ 
					var partyId=0;
					var obj=new Object();
					obj.name=$('#name').val();
					obj.relationship=$('#relationship').val();
					obj.dob=$('#dob').val();
					obj.percentAllocated=$('#percentAllocated').val();
					obj.address=$('#address1').val()+' '+$('#address2').val()+' '+$('#address3').val();
					obj.city=$('#city').val();
					obj.state=$('#state').val();
					obj.country=$('#country').val();
					
					
					$.ajax({
						url: $('#contextPath').val()+"/folio/updateFolioNominations.htm?folioNo="+$('#folioNo').val()+"&nomineePartyId="+partyId+"&clientId="+$('#clientId').val()+"&partyAssetId=${param.partyAssetId}",
						method:"POST",
						contentType: 'application/json',
					    dataType: 'json',
					    data:JSON.stringify(obj),
						success:function(result){
							if(result.success!=null){
								$('#popUpAddNominee').modal('hide') ;
									showAlertMessage("Success",
										"<br/>Nominee added successfully.",
										"information",reloadPage);
							}else{
								showAlertMessage1("Error",
										result.error+'\n',
										"error", doNothing);
							}
							  //getNominations();
						  }
						  
				});
				}
			},
			invalidHandler: function (form) {
				
			}
		});
		/* var isValidated=true;
		if(addEdit=='Add'){
			isValidated=validateInputForm('addNominee');
		}else{
			isValidated=validateInputForm('editNominee');
		}
		
		
		if (!isValidated)
			return; */
		
		/*var obj=new Object();
		var partyId=0;
		if(addEdit=='Add'){
			obj.name=$('#name').val();
			obj.relationship=$('#relationship').val();
			obj.dob=$('#dob').val();
			obj.percentAllocated=$('#percentAllocated').val();
			obj.address=$('#address1').val()+' '+$('#address2').val()+' '+$('#address3').val();
			obj.city=$('#city').val();
			obj.state=$('#state').val();
			obj.country=$('#country').val();
		}else{
			obj.name=$('#nameEdit').val();
			obj.relationship=$('#relationshipEdit').val();
			obj.dob=$('#dobEdit').val();
			obj.percentAllocated=$('#percentAllocatedEdit').val();
			obj.address=$('#address1Edit').val()+' '+$('#address2Edit').val()+' '+$('#address3Edit').val();
			obj.city=$('#cityEdit').val();
			obj.state=$('#stateEdit').val();
			obj.country=$('#countryEdit').val();
			if($('#nomineePartyId').val()!=null && $('#nomineePartyId').val()!=""){
				partyId=$('#nomineePartyId').val();	
			}
		}
		
		
		
		*/
}
 
 function getCities(parentId,childId){	
		parentId=stateMap[parentId];
		
		if(typeof parentId!='undefined'){
		var cityArrayList=new Array();
		$('#'+childId).empty();
		$.ajax({
			type : "GET",
			url : $('#contextPath').val()+'/common/getCityList.htm?parentId='+parentId,
			success : function(result) {
				$(result).each(function(i,obj) {
					var object = {};
					object.value = obj.codeValueId;
					object.label = obj.codeValue;
					
				//	$('#'+childId).append('<option value="'+obj.codeValue+'">'+obj.codeValue+'</option>')
					cityArrayList.push(obj.codeValue);
				});
				//alert(cityArrayList);
				
				$('#'+childId).autocomplete({
					source: cityArrayList
				});
			}
		});
			$('#ui-id-1').css('z-index','9999999999999999999999999');
	}
	}

 var stateMap=new Object();
	$(document).ready(function(){
		
		//get nomination list first
		getNominations();
		
		$('#clientId').val('${param.clientId}');
		var availableStates=new Array();
		
		$('#dob,#dobEdit').datepicker({
			changeMonth : true,
			changeYear : true,
			maxDate : '0',
			yearRange : "1900:2200",
			dateFormat : "dd/mm/yy"
		});
		
		
		$.ajax({
			type : "POST",
			url : $('#contextPath').val()+'/common/getPicklistValues.htm?codeTypeIds=26,2',//
			success : function(result) {
				
				
				$('#relationship,#relationshipEdit').empty();
				
				//$('#relationship,#relationshipEdit').append('<option value="0" >---select---</option>');
				$(result).each(function(i,obj) {
				var codeTypeId=obj.codeTypeId;
				var codeValue=obj.codeValue;
				var codeValueId=obj.codeValueId;
				
				if(codeTypeId==26){
					$('#relationship,#relationshipEdit').append('<option value="'+codeValueId+'">'+codeValue+'</option>');
					
				}else if(codeTypeId==2){
					availableStates.push(codeValue);
					stateMap[codeValue]=codeValueId;
				}
				
				});								
				
			}
		});

		//getNominations();
		$('#state,#stateEdit').autocomplete({
			source: availableStates
		});
		
	});
	
	
	function selectDeselectCheckBoxes(){
		if($('input[id="nomineechkbxparent"]:checked').length > 0){
			$('input[name="nomineechkbx"]').prop('checked','checked');
		}else{
			$('input[name="nomineechkbx"]').prop('checked',false);		
		}
	}
	function getNominations(){

		/* $('#nomineeTable').html('<tr><th width="4%" class="thead">&nbsp;</th><th width="7%" class="thead">'+
		'<input id="nomineechkbxparent" name="2052732" type="checkbox" onchange="selectDeselectCheckBoxes()" ></th>'
		+'<th width="32%"  class="thead"><a href="#">Name</a></th>'
		+'<th width="20%"  class="thead"><a href="#">Relationship</a></th>'
		+'<th width="17%"  class="thead"><a href="#">DOB'
		+'</a></th>'
		+'</tr>'); */

		
		
		$.ajax({
			  url: $('#contextPath').val()+"/folio/folioNominations.htm?partyAssetId=${param.partyAssetId}",
				//url: $('#contextPath').val()+"/folio/updateGoalMapping.htm?partyAssetId="+1695,	  
			method:"get",
			  contentType: 'application/json',
		        dataType: 'json',
			  success:function(result){
				 if(result!=null){
					 var grid_data=result;
						index=grid_data;
						jQuery(function($) {
							var grid_selector = "#grid-table";
							var pager_selector = "#grid-pager";
								
							$(window).bind('resize', function() {
							    var width = $('#jqGrid_container').width();
							    $('#grid-table').setGridWidth(width);
							});
								
							jQuery(grid_selector).jqGrid({
								//direction: "rtl",
						
								//subgrid options
								subGrid : false,
								//subGridModel: [{ name : ['No','Item Name','Qty'], width : [55,200,80] }],
								//datatype: "xml",
								subGridOptions : {
									plusicon : "ace-icon fa fa-plus center bigger-110 blue",
									minusicon  : "ace-icon fa fa-minus center bigger-110 blue",
									openicon : "ace-icon fa fa-chevron-right center orange"
								},
						
								data: index,
								datatype: "local",
								//width:590,
								height: '100%',
								//shrinkToFit: false,
								
								colNames:[' ',' ','Name','Relationship','DOB'],
								colModel:[
											/* {name:'myac',index:'', width:80, fixed:true, sortable:false, resize:false,
												formatter:'actions', 
												formatoptions:{ 
													keys:true,
													//delbutton: false,//disable delete button
													
													delOptions:{recreateForm: true, beforeShowForm:beforeDeleteCallback},
													//editformbutton:true, editOptions:{recreateForm: true, beforeShowForm:beforeEditCallback}
												}
											}, */
											{name:'checkbox', index:'checkbox',width:60,sortable:false,formatter:function(cellvalue, options,rowObject) {
											    return '<input role="checkbox" type="checkbox"  class="cbox" value="'+rowObject.partyId+'" name="nomineechkbx">';
											}},
											//{name:'notesId', index:'notesId', width:15,formatter:imageFormat,formatoptions:{baseLinkUrl:'${pageContext.request.contextPath}/addOpportunity.htm?partyId='}},
											{name:'notesId', width:60,index:'notesId',formatter:function(cellvalue, options,rowObject) {
										    	return '<a href="#" onclick="editNote('+rowObject.partyId+');" id="${rowObject.notesId}"><img src="<%=request.getContextPath()%>/images/edit.png" alt="Edit" title="Edit"></a>';
											}},
											{name:'name',index:'name',  width:550, sortable:true,editable: true,edittype:"textarea", editoptions:{rows:"2",cols:"10"}},
											{name:'relationship',index:'relationship',width:550, editable:false, sorttype:"date",unformat: pickDate},
											{name:'dob',index:'dob', width:300, sortable:false,editable: false} 
										], 
							
								viewrecords : true,
								rowNum:10,
								rowList:[10,20,50,100,1000],
								pager : pager_selector,
								altRows: true,
								multiselect: false,
						        multiboxonly: true,
							
								loadComplete : function() {
									var table = this;
									setTimeout(function(){
										styleCheckbox(table);
										
										updateActionIcons(table);
										updatePagerIcons(table);
										enableTooltips(table);
									}, 0);
								},
							
								//editurl: "/dummy.html",//nothing is saved
								autowidth:true,
								shrinkToFit:false,
								
								
								});
								
								
								
								/* $(grid_selector).jqGrid('setCaption', captionName);
								$(window).triggerHandler('resize.jqGrid'); *///trigger window resize to make the grid get the correct size
								
								//switch element when editing inline
								function aceSwitch( cellvalue, options, cell ) {
									setTimeout(function(){
										$(cell) .find('input[type=checkbox]')
											.addClass('ace ace-switch ace-switch-5')
											.after('<span class="lbl"></span>');
									}, 0);
								}
								//enable datepicker
								function pickDate( cellvalue, options, cell ) {
									setTimeout(function(){
										$(cell) .find('input[type=text]')
												.datepicker({format:'yyyy-mm-dd' , autoclose:true}); 
									}, 0);
								}
								//navButtons
								jQuery(grid_selector).jqGrid('navGrid',pager_selector,
									{ 	//navbar options
										edit: false,
										editicon : 'ace-icon fa fa-pencil blue',
										add: false,
										addicon : 'ace-icon fa fa-plus-circle purple',
										del: false,
										delicon : 'ace-icon fa fa-trash-o red',
										search: true,
										searchicon : 'ace-icon fa fa-search orange',
										refresh: false,
										refreshicon : 'ace-icon fa fa-refresh green',
										view: false,
										viewicon : 'ace-icon fa fa-search-plus grey',
									},
									{
										//edit record form
										//closeAfterEdit: true,
										//width: 700,
										/* recreateForm: true,
										beforeShowForm : function(e) {
											var form = $(e[0]);
											form.closest('.ui-jqdialog').find('.ui-jqdialog-titlebar').wrapInner('<div class="widget-header" />')
											style_edit_form(form);
										} */
									},
									{
										//new record form
										//width: 700,
										/* closeAfterAdd: true,
										recreateForm: true,
										viewPagerButtons: false,
										beforeShowForm : function(e) {
											var form = $(e[0]);
											form.closest('.ui-jqdialog').find('.ui-jqdialog-titlebar')
											.wrapInner('<div class="widget-header" />')
											style_edit_form(form);
										} */
									},
									{
										//delete record form
										recreateForm: true,
										beforeShowForm : function(e) {
											var form = $(e[0]);
											if(form.data('styled')) return false;
											
											form.closest('.ui-jqdialog').find('.ui-jqdialog-titlebar').wrapInner('<div class="widget-header" />')
											style_delete_form(form);
											
											form.data('styled', true);
										},
										onClick : function(e) {
											//alert(1);
										}
									},
									{
										//search form
										recreateForm: true,
										afterShowSearch: function(e){
											var form = $(e[0]);
											form.closest('.ui-jqdialog').find('.ui-jqdialog-title').wrap('<div class="widget-header" />')
											style_search_form(form);
										},
										afterRedraw: function(){
											style_search_filters($(this));
										}
										,
										multipleSearch: true,
										
									},
									{
										//view record form
										recreateForm: true,
										beforeShowForm: function(e){
											var form = $(e[0]);
											form.closest('.ui-jqdialog').find('.ui-jqdialog-title').wrap('<div class="widget-header" />')
										}
									}
								)
								
								function style_edit_form(form) {
									//enable datepicker on "sdate" field and switches for "stock" field
									form.find('input[name=sdate]').datepicker({format:'yyyy-mm-dd' , autoclose:true})
									
									form.find('input[name=stock]').addClass('ace ace-switch ace-switch-5').after('<span class="lbl"></span>');
											   //don't wrap inside a label element, the checkbox value won't be submitted (POST'ed)
											  //.addClass('ace ace-switch ace-switch-5').wrap('<label class="inline" />').after('<span class="lbl"></span>');
							
											
									//update buttons classes
									var buttons = form.next().find('.EditButton .fm-button');
									buttons.addClass('btn btn-xs').find('[class*="-icon"]').hide();//ui-icon, s-icon
									buttons.eq(0).addClass('btn-primary').prepend('<i class="ace-icon fa fa-check"></i>');
									buttons.eq(1).prepend('<i class="ace-icon fa fa-times"></i>')
									
									buttons = form.next().find('.navButton a');
									buttons.find('.ui-icon').hide();
									buttons.eq(0).append('<i class="ace-icon fa fa-chevron-left"></i>');
									buttons.eq(1).append('<i class="ace-icon fa fa-chevron-right"></i>');		
								}
							
								function style_delete_form(form) {
									var buttons = form.next().find('.EditButton .fm-button');
									buttons.addClass('btn btn-xs btn-white btn-round').find('[class*="-icon"]').hide();//ui-icon, s-icon
									buttons.eq(0).addClass('btn-danger').prepend('<i class="ace-icon fa fa-trash-o"></i>');
									buttons.eq(1).addClass('btn-default').prepend('<i class="ace-icon fa fa-times"></i>')
								}
								
								function style_search_filters(form) {
									form.find('.delete-rule').val('X');
									form.find('.add-rule').addClass('btn btn-xs btn-primary');
									form.find('.add-group').addClass('btn btn-xs btn-success');
									form.find('.delete-group').addClass('btn btn-xs btn-danger');
								}
								function style_search_form(form) {
									var dialog = form.closest('.ui-jqdialog');
									var buttons = dialog.find('.EditTable')
									buttons.find('.EditButton a[id*="_reset"]').addClass('btn btn-xs btn-info').find('.ui-icon').attr('class', 'ace-icon fa fa-retweet');
									buttons.find('.EditButton a[id*="_query"]').addClass('btn btn-xs btn-inverse').find('.ui-icon').attr('class', 'ace-icon fa fa-comment-o');
									buttons.find('.EditButton a[id*="_search"]').addClass('btn btn-xs btn-purple').find('.ui-icon').attr('class', 'ace-icon fa fa-search');
								}
								
								function beforeDeleteCallback(e) {
									var form = $(e[0]);
									if(form.data('styled')) return false;
									
									form.closest('.ui-jqdialog').find('.ui-jqdialog-titlebar').wrapInner('<div class="widget-header" />')
									style_delete_form(form);
									
									form.data('styled', true);
								}
								
								function beforeEditCallback(e) {
									var form = $(e[0]);
									form.closest('.ui-jqdialog').find('.ui-jqdialog-titlebar').wrapInner('<div class="widget-header" />')
									style_edit_form(form);
								}
							
								//it causes some flicker when reloading or navigating grid
								//it may be possible to have some custom formatter to do this as the grid is being created to prevent this
								//or go back to default browser checkbox styles for the grid
								function styleCheckbox(table) {
								
								}
								
								//unlike navButtons icons, action icons in rows seem to be hard-coded
								//you can change them like this in here if you want
								function updateActionIcons(table) {
									
								}
								
								//replace icons with FontAwesome icons like above
								function updatePagerIcons(table) {
									var replacement = 
									{
										'ui-icon-seek-first' : 'ace-icon fa fa-angle-double-left bigger-140',
										'ui-icon-seek-prev' : 'ace-icon fa fa-angle-left bigger-140',
										'ui-icon-seek-next' : 'ace-icon fa fa-angle-right bigger-140',
										'ui-icon-seek-end' : 'ace-icon fa fa-angle-double-right bigger-140'
									};
									$('.ui-pg-table:not(.navtable) > tbody > tr > .ui-pg-button > .ui-icon').each(function(){
										var icon = $(this);
										var $class = $.trim(icon.attr('class').replace('ui-icon', ''));
										
										if($class in replacement) icon.attr('class', 'ui-icon '+replacement[$class]);
									})
								}
							
								function enableTooltips(table) {
									$('.navtable .ui-pg-button').tooltip({container:'body'});
									$(table).find('.ui-pg-div').tooltip({container:'body'});
								}
							
								$(document).one('ajaxloadstart.page', function(e) {
									$(grid_selector).jqGrid('GridUnload');
									$('.ui-jqdialog').remove();
								});
							});
							function openActionPopup(batchId){
								alert(batchId);
								
								$('#ViewErrorCountLink a').attr('onClick','getErrorDetails('+batchId+')');
								$('#ViewUploadedTransactionsLink a').attr('href','${pageContext.request.contextPath}/et/getbulkuploadtransactiohistorydetails.htm?queueId='+batchId);
								/* $('#exedtls a').attr('href','${pageContext.request.contextPath}/et/executionDetails.htm?fpActionPlanId='+fpApId);
								$('#preprintform a').attr('href','${pageContext.request.contextPath}/et/openEtForm.htm?fpActionPlanId='+fpApId);
								$('#trackHist a').attr('href','${pageContext.request.contextPath}/et/etTrackingHistory.htm?fpActionPlanId='+fpApId);
								$('#documents a').attr('href','${pageContext.request.contextPath}/et/etDocs.htm?fpActionPlanId='+fpApId);
								$('#etNotes a').attr('href','${pageContext.request.contextPath}/et/etNotes.htm?fpActionPlanId='+fpApId);
								*/
								$( ".action_dialog" ).removeClass('hide').dialog({
									resizable: false,
									modal: true,
				                    width: "auto",
								}); 
							}
					 //$('#folioOrAccountNo').html('Nomination List for Account/Folio '+result[0].folioNo);
				 }
				  var rowObj={}; 
				  $(result).each(function(i,obj){
					  $('#folioNo').val(obj.folioNo);
					  rowObj.name=obj.name;	  
					  rowObj.relationship=obj.relationship;	  
					  rowObj.dob=obj.dob;	  
					  rowObj.comments=obj.comments;	
					  rowObj.partyId = obj.partyId;
					  /* rowObj.state = obj.state;
					  rowObj.city = obj.city;
					  rowObj.country = obj.state; */
					  
					  var contextPath="<%=request.getContextPath()%>";
					  //ViewTxt(\''+partyAssetId +'\')
					/*   $('#nomineeTable').append('<tr id="'+rowObj.partyId+'"><td><a href="#" onclick="editNote(\''+rowObj.partyId+'\');"><img src="'+contextPath+'/images/edit.png" alt="Edit" title="Edit" onClick="popup(\'popUpAlertaddnote\')" /></a></td>'
					  +'<td><input type="checkbox" name="nomineechkbx" value=\''+rowObj.partyId+'\'/></td><td>'+rowObj.name+'</td><td>'+rowObj.relationship+'</td><td>'+rowObj.dob+'</td></tr>');				 */	  			
				  });
				 
			  
			  }
			});
	}
	
	
	function isNumber(evt) {
	    evt = (evt) ? evt : window.event;
	    var charCode = (evt.which) ? evt.which : evt.keyCode;
	    if (charCode > 31 && (charCode < 48 || charCode > 57)) {
	        return false;
	    }
	    return true;
	}
	
	function checkDelete(){
		var selectedCheckBoxes = [];
		$("input:checkbox[name=nomineechkbx]:checked").each(function(){
			var value = $(this).val();
			selectedCheckBoxes.push(value);
		});
		
		if(selectedCheckBoxes.length <= 0){
			showAlertMessage('Warning','<br/>Please select atleast one record!','warning');
			return;
		}
		popup('popUpAlertaddnote');
	}
	 
	
	function deleteNominee()
	   
	   { 
	    var slvals = []
	    $('input:checkbox[name=nomineechkbx]:checked').each(function() {
	    slvals.push($(this).val());
	    })
	    
	    //alert("delete list  "+slvals);
	   document.getElementById("confirmdelete").value = slvals;
	   if(slvals<=0)
	    { 
	    bootbox.dialog({
	     message: "<span class='bigger-110'>Please select at least one Record.</span>",
	   buttons:    
	   {
	    "click" :
	    {
	     "label" : "OK!",
	     "className" : "btn-sm btn-primary",
	     "callback": function() {
	      location.reload();
	     }
	    }
	   }
	  });
	  
	    //location.reload();
	    
	    }else{
	     deleteNote();
	    }

	    
	   };
	
	   
	   function deleteNominees(){
			
		var selectedCheckBoxes= document.getElementById("confirmdelete").value;
		if(selectedCheckBoxes.length > 0){
			
			 $.ajax({
					
					type : "POST", 
					url :$('#contextPath').val()+"/folio/deleteFolioNominations.htm?noteIds="+selectedCheckBoxes,
					//dataType: 'json',
					//contentType : 'application/json',
					success : function(result) {
						
							//alert("fsdfs");
							bootbox.dialog({
								message: "<span class='bigger-110'>Nominee Deleted Successfully</span>",
								buttons: 			
								{
									"click" :
									{
										"label" : "OK!",
										"className" : "btn-xs btn-primary",
										"callback": function() {
											location.reload();
											//Example.show("Primary button");
										}
									}
								}
							});
							
							
						
						
					}
			 });
		}
	   }
	</script>
	
	<script>


function addNote(){
	$('#popUpAddNominee').modal('show') ;
}




function deleteNote(){
	
	
/* //alert("DeleteNotegrid");
list = new Array();
var cntr=0;
$('#grid-table :checked').each(function(i, obj) {
	if($(this).attr('id')!='selectAll' && $(this).attr('id')!='chkdeleteselect' && $(this).attr('id')!='' && $(this).attr('id')!=undefined && $(this).attr('id')!=0){
		list[cntr] = $(this).attr('id');
		cntr+=1;
	}
	
});

alert(list);
if (list.length == 0) {
	bootbox.dialog({
		message: "<span class='bigger-110'>Please select at least one Note to delete.</span>",
		buttons: 			
		{
			"click" :
			{
				"label" : "OK!",
				"className" : "btn-xs btn-primary"
				
			}
		}
	});
	
} else{
	var message = "";
	if (list.length == 1) {
		message = "Do you want to delete this Note?";
	} else {
		message = "Do you want to delete these Note?";
	}
	
	bootbox.dialog({
		message: "<span class='bigger-110'>"+message+"</span>",
		buttons: 			
		{
			
		
			"click" :
			{
				"label" : "YES!",
				"className" : "btn-xs btn-primary",
				"callback": function() {
					deleteNominees()
					//Example.show("Primary button");
				}
			},
			"danger" :
			{
				"label" : "NO!",
				"className" : "btn-xs btn-danger"
				
			}
		}
	});

} */

$('#deletenote').modal('show'); 	
$("#addnote, #editnote, #uploadUser, #LoginonBehalf").hide();	
/*$("#popUpAlertaddnote").css ('height','250px');
$("#popUpAlertaddnote").css ('width','300px');
$("#popUpAlertaddnote").css ('top','90px');
$("#popUpAlertaddnote").css ('left','450px');  */
}
function editNote(partyId){

	alert(partyId);

	
	$("#nomineePartyId").val(partyId);
	
	$.ajax({
		  url: $('#contextPath').val()+"/folio/getNomineeDataByPartyId.htm?partyId="+partyId,
			method:"GET",
		  contentType: 'application/json',
	        dataType: 'json',
	       // data:JSON.stringify(selectedCheckBoxes),
		  success:function(result){
			
			  if(!isObjectNull(result)){
				  
				  var name = result.name.trim();
				  var relationship = result.relationship;
				  var dob = result.dob;
				  var city = result.city;
				  var country = result.country;
				  var state = result.state;
				  var address = result.address;
				  alert(name);
				  $("#nameEdit").val(name);
				  $("#relationshipEdit").val(relationship);
				  $("#dobEdit").val(dob);
				  $("#cityEdit").val(city);
				  $("#stateEdit").val(state);
				  $("#address1Edit").val(address);
				  $("#countryEdit").val(country);
				  
				  
			  }
		  }
	});	

$('#editnote').modal('show');
/* $("#editnote").show(); */	
/* $("#addnote, #deletenote, #uploadUser, #LoginonBehalf").hide();	
=======
$('#editnote').modal('show');
/* $("#editnote").show(); */	
$("#addnote, #deletenote, #uploadUser, #LoginonBehalf").hide();	

$("#popUpAlertaddnote").css ('height','560px');
$("#popUpAlertaddnote").css ('width','650px');
$("#popUpAlertaddnote").css ('top','90px');
$("#popUpAlertaddnote").css ('left','340px'); 
}

</script>



</body>
</html>