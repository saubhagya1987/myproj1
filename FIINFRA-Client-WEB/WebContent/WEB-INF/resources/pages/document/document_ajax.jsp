
<%@page import="in.fiinfra.cp.CommonUtils"%>
<%@page import="in.fiinfra.common.util.FiinfraUtility"%>
<%@page import="in.fiinfra.common.common.BaseRequest"%>
<%@page import="in.fiinfra.common.common.DocumentRequest"%>
<%@page import="org.apache.commons.lang.StringUtils"%>
<%@page import="in.fiinfra.common.common.DocumentData"%>
<%@page import="java.util.List"%>

<%
	List<DocumentData> documents = (List<DocumentData>) request.getAttribute("documents");
	DocumentRequest q = (DocumentRequest)request.getAttribute("q");
			
%>
<div class="row">
<div class="col-xs-12">
<div>
     	
	<ul class="ace-thumbnails clearfix">
	 <% if(documents ==null || documents.size() ==0){ %>
	<div >No Documents Found !!!</div>
	<%
	} else{ %><%for(DocumentData n:documents){
            String fileType = StringUtils.substringAfterLast(n.getFileName(), ".");
            String thumbnail =n.getThumbnail();
             
          //  if(StringUtils.isEmpty(thumbnail)){
            	if("pdf".equalsIgnoreCase(fileType)){
            	  	thumbnail = request.getContextPath()+"/resources/images/thumbnail/pdf_icon.png";
            	}
            	else if("doc".equalsIgnoreCase(fileType) || "docx".equalsIgnoreCase(fileType)){
            	  	thumbnail = request.getContextPath()+"/resources/images/thumbnail/word_icon.png";
            	}
            	else if("txt".equalsIgnoreCase(fileType) ){
            	  	thumbnail = request.getContextPath()+"/resources/images/thumbnail/text_icon.png";
            	}

            	else if("txt".equalsIgnoreCase(fileType) ){
            	  	thumbnail = request.getContextPath()+"/resources/images/thumbnail/text_icon.png";
            	}
            	else if("xls".equalsIgnoreCase(fileType) || "xlsx".equalsIgnoreCase(fileType) ){
            	  	thumbnail = request.getContextPath()+"/resources/images/thumbnail/excel_icon.png";
            	}
            	else {
            	  	thumbnail = request.getContextPath()+"/resources/images/thumbnail/image_icon.png";
            	}

            //}
           /*  else{
            	thumbnail = request.getContextPath()+"/resources/images/thumbnail/image_icon.png";
            } */
	%>
	<script>
$(document).ready(function(){
  
   $('#my-doc-main .main_doc-bg .txt_box .name_txt_bx .name_txt').perfectScrollbar();
});
  </script>
	<%-- <div class="main_doc">
      <div class="main_doc-bg">
        <div class="thumbnail fl"><img src="<%=thumbnail%>" width="" height="" alt=""></img><div style="margin-top: 10px;">Updated On: <%=CommonUtils.format( n.getLastModifiedDate(), "dd-MMM-yyyy") %></div></div>
        <div class="txt_box fl">
          <div class="name_title">Name</div>
          <div class="name_txt_bx"><div class="name_txt"><%=CommonUtils.emptyIfNull(n.getDocumentName())%></div></div>
          <div class="section_title">Section</div>
          <div class="section_txt"><%=CommonUtils.emptyIfNull(n.getRefTypeName())%></div>
          <div class="section_title">Document Type</div>
          <div class="section_txt"><%=CommonUtils.emptyIfNull(n.getDocumentTypeValue())%></div>
        </div>
        <div class="below_bx fl"> <a href="${pageContext.request.contextPath}/document/edit?documentId=<%=n.getDocumentId()%>" class="edit"><span class="edit_icon fl" ></span>Edit</a> 
        <a href="${pageContext.request.contextPath}/document/preview?documentId=<%=n.getDocumentId()%>" class="view"><span class="view_icon fl" ></span>View</a> 
        <a href="javascript:void(0)"  onClick="ConfirmDeletion(<%=n.getDocumentId()%>)"  class="delete"><span class="delete_icon fl" ></span>Delete</a>
          <div></div>
        </div>
        <div class="clr"></div>
      </div>
    </div> --%>
	
	
	<!-- New View for Doc -->

		<li style="width:29.5% !important ; height: 126px; margin: 10px !important; border:3px solid #CCC !important"><a title="Photo Title" data-rel="colorbox" class="cboxElement col-xs-4"> 
			<img width="80" height="80" alt="80x80" style="margin-top: 20px !important ;"
				src="<%=thumbnail%>">
			</a>

			<div class="tags" style="bottom: 21px !important;margin-right: 12px;"> 
				<span class="label" style="width:217px !important; text-align: left;"><span class="name_txt_bx">Name : <%= StringUtils.left(CommonUtils.emptyIfNull(n.getDocumentName()), 18)%></span></span>
				 
				
				<span class="label-holder"> <span class="label label-light" style="width:217px !important; text-align: left;">Section :<%=CommonUtils.emptyIfNull(n.getRefTypeName())%></span>
				</span> 
				
				<span
					class="label" style="width:217px !important; text-align: left;">Document Type : <%=CommonUtils.emptyIfNull(n.getDocumentTypeValue())%></span>
				
				<span class="label-holder"> <span
					class="label label-light" style="width:217px !important; text-align: center;"><i><a href="${pageContext.request.contextPath}/document/preview?documentId=<%=n.getDocumentId()%>" class="view"><span class="view_icon fl" ></span>View</a> </i></span>
				</span>
			</div>

			<!-- <div class="tools">
				<a href="#"> <i class="ace-icon fa fa-link"></i>
				</a> <a href="#"> <i class="ace-icon fa fa-paperclip"></i>
				</a> <a href="#"> <i class="ace-icon fa fa-pencil"></i>
				</a> <a href="#"> <i class="ace-icon fa fa-times red"></i>
				</a>
			</div> -->
		</li>
	
	<!-- New View for Doc End-->
	
	
	 <%
		}//for End
	  
	}//Else End
	%>
	</ul>
	
</div>
	</div>
	</div>