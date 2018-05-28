package in.fiinfra.serviceportal.facade;

import in.fiinfra.common.service.vo.BizUnit;
import in.fiinfra.common.service.vo.FaqList;
import in.fiinfra.common.service.vo.NotifyEvent;
import in.fiinfra.common.util.BaseResponse;
import in.fiinfra.common.util.FiinfraResponseBuilder;
import in.fiinfra.serviceportal.service.BizUnitService;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.print.attribute.standard.Media;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import javax.ws.rs.Consumes;
import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;
import javax.ws.rs.QueryParam;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;

import org.apache.commons.io.FileUtils;
import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.multiaction.MultiActionController;

@Controller
@Path("/bizunit")
public class BizUnitController extends MultiActionController
{
	Response response;
	  @Autowired
	
	  BizUnitService bizunitServices;
		private ObjectMapper objectMapper;

	public ObjectMapper getObjectMapper() {
			return objectMapper;
		}

		public void setObjectMapper(ObjectMapper objectMapper) {
			this.objectMapper = objectMapper;
		}

	public BizUnitService getBizunitServices() {
		return bizunitServices;
	}

	public void setBizunitServices(BizUnitService bizunitServices) {
		this.bizunitServices = bizunitServices;
	}
	
	  
	
	/*@GET
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/listbizunit/{user}/{token}")
	 public Response listbizunit(@PathParam("token") String token,
				@PathParam("user") String name,
				@QueryParam("searchText") String searchText)
	   {
	//	logger.info("In list bizunit");
					   BaseResponse<BizUnit> br = new BaseResponse<>();
					   response=bizunitServices.getBizUnitList(searchText);
						return response;
	   }
*/
	
	
	@POST 
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/listbizunit/{user}/{token}") 
	public Response listbizunit( 
			@PathParam("token") String token,
			@PathParam("user") String name,  @RequestBody BizUnit bizunit	)
   {
		BaseResponse<BizUnit> br = new BaseResponse<BizUnit>(); 
		response =bizunitServices.getBizUnitList(bizunit);   
 		return response;
	}
	
	@GET
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/viewUnitProfile/{user}/{token}")
	 public Response viewUnitProfile(@QueryParam("partyId") int partyId,
			 @PathParam("token") String token,
				@PathParam("user") String name	)
	   {
		
			   BaseResponse<BizUnit> br = new BaseResponse<>();
			   response=bizunitServices.getBizUnitDeatil(partyId);
				return response;
			
			
	   }
	
	
	
	
	
	
	@GET
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/getUniqueBizunit/{user}/{token}")
	 public Response getUniqueBizunit(@QueryParam("bizUnitName") String bizUnitName,
			 @PathParam("token") String token,
				@PathParam("user") String name	)
	   {
		
			   BaseResponse<BizUnit> br = new BaseResponse<>();
			   response=bizunitServices.getUniqueUser(bizUnitName);
				return response;
			
			
	   }
	
	
	
	
	@GET
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/getWhitePageDetail/{user}/{token}")
	 public Response getWhitePageDetail(@QueryParam("partyId") int partyId,
			 @PathParam("token") String token,
				@PathParam("user") String name	)
	   {
		
			   
			   response=bizunitServices.getWhiteLableDetail(partyId);
			  // System.out.println(response+"Hi Baji");
				return response;
			
			
	   }
	
	
	
	@POST
	@Consumes(MediaType.APPLICATION_JSON)
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/copyBu/{user}/{token}")
	 public Response copyBu(BizUnit bizUnit,
			@PathParam("token") String token,
			@PathParam("user") String name) throws IOException 
	{
		
		BaseResponse<Integer> br = new BaseResponse<>();
		   response=bizunitServices.copyBu(bizUnit);
			return response;
		
} 
	
	
	
	
	
	
	@POST
	@Consumes(MediaType.APPLICATION_JSON)
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/addEmailSign/{user}/{token}")
	 public Response addEmailSign(BizUnit bizUnit,
			@PathParam("token") String token,
			@PathParam("user") String name) throws IOException 
	{
		
		BaseResponse<Integer> br = new BaseResponse<>();
		   response=bizunitServices.addEmailSignBiz( bizUnit.getPartyId(),bizUnit.getEmailsign(),bizUnit.getCreatedBy());
			return response;
		
} 	
	
	
	
	

	@POST
	@Consumes(MediaType.APPLICATION_JSON)
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/addSms/{user}/{token}")
	 public Response  addSms(BizUnit bizUnit,
				@PathParam("token") String token,
				@PathParam("user") String name
			 ) throws IOException 
	{
	//	logger.info("baji");
		BaseResponse<Integer> br = new BaseResponse<>();
		   response=bizunitServices.addSms(bizUnit);
			return response;
	}
	
	
	@POST
	@Consumes(MediaType.APPLICATION_JSON)
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/addDndTemplate/{user}/{token}")
	 public Response  addDndTemplate(BizUnit bizUnit,
				@PathParam("token") String token,
				@PathParam("user") String name
			 ) throws IOException 
	{
	//	logger.info("baji");
		BaseResponse<Integer> br = new BaseResponse<>();
		   response=bizunitServices.addDndTemplate(bizUnit.getPartyId(), bizUnit.getTemplate(),bizUnit.getCreatedBy());
			return response;
	}
	@POST
	@Consumes(MediaType.APPLICATION_JSON)
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/addDisclaimer/{user}/{token}")
	 public Response  addDisclaimer(BizUnit bizUnit,
				@PathParam("token") String token,
				@PathParam("user") String name) throws IOException 
	{
	
		

BaseResponse<Integer> br = new BaseResponse<>();
   response=bizunitServices.addDisclaimer(bizUnit.getPartyId(),bizUnit.getDisclaimer(),bizUnit.getCreatedBy());
	return response;
}

	
	
	
	@POST
	@Consumes(MediaType.APPLICATION_JSON)
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/addbizunit/{user}/{token}")
	public Response addBizUnit(BizUnit bizUnit,
			@PathParam("token") String token,
			@PathParam("user") String name	
			
			) throws IOException 
	{



BaseResponse<Integer> br = new BaseResponse<>();
   response=bizunitServices.addBizUnit(bizUnit);
	return response;
	}
	

	
	
	@POST
	@Consumes(MediaType.APPLICATION_JSON)
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/updatebizunit/{user}/{token}")
	public Response updateBizUnit(BizUnit bizUnit,
			@PathParam("token") String token,
			@PathParam("user") String name	) throws IOException 
	{

BaseResponse<Integer> br = new BaseResponse<>();
response=bizunitServices.updateBizUnit(bizUnit);   

	return response;
	 			
		  			
	}
	
	
	@POST
	@Consumes(MediaType.APPLICATION_JSON)
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/updateBizUnitGeneral/{user}/{token}")
	public Response updateBizUnitGeneral(BizUnit bizUnit,
			@PathParam("token") String token,
			@PathParam("user") String name	) throws IOException 
	{

BaseResponse<Integer> br = new BaseResponse<>();
response=bizunitServices.updateBizUnitGeneral(bizUnit);   

	return response;
	 			
		  			
	}	
	
	
	
	
	
	
	
	
	@GET
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/listbizunitDetail/{user}/{token}")
	 public Response getBizUnitDetail(@QueryParam("partyId") int partyId,
				@PathParam("token") String token,
				@PathParam("user") String name) throws IOException 
	{

			  BaseResponse<BizUnit> br = new BaseResponse<>();
			   response=bizunitServices.getBizUnitDeatil(partyId);
				return response;
		
			
	}
	
	
	
	@GET
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/deleteBizUnit/{user}/{token}")
	public Response deleteBizUnit(@QueryParam("Lists") String partyId,
			@QueryParam("createdBy")  int createdBy,
			@PathParam("token") String token,
			@PathParam("user") String name) throws IOException 
	{

		  BaseResponse<BizUnit> br = new BaseResponse<>();
		   response=bizunitServices.deleteBizUnit(partyId,createdBy);
			return response;
	}
	
	
	

	@GET
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/getValueFromParent/{user}/{token}")
	public Response getValueFromParent(	@QueryParam("parentId") int parentId,
			@PathParam("token") String token,
			@PathParam("user") String name) throws IOException 
	{

		  BaseResponse<BizUnit> br = new BaseResponse<>();
		   response=bizunitServices.getStateList(parentId);
			return response;
	} 	

	
	@POST
	@Consumes(MediaType.APPLICATION_JSON)
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/addEmail/{user}/{token}")
	public Response addEmail(BizUnit bizUnit,
			@PathParam("token") String token,
			@PathParam("user") String name) throws IOException 
	{

BaseResponse<Integer> br = new BaseResponse<>();
response=bizunitServices.addEmailBizUnit(bizUnit.getPartyId(),bizUnit.getEmailId(), bizUnit.getEmailsign(),bizUnit.getCreatedBy());
	return response;
	
	} 	
	
	  
}
