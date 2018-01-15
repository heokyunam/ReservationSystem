package test.java.com.overtheinfinite.reservation;

import java.util.Calendar;

import org.junit.Test;

import junit.framework.TestCase;
import main.java.com.overtheinfinite.reservation.DBMB;
import main.java.com.overtheinfinite.reservation.Reservation;

public class TestReservation extends TestCase{
	@Test
	public void testReservation() {
		
		String[] startList = "10:00".split(":");
		assertEquals(startList[0], "10");
		assertEquals(startList[1], "00");
		
		DBMB dbmb = new DBMB();
		Reservation r = new Reservation(dbmb);
		r.init("10:00", "12:00", 1, 2018, 0, 12);
		
		assertEquals(10, r.getStart().get(Calendar.HOUR_OF_DAY));
		assertEquals(0, r.getStart().get(Calendar.MINUTE));
		assertEquals(0, r.getStart().get(Calendar.SECOND));
		
		assertEquals(12, r.getEnd().get(Calendar.HOUR_OF_DAY));
		assertEquals(0, r.getEnd().get(Calendar.MINUTE));
		assertEquals(0, r.getEnd().get(Calendar.SECOND));
		
		assertTrue(r.canReservate());//처음엔 되고 두번째엔 안되어야 한다
		
		r.reservate("테스트", "테스트1");
		
		Reservation r2 = new Reservation(dbmb);
		r2.init("9:00", "13:00", 1, 2018, 0, 12);
		
		assertFalse(r2.canReservate());
	}
}
