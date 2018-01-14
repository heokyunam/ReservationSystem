package main.java.com.overtheinfinite.reservation;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.LinkedList;
import java.util.List;

import main.java.com.overtheinfinite.reservation.Reservation.ReservationException;

public class Room {
	private DBMB dbmb;
	public Room(DBMB dbmb) {
		this.dbmb = dbmb;
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
			throw new RoomException(
					"방 리스트를 가져오던 중 에러", e);
		}
	}
	
	public String roomListString() {
		String query = "select room_id, room_name from room order by room_name;";
		StringBuffer sb = new StringBuffer();
		try {
			ResultSet set = dbmb.query(query);
			while(set.next()) {
				sb.append("<option value='");
				sb.append(set.getInt("room_id"));
				sb.append("'>");
				sb.append(set.getInt("room_name"));
				sb.append("</option>\n");
			}
			return sb.toString();
		} catch (SQLException e) {
			throw new RoomException(
					"방 리스트를 가져오던 중 에러", e);
		}
	}
	
	public class RoomException extends RuntimeException {
		public RoomException(String msg, Throwable t) {
			super(msg, t);
		}
	}
	
}
