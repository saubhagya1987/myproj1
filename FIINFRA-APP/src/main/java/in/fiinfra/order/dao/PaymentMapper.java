package in.fiinfra.order.dao;

import in.fiinfra.pg.PaymentData;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.ResultSetExtractor;

public class PaymentMapper implements ResultSetExtractor<List<PaymentData>> {

	@Override
	public List<PaymentData> extractData(ResultSet rs) throws SQLException,
			DataAccessException {
		List<PaymentData> lst = new ArrayList<PaymentData>();
		while (rs.next()) {
			PaymentData payment = new PaymentData();
			payment.setBuId(rs.getInt("buId"));
			payment.setPartyID(rs.getInt("PartyID"));
			payment.setPaymentID(rs.getInt("PaymentID"));
			payment.setOrderID(rs.getInt("OrderID"));
			payment.setPaymentAmount(rs.getInt("PaymentAmount"));
			payment.setPaymentMethodID(rs.getInt("PaymentMethodID"));
			payment.setpGRequestDttm(rs.getTimestamp("PGRequestDttm"));
			payment.setpGRespnseDttm(rs.getTimestamp("PGRespnseDttm"));
			payment.setpGTxnRefNo(rs.getString("PGTxnRefNo"));
			payment.setpGPaidAmount(rs.getInt("PGPaidAmount"));
			payment.setpGErrorCode(rs.getString("PGErrorCode"));
			payment.setpGErrorDescription(rs.getString("PGErrorDescription"));
			payment.setpGRequestMessage(rs.getString("PGRequestMessage"));
			payment.setpGResponseMessage(rs.getString("PGResponseMessage"));
			payment.setPaymentNote(rs.getString("PaymentNote"));
			payment.setOrderNo(rs.getString("OrderNo"));
			payment.setProductName(rs.getString("ProductName"));
			payment.setpGTxnRefNo(rs.getString("PGTxnRefNo"));
			payment.setPaymentStatus(rs.getString("PaymentStatus"));
			payment.setPaymentStatusId(rs.getInt("PaymentStatusID"));
			payment.setpGStatus(rs.getString("PGStatus"));
			payment.setpGStatusID(rs.getInt("PGStatusID"));
			payment.setTrxReference(rs.getString("TxnRefNo"));
			payment.setPartyName(rs.getString("partyName"));
			payment.setEndDate(rs.getDate("endDate"));
			payment.setPaymentDate(rs.getDate("paymentDate"));

			lst.add(payment);
		}

		return lst;
	}

}
