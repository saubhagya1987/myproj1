package in.fiinfra.serviceportal.facade;



import in.fiinfra.common.partner.HeirarchyData;
import in.fiinfra.common.partner.LocationData;
import in.fiinfra.common.service.vo.Download;
import in.fiinfra.common.service.vo.FaqList;
import in.fiinfra.common.service.vo.FileUpload;
import in.fiinfra.common.service.vo.NotifyEvent;
import in.fiinfra.common.service.vo.Partner;
import in.fiinfra.common.util.BaseResponse;
import in.fiinfra.common.util.FiinfraResponseBuilder;
import in.fiinfra.cp.TestimonialData;
import static in.fiinfra.common.util.FiinfraConstants.LOCATION_TO_UPLOADFILE;
import in.fiinfra.serviceportal.service.DownloadServices;
import in.fiinfra.serviceportal.service.TestimonialServices;

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
import org.codehaus.jackson.JsonGenerationException;
import org.codehaus.jackson.map.JsonMappingException;
import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.multiaction.MultiActionController;

@Controller
@Path("/testimonialsp")
public class TestimonialController extends MultiActionController
{
private static final Logger logger = Logger.getLogger(DownloadController.class);
	
	Response response;
	String url;
	@Autowired
	TestimonialServices testimonialServices;
	private ObjectMapper objectMapper;	

	
	public TestimonialServices getTestimonialServices() {
		return testimonialServices;
	}
	public void setTestimonialServices(TestimonialServices downloadServices) {
		this.testimonialServices = downloadServices;
	}
	public ObjectMapper getObjectMapper() {
		return objectMapper;
	}
	public void setObjectMapper(ObjectMapper objectMapper) {
		this.objectMapper = objectMapper;
	}


	
	/*@POST
	@Produces(MediaType.APPLICATION_JSON)
	@Consumes(MediaType.APPLICATION_JSON)
	@Path("/getListOfTestimonials/{user}/{token}")
	public Response getListOfTestimonials(@PathParam("token") String token,
			TestimonialData testimonialData)
	{
	
		 //System.out.println("Naval Makwana");
		  //BaseResponse<TestimonialData> br = new BaseResponse<>();
		   response=testimonialServices.getTestimonials(testimonialData);
		   //System.out.println("NAval  makwana 2"+response);
		   return response;
			
	}*/
	
	@POST 
	@Produces(MediaType.APPLICATION_JSON)
	@Consumes(MediaType.APPLICATION_JSON)
	@Path("/getListOfTestimonials/{user}/{token}") 
	public Response getEventlist( 
			@PathParam("token") String token,
			  @RequestBody TestimonialData testimonialData	)
   {
		//System.out.println("Naval Makwana");
		  //BaseResponse<TestimonialData> br = new BaseResponse<>();
		   response=testimonialServices.getTestimonials(testimonialData);
		   //System.out.println("NAval  makwana 2"+response);
		   return response;   
	}
	  
	
	
	@POST
	@Produces(MediaType.APPLICATION_JSON)
	@Consumes(MediaType.APPLICATION_JSON)
	@Path("/addTestimonial/{user}/{token}")
	public Response addTestimonial(@PathParam("token") String token,
		TestimonialData testimonialData)
	{
	
		 //System.out.println("Naval Makwana");
		  //BaseResponse<TestimonialData> br = new BaseResponse<>();
		   response=testimonialServices.addTestimonial(testimonialData);
		   //System.out.println("NAval  makwana 2"+response);
		   return response;
			
	}
	

	@POST
	@Produces(MediaType.APPLICATION_JSON)
	@Consumes(MediaType.APPLICATION_JSON)
	@Path("/editTestimonial/{user}/{token}")
	public Response editTestimonial(@PathParam("token") String token,
		TestimonialData testimonialData)
	{
	
		 //System.out.println("Naval Makwana");
		  //BaseResponse<TestimonialData> br = new BaseResponse<>();
		   response=testimonialServices.editTestimonial(testimonialData);
		   //System.out.println("NAval  makwana 2"+response);
		   return response;
			
	}
	
	@GET
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/deleteTestimonial/{user}/{token}")
	public Response deleteTestimonial(@QueryParam("Lists") String selectedlvalz,@QueryParam("userId") int userid,   @PathParam("token") String token,
			@PathParam("user") String name) {
		response=testimonialServices.deleteTestimonial(selectedlvalz,userid);
			return response;
	}
	
	
	@GET
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/getHeirarchyDataForSP/{user}/{token}")
	public Response getHeirarchyDataForVP(@QueryParam("partyId") int partyId,@QueryParam("currentNodeId") int currentNodeId,@QueryParam("level") int level,@QueryParam("rootID") int rootId,
			@PathParam("token") String token, @PathParam("user") String name)
			throws JsonGenerationException, JsonMappingException, IOException {
		logger.debug("partyId:---" + partyId);
		logger.debug("currentNodeId:---" + currentNodeId);
		logger.debug("level:---" + level);
		HeirarchyData heirarchyData = testimonialServices.getHeirarchyDataForSP(partyId,currentNodeId,level,rootId);
		BaseResponse<HeirarchyData> br=new BaseResponse<>();
		br.setResponseObject(heirarchyData);
		response=FiinfraResponseBuilder.getSuccessResponse(br, null);
		return response;
	}
	

	@POST
	@Produces(MediaType.APPLICATION_JSON)
	@Consumes(MediaType.APPLICATION_JSON)
	@Path("/getHeirarchyUserName/{user}/{token}")
	public Response getHeirarchyUserName(@PathParam("token") String token,
		Partner partner)
	{
	
		 //System.out.println("Naval Makwana");
		  //BaseResponse<TestimonialData> br = new BaseResponse<>();
		   response=testimonialServices.getHeirarchyUserName(partner);
		   //System.out.println("NAval  makwana 2"+response);
		   return response;
			
	}
	
	
	//
	@POST
	@Consumes(MediaType.APPLICATION_JSON)
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/addHeirarchyUser/{user}/{token}")
	public Response  addHeirarchyUser(Partner partner, 
			@PathParam("token") String token,
			@PathParam("user") String name			
			) throws IOException {
		
		BaseResponse<Integer> br = new BaseResponse<>();
		   response=testimonialServices.addHeirarchyUser(partner);
			return response;
		

	}
	
	@POST
	@Consumes(MediaType.APPLICATION_JSON)
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/getUserSession/{user}/{token}")
	public Response  getUserSession(Partner partner, 
			@PathParam("token") String token,
			@PathParam("user") String name			
			) throws IOException {
		
		BaseResponse<Integer> br = new BaseResponse<>();
		   response=testimonialServices.getUserSession(partner);
			return response;
		

	}
	
	
	
	
	
	@GET
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/getHeirarchyData/{user}/{token}")
	public Response getHeirarchyData(@QueryParam("partyId") int partyId,@QueryParam("buId") int buId,
			@PathParam("token") String token, @PathParam("user") String name)
			throws JsonGenerationException, JsonMappingException, IOException {
		logger.debug("partyId:---" + partyId);
		HeirarchyData heirarchyData = testimonialServices.getHeirarchyData(partyId,buId);
		BaseResponse<HeirarchyData> br=new BaseResponse<>();
		br.setResponseObject(heirarchyData);
		response=FiinfraResponseBuilder.getSuccessResponse(br, null);
		return response;
	}
	
	@GET
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/getHeirarchyDataForVP/{user}/{token}")
	public Response getHeirarchyDataForVP(@QueryParam("partyId") int partyId,@QueryParam("currentNodeId") int currentNodeId,@QueryParam("level") int level,
			@PathParam("token") String token, @PathParam("user") String name)
			throws JsonGenerationException, JsonMappingException, IOException {
		logger.debug("partyId:---" + partyId);
		logger.debug("currentNodeId:---" + currentNodeId);
		logger.debug("level:---" + level);
		HeirarchyData heirarchyData = testimonialServices.getHeirarchyDataForVP(partyId,currentNodeId,level);
		BaseResponse<HeirarchyData> br=new BaseResponse<>();
		br.setResponseObject(heirarchyData);
		response=FiinfraResponseBuilder.getSuccessResponse(br, null);
		return response;
	}
	
	@GET
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/getUserDetails/{user}/{token}")
	public Response getPartnerDetails(@QueryParam("buId") int buId,@QueryParam("partyId") int partyId,
			@PathParam("token") String token, @PathParam("user") String name)
			throws JsonGenerationException, JsonMappingException, IOException {
		logger.debug("partyId:---" + partyId);
		Partner partner = testimonialServices.getUserDetails(partyId,buId);
		BaseResponse<Partner> br=new BaseResponse<>();
		br.setResponseObject(partner);
		response=FiinfraResponseBuilder.getSuccessResponse(br, null);
		//System.out.println("Response======"+response);
		return response;
	}

	@GET
	@Path(value="/updateCurrentNodeIdForPartyId/{username}/{token}")
	@Produces(MediaType.APPLICATION_JSON)
	public Response updateCurrentNodeIdForPartyId( @PathParam("username") String userName,@PathParam("token") String token,@QueryParam("partyId") int partyId, @QueryParam("nodeId") int nodeId,@QueryParam("buPartyID") int buPartyID)
	{
		BaseResponse<Boolean> baseResponse = new BaseResponse<Boolean>();	
		baseResponse.setResponseObject(testimonialServices.updateCurrentNodeIdForPartyId(partyId,nodeId,buPartyID));
		Response response = FiinfraResponseBuilder.getSuccessResponse(baseResponse, null);
		return response;
	}
	
	@POST
	@Consumes(MediaType.APPLICATION_JSON)
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/deletePartnerLocationData/{user}/{token}")
	public Response deletePartnerLocationData(LocationData locationData,
			@PathParam("token") String token, @PathParam("user") String name)
			throws Exception {
		List<Integer> recordCount = testimonialServices.deletePartnerLocationData(locationData);
		BaseResponse<Integer> br=new BaseResponse<>();
		br.setResponseListObject(recordCount);
		response=FiinfraResponseBuilder.getSuccessResponse(br, null);
		return response;
	}
	
	
	@GET
	@Consumes(MediaType.APPLICATION_JSON)
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/deleteUser/{user}/{token}")
	public Response  deleteUser(@QueryParam("buId") int buId,@QueryParam("partyId") int partyId, 
			@PathParam("token") String token,
			@PathParam("user") String name			
			) throws IOException {
		//System.out.println("In APP Calling deletePartner");
		BaseResponse<Integer> br = new BaseResponse<>();
		logger.info(br);
		br.setResponseObject(testimonialServices.deleteUser(partyId,buId));
		//Response  response=partnerService.addPartner(partner);
		Response response = FiinfraResponseBuilder.getSuccessResponse(br, null);
		//System.out.println("Delete Partner="+response);
		return response;	
	}
	

}
