package in.fiinfra.common.service;

import in.fiinfra.common.util.DocumentDataInsert;

import javax.ws.rs.core.Response;

public interface DocumentDataService {

	Response insertorupdate(DocumentDataInsert doc);

}
