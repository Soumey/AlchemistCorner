package com.soumey.product;

public class ProductDetails {
	private int id;
	private String name;
	private String desc;
	private String category;
	private String price;
	private String img;

	/*
	 * public ProductDetails(int id, String name, String desc, String category,
	 * String price) { super(); this.id = id; this.name = name; this.desc = desc;
	 * this.category = category; this.price = price; }
	 */
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getDesc() {
		return desc;
	}
	public void setDesc(String desc) {
		this.desc = desc;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}
	@Override
	public String toString() {
		return "ProductDetails [id=" + id + ", name=" + name + ", desc=" + desc + ", category=" + category + ", price="
				+ price + "]";
	}
	public String getImg() {
		return img;
	}
	public void setImg(String img) {
		this.img = img;
	}
	
	
	
	
}
