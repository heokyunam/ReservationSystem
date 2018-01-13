package test.java.com.overtheinfinite.reservation;

import junit.framework.TestCase;
import main.java.com.overtheinfinite.reservation.DBMB;
import main.java.com.overtheinfinite.reservation.Reservation;

public class TestReservation extends TestCase {
	public void testRoomList() {
		DBMB dbmb =  new DBMB();
		Reservation r = new Reservation(dbmb);
		String value = r.roomList().toString();
		String expected = "[101, 102, 103, 201, 202, 203]";
		
		assertEquals(expected, value);
		
	}
}
