<%@page import="in.fiinfra.cp.common.util.AuthHandler"%>
<%@page import="in.fiinfra.common.diy.models.UserSession"%>
<img class="short-menu clearfix fr"  src="${pageContext.request.contextPath}/resources/images/transparent.png" />

<% UserSession user = AuthHandler.getCurrentUser();%>
<div class="partner_dashboard_submenu">
      <div class="menu_section">
        <ul class="clearfix reset">
          <li class="menu alert clearfix"><a href="${pageContext.request.contextPath}/common/alerts" class="anch clearfix">
            <div class="thumb"></div>
            <div class="txt partner_d_s_line">Alerts&nbsp;<span class="partner_d_s_alert">(<%=user.getAlertCount()%>)</span></div>
            </a></li>
          <li class="menu feedback clearfix"><a href="${pageContext.request.contextPath}/question/feedback" class="anch clearfix">
            <div class="thumb"></div>
            <div class="txt partner_d_s_line">Feedback</div>
            </a></li>
          <li class="menu polls"><a href="${pageContext.request.contextPath}/question/polls" class="anch clearfix">
            <div class="thumb"></div>
            <div class="txt partner_d_s_line">Polls</div>
            </a></li>
          <li class="menu faqs"><a href="${pageContext.request.contextPath}/common/FAQs" class="anch clearfix">
            <div class="thumb"></div>
            <div class="txt partner_d_s_line">FAQs</div>
            </a></li>
          <li class="menu quick_help"><a class="anch clearfix" disabled>
            <div class="thumb"></div>
            <div class="txt partner_d_s_line">Quick Help</div>
            </a></li>
          <li class="menu soft_advice"><a href="${pageContext.request.contextPath}/chat/chat" class="anch clearfix">
            <div class="thumb"></div>
           <div class="txt partner_d_s_line">Soft Advice</div>
            </a></li>
        </ul>
      </div>
    </div>
    
