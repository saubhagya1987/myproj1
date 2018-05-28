package in.fiinfra.document;

import in.fiinfra.common.common.DocumentData;
import in.fiinfra.common.common.DocumentRequest;
import in.fiinfra.common.controller.AbstractController;
import in.fiinfra.common.diy.models.KeyValue;
import in.fiinfra.common.diy.models.UserSession;
import in.fiinfra.common.service.FIINFRAMWebDelegatingFilterProxy;
import in.fiinfra.common.util.FiinfraUtility;
import in.fiinfra.document.service.DocumentService;

import java.io.File;
import java.io.FileInputStream;
import java.util.Collections;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.IOUtils;
import org.apache.commons.lang.StringUtils;
import org.apache.commons.logging.LogFactory;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping(value = "/document")
public class DocumentController extends AbstractController {

	private static final Logger LOGGER = Logger.getLogger(DocumentController.class);

	@Value("${app.image.path}")
	private String APP_IMAGE_PATH;

	@RequestMapping(value = "/add", method = RequestMethod.GET)
	public String viewDoc(Model m, DocumentRequest req, HttpServletRequest request) {
		if(!validSession(request)){
			return redirectToLogin();
		}

		DocumentData doc = new DocumentData();
		doc.setRefTypeId(req.getCurrentRefTypeId());
		doc.setRefId(req.getCurrentRefId());
		doc.setSectionId(req.getSectionId());
		doc.setPartyId(req.getCurrentPartyId());
		
		populateAddForm(m);
		populatePreviewForm(m, req);
		m.addAttribute("document", doc);
		m.addAttribute("returnUrl", req.getReturnUrl());
		m.addAttribute("partyId", req.getPartyId());
		m.addAttribute("docReq", req);
		return "document/add-doc-upload-file";
	}
	

	@RequestMapping(value = "/preview", method = RequestMethod.GET)
	public String viewDocPreview(Model m, DocumentRequest q, HttpServletRequest request) {
		if(!validSession(request)){
			return redirectToLogin();
		}

		DocumentService docService = getBean(DocumentService.class);
		populatePreviewForm(m,q);
		
		DocumentData document  = docService.getDocument(q);
		m.addAttribute("document", document);
		m.addAttribute("q", q);
		
		return "document/add-document-preview-full";
	}

	@RequestMapping(value = "/view", method = RequestMethod.GET)
	public String docPreview(Model m, DocumentRequest q, HttpServletRequest request) {
		if(!validSession(request)){
			return redirectToLogin();
		}
		UserSession userSession =  (UserSession) request.getSession().getAttribute("userSession");
		DocumentService docService = getBean(DocumentService.class);
		
		
		
		q.setPartyId(userSession.getPartyId());
		if(q.getRefId() != 0) {
			q.setCurrentRefId(q.getRefId());
			q.setCurrentRefTypeId(q.getRefTypeId());
			q.setCurrentPartyId(q.getPartyId());
		}
		
		
		m.addAttribute("q", q);
		m.addAttribute("sectionId",q.getRefTypeId());
		m.addAttribute("partyId", q.getPartyId());
		populatePreviewForm(m,q);
		List<DocumentData> documents  = docService.getDocuments(q);
		m.addAttribute("documents", documents);
		return "document/add-document-preview";
	}
	
	@RequestMapping(value = "/viewDoc", method = RequestMethod.GET)
	public @ResponseBody List<DocumentData> docPreviewforRefId(Model m, DocumentRequest q, HttpServletRequest request) {
		DocumentService docService = getBean(DocumentService.class);
		
		populatePreviewForm(m,q);
		LOGGER.debug("##################===============Doc List====>"+ q.getRefId());
		if(q.getRefId().equals(new Integer(0))) {
			q.setRefId(null);
		}
		List<DocumentData> documents  = docService.getDocuments(q);	
		request.setAttribute("docList", documents);
		return documents;
	}

	@RequestMapping(value = "/view.ajax", method = RequestMethod.GET)
	public String viewDocAjax(Model m, DocumentRequest q) {
		
		DocumentService docService = getBean(DocumentService.class);
		List<DocumentData> documents  = docService.getDocuments(q);
		m.addAttribute("documents", documents);
		m.addAttribute("q", q);
		return "document/ajaxPreview";
	}

	@RequestMapping(value = "/save", method = RequestMethod.POST)
	public String createDocument(@ModelAttribute("document") DocumentData doc,
			BindingResult result, Model m, final RedirectAttributes redirectAttributes,HttpServletRequest request,
			BindingResult bindingResult, @ModelAttribute("docReq")DocumentRequest docReq,
			HttpServletResponse response) {
		if(!validSession(request)){
			return redirectToLogin();
		}
		UserSession userSession =  (UserSession) request.getSession().getAttribute("userSession");
		doc.setCreatedBy(userSession.getUserId());
		StringBuilder errorMsg = new StringBuilder();

		 String returnUrl = request.getParameter("returnUrl");
		 m.addAttribute("returnUrl", returnUrl);
		 m.addAttribute("docReq", docReq);
		
		 UserSession user = AbstractController.getSessionUser();

		if(StringUtils.isEmpty(doc.getDocumentName())){
			errorMsg.append("Empty Document Name").append("\n");
			bindingResult.addError(new FieldError("document","documentName", "Empty Document Name"));
		}
		if(doc.getFiles() ==null || doc.getFiles().isEmpty()){
			errorMsg.append("Empty File").append("\n");
			bindingResult.addError(new FieldError("document","files", "Empty File"));
		}
		
		if(doc.getRefId() ==null || doc.getRefTypeId() ==null|| doc.getRefId() <=0 || doc.getRefTypeId() <=0){
			errorMsg.append("Invalid RefId/RefType").append("\n");
			bindingResult.addError(new FieldError("document","refId", "Invalid RefId/RefType"));
		}

		//		if(StringUtils.isEmpty(doc.getDescription())){
//			bindingResult.addError(new FieldError("document","description", "Empty Description"));
//		}
		
		if(bindingResult.hasErrors()){
			populateAddForm(m);
			m.addAttribute("error", errorMsg.toString());
			return "document/add-doc-upload-file";
		}

		if(!bindingResult.hasErrors()){
			DocumentService service = getBean(DocumentService.class);
			try {
				File imagesPath = new File(APP_IMAGE_PATH);
				service.addDocument(user.getBuId(), doc,imagesPath);
			} catch (Exception e) {
				bindingResult.addError(new FieldError("document","files", e.getMessage()));
			}
		}
		redirectAttributes.addFlashAttribute("success", "Your data Saved Sucessfully");

		return "redirect:view?returnUrl="+returnUrl+"&refId="+doc.getRefId()+"&refTypeId="+doc.getRefTypeId()
				+"&partyId="+doc.getPartyId()+"&sectionId="+doc.getSectionId();
		
	}
	
	
	private void populatePreviewForm(Model model, DocumentRequest req){
		DocumentService service = getBean(DocumentService.class);
		model.addAttribute("documentTypes", toKeyValue(service.getCodeValue("10")))  ;
		if(req.getRefTypeId() != null){
		//case action Plan
		if("111004".equals(req.getCurrentRefTypeId().toString())){
			model.addAttribute("sections", toKeyValue(service.getCodeValue("39")))  ;	
		}
		else if("111001".equals(req.getCurrentRefTypeId().toString())){
			model.addAttribute("sections", Collections.singletonList(new KeyValue(-1,"Party")))  ;
		}
		else if("111002".equals(req.getCurrentRefTypeId().toString())){
			model.addAttribute("sections", Collections.singletonList(new KeyValue(-1,"Task")))  ;
		}
		else if("111003".equals(req.getCurrentRefTypeId().toString())){
			model.addAttribute("sections", Collections.singletonList(new KeyValue(-1,"Plan")))  ;
		}
		else if("111005".equals(req.getCurrentRefTypeId().toString())){
			model.addAttribute("sections", Collections.singletonList(new KeyValue(-1,"Execution")))  ;
		}
		else if("111006".equals(req.getCurrentRefTypeId().toString())){
			model.addAttribute("sections", Collections.singletonList(new KeyValue(-1,"Query")))  ;
		}
		else if("111007".equals(req.getCurrentRefTypeId().toString())){
			model.addAttribute("sections", Collections.singletonList(new KeyValue(-1,"Note")))  ;
		}
		else if("111008".equals(req.getCurrentRefTypeId().toString())){
			model.addAttribute("sections", Collections.singletonList(new KeyValue(-1,"Anaylsis Report")))  ;
		}
		else if("111009".equals(req.getCurrentRefTypeId().toString())){
			model.addAttribute("sections", Collections.singletonList(new KeyValue(-1,"Client Action Plan Sponsored")))  ;
		}
		else if("111010".equals(req.getCurrentRefTypeId().toString())){
			model.addAttribute("sections", Collections.singletonList(new KeyValue(-1,"Client Action Plan")))  ;
		}
		else if("111011".equals(req.getCurrentRefTypeId().toString())){
			model.addAttribute("sections", Collections.singletonList(new KeyValue(-1,"Advisor Action Plan")))  ;
		}
		else if("111012".equals(req.getCurrentRefTypeId().toString())){
			model.addAttribute("sections", Collections.singletonList(new KeyValue(-1,"Data Collection")))  ;
		}
		
		else {
			model.addAttribute("sections", Collections.singletonList(new KeyValue(-1,"--Select--")))  ;
		}
		}
	}
	
	
	@RequestMapping(value = "/files/{id}", method = RequestMethod.GET)
	@ResponseBody
	public void downloadFile(@PathVariable("id") Integer docId, HttpServletRequest request, HttpServletResponse response) {

		DocumentService docService = getBean(DocumentService.class);
		DocumentRequest req = new DocumentRequest();
		UserSession user = AbstractController.getSessionUser();
		
		req.setBuId(user.getBuId());
		req.setPartyId(user.getPartyId());
		req.setDocumentId(docId);
		DocumentData doc = docService.getDocument(req);
		
//		String fileType = StringUtils.substringAfterLast(doc.getFileName(), ".");
		String fileType = doc.getFileName().substring(doc.getFileName().lastIndexOf(".")+1);
		
		response.setContentType(getContentType(fileType));
		response.setHeader("Content-Disposition", "attachment; filename=\"" + doc.getFileName() + "\"");
		
		try {
			FileCopyUtils.copy(new FileInputStream(doc.getFileStoragePathURI()), response.getOutputStream());
			response.flushBuffer();
		} catch (Exception e) {
			e.printStackTrace();
		} 
        
       // response.setHeader("Content-Disposition", "attachment; filename="+doc.getFileName());
		
//	    return new FileSystemResource(doc.getFileStoragePathURI()); 
	}

	@RequestMapping(value = "/images", method = RequestMethod.GET)
	@ResponseBody
	public void images(@RequestParam("path") String path, HttpServletResponse response) {
		DocumentService docService = getBean(DocumentService.class);
		DocumentRequest req = new DocumentRequest();
		UserSession user = AbstractController.getSessionUser();
		
		req.setBuId(user.getBuId());
		req.setPartyId(user.getPartyId());
		
		String storagePath= docService.getStoragePath(user.getPartyId(),user.getBuId(), 98083);
		File file = new File(storagePath+"/"+path);

		if(!file.exists()){
			file = new File(storagePath+"/"+StringUtils.replaceOnce(path, "images/", ""));
		}

		if(!file.exists()){
			file = new File(storagePath+"/images/"+path);
		}

		response.setContentType("image/jpeg");
		
		
		try {
			if(file.exists()){
				FileCopyUtils.copy(new FileInputStream(file), response.getOutputStream());
				response.flushBuffer();
			}
			else{
				LogFactory.getLog(getClass()).error("Image Found for path >"+path +" With Storage Path >"+storagePath);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} 
        
       // response.setHeader("Content-Disposition", "attachment; filename="+doc.getFileName());
		
//	    return new FileSystemResource(doc.getFileStoragePathURI()); 
	}

	private String getContentType(String fileType){
		if("pdf".equalsIgnoreCase(fileType)){
			return "application/pdf";
		}
		if("doc".equalsIgnoreCase(fileType)||"docx".equalsIgnoreCase(fileType)){
			return "application/msword";
		}
		if("xls".equalsIgnoreCase(fileType)){
			return "application/vnd.ms-excel";
		}
		if(FiinfraUtility.isImageType(fileType)){
			return "application/image";
		}

		return "application/octet-stream";
		
	}

	private void populateAddForm(Model model){
		DocumentService service = getBean(DocumentService.class);
		
		 model.addAttribute("documentTypes", toKeyValue(service.getCodeValue("10")))  ;
	}

}
