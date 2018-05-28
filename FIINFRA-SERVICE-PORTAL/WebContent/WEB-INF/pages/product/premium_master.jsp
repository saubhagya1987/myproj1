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
		<title>Product Premium Master</title> 
 
	 	<!-- -responsive css-->   
		
		<%-- <link href="<%=request.getContextPath()%>/css/style_serviceportal.css" rel="stylesheet">
		<link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/css/popup.css" />
		<link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/css/jquery.ui.all.css" />
		
		<script type="text/javascript" src="<%=request.getContextPath()%>/js/pop.js"></script>
		
	 	<script type="text/javascript">
			/* bkLib.onDomLoaded(function() { nicEditors.allTextAreas() }); */
		</script>
		 --%>
		
		<script type="text/javascript">
			
			
			
		
			function savePremiumProduct(isToClose,action){
				 
				
				if(checkRequiredVals() == true){
					doAdd(isToClose,action); 
				 }  
			}
			
			function checkRequiredVals(){
				
				 if ($('#startAgeRange').val().trim()=="") {
					 alert("Age range is required.");
					 $('#startAgeRange').focus();
			         return false;
			     }
				 if ($('#endAgeRange').val().trim()=="") {
					 alert("Age range is required.");
					 $('#endAgeRange').focus();
			         return false;
			     }
				 if ($('#sumAssuredAmount').val().trim()=="") {
					 alert("Please enter sum assured.");
					 $('#sumAssuredAmount').focus();
			         return false;
			     }
				 if ($('#policyPaymentTerm').val().trim()=="") {
					 alert("Please enter policy payment term.");
					 $('#policyPaymentTerm').focus();
			         return false;
			     }
				 if ($('#premiumAmount').val().trim()=="") {
					 alert("Please enter premium amount.");
					 $('#premiumAmount').focus();
			         return false;
			     } 
				return true;
			}
			
			function doAdd(closePopup,action){  
				
				var isdef=$("#isDefault").is(":checked");
				//alert(isdef);
				if(isdef==true){
					document.getElementById("isDefault").value = true;
				}else{
				 	document.getElementById("isDefault").value = false;
				}
				  
				var inclspouse = $("#incSpouse").is(":checked");
				if(inclspouse==true){
					document.getElementById("spouse").value = 1;
				}else{
				 	document.getElementById("spouse").value = 0;
				}
				
				var incChild = $("#inclChild").is(":checked");
				if(incChild==true){
					
					if ($('#childCount').val().trim()=="") {
						 alert("Please select count.");
						 $('#childCount').focus();
				         return false;
				     } else{
				    	var count = document.getElementById("childCount").value;
						document.getElementById("child").value = count;
				     }
					
				}else{
				 	document.getElementById("child").value = 0;
				}
				//alert(document.getElementById("isDefault").value);
				$.ajax({
					type :'GET',
					url : $('#contextPath').val()+'/product/addOrUpdatePremiumMaster.htm',
					data:$('#addForm').serialize(),
					success : function(result){
						
		               	if(closePopup==1 && action=='edit'){
		               		//alert('Record updated successfully');
		               	 bootbox.dialog({
								message: "<span class='bigger-110'>Record updated successfully. </span>",
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
 	            	   
		                } else if(closePopup==1 && action=='add'){
		                	//alert('Record added successfully');
		                	 bootbox.dialog({
									message: "<span class='bigger-110'>Record added successfully. </span>",
									buttons: 			
									{
										"click" :
										{
											"label" : "OK!",
											"className" : "btn-sm btn-primary",
											"callback": function() {
												//Example.show("Primary button");
												
												resetValues();  
								      	       	  addNote();
											}
										}
									}
								});
 	            	    	
		                } 
		                else if(closePopup==0 && action=='add'){
		               		//alert('Record added successfully');
		               		bootbox.dialog({
								message: "<span class='bigger-110'>Record added successfully. </span>",
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
		               		resetValues();   
		               } 
			  		} 
				});
			}
			
			function updatePremiumMaster(premid,startage,endage,sumamount,policyterm,premamnt,isspouse,ischild,isdef){
				
				$('#addnote').modal('show');
				/* document.getElementById("title").innerHTML="Edit"; */
				document.getElementById("productPremiumId").value = premid;
				document.getElementById("startAgeRange").value = startage;
				document.getElementById("endAgeRange").value = endage;
				document.getElementById("sumAssuredAmount").value=sumamount;
				document.getElementById("policyPaymentTerm").value=policyterm;
				document.getElementById("premiumAmount").value=premamnt;
				
				
				document.getElementById("editStartAge").value=startage;
				document.getElementById("editEndAge").value=endage;
				
				
				if(isspouse > 0){
					document.getElementById("incSpouse").value=1;
					$("#incSpouse").prop('checked', true);
					document.getElementById("spouse").value = isspouse;
				} else{
					document.getElementById("incSpouse").value=0;
					$("#incSpouse").prop('checked', false);
					document.getElementById("spouse").value = isspouse;
				}
				if(ischild > 0){
					document.getElementById("inclChild").value=1;
					$("#inclChild").prop('checked', true);  
					 $('#autoUpdate').fadeIn('slow');
					 document.getElementById("childCount").value=ischild;
					 document.getElementById("child").value = ischild;
				} else{
					document.getElementById("inclChild").value=0;
					$("#inclChild").prop('checked', false);
					 $('#autoUpdate').fadeOut('slow');
					 document.getElementById("childCount").value=ischild;
					 document.getElementById("child").value = ischild;
				}
				var def = isdef.toString();
				
				if(def=="true"){
					document.getElementById("isDefault").value=1;
					$("#isDefault").prop('checked', true);
				} else{
					$("#isDefault").prop('checked', false);
					document.getElementById("isDefault").value=0;
				}
				
				//show edit buttons
				$('#addbuttons').fadeOut('fast');
				$('#editbuttons').fadeIn('slow');
				
			}
			
			function resetValues(){
				/* document.getElementById("title").innerHTML="Add"; commented by suvarna*/
				document.getElementById("productPremiumId").value = 0;
				document.getElementById("spouse").value = 0;
				document.getElementById("child").value = 0;
				$('#startAgeRange').val('');
				$('#endAgeRange').val('');
				$('#sumAssuredAmount').val('');
				$('#policyPaymentTerm').val('');
				$('#premiumAmount').val('');
				
				document.getElementById("incSpouse").value=0;
				$("#incSpouse").prop('checked', false);
				
				document.getElementById("inclChild").value=0;
				$("#inclChild").prop('checked', false);
				document.getElementById("childCount").value='';
				$('#autoUpdate').fadeOut('slow');
				
				
				document.getElementById("isDefault").value=0;
				$("#isDefault").prop('checked', false);
				
				//show add buttons
				//show edit buttons
				$('#editbuttons').fadeOut('fast');
				$('#addbuttons').fadeIn('slow');
				
			}
			
			
			function changePageSize(){
				var prodid = $('#masterProductId').val();
				var prodName = $('#prodname').val();
				
				var searchtext=$('#searchtext').val();
			 	$("#toreload").load('${pageContext.request.contextPath}/product/premium_master.htm #toreload', {
				   object: '${object}',
				   pageSize: $('#page').val(),
				   id: prodid,
				   productName: prodName,
				   searchtext:searchtext,

			}, function( response, status, xhr ) {
			      try{
			        
			        //closePopupWebApp('');
			    	 
			      }catch(e){
			        // closePopupWebApp('');       
			      }
			     });
				//setResult('');	
			}
			
			
			
			
			function checkAgeRange(){
				
				var start = document.getElementById('startAgeRange').value;
				var end = document.getElementById('endAgeRange').value;
				var prodid = $('#masterProductId').val();
				
				var oldstage = document.getElementById("editStartAge").value;
				var oldendage = document.getElementById("editEndAge").value;
				
				
				if($.trim(start) != "" && $.trim(end) != "" && (start != oldstage || end != oldendage)){

					$.ajax({
						type :'GET',
						url : $('#contextPath').val()+"/product/checkStartAgeRange.htm?startAge="+start+"&prodId="+prodid,
						success : function(result){
							if(result>0){
								alert('Start age range already exist');
								document.getElementById('startAgeRange').value="";
			    				document.getElementById('endAgeRange').value="";
			    				$('#startAgeRange').focus();
							} else{
								//set focus to next input box
								$('#sumAssuredAmount').focus();
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
		<div style="display: none;" id="blanket"></div>
		
<!--css popup window 1 close-->
<!--css popup window start 2-->
		<div style="display: none;" id="blanket"></div>
		<%-- <div style="display: none; width:650px; height:450px; top:100px" id="popUpAlertaddnote" class="alert">
			<div class="close" style="margin-right:10px;">
				<a onClick="popup('popUpAlertaddnote')" href="#">
					<img alt="" src="<%=request.getContextPath()%>/images/btn_close.gif" />
				</a>
			</div>
			<!-- --------------------Add form start----------------------------- -->
			<form id="addForm" name="premMast" method="post">
				<input type="hidden" name="masterProductId" id="masterProductId" value="${productId}" />
				<input type="hidden" name="spouse" id="spouse" />
				<input type="hidden" name="child" id="child" />
				<input type="hidden" name="productPremiumId" id="productPremiumId" />
				<input type="hidden" name="prodname" id="prodname" value="${prodName}" />
				
				<input type="hidden" name="editStartAge" id="editStartAge">
				<input type="hidden" name="editEndAge" id="editEndAge">
				
			<div id="addnote"> 
    			<div id="popupwrapper_contactform">   
   					<div class="heading_contactform" ><h3> <label id="title"> </label> Product Premium  &#45; ${prodName}</h3></div>
        			<div id="poptable_contactform" style="padding:10px; height:315px;">
        				<span  class="searchpadding padding_top" style="float:left; width:150px;">Age Range  <span class="red">*</span> </span>
						<span  class="searchpadding padding_top" style="float:left;width:150px;">
							<input id="startAgeRange" type="text" class="form-control" name="startAgeRange" onchange="checkAgeRange();">
						</span>
						<span  class="searchpadding padding_top" style="float:left;width:150px;">
							<input id="endAgeRange" type="text" class="form-control" name="endAgeRange" onchange="checkAgeRange();">
						</span>
						<span id="errmsg" style="float:left; width:440px; padding-top: 10px;padding-left:153px;"></span>
        				<div class="clearfix"></div>
        				<span class="searchpadding padding_top" style="float:left; width:150px;">Sum Assured     <span class="red">*</span> </span>
						<span  class="searchpadding padding_top" style="float:left; width:300px;">
							<input type="text" class="form-control" id="sumAssuredAmount" name="sumAssuredAmount">
						</span>
						<span id="errmsg1" style="float:left; width:413px; padding-top: 10px;padding-left:153px;"></span>
				        <div class="clearfix"></div>
  
  						<span class="searchpadding padding_top" style="float:left; width:150px;">Policy Payment Term (Yrs) <span class="red">*</span>    </span>
						<span  class="searchpadding padding_top" style="float:left; width:300px;">
							<input type="text" class="form-control" id="policyPaymentTerm" name="policyPaymentTerm">
						</span>
						<span id="errmsg2" style="float:left; width:300px; padding-top: 10px;"></span>
        				<div class="clearfix"></div>
        
   						<span class="searchpadding padding_top" style="float:left; width:150px;">Premium Amount <span class="red">*</span>     </span>
						<span  class="searchpadding padding_top" style="float:left; width:300px;">
							<input type="text" class="form-control" id="premiumAmount" name="premiumAmount">
						</span>
						<span id="errmsg3" style="float:left; width:413px; padding-top: 10px;padding-left:153px;"></span>
        				<div class="clearfix"></div>         
    					<span class="searchpadding padding_top" style="float:left; width:150px;">Include Spouse?   </span>
						<span  class="searchpadding padding_top" style="float:left; width:300px;">
							<input id="incSpouse" name="incSpouse" value="1" type="checkbox">
						</span>
        				<div class="clearfix"></div>  
     					<span class="searchpadding padding_top" style="float:left; width:150px;">Include Children?   </span>
						<span  class="searchpadding padding_top" style="float:left; width:100px;">
							<input id="inclChild" name="inclChild" type="checkbox" value="1">
						</span>
						<div id="autoUpdate" style="display:none;">  
						<span class="searchpadding padding_top" style="float:left; width:55px;">Count <span class="red">*</span> </span><span  class="searchpadding padding_top" style="float:left; width:150px;">
							<input type="text" class="form-control" id="childCount" name="childCount">
						</span>
						</div>
						<span id="errmsg4" style="float:left; width:440px; padding-top: 10px;padding-left:153px;"></span>
        				<div class="clearfix"></div>      
 						<span class="searchpadding padding_top" style="float:left; width:150px;">Is Default?  </span>
						<span  class="searchpadding padding_top" style="float:left; width:300px;">
							<input id="isDefault" name="isDefault" value="1" type="checkbox">
						</span>
        				<div class="clearfix"></div>        
					</div>
  					<div class="topbuttonholder" id="addbuttons">
        				
            				<input class="dbtn" value="Save & New" id="Save" type="button" onclick="savePremiumProduct(0,'add');">	
            				<input class="dbtn" value="Save & Close" id="Save" type="button" onclick="savePremiumProduct(1,'add');">	
            				<input class="dbtn" onClick="popup('popUpAlertaddnote');window.location.reload();" value="Cancel" id="Cancel" type="button">	
           				
      				</div>
      				<div class="topbuttonholder" id="editbuttons" style="display:none">
      						<input class="dbtn" value="Save" id="Save" type="button" onclick="savePremiumProduct(1,'edit');">	
           					<input class="dbtn" onClick="popup('popUpAlertaddnote')" value="Cancel" id="Cancel" type="button">
      				</div>
    			</div>
			</div>
			</form>
		    <!-- delete-->
    		
		   
		</div> --%> 
		
		<div class="modal fade" id="addnote" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  	<div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel"> Product Premium  &#45; ${prodName} </h4> 
      </div>  
      <div class="modal-body">    
			<!-- <div id="popupwrapper_contactform">  -->
   
 	 <form id="addForm" name="premMast" method="post">
				<input type="hidden" name="masterProductId" id="masterProductId" value="${productId}" />
				<input type="hidden" name="spouse" id="spouse" />
				<input type="hidden" name="child" id="child" />
				<input type="hidden" name="productPremiumId" id="productPremiumId" />
				<input type="hidden" name="prodname" id="prodname" value="${prodName}" />
				
				<input type="hidden" name="editStartAge" id="editStartAge">
				<input type="hidden" name="editEndAge" id="editEndAge">
				
 	      		<div id="poptable_contactform" style="padding:10px; height:315px;">
        				<span  class="searchpadding padding_top" style="float:left; width:150px;">Age Range  <span class="red">*</span> </span>
						<span  class="searchpadding padding_top" style="float:left;width:150px; ">
							<input id="startAgeRange" type="text" class="form-control" name="startAgeRange" onchange="checkAgeRange();">
						</span>
						<span  class="searchpadding padding_top" style="float:left;width:150px; margin-left: 3px;"> 
							<input id="endAgeRange" type="text" class="form-control" name="endAgeRange" onchange="checkAgeRange();">
						</span> 
						<span id="errmsg" style="float:left; width:440px; padding-top: 10px;padding-left:153px;"></span>
        				<div class="clearfix"></div>
        				<span class="searchpadding padding_top" style="float:left; width:150px;">Sum Assured     <span class="red">*</span> </span>
						<span  class="searchpadding padding_top" style="float:left; width:300px;">
							<input type="text" class="form-control" id="sumAssuredAmount" name="sumAssuredAmount">
						</span>
						<span id="errmsg1" style="float:left; width:413px; padding-top: 10px;padding-left:153px;"></span>
				        <div class="clearfix"></div>
  
  						<span class="searchpadding padding_top" style="float:left; width:150px;">Policy Payment Term (Yrs) <span class="red">*</span>    </span>
						<span  class="searchpadding padding_top" style="float:left; width:300px;">
							<input type="text" class="form-control" id="policyPaymentTerm" name="policyPaymentTerm">
						</span>
						<span id="errmsg2" style="float:left; width:300px; padding-top: 10px;"></span>
        				<div class="clearfix"></div>
        
   						<span class="searchpadding padding_top" style="float:left; width:150px;">Premium Amount <span class="red">*</span>     </span>
						<span  class="searchpadding padding_top" style="float:left; width:300px;">
							<input type="text" class="form-control" id="premiumAmount" name="premiumAmount">
						</span>
						<span id="errmsg3" style="float:left; width:413px; padding-top: 10px;padding-left:153px;"></span>
        				<div class="clearfix"></div>         
    					<span class="searchpadding padding_top" style="float:left; width:150px;">Include Spouse?   </span>
						<span  class="searchpadding padding_top" style="float:left; width:300px;">
							<input id="incSpouse" name="incSpouse" value="1" type="checkbox">
						</span>
        				<div class="clearfix"></div>  
     					<span class="searchpadding padding_top" style="float:left; width:150px;">Include Children?   </span>
						<span  class="searchpadding padding_top" style="float:left; width:100px;">
							<input id="inclChild" name="inclChild" type="checkbox" value="1">
						</span>
						<div id="autoUpdate" style="display:none;">  
						<span class="searchpadding padding_top" style="float:left; width:55px;">Count <span class="red">*</span> </span><span  class="searchpadding padding_top" style="float:left; width:150px;">
							<input type="text" class="form-control" id="childCount" name="childCount">
						</span>
						</div>
						<span id="errmsg4" style="float:left; width:440px; padding-top: 10px;padding-left:153px;"></span>
        				<div class="clearfix"></div>      
 						<span class="searchpadding padding_top" style="float:left; width:150px;">Is Default?  </span>
						<span  class="searchpadding padding_top" style="float:left; width:300px;">
							<input id="isDefault" name="isDefault" value="1" type="checkbox">
						</span>
        				<div class="clearfix"></div>        
					</div>
        <!--  </div>    --> 
  
       </form>
   <!--  </div>   --> 
	</div>     
	  
	
	   
	<div class="modal-footer" id="addbuttons">  
	<button data-bb-handler="confirm" type="button" class="btn btn-primary btn-sm" id="Save" onclick="savePremiumProduct(1,'add');">	Save &amp; New</button>
	<button data-bb-handler="close" type="button" class="btn btn-primary btn-sm" id="Save" onclick="savePremiumProduct(0,'add');" >Save &amp; Close</button>
	<button data-bb-handler="cancel" type="button" class="btn btn-sm btn-danger" type="button" class="close" data-dismiss="modal" aria-label="Close"><i class="ace-icon fa fa-close"></i> Cancel</button>
	</div> 
	      
	<div class="modal-footer" id="editbuttons">  
	<button data-bb-handler="confirm" type="button" class="btn btn-primary btn-sm" id="Save" onclick="savePremiumProduct(1,'edit');">	Save </button>
	
	<button data-bb-handler="cancel" type="button" class="btn btn-sm btn-danger" type="button" class="close" data-dismiss="modal" aria-label="Close"><i class="ace-icon fa fa-close"></i> Cancel</button>
	</div>   
	      
     </div>  
        
     </div></div>  
		
		<!--css popup window 2 close-->
		
		<!--commented by suvarna
		  <div id="deletenote">
    			<div id="popupwrapper_contactform" style="height:100px;width:250px;">
			  		<div class="heading_contactform"><h3> Message</h3></div>
        			<div id="poptable_contactform" style="padding:10px; height:100px;">
        				Do you want to delete this selected records? Please confirm.
 					</div>
  					<div class="topbuttonholder">
        				<form>
        					<input class="dbtn" value="Yes" id="Yes" type="button">	
            				<input class="dbtn" value="No" id="No" type="button">
           				</form>	
        			</div>
        		</div>
			</div> -->
		
		
		<%-- <div class="container">
			<div class="portfoliostrip collapse navbar-collapse">
		    	<ul class="navbar-sub">
		         	<li id="SPCodeTypeLink"><a href="<%=request.getContextPath()%>/codetype/loadcodetypedata.html">Code Type</a></li>
	            	<li id="SPNotificationTemplatesLink"><a href="<%=request.getContextPath()%>/notifytemplate/getTemplateList.htm">Notification templates</a></li>
					<li id="SPNotificationEventsLink"><a href="<%=request.getContextPath()%>/notifyevent/getEventlist.htm">Notification events</a></li>
	            	<li id="SPProductLink" class="active"><a href="<%=request.getContextPath()%>/product/loadproductlist.htm">Product</a></li>
	            	<li id="SPProductCatRevLink"><a href="<%=request.getContextPath()%>/product/category_revenue.htm">Product Category Revenue</a></li>
	            	<li id="SPProductManufacturerLink"><a href="<%=request.getContextPath()%>/product/product_manufacturer.htm">Product Manufacturer</a></li>
		        </ul>
			</div>        
		  </div>  --%>
		<!-- Center part start -->
 		<section>
	   <!--  <div class="container white"> -->
    		<div class="container-head">
    		
    		 <div class="page-header clearfix">
            <h1 class="pull-left">Product Premium  List  &#45; ${prodName}  </h1>
            <div class="nav-search pull-right" id="">
              <form id="myForm1" method="post">
             <!--  <span  class="col-md-10" style="float:right; margin-top:-18px;"> 
                  					<input name="searchtext" type="text" id="searchtext"
										placeholder="Quick Search">
                  				</span> -->
              
                <%-- <span class="input-icon">
                <input type="text" placeholder="Search ..." class="nav-search-input" id="search"  autocomplete="off" value="${value}">
                <i class="ace-icon fa fa-search nav-search-icon"></i></span> --%>
              </form>
             </div>  
           	    <!-- accordion-group END -->
              </div>
    		</div >
    	  		<%-- <div class="col-md-12" style="text-align: right;"> 
             	<!-- accordion start-->
           			<div class="accordion pull-left col-md-12" id="accordFundSel">
                		<div class="accordion-group">
                			<form id="myForm1" method="post">
                  			<div class="col-md-11" style="width:96%;" > 
                 	 			<span  style="float:left;">Product Premium  List  &#45; ${prodName}   </span>
                  				<span  class="col-md-10" style="float:right; margin-top:-18px;"> 
                  					<input name="searchtext" type="text" id="searchtext"
										placeholder="Quick Search">
                  				</span>
                  			</div>
                  			</form>
                  			
                		</div>
              		</div>
           	  		<!-- accordion  END -->
  			    </div > --%>
          	
  	  		<div class="container-body" >
        	<!-- center -->
        		<ul class="pagination pagination-sm"></ul>	
        		 <div class="pull-right"> 
        		 
        		    <a id="SPProdPremMastAddLink" href="#" onClick="addNote();resetValues();">
						<input data-params="{}"	type="button" class="btn btn-sm btn-primary"	value="  New Product Premium  "
						onClick="showButtons(0);" title="New Product Premium"
						alt="New Product Premium"> 
					</a>  		
        		 
					<!-- <a id="SPProdPremMastAddLink" href="#" onClick="addNote();resetValues();" class="pagerLink">
						<input data-params="{}" type="button" class="dbtn createNewBtn" value="  New Product Premium  "   onClick="showButtons(0);" title="New Product Premium" alt="New Product Premium">
					</a>    --> 
					<!-- <a id="SPProdPremMastDeleteLink" href="#" onClick="deleteNote();" >
						<input data-params="{}" type="button" class="dbtn deleteBtn" value="  Delete"  onClick="popup('popUpAlertaddnote')" title="Delete" alt="Delete">
					</a> -->
				</div>
				
				  <div class="clearfix"></div>
				 <div class="table-responsive" id="display_table_lead" style="border:none;">
		  			<div id="toreload"> 
		  			
		  				<table id="grid-table"></table>      
			 			<div id="grid-pager"></div>  
			 		</div>
			 	</div> 
			 			  
		  				<%-- <display:table name="premiumMasterList" uid="objPortalUser"
								class="table table-hover table-bordered table-striped"
								requestURI="#" sort="list" pagesize="${size}" id="data">
							<display:column>
								<a id="SPProdPremMastEditLink" href="#" onClick="addNote();" class="pagerLink"> 
									<img src="<%=request.getContextPath()%>/images/edit.png" alt="Edit" title="Edit"
									onClick="updatePremiumMaster(${data.productPremiumId},${data.startAgeRange},${data.endAgeRange},'${data.sumAssuredAmount}',${data.policyPaymentTerm},'${data.premiumAmount}',${data.spouse},${data.child},${data.isDefault});popup('popUpAlertaddnote');">
								</a>&nbsp;&nbsp;
							</display:column>
					
							
					
							
							<display:column title="Start Age" property="startAgeRange" sortable="true"></display:column>
							<display:column title="End Age" property="endAgeRange" sortable="true"></display:column>
							<display:column title="Sum Assured" property="sumAssuredAmount" sortable="true"></display:column>
							<display:column title="Policy Payment Term" property="policyPaymentTerm" sortable="true"></display:column>
							<display:column title="Spouse" sortable="true">
								<c:choose>
									<c:when test="${data.spouse > 0}">
										Yes
									</c:when>
									<c:otherwise>
										No
									</c:otherwise>
								</c:choose>
								<c:if test="${data.spouse > 0}"> Yes</c:if>
								<c:if test="${data.spouse < 0}"> No</c:if>
							</display:column>
							<display:column title="Children Covered" sortable="true">
								<c:if test="${data.child > 0}"> Yes - ${data.child} </c:if>
								<c:if test="${data.child <= 0}"> No </c:if>
							</display:column>
							
							<display:column title="Premium Amount" property="premiumAmount" sortable="true"></display:column>
							<display:column title="Default ?" sortable="true">
								<c:choose>
									<c:when test="${data.isDefault==true}">
										Yes
									</c:when>
									<c:otherwise>
										No
									</c:otherwise>
								</c:choose>
							
							</display:column>
						</display:table> --%>
						   
     				<!-- </div> 
     			</div>   -->
	    		<!-- <div class="col-sm-7" >   -->
			        	
					<%-- <div class="topmenuleft" >
 						<div  class="customDropdown">
       						<span >Page Size:</span>&nbsp;
     							<select  type="button" name="pageSize" id="page" onchange="changePageSize();">
									<option value="10" <c:if test="${size==10}"> selected="selected" </c:if>>10</option>
									<option value="20" <c:if test="${size==20}"> selected="selected" </c:if>>20</option>
									<option value="50" <c:if test="${size==50}"> selected="selected" </c:if>>50</option>
									<option value="100" <c:if test="${size==100}"> selected="selected" </c:if>>100</option>
									<option value="500" <c:if test="${size==500}"> selected="selected" </c:if>>500</option>
									<option value="10000">Show All&nbsp;</option>
								</select>
     					</div>	
					</div> --%>
					
						<div class="pull-left">
     				 <div class="hr-12"></div>
     				 <div class="topmenuleft margin_5px" >
							<span>Export options: </span>
							<a id="csvExp" href="<%=request.getContextPath()%>/product/getPremiumExport.htm?id=${productId}&productName=${prodName}&type=CSV" title="Export in CSV" alt="Export in CSV">
							<i class="fa fa-file-pdf-o bigger-140"></i></a>
							
							<a id="excelExp" href="<%=request.getContextPath()%>/product/getPremiumExport.htm?id=${productId}&productName=${prodName}&type=excel" title="Export in Excel" alt="Export in Excel"> 
							<i class="fa fa-file-excel-o bigger-140"></i></a>
						</div>
					</div>
					
					<%-- <div class="topmenuleft" >
 						<ul>
  							<li> Export options: </li>
						    <li> <a href="<%=request.getContextPath()%>/product/getPremiumExport.htm?id=${productId}&productName=${prodName}&type=CSV" title="Export in CSV" alt="Export in CSV"><i class="cvsicon"></i></a></li>
						    <li><a href="<%=request.getContextPath()%>/product/getPremiumExport.htm?id=${productId}&productName=${prodName}&type=excel" title="Export in Excel" alt="Export in Excel"> <i class="excelicon"></i></a></li>
						    <!-- <li> <a href="#"  title="Export in XML" alt="Export in XML"><i class="xmlcon"></i></a></li> -->
					  </ul>
					</div>   --%>
		
	         <div class="pull-right">
        	       <div class="hr-12"></div>
        	        <a id="SPProdPremMastAddLink" href="#" onClick="addNote();resetValues();">
						<input data-params="{}"	type="button" class="btn btn-sm btn-primary"	value="  New Product Premium  "
						onClick="showButtons(0);" title="New Product Premium"
						alt="New Product Premium"> 
					</a>  		
        	       
        		</div>		
     		</div>
	<!-- 	</div>     -->
	</section>           	
	<!-- Center part End -->          
	<footer>
		<jsp:include page="../common/footer.jsp" />
	</footer>

<script>
	function addNote(){
		$("#addnote").modal('show');	 
		 /* $("#deletenote, #editnote").hide();	
		$("#popUpAlertaddnote").css ('height','450px');
		$("#popUpAlertaddnote").css ('width','650px');
		$("#popUpAlertaddnote").css ('left','353px');
		$("#popUpAlertaddnote").css ('top','110px'); */
	}

	function deleteNote(){
		
		/* $("#deletenote").show();	
		$("#addnote, #editnote").hide();	
		$("#popUpAlertaddnote").css ('height','250px');
		$("#popUpAlertaddnote").css ('width','300px');
		$("#popUpAlertaddnote").css ('left','526px');
		$("#popUpAlertaddnote").css ('top','192px'); */
	}
	
	function editNote(){
		/* $("#editnote").show();	
		$("#addnote, #deletenote").hide();	
		$("#popUpAlertaddnote").css ('height','450px');
		$("#popUpAlertaddnote").css ('width','650px');
		$("#popUpAlertaddnote").css ('left','353px');
		$("#popUpAlertaddnote").css ('top','110px'); */
	}
	
	
	$(document).ready(function () {
		//called when key is pressed in textbox
			$("#startAgeRange").keypress(function (e) {
		    //if the letter is not digit then display error and don't type anything
		    	if (e.which != 8 && e.which != 0 && (e.which < 48 || e.which > 57)) {
		        //display error message
		        	$("#errmsg").html("Please enter digits Only").show().fadeOut(2500);
		            return false;
		    	}
		   	});
		  	$("#endAgeRange").keypress(function (e) {
			//if the letter is not digit then display error and don't type anything
				if (e.which != 8 && e.which != 0 && (e.which < 48 || e.which > 57)) {
			    //display error message
			    	$("#errmsg").html("Please enter digits Only").show().fadeOut(2500);
			        return false;
			    }
			});
		  	
		  	$("#endAgeRange").change(function(){
		  		 
		  		var start = document.getElementById('startAgeRange').value;
				var end = document.getElementById('endAgeRange').value;
				var prodid = $('#masterProductId').val();
				//alert(start + ": " + end);
				if(end-start < 0){
			    		$("#errmsg").html("End age range should be greater than start age range").show().fadeOut(2500);
		    			document.getElementById('endAgeRange').value = "";
		    			$('#endAgeRange').focus();
		    			return false;
		     	} else {
		     		//check not overlapping
		     		/* $.ajax({
						type :'GET',
						url : $('#contextPath').val()+"/product/checkStartAgeRange.htm?startAge="+start+"&prodId="+prodid,
						success : function(result){
							if(result>0){
								alert('Start age range already exist');
								document.getElementById('startAgeRange').value="";
			    				document.getElementById('endAgeRange').value="";
			    				$('#startAgeRange').focus();
							} else{
								//set focus to next input box
								$('#sumAssuredAmount').focus();
							}
			               	
				  		}
					}); */
		     	}
				return true;
		  });

		  	
		  	
		  	$('#sumAssuredAmount').keypress(function (event) {
		  	    if ((event.which != 46 || $(this).val().indexOf('.') != -1) && (event.which < 48 || event.which > 57)) {
		  	        event.preventDefault();
		  	      $("#errmsg1").html("Please enter digits Only").show().fadeOut(2500);
		  	    }

		  	    var text = $(this).val();

		  	    if ((text.indexOf('.') != -1) && (text.substring(text.indexOf('.')).length > 2)) {
		  	        event.preventDefault();
		  	      $("#errmsg1").html("You can enter only two digits after decimal").show().fadeOut(2500);
		  	    }
		  	});
		  	
		  
		  	$("#policyPaymentTerm").keypress(function (e) {
			//if the letter is not digit then display error and don't allow to  type anything
				if (e.which != 8 && e.which != 0 && (e.which < 48 || e.which > 57)) {
			    	//display error message
			        $("#errmsg2").html("Please enter digits Only").show().fadeOut(2500);
			        	return false;
			    	}
			     	$('#policyPaymentTerm').keyup(
        				function() {
            				var value = document.getElementById('policyPaymentTerm').value;
            				if(value <= 0){
       				    		$("#errmsg2").html("Please enter value greater than zero").show().fadeOut(2500);
   				    			document.getElementById('policyPaymentTerm').value = "";
   				    			return false;
   				     		}
        			});
				});
		  	
		  	$('#premiumAmount').keypress(function (event) {
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
		  	
		  	
		  	$('#inclChild').click(function(){
		  		if (this.checked) {
		  			
		  			var cn = document.getElementById("childCount").value;
		  			if(cn==0){
		  				document.getElementById("childCount").value = "";
		  			}
		            $('#autoUpdate').fadeIn('slow');
		        }
		        else {
		            $('#autoUpdate').fadeOut('slow');
		        } 
		    });
		  	
		  	/* $("#childCount").keypress(function (e) {
		    	if(event.which < 46 || event.which > 59) {
       				event.preventDefault();
        			$("#errmsg4").html("Please enter digits Only").show().fadeOut(2500);
    			} // prevent if not number/dot
				/* if(event.which == 46 && $(this).val().indexOf('.') != -1) {
        			event.preventDefault();
    			} */
			//}); */
			$("#childCount").keypress(function (e) {
			    //if the letter is not digit then display error and don't type anything
			    	if (e.which != 8 && e.which != 0 && (e.which < 48 || e.which > 57)) {
			        //display error message
			        	$("#errmsg4").html("Please enter digits Only").show().fadeOut(2500);
			            return false;
			    	}
			    
			    	$('#childCount').keyup(
            				function() {
                				var value = document.getElementById('childCount').value;
                				if(value <= 0){
	       				    		$("#errmsg4").html("Please enter value greater than zero").show().fadeOut(2500);
       				    			document.getElementById('childCount').value = "";
       				    			return false;
       				     		}
            			});
			   	});
		});

</script>

<script type="text/javascript">

var grid_data=${premiumMasterList};
 
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
			//plusicon : "ace-icon fa fa-plus center bigger-110 blue",
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
		height:300,
		ignoreCase: true,

		colNames:[' ','Start Age','End Age','Sum Assured','Policy Payment Term','Spouse','Children Covered','Premium Amount','Default ?'],
		colModel:[     
		     
		     {name:'productPremiumId',index:'productPremiumId',formatter:function(cellvalue, options,rowObject) {
				return '<a href="#" onclick="showButtons(1);updatePremiumMaster('+rowObject.productPremiumId+',\''+rowObject.startAgeRange+'\',\''+rowObject.endAgeRange+'\',\''+rowObject.sumAssuredAmount+'\',\''+rowObject.policyPaymentTerm+'\',\''+rowObject.premiumAmount+'\',\''+rowObject.spouse+'\',\''+rowObject.child+'\',\''+rowObject.isDefault+'\');" id="'+rowObject.productPriceId+'"><img src="<%=request.getContextPath()%>/images/edit.png" alt="Edit" title="Edit"></a>';
			}},  
			     
			{name:'startAgeRange',index:'startAgeRange'},
			{name:'endAgeRange',index:'endAgeRange'},
			{name:'sumAssuredAmount',index:'sumAssuredAmount'},
			{name:'policyPaymentTerm',index:'policyPaymentTerm'},
			
			{name:'spouseName', index:'spouseName'},
				
				/* ,formatter:function(cellvalue, options,rowObject) {
     	  	    
			    if(rowObject.spouse > 0)          
			    	return '<span >'+"Yes"+'</span>';
			    else
			    	return '<span >'+"NO"+'</span>';  
			         
			}}, */
			{name:'childCover', index:'childCover'},
				/* ,formatter:function(cellvalue, options,rowObject) {
     	  	    
			    if(rowObject.child > 0)          
			    	return '<span >'+"Yes -0"+rowObject.child+'</span>';
			    if(rowObject.child <= 0 ) 
			    	return '<span >'+"NO"+'</span>';  
			        
			}},  */
			{name:'premiumAmount',index:'premiumAmount'},
			{name:'defaultValue', index:'defaultValue'},
					/* ,formatter:function(cellvalue, options,rowObject) {
     	  	    
			    if(rowObject.isDefault == true)          
			    	return '<span >'+"Yes"+'</span>';
			    else 
			    	return '<span >'+"NO"+'</span>';  
			        
			}},  */
			  
		],   
		
		
		viewrecords : true,
		rowNum:10, 
		rowList:[10,20,50,100,1000],
		pager : pager_selector,
		altRows: true,
		//toppager: true,
		//multiselect: true, 
		//multikey: "ctrlKey",
        multiboxonly: true,
    	//height:"auto",
		
    	
    	loadComplete : function() {
			var table = this;
			setTimeout(function(){
				styleCheckbox(table);
				if($('#selectAll').attr('id')==undefined)
				$('#jqgh_grid-table_checkbox').before('<br/><input  type="checkbox" id="selectAll">');
				updateActionIcons(table);
				updatePagerIcons(table);
				enableTooltips(table);
				$('#selectAll').click(function(event) {  //on click 
			        if(this.checked) { // check select status
			            $('.cbox').each(function(i,obj) { //loop through each checkbox
			                this.checked = true;  //select all checkboxes with class   "checkbox1"    
						$(obj).attr('checked','checked');
			            });
			        }else{
			            $('.cbox').each(function(i,obj) { //loop through each checkbox
			                this.checked = false; //deselect all checkboxes with class "checkbox1"
			            	$(obj).removeAttr('checked');
			            });         
			        }
			        $('#selectAll').checked = true;
			    });
				
			}, 0); 
			
		}, 

		editurl: "/dummy.html",//nothing is saved
		//caption: "jqGrid with inline editing"

		autowidth: true,
        //shrinkToFit:false,	


		 

	});
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
			/**
			multipleGroup:true,
			showQuery: true
			*/
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
	/**
		$(table).find('input:checkbox').addClass('ace')
		.wrap('<label />')
		.after('<span class="lbl align-top" />')


		$('.ui-jqgrid-labels th[id*="_cb"]:first-child')
		.find('input.cbox[type=checkbox]').addClass('ace')
		.wrap('<label />').after('<span class="lbl align-top" />');
	*/
	}
	

	//unlike navButtons icons, action icons in rows seem to be hard-coded
	//you can change them like this in here if you want
	function updateActionIcons(table) {
		/**
		var replacement = 
		{
			'ui-ace-icon fa fa-pencil' : 'ace-icon fa fa-pencil blue',
			'ui-ace-icon fa fa-trash-o' : 'ace-icon fa fa-trash-o red',
			'ui-icon-disk' : 'ace-icon fa fa-check green',
			'ui-icon-cancel' : 'ace-icon fa fa-times red'
		};
		$(table).find('.ui-pg-div span.ui-icon').each(function(){
			var icon = $(this);
			var $class = $.trim(icon.attr('class').replace('ui-icon', ''));
			if($class in replacement) icon.attr('class', 'ui-icon '+replacement[$class]);
		})
		*/
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

	//var selr = jQuery(grid_selector).jqGrid('getGridParam','selrow');

	$(document).one('ajaxloadstart.page', function(e) {
		$(grid_selector).jqGrid('GridUnload');
		$('.ui-jqdialog').remove();
		
	});
});
 
$(document).ready(function() {
	var d = new Date();
	var month = d.getMonth()+1;
	var day = d.getDate();
	/* var output = (day<10 ? '0' : '') + day + '/' +
				(month<10 ? '0' : '') + month + '/' +
				d.getFullYear(); */
	 var output = d.getFullYear() + '-' +
	 			  (month<10 ? '0' : '') + month + '-' +			
	 			  (day<10 ? '0' : '') + day;
					
	//alert(output);			
	$("#priceDateId").val(output);
	
 	$("#priceDateId").datepicker({
    	showOn: 'button',
    	//minDate : '0',
    	buttonText: 'Show date',
    	buttonImageOnly: true,
    	buttonImage: '../images/calendar.gif',
    	dateFormat: 'yy-mm-dd',
    	constrainInput: true,
    	
    	onSelect: function(selected){
    		$(this).datepicker('hide');
		        checkPrice();
		      }
	});

 	
 	/* $("#priceValue").keypress(function (event) {
		//if the letter is not digit then display error and don't type anything
			if(event.which < 46 || event.which > 59) {
    			event.preventDefault();
    			$("#errmsg").html("Please enter digits Only").show().fadeOut("slow");
			} // prevent if not number/dot
			if(event.which == 46 && $(this).val().indexOf('.') != -1) {
	   			event.preventDefault();
			}
	}); */
	

 	$('#priceValue').keypress(function (event) {
  	    if ((event.which != 46 || $(this).val().indexOf('.') != -1) && (event.which < 48 || event.which > 57)) {
  	        event.preventDefault();
  	      $("#errmsg").html("Please enter digits Only").show().fadeOut(2500);
  	    }

  	    var text = $(this).val();

  	    if ((text.indexOf('.') != -1) && (text.substring(text.indexOf('.')).length > 4)) {
  	        event.preventDefault();
  	      $("#errmsg").html("You can enter only four digits after decimal").show().fadeOut(2500);
  	    }
  	});
 	
 	
	//check already price is present for date
	 /* $("#priceValue").change(function(){
		 
		 checkPrice();	
		}); */

	
		
});//ready function end here  

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
	    
} ;   

</script>


</body>
</html>