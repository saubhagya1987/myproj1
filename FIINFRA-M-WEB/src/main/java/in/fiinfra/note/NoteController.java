package in.fiinfra.note;

import in.fiinfra.common.controller.AbstractController;
import in.fiinfra.common.diy.models.UserSession;
import in.fiinfra.common.note.Note;
import in.fiinfra.common.util.FiinfraConstants;
import in.fiinfra.note.service.NoteService;
import in.fiinfra.query.model.NoteRequest;

import java.util.ArrayList;
import java.util.List;

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


	@RequestMapping(value = "/note", method = RequestMethod.GET)
	public String viewNote(Model m, NoteRequest q, HttpServletRequest request) {
		if(!validSession(request)){
			return redirectToLogin();
		}
		UserSession userSession = null;
		if(request !=null)
		{
			userSession = (UserSession) request.getSession().getAttribute("userSession");			
		}
		NoteService service = getRestService(NoteService.class);
		List<Note> lstNote = service.listNote(q);
		m.addAttribute("noteHistory", lstNote);
		m.addAttribute("returnUrl", q.getReturnUrl());
		Note newNote = new Note();
		newNote.setRefId(q.getRefId());
		newNote.setRefTypeId(q.getRefTypeId());
		newNote.setPartyId(q.getPartyId());
		newNote.setCreatedBy(userSession.getUserId());
		newNote.setModifiedBy(userSession.getUserId());
		String headerName = request.getParameter("headerName");
		if(headerName != null) {
			if(headerName.equals("income"))
				m.addAttribute("hdname", " : My Income");
			else if(headerName.equals("expense"))
				m.addAttribute("hdname", " : My Expenses");
			else if(headerName.equals("income"))
				m.addAttribute("hdname", " : My Loans");			
		}
		m.addAttribute("note", newNote);
		m.addAttribute("partyId", q.getPartyId());
		return "notes/note";
	}
	
	@RequestMapping(value = "/editNote", method = RequestMethod.GET)
	public String editNote(Model m, Note note, HttpServletRequest request) {
		if(!validSession(request)){
			return redirectToLogin();
		}
		UserSession userSession = null;
		if(request !=null)
		{
			userSession = (UserSession) request.getSession().getAttribute("userSession");			
		}
		NoteService service = getRestService(NoteService.class);
		List<Note> lstNote = new ArrayList<Note>();
		m.addAttribute("noteHistory", lstNote);
		m.addAttribute("returnUrl", request.getParameter("returnUrl"));		
		m.addAttribute("note", note);
		m.addAttribute("partyId", note.getPartyId());
		return "notes/note";
	}
	

	@RequestMapping(value = "/deleteNote", method = RequestMethod.GET)
	public String deleteNote(Model m, NoteRequest q, HttpServletRequest request,RedirectAttributes redirectAttributes) {
		if(!validSession(request)){
			return redirectToLogin();
		}
		UserSession userSession = null;
		if(request !=null)
		{
			userSession = (UserSession) request.getSession().getAttribute("userSession");			
		}
		NoteService service = getRestService(NoteService.class);
		q.setBuId(userSession.getBuId());		
		String result = service.deleteNote(q);		
		redirectAttributes.addFlashAttribute("success", "success.deleteNoteSuccess");
		
		return "redirect:"+q.getReturnUrl();		
	}
	

	@RequestMapping(value = "/save", method = RequestMethod.POST)
	public String createNote(@ModelAttribute("note") Note note,
			BindingResult result, Model m, final RedirectAttributes redirectAttributes,HttpServletRequest request,
			BindingResult bindingResult,
			HttpServletResponse response) {
		if(!validSession(request)){
			return redirectToLogin();
		}

		String returnUrl = request.getParameter("returnUrl");
		StringBuilder error = new StringBuilder();
		
		
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
			return "notes/note";
		}

		UserSession user = AbstractController.getSessionUser();
		int createdBy = user.getUserId();
		if(note.getNoteId()!=null && note.getNoteId()>0){
			note.setModifiedBy(user.getUserId());	
		}
		else{
			//note.setPartyId(user.getUserId());
			note.setCreatedBy(createdBy);	
		}
		NoteService service = getRestService(NoteService.class);
		service.addUpdateNote(note);
		redirectAttributes.addFlashAttribute("success", "success.dataSaveSuccess");

		return "redirect:"+returnUrl;
		
	}

}
