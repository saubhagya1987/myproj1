package in.fiinfra.subx.dao;

import in.fiinfra.pg.SubxAttribute;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.ResultSetExtractor;

public class SubxAttributeMapper implements ResultSetExtractor<List<SubxAttribute>> {

	@Override
	public List<SubxAttribute> extractData(ResultSet rs)
			throws SQLException, DataAccessException {
		List<SubxAttribute> lst =new ArrayList<SubxAttribute>();
		while(rs.next()){
			SubxAttribute bean = new SubxAttribute();
			
			bean.setPartyProductId(rs.getInt("partyProductId"));
			bean.setAttributeId(rs.getInt("AttributeId"));
			bean.setFrequencyId(rs.getInt("LimitFrequencyID"));
			bean.setValue(rs.getString("AttributeValue"));
			lst.add(bean);
		}
		return lst;
	}

}
