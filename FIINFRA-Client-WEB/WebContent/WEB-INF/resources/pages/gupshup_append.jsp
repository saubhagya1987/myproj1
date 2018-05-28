                                   <%@page import="in.fiinfra.cp.GupShupData"%>
<%@page import="in.fiinfra.cp.CommonUtils"%>
<%@page import="in.fiinfra.common.common.GupShupCommentData"%>

<% GupShupData n=(GupShupData) request.getAttribute("gupshup"); 
if(n != null){
%>


<li id="post_<%=n.getId()%>" class="clearfix">
                  <div class="mon_house_exp_bx clearfix ">
                    <div class="mon_house_exp_bx_in_cnt clearfix">
                     
                      <div class="comment_bx_dashed"> 
                        <!--Top-->
                        <div class="top clearfix">
                          <div class="title"><span><%=n.getPosturl() %></span></div>
                          <div class="top_left fl"><a href="#"><%= n.getUserName() %> / <%=CommonUtils.format(n.getCreatedDate(),"d MMM yyyy / HH:mm a") %></a></div>
                          <div class="row">
                          <div class="col-md-2 col-md-offset-5">
                            <div ><i class="fa fa-eye"></i><%= n.getPreviewCount() %></div>
                            <div  <% if(!n.isLiked()){ %> onclick="save(<%=n.getId() %>)" <%}%>  <%=n.isLiked()?"disabled ":"" %>"> <i class="fa fa-thumbs-up"></i><span id="likeCount<%=n.getId() %>"><%=n.getLikeCount() %></span><!-- </a> --></div>
                            <div ><i class="fa fa-comment"></i><%= n.getCommentCount() %></div>
                            </div>
                       </div>
                          
                        </div>
                        <!--Middle-->
                        <div class="middle"><%= n.getText()%></div>
                        <!--Bottom-->
                        <div class="bottom"> <span class="txt"> Last Visited - </span> <span class="date"><%= CommonUtils.format(n.getLastVisitedDate(), "d MMM, yyyy")%></span> </div>
                        </div>
                        
                         
                        
                        <!--Middle-->
                        <%for (GupShupCommentData g:n.getComments()){ %>
                        
                        
                        <div class="comment_bx_dashed"> 
                        <!--Top-->
                        <div class="top clearfix">
                          <div class="title"></div>
                          <div class="top_left fl"><a href="#"><%= g.getCommentOwner() %> / <%=CommonUtils.format(g.getCreatedDate(),"d MMM, yyyy / HH:mm a") %></a></div>
                          <div class="top_right fr">
                          </div>
                          
                        </div>
                        <!--Middle-->
                        <div class="middle"><%= g.getCommentText()%></div>
                        <!--Bottom-->
                        </div>
                        <hr>
                        <%} %>
                      
                      
                    </div>
                  </div>
                </li> <%} %>