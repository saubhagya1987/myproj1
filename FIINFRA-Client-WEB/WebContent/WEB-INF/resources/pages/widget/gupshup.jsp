<%@page import="in.fiinfra.common.util.FiinfraUtility"%>
<%@page import="in.fiinfra.cp.CommonUtils"%>
<%@page import="org.apache.commons.lang.StringUtils"%>
<%@page import="in.fiinfra.cp.GupShupData"%>
<%@page import="java.util.List"%>
<% List<GupShupData> lst = ((List<GupShupData>) request.getAttribute("lst"));
String defaultOwnerImage = request.getContextPath() + "/"
		+ "resources/images/photo.jpg";
%>

      
              <div class="col-md-4" >
            <div class="space"></div>
            <div class="widget-box" style="min-height:373px;">
                  <div class="widget-header">
                <h4 class="widget-title lighter smaller">Gup-Shup</h4>
              </div>
                  <div class="widget-body">
                <div class="widget-main no-padding"> 
                      <!-- #section:pages/dashboard.conversations -->
                        <div class="dialogs">
                        <%if (lst != null&& !lst.isEmpty()) { %>
                        
                      <% int count = 0 ; %>
                    <% count++; %> 
                    <% if( count <=3 ) { %>    
                      <% for(GupShupData n:lst){ 
                    	  String ownerLogo = FiinfraUtility.getImagePath(request,
          			            n.getImagePath(), defaultOwnerImage);
                      %>
                     
                    
                    <div class="itemdiv dialogdiv">
                          <div class="user"> <img alt="Alexa's Avatar" src="<%=defaultOwnerImage%>" /> </div>
                          <div class="body">
                        <div class="time"> <i class="ace-icon fa fa-clock-o"></i> <span class="green"><%=CommonUtils.format(n.getLastVisitedDate(),"d MMM yyyy")%></span> </div>
                        <div class="name"> <a href="#"><%=StringUtils.left(n.getUserName(), 20)%></a> </div>
                        <div class="text"><%= StringUtils.left(n.getText(),80)%></div>
                        <div class="tools"> <a href="${pageContext.request.contextPath}/common/gupshup?postId=<%=n.getId()%>" class="btn btn-minier btn-info"> <i class="icon-only ace-icon fa fa-share"></i> </a> </div>
                      </div>
                        </div>
                    <% } %>
                    </div>
                      <%} %>
                      <%--<form> <div class="form-actions clearfix">
                          <div class="input-group pull-right"> <a  href="${pageContext.request.contextPath}/common/gupshup">View all...</a> </div>
                        </div> </form>--%>
                      <!-- /section:pages/dashboard.conversations -->
 					               
                    <% }else { %>
                    <div class="clr"></div>     
        <div class="no_data_message">No Gupshup found !</div> 
                    
         
        <% } %> 
                <!-- /.widget-main --> 
                  </div>
              </div>
                
                  <!-- /.widget-body --> 
                </div>
          </div>
          
  