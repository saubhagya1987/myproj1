package in.fiinfra.plan;

import in.fiinfra.cp.AllocationData;
import in.fiinfra.cp.PlanData;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.jdbc.core.ResultSetExtractor;

public class PlanMapper implements ResultSetExtractor<List<PlanData>> {

	@Override
	public List<PlanData> extractData(ResultSet rs) throws SQLException,
			org.springframework.dao.DataAccessException {
		Map<Integer, PlanData> map = new HashMap<Integer, PlanData>();
		while (rs.next()) {
			int actionPlanId = rs.getInt("FPActionPlanID");

			PlanData planData = map.get(actionPlanId);
			if (planData == null) {
				planData = new PlanData();

				planData.setPlanId(rs.getInt("PlanId"));
				planData.setFpActionPlanID(rs.getInt("FPActionPlanID"));
				planData.setFpSectionTypeID(rs.getInt("FPSectionTypeID"));

				planData.setPartyId(rs.getInt("PartyId"));
				planData.setSectionType(rs.getString("sectionType"));
				planData.setFpSectionSubTypeID(rs.getInt("FPSectionSubTypeID"));
				planData.setFpSectionSubType(rs.getString("FPSectionSubType"));
				planData.setPurposeText(rs.getString("PurposeText"));
				planData.setAdviceTranscriptText(rs
						.getString("AdviceTranscriptText"));
				planData.setInvestmentAmount(rs.getDouble("InvestmentAmount"));
				planData.setLumpsumAmount(rs.getDouble("LumpsumAmount"));
				planData.setSipAmount(rs.getDouble("SIPAmount"));
				planData.setSipFrequencyID(rs.getInt("SIPFrequencyID"));
				planData.setSipDurationInMonths(rs
						.getString("SIPDurationInMonths"));
				planData.setInsuranceCoverAmount(rs
						.getDouble("InsuranceCoverAmount"));
				planData.setInsuranceCoverTerm(rs
						.getString("InsuranceCoverTerm"));
				planData.setInsurancePaymentTerm(rs
						.getString("InsurancePaymentTerm"));
				planData.setInsurancePremiumAmount(rs
						.getDouble("InsurancePremiumAmount"));
				planData.setEstimatedRevenueAmount(rs
						.getDouble("EstimatedRevenueAmount"));
				planData.setOpportunityText(rs.getString("OpportunityText"));
				planData.setApStatusID(rs.getInt("ApStatusID"));

				planData.setStatus(rs.getString("Status"));
				planData.setSequence(rs.getInt("sequence"));

				map.put(actionPlanId, planData);
			}

			int productId = rs.getInt("ProductID");
			if (productId > 0) {
				AllocationData allocation = new AllocationData();
				allocation.setProductSeq(rs.getInt("ProductSeq"));
				allocation.setProductId(rs.getInt("ProductID"));
				allocation.setProductName(rs.getString("ProductName"));
				allocation.setAllocationAmount(rs.getLong("AllocationAmount"));
				allocation.setAllocationPercent(rs.getInt("AllocationPercent"));
				allocation.setSipFreqID(rs.getInt("SIPFrequencyID"));
				allocation.setFrequency(rs.getString("Frequency"));
				allocation.setFrequencyId(rs.getInt("FrequencyId"));

				allocation.setSipDurationInMonths(rs
						.getInt("SIPDurationInMonths"));
				allocation.setSipAmount(rs.getLong("SIPAmount"));
				allocation.setInsurancePremiumFreqId(rs
						.getInt("InsurancePremiumFrequencyID"));
				allocation.setFpActionPlanTypeId(rs
						.getInt("FPActionPlanTypeID"));
				allocation
						.setFpActionPlanType(rs.getString("FPActionPlanType"));
				allocation.setExecutionStatusId(rs.getInt("ExecutionStatusID"));
				allocation.setInvestedAmount(rs.getLong("InvestmentAmount"));
				allocation.setTargetAmount(rs.getDouble("TargetAmount"));
				allocation.setInsurancePremiumFreq(rs
						.getString("InsurancePremiumFrequency"));
				allocation.setProductCategoryId(rs.getInt("CategoryID"));
				allocation.setAssetClassId(rs.getInt("AssetClassId"));
				allocation.setProductTypeId(rs.getInt("ProductTypeID"));
				allocation.setFpActionPlanId(rs.getInt("FPActionPlanID"));
				allocation.setProdAllocationId(rs
						.getInt("FPActionPlanProdAllocID"));
				allocation.setProductCategory(rs.getString("ProductCategory"));
				allocation.setStatus(rs.getString("Status"));
				allocation.setNoteCount(rs.getInt("noteCount"));
				planData.addAllocation(allocation);

			}
		}

		return new ArrayList<PlanData>(map.values());

	}

}
