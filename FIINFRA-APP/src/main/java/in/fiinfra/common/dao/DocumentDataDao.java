package in.fiinfra.common.dao;

import in.fiinfra.common.util.DocumentDataInsert;

import javax.ws.rs.core.Response;

public interface DocumentDataDao {

	Response insertorupdate(DocumentDataInsert doc);

}
