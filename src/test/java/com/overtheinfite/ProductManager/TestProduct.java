package test.java.com.overtheinfite.ProductManager;

import junit.framework.TestCase;
import main.java.com.overtheinfite.ProductManager.Product;
import main.java.com.overtheinfite.ProductManager.ProductDB;

public class TestProduct extends TestCase {
	public void test() {
		ProductDB db = new ProductDB();
		db.addProduct("apple", 500);
		db.addNumber("apple", 5);
		
		Product p = db.getProduct("apple");
		db.RemoveProduct("apple");
		
		assertEquals(500, p.getPrice());
		assertEquals(5, p.getNumber());
		
	}
}
