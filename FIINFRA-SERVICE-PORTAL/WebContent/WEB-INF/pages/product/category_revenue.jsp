 <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://displaytag.sf.net" prefix="display"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

 
<!DOCTYPE html>
<html lang="en">     
<head>  
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content=""> 
<meta name="author" content="">
<title>Product category Revenue List</title> 

 
<script>    

	 
	function addNote() {
		$('#addnote').modal('show');    
	} 
	 
	function changePageSize(){    
		var searchtext=$('#searchtext').val();
	 	$("#toreload").load('/FIINFRA-SERVICE-PORTAL/product/category_revenue.htm #toreload', {
		   object: '',
		   pageSize: $('#page').val(),
		   searchtext:searchtext, 

	}, function( response, status, xhr ) {
	      try{
	        
	      }catch(e){
	               
	      }
	     });
	} 
	
	function getProductType(categoryID,selid,id){
		
		var id=$('#assetId').val();  
		if(id!=0){ 
			$.ajax({			   				
   		 	type: "GET",
	  		url: $('#contextPath').val()+'/product/getProductType.htm?assetId='+id,
		 	ataType: 'json',
			contentType: 'application/json',   
		 	success:function(result)
	   		{   
				$('#prodTypeId').empty();
				$('#prodTypeId').append('<option value="">--Select--</option>');
				
				$('#prodCatId').empty();
				$('#prodCatId').append('<option value="">--Select--</option>');
								
				$(result).each(function(i, obj) {
					var id=obj.prodTypeId;
					var name=obj.prodTypeName;      
					if(selid==id){
						$('#prodTypeId').append('<option value="'+ id+'" selected="selected">'+ name + '</option>');
					}else{
						$('#prodTypeId').append('<option value="'+ id+'">'+ name + '</option>');
					}  
							
					});
					
					if(categoryID!=0){
						getProductCategory(categoryID,selid);
					}
	   		  	}
	   	  
	   		});  
	 } else{
		 	$('#prodTypeId').empty();
			$('#prodTypeId').append('<option value="">--Select--</option>');
			$('#prodCatId').empty();
			$('#prodCatId').append('<option value="">--Select--</option>');
	 }
	}
	
	function getProductCategory(selectId,id){
		var id=$('#prodTypeId').val();
		//alert(selectId+":"+id);
		if(id!=""){
		$.ajax({			   				
	   		 type: "GET",
	   		url: $('#contextPath').val()+'/product/getProductCategory.htm?prodTypeId='+id,
			 dataType: 'json',
			 contentType: 'application/json',
			 success:function(result)
		   	{ 
				$('#prodCatId').empty();
				$('#prodCatId').append('<option value="">--Select--</option>');					
				$(result).each(function(i, obj) {
					var id=obj.prodCatId;
					var name=obj.prodCatName; 
					if(selectId==id){
						$('#prodCatId').append('<option value="'+ id+'" selected="selected">'+ name + '</option>');		
					}else{
						$('#prodCatId').append('<option value="'+ id+'">'+ name + '</option>');			
					}
					
												
					});
															
		   		  }
		   	
		   	});
		} else{
			$('#prodCatId').empty();
			$('#prodCatId').append('<option value="">--Select--</option>');
		}
	}
	
	//get source
	function getRevenueType(id)
	{
		$.ajax
		({
	    	type: "GET",
	      	url:$('#contextPath').val()+'/faq/getPicklistValues.htm?codeTypeIds=51',
	      	dataType: 'json',
	      	contentType: 'application/json',
	        success:function(result)
	      	{ 		        
	        	$('#revenueTypeId').empty();
	        	$(result).each(function(i, obj) {
	     		var revenueType = obj.codeValue;
	      		var revenueTypeId = obj.codeValueId;
		      	if(id == revenueTypeId){
		      		$('#revenueTypeId').append('<option value="'+ revenueTypeId+'" selected="selected">'+ revenueType + '</option>');
	      		} else{
	      			$('#revenueTypeId').append('<option value="'+ revenueTypeId+'">'+ revenueType + '</option>');	
	      		}
	     		});
	      	}
	   });
	}
	 
	
	function revenueTypeChange(id) {
		//alert(id);
		if ($('#revenueTypeId').val() == 51002) {
			$("#commission").show();
			$("#fees").hide();
			$("#popUpAlertaddnote").css('height', '400px');
			document.getElementById('poptable_contactform1').style.height = '260px';
		}

		else if ($('#revenueTypeId').val() == 51001) {
			$("#fees").show();
			$("#commission").hide();
			$("#popUpAlertaddnote").css('height', '355px');
			document.getElementById('poptable_contactform1').style.height = '215px';
		} 
		
		else if ($('#revenueTypeId').val() == 51003) {
			$("#fees").show();
			$("#commission").show();
			
			document.getElementById('poptable_contactform1').style.height = '310px';
			$("#popUpAlertaddnote").css('height', '450px');
		} 
	} 
	  
	function resetValues(){
		document.getElementById("title1").innerHTML="Add";
		$('#productTypeShapeID').val(0);
		$("#fees").show();
		$("#commission").hide();
		$("#popUpAlertaddnote").css('height', '355px');
		document.getElementById('poptable_contactform1').style.height = '215px';
		//show add buttons
		$('#editbuttons').fadeOut('fast');
		$('#addbuttons').fadeIn('slow'); 
		
		$('#assetId').val('');
		$('#prodTypeId').val(''); 
		$('#prodTypeId').empty();
		$('#prodTypeId').append('<option value="">--Select--</option>');
		$('#prodCatId').val('');
		$('#prodCatId').empty();
		$('#prodCatId').append('<option value="">--Select--</option>');
		
		$('#trialRevenue').val('');
		$('#upFrontRevenue').val('');
		$('#oneTimeRevenue').val('');
		$('#revenueTypeId').val(51001);
	}
	
	function showButtons(id){   
		//show add buttons    
		
		if(id == 0){ //show add buttons
			$('#editbuttons').fadeOut('fast');
			$('#addbuttons').fadeIn('slow');
			}    
		if(id == 1){//show edit buttons
			$('#addbuttons').fadeOut('fast');  
			$('#editbuttons').fadeIn('slow');  
			}
		    
	}  
	
	function saveRevenue(isToClose,action){
		if(checkRequiredVals() == true){
			doAdd(isToClose,action);
		} 
	}
	
	function checkRequiredVals(){
		
		if ($('#assetId').val().trim()=="") {
			alert("Please select asset class.");
			$('#assetId').focus();  
	        return false;
	    }
		if ($('#prodTypeId').val().trim()=="") {
			alert("Please select product type.");
			$('#prodTypeId').focus();
	        return false;
	    }
		if ($('#prodCatId').val().trim()=="") {
			alert("Please select product category.");
			$('#prodCatId').focus();
	        return false;
	    }
		if ($('#revenueTypeId').val().trim()=="") {
			alert("Please select revenue type.");
			$('#revenueTypeId').focus();
	        return false;
	    }
		if ($('#revenueTypeId').val()==51001) {
			if ($('#oneTimeRevenue').val().trim()=="") {
				alert("Please enter one time revenue.");
				$('#oneTimeRevenue').focus();
		        return false;
		    }
	    }
		if ($('#revenueTypeId').val()==51002) {
			if ($('#trialRevenue').val().trim()=="" && $('#upFrontRevenue').val().trim()=="") {
				alert("Please enter trail revenue or upfront revenue.");
				$('#trialRevenue').focus();
		        return false;
		    }
	    }
		if ($('#revenueTypeId').val()==51003) {
			if ($('#trialRevenue').val().trim()=="" && $('#upFrontRevenue').val().trim()=="") {
				alert("Please enter trail revenue or upfront revenue.");
				$('#trialRevenue').focus();
		        return false;
		    }
			if ($('#oneTimeRevenue').val().trim()=="") {
				alert("Please enter one time revenue.");
				$('#oneTimeRevenue').focus();
		        return false;
		    }
	    }
		return true;
	}
	
	function checkProdCatRevExist(){
		var assetId = $('#assetId').val();
		var prodtypeId = $('#prodTypeId').val();
		var prodcatId = $('#prodCatId').val();
		$('#isOneTimeRevenue').val(0.0);
		$('#isUpfrontRevenue').val(0.0);
		$('#isTrailRevenue').val(0.0);
		
		
		var oldprodcatId = document.getElementById("editprodCatId").value;
		
		if(assetId != "" && prodtypeId != "" && prodcatId!="" && ($.trim(oldprodcatId)!=prodcatId) ){
			
			$.ajax({
				type :'GET',
				url:$('#contextPath').val()+'/product/checkProdCategoryRevenue.htm',
				data:$('#catRevForm').serialize(),
				success : function(result){
					if(result>0){
						alert('Product category revenue already exist,Please select other category.');
						$('#prodCatId').val('');
	    				$('#prodCatId').focus();
					} 
		  		}
			});
		}
	}
	
	function updateProdCatRevenue(prodTypeShapeID,assetID,prodTypeID,categoryID,revTypeId,onetmRev,upFrntRev,trailRev){
		
		$('#productTypeShapeID').val(prodTypeShapeID);
		$('#assetId').val(assetID);
		$('#prodTypeId').val(prodTypeID);
		$('#prodCatId').val(categoryID);
		
		
		$('#oneTimeRevenue').val(onetmRev);  
		$('#upFrontRevenue').val(upFrntRev);
		$('#trialRevenue').val(trailRev);
		
		//document.getElementById("editassetId").value = assetID;
		//document.getElementById("editprodTypeId").value = prodTypeID;
		document.getElementById("editprodCatId").value = categoryID;
		
		getRevenueType(revTypeId);  
		getProductType(categoryID,prodTypeID,assetID);
		
		
		//show commission or fees or both depend on id
		if (revTypeId == 51002) {
			$("#commission").show();
			$("#fees").hide(); 
			$("#popUpAlertaddnote").css('height', '400px');
			document.getElementById('poptable_contactform1').style.height = '260px';

		} 

		else if (revTypeId == 51001) {
			$("#fees").show();
			$("#commission").hide();
			$("#popUpAlertaddnote").css('height', '355px');
			document.getElementById('poptable_contactform1').style.height = '215px';

		}
		
		else if (revTypeId == 51003) {
			$("#fees").show();
			$("#commission").show();
			document.getElementById('poptable_contactform1').style.height = '310px';
			$("#popUpAlertaddnote").css('height', '450px');
		}
		
		//show edit buttons
		$('#addbuttons').fadeOut('fast');
		$('#editbuttons').fadeIn('slow');
		
		//getProductCategory(categoryID,prodTypeID);
		 
		$('#addnote').modal('show');
	}
	
	function doAdd(closePopup,action){
		//if(action=='edit'){
			
			if($('#revenueTypeId').val() == 51001){
				$('#trialRevenue').val(null);
				$('#upFrontRevenue').val(null);
				$('#isUpfrontRevenue').val(0);
				$('#isTrailRevenue').val(0);
				$('#isOneTimeRevenue').val(1);
			}
			
			if($('#revenueTypeId').val() == 51002){
				$('#oneTimeRevenue').val(null);
				if($('#trialRevenue').val()==""){
					$('#isTrailRevenue').val(0);
				} else{
					$('#isTrailRevenue').val(1);
				}
				
				if($('#upFrontRevenue').val()==""){
					$('#isUpfrontRevenue').val(0);
				}else{
					$('#isUpfrontRevenue').val(1);
				}
				
				$('#isOneTimeRevenue').val(0);
				  
				
			}  
			
			if($('#revenueTypeId').val() == 51003){
				
				if($('#trialRevenue').val()==""){
					$('#isTrailRevenue').val(0);
					$('#trialRevenue').val(null);
				}else{
					$('#isTrailRevenue').val(1);
				}
				
				if($('#upFrontRevenue').val()==""){
					$('#isUpfrontRevenue').val(0);
					$('#upFrontRevenue').val(null);
				}else{
					$('#isUpfrontRevenue').val(1);
				}
				
				if($('#oneTimeRevenue').val()==""){
					$('#isOneTimeRevenue').val(0);
					$('#oneTimeRevenue').val(null);
				}else{
					$('#isOneTimeRevenue').val(1);
				}
				
				
			}
		//} 
		
		  
		$.ajax({
				type :'GET',
				url:$('#contextPath').val()+'/product/addOrUpdateProductCategoryRevenue.htm',
				data:$('#catRevForm').serialize(),
				success : function(result){
					//alert(result);
					if(result == 'fail'){
						alert('Error occurred please try again.');
						window.location.reload();
					} else{
			            if(closePopup==1 && action=='edit'){
			            	
			            	 bootbox.dialog({
									message: "<span class='bigger-110'>Record updated successfully</span>",
									buttons: 			
									{
										"click" :
										{
											"label" : "OK!",
											"className" : "btn-sm btn-primary",
											"callback": function() {
												 document.getElementById("catRevForm").reset();	
												 location.reload();
											}
										}
									}
							});
			            	
			            } else if(closePopup==1 && action=='add'){
			               	/* alert('Record added successfully');
			               	window.location.reload(); */
			            	 bootbox.dialog({
									message: "<span class='bigger-110'>Record updated successfully</span>",
									buttons: 			
									{
										"click" :
										{
											"label" : "OK!",
											"className" : "btn-sm btn-primary",
											"callback": function() {
												 document.getElementById("catRevForm").reset();	
												 location.reload();
											}
										}
									}
							});
			            	
			            } else{
			            	 bootbox.dialog({
									message: "<span class='bigger-110'>Record updated successfully</span>",
									buttons: 			
									{
										"click" :
										{
											"label" : "OK!",
											"className" : "btn-sm btn-primary",
											"callback": function() {
												 document.getElementById("catRevForm").reset();	
												 location.reload();
											}
										}
									}
							});
			            	  
			            }
					}
		  		}
		});
	}  
</script> 
 <script type="text/javascript">

	
   
 </script>
  
</head>
<body>
	<jsp:include page="../common/header.jsp" />
	<!--css popup window start 2-->
	<div style="display: none;" id="blanket"></div> 
	
	 	<div class="modal fade" id="addnote" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  	<div class="modal-dialog"> 
    <div class="modal-content"> 
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">Product Category Revenue</h4> 
      </div>    
      <div class="modal-body">       
			<!-- <div id="popupwrapper_contactform">  -->
  			<input type="hidden" name="confirmdelete" id="confirmdelete" >   
 			<form id="catRevForm" method="post"> 
				<input type="hidden" name="isOneTimeRevenue" id="isOneTimeRevenue" />
				<input type="hidden" name="isUpfrontRevenue" id="isUpfrontRevenue" /> 
				<input type="hidden" name="isTrailRevenue" id="isTrailRevenue" />
				<input type="hidden" name="productTypeShapeID" id="productTypeShapeID" />
				
				<!-- <input type="text" name="editassetId" id="editassetId" />
				<input type="text" name="editprodTypeId" id="editprodTypeId" /> -->
				<input type="hidden" name="editprodCatId" id="editprodCatId" />
				   
			<div id="popupwrapper_contactform"> 
				  
				<div id="poptable_contactform1">
					<span class="searchpadding padding_top"
						style="float: left; width: 155px;">Asset Class<span
						class="red">*</span> 
					</span> 
					<span class="searchpadding padding_top" style="float: left; width: 153px; ">  
						<select id="assetId" name="assetClassID" class="form-control" onchange="getProductType(0,0,this.value);">
							<option value=""> --Select--  </option>  
             				 <%-- <c:forEach var="item" items="${assetList}">    
                 				<option value="${item.assetId}" <c:if test="${item.assetId==assetClassId}"> selected="selected" </c:if> >${item.assetName}</option>
                 			</c:forEach>   --%>   
                 			           
	   					</select>     
					</span>  
					<div class="clearfix"></div>
					<span class="searchpadding padding_top"
						style="float: left; width: 155px; margin-top: 9px">Product Type<span
						class="red">*</span>
					</span> 
					<span class="searchpadding padding_top" style="float: left; width: 153px; margin-top: 7px"> 
						<select id="prodTypeId" name="productTypeID" class="form-control" onchange="getProductCategory(0,this.value);">
							<option value=""> --Select--  </option> 
	   					</select>
					</span>  
					<div class="clearfix"></div>
					 
					<span class="searchpadding padding_top"
						style="float: left; width: 155px; margin-top: 9px">Product Category<span
						class="red">*</span>
					</span> 
					<span class="searchpadding padding_top" style="float: left; width: 153px; margin-top: 7px"> 
						<select id="prodCatId" name="categoryID" class="form-control" onchange="checkProdCatRevExist();">
                   			<option value=""> --Select--  </option>
		    			</select> 
					</span> 
					<div class="clearfix"></div>
					
					 
										
					<span class="searchpadding padding_top"
						style="float: left; width: 155px; margin-top: 9px">Revenue Type <span
						class="red">*</span>
					</span> 
					<span class="searchpadding padding_top"	style="float: left; width: 153px; margin-top: 7px"> 
						<select name="revenueTypeID" class="form-control" onChange="revenueTypeChange(this.value)" id="revenueTypeId">
							
						</select>
					</span>
					<div class="clearfix"></div>

					<div id="commission" style="display: none;">
						<span class="searchpadding padding_top"
							style="float: left; width: 155px; margin-top: 9px">Trail Revenue % </span> 
						<span class="searchpadding padding_top" style="float: left; width: 153px; margin-top: 7px">
							<input id="trialRevenue" name="trailRevenue" type="text" class="form-control" maxlength="6">
						</span> 
						<span id="errmsg2" style="float:left; width:480px; padding-top: 10px;padding-left:153px;"></span>
						<div class="clearfix"></div>

						<span class="searchpadding padding_top"
							style="float: left; width: 155px; margin-top: 9px">Upfront Revenue % </span> 
						<span class="searchpadding padding_top"	style="float: left; width: 153px; margin-top: 7px">
							<input id="upFrontRevenue" name="upfrontRevenue" type="text" maxlength="6" class="form-control">
						</span>
						<span id="errmsg3" style="float:left; width:480px; padding-top: 10px;padding-left:153px;"></span>
						<div class="clearfix"></div>

					</div>
					<div id="fees">

						<span class="searchpadding padding_top"
							style="float: left; width: 155px; margin-top: 9px">One-Time Revenue % <span	class="red">*</span> </span> <span
							class="searchpadding padding_top"
							style="float: left; width: 153px; margin-top: 7px">
							<input id="oneTimeRevenue" name="onetimeRevenue" type="text" class="form-control" maxlength="6"></span>
						<span id="errmsg4" style="float:left; width:480px; padding-top: 10px;padding-left:153px;"></span>
						<div class="clearfix"></div>
					</div> 

				</div>  
 
		  
			</div>
			</form>
   </div>     
	  
	<div class="modal-footer" id="addbuttons">  
	<button data-bb-handler="confirm" type="button" class="btn btn-primary btn-sm" id="Save" onclick="saveRevenue(0,'add');">	Save &amp; New</button>
	<button data-bb-handler="close" type="button" class="btn btn-primary btn-sm" id="Save" onclick="saveRevenue(1,'add');" >Save &amp; Close</button>
	<button data-bb-handler="cancel" type="button" class="btn btn-sm btn-danger" type="button" class="close" data-dismiss="modal" aria-label="Close"><i class="ace-icon fa fa-close"></i> Cancel</button>
	</div> 
	     
	<div class="modal-footer" id="editbuttons">
	<button data-bb-handler="confirm" type="button" class="btn btn-primary btn-sm" id="Save" onclick="saveRevenue(1,'edit');">	Save </button>
	
	<button data-bb-handler="cancel" type="button" class="btn btn-sm btn-danger" type="button" class="close" data-dismiss="modal" aria-label="Close"><i class="ace-icon fa fa-close"></i> Cancel</button>
	</div>     
	      
     </div>
      
     </div></div>  
	
	
	
	
	<!--css popup window 2 close-->

  
	<!-- Center part End --> 
	
	<section>
	
	<div class="container-head">
    		
    		            
          <div class="page-header clearfix">
            <h1 class="pull-left">Product Category Revenue List</h1>
            <div class="nav-search pull-right" id="">
              <form class="form-search">
               </form>
          </div>  
           	    <!-- accordion-group END -->
              </div>
    		
          </div >
			<div class="container-body">
				
				<ul class="pagination pagination-sm"></ul>	
				<div class="pull-right">
					
				<a id="SPProductCatRevAddLink" href="#" onClick="addNote();getRevenueType(0);resetValues();">
						<input data-params="{}"	type="button" class="btn btn-sm btn-primary"	value="  New Category Revenue  "
						onClick="showButtons(0);" title="New Product Category Revenue"
						alt="New Product Category Revenue"> 
					</a>  				
				</div>
				
				<div class="clearfix"></div>
							
				<div class="table-responsive" id="display_table_lead">
					<div id="toreload">
							<table id="grid-table"></table>
							<div id="grid-pager"></div>
					</div>
				</div>
				<div class="pull-left">
     				 <div class="hr-12"></div>
     				 <div class="topmenuleft margin_5px" >
          			 	<span>Export options: </span>
							<a id="csvExp" href="<%=request.getContextPath()%>/product/productCatRevenueExport.htm?type=CSV" title="Export in CSV" alt="Export in CSV">
							<i class="fa fa-file-pdf-o bigger-140"></i></a>
							
							<a id="excelExp" href="<%=request.getContextPath()%>/product/productCatRevenueExport.htm?type=excel" title="Export in Excel" alt="Export in Excel"> 
							<i class="fa fa-file-excel-o bigger-140"></i></a>
					 </div>
				</div>
				
				<div class="pull-right">
				<div class="hr-12"></div>
				
					<a id="SPProductCatRevAddLink" href="#" onClick="addNote();getRevenueType(0);resetValues();">
						<input data-params="{}"	type="button" class="btn btn-sm btn-primary"	value="  New Category Revenue  "
						onClick="showButtons(0);" title="New Product Category Revenue"
						alt="New Product Category Revenue"> 
					</a>  						
				</div>
				
			</div>
		
	</section>
 
	<footer>
		<jsp:include page="../common/footer.jsp" />
	</footer>
	
</body> 
<script type="text/javascript">
		var grid_data='${catRevList}';
		
		//index=JSON.parse(grid_data);
		index=$.parseJSON(grid_data);
		
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
				colNames:[' ','Asset Class','Product Type','Category','Revenue Type','One Time Revenue','UpFront Revenue','Trail Revenue','One Time Revenue %','UpFront Revenue %','Trail Revenue %'], 
				colModel:[
					  
					
					/* updateProdCatRevenue(prodTypeShapeID,assetID,prodTypeID,categoryID,revTypeId,onetmRev,upFrntRev,trailRev) */			
					{name:'prodTypeShapeID',index:'prodTypeShapeID',width:50,formatter:function(cellvalue, options,rowObject) {
						return '<a href="#" onclick="showButtons(1);updateProdCatRevenue('+rowObject.productTypeShapeID+',\''+rowObject.assetClassID+'\',\''+rowObject.productTypeID+'\',\''+rowObject.categoryID+'\',\''+rowObject.revenueTypeID+'\',\''+rowObject.onetimeRevenue+'\',\''+rowObject.upfrontRevenue+'\',\''+rowObject.trailRevenue+'\');" id="'+rowObject.productTypeShapeID+'"><img src="<%=request.getContextPath()%>/images/edit.png" alt="Edit" title="Edit"></a>';
					}},	 		 
					{name:'assetClass',index:'assetClass'}, 
					{name:'productType',index:'productType'}, 
					{name:'category',index:'category'}, 
					{name:'revenueType',index:'revenueType'},
					{name:'isOneTimeRevenue', index:'isOneTimeRevenue',formatter:function(cellvalue, options,rowObject) {
					 	
					    if(rowObject.isOneTimeRevenue==0)      
					    	return '<span  >'+"No"+'</span>';
					    else
					    	return '<span >'+"Yes"+'</span>'; 
					      
					}},
					{name:'isUpfrontRevenue', index:'isUpfrontRevenue',formatter:function(cellvalue, options,rowObject) {
					 	
					    if(rowObject.isUpfrontRevenue==0)      
					    	return '<span  >'+"No"+'</span>';
					    else
					    	return '<span >'+"Yes"+'</span>'; 
					         
					}},    
					{name:'isTrailRevenue', index:'isTrailRevenue',formatter:function(cellvalue, options,rowObject) {
					 	
					    if(rowObject.isTrailRevenue==0)      
					    	return '<span  >'+"No"+'</span>';
					    else
					    	return '<span >'+"Yes"+'</span>'; 
					      
					}},   
					{name:'onetimeRevenue', index:'onetimeRevenue',formatter:function(cellvalue, options,rowObject) {
					 	
					    if(rowObject.onetimeRevenue==null)      
					    	return '<span  >'+"NA"+'</span>';
					    else
					    	return rowObject.onetimeRevenue; 
					      
					}},   
					{name:'upfrontRevenue', index:'upfrontRevenue',formatter:function(cellvalue, options,rowObject) {
					 	
					    if(rowObject.upfrontRevenue==null)      
					    	return '<span  >'+"NA"+'</span>';
					    else
					    	return rowObject.upfrontRevenue; 
					      
					}},  
					{name:'trailRevenue', index:'trailRevenue',formatter:function(cellvalue, options,rowObject) {
					 	
					    if(rowObject.trailRevenue==null)      
					    	return '<span  >'+"NA"+'</span>';
					    else 
					    	return rowObject.trailRevenue ; 
					      
					}},  
					
				], 
			
				viewrecords : true,
				rowNum:10,
				rowList:[10,20,50,100,1000],
				pager : pager_selector,
				altRows: true,
				multiselect: false,
		        multiboxonly: true,
				autowidth: true,
				shrinkToFit:false,
				
				});
				
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
						search: false,
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
			
		</script>
		
		<script>
		
		$(document).ready(function() {  
			$('#trialRevenue').keypress(function (event) {
		  	    if ((event.which != 46 || $(this).val().indexOf('.') != -1) && (event.which < 48 || event.which > 57)) {
		  	        event.preventDefault();
		  	      $("#errmsg2").html("Please enter digits Only").show().fadeOut(2500);
		  	    } 
		 
		  	    var text = $(this).val();
		  
		  	    if ((text.indexOf('.') != -1) && (text.substring(text.indexOf('.')).length > 2)) {
		  	        event.preventDefault();
		  	      $("#errmsg2").html("You can enter only two digits after decimal").show().fadeOut(2500);
		  	    } 
		  	});
		  	 
		  	$('#upFrontRevenue').keypress(function (event) {
		  	    if ((event.which != 46 || $(this).val().indexOf('.') != -1) && (event.which < 48 || event.which > 57)) {
		  	        event.preventDefault();
		  	      $("#errmsg3").html("Please enter digits Only").show().fadeOut(2500);
		  	    }

		  	    var text = $(this).val();
		  
		  	    if ((text.indexOf('.') != -1) && (text.substring(text.indexOf('.')).length > 2)) {
		  	        event.preventDefault();
		  	      $("#errmsg3").html("You can enter only two digits after decimal").show().fadeOut(2500);
		  	    } 
		  	});
		  	
		  	$('#oneTimeRevenue').keypress(function (event) {
		  	    if ((event.which != 46 || $(this).val().indexOf('.') != -1) && (event.which < 48 || event.which > 57)) {
		  	        event.preventDefault();
		  	      $("#errmsg4").html("Please enter digits Only").show().fadeOut(2500);
		  	    } 

		  	    var text = $(this).val();

		  	    if ((text.indexOf('.') != -1) && (text.substring(text.indexOf('.')).length > 2)) {
		  	        event.preventDefault();
		  	      $("#errmsg4").html("You can enter only two digits after decimal").show().fadeOut(2500);
		  	    }
		  	});
		  	
			var asset = '${assetList}';
		    
		    var list = $.parseJSON(asset);
		  $.each(list, function( index, obj ) {
		   	var id=obj.assetId;
			var name=obj.assetName; 
			/* <option value="${item.assetId}" <c:if test="${item.assetId==assetClassId}"> selected="selected" </c:if> >${item.assetName}</option> */
			$('#assetId').append('<option value="'+ id+'">'+ name + '</option>'); 
		  });  
		  	 
		  var catRevList  = '${catRevList}';
		 	$.each(catRevList, function( index, obj ) {
			   //alert( obj.assetClassId + "and " + obj.assetId );
			  var id=obj.prodCatId;  
			  var name=obj.prodCatName;   
				/* <option value="${item.assetId}" <c:if test="${item.assetId==assetClassId}"> selected="selected" </c:if> >${item.assetName}</option> */
				$('#prodTypeId').append('<option value="'+ id+'">'+ name + '</option>'); 
			  });     
		
			
		});//document ready function ends here
		</script>
		
</html>