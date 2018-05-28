package in.fiinfra.partner.facade;

import java.util.List;

import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;
import javax.ws.rs.QueryParam;
import javax.ws.rs.core.MediaType;

import in.fiinfra.partner.service.PartnerProfileService;
import in.fiinfra.common.common.PartnerProfile;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;

@Controller
@Path(value = "/parterprofile")
public class PartnerProfileController {

	@Autowired
	PartnerProfileService partnerProfileService;

	@GET
	@Path(value = "/profiles")
	@ResponseStatus(HttpStatus.OK)
	@Produces(MediaType.APPLICATION_JSON)
	public @ResponseBody
	List<PartnerProfile> getAllProfiles() {
		return partnerProfileService.getAll();
	}

	@GET
	@Path(value = "/info/{id}")
	@Produces(MediaType.APPLICATION_JSON)
	public @ResponseBody
	ResponseEntity<PartnerProfile> getContactProfileInfo(@QueryParam("partyId") int partyId,@QueryParam("buId") int buId,
			@PathParam("token") String token, @PathParam("user") String name) {
		try {
			if (partyId == -1)
				return new ResponseEntity<PartnerProfile>(HttpStatus.BAD_REQUEST);

			PartnerProfile contactProfile = partnerProfileService.load(partyId);

			return new ResponseEntity<PartnerProfile>(contactProfile, HttpStatus.OK);

		} catch (Exception ex) {

			return new ResponseEntity<PartnerProfile>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}

	@POST
	@Path(value = "/create")
	@Produces(MediaType.APPLICATION_JSON)
	public @ResponseBody
	PartnerProfile createContactProfileInfo(@RequestBody PartnerProfile contactProfile) {
		return partnerProfileService.create(contactProfile);
	}

	@POST
	@Path(value = "/update")
	@Produces(MediaType.APPLICATION_JSON)
	public @ResponseBody
	PartnerProfile updateContactProfileInfo(@RequestBody PartnerProfile contactProfile) {
		return partnerProfileService.update(contactProfile);
	}

	@POST
	@Path(value = "/delete/{id}")
	@Produces(MediaType.APPLICATION_JSON)
	public @ResponseBody
	PartnerProfile deleteContactProfileInfo(@PathVariable("id") int profileId) {
		return partnerProfileService.delete(profileId);
	}
}
