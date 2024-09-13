package model;

public class ShoppingCart {
	private String idProduct;
	private String idCustomer;
	private int quantity;
	public ShoppingCart() {
		
	}

	public ShoppingCart(String idProduct, String idCustomer, int quantity) {
		this.idProduct = idProduct;
		this.idCustomer = idCustomer;
		this.quantity = quantity;
	}

	public String getIdProduct() {
		return idProduct;
	}

	public void setIdProduct(String idProduct) {
		this.idProduct = idProduct;
	}

	public String getIdCustomer() {
		return idCustomer;
	}

	public void setIdCustomer(String idCustomer) {
		this.idCustomer = idCustomer;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
}
