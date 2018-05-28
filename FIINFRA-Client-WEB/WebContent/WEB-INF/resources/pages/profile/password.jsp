  <script>
  $(document).ready(function() { 
	  showConfirm(contentData, function() {
			
		});  
	  $(".ui-dialog-buttonset").hide();
	  $(".ui-dialog-titlebar-close").hide();
	  
  });
  </script>
    <div id="header-strip" class="fl">
    	<jsp:include page="../menu.jsp"></jsp:include>
      <h3 class="clearfix fl">MY PASSWORD</h3>
    <!--<a href="#" class="my-history-btn clearfix fr">My History</a>-->
    <!--<a href="#" class="my-password-btn clearfix fr"><img src="../images/transparent.png" />My Password</a>--> 
    <a href="${pageContext.request.contextPath}/profile/"  class="my-profile-btn clearfix fr">
    <img src="${pageContext.request.contextPath}/resources/images/transparent.png" />My Profile</a>
    </div>
    <!-- end of "header-strip" id -->
    
    <div id="inner-shadow-strip"></div>
    <!-- end of "inner-shadow-strip" id -->
    
    <%-- <div id="contents">
      <section class="in_content clearfix" id="personalization">
        <div id="password_details_bx">
          <div id="password_details">
            <div class="fl first_col">
            <form name="password-form" id="password-form" action="${pageContext.request.contextPath}/profile/changePassword" method="post">
              <ul class="reset clearfix first_col_ul">
                <li class="clearfix"> <span class="mandatory"> </span>
                  <label class="form_label">Existing Password (from email)</label>
                  <input name="existingPassword" type="password" class="common_input">
                </li>
                <li class="clearfix"> <span class="mandatory"> </span>
                  <label class="form_label">New Password</label>
                  <input name="newPassword" type="password" class="common_input">
                </li>
                <li class="clearfix"> <span class="mandatory"> </span>
                  <label class="form_label">Re-enter Password</label>
                  <input name="reEnterPassword" type="password" class="common_input">
                </li>
              </ul>
              </form>
            </div>
            <div class="clr"></div>
          </div>
          <div class="btn_bx2">
            <form>
              <input type="button" onclick="savePassword();" class="submit_btn" value="SUBMIT">
             <a href="${pageContext.request.contextPath}/profile/dashboard"> <input type="button"  class="cancel_btn" value="CANCEL"></a>
            </form>
          </div>
        </div>
      </section>
    </div>
   --%>
  
  
  
  <script>
  
  var contentData='<div id="contents" style="width:600px;">'
  +'<section class="in_content clearfix" id="personalization">'
  +'<div id="password_details_bx">'
  +'  <div id="password_details">'
  +'    <div class="fl first_col">'
  +'    <form name="password-form" id="password-form" action="${pageContext.request.contextPath}/profile/changePassword" method="post">'
  +'      <ul class="reset clearfix first_col_ul">'
  +'        <li class="clearfix"> <span class="mandatory"> </span>'
  +'          <label class="form_label">Existing Password (from email)</label>'
  +'          <input name="existingPassword" type="password" class="common_input">'
  +'        </li>'
  +'        <li class="clearfix"> <span class="mandatory"> </span>'
  +'          <label class="form_label">New Password</label>'
  +'          <input name="newPassword" type="password" class="common_input">'
  +'        </li>'
  +'        <li class="clearfix"> <span class="mandatory"> </span>'
  +'          <label class="form_label">Re-enter Password</label>'
  +'          <input name="reEnterPassword" type="password" class="common_input">'
  +'        </li>'
  +'      </ul>'
  +'      </form>'
  +'    </div>'
  +'    <div class="clr"></div>'
  +'  </div>'
  +'  <div class="btn_bx2">'
  +'    <form>'
  +'      <input type="button" onclick="savePassword();" class="submit_btn" value="SUBMIT">'
  +'     <a href="${pageContext.request.contextPath}/profile/dashboard"> <input type="button"  class="cancel_btn" value="CANCEL"></a>'
  +'    </form>'
  +'  </div>'
  +'</div>'
  +'</section>'
  +'</div>';
  
  </script>
  

  
  
  
  <script>
	function savePassword(){
		
		$('#password-form').submit();
		
	 }
  </script>