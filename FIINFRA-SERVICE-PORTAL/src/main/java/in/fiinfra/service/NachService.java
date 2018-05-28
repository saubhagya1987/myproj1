package in.fiinfra.service;

import in.fiinfra.common.common.DocumentData;
import in.fiinfra.common.common.DocumentRequest;
import in.fiinfra.common.common.GetRequest;
import in.fiinfra.common.common.NachRequest;
import in.fiinfra.common.diy.models.UserSession;
import in.fiinfra.common.service.vo.Partner;
import in.fiinfra.common.util.FiinfraUtility;
import in.fiinfra.pg.AutoPaymentData;
import in.fiinfra.pg.NachData;

import java.io.File;
import java.util.List;

public class NachService extends BasicService {

	public Integer saveNach(NachData nach) {
		return getService().postForObject(Services.saveNach, nach,
				Integer.class, appendPathParam());
	}

	public List<NachData> getNachList(NachRequest req) {
		return getService().getForObjectCollection(Services.getNachList, req,
				NachData.class, appendPathParam());
	}

	public NachData getCurrentNach(NachRequest req) {

		return getService().getForObject(Services.getCurrentNach, req,
				NachData.class, appendPathParam());
	}

	public Integer saveNachDocument(UserSession user, NachData nach)
			throws Exception {
		if (nach.getNachForm() != null) {
			DocumentData document = new DocumentData();
			document.setDocumentStorageLocation(FiinfraUtility
					.getStorageCodeIdFromDocumentRefType(0));
			document.setPartyId(nach.getPartyID());
			document.setCreatedBy(user.getUserId());
			document.setDocumentName("NACH FORM");
			document.setDocumentType(10001);
			document.setBuId(user.getBuId());
			document.setRefId(nach.getNachId());
			document.setRefTypeId(111021);

			String storagePath = getService().getForObject(
					Services.getFileStoragePath,
					new GetRequest()
							.param("partyId", document.getPartyId())
							.param("storageId",
									document.getDocumentStorageLocation())
							.param("buId", user.getBuId()), String.class,
					appendPathParam());

			document.setFileStoragePathURI(storagePath);
			File phycicalPath = FiinfraUtility.saveDocument(new File(
					storagePath), "", nach.getNachForm());
			if (phycicalPath == null) {
				return -1;
			}
			document.setFileName(phycicalPath.getName());
			document.setFileStoragePathURI(phycicalPath.getAbsolutePath());
			return getService().postForObject(Services.addDocument, document,
					Integer.class, appendPathParam());

		}

		return -1;

	}

	public List<Partner> getPartnerList(NachRequest req) {
		return getService().getForObjectCollection(Services.getPartyName, req,
				Partner.class, appendPathParam());
	}

	public DocumentData getDocument(DocumentRequest req) {
		return getService().getForObject(Services.getDocument, req, DocumentData.class, appendPathParam());
	}

	public List<AutoPaymentData> getAutoPaymentList(NachRequest req) {
		return getService().getForObjectCollection(Services.getAutoPaymentList, req,
				AutoPaymentData.class, appendPathParam());
		
	}
	public Boolean sendAutoPayment(NachRequest req) {
		return getService().getForObject(Services.sendAutoPayment, req,
				Boolean.class, appendPathParam());
		
	}

}
