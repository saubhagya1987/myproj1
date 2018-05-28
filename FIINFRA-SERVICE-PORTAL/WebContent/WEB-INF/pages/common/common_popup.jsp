<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%-- <script src="../js/jquery.min.js"></script> --%>
<script>
</script>
<style>
#centerLoadingImage_image {
	margin-top: 17.5%;
	margin-left: 42%;
}

.close_img {
	cursor: pointer;
}

#centerLoadingImage {
	display: none;
	/* 	width: 300px; */
	/* 	height: 300px; */
	/* 	position: fixed; */
	/* 	z-index: 2005; */
}

#common_popup_div {
	display: none;
	position: fixed;
	filter: alpha(opacity = 00);
	width: 100%;
	height: 100%;
	z-index: 2000;
	opacity: 12;
	z-index: 10000000;
}

#shadow_div_web_app {
	background-color: #000000;
	display: none;
	height: 100%;
	left: 0;
	opacity: 0.1;
	position: fixed;
	top: 0;
	width: 100%;
	z-index: 999999;
}
</style>
<style>
#alert_div {
	-moz-border-radius: 10px;
	-webkit-border-radius: 10px;
	border-radius: 10px;
	border: 1px solid;
	border-color: #D7D7D7;
	padding: 10px;
}
</style>
<input id="contextPath" type="hidden" name="contextPath"
	value="<%=request.getContextPath()%>" />

<div id="shadow_div_web_app" style="display: none"></div>
<div id="common_popup_div" style="display: none">
	<!-- 	<div id="centerLoadingImage"> -->
	<img height="150" width="150" id="centerLoadingImage"

		style="display: none"
		src="<%=request.getContextPath()%>/images/loading15.gif"
		name="loadingImage" />
		
		<!-- <h4 style="position:absolute;top: 54%; left: 38%; color: #0e0828;">System is processing this request and will complete soon</h4> -->
	<!-- 	</div> -->
	

</div>