package main.java.com.overtheinfinite.reservation;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.LinkedList;
import java.util.List;

public class Reservation {
	private DBMB dbmb;
	public Reservation(DBMB dbmb) {
		this.dbmb = dbmb;
	}
	
	public void reservate(int day, int time)
	{
		
	}
	
	public boolean canReservate() {
		return false;
	}
	
	public List<String> roomList() {
		String query = "select room_name from room order by room_name;";
		LinkedList<String> list = new LinkedList<>();
		try {
			ResultSet set = dbmb.query(query);
			while(set.next()) {
				list.add(set.getString("room_name"));
			}
			return list;
		} catch (SQLException e) {
			throw new ReservationException(
					"방 리스트를 가져오던 중 에러", e);
		}
	}
	
	public String roomListString() {
		StringBuffer sb = new StringBuffer();
		List<String> list = roomList();
		for(int i = 0; i < list.size(); i++) {
			sb.append("<option value='");
			sb.append(list.get(i));
			sb.append("'>");
			sb.append(list.get(i));
			sb.append("</option>\n");
		}
		return sb.toString();
	}
	
	public class ReservationException extends RuntimeException {
		public ReservationException(String msg, Throwable t) {
			super(msg, t);
		}
	}
}
