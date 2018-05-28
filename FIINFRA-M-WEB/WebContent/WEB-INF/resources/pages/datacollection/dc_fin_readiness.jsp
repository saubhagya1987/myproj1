<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="x" uri="http://java.sun.com/jsp/jstl/xml" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>

<style>
.thumb_select_ul .categoery .newthumb { height:100%; width:100%; text-align:center; line-height: 97px; }
</style>

<style>
#confirmDialog {
 display: block;
 height: 130px;
 display: none;
 width: 355px;
 box-shadow: 0 0 15px 1px #757575;
}

#page_loader{
	background: #fff url(${pageContext.request.contextPath}/resources/images/loader.gif) no-repeat center center;
}
</style>


<script>
$(window).load(function(){
	  $('#page_loader').fadeOut("5000");
});
	function displayNewScreen(){
		$("#frmAssumption").attr('action','${pageContext.request.contextPath}/whatIf/whatIfAnalysis/fr');
		$("#frmAssumption").attr('method','post');
		$("#frmAssumption").submit();
	}
</script>

<div id="emergency_readiness">
  <!-- Main starts-->
  <section class="main"> 
	<section class="content common_content"> 
	<div id="page_loader"></div>
	<jsp:include page="../layout/dc_submenu.jsp"></jsp:include>
    <c:choose>	
	<c:when test="${planType == 'BASIC'}">							
		<a href="#" onclick="displayNewScreen();" id="asset_allocation" class="fr asset_allocation_btn cfsGoalReadinessAssetAllocationLink">Asset Allocation</a>
	</c:when>
	<c:otherwise>
		<a href="${pageContext.request.contextPath}/assets/assetSummary/${partyId}" class="fr asset_allocation_btn cfsGoalReadinessAssetAllocationLink">Detailed Asset Allocation</a>
	</c:otherwise>
	</c:choose>
  	<!-- advive adssumption starts--> 
  	<form class="form-horizontal" id="frmAssumption" name="frmAssumption" >
  	<input type="hidden" id="initialData" name="initialData" value="" />
  	<input type="hidden" name="partyId" value="${partyId}"/> 
  	<input type="hidden" name="redirectUrl" value="/partner/datacollection/financial-readiness/${partyId}"/>
    <input type="hidden" name="fromWhatIf" id="fromWhatIf" value="<%if(request.getParameter("fromWhatIf")!=null && request.getParameter("fromWhatIf").equals("yes")){%><%=request.getParameter("fromWhatIf")%><%}else{%>no<%}%>"/>
    
    <div id="dialog1" class="common_dialog" style="text-align: center;"> </div>
    <div class="common_ad_ass_selector">
      <ul class="clearfix reset">
        <li>
          <p>Advice Assumptions</p>
        </li>
      </ul>
      <div class="Advice_Assump_Menu">
		  <ul class="clearfix reset">
		    <li class="clearfix">
		      <label class="form_label">Estimated Life Expectancy</label>
		      <div class="range_parent">
		        <div class="scale clearfix">
		          <div class="scale_range"><span class="low extrem">70</span><span class="high extrem">100</span></div>
		          <div id="98021"></div>
		          <div class="counter_parent">
		            <input type="text" id="98021_payment" name="98021_payment" class="range_counter Number required" />
		            <span class="unit">yrs</span> </div>
		        </div>
		      </div>
		    </li>
		    <li class="clearfix"> <a class="cancel">CANCEL</a><a class="save">SAVE</a></li>
		  </ul>
		</div>
    </div>
   
    <div class="clr"></div>
    <c:forEach items="${adviceAssumptions}" var="assumption">		
			<c:choose>
				<c:when test="${assumption.assumptionCodeId eq '98021' or assumption.assumptionCodeId eq '98046' or assumption.assumptionCodeId eq '98019' or assumption.assumptionCodeId eq '98001'}">				
					<script>
						createSlider('#${assumption.assumptionCodeId}', ${assumption.valueStartRange}, ${assumption.valueEndRange}, 1, '#${assumption.assumptionCodeId}_payment');
						$('#${assumption.assumptionCodeId}').slider( "option", "value", ${assumption.assumptionValue});
						$('#${assumption.assumptionCodeId}_payment').val(${assumption.assumptionValue});
					</script>
				</c:when>
			</c:choose>
		</c:forEach>

    </form>
    <!-- advive adssumption ends--> 
      <!-- Common_in_contnet starts-->
      <form class="form-horizontal" id="frmEmergencyReadiness" name="frmEmergencyReadiness" action="<c:url value="/partner/datacollection/save" />" method="POST">
      <input type="hidden" name="partyId" id="partyId" value="${partyId}" />
      <input type="hidden" name="redirectUrl" id="redirectUrl" value="<%if(request.getParameter("fromWhatIf")!=null && request.getParameter("fromWhatIf").equals("yes")){%>/whatIf/graph/${partyId}<%}else{%>${redirectUrl}<%}%>" />
      <input type="hidden" name="fromWhatIf" id="fromWhatIf" value="<%if(request.getParameter("fromWhatIf")!=null && request.getParameter("fromWhatIf").equals("yes")){%><%=request.getParameter("fromWhatIf")%><%}else{%>no<%}%>"/>
      <x:parse xml="${sectionData}" var="output"/>
	
		<c:set var="questionTypeMap" value=""/>
      	<section class="in_content common_in_content clearfix">
        	<ul class="reset clearfix" id="emergency_readiness_ul">
        	<x:forEach select="$output/Section/Question" var="item">
        	
			<c:set var="questionTypeMapTemp"><x:out select="$item/@AttributeCodeId" escapeXml="false"/>:<x:out select="$item/@QuestionType" escapeXml="false"/> </c:set>
			<c:set var="questionTypeMap" value="${questionTypeMap};${questionTypeMapTemp}" />        	
        	
        	<c:set var="isHidden" value=""/>
        	<x:if select="$item/@ParentQuestionId != '0'">
        		<c:set var="isHidden" value="style=display:none"/>
        	</x:if>
        	        	        	
			<li id="confidence_scale" class="clearfix" <c:out value="${isHidden}" /> >	            
               	<x:choose>
               		<x:when select="$item/@QuestionType = '85009'">
               		<div class="<x:out select="$item/@cssClass" />">
	              		<p><x:out select="QuestionText" /></p>
	            	</div>
                		<div class="ques_action clearfix">
              				<div class="range_parent emer_confidence">
                				<div class="fl scale clearfix">
		                		<div class="scale_range"> <span class="low extrem"><x:out select="$item/Scale/Min_Value" /></span> <span class="high extrem"><x:out select="$item/Scale/Max_Value" /></span>
		                    		<div class="mark"><br /></div>
		                    		<div id="div_<x:out select="$item/@AttributeCodeId" />"></div>		                    		
		                  		</div>
		                  		<div class="counter_parent">
		                    		<input type="text" readonly id="<x:out select="$item/@AttributeCodeId" />" name="name_<x:out select="$item/@AttributeCodeId" />" value="" class="range_counter answer">
		                  		</div>
		                  		<script>
		                  			var temp = '<x:out select="$item/@AttributeCodeId" />';
		                  			createSlider("#div_" + temp, <x:out select="$item/Scale/Min_Value" />, <x:out select="$item/Scale/Max_Value" />, <x:out select="$item/Scale/Increment" />, "#" + temp);
		                  		</script>
		                  		
		                  		<c:set var="sliderOptionRange" value=""/>
		                  		<x:forEach select="$item/Options/Option" var="optionElement">
		                  			<c:set var="sliderOptionTemp"> <x:out select="$optionElement/@AttributeCodeID" escapeXml="false"/>:<x:out select="$optionElement" escapeXml="false"/> </c:set>
		                  			<c:set var="sliderOptionRange" value="${sliderOptionRange};${sliderOptionTemp}"/>
		                  		</x:forEach>
		                  	
		                  		<input type="hidden" id="sld_<x:out select="$item/@AttributeCodeId" />" name="<x:out select="$item/@AttributeCodeId" />" value="<c:out value="${sliderOptionRange}" />"  />                    
		                  	</div>
		                  </div>
		                </div>
		                <div class="clr"></div>		
               		</x:when>
                			 
               		<x:when select="$item/@QuestionType = '85010'">
               		<div class="<x:out select="$item/@cssClass" />">
	              		<p><x:out select="QuestionText" /></p>
	            	</div>
                		<div class="ques_action clearfix">
             				<div class="range_parent emer_confidence">
                				<div class="fl scale clearfix">
			                		<div class="scale_range"> <span class="low extrem"><x:out select="$item/Scale/Min_Value" /></span> <span class="high extrem"><x:out select="$item/Scale/Max_Value" /></span>
			                    		<div class="mark"><br /></div>
			                    		<div id="div_<x:out select="$item/@AttributeCodeId" />"></div>		                    		
			                  		</div>
			                  		<div class="counter_parent">
			                    		<input type="text" readonly id="<x:out select="$item/@AttributeCodeId" />" name="name_<x:out select="$item/@AttributeCodeId" />" value="" class="range_counter freeform answer">
			                  		</div>
			                  		<script>
			                  			var temp = '<x:out select="$item/@AttributeCodeId" />';
			                  			createSlider("#div_" + temp, <x:out select="$item/Scale/Min_Value" />, <x:out select="$item/Scale/Max_Value" />, <x:out select="$item/Scale/Increment" />, "#" + temp);
			                  		</script>
			                  		
			                  		<input type="hidden" id="sld_<x:out select="$item/@AttributeCodeId" />" name="<x:out select="$item/@AttributeCodeId" />" value=""  />                    
	                  			</div>
		                  </div>
	                	</div>
	                	<div class="clr"></div>	
               		</x:when>
                		              	
               		<x:when select="$item/@QuestionType = '85002'">
               		<div class="<x:out select="$item/@cssClass" />">
	              		<p><x:out select="QuestionText" /></p>
	            	</div>
               			<div class="ques_action clearfix northspace4">
             				<div class="range_parent emer_confidence">
	                			<div class="fl scale clearfix">
	                			<div id="emergency_situation">
					                <div class="toggle m_top_20" id="div_<x:out select="$item/@AttributeCodeId" />"></div>
					                <input type="hidden" id="<x:out select="$item/@AttributeCodeId" />" name="<x:out select="$item/@AttributeCodeId" />" value=""  class="toggelCtrl answer" />					                
					             </div>
					             <script>
					             $('.toggle').toggles();
					             	$("#div_<x:out select="$item/@AttributeCodeId" />").on('toggle', function (e, active) {
					          	    	if (active) {					          	    		
						          		  	$("#<x:out select="$item/@AttributeCodeId" />").val('<x:out select="$item/Options/Option[1]/@AttributeCodeId" />' + '_' + '<x:out select="$item/Options/Option[1]/@Value" />');
						          	    } else { 	    
						          		   	$("#<x:out select="$item/@AttributeCodeId" />").val('<x:out select="$item/Options/Option[2]/@AttributeCodeId" />' + '_' + '<x:out select="$item/Options/Option[2]/@Value" />');
						          	    }					          	    
					          		});
					             </script>
					             </div>
		                  	</div>
		                </div>
		                <div class="clr"></div>
                	</x:when>
                			                	
               		<x:when select="$item/@QuestionType = '85006'">
               		<div class="<x:out select="$item/@cssClass" />">
	              		<p><x:out select="QuestionText" /></p>
	            	</div>            			
               			<div class="ques_action-checkbox northspace4">
               				<ul>
                				<x:forEach select="$item/Options/Option" var="optionElement">	                						                			
			                		<li class="benfit_type">
				                		<a href="#">
				                			<div id="div_<x:out select="$optionElement/@AttributeCodeID" />" class="chekbox_parent"><span class="white_checkbox"></span>					                  			
				                    			<div class="newthumb" style="background: url(${pageContext.request.contextPath}/resources/images/<x:out select='$optionElement/@ImgDefault' />) no-repeat center center;"></div>
				                  				<input type="checkbox" id="<x:out select="$optionElement/@AttributeCodeID" />" name="<x:out select="$item/@AttributeCodeId" />" value="" class="default_checkbox answer"/>
				                  			</div>					                  			
				                  			<span class="r-p-chkboxes1"><x:out select="$optionElement" /></span>
				                  		</a>
				                  	</li>
			                  	</x:forEach>
			                  </ul>
						</div>
						<div class="clr"></div>						
               		</x:when>               		
               		<x:when select="$item/@QuestionType = '85005'">
               			<div class="F_R_box">
               			<div class="box_right">
          					<ul class="clearfix">
          						<li>
          							<x:if select="$item/@ShowImage != 'FALSE'">	
	          							<div class="icon">			                        	                    
				                    	</div>
			                    	</x:if>
			                    	<div class="ques_txt6">
										<label><x:out select="QuestionText" /></label>		                			
			            			</div>
          						</li> 					
               				<x:forEach select="$item/Options/Option" var="optionElement">	                						                			
		                		<li>
		                			<x:if select="$item/@ShowImage != 'FALSE'">							        									        
				                    	<div class="icon">
				                        	<ul class="reset clearfix thumb_select_ul emergency_categoery_ul">
				                            	<li class="fl"><a href="#">
				                                	<div class="categoery job not_applicable">
				                                    	<div class="newthumb"style="background: url(${pageContext.request.contextPath}/resources/images/<x:out select='$optionElement/@ImgDefault' />) no-repeat center center;"/></div>
				                                    </div>
				                                    <label class="label"><x:out select="$optionElement" /></label>
													</a>
												</li>
				                             </ul>                    	
				                        </div><!-- end of "icon" -->
			                        </x:if>
			                        <div class="value-spinner">
			                			<input id="<x:out select="$optionElement/@AttributeCodeID" />" name="<x:out select="$item/@AttributeCodeId" />" value="0" class="spinner spinner85005 answer Number">
			                			<script>
										 	$("#<x:out select="$optionElement/@AttributeCodeID" />").spinner({ min: <x:out select="$item/Min_Value" />, max: <x:out select="$item/Max_Value" />});
										 	$("#<x:out select="$optionElement/@AttributeCodeID" />").spinner().spinner("enable"); 	
										</script>
			            			</div>			                                         
			                    </li>
		                  	</x:forEach>
							<li class="asset_unit"><div class=""> <select id="select_<x:out select="$item/@AttributeCodeId" />" class="miniselect">
					         <option>K</option>
					         <option>Lac</option>
					         <option>Cr</option>				              
				         </select></div></li>
		                  </ul>
		                
						 </div>
		                 </div>
		                 
								
               		</x:when>
                </x:choose>	             
          </li>
       	</x:forEach> 
       	<div id="bottom">
          	<div class="total-asset-value">
            	<span>Total Assets Value</span><div id="sum_94145" class="total-value">0</div><span class="unit dynamic"><div class="amountScale1" >lac</div></span>
            </div><!-- End of "total-asset-value" -->
            <div class="total-asset-value">
            	<span>Total Monthly Investment</span><div id="sum_94146" class="total-value">0</div><span class="unit dynamic"><div class="amountScale2" >k</div></span>
            </div><!-- End of "total-asset-value" -->
          </div><!-- End of "Bottom" -->     	
        </ul>
        
		<input type="hidden" name="questionBankId" id="questionBankId" value="${questionBankId}"  />
        <input type="hidden" name="sectionTypeId" id="sectionTypeId" value="${sectionTypeId}" />
        <input type="hidden" name="inputData" id="inputData" value="" />
        <input type="hidden" name="nextPageUrl" id="nextPageUrl"/>
      </section>
      	<!-- Common_in_contnet ends --> 
      	<!-- Common footer starts -->
			<section class="common_footer_actions">
				<div id="main_actions" class="clearfix">
					<ul class="reset clearfix fr btn_grup3">
						<li class="fl list"><a href="#" class="anch save saveCfsGoalReadinessLink" ><span class="txt">Save</span></a></li>
						<li class="fl list"><a href="#" onclick="checkData('<%if(request.getParameter("fromWhatIf")!=null && request.getParameter("fromWhatIf").equals("yes")){%>${pageContext.request.contextPath}/whatIf/graph/${partyId}<%}else{%>${pageContext.request.contextPath}/partner/datacollection/${partyId}/<%=request.getSession().getAttribute("headerName")%>/2<%}%>');" class="anch cancel"><span class="txt">Cancel</span></a></li>
						<li class="fl list"><a href="${pageContext.request.contextPath}${nextPageUrl}" class="anch skip <%if(request.getParameter("fromWhatIf")!=null && request.getParameter("fromWhatIf").equals("yes")){%>inactiveLink<%}%>"><span class="txt">Skip</span></a></li>
					</ul>
					<ul class="reset clearfix fr btn_grup2">
						<li class="fl list"><a href="#" onclick="uploadNote(${partyId},'/partner/datacollection/financial-readiness/${partyId}');" class="anch add_note <%if(request.getParameter("fromWhatIf")!=null && request.getParameter("fromWhatIf").equals("yes")){%>inactiveLink<%}%>"><span class="txt">Notes</span></a></li>						
						<li class="fl list"><a href="#" onclick="uploadDocument(${partyId},'/partner/datacollection/financial-readiness/${partyId}');" class="anch add_doc <%if(request.getParameter("fromWhatIf")!=null && request.getParameter("fromWhatIf").equals("yes")){%>inactiveLink<%}%>"><span class="txt">Documents</span></a></li>
					</ul>
					<ul class="reset clearfix fl btn_grup1">
						<li class="fl list inactiveLink"><a href="#" class="anch analysis cfsGoalReadinessAnalysisLink"><span class="txt">Analysis</span></a></li>
						<li class="fl list inactiveLink"><a href="#" class="anch suggeset cfsGoalReadinessSuggesstionLink"><span class="txt">Suggestion</span></a></li>
						<li class="fl list inactiveLink"><a href="#" class="anch action_plan"><span class="txt">Action Plan</span></a></li>
					</ul>
				</div>
				<a href="#" onclick="checkData('${pageContext.request.contextPath}${previousPageUrl}');" class="back navgation <%if(request.getParameter("fromWhatIf")!=null && request.getParameter("fromWhatIf").equals("yes")){%>inactiveLink<%}%>"><span class="txt">Back</span></a>
				<a href="#" onclick="doSubmitOnNext()" <%-- onclick="checkData('${pageContext.request.contextPath}${nextPageUrl}');" --%> class="next navgation <%if(request.getParameter("fromWhatIf")!=null && request.getParameter("fromWhatIf").equals("yes")){%>inactiveLink<%}%>" ><span class="txt">Next</span></a>
			</section>
		
		 	<c:set var="questionTypeMapArr" value="${fn:split(questionTypeMap, ';')}"/>
		 	<script>
			$('#select_94145').val('Lac');
			$(".amountScale1").html("lac");
			</script>
			<!-- Iterate Already Set Data from questionDetails Map -->		 							
			<c:forEach items="${questionTypeMapArr}" var="questionTypeMapArrVals" begin="0">				
				<c:set var="questionTypeEle" value="${fn:split(questionTypeMapArrVals, ':')}"/>				
				<c:forEach items="${questionDetails}" var="questDetail">		
					<c:set var="tempQuestionId" value="${fn:split(questDetail.questionId, '_')}"/>
					
					<c:if test="${tempQuestionId[0] eq questionTypeEle[0]}">
						<c:choose>
							<c:when test="${questionTypeEle[1] eq '85009'}">
								<script>
									$('#div_${questDetail.questionId}').slider( "option", "value", ${questDetail.attributeRefferenceValue});
									$('#${questDetail.questionId}').val(${questDetail.attributeRefferenceValue});
								</script>
							</c:when>
							<c:when test="${questionTypeEle[1] eq '85010'}">
								<script>
									$('#div_${questDetail.questionId}').slider( "option", "value", ${questDetail.attributeRefferenceValue});
									$('#${questDetail.questionId}').val(${questDetail.attributeRefferenceValue});
								</script>
							</c:when>
							<c:when test="${questionTypeEle[1] eq '85002'}">
								<script>
 									$('#${questDetail.questionId}').val(${questDetail.attributeValue} + "_" + ${questDetail.attributeRefferenceValue});
									if(${questDetail.attributeRefferenceValue} == 1){
										$('#div_${questDetail.questionId}').toggles({on:true});
									} else {
										$('#div_${questDetail.questionId}').toggles({on:false});
									}
								</script>
							</c:when>
							<c:when test="${questionTypeEle[1] eq '85005'}">							
								<script>
// 								
								var amount = 0;
								var amountIn = 0;
								/* $(".amountScale1").html("lacs");
								$(".amountScale2").html("lacs"); */
								/* $('#select_94145').val('Lac');
								$('#select_94146').val('Lac'); */
								if(${questDetail.attributeRefferenceValue} != 0){
								/* 	$(".dynamic").text("lacs");
			 						$(".lacs").addClass("unit_selected");
									amountIn = ${questDetail.attributeRefferenceValue} / 100000;	
									$('#${questDetail.attributeValue}').spinner().val(amountIn);
								*/
								var attCodeID = ${questDetail.attributeCodeId};
								var amountScale=0;
								var tempVar = '${questDetail.questionId}';
								tempVar = tempVar.toString();

								if(tempVar.indexOf("_")!=-1) {
									 amountIn =  '${tempQuestionId[1]}';
							 		 amountIn  = parseFloat(amountIn);
									 amountScale ='${questDetail.attributeRefferenceValue}'/amountIn;
									 attCodeID = '${questDetail.attributeCodeId}';
								}
								else {
									if(attCodeID == 94145) {
										amountIn = '${questDetail.attributeRefferenceValue}'/100000;
										amountScale = 100000;
									}
									else if(attCodeID == 94146) {
										amountIn = '${questDetail.attributeRefferenceValue}'/1000;
										amountScale = 1000;
									}
								}
								/*amountIn =  '${tempQuestionId[1]}';
								 amountScale ='${questDetail.attributeRefferenceValue}'/'${tempQuestionId[1]}';
								 attCodeID = '${questDetail.attributeCodeId}';*/
								if(attCodeID == 94145) {
									if(amountScale == 1000){
										$('#select_94145').val('K');
										$('#${questDetail.attributeValue}').spinner().val(amountIn);
										$(".amountScale1").html("k");
									} else {								
										if(amountScale == 100000){
											$('#select_94145').val('Lac');
											$('#${questDetail.attributeValue}').spinner().val(amountIn);
											$(".amountScale1").html("lac");
										} else {										
											$('#select_94145').val('Cr');		
											$('#${questDetail.attributeValue}').spinner().val(amountIn);
											$(".amountScale1").html("cr");
										}
									}
								}
								else {
									if(amountScale == 1000){
										$('#select_94146').val('K');
										$('#${questDetail.attributeValue}').spinner().val(amountIn);
										$(".amountScale2").html("k");
									} else {								
										if(amountScale == 100000){
											$('#select_94146').val('Lac');
											$('#${questDetail.attributeValue}').spinner().val(amountIn);
											$(".amountScale2").html("lac");
										} else {										
											$('#select_94146').val('Cr');		
											$('#${questDetail.attributeValue}').spinner().val(amountIn);
											$(".amountScale2").html("cr");
										}
									}
								}
								} else {
									$('#${questDetail.attributeValue}').spinner().val(0);
								}
																
								
								</script>
							</c:when>
							<c:when test="${questionTypeEle[1] eq '85006'}">							
								<script>
									$('#div_${questDetail.attributeValue}').children("span").addClass("red_custom_checkbox_checked");
		 							$('#${questDetail.attributeValue}').val(${questDetail.attributeValue});
								</script>
							</c:when>
							<c:otherwise></c:otherwise>
						</c:choose>
					</c:if>
				</c:forEach>			
			</c:forEach>
			
		 	<!-- Aniket -->
			<c:set var="arrayAllocation" value="" />
			<c:forEach items="${questionDetails}" var="questDetailAllo" varStatus="counter" >
				<c:set var="allocationTemp" value="${fn:split(questDetailAllo.questionId, '_')}" />
				<c:if test="${allocationTemp[0] eq '94227'}">
					<c:set var="allocationDetails" value="${questDetailAllo}" />
					<c:choose>
						<c:when test="${fn:length(arrayAllocation) eq 0}">
							<c:set var="arrayAllocation" value="${allocationDetails.attributeValue},${allocationDetails.attributeRefferenceValue}" />
						</c:when>
						<c:otherwise>
							<c:set var="arrayAllocation">${arrayAllocation}_${allocationDetails.attributeValue},${allocationDetails.attributeRefferenceValue}</c:set>
						</c:otherwise>
					</c:choose>
				</c:if>
			</c:forEach>
			
			<%-- <c:out value="${arrayAllocation}" /> --%>
			<input type="hidden" id="arrayAllocation" name="arrayAllocation" value="${arrayAllocation}" />
			
			<div id="confirmDialog" class="common_custom_modal_aa">
  				<span class="close">X</span>
  				<div class="modal_content"> 
    				<div class="aa_up">
        				<spring:message code="deleteRecord" /></div>
         			<div class="aa_down"> <a style="cursor:pointer;" class="aa_yes">Yes </a> 
         			<a style="cursor:pointer;" onclick="closeDialog();" class="aa_no">No</a> </div>
  				</div>
			</div>
		</form>
      	<!-- Common footer ends -->
		
    	</section>
	</section>
  <!-- Main ends--> 
</div>
<!-- Wrapper ends--> 
<script>
 //assumption pop
// createSlider('#advice_assump_fr',70,100,1,'#advice_assump_fr_payment');

$(".Advice_Assump_Menu .save").click(function(){
	if($("#frmAssumption").validate().form()!=false){
	var url = '${pageContext.request.contextPath}/partner/datacollection/assumption/save';
	var updatedAssumptionData = "98021:" + $("#98021_payment").val(); 
	$.ajax({
		type : "POST",
		url : url,
		data : {
			updatedAssumptions : updatedAssumptionData,
			clientId : ${partyId}
		},
		dataType : "HTML",
		success : function(msg) {
			if(msg != ''){
				$("#successDialog").html(msg);
				$( "#successDialog").dialog( "open" );
			}
		},
		error : function(msg) {
			$('.result').html(msg);
		}
	});
	}else
	{
		$("$Advice_Assump_Menu").fadeIn();
	}
	
});

var inputData="";
$("#main_actions .save").click(function() {
	inputData="";
	getData();
	var initialData=$("#initialData").val();
	if(initialData==inputData){
		alertMessage("You haven't changed any data yet.Please make some changes and then save.");
		return false;
	}else{
		$("#inputData").val(inputData);
		$("#frmEmergencyReadiness").submit();	
	}
});

function getData()
{
	
	var assets;
	/* alert(assets); */
	var assetsOptions;
	/* alert(assetsOptions); */
	var questionArray = [];
	var valueArray = [];
	var tempArray;
	var amountAsset;
	inputData = "<Root>";
	$("#frmEmergencyReadiness").find(".answer").each(function (index) {		
		if($(this).val() != ""){
			var questAttId = $( this ).attr("id");
			
			if($(this).hasClass("range_counter")){				
				var rangeValues = $('#sld_' + questAttId).val().split(';');
				var optAttId;
				var temp=1;
				while(temp < rangeValues.length){
					if(rangeValues[temp].split(':')[1] == $(this).val()){
						var optAttId = rangeValues[temp].split(':')[0];
						break;
					}
					temp++;
				}
				
				if(optAttId != undefined){
					inputData = inputData + "<Question>";
					inputData = inputData + "<QuestionId>" + questAttId + "</QuestionId>";
					inputData = inputData + "<QuestionOptionId>" + optAttId +"</QuestionOptionId>";
					inputData = inputData + "<AttributeCodeID>" + questAttId + "</AttributeCodeID>"; // clear no change require
					inputData = inputData + "<Value>" + $(this).val() + "</Value>";			
					inputData = inputData + "</Question>";	
				}
			} else if ($(this).hasClass("default_checkbox")){
				var optAttId = $( this ).attr("id");
				var questAttId = $( this ).attr("name");
				inputData = inputData + "<Question>";
				inputData = inputData + "<QuestionId>" + questAttId + "</QuestionId>";
				inputData = inputData + "<QuestionOptionId>" + optAttId +"</QuestionOptionId>";
				inputData = inputData + "<AttributeCodeID>" + questAttId + "</AttributeCodeID>"; // clear no change require
				inputData = inputData + "<Value></Value>";			
				inputData = inputData + "</Question>";
			} else if($(this).hasClass("toggelCtrl")){
				
				inputData = inputData + "<Question>";
				inputData = inputData + "<QuestionId>" + questAttId + "</QuestionId>";
				inputData = inputData + "<QuestionOptionId>" + $(this).val().split('_')[0] +"</QuestionOptionId>";
				inputData = inputData + "<AttributeCodeID>" + questAttId + "</AttributeCodeID>"; // clear no change require
				inputData = inputData + "<Value>" + $(this).val().split('_')[1] + "</Value>";			
				inputData = inputData + "</Question>";
				
			} else {
				var optAttId = $( this ).attr("id");
				var questAttId = $( this ).attr("name");
				var amount = $(this).val();

				/* if($(".k").hasClass("unit_selected")) {
					amount = amount * 1000;
				} else if($(".lacs").hasClass("unit_selected")) {
			    	amount = amount * 100000;
				} else if($(".cr").hasClass("unit_selected")) {
					amount = amount * 10000000;
				} */
				
				if(questAttId == 94145) {
					if($('#select_94145').val() == 'K') {
						amount = amount * 1000;
					}
					else if($('#select_94145').val() == 'Lac') {
						amount = amount * 100000;
					}
					else if($('#select_94145').val() == 'Cr') {
						amount = amount * 10000000;
					}
				}
				else if(questAttId == 94146) {
					if($('#select_94146').val() == 'K') {
						amount = amount * 1000;
					}
					else if($('#select_94146').val() == 'Lac') {
						amount = amount * 100000;
					}
					else if($('#select_94146').val() == 'Cr') {
						amount = amount * 10000000;
					}
				}
				
				inputData = inputData + "<Question>";
				inputData = inputData + "<QuestionId>" + questAttId + "_" +  $(this).val() + "</QuestionId>";
				inputData = inputData + "<QuestionOptionId>" + optAttId +"</QuestionOptionId>";
				inputData = inputData + "<AttributeCodeID>" + questAttId + "</AttributeCodeID>"; // clear no change require
				inputData = inputData + "<Value>" + amount + "</Value>";
				inputData = inputData + "</Question>";
				
			}
			assets = $("#arrayAllocation").val();
			assetsOptions = $("#arrayAllocation").val().split("_");
			
			for( var i = 0; i < assetsOptions.length; i++ ){
				tempArray = assetsOptions[i].split(",");
				questionArray[i] = tempArray[0];
				valueArray[questionArray[i]] = tempArray[1];
			}
			
			var optAttId = $(this).attr("id");
			
			var amount = $("#"+optAttId).val();
			
			if( optAttId == '94027' ){
				amountAsset = parseInt(optAttId)+7;
				amountAsset = $("#"+amountAsset).val();
				if( amount > 0 || amountAsset > 0 ){
					if( valueArray[(parseInt(optAttId)+7)] > 0 ){
						inputData = inputData + "<Question>";
						inputData = inputData + "<QuestionId>94227</QuestionId>";
						inputData = inputData + "<QuestionOptionId>" + (parseInt(optAttId)+7) +"</QuestionOptionId>";
						inputData = inputData + "<AttributeCodeID>94227</AttributeCodeID>"; // clear no change requireOptionValue
						inputData = inputData + "<Value>" + valueArray[(parseInt(optAttId)+7)] + "</Value>";
						inputData = inputData + "</Question>";
					}else{
						inputData = inputData + "<Question>";
						inputData = inputData + "<QuestionId>94227</QuestionId>";
						inputData = inputData + "<QuestionOptionId>" + (parseInt(optAttId)+7) +"</QuestionOptionId>";
						inputData = inputData + "<AttributeCodeID>94227</AttributeCodeID>"; // clear no change require
						inputData = inputData + "<Value>" + 100.00 + "</Value>";
						inputData = inputData + "</Question>";
					}
				}else{
					inputData = inputData + "<Question>";
					inputData = inputData + "<QuestionId>94227</QuestionId>";
					inputData = inputData + "<QuestionOptionId>" + (parseInt(optAttId)+7) +"</QuestionOptionId>";
					inputData = inputData + "<AttributeCodeID>94227</AttributeCodeID>"; // clear no change require
					inputData = inputData + "<Value>" + '' + "</Value>";
					inputData = inputData + "</Question>";
				}
			}
			if( optAttId == '94028' ){
				amountAsset = parseInt(optAttId)+7;
				amountAsset = $("#"+amountAsset).val();
				if( amount > 0 || amountAsset > 0 ){
					if( valueArray[(parseInt(optAttId)+7)] > 0 ){
						inputData = inputData + "<Question>";
						inputData = inputData + "<QuestionId>94227</QuestionId>";
						inputData = inputData + "<QuestionOptionId>" + (parseInt(optAttId)+7) +"</QuestionOptionId>";
						inputData = inputData + "<AttributeCodeID>94227</AttributeCodeID>"; // clear no change require
						inputData = inputData + "<Value>" + valueArray[(parseInt(optAttId)+7)] + "</Value>";
						inputData = inputData + "</Question>";
					}else{
						inputData = inputData + "<Question>";
						inputData = inputData + "<QuestionId>94227</QuestionId>";
						inputData = inputData + "<QuestionOptionId>" + (parseInt(optAttId)+7) +"</QuestionOptionId>";
						inputData = inputData + "<AttributeCodeID>94227</AttributeCodeID>"; // clear no change require
						inputData = inputData + "<Value>" + 100.00 + "</Value>";
						inputData = inputData + "</Question>";
					}
				}else{
					inputData = inputData + "<Question>";
					inputData = inputData + "<QuestionId>94227</QuestionId>";
					inputData = inputData + "<QuestionOptionId>" + (parseInt(optAttId)+7) +"</QuestionOptionId>";
					inputData = inputData + "<AttributeCodeID>94227</AttributeCodeID>"; // clear no change require
					inputData = inputData + "<Value>" + '' + "</Value>";
					inputData = inputData + "</Question>";
				}
			}
			if( optAttId == '94029'){
				amountAsset = parseInt(optAttId)+7;
				amountAsset = $("#"+amountAsset).val();
				if( amount > 0 || amountAsset > 0 ){
					if( valueArray[(parseInt(optAttId)+7)] > 0 ){
						inputData = inputData + "<Question>";
						inputData = inputData + "<QuestionId>94227</QuestionId>";
						inputData = inputData + "<QuestionOptionId>" + (parseInt(optAttId)+7) +"</QuestionOptionId>";
						inputData = inputData + "<AttributeCodeID>94227</AttributeCodeID>"; // clear no change require
						inputData = inputData + "<Value>" + valueArray[(parseInt(optAttId)+7)] + "</Value>";
						inputData = inputData + "</Question>";
					}else{
						inputData = inputData + "<Question>";
						inputData = inputData + "<QuestionId>94227</QuestionId>";
						inputData = inputData + "<QuestionOptionId>" + (parseInt(optAttId)+7) +"</QuestionOptionId>";
						inputData = inputData + "<AttributeCodeID>94227</AttributeCodeID>"; // clear no change require
						inputData = inputData + "<Value>" + 100.00 + "</Value>";
						inputData = inputData + "</Question>";
					}
				}else{
					inputData = inputData + "<Question>";
					inputData = inputData + "<QuestionId>94227</QuestionId>";
					inputData = inputData + "<QuestionOptionId>" + (parseInt(optAttId)+7) +"</QuestionOptionId>";
					inputData = inputData + "<AttributeCodeID>94227</AttributeCodeID>"; // clear no change require
					inputData = inputData + "<Value>" + '' + "</Value>";
					inputData = inputData + "</Question>";
				}
			}
			if( optAttId == '94030' ){
				amountAsset = parseInt(optAttId)+7;
				amountAsset = $("#"+amountAsset).val();
				if( amount > 0 || amountAsset > 0 ){
					if( valueArray[(parseInt(optAttId)+7)] > 0 ){
						inputData = inputData + "<Question>";
						inputData = inputData + "<QuestionId>94227</QuestionId>";
						inputData = inputData + "<QuestionOptionId>" + (parseInt(optAttId)+7) +"</QuestionOptionId>";
						inputData = inputData + "<AttributeCodeID>94227</AttributeCodeID>"; // clear no change require
						inputData = inputData + "<Value>" + valueArray[(parseInt(optAttId)+7)] + "</Value>";
						inputData = inputData + "</Question>";
					}else{
						inputData = inputData + "<Question>";
						inputData = inputData + "<QuestionId>94227</QuestionId>";
						inputData = inputData + "<QuestionOptionId>" + (parseInt(optAttId)+7) +"</QuestionOptionId>";
						inputData = inputData + "<AttributeCodeID>94227</AttributeCodeID>"; // clear no change require
						inputData = inputData + "<Value>" + 100.00 + "</Value>";
						inputData = inputData + "</Question>";
					}
				}else{
					inputData = inputData + "<Question>";
					inputData = inputData + "<QuestionId>94227</QuestionId>";
					inputData = inputData + "<QuestionOptionId>" + (parseInt(optAttId)+7) +"</QuestionOptionId>";
					inputData = inputData + "<AttributeCodeID>94227</AttributeCodeID>"; // clear no change require
					inputData = inputData + "<Value>" + '' + "</Value>";
					inputData = inputData + "</Question>";
				}
			}
			if( optAttId == '94031'){
				amountAsset = parseInt(optAttId)+7;
				amountAsset = $("#"+amountAsset).val();
				if( amount > 0 || amountAsset > 0 ){
					if( valueArray[(parseInt(optAttId)+7)] > 0 ){
						inputData = inputData + "<Question>";
						inputData = inputData + "<QuestionId>94227</QuestionId>";
						inputData = inputData + "<QuestionOptionId>" + (parseInt(optAttId)+7) +"</QuestionOptionId>";
						inputData = inputData + "<AttributeCodeID>94227</AttributeCodeID>"; // clear no change require
						inputData = inputData + "<Value>" + valueArray[(parseInt(optAttId)+7)] + "</Value>";
						inputData = inputData + "</Question>";
					}else{
						inputData = inputData + "<Question>";
						inputData = inputData + "<QuestionId>94227</QuestionId>";
						inputData = inputData + "<QuestionOptionId>" + (parseInt(optAttId)+7) +"</QuestionOptionId>";
						inputData = inputData + "<AttributeCodeID>94227</AttributeCodeID>"; // clear no change require
						inputData = inputData + "<Value>" + 100.00 + "</Value>";
						inputData = inputData + "</Question>";
					}
				}else{
					inputData = inputData + "<Question>";
					inputData = inputData + "<QuestionId>94227</QuestionId>";
					inputData = inputData + "<QuestionOptionId>" + (parseInt(optAttId)+7) +"</QuestionOptionId>";
					inputData = inputData + "<AttributeCodeID>94227</AttributeCodeID>"; // clear no change require
					inputData = inputData + "<Value>" + '' + "</Value>";
					inputData = inputData + "</Question>";
				}
			}
			if( optAttId == '94032' ){
				amountAsset = parseInt(optAttId)+7;
				amountAsset = $("#"+amountAsset).val();
				if( amount > 0 || amountAsset > 0 ){
					if( valueArray[(parseInt(optAttId)+7)] > 0 ){
						inputData = inputData + "<Question>";
						inputData = inputData + "<QuestionId>94227</QuestionId>";
						inputData = inputData + "<QuestionOptionId>" + (parseInt(optAttId)+7) +"</QuestionOptionId>";
						inputData = inputData + "<AttributeCodeID>94227</AttributeCodeID>"; // clear no change require
						inputData = inputData + "<Value>" + valueArray[(parseInt(optAttId)+7)] + "</Value>";
						inputData = inputData + "</Question>";
					}else{
						inputData = inputData + "<Question>";
						inputData = inputData + "<QuestionId>94227</QuestionId>";
						inputData = inputData + "<QuestionOptionId>" + (parseInt(optAttId)+7) +"</QuestionOptionId>";
						inputData = inputData + "<AttributeCodeID>94227</AttributeCodeID>"; // clear no change require
						inputData = inputData + "<Value>" + 100.00 + "</Value>";
						inputData = inputData + "</Question>";
					}
				}else{
					inputData = inputData + "<Question>";
					inputData = inputData + "<QuestionId>94227</QuestionId>";
					inputData = inputData + "<QuestionOptionId>" + (parseInt(optAttId)+7) +"</QuestionOptionId>";
					inputData = inputData + "<AttributeCodeID>94227</AttributeCodeID>"; // clear no change require
					inputData = inputData + "<Value>" + '' + "</Value>";
					inputData = inputData + "</Question>";
				}
			}
			if( optAttId == '94033' ){
				amountAsset = parseInt(optAttId)+7;
				amountAsset = $("#"+amountAsset).val();
				if( amount > 0 || amountAsset > 0 ){
					if( valueArray[(parseInt(optAttId)+7)] > 0 ){
						inputData = inputData + "<Question>";
						inputData = inputData + "<QuestionId>94227</QuestionId>";
						inputData = inputData + "<QuestionOptionId>" + (parseInt(optAttId)+7) +"</QuestionOptionId>";
						inputData = inputData + "<AttributeCodeID>94227</AttributeCodeID>"; // clear no change require
						inputData = inputData + "<Value>" + valueArray[(parseInt(optAttId)+7)] + "</Value>";
						inputData = inputData + "</Question>";
					}else{
						inputData = inputData + "<Question>";
						inputData = inputData + "<QuestionId>94227</QuestionId>";
						inputData = inputData + "<QuestionOptionId>" + (parseInt(optAttId)+7) +"</QuestionOptionId>";
						inputData = inputData + "<AttributeCodeID>94227</AttributeCodeID>"; // clear no change require
						inputData = inputData + "<Value>" + 100.00 + "</Value>";
						inputData = inputData + "</Question>";
					}
				}else{
					inputData = inputData + "<Question>";
					inputData = inputData + "<QuestionId>94227</QuestionId>";
					inputData = inputData + "<QuestionOptionId>" + (parseInt(optAttId)+7) +"</QuestionOptionId>";
					inputData = inputData + "<AttributeCodeID>94227</AttributeCodeID>"; // clear no change require
					inputData = inputData + "<Value>" + '' + "</Value>";
					inputData = inputData + "</Question>";
				}
			}
		}
	});	
	
	
	inputData = inputData + "</Root>";
}

function checkData(url){
 	getData();
 	var initialData=$("#initialData").val();
 	if(initialData==inputData){
 		 window.location.href=url;
 	}else{
 		$(".aa_up").html("<spring:message code='dataChanged' />");
		$(".aa_yes").click(function(){cancelPage(url)});	
		$(".overlay").fadeIn();
		$("#confirmDialog").fadeIn();
 	}
}

function cancelPage(url)
{
	window.location.href=url;
}

function closeDialog(){
	$(".overlay").fadeOut("slow");
	$("#confirmDialog").fadeOut("slow");
}

$(document).ready(function(){
	
	var rbsLinks = "${rbsLinks}";
	var pieces = rbsLinks.split(",");
	if(pieces != ""){
		for(var i=0;i<pieces.length;i++){
			if(pieces[i]=="saveCfsGoalReadinessLink"){
				$("frmEmergencyReadiness").attr("action","#");
			}
			$("."+pieces[i]).attr("href","#");
			$("."+pieces[i]).addClass("inactiveLink");
			$("."+pieces[i]).removeAttr("onclick");
		}		
	}
	
	$("#frmAssumption").validate();
    $("#98021_payment").rules("add", {min:70,max:100});
    
    var planType = '${planType}';																	
	if(planType == 'ADVANCED') {									
		$(".value-spinner").addClass("inactiveLink");
		$("#select_94145").addClass("inactiveLink");
		$("#select_94146").addClass("inactiveLink");
			
	}
	
	 $("select").selectBoxIt();
	 $(".asset_unit:first").addClass("goal_asset_unit");
	$('.common_in_content').slimScroll();
    $('.wrapper').attr('id', 'dc_screens');
    $('.wrapper').addClass('finacial_readiness');
    var buttons = $( "#dialog1" ).dialog( "option", "buttons" );
	// setter
	$("#dialog1").dialog("option", "buttons", [{
	   text: "Ok",
	   click: function () {
		   $(this).dialog('close');
	   }
	}]);
	$(document).on("dialogopen", "#dialog1", function(event, ui) {
		setTimeout("$('#dialog1').dialog('close')",3000);
	});
	
    $(".ui-spinner-button").click(function(){
		var currentVal = 0;
		var selectedEle = $(this).siblings("input").attr("name");
		$(".box_right").find("input[name='"+selectedEle+"']").each(function (index, ele){
			currentVal = currentVal + parseFloat(ele.value);			
		});
		$("#sum_" + selectedEle).html(currentVal.toFixed(2));		
	});		
	
	$(".spinner85005").change(function(ele1){
		var currentVal = 0;
		var changedEleId = ele1.target.name;
		$(".spinner85005").each(function (index, ele){
			if(changedEleId == ele.name){
				if(!isNaN(parseFloat(ele.value))) {
					currentVal = currentVal + parseFloat(ele.value);
				}
			}						
		});
		
		$("#sum_" + $(this).attr('name')).html(currentVal.toFixed(2));
	});
	
	
	$("#select_94145").change(function(ele1){
		if($("#select_94145").val() == 'K') {
			$(".amountScale1").html("k");
		} else if($("#select_94145").val() == 'Lac') {
			$(".amountScale1").html("lac");
		} else if($("#select_94145").val() == 'Cr') {
			$(".amountScale1").html("cr");
		}
	});
	
	$("#select_94146").change(function(ele1){
		if($("#select_94146").val() == 'K') {
			$(".amountScale2").html("k");
		} else if($("#select_94146").val() == 'Lac') {
			$(".amountScale2").html("lac");
		} else if($("#select_94146").val() == 'Cr') {
			$(".amountScale2").html("cr");
		}
	});
	
	$(".white_checkbox").click(function(){
		$(this).toggleClass("red_custom_checkbox_checked");
	 	if($(this).siblings(".default_checkbox").val() == ""){
	 		$(this).siblings(".default_checkbox").val($(this).siblings(".default_checkbox").attr("name")); 		   
		} else {
	 		$(this).siblings(".default_checkbox").val("");
		}
	});
 	
	$('.Number').bind('keypress', function (evt) {
	    var charCode = (evt.which) ? evt.which : event.keyCode;
	    if (charCode > 31 && (charCode != 46 &&(charCode<48 || charCode>57)))
	        return false;
	    return true;
	});
	
	var currentVal = 0;
	$('[name="94145"]').each(function (index, ele){			
		currentVal = currentVal + parseFloat(ele.value);				
	});		
	$("#sum_94145").html(currentVal.toFixed(2));
	
	var currentVal2 = 0;
	$('[name="94146"]').each(function (index, ele){			
		currentVal2 = currentVal2 + parseFloat(ele.value);				
	});		
	$("#sum_94146").html(currentVal2.toFixed(2));
	
	
	if(currentVal != 0 || currentVal2 != 0) {
		$("#asset_allocation").removeClass("inactiveLink");
	} else {
		$("#asset_allocation").addClass("inactiveLink");
	}
	
	
//  	$(".thumb_select_ul a").click(function(){
//  	   $(this).children(".categoery").toggleClass("not_applicable");
//  	   if($(this).children(".categoery").find(".answer").val() == ""){
//  		  $(this).children(".categoery").find(".answer").val($(this).children(".categoery").find(".answer").attr("name")); 		   
//  	   } else {
//  		  $(this).children(".categoery").find(".answer").val("");
//  	   }
//  	});
	getData();
	  $("#initialData").val(inputData);
	  
	 $("#confirmDialog .close").click(function(){
       $(".overlay").fadeOut("slow");
    $("#confirmDialog").fadeOut("slow");
     });	

	 $(function() {

			$(document).ajaxStop(function() {
				 $('#page_loader').fadeOut();
			});

			$(document).ajaxStart(function() {
				 $('#page_loader').fadeIn();
			});

		});			
});

function alertMessage(msg)
{
	$("#dialog1").html(msg);
	$( "#dialog1").dialog( "open" );
}



</script> 
<div class="overlay"></div>
</body>
