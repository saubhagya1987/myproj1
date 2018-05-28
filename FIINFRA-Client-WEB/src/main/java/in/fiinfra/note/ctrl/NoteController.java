package in.fiinfra.note.ctrl;

import in.fiinfra.common.diy.models.UserSession;
import in.fiinfra.common.note.Note;
import in.fiinfra.cp.common.ctrl.AbstractController;
import in.fiinfra.cp.common.model.NoteRequest;
import in.fiinfra.note.service.NoteService;

import java.util.List;
import in.fiinfra.cp.common.util.Link;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping(value = "/notes")
public class NoteController extends AbstractController {
	@Link(label="Notes", family="Notes", parent = "" )
	@RequestMapping(value = "/note", method = RequestMethod.GET)
	public String viewNote(Model m, NoteRequest q) {

		NoteService service = getRestService(NoteService.class);
		List<Note> lstNote = service.listNote(q);
		m.addAttribute("noteHistory", lstNote);
		if(q.getReturnUrl()!=null)
		{
		m.addAttribute("returnUrl", q.getReturnUrl());
		}
		else 
		{
			m.addAttribute("returnUrl", "/profile/home");
		}
		if(StringUtils.equals(q.getReturnUrl(),"/financial/myIncome"))
		{
		m.addAttribute("noteMsg", "Income");
		m.asMap().put("currentPage","cashflow");
		}
		else if(StringUtils.equals(q.getReturnUrl(),"/financial/myExpenses"))
		{
		m.addAttribute("noteMsg", "Expenses");
		m.asMap().put("currentPage","cashflow");
		}
		else if(StringUtils.equals(q.getReturnUrl(),"/portfolio/myLoan"))
		{
		m.addAttribute("noteMsg", "Loan");
		m.asMap().put("currentPage","portfolio");
		}
		else if(StringUtils.equals(q.getReturnUrl(),"/portfolio/myPlans"))
		{
		m.addAttribute("noteMsg", "Plan");
		m.asMap().put("currentPage","plan");
		
		}
		else
		{
		m.addAttribute("noteMsg", " ");
		}
		Note newNote = new Note();
		newNote.setRefId(q.getRefId());
		newNote.setRefTypeId(q.getRefTypeId());
		m.addAttribute("note", newNote);
		return "cp/note";
	}

	/*@RequestMapping(value = "/save", method = RequestMethod.POST)
	public String createNote(@ModelAttribute("note") Note note,
			BindingResult result, Model m,
			final RedirectAttributes redirectAttributes,
			HttpServletRequest request, BindingResult bindingResult,
			HttpServletResponse response) {
		String returnUrl = request.getParameter("returnUrl");
		note.setRefTypeId(1);
		note.setRefId(1);
		note.setSectionId(1);

		if (note.getRefId() == null || note.getRefTypeId() == null) {
			bindingResult
					.addError(new ObjectError("note", "Invalid RefId/Type"));
		}

		if (StringUtils.isEmpty(note.getTitle())) {
			bindingResult.addError(new FieldError("note", "title",
					"Empty Title"));
		}
		if (StringUtils.isEmpty(note.getDescription())) {
			bindingResult.addError(new FieldError("note", "description",
					"Empty Description"));
		}

		if (bindingResult.hasErrors()) {
			return "notes/note";
		}

		UserSession user = AbstractController.getSessionUser();
		int createdBy = user.getPartyId();
		if (note.getNoteId() != null && note.getNoteId() > 0) {
			note.setModifiedBy(user.getPartyId());
		} else {
			note.setPartyId(user.getPartyId());
			note.setCreatedBy(createdBy);
		}

		NoteService service = getBean(NoteService.class);
		service.addUpdateNote(note);

		return "redirect:/notes/note" + returnUrl ;

	}
*/
	@RequestMapping(value = "/save", method = RequestMethod.POST)
	public String createNote(@ModelAttribute("note") Note note,
			BindingResult result, Model m, final RedirectAttributes redirectAttributes,HttpServletRequest request,
			BindingResult bindingResult,
			HttpServletResponse response) {
		

		String returnUrl = request.getParameter("returnUrl");
		StringBuilder error = new StringBuilder();
		UserSession user = AbstractController.getSessionUser();
		
		NoteService service = getRestService(NoteService.class);
		NoteRequest q = new NoteRequest();
		q.setRefId(note.getRefId());
		q.setRefTypeId(note.getRefTypeId());
		q.setReturnUrl(returnUrl);
		q.setPartyId(user.getPartyId());
		
		if(note.getRefId() ==null || note.getRefTypeId() ==null){
			error.append("Invalid RefId/Type").append("\n");
			bindingResult.addError(new ObjectError("note", "Invalid RefId/Type"));
		}

		if(StringUtils.isEmpty(note.getTitle())){
			error.append("Empty Title").append("\n");
			bindingResult.addError(new FieldError("note","title", "Empty Title"));
		}
		if(StringUtils.isEmpty(note.getDescription())){
			error.append("Empty Description").append("\n");
			bindingResult.addError(new FieldError("note","description", "Empty Description"));
		}
		
		if(bindingResult.hasErrors()){
			m.addAttribute("error", error.toString());
			 
			List<Note> lstNote = service.listNote(q);
			m.addAttribute("noteHistory", lstNote);
			m.addAttribute("returnUrl", q.getReturnUrl());

			return "cp/note";
		}


		int createdBy = user.getUserId();
		if(note.getNoteId()!=null && note.getNoteId()>0){
			note.setModifiedBy(user.getUserId());	
		}
		else{
			note.setPartyId(user.getPartyId());
			note.setCreatedBy(createdBy);	
		}
		
		service.addUpdateNote(note);
		redirectAttributes.addFlashAttribute("success", getMessage("success.note.save"));

		return "redirect:"+returnUrl;
		
	}

}
