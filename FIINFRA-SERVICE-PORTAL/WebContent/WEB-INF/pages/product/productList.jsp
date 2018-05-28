<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://displaytag.sf.net" prefix="display"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en"><head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
    <meta charset="utf-8"> 
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
	<title>Product Master List</title>
 
 
<script type="text/javascript">
var hidePopupTimeoutId;
$(".choose1").live("click", function () {  
    clearTimeout( hidePopupTimeoutId );
    
    var id=$(this).attr('id');
    id="#tracker_"+id;
    $(id).show();
}); 


		$(".choose1").live("mouseout", function () {
    hidePopupTimeoutId = setTimeout( function() {
    	 var id=$(this).attr('id')
    	    id="#tracker_"+id;
    	    $(id).show();
    },500);
});

$(".tracker1").live("mouseenter", function() {
    clearTimeout( hidePopupTimeoutId );
});


$(".tracker 1").live("mouseleave", function() {
    $(".tracker1").hide();
});
   
$(document).ready(function () {
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
	    
	});  


	</script>


<link href="https://myffreedom.in/FFreedom_Portalimages/favicon.ico" rel="shortcut icon">


<script type="text/javascript">
   
	
	
	function getProductType(){
		var id=$('#assetId').val();
		if(id!=0){
			
		
		document.getElementById("prodTypeId").value = 0;
		document.getElementById("prodCatId").value = 0;
		document.getElementById("searchtext").value =null;
		//alert(id);
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
				$('#prodTypeId').append('<option value="'+ id+'">'+ name + '</option>');		
							 				
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
		document.getElementById("prodCatId").value = 0;
		document.getElementById("searchtext").value =null;
		//alert(id);
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
					$('#prodCatId').append('<option value="'+ id+'">'+ name + '</option>');		
												
					});
															
		   		  }
		   	
		   	}); 
	}
	
	
	
	function getNewProductList() {
		var assetid=0;
		var prodtypeid=0;
		var catid=0;
		var searchtext=null;
		//alert($('#searchtext').val());
		if($('#searchtext').val()==""){
			assetid=$('#assetId').val();
			prodtypeid=$('#prodTypeId').val();
			catid=$('#prodCatId').val();
			//searchtext=null;
		} else{
			
			searchtext=$('#searchtext').val();
			document.getElementById("assetId").value = 0;
			document.getElementById("prodTypeId").value = 0;
			document.getElementById("prodCatId").value = 0;
			
			$('#prodTypeId').empty();
			$('#prodCatId').empty();
			//$('#assetId').empty();
			$("#assetId option[value='0']").remove();
			$('#assetId').prepend('<option value="0">--All--</option>');
			$('#prodCatId').append('<option value="0">--All--</option>');
			$('#prodTypeId').append('<option value="0">--All--</option>');
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
		        
		    		$("#csvExp").attr("href", "${pageContext.request.contextPath}/product/productExport.htm?type=CSV&assetClassId="+assetid+"&productTypeId="+prodtypeid+"&prodCategoryId="+catid+"&searchTextVal="+searchtext);
		    		$("#excelExp").attr("href", "${pageContext.request.contextPath}/product/productExport.htm?type=excel&assetClassId="+assetid+"&productTypeId="+prodtypeid+"&prodCategoryId="+catid+"&searchTextVal="+searchtext);
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
		
		$('#editnote').modal('show');   
		
		
		
		
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
	   
	
	// submit updated broadcast 
	function submitUpdatedProduct(){
		
	 	if(editProdRequiredVals() == true){
	 		   
	 		//alert('submit');
	 		 var active=$("#editisActive").is(":checked");
			 if(active==true){
				 document.getElementById("editisActive").value = true;
			 }else{
				 document.getElementById("editisActive").value = false;
			 }
			 
			 var closedEnd=$("#editisClosedEnd").is(":checked");
			 
			 if(closedEnd==true){
				 
				 document.getElementById("editisClosedEnd").value = true;
			 }else{
				 
				 document.getElementById("editisClosedEnd").value = false;
			 }
			 
			 var institutional=$("#editinstitutional").is(":checked");
			 if(institutional==true){
				 document.getElementById("editinstitutional").value = true;
			 }else{
				 document.getElementById("editinstitutional").value = false;
			 }
	 		
		
			 
	 		$.ajax({
				type :'GET',
				url : $('#contextPath').val()+'/product/updateProduct.htm',
				data:$('#updateform').serialize(),
				
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
	  }
	
	function editProdRequiredVals(){
		if ($('#editproductName').val().trim()=="") {
			 alert("Product name is required.");
			 $('#editproductName').focus();
	         return false;
	     }
		if ($('#editcustodianCodeAlias').val().trim()!="") {
			var text = $('#editcustodianCodeAlias').val();
    	    var searchPipe = text.slice(0,1);
    	    var lastChar = text.substring(text.length-1);
    	    if(searchPipe != '|'){
    	    	text = "|"+text;
    	    	$('#editcustodianCodeAlias').val(text);
    	    	//alert($('#editcustodianCodeAlias').val(text));
    	    }
    	    if(lastChar != '|'){
    	    	text = text+"|";
    	    	$('#editcustodianCodeAlias').val(text);
    	    	 //alert($('#editcustodianCodeAlias').val(text));
    	    }
    	   
		}
		 return true;
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
</script>

</head>
<body>
<jsp:include page="../common/header.jsp" />
<!--css popup window start 1--> 
     
     
    
      
     
     <!-- Edit form start here--> 
      	<div class="modal fade" id="editnote" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">  
      <div class="modal-header"> 
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">Edit Product Category </h4>
      </div>
      <div class="modal-body">    
        
        <form id="updateform" method="POST">
					<input type="hidden" name="masterProductId" id="masterProductId">
					<input type="hidden" name="oldcustCode" id="oldcustCode">
   
    	<div id="popupwrapper_contactform">
   			
       			<div id="poptable_contactform" style="padding:10px; height:510px;">
        			
         
         		<span class="searchpadding padding_top" style="float:left; width:150px;">Product Name   <span class="red">*</span> </span>
				<span  class="searchpadding padding_top" style="float:left; width:300px;">

						<input id="editproductName" name="productName" type="text" class="form-control" ></span>
        		<div class="clearfix"></div>
		        <span class="searchpadding padding_top" style="float:left; width:150px; margin-top: 7px">Product Description  </span>
				<span  class="searchpadding padding_top " style="float:left; width:350px; margin-top: 7px ">
					<textarea class="form-control" rows="5" id="editproductDescription" name="productDescription"></textarea></span>
				 <div class="clearfix"></div>
				<span class="searchpadding padding_top" style="float:left; width:150px;  margin-top: 7px">Mapped External Codes   </span>
				<span  class="searchpadding padding_top" style="float:left; width:150px;  margin-top: 7px">
					<input type="text" class="form-control" name="custodianCode" id="editcustodianCode" onchange="checkCustCode(this.value);"></span>
				<span class="searchpadding padding_top" style="float:left; width:150px;  margin-top: 7px; margin-left: 5px">Custodian Code
		   		</span>
        		<div class="clearfix"></div>
       			<span class="searchpadding padding_top" style="float:left; width:150px;  margin-top: 7px"> </span>
				<span  class="searchpadding padding_top" style="float:left; width:150px;  margin-top: 7px">

					<input type="text" class="form-control" name="industryCode" id="editindustryCode" readonly="readonly" ></span>
				<span class="searchpadding padding_top" style="float:left; width:150px;  margin-top: 7px; margin-left: 5px">Industry Code    </span>
        		<div class="clearfix"></div>
				<span class="searchpadding padding_top" style="float:left; width:150px;  margin-top: 7px"> </span>
				<span  class="searchpadding padding_top" style="float:left; width:150px;  margin-top: 7px " >
					<input type="text" class="form-control" name="ISINCode" id="editISINCode" readonly="readonly"></span>
				<span class="searchpadding padding_top" style="float:left; width:150px;  margin-top: 7px; margin-left: 5px">ISIN Code
				   </span>
				 <div class="clearfix"></div>
				        
				<span class="searchpadding padding_top" style="float:left; width:150px;  margin-top: 7px"> </span>
				<span  class="searchpadding padding_top" style="float:left; width:150px;  margin-top: 7px">
					<input type="text" class="form-control" name="custodianCodeAlias" id="editcustodianCodeAlias"></span>
				<span class="searchpadding padding_top" style="float:left; width:172px;  margin-top: 7px; margin-left: 5px">Custodian Code Alias List (use | Seperator ex. |xyz|) </span>
				 <span id="errormsg" style="float:left; width:380px;padding-left:150px; padding-top: 10px;"></span>
				 <div class="clearfix"></div>
				
				<span class="searchpadding padding_top" style="float:left; width:150px;  margin-top: 7px">Controls <!-- <span class="red">*</span> -->  </span>
				<span class="searchpadding padding_top " style="float:left; width:400px;  margin-top: 7px">
					<input id="editisActive" name="isActive" value="1" type="checkbox"><span class="user">Active    </span>
					
					
					<input id="editisClosedEnd" name="isClosedEnd" value="1" type="checkbox"><span class="user">Closed Ended     </span>
					<input id="editinstitutional" name="isInstitutional" value="1" type="checkbox"><span class="user">Institutional  </span>
				</span>
 
 				<div class="clearfix"></div>
 
				<span class="searchpadding padding_top" style="float:left; width:150px;  margin-top: 7px">Min SIP Amount </span>
				<span  class="searchpadding padding_top" style="float:left; width:150px;  margin-top: 7px">
					<input type="text" class="form-control" name="minSIPValue" id="editminSIPValue">
				</span>
				<span id="errmsg" style="float:left; width:160px; padding-top: 10px;  margin-top: 7px"></span>
					
				 <div class="clearfix"></div>
				  
				<span class="searchpadding padding_top" style="float:left; width:150px;  margin-top: 7px">Min Purchase Amt
				 </span>
				<span  class="searchpadding padding_top" style="float:left; width:150px;  margin-top: 7px">
					<input type="text" class="form-control" name="minPurchaseValue" id="editminPurchaseValue"></span>
				<span id="errmsg1" style="float:left; width:160px; padding-top: 10px;"></span>
				 <div class="clearfix"></div> 
				 
				 <span class="searchpadding padding_top" style="float:left; width:150px;  margin-top: 7px">Min Addn Purchase Amt </span>
				 <span  class="searchpadding padding_top" style="float:left; width:150px;  margin-top: 7px">
					<input type="text" class="form-control" name="minAddnPurchaseValue" id="editminAddnPurchaseValue"></span>
				 <span id="errmsg2" style="float:left; width:160px; padding-top: 10px;"></span>
				 <div class="clearfix"></div>        
				       
				 </div>
				        
		    </div>  
		
		</form>
        
      </div>    
      
       <div class="modal-footer" >
		<button data-bb-handler="close" type="button" class="btn btn-primary btn-sm" id="Save" onclick="submitUpdatedProduct();" >Save</button>
		<button data-bb-handler="cancel" type="button" class="btn btn-sm btn-danger" type="button" class="close" data-dismiss="modal" aria-label="Close"><i class="ace-icon fa fa-close"></i> Cancel</button>
		</div> 
	
    </div> 
  </div>
</div>
     
     
	<!--css popup window 2 close-->

  
     <!-- Center part start -->
 <section>
	<!-- <div class="container white"> -->
    	<div class="container-head">
    		
    		            
          <div class="page-header clearfix">
            <h1 class="pull-left">Product List</h1>
            <div class="nav-search pull-right" id="">
              <form class="form-search">
                <%-- <span class="input-icon">
                <input type="text" placeholder="Search ..." class="nav-search-input" id="search"  autocomplete="off" value="${value}">
                <i class="ace-icon fa fa-search nav-search-icon"></i></span> --%>
              </form>
          </div>  
           	    <!-- accordion-group END -->
              </div>
    		
          </div >
  	  <div class="container-body" style="margin-top:0px;">
        <!-- center -->
    	<div style="display: inline-block;padding-left: 0;margin: 0px 0 10px 0;">
			<span  class="searchpadding padding_top" style="float:left; width:100px;">Asset Class  <span class="red">*</span> </span>
			<span  class="searchpadding padding_top" style="float:left;width:100px;">
				<select id="assetId" name="assetId" class="form-control" onchange="getProductType();getNewProductList();">
             		<!-- <option>Equity</option>	
                 	<option>Gold</option>
                 	<option>MF</option> --> 
                 	<option value="0"> --All--  </option>
                 	<c:forEach var="item" items="${assetList}"> 
                 		<option value="${item.assetId}" <c:if test="${item.assetId==assetClassId}"> selected="selected" </c:if> >${item.assetName}</option>
                 	</c:forEach>  
	   			</select>
			</span>
			
       		<span class="searchpadding padding_top" style="float:left; width:165px;padding-left:20px;">Product Type   <!-- <span class="red">*</span> --> </span>
			<span  class="searchpadding padding_top" style="float:left; width:125px;">
				<select id="prodTypeId" name="prodTypeId" class="form-control" onchange="getProductCategory();getNewProductList();">
		            <!-- <option>Equity Stock</option>	
		            <option>Equity MF</option>   
		            <option>Debt FD</option>
		            <option>Debt RD</option> 
	                <option>Debt Bond </option> -->
	                <option value="0"> --All--  </option>
	                <c:forEach var="item" items="${productTypeList}">
                 		<option value="${item.prodTypeId}">${item.prodTypeName}</option>
                 	</c:forEach>
				</select>
			</span> 
       		
	  
			<span class="searchpadding padding_top" style="float:left; width:155px;padding-left:20px;">Product Category    <!-- <span class="red">*</span> --> </span>
			<span  class="searchpadding padding_top" style="float:left; width:180px;">
				<select id="prodCatId" name="prodCatId" class="form-control" onchange="getNewProductList();">
                    <!-- <option>Equity Stock Large Cap</option>	
                    <option value="${item.prodCatId}" ${item.prodCatId == 47001 ? 'selected="selected"':''} >${item.prodCatName}</option>
                    <option> Equity MF Large Cap  </option>  --> 
                    <option value="0"> --All--  </option>
                    <c:forEach var="item" items="${productCatList}">
                 		<option value="${item.prodCatId}">${item.prodCatName}</option>
                 	</c:forEach> 
    			</select>
			</span>
    		<div class="clearfix"></div>
			
			
   		</div>	
		<div class="topmenu">
			<!-- <a id="SPProductAddLink" href="#" onClick="addNote();" >
				<input data-params="{}" type="button" class="dbtn createNewBtn" value="  New Product  "   onClick="popup('popUpAlertaddnote')" title="New Product" alt="New Product">
			</a>
			<a id="SPProductDeleteLink" href="#" onClick="deleteNote();" >
				<input data-params="{}" type="button" class="dbtn deleteBtn" value="  Delete"  onClick="popup('popUpAlertaddnote')" title="Delete" alt="Delete">
			</a> --> 
		</div>
		<div class="table-responsive" id="display_table_lead" style="border:none;">
			<div id="toreload">   
			
			<table id="grid-table"></table>  
			 <div id="grid-pager"></div>     
		   
 	<!-- Center-->    
   </div>  
  </div> 
  
	 
				<div class="pull-left">
     				 <div class="hr-12"></div>
     				 <div class="topmenuleft margin_5px" >
							<span>Export options: </span>
							<a id="csvExp" href="<%=request.getContextPath()%>/product/productExport.htm?type=CSV&assetClassId=${assetClassId}&productTypeId=${productTypeId}&prodCategoryId=${prodCatId}&searchTextVal=${searchTextVal}" title="Export in CSV" alt="Export in CSV">
							<i class="fa fa-file-pdf-o bigger-140"></i></a>
							
							<a id="excelExp" href="<%=request.getContextPath()%>/product/productExport.htm?type=excel&assetClassId=${assetClassId}&productTypeId=${productTypeId}&prodCategoryId=${prodCatId}&searchTextVal=${searchTextVal}" title="Export in Excel" alt="Export in Excel"> 
							<i class="fa fa-file-excel-o bigger-140"></i></a>
						</div>
					</div>
	  
	 
	
	
	
	<div class="topmenu">
  		
    </div>		
   </div>  
</section>           	
<!-- Center part End -->          
<footer>
	<jsp:include page="../common/footer.jsp" />
</footer>


<script type="text/javascript">

    
  
		var grid_data=${productMasterList};
		/* alert(grid_data);   */
	 	index=grid_data;
		
	 	jQuery(function($) {
			var grid_selector = "#grid-table";
			var pager_selector = "#grid-pager";
				 
			//resize to fit page size
			$(window).on('resize.jqGrid', function () {
				$(grid_selector).jqGrid( 'setGridWidth', $(".page-content").width() );
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
				height: 400, 
				colNames:['','manufacturer','Product Name','Description','Asset Class </br> Product Type </br> Product Category','Custodian Code </br> Industry Code </br> ISIN Code','Control','Action'],
				colModel:[
				 	
					      
					     
					 {name:'masterProductId',index:'masterProductId',width:50,formatter:function(cellvalue, options,rowObject) {
						return '<a href="#" onclick="updateProduct('+rowObject.masterProductId+',\''+rowObject.productName+'\',\''+rowObject.productDescription+'\',\''+rowObject.custodianCode+'\',\''+rowObject.industryCode+'\',\''+rowObject.isincode+'\',\''+rowObject.isActive+'\',\''+rowObject.isClosedEnd+'\',\''+rowObject.isInstitutional+'\',\''+rowObject.minSIPValue+'\',\''+rowObject.minAddnPurchaseValue+'\',\''+rowObject.minPurchaseValue+'\',\''+rowObject.custodianCodeAlias+'\');" id="'+rowObject.masterProductId+'"><img src="<%=request.getContextPath()%>/images/edit.png" alt="Edit" title="Edit"></a>';
					}},  
					   
					     
					{name:'manufacturer',index:'manufacturer', width:250}, 
					{name:'productName',index:'productName', width:250},
					{name:'productDescription',index:'productDescription', width:250}, 
					{name:'assetClassName',index:'assetClassName', width:200}, 
					{name:'custodianCode',index:'custodianCode', width:200},   
					{formatter:function(cellvalue, options,rowObject) {
						   // return '<input role="checkbox" type="checkbox"  class="checkbox1" id="'+rowObject.startDate+',\''+rowObject.expiryDate+'" name="chkdeleteselect[]">';
							var html='';  
									    if(rowObject.isActive==true){
									    	html+= '<input checked edit:false role="checkbox" type="checkbox"  class="checkbox1" id="1" name="1"><span class="user">Active</span><br/>';
									    }else{
									    	html+= '<input role="checkbox" edit:false type="checkbox"  class="checkbox1" id="1" name="1"><span class="user">Active</span><br/>';
									    } 
									    if(rowObject.isClosedEnd==true){
									    	html+= '<input checked edit:false role="checkbox" type="checkbox"  class="checkbox1" id="1" name="1"><span class="user">Closed Ended</span><br/>';
									    }else{
									    	html+= '<input role="checkbox"   edit:false type="checkbox"  class="checkbox1" id="1" name="1"><span class="user">Closed Ended</span><br/>';
									    }
									    if(rowObject.isInstitutional==true){
									    	html+= '<input checked edit:false role="checkbox" type="checkbox"  class="checkbox1" id="1" name="1"><span class="user">Institutional</span>';
									    }else{
									    	html+= '<input role="checkbox" edit:false type="checkbox"  class="checkbox1" id="1" name="1"><span class="user">Institutional</span>';
									    }
									    return html; 
						 }},          
						 {name:'action',index:'action',width:60,formatter:function(cellvalue, options,rowObject) {
								
							    return  '<a onclick="openActionPopup(\''+rowObject.masterProductId+'\',\''+rowObject.productName+'\')">Action</a>';
							     
							}},  
							
					
					   
					
					
				], 
			
				viewrecords : true,
				rowNum:10,
				rowList:[10,20,50,100,1000],
				pager : pager_selector,
				altRows: true,
				multiselect: false,
		        multiboxonly: true,
			
				/* loadComplete : function() {
					var table = this;
					setTimeout(function(){
						styleCheckbox(table);
						
						updateActionIcons(table);
						updatePagerIcons(table);
						enableTooltips(table);
					}, 0);
				}, */
			
				//editurl: "/dummy.html",//nothing is saved
				autowidth: true,
				shrinkToFit:false,
				//caption: "Execution Tracker For",
				
				});
				var captionName='Execution Tracker For'
				$(grid_selector).jqGrid('setCaption', captionName);
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
					buttons.find('.EditButton a[id*="_reset"]').addClass('btn btn-sm btn-info').find('.ui-icon').attr('class', 'ace-icon fa fa-retweet');
					buttons.find('.EditButton a[id*="_query"]').addClass('btn btn-sm btn-inverse').find('.ui-icon').attr('class', 'ace-icon fa fa-comment-o');
					buttons.find('.EditButton a[id*="_search"]').addClass('btn btn-sm btn-purple').find('.ui-icon').attr('class', 'ace-icon fa fa-search');
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
			
		</script> 
		
		<div class="common_dialog hide action_dialog">
  <table id="" class="table table-bordered table-striped" width="100%" cellpadding="0" cellspacing="0">
    <tbody>
      <tr id="">
        <th class="thead">Action List</th> 
       
      </tr>
      <tr id="">
        <td id="SPProductPriceHistLink"><i class="fa fa-check"></i> <a href="<%=request.getContextPath()%>/product/price_history.htm?id=${data.masterProductId}&productName=${data.productName}" style="color:#333;"  ><span class="user" >Price History</span></a></td>
      
      </tr>
      <tr id="">
        <td id="SPProductRevMastLink"><i class="fa fa-database"></i> <a href="<%=request.getContextPath()%>/product/revenue_master.htm?id=${data.masterProductId}&productName=${data.productName}" style="color:#333;"  > <span class="user"  >Revenue Master</span></a></td>
      </tr>
      <tr id="">
        <td id="SPProductPremMastLink"><i class="fa fa-clock-o"></i> <a href="<%=request.getContextPath()%>/product/premium_master.htm?id=${data.masterProductId}&productName=${data.productName}"  style="color:#333;" ><span class="user" >Premium Master</span></a></td>
        
      </tr>
      
     
    </tbody>
  </table>
</div>
		

</body>
</html>