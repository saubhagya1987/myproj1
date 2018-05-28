package in.fiinfra.utility.facade;

import com.itextpdf.text.Document;
import com.itextpdf.text.Element;
import com.itextpdf.text.Image;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.Phrase;
import com.itextpdf.text.Rectangle;
import com.itextpdf.text.pdf.ColumnText;
import com.itextpdf.text.pdf.PdfPCell;
import com.itextpdf.text.pdf.PdfPTable;
import com.itextpdf.text.pdf.PdfPageEventHelper;
import com.itextpdf.text.pdf.PdfWriter;

public class HeaderFooter extends PdfPageEventHelper {
	 /** Alternating phrase for the header. */
    Phrase[] header = new Phrase[2];
    /** Current page number (will be reset for every chapter). */
    int pagenumber;
    PdfPTable table = new PdfPTable(1);
    /**
     * Initialize one of the headers.
     * @see com.itextpdf.text.pdf.PdfPageEventHelper#onOpenDocument(
     *      com.itextpdf.text.pdf.PdfWriter, com.itextpdf.text.Document)
     */
    public void onOpenDocument(PdfWriter writer, Document document) {
    	Image img = null;
  	  String path = null;
  	  try {
  	   path = "D:\\Desert.jpg";
  	    //img = Image.getInstance("D:\\ActionPlan.png");
  	   System.out.println("path::::::::::::"+path);
  	  
         img = Image.getInstance(path);
  	   //img = Image.getInstance(path);
  	   img.scaleToFit(200, 150);
  	   img.setAbsolutePosition(2f, 10f);
  	   img.scaleAbsoluteHeight(100);
  	 img.scaleAbsoluteWidth(150);
//         img.setWidthPercentage(100);
//         img.set
  	  }catch(Exception e){
  		  
  	  }
  	 PdfPCell cell = new PdfPCell(img, true);
	  cell.setBorder(Rectangle.NO_BORDER);
	  table.addCell(cell);
        header[0] = new Phrase("Action Plan");
    }

    /**
     * Initialize one of the headers, based on the chapter title;
     * reset the page number.
     * @see com.itextpdf.text.pdf.PdfPageEventHelper#onChapter(
     *      com.itextpdf.text.pdf.PdfWriter, com.itextpdf.text.Document, float,
     *      com.itextpdf.text.Paragraph)
     */
    public void onChapter(PdfWriter writer, Document document,
            float paragraphPosition, Paragraph title) {
        header[1] = new Phrase(title.getContent());
        pagenumber = 1;
    }

    /**
     * Increase the page number.
     * @see com.itextpdf.text.pdf.PdfPageEventHelper#onStartPage(
     *      com.itextpdf.text.pdf.PdfWriter, com.itextpdf.text.Document)
     */
    public void onStartPage(PdfWriter writer, Document document) {
        pagenumber++;
    }

    /**
     * Adds the header and the footer.
     * @see com.itextpdf.text.pdf.PdfPageEventHelper#onEndPage(
     *      com.itextpdf.text.pdf.PdfWriter, com.itextpdf.text.Document)
     */
    public void onEndPage(PdfWriter writer, Document document) {
        Rectangle rect = writer.getBoxSize("art");
//        switch(writer.getPageNumber() % 2) {
//        case 0:
//            ColumnText.showTextAligned(writer.getDirectContent(),
//                    Element.ALIGN_RIGHT, table,
//                    rect.getRight(), rect.getTop()+35, 0);
//            break;
//        case 1:
//            ColumnText.showTextAligned(writer.getDirectContent(),
//                    Element.ALIGN_RIGHT, table,
//                    rect.getRight(), rect.getTop()+35, 0);
//            break;
//        
//        }
        
//		            table.setTotalWidth(60);
//		            table.setLockedWidth(true);
//		            table.getDefaultCell().setFixedHeight(2);
//		            table.getDefaultCell().setBorder(Rectangle.BOTTOM);
//		            table.getDefaultCell().setHorizontalAlignment(Element.ALIGN_RIGHT);
//		            table.addCell("");
//		            table.writeSelectedRows(0, -1, 0, 845, writer.getDirectContent());
        ColumnText.showTextAligned(writer.getDirectContent(),
                Element.ALIGN_CENTER, new Phrase(String.format("page %d", pagenumber)),
                (rect.getLeft() + rect.getRight()) / 2, rect.getBottom()-28, 0);
    }
}
