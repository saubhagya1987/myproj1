
<%@page import="in.fiinfra.common.util.FiinfraUtility"%>
<%@page import="in.fiinfra.common.common.BaseRequest"%>
<%@page import="in.fiinfra.common.common.DocumentRequest"%>
<%@page import="org.apache.commons.lang.StringUtils"%>
<%@page import="in.fiinfra.common.common.DocumentData"%>
<%@page import="java.util.List"%>
<%
List<DocumentData> documents = (List<DocumentData>) request.getAttribute("docList");
if(documents == null) {
	 documents = (List<DocumentData>) request.getAttribute("documents");
}
	DocumentRequest q = (DocumentRequest)request.getAttribute("q");
			
%>
<ul class="add_docs_bx_slider clearfix" id="imageSlider">

	<%	if(documents.size()>0) {
		for(int i=0;i<documents.size();){
	%>
	<li class="clearfix">
		<%
			for(int j=0;i<documents.size() && j<4;j++){ 
		                    	DocumentData n = documents.get(i);
		               //String fileType = StringUtils.substringAfterLast(n.getFileName(), ".");
		               String fileName = n.getFileName();
		               String fileType = fileName.substring(fileName.lastIndexOf(".")+1);
		%>

		<div class="list_bx">
			<div class="title"><%=n.getDocumentName()%></div>
			<div class="img">
				<a
					href="${pageContext.request.contextPath}/document/files/<%=n.getDocumentId()%>">
					<img
					src="${pageContext.request.contextPath}/<%=StringUtils.isEmpty(n.getThumbnail())?"resources/images/thumbnail/"+FiinfraUtility.getDefaultThumbnail(fileType):"document/images?"+BaseRequest.encode("path", n.getThumbnail())%>"
					class="fl" height="234" width="198" />
				</a>
			</div>
			<%if("pdf".equalsIgnoreCase(fileType)){ %>
			<div class="preview">
				<a
					href="${pageContext.request.contextPath}/document/preview?documentId=<%=n.getDocumentId()%>&refId=<%=q.getRefId()==null?0:q.getRefId()%>&refTypeId=<%=q.getRefTypeId()%>&partyId=<%=q.getPartyId()%>&sectionId=<%=q.getSectionId()==null?-1:q.getSectionId()%>&<%=BaseRequest.encode("returnUrl", q.getReturnUrl())%>"><img
					src="${pageContext.request.contextPath}/resources/images/preview.png"
					width="31" height="16" alt=""><span>Preview</span></a>
			</div>
			<%} %>

			<div class="clr"></div>
		</div> <%
 			i++;}
 			%>
	</li>
	<%
		}
	}
	else {%>
		<script>
		$(document).ready(function() {
		$(".hide").show();
		});
		</script>
	<% }
	%>

</ul>
