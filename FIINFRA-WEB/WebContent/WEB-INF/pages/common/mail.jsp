<script src="<%=request.getContextPath() %>/js/jquery-1.9.1.js"></script>
<script src='<%=request.getContextPath()%>/js/common.js'></script>
<script src="<%=request.getContextPath() %>/js/jquery-1.9.1.min.js"></script>
<script src="<%=request.getContextPath() %>/js/jquery.base64.min.js"></script>
<%-- <%@include file="common_popup.jsp"%> --%>
<script>
		
var $new=$.noConflict(); 
		//Below information should be make available by portal

		//Complete Email-ID(user@yourdomain.com) of the user which is used to authenticate him during postDataToLoginPage,
		var szUser = '${sessionScope.userSession.emailCommunicationID}';

		//Token of the user which is used to authenticate user during postDataToLoginPage
		//you will call the webservice(bayaoauth/gettoken) to get user-access-token from your server and make the token available on the page
		var szToken = "";

		//It is the mail-server onto which user has to login to access his mailbox
		var szBayaServer = "http:"+ "//" + "mail5.mithiskyconnect.com";
		console.log("szBayaServer= " + szBayaServer);
		
		
		//Encode the request information of webservice
		function encode(szUser, szToken)
		{
			try{
			//Create plain-request it should be in the form of {"user":"user-email-id","token":"user-access-token"}
			requets= "{\"user\":\"" + szUser + "\", \"token\":\"" + szToken + "\"}";
			console.log("encode: requets: " + requets);

			//encode request info by Base64
			var hash = $new.base64.encode(requets);
			log("encode: hash: " + hash);
			}catch(e){
			}
			return hash;
		}
		
		
		
		
		//Login To Baya
		function loginToBaya()
		{
			
			console.log("loginToBaya: START");
			window.location.href=szBayaServer + "/portal.html?info=" + encode(szUser, szToken);
			console.log("loginToBaya: END");
		}

		

	$(function() {
		openPopupWebApp('centerLoadingImage', 25, 35);
		loginToMithi();
	});	

		
		
		function loginToMithi(){
			szToken="";
			$.ajax({
				type : 'POST',
				url : $('#contextPath').val()+'/common/getAccesTockenForMithi.htm',
				success : function(result) {
					try{	
// 						result = JSON.parse(result);
						console.log('result:------'+result)
						szToken=result;
						loginToBaya();
					}catch(e){
						
					}
				}
			});
		}
</script>
	<input id="contextPath" type="hidden" name="contextPath"
		value="<%=request.getContextPath()%>" />
 
 