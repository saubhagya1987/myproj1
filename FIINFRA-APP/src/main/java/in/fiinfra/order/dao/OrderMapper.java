package in.fiinfra.order.dao;

import in.fiinfra.pg.OrderData;
import in.fiinfra.pg.OrderDetailData;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.ResultSetExtractor;

  public class OrderMapper implements ResultSetExtractor<List<OrderData>>{

	@Override
	public List<OrderData> extractData(ResultSet rs) throws SQLException,
			DataAccessException {
		List<OrderData> lst = new ArrayList<OrderData>();
		Map<Integer,OrderData> map=new HashMap<Integer,OrderData>();
		while(rs.next()){
			int orderId = rs.getInt("OrderID");
			OrderData order = map.get(orderId);
			if(order ==null){
				 order=new OrderData();
				order.setOrderID(rs.getInt("OrderID"));
				order.setPartyID(rs.getInt("PartyID"));
				order.setOrderNO(rs.getString("OrderNO"));
				order.setOrderDttm(rs.getDate("OrderDttm"));
				order.setOrderAmount(rs.getLong("OrderAmount"));
				order.setOrderStatusID(rs.getInt("OrderStatusID"));
				order.setOrderStatus(rs.getString("OrderStatus"));
				order.setPartyName(rs.getString("partyName"));
				order.setSubscriptionStartDate(rs.getDate("SubscriptionStartDate"));
				order.setSubscriptionExpiryDate(rs.getDate("SubscriptionExpiryDate"));
				order.setBuName(rs.getString("buName"));
				order.setOrderDetails(new ArrayList<OrderDetailData>());
				lst.add(order);
				map.put(orderId, order);
			}
			
			OrderDetailData oDetail=new OrderDetailData();
			oDetail.setProductName(rs.getString("ProductName"));
			oDetail.setProductID(rs.getInt("ProductId"));
			oDetail.setProductPrice(rs.getInt("ProductPrice"));
			
			order.getOrderDetails().add(oDetail);
		}
		
		return lst;
	}
	 
	

}
