<%@page import="in.fiinfra.common.util.DateUtil"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="org.apache.commons.lang.StringUtils"%>
<%@page import="in.fiinfra.cp.CommonUtils"%>
<%@page import="in.fiinfra.cp.BroadcastData"%>
<%@page import="java.util.List"%>
<!-- Custom Selectbox starts -->
<%List<BroadcastData> lst=(List<BroadcastData>) request.getAttribute("lst"); %>
<script>
$(document).ready(function(){
	
  
    $("select").selectBoxIt();
	 // Calls the selectBoxIt method on your HTML select box
    });
</script>

 


  <!-- end of "inner-shadow-strip" id -->
  
  <%-- <div id="contents">
  
    <div id="inner_contents_announce"> 
      <!--title starts-->
       <%if (lst != null&& !lst.isEmpty()) { %>
      <div class="announce_title_bx">
        <ul>
          <li class="input_title_one fl">Date</li>
          <li class="input_title_two fl">Time</li>
          <li class="input_title_three fl">Days to Go</li>
          <li class="input_title_four fl">Title</li>
          <li class="input_title_five fl">Description</li>
          <!-- <li class="input_title_six fl">Attachments</li> -->
          <div class="clr"></div>
        </ul>
      </div>
      <!--title ends--> 
      <!--txt starts-->
    
      <% 
          for(BroadcastData b:lst){
        	  //Date date = parseFormat.parse();
        	 // System.out.println(printFormat.format(date));
        	  
        	 // Date date=b.getBroadCastStartDate();
        	//long time=date.getTime();
        	  
        	  String days=""; 
        	  if(b.getDaysToGo()>0){
        		  
        		  days = b.getDaysToGo() ==1 ?"Tomorrow":""+b.getDaysToGo()+ " Days";
        	  }
        	  else if(b.getDaysToGo() == 0){
        		  days="Today";
        	  }
        	  else {
        		  days="Passed";
        	  }
          %>
      <div class="announce_li_bx">
        <div class="announce_li_bx_in">
          <ul>
            <li class="input_txt_one fl"><%= CommonUtils.format(b.getBroadCastStartDate(),"EEE, d MMM yyyy") %>
            </li>
            <li class="input_txt_two fl"><%= CommonUtils.format(b.getBroadCastStartDate(),"h:mm a")%></li>
            <li class="input_txt_three fl"><%= days %>
            </li>
            <li class="input_txt_four fl"><%= b.getBroadCastTitle() %>
            </li>
            <li class="input_txt_five fl"><%= b.getDescription() %> </li>
            <div class="clr"></div>
            
          </ul>
          <!-- txt ends--> 
          
        </div>
        
      </div>
      <%} %>
      <%}else{ %>
      
        <div class="clr"></div>     
        <div class="no_data_message">There are no Announcements for you</div> 
      
      <%} %>
      
    </div>
    <!-- end of "inner-contents" id --> 
  </div> --%>
  
  
 
 <div style="width: 100%; overflow-x: auto; overflow-y: auto;">
<table class="ListTable table table-striped table-bordered table-hover">
 <%if (lst != null&& !lst.isEmpty()) { %>
	<thead>
		<tr>
			<th width="5%">Date</th>
			<th width="5%">Time</th>
			<th width="5%">Days to Go</th>
			<th width="7%">Title</th>
			<th class="hidden-480" width="9%">Description</th>
			
			
		</tr>
	</thead>
	
	<tbody>
		
		    <% 
          for(BroadcastData b:lst){
        	  //Date date = parseFormat.parse();
        	 // System.out.println(printFormat.format(date));
        	  
        	 // Date date=b.getBroadCastStartDate();
        	//long time=date.getTime();
        	  
        	  String days=""; 
        	  if(b.getDaysToGo()>0){
        		  
        		  days = b.getDaysToGo() ==1 ?"Tomorrow":""+b.getDaysToGo()+ " Days";
        	  }
        	  else if(b.getDaysToGo() == 0){
        		  days="Today";
        	  }
        	  else {
        		  days="Passed";
        	  }
          %>
				<tr>
			   
				<td><%= CommonUtils.format(b.getBroadCastStartDate(),"EEE, d MMM yyyy") %></td>
				<td><%= CommonUtils.format(b.getBroadCastStartDate(),"h:mm a")%>
					</td>
			    <td><%= days %></td>
				<td class="hidden-480"><%= b.getBroadCastTitle() %></td>
				<td><%= b.getDescription() %></td>
				

				
			</tr>
		<% }%>
		<%}else{ %>
      
        <div class="clr"></div>     
        <div class="no_data_message">There are no Announcements for you</div> 
      
      <%} %>
	</tbody>
</table>
</div><br/><br/>
  <!-- end of "contents" id -->

