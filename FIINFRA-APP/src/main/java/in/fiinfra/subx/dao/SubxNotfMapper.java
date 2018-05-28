package in.fiinfra.subx.dao;

import in.fiinfra.pg.SubxNotfData;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.ResultSetExtractor;

public class SubxNotfMapper implements ResultSetExtractor<List<SubxNotfData>> {

	int reserveColumnCount = 7;
	@Override
	public List<SubxNotfData> extractData(ResultSet rs)
			throws SQLException, DataAccessException {
		List<SubxNotfData> lst =new ArrayList<SubxNotfData>();
		String[] columns = null;
		int columnCount = 0;
		while(rs.next()){
			if(columns ==null){
				columnCount  = rs.getMetaData().getColumnCount();
				columns = new String[columnCount];
			
				for(int i=0;i<columnCount;i++){
					columns[i] = rs.getMetaData().getColumnName(i+1);	
				}
			
			}
			SubxNotfData notification = new SubxNotfData();
			
			 //1 to 7 Reserved
			 notification.setSourceSystemID(rs.getInt("SourceSystemID"));
			 notification.setNotifyTypeId(rs.getInt("NotifyTypeID"));
			 notification.setNotifyPartyID(rs.getInt("PartyID"));
			 notification.setNotifyEventID(rs.getInt("EventID"));
			 notification.setDeliveryChannelID(rs.getInt("DeliveryChannelID"));
			 notification.setBuId(rs.getInt("buID"));
			 notification.setSessionID("SessionID");
			 
 			 for(int i=0;i<columnCount-reserveColumnCount;i++){
 				notification.addData(columns[i+reserveColumnCount], rs.getString(i+reserveColumnCount+1));
			 }
			
			lst.add(notification);
		}
		return lst;
	}

}
