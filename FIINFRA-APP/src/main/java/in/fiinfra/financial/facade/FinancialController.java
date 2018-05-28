package in.fiinfra.financial.facade;

import in.fiinfra.common.util.BaseResponse;
import in.fiinfra.common.util.FiinfraConstants;
import in.fiinfra.common.util.FiinfraResponseBuilder;
import in.fiinfra.cp.Assumption;
import in.fiinfra.cp.ExpenseData;
import in.fiinfra.cp.FinancialData;
import in.fiinfra.cp.IncomeData;
import in.fiinfra.cp.LoanData;
import in.fiinfra.financial.service.FinancialService;

import java.util.List;

import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;
import javax.ws.rs.QueryParam;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
@Path("/financial")
public class FinancialController {
	@Autowired
	FinancialService financialService;

	@POST
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/addUpdateIncome/{user}/{token}")
	public Response saveIncome(IncomeData incomeData,
			@PathParam("token") String token, @QueryParam("buId") int buId) {

		Response response = null;
		BaseResponse<Integer> baseResponse = new BaseResponse<Integer>();
		incomeData = financialService.insertUpdateIncome(buId, incomeData);
		if (incomeData.getPartyIncomeId() != null
				&& incomeData.getPartyIncomeId() > 0) {
			baseResponse.setResponseObject(incomeData.getPartyIncomeId());
			response = FiinfraResponseBuilder.getSuccessResponse(baseResponse,
					null);
		} else {
			response = FiinfraResponseBuilder
					.getErrorResponse("Unable to Save Income");
		}
		return response;
	}
	
	@POST
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/addUpdateIncomeAndUpdateDC/{user}/{token}")
	public Response saveIncomeAndUpdateDC(IncomeData incomeData,
			@PathParam("token") String token, @QueryParam("buId") int buId) {

		Response response = null;
		BaseResponse<Integer> baseResponse = new BaseResponse<Integer>();
		incomeData = financialService.insertUpdateIncomeAndUpdateDC(buId, incomeData);
		if (incomeData.getPartyIncomeId() != null
				&& incomeData.getPartyIncomeId() > 0) {
			baseResponse.setResponseObject(incomeData.getPartyIncomeId());
			response = FiinfraResponseBuilder.getSuccessResponse(baseResponse,
					null);
		} else {
			response = FiinfraResponseBuilder
					.getErrorResponse("Unable to Save Income");
		}
		return response;
	}

	

	@GET
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/getListOfIncome/{user}/{token}")
	public Response getListOfIncome(@PathParam("token") String token,
			@QueryParam("partyId") Integer partyId,
			@QueryParam("buId") Integer buId) {
		Response response = null;
		BaseResponse<IncomeData> baseResponse = new BaseResponse<IncomeData>();
		baseResponse.setResponseListObject(financialService
				.getListOfIncomeData(buId, partyId));
		response = FiinfraResponseBuilder
				.getSuccessResponse(baseResponse, null);

		return response;
	}
	@GET
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/getIncomeForId/{user}/{token}")
	public Response getIncomeForId(@PathParam("token") String token,
			@QueryParam("partyId") Integer partyId,@QueryParam("incomeId") Integer incomeId
			,@QueryParam("buId") Integer buId) {
		Response response = null;
		IncomeData incomeData = financialService.getIncomeForId(incomeId,partyId,buId);
		BaseResponse<IncomeData> br=new BaseResponse<IncomeData>();
		br.setResponseObject(incomeData);
		//System.out.println("queryData:--------"+br.getResponseObject());
		response=FiinfraResponseBuilder.getSuccessResponse(br, null);
		return response;

	}
	@GET
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/getExpenseForId/{user}/{token}")
	public Response getExpenseForId(@PathParam("token") String token,
			@QueryParam("partyId") Integer partyId,@QueryParam("expenseId") Integer expenseId
			,@QueryParam("buId") Integer buId) {
		Response response = null;
		ExpenseData expenseData = financialService.getExpenseForId(expenseId,partyId,buId);
		BaseResponse<ExpenseData> br=new BaseResponse<ExpenseData>();
		br.setResponseObject(expenseData);
		//System.out.println("queryData:--------"+br.getResponseObject());
		response=FiinfraResponseBuilder.getSuccessResponse(br, null);
		return response;

	}


	@POST
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/addUpdateExpense/{user}/{token}")
	public Response saveExpense(ExpenseData expenseData,
			@PathParam("token") String token, @QueryParam("buId") int buId) {

		Response response = null;

		BaseResponse<Integer> baseResponse = new BaseResponse<Integer>();
		expenseData = financialService.insertUpdateExpense(buId, expenseData);
		if (expenseData.getPartyExpenseID() != null
				&& expenseData.getPartyExpenseID() > 0) {
			baseResponse.setResponseObject(expenseData.getPartyExpenseID());
			response = FiinfraResponseBuilder.getSuccessResponse(baseResponse,
					null);
		} else {
			response = FiinfraResponseBuilder
					.getErrorResponse("Unable to Save Expense");
		}
		return response;
	}

	@POST
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/addUpdateExpenseAndUpdateDC/{user}/{token}")
	public Response saveExpenseAndUpdateDC(ExpenseData expenseData,
			@PathParam("token") String token, @QueryParam("buId") int buId) {

		Response response = null;

		BaseResponse<Integer> baseResponse = new BaseResponse<Integer>();
		expenseData = financialService.insertUpdateExpenseAndUpdateDC(buId, expenseData);
		if (expenseData.getPartyExpenseID() != null
				&& expenseData.getPartyExpenseID() > 0) {
			baseResponse.setResponseObject(expenseData.getPartyExpenseID());
			response = FiinfraResponseBuilder.getSuccessResponse(baseResponse,
					null);
		} else {
			response = FiinfraResponseBuilder
					.getErrorResponse("Unable to Save Expense");
		}
		return response;
	}

	@GET
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/getListOfExpense/{user}/{token}")
	public Response getListOfExpense(@PathParam("token") String token,
			@QueryParam("partyId") int partyId, @QueryParam("buId") int buId) {
		Response response = null;
		BaseResponse<ExpenseData> baseResponse = new BaseResponse<ExpenseData>();
		baseResponse.setResponseListObject(financialService
				.getListOfExpenseData(buId, partyId));
		response = FiinfraResponseBuilder
				.getSuccessResponse(baseResponse, null);

		return response;
	}
	
	@GET
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/income/delete/{user}/{token}")
	public Response deleteIncome(@PathParam("token") String token,  @QueryParam("partyId") int partyId,
			@QueryParam("buId") int buId,@QueryParam("incomeId") int incomeId) 
	{
		Response response = null;
		String result=financialService.deleteIncome(buId, partyId, incomeId);
		BaseResponse<String> br = new BaseResponse<String>();
		if(result.equalsIgnoreCase(FiinfraConstants.success)){
			br.setStatus(FiinfraConstants.success);
			response=FiinfraResponseBuilder.getSuccessResponse(br, null);
		}else if(result.equalsIgnoreCase(FiinfraConstants.EMPTY_RESULT_SET)){
			br.setStatus(FiinfraConstants.EMPTY_RESULT_SET);
			response=FiinfraResponseBuilder.getEmptyResultResponse("No Matching Records Found");
		}
		//logger.debug("result:---"+result);
		return response;

		
	}
	
	@GET
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/income/deleteAndUpdateDC/{user}/{token}")
	public Response deleteIncomeAndUpdateDC(@PathParam("token") String token,  @QueryParam("partyId") int partyId,
			@QueryParam("buId") int buId,@QueryParam("incomeId") int incomeId) 
	{
		Response response = null;
		String result=financialService.deleteIncomeAndUpdateDC(buId, partyId, incomeId);
		BaseResponse<String> br = new BaseResponse<String>();
		if(result.equalsIgnoreCase(FiinfraConstants.success)){
			br.setStatus(FiinfraConstants.success);
			response=FiinfraResponseBuilder.getSuccessResponse(br, null);
		}else if(result.equalsIgnoreCase(FiinfraConstants.EMPTY_RESULT_SET)){
			br.setStatus(FiinfraConstants.EMPTY_RESULT_SET);
			response=FiinfraResponseBuilder.getEmptyResultResponse("No Matching Records Found");
		}
		//logger.debug("result:---"+result);
		return response;

		
	}

	@GET
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/expense/deleteAndUpdateDC/{user}/{token}")
	public Response deleteExpenseAndUpdateDC(@PathParam("token") String token,  @QueryParam("partyId") int partyId,
			@QueryParam("buId") int buId,@QueryParam("expenseId") int expenseId) 
	{
		
		Response response = null;
		String result=financialService.deleteExpenseAndUpdateDC(buId, partyId, expenseId);
		BaseResponse<String> br = new BaseResponse<String>();
		if(result.equalsIgnoreCase(FiinfraConstants.success)){
			br.setStatus(FiinfraConstants.success);
			response=FiinfraResponseBuilder.getSuccessResponse(br, null);
		}else if(result.equalsIgnoreCase(FiinfraConstants.EMPTY_RESULT_SET)){
			br.setStatus(FiinfraConstants.EMPTY_RESULT_SET);
			response=FiinfraResponseBuilder.getEmptyResultResponse("No Matching Records Found");
		}
		//logger.debug("result:---"+result);
		return response;
	}

	@GET
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/expense/delete/{user}/{token}")
	public Response deleteExpense(@PathParam("token") String token,  @QueryParam("partyId") int partyId,
			@QueryParam("buId") int buId,@QueryParam("expenseId") int expenseId) 
	{
		
		Response response = null;
		String result=financialService.deleteExpense(buId, partyId, expenseId);
		BaseResponse<String> br = new BaseResponse<String>();
		if(result.equalsIgnoreCase(FiinfraConstants.success)){
			br.setStatus(FiinfraConstants.success);
			response=FiinfraResponseBuilder.getSuccessResponse(br, null);
		}else if(result.equalsIgnoreCase(FiinfraConstants.EMPTY_RESULT_SET)){
			br.setStatus(FiinfraConstants.EMPTY_RESULT_SET);
			response=FiinfraResponseBuilder.getEmptyResultResponse("No Matching Records Found");
		}
		//logger.debug("result:---"+result);
		return response;
	}

	
	@GET
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/getAssumption/{user}/{token}")
	public Response getAssumption(@PathParam("token") String token,  @QueryParam("partyId") int partyId,
			@QueryParam("buId") int buId,@QueryParam("assumptionId") int assumptionId) 
	{
		
		Response response = null;
		Assumption result=financialService.getAssumption(buId, partyId,assumptionId);
		BaseResponse<Assumption> br = new BaseResponse<Assumption>();
		br.setResponseObject(result);
		response=FiinfraResponseBuilder.getSuccessResponse(br, null);
		return response;
	}
	
	@GET
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/getMyFinancials/{user}/{token}")
	public Response getMyFinancials(@PathParam("token") String token,  @QueryParam("partyId") int partyId,
			@QueryParam("buId") int buId) 
	{
		
		Response response = null;
		List<FinancialData> result=financialService.getMyFinancials(buId, partyId);
		BaseResponse<FinancialData> br = new BaseResponse<FinancialData>();
		br.setResponseListObject(result);
		response=FiinfraResponseBuilder.getSuccessResponse(br, null);
		return response;
	}
	
	

}
