package in.fiinfra.utility.controller;



import in.fiinfra.common.partner.APDetails;
import in.fiinfra.partner.controller.PartnerController;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.security.CodeSource;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.apache.log4j.Logger;

import com.itextpdf.text.BaseColor;
import com.itextpdf.text.Chunk;
import com.itextpdf.text.Document;
import com.itextpdf.text.DocumentException;
import com.itextpdf.text.Element;
import com.itextpdf.text.Font;
import com.itextpdf.text.Font.FontFamily;
import com.itextpdf.text.FontFactory;
import com.itextpdf.text.Image;
import com.itextpdf.text.ListItem;
import com.itextpdf.text.PageSize;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.Phrase;
import com.itextpdf.text.Rectangle;
import com.itextpdf.text.pdf.PdfPCell;
import com.itextpdf.text.pdf.PdfPTable;
import com.itextpdf.text.pdf.PdfWriter;
 

public class GeneratePFActionPlan {
	private static final Logger logger = Logger
			.getLogger(PartnerController.class);
	static APDetails apDetails;
	static List<APDetails> goalList;
	static List<Object> allDataList;
	static List<APDetails> investmentsList;
	static List<APDetails> riskPlanningList;
	static List<APDetails> apDetailsList;
	static String contextPath;
	static String basePath;
	static int partyId;
	static int r;
	static int g;
	static int b;
	static String actionPlanImageName;
	 public static void generateAp(){
		 logger.info(" in GeneratePFActionPlan.generateAp");
		 	
		 		 Document document = new Document();
			        document.setPageSize(PageSize.A4);
			        String apReportPath=basePath+String.valueOf(partyId);
			        try{
			        	File f=new File(apReportPath);
			        	
			        	if(f.exists()){
			        		f.delete();
			        	}else{
			        		f.mkdirs();
			        	}
			        }
			        catch (Exception e) {
						// TODO: handle exception
					}
			        // step 2
			        try {
						PdfWriter writer=PdfWriter.getInstance(document, new FileOutputStream(apReportPath+"\\"+String.valueOf(partyId)+"_PO"+".pdf"));
						HeaderFooter event = new HeaderFooter();
						writer.setBoxSize("art", new Rectangle(36, 54, 559, 788));
				        writer.setPageEvent(event);
					} catch (FileNotFoundException e) {
						// TODO Auto-generated catch block
						logger.error(e);
					} catch (DocumentException e) {
						// TODO Auto-generated catch block
					}
			 
			        // step 3
			        document.open();
			 
			        // step 4 create PDF contents
				    logger.info("partyId----------PO----------------"+partyId);
				    try{
			        document= GeneratePFActionPlan.generateIndivisualAP(document,apDetailsList);
				    }
				    catch (Exception e) {
						// TODO: handle exception
				    	logger.error(e);
					}
				    try{
			        document= GeneratePFActionPlan.addDoc(document, partyId,apDetailsList);
				    }
				    catch (Exception e) {
						// TODO: handle exception
				    	logger.error(e);
					}
				    logger.info(" closing doc...");	
			        //step 5
			        document.close();
			 
			        logger.info( "PDF Created! for "+partyId );
		 	
	       
	 }
	 
	 public static List<Object> getAllDataList() {
		return allDataList;
	}

	public static void setAllDataList(List<Object> allDataList) {
		GeneratePFActionPlan.allDataList = allDataList;
	}

	public static void AddFooter(Document doc)
	 {
		 
		 Image img=null;
		 try
		    {
		    img= Image.getInstance("D:\\powerby.png");
	      //  imf.setAlignment(Image.MIDDLE);
	       // imf.scaleAbsoluteHeight(20);
	       // imf.scaleAbsoluteWidth(20);
	       // imf.scalePercent(100);
		    img.scaleToFit(580, 700);
		    img.setAbsolutePosition(2f, 10f);
		    doc.add(img);
		    }
		    catch(Exception e)
		    {
		    }
	 }
	 
	  public static Document generateIndivisualAP(Document doc,List<APDetails> apDetailsList){
		 try{
			 doc.add(GeneratePFActionPlan.addimageinTable());
			  doc.add(GeneratePFActionPlan.createTitle(apDetailsList));
			  
		  }catch (Exception e) {
			// TODO: handle exception
			  logger.error(e);
		}
		  
		 try {
			doc.add(GeneratePFActionPlan.createTable(apDetailsList));
		} catch (DocumentException e) {
			// TODO Auto-generated catch block
			logger.error(e);
		}
//		AddFooter(doc);
		//doc.newPage(); 	
		
		  return doc;
		  
	  }	
	  public static Paragraph createTitle(List<APDetails> apDetailsList){
		  String partyName=apDetailsList.get(0).getPartyName();
		  //Font font = new Font(FontFamily.TIMES_ROMAN, 14, Font.BOLD, BaseColor.BLACK);
		  Font font =  FontFactory.getFont("Arial", 14, Font.BOLD , BaseColor.BLACK);
		  logger.info("inside title");
			  Paragraph preface = new Paragraph();
			  Paragraph p ;
			  Chunk c;
			    // We add one empty line
			    addEmptyLine(preface, 1);			  
			   
			       Image img=null;
			       try{
			           img = Image.getInstance(contextPath+"\\images\\"+actionPlanImageName);
			        img.setAlignment(Element.ALIGN_CENTER);
			           img.scaleAbsoluteHeight(10);
			           img.scaleAbsoluteWidth(20);
			           img.scalePercent(55);
			           
			     }catch(Exception e)
			     {
			    	 logger.error(e);
			     }
			       p=new Paragraph();
			       p.add(img);
			       p.setAlignment(Element.ALIGN_CENTER);
			       preface.add(p);
			       preface.setAlignment(Element.ALIGN_CENTER);
			    
			       //font = new Font(FontFamily.TIMES_ROMAN, 12, Font.BOLD, BaseColor.BLACK);
			        font =  FontFactory.getFont("Arial", 12, Font.BOLD , BaseColor.BLACK);
			       p=new Paragraph("Name Of the Client: ", font);
			       p.setAlignment(Element.ALIGN_LEFT);
			       p.add(new Chunk(partyName,FontFactory.getFont("Arial", 12, Font.BOLD, (new BaseColor(r, g, b)))));
			       preface.add(p);
			    //font = new Font(FontFamily.TIMES_ROMAN, 12, Font.BOLD, BaseColor.BLACK);
			    font =  FontFactory.getFont("Arial", 12, Font.BOLD , BaseColor.BLACK);
			    p=new Paragraph("Total Annual Revenue possible: ",font);
			   // p.setFont(FontFactory.getFont("Arial", 12, Font.BOLD, BaseColor.BLACK));
			    
			    p.setAlignment(Element.ALIGN_LEFT);
			    //p.add("Total Annual Revenue possible: ");
			    p.add(new Chunk("Rs."+apDetails.getTotalRevenuePossible(),FontFactory.getFont("Arial", 12, Font.BOLD, (new BaseColor(r, g, b)))));
//			    try{
////			    p.add(new Chunk("Rs.",FontFactory.getFont("Arial", 14, Font.BOLD, (new BaseColor(r, g, b)))));
//			    }catch (Exception e) {
//					// TODO: handle exception
//				}
			    preface.add(p);
			    p=new Paragraph();
			    p.setFont(FontFactory.getFont("Arial", 14, Font.BOLD, BaseColor.BLACK));
			    
			    p.setAlignment(Element.ALIGN_LEFT);
//			    p.add("Assets under advisory over 10 years: ");
//			    p.add(new Chunk("Rs."+apDetails.getTotalAUA10years(),FontFactory.getFont("Arial", 14, Font.BOLD, (new BaseColor(r, g, b)))));
//			    preface.add(p);
			    addEmptyLine(preface, 3);			  
			    font =FontFactory.getFont("Arial", 14, Font.BOLD , (new BaseColor(r, g, b)));
			    p=new Paragraph("LIST OF OPPORTUNITIES", font);			    
			    preface.add(p);
			    
			    addEmptyLine(preface, 1);
		  return preface;
	  }
	  public static PdfPTable createTable(List<APDetails> apDetailsList) throws DocumentException {
		  
	        // create 6 column table
	        PdfPTable table = new PdfPTable(5);
	 
	        // set the width of the table to 100% of page
	        table.setWidthPercentage(100);
	 
	        // set relative columns width
	        table.setWidths(new float[]{0.6f, 2f, 2f,2f,2f});
	 
	        // ----------------Table Header "Title"----------------
	        table= createHeader(table);
	 
	        //-----------------Table Cells Label/Value------------------
	 
	        table= FillValues(table,apDetailsList);
	        
	        logger.info(" table ..ready..");
	 
	        return table;
	    }
	  
	    // create cells
	    private static PdfPTable createHeader( PdfPTable table){
	        
	        Font font =  FontFactory.getFont("Arial", 8, Font.BOLD , BaseColor.WHITE);
	 
	        // create cell
	        PdfPCell cell = new PdfPCell(new Phrase("Sr.No",font));
	        cell.setBackgroundColor(new BaseColor(r, g, b));
	        table.addCell(cell);
	        cell = new PdfPCell(new Phrase("Purpose",font));
	        cell.setBackgroundColor(new BaseColor(r, g, b));
	        table.addCell(cell);
	        cell = new PdfPCell(new Phrase("What is the Opportunity",font));
	           cell.setBackgroundColor(new BaseColor(r, g, b));
	        table.addCell(cell);
//	        cell = new PdfPCell(new Phrase("Recommended Products",font));
//	        table.addCell(cell);
	        cell = new PdfPCell(new Phrase("Amount Involved",font));
	           cell.setBackgroundColor(new BaseColor(r, g, b));
	        table.addCell(cell);
	        cell = new PdfPCell(new Phrase("Revenue Possible",font));
	           cell.setBackgroundColor(new BaseColor(r, g, b));
	        table.addCell(cell);
	        
//	        cell = new PdfPCell(new Phrase("Amount Involved(Rs.)",font));
//	        table.addCell(cell);
//	       
//	        cell = new PdfPCell(new Phrase("Revenue Possible(Rs.)",font));
//	        table.addCell(cell);
	        
	        logger.info(" Headers created...");
	        // set style
	        //Style.labelCellStyle(cell);
	        return table;
	    }
	 
	    private static PdfPTable  FillValues(PdfPTable table,List<APDetails> apDetailsList){
	    	 //Font font = new Font(FontFamily.TIMES_ROMAN, 8, Font.BOLD, BaseColor.BLACK);
	    	 Font font =  FontFactory.getFont("Arial", 8, Font.NORMAL , BaseColor.BLACK);
	    	PdfPCell cell; 
	    	int i=1;
	    	for (APDetails apDetails :  apDetailsList){
	    		cell=new PdfPCell(new Phrase(String.valueOf(i),font));
	    		table.addCell(cell);
	    		
	    		cell=new PdfPCell(new Phrase(apDetails.getPurpose(),font));
	    		table.addCell(cell);
	    		
	    		cell=new PdfPCell(new Phrase(apDetails.getOpportunity(),font));
	    		table.addCell(cell);
	    		
//	    		cell=new PdfPCell(new Phrase(apDetails.getProductName1()+"\n"+apDetails.getProductName2()+"\n"+apDetails.getProductName3()
//	    				+"\n"+apDetails.getProductName4()+"\n"+apDetails.getProductName5(),font));
//	    		table.addCell(cell);
//	    		
//	    		cell=new PdfPCell(new Phrase(apDetails.getCoverTerm()+"\n"+apDetails.getCoverTerm2()+"\n"+apDetails.getCoverTerm3()+"\n"
//	    		+apDetails.getCoverTerm4()+"\n"+apDetails.getCoverTerm5(),font));
//	    		table.addCell(cell);
//	    		
//	    		cell=new PdfPCell(new Phrase(apDetails.getPremium()+"\n"+apDetails.getPremium2()+"\n"+apDetails.getPremium3()+"\n"
//	    				+apDetails.getPremium4()+"\n"+apDetails.getPremium5()+"\n",font));
//	    		table.addCell(cell);
	    		
	    		cell=new PdfPCell(new Phrase(apDetails.getAmountInvolved(),font));
	    		table.addCell(cell);
	    		
	    		cell=new PdfPCell(new Phrase(apDetails.getRevenuePossible(),font));
	    		table.addCell(cell);
	    		
	    		i++;
	    	}
	    	logger.info(" Data filled...");
	    	return table; 
	    }
	    
	    public static PdfPTable addimageinTable() throws DocumentException {
	    	  // Pdf pdf1 = new Pdf();

	    	  // Create a section in the Pdf object
	    	  // Section sec1 = PdfPTable.getSections().add();

	    	  // Instantiate a table object
	    	  PdfPTable table = new PdfPTable(3);
	    	  // Add the table in paragraphs collection of the desired section
	    	  table.setWidthPercentage(100);

	    	  // Set with column widths of the table
	    	  table.setWidths(new float[] { 2f, 2f, 2f });

	    	  // Set table border using another customized BorderInfo object
	    	  table = createHeaderForMainPage(table);
	    	  return table;

	    	 }

	    	 private static PdfPTable createHeaderForMainPage(PdfPTable table) {
	    	  // font
	    	  
	    	  Font font =  FontFactory.getFont("Arial", 10, Font.BOLD , BaseColor.BLACK);
	    	  Paragraph p;

	    	  Image img = null;
	    	  String path = null;
	    	  try {
	    	   path = contextPath + apDetails.getPartnerLogo();
	    	    //img = Image.getInstance("D:\\ActionPlan.png");
	    	   logger.info("path::::::::::::"+path);
	    	  
	           img = Image.getInstance(path);
	    	   //img = Image.getInstance(path);
	    	   img.scaleToFit(580, 700);
	    	   img.setAbsolutePosition(2f, 10f);
	    	   // doc.add(img);
	    	  } catch (Exception e) {
	    	  }

	    	  p = new Paragraph();
	    	  p.setAlignment(Element.ALIGN_RIGHT);
	    	  if (apDetails.getPartnerName() != null)
	    	   p.add(new Chunk(apDetails.getPartnerName(), FontFactory.getFont(
	    	     "Arial", 14, Font.BOLD,
	    	     (new BaseColor(r, g, b)))));
	    	  p.add("\nFinancial Consultant\n");
	    	  if (apDetails.getPartnerMobile() != null)
	    	   p.add(apDetails.getPartnerMobile() + "\n");
	    	  if (apDetails.getPartnerEmail() != null)
	    	   p.add(apDetails.getPartnerEmail() + "\n");
	    	  if (apDetails.getStreet() != null)
	    	   p.add(apDetails.getStreet() + "\n");
	    	  if (apDetails.getPartnerAddress() != null)
	    	   p.add(apDetails.getPartnerAddress() + "\n");
	    	  if (apDetails.getState() != null)
	    	   p.add(apDetails.getState());


	    	  // create cell
	    	  PdfPCell cell = new PdfPCell(img, true);
	    	  cell.setBorder(Rectangle.NO_BORDER);
	    	  table.addCell(cell);
	    	  cell.setBorder(Rectangle.NO_BORDER);
	    	  cell = new PdfPCell(new Phrase("", font));
	    	  cell.setBorder(Rectangle.NO_BORDER);
	    	  table.addCell(cell);

	    	  cell = new PdfPCell(new Phrase(p));
	    	  cell.setBorder(Rectangle.NO_BORDER);
	    	  table.addCell(cell);

	    	  logger.info(" Headers created...");

	    	  return table;
	    	 }
		  public static PdfPTable createTableForGoal() throws DocumentException {
			  
		        // create 6 column table
		        PdfPTable table = new PdfPTable(5);
		 
		        // set the width of the table to 100% of page
		        table.setWidthPercentage(100);
		 
		        // set relative columns width
		        table.setWidths(new float[]{2f,0.5f,1.2f,1.4f,5f});
		 
		        // ----------------Table Header "Title"----------------
		        table= createHeaderForGoalTable(table);
		 
		        //-----------------Table Cells Label/Value------------------
		 
		        table= FillValuesForGoal(table,goalList);
		        
		        logger.info(" table ..ready..");
		 
		        return table;
		    }
		  
		  public static PdfPTable createTableForInvestments() throws DocumentException {
			  
		        // create 6 column table
		        PdfPTable table = new PdfPTable(2);
		 
		        // set the width of the table to 100% of page
		        table.setWidthPercentage(100);
		        table.setHorizontalAlignment(Element.ALIGN_LEFT);
		        // set relative columns width
		        table.setWidths(new float[]{6f,4f});
		 
		        // ----------------Table Header "Title"----------------
		        table= createHeaderForInvestments(table);
		 
		        //-----------------Table Cells Label/Value------------------
		 
		        table= FillValuesForInvestments(table,investmentsList);
		        
		        logger.info(" table ..ready..");
		 
		        return table;
		    }
		  public static PdfPTable createTableForRisk() throws DocumentException {
			  
		        // create 6 column table
		        PdfPTable table = new PdfPTable(4);
		 
		        // set the width of the table to 100% of page
		        table.setWidthPercentage(100);
		        table.setHorizontalAlignment(Element.ALIGN_LEFT);
		        // set relative columns width
		        table.setWidths(new float[]{2f,1.2f,1.2f,3f});
		 
		        // ----------------Table Header "Title"----------------
		        table= createHeaderForRisk(table);
		 
		        //-----------------Table Cells Label/Value------------------
		 
		        table= FillValuesForRisk(table,riskPlanningList);
		        
		        logger.info(" table ..ready..");
		 
		        return table;
		    }
		  
		  private static PdfPTable createHeaderForGoalTable( PdfPTable table){
		        // font
		        //Font font = new Font(FontFamily.TIMES_ROMAN, 8, Font.BOLD, BaseColor.WHITE);
		        Font font =  FontFactory.getFont("Arial", 8, Font.BOLD , BaseColor.WHITE);
		        // create cell
		        PdfPCell cell = new PdfPCell(new Phrase("Goal",font));
		           cell.setBackgroundColor(new BaseColor(r, g, b));
		        table.addCell(cell);
		        cell = new PdfPCell(new Phrase("Years to Goal",font));
		           cell.setBackgroundColor(new BaseColor(r, g, b));
		        table.addCell(cell);
		        cell = new PdfPCell(new Phrase("Amount to be invested Monthly",font));
		           cell.setBackgroundColor(new BaseColor(r, g, b));
		        table.addCell(cell); 
		        cell = new PdfPCell(new Phrase("Where to invest?",font));
		           cell.setBackgroundColor(new BaseColor(r, g, b));
		        table.addCell(cell);		     
		        cell = new PdfPCell(new Phrase("Specific product wise to invest in",font));
		           cell.setBackgroundColor(new BaseColor(r, g, b));
		        table.addCell(cell); 
		        logger.info(" Headers created...");
		        // set style
		        //Style.labelCellStyle(cell);
		        return table;
		    }
		  private static PdfPTable createHeaderForInvestments( PdfPTable table){
		        // font
		        //Font font = new Font(FontFamily.TIMES_ROMAN, 8, Font.BOLD, BaseColor.WHITE);
		        Font font =  FontFactory.getFont("Arial", 8, Font.BOLD , BaseColor.WHITE);
		        // create cell
		        PdfPCell cell = new PdfPCell(new Phrase("Name of Investment",font));
		           cell.setBackgroundColor(new BaseColor(r, g, b));
		        table.addCell(cell);
		        cell = new PdfPCell(new Phrase("Amount",font));
		           cell.setBackgroundColor(new BaseColor(r, g, b));
		        table.addCell(cell);		       
		        logger.info(" Headers created...");
		        // set style
		        //Style.labelCellStyle(cell);
		        return table;
		    }
	    
		  private static PdfPTable createHeaderForRisk( PdfPTable table){
		        // font
		        //Font font = new Font(FontFamily.TIMES_ROMAN, 8, Font.BOLD, BaseColor.WHITE);
		        Font font =  FontFactory.getFont("Arial", 8, Font.BOLD , BaseColor.WHITE);
		 
		        // create cell
		        PdfPCell cell = new PdfPCell(new Phrase("Risks",font));
		           cell.setBackgroundColor(new BaseColor(r, g, b));
		        table.addCell(cell);
		        cell = new PdfPCell(new Phrase("Cover required",font));
		           cell.setBackgroundColor(new BaseColor(r, g, b));
		        table.addCell(cell);
		        cell = new PdfPCell(new Phrase("What is available",font));
		           cell.setBackgroundColor(new BaseColor(r, g, b));
		        table.addCell(cell);
		        cell = new PdfPCell(new Phrase("To do",font));
		           cell.setBackgroundColor(new BaseColor(r, g, b));
		        table.addCell(cell);
		        logger.info(" Headers created...");
		        // set style
		        //Style.labelCellStyle(cell);
		        return table;
		    }
	    
	    
		  
		  
	    private static void addEmptyLine(Paragraph paragraph, int number) {
	        for (int i = 0; i < number; i++) {
	          paragraph.add(new Paragraph(" "));
	        }
	      }
	    public static Document addDoc(Document doc,int partyId,List<APDetails> apDetailsList){
	    
	    	Font font =FontFactory.getFont("Arial", 14, Font.BOLD , (new BaseColor(r, g, b)));
		    Paragraph p=new Paragraph();			    
		   
	    	
	    	
		    try {
		    	doc.add(new Paragraph("\n\n"));
		    	doc.add(new Paragraph("Goal Plan",font));
		    	doc.add(new Paragraph("\n"));
				doc.add(GeneratePFActionPlan.createTableForGoal());				
			} catch (DocumentException e) {
				// TODO Auto-generated catch block
				logger.error(e);
			}
//		    
		    try {
		    	doc.add(new Paragraph("\n\n"));
		    	doc.add(new Paragraph("Total Break Up For Fresh Investments To Be Made",font));
		    	doc.add(new Paragraph("\n"));
				doc.add(GeneratePFActionPlan.createTableForInvestments());
				doc.add(new Paragraph("\n\n"));
			} catch (DocumentException e) {
				// TODO Auto-generated catch block
				logger.error(e);
			}
		    
		    try{
		    	doc=fillProductDetails(doc);		  
		    }catch(Exception e){
		    	logger.error(e);
		    }
		    try{
			    doc=fillOpportunityEmergency(doc,p);
			    }
			    catch (Exception e) {
					// TODO: handle exception
			    	logger.error(e);
				}
		    try {
		    	doc.add(new Paragraph("\n\n"));
		    	doc.add(new Paragraph("Risk Planning",font));
		    	doc.add(new Paragraph("\n"));
				doc.add(GeneratePFActionPlan.createTableForRisk());
				doc.add(new Paragraph("\n\n"));
			} catch (DocumentException e) {
				// TODO Auto-generated catch block
				logger.error(e);
			}
		    try{
		    	doc=fillRiskProductDetails(doc);		  
		    }catch(Exception e){
		    	logger.error(e);
		    }
		    try{
		    	doc=loanScript(doc);		  
		    }catch(Exception e){
		    	logger.error(e);
		    }
		    try{
		    	doc=taxScript(doc);		  
		    }catch(Exception e){
		    	logger.error(e);
		    }
		    try{
		    	doc=successionScript(doc);		  
		    }catch(Exception e){
		    	logger.error(e);
		    }
		    
		    
	    	return doc;
	    }
	  	
	    private static Document fillProductDetails(Document doc){
	  
	    	Font font =FontFactory.getFont("Arial", 13,Font.BOLD,BaseColor.BLACK);
	    	Paragraph pa=new Paragraph("Product Explanations:",FontFactory.getFont("Arial", 14,Font.BOLD,(new BaseColor(r, g, b))));
	    	 Phrase p=new Phrase("\nMutual fund",font);
	    	 Font font1 =FontFactory.getFont("Arial", 11,BaseColor.BLACK);
	    	 Phrase phrase=new Phrase("",font1);
	    	 phrase.add("\n\nA Mutual fund is a professionally managed type of collective investments " +
	    			"scheme that pools money from many investors and invests the " +
	    			"money in assets like stocks, bonds, real estate etc." +
	    			"The gains and losses made from the investments are " +
	    			"equally distributed among all the investors in the fund.");
	    	
	    	  try{
	    		  	doc.add(pa);
	    	    	doc.add(p);
	    	    	doc.add(phrase);
	    	    }catch (Exception e) {
	    			// TODO: handle exception
	    		}
	    	  
	    	  p=new Phrase("\n\nEquity Mutual funds",font);
	    	  phrase=new Phrase("",font1);
	    	  phrase.add("\n\nA mutual fund that predominantly invests in stocks of listed companies " +
		    			"is an equity mutual fund. These funds can be volatile in the short run but can have a " +
		    			"considerable upside potential over a long period. " +
		    			"Equity mutual funds can be segmented according to the size of the stocks they invest in " +
		    			"(large cap / mid cap / small cap) or concentration of investments in a particular sector (like banking / pharma / IT / FMCG etc) "+
		    			"or choice of stocks based on a specific them (like Infrastructure growth / International oppor tunities / Rural growth etc)");
		    	  try{
		    	    	doc.add(p);
		    	    	doc.add(phrase);
		    	    }catch (Exception e) {
		    			// TODO: handle exception
		    		}
		    	  
		    	  p=new Phrase("\n\nDebt Mutual funds",font);
		    	  phrase=new Phrase("",font1);
		    	  phrase.add("\n\nA Mutual funds that predominantly invest in fixed income based instruments like Government securities, bonds, " +
			    			"corporate deposits, commercial papers, call money etc are debt mutual funds. These are considered fai rly safe " +
			    			"with little risk to capital, but income from these funds can depend on factors like interest rate cycle, liquidity " +
			    			"position in the economy, central bank�s monetary policy etc. Debt mutual funds can be segmented on the basis " +
			    			"of the nature of underlying securities they hold � Income funds (Medium to long term bonds / CPs / CDs / GSec), "+
			    			"Short term funds (Short term bonds / Call money) and Liquid funds (Cash / Call money).");
			    	  try{
			    	    	doc.add(p);
			    	    	doc.add(phrase);
			    	    }catch (Exception e) {
			    			// TODO: handle exception
			    		} 
			    	  p=new Phrase("\n\nGold funds",font);
			    	  phrase=new Phrase("",font1);
			    	  phrase.add("\n\nA mutual fund that primarily invests in gold bullion on gold mining companies are Gold funds. Their price  " +
				    			"movements will more or less reflect the price movement of gold in the market.");
				    	  try{
				    	    	doc.add(p);
				    	    	doc.add(phrase);
				    	    }catch (Exception e) {
				    			// TODO: handle exception
				    }  	
	    	return doc;
	    }
	    
	    private static Document fillRiskProductDetails(Document doc){
	    	Font font =FontFactory.getFont("Arial", 11,Font.BOLD,BaseColor.BLACK);
	    	Paragraph pa=new Paragraph("Product Brief:",FontFactory.getFont("Arial", 14,Font.BOLD,(new BaseColor(r, g, b))));
	    	 Phrase p=new Phrase("\nHealth Insurance",font);
	    	 Font font1 =FontFactory.getFont("Arial", 10,BaseColor.BLACK);
	    	 Phrase phrase=new Phrase("",font1);
	    	 phrase.add("\n\nHealth insurance is an i nsurance against the risk of incurring medical expenses involving hospitalisation " +
	    			"surgery and medication. Individual health insurance policies cover an individual for a pre-decided amount " +
	    			"called Sum insured in return for a premium." +
	    			"Family floater policies provide cover for the whole family at very less cost. Mediclaim policies reimburse the" +
	    			"cost of hospital stay, doctor fees, surgeries etc. Hospitalisation cash policies help cover expenses incidental to hospitalization. ");
	    	  try{
	    		  	doc.add(pa);
	    	    	doc.add(p);
	    	    	doc.add(phrase);
	    	    }catch (Exception e) {
	    			// TODO: handle exception
	    		}
	    	  
	    	  p=new Phrase("\n\nTop up health insurances",font);
	    	  phrase=new Phrase("",font1);
	    	  phrase.add("\n\nTop up health insurance policies help in covering very expensive treatments. " +
		    			"You can take a policy for about Rs. 10 lacs at the cost of a normal Rs. 2 lac cover. But claims on these policies can be made only if the claim " +
		    			"amount crosses a minimum threshold limit.");
		    	  try{
		    	    	doc.add(p);
		    	    	doc.add(phrase);
		    	    }catch (Exception e) {
		    			// TODO: handle exception
		    		}
		    	  
		    	  p=new Phrase("\n\nAccident insurance",font);
		    	  phrase=new Phrase("",font1);
		    	  phrase.add("\n\nAn accident insurance will provide financial compensation if any of the below happens :\n " +
			    			"- Death due to accident\n" +
			    			"- Permanent total disability like loss of sight, both limbs etc.\n" +
			    			"- Permanent partial disability like loss of one limb, one eye etc\n" +
			    			"- Temporary total disability like surgeries or treatments requiring hospitalization / rest for 6 months\n" +
			    			"- Medical, hospitalization and related expenses arising due to accidental injuries\n" +
			    			"- A sum paid for children education in case of death / permanent total disability"
			    			);
			    	  try{
			    	    	doc.add(p);
			    	    	doc.add(phrase);
			    	    }catch (Exception e) {
			    			// TODO: handle exception
			    		} 
			    	  p=new Phrase("\n\nCritical illness insurances",font);
			    	  phrase=new Phrase("",font1);
			    	  phrase.add("\n\nThese days the possibility of death is far lesser than the possibility of falling sick - critically sick.  " +
				    			"Insurance companies are more concerned about morbidity than about mortality.\n"+
				    			"A critical illness insurance policy will work as follows:"+
				    			"- The benefit amount is payable once the disease (specified in the policy) is diagnosed meeting specific criteria and the insured survives 30 days after the diagnosis.\n" +
				    			"- The insured will receive the amount as lumpsum so that he can plan the treatment accordingly\n"+
				    			"- Expenses like donor expenses in a transplant surgery, which are not covered under normal health insurance policy, can be paid out of the amount received under this cover both in India & abroad\n"+
				    			"- The amount can also be used to compensate for loss of income for the period when the insured has to undergo treatment and recuperate .\n"+
				    			"- Medical examination may be required in some cases based on the age and the benefit amount chosen\n"			    			  
			    			  );
				    	  try{
				    	    	doc.add(p);
				    	    	doc.add(phrase);
				    	   }catch (Exception e) {
				    		   
				    	   }				    		
							   // TODO: handle exception
					    		   p=new Phrase("\n\nHousehold Content Insurance",font);
					    		   phrase=new Phrase("",font1);
							    	  phrase.add("\n\nA comprehensive householder�s policy will cover Household contents  " +
								    			", Domestic appliances, Electronic equipments, Domestic travel baggage "+
								    			"Optional coverage of the building can be taken at extra premiums "+
								    			"These policies cover risks like Fire, lightning & allied perils, Burglary or theft, "+
								    			"Breakdown of domestic appliances, Repair and replacement of electronic equipments"
							    			  );
								    	  try{
								    	    doc.add(p);
								    		doc.add(phrase);
								    	   }catch (Exception e) {
										    			// TODO: handle exception	    		  
								    		   }  
								    	  p=new Phrase("\n\nDo remember:",FontFactory.getFont("Arial", 12,Font.BOLD,(new BaseColor(r, g, b))));
								    	  phrase=new Phrase("\n\nInsurance will only cover the unknown only -  " +
									    			"risks that were not expected or conditions that did not exist at "+
									    			"the time of purchasing insurance. Insurance policies are only indemnity policies. The objective is to place you "+
									    			"back close to the same position as before the risk happened. You will not be able to make a profit from the insurance. "+
									    			"\nYou should never replace insurance unless you have the replacement in place.",
									    			FontFactory.getFont("Arial", 11,Font.NORMAL,(new BaseColor(r, g, b)))
								    			  );
									    	  try{
									    	    doc.add(p);
									    		doc.add(phrase);
									    	   }catch (Exception e) {
											    			// TODO: handle exception	    		  
									    	}
									    	  p=new Phrase("\n\nDisclaimer:",font);
									    	  phrase=new Phrase("",font1);
									    	  phrase.add("\n\nAcceptance of risk is the prerogative of the insurance company " +
										    			"Your p olicy may be accepted as is / accepted with exclusions / accepted with loading on premium / postponed / put on hold for more medical"+
										    			"tests or sometimes declined. We have very little control over the underwriting processes different companies "+
										    			"follow."
									    			  );
										    	  try{
										    	    doc.add(p);
										    		doc.add(phrase);
										    	   }catch (Exception e) {
												    			// TODO: handle exception	    		  
										    		   }   
	    	return doc;
	    }
	    
	    
	    public static Document fillOpportunityEmergency(Document doc, Paragraph p){
	    	
	    	
	    	Font font =FontFactory.getFont("Arial", 14, Font.BOLD , (new BaseColor(r, g, b)));
		    p=new Paragraph("Emergency Planning",font);
		    
		    
		    
		    try {
		    	doc.add(new Phrase("\n\n"));
		    	doc.add(p);				
			} catch (DocumentException e) {
				// TODO Auto-generated catch block
				logger.error(e);
			}
		    p=new Paragraph("To tide over emergencies like loss of job or loss in business or sudden health set backs or natural"+
				    "calamities a sum equivalent to 6 months expenses have to be maintained as emergency funds"
				    		);
		    com.itextpdf.text.List unorderedList = new com.itextpdf.text.List(com.itextpdf.text.List.UNORDERED);
		   // unorderedList.setListSymbol("\u2022");
		    
		    font =FontFactory.getFont("Arial", 14, (new BaseColor(r, g, b)));
		    Phrase phrase;
		    
		    phrase=new Phrase();
		    logger.info("apDetails.getSavingAcAmount():"+apDetails);
		    Chunk c=new Chunk(" Rs."+apDetails.getSavingAcAmount(),font);//		    
		    phrase.add("New savings (investment) account � jointly held - ");
		    phrase.add(c);
		    unorderedList.add(new ListItem(phrase));
		    
		    phrase=new Phrase();
		    c=new Chunk(" Rs."+apDetails.getFdAmount(),font);//		    
		    phrase.add("Deposits � Savings and Fixed - ");
		    phrase.add(c);
		    unorderedList.add(new ListItem(phrase));
		    
		    
		    phrase=new Phrase();
		    c=new Chunk(" Rs."+apDetails.getMfLumpsum(),font);//		    
		    phrase.add("Lump sum investments in Mutual funds - ");
		    phrase.add(c);
		    unorderedList.add(new ListItem(phrase));
		    
		    font =FontFactory.getFont("Arial", 14, Font.BOLD , BaseColor.BLACK);		    		    
		    Phrase purpose=new Phrase("\nPurpose:",font);
		    font =FontFactory.getFont("Arial", 14,BaseColor.BLACK);
		    c=new Chunk(" Emergency Funds ",font);//
		    purpose.add(c);
		    addEmptyLine(p, 1);
		    try {
		    	doc.add(p);
				doc.add(unorderedList);
				doc.add(purpose);
			} catch (DocumentException e) {
				// TODO Auto-generated catch block
				logger.error(e);
			}
		    return doc;
	    }
	    
         
		public static Document fillClientBackground(Document doc, Paragraph p){
			    	
			    	
			    	Font font =FontFactory.getFont("Arial", 14, Font.BOLD , BaseColor.BLACK);
				    p=new Paragraph("\nClient Background on Emergency preparedness:",font);
				  
				    Paragraph p2=new Paragraph("\nRevenue Possible",font);
				    Paragraph p3=new Paragraph("\nTranscript:",font);
				    com.itextpdf.text.List unorderedList = new com.itextpdf.text.List(com.itextpdf.text.List.UNORDERED);
				   // unorderedList.setListSymbol("\u2022");
				    
				    font =FontFactory.getFont("Arial", 14, Font.BOLD, (new BaseColor(r, g, b)));
				    Phrase phrase;
				    
				    phrase=new Phrase();
				    Chunk c=new Chunk(apDetails.getEmrgencyScore(),font);//		    
				    phrase.add("Client Score on Emergency preparedness ");
				    phrase.add(c);
				    phrase.add(" out of 5");
				    unorderedList.add(new ListItem(phrase));
				    
				    phrase=new Phrase();
				    c=new Chunk( apDetails.getSourcesOfIncome() ,font);//		    
				    phrase.add("Has ");
				    phrase.add(c);
				    phrase.add(" sources of income");
				    unorderedList.add(new ListItem(phrase));
				    
				    
				    phrase=new Phrase();
				    c=new Chunk("Has ",font);//	
				    phrase.add(c);
				    phrase.add("faced emergency situations in the past �");
				    c=new Chunk(apDetails.getEmergencies()+" � Found it difficult to handle ",font);
				    phrase.add(c);
				    if(apDetails.getHasFacedEmergency().equalsIgnoreCase("yes"))
				    	unorderedList.add(new ListItem(phrase));
				    
				    
				    phrase=new Phrase();
				    c=new Chunk(apDetails.getManagebleMonths(),font);//		    
				    phrase.add("Can manage ");
				    phrase.add(c);
				    phrase.add(" months only without income");
				    unorderedList.add(new ListItem(phrase));
				    phrase.add("\n");
				    
//				    font =FontFactory.getFont("Arial", 14, Font.BOLD , BaseColor.BLACK);		    		    
//				    Phrase purpose=new Phrase("Purpose:",font);
//				    font =FontFactory.getFont("Arial", 14,BaseColor.BLACK);
//				    c=new Chunk(" Emergency Funds",font);//
//				    purpose.add(c);
				    
				    
				    
				   
				    
				    
				    
				    c=new Chunk("Rs. 300/-");
				    p2.add(c);
				    try {
				    	doc.add(p);
						doc.add(unorderedList);
//						doc.add(p1);
//						doc.add(purpose);
					} catch (DocumentException e) {
						// TODO Auto-generated catch block
						logger.error(e);
					}
				    return doc;
			    }
		
		  /* Purpose: Risk cover For Opportunity
           *  Date 12/04/2012  */	
		
	public static Document fillOpportunityRiskCover(Document doc, Paragraph p) {

		Font font = FontFactory.getFont("Arial", 14,
				Font.BOLD | Font.UNDERLINE, BaseColor.BLACK);
		p = new Paragraph("Opportunity 2:", font);

		com.itextpdf.text.List unorderedList = new com.itextpdf.text.List(
				com.itextpdf.text.List.UNORDERED);
		// unorderedList.setListSymbol("\u2022");

		font = FontFactory.getFont("Arial", 14,
				Font.NORMAL, (new BaseColor(r, g, b)));
		Phrase phrase;

		phrase = new Phrase();
		Chunk c = new Chunk("Rs."+apDetails.getIdealLi(), font);//
		phrase.add("Life insurance Term plan for - ");
		phrase.add(c);
		c = new Chunk(" Rs. "+apDetails.getIdealLiPremium(), font);
		phrase.add(" Approx premium");
		phrase.add(c);
		unorderedList.add(new ListItem(phrase));

		phrase = new Phrase();
		c = new Chunk(apDetails.getCoupleNames(), font);//
		phrase.add("Individual Health insurance for ");
		phrase.add(c);
		phrase.add("-");
		c = new Chunk(" Rs."+apDetails.getIdealHi() +" each ", font);//
		phrase.add(c);
		phrase.add(" - Approx premium ");
		c = new Chunk(" Rs."+apDetails.getIdealHiPremium(), font);//
		phrase.add(c);
		unorderedList.add(new ListItem(phrase));

		phrase = new Phrase();
		c = new Chunk(apDetails.getChildrenNames(), font);//
		phrase.add("Individual Health insurance for ");
		phrase.add(c);
		phrase.add("-");
		c = new Chunk(" Rs. 3 lacs each ", font);//
		phrase.add(c);
		phrase.add(" - Approx premium ");
		c = new Chunk(" Rs.6000/- ", font);//
		phrase.add(c);
		unorderedList.add(new ListItem(phrase));

		phrase = new Phrase();
		c = new Chunk(" Rs. 15 lacs ", font);//
		phrase.add("Top Family floater - ");
		phrase.add(c);
		phrase.add(" - Approx premium ");
		c = new Chunk(" Rs. 3000/- ", font);//
		phrase.add(c);
		unorderedList.add(new ListItem(phrase));

		phrase = new Phrase();
		c = new Chunk(apDetails.getCoupleNames(), font);//
		phrase.add("Critical illness -");
		phrase.add(c);
		phrase.add("-");
		c = new Chunk(" Rs."+apDetails.getIdealCi()+" each ", font);//
		phrase.add(c);
		phrase.add(" - Approx premium ");
		c = new Chunk(" Rs."+ apDetails.getIdealCiPremium(), font);//
		phrase.add(c);
		unorderedList.add(new ListItem(phrase));

		phrase = new Phrase();
		c = new Chunk(apDetails.getCoupleNames(), font);//
		phrase.add("Accidental Disability Insurance - ");
		phrase.add(c);
		phrase.add("-");
		c = new Chunk(" Rs."+apDetails.getIdealAi()+" each ", font);//
		phrase.add(c);
		phrase.add(" � Approx premium ");
		c = new Chunk(" Rs."+ apDetails.getIdealAiPremium(), font);//
		phrase.add(c);
		phrase.add("\n");
		unorderedList.add(new ListItem(phrase));

		font = FontFactory.getFont("Arial", 14,
				Font.BOLD, BaseColor.BLACK);
		Phrase purpose = new Phrase("\nPurpose:", font);
		font = FontFactory.getFont("Arial", 14,
				BaseColor.BLACK);
		c = new Chunk(" Risk cover", font);//
	     
		purpose.add(c);
		try {
			doc.add(p);
			doc.add(unorderedList);
			doc.add(purpose);
		} catch (DocumentException e) {
			// TODO Auto-generated catch block
			logger.error(e);
		}
		return doc;
	}
		
	
	public static Document fillClientBackgroundOnRiskCover(Document doc, Paragraph p){
    	
    	
    	Font font =FontFactory.getFont("Arial", 14, Font.BOLD , BaseColor.BLACK);
	    p=new Paragraph("\nClient Background on Risk cover:",font);
	    
	    com.itextpdf.text.List unorderedList = new com.itextpdf.text.List(com.itextpdf.text.List.UNORDERED);
	   // unorderedList.setListSymbol("\u2022");
	    
	    font =FontFactory.getFont("Arial", 14, Font.BOLD, (new BaseColor(r, g, b)));
	    Phrase phrase;
	    
	    phrase=new Phrase();
	    Chunk c=new Chunk(apDetails.getRiskScore(),font);//		    
	    phrase.add("Client Score on Risk Cover -");
	    phrase.add(c);
	    unorderedList.add(new ListItem(phrase));
	    
	    phrase=new Phrase();
	    c=new Chunk(apDetails.getAge(),font);//		    
	    phrase.add("Age -");
	    phrase.add(c);
	    phrase.add(" ,Has ");
	    c=new Chunk(apDetails.getTotalDependent(),font);
	    phrase.add(c);
	    phrase.add(" dependents including ");
	    c=new Chunk(apDetails.getMinors(),font);
	    phrase.add(c);
	    phrase.add(" minor children");
	    unorderedList.add(new ListItem(phrase));
	    
	    
	    if(!apDetails.getServingLoans().equals("")){
		    phrase=new Phrase();
		    phrase.add("Servicing ");
		    c=new Chunk(apDetails.getServingLoans(),font);
		    phrase.add(c);
		    
		    unorderedList.add(new ListItem(phrase));
	    }
	    if(apDetails.getHasLi().equalsIgnoreCase("Yes")){
		    phrase=new Phrase();
		    c=new Chunk(" Rs."+apDetails.getLi(),font);//		    
		    phrase.add("Has life insurance for");
		    phrase.add(c);
		    phrase.add(" through ");
		    c=new Chunk(apDetails.getLiPolicies(),font);//
		    phrase.add(c);
		    unorderedList.add(new ListItem(phrase));
	    }else{
	    	 phrase=new Phrase();
			    		    
			    phrase.add("Has no life insurance");			    
			    unorderedList.add(new ListItem(phrase));
	    }
	    
	    if(apDetails.getHasHi().equalsIgnoreCase("Yes")){
		    phrase=new Phrase();
		    phrase.add("Has employer provided health insurance � ");
		    c=new Chunk(" Rs."+apDetails.getHi() ,font);
		    phrase.add(c);
		    phrase.add(" for self and family ");
		    unorderedList.add(new ListItem(phrase));
	    }else{
	    		phrase=new Phrase();
 		    
			    phrase.add("Has no health insurance");			    
			    unorderedList.add(new ListItem(phrase));
	    }
	    
	    if(apDetails.getHasAi().equalsIgnoreCase("Yes") && apDetails.getHasCi().equalsIgnoreCase("Yes")){
		    phrase=new Phrase();
		    phrase.add("Has ");
		    c=new Chunk("no",font);
		   // phrase.add(c);
		    phrase.add("critical illness or accidental insurance policies ");
		    unorderedList.add(new ListItem(phrase));
	    }
	    else{
	    	phrase=new Phrase();
		    phrase.add("Has ");
		    c=new Chunk("no",font);
		    phrase.add(c);
		    phrase.add(" critical illness or accidental insurance policies ");
		    unorderedList.add(new ListItem(phrase));
	    }
	    phrase=new Phrase();
	    phrase.add("Assets are ");
	    if(apDetails.getAreAssetsCovered().equalsIgnoreCase("Yes")){
		    c=new Chunk("not covered",font);
		    phrase.add(c);
	    }else{
		    phrase.add("covered ");
		    phrase.add("\n");
	    }
	    unorderedList.add(new ListItem(phrase));
	    
	    
	    // insert an image test code is going
//	    Image image1=null;
//		try {
//			image1 = Image.getInstance("D:\\Desert.jpg");
//		} catch (BadElementException e1) {
//			// TODO Auto-generated catch block
//		} catch (MalformedURLException e1) {
//			// TODO Auto-generated catch block
//		} catch (IOException e1) {
//			// TODO Auto-generated catch block
//		}
//		image1.setAbsolutePosition(2500f, 650f);
//	    Image imf=null;
//	    try
//	    {
//	    imf= Image.getInstance("D:\\Ffreedom.png");
//      //  imf.setAlignment(Image.MIDDLE);
//       // imf.scaleAbsoluteHeight(20);
//       // imf.scaleAbsoluteWidth(20);
//       // imf.scalePercent(100);
//	    imf.scaleToFit(580, 700);
//	    imf.setAbsolutePosition(2f, 10f);
//	    
//	    }
//	    catch(Exception e)
//	    {
//	    }
	    
	    
	    
	    
//	    font =FontFactory.getFont("Arial", 14, Font.BOLD , BaseColor.BLACK);		    		    
//	    Phrase purpose=new Phrase("Purpose:",font);
//	    font =FontFactory.getFont("Arial", 14,BaseColor.BLACK);
//	    c=new Chunk(" Emergency Funds",font);//
//	    purpose.add(c);
	    
	    
	    try {
	    	doc.add(p);
			doc.add(unorderedList);
			//doc.add(imf);
//			doc.add(purpose);
		} catch (DocumentException e) {
			// TODO Auto-generated catch block
			logger.error(e);
		}
	    return doc;
    }

	

	
	
	  /* Opp3 for goal
	   * 
	   */
	public static Document fillOpportunityGoal(Document doc, Paragraph p) {

		Font font = FontFactory.getFont("Arial", 14,
				Font.BOLD | Font.UNDERLINE, BaseColor.BLACK);
		addEmptyLine(p, 2);
		p = new Paragraph("Opportunity 3:", font);

		com.itextpdf.text.List unorderedList = new com.itextpdf.text.List(
				com.itextpdf.text.List.UNORDERED);
		// unorderedList.setListSymbol("\u2022");

		font = FontFactory.getFont("Arial", 14,
				Font.BOLD, (new BaseColor(r, g, b)));
		Font font1 = FontFactory.getFont("Arial", 14,
				Font.BOLD, BaseColor.BLACK);
		
		Phrase phrase;
		phrase = new Phrase();
		Chunk c = new Chunk("", font1);//
//		phrase.add(c);
//		c = new Chunk("Rs.50000 ", font);
//		phrase.add(c);
//		phrase.add("per month");
		
		//phrase = new Phrase();
//	     c = new Chunk("\n\nAssets under Advisory expected over a 10 year period ", font1);//
//		phrase.add(c);
//		c = new Chunk("Rs. 1.2 crores ", font);
//		phrase.add(c);
	

		font = FontFactory.getFont("Arial", 14,
				Font.BOLD, BaseColor.BLACK);
		Phrase purpose = new Phrase("\nPurpose:", font);
		font = FontFactory.getFont("Arial", 14,
				BaseColor.BLACK);
		c = new Chunk(" Investment against goals", font);//
		purpose.add(c);
		try {
			doc.add(p);
			doc.add(phrase);
			//doc.add(unorderedList);
			doc.add(purpose);
		} catch (DocumentException e) {
			// TODO Auto-generated catch block
			logger.error(e);
		}
		return doc;
	}
		
	
	public static Document fillOpportunityLoan(Document doc, Paragraph p) {

		Font font = FontFactory.getFont("Arial", 14,
				Font.BOLD | Font.UNDERLINE, BaseColor.BLACK);
		addEmptyLine(p, 1);
		p = new Paragraph("Opportunity 4:", font);

		com.itextpdf.text.List unorderedList = new com.itextpdf.text.List(
				com.itextpdf.text.List.UNORDERED);
		// unorderedList.setListSymbol("\u2022");

		font = FontFactory.getFont("Arial", 14,
				Font.BOLD, (new BaseColor(r, g, b)));
		
		Phrase phrase;
		
		    phrase=new Phrase();
		    		    
		    //phrase.add("Credit Rating services");
		   // unorderedList.add(new ListItem(phrase));
		    addEmptyLine(p, 1);
		    phrase.add("LOAN");
		    unorderedList.add(new ListItem(phrase));
		   // phrase.add("Other value added services");
		   // unorderedList.add(new ListItem(phrase));
		    
		try {
			doc.add(p);
			//doc.add(phrase);
			doc.add(unorderedList);
			//doc.add(purpose);
		} catch (DocumentException e) {
			// TODO Auto-generated catch block
			logger.error(e);
		}
		return doc;
	}
	
	
 public static Document fillClientBackgroundOnLoanStatus(Document doc, Paragraph p){
    	
    	
    	Font font =FontFactory.getFont("Arial", 14, Font.BOLD , BaseColor.BLACK);
	    p=new Paragraph("\nClient background on status:",font);
	    
	    com.itextpdf.text.List unorderedList = new com.itextpdf.text.List(com.itextpdf.text.List.UNORDERED);
	   // unorderedList.setListSymbol("\u2022");
	    
	    font =FontFactory.getFont("Arial", 14, Font.BOLD, (new BaseColor(r, g, b)));
	    Phrase phrase;
	    
	    phrase=new Phrase();
	    Chunk c=new Chunk(apDetails.getLoanCount(),font);//		    
	    phrase.add("Is already servicing ");
	    phrase.add(c);
	    phrase.add(" loans");
	    unorderedList.add(new ListItem(phrase));
	    
	    phrase=new Phrase();
	    c=new Chunk(apDetails.getLoanPayOffs(),font);//		    
	    phrase.add("Monthly EMI is ");
	    phrase.add(c);
	    phrase.add("% of monthly income");
	    unorderedList.add(new ListItem(phrase));
	    
	    
	    phrase=new Phrase();
	   // c=new Chunk(" purchase of car",font);//		    
	    phrase.add("Planning to take loan for ");
	   // phrase.add(c);
	   // phrase.add(" and");
	    c=new Chunk(apDetails.getIsPlaningToTakeLoans(),font);//
	    phrase.add(c);
	    unorderedList.add(new ListItem(phrase));
	    
	    font =FontFactory.getFont("Arial", 14, Font.BOLD , BaseColor.BLACK);		    		    
	    Phrase purpose=new Phrase("\nPurpose:",font);
	    font =FontFactory.getFont("Arial", 14,BaseColor.BLACK);
	    c=new Chunk(" Need for a healthy credit score before applying for a new loan ",font);//
	    purpose.add(c);
	    
	    
	    font =FontFactory.getFont("Arial", 14, Font.BOLD , BaseColor.BLACK);		    		    
//	    Phrase purpose1=new Phrase("\nScript:",font);
//	    font =FontFactory.getFont("Arial", 14,BaseColor.BLACK);
//	    c=new Chunk(" Advantages / Process / Things to remember / Cost ",font);//
//	    purpose1.add(c);
	    
	    try {
	    	doc.add(p);
			doc.add(unorderedList);
			doc.add(purpose);
			//doc.add(purpose1);
			//doc.add(purpose2);
		} catch (DocumentException e) {
			// TODO Auto-generated catch block
			logger.error(e);
		}
	    return doc;
    }
	

public static Document fillOpportunityTaxPlan(Document doc, Paragraph p) {

	Font font = FontFactory.getFont("Arial", 14,
			Font.BOLD | Font.UNDERLINE, BaseColor.BLACK);
	
	p = new Paragraph("Opportunity 5:", font);

	com.itextpdf.text.List unorderedList = new com.itextpdf.text.List(
			com.itextpdf.text.List.UNORDERED);
	// unorderedList.setListSymbol("\u2022");

	font = FontFactory.getFont("Arial", 14,
			Font.BOLD, (new BaseColor(r, g, b)));
	
	Phrase phrase;
	
	    phrase=new Phrase();
	    		    
	    phrase.add("TAX PLANNING & TAX FILING");
	    unorderedList.add(new ListItem(phrase));
	    
	try {
		doc.add(p);
		//doc.add(phrase);
		doc.add(unorderedList);
		//doc.add(purpose);
	} catch (DocumentException e) {
		// TODO Auto-generated catch block
		logger.error(e);
	}
	return doc;
}

public static Document fillClientBackgroundOnTaxPlan(Document doc, Paragraph p){
	
	
	Font font =FontFactory.getFont("Arial", 14, Font.BOLD , BaseColor.BLACK);
    p=new Paragraph("\nClient background :",font);
    
    com.itextpdf.text.List unorderedList = new com.itextpdf.text.List(com.itextpdf.text.List.UNORDERED);
   // unorderedList.setListSymbol("\u2022");
    
    font =FontFactory.getFont("Arial", 14, (new BaseColor(r, g, b)));
    Phrase phrase;
    
    phrase=new Phrase();
    Chunk c=new Chunk("Rs."+apDetails.getIncome(),font);//		    
    phrase.add("Income  � ");
    phrase.add(c);
    phrase.add(" per month ");
    unorderedList.add(new ListItem(phrase));

    
    font =FontFactory.getFont("Arial", 14, Font.BOLD , BaseColor.BLACK);		    		    
    Phrase purpose=new Phrase("\nPurpose:",font);
    font =FontFactory.getFont("Arial", 14,BaseColor.BLACK);
    c=new Chunk(" Tax saving ",font);//
    purpose.add(c);
    
    
 /*   font =FontFactory.getFont("Arial", 14, Font.BOLD , BaseColor.BLACK);		    		    
    Phrase purpose1=new Phrase("\nScript:",font);
    font =FontFactory.getFont("Arial", 14,BaseColor.BLACK);
    c=new Chunk(" TAX Planning � Need / Advantages / Process / Things to remember / Cost",font);//
    purpose1.add(c);
    
    font =FontFactory.getFont("Arial", 14, Font.BOLD , BaseColor.BLACK);		    		    
    Phrase purpose2=new Phrase("\nRevenue Possible:",font);
    font =FontFactory.getFont("Arial", 14,BaseColor.BLACK);
    Font font1 =FontFactory.getFont("Arial", 14,(new BaseColor(r, g, b)));
    c=new Chunk(" Rs.1000/- ",font1);//
    purpose2.add(c);*/
    
    try {
    	doc.add(p);
		doc.add(unorderedList);
		doc.add(purpose);
//		doc.add(purpose1);
//		doc.add(purpose2);
	} catch (DocumentException e) {
		// TODO Auto-generated catch block
		logger.error(e);
	}
    return doc;
}

public static Document fillOpportunityWill(Document doc, Paragraph p) {

	Font font = FontFactory.getFont("Arial", 14,
			Font.BOLD | Font.UNDERLINE, BaseColor.BLACK);
	addEmptyLine(p, 1);
	p = new Paragraph("Opportunity 6:", font);

	com.itextpdf.text.List unorderedList = new com.itextpdf.text.List(
			com.itextpdf.text.List.UNORDERED);
	// unorderedList.setListSymbol("\u2022");

	font = FontFactory.getFont("Arial", 14,
			Font.BOLD, (new BaseColor(r, g, b)));
	
	Phrase phrase;
	
	    phrase=new Phrase();
	    		    
	    phrase.add("Will writing for self and spouse");
	    unorderedList.add(new ListItem(phrase));
	    phrase.add("Trust for charitable purposes");
	    unorderedList.add(new ListItem(phrase));
	    
	    
	    font =FontFactory.getFont("Arial", 14, Font.BOLD , BaseColor.BLACK);		    		    
	    Phrase purpose=new Phrase("\nPurpose:",font);
	    font =FontFactory.getFont("Arial", 14,BaseColor.BLACK);
	    Chunk c=new Chunk(" Succession Planning ",font);//
	    purpose.add(c);
	    
	try {
		doc.add(p);
		//doc.add(phrase);
		doc.add(unorderedList);
		//doc.add(purpose);
	} catch (DocumentException e) {
		// TODO Auto-generated catch block
		logger.error(e);
	}
	return doc;
}


public static Document fillClientBackgroundOnWill(Document doc, Paragraph p){
	
	
	Font font =FontFactory.getFont("Arial", 14, Font.BOLD , BaseColor.BLACK);
    p=new Paragraph("\nClient background :",font);
    
    com.itextpdf.text.List unorderedList = new com.itextpdf.text.List(com.itextpdf.text.List.UNORDERED);
   // unorderedList.setListSymbol("\u2022");
    
    font =FontFactory.getFont("Arial", 14, Font.BOLD, (new BaseColor(r, g, b)));
    Phrase phrase;
    
    phrase=new Phrase();
    Chunk c=new Chunk(apDetails.getSuccessionScore(),font);//		    
    phrase.add("Client rates confidence on passing on assets easily -");
    phrase.add(c);
    unorderedList.add(new ListItem(phrase));
    
    phrase=new Phrase();
    c=new Chunk(apDetails.getTotalDependent(),font);//	
    phrase.add(c);
    phrase.add(" dependents -");
    c=new Chunk(apDetails.getMinors(),font);//
    phrase.add(c);
    phrase.add(" minor children and spouse ");
    unorderedList.add(new ListItem(phrase));
    
    phrase=new Phrase();
    c=new Chunk(apDetails.getTotalAssets(),font);//		    
    phrase.add("Assets held worth - Rs.");
    phrase.add(c);
    unorderedList.add(new ListItem(phrase));
    
    phrase=new Phrase();
    c=new Chunk(apDetails.getLi(),font);//		    
    phrase.add("Insurance available -Rs.");
    phrase.add(c);
    phrase.add(" and Insurance recommended -Rs.");
    c=new Chunk(apDetails.getIdealLi(),font);//
    phrase.add(c);
    unorderedList.add(new ListItem(phrase));
    
    phrase=new Phrase();
    c=new Chunk(apDetails.getLoanCount(),font);//		    
    phrase.add("Servicing ");
    phrase.add(c);
    phrase.add(" loans");
    unorderedList.add(new ListItem(phrase));
    
    
    phrase=new Phrase();
    phrase.add("Has children related goal and creation of a charitable trust ");
    unorderedList.add(new ListItem(phrase));
    
    phrase=new Phrase();
    phrase.add( apDetails.getHasWill()+" Will /"+ apDetails.getPoa()+" POA / All assets "+ apDetails.getInvestmentJointlyHeld()+" jointly held ");
    unorderedList.add(new ListItem(phrase));

    
    font =FontFactory.getFont("Arial", 14, Font.BOLD , BaseColor.BLACK);		    		    
    Phrase purpose2=new Phrase("\nRevenue Possible:",font);
    font =FontFactory.getFont("Arial", 14,BaseColor.BLACK);
    Font font1 =FontFactory.getFont("Arial", 14,(new BaseColor(r, g, b)));
    c=new Chunk("Rs. "+apDetails.getWillRevenue(),font1);//
    purpose2.add(c);
    c=new Chunk(" on Will and ",font);//
    purpose2.add(c);
    c=new Chunk("Rs. "+apDetails.getTrustRevenue(),font1);//
    purpose2.add(c);
    c=new Chunk(" for trust creation ",font);//
    purpose2.add(c);
    
    try {
    	doc.add(p);
		doc.add(unorderedList);
		doc.add(purpose2);
	} catch (DocumentException e) {
		// TODO Auto-generated catch block
		logger.error(e);
	}
    return doc;
}
private static Document emergencyScript(Document doc){
	
	Font font =FontFactory.getFont("Arial", 14,Font.BOLD,BaseColor.BLACK );
	Paragraph pa=new Paragraph("\nTranscript:",font);
	 font =FontFactory.getFont("Arial", 14,(new BaseColor(r, g, b)));
	Chunk c=new Chunk(apDetails.getName(),font);
    Phrase p=new Phrase();
    p.add(c);
    p.add(" we understand you have mentioned that you are ");
    
    String emrgencyScore="";    
    if(apDetails.getEmrgencyScore().equals("0") || apDetails.getEmrgencyScore().equals("1")){
    	emrgencyScore="extremely uncomfortable";
    }else if (apDetails.getEmrgencyScore().equals("2")){
    	emrgencyScore="uncomfortable";
    }else if (apDetails.getEmrgencyScore().equals("3")){
    	emrgencyScore="ok";
    }else if (apDetails.getEmrgencyScore().equals("4")){
    	emrgencyScore="comfortable";
    }else if (apDetails.getEmrgencyScore().equals("5")){
    	emrgencyScore="very comfortable";
    }	
    c=new Chunk(emrgencyScore,font);
    p.add(c);
    p.add(" with how prepared you are for emergencies. We come to know you have had some ");
    c=new Chunk(apDetails.getEmergencies(),font);
    p.add(c);
    p.add(" related emergencies in the past and found it");
    c=new Chunk(" difficult ",font);
    p.add(c);
   
    p.add("to handle them. You say you will probably be able to manage only months");
    
    c=new Chunk(apDetails.getManagebleMonths(),font);
    p.add(c);
    p.add(" of expenses without income.\nGiven your experience, you probably know how important it is to be prepared for emergencies."+ "" +
    "It is advisable to keep ");
    c=new Chunk( apDetails.getAdvisableMonths(),font);
    p.add(c);
    p.add(" months of your expenses aside for handling emergencies. This is important to ensure that you don't "+
    "end up borrowing or selling off other assets if some emergency situation does crop up. \nRs.");
    c=new Chunk(apDetails.getMinimumEmergencyFund(),font);
    p.add(c);
    p.add(" will be the amount to cover ");
    c=new Chunk( apDetails.getAdvisableMonths(),font);
    p.add(c);
    p.add(" months of your expenses. Money equivalent to ");
    c=new Chunk(apDetails.getTemp(),font);
    p.add(c);
    p.add(" months expenses which is Rs.");
    c=new Chunk(String.valueOf(Integer.parseInt(apDetails.getMinimumEmergencyFund())/(Integer.parseInt(apDetails.getTemp())+1)),font);
    p.add(c);
    p.add(" can be maintained your savings bank account - preferably in one that you and your spouse "
    		+"jointly hold. The rest can be kept in Fixed deposits or in liquid Mutual funds.");
    
    Paragraph p1=new Paragraph("\nSuggested funds are:\n",FontFactory.getFont("Arial", 14,Font.BOLD,BaseColor.BLACK ));
    c=new Chunk(apDetails.getSuggestedEmergencyFunds(),font);
    p1.add(c);
    
    Paragraph p2=new Paragraph("\nRevenue Possible: Rs.",FontFactory.getFont("Arial", 14,Font.BOLD,BaseColor.BLACK ));
    c=new Chunk(apDetails.getEmergencyRevenue(),font);
    p2.add(c);
    try{
    	doc.add(pa);
    	doc.add(p);
    	doc.add(p1);
    	doc.add(p2);
    }catch (Exception e) {
		// TODO: handle exception
	}
    return doc;
}	
private static Document riskScript(Document doc){
	
	Font font =FontFactory.getFont("Arial", 14,Font.BOLD,BaseColor.BLACK);
	Paragraph pa=new Paragraph("\nTranscript:",font);
	font =FontFactory.getFont("Arial", 14,(new BaseColor(r, g, b)));
	Chunk c=new Chunk(apDetails.getName(),font);
    Phrase p=new Phrase();
    p.add(c);
    p.add(", while preparing for your various goals you are saving and investing money." +
    		"To ensure that the money saved for your future children's education or your own retirement does not get used" +
    		"up if there is a health set back or some other unfortunate event, some form of protection against risks is recommended." +
    		"You would agree that bad things can happen and we are not special in any way that nothing will happen to us." +
    		"But your family, their needs and dreams need not be compromised if we put a risk plan in place." +
    		"\nYou have ");
    c=new Chunk(apDetails.getMinors(),font);
    p.add(c);
    p.add(" minor children apart from your spouse who are dependent on you.");
    
    
    if(!apDetails.getLoanCount().equals("0")){
    	p.add("And you are servicing "+apDetails.getServingLoans());
    }
    p.add(". Do you think a Rs. ");
    c=new Chunk(apDetails.getLi(),font);
    p.add(c);
    p.add(" of life cover is sufficient?" +
    		" How long do you think your family will be able to survive with this sum, after paying off the loans too? Ideally," +
    		"you should have a life cover of Rs. ");
    
    
    
    c=new Chunk(apDetails.getIdealLi(),font);
    p.add(c);
    p.add(" to ensure your family will be safe and secure at all time. The premium for your age will come to about Rs. ");
    c=new Chunk(apDetails.getIdealLiPremium(),font);
    p.add(c);
    p.add(" per annum � less than Rs.");
    
    
    
    c=new Chunk(String.valueOf(Math.round((Float.parseFloat(apDetails.getIdealLiPremium()))/12)),font);
    p.add(c);
    p.add(" a month. You will have to undergo medical tests to take this policy.");
    p.add("\n\nSuggested policy:\n");
    c=new Chunk(apDetails.getSuggestedLIPolicies(),font);
    p.add(c);
    p.add(" \nEmployer provided health insurance is an employment prerequisite to ensure you stay " +
    		"loyal to the company. It is not mandatory and companies can choose to withdraw the " +
    		"benefit anytime. If you happen to change your job, such benefits may or may not be " +
    		"available in your new job." +
    		"\n\n And these days falling sick and disability are big risks. Look at how medical costs have " +
    		"gone up. Apart from life insurance, insurance to cover health related expenses and loss "
    		+"of income in case of disability have become basic necessities."
    		+"Health insurance policies come with a lot of conditions, sub limits, "
    		+"capping, co-pay options. You will have to choose the one most suitable to your requirement."
    		+"We have studied various health insurance policies in the market and according to your needs, the following policies might be suitable.\n\n"
    		);
    c=new Chunk(apDetails.getSuggestedHIPolicies(),font);
    p.add(c);
   /* c=new Chunk("Apollo Munich Optima Restore",font);
    p.add(c);
    c=new Chunk("for you and your spouse",font);
    p.add(c);
    p.add(" - ");
    c=new Chunk("Rs. 5 lacs each",font);
    p.add(c);
    p.add(" � Approx premium ");
    c=new Chunk("Rs. 15000/-",font);
    p.add(c);
    
    p.add("\n\n or \n\n");
    
    
    c=new Chunk("Apollo Munich Optima Restore",font);
    p.add(c);
    c=new Chunk("for you and your spouse",font);
    p.add(c);
    p.add(" - ");
    c=new Chunk("Rs. 5 lacs each",font);
    p.add(c);
    p.add(" � Approx premium ");
    c=new Chunk("Rs. 15000/-",font);
    p.add(c);*/
    
    p.add("\n\nYou should include your children also in this policy. The premium might go up by another ");
    
    c=new Chunk("Rs.8000/-",font);
    p.add(c);
    
    p.add("\n\nDisabilities not only result in expenses, but also in loss of income. Disabilities can "+
    "happens because of critical illnesses like a cancer or heart related problems, which given "+
    "our life style has become so common or because of unfortunate accidents. Not "+
    "suggesting anything would happen, but in the extreme unfortunate event of it "+
    "happening, the impact could be tremendous something we really don�t have to suffer. "+
    "There are insurances to protect against these. Suggest that you take a critical illness policy."
    );
    p.add("\nSuggested policies are:");
    c=new Chunk(apDetails.getSuggestedCIPolicies(),font);
    p.add(c);
    /*p.add(" and also for accident disability insurance, Suggested polices are");
    c=new Chunk(apDetails.getSuggestedAIPolicies(),font);
    p.add(c);*/
//    c=new Chunk("Mr.Patil / Mrs. Patil",font);
//    p.add(c);
//    p.add("�");
//    c=new Chunk("Rs. 10 lacs",font);
//    p.add(c);
//    p.add(" each �Premium");
//    c=new Chunk("Rs. 12000/-.",font);
//    p.add(c);
//    p.add(" Suggested products are");
//    c=new Chunk("<<Choice 1>> / <<Choice 2>>.",font);
//    p.add(c);
//    p.add(" Accidental Disability Insurance");
//    c=new Chunk("Mr. Patil / Mrs.Patil",font);
//    p.add(c);
//    c=new Chunk("Rs. 20 lacs",font);
//    p.add(c);
//    p.add(" each �Premium");
//    c=new Chunk("Rs.4500/-.",font);
//    p.add(c);
//    p.add(" The product name is");
//    c=new Chunk("<<Choice 1>> <<Choice 2>>",font);
//    p.add(c);
    
    Paragraph p2=new Paragraph("\nRevenue Possible: Rs.",FontFactory.getFont("Arial", 14,Font.BOLD,BaseColor.BLACK ));
    c=new Chunk(apDetails.getRiskRevenue(),font);
    p2.add(c);
    try{
    	doc.add(pa);
    	doc.add(p);
    	doc.add(p2);
    }catch (Exception e) {
		// TODO: handle exception
	}
	return doc;	
}
private static Document investmentScript(Document doc){
	Font font =FontFactory.getFont("Arial", 14,BaseColor.BLACK);
	Paragraph pa=new Paragraph("\nTranscript� Investments:",FontFactory.getFont("Arial", 14,Font.BOLD,BaseColor.BLACK));
	 Phrase p=new Phrase();
	 p.add(""+
			"Many things motivate our investments � earning higher returns, saving tax etc. But the " +
			"best motivator and the most logical is achievement of goals. Goal motivated investing " +
			"has higher relevance and usefulness. That�s why we have come up with an investment " +
			"plan that is aligned to your goals." +
			"Depending on what the goal is and how far it is, we can decide where the investment " +
			"has to be made. Usually it is a good idea to invest in two three different assets so that " +
			"the risks of �all eggs in one basket� is reduced. " +
			"The most common asset classes are fixed income assets like FDs / bonds / PO deposits " +
			"etc, equity assets like shares / mutual funds / ULIPs, real estate assets like houses / " +
			"commercial properties etc, gold invested in the form of physical gold / ETFs. Usually a " +
			"combination of these assets in the right mix forms the right portfolio. " +
			"And how much of which asset is decided based on the goal � tenure of the goal and importance of the goal " +
			"etc. It can also depend on your risk profile. " +
			"So, on the basis of the goal and your risk profile we have worked out an investment plan for you." );
	  try{
	    	doc.add(pa);
	    	doc.add(p);
	    }catch (Exception e) {
			// TODO: handle exception
		}
	return doc;
}
private static Document creditScoreScript(Document doc){
	Font font =FontFactory.getFont("Arial", 14,Font.BOLD,BaseColor.BLACK);
	Paragraph pa=new Paragraph("\nTranscript for discussion on credit score:",font);
	 Phrase p=new Phrase();
	 p.add("If you are looking at taking any loans in future, you should get your credit rating "+
			"checked. CIBIL is a rating agency that maintains credit records of all borrowers and " +
			"almost all banks and financial institutions before approving a loan check with CIBIL " +
			"whether the borrower has a good record or not. If in the past you have had any " +
			"problems with loan repayments � not just restricted with repayment but others like " +
			"wrong entry / repaid loans and a/c not closed etc, it will be captured in the CIBIL records " +
			"and will affect your credit scores. " +
			"A good credit score will ensure you get good deals on new loans. To understand what " +
			"your credit score is and to improve your score subscribe to our Credit Ready Plan.");
	 
	 
	  font =FontFactory.getFont("Arial", 14, Font.BOLD , BaseColor.BLACK);		    		    
	    Phrase purpose2=new Phrase("\nRevenue Possible:",font);
	    font =FontFactory.getFont("Arial", 14,BaseColor.BLACK);
	    Chunk c;
	    Font font1 =FontFactory.getFont("Arial", 14,(new BaseColor(r, g, b)));
	    if(!apDetails.getCreditRevenue().equals("0")){
		    c=new Chunk(" Rs."+apDetails.getCreditRevenue(),font1);//
		    purpose2.add(c);
		    c=new Chunk(" for credit rating services ",font);//
		    purpose2.add(c);
	    }
	    if(!apDetails.getCarLoanRevenue().equals("0")){
	    c=new Chunk("+ Rs."+apDetails.getCarLoanRevenue(),font1);//
	    purpose2.add(c);
	    c=new Chunk(" for car loan ",font);//
	    purpose2.add(c);
	    }
	    if(!apDetails.getHomeLoanRevenue().equals("0")){
	    c=new Chunk("+ Rs. "+apDetails.getHomeLoanRevenue(),font1);//
	    purpose2.add(c);
	    c=new Chunk(" home loan",font);//
	    purpose2.add(c);
	    }
	  try{
	    	doc.add(pa);
	    	doc.add(p);
	    	doc.add(purpose2);
	    }catch (Exception e) {
			// TODO: handle exception
		}
	return doc;
}
private static Document loanScript(Document doc){
	Font font =FontFactory.getFont("Arial", 14,BaseColor.BLACK);
	Font font1 =FontFactory.getFont("Arial", 11,BaseColor.BLACK);
	//Paragraph pa=new Paragraph("\nTranscript for discussion on loans:",FontFactory.getFont("Arial", 14,Font.BOLD,BaseColor.BLACK));
	Paragraph pa=new Paragraph("Debt Management:",FontFactory.getFont("Arial", 14,Font.BOLD,(new BaseColor(r, g, b))));
	 Phrase p=new Phrase("",font1);
	 
	 
	 if(Integer.parseInt(apDetails.getLoanPayOffs())>=50 && Float.parseFloat(apDetails.getAge())<=35){
	 p.add("\nYour loan commitments are higher than normally comfortable. "+
			"You can - Consider consolidating your loans by taking a larger lower cost loan and repay the higher cost loans " +
			"-Extend the tenure of loan for a short while, to handle cashflows better " +
			"- Negotiate good deals and repay some loans if possible - " +
			"- Follow debt repayment plans like debt snowballing etc to get out of debt. Subscribe to our debt management services for customised help." );
	 }
	 else if (Integer.parseInt(apDetails.getLoanPayOffs())<50 && Float.parseFloat(apDetails.getAge())<35){
		p.add("\nYour loan commitments seem within normal limits. However getting out of loans sooner can release cashflows that can be used for other beneficial purposes. "+
			"You can - Consider consolidating your loans by taking a larger lower cost loan and repay the higher cost loans "+
			"-Extend the tenure of loan for a short while, to handle cashflows better - Negotiate good deals and repay some loans if possible - "+
			"Follow debt repayment plans like debt snowballing etc to get out of debt. Subscribe to our debt management services for customised help. "
				) ;
	 }
	else if (Integer.parseInt(apDetails.getLoanPayOffs())<35 && Float.parseFloat(apDetails.getAge())>35){
		p.add("\nYour loan commitments seem within normal limits. However getting out of loans sooner can release cashflows that can be used for other beneficial purposes." +
			 		"You can - Consider consolidating your loans by taking a larger lower cost loan and repay the higher cost loans " +
			 		"-Extend the tenure of loan for a short while, to handle cashflows better - Negotiate good deals and repay some loans if possible - " +
			 		"Follow debt repayment plans like debt snowballing etc to get out of debt. Subscribe to our debt management ervices for customised help.");
		 }
	else if (Integer.parseInt(apDetails.getLoanPayOffs())>35 && Float.parseFloat(apDetails.getAge())>35){
		 p.add("\nYour loan commitments are higher than normally comfortable. You can - Consider consolidating your loans by taking a larger lower cost loan  " +
			 "and repay the higher cost loans -Extend the tenure of loan for a short while, to handle cashflows better - Negotiate good deals and repay some loans  " +
			 "if possible. - Follow debt repayment plans like debt snowballing etc to get out of debt. Subscribe to our debt management services for customised help.");
	}
	 
	 if(!apDetails.getIsPlaningToTakeLoans().equals("")){
		 p.add("\n\nIf you are looking at taking any loans in future, you should get your credit rating checked. "
				 +"A good credit score will ensure you get good deals on new loans. To understand what your credit "
				 +"score is and to improve your score subscribe to our Credit Ready Plan.");
		 
		 if(apDetails.getIsPlaningToTakeLoans().contains("Home loan") || apDetails.getIsPlaningToTakeLoans().contains("Buy Home")){
			 		p.add("Who can provide loans? Banks and NBFCs provide home loans. Interest rates :"
					 +"Currently the rate of interest is in the range of 10.25% to 12%. Rates keep changing. "
					 +"A higher credit scores can help you get loans from institutions that offer at lower rates. "
					 +"Interest options : Fixed or floating. Fixed rate of a period of 1 year / 3 years is available. "
					 +"But after that period all loans are of floating rate, meaning the interest rate is subject to "
					 +"change on existing loans. When interest rates change your EMI or the remaining tenure will change. " 
					 +"Costs : Processing fee - 0.50% of loan amount and Franking charges of 0.20% of loan amount. " 
					 +"No charges for pre-payment of loan if repaid from own funds.  Tenure - Maximum 25 years. " 
					 +"Documents needed -  ID and Address proof, Salary slip for last 6 months, Bank statement, Property papers. "); 
		 }
		 if(apDetails.getIsPlaningToTakeLoans().contains("Car loan") || apDetails.getIsPlaningToTakeLoans().contains("Buy Car")){
			 
		 }
		 if(apDetails.getIsPlaningToTakeLoans().contains("Personal loan") || apDetails.getIsPlaningToTakeLoans().contains("to go on holiday")){
			 p.add("A Personal Loan is taken by a borrower for his/her individual needs; it is an unsecured loan, "
					 +"no collateral is given against it, purpose of use of money does not matter Who can provide loans? "
					 +"Banks and NBFCs provide home loans. �Interest rates : 14% - 22%. Depends on the applicant's and "
					 +"employer's profile. Costs :�Processing fee varies in the range of 1-3%. Pre-closure charges: 2% - 4%. "
					 +"Tenure : 12-60 months Documents needed -�ID and Address proof, Income proof, Bank statements for last 6 months etc."); 
		 }
		 if(apDetails.getIsPlaningToTakeLoans().contains("Business loans") || apDetails.getIsPlaningToTakeLoans().contains("Business expansion")){
			 p.add("\n\nBusiness loans are given to small and medium enterprises for working capital, expansion, "
					 +"or modernization of existing business. It can be availed as secured or unsecured loan. "
					 +"Who can provide Loans:Banks and NBFCs. Interest rates:  14% - 22%. Costs: Processing fee 2% of "
					 +"the loan amount. Pre-closure charges: It ranges between 3% - 4% of outstanding loan amount. "
					 +"Tenure: Maximum 3 years. Documents needed: KYC, Financial papers like P&L, Balance Sheet etc, "
					 +"ITR for last three years and Bank statement."); 
		 }
		 if(apDetails.getIsPlaningToTakeLoans().contains("Credit cards") || apDetails.getIsPlaningToTakeLoans().contains("Private borrowing") ||
				 apDetails.getIsPlaningToTakeLoans().contains("Others")){
				 p.add("Loans can be availed from banks or non banking finance companies or other financial institutions.  "
					 +"Interest rates and costs will have to be negotiated with the lender. Most loans are available for  "
					 +"a maximum period of 5 years. Documents needed for taking a loan include KYC papers, Income proof,  "
					 +"Identity proof, Address proof to establish credibility and ability to repay. The lenders might check  "
					 +"your credit history to validate your intention to repay."); 
		 }
	 }
	  try{
		  doc.add(new Paragraph("\n\n"));
	    	doc.add(pa);
	    	doc.add(p);
	    }catch (Exception e) {
			// TODO: handle exception
		}
	return doc;
}
private static Document taxScript(Document doc){
	Font font =FontFactory.getFont("Arial", 14,BaseColor.BLACK);
	Font font1 =FontFactory.getFont("Arial", 11,BaseColor.BLACK);
	Paragraph pa=new Paragraph("Tax Planning:",FontFactory.getFont("Arial", 14,Font.BOLD ,(new BaseColor(r, g, b))));
	 Phrase p=new Phrase("",font1);
	 
	 if(Float.parseFloat(apDetails.getIncome())>500000){
		 p.add("\nAll income earned is taxable, but with some deductibles and exemptions. "+
				"You will have to calculate your income, pay tax on it and e-file your tax " +
				"returns every year. You can redesing your salary or income to save some taxes. " +
				"You can save tax u/s 24B if you are repaying home loans, u/s 80C if you make investments in EPF " +
				"/ PPF / Insurance policies / Tax saving mutual funds / some Post office schemes, u/s 80D " +
				"if you have health insurance. Subscribe to our Tax Planning services to avail customised services. " +
				"Last date for filing tax returns in 31st July every year." );
	 }else{
		 p.add("\nAll income earned is taxable, but with some deductibles and exemptions. You will have to calculate your income, "+
					"pay tax on it and file your tax returns every year. You can redesing your salary or income to save some taxes. " +
					"You can save tax u/s 24B if you are repaying home loans, u/s 80C if you make investments in EPF / PPF / Insurance policies / " +
					"Tax saving mutual funds / some Post office schemes, u/s 80D if you have health insurance. Subscribe to our Tax Planning " +
					"services to avail customised services. Last date for filing tax returns in 31st July every year.");
	 }
//	 Chunk c;
//	 Paragraph p2=new Paragraph("\nRevenue Possible: Rs.",FontFactory.getFont("Arial", 14,Font.BOLD,BaseColor.BLACK ));
//	 c=new Chunk(apDetails.getTaxRevenue(),FontFactory.getFont("Arial", 14,(new BaseColor(r, g, b)) ));
//	  p2.add(c);
	  try{
		  doc.add(new Paragraph("\n\n"));
	    	doc.add(pa);
	    	doc.add(p);
//	    	doc.add(p2);
	    }catch (Exception e) {
			// TODO: handle exception
		}
	  
	return doc;
}
/*private static Document successionScript(Document doc){
	Font font =FontFactory.getFont("Arial", 14,BaseColor.BLACK);
	Paragraph pa=new Paragraph("\nTranscript for discussion on Succession:",FontFactory.getFont("Arial", 14,Font.BOLD,BaseColor.BLACK));
	 Phrase p=new Phrase();
	 
	p.add(apDetails.getName()+ "�you have mentioned your desire to start a charitable trust that will support "+
		"street children. Both your children are minors and your spouse is a homemaker. You "+
		"have movable and immovable assets that you largely hold in your name and are also " +
		"servicing loans. I really wish you a long and healthy life, but for a moment imagine if " +
		"something happens to you how comfortable will your family be. Will they have access to " +
		"all your assets, will your spouse be able to decide how she should use the insurance " +
		"proceeds when she gets them, will your lenders get back their money and let your family " +
		"keep the assets, will your parents get support, what will happen to the charitable cause? " +
		"All the hard work that we do to earn money, save and accumulate assets is for the well " +
		"being of the family. If you don�t want to leave anything to chance, you should do a "+
		"proper Succession Plan for your assets. We recommend you to check nominations and " +
		"holding pattern on all your investments, write a Will, create that trust right away and " +
		"start investing through the trust. As a responsible parent, son and citizen this " +
		"something you owe to your family.");
	
		Chunk c;
		Paragraph p2=new Paragraph("\nRevenue Possible: Rs.",FontFactory.getFont("Arial", 14,Font.BOLD,BaseColor.BLACK ));
		c=new Chunk(apDetails.getTaxRevenue(),FontFactory.getFont("Arial", 14,(new BaseColor(r, g, b)) ));
		p2.add(c);
	  try{
	    	doc.add(pa);
	    	doc.add(p);
//	    	doc.add(p2);
	    }catch (Exception e) {
			// TODO: handle exception
		}
	  
	return doc;
}*/
private static PdfPTable  FillValuesForInvestments(PdfPTable table,List<APDetails> investmentsList){
	 //Font font = new Font(FontFamily.TIMES_ROMAN, 8, Font.BOLD, BaseColor.BLACK);
	 Font font =  FontFactory.getFont("Arial", 8, Font.NORMAL , BaseColor.BLACK);
	PdfPCell cell; 
	int i=1;
	for (APDetails investments :  investmentsList){
//		cell=new PdfPCell(new Phrase(String.valueOf(i),font));
//		table.addCell(cell);
//		
		cell=new PdfPCell(new Phrase(investments.getProductName1(),font));
		table.addCell(cell);
		
		String invAmount=investments.getProduct1Amount().trim();
		if(invAmount.equals("Rs.0")){
			invAmount="Seek Information from insurance Company";
		}
		
		cell=new PdfPCell(new Phrase(invAmount ,font));
		table.addCell(cell);					
	}
	logger.info(" Data filled...");
	return table; 
}
private static PdfPTable  FillValuesForRisk(PdfPTable table,List<APDetails> riskList){
	 //Font font = new Font(FontFamily.TIMES_ROMAN, 8, Font.BOLD, BaseColor.BLACK);
	 Font font =  FontFactory.getFont("Arial", 8, Font.NORMAL , BaseColor.BLACK);
	PdfPCell cell; 
	int i=1;
	for (APDetails risk :  riskList){
//		cell=new PdfPCell(new Phrase(String.valueOf(i),font));
//		table.addCell(cell);
//		
		cell=new PdfPCell(new Phrase(risk.getProductName1(),font));
		table.addCell(cell);
		
		cell=new PdfPCell(new Phrase(risk.getProductName2() ,font));
		table.addCell(cell);	
		cell=new PdfPCell(new Phrase(risk.getProductName3(),font));
		table.addCell(cell);
		
		cell=new PdfPCell(new Phrase(risk.getProductName4() ,font));
		table.addCell(cell);	
		
	}
	logger.info(" Data filled...");
	return table; 
}

private static PdfPTable  FillValuesForGoal(PdfPTable table,List<APDetails> goalList){
	 //Font font = new Font(FontFamily.TIMES_ROMAN, 8, Font.BOLD, BaseColor.BLACK);
	 Font font =  FontFactory.getFont("Arial", 8, Font.NORMAL , BaseColor.BLACK);
	PdfPCell cell; 
	int i=1;
	for (APDetails goals :  goalList){
//		cell=new PdfPCell(new Phrase(String.valueOf(i),font));
//		table.addCell(cell);
//		
		cell=new PdfPCell(new Phrase(goals.getName(),font));
		table.addCell(cell);
		
		cell=new PdfPCell(new Phrase(goals.getCoverTerm() ,font));
		table.addCell(cell);
		
		cell=new PdfPCell(new Phrase(goals.getAmountInvolved(),font));
		table.addCell(cell);
		
		
		String invtype = goals.getInvestmentType();
			Paragraph p1=new Paragraph("",font);
				
	    	for(String str:invtype.split("(?<=[%])")){
	    		  str=str.replaceAll("\\p{Z}","");
	    		p1.add(str+"\n\n");
		   }
	    	
	    	
		cell=new PdfPCell(p1);
		table.addCell(cell);
		
		
//		
//		cell=new PdfPCell(new Phrase(goals.getInvestmentType(),font));
//		table.addCell(cell);
		String products=goals.getChildrenNames().substring(0, goals.getChildrenNames().length()-1);
		
//		Paragraph p=new Paragraph();
//		p.add("\nbye");
//		p.add("\nbye");
		
		
		Paragraph p=new Paragraph("",font);
		for(String str:products.split("%")){
			logger.info("-----------------------sttr-----------"+str);
			p.add(str+"\n\n");	
		}
//		cell=new PdfPCell(new Paragraph(products,font));
		cell=new PdfPCell(p);
		table.addCell(cell);
			
		
		
		
	}
	logger.info(" Data filled...");
	return table; 
}


private static Document successionScript(Document doc){
	Font font =FontFactory.getFont("Arial", 14,Font.BOLD, (new BaseColor(r, g, b)));
	Paragraph pa=new Paragraph("Succession Planning:",font);
	 Font font1 =FontFactory.getFont("Arial", 11,Font.BOLD, BaseColor.BLACK);
	 Phrase p=new Phrase("\nHolding pattern of assets:",font1);
	 Font font2 =FontFactory.getFont("Arial", 10, BaseColor.BLACK);
	 Phrase phrase=new Phrase("",font2);
	 if(apDetails.getInvestmentJointlyHeld().equals("Yes")){
		 phrase.add("\n\nJoint holding will ensure access to atleast one of you in case there is an emergency need for the money. "+
				"If many investments are singly held there is a possibility that it may remain inaccessible when needed." +
				"It is good that you have your investments in joint holding.  In case some investments are very old,  " +
				"you may want to check the holding pattern and make changes wherever applicable.  However anyone or " +
				"survivor joint holding is not to be confused with ownership. In the event of the demise of one of " +
				"the holders, the other does not become the sole owner, rather the share of the deceased holder will " +
				"have to be distributed accordingly to his Will or the Law. " );
	 }else{
		 phrase.add("\n\nJoint holding will ensure access to atleast one of you in case there is an emergency need for the money. "+
					"If many investments are singly held there is a possibility that it may remain inaccessible when needed. " +
					"Please approach all institutions who hold your investments and provide instructions to convert your investments " +
					"into jointly held - either or survivor mode. However anyone or survivor joint holding is not be confused with ownership. " +
					"In the event of the demise of one of the holders, the other does not become the sole owner, rather the share of the"+
					"deceased holder will have to be distributed accordingly to his Will or the Law.");
	 }
	 
	 try{
		 doc.add(new Paragraph("\n\n"));
		  	doc.add(pa);
	    	doc.add(p);
	    	doc.add(phrase);
	    }catch (Exception e) {
			// TODO: handle exception
		}

	  p=new Phrase("\n\nKeeping family informed:",font1);
	  phrase=new Phrase("",font2);

	 if(apDetails.getFamilyAwareness().equals("Yes")){
		 phrase.add("\n\nYour family for whose use you have accumulated all the assets need to have knowledge of "+
				"what is available and where it is accessible. Preparing a list of all your assets might be" +
				"a very good idea. Better still will be preparing a detailed Will. Subscribe to our Succession  " +
				"Planning services for preparing a legally sound and comprehensively well thought out Will from the comforts of your home. " );
	 }else{
		 phrase.add("\n\nYour family for whose use you have accumulated all the assets need to have knowledge of what is "+
					"available and where it is accessible. Preparing a list of all your assets might be a very good idea. " +
					"A still better idea will be preparing a detailed Will. Subscribe to our Succession Planning services " +
					"for preparing a legally sound and comprehensively well thought out Will from the comforts of your home.");
	 }
	 
	 try{
	    	doc.add(p);
	    	doc.add(phrase);
	    }catch (Exception e) {
			// TODO: handle exception
		}
	 
	 p=new Phrase("\n\nPrepare a Will:",font1);
	 phrase=new Phrase("",font2);
	 if(apDetails.getHasWill().equals("Yes")){
		 phrase.add("\n\nA Will is a declaration in a prescribed manner of the intention of the person making it, "+
				"If many investments are singly held there is a possibility that it may remain inaccessible when needed." +
				"It is good that you have your investments in joint holding.  In case some investments are very old,  " +
				"you may want to check the holding pattern and make changes wherever applicable.  However anyone or " +
				"survivor joint holding is not to be confused with ownership. In the event of the demise of one of " +
				"the holders, the other does not become the sole owner, rather the share of the deceased holder will " +
				"have to be distributed accordingly to his Will or the Law. " );
	 }else{
		 phrase.add("\n\nA Will is a declaration in a prescribed manner of the intention of the person making it, with regard to the matters  "+
					"which he wishes to take effect upon or after his death. This is important to ensure that the family and loved ones gain " +
					"easy access to assets built for them without any legal hassles. In this uncertain world, there is no better time than " +
					"NOW to write the Will. Our Succession Planning services can help you in preparing a legally sound and comprehensively " +
					"well thought out Will through a highly secure and robust online platform. ");
	 }
	 
	 phrase.add("\n\nSubscribe to our Succession Planning services for preparing a legally sound and comprehensively" +
	 		" well thought out Will from the comforts of your home.\n\n");
	 phrase.add("A Power of Attorney is a legal right you give someone to act on your behalf in case you are not " +
	 		"available or in a position to act. This can be general POA to act on all matters or a restricted " +
	 		"POA to act only under certain circumstances. If you are traveling extensively, authorizing someone " +
	 		"to work on your behalf in case you cannot do it on your own, will ensure that your work will not be " +
	 		"affected because of your unavailability. Also in the case of disability, access to your assets " +
	 		"will not be denied if POA is available. At the same time a POA in the wrong hands can turn out to be dangerous. " +
	 		"You may want to check the conditions in your POA and ensure they are updated and relevant.");
	 
	 try{
	    	doc.add(p);
	    	doc.add(phrase);
	    }catch (Exception e) {
			// TODO: handle exception
		}
	 
	 
//	 if(apDetails.getPoa().equals("Given")){
//		 p.add("A Power of Attorney is a legal right you give someone to act on your behalf in case you are not available or in a position to act. "+
//				"This can be general POA to act on all matters or a restricted POA to act only under certain circumstances. If you are travelling " +
//				"extensively this will come in handy to your family. Also in case of a disability, access to your assets will not be denied if a POA " +
//				"is available. At the same time a POA in the wrong hands can turn out dangerous. You may want to check the conditions in your POA " +
//				"survivor joint holding is not to be confused with ownership. In the event of the demise of one of " +
//				"and ensure they are updated and relevant.");
//	 }else{
//		 p.add("If you often travel abroad or stay in different city/state from your family then authorizing someone to work on your behalf  "+
//					"in case you cannot do it on your own, will ensure that your work will not be affect because of your unavailability. A Power of " +
//					"Attorney is a legal right you give someone to act on your behalf in case you are not available or in a position to act." +
//					"This can be general POA to act on all matters or a restricted POA to act only under certain circumstances.");
//	 }
	 
	 Paragraph pa1=new Paragraph("\n\nDisclaimer:",font);
	 Phrase p1=new Phrase("",font2);
	 p1.add("\nThis document is prepared on a proprietary algorithm-based technological Platform owned and maintained by FIINFRA. This document is based entirely on the information provided"+
	 "by you or your Distributor. Despite our best efforts, due care and precautions, there may be some variables used in generation of this document which have not been unaccounted for,"+
	 "or miscalculated, by the Platform. FIINFRA cannot and shall not be held liable for any pecuniary or non-pecuniary harm caused to you, your Distributor or any third party if the"+
	 "contents of this document are relied upon for any decision, or represented or disseminated further, whether correctly or incorrectly. The contents of this document do not qualify as"+
	 "investment advice and/or financial planning, or any variant thereof, under India�s applicable regulatory framework, including the Securities and Exchange Board of India (Investment)"+
	 "Adviser) Regulations, 2013, as amended from time to time, and FIINFRA does not assure any financial goals to be attained, any profits to be made, or losses to be avoided, whether "+
	 "directly, indirectly, incidentally or consequentially, by you or your Distributor or any third party, by relying upon this document, or any content therein. Investments are subject to a "+
	 "variety of risks, uncertainties and other factors that could cause actual results to differ materially from expectations as expressed or implied under this document.");
	 
	 	 
	  try{
	    	doc.add(pa1);
	    	doc.add(p1);
	    }catch (Exception e) {
			// TODO: handle exception
		}
	  
	  
	  
	return doc;
}
}
