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
</script>
<div id="emergency_readiness">
  <!-- Main starts-->
  <section class="main"> 
	<section class="content common_content"> 
	<%-- <jsp:include page="../layout/dc_submenu.jsp"></jsp:include> --%>
  	<!-- advice assumption starts-->
  		<form class="form-horizontal" id="frmAssumption" name="frmAssumption" > 
	    <input type="hidden" id="initialData" name="initialData" value="" />
	  
	    <div id="page_loader"></div>
	     <div id="dialog1" class="common_dialog" style="text-align: center;"> </div>
	    <div class="common_ad_ass_selector selector_noline">
	      <ul class="clearfix reset selector">
	        <li class="select">
	          <p>Advice Assumptions</p>
	        </li>
	      </ul>
	      
	      <div class="Advice_Assump_Menu">
	  		<ul class="clearfix reset Advice_Assump_Menu_In" >
	  			<li class="clearfix">
	              <label class="form_label">Estimated Life Expectancy</label>
	              <div class="range_parent">
	                <div class="scale clearfix">
	                  <div class="scale_range"><span class="low extrem">70</span><span class="high extrem">100</span></div>
	                  <div id="98021"></div>
	                  <div class="counter_parent_new">
	                    <input type="text" id="98021_payment" name="98021_payment" class="range_counter Number required" />
	                    <span class="unit">yrs</span> </div>
	                </div>
	              </div>
	            </li>
			    <li class="clearfix">
			      <label class="form_label">Health Insurance cover amount</label>
			      <div class="range_parent">
			        <div class="scale clearfix">
			          <div class="scale_range"><span class="low extrem">1</span><span class="high extrem">20</span></div>
			          <div id="98046"></div>
			          <div class="counter_parent_new rupee">
			            <input type="text" id="98046_payment" name="98046_payment" class="range_counter Number required" />
			            <span class="unit dynamic assumScale">lacs</span></div>
			        </div>
			      </div>
			    </li>
			    <li class="clearfix">
			      <label class="form_label">Critical Illness Insurance cover amount (XX times monthly income)</label>
			      <div class="range_parent">
			        <div class="scale clearfix">
			          <div class="scale_range"><span class="low extrem">6</span><span class="high extrem">60</span></div>
			          <div id="98019"></div>
			          <div class="counter_parent_new">
			            <input type="text" id="98019_payment" name="98019_payment" class="range_counter Number required"/>
			            <span class="unit">months</span> </div>
			        </div>
			      </div>
			    </li>
			    <li class="clearfix">
			      <label class="form_label">Accident Disability Insurance cover amount (XX times monthly income)</label>
			      <div class="range_parent">
			        <div class="scale clearfix">
			          <div class="scale_range"><span class="low extrem">6</span><span class="high extrem">60</span></div>
			          <div id="98001"></div>
			          <div class="counter_parent_new">
			            <input type="text" id="98001_payment" name="98001_payment" class="range_counter Number required" />
			            <span class="unit">months</span> </div>
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
						if("${assumption.assumptionCodeId}" == 98046) {
							createSlider('#${assumption.assumptionCodeId}', ${(assumption.valueStartRange) }, ${(assumption.valueEndRange) }, 1, '#${assumption.assumptionCodeId}_payment');
							$('#${assumption.assumptionCodeId}').slider( "option", "value", ${(assumption.assumptionValue)});
							$('#${assumption.assumptionCodeId}_payment').val(${(assumption.assumptionValue) });
						}
						else {
							createSlider('#${assumption.assumptionCodeId}', ${assumption.valueStartRange}, ${assumption.valueEndRange}, 1, '#${assumption.assumptionCodeId}_payment');
							$('#${assumption.assumptionCodeId}').slider( "option", "value", ${assumption.assumptionValue});
							$('#${assumption.assumptionCodeId}_payment').val(${assumption.assumptionValue});	
						}
					</script>
				</c:when>
			</c:choose>
		</c:forEach>

    </form>
    <!-- advice assumption ends-->
     
      <!-- Common_in_contnet starts-->
      <form class="form-horizontal" id="frmEmergencyReadiness" name="frmEmergencyReadiness" action="<c:url value="/partner/datacollection/save" />" method="POST">
      <input type="hidden" name="partyId" id="partyId" value="${partyId}" />
      <input type="hidden" name="redirectUrl" id="redirectUrl" value="${redirectUrl}" />
      
		<x:parse xml="${sectionData}" var="output"/>
	
		<c:set var="questionTypeMap" value=""/>
      	<section class="in_content common_in_content clearfix">
        	<ul class="reset clearfix" id="emergency_readiness_ul">
        	<c:set var="displayOnSameLine" value="FALSE"/>
        	<c:set var="displayOnSameLine85002" value="FALSE"/>
        	
        	<x:forEach select="$output/Section/Question" var="item" varStatus="counter">
        	
			<c:set var="questionTypeMapTemp"><x:out select="$item/@AttributeCodeId" escapeXml="false"/>:<x:out select="$item/@QuestionType" escapeXml="false"/> </c:set>
			<c:set var="questionTypeMap" value="${questionTypeMap};${questionTypeMapTemp}" />        	
        	
        	<c:set var="isHidden" value=""/>
        	<x:if select="$item/@ParentQuestionId != '0'">
<%--         		<c:set var="isHidden" value="style=display:none"/> --%>
        	</x:if>
        	
            <x:choose>
            	<x:when select="$item/@QuestionType = '85009'">
               		<li id="confidence_scale" class="clearfix rel" <c:out value="${isHidden}" /> >
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
		                    		<input type="text"  id="<x:out select="$item/@AttributeCodeId" />" name="name_<x:out select="$item/@AttributeCodeId" />" value="" class="range_counter answer Number">
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
	            	</li>
               	</x:when>
               	
               	<x:when select="$item/@QuestionType = '85002'">
               	
             		<li class="clearfix" <c:out value="${isHidden}" /> >	  
	               		<div class="<x:out select="$item/@cssClass" />">
				        	<p><x:out select="QuestionText" /></p>
				        </div>				        
				               			
				        <div class="clearfix">
				            <div class="ques_action2 emer_confidence northspace4">
				            	<div class="fl scale clearfix">
			               			<div id="emergency_situation">
						                <div class="toggle" id="div_<x:out select="$item/@AttributeCodeId" />"></div>
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
	            	</li>
               		
               		<x:if select="$item/ShowNextQuestionInBelow = 'TRUE'">
               			<div class="bg-box" id="bg-box_<x:out select="$item/@AttributeCodeId" />" >
               			<c:set var="displayOnSameLine85002" value="TRUE"/>
               		</x:if>  		
               	</x:when>
               			
               	<x:when select="$item/@QuestionType = '85006'">
               		<li class="clearfix" <c:out value="${isHidden}" /> >
	               		<div class="<x:out select="$item/@cssClass" />">
				        	<p><x:out select="QuestionText" /></p>
				        </div>
	             		<ul class="reset clearfix thumb_select_ul" style="width:52%">             			
	             			<x:forEach select="$item/Options/Option" var="optionElement">	                						                			
		                	<li class="fl">
			            		<a href="#">
			            		
			            			<div id="div_<x:out select="$optionElement/@AttributeCodeID" />" class="categoery">
			            				<input type="hidden" id="<x:out select="$optionElement/@AttributeCodeID" />" name="<x:out select="$item/@AttributeCodeId" />" value="" class="answer"/>
			            				<div class="newthumb" style="background: url(${pageContext.request.contextPath}/resources/images/<x:out select='$optionElement/@ImgDefault' />) no-repeat center center;"></div>
			            			</div>
			                		<label class="label"><x:out select="$optionElement" /></label>
			               		</a>
			               	</li>
	                  		</x:forEach>
	                  	</ul>	            	       
                  	</li>
                  	
                  	<c:if test="${displayOnSameLine85002 eq 'TRUE' }" >
                  		</div>
                  		<c:set var="displayOnSameLine85002" value="FALSE"/>
                  	</c:if>
              	</x:when> 
              	 
               	<x:when select="$item/@QuestionType = '85010'">
               		<x:choose>               		
               			<x:when select="$item/@ParentQuestionId = '0'" >
	               			<li id="confidence_scale" class="clearfix rel"  >	  
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
					                    		<input type="text"  id="<x:out select="$item/@AttributeCodeId" />" name="name_<x:out select="$item/@AttributeCodeId" />" value="" class="range_counter freeform answer Number">
					                  			<span class="unit dynamic_<x:out select="$item/@AttributeCodeId" />">lacs</span>
					                  		</div>
					                  		<script>
					                  			var temp = '<x:out select="$item/@AttributeCodeId" />';
					                  			createSlider("#div_" + temp, <x:out select="$item/Scale/Min_Value" />, <x:out select="$item/Scale/Max_Value" />, <x:out select="$item/Scale/Increment" />, "#" + temp);
					                  		</script>
					                  		
					                  		<input type="hidden" id="sld_<x:out select="$item/@AttributeCodeId" />" name="<x:out select="$item/@AttributeCodeId" />" value=""  />                    
			                  			</div>
			                  		</div>
		                  		</div>
	                  		</li>
               			</x:when>
               			<x:when select="$item/ShowNextQuestionInGroup = 'TRUE'" >
	               			<li id="confidence_scale" class="clearfix rel" <c:out value="${isHidden}" /> >	  
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
					                    		<input type="text"  id="<x:out select="$item/@AttributeCodeId" />" name="name_<x:out select="$item/@AttributeCodeId" />" value="" class="range_counter freeform answer Number">
					                  			<!--<span class="unit dynamic_<x:out select="$item/@AttributeCodeId" />">lacs</span>-->
					                  		</div>
					                  		<script>
					                  			var temp = '<x:out select="$item/@AttributeCodeId" />';
					                  			createSlider("#div_" + temp, <x:out select="$item/Scale/Min_Value" />, <x:out select="$item/Scale/Max_Value" />, <x:out select="$item/Scale/Increment" />, "#" + temp);
					                  		</script>
					                  		<select id="select_<x:out select="$item/@AttributeCodeId" />" class="miniselect" onchange="changeScale(id)">
					         <option>K</option>
					         <option selected>Lac</option>
					         <option>Cr</option>				              
				    </select>
					                  		<input type="hidden" id="sld_<x:out select="$item/@AttributeCodeId" />" name="<x:out select="$item/@AttributeCodeId" />" value=""  />                    
			                  			</div>
			                  		</div>
		                  		</div>
	                  		</li>
               			</x:when>
               			<x:otherwise>
               				<div class="dynamic_div fl" id="parentDiv_<x:out select="$item/@AttributeCodeId" />">
               				<li class="third" <c:out value="${isHidden}" /> >
               					<p><x:out select="QuestionText" /></p>
               					
               				</li>
               				<li class="forth rel" <c:out value="${isHidden}" /> >
               					<div class="range_parent emer_confidence">
			                		<div class="fl scale clearfix">
				                		<div class="scale_range"> <span class="low extrem"><x:out select="$item/Scale/Min_Value" /></span> <span class="high extrem"><x:out select="$item/Scale/Max_Value" /></span>
				                    		<div class="mark"><br /></div>
				                    		<div id="div_<x:out select="$item/@AttributeCodeId" />"></div>		                    		
				                  		</div>
				                  		<div class="counter_parent">
				                    		<input type="text"  id="<x:out select="$item/@AttributeCodeId" />" name="name_<x:out select="$item/@AttributeCodeId" />" value="" class="range_counter freeform answer Number">
				                    		<!--<span class="unit dynamic_<x:out select="$item/@AttributeCodeId" />">lacs</span>-->
				                  		</div>
				                  		<script>
				                  			var temp = '<x:out select="$item/@AttributeCodeId" />';
				                  			createSlider("#div_" + temp, <x:out select="$item/Scale/Min_Value" />, <x:out select="$item/Scale/Max_Value" />, <x:out select="$item/Scale/Increment" />, "#" + temp);
				                  		</script>
				                  		
				                  		<input type="hidden" id="sld_<x:out select="$item/@AttributeCodeId" />" name="<x:out select="$item/@AttributeCodeId" />" value=""  />  
                                        <select id="select_<x:out select="$item/@AttributeCodeId" />" class="miniselect" onchange="changeScale(id)">
					         <option>K</option>
					         <option selected>Lac</option>
					         <option>Cr</option>				              
				    </select>                  
		                  			</div>
		                  		</div>
               				</li>
               				</div>
							<x:choose>	              		
		              			<x:when select="$item/ShowNextQuestionInFront = 'TRUE' ">
		              				<c:set var="displayOnSameLine" value="TRUE"/>
		              			</x:when>
		              			<x:otherwise>
		              				</ul>		            				
              						<c:set var="displayOnSameLine" value="FALSE"/>              		
		              			</x:otherwise>	              		
		              		</x:choose>
		              		
               			</x:otherwise>
               		</x:choose>
               		
               	</x:when>
               		              	
               	<x:when select="$item/@QuestionType = '85018'">
               		 <ul class="reset clearfix bottom_question">
               		 	<li class="first">
			              <p><x:out select="QuestionText" /></p>
						</li>
						<li class="second">
			            	<div class="clearfix">
	              				<div class="emer_confidence">
		                			<div class="fl scale clearfix">
				               			<div id="emergency_situation">
							                <div class="toggle" id="div_<x:out select="$item/@AttributeCodeId" />"></div>
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
					    </li>					    					   
            	</x:when>       			                
              	
              	<x:when select="$item/@QuestionType = '85019'">
               		<li class="clearfix" <c:out value="${isHidden}" />>	  
               		<div class="<x:out select="$item/@cssClass" />">
			        	<p><x:out select="QuestionText" /></p>
			        </div>
			        
			        <div class="select_members">
			        	<select id="health_insurance" multiple class="answer select">
				        	<c:forEach items="${relationshipIds}" var="relationShipInfo" begin="0">
				        		<c:if test="${relationShipInfo.name ne null}" >
				        			<option value="${relationShipInfo.id}">${relationShipInfo.name}</option>
				        		</c:if>				              				             
			              </c:forEach>
		            	</select>   
	           		</div>	            	       
                  	</li>
                  	
                  	<c:if test="${displayOnSameLine85002 eq 'TRUE' }" >
                  		</div>
                  		<c:set var="displayOnSameLine85002" value="FALSE"/>
                  	</c:if>
              	</x:when>
            	   	             		
              </x:choose>
                     
       	</x:forEach>       	
        </ul>
        
		<input type="hidden" name="questionBankId" id="questionBankId" value="${questionBankId}"  />
        <input type="hidden" name="sectionTypeId" id="sectionTypeId" value="${sectionTypeId}" />
        <input type="hidden" name="inputData" id="inputData" value="" />
        <input type="hidden" name="nextPageUrl" id="nextPageUrl"/>
        
      </section>
      
      <c:set var="isDataSaved" value="inactiveLink"></c:set>
      <c:if test="${fn:length(questionDetails) gt 0}">
      	<c:set var="isDataSaved" value=""></c:set>
      </c:if>
      	<!-- Common_in_contnet ends --> 
      	<!-- Common footer starts -->
		<section class="common_footer_actions">
			<div id="main_actions" class="clearfix">
				<ul class="reset clearfix fr btn_grup3">
					<li class="fl list"><a href="#" class="anch save saveCfsRiskCoverLink" ><span class="txt">Save</span></a></li>
					<li class="fl list"><a href="#" onclick="checkData('${pageContext.request.contextPath}/partner/datacollection/${partyId}/<%=request.getSession().getAttribute("headerName")%>/2');" class="anch cancel"><span class="txt">Cancel</span></a></li>
					<li class="fl list"><a href="${pageContext.request.contextPath}${nextPageUrl}" class="anch skip"><span class="txt">Skip</span></a></li>
				</ul>
				<ul class="reset clearfix fr btn_grup2">
					<li class="fl list"><a href="#" onclick="uploadNote(${partyId},'/partner/datacollection/risk-cover/${partyId}');" class="anch add_note"><span class="txt">Notes</span></a></li>					
					<li class="fl list"><a href="#" onclick="uploadDocument(${partyId},'/partner/datacollection/risk-cover/${partyId}');" class="anch add_doc"><span class="txt">Documents</span></a></li>
				</ul>
				<ul class="reset clearfix fl btn_grup1">
					<li class="fl list ${isDataSaved}"><a href="#" onclick="checkData('${pageContext.request.contextPath}/partner/datacollection/risk-cover-analysis/${partyId}');" class="anch analysis cfsRiskCoverAnalysisLink"><span class="txt">Analysis</span></a></li>
					<li class="fl list ${isDataSaved}"><a href="#" onclick="checkData('${pageContext.request.contextPath}/partner/datacollection/suggestion/risk-cover/${partyId}');" class="anch suggeset cfsRiskCoverSuggesstionLink"><span class="txt">Suggestion</span></a></li>
					<li class="fl list ${isDataSaved}"><a href="#" onclick="checkData('${pageContext.request.contextPath}/actionplan/risk-cover-action-plan/${partyId}');" class="anch action_plan riskCoverActionPlanLink"><span class="txt">Action Plan</span></a></li>
				</ul>
			</div>
			<a href="#" onclick="checkData('${pageContext.request.contextPath}${previousPageUrl}');" class="back navgation"><span class="txt">Back</span></a>
			<a href="#" onclick="doSubmitOnNext()" class="next navgation" ><span class="txt">Next</span></a>
		</section>
	
	<script>
		// reset all the controls on the page	
		$("#bg-box_94013").fadeOut();
 		$(".thumb_select_ul .categoery").removeClass("not_applicable");
	 	$(".thumb_select_ul .categoery").find(".answer").val("");
		$("#div_94018").slider( "option", "value", 0);
		$("#94018").val(0);
	
		$("#bg-box_94020").fadeOut(); 	    	
		$("#div_94019").slider( "option", "value", 0);
		$("#94019").val(0);
	
		$("#parentDiv_94024").fadeOut(); 	    	
		$("#div_94024").slider( "option", "value", 0);
		$("#94024").val(0);
		
		$("#parentDiv_94107").fadeOut(); 	    	
		$("#div_94107").slider( "option", "value", 0);
		$("#94107").val(0);
		
		$("#parentDiv_94226").fadeOut(); 	    	
		$("#div_94226").slider( "option", "value", 0);
		$("#94226").val(0);
		
	</script>
	 	<c:set var="questionTypeMapArr" value="${fn:split(questionTypeMap, ';')}"/>
		<!-- Iterate Already Set Data from questionDetails Map -->
		<c:forEach items="${questionTypeMapArr}" var="questionTypeMapArrVals" begin="0">
			<c:set var="questionTypeEle" value="${fn:split(questionTypeMapArrVals, ':')}"/>
			<c:forEach items="${questionDetails}" var="questDetail">
				<c:if test="${questDetail.questionId eq questionTypeEle[0]}">
					<c:choose>
						<c:when test="${questionTypeEle[1] eq '85009'}">
							<script>
								$('#div_${questDetail.questionId}').slider( "option", "value", ${questDetail.attributeRefferenceValue});
								$('#${questDetail.questionId}').val(${questDetail.attributeRefferenceValue});
							</script>
						</c:when>
						<c:when test="${questionTypeEle[1] eq '85010'}">
							<script>
// 								$('#div_${questDetail.questionId}').slider( "option", "value", ${questDetail.attributeValue});
// 								$('#${questDetail.questionId}').val(${questDetail.attributeValue});

// 								if(${questDetail.attributeRefferenceValue} != 0){
// 									var amountIn = ${questDetail.attributeRefferenceValue} / ${questDetail.attributeValue};

// 									$(".common_unit_selector li").removeClass("unit_selected");
// 		 							$(".dynamic").removeClass("cr_selected");
		 							
// 	 								if(amountIn == 10000000){
// 										$(".cr").addClass("unit_selected");
// 										$(".dynamic").text("cr");
// 									} else if(amountIn == 100000){
// 										$(".lacs").addClass("unit_selected");
// 										$(".dynamic").text("lacs");
// 									} else {
// 										$(".k").addClass("unit_selected");
// 										$(".dynamic").text("");
// 									}
// 	 							}

								var amount = 0;
								var amountIn = 0;
								var attributeCodeId = ${questDetail.attributeCodeId};
								if(${questDetail.attributeRefferenceValue} != 0){
									
										
										 amountIn = ${questDetail.attributeRefferenceValue} / 1000;
										 /* alert(amountIn); */
										 
										if(amountIn <= 100) {
											$("#select_"+attributeCodeId).val("K");
											$(".dynamic_"+attributeCodeId).html("ks");
											$('#div_${questDetail.questionId}').slider( "option", "value", amountIn);
											$('#${questDetail.questionId}').val(amountIn);
										}
										else {
											amountIn = amountIn/100; 
											if(amountIn <= 100) {
												$("#select_"+attributeCodeId).val("Lac");
												$(".dynamic_"+attributeCodeId).html("lacs")
												$('#div_${questDetail.questionId}').slider( "option", "value", amountIn);
												$('#${questDetail.questionId}').val(amountIn);
											} 
											else {
												amountIn = amountIn/100;
												$("#select_"+attributeCodeId).val("Cr");
												$(".dynamic_"+attributeCodeId).html("crs")
												$('#div_${questDetail.questionId}').slider( "option", "value", amountIn);
												$('#${questDetail.questionId}').val(amountIn);
											}
										}
										
										
								} else {
									$('#div_${questDetail.questionId}').slider( "option", "value", 0);
									$('#${questDetail.questionId}').val(0);
									$(".dynamic_"+attributeCodeId).html("ks")
								}
							</script>
						</c:when>
						<c:when test="${questionTypeEle[1] eq '85002'}">
							<script>
								$('#${questDetail.questionId}').val(${questDetail.attributeValue} + "_" + ${questDetail.attributeRefferenceValue});

								if(${questDetail.attributeRefferenceValue} == 1){
									$('#div_${questDetail.questionId}').toggles({on:true});
									$("#bg-box_" + ${questDetail.questionId}).fadeIn();
								} else {
									$('#div_${questDetail.questionId}').toggles({on:false});
									$("#bg-box_" + ${questDetail.questionId}).fadeOut();
								}
							</script>
						</c:when>
						<c:when test="${questionTypeEle[1] eq '85018'}">
							<script>							
								$('#${questDetail.questionId}').val(${questDetail.attributeValue} + "_" + ${questDetail.attributeRefferenceValue});
								if(${questDetail.attributeRefferenceValue} == 1){
									$('#div_${questDetail.questionId}').toggles({on:true});
									
									if(${questDetail.questionId} == 94025){
										$("#parentDiv_94024").fadeIn();	
									} else if(${questDetail.questionId} == 94106){
										$("#parentDiv_94107").fadeIn();
									} else if(${questDetail.questionId} == 94108){
										$("#parentDiv_94226").fadeIn();
									}
									
								} else {
									$('#div_${questDetail.questionId}').toggles({on:false});
									
									if(${questDetail.questionId} == 94025){
										$("#parentDiv_94024").fadeOut();
										$("#div_94024").slider( "option", "value", 0);
										$("#94024").val(0);
									} else if(${questDetail.questionId} == 94106){
										$("#parentDiv_94107").fadeOut();	
										$("#div_94107").slider( "option", "value", 0);
										$("#94107").val(0);
									} else if(${questDetail.questionId} == 94108){
										$("#parentDiv_94226").fadeOut();	
										$("#div_94226").slider( "option", "value", 0);
										$("#94226").val(0);
									}
								}
							</script>
						</c:when>
						<c:when test="${questionTypeEle[1] eq '85006'}">
							<script>
								$('#div_${questDetail.attributeValue}').addClass("not_applicable");
	 							$('#${questDetail.attributeValue}').val(${questDetail.attributeRefferenceValue});
							</script>
						</c:when>
						<c:when test="${questionTypeEle[1] eq '85019'}">
							<script>
								$('#health_insurance option[value=${questDetail.attributeValue}]').attr('selected','selected');								
							</script>
						</c:when>
						<c:otherwise></c:otherwise>
					</c:choose>
				</c:if>
			</c:forEach>
		</c:forEach>
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
<div class="overlay"></div>
<!-- Wrapper ends--> 
<script>

//assumption pop
// createSlider('#advice_rs_assump_ee',70,100,1,"#advice_rs_assump_ee_payment");
// createSlider('#advice_rs_assump',0,20,1,"#advice_rs_assump_payment");
// createSlider('#advice_rs_assump_ci',6,60,1,"#advice_rs_assump_ci_payment");
// createSlider('#advice_rs_assump_ad',6,60,1,"#advice_rs_assump_ad_payment");

$(".Advice_Assump_Menu .save").click(function(){
	 if($("#frmAssumption").validate().form()!=false){
	var url = '${pageContext.request.contextPath}/partner/datacollection/assumption/save';
	var updatedAssumptionData = "98021:" + $("#98021_payment").val() + "," + "98046:" + ($("#98046_payment").val() * ${scale}) + "," + "98019:" + $("#98019_payment").val() + "," + "98001:" + $("#98001_payment").val(); 
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

var inputData= "";
$("#main_actions .save").click(function() {
	
	if(checkValidAmount())
	{	
		getData();
		var initialData=$("#initialData").val();
		if(initialData==inputData){
			alertMessage("You haven't changed any data yet.Please make some changes and then save.");
			return false;
		}else{
			$("#inputData").val(inputData);
			$("#frmEmergencyReadiness").submit();	
		}
	}
});

function getData()
{
	inputData = "<Root>";
	$("#frmEmergencyReadiness").find(".answer").each(function (index) {		
		if($(this).val() != ""){
			var questAttId = $( this ).attr("id");

			if($(this).hasClass("range_counter")){
				if($(this).hasClass("freeform")){

					amount = $(this).val();
		 			if($("#select_"+questAttId).val() == 'K') {
		 				amount = amount * 1000;	
					} else if($("#select_"+questAttId).val() == 'Lac') {
	 					amount = amount * 100000;	
	 				} else if($("#select_"+questAttId).val() == 'Cr') {
	 					amount = amount * 10000000;	
		 			}
		 			
					inputData = inputData + "<Question>";
					inputData = inputData + "<QuestionId>" + questAttId + "</QuestionId>";
					inputData = inputData + "<QuestionOptionId>" + $(this).val() +  "</QuestionOptionId>";
					inputData = inputData + "<AttributeCodeID>" + questAttId + "</AttributeCodeID>"; // clear no change require
					inputData = inputData + "<Value>" + amount + "</Value>";			
					inputData = inputData + "</Question>";
					
				} else {
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
				}
			} else if($(this).hasClass("toggelCtrl")){
				
				inputData = inputData + "<Question>";
				inputData = inputData + "<QuestionId>" + questAttId + "</QuestionId>";
				inputData = inputData + "<QuestionOptionId>" + $(this).val().split('_')[0] +"</QuestionOptionId>";
				inputData = inputData + "<AttributeCodeID>" + questAttId + "</AttributeCodeID>"; // clear no change require
				inputData = inputData + "<Value>" + $(this).val().split('_')[1] + "</Value>";			
				inputData = inputData + "</Question>";
				
			} else if($(this).hasClass("select")){
				
				$('#health_insurance :selected').each(function(i, selected){ 					  
					inputData = inputData + "<Question>";
					inputData = inputData + "<QuestionId>" + 94021 + "</QuestionId>";
					inputData = inputData + "<QuestionOptionId>" + $(selected).val() +"</QuestionOptionId>";
					inputData = inputData + "<AttributeCodeID>" + 94021 + "</AttributeCodeID>"; // clear no change require
					inputData = inputData + "<Value>" + $(selected).text() + "</Value>";			
					inputData = inputData + "</Question>";
				});
				
				
				
			} else {
				var optAttId = $( this ).attr("id");
				var questAttId = $( this ).attr("name");				
				inputData = inputData + "<Question>";
				inputData = inputData + "<QuestionId>" + questAttId + "</QuestionId>";
				inputData = inputData + "<QuestionOptionId>" + optAttId +"</QuestionOptionId>";
				inputData = inputData + "<AttributeCodeID>" + questAttId + "</AttributeCodeID>"; // clear no change require
				inputData = inputData + "<Value>" + $(this).val() + "</Value>";			
				inputData = inputData + "</Question>";
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

function checkValidAmount() {
	var amount1 = $("#94018").val();
	var amount2 = $("#94019").val();
	var amount3 = $("#94024").val();
	var amount4 = $("#94107").val();
	var amount5 = $("#94226").val();
	
	var selected1 = $("#94013").val();
	var selected2 = $("#94020").val();
	var selected3 = $("#94025").val();
	var selected4 = $("#94106").val();
	var selected5 = $("#94108").val();
	
	if(selected1 == '94135_1' && amount1 == '0') {
		alertMessage("Please enter Cover amount for Life Insurance");
		return false;
	} else 	if(selected2 == '94135_1' && amount2 == '0') {
		alertMessage("Please enter Cover amount for Health Insurance");
		return false;
	} else 	if(selected3 == '94135_1' && amount3 == '0') {
		alertMessage("Please enter Cover amount for Critical Illness Insurance");
		return false;
	} else 	if(selected4 == '94135_1' && amount4 == '0') {
		alertMessage("Please enter Cover amount for possible accidents");
		return false;
	} else 	if(selected5 == '94135_1' && amount5 == '0') {
		alertMessage("Please enter Cover amount for Assets");
		return false;
	} 		
		return true;
}

$(document).ready(function(){
	
	var scale = '${scale}';
	if(scale == 1000) {
		$(".assumScale").html("k");
	} else if(scale == 100000) {
		$(".assumScale").html("lacs");
	} else if(scale == 10000000) {
		$(".assumScale").html("cr");
	}
	var rbsLinks = "${rbsLinks}";
	var pieces = rbsLinks.split(",");
	if(pieces != ""){
		for(var i=0;i<pieces.length;i++){
			if(pieces[i]=="saveCfsRiskCoverLink"){
				$("frmEmergencyReadiness").attr("action","#");
			}
			$("."+pieces[i]).attr("href","#");
			$("."+pieces[i]).addClass("inactiveLink");
			$("."+pieces[i]).removeAttr("onclick");
		}		
	}
	
	$(".wrapper").addClass("risk_cover");
	$(".miniselect").selectBoxIt();
	$('#health_insurance').listbox();	
	$('.common_in_content').slimScroll();
	$('.Advice_Assump_Menu_In').slimScroll();
	
	$("#frmEmergencyReadiness").validate({
		rules:{	name_94018:{min:0,max:100},name_94019:{min:0,max:100},name_94024:{min:0,max:100},name_94107:{min:0,max:100},name_94226:{min:0,max:100}}
	});
	
	
	$("#frmAssumption").validate();
	$("#98021_payment").rules("add", {min:70,max:100});
	$("#98046_payment").rules("add", {min:1,max:20});
	$("#98019_payment").rules("add", {min:6,max:60});
	$("#98001_payment").rules("add", {min:6,max:60});
	
	
    $('.wrapper').attr('id', 'dc_screens');
    var buttons = $( "#dialog1" ).dialog( "option", "buttons" );
	// setter
	/* $("#dialog1").dialog("option", "buttons", [{
	   text: "Ok",
	   click: function () {
		   $(this).dialog('close');
	   }
	}]); */
	$(document).on("dialogopen", "#dialog1", function(event, ui) {
		setTimeout("$('#dialog1').dialog('close')",3000);
	});

    $("#div_94013").on('toggle', function (e, active) {
 	    if (active) { 		 	 		 	
 		 	$("#bg-box_94013").fadeIn("slow");
 	    } else { 		  	
 	    	$("#bg-box_94013").fadeOut("slow");
 	    	$(".thumb_select_ul .categoery").removeClass("not_applicable");
 	    	$(".thumb_select_ul .categoery").find(".answer").val("");
			$("#div_94018").slider( "option", "value", 0);
			$("#94018").val(0);
 	    }
 	});
    
    $("#div_94020").on('toggle', function (e, active) {
 	    if (active) { 		 	 		 	
 		 	$("#bg-box_94020").fadeIn("slow");
 	    } else { 		  	
 	    	$("#bg-box_94020").fadeOut("slow"); 	    	
			$("#div_94019").slider( "option", "value", 0);
			$("#94019").val(0);
 	    }
 	});
 	
    $("#div_94025").on('toggle', function (e, active) {
 	    if (active) {
 		 	$("#parentDiv_94024").fadeIn("slow");
 	    } else { 		  	
 	    	$("#parentDiv_94024").fadeOut("slow"); 	    	
			$("#div_94024").slider( "option", "value", 0);
			$("#94024").val(0);
 	    }
 	});
    
    $("#div_94106").on('toggle', function (e, active) {
 	    if (active) {
 		 	$("#parentDiv_94107").fadeIn("slow");
 	    } else { 		  	
 	    	$("#parentDiv_94107").fadeOut("slow"); 	    	
			$("#div_94107").slider( "option", "value", 0);
			$("#94107").val(0);
 	    }
 	});
    
    $("#div_94108").on('toggle', function (e, active) {
 	    if (active) {
 		 	$("#parentDiv_94226").fadeIn("slow");
 	    } else { 		  	
 	    	$("#parentDiv_94226").fadeOut("slow"); 	    	
			$("#div_94226").slider( "option", "value", 0);
			$("#94226").val(0);
 	    }
 	});
    
 	$(".thumb_select_ul a").click(function(){
 	   $(this).children(".categoery").toggleClass("not_applicable");
 	   if($(this).children(".categoery").find(".answer").val() == ""){
 		  $(this).children(".categoery").find(".answer").val($(this).children(".categoery").find(".answer").attr("name")); 		   
 	   } else {
 		  $(this).children(".categoery").find(".answer").val("");
 	   }
 	});
 	
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

function changeScale(id){
	var arr = id.split("_");
	var attributeCodeId = arr[1];
		 if($("#select_"+attributeCodeId).val() == 'K') {
				$(".dynamic_"+attributeCodeId).html("ks");
			} else if($("#select_"+attributeCodeId).val() == 'Lac') {
				$(".dynamic_"+attributeCodeId).html("lacs");
			} else if($("#select_"+attributeCodeId).val() == 'Cr') {
				$(".dynamic_"+attributeCodeId).html("crs");
			}
}
function alertMessage(msg)
	{
		$("#dialog1").html(msg);
		$( "#dialog1").dialog( "open" );
	}


</script> 
