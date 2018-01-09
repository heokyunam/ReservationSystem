package test.java.com.overtheinfite.ProductManager;

import java.sql.ResultSet;
import java.sql.SQLException;

import junit.framework.TestCase;
import main.java.com.overtheinfite.ProductManager.DBMB;

public class TestDBMB extends TestCase {
	
	public void testQuery() throws SQLException {
		DBMB dbmb = new DBMB();
		dbmb.execute("insert into products(product_name, price, number)"
				+ " values(?, ?, ?);", "apple", 100, 5);
		ResultSet set = dbmb.query("select product_id, product_name, price, number"
				+ " from products where product_name = ?"
				+ " order by product_id desc;", "apple");
		
		set.next();
		assertEquals("apple", set.getString("product_name"));
		assertEquals(100, set.getInt("price"));
		assertEquals(5, set.getInt("number"));
		
		dbmb.execute("delete from products where product_id = ?", 
				set.getInt("product_id"));
	}
}
