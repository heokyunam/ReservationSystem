package main.java.com.overtheinfite.ProductManager;

import java.sql.ResultSet;
import java.sql.SQLException;

public class ProductDB extends DBMB {
	public void addProduct(String name, int price) {
		try {
			super.execute("insert into products(product_name, price, number)"
					+ " values(?, ?, 0);", name, price);
		} catch (SQLException e) {
			throw new ProductException(e);
		}
	}
	
	public void addNumber(String name, int number) {
		try {
			super.execute("update products set number = number + ?"
					+ " where product_name = ?", number, name);
		} catch (SQLException e) {
			throw new ProductException(e);
		}
	}
	
	public Product getProduct(String name) {
		try {
			ResultSet set = super.query("select product_id, product_name,"
					+ " price, number from products"
					+ " where product_name = ?;", name);
			set.next();
			
			return new Product(set.getString("product_name"),
					set.getInt("product_id"),
					set.getInt("number"), 
					set.getInt("price"));
		} catch (SQLException e) {
			throw new ProductException(e);
		}
	}
	
	
	public void RemoveProduct(String name) {
		try {
			super.execute("delete from products where product_name = ?", name);
		} catch (SQLException e) {
			throw new ProductException(e);
		}
	}
	
	public class ProductException extends RuntimeException {
		public ProductException(Throwable t) {
			super("상품에 관한 일을 처리하던 중 에러가 발생하였습니다", t);
		}
	}
}
