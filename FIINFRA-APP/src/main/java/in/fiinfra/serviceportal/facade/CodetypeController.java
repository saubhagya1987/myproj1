package in.fiinfra.serviceportal.facade;

import java.io.IOException;

import in.fiinfra.common.service.vo.CodeTypeData;
import in.fiinfra.common.service.vo.CodeValueData;
import in.fiinfra.common.util.FiinfraConstants;
import in.fiinfra.serviceportal.service.CodeTypeServices;

import javax.ws.rs.Consumes;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;
import javax.ws.rs.QueryParam;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.servlet.mvc.multiaction.MultiActionController;

@Controller
@Path("/codetype")
public class CodetypeController extends MultiActionController
{
		Response response;

		@Autowired
		CodeTypeServices codeTypeServices;

		public CodeTypeServices getCodeTypeServices() 
		{
			return codeTypeServices;
		}

		public void setCodeTypeServices(CodeTypeServices codeTypeServices)
		{
			this.codeTypeServices = codeTypeServices;
		}

		@POST
		@Produces(MediaType.APPLICATION_JSON)
		@Consumes(MediaType.APPLICATION_JSON)
		@Path("/codetypeList/{user}/{token}")
		public Response codetypeList(@PathParam("token") String token,
									 @PathParam("user") String name,
									 @RequestBody CodeTypeData codetypedata) throws IOException 
		{
			//BaseResponse<CodeTypeData> br = new BaseResponse<>();
			response = codeTypeServices.getCodetypeList(codetypedata);
			return response;
		}
		
		
		@POST
		@Produces(MediaType.APPLICATION_JSON)
		@Consumes(MediaType.APPLICATION_JSON)
		@Path("/maxCodeTypeID/{user}/{token}")
		public Response getMaxCodeTypeID(@PathParam("token") String token,
				   						 @PathParam("user") String name,
				   						 @RequestBody CodeTypeData codetypedata) throws IOException 
		{
			//BaseResponse<CodeTypeData> br = new BaseResponse<>();
			response = codeTypeServices.getMaxCodeTypeID(codetypedata);
			return response;
		}
		
		
		
		@POST
		@Produces(MediaType.APPLICATION_JSON)
		@Consumes(MediaType.APPLICATION_JSON)
		@Path("/addNewCodeType/{username}/{token}")
		public Response addNewCodeType(@PathParam("username") String userName,
									   @PathParam("token") String token, 
									   @QueryParam("buId") int buId,
									   @RequestBody CodeTypeData codetypedata) throws IOException 
		{
			Response response = null;
			if (buId <= 0) 
			{
				buId = FiinfraConstants.AXISMFBUID;
			}

			//BaseResponse<Integer> baseResponse = new BaseResponse<Integer>();
			response = codeTypeServices.addNewCodetype(codetypedata);
			return response;
		}
		
		
		@POST
		@Consumes(MediaType.APPLICATION_JSON)
		@Produces(MediaType.APPLICATION_JSON)
		@Path("/deleteCodetype/{user}/{token}")
		public Response deleteCodetype(@PathParam("token") String token,
				   					   @PathParam("user") String name,
				                       @RequestBody CodeTypeData codetypedata) throws IOException 
		{
			//BaseResponse<Integer> br = new BaseResponse<>(); 
			response = codeTypeServices.deleteCodetype(codetypedata);
			return response;
		}
		
		@POST
		@Consumes(MediaType.APPLICATION_JSON)
		@Produces(MediaType.APPLICATION_JSON)
		@Path("/updateCodeType/{username}/{token}")
		public Response updateCodeType(@PathParam("username") String userName,
									   @PathParam("token") String token, 
									   @QueryParam("buId") int buId,
									   @RequestBody CodeTypeData codetypedata) throws IOException
		{
			Response response = null;
			if (buId <= 0) 
			{
				buId = FiinfraConstants.AXISMFBUID;
			}

			//BaseResponse<Integer> baseResponse = new BaseResponse<Integer>();
			response = codeTypeServices.updateCodeType(codetypedata);
			return response;
		}
		
		@POST
		@Produces(MediaType.APPLICATION_JSON)
		@Consumes(MediaType.APPLICATION_JSON)
		@Path("/viewValesfunction/{user}/{token}")
		public Response viewValesfunction(@PathParam("token") String token,
				   						  @PathParam("user") String name,
				   						  @RequestBody CodeTypeData codetypedata) throws IOException 
		{
			//BaseResponse<CodeValueData> br = new BaseResponse<>(); 
			response = codeTypeServices.viewValesfunction(codetypedata);
			return response;
		}
		
	
		
		@POST
	    @Consumes(MediaType.APPLICATION_JSON)
		@Produces(MediaType.APPLICATION_JSON)
		@Path("/reorderedCodevalues/{user}/{token}")
		public Response ReorderedCodevalues(@PathParam("token") String token,
				   							@PathParam("user") String name,
				   							@RequestBody CodeTypeData codetypedata) throws IOException 
		{
			//BaseResponse<Integer> br = new BaseResponse<>(); 
			response = codeTypeServices.saveReorderedCodeValues(codetypedata);
			return response;
		}
		
		@POST
		@Consumes(MediaType.APPLICATION_JSON)
		@Produces(MediaType.APPLICATION_JSON)
		@Path("/savedefaultvalueforcodevalues/{username}/{token}")
		public Response saveDefaultValueforCodeValues(@PathParam("username") String userName,
									   @PathParam("token") String token, 
									   @QueryParam("buId") int buId,
									   @RequestBody CodeValueData codevaluedata) throws IOException
		{
			Response response = null;
			if (buId <= 0) 
			{
				buId = FiinfraConstants.AXISMFBUID;
			}
			response = codeTypeServices.saveDefaultValueforCodeValues(codevaluedata);
			return response;
		}

		//CODEVALUE
		
		@POST
		@Consumes(MediaType.APPLICATION_JSON)
		@Produces(MediaType.APPLICATION_JSON)
		@Path("/codeValueList/{user}/{token}")
		public Response codeValueList(@PathParam("username") String userName,
				   					  @PathParam("token") String token, 
				                      @QueryParam("buId") int buId,
				                      @RequestBody CodeValueData codevaluedata) throws IOException 
		{
			//BaseResponse<CodeValueData> br = new BaseResponse<>();
			response = codeTypeServices.getAllCodeValueDetails(codevaluedata);
			return response;
		}
		
		@POST
		@Consumes(MediaType.APPLICATION_JSON)
		@Produces(MediaType.APPLICATION_JSON)
		@Path("/deleteCodeValue/{user}/{token}")
		public Response deleteCodeValue(@PathParam("token") String token,
				   						@PathParam("user") String name,
				   						@RequestBody CodeTypeData codetypedata) throws IOException 
		{
			//BaseResponse<Integer> br = new BaseResponse<>(); 
			response = codeTypeServices.deleteCodeValues(codetypedata);
			return response;
		}
		
		@POST
		@Consumes(MediaType.APPLICATION_JSON)
		@Produces(MediaType.APPLICATION_JSON)
		@Path("/getCodeTypeList/{user}/{token}")
	 	public Response getCodeTypeList() throws IOException
		{
	 		//BaseResponse<CodeTypeData> br = new BaseResponse<>();
			response =codeTypeServices.getCodeTypeListforCombobox();
	 		return response;	 	
		} 
		
		@POST
		@Consumes(MediaType.APPLICATION_JSON)
		@Produces(MediaType.APPLICATION_JSON)
		@Path("/getParentCodeValues/{user}/{token}")
		public Response getParentCodeValues(@PathParam("token") String token,
										    @PathParam("user") String name,
										    @RequestBody CodeValueData codevaluedata) throws IOException 
			{
				//BaseResponse<CodeValueData> br = new BaseResponse<>();
			    response = codeTypeServices.getParentCodeValues(codevaluedata);
				return response;
	
			}
		
		@POST
		@Produces(MediaType.APPLICATION_JSON)
		@Consumes(MediaType.APPLICATION_JSON)
		@Path("/getMaxCodeValueId/{user}/{token}") 
		public Response getMaxCodeValueId(@PathParam("token") String token,
			    						  @PathParam("user") String name,
			    						  @RequestBody CodeValueData codevaluedata ) throws IOException
		{
			//BaseResponse<Integer> br = new BaseResponse<>();
			response = codeTypeServices.getMaxCodeValueId(codevaluedata);	
			return response;
		}
		
		
		@POST
		@Produces(MediaType.APPLICATION_JSON)
		@Consumes(MediaType.APPLICATION_JSON)
		@Path("/getMaxdespseqno/{user}/{token}")
		public Response getMaxDisplaySeqNo(@PathParam("token") String token,
			    						   @PathParam("user") String name,
			    						   @RequestBody CodeValueData codevaluedata) throws IOException
		{
			//BaseResponse<Integer> br = new BaseResponse<>();
			response = codeTypeServices.getMaxDisplaySeqNo(codevaluedata);	
			return response;
		}
		
		
		@POST
		@Consumes(MediaType.APPLICATION_JSON)
		@Produces(MediaType.APPLICATION_JSON)
		@Path("/addNewCodeValue/{username}/{token}")
		public Response addNewCodeValue(@PathParam("username") String userName,
									    @PathParam("token") String token, 
									    @QueryParam("buId") int buId,
									    @RequestBody CodeValueData codevaluedata) throws IOException
		{
			Response response = null;
			if (buId <= 0) 
			{
				buId = FiinfraConstants.AXISMFBUID;
			}

			//BaseResponse<Integer> baseResponse = new BaseResponse<Integer>();
			response = codeTypeServices.addNewCodeValue(codevaluedata);
			return response;
		}
		
		@POST
		@Consumes(MediaType.APPLICATION_JSON)
		@Produces(MediaType.APPLICATION_JSON)
		@Path("/getCodeValueDetalisToUpdate/{user}/{token}")
		public Response getCodeValueDetalisToUpdate(@PathParam("token") String token,
										    		@PathParam("user") String name,
										    		@RequestBody CodeValueData codevaluedata) throws IOException 
			{
				//BaseResponse<CodeValueData> br = new BaseResponse<>();
			    response = codeTypeServices.getCodeValueDetalisToUpdate(codevaluedata);
				return response;
	
			}
		
		@POST
		@Consumes(MediaType.APPLICATION_JSON)
		@Produces(MediaType.APPLICATION_JSON)
		@Path("/updateCodeValue/{username}/{token}")
		public Response updateCodeValue(@PathParam("username") String userName,
									    @PathParam("token") String token, 
									    @QueryParam("buId") int buId,
									    @RequestBody CodeValueData codevaluedata) throws IOException 
		{
			Response response = null;
			if (buId <= 0) 
			{
				buId = FiinfraConstants.AXISMFBUID;
			}

			//BaseResponse<Integer> baseResponse = new BaseResponse<Integer>();
			response = codeTypeServices.updateCodeValue(codevaluedata);
			return response;
		}
		
		
}

