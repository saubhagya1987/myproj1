package in.fiinfra.subx.dao;

import in.fiinfra.pg.OrderData;
import in.fiinfra.pg.SubscriptionData;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.ResultSetExtractor;

public class SubscriptionMapper implements
		ResultSetExtractor<List<SubscriptionData>> {

	@Override
	public List<SubscriptionData> extractData(ResultSet rs)
			throws SQLException, DataAccessException {
		List<SubscriptionData> lst = new ArrayList<SubscriptionData>();
		while (rs.next()) {
			SubscriptionData subscriptionData = new SubscriptionData();

			subscriptionData.setCumulativeAmountDue(rs
					.getInt("cumulativeAmountDue"));
			subscriptionData.setCumulativeAmountPaid(rs
					.getInt("cumulativeAmountPaid"));
			subscriptionData.setCurrentSubscriptionCategoryID(rs
					.getInt("CategoryID"));
			subscriptionData.setCurrentSubscriptionTypeID(rs
					.getInt("CurrentSubscriptionTypeID"));
			subscriptionData.setCurrentSubscriptionType(rs
					.getString("CurrentSubscriptionType"));
			subscriptionData.setLastPaymentAmount(rs
					.getInt("LastPaymentAmount"));
			subscriptionData.setLastPaymentDttm(rs.getDate("LastPaymentDttm"));
			subscriptionData.setNextPaymentDttm(rs.getDate("NextPaymentDttm"));
			subscriptionData.setPartySubscriptionID(rs
					.getInt("PartySubscriptionID"));
			subscriptionData.setPaymentFrequencyId(rs
					.getInt("PaymentFrequencyId"));
			subscriptionData.setPaymentFrequency(rs
					.getString("PaymentFrequency"));
			subscriptionData.setPaymentStatus(rs.getString("PaymentStatus"));
			subscriptionData.setPaymentStatusID(rs.getInt("PaymentStatusID"));
			subscriptionData.setProductID(rs.getInt("ProductID"));
			subscriptionData.setRenewalNoticeDate(rs
					.getDate("renewalNoticeDate"));
			// subscriptionData.setSubscriptionCostAmount(rs.getInt("SubscriptionCostAmount"));
			subscriptionData.setSubscriptionExpiryDate(rs
					.getDate("subscriptionExpiryDate"));
			subscriptionData.setSubscriptionStartDate(rs
					.getDate("subscriptionStartDate"));
			subscriptionData.setSubscriptionStatus(rs
					.getString("subscriptionStatus"));
			/*
			 * subscriptionData.setTrialEndDate(rs.getDate("trialEndDate"));
			 * subscriptionData.setTrialStartDate(rs.getDate("TrialStartDate"));
			 */
			subscriptionData.setSubscriptionStatusID(rs
					.getInt("SubscriptionStatusID"));
			subscriptionData.setProductID(rs.getInt("ProductID"));
			subscriptionData.setProductName(rs.getString("ProductName"));
			subscriptionData.setPartyID(rs.getInt("PartyID"));
			subscriptionData.setPlanCount(rs.getInt("PlanCount"));
			subscriptionData.setPartyName(rs.getString("partyName"));
			subscriptionData.setSubxPlanLimit(rs.getInt("SubxPlanLimit"));
			OrderData order = new OrderData();
			order.setOrderID(rs.getInt("OrderId"));

			subscriptionData.setOrder(order);

			lst.add(subscriptionData);
		}
		return lst;
	}

}
