package in.fiinfra.common.util;

import in.fiinfra.common.admin.UserData;
import in.fiinfra.common.client.ClientData;
import in.fiinfra.common.client.ClientProfileData;
import in.fiinfra.common.common.AddressData;
import in.fiinfra.common.common.DocumentData;
import in.fiinfra.common.common.FamilyMemberData;
import in.fiinfra.common.common.NotesData;
import in.fiinfra.common.common.ProfileData;
import in.fiinfra.common.diy.models.ActionPlan;
import in.fiinfra.common.diy.models.ActionPlanRisk;
import in.fiinfra.common.diy.models.AdviceAssumption;
import in.fiinfra.common.diy.models.AdviceRecommendation;
import in.fiinfra.common.diy.models.BusinessHealthIndex;
import in.fiinfra.common.diy.models.DcAnalysisHelper;
import in.fiinfra.common.diy.models.Document;
import in.fiinfra.common.diy.models.GoalAttribute;
import in.fiinfra.common.diy.models.PartyAttribute;
import in.fiinfra.common.diy.models.WhatIfData;
import in.fiinfra.common.opportunity.OpportunityData;
import in.fiinfra.common.opportunity.OpportunityProfileData;
import in.fiinfra.common.partner.AssetAllocatedToGoal;
import in.fiinfra.common.partner.BusinessValuationData;
import in.fiinfra.common.utility.GoalData;
import in.fiinfra.framework.models.Audit;

import java.awt.Graphics2D;
import java.awt.Image;
import java.awt.Toolkit;
import java.awt.image.BufferedImage;
import java.awt.image.MemoryImageSource;
import java.awt.image.PixelGrabber;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.net.MalformedURLException;
import java.net.URI;
import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Properties;
import java.util.StringTokenizer;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang.StringUtils;
import org.apache.commons.logging.LogFactory;
import org.apache.log4j.Logger;
import org.apache.pdfbox.pdmodel.PDDocument;
import org.apache.pdfbox.pdmodel.PDPage;
import org.apache.poi.openxml4j.opc.internal.FileHelper;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.util.UriComponents;
import org.springframework.web.util.UriComponentsBuilder;
import org.w3c.dom.CharacterData;
import org.w3c.dom.Element;
import org.w3c.dom.Node;

public class FiinfraUtility {
	private static final Logger logger = Logger.getLogger(FiinfraUtility.class);
	private static final String THUMBNAIL_POSTFIX = "";
	private static String restURL;

	private static Integer logoHeight;
	private static Integer logoWidth;

	public static Integer getLogoHeight() {
		return logoHeight;
	}

	public static void setLogoHeight(Integer logoHeight) {
		FiinfraUtility.logoHeight = logoHeight;
	}

	public static Integer getLogoWidth() {
		return logoWidth;
	}

	public static void setLogoWidth(Integer logoWidth) {
		FiinfraUtility.logoWidth = logoWidth;
	}
	
	public static String getURLWithParams(UriComponentsBuilder uriCB){
		UriComponents uc = uriCB.build();
		try {
			return uc.encode().toUri().toURL().toString();
		} catch (MalformedURLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
		
	}
	
	public static Object postRequest(UriComponentsBuilder uriCB, Class<?> class1,RestTemplate restTemplate) {
		String response = "";
		String prefix = "";
		Object object=null;
		try {
			prefix = FiinfraUtility.getRestDBURL();
			UriComponents uc = uriCB.build();
			URI uri = uc.encode().toUri();
			object= restTemplate.getForObject(uri,class1);
//			System.out.println("response.getStatus() " + response.getStatus());
		} catch (Exception e) {
			e.printStackTrace();
		}
		return object;
	}

	public static String getRestDBURL() {
		if (restURL == null) {
			try {
				Properties properties = new Properties();
				InputStream stream = FileHelper.class.getClassLoader()
						.getResourceAsStream("ApplicationResources.properties");
				properties.load(stream);
				restURL = properties.getProperty("restdburl");
			} catch (IOException e) {
				logger.error("Exception while trying to get RESTDBURL from property file: "
						+ e);
			}
		}
		return restURL;
	}
	
	public static File ensureFolder(File parent, String name){
		File file = new File(parent, name);
		if(!file.exists()){
			file.mkdir();
		}
		return file;
	}
	

	
	public static String generateThumbnail(File f, File root, String path)
			throws Exception {
//		String fileName = StringUtils.substringBeforeLast(f.getName(), ".");
//		String fileType = StringUtils.substringAfterLast(f.getName(), ".");
		
		String fileName = f.getName().substring(0,f.getName().lastIndexOf("."));
		String fileType = f.getName().substring(f.getName().lastIndexOf(".")+1);

		String[] subFolderStrs = path.split("/");
		File basePath = root;
		for (String sf : subFolderStrs) {
			basePath = ensureFolder(basePath, sf);
		}

		File thumbNail = new File(basePath, fileName + "." + "png");

		try {
			if ("PDF".equalsIgnoreCase(fileType)) {
				generatePDFThumbNail(f, thumbNail, 200, 200);
			} else if (isImageType(fileType)) {
				generateImageThumbNail(f, thumbNail, 200, 200);
			}
			else{
				return null;
			}
		} catch (Exception ex) {
			LogFactory.getLog(FiinfraUtility.class).error(
					"Unable to Generate Thumbnail ", ex);
			return null;
		}

		return path+"/"+thumbNail.getName();

	}
	
	public static String getDefaultThumbnail(String type){
		if("pdf".equalsIgnoreCase(type)){
			return "pdf_icon.png";
		}
		else if("doc".equalsIgnoreCase(type) ||"docx".equalsIgnoreCase(type)){
			return "word_icon.png";
		}
		else if("xls".equalsIgnoreCase(type) || "xlsx".equalsIgnoreCase(type)){
			return "excel_icon.png";
		}
		else if("txt".equalsIgnoreCase(type)){
			return "text_icon.png";
		}
		else if("txt".equalsIgnoreCase(type)){
			return "text_icon.png";
		}
		else if("txt".equalsIgnoreCase(type)){
		   return "text_icon.png";	
		}
		return "text_icon.png";
	}

	public static File saveDocument(File root, String path,
			MultipartFile multiPartFile){
		long currentTime = System.currentTimeMillis();
//		String fileName = StringUtils.substringBeforeLast(
//				multiPartFile.getOriginalFilename(), ".");
//		String extension = StringUtils.substringAfterLast(
//				multiPartFile.getOriginalFilename(), ".");
		
		String fileName = multiPartFile.getOriginalFilename().substring(0,multiPartFile.getOriginalFilename().lastIndexOf("."));
		String extension = multiPartFile.getOriginalFilename().substring(multiPartFile.getOriginalFilename().lastIndexOf(".")+1);


		String[] subFolderStrs = path.split("/");
		File basePath = root;
		for (String sf : subFolderStrs) {
			basePath = ensureFolder(basePath, sf);
		}

		File file = new File(basePath, fileName + "_" + currentTime+"." + extension);
		try{
			multiPartFile.transferTo(file);	
		}catch(Exception ex){
			LogFactory.getLog(FiinfraUtility.class).error("Fail to Save Image", ex);
			return null;
		}

		return file;
	}

//	public static void main(String[] args) throws Exception{
//		saveImage(new File("D:\\Ffreedom-DI\\images"), "user-images", new FileInputStream("d:\\logo\\130x450.png") , "logo.png", 150, 60);
//		saveImage(new File("D:\\Ffreedom-DI\\images"), "user-images", new FileInputStream("d:\\logo\\450x150.png") , "logo.png", 150, 60);
//		saveImage(new File("D:\\Ffreedom-DI\\images"), "user-images", new FileInputStream("d:\\logo\\450x450.png") , "logo.png", 150, 60);
//	}
	public static File saveLogo(File root, String path,
			MultipartFile multiPartFile, int width, int height) throws Exception{
		return saveLogo(root, path, multiPartFile.getInputStream(), multiPartFile.getName(), width, height);
	}
	
	public static File saveLogo(File root, String path,
			InputStream in, String fullFileName,int width, int height) {
		long currentTime = System.currentTimeMillis();
		String fileName = StringUtils.substringBeforeLast(fullFileName, "."); 
				
		if(!root.exists()){
			root.mkdir();
		}
		String[] subFolderStrs = path.split("/");
		File basePath = root;
		for (String sf : subFolderStrs) {
			basePath = ensureFolder(basePath, sf);
		}

		File file = new File(basePath, fileName + "_" + currentTime + "."
				+ "png");
		try{
			BufferedImage image = ImageIO.read(in);
			if(image ==null){
				return null;
			}
			int type = image.getType() == 0 ? BufferedImage.TYPE_INT_ARGB
					: image.getType();
			
			double orignalHeight =  image.getHeight();
			double orignalWidth =  image.getWidth();		
			
			double xRatio = orignalWidth / width;
			double yRatio = orignalHeight / height;
			
			int newWidth = width;
			int newHeight = height;
			
			if (xRatio > 1 || yRatio > 1) {
				if (xRatio > yRatio) {
					newHeight = (int) (orignalHeight / xRatio);
				} else {
					newWidth = (int) (orignalWidth / yRatio);
			
				}
				/*BufferedImage resizedImage = new BufferedImage(newWidth, newHeight,
						type);
			Graphics2D g = image.createGraphics();
			g.drawImage(image	, 0, 0, newWidth, newHeight, null);
			g.dispose();
			ImageIO.write(image, "png", file);*/

			}
			/*else{
				ImageIO.write(image, "png", file);
			}*/

			ImageIO.write(image, "png", file);
			setLogoHeight(newHeight);
			setLogoWidth(newWidth);
			
			
		}catch(Exception ex){
			LogFactory.getLog(FiinfraUtility.class).error("Fail to Save Image",
					ex);
			return null;
		}
		
		return file;
	}
	public static File saveImage(File root, String path,
			MultipartFile multiPartFile, int width, int height) throws Exception{
		return saveImage(root, path, multiPartFile.getInputStream(), multiPartFile.getName(), width, height);
	}

	public static File saveImage(File root, String path,
			InputStream in, String fullFileName,int width, int height) {
		long currentTime = System.currentTimeMillis();
//		String fileName = StringUtils.substringBeforeLast(
//				multiPartFile.getOriginalFilename(), ".");
		
		String fileName = StringUtils.substringBeforeLast(fullFileName, "."); 
				
//		String extension = StringUtils.substringAfterLast(
//				multiPartFile.getOriginalFilename(), ".");

		if(!root.exists()){
			root.mkdir();
		}
		String[] subFolderStrs = path.split("/");
		File basePath = root;
		for (String sf : subFolderStrs) {
			basePath = ensureFolder(basePath, sf);
		}

		File file = new File(basePath, fileName + "_" + currentTime + "."
				+ "png");
		try{
			BufferedImage image = ImageIO.read(in);
			if(image ==null){
				return null;
			}
			int type = image.getType() == 0 ? BufferedImage.TYPE_INT_ARGB
					: image.getType();
			
			double orignalHeight =  image.getHeight();
			double orignalWidth =  image.getWidth();
			
//			double aspectRatio = orignalWidth/orignalHeight; 
			
			double xRatio = orignalWidth / width;
			double yRatio = orignalHeight / height;
			
			int newWidth = width;
			int newHeight = height;
			
			if (xRatio > 1 || yRatio > 1) {
				if (xRatio > yRatio) {
					newHeight = (int) (orignalHeight / xRatio);
				} else {
					newWidth = (int) (orignalWidth / yRatio);
			
				}
				BufferedImage resizedImage = new BufferedImage(newWidth, newHeight,
						type);
			Graphics2D g = resizedImage.createGraphics();
			g.drawImage(image	, 0, 0, newWidth, newHeight, null);
			g.dispose();
			ImageIO.write(resizedImage, "png", file);

			}
			else{
				ImageIO.write(image, "png", file);
			}

//			multiPartFile.transferTo(file);
			
		}catch(Exception ex){
			LogFactory.getLog(FiinfraUtility.class).error("Fail to Save Image",
					ex);
			return null;
		}
		
		return file;
	}
	
	public static File saveImage(File root, String path,
			MultipartFile multiPartFile, int width, int height, int x,int y, int w,int h ){
		long currentTime = System.currentTimeMillis();
		String fileName =multiPartFile.getOriginalFilename().substring(0,multiPartFile.getOriginalFilename().lastIndexOf("."));
//		String extension = StringUtils.substringAfterLast(
//				multiPartFile.getOriginalFilename(), ".");

		if(!root.exists()){
			root.mkdir();
		}
		String[] subFolderStrs = path.split("/");
		File basePath = root;
		for (String sf : subFolderStrs) {
			basePath = ensureFolder(basePath, sf);
		}

		File file = new File(basePath, fileName + "_" + currentTime+"." + "png");
		try{
			if(w<=0  ){
				w = width;
			}
//			else if(w<=width){
//				x = 0;
//				y=0;
//				w = width;
//			}
			if(h<=0  ){
				x=0;
				y=0;
				h = height;
			}
//			else if(h<=height){
//				x=0;
//				y=0;
//				h = height;
//				
//			}

			BufferedImage image = ImageIO.read(multiPartFile.getInputStream());
					
//			int type = image.getType() == 0? BufferedImage.TYPE_INT_ARGB : image.getType();
//			
//			BufferedImage resizedImage = new BufferedImage(width, height, type);
//			
//			Image img = Toolkit.getDefaultToolkit().createImage(file.getAbsolutePath());
			
			
			int[] pixels = new int[w * h*3];
			
			PixelGrabber pg = new PixelGrabber(image, x, y, w, h, pixels,0,w);
			try {
		          pg.grabPixels();
		      } catch (InterruptedException e) {
		    	  LogFactory.getLog(FiinfraUtility.class).error("Error Getting Image", e);
		          return null;
		      }
			
//			int type = image.getType() == 0? BufferedImage.TYPE_INT_ARGB : image.getType();
			
			Image im = Toolkit.getDefaultToolkit().createImage(new MemoryImageSource(w,h, pixels, 0, w));
			
			BufferedImage resizedImage = new BufferedImage(width, height, BufferedImage.TYPE_INT_ARGB);
			Graphics2D g = resizedImage.createGraphics();
			g.drawImage(im	, 0, 0, width, height, null);
			g.dispose();
			ImageIO.write(resizedImage, "png", file);
			
			
		}catch(Exception ex){
			LogFactory.getLog(FiinfraUtility.class).error("Fail to Save Image", ex);
			return null;
		}
		

		return file;
	}


	private static String extractRelative(File root, String baseURI, File file){
		String relativePath = file.getAbsolutePath().replace(root.getAbsolutePath(), "");
		relativePath = relativePath.replace('\\', '/');
		return baseURI + relativePath;
	}

	
	public static boolean isImageType(String fileType){
		return "jpeg".equalsIgnoreCase(fileType) ||"png".equalsIgnoreCase(fileType) ||
				"jpg".equalsIgnoreCase(fileType) ||"bmp".equalsIgnoreCase(fileType)
				||"gif".equalsIgnoreCase(fileType) 
				;
	}

	
	public static boolean generateImageThumbNail(File file, File outFile, int width, int height)throws Exception{
		BufferedImage image = ImageIO.read(file);
		int type = image.getType() == 0? BufferedImage.TYPE_INT_ARGB : image.getType();
		
		BufferedImage resizedImage = new BufferedImage(150, 150, type);
		Graphics2D g = resizedImage.createGraphics();
		g.drawImage(image	, 0, 0, 150, 150, null);
		g.dispose();
		
		return ImageIO.write(resizedImage, "png", outFile);
		
	}
	

	public static boolean generatePDFThumbNail(File file, File outFile, int width, int height)throws Exception{
    	PDDocument document = null;
    	try{
    		document = PDDocument.load(file);
   	        List<PDPage> pages = document.getDocumentCatalog().getAllPages();
   	        PDPage page1 = pages.get(0);
   	        BufferedImage image = page1.convertToImage();
   	        return ImageIO.write(image, "png", outFile);
    		
    	}finally{
    		if(document != null){
    			document.close();
    		}
    	}
	}

	public static boolean generateWordDocThumbNail(File file, File outFile, int width, int height)throws Exception{
		
		
    	PDDocument document = null;
    	try{
    		document = PDDocument.load(file);
   	        List<PDPage> pages = document.getDocumentCatalog().getAllPages();
   	        PDPage page1 = pages.get(0);
   	        BufferedImage image = page1.convertToImage();
   	        return ImageIO.write(image, "png", outFile);
    		
    	}finally{
    		if(document != null){
    			document.close();
    		}
    	}
	}

	public static int getFileType(String fileType){
		//@todo implement it
		return 0;
	}
	
	/**
	 * Gives List<DocumentData> from MultipartFile[] m (take all attachment details and set it into DocumentData Object)
	 * @param m
	 * @param currentTime
	 * @param createdBy
	 * @return List<DocumentData>
	 */
	public static List<DocumentData>  getDocumentDatasFromMultiPartFiles(MultipartFile[] m,long currentTime,int createdBy){
		List<DocumentData> documentDatas = new ArrayList<DocumentData>();
		if(m!=null){
		for (MultipartFile f : m) {
			System.out.println("f.getOriginalFilename():--"
					+ f.getOriginalFilename());
			if (f.getOriginalFilename() != null
					&& !f.getOriginalFilename().equals("")) {
				String fileName = null;
				String extension = null;
				DocumentData d = new DocumentData();
				d.setDocumentName(f.getOriginalFilename());
				d.setDocumentStorageLocation(82001);
				d.setDocumentType(10001);
				d.setCreatedBy(createdBy);
				fileName = f.getOriginalFilename().substring(0,
						f.getOriginalFilename().lastIndexOf("."));
				extension = f.getOriginalFilename().substring(
						f.getOriginalFilename().lastIndexOf("."));
				System.out.println("File name is :--" + fileName);
				System.out.println("extension is:--" + extension);
				System.out.println("filename to set:---" + fileName + "_"
						+ currentTime + extension);
				d.setFileName(fileName.replace(" ","") + "_" + currentTime + extension);
				d.setFileSize((int) f.getSize());
				d.setFileTypeId(11006);
				documentDatas.add(d);
				if(f.getSize()>FiinfraConstants.MAX_FILE_SIZE){
					documentDatas=null;
					break;
				}
			}
		}
		}
		return documentDatas;
		
	}
	public static String uploadAttachments(MultipartFile[] m,String basePath,long currentTime) throws IOException{
		String result="success";
		File baseFolder = new File(basePath);
		for (MultipartFile f : m) {
			if (f.getOriginalFilename() != null
					&& !f.getOriginalFilename().equals("")) {
				String fileName = null;
				String extension = null;
				fileName = f.getOriginalFilename().substring(0,
						f.getOriginalFilename().lastIndexOf("."));
				extension = f.getOriginalFilename().substring(
						f.getOriginalFilename().lastIndexOf("."));
				System.out.println("File name is :--" + fileName);
				System.out.println("extension is:--" + extension);
				System.out.println("filename to set:---" + fileName + "_"
						+ currentTime + extension);
				fileName = fileName.replace(" ","") + "_" + currentTime + extension;
				String filePath = basePath + "\\" + fileName;
				System.out.println("filePath:-------"+filePath);
				File fileToUpload = new File(filePath);
				if (baseFolder.exists()) {

//					FileUtils.deleteDirectory(baseFolder);
//					baseFolder = new File(basePath);
//					baseFolder.mkdirs();
				} else {
					baseFolder.mkdirs();// creates directory
				}
				// uploads file to that directory
				try {
					f.transferTo(fileToUpload);
				} catch (Exception e) {
					e.printStackTrace();
					// logger.error(e.getMessage());
				}
			}
		}
		return result;
	}
	
	public static String getDocumentXML(List<DocumentData> documentDatas){
		 String documentXML=null;
		 if(documentDatas!=null){
			 documentXML="<Root>";
		 for(DocumentData d:documentDatas){
				documentXML+="<Document>";
				documentXML+="<DocumentName>"+d.getDocumentName()+"</DocumentName>";
				documentXML+="<DocumentStorageLocation>"+d.getDocumentStorageLocation()+"</DocumentStorageLocation>";
				documentXML+="<DocumentType>"+d.getDocumentType()+"</DocumentType>";
				documentXML+="<CreatedBy>"+d.getCreatedBy()+"</CreatedBy>";
				documentXML+="<FileName>"+d.getFileName()+"</FileName>";
				documentXML+="<FileSize>"+d.getFileSize()+"</FileSize>";
				documentXML+="<FileStoragePathURI>"+d.getFileStoragePathURI()+"</FileStoragePathURI>";
				documentXML+="<FileTypeId>"+d.getFileTypeId()+"</FileTypeId>";
				documentXML+="</Document>";
			}
		 documentXML+="</Root>";
		 } 
		 return documentXML;
	 }
	
	public static String getDocumentIdXML(List<Document> documentlist){
		 String documentXML=null;
		 if(documentlist!=null){
			 documentXML="<Root>";
		 for(Document d:documentlist){
				documentXML+="<Document>";
				documentXML+="<DocumentName>"+d.getDocumentName()+"</DocumentName>";
				documentXML+="<DocumentStorageLocation>"+d.getDocumentStorageLocation()+"</DocumentStorageLocation>";
				documentXML+="<DocumentType>"+d.getDocumentType()+"</DocumentType>";
				documentXML+="<CreatedBy>"+d.getCreatedBy()+"</CreatedBy>";
				documentXML+="<FileName>"+d.getFileName()+"</FileName>";
				documentXML+="<FileSize>"+d.getFileSize()+"</FileSize>";
				documentXML+="<FileStoragePathURI>"+d.getFileStoragePathURI()+"</FileStoragePathURI>";
				documentXML+="<FileTypeId>"+d.getFileTypeId()+"</FileTypeId>";
				documentXML+="<PartyId>"+d.getPartyId()+"</PartyId>";
				documentXML+="<Report>"+d.getFlag()+"</Report>";
				documentXML+="</Document>";
			}
		 documentXML+="</Root>";
		 } 
		 return documentXML;
	}
	
	public static String getActionPlanDataXml( List<ActionPlan> actionPlanList )
	{
		String actionPlanDataXml = null;
		if( !actionPlanList.isEmpty() ) {
			actionPlanDataXml="<Root>";
			for (ActionPlan a : actionPlanList) {
				actionPlanDataXml+="<ActionPlanData>";
				actionPlanDataXml+="<AssetClassId>"+a.getAssetClassId()+"</AssetClassId>";
				actionPlanDataXml+="<ProductTypeId>"+a.getProductTypeId()+"</ProductTypeId>";
				actionPlanDataXml+="<AllocationPercent>"+a.getAllocationPercent()+"</AllocationPercent>";
				actionPlanDataXml+="<CategoryId>"+a.getCategoryId()+"</CategoryId>";
				actionPlanDataXml+="<ProductId>"+a.getProductId()+"</ProductId>";
				actionPlanDataXml+="<InvestAmount>"+a.getProductAmount()+"</InvestAmount>";
				actionPlanDataXml+="<FPAdviseRecommendId>"+a.getFpAdviseId()+"</FPAdviseRecommendId>";
				actionPlanDataXml+="<ClientApprovalStatusId>"+a.getActionApprovalId()+"</ClientApprovalStatusId>";
				actionPlanDataXml+="<Sip>"+a.getSip()+"</Sip>";
				actionPlanDataXml+="<LumpSum>"+a.getLumpSum()+"</LumpSum>";
				actionPlanDataXml+="</ActionPlanData>";
			}
			actionPlanDataXml+="</Root>";
		}
		return actionPlanDataXml;
	}
	
	public static String getBulkOpportunityActivation(List<UserData> userDatas){
		 String userXML=null;
		 if(userDatas!=null){
			 userXML="<Root>";
		 for(UserData userData:userDatas){
			 	userXML+="<UserData>";
			 	userXML+="<UserName>"+userData.getUserName()+"</UserName>";
				userXML+="<UserPassword>"+userData.getUserPassword()+"</UserPassword>";
				userXML+="<UserEmailId>"+userData.getUserEmailId()+"</UserEmailId>";				
				userXML+="<BuId>"+userData.getBuID()+"</BuId>";
				userXML+="<UserPartyId>"+userData.getPartyId()+"</UserPartyId>";			
				userXML+="</UserData>";
			}
		 userXML+="</Root>";
		 } 
		 return userXML;
	 }
	
	 public static String getUserDataForDcActivationXML(UserData userData){
			String dataXml="<Root>";
			dataXml+="<UserName><![CDATA["+userData.getUserName()+"]]></UserName>";
			dataXml+="<UserPassword><![CDATA["+userData.getUserPassword()+"]]></UserPassword>";
			dataXml+="<UserEmailId><![CDATA["+userData.getUserEmailId()+"]]></UserEmailId>";
			dataXml+="<BuId><![CDATA["+userData.getBuID()+"]]></BuId>";
			dataXml+="<UserPartyId><![CDATA["+userData.getPartyId()+"]]></UserPartyId>";
			dataXml+="</Root>";
			
			return dataXml;
	}
	
	 
	 public static String getopportunityXMLString(OpportunityData opportunityData){
		 String opportunityXML="<Root>";
		 opportunityXML+="<SalutationId><![CDATA["+opportunityData.getSalutationID()+"]]></SalutationId>";
		 opportunityXML+="<FirstName><![CDATA["+opportunityData.getFirstName()+"]]></FirstName>";
		 opportunityXML+="<LastName><![CDATA["+opportunityData.getLastName()+"]]></LastName>";
		 opportunityXML+="<CompanyName><![CDATA["+opportunityData.getCompanyName()+"]]></CompanyName>";
		 opportunityXML+="<WorkDesignation><![CDATA["+opportunityData.getWorkDesignation()+"]]></WorkDesignation>";
		 opportunityXML+="<WorkProfession><![CDATA["+opportunityData.getWorkProfession()+"]]></WorkProfession>";
		 opportunityXML+="<DOB><![CDATA["+opportunityData.getDob()+"]]></DOB>";
		 opportunityXML+="<Age><![CDATA["+opportunityData.getAge()+"]]></Age>";
		 opportunityXML+="<AnniversaryDate><![CDATA["+opportunityData.getAnniversaryDate()+"]]></AnniversaryDate>";
		 opportunityXML+="<MartialStatusId><![CDATA["+opportunityData.getMartialStatusID()+"]]></MartialStatusId>";		 
		 opportunityXML+="<GenderId><![CDATA["+opportunityData.getGenderID()+"]]></GenderId>";
		 opportunityXML+="<PanNo><![CDATA["+opportunityData.getPanNo()+"]]></PanNo>";
		 opportunityXML+="<ContactEmail><![CDATA["+opportunityData.getContactEmail()+"]]></ContactEmail>";
		 opportunityXML+="<ContactMobile><![CDATA["+opportunityData.getContactMobile()+"]]></ContactMobile>";
		 opportunityXML+="<ContactMobile2><![CDATA["+opportunityData.getContactMobile2()+"]]></ContactMobile2>";
		 opportunityXML+="<CampaignName><![CDATA["+opportunityData.getCampaignName()+"]]></CampaignName>";
		 opportunityXML+="<ContactSourceTypeID><![CDATA["+opportunityData.getContactSourceTypeID()+"]]></ContactSourceTypeID>";		 
		 opportunityXML+="<ContactReferalName><![CDATA["+opportunityData.getContactReferalName()+"]]></ContactReferalName>";
		 opportunityXML+="<OpportunityStatusID><![CDATA["+opportunityData.getOpportunityStatusID()+"]]></OpportunityStatusID>";
		 opportunityXML+="<OpportunityRatingID><![CDATA["+opportunityData.getOpportunityRatingID()+"]]></OpportunityRatingID>";
		 opportunityXML+="<ConvertProbablity><![CDATA["+opportunityData.getConvertProbablity()+"]]></ConvertProbablity>";
		 opportunityXML+="<NextActionID><![CDATA["+opportunityData.getNextActionID()+"]]></NextActionID>";
		 opportunityXML+="<BuID><![CDATA["+opportunityData.getBuId()+"]]></BuID>";

		 opportunityXML+="<Address><![CDATA["+opportunityData.getAddress()+"]]></Address>";
		 opportunityXML+="<City><![CDATA["+opportunityData.getCity()+"]]></City>";
		 opportunityXML+="<State><![CDATA["+opportunityData.getState()+"]]></State>";
		 opportunityXML+="<Country><![CDATA["+opportunityData.getCountry()+"]]></Country>";
		 opportunityXML+="<PinCode><![CDATA["+opportunityData.getPinCode()+"]]></PinCode>";
		 
		 opportunityXML+="</Root>";
		 return opportunityXML;
	 }
	 
	 public static String getClientXMLString(ClientData clientData){
		 String clientXML="<Root>";
		 clientXML+="<SalutationId><![CDATA["+clientData.getSalutationID()+"]]></SalutationId>";
		 clientXML+="<FirstName><![CDATA["+clientData.getFirstName()+"]]></FirstName>";
		 clientXML+="<LastName><![CDATA["+clientData.getLastName()+"]]></LastName>";
		 clientXML+="<CompanyName><![CDATA["+clientData.getCompanyName()+"]]></CompanyName>";
		 clientXML+="<WorkDesignation><![CDATA["+clientData.getWorkDesignation()+"]]></WorkDesignation>";
		 clientXML+="<WorkProfession><![CDATA["+clientData.getWorkProfession()+"]]></WorkProfession>";
		 clientXML+="<DOB><![CDATA["+clientData.getDob()+"]]></DOB>";
		 clientXML+="<AnniversaryDate><![CDATA["+clientData.getAnniversaryDate()+"]]></AnniversaryDate>";
		 clientXML+="<Age><![CDATA["+clientData.getAge()+"]]></Age>";
		 clientXML+="<ContactEmail><![CDATA["+clientData.getContactEmail()+"]]></ContactEmail>";
		 clientXML+="<ContactMobile><![CDATA["+clientData.getContactMobile()+"]]></ContactMobile>";
		 clientXML+="<ContactMobile2><![CDATA["+clientData.getContactMobile2()+"]]></ContactMobile2>";
		 clientXML+="<PanNo><![CDATA["+clientData.getPanNo()+"]]></PanNo>";
		 clientXML+="<MartialStatusId><![CDATA["+clientData.getMartialStatusID()+"]]></MartialStatusId>";		 
		 clientXML+="<GenderId><![CDATA["+clientData.getGenderID()+"]]></GenderId>";
		 clientXML+="<BuID><![CDATA["+clientData.getBuId()+"]]></BuID>";

		 clientXML+="<Address><![CDATA["+clientData.getAddress()+"]]></Address>";
		 clientXML+="<City><![CDATA["+clientData.getCity()+"]]></City>";
		 clientXML+="<State><![CDATA["+clientData.getState()+"]]></State>";
		 clientXML+="<Country><![CDATA["+clientData.getCountry()+"]]></Country>";
		 clientXML+="<PinCode><![CDATA["+clientData.getPinCode()+"]]></PinCode>";
		 
		 clientXML+="</Root>";
		 return clientXML;
	 }
	 
	 public static String getOpportunityProfileDataXML(OpportunityProfileData opportunityProfileData,String sectionName){
		 String dataXml="<Root>";
		 if(sectionName.equals(FiinfraConstants.OPPORTUNITY_PERSONAL_DETAILS)){
			 
			 dataXml+="<FirstName><![CDATA["+opportunityProfileData.getFirstName()+"]]></FirstName>";
			 dataXml+="<LastName><![CDATA["+opportunityProfileData.getLastName()+"]]></LastName>";
			 dataXml+="<SalutationId><![CDATA["+opportunityProfileData.getSalutationId()+"]]></SalutationId>";
			 dataXml+="<CompanyName><![CDATA["+opportunityProfileData.getCompanyName()+"]]></CompanyName>";
			 dataXml+="<Designation><![CDATA["+opportunityProfileData.getDesignation()+"]]></Designation>";
			 dataXml+="<Occupation><![CDATA["+opportunityProfileData.getOccupation()+"]]></Occupation>";
			 dataXml+="<BirthDate><![CDATA["+opportunityProfileData.getDob()+"]]></BirthDate>";
			 dataXml+="<AnniversaryDate><![CDATA["+opportunityProfileData.getAnniversaryDate()+"]]></AnniversaryDate>";
			 dataXml+="<MartialStatusId><![CDATA["+opportunityProfileData.getMartialStatusId()+"]]></MartialStatusId>";
			 dataXml+="<GenderId><![CDATA["+opportunityProfileData.getGenderId()+"]]></GenderId>";
			 dataXml+="<PanNo><![CDATA["+opportunityProfileData.getPanNo()+"]]></PanNo>";
			 
		 } else if(sectionName.equals(FiinfraConstants.OPPORTUNITY_CONTACT_DETAILS)){
			 AddressData addressData=opportunityProfileData.getAddressDataList().get(0);
			 
			 dataXml+="<ContactEmail><![CDATA["+opportunityProfileData.getContactEmail()+"]]></ContactEmail>";
			 dataXml+="<ContactMobile><![CDATA["+opportunityProfileData.getContactMobile()+"]]></ContactMobile>";
			 dataXml+="<ContactMobile2><![CDATA["+opportunityProfileData.getContactMobile2()+"]]></ContactMobile2>";
			 
			 dataXml+="<Street1><![CDATA["+addressData.getStreet1()+"]]></Street1>";
			 dataXml+="<Street2><![CDATA["+addressData.getStreet2()+"]]></Street2>";
			 dataXml+="<Street3><![CDATA["+addressData.getStreet3()+"]]></Street3>";
			 dataXml+="<Country><![CDATA["+addressData.getCountry()+"]]></Country>";
			 dataXml+="<State><![CDATA["+addressData.getState()+"]]></State>";
			 dataXml+="<City><![CDATA["+addressData.getCity()+"]]></City>";
			 dataXml+="<PostalCode><![CDATA["+addressData.getPostalCode()+"]]></PostalCode>";
			 
		 }else if(sectionName.equals(FiinfraConstants.OPPORTUNITY_FAMILY_DETAILS)){
			 FamilyMemberData familyMemberData=opportunityProfileData.getFamilyMemberDataList().get(0);
			 
			 dataXml+="<FamilyMemberFirstName><![CDATA["+familyMemberData.getFirstName()+"]]></FamilyMemberFirstName>";
			 dataXml+="<FamilyMemberLastName><![CDATA["+familyMemberData.getLastName()+"]]></FamilyMemberLastName>";
			 dataXml+="<FamilyRelation><![CDATA["+familyMemberData.getRelationshipId()+"]]></FamilyRelation>";
			 dataXml+="<FamilyMemberDOB><![CDATA["+familyMemberData.getDob()+"]]></FamilyMemberDOB>";
			 dataXml+="<FamilyMemberAge><![CDATA["+familyMemberData.getAge()+"]]></FamilyMemberAge>";
						 
		 }else if(sectionName.equals(FiinfraConstants.OPPORTUNITY_ORIGINATION_DETAILS)){			
			 dataXml+="<CampaignName><![CDATA["+opportunityProfileData.getCampaignName()+"]]></CampaignName>";
			 dataXml+="<OpportunitySource><![CDATA["+opportunityProfileData.getOpportunitySource()+"]]></OpportunitySource>";
			 dataXml+="<ReferredBy><![CDATA["+opportunityProfileData.getReferralName()+"]]></ReferredBy>";
			 
		 }else if(sectionName.equals(FiinfraConstants.OPPORTUNITY_TRACKER_DETAILS)){			
			 dataXml+="<OpportunityStatusID><![CDATA["+opportunityProfileData.getOpportunityStatus()+"]]></OpportunityStatusID>";
			 dataXml+="<OpportunityRatingID><![CDATA["+opportunityProfileData.getOpportunityRating()+"]]></OpportunityRatingID>";
			 dataXml+="<ConvertProbablity><![CDATA["+opportunityProfileData.getConvertProbability()+"]]></ConvertProbablity>";
			 dataXml+="<NextActionID><![CDATA["+opportunityProfileData.getNextAction()+"]]></NextActionID>";
			 
		 }else if(sectionName.equals(FiinfraConstants.OPPORTUNITY_NOTES_DETAILS)){
			 NotesData notesData=opportunityProfileData.getNotesDataList().get(0);
			 
			 dataXml+="<NoteText><![CDATA["+notesData.getNoteText()+"]]></NoteText>";
			 dataXml+="<NoteCreatedBy><![CDATA["+notesData.getCreatedBy()+"]]></NoteCreatedBy>";
			 dataXml+="<NoteCreatedDate><![CDATA["+notesData.getCreatedDate()+"]]></NoteCreatedDate>";
			 
		 }else if(sectionName.equals(FiinfraConstants.OPPORTUNITY_DOCUMENT_DETAILS)){
			 DocumentData documentData=opportunityProfileData.getDocumentDataList().get(0);
			 
			 dataXml+="<DocumentFileName><![CDATA["+documentData.getFileName()+"]]></DocumentFileName>";
			 dataXml+="<DocumentName><![CDATA["+documentData.getDocumentName()+"]]></DocumentName>";
			 dataXml+="<DocumentCreatedBy><![CDATA["+documentData.getCreatedBy()+"]]></DocumentCreatedBy>";
			 dataXml+="<DocumentCreatedDate><![CDATA["+documentData.getCreatedDate()+"]]></DocumentCreatedDate>";
			 
		 }else if(sectionName.equals(FiinfraConstants.CLIENT_ASSUMPTION_DETAILS)){	
			 //Assumtions Details
		 }else if(sectionName.equals(FiinfraConstants.OPPORTUNITY_INTERESTED_FP)){
			 dataXml+=opportunityProfileData.getInterestedFpXML();
			 System.out.println("XML--------"+dataXml);
		 }
		 dataXml+="</Root>";
	  return dataXml;
	 }
	 
	 public static String getClientProfileDataXML(ClientProfileData clientProfileData,String sectionName){
		 String dataXml="<Root>";
		 if(sectionName.equals(FiinfraConstants.CLIENT_PERSONAL_DETAILS)){
			 
			 dataXml+="<FirstName><![CDATA["+clientProfileData.getFirstName()+"]]></FirstName>";
			 dataXml+="<LastName><![CDATA["+clientProfileData.getLastName()+"]]></LastName>";
			 dataXml+="<SalutationId><![CDATA["+clientProfileData.getSalutationId()+"]]></SalutationId>";
			 dataXml+="<CompanyName><![CDATA["+clientProfileData.getCompanyName()+"]]></CompanyName>";
			 dataXml+="<Designation><![CDATA["+clientProfileData.getWorkDesignation()+"]]></Designation>";
			 dataXml+="<Occupation><![CDATA["+clientProfileData.getWorkProfession()+"]]></Occupation>";
			 dataXml+="<PanNo><![CDATA["+clientProfileData.getPanNo()+"]]></PanNo>";
			 dataXml+="<BirthDate><![CDATA["+clientProfileData.getDob()+"]]></BirthDate>";
			 dataXml+="<AnniversaryDate><![CDATA["+clientProfileData.getAnniversaryDate()+"]]></AnniversaryDate>";
			 dataXml+="<MartialStatusId><![CDATA["+clientProfileData.getMartialStatusID()+"]]></MartialStatusId>";
			 dataXml+="<GenderId><![CDATA["+clientProfileData.getGenderID()+"]]></GenderId>";
			 
		 } else if(sectionName.equals(FiinfraConstants.CLIENT_CONTACT_DETAILS)){
			 AddressData addressData=clientProfileData.getAddressDataList().get(0);
			 
			 dataXml+="<ContactEmail><![CDATA["+clientProfileData.getContactEmail()+"]]></ContactEmail>";
			 dataXml+="<ContactMobile><![CDATA["+clientProfileData.getContactMobile()+"]]></ContactMobile>";
			 dataXml+="<ContactMobile2><![CDATA["+clientProfileData.getContactMobile2()+"]]></ContactMobile2>";
			 
			 dataXml+="<Street1><![CDATA["+addressData.getStreet1()+"]]></Street1>";
			 dataXml+="<Street2><![CDATA["+addressData.getStreet2()+"]]></Street2>";
			 dataXml+="<Street3><![CDATA["+addressData.getStreet3()+"]]></Street3>";
			 dataXml+="<Country><![CDATA["+addressData.getCountry()+"]]></Country>";
			 dataXml+="<State><![CDATA["+addressData.getState()+"]]></State>";
			 dataXml+="<City><![CDATA["+addressData.getCity()+"]]></City>";
			 dataXml+="<PostalCode><![CDATA["+addressData.getPostalCode()+"]]></PostalCode>";
			 
		 }else if(sectionName.equals(FiinfraConstants.CLIENT_FAMILY_DETAILS)){
			 FamilyMemberData familyMemberData=clientProfileData.getFamilyDataList().get(0);
			 
			 dataXml+="<FamilyMemberFirstName><![CDATA["+familyMemberData.getFirstName()+"]]></FamilyMemberFirstName>";
			 dataXml+="<FamilyMemberLastName><![CDATA["+familyMemberData.getLastName()+"]]></FamilyMemberLastName>";
			 dataXml+="<FamilyRelation><![CDATA["+familyMemberData.getRelationshipId()+"]]></FamilyRelation>";
			 dataXml+="<FamilyMemberDOB><![CDATA["+familyMemberData.getDob()+"]]></FamilyMemberDOB>";
			 dataXml+="<FamilyMemberAge><![CDATA["+familyMemberData.getAge()+"]]></FamilyMemberAge>";
						 
		 }
		 else if(sectionName.equals(FiinfraConstants.CLIENT_OPERATIONAL_DETAILS)){			
			 dataXml+="<ClientCategory><![CDATA["+clientProfileData.getClientCategory()+"]]></ClientCategory>";
			 dataXml+="<Offerings><![CDATA["+clientProfileData.getOfferingsXML()+"]]></Offerings>";
//			 
		 }else if(sectionName.equals(FiinfraConstants.CLIENT_NOTES_DETAILS)){
			 NotesData notesData=clientProfileData.getNotesDataList().get(0);
		 
			 dataXml+="<NoteText><![CDATA["+notesData.getNoteText()+"]]></NoteText>";
			 dataXml+="<NoteCreatedBy><![CDATA["+notesData.getCreatedBy()+"]]></NoteCreatedBy>";
			 dataXml+="<NoteCreatedDate><![CDATA["+notesData.getCreatedDate()+"]]></NoteCreatedDate>";
			 
		 }else if(sectionName.equals(FiinfraConstants.CLIENT_DOCUMENT_DETAILS)){
			 DocumentData documentData=clientProfileData.getDocumentDatas().get(0);
			 
			 dataXml+="<DocumentFileName><![CDATA["+documentData.getFileName()+"]]></DocumentFileName>";
			 dataXml+="<DocumentName><![CDATA["+documentData.getDocumentName()+"]]></DocumentName>";
			 dataXml+="<DocumentCreatedBy><![CDATA["+documentData.getCreatedBy()+"]]></DocumentCreatedBy>";
			 dataXml+="<DocumentCreatedDate><![CDATA["+documentData.getCreatedDate()+"]]></DocumentCreatedDate>";
			 
		 }else if(sectionName.equals(FiinfraConstants.CLIENT_ASSUMPTION_DETAILS)){			
//			 dataXml+="<OpportunityStatusID><![CDATA["+opportunityProfileData.getOpportunityStatus()+"]]></OpportunityStatusID>";
//			 dataXml+="<OpportunityRatingID><![CDATA["+opportunityProfileData.getOpportunityRating()+"]]></OpportunityRatingID>";
//			 dataXml+="<ConvertProbablity><![CDATA["+opportunityProfileData.getConvertProbability()+"]]></ConvertProbablity>";
//			 dataXml+="<NextActionID><![CDATA["+opportunityProfileData.getNextAction()+"]]></NextActionID>";
//			 
		 }else if(sectionName.equals(FiinfraConstants.CLIENT_HEALTH_HISTORY_DETAILS)){
			 dataXml+="<HealthXML><![CDATA["+clientProfileData.getHealthXML()+"]]></HealthXML>";
			 
		 }else if(sectionName.equals(FiinfraConstants.CLIENT_INTERESTED_FP)){
			 dataXml+=clientProfileData.getInterestedFpXML();
			 System.out.println("XML--------"+dataXml);
		 }
		 
		 dataXml+="</Root>";
	  return dataXml;
	 }	 
	 
	 public static String getProfileDataXML(ProfileData profileData,String sectionName){
		 String datXml="<Root>";
		 if(sectionName.equals(FiinfraConstants.PROFILE_PERSONAL_INFO_2)){
			 datXml+="<SalutationId><![CDATA["+profileData.getSalutationId()+"]]></SalutationId>";
			 datXml+="<FirstName><![CDATA["+profileData.getFirstName()+"]]></FirstName>";
			 datXml+="<LastName><![CDATA["+profileData.getLastName()+"]]></LastName>";
			 datXml+="<CompanyName><![CDATA["+profileData.getCompanyName()+"]]></CompanyName>";
			 datXml+="<PanNo><![CDATA["+profileData.getPanNo()+"]]></PanNo>";
			 datXml+="<HomePhone><![CDATA["+profileData.getContactHome()+"]]></HomePhone>";
			 datXml+="<BirthDate><![CDATA["+profileData.getDob()+"]]></BirthDate>";
			 datXml+="<Website><![CDATA["+profileData.getWebsiteUrl()+"]]></Website>";
			 datXml+="<ARNCode><![CDATA["+profileData.getArn()+"]]></ARNCode>";
			 datXml+="<EUINCode><![CDATA["+profileData.getEuin()+"]]></EUINCode>";
			 datXml+="<FBLink><![CDATA["+profileData.getFbLink()+"]]></FBLink>";
			 datXml+="<TwitterLink><![CDATA["+profileData.getTwitterLink()+"]]></TwitterLink>";
		 }else if(sectionName.equals(FiinfraConstants.PROFILE_EMAIL_DETAILS)){
			 datXml+="<CommunicationName><![CDATA["+profileData.getEmailCommunicationName()+"]]></CommunicationName>";
			 datXml+="<CommunicationEmail><![CDATA["+profileData.getEmailCommunicationId()+"]]></CommunicationEmail>";
		 }else if(sectionName.equals(FiinfraConstants.PROFILE_EMAIL_SIGNATURE)){
			 datXml+="<EmailSignature><![CDATA["+profileData.getEmailSignature()+"]]></EmailSignature>";
		 }else if(sectionName.equals(FiinfraConstants.PROFILE_EMAIL_DISCLAIMER)){
			 datXml+="<EmailDisclaimer><![CDATA["+profileData.getDisclaimer()+"]]></EmailDisclaimer>";
		 }else if(sectionName.equals(FiinfraConstants.PROFILE_EMAIL_DND)){
			 datXml+="<EmailDND><![CDATA["+profileData.getDnd()+"]]></EmailDND>";
		 }else if(sectionName.equals(FiinfraConstants.PROFILE_BANK_DETAILS)){
			 datXml+="<BankName><![CDATA["+profileData.getBankName()+"]]></BankName>";
			 datXml+="<BranchName><![CDATA["+profileData.getBranchname()+"]]></BranchName>";
			 datXml+="<City><![CDATA["+profileData.getCity()+"]]></City>";
			 datXml+="<AccountType><![CDATA["+profileData.getAccounttype()+"]]></AccountType>";
			 datXml+="<AccountNo><![CDATA["+profileData.getAccountNo()+"]]></AccountNo>";
			 datXml+="<MICRCode><![CDATA["+profileData.getMicrCode()+"]]></MICRCode>";
			 datXml+="<IFSCCode><![CDATA["+profileData.getIfscCode()+"]]></IFSCCode>";
		 }else if(sectionName.equals(FiinfraConstants.PROFILE_USER_ACCOUNT_DETAILS)){
			 String encryptrdPassword="";	
			if (profileData.getPassword()==null||profileData.getPassword()=="") {
				
			} else {
				String hexString = null;
				hexString = new String(profileData.getPassword());
				MD5Encryption md5Encryption = new MD5Encryption();
				encryptrdPassword = md5Encryption.encrypt(hexString);
				logger.debug("encryptrdPassword:--"+encryptrdPassword);
			}
			 datXml+="<Password><![CDATA["+encryptrdPassword+"]]></Password>";
			 datXml+="<SecurityQuestionId><![CDATA["+profileData.getSecurityQuestionId()+"]]></SecurityQuestionId>";
			 datXml+="<SecurityAnswer><![CDATA["+profileData.getSecurityAnswer()+"]]></SecurityAnswer>";
		 }else if(sectionName.equals(FiinfraConstants.PROFILE_RECIDENCE_ADDRESS) || sectionName.equals(FiinfraConstants.PROFILE_OFFICE_ADDRESS)){
			 AddressData addressData=profileData.getAddressDataList().get(0);
			 datXml+="<Street1><![CDATA["+addressData.getStreet1()+"]]></Street1>";
			 datXml+="<Street2><![CDATA["+addressData.getStreet2()+"]]></Street2>";
			 datXml+="<Street3><![CDATA["+addressData.getStreet3()+"]]></Street3>";
			 datXml+="<Country><![CDATA["+addressData.getCountry()+"]]></Country>";
			 datXml+="<State><![CDATA["+addressData.getState()+"]]></State>";
			 datXml+="<City><![CDATA["+addressData.getCity()+"]]></City>";
			 datXml+="<PostalCode><![CDATA["+addressData.getPostalCode()+"]]></PostalCode>";
		 }else if(sectionName.equals(FiinfraConstants.PROFILE_PERSONAL_INFO_1)){
			 DocumentData d=profileData.getDocumentData();
			 datXml+="<IsAttachment><![CDATA["+profileData.isAttachment()+"]]></IsAttachment>";
			 datXml+="<Attachmentcount><![CDATA["+profileData.getAttachmentCount()+"]]></Attachmentcount>";
			 datXml+="<ContactEmail><![CDATA["+profileData.getContactEmail()+"]]></ContactEmail>";
			 datXml+="<ContactMobile><![CDATA["+profileData.getContactMobile()+"]]></ContactMobile>";
			 datXml+="<AlternetMobile><![CDATA["+profileData.getAlternetcontact()+"]]></AlternetMobile>";
			 if(d!=null){
			 datXml+="<DocumentName><![CDATA["+d.getDocumentName()+"]]></DocumentName>";
			 datXml+="<DocumentStorageLocation><![CDATA["+d.getDocumentStorageLocation()+"]]></DocumentStorageLocation>";
			 datXml+="<DocumentType><![CDATA["+d.getDocumentType()+"]]></DocumentType>";
			 datXml+="<CreatedBy><![CDATA["+d.getCreatedBy()+"]]></CreatedBy>";
			 datXml+="<FileName><![CDATA["+d.getFileName()+"]]></FileName>";
			 datXml+="<FileSize><![CDATA["+d.getFileSize()+"]]></FileSize>";
			 datXml+="<FileStoragePathURI><![CDATA["+d.getFileStoragePathURI()+"]]></FileStoragePathURI>";
			 datXml+="<FileTypeId><![CDATA["+d.getFileTypeId()+"]]></FileTypeId>";
			 }
		 }else if(sectionName.equals(FiinfraConstants.PROFILE_EMAIL_OTHER_DETAILS)){
			 DocumentData d=profileData.getDocumentData();
			 datXml+="<IsAttachment><![CDATA["+profileData.isAttachment()+"]]></IsAttachment>";
			 datXml+="<Attachmentcount><![CDATA["+profileData.getAttachmentCount()+"]]></Attachmentcount>";
			 datXml+="<Theme><![CDATA["+profileData.getTheme()+"]]></Theme>";
			 datXml+="<SmsSignature><![CDATA["+profileData.getSmsSignature()+"]]></SmsSignature>";
			 if(d!=null){
			 datXml+="<DocumentName><![CDATA["+d.getDocumentName()+"]]></DocumentName>";
			 datXml+="<DocumentStorageLocation><![CDATA["+d.getDocumentStorageLocation()+"]]></DocumentStorageLocation>";
			 datXml+="<DocumentType><![CDATA["+d.getDocumentType()+"]]></DocumentType>";
			 datXml+="<CreatedBy><![CDATA["+d.getCreatedBy()+"]]></CreatedBy>";
			 datXml+="<FileName><![CDATA["+d.getFileName()+"]]></FileName>";
			 datXml+="<FileSize><![CDATA["+d.getFileSize()+"]]></FileSize>";
			 datXml+="<FileStoragePathURI><![CDATA["+d.getFileStoragePathURI()+"]]></FileStoragePathURI>";
			 datXml+="<FileTypeId><![CDATA["+d.getFileTypeId()+"]]></FileTypeId>";
			 }
		 }else if(sectionName.equals(FiinfraConstants.PROFILE_FINANCIAL_PRODUCTS)){
			 datXml+=profileData.getProductXml();
		 }else if(sectionName.equals(FiinfraConstants.PROFILE_INTERESTED_FP)){
			 datXml+=profileData.getInterestedFpXML();
			 System.out.println("XML--------"+datXml);
		 }else if(sectionName.equals("MFFileUploadCongiuration")){
			 datXml+="<CAMSPassword><![CDATA["+profileData.getCamsPassword()+"]]></CAMSPassword>";
			 datXml+="<KarvyPassword><![CDATA["+profileData.getKarvyPassword()+"]]></KarvyPassword>";
			 datXml+="<SundaramPassword><![CDATA["+profileData.getSundaramPassword()+"]]></SundaramPassword>";
		 }
		 datXml+="</Root>";
		return datXml;	 
	 }

	public static String getOpportunityDataXML(OpportunityData opportunityData) {
		int isFromProfile=0;
		if(opportunityData.isFromProfile()==true){
			isFromProfile=1;
		}
		String datXml="<Root>";
		datXml+="<SalutationId><![CDATA["+opportunityData.getSalutationID()+"]]></SalutationId>";
		datXml+="<Name><![CDATA["+opportunityData.getName()+"]]></Name>";
		datXml+="<Occupation><![CDATA["+opportunityData.getOccupation()+"]]></Occupation>";
		datXml+="<PanNo><![CDATA["+opportunityData.getPanNo()+"]]></PanNo>";
		datXml+="<MobilePhone><![CDATA["+opportunityData.getContactMobile()+"]]></MobilePhone>";
		datXml+="<DOB><![CDATA["+opportunityData.getDob()+"]]></DOB>";
		datXml+="<Organization><![CDATA["+opportunityData.getOrganization()+"]]></Organization>";
		datXml+="<Experience><![CDATA["+opportunityData.getExperience()+"]]></Experience>";
		datXml+="<Email><![CDATA["+opportunityData.getContactEmail()+"]]></Email>";
		datXml+="<SpouseName><![CDATA["+opportunityData.getSpouseName()+"]]></SpouseName>";
		datXml+="<SpousePAN><![CDATA["+opportunityData.getSpousePAN()+"]]></SpousePAN>";
		datXml+="<SpouseDOB><![CDATA["+opportunityData.getSpouseDob()+"]]></SpouseDOB>";
		datXml+="<SpouseAge><![CDATA["+opportunityData.getSpouseAge()+"]]></SpouseAge>";
		datXml+="<SpouseWorkProfession><![CDATA["+opportunityData.getWorkprofessionSpouse()+"]]></SpouseWorkProfession>";
		datXml+="<SpouseLname><![CDATA["+opportunityData.getLastName()+"]]></SpouseLname>";
		datXml+="<MotherName><![CDATA["+opportunityData.getMotherName()+"]]></MotherName>";
		datXml+="<MotherPAN><![CDATA["+opportunityData.getMotherPAN()+"]]></MotherPAN>";
		datXml+="<MotherDOB><![CDATA["+opportunityData.getMotherDob()+"]]></MotherDOB>";
		datXml+="<MotherAge><![CDATA["+opportunityData.getMotherAge()+"]]></MotherAge>";
		datXml+="<MotherWorkProfession><![CDATA["+opportunityData.getWorkprofessionMother()+"]]></MotherWorkProfession>";
		datXml+="<MotherLname><![CDATA["+opportunityData.getLastName()+"]]></MotherLname>";
		datXml+="<FatherName><![CDATA["+opportunityData.getFatherName()+"]]></FatherName>";
		datXml+="<FatherPAN><![CDATA["+opportunityData.getFatherPAN()+"]]></FatherPAN>";
		datXml+="<FatherDOB><![CDATA["+opportunityData.getFatherDob()+"]]></FatherDOB>";
		datXml+="<FatherAge><![CDATA["+opportunityData.getFatherAge()+"]]></FatherAge>";
		datXml+="<FatherWorkProfession><![CDATA["+opportunityData.getWorkprofessionFather()+"]]></FatherWorkProfession>";
		datXml+="<FatherLname><![CDATA["+opportunityData.getLastName()+"]]></FatherLname>";
		datXml+="<MotherInLawName><![CDATA["+opportunityData.getMotherInLawName()+"]]></MotherInLawName>";
		datXml+="<MotherInLawPAN><![CDATA["+opportunityData.getMotherInLawPAN()+"]]></MotherInLawPAN>";
		datXml+="<MotherInLawDOB><![CDATA["+opportunityData.getMotherInLawDob()+"]]></MotherInLawDOB>";
		datXml+="<MotherInLawAge><![CDATA["+opportunityData.getMotherInLawAge()+"]]></MotherInLawAge>";
		datXml+="<MotherInLawWorkProfession><![CDATA["+opportunityData.getWorkprofessionMotherInLow()+"]]></MotherInLawWorkProfession>";
		datXml+="<MotherInLawLname><![CDATA["+opportunityData.getLastName()+"]]></MotherInLawLname>";
		datXml+="<FatherInLawName><![CDATA["+opportunityData.getFatherInLawName()+"]]></FatherInLawName>";
		datXml+="<FatherInLawPAN><![CDATA["+opportunityData.getFatherInLawPAN()+"]]></FatherInLawPAN>";
		datXml+="<FatherInLawDOB><![CDATA["+opportunityData.getFatherInLawDob()+"]]></FatherInLawDOB>";
		datXml+="<FatherInLawAge><![CDATA["+opportunityData.getFatherInLawAge()+"]]></FatherInLawAge>";
		datXml+="<FatherInLawWorkProfession><![CDATA["+opportunityData.getWorkprofessionfatherInLaw()+"]]></FatherInLawWorkProfession>";
		datXml+="<FatherInLawLname><![CDATA["+opportunityData.getLastName()+"]]></FatherInLawLname>";
		datXml+="<HufName><![CDATA["+opportunityData.getHuf()+"]]></HufName>";
		datXml+="<HufPAN><![CDATA["+opportunityData.getHufPan()+"]]></HufPAN>";
		datXml+="<HufDOB><![CDATA["+opportunityData.getHufDob()+"]]></HufDOB>";
		datXml+="<HufAge><![CDATA["+opportunityData.getHufAge()+"]]></HufAge>";
		datXml+="<HufWorkProfession><![CDATA["+opportunityData.getWorkprofessionHuf()+"]]></HufWorkProfession>";
		datXml+="<HufLname><![CDATA["+opportunityData.getLastName()+"]]></HufLname>";
		datXml+="<FamilyMemberData>"+opportunityData.getFamilyMemberXml()+"</FamilyMemberData>";
		
		datXml+="<IsFromProfile>"+isFromProfile+"</IsFromProfile>";
		DocumentData d=opportunityData.getDocumentData();
		 datXml+="<IsAttachment><![CDATA["+opportunityData.isAttachment()+"]]></IsAttachment>";
		 datXml+="<Attachmentcount><![CDATA["+opportunityData.getAttachmentCount()+"]]></Attachmentcount>";
		 if(d!=null){
		 datXml+="<DocumentName><![CDATA["+d.getDocumentName()+"]]></DocumentName>";
		 datXml+="<DocumentStorageLocation><![CDATA["+d.getDocumentStorageLocation()+"]]></DocumentStorageLocation>";
		 datXml+="<DocumentType><![CDATA["+d.getDocumentType()+"]]></DocumentType>";
		 datXml+="<CreatedBy><![CDATA["+d.getCreatedBy()+"]]></CreatedBy>";
		 datXml+="<FileName><![CDATA["+d.getFileName()+"]]></FileName>";
		 datXml+="<FileSize><![CDATA["+d.getFileSize()+"]]></FileSize>";
		 datXml+="<FileStoragePathURI><![CDATA["+d.getFileStoragePathURI()+"]]></FileStoragePathURI>";
		 datXml+="<FileTypeId><![CDATA["+d.getFileTypeId()+"]]></FileTypeId>";
		 }
		datXml+="</Root>";
		return datXml;	 
	
	}
	

	/**
	 * Checks for a null object.If object is an instance of String ,then checks
	 * if its empty
	 * 
	 * @param obj
	 * @return
	 */
	
	public static boolean isNullOrEmpty(Object obj) {
		if (obj != null) {
			if (obj instanceof String) {
				if (((String) obj).trim().length() > 0)
					return false;
			} else {
				return false;
			}
		}
		return true;
	}
	
	/**
	 * Checks whether the given collection is not null or not empty
	 * 
	 * @param List
	 * @return boolean
	 */
	public static boolean isNullorEmptyCollection(Collection<?> collection) {
		if (collection != null && !collection.isEmpty())
			return false;
		return true;
	}
	/**
	 * Checks whether the given Map is not null or not empty
	 * 
	 * @param List
	 * @return boolean
	 */
	public static boolean isNullorEmptyMap(Map<?, ?> map) {
		if (map != null && !map.isEmpty())
			return false;
		return true;
	}
	
	/**
	 * Checks for a null object.If object is an instance of Long ,then checks
	 * if its value is zero
	 * @param obj
	 * @return
	 */
	public static boolean isNullOrZero(Object obj){
		if(obj != null){
			if(obj instanceof Long){
				if(((Long)obj).longValue()==0){
					return true;
				}else{
					return false;
				}
			}
		}
		return true;
	}
	
	
	public static String getAttributeDataXML( List<GoalAttribute> goalAttributes )
	{
		String attributeXML = null;
		if(goalAttributes != null) {
			attributeXML="<Root>";
			for (GoalAttribute goalAttribute : goalAttributes) {
				attributeXML+="<GoalAttribute>";
				attributeXML+="<GoalAttributeID><![CDATA["+1+"]]></GoalAttributeID>";
				attributeXML+="<AttributeName><![CDATA["+goalAttribute.getAttributeName()+"]]></AttributeName>";
				attributeXML+="<AttributeValue><![CDATA["+goalAttribute.getAttributeValue()+"]]></AttributeValue>";
				attributeXML+="<ValueDataTypeID><![CDATA["+goalAttribute.getValueDataTypeID()+"]]></ValueDataTypeID>";
				attributeXML+="<CreatedBy><![CDATA["+1+"]]></CreatedBy>";
				attributeXML+="</GoalAttribute>";
			}
		attributeXML+="</Root>";
		}
		return attributeXML;
	}
	
	public static String getAssetLevelXML( List<AdviceRecommendation> adviceRecommendations )
	{
		String assetXML = null;
		if( !adviceRecommendations.isEmpty()  )
		{
			StringBuilder stringBuilder = new StringBuilder();
			stringBuilder.append("<Root>");
			for (AdviceRecommendation adviceRecommendation : adviceRecommendations) {
				stringBuilder.append("<AdviceRecommendation>");
				if(adviceRecommendation.getId() != null){
					stringBuilder.append("<FPAdviceRecommedId>"+adviceRecommendation.getId()+"</FPAdviceRecommedId>");
				}else {	
					stringBuilder.append("<FPAdviceRecommedId>"+0+"</FPAdviceRecommedId>");
				}
				if(adviceRecommendation.getRecordTypeId() != null){
					stringBuilder.append("<RecordTypeId>"+adviceRecommendation.getRecordTypeId()+"</RecordTypeId>");
				}else {
					stringBuilder.append("<RecordTypeId>"+0+"</RecordTypeId>");
				}
				if(adviceRecommendation.getPartyId() != null){
					stringBuilder.append("<PartyId>"+adviceRecommendation.getPartyId()+"</PartyId>");
				}else {
					stringBuilder.append("<PartyId>"+0+"</PartyId>");
				}
				if(adviceRecommendation.getBuPartyId() != null){
					stringBuilder.append("<BuPartyId>"+adviceRecommendation.getBuPartyId()+"</BuPartyId>");
				}else {
					stringBuilder.append("<BuPartyId>"+0+"</BuPartyId>");
				}
				if(adviceRecommendation.getSectionTypeId() != null){
					stringBuilder.append("<FPSectionTypeId>"+adviceRecommendation.getSectionTypeId()+"</FPSectionTypeId>");
				}else {
					stringBuilder.append("<FPSectionTypeId>"+0+"</FPSectionTypeId>");
				}
				if(adviceRecommendation.getAssetClassId() != null){
					stringBuilder.append("<AssetClassId>"+adviceRecommendation.getAssetClassId()+"</AssetClassId>");
				}else {
					stringBuilder.append("<AssetClassId>"+0+"</AssetClassId>");
				}
				if(adviceRecommendation.getProductTypeId() != null){
					stringBuilder.append("<ProductTypeId>"+adviceRecommendation.getProductTypeId()+"</ProductTypeId>");
				}else {
					stringBuilder.append("<ProductTypeId>"+0+"</ProductTypeId>");
				}
				if(adviceRecommendation.getCategoryId() != null) {
					stringBuilder.append("<CategoryId>"+adviceRecommendation.getCategoryId()+"</CategoryId>");
				}else {
					stringBuilder.append("<CategoryId>"+0+"</CategoryId>");
				}
				if(adviceRecommendation.getProductId() != null) {
					stringBuilder.append("<ProductId>"+adviceRecommendation.getProductId()+"</ProductId>");
				}else {
					stringBuilder.append("<ProductId>"+0+"</ProductId>");
				}
				if(adviceRecommendation.getGoalYearRangeId() != null) {
					stringBuilder.append("<GoalYearRangeId>"+adviceRecommendation.getGoalYearRangeId()+"</GoalYearRangeId>");
				}else {
					stringBuilder.append("<GoalYearRangeId>"+0+"</GoalYearRangeId>");
				}
				if(adviceRecommendation.getAllocationPercent() != null) {
					stringBuilder.append("<AllocationPercent>"+adviceRecommendation.getAllocationPercent()+"</AllocationPercent>");
				}else {
					stringBuilder.append("<AllocationPercent>"+0+"</AllocationPercent>");
				}
				if(adviceRecommendation.getRiskProfileId() != null) {
					stringBuilder.append("<RiskProfileId>"+adviceRecommendation.getRiskProfileId()+"</RiskProfileId>");
				}else {
					stringBuilder.append("<RiskProfileId>"+0+"</RiskProfileId>");
				}
				if(adviceRecommendation.getParentFPAdviseRecommendID() != null) {
					stringBuilder.append("<ParentFPAdviseRecommendationId>"+adviceRecommendation.getParentFPAdviseRecommendID()+"</ParentFPAdviseRecommendationId>");
				}else {
					stringBuilder.append("<ParentFPAdviseRecommendationId>"+0+"</ParentFPAdviseRecommendationId>");
				}
				if(adviceRecommendation.getIspreferredProduct() != null) {
					stringBuilder.append("<IsPreferredProduct>"+adviceRecommendation.getIspreferredProduct()+"</IsPreferredProduct>");
				}else {
					stringBuilder.append("<IsPreferredProduct>"+0+"</IsPreferredProduct>");
				}
				if(adviceRecommendation.getSeqNo() != null) {
					stringBuilder.append("<SeqNo>"+adviceRecommendation.getSeqNo()+"</SeqNo>");
				}else {
					stringBuilder.append("<SeqNo>"+0+"</SeqNo>");
				}
				if(adviceRecommendation.getRecommendationRecordTypeId() != null) {
					stringBuilder.append("<RecommendationRecordTypeId>"+adviceRecommendation.getRecommendationRecordTypeId()+"</RecommendationRecordTypeId>");
				}else {
					stringBuilder.append("<RecommendationRecordTypeId>"+0+"</RecommendationRecordTypeId>");
				}
				if(adviceRecommendation.getCreatedBy() != null) {
					stringBuilder.append("<CreatedBy>"+adviceRecommendation.getCreatedBy()+"</CreatedBy>");
				}else {
					stringBuilder.append("<CreatedBy>"+0+"</CreatedBy>");
				}
				if(adviceRecommendation.getCreatedBy() != null) {
					stringBuilder.append("<LastModifiedBy>"+adviceRecommendation.getCreatedBy()+"</LastModifiedBy>");
				}else {
					stringBuilder.append("<LastModifiedBy>"+0+"</LastModifiedBy>");
				}
				if(adviceRecommendation.getAllocationPercentProductType() != null) {
					stringBuilder.append("<AllocationProductType>"+adviceRecommendation.getAllocationPercentProductType()+"</AllocationProductType>");
				}else {
					stringBuilder.append("<AllocationProductType>"+0+"</AllocationProductType>");
				}
				stringBuilder.append("</AdviceRecommendation>");
			}
			stringBuilder.append("</Root>");
			assetXML = stringBuilder.toString();
		}
		return assetXML;
	}
	
	public static String getGoalBucketXml( List<AdviceRecommendation> adviceRecommendationList )
	{
		String goalPlanXml = null;
		if( adviceRecommendationList != null ){
			goalPlanXml = "<Root>";
			for (AdviceRecommendation a : adviceRecommendationList) {
				goalPlanXml+="<AdviceRecommendation>";
				goalPlanXml+="<PartyId>"+a.getPartyId()+"</PartyId>";
				goalPlanXml+="<BuPartyId>"+a.getBuPartyId()+"</BuPartyId>";
				goalPlanXml+="<RiskProfileId>"+a.getRiskProfileId()+"</RiskProfileId>";
				goalPlanXml+="<GoalYearRangeId>"+a.getGoalYearRangeId()+"</GoalYearRangeId>";
				goalPlanXml+="<AssetClassId>"+a.getAssetClassId()+"</AssetClassId>";
				goalPlanXml+="<ProductTypeId>"+a.getProductTypeId()+"</ProductTypeId>";
				goalPlanXml+="<CategoryId>"+a.getCategoryId()+"</CategoryId>";
				goalPlanXml+="<ProductName>"+a.getProductName()+"</ProductName>";
				goalPlanXml+="<AssetClassAllocationPercent>"+a.getAllocationPercentAssetClass()+"</AssetClassAllocationPercent>";
				goalPlanXml+="<ProductAllocationPercent>"+a.getAllocationPercentProductId()+"</ProductAllocationPercent>";
				goalPlanXml+="</AdviceRecommendation>";
			}
			goalPlanXml += "</Root>";
		}
		
		return goalPlanXml;
	}
	
	public static String getGoalDataXML( GoalData goalData ) {
		
		String goalDataXML = null;
		Integer goalFamilyPartyId = 0;
		Integer goalPriority = 0;
		
		if( goalData != null ) {
			
			if( goalData.getGoalFamilyPartyId() != null ) {
				goalFamilyPartyId =goalData.getGoalFamilyPartyId(); 
			}
			
			goalDataXML="<Root>";
			goalDataXML+="<Goal>";
			if( goalData.getId() != null ) {
				goalDataXML+="<GoalId><![CDATA["+goalData.getId()+"]]></GoalId>";
			}
			goalDataXML+="<GoalDescription><![CDATA["+goalData.getGoalDescription()+"]]></GoalDescription>";
			if( goalData.getGoalAmountPv() != null ) {
				goalDataXML+="<GoalAmountPv><![CDATA["+goalData.getGoalAmountPv()+"]]></GoalAmountPv>";
			} else {
				goalDataXML+="<GoalAmountPv><![CDATA["+0+"]]></GoalAmountPv>";
			}
			goalDataXML+="<GoalTypeId><![CDATA["+goalData.getGoalTypeId()+"]]></GoalTypeId>";
			goalDataXML+="<GoalFamilyPartyID><![CDATA["+goalFamilyPartyId+"]]></GoalFamilyPartyID>";
			if( goalData.getGoalStartYear() != null ) {
				goalDataXML+="<GoalEndYear><![CDATA["+goalData.getGoalStartYear()+"]]></GoalEndYear>";
			} else {
				goalDataXML+="<GoalEndYear><![CDATA["+0+"]]></GoalEndYear>";
			}
			if( goalData.getGoalStartYear() != null ) {
				goalDataXML+="<GoalStartYear><![CDATA["+goalData.getGoalStartYear()+"]]></GoalStartYear>";
			} else {
				goalDataXML+="<GoalStartYear><![CDATA["+0+"]]></GoalStartYear>";
			}
			if( goalData.getLoanAmount() != null ) {
				goalDataXML+="<LoanAmount><![CDATA["+goalData.getLoanAmount()+"]]></LoanAmount>";
			} else {
				goalDataXML+="<LoanAmount><![CDATA["+0+"]]></LoanAmount>";
			}
			if( goalData.getLoanDownPayment() != null ) {
				goalDataXML+="<LoanDownPayment><![CDATA["+goalData.getLoanDownPayment()+"]]></LoanDownPayment>";
			} else {
				goalDataXML+="<LoanDownPayment><![CDATA["+0+"]]></LoanDownPayment>";
			}
			if( goalData.getLoanInterestPercentage() != null ) {
				goalDataXML+="<LoanInterestPercentage><![CDATA["+goalData.getLoanInterestPercentage()+"]]></LoanInterestPercentage>";
			} else {
				goalDataXML+="<LoanInterestPercentage><![CDATA["+0+"]]></LoanInterestPercentage>";
			}
			if( goalData.getLoanDurationYears() != null ) {
				goalDataXML+="<LoanDurationYears><![CDATA["+goalData.getLoanDurationYears()+"]]></LoanDurationYears>";
			} else {
				goalDataXML+="<LoanDurationYears><![CDATA["+0+"]]></LoanDurationYears>";
			}
			goalDataXML+="<GoalPriority><![CDATA["+goalPriority+"]]></GoalPriority>";
			goalDataXML+="<GoalInflation><![CDATA["+goalData.getGoalInflationRate()+"]]></GoalInflation>";
			goalDataXML+="<GoalMonth><![CDATA["+goalData.getGoalMonth()+"]]></GoalMonth>";
			goalDataXML+="<GoalName><![CDATA["+goalData.getGoalName()+"]]></GoalName>";
			if(goalData.getIsAllocateAsset() != null) {
				goalDataXML+="<IsAllocateAsset><![CDATA["+goalData.getIsAllocateAsset()+"]]></IsAllocateAsset>";
			} else {
				goalDataXML+="<IsAllocateAsset>0</IsAllocateAsset>";
			}
			goalDataXML+="</Goal>";
			goalDataXML+="</Root>";
		}
		return goalDataXML;
	}
	
	public static String getGoalPriorityXML(List <GoalData> goalDataList) {
		String goalDataXML = null;		
		goalDataXML="<Root>";
		for(GoalData goal : goalDataList ) {
			goalDataXML+="<Goal>";
			goalDataXML+="<GoalId>" + goal.getId() + "</GoalId>";				
			goalDataXML+="<GoalPriorityID>" + goal.getPriority() + "</GoalPriorityID>";				
			goalDataXML+="</Goal>";
		}
		goalDataXML+="</Root>";
		
		return goalDataXML;
	}
	public static Map<String, String> createGoalMap( GoalData goalData )
	{
		List<GoalAttribute> goalAttributeList = new ArrayList<GoalAttribute>();
		goalAttributeList = goalData.getGoalAttributeList();
		Map<String, String> goalMap = new HashMap<String, String>();
		
		for (GoalAttribute goalAttribute : goalAttributeList) {
			goalMap.put(goalAttribute.getAttributeName(), goalAttribute.getAttributeValue());
		}
		goalMap.put("100054", goalData.getGoalFamilyPartyId().toString());
		goalMap.put("100050", goalData.getGoalStartYear().toString());
		goalMap.put("100052", goalData.getGoalAmountPv().toString());
		goalMap.put("100057", goalData.getLoanDownPayment().toString());
		goalMap.put("100056", goalData.getLoanAmount().toString());
		goalMap.put("100058", goalData.getLoanInterestPercentage().toString());
		goalMap.put("100059", goalData.getLoanDurationYears().toString());
		goalMap.put("100051", goalData.getGoalMonth().toString());
		goalMap.put("100053", goalData.getGoalInflationRate().toString());
		return goalMap;
	}
	
	public static String createAnalysisXML( DcAnalysisHelper dcAnalysisHelper )
	{
		String analysisXML ="";
		if( dcAnalysisHelper != null )
		{
			analysisXML+="<Root>";
			analysisXML+="<AnalysisReport>";
			analysisXML+="<FirstTake>"+dcAnalysisHelper.getFirstTake()+"</FirstTake>";
			analysisXML+="<AnalysisFor>"+dcAnalysisHelper.getDataFor()+"</AnalysisFor>";
			analysisXML+="<AnlysisValues>"+dcAnalysisHelper.getAnalysis()+"</AnlysisValues>";
			analysisXML+="<SuccessMessage>"+dcAnalysisHelper.getSuccessMsg()+"</SuccessMessage>";
			analysisXML+="<ErrorMessage>"+dcAnalysisHelper.getErrorMsg()+"</ErrorMessage>";
			analysisXML+="</AnalysisReport>";
			analysisXML+="</Root>";
		}
		
		return analysisXML;
	}
	
	public static GoalData createGoalData( String goalValueIds )
	{
		GoalData goalData = new GoalData();
		List<GoalAttribute> goalAttributeList = new ArrayList<GoalAttribute>();
		
		String goalValueId = goalValueIds.replaceAll("\\[", "");
		goalValueIds = goalValueId.replaceAll("\\]", "");
		
//		goalData.setGoalSeqNo(1);
//		goalData.setGoalPriorityId(36002);    // Temp. Value For Medium Priority
// 		goalData.setGoalStatusId(71001);      // Value For New Status
		
		StringTokenizer stringTokenizerComma = new StringTokenizer(goalValueIds,",");
		Integer count = stringTokenizerComma.countTokens();
		for (int i = 0; i < count; i++) {
			
			GoalAttribute goalAttribute = new GoalAttribute();
			String attributeIdAndValue = (String)stringTokenizerComma.nextElement();
			StringTokenizer stringTokenizerColon = new StringTokenizer(attributeIdAndValue,":");
			String attributeId = (String)stringTokenizerColon.nextElement();
			String attributeValue = stringTokenizerColon.nextToken();
			if( attributeId.equals("100054") ) {   //Goal For - Family PartyId
				if(!attributeValue.equalsIgnoreCase("null"))
				{
					goalData.setGoalFamilyPartyId(Integer.parseInt(attributeValue));
				}
			}
			else if( attributeId.equals("100050") ) {   // Goal Start Year
				if(!attributeValue.equalsIgnoreCase("null"))
				{
					goalData.setGoalStartYear(Integer.parseInt(attributeValue));
				}
			}
			else if( attributeId.equals("100052") ) {  // Goal Amount
				if(!attributeValue.equalsIgnoreCase("null"))
				{
					goalData.setGoalAmountPv(attributeValue);
				}
			}
			else if( attributeId.equals("100057") ) {  // Goal Loan Down Payment
				if(!attributeValue.equalsIgnoreCase("null"))
				{
					goalData.setLoanDownPayment(Double.parseDouble(attributeValue));
				}
			}
			else if( attributeId.equals("100056") ) {  // Goal Loan Amount
				if(!attributeValue.equalsIgnoreCase("null"))
				{
					goalData.setLoanAmount(Double.parseDouble(attributeValue));
				}
			}
			else if( attributeId.equals("100058") ) {  // Goal Loan Interest Percentage
				if(!attributeValue.equalsIgnoreCase("null"))
				{
					goalData.setLoanInterestPercentage(Double.parseDouble(attributeValue));
				}
			}
			else if( attributeId.equals("100059") ) {  // Goal Loan Duration Years
				if(!attributeValue.equalsIgnoreCase("null"))
				{
					goalData.setLoanDurationYears(Integer.parseInt(attributeValue));
				}
			}
			else if(attributeId.equals("100051")){ // Goal Start Month
				if(!attributeValue.equalsIgnoreCase("null"))
				{
					goalData.setGoalMonth(Integer.parseInt(attributeValue));
				}
			}
			else if(attributeId.equals("100053")){ // Inflation rate
				if(!attributeValue.equalsIgnoreCase("null"))
				{
					goalData.setGoalInflationRate(attributeValue);
				}
			}
			 else {
				goalAttribute.setAttributeName(attributeId);
				goalAttribute.setAttributeValue(attributeValue);
				if( attributeId.equals("100012") ) {  // Annual Fees
					goalAttribute.setValueDataTypeID(37003);  // Amount Data Type ID
				} else {
					goalAttribute.setValueDataTypeID(37001);  // Text Data TYpe ID
				}
				goalAttributeList.add(goalAttribute);
			}			
		}
		goalData.setGoalAttributeList(goalAttributeList);
		return goalData;
	}
	
	 public static String getDocumentDataXML(List<Document> documents){
		 String documentXML=null;
		 if(documents!=null){
			 documentXML="<Root>";
		 for(Document d:documents){
			 	documentXML+="<Document>";
				documentXML+="<DocumentID><![CDATA["+d.getDocumentId()+"]]></DocumentID>";
				documentXML+="<DocumentName><![CDATA["+d.getDocumentName()+"]]></DocumentName>";
				documentXML+="<DocumentStorageLocation><![CDATA["+d.getDocumentStorageLocation()+"]]></DocumentStorageLocation>";
				documentXML+="<DocumentType><![CDATA["+d.getDocumentType()+"]]></DocumentType>";
				documentXML+="<CreatedBy><![CDATA["+d.getCreatedBy()+"]]></CreatedBy>";
				documentXML+="<FileName><![CDATA["+d.getFileName()+"]]></FileName>";
				documentXML+="<FileSize><![CDATA["+d.getFileSize()+"]]></FileSize>";
				documentXML+="<FileStoragePathURI><![CDATA["+d.getFileStoragePathURI()+"]]></FileStoragePathURI>";
				documentXML+="<FileTypeId><![CDATA["+d.getFileTypeId()+"]]></FileTypeId>";
				documentXML+="</Document>";
			}
		 documentXML+="</Root>";
		 } 
		 return documentXML;
	 }
	 /*
	  * this method accepts multiple paths comma seprated and delte those files one by one
	  * */
public static void deleteDocs(String paths){
	
	
	for(String path:paths.split(",")){
	File f=new File(path);
	f.delete();
	}
}
	 public static String getPartyAttributeXml(List<PartyAttribute> partyAttributes) 
	 {
		String partyAtributeXml=null;
		
		if(partyAttributes != null)
		{
			partyAtributeXml ="<Root>";
			for (PartyAttribute partyAttribute : partyAttributes) 
			{
				partyAtributeXml+="<PartyAttribute>";
				partyAtributeXml+="<PartyId><![CDATA["+partyAttribute.getPartyId()+"]]></PartyId>";
				partyAtributeXml+="<AttributeSeqNo><![CDATA["+partyAttribute.getAttributeSeqNo()+"]]></AttributeSeqNo>";
				partyAtributeXml+="<AttributeValue><![CDATA["+partyAttribute.getAttributeValue()+"]]></AttributeValue>";
				partyAtributeXml+="<CreatedBy><![CDATA["+partyAttribute.getCreatedBy()+"]]></CreatedBy>";
				partyAtributeXml+="<AttributeCodeID><![CDATA["+partyAttribute.getAttributeCodeID()+"]]></AttributeCodeID>";
				partyAtributeXml+="<ValueDataTypeID><![CDATA["+partyAttribute.getValueDataTypeID()+"]]></ValueDataTypeID>";
				partyAtributeXml+="</PartyAttribute>";
			}
			partyAtributeXml+="</Root>";
		}
		  return partyAtributeXml;
	 }
	 
	 

	 public static String getCharacterDataFromElement(Element e) {
			Node child = e.getFirstChild();
			if (child instanceof CharacterData) {
				CharacterData cd = (CharacterData) child;
				return cd.getData();
			}
			return "";
		}
	 
	 
		// @todo defined mapping in database insted of here
		public static Integer getStorageCodeIdFromDocumentRefType(Integer docRefType) {

			final Integer storageId;
			// @todo exception Query other needs to defined
			switch (docRefType) {
			// Party
			case 111001:
				storageId = 98075;
				break;
			// Task
			case 111002:
				storageId = 98075;
				break;
			// Plan
			case 111003:
				storageId = 98075;
				break;
			// Action Plan
			case 111004:
				storageId = 98075;
				break;
			// Execution
			case 111005:
				storageId = 98075;
				break;
			// Query
			case 111006:
				storageId = 98075;
				break;
			// Note
			case 111007:
				storageId = 98075;
				break;

			default:
				storageId = 98075;
			}

			return storageId;

		}
		
		public static String getAssumptionsXml(List<AdviceAssumption> adviceAssumptions) 
		 {
		 String assumptionsXml=null;
		 
		 if(adviceAssumptions != null)
		 {
		  assumptionsXml ="<Root>";
		  for (AdviceAssumption adviceAssumption:adviceAssumptions) 
		  {
		   assumptionsXml+="<Assumption>";
		   assumptionsXml+="<AssumptionValue><![CDATA["+adviceAssumption.getAssumptionValue()+"]]></AssumptionValue>";
		   assumptionsXml+="<AssumptionCodeId><![CDATA["+adviceAssumption.getAssumptionCodeId()+"]]></AssumptionCodeId>";
		   assumptionsXml+="</Assumption>";
		  }
		  assumptionsXml+="</Root>";
		 }
		   return assumptionsXml;
		 }
		
		public static String getActionPlanDataRiskXml( List<ActionPlanRisk> actionPlanRiskList) {
			
			String actionPlanRiskXml = null;
			actionPlanRiskXml = "<Root>";
			for (ActionPlanRisk a : actionPlanRiskList) {
				actionPlanRiskXml +="<ActionPlanDataRisk>";
				actionPlanRiskXml +="<PartyId>";
				actionPlanRiskXml +=(a.getPartyId()!= null)?a.getPartyId():0;
				actionPlanRiskXml +="</PartyId>";
				actionPlanRiskXml +="<RiskId>";
				actionPlanRiskXml +=(a.getRiskId()!= null)?a.getRiskId():0;
				actionPlanRiskXml +="</RiskId>";
				actionPlanRiskXml +="<Risk>"+a.getRisk()+"</Risk>";
				actionPlanRiskXml +="<CoverRequired>"+a.getCoverRequired()+"</CoverRequired>";
				actionPlanRiskXml +="<CoverAvailable>"+a.getCoverAvailable()+"</CoverAvailable>";
				actionPlanRiskXml +="<ProductId>";
				actionPlanRiskXml +=(a.getProductId()!=null)?a.getProductId():0;
				actionPlanRiskXml +="</ProductId>";
				actionPlanRiskXml +="<AllocationPercent>";
				actionPlanRiskXml +=(a.getAllocationPercent()!=null)?a.getAllocationPercent():0;
				actionPlanRiskXml +="</AllocationPercent>";
				actionPlanRiskXml +="<FPAdviseRecommendId>";
				actionPlanRiskXml +=(a.getFpAdviseRecommendId()!=null)?a.getFpAdviseRecommendId():0;
				actionPlanRiskXml +="</FPAdviseRecommendId>";
				actionPlanRiskXml +="<ClientApporvalId>";
				actionPlanRiskXml +=a.getActionApprovalId();
				actionPlanRiskXml +="</ClientApporvalId>";
				actionPlanRiskXml +="</ActionPlanDataRisk>";
			}
			actionPlanRiskXml += "</Root>";
			return actionPlanRiskXml;
		}
		
		public static String getWhatIfXml(List<WhatIfData> whatIfDataList) {
			 String whatIfXml = null;
			 whatIfXml = "<Root>";
			 for (WhatIfData whatIfData : whatIfDataList) {
				whatIfXml += "<AssetsSummary>";
				whatIfXml += "<AssetId>";
				whatIfXml += (whatIfData.getId()!=null)?whatIfData.getId():0;
				whatIfXml += "</AssetId>";
				whatIfXml += "<AssetPercentAvailable2Goals>";
				whatIfXml += (whatIfData.getAvailableToGoals()!=null)?whatIfData.getAvailableToGoals():0;
				whatIfXml += "</AssetPercentAvailable2Goals>";
				whatIfXml += "<AssetNameID>";
				whatIfXml += (whatIfData.getAssetNameId()!=null)?whatIfData.getAssetNameId():0;
				whatIfXml += "</AssetNameID>";
				whatIfXml += "<FPPlanID>";
				whatIfXml += (whatIfData.getFpPlanId()!=null)?whatIfData.getFpPlanId():0;
				whatIfXml += "</FPPlanID>";
				whatIfXml += "</AssetsSummary>";
			}
			 whatIfXml += "</Root>";
			 return whatIfXml;
		 }
		
		public static String getPayloadXMLFromMap(Map<String,String> payloadMap){
			String payloadXML=null;
			try{
				if(payloadMap.size()>0){
					payloadXML="<root>";
					Iterator iterator = payloadMap.entrySet().iterator();
					while (iterator.hasNext()) {
						payloadXML+="<payload>";
						Map.Entry mapEntry = (Map.Entry) iterator.next();
						String key=(String)mapEntry.getKey();
						String value=(String)mapEntry.getValue();
						payloadXML+="<key>"+key+"</key>";
						payloadXML+="<value>"+value+"</value>";
						payloadXML+="</payload>";
					}
					payloadXML+="</root>";
				}
			}catch (Exception e) {
				payloadXML=null;
			}
			return payloadXML;
		}
		
		
		public static String getImagePath(HttpServletRequest request, String relativePath, String defaultImage){
			if(StringUtils.isEmpty(relativePath)){
				if(!StringUtils.isEmpty(defaultImage)){
					return request.getContextPath()+defaultImage;	
				}
				return "#";
				
			}
			if(!relativePath.startsWith("/")){
				relativePath= "/"+relativePath;
			}
			return request.getContextPath()+"/app/images"+relativePath; 
		}

		public static String getBusinessDataXML(
				BusinessValuationData businessValuationData) {
			String dataXml = "<Root>";
			dataXml += "<CurrentNoOfCustomer>"+businessValuationData.getCurrentNoOfCustomer()+"</CurrentNoOfCustomer>";
			dataXml += "<RevenuePercustomer>"+businessValuationData.getRevenuePercustomer()+"</RevenuePercustomer>";
			dataXml += "<RevenuePastYear1>"+businessValuationData.getRevenuePastYear1()+"</RevenuePastYear1>";
			dataXml += "<RevenuePastYear2>"+businessValuationData.getRevenuePastYear2()+"</RevenuePastYear2>";
			dataXml += "<AdditionalCustomerPerYear>"+businessValuationData.getAdditionalCustomerPerYear()+"</AdditionalCustomerPerYear>";
			dataXml += "<GrowthPercentRevenuePercustomer>"+businessValuationData.getGrowthPercentRevenuePercustomer()+"</GrowthPercentRevenuePercustomer>";
			dataXml += "<NextYear1Revenue>"+businessValuationData.getNextYear1Revenue()+"</NextYear1Revenue>";
			dataXml += "<NextYear2Revenue>"+businessValuationData.getNextYear2Revenue()+"</NextYear2Revenue>";
			dataXml += "<NextYear3Revenue>"+businessValuationData.getNextYear3Revenue()+"</NextYear3Revenue>";
			dataXml += "<NextYear4Revenue>"+businessValuationData.getNextYear4Revenue()+"</NextYear4Revenue>";
			dataXml += "<NextYear5Revenue>"+businessValuationData.getNextYear5Revenue()+"</NextYear5Revenue>";
			dataXml+= "</Root>";
			
			return dataXml;
		}
		
		
		public static String getBusinessHealthIndexXML( List<BusinessHealthIndex> businessHealthIndexList )
		{
			String businessHealthIndexXml = null;
			if( businessHealthIndexList != null ){
				businessHealthIndexXml = "<Root>";
				for (BusinessHealthIndex businessHealthIndex : businessHealthIndexList) {
					businessHealthIndexXml+="<Answers>";
					businessHealthIndexXml+="<QusetionId>"+businessHealthIndex.getQuestionId()+"</QusetionId>";
					businessHealthIndexXml+="<QuestionOptionId>"+businessHealthIndex.getQuestionOptionID()+"</QuestionOptionId>";
					businessHealthIndexXml+="</Answers>";
				}
				businessHealthIndexXml += "</Root>";
			}
			
			return businessHealthIndexXml;
		}
		
		public static String getAssetAllocationXML( List<AssetAllocatedToGoal> assetAllocatedToGoalList )
		{
			//String assetXML = null;
			if( !assetAllocatedToGoalList.isEmpty()  )
			{
				StringBuilder stringBuilder = new StringBuilder();
				stringBuilder.append("<Root>");
				for (AssetAllocatedToGoal allocatedToGoal : assetAllocatedToGoalList) {
					stringBuilder.append("<AssetAllocation>");
					stringBuilder.append("<PartyAssetId>"+allocatedToGoal.getPartyAssetId()+"</PartyAssetId>");
					stringBuilder.append("<AssetTypeId>"+allocatedToGoal.getAssetTypeId()+"</AssetTypeId>");
					stringBuilder.append("<AllocatedAmount>"+allocatedToGoal.getAllocatedAmount()+"</AllocatedAmount>");
					stringBuilder.append("<AllocatedPercent>"+allocatedToGoal.getAllocatedPercent()+"</AllocatedPercent>");
					stringBuilder.append("<AvailableValue>"+allocatedToGoal.getAvailableValue()+"</AvailableValue>");
					stringBuilder.append("</AssetAllocation>");
				}
				stringBuilder.append("</Root>");
				return stringBuilder.toString();
			}
			return null;
		}
	
		/**
		 * Following Two static Method used for audit
		 * Shrinivas
		 * @param actionByPartyId
		 * @param actionByUserID
		 * @param eventID
		 * @param sourceSystemID
		 * @param sourceModule
		 * @param sourceScreen
		 */
		public static void doAudit(int actionByPartyId, int actionByUserID,
				int eventID, int sourceSystemID, String sourceModule,
				String sourceScreen) {
			Audit audit = new Audit();
			audit.setActionByPartyId(actionByPartyId);
			audit.setActionByUserID(actionByUserID);
			audit.setEventID(eventID);
			audit.setSourceSystemID(sourceSystemID);
			audit.setSourceModule(sourceModule);
			audit.setSourceScreen(sourceScreen);
			FrameworkUtil.audit(audit);
		}
		public static void doAudit(int actionByPartyId, int actionByUserID,
				int eventID, int sourceSystemID, String sourceModule,
				String sourceScreen,String eventTextXML,String object) {
			Audit audit = new Audit();
			audit.setActionByPartyId(actionByPartyId);
			audit.setActionByUserID(actionByUserID);
			audit.setEventID(eventID);
			audit.setSourceSystemID(sourceSystemID);
			audit.setSourceModule(sourceModule);
			audit.setSourceScreen(sourceScreen);
			audit.setEventTextXML(eventTextXML);
			audit.setObjectName(object);
			
			FrameworkUtil.audit(audit);
		}
		

		public static void doAudit(int actionByPartyId, int actionByUserID,
				int eventID, String eventName, String eventTextXML,
				int sourceSystemID, String sourceModule, String sourceScreen,
				String objectName, String progamNo, String dbProc, int sessionID,
				int buId) {
			Audit audit = new Audit();
			audit.setActionByPartyId(actionByPartyId);
			audit.setActionByUserID(actionByUserID);
			audit.setEventID(eventID);
			audit.setSourceSystemID(sourceSystemID);
			audit.setSourceModule(sourceModule);
			audit.setSourceScreen(sourceScreen);
			FrameworkUtil.audit(audit);
		}
		
		
		/**
		 * Following one static Method used for audit of Report
		 * Naval
		 * @param actionByPartyId
		 * @param actionByUserID
		 * @param eventID
		 * @param sourceSystemID
		 * @param sourceModule
		 * @param sourceScreen
		 * @param objectName
		 */
		public static void doAudit(int actionByPartyId, int actionByUserID,
				int eventID, int sourceSystemID, String sourceModule,
				String sourceScreen, String objectName) {
			Audit audit = new Audit();
			audit.setActionByPartyId(actionByPartyId);
			audit.setActionByUserID(actionByUserID);
			audit.setEventID(eventID);
			audit.setSourceSystemID(sourceSystemID);
			audit.setSourceModule(sourceModule);
			audit.setSourceScreen(sourceScreen);
			audit.setObjectName(objectName);
			FrameworkUtil.audit(audit);
		}
		
		
		public static int getRandomOTP(){
			long timeSeed = System.nanoTime(); // to get the current date time value
	        double randSeed = Math.random() * 100000; // random number generation
	        long midSeed = (long) (timeSeed * randSeed); 
	        String s = midSeed + "";
	        return Integer.parseInt(s.substring(s.length()-6));
		}
		
		public static String generateUniqueToken(Object...keys ){
			StringBuilder sb = new StringBuilder();
			for(Object s:keys){
				if(s != null){
					sb.append(s.toString());
				}
			}
			//added a random number to avoid possiblity of generating token manually.
			double randSeed = Math.random() * 100000;
			sb.append(randSeed);
			return sb.toString();
		}
}