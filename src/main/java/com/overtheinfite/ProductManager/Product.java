package main.java.com.overtheinfite.ProductManager;

import org.json.simple.JSONObject;

public class Product {
	private String name;
	private int id, number, price;
	
	public Product(String name, int id, int number, int price) {
		super();
		this.name = name;
		this.id = id;
		this.number = number;
		this.price = price;
	}

	public String getName() {
		return name;
	}

	public int getId() {
		return id;
	}

	public int getNumber() {
		return number;
	}

	public int getPrice() {
		return price;
	}
	
	public String toJSON() {
		JSONObject obj = new JSONObject();
		obj.put("name", name);
		obj.put("id", id);
		obj.put("number", number);
		obj.put("price", price);
		return obj.toJSONString();
	}
	
}
