package in.fiinfra.party.facade;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.PrintStream;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.Set;

import in.fiinfra.common.diy.models.Form_Details;
import in.fiinfra.common.diy.models.Form_Field_Details;
import in.fiinfra.common.diy.models.JobRequest;
import in.fiinfra.common.diy.models.Party;
import in.fiinfra.common.diy.models.Chek_BoxDetails;
import in.fiinfra.common.diy.models.Product_Mst;
import in.fiinfra.common.util.BaseResponse;
import in.fiinfra.common.util.FiinfraResponseBuilder;
import in.fiinfra.party.dao.PartyDao;
import in.fiinfra.party.service.PartyService;

import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;
import javax.ws.rs.QueryParam;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;

import net.sourceforge.jtds.jdbc.DateTime;

import org.apache.log4j.Logger;
import org.aspectj.org.eclipse.jdt.core.dom.rewrite.ITrackedNodePosition;
import org.eclipse.core.internal.filesystem.local.Convert;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ConfigurableApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;

import com.itextpdf.text.Document;
import com.itextpdf.text.DocumentException;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.pdf.AcroFields;
import com.itextpdf.text.pdf.PdfReader;
import com.itextpdf.text.pdf.PdfStamper;
import com.itextpdf.text.pdf.PdfWriter;
import com.itextpdf.text.pdf.XfaForm;

@Component
@Path("/party")

public class PartyFacade {

	@Autowired
	PartyService partyService;
	
	private static final Logger LOGGER = Logger.getLogger(PartyFacade.class);

	
	@GET
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/Chek_BoxDetailsdd/{partyId}/{token}")
	public Response Chek_BoxDetailsdd(@PathParam("Form_id") Integer Form_id,
			@PathParam("token") String token, @QueryParam("buId") int buId) {
	

		Chek_BoxDetails Chek_BoxDetails = partyService.getChek_Box_indexff(Form_id);

		BaseResponse<Chek_BoxDetails> baseResponse = new BaseResponse<Chek_BoxDetails>();	
		baseResponse.setResponseObject(Chek_BoxDetails);
		Response response = FiinfraResponseBuilder.getSuccessResponse(baseResponse, null);
		
		return response;		
	}
	

	@GET
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/getPartyProfile/{partyId}/{token}")
	public Response getPartyProfileForPartyId(@PathParam("partyId") Integer partyId,
			@PathParam("token") String token, @QueryParam("buId") int buId) {
	

		Party party = partyService.getParty(partyId);

		BaseResponse<Party> baseResponse = new BaseResponse<Party>();	
		baseResponse.setResponseObject(party);
		Response response = FiinfraResponseBuilder.getSuccessResponse(baseResponse, null);
		
		return response;		
	}
	
	
	
	
	@GET
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/getJobRequestId/{partyId}/{token}")
	public Response getJobRequestId(@PathParam("partyId") Integer partyId,
			@PathParam("token") String token, @QueryParam("buId") int buId) {
	

		List<JobRequest> JobRequest =  partyService.getBatchJobRequest(partyId);
		
		
		BaseResponse<JobRequest> baseResponse = new BaseResponse<JobRequest>();	
		baseResponse.setResponseListObject(JobRequest);
		Response response = FiinfraResponseBuilder.getSuccessResponse(baseResponse, null);
		
		return response;		
	}
	
	
	@GET
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/getProduct_JobRequestId/{productId}/{token}")
	public Response getProduct_JobRequestId(@PathParam("productId") Integer productId,
			@PathParam("token") String token, @QueryParam("buId") int buId) {
	

		List<Product_Mst> Product_Mst =  partyService.getProduct_BatchJobReques(productId);
		
		BaseResponse<Product_Mst> baseResponse = new BaseResponse<Product_Mst>();	
		baseResponse.setResponseListObject(Product_Mst);
		Response response = FiinfraResponseBuilder.getSuccessResponse(baseResponse, null);
		
		return response;		
	}
	
	// Form_id ,String Field_Name,Integer Field_INDX
	@GET
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/Chek_BoxDetails/{Form_id}/{Field_Name}/{Field_IND}/{token}")
	public Response Chek_BoxDetails(@PathParam("Form_id") Integer Form_id,@PathParam("Field_Name") String Field_Name, @PathParam("Field_IND")  Integer Field_IND,
			@PathParam("token") String token, @QueryParam("buId") int buId) {
	

		List<Chek_BoxDetails> Chek_BoxDetails_list =  partyService.getChek_Box_index(Form_id, Field_Name, Field_IND);
		
		BaseResponse<Chek_BoxDetails> baseResponse = new BaseResponse<Chek_BoxDetails>();	
		baseResponse.setResponseListObject(Chek_BoxDetails_list);
		Response response = FiinfraResponseBuilder.getSuccessResponse(baseResponse, null);
		
		return response;		
	}
	
	

	

	@GET
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/getForm_Details/{Parm1}/{token}")
	public Response getForm_Details(@PathParam("Parm1") Integer Parm1,
			@PathParam("token") String token, @QueryParam("buId") int buId) {
	

		
		List<Form_Details> list =  partyService.getForm_Details(Parm1);
		

		 for (Form_Details Form_Details : list) {
		      System.out.print(Form_Details.getAccountClientID());
		      System.out.println(Form_Details.getFirstHolderName());
		    }
		
		
		BaseResponse<Form_Details> baseResponse = new BaseResponse<Form_Details>();	
		baseResponse.setResponseListObject(list);
		Response response = FiinfraResponseBuilder.getSuccessResponse(baseResponse, null);
		
		return response;		
	}


	@GET
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/getForm_Field_Details/{form_id}/{token}")
	public Response getForm_Field_Details(@PathParam("form_id") Integer form_id,
			@PathParam("token") String token, @QueryParam("buId") int buId) throws Exception {
	

		//fillData1("44", "44", "44");
		//sayHelloWorld("190");
		 List<JobRequest> ZZ_BatchJob_details =  partyService.getBatchJobRequest(110002);	
		    
		        for (int j = 0; j < ZZ_BatchJob_details.size(); j++) {  
		       	 	
		       	 String FPecxid=ZZ_BatchJob_details.get(j).getParam1namevalue();

		   			sayHelloWorld(FPecxid);
		   			 
				
		        }
		
		
		
		List<Form_Field_Details> Field_Details =  partyService.getForm_Field_Details(form_id);
		
		BaseResponse<Form_Field_Details> baseResponse = new BaseResponse<Form_Field_Details>();	
		baseResponse.setResponseListObject(Field_Details);
		Response response = FiinfraResponseBuilder.getSuccessResponse(baseResponse, null);
		
		return response;		
	}
	

	
	
	
	
	@GET
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/getForm/{Parm1}/{token}")
	public Response getForm(@PathParam("Parm1") Integer Parm1,
			@PathParam("token") String token, @QueryParam("buId") int buId) throws Exception {
	

		List<JobRequest> list =  partyService.getBatchJobRequest(Parm1);	
		
		
		fillData1("44", "44", "44");
		
		List<Form_Details> list2=null;
		
		List<Product_Mst> list3=null;
		for (Iterator<JobRequest> iter = list.iterator(); iter.hasNext(); ) {
			JobRequest element = iter.next();
			String a=element.getParam1namevalue();
			//System.out.println(element.getParam1namevalue());
				int FPExecutionID= Integer.parseInt(a);
			//System.out.println("FPExecutionID"+FPExecutionID);

    	 list2 =  partyService.getForm_Details(FPExecutionID);

    	   for (Form_Details Form_Details : list2) {
    		      System.out.println(Form_Details.getProductId()+"  FPExecutionID \n ");
    		      
    		      Integer b=Form_Details.getProductId();
    				
    				    		      
    		      list3 =  partyService.getProduct_BatchJobReques(b);
    		      for (Product_Mst Product_Mst : list3) {
        		      System.out.println(Product_Mst.getProductID()+"  ProductID \n ");
        		      		
    		      }
    		      
    		    }
		 
    	 
//			List<JobRequest> list2 =  partyService.getBatchJobRequest(FPExecutionID);
		
			
			
			
		}
		
	//	List<Form_Details> list2 =  partyService.getForm_Details(Parm1);
		//BaseResponse<Form_Details> baseResponse = new BaseResponse<Form_Details>();	
		//baseResponse.setResponseListObject(list2);
		
		BaseResponse<Product_Mst> baseResponse = new BaseResponse<Product_Mst>();	
		baseResponse.setResponseListObject(list3);
		Response response = FiinfraResponseBuilder.getSuccessResponse(baseResponse, null);
		
		return response;		
	}
	
	public String sayHelloWorld(String name)  
			  throws Exception {
		  
		  //new HelloWorld().createPdf("d:\\abc.pdf");
		  //new HelloWorld().readFieldnames("d:\\Eclips WorkSpace\\Axis.pdf","d:\\flds.txt");
		  fillData1("d:\\birla_caf.pdf","d:\\axis"+ name + ".pdf",name);
		  //new HelloWorld().DataTest("sss");
	        return "File Saved in d:\\axis" + name + ".pdf";
	    } 
	 
	  public void createPdf(String filename)
				throws DocumentException, IOException {
			        // step 1
			        Document document = new Document();
			        // step 2
			        PdfWriter.getInstance(document, new FileOutputStream(filename));
			        // step 3
			        document.open();
			        // step 4
			        document.add(new Paragraph("Hello World!"));
			        // step 5
			        document.close();
			    }
	  
	  public void readFieldnames(String src, String dest) throws IOException {
	        PrintStream out = new PrintStream(new FileOutputStream(dest));
	        PdfReader reader = new PdfReader(src);
	        AcroFields form = reader.getAcroFields();
	        XfaForm xfa = form.getXfa();
	        out.println(xfa.isXfaPresent() ? "XFA form" : "AcroForm");
	        Set<String> fields = form.getFields().keySet();
	        for (String key : fields) {
	            out.println(key);
	        }
	        out.flush();
	        out.close();
	        reader.close();
	    }
	 
	  
	
	
	
	public void fillData1(String src, String dest,String name) throws Exception {
   
		PdfReader reader = new PdfReader(src);
        PdfStamper stamper = new PdfStamper(reader, new FileOutputStream(dest));
        AcroFields form = stamper.getAcroFields();
     
    // String FPecxid=ZZ_BatchJob_details.get(j).getParam1namevalue();
     			int FPExecutionID =Integer.parseInt(name);
     			 
     	
        
        
		List<Form_Field_Details> form_details =  partyService.getForm_Field_Details(2);		
		List<Form_Details> formdata =  partyService.getForm_Details(FPExecutionID);
	
		
		//System.out.println(formdata.size()+ "formdata.size()");
		//System.out.println(form_details.size()+ " form_details.size()");

		
		for (int i = 0; i < form_details.size(); i++) {
	
			 String Source_Field=form_details.get(i).getSOURCE_FIELD_NAME();
			
			String Source_Field_Value=formdata.get(0).GetValue(Source_Field).toUpperCase();
			
			String From_Field_Name=form_details.get(i).getFIELD_NAME();
			String From_Field_Type=form_details.get(i).getFIELD_TYPE();
			String From_Field_Data_Type=form_details.get(i).getFIELD_DATATYPE();

			
			//System.out.println();
			
			
			
		System.out.println(formdata.get(0).GetValue(Source_Field)+" ddddddddhhhhhh ");


		if (From_Field_Type.equalsIgnoreCase("TEXT-BOX")) {
			
			//System.out.println(From_Field_Type+"Field Type");
			
			form.setField(From_Field_Name, Source_Field_Value);
			
		}
       
		
		
		
		if (From_Field_Type.equalsIgnoreCase("BOX-FILL")) {
			
               
			
				//System.out.println(From_Field_Type+"Field Type");

			if (Source_Field_Value.equalsIgnoreCase("")) {
				
				
			}else
			{
				
			
			//System.out.println(Source_Field_Value.length());
			
			try {
				if (From_Field_Data_Type.equalsIgnoreCase("Date")) {
					
					Source_Field_Value=getStrDate(Source_Field_Value);
					
					
                      for (int K = 0; K < Source_Field_Value.length(); K++) {
						
						try {	

							form.setField(From_Field_Name+ (K), Source_Field_Value.substring(K,K+1));
						} catch (Exception e) {
							// TODO Auto-generated catch block
							e.printStackTrace();
						}
					
					
					}
					
				   }
				else{
				
				for (int K = 0; K < Source_Field_Value.length(); K++) {
						
						try {	

							form.setField(From_Field_Name+ (K), Source_Field_Value.substring(K,K+1));
						} catch (Exception e) {
							// TODO Auto-generated catch block
							e.printStackTrace();
						}
					
					
					}

				}
			} catch (Exception e) {
				
				e.printStackTrace();
			}
			
			}
			
		}
		
		
	/*if (From_Field_Type.equalsIgnoreCase("CHECK-BOX")) {
				System.out.println(From_Field_Name +" QUICK_SELF_ATTESTED_PAN_ATTCHD    " + Source_Field_Value);
		From_Field_Name="OCC_HOUSEWIFE";
		int chk=Integer.parseInt(Source_Field_Value);
		   form.setField(From_Field_Name+chk , "Yes");
			 
			}
	*/
	if (From_Field_Type.equalsIgnoreCase("CHECK-BOX")) {
		
		String From_Field_Nam21=form_details.get(i).getFIELD_NAME();
		
		if(From_Field_Nam21.equalsIgnoreCase("OccupationID") ||From_Field_Nam21.equalsIgnoreCase("InvestorStatusID") || From_Field_Nam21.equalsIgnoreCase("ModeOfHoldingID")){
			
			
			System.out.println("In InvestorStatusID CHECK-BOX ");
		
		//From_Field_Nam21.equalsIgnoreCase("OccupationID") ||From_Field_Nam21.equalsIgnoreCase("InvestorStatusID") ||
		
	
		System.out.println("In CHECK-BOX From_Field_Nam21  "+ From_Field_Nam21);
		
		Integer Field_IND=formdata.get(0).getInvestorStatusID();
		
		System.out.println("In CHECK-BOX "+ Field_IND );
		
		List<Chek_BoxDetails> Chek_BoxDetails_list =  partyService.getChek_Box_index(2, From_Field_Nam21, Field_IND);

		System.out.println("In Chek_BoxDetails_list" );
		
		String From_Field_Name1=Chek_BoxDetails_list.get(0).getField_Value();
		
		
		System.out.println(From_Field_Name1 +" QUICK_SELF_ATTESTED_PAN_ATTCHD    " + Source_Field_Value);
		
		
   
              int chk=Integer.parseInt(Source_Field_Value);
              
              System.out.println(chk);
              
              
             form.setField(From_Field_Name1+chk , "Yes");
	 
	}
	
	}
		}stamper.close();
        reader.close();
		
	}
	
	@SuppressWarnings("deprecation")
	public static String getStrDate(String date) {
		  
		String lasmod="";
		
		if (date.contains("-")) {
			
			Date lms = new Date(date);
		 lasmod = new SimpleDateFormat("dd-MM-yyyy ").format(lms);
			
		}
		
		if (date.contains("/")) {
			
			Date lms = new Date(date);
		 lasmod = new SimpleDateFormat("dd-MM-yyyy ").format(lms);
			
			
		}
		
		return lasmod;
		
		}
	
	public static void main(String[] args) {
		
		String lastmodified ="2014/06/19 hgggg";		
		//getStrDate("");
		
		System.out.println("new date"+  getStrDate(lastmodified));
		
		
	}
	
	
	
	
	
	
}