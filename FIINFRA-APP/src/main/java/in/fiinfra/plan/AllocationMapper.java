package in.fiinfra.plan;

import in.fiinfra.cp.AllocationData;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

public class AllocationMapper implements RowMapper<AllocationData> {

	@Override
	public AllocationData mapRow(ResultSet rs, int rowNum) throws SQLException {
		AllocationData allocation = new AllocationData();
		allocation.setProductSeq(rs.getInt("ProductSeq"));
		allocation.setProductId(rs.getInt("ProductID"));
		allocation.setAllocationAmount(rs.getLong("AllocationAmount"));
		allocation.setAllocationPercent(rs.getInt("AllocationPercent"));
		allocation.setSipFreqID(rs.getInt("SIPFrequencyID"));
		allocation.setSipDurationInMonths(rs.getInt("SIPDurationInMonths"));
		allocation.setSipAmount(rs.getLong("SIPAmount"));
		allocation.setInsurancePremiumFreqId(rs
				.getInt("InsurancePremiumFrequencyID"));
		allocation.setFpActionPlanTypeId(rs.getInt("FPActionPlanTypeID"));
		allocation.setFpActionPlanType(rs.getString("FPActionPlanType"));
		allocation.setInsurancePremiumFreq(rs
				.getString("InsurancePremiumFrequency"));
		return allocation;
	}
}
