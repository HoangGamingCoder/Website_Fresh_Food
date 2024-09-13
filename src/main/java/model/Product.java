package model;

public class Product {
	private String idProduct;
	private String nameProduct;
	private int quantity;
	private double oldPrice;
	private double newPrice;
	private String img;
	private String describe;
	private String idCategory;
	public Product() {
		
	}

	public Product(String idProduct, String nameProduct, int quantity, double oldPrice, double newPrice, String img,
			String describe, String idCategory) {
		this.idProduct = idProduct;
		this.nameProduct = nameProduct;
		this.quantity = quantity;
		this.oldPrice = oldPrice;
		this.newPrice = newPrice;
		this.img = img;
		this.describe = describe;
		this.idCategory = idCategory;
	}

	public String getIdProduct() {
		return idProduct;
	}

	public void setIdProduct(String idProduct) {
		this.idProduct = idProduct;
	}

	public String getNameProduct() {
		return nameProduct;
	}

	public void setNameProduct(String nameProduct) {
		this.nameProduct = nameProduct;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public double getOldPrice() {
		return oldPrice;
	}

	public void setOldPrice(double oldPrice) {
		this.oldPrice = oldPrice;
	}

	public double getNewPrice() {
		return newPrice;
	}

	public void setNewPrice(double newPrice) {
		this.newPrice = newPrice;
	}

	public String getImg() {
		return img;
	}

	public void setImg(String img) {
		this.img = img;
	}

	public String getDescribe() {
		return describe;
	}

	public void setDescribe(String describe) {
		this.describe = describe;
	}

	public String getIdCategory() {
		return idCategory;
	}

	public void setIdCategory(String idCategory) {
		this.idCategory = idCategory;
	}

	@Override
	public String toString() {
		return "Product [idProduct=" + idProduct + ", nameProduct=" + nameProduct + ", quantity=" + quantity
				+ ", oldPrice=" + oldPrice + ", newPrice=" + newPrice + ", img=" + img + ", describe=" + describe
				+ ", idCategory=" + idCategory + "]";
	}
}
