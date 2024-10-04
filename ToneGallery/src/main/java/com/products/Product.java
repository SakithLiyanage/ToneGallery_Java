package com.products;

public class Product {
	private int productID;
	private String name;
	private String category;
	private double price;
	private String image_path;
	
	public Product() {
		
	}

	public Product(int productID, String name, String category, float price, String image_path) {
		this.productID = productID;
		this.name = name;
		this.category = category;
		this.price = price;
		this.image_path = image_path;
	}

	public int getProductID() {
		return productID;
	}

	public void setProductID(int productID) {
		this.productID = productID;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	  public double getPrice() {
	        return price;
	  }

	 public void setPrice(double price) {
	        this.price = price;
	 }

	public String getImage_path() {
		return image_path;
	}

	public void setImage_path(String image_path) {
		this.image_path = image_path;
	}
	
	
	
}
