package main.java.com.overtheinfinite.reservation;

import java.sql.Date;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Calendar;

public class Reservation {
	private DBMB dbmb;
	
	private Calendar start, end;
	private int room;
	public Reservation(DBMB dbmb) {
		this.dbmb = dbmb;
	}
	
	public void init(String start, String end, int room, int year, int month, int date) {
		String[] startList = start.split(":");
		String[] endList = end.split(":");
		
		Calendar startC = Calendar.getInstance();
		startC.clear(Calendar.SECOND);
		startC.set(year, month, date, 
				Integer.parseInt(startList[0]), 
				Integer.parseInt(startList[1]));
		this.start = startC;
		
		Calendar endC = Calendar.getInstance();
		endC.clear(Calendar.SECOND);
		endC.set(year, month, date,
				Integer.parseInt(endList[0]),
				Integer.parseInt(endList[1]));
		this.end = endC;
		
		this.room = room;		
	}
	
	public Calendar getStart() {
		return this.start;
	}
	
	public Calendar getEnd() {
		return this.end;
	}
	
	public void reservate()
	{
		String sql = "insert into calendar(start, end, room_id) values (?,?,?)";
		try {
			dbmb.execute(sql, start, end, room);
		} catch (SQLException e) {
			throw new ReservationException("DB에서 예약정보를 입력하던 중 에러가 발생하였습니다", e);
		}
		
	}
	
	public boolean canReservate() {
		String sql = "select count(room_id) cnt from calendar"
				+ " where (start <= ? and ? <= end) and room_id = ?";
		try {
			ResultSet set = dbmb.query(sql, end, start, room);
			set.next();
			return set.getInt("cnt") == 0;
		} catch (SQLException e) {
			throw new ReservationException("DB에서 예약상태를 확인하던 중 에러가 발생하였습니다", e);
		}
	}
	
	
	public class ReservationException extends RuntimeException {
		public ReservationException(String msg, Throwable t) {
			super(msg, t);
		}
	}
}
