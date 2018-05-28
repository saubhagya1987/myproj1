 <%@page import="in.fiinfra.cp.TestimonialData"%>
<%@page import="in.fiinfra.cp.CommonUtils"%>
<% TestimonialData n=(TestimonialData) request.getAttribute("testimonial"); 
if(n != null){
%>
            	
                <li class="clearfix">
                  <div class="mon_house_exp_bx clearfix">
                    <div class="mon_house_exp_bx_in_cnt clearfix">
                      <div class="comment_bx_without_dashed"> 
                        <!--Top-->
                        <div class="top clearfix">
                          <div class="title"><span><%= n.getUrl() %></span></div>
                          <div class="top_left fl"><a href="#"><%=n.getUserName() %>(<%= n.getCity() %>) <div>Designation: <%=CommonUtils.emptyIfNull(n.getDesignation()) %></div><%=CommonUtils.format(n.getCreatedDateTime(),"d MMM yyyy / HH:mm a") %></a></div>
                          <div class="top_right fr">
                            
                            <%-- <div class="like_icon_bx fl"><img class="like_icon clearfix fl"  src="${pageContext.request.contextPath}/resources/images/transparent.png" /><%=n.getLikeCount() %></div>
                            <div class="comment_icon_bx fl"><img class="comment_icon clearfix fl"  src="${pageContext.request.contextPath}/resources/images/transparent.png" /><%= n.getCommentCount() %></div> --%>
                          </div>
                          
                        </div>
                        <!--Middle-->
                        <div class="middle">
                        
                        <br>
<br>

                        <%= n.getText() %><br>
<br>
</div>
                        

                        
                      </div>
                      
                      
                    </div>
                  </div>
                </li>
                <%}%>