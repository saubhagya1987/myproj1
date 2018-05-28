<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://displaytag.sf.net" prefix="display"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!DOCTYPE html>
<html lang="en"><head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
    <meta charset="utf-8"> 
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
	<title>Product Master List</title>
 
 <style type="text/css">
th.ui-th-column div {
   white-space: normal !important;
    height: auto !important;
    padding: 2px; 
} 
<%HttpSession htsession=request.getSession();%>
.page-title{margin: 13px 0 0px 8px !important; font-weight: bolder; }  

.  h1{font-family: Arial !important;}
</style>

<link href="https://myffreedom.in/FFreedom_Portalimages/favicon.ico" rel="shortcut icon">
<script src="js/jstree/jstree.min.js"></script>
<script type="text/javascript">  
	function getProductType(){
		var id=$('#assetId').val();
		if(id!=0){
			
		document.getElementById("prodTypeId").value = 0;
		document.getElementById("prodCatId").value = 0;
		 
		$.ajax({			   				
   		 type: "GET",
   		 url: $('#contextPath').val()+'/product/getProductType.htm?assetId='+id,
		 dataType: 'json',
		 contentType: 'application/json',
		 success:function(result)
	   	{ 
			$('#prodTypeId').empty();
			$('#prodCatId').empty();
			$('#prodCatId').append('<option value="0">--All--</option>');
			$('#prodTypeId').append('<option value="0">--All--</option>');
								
			$(result).each(function(i, obj) {
				var id=obj.prodTypeId;
				var name=obj.prodTypeName; 
				$('#prodTypeId').append('<option value="'+ id+'"  >'+ name + '</option>');		
							 				
				});
					 									
	   		  }
	   	
	   	});  
	 } else{
		 	$('#prodTypeId').empty();
			$('#prodCatId').empty();
			$('#prodCatId').append('<option value="0">--All--</option>');
			$('#prodTypeId').append('<option value="0">--All--</option>');
	 }
	}

	function getProductType1(ss){
		var id=$('#assetId').val();
		if(id!=0){			
		 
		$.ajax({			   				
   		 type: "GET",
   		 url: $('#contextPath').val()+'/product/getProductType.htm?assetId='+id,
		 dataType: 'json',
		 contentType: 'application/json',
		 success:function(result)
	   	{ 
			$('#prodTypeId').empty();
			$('#prodCatId').empty();
			$('#prodCatId').append('<option value="0">--All--</option>');
			$('#prodTypeId').append('<option value="0">--All--</option>');
								
			$(result).each(function(i, obj) {
				var id=obj.prodTypeId;
				var name=obj.prodTypeName; 
				
			    if(id ==ss)
			    {
		      		//$(id).append('<option value="'+ modulename+'" selected="selected">'+ module + '</option>');
		      		$('#prodTypeId').append('<option value="'+ id+'" selected="selected">'+ name + '</option>');
		      	} else{
		      	//	$(id).append('<option value="'+ modulename+'">'+ module + '</option>');	
		      		$('#prodTypeId').append('<option value="'+ id+'" >'+ name + '</option>');
		      	}
				//$('#prodTypeId').append('<option value="'+ id+'"  >'+ name + '</option>');		
							 				
				});
					 									
	   		  }
	   	
	   	});  
	 } else{
		 	$('#prodTypeId').empty();
			$('#prodCatId').empty();
			$('#prodCatId').append('<option value="0">--All--</option>');
			$('#prodTypeId').append('<option value="0">--All--</option>');
	 }
	}

	function getProductCategory(){
		      
		var id=$('#prodTypeId').val();
		
		//$('#prodCatId').val()=0;
		//document.getElementById("prodCatId").value = 0;
		//document.getElementById("searchtext").value =null;
		alert("sss"+id);
		$.ajax({			   				
	   		 type: "GET",
	   		url: $('#contextPath').val()+'/product/getProductCategory.htm?prodTypeId='+id,
			 dataType: 'json',
			 contentType: 'application/json',
			 success:function(result)
		   	{ 
				$('#prodCatId').empty();
				$('#prodCatId').append('<option value="0">--Select--</option>');
									
				$(result).each(function(i, obj) {
					var id=obj.prodCatId;
					var name=obj.prodCatName; 
					
					$('#prodCatId').append('<option value="'+ id+'" >'+ name + '</option>');		
												
					});
															
		   		  }
		   	
		   	}); 
	}
	function getProductCategory1(abcd){
	 var getproducttypeid1='<%=htsession.getAttribute("setproductTypeIdNew")%>';
		var id=getproducttypeid1;
		//$('#prodCatId').val()=0;
		//document.getElementById("prodCatId").value = 0;
		//document.getElementById("searchtext").value =null;
		//alert("dfdf"+id);
		$.ajax({			   				
	   		 type: "GET",
	   		url: $('#contextPath').val()+'/product/getProductCategory.htm?prodTypeId='+id,
			 dataType: 'json',
			 contentType: 'application/json',
			 success:function(result)
		   	{ 
				$('#prodCatId').empty();
				$('#prodCatId').append('<option value="0">--Select--</option>');
									
				$(result).each(function(i, obj) {
					var id=obj.prodCatId;
					var name=obj.prodCatName; 
					
					
				    if(id ==abcd)
				    {
			      		//$(id).append('<option value="'+ modulename+'" selected="selected">'+ module + '</option>');
			      		$('#prodCatId').append('<option value="'+ id+'" selected="selected">'+ name + '</option>');
			      	} else{
			      	//	$(id).append('<option value="'+ modulename+'">'+ module + '</option>');	
			      		$('#prodCatId').append('<option value="'+ id+'" >'+ name + '</option>');
			      	}
						
												
					});
															
		   		  }
		   	
		   	}); 
	}
	
	
	
	function getNewProductList() {
		//alert('in name list');
		var assetid=0;
		var prodtypeid=0;  
		var catid=0;
		var searchtext=null;
	//	alert($('#searchtext').val());
		if($('#searchtext').val()==null){
			assetid=$('#assetId').val();
			//alert('Assetid:'+assetid);
			prodtypeid=$('#prodTypeId').val();
			catid=$('#prodCatId').val();
			//searchtext=null;
		} else{
			
		//	searchtext=$('#searchtext').val();
			document.getElementById("assetId").value = 0;
			document.getElementById("prodTypeId").value = 0;
			document.getElementById("prodCatId").value = 0;
			
			$('#prodTypeId').empty(); 
			$('#prodCatId').empty();
			//$('#assetId').empty();
			/* $("#assetId option[value='0']").remove();
			$('#assetId').prepend('<option value="0">--All--</option>');
			$('#prodCatId').append('<option value="0">--All--</option>');
			$('#prodTypeId').append('<option value="0">--All--</option>'); */
		}
		
		
		$("#toreload").load('${pageContext.request.contextPath}/product/loadproductlist.htm #toreload', {
			   object: '${object}',
			   pageSize: $('#page').val(),    
			   assetClassId: assetid,
			   productTypeId:prodtypeid,
			   prodCategoryId:catid,
			   searchtext:searchtext, 
			       

		}, function( response, status, xhr ) {
		      try{
		        
		    		//$("#csvExp").attr("href", "${pageContext.request.contextPath}/product/productExport.htm?type=CSV&assetClassId="+assetid+"&productTypeId="+prodtypeid+"&prodCategoryId="+catid+"&searchTextVal="+searchtext);
		    		//$("#excelExp").attr("href", "${pageContext.request.contextPath}/product/productExport.htm?type=excel&assetClassId="+assetid+"&productTypeId="+prodtypeid+"&prodCategoryId="+catid+"&searchTextVal="+searchtext);
		    	 //closePopupWebApp('');
		      }catch(e){
		        // closePopupWebApp('');        
		      }
		     }); 
	}
		
		  
	function updateProduct(masterProductId,productName,productDescription,custodianCode,
							industryCode,ISINCode,isActive,isClosedEnd,isInstitutional,minSIPValue,
							minAddnPurchaseValue,minPurchaseValue,custodianCodeAlias)
    {  
		
		//$('#editnote').modal('show');   
		
		$("#editnote").modal({
		    backdrop: 'static',
		    keyboard: false,
		    show:true
		});
		
		
		if(masterProductId == 'null')
		{
			masterProductId = "";
		}
		else{
			document.getElementById("masterProductId").value = masterProductId;
		}
		
		if(productName == 'null')
		{
			productName = "";
		}
		else{
			document.getElementById("editproductName").value = productName;
		}
		
		if(productDescription == 'null')
		{
			productDescription = "";
		}
		else{
			document.getElementById("editproductDescription").value = productDescription;
			//$("#editproductDescription").val(productDescription)
		}
		
		if(custodianCode == 'null')
		{
			custodianCode = "";
		}
		else{
			document.getElementById("editcustodianCode").value = custodianCode;
		}
		
		
		if(industryCode == 'null')
		{
			industryCode = "";
		}
		else{
			document.getElementById("editindustryCode").value = industryCode;
		}
		
		if(ISINCode == 'null')
		{
			ISINCode = ""; 
		}
		else{
			document.getElementById("editISINCode").value = ISINCode;
		}
		
		if(custodianCode == 'null')
		{
			custodianCode = ""; 
		}
		else{
			document.getElementById("oldcustCode").value = custodianCode;
		}
		
		if(minSIPValue == 'null')
		{
			minSIPValue = ""; 
		}
		else{
			document.getElementById("editminSIPValue").value = minSIPValue;
		}
		
		if(minPurchaseValue == 'null')
		{
			minPurchaseValue = ""; 
		}
		else{
			document.getElementById("editminPurchaseValue").value = minPurchaseValue;
		}
		
		if(minAddnPurchaseValue == 'null')
		{
			minAddnPurchaseValue = ""; 
		}
		else{
			document.getElementById("editminAddnPurchaseValue").value = minAddnPurchaseValue;
		}  
		
		if(custodianCodeAlias == 'null')
		{
			custodianCodeAlias = ""; 
		}
		else{
			document.getElementById("editcustodianCodeAlias").value =custodianCodeAlias;
		}
		  
		var act = isActive;
		var close=isClosedEnd;
		var inst=isInstitutional; 
		 
		if(act){
			document.getElementById("editisActive").value=1;
			$("#editisActive").prop('checked', true); 
			
		} else{
			document.getElementById("editisActive").value=0;
			$("#editisActive").prop('checked', false);
		}
		
		if(close){
			
			document.getElementById("editisClosedEnd").value=1;
			$("#editisClosedEnd").prop('checked', true);
			
		} else{
			
			document.getElementById("editisClosedEnd").value=0;
			$("#editisClosedEnd").prop('checked', false);
		}
		
		if(inst){
			 
			document.getElementById("editinstitutional").value=1;
			$("#editinstitutional").prop('checked', true);
			
		} else{ 
			
			document.getElementById("editinstitutional").value=0;
			$("#editinstitutional").prop('checked', false);
		}
		
    }

	function editnote() {
		     
		$("#editnote").modal('show');  
		
	} 
	   
function checkCustCode(cstcode){
		var newCode = null;
		var oldcustCode=null;
		var productId= document.getElementById("masterProductId").value;
		oldcustCode = $('#oldcustCode').val();
		newCode = cstcode;
		
		if(cstcode!='' && productId!=0 && (oldcustCode != newCode)){ 
			$.ajax({			   				
		   		 type: "GET",
		   		 url: $('#contextPath').val()+'/product/checkCustodianCode.htm?productId='+productId+'&custodianCode='+newCode,
				 dataType: 'json',
				 contentType: 'application/json',
				 success:function(result)
				   	{ 
						 if(result==1){
							 alert('Custodian code already present,Please enter another code.');
							 $('#editcustodianCode').val('');
							 $('#editcustodianCode').focus();
						 } 
				   	}
			   	
			   	});
		}
	}
	
	function addProduct(){
		
		getAMCManufacturerList();
		$("#addpopup").modal({
		    backdrop: 'static',
		    keyboard: false,
		    show:true
		});
	}
	
	
	function getProductTypeList(assetId){
		//alert(assetId);
		$.ajax({			   				
	   		 type: "GET",
	   		 url: $('#contextPath').val()+'/product/getProductType.htm?assetId='+assetId,
			 dataType: 'json',
			 contentType: 'application/json',
			 success:function(result)
		   	{ 
				$('#prodTypeId1').empty();
				$('#prodCatId').empty();
				$('#prodCatId').append('<option value="0">--All--</option>');
				$('#prodTypeId1').append('<option value="0">--All--</option>');
									
				$(result).each(function(i, obj) {
					var id=obj.prodTypeId;
					var name=obj.prodTypeName; 
					$('#prodTypeId1').append('<option value="'+ id+'"  >'+ name + '</option>');		
								 				
					});
						 									
		   		  }
		   	
		   	}); 
	}
	
	function getProductCategoryList(prodTypeId){
		$.ajax({			   				
	   		 type: "GET",
	   		url: $('#contextPath').val()+'/product/getProductCategory.htm?prodTypeId='+prodTypeId,
			 dataType: 'json',
			 contentType: 'application/json',
			 success:function(result)
		   	{ 
				$('#prodCatId1').empty();
				//$('#prodCatId').empty();
				$('#prodCatId1').append('<option value="0">--All--</option>');
				//$('#prodTypeId1').append('<option value="0">--All--</option>');
									
				$(result).each(function(i, obj) {
					var id=obj.prodCatId;
					var name=obj.prodCatName; 
					$('#prodCatId1').append('<option value="'+ id+'"  >'+ name + '</option>');		
								 				
					});
						 									
		   		  }
		   	
		   	}); 
	}
	
	function submitAddProduct1(){
		
		$.validator.addMethod("alphaNumeric", function (value, element) {
		    return this.optional(element) || /^[ 0-9a-zA-Z]+$/.test(value);
		}, " Only letters allowed.");

		
		$.validator.addMethod("alphaNumeric1", function (value, element) {
		    return this.optional(element) || /^[()/ ,.0-9a-zA-Z]+$/.test(value);
		}, "Special character not allowed.");
		
		var validator=$('#addform').validate({
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
				partyId: {
					required:true
					//alphaNumeric:true
					//alphanumeric: true
					
				},
				productName: {
					required:true
					//alphaNumeric:true
					//alphanumeric: true
					
				}
		
			
		},

			messages: {
				partyId: {
					required: "Please select manufacturer name."				
				},
				productName: {
					required: "Please select product name."				
				}
				
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
					alert(123);
				}
			},
			invalidHandler: function (form) {
				
			}
		});
		
	
	}
	
	function getAMCManufacturerList(){
		//getAmcDropDownList
		$.ajax({			   				
	   		 type: "GET",
	   		url: $('#contextPath').val()+'/product/getAmcName.htm',
			 dataType: 'json',
			 contentType: 'application/json',
			 success:function(result)
		   	{ 
				$('#manufacturerId').empty();
				$('#manufacturerId').append('<option value="">--All--</option>');
				$(result).each(function(i, obj) {
					var id=obj.partyId;
					var name=obj.manufacturerName; 
					$('#manufacturerId').append('<option value="'+ id+'">'+ name + '</option>');		
								 				
					});
						 									
		   		  }
		   	
		   	});
	}
	
	
	
</script>

</head>
<body>
<jsp:include page="../common/header.jsp" />
     
<div class="modal fade" id="editnote" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog ">
    	<div class="modal-content modal-md">
    		<div class="modal-header">
        		<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        		<h4 class="modal-title" id="myModalLabel">Edit Product </h4>
      		</div>
   			<form class="form-horizontal" id="editform" method="POST">
				<div class="modal-body">
					<input type="hidden" name="masterProductId" id="masterProductId">
					<input type="hidden" name="oldcustCode" id="oldcustCode">
					<!-- <input type="hidden" name="oldcustCode" id="oldcustCode1"> -->
					
		
									
						<div class="form-group">
							<label class="control-label col-xs-12 col-sm-3 no-padding-right" for="email">Product Name<span class="red">*</span></label>
							 <div class="col-xs-12 col-sm-9">
								<div class="clearfix">
									<input type="text" class="col-xs-12 col-sm-9"  value="" id="editproductName" name="productName" >
								</div>
							</div>
						</div>
						<div class="space-2"></div>
						
						
						<div class="form-group">
							<label class="control-label col-xs-12 col-sm-3 no-padding-right" for="email">Product Description</label>
							 <div class="col-xs-12 col-sm-9">
								<div class="clearfix">
								<input class="col-xs-12 col-sm-9" id="editproductDescription" name="productDescription" value="">
								</div>
							</div>
						</div>
						<div class="space-2"></div>
						
						<div class="form-group">
							<label class="control-label col-xs-12 col-sm-3 no-padding-right" for="email">Mapped External Codes</label>
							 <div class="col-xs-12 col-sm-9">
								<div class="clearfix">
								<input type="text" class="col-xs-12 col-sm-9" value=""  name="custodianCode" id="editcustodianCode" onchange="checkCustCode(this.value);">
								</div>
							</div>
						</div>
						<div class="space-2"></div>
						
						
						
							<div class="form-group">
							<label class="control-label col-xs-12 col-sm-3 no-padding-right" for="email">Industry Code</label>
							 <div class="col-xs-12 col-sm-9">
								<div class="clearfix">
								<input type="text" class="col-xs-12 col-sm-9" value="" name="industryCode" id="editindustryCode" readonly>
								</div>
							</div>
						</div>
						<div class="space-2"></div>
						
						
							<div class="form-group">
							<label class="control-label col-xs-12 col-sm-3 no-padding-right" for="email">ISIN Code</label>
							 <div class="col-xs-12 col-sm-9">
								<div class="clearfix">
								<input class="col-xs-12 col-sm-9" value="" name="ISINCode" id="editISINCode" readonly></input>
								</div>
							</div>
						</div>
						<div class="space-2"></div>
						
						<div class="form-group">
							<label class="control-label col-xs-12 col-sm-3 no-padding-right" for="email">Custodian Code Alias List (use | Seperator ex. |xyz|)</label>
							 <div class="col-xs-12 col-sm-9">
								<div class="clearfix">
								<input class="col-xs-12 col-sm-9" name="custodianCodeAlias" id="editcustodianCodeAlias" onblur="checkCustCodeAliasEdit();" ></input>
								</div>
							</div>
							<span id="errormsg" style="float:left; width:380px;padding-left:150px; padding-top: 10px;"></span>
						</div>
						<div class="space-2"></div>
						
						
						
							<div class="form-group">
							<label class="control-label col-xs-12 col-sm-3 no-padding-right" for="email">Controls</label>
							 <div class="col-xs-12 col-sm-9">
								<div class="clearfix">
								<input id="editisActive" name="isActive" value="1" type="checkbox"><span class="user">Active    </span>
								<input id="editisClosedEnd" name="isClosedEnd" value="1" type="checkbox"><span class="user">Closed Ended     </span>
								<input id="editinstitutional" name="isInstitutional" value="1" type="checkbox"><span class="user">Institutional  </span>
								</div>
							</div>
						</div>
						<div class="space-2"></div>
						
						<div class="form-group">
							<label class="control-label col-xs-12 col-sm-3 no-padding-right" for="email">Min SIP Amount</label>
							 <div class="col-xs-12 col-sm-9">
								<div class="clearfix">
								<input class="col-xs-12 col-sm-9" name="minSIPValue" id="editminSIPValue" value=""></input>
								</div>
							</div>
						</div>
						<div class="space-2"></div>
						
						<div class="form-group">
							<label class="control-label col-xs-12 col-sm-3 no-padding-right" for="email">Min Purchase Amt</label>
							 <div class="col-xs-12 col-sm-9">
								<div class="clearfix">
								<input class="col-xs-12 col-sm-9" name="minPurchaseValue" id="editminPurchaseValue" value=""></input>
								</div>
							</div>
						</div>
						<div class="space-2"></div>
						
						<div class="form-group">
							<label class="control-label col-xs-12 col-sm-3 no-padding-right" for="email">Min Addn Purchase Amt</label>
							 <div class="col-xs-12 col-sm-9">
								<div class="clearfix">
								<input class="col-xs-12 col-sm-9" name="minAddnPurchaseValue" id="editminAddnPurchaseValue" value="" ></input>
								</div>
							</div>
						</div>
						<div class="space-2"></div>
							
									
					</div><!-- modal body end -->
					
					<div class="modal-footer">
						  	<button  class="btn btn-sm btn-primary" onClick="submitUpdatedProduct();">Save & Close</button>
                   			<button  class="btn btn-sm btn-primary" data-dismiss="modal" >Cancel</button> 
					</div>
					</form>
       </div>
  </div>
</div>


<!-- add product -->	
<div class="modal fade" id="addpopup" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog ">
    	<div class="modal-content modal-md">
    		<div class="modal-header">
        		<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        		<h4 class="modal-title" id="myModalLabel">Add Product </h4>
      		</div>
   			<form class="form-horizontal" id="addform" method="POST">
				<div class="modal-body">
					<input type="hidden" name="masterProductId" id="masterProductId1" value="0">
					<!-- <input type="hidden" name="oldcustCode" id="oldcustCode1"> -->
					
					<div class="form-group">
						<label class="control-label col-xs-12 col-sm-3 no-padding-right" for="email">Manufacturer Name<span class="red">*</span></label>
						<div class="col-xs-12 col-sm-9">
							<div class="clearfix">
								<select id="manufacturerId" name="partyId" class="col-xs-12 col-sm-9">
		             				<option value=""> --All--  </option>
			   			  		</select>
							</div>
						</div>
					</div>
					<div class="space-2"></div>
									
						<div class="form-group">
							<label class="control-label col-xs-12 col-sm-3 no-padding-right" for="email">Product Name<span class="red">*</span></label>
							 <div class="col-xs-12 col-sm-9">
								<div class="clearfix">
									<input type="text" class="col-xs-12 col-sm-9"  id="addproductName" name="productName" >
								</div>
							</div>
						</div>
						<div class="space-2"></div>
						
						<div class="form-group">
							<label class="control-label col-xs-12 col-sm-3 no-padding-right" for="email">Product Description</label>
							 <div class="col-xs-12 col-sm-9">
								<div class="clearfix">
									<input type="text" class="col-xs-12 col-sm-9"  id="addproductDescription" name="productDescription" >
								</div>
							</div>
						</div>
						<div class="space-2"></div>
						
						<div class="form-group">
							<label class="control-label col-xs-12 col-sm-3 no-padding-right" for="email">Asset Class<span class="red">*</span></label>
							 <div class="col-xs-12 col-sm-9">
								<div class="clearfix">
									<select id="assetId1" name="assetId" class="form-control" onchange="getProductTypeList(this.value);">
					             		<option value=""> --All--  </option>
					                 	<c:forEach var="item" items="${assetList}"> 
					                 		<c:if test="${item.assetId==46001 || item.assetId==46002 || item.assetId==46003}">
					                 		<option value="${item.assetId}" <c:if test="${item.assetId==assetClassId}"> </c:if> >${item.assetName}</option>
					                 		</c:if> 
					                 	</c:forEach>  
						   		    </select>
								</div>
							</div>
						</div>
						<div class="space-2"></div>
						
						<div class="form-group">
							<label class="control-label col-xs-12 col-sm-3 no-padding-right" for="email">Product Type<span class="red">*</span></label>
							 <div class="col-xs-12 col-sm-9">
								<div class="clearfix">
									<select id="prodTypeId1" name="prodTypeId" class="form-control" onchange="getProductCategoryList(this.value);">
					             		<option value=""> --All--  </option>		                 	
					                 						                 	
						   		    </select>
								</div>
							</div>
						</div>
						<div class="space-2"></div>
						
						<div class="form-group">
							<label class="control-label col-xs-12 col-sm-3 no-padding-right" for="email">Product Category<span class="red">*</span></label>
							 <div class="col-xs-12 col-sm-9">
								<div class="clearfix">
									<select id="prodCatId1" name="prodCatId" class="col-xs-12 col-sm-9">
		             				<option value=""> --All--  </option>
			   			   		</select>
								</div>
							</div>
						</div>
						<div class="space-2"></div>
						
						<div class="form-group">
							<label class="control-label col-xs-12 col-sm-3 no-padding-right" for="email">Mapped External Codes<span class="red">*</span></label>
							 <div class="col-xs-12 col-sm-9">
								<div class="clearfix">
									<input type="text" class="col-xs-12 col-sm-9"  id="addcustodianCode" name="custodianCode" >
								</div>
							</div>
						</div>
						<div class="space-2"></div>
						
						<div class="form-group">
							<label class="control-label col-xs-12 col-sm-3 no-padding-right" for="email">Custodian Code Alias List (use | Seperator ex. |xyz|)</label>
							 <div class="col-xs-12 col-sm-9">
								<div class="clearfix">
									<input type="text" class="col-xs-12 col-sm-9"  id="addcustodianCodeAlias" name="custodianCodeAlias" onblur="checkCustCodeAlias();" >									
								</div>
							</div>
							<span id="errormsg2" style="float:left; width:380px;padding-left:150px; padding-top: 10px;"></span>
						</div>
						
						<div class="space-2"></div>
					
					
									
					</div><!-- modal body end -->
					
					<div class="modal-footer">
						  	<button  class="btn btn-sm btn-primary" onClick="submitAddProduct();">Save & Close</button>
                   			<button  class="btn btn-sm btn-primary" data-dismiss="modal" >Cancel</button> 
					</div>
					</form>
       </div>
  </div>
</div>
    		 
 <div class="page-title page-header clearfix">
 	<h1 class="pull-left">Product List</h1> 
  </div> 
    		 
        <!--   </div > -->
    <section>
  	  <div class="container-body" >
        <!-- center --> 
        <div class="row">
        <div class="pull-left">
        
        
        <form name="abc" id="abc" method="Post"  action="<%=request.getContextPath()%>/product/loadproductlist.htm">
        <input id="viewassetId" type="hidden" name="viewassetId"	/>
         <input id="viewprodTypeId" type="hidden" name="viewprodTypeId"	/>
          <input id="viewprodCatId" type="hidden" name="viewprodCatId"	/>
    	<div style="display: inline-block;padding-left: 0;margin: 0px 0 10px 0;">
			<span  class="searchpadding padding_top" style="float:left; width:100px;">Asset Class  <span class="red">*</span> </span>
			<span  class="searchpadding padding_top" style="float:left;width:100px;">
				<select id="assetId" name="assetId" class="form-control" onchange="getlistforasset();">
             		<!-- <option>Equity</option>	
                 	<option>Gold</option>
                 	<option>MF</option> --> 
                 	<option value="0"> --All--  </option>
                 	<c:forEach var="item" items="${assetList}"> 
                 		<option value="${item.assetId}" <c:if test="${item.assetId==assetClassId}"> </c:if> >${item.assetName}</option>
                 	</c:forEach>  
	   			</select>
			</span>
			
       		<span class="searchpadding padding_top" style="float:left; width:165px;padding-left:20px;">Product Type   <!-- <span class="red">*</span> --> </span>
			<span  class="searchpadding padding_top" style="float:left; width:125px;">
				<select id="prodTypeId" name="prodTypeId" class="form-control" onchange="getlistforproducttype();">
		            <!-- <option>Equity Stock</option>	
		            <option>Equity MF</option>   
		            <option>Debt FD</option>
		            <option>Debt RD</option> 
	                <option>Debt Bond </option> -->  
	                <option value="0"> --All--  </option>
	                
				</select>   
			</span>   
       		  
	  
			<span class="searchpadding padding_top" style="float:left; width:155px;padding-left:20px;">Product Category    <!-- <span class="red">*</span> --> </span>
			<span  class="searchpadding padding_top" style="float:left; width:180px;">
				<select id="prodCatId" name="prodCatId" class="form-control" onchange="viewStatusUrl();">
                    <!-- <option>Equity Stock Large Cap</option>	
                    <option value="${item.prodCatId}" ${item.prodCatId == 47001 ? 'selected="selected"':''} >${item.prodCatName}</option>
                    <option> Equity MF Large Cap  </option>  --> 
                    <option value="0"> --All--  </option>
                    
    			</select>
			</span>
    		<div class="clearfix"></div>
			   
			
			 
   		</div>
   		
   			
   		</form>
   		</div>
   		<div class="pull-right">
   			<button id="SPProductAddLink" class="btn btn-primary btn-xs" onclick="addProduct(); "><i class="fa fa-plus"></i> Add product</button>
   		</div>
   			
   		</div>
   		
		<!-- <div class="topmenu"> -->
			<!-- <a id="SPProductAddLink" href="#" onClick="addNote();" >
				<input data-params="{}" type="button" class="dbtn createNewBtn" value="  New Product  "   onClick="popup('popUpAlertaddnote')" title="New Product" alt="New Product">
			</a>
			<a id="SPProductDeleteLink" href="#" onClick="deleteNote();" >
				<input data-params="{}" type="button" class="dbtn deleteBtn" value="  Delete"  onClick="popup('popUpAlertaddnote')" title="Delete" alt="Delete">
			</a> --> 
	<!-- 	</div> -->
	<div class="clearfix"></div>
		<!-- with in script -->

<!--Start  for Remove Horizontal Scroll -->
<div class="jq_parent row" id="display_table_lead">
  			<div id="toreload" class="col-md-12 table-responsive tabular_break_word">
	  		<table id="grid-table"></table>
				<div id="grid-pager"></div>
			</div>
	   </div>
 <!-- end- -->
	 
				<div class="pull-left">
     				 <div class="hr-12"></div>
     				 <div class="topmenuleft margin_5px" >
							<span>Export options: </span>
							<a id="csvExp" href="<%=request.getContextPath()%>/product/productExport.htm?type=CSV&assetClassId=${assetClassId}&productTypeId=${productTypeId}&prodCategoryId=${prodCatId}" title="Export in CSV" alt="Export in CSV">
							<i class="ace-icon fa icon-csv grey bigger-170"></i></a>
							
							<a id="excelExp" href="<%=request.getContextPath()%>/product/productExport.htm?type=excel&assetClassId=${assetClassId}&productTypeId=${productTypeId}&prodCategoryId=${prodCatId}" title="Export in Excel" alt="Export in Excel"> 
							<i class="ace-icon fa fa-file-excel-o grey bigger-170"></i></a>
						</div>
					</div>
	  
	 
	
	
	
	<!-- <div class="topmenu">
  		
    </div>	 -->	
   </div>  
</section>   
        	
<!-- Center part End -->          
<footer>
	<jsp:include page="../common/footer.jsp" />
		
</footer>

<script src="<%=request.getContextPath()%>/js/jquery.validate.min.js"></script>
<script type="text/javascript">

  
		var grid_data=${productMasterList};
		
	 	index=grid_data;
	 	
	 	//alert(grid_data);
		
	 	jQuery(function($) {
			var grid_selector = "#grid-table";
			var pager_selector = "#grid-pager";
				 
			//resize to fit page size
			$(window).on('resize.jqGrid', function () {
				$(grid_selector).jqGrid( 'setGridWidth', $("#toreload").width() );
			})
			//resize on sidebar collapse/expand
			var parent_column = $(grid_selector).closest('[class*="col-"]');
			$(document).on('settings.ace.jqGrid' , function(ev, event_name, collapsed) {
				if( event_name === 'sidebar_collapsed' || event_name === 'main_container_fixed' ) {
					//setTimeout is for webkit only to give time for DOM changes and then redraw!!!
					setTimeout(function() {
						$(grid_selector).jqGrid( 'setGridWidth', parent_column.width() );
					}, 0);
				}
		    })
				
		    
		    
   /*  Start  for Remove Horizontal Scroll */					
$(window).on('resize.jqGrid', function () {
					var parent_width = $(grid_selector).closest('#toreload').width();
					$(grid_selector).jqGrid( 'setGridWidth', parent_width );
				})
/* end-  */
			jQuery(grid_selector).jqGrid({
				//direction: "rtl",
		
				//subgrid options
				subGrid : false,
				//subGridModel: [{ name : ['No','Item Name','Qty'], width : [55,200,80] }],
				//datatype: "xml",
				subGridOptions : {
				//	plusicon : "ace-icon fa fa-plus center bigger-110 blue",
					minusicon  : "ace-icon fa fa-minus center bigger-110 blue",
					openicon : "ace-icon fa fa-chevron-right center orange"
				},
		
				//for this example we are using local data
				subGridRowExpanded: function (subgridDivId, rowId) {
					var subgridTableId = subgridDivId + "_t";
					$("#" + subgridDivId).html("<table id='" + subgridTableId + "'></table>");
					$("#" + subgridTableId).jqGrid({
						datatype: 'local',
						data: subgrid_data,
						colNames: ['No','Item Name','Qty'],
						colModel: [
							{ name: 'id', width: 50 },
							{ name: 'name', width: 150 },
							{ name: 'qty', width: 50 }
						]
					});
				},
				
				data: index, 
				datatype: "local",
				height: 300,
				ignoreCase: true,
				colNames:['','manufacturer','Product Name','Description','Asset Class </br> Product Type </br> Product Category','Custodian Code </br> Industry Code </br> ISIN Code','Control','Action'],
				colModel:[
				 	
					      
					     
					 {name:'masterProductId',index:'masterProductId',width:50,formatter:function(cellvalue, options,rowObject) {
						 
						 var aa = rowObject.productName.replace("\'", "\\\'");
					
						return '<a href="#" onclick="updateProduct('+rowObject.masterProductId+',\''+aa+'\',\''+rowObject.productDescription+'\',\''+rowObject.custodianCode+'\',\''+rowObject.industryCode+'\',\''+rowObject.isincode+'\',\''+rowObject.isActive+'\',\''+rowObject.isClosedEnd+'\',\''+rowObject.isInstitutional+'\',\''+rowObject.minSIPValue+'\',\''+rowObject.minAddnPurchaseValue+'\',\''+rowObject.minPurchaseValue+'\',\''+rowObject.custodianCodeAlias+'\');" id="'+rowObject.masterProductId+'"><img src="<%=request.getContextPath()%>/images/edit.png" alt="Edit" title="Edit"></a>';
					}},  
					   
					     
					{name:'manufacturer',index:'manufacturer', width:130}, 
					{name:'productName',index:'productName', width:305,cellattr: function (rowId, tv, rawObject, cm, rdata) { return 'style="white-space: normal;"' }},
					{name:'productDescription',index:'productDescription', width:250,cellattr: function (rowId, tv, rawObject, cm, rdata) { return 'style="white-space: normal;"' }}, 
					{name:'assetClassName',index:'assetClassName', width:'125'}, 
					
					/* {name:'assetClassName',index:'assetClassName', width:200,formatter:function(cellvalue, options,rowObject){
						var html='';  
						 html+='<span >'+rowObject.assetClassName+' %<br>'+'</span>';
						 html+='<span >'+rowObject.assetProductTypesName+' %<br>'+'</span>';
						 html+='<span >'+rowObject.productCategoryName+' %<br>'+'</span>';
						
					/* 	${data.assetClassName}</br>
						${data.assetProductTypesName}</br>
						${data.productCategoryName}	
						 
					}}, */
					
					
					{name:'custodianCode',index:'custodianCode', width:'125'},   
					{formatter:function(cellvalue, options,rowObject) {
						   // return '<input role="checkbox" type="checkbox"  class="checkbox1" id="'+rowObject.startDate+',\''+rowObject.expiryDate+'" name="chkdeleteselect[]">';
							var html='';  
									    if(rowObject.isActive==true){
									    	html+= '<input checked disabled="disabled" role="checkbox" type="checkbox"  class="checkbox1" id="1" name="1"><span class="user">Active</span><br/>';
									    }else{
									    	html+= '<input role="checkbox" disabled="disabled" type="checkbox"  class="checkbox1" id="1" name="1"><span class="user">Active</span><br/>';
									    } 
									    if(rowObject.isClosedEnd==true){
									    	html+= '<input checked disabled="disabled" role="checkbox" type="checkbox"  class="checkbox1" id="1" name="1"><span class="user">Closed Ended</span><br/>';
									    }else{
									    	html+= '<input role="checkbox"   disabled="disabled" type="checkbox"  class="checkbox1" id="1" name="1"><span class="user">Closed Ended</span><br/>';
									    }
									    if(rowObject.isInstitutional==true){
									    	html+= '<input checked disabled="disabled" role="checkbox" type="checkbox"  class="checkbox1" id="1" name="1"><span class="user">Institutional</span>';
									    }else{
									    	html+= '<input role="checkbox" disabled="disabled" type="checkbox"  class="checkbox1" id="1" name="1"><span class="user">Institutional</span>';
									    }
									    return html; 
						 }},          
						 {name:'action',index:'action',width:110,formatter:function(cellvalue, options,rowObject) {
								
							    return  '<a class="strong pointer" onclick="openActionPopup(\''+rowObject.masterProductId+'\',\''+rowObject.productName+'\')">Action</a>';
							     
							}},  
							
					
					   
					
					
				], 
			
				viewrecords : true,
				rowNum:10,
				rowList:[10,20,50],
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
				//caption: "Execution Tracker For",
				
				});
				/* var captionName='Execution Tracker For'
				$(grid_selector).jqGrid('setCaption', captionName); */
				$(window).triggerHandler('resize.jqGrid');//trigger window resize to make the grid get the correct size
				
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
						recreateForm: true,
						beforeShowForm : function(e) {
							var form = $(e[0]);
							form.closest('.ui-jqdialog').find('.ui-jqdialog-titlebar').wrapInner('<div class="widget-header" />')
							style_edit_form(form);
						}
					},
					{
						//new record form
						//width: 700,
						closeAfterAdd: true,
						recreateForm: true,
						viewPagerButtons: false,
						beforeShowForm : function(e) {
							var form = $(e[0]);
							form.closest('.ui-jqdialog').find('.ui-jqdialog-titlebar')
							.wrapInner('<div class="widget-header" />')
							style_edit_form(form);
						}
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
						width:700,
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
					buttons.addClass('btn btn-sm').find('[class*="-icon"]').hide();//ui-icon, s-icon
					buttons.eq(0).addClass('btn-primary').prepend('<i class="ace-icon fa fa-check"></i>');
					buttons.eq(1).prepend('<i class="ace-icon fa fa-times"></i>')
					
					buttons = form.next().find('.navButton a');
					buttons.find('.ui-icon').hide();
					buttons.eq(0).append('<i class="ace-icon fa fa-chevron-left"></i>');
					buttons.eq(1).append('<i class="ace-icon fa fa-chevron-right"></i>');		
				}
			
				function style_delete_form(form) {
					var buttons = form.next().find('.EditButton .fm-button');
					buttons.addClass('btn btn-sm btn-white btn-round').find('[class*="-icon"]').hide();//ui-icon, s-icon
					buttons.eq(0).addClass('btn-primary ').prepend('<i class="ace-icon fa fa-trash-o"></i>');
					buttons.eq(1).addClass('btn-default').prepend('<i class="ace-icon fa fa-times"></i>')
				}
				
				function style_search_filters(form) {
					form.find('.delete-rule').val('X');
					form.find('.add-rule').addClass('btn btn-xs btn-primary');
					form.find('.add-group').addClass('btn btn-xs btn-success');
					form.find('.delete-group').addClass('btn btn-xs btn-primary ');
				}
				function style_search_form(form) {
					var dialog = form.closest('.ui-jqdialog');
					var buttons = dialog.find('.EditTable')
					buttons.find('.EditButton a[id*="_reset"]').addClass('btn btn-sm btn').find('.ui-icon').attr('class', 'ace-icon fa fa-retweet');
					buttons.find('.EditButton a[id*="_query"]').addClass('btn btn-sm btn-inverse').find('.ui-icon').attr('class', 'ace-icon fa fa-comment-o');
					buttons.find('.EditButton a[id*="_search"]').addClass('btn btn-sm btn').find('.ui-icon').attr('class', 'ace-icon fa fa-search');
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
</script>
		
		<script>
			function openActionPopup(masterProductId,productName){  
				
				  
				$('#SPProductPriceHistLink a').attr('href','${pageContext.request.contextPath}/product/price_history.htm?id='+masterProductId+'&productName='+productName);
				$('#SPProductRevMastLink a').attr('href','${pageContext.request.contextPath}/product/revenue_master.htm?id='+masterProductId+'&productName='+productName);
				$('#SPProductPremMastLink a').attr('href','${pageContext.request.contextPath}/product/premium_master.htm?id='+masterProductId+'&productName='+productName);
			     
				$( ".action_dialog" ).removeClass('hide').dialog({
					resizable: false,
					modal: true,
	                width: "auto",
				}); 
			};    
			
			  jQuery(function($) {
		        	$("#search").keyup(function(event) {
						if (event.keyCode == 13) {
							oppsearch();
						}
					});
		        $( ".action" ).on('click', function(e) {
							e.preventDefault();
						
							$( ".action_dialog" ).removeClass('hide').dialog({
								resizable: false,
								modal: true,
		                        width: "auto",
							});
						});
						
						$( ".progress").on('click', function(e) {
							e.preventDefault();
						
							$( ".progress_dialog" ).removeClass('hide').dialog({
								resizable: false,
								modal: true,
								width: "auto",
		                        
							});
						});
					});

			  $('#menu-wplook-sub-menu9').addClass('active');
			  $('#SPProductLink').addClass('active');
			  $('#menu-wplook-sub-menu9 ul').css('display', 'block'); 
		</script> 
		
		<div class="common_dialog hide action_dialog">
  <table id="" class="table table-bordered table-striped" width="100%" cellpadding="0" cellspacing="0">
    <tbody>
      <tr id="">
        <th class="thead">Action List</th> 
       
      </tr>
      <tr id="">
        <td id="SPProductPriceHistLink"><i class="fa fa-rupee"></i> <a href="<%=request.getContextPath()%>/product/price_history.htm?id=${data.masterProductId}&productName=${data.productName}" style="color:#333;"  ><span class="user" >Price History</span></a></td>
      
      </tr>
      <tr id="">
        <td id="SPProductRevMastLink"><i class="fa fa-database"></i> <a href="<%=request.getContextPath()%>/product/revenue_master.htm?id=${data.masterProductId}&productName=${data.productName}" style="color:#333;"  > <span class="user"  >Revenue Master</span></a></td>
      </tr>
      <tr id="">
        <td id="SPProductPremMastLink"><i class="fa fa-database"></i> <a href="<%=request.getContextPath()%>/product/premium_master.htm?id=${data.masterProductId}&productName=${data.productName}"  style="color:#333;" ><span class="user" >Premium Master</span></a></td>
        
      </tr>
      
     
    </tbody>
  </table>
</div>

<script type="text/javascript">
$(document).ready(function () {
	  
	  var getassetid='<%=htsession.getAttribute("setassetClassIdNew")%>';
	  var getproducttypeid='<%=htsession.getAttribute("setproductTypeIdNew")%>';
	  var getproductcatid='<%=htsession.getAttribute("setprodCatIdNew")%>';
	  //alert(getassetid);
	  //alert(getproducttypeid);
	 // alert(getproductcatid);
	  if(getassetid!=0){
	  var select = document.getElementById("assetId");	  
	    for(var i = 0;i < select.options.length;i++){
	    
	    	if(select.options[i].value ==getassetid  )
	        {
	            select.options[i].selected = true;
	        }
	    }
	  }
	
		getProductType1(getproducttypeid); 	 	       	
	    getProductCategory1(getproductcatid);
	 	 
	  //called when key is pressed in textbox
	  $("#editminSIPValue").keypress(function (e) {
	     //if the letter is not digit then display error and don't type anything
	     if (e.which != 8 && e.which != 0 && (e.which < 48 || e.which > 57)) {
	        //display error message
	        $("#errmsg").html("Please enter digits Only").show().fadeOut("slow");
	               return false;
	    }
	   }); 
	  $("#editminPurchaseValue").keypress(function (e) {
		     //if the letter is not digit then display error and don't type anything
		     if (e.which != 8 && e.which != 0 && (e.which < 48 || e.which > 57)) {
		        //display error message
		        $("#errmsg1").html("Please enter digits Only").show().fadeOut("slow");
		               return false;
		    }
		   }); 
	  $("#editminAddnPurchaseValue").keypress(function (e) {
		     //if the letter is not digit then display error and don't type anything
		     if (e.which != 8 && e.which != 0 && (e.which < 48 || e.which > 57)) {
		        //display error message
		        $("#errmsg2").html("Please enter digits Only").show().fadeOut("slow");
		               return false;
		    } 
	  });
	   
	  $('#editcustodianCodeAlias').change(function(){
  	    var text = $(this).val();
  	    var searchPipe = text.slice(0,1);
  	   // alert(searchPipe);
  	    var lastChar = text.substring(text.length-1);
  	   // alert(lastChar);
  	    if (searchPipe != '|' || lastChar != '|' ) {
  	    	//alert('change');
  	    	 event.preventDefault();  
  	    	 $("#errormsg").html("Use | seperator before and after code").show().fadeOut(2500);
  	    	 $('#editcustodianCodeAlias').val('');
  	    	 $('#editcustodianCodeAlias').focus();
  	    	// $(this).val('');
  	    } 
  	    
  	}); 
	  
	  $('#addcustodianCodeAlias').change(function(){
	  	    var text = $(this).val();
	  	    var searchPipe = text.slice(0,1);
	  	   // alert(searchPipe);
	  	    var lastChar = text.substring(text.length-1);
	  	   // alert(lastChar);
	  	    if (searchPipe != '|' || lastChar != '|' ) {
	  	    	//alert('change');
	  	    	 event.preventDefault();  
	  	    	 $("#errormsg2").html("Use | seperator before and after code").show().fadeOut(2500);
	  	    	 $('#addcustodianCodeAlias').val('');
	  	    	 $('#addcustodianCodeAlias').focus();
	  	    	// $(this).val('');
	  	    } 
	  	    
	  	}); 
	    
	});  
	function checkCustCodeAlias()
	{
		 $('#addcustodianCodeAlias').change(function(){
		  	    var text = $(this).val();
		  	    var searchPipe = text.slice(0,1);
		  	   // alert(searchPipe);
		  	    var lastChar = text.substring(text.length-1);
		  	   // alert(lastChar);
		  	    if (searchPipe != '|' || lastChar != '|' ) {
		  	    	//alert('change');
		  	    	 event.preventDefault();  
		  	    	 $("#errormsg2").html("Use | seperator before and after code").show();
		  	    	 $('#addcustodianCodeAlias').val('');
		  	    	 $('#addcustodianCodeAlias').focus();
		  	    	// $(this).val('');
		  	    } 
		  	    
		  	}); 
	}

	function checkCustCodeAliasEdit()
	{
		 $('#editcustodianCodeAlias').change(function(){
		  	    var text = $(this).val();
		  	    var searchPipe = text.slice(0,1);
		  	   // alert(searchPipe);
		  	    var lastChar = text.substring(text.length-1);
		  	   // alert(lastChar);
		  	    if (searchPipe != '|' || lastChar != '|' ) {
		  	    	//alert('change');
		  	    	 event.preventDefault();  
		  	    	 $("#errormsg").html("Use | seperator before and after code").show();
		  	    	 $('#editcustodianCodeAlias').val('');
		  	    	 $('#editcustodianCodeAlias').focus();
		  	    	// $(this).val('');
		  	    } 
		  	    
		  	}); 
	}

function getlistforasset(){
	var assetId=$('#assetId').val();
	$('#prodTypeId').empty();
	$('#prodCatId').empty();
	$('#prodCatId').append('<option value="0">--All--</option>');
	$('#prodTypeId').append('<option value="0">--All--</option>');
	 var prodTypeId=$('#prodTypeId').val();  
	 var prodCatId=$('#prodCatId').val();   
	 document.getElementById("viewassetId").value =assetId;
	 document.getElementById("viewprodTypeId").value =prodTypeId;
	 document.getElementById("viewprodCatId").value =prodCatId;
	 document.getElementById("abc").submit(); 


} 
function getlistforproducttype(){
	var assetId=$('#assetId').val();	
	$('#prodCatId').empty();
	$('#prodCatId').append('<option value="0">--All--</option>');	
	 var prodTypeId=$('#prodTypeId').val();  
	 var prodCatId=$('#prodCatId').val();   
	 document.getElementById("viewassetId").value =assetId;
	 document.getElementById("viewprodTypeId").value =prodTypeId;
	 document.getElementById("viewprodCatId").value =prodCatId;
	 document.getElementById("abc").submit(); 


} 
function viewStatusUrl(){
	   
	 var assetId=$('#assetId').val();	
	 //alert("assetId"+assetId);
	 var prodTypeId=$('#prodTypeId').val();  
	 var prodCatId=$('#prodCatId').val();   
	 document.getElementById("viewassetId").value =assetId;
	 document.getElementById("viewprodTypeId").value =prodTypeId;
	 document.getElementById("viewprodCatId").value =prodCatId;
	 document.getElementById("abc").submit(); 
}

function submitAddProduct()
{
	
	
	var validator=$('#addform').validate({
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
			
			partyId:{
				required: true
			},
			
			productName: {
				required: true
			},
			
			assetId:{
				required: true
			},
			prodTypeId:{
				required: true
			},
			prodCatId:{
				required: true
			},
			custodianCode:{
				required: true
			},
			
			
		},
		

		messages: {
			partyId:"Please select Manufacturer name ",
			productName: "Please enter product name",
			assetId: "Please select asset class",
			prodTypeId: "Please select product type",
			prodCatId: "Please select product category",
			custodianCode: "Please enter custodian code"
			
			
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
			
			if(validator.form()){ // validation perform
				$.ajax({
					
					url : $('#contextPath').val()+'/product/addProduct.htm',
					method :'POST',
					data:$('#addform').serialize(),
					
					success : function(result) 
					 {
				       //  alert('Product updated successfully');
				         bootbox.dialog({
								message: "<span class='bigger-110'>Product added successfully. </span>",
								buttons: 			
								{
									"click" :
									{
										"label" : "OK!",
										"className" : "btn-sm btn-primary",
										"callback": function() {
											//Example.show("Primary button");
											 location.reload();
										}
									}
								}
							});

						
			  		 }
					
				});
			}
		},
		invalidHandler: function (form) {
			
			
		}
	});
	
}
//function for update product
function submitUpdatedProduct(){

	
	var validator=$('#editform').validate({
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
			
						
			productName: {
				required: true
			},
			
			
			
		},
		

		messages: {
			productName: "Please enter product name"
						
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
		
			if(validator.form()){ // validation perform
				$.ajax({
					
					url : $('#contextPath').val()+'/product/updateProduct.htm',
					method :'POST',
					data:$('#editform').serialize(),
					
					success : function(result) 
					 {
				       //  alert('Product updated successfully');
				         bootbox.dialog({
								message: "<span class='bigger-110'>Product updated successfully. </span>",
								buttons: 			
								{
									"click" :
									{
										"label" : "OK!",
										"className" : "btn-sm btn-primary",
										"callback": function() {
											//Example.show("Primary button");
											 location.reload();
										}
									}
								}
							});

						
			  		 }
					
				});
			}
		},
		invalidHandler: function (form) {
			
			
		}
	});
	
	
}
	</script>

	

</body>
</html>