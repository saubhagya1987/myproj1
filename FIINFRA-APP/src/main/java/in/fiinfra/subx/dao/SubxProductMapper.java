package in.fiinfra.subx.dao;

import in.fiinfra.pg.SubxProductData;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.ResultSetExtractor;

public class SubxProductMapper implements ResultSetExtractor<List<SubxProductData>> {

	@Override
	public List<SubxProductData> extractData(ResultSet rs)
			throws SQLException, DataAccessException {
		List<SubxProductData> lst =new ArrayList<SubxProductData>();
		while(rs.next()){
			SubxProductData bean = new SubxProductData();
			
			bean.setPartyProductID(rs.getInt("PartyProductID"));
			bean.setProductID(rs.getInt("ProductID"));
			bean.setProductName(rs.getString("ProductName"));
			bean.setDefaulted(rs.getInt("isDefault")==1);
			bean.setPriceValue(rs.getDouble("PriceValue"));
			bean.setPaymentFrequencyId(rs.getInt("PaymentFrequencyID"));
			bean.setProductDesc(rs.getString("ProductDescription"));
			bean.setCategoryId(rs.getInt("CategoryID"));
			bean.setPaymentFrequency(rs.getString("PaymentFrequency"));
			lst.add(bean);
		}
		return lst;
	}

}
