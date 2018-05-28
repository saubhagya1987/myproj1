<%@page import="in.fiinfra.common.util.FiinfraUtility"%>
<%@page import="in.fiinfra.common.common.BaseRequest"%>
<%@page import="in.fiinfra.cp.TestimonialData"%>
<%@page import="org.apache.commons.lang.StringUtils"%>
<%@page import="in.fiinfra.cp.CommonUtils"%>
<%@page import="java.util.List"%>
<% List<TestimonialData> lst = (List<TestimonialData>) request.getAttribute("lst") ;%>
  <div class="col-md-4">
            <div class="space"></div>
            <div class="widget-box" style="min-height:373px;">
                  <div class="widget-header">
                <h4 class="widget-title lighter smaller">Testimonials</h4>
              </div>
                  <div class="widget-body">
                <div class="widget-main no-padding"> 
       <%if (lst != null&& !lst.isEmpty()) { %>
       <% int i= 0; %>
        
             
         <%-- <div class="testimonial1">
        <div class="image fl"><% if( n.getPhoto() != null){ %>
               <img src="<%= n.getPhoto() %>" />
        <%}else{ %><img src="<%=FiinfraUtility.getImagePath(request, n.getPhoto(), (n.getGenderId()==12002? "/resources/images/female_avatar.png":"/resources/images/male_avatar.png")) %>" />
        <%} %></div>
        <!-- end of "image" class --> 
        
       <div class="fl profile_txt_box"> <div class="name"></div>
        <div class="city"></div></div>
        <p></p>
        <a href="${pageContext.request.contextPath}/common/testimonials?testimonialId=<%=n.getId()%>">read more...</a>
        <div class="border"></div>
        <div class="clr"></div>
      </div>
             
        
        
         <a class="view-all" >view all...</a> </li>
         
           --%>
         
                      <!-- #section:pages/dashboard.conversations -->
                      <% for(TestimonialData n:lst){
                      i++;
                      %>
				<div class="dialogs">
					<div class="dialogdiv">
						<div class="widget-box">
							<div class="city"><%=CommonUtils.emptyIfNull(n.getCity())%></div>
							<div class="name"><a href="#"><%=CommonUtils.emptyIfNull(n.getUserName())%></a></div>
							<div class="text"><%=StringUtils.left(n.getText(), 100)%>...</div>
						</div>
					</div>
				</div>
				<%
					}
				%>    
                      <!-- /section:pages/dashboard.conversations --> 					                   
                  <%--   <div class="form-actions clearfix">
                          <div class="input-group pull-right"> <a href="${pageContext.request.contextPath}/common/testimonials" class="">View all...</a> </div>
                        </div> --%>
                <!-- /.widget-main --> 
            
                  <!-- /.widget-body --> 
             
          <%} else { %>
          <form> <div class="form-actions clearfix">
                          <span class="center">No testimonial written. You can become first to write Testimonial ! </span>
                          <div class="input-group pull-right"> <a  href="${pageContext.request.contextPath}/common/add/testimonial">Add Testimonial...</a> </div>
                        </div> </form>
       <%--   <div><span class="center">No testimonial written. You can become first to write Testimonial ! </span></div>
          <a  href="${pageContext.request.contextPath}/common/add/testimonial">Add Testimonial...</a> </li> --%>
          <%} %>
            </div>
            </div>
             </div>
          </div>
