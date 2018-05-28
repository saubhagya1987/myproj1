package in.fiinfra.serviceportal.facade;

import in.fiinfra.common.service.vo.DepartmentListData;
import in.fiinfra.common.util.FiinfraConstants;  
import in.fiinfra.common.util.BaseResponse;
import in.fiinfra.serviceportal.service.DepartmentListService;
import java.io.IOException;  

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
import org.springframework.web.servlet.mvc.multiaction.MultiActionController;


@Controller
@Path("/department")
public class DepartmentListController extends MultiActionController {

	Response response;
	private static final Logger logger = Logger.getLogger(DepartmentListController.class);
	
	@Autowired
	DepartmentListService departmentListService;
	    
	public DepartmentListService getDepartmentListService() {
		return departmentListService;
	}
	public void setDepartmentListService(DepartmentListService departmentListService) {
		this.departmentListService = departmentListService;
	} 

	private ObjectMapper objectMapper;  
	 
	public ObjectMapper getObjectMapper() {    
		return objectMapper;  
	}
	public void setObjectMapper(ObjectMapper objectMapper) {
		this.objectMapper = objectMapper;
	}     
	
	@GET
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/getDepartmentlist/{user}/{token}")
	 public Response getLists(@QueryParam("sessionbuId") int sessionbuId, 
				@PathParam("token") String token,
				@PathParam("user") String name	)
	   {
		
		   BaseResponse<DepartmentListData> br = new BaseResponse<>();
		   response = departmentListService.getAllDepartmentList(sessionbuId);  
		   return response;
	   }
	 
	@GET
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/deleteDepartment/{user}/{token}")
	public Response deleteDepartment(	@QueryParam("Lists") String deletelist, 
			@QueryParam("userID") int userID, 
			@PathParam("token") String token,
			@PathParam("user") String name	) throws IOException 
			{
 
			BaseResponse<Integer> br = new BaseResponse<>();
			response=departmentListService.deleteDepartment(deletelist,userID);
			return response;
			 
			}  
	
	@GET
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/cascadeDeleteDep/{user}/{token}") 
	public Response cascadeDeleteDep(	@QueryParam("Lists") String deletelist, 
			@PathParam("token") String token,
			@PathParam("user") String name	) throws IOException 
			{
 
			BaseResponse<Integer> br = new BaseResponse<>();
			response=departmentListService.cascadeDeleteDep(deletelist);  
			return response;
			 
			}  
	
	@GET
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/getBizunitSection/{user}/{token}")
	 public Response getBizunitSection() throws IOException 
		{
		BaseResponse<DepartmentListData> br = new BaseResponse<>();
		   response=departmentListService.showBizUnitList();
			return response; 
		} 
	
	@GET
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/getDepartmentSection/{user}/{token}")
	 public Response getDepartmentSection() throws IOException 
		{
		BaseResponse<DepartmentListData> br = new BaseResponse<>();
		   response=departmentListService.showDepartmentTypelist();
			return response;  
} 
	
	@POST
	@Consumes(MediaType.APPLICATION_JSON)
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/addDepartment/{user}/{token}") 
	public Response  addDepartment(DepartmentListData departmentList, 
			@PathParam("token") String token,
			@PathParam("user") String name			
			) throws IOException {
		
		BaseResponse<Integer> br = new BaseResponse<>();
		response=departmentListService.addDepartmentQuery(departmentList.getBizUnit(), departmentList.getDepartmentname(), departmentList.getDepartmentTypeID(), FiinfraConstants.ALLOCATION_TYPE_ID, departmentList.getDepartment_SortName(), departmentList.getCreateby());
	    return response;
	
	}
	 
	@POST
	@Consumes(MediaType.APPLICATION_JSON)
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/departmentUpdate/{user}/{token}")
	public Response  departmentUpdate( 
			DepartmentListData departmentList,
			@PathParam("token") String token,
			@PathParam("user") String name	
			) throws IOException ,NumberFormatException
	{
			BaseResponse<Integer> br = new BaseResponse<>();
		response=departmentListService.updateDepartment(departmentList.getDepartmentId(),Integer.parseInt(departmentList.getBizUnit()),departmentList.getDepartment_Type(),departmentList.getDepartmentTypeID(),FiinfraConstants.ALLOCATION_TYPE_ID,departmentList.getDepartment_SortName(),departmentList.getCreateby());
		return response;

 
		} 


}
