package in.fiinfra.serviceportal.facade;



import in.fiinfra.common.service.vo.Download;
import in.fiinfra.common.service.vo.FileUpload;
import in.fiinfra.common.service.vo.Partner;
import in.fiinfra.common.util.BaseResponse;
import in.fiinfra.common.util.FiinfraResponseBuilder;
import static in.fiinfra.common.util.FiinfraConstants.LOCATION_TO_UPLOADFILE;
import in.fiinfra.serviceportal.service.DownloadServices;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.ws.rs.Consumes;
import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;
import javax.ws.rs.QueryParam;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;

import org.apache.log4j.Logger;
import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.multiaction.MultiActionController;

@Controller
@Path("/downloadsp")
public class DownloadController extends MultiActionController
{
private static final Logger logger = Logger.getLogger(DownloadController.class);
	
	Response response;
	String url;
	@Autowired
	DownloadServices downloadServices;
	private ObjectMapper objectMapper;	
	
	
	public DownloadServices getDownloadServices() {
		return downloadServices;
	}
	public void setDownloadServices(DownloadServices downloadServices) {
		this.downloadServices = downloadServices;
	}
	public ObjectMapper getObjectMapper() {
		return objectMapper;
	}
	public void setObjectMapper(ObjectMapper objectMapper) {
		this.objectMapper = objectMapper;
	}


	
	@POST
	@Consumes(MediaType.APPLICATION_JSON)
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/addNewDownload/{user}/{token}")
	public Response addNewDownload(Download download,
			@PathParam("token") String token, @PathParam("user") String name){		
			
		
		//downloadServices.addNewDownload(download.getIsDocumentBinary(), download.getDocumentName(), download.getFileName(), download.getFileStoragePathURI(), download.getFileSizeKB(), download.getParty(), download.isDownloadModule(), download.getDownloadModuleID(), download.getDownloadDescription(), download.getCreatedBy(), download.getLastModifiedBy(), download.getIsShareEmail(), download.getIsShareView(), download.getIsShareDownload(), download.getDownloadExpiryDate());
		downloadServices.addNewDownload(download);
		BaseResponse<List<Download>> br=new BaseResponse<>();
		response=FiinfraResponseBuilder.getSuccessResponse(br, null);
		return response;
	}
	

	@POST
	@Consumes(MediaType.APPLICATION_JSON)
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/addDCcolletral/{user}/{token}")
	public Response addDCcolletral(Download download,
			@PathParam("token") String token, @PathParam("user") String name){		
			
		
		//dccolletralServices.addDCcolletral(download.getIsDocumentBinary(), download.getDocumentName(), download.getFileName(), download.getFileStoragePathURI(), download.getFileSizeKB(), download.getParty(), download.getCreatedBy(), download.getLastModifiedBy() );
		/*downloadServices.addDCcolletral(download);
		BaseResponse<List<Download>> br=new BaseResponse<>();
		response=FiinfraResponseBuilder.getSuccessResponse(br, null);
		return response;*/
		System.out.println("in Facade ");
		BaseResponse<Boolean> baseResponse = new BaseResponse<Boolean>();
		System.out.println("after in Facade ");
		baseResponse.setResponseObject(downloadServices.addDCcolletral(download));
		response = FiinfraResponseBuilder.getSuccessResponse(baseResponse, null);
		return response;
		
	}
//	
	
	@POST
	@Consumes(MediaType.APPLICATION_JSON)
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/editDocument/{user}/{token}")
	public Response editDocument(Download download,
			@PathParam("token") String token, @PathParam("user") String name){	
		
		//downloadServices.editDocument(download.getDocumentId(),download.getDocumentName(),download.getFileName(),download.getFileStoragePathURI(),download.getFileSizeKB(),download.getParty(),  		download.getDownloadModuleID(),download.getDownloadDescription(),download.getCreatedBy(),download.getIsShareEmail(),download.getIsShareView(),  		download.getIsShareDownload(),  		download.getDownloadExpiryDate());
		downloadServices.editDocument(download);
		BaseResponse<List<Download>> br=new BaseResponse<>();
		response=FiinfraResponseBuilder.getSuccessResponse(br, null);
		return response;
	}
	
	

	@GET
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/getPartyByPartyId/{user}/{token}")
	public Response getPartyByPartyId(@PathParam("token") String token,
			@PathParam("user") String name) {
		   BaseResponse<Download> br = new BaseResponse<>();
		   response=downloadServices.getPartyByPartyId();
		   logger.info(br);
			return response;
	}
	
	@GET
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/getDownloadSection/{user}/{token}")
	public Response getDownloadSection(@PathParam("token") String token,
			@PathParam("user") String name) {
		   BaseResponse<Download> br = new BaseResponse<>();
		   response=downloadServices.ShowDownloadSection();
		   logger.info(br);
			return response;
	}
	
	@GET
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/showDownloadedList/{user}/{token}")
	public Response showDownloadedList(@PathParam("token") String token,
			@PathParam("user") String name, @QueryParam("searchText") String searchText) {
		   BaseResponse<Download> br = new BaseResponse<>();
		   response=downloadServices.showDownloadedList(searchText);
		   logger.info(br);
			return response;
	}
	
	
	@GET
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/getDCcolletral/{user}/{token}")
	public Response getDCcolletral(@PathParam("token") String token,
			@PathParam("user") String name, @QueryParam("searchText") String searchText) {
		   BaseResponse<Download> br = new BaseResponse<>();
		   response=downloadServices.getDCcolletral(searchText);
		   logger.info(br);
			return response;
	}
	
	
	
	@GET
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/deleteDownloadList/{user}/{token}")
	public Response deleteDownloadList(@QueryParam("Lists") String selectedlvalz,@QueryParam("userid") int userid,@PathParam("token") String token,
			@PathParam("user") String name) {
		   BaseResponse<Download> br = new BaseResponse<>();
		   response=downloadServices.deleteDownloadList(selectedlvalz,userid);
		   logger.info(br);
			return response;
	}
	
	
	@GET
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/deleteDCcolletral/{user}/{token}")
	public Response deleteDCcolletral(@QueryParam("Lists") String selectedlvalz,@QueryParam("userid") int userid,@PathParam("token") String token,
			@PathParam("user") String name) {
		   BaseResponse<Download> br = new BaseResponse<>();
		   response=downloadServices.deleteDownloadList(selectedlvalz,userid); // here calling Download api
		   logger.info(br);
			return response;
	}
	
	
	
	@GET
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/getFileName/{user}/{token}")
	public Response getFileName(@QueryParam("editftxtid") String editftxtid,@QueryParam("documentId") int documentId,@PathParam("token") String token,
			@PathParam("user") String name) {
		   BaseResponse<Download> br = new BaseResponse<>();
		   logger.info(br);
		   List<Download> returnedFileName=downloadServices.fileName(documentId);
		   String fileNamee = null;
	    	 for(Download d: returnedFileName){
	      		  
	    		 d.setFileNamee(d.getFileName());
	    		 // request.setAttribute("fileNamee", d.getFileName());
	    		 fileNamee= d.getFileName();
	    		 logger.info("filename:"+fileNamee);
	    		
	    	  }
	    	 String filePathName=LOCATION_TO_UPLOADFILE+fileNamee;
	    	 File file2 = new File(filePathName);
	    	 if(editftxtid.equalsIgnoreCase(fileNamee)){
	    		 ;
	    	 }else{
		    	 if (file2.exists()) 
		    	 { 
		    	  response = FiinfraResponseBuilder.getSuccessResponse(br, null);
		          logger.info("delete file incase of  overwriting");
		          file2.delete();
		         }
	    	 }
			return response;
	}
	

	/*public ModelAndView addNewDownload(HttpServletRequest request,
			HttpServletResponse response, FileUpload fileUpload) throws IOException, ParseException
	{	
	    int partyId = 0;
	    String bizUnitName=null;
		String downloadSectionName =null;
		int downloadModuleID=0;
		
		String documentName= null;
		String downloadDescription =null;
		boolean isShareDownload = false;
		boolean isShareEmail = false;
		boolean isShareView = false;
		Date downloadExpiryDate = null;
		
		SimpleDateFormat formatter = null;
		File baseFolder=null;
		String fileName = null;
		String extension = null;
		String basePath = null;
		MultipartFile multipartFile = null;
		try {
			 multipartFile = (fileUpload).getFile();
			String originalFileName = "";
			// originalFileName=request.getParameter("filename");

			if (multipartFile != null) {
				originalFileName = multipartFile.getOriginalFilename();
				System.out.println("FILE SIZE in KB:::::"+multipartFile.getSize()/1024+"kb");
			
			if(multipartFile.getSize() > 0 && multipartFile.getSize()<=10000000){

			long currentTime = System.currentTimeMillis();
			 basePath = "D:/App/uploadedfiles";
			 baseFolder = new File(basePath);
			 fileName = null;
			 extension = null;
			fileName = originalFileName.substring(0,
					originalFileName.lastIndexOf("."));
			extension = originalFileName.substring(originalFileName
					.lastIndexOf("."));
			logger.info("File name is :--" + fileName);
			logger.info("extension is:--" + extension);
			String[] s = extension.split(".");
			if(s[0].equalsIgnoreCase("BMP")){
				String filetypeId = "11001";
			}
			logger.info("filename to set:---" + fileName + "_"
					+ currentTime + extension);
			fileName = fileName + "_" + currentTime + extension;
			String filePath = basePath + "\\" + fileName;
			logger.info("filePath:-------" + filePath);
			File fileToUpload = new File(filePath);
			if (baseFolder.exists()) {
				
				 * FileUtils.deleteDirectory(baseFolder); baseFolder = new
				 * File(basePath); baseFolder.mkdirs();
				 } else {
				baseFolder.mkdirs();// creates directory
			}
			// uploads file to that directory

			logger.info("fileToUpload::" + fileToUpload);
			multipartFile.transferTo(fileToUpload);
			}else{
				logger.info("Size  should be less than 10000000 bytes and greater than 0.");
				//return ;
			}
		 }
		  } catch (Exception e) {
			e.printStackTrace();
			// logger.error(e.getMessage());
		}
		
		
		if(request.getParameter("bizUnitName")!=null){
			bizUnitName = request.getParameter("bizUnitName");			
			logger.info("bizUnitName:"+bizUnitName);
			partyId=Integer.parseInt(bizUnitName);
		}
		
		if(request.getParameter("downloadSectionName")!=null){
			downloadSectionName = request.getParameter("downloadSectionName");
			logger.info("downloadSectionName:"+downloadSectionName);
			downloadModuleID=Integer.parseInt(downloadSectionName);
		}
		if(request.getParameter("documentName")!=null){
			documentName = request.getParameter("documentName");
			logger.info("documentName:"+documentName);
		}
		if(request.getParameter("descriptionNote")!=null){
			downloadDescription = request.getParameter("descriptionNote");
			logger.info("descriptionNote:"+downloadDescription);
		}
		if(request.getParameter("viewName")!=null){
					
			if(request.getParameter("viewName").equals("on") || request.getParameter("viewName").equals("1")){
				logger.info("viewName:"+request.getParameter("viewName"));
				isShareView = true;
		}
			
	   }
		if(request.getParameter("emailName")!=null){
			if(request.getParameter("emailName").equals("on") || request.getParameter("emailName").equals("1")){
				logger.info("emailName:"+request.getParameter("emailName"));
				isShareEmail = true;
			}
			
		}
		if(request.getParameter("downloadName")!=null){
			if(request.getParameter("downloadName").equals("on") || request.getParameter("downloadName").equals("1")){
				logger.info("downloadName:"+request.getParameter("downloadName"));
				isShareDownload = true;
			}
		}
		if(request.getParameter("datepickerName")!=null){
			formatter = new SimpleDateFormat("dd/MM/yyyy");			
			
			
			try {
				String expdate=request.getParameter("datepickerName");
				  
				downloadExpiryDate =(Date) formatter.parse(expdate);
			   
			    
				logger.info(downloadExpiryDate);
				logger.info(formatter.format(downloadExpiryDate));
			  }
			  catch(Exception e)
			  {
			   e.printStackTrace();
			  }
			
			logger.info("datepickerName:"+downloadExpiryDate);
		     }
		
		
		
		//downloadServices.addNewDownload(10001,documentText,false,documentName,23,fileName,basePath,2555,multipartFile.getSize()/1024,partyId,true,downloadModuleID,downloadDescription,222,4444,45545,33333,true,true,true);
		if(fileName!=null && documentName!=null && basePath!=null && multipartFile!=null && partyId!=0 && downloadModuleID!=0 &&  downloadDescription!=null && downloadExpiryDate!=null){
			if(request.getParameter("hiddenIsToClose")!=null && request.getParameter("hiddenIsToClose").equals("0"))
			{
				request.setAttribute("hiddenIsToClosee","0");
				
			}else{
				
				request.setAttribute("hiddenIsToClosee","");
			}
			
			downloadServices.addNewDownload(false,documentName,fileName,basePath,(int) (multipartFile.getSize()/1024),partyId,
					true,downloadModuleID,downloadDescription,222,4444,isShareEmail,isShareView,isShareDownload,downloadExpiryDate);
		}
		
		
		String s = "/"; 
		return new ModelAndView("redirect:"+s+"loaddownloadlist.htm?isToClose="+request.getParameter("hiddenIsToClose")+"");
	}
	
	
	    public void getPartyByPartyId(HttpServletRequest request,
			HttpServletResponse response) throws IOException{
	    	List<Download> party=downloadServices.getPartyByPartyId();
	    	logger.info("party name: ");
	    	
	    	  Gson gson = new Gson();
	    	  System.out.println(gson.toJson(party));
	    	  System.out.println(party);
	    	  PrintWriter out=null ; 
	    	  out = response.getWriter();	    	   
	    	  response.setContentType("application/json");
	    	  objectMapper.writeValue( out,party);    	
	    	
	    	
	    }
	    public  void getDownloadSection(HttpServletRequest request,
			HttpServletResponse response) throws IOException{
	    	List<Download> codeValue=downloadServices.ShowDownloadSection();

	    	  Gson gson = new Gson();
	    	  logger.info(gson.toJson(codeValue));
	    	  logger.info(codeValue);
	    	  PrintWriter out=null ; 
	    	  out = response.getWriter();	    	   
	    	  response.setContentType("application/json");
	    	  objectMapper.writeValue( out,codeValue);
			
		}
	    
	    
	    public ModelAndView editDocument(HttpServletRequest request,
				HttpServletResponse response,FileUpload fileUpload) throws IOException, ParseException
				{
	    	int partyId = 0;
		    String editBizUnitName=null;
			String editDownloadSectionName =null;
			int downloadModuleID=0;
			
			String editDocumentName= null;
			String downloadDescription =null;
			boolean isShareDownload = false;
			boolean isShareEmail = false;
			boolean isShareView = false;
			Date downloadExpiryDate = null;
			String documentIds;
			int documentId=0;
			
			SimpleDateFormat formatter = null;
			File baseFolder=null;
			String fileName = null;
			String extension = null;
			String basePath = null;
			MultipartFile multipartFile = null;
			try {
				 multipartFile = (fileUpload).getEditfile();
				String originalFileName = "";
				// originalFileName=request.getParameter("filename");

				if (multipartFile != null) {
					originalFileName = multipartFile.getOriginalFilename();
				
			
				logger.info("FILE SIZE in KB:::::"+multipartFile.getSize()/1024+"kb");
				if(multipartFile.getSize() > 0 && multipartFile.getSize()<=10000000){

				long currentTime = System.currentTimeMillis();
				 basePath = "D:/App/uploadedfiles";
				 baseFolder = new File(basePath);
				 fileName = null;
				 extension = null;
				fileName = originalFileName.substring(0,
						originalFileName.lastIndexOf("."));
				extension = originalFileName.substring(originalFileName
						.lastIndexOf("."));
				logger.info("File name is :--" + fileName);
				logger.info("extension is:--" + extension);
				String[] s = extension.split(".");
				if(s[0].equalsIgnoreCase("BMP")){
					String filetypeId = "11001";
				}
				logger.info("filename to set:---" + fileName + "_"
						+ currentTime + extension);
				fileName = fileName + "_" + currentTime + extension;
				String filePath = basePath + "\\" + fileName;
				logger.info("filePath:-------" + filePath);
				File fileToUpload = new File(filePath);
				if (baseFolder.exists()) {
					
					 * FileUtils.deleteDirectory(baseFolder); baseFolder = new
					 * File(basePath); baseFolder.mkdirs();
					 } else {
					baseFolder.mkdirs();// creates directory
				}
				// uploads file to that directory

				logger.info("fileToUpload::" + fileToUpload);
				multipartFile.transferTo(fileToUpload);
				}else{
					logger.info("Size  should be less than 10000000 bytes and greater than 0.");
					//return ;
				}
			  }
			  } catch (Exception e) {
				e.printStackTrace();
				// logger.error(e.getMessage());
			}
			
			
			if(request.getParameter("editBizUnitName")!=null){
				editBizUnitName = request.getParameter("editBizUnitName");			
				logger.info("editBizUnitName:"+editBizUnitName);
				partyId=Integer.parseInt(editBizUnitName);
			}
			
			if(request.getParameter("editDownloadSectionName")!=null){
				editDownloadSectionName = request.getParameter("editDownloadSectionName");
				logger.info("editDownloadSectionName:"+editDownloadSectionName);
				downloadModuleID=Integer.parseInt(editDownloadSectionName);
			}
			if(request.getParameter("editDocumentNametxtName")!=null){
				editDocumentName = request.getParameter("editDocumentNametxtName");
				logger.info("editDocumentName:"+editDocumentName);
				
			}
			if(request.getParameter("editDescriptionNote")!=null){
				downloadDescription = request.getParameter("editDescriptionNote");
				logger.info("descriptionNote:"+downloadDescription);
			}
			if(request.getParameter("editViewName")!=null){
						
				if(request.getParameter("editViewName").equals("on") || request.getParameter("editViewName").equals("1")){
					logger.info("editViewName:"+request.getParameter("editViewName"));
					isShareView = true;
				}
				
			}
			if(request.getParameter("editEmailName")!=null){
				if(request.getParameter("editEmailName").equals("on") || request.getParameter("editEmailName").equals("1")){
					logger.info("editEmailName:"+request.getParameter("editEmailName"));
					isShareEmail = true;
				}
				
			}
			if(request.getParameter("editDownloadName")!=null){
				if(request.getParameter("editDownloadName").equals("on") || request.getParameter("editDownloadName").equals("1")){
					logger.info("editDownloadName:"+request.getParameter("editDownloadName"));
					isShareDownload = true;
				}
			}
			 
				if(request.getParameter("editDatepickerName")!=null){
				  
				
					formatter = new SimpleDateFormat("dd/MM/yyyy");			
					
					
					try {
						String expdate=request.getParameter("editDatepickerName");
						  
						downloadExpiryDate =(Date) formatter.parse(expdate);
					   
					    
						logger.info(downloadExpiryDate);
						logger.info(formatter.format(downloadExpiryDate));
					  }
					  catch(Exception e)
					  {
					   e.printStackTrace();
					  }
					
			 
				}
			 
			 
			 
			if(request.getParameter("hdndocumentIdNm")!=null){
				 documentIds = request.getParameter("hdndocumentIdNm");					
					documentId=Integer.parseInt(documentIds);
					logger.info("documentName:"+documentId);
				
			}
			
			
			
			
			if(documentId!=0 && editDocumentName!=null  && partyId!=0 && downloadModuleID!=0 && downloadDescription!=null && downloadExpiryDate!=null){
				
				request.setAttribute("hiddenIsToClosee","");
				if(request.getParameter("hiddenEditIsToClose")!=null && request.getParameter("hiddenEditIsToClose").equals("1"))
				{
					request.setAttribute("hiddenEditIsToClosee","1");
					
				}
				
				if(fileName!=null && basePath!=null && multipartFile!=null){
					
					downloadServices.editDocument(documentId,editDocumentName,fileName,basePath,(int) (multipartFile.getSize()/1024),partyId,
							downloadModuleID,downloadDescription,222,isShareEmail,isShareView,isShareDownload,downloadExpiryDate);
					
					
				}
				
			
				
				else {
	                int  sizeKB= Integer.parseInt(request.getParameter("hdnsizekbNm"));
	                String fileName1 =request.getParameter("editftxtid");
	                String basepath1 =request.getParameter("hdnbasepathNm").trim();
	                logger.info("basepath:::::"+basepath1);
				
					downloadServices.editDocument(documentId,editDocumentName,fileName1,basepath1,sizeKB,partyId,
							downloadModuleID,downloadDescription,222,isShareEmail,isShareView,isShareDownload,downloadExpiryDate);
					
					
				}
				logger.info("editftxtid:"+request.getParameter("editftxtid"));
				
				
			}
			
			String s = "/"; 
			return new ModelAndView("redirect:"+s+"loaddownloadlist.htm?isToClosee="+request.getParameter("hiddenEditIsToClose")+"");
		}
	    
	    public void deleteDownloadList(HttpServletRequest request,HttpServletResponse response) throws IOException 
  {
		logger.info("in delete method");
		if (request.getParameter("selectedlvalz") != null) {

			String codetypeIds = request.getParameter("selectedlvalz");
			logger.info(codetypeIds);

			List<Download> abcd = downloadServices
					.deleteDownloadList(codetypeIds);

			PrintWriter out = null;
			out = response.getWriter();
			response.setContentType("application/json");
			objectMapper.writeValue(out, abcd);

		}
	}
	    public List<Download> getCodetypeList()
		   {
			   return downloadServices.showDownloadedList();
		   }
	    
	    public void getFileName(HttpServletRequest request,HttpServletResponse response)throws IOException
		   {
	    	
	    	logger.info("editftxtid:"+request.getParameter("editftxtid"));
	    	
	    	logger.info("hdndocumentId::"+request.getParameter("hdndocumentIdd")); 
	    	String  s = request.getParameter("hdndocumentIdd");
	    	int documentId = Integer.parseInt(s);
	    	String fileNamee = null;
	    	List<Download> returnedFileName=downloadServices.fileName(documentId);
	    	
	    	 for(Download d: returnedFileName){
	   		  
	    		 // System.out.println("getUserStatussssssssssssssssss::::::::::::::::"+s.getUserStatus());
	    		  request.setAttribute("fileNamee", d.getFileName());
	    		  fileNamee= d.getFileName();
	    		  logger.info("filename:"+fileNamee);
	    		  
	    	  }
	    	 String path = "D:/App/uploadedfiles/";
	    	 String filePathName=path+fileNamee;
	    	 File file2 = new File(filePathName);
	    	 if(request.getParameter("editftxtid").equalsIgnoreCase(fileNamee)){
	    		 ;
	    	 }else{
		    	 if (file2.exists()) 
		    	 { 
		          logger.info("delete file incase of  overwriting");
		          file2.delete();
		         }
	    	 }

          }*/
}
