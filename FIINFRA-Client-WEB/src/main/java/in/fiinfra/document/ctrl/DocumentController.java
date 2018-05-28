package in.fiinfra.document.ctrl;

import in.fiinfra.common.common.CodeValueData;
import in.fiinfra.common.common.DocumentData;
import in.fiinfra.common.common.DocumentRequest;
import in.fiinfra.common.diy.models.KeyValue;
import in.fiinfra.common.diy.models.UserSession;
import in.fiinfra.common.util.BaseResponse;
import in.fiinfra.common.util.FiinfraUtility;
import in.fiinfra.cp.common.ctrl.AbstractController;
import in.fiinfra.cp.common.util.AuthHandler;
import in.fiinfra.cp.common.util.Link;
import in.fiinfra.document.service.DocumentService;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;
import org.apache.commons.logging.LogFactory;
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
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping(value = "/document")
public class DocumentController extends AbstractController {
	@Value("${app.image.path}")
	private String APP_IMAGE_PATH;

	@Link(label="Add Document", family="My Documents", parent = "My Documents" )
	@RequestMapping(value = "/add", method = RequestMethod.GET)
	public String viewDoc(Model m, DocumentRequest req,
			HttpServletRequest request) {

		DocumentData doc = new DocumentData();
		
		populateAddForm(m);
		populateSections(m);
		m.addAttribute("document", doc);
		m.addAttribute("q",req);
		m.addAttribute("returnUrl", "document/view"); 
		return "document/add-doc-upload-file";
	}

	@RequestMapping(value = "/edit", method = RequestMethod.GET)
	public String ediDoc(Model m, DocumentRequest req,
			HttpServletRequest request) {

		UserSession user = AuthHandler.getCurrentUser(); 
		
		req.setPartyId(user.getPartyId());
		DocumentService docService = getBean(DocumentService.class);
		DocumentData doc =  docService.getDocument(req);
		if(doc ==null){
			doc = new DocumentData();
		}
		
		populateAddForm(m);
		populateSections(m);
		m.addAttribute("document", doc);
		m.addAttribute("q",req);
		m.addAttribute("returnUrl", "document/view"); 
		return "document/add-doc-upload-file";
	}

	@Link(label="Preview", family="My Documents", parent = "My Documents" )
	@RequestMapping(value = "/preview", method = RequestMethod.GET)
	public String viewDocPreview(Model m, DocumentRequest q, DocumentData data,
			HttpServletRequest request) {

		UserSession user = AuthHandler.getCurrentUser();
		q.setPartyId(user.getPartyId());

		DocumentService docService = getBean(DocumentService.class);
		DocumentData document = docService.getDocument(q);
		populatePreviewForm(m, q);
		populateSections(m);
		m.addAttribute("document", document);
		m.addAttribute("q", q);

		return "document/add-document-preview-full";
	}

	@Link(label="My Documents", family="My Documents", parent = "" )
	@RequestMapping(value = "/view", method = RequestMethod.GET)
	public String docPreview(Model m, DocumentRequest q,
			HttpServletRequest request) {

		UserSession user = AuthHandler.getCurrentUser();
		q.setPartyId(user.getPartyId());
		DocumentService docService = getBean(DocumentService.class);
		populatePreviewForm(m, q);

		List<DocumentData> documents = docService.getDocuments(q);
		m.addAttribute("documents", documents);
		populateSectionsDocView(m);
		m.addAttribute("q", q);

		return "document/add-document-preview";
	}

	@RequestMapping(value = "/view.ajax", method = RequestMethod.GET)
	public String viewDocAjax(Model m, DocumentRequest q) {

		DocumentService docService = getBean(DocumentService.class);
		List<DocumentData> documents = docService.getDocuments(q);
		q.setRefId(0);
		q.setRefTypeId(0);

		m.addAttribute("documents", documents);
		m.addAttribute("q", q);
		return "document/ajaxPreview";
	}

	@RequestMapping(value = "/save", method = RequestMethod.POST)
	public String createDocument(@ModelAttribute("document") DocumentData doc,
			BindingResult result, Model m,
			final RedirectAttributes redirectAttributes,
			HttpServletRequest request, BindingResult bindingResult,
			HttpServletResponse response) {
		StringBuilder errorMsg = new StringBuilder();

		String returnUrl = request.getParameter("returnUrl");
		m.addAttribute("returnUrl", returnUrl);

		UserSession user = AbstractController.getSessionUser();
		doc.setPartyId(user.getPartyId());
		doc.setCreatedBy(user.getUserId());
		

		if (StringUtils.isEmpty(doc.getDocumentName())) {
			errorMsg.append("Empty Document Name  ");
			bindingResult.addError(new FieldError("document", "documentName",
					"Empty Document Name"));
		}
		
		if ( (doc.getFiles() == null || doc.getFiles().isEmpty()) && doc.getDocumentId() <=0 ) {
			errorMsg.append("Empty File   ");
			bindingResult.addError(new FieldError("document", "files",
					"Empty File"));
		}

		if(doc.getFiles() != null && !doc.getFiles().isEmpty()){
			MultipartFile f = doc.getFiles().get(0);
		String fileName = f.getOriginalFilename();
			if(!StringUtils.isEmpty(f.getOriginalFilename())){
				
			
			String fileType = fileName.substring(fileName.lastIndexOf(".")+1);
			if(!isValidFile(fileType)){
				errorMsg.append("Invalid File   ");
				bindingResult.addError(new FieldError("document", "files",
						"Invalid File"));
			}
		}
		}
		

		// if (doc.getRefId() == null || doc.getRefTypeId() == null
		// || doc.getRefId() <= 0 || doc.getRefTypeId() <= 0) {
		// errorMsg.append("Invalid RefId/RefType").append("\n");
		// bindingResult.addError(new FieldError("document", "refId",
		// "Invalid RefId/RefType"));
		// }

		// if(StringUtils.isEmpty(doc.getDescription())){
		// bindingResult.addError(new FieldError("document","description",
		// "Empty Description"));
		// }

		if (bindingResult.hasErrors()) {
			populateAddForm(m);
			m.addAttribute("error", errorMsg.toString());
			return "document/add-doc-upload-file";
		}

		if (!bindingResult.hasErrors()) {
			DocumentService service = getBean(DocumentService.class);
			try {
				File imagesPath = new File(APP_IMAGE_PATH);
				
				int sucess = service.addDocument(user.getBuId(), doc, imagesPath);
				if(sucess <=0){
					populateAddForm(m);
					m.addAttribute("error", "Error while Saving Document");
					return "document/add-doc-upload-file";
					
				}
			} catch (Exception e) {
				bindingResult.addError(new FieldError("document", "files", e
						.getMessage()));
				
				populateAddForm(m);
				m.addAttribute("error", e.getMessage());
				return "document/add-doc-upload-file";
			}
		}
		
		redirectAttributes.addFlashAttribute("success",
				getMessage("success.document.save"));

		return "redirect:view?returnUrl=" + returnUrl +	"&refTypeId=-1" ;
	}
	
	private void populateSections(Model model){
		List<KeyValue> lstSections = new ArrayList<KeyValue>();
		lstSections.add(new KeyValue(-1,"--Select--"));
		lstSections.add(new KeyValue(111017,"General"));
//		lstSections.add(new KeyValue(111004,"ActionPlan"));
//		lstSections.add(new KeyValue(111005,"Execution"));
//		lstSections.add(new KeyValue(111006,"Query"));
//		lstSections.add(new KeyValue(111013,"General"));
		
		model.addAttribute("sections",	lstSections);
	}

	private void populateSectionsDocView(Model model){
		List<KeyValue> lstSections = new ArrayList<KeyValue>();
		lstSections.add(new KeyValue(-1,"--Select--"));
		
		lstSections.add(new KeyValue(111004,"ActionPlan"));
		lstSections.add(new KeyValue(111008,"Anaylsis Report"));
		lstSections.add(new KeyValue(111005,"Execution"));
		lstSections.add(new KeyValue(111020,"Financial X-Ray"));
		lstSections.add(new KeyValue(111017,"General"));
		lstSections.add(new KeyValue(111001,"Party"));
		lstSections.add(new KeyValue(111006,"Query"));
		
		model.addAttribute("sections",	lstSections);
	}
	private void populatePreviewForm(Model model, DocumentRequest req) {
		DocumentService service = getBean(DocumentService.class);
		model.addAttribute("documentTypes",
				toKeyValue(service.getCodeValue("10")));
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
		

		try {
			File f = new File(doc.getFileStoragePathURI());
			if(f.exists()){
				String fileType = doc.getFileName().substring(doc.getFileName().lastIndexOf(".")+1);
		response.setContentType(getContentType(fileType));
				response.setHeader("Content-Disposition", "inline; filename=\"" + doc.getFileName() + "\"");
				FileCopyUtils.copy(new FileInputStream(doc.getFileStoragePathURI()), response.getOutputStream());
			response.flushBuffer();
			}
			else{
				PrintWriter writer;
				try {
					writer = response.getWriter();
				} catch (IOException e1) {
					try {
						response.sendRedirect("/document/view");
					} catch (IOException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					};
					return ;
				}
				writer.write("<div id='errorMsg'>Error downloading File. File Not Found. </div>");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

       // response.setHeader("Content-Disposition", "attachment; filename="+doc.getFileName());

		// return new FileSystemResource(doc.getFileStoragePathURI());
	}

	@RequestMapping(value = "/images", method = RequestMethod.GET)
	@ResponseBody
	public void images(@RequestParam("path") String path,
			HttpServletResponse response) {
		DocumentService docService = getBean(DocumentService.class);
		DocumentRequest req = new DocumentRequest();
		UserSession user = AbstractController.getSessionUser();

		req.setBuId(user.getBuId());
		req.setPartyId(user.getPartyId());

		String storagePath = docService.getStoragePath(user.getPartyId(),
				user.getBuId(), 98083);
		File file = new File(storagePath + "/" + path);

		if (!file.exists()) {
			file = new File(storagePath + "/"
					+ StringUtils.replaceOnce(path, "images/", ""));
		}

		if (!file.exists()) {
			file = new File(storagePath + "/images/" + path);
		}

		response.setContentType("image/jpeg");

		try {
			if (file.exists()) {
				FileCopyUtils.copy(new FileInputStream(file),
						response.getOutputStream());
				response.flushBuffer();
			} else {
				LogFactory.getLog(getClass()).error(
						"File not Found for path >" + path
								+ " With Storage Path >" + storagePath);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		// response.setHeader("Content-Disposition",
		// "attachment; filename="+doc.getFileName());

		// return new FileSystemResource(doc.getFileStoragePathURI());
	}

	public static boolean isValidFile(String fileType) {
		if ("pdf".equalsIgnoreCase(fileType)) {
			return true;
		}
		if ("doc".equalsIgnoreCase(fileType)
				|| "docx".equalsIgnoreCase(fileType)) {
			return true;
		}
		if ("xls".equalsIgnoreCase(fileType) || "xlsx".equalsIgnoreCase(fileType)) {
			return true;
		}
		if ("ppt".equalsIgnoreCase(fileType) || "pptx".equalsIgnoreCase(fileType) ) {
			return true;
		}
		if ("pdf".equalsIgnoreCase(fileType)) {
			return true;
		}
		if ("jpg".equalsIgnoreCase(fileType)) {
			return true;
		}
		if ("png".equalsIgnoreCase(fileType)) {
			return true;
		}
		if ("jpeg".equalsIgnoreCase(fileType)) {
			return true;
		}
		if ("gif".equalsIgnoreCase(fileType)) {
			return true;
		}
		if (FiinfraUtility.isImageType(fileType)) {
			return true;
		}
		
		return false;
	}

	public static String getContentType(String fileType) {
		if ("pdf".equalsIgnoreCase(fileType)) {
			return "application/pdf";
		}
		if ("doc".equalsIgnoreCase(fileType)
				|| "docx".equalsIgnoreCase(fileType)) {
			return "application/msword";
		}
		if ("xls".equalsIgnoreCase(fileType)) {
			return "application/vnd.ms-excel";
		}
		if (FiinfraUtility.isImageType(fileType)) {
			return "application/image";
		}

		return "application/octet-stream";

	}

	private void populateAddForm(Model model) {
		DocumentService service = getBean(DocumentService.class);
        List<CodeValueData> documentTypes = service.getCodeValue("10");
        Collections.sort(documentTypes);
		model.addAttribute("documentTypes",
				toKeyValue(documentTypes));
		List<KeyValue> lstSections = new ArrayList<KeyValue>();
		lstSections.add(new KeyValue(-1,"--Select--"));
		lstSections.add(new KeyValue(111017,"General"));
//		lstSections.add(new KeyValue(111004,"ActionPlan"));
//		lstSections.add(new KeyValue(111005,"Execution"));
//		lstSections.add(new KeyValue(111006,"Query"));
//		lstSections.add(new KeyValue(111013,"General"));
		
		model.addAttribute("sections",	lstSections);

	}

	@RequestMapping(value = "/delete", method=RequestMethod.POST)
	public @ResponseBody BaseResponse<String> deleteDocument( Model m,HttpServletRequest request, final RedirectAttributes redirectAttributes ,
			DocumentRequest q) {
		
		UserSession userSession = AuthHandler.getCurrentUser();
		q.setPartyId(userSession.getPartyId());
		
		
		DocumentService service = getRestService(DocumentService.class);
		BaseResponse<String> response  = new BaseResponse<String>();
		response.setResponseObject(service.deleteDocument(q));
		return response;
	}
	
}
