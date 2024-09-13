package model;

public class Category {
	private String idCategory;
	private String nameCategory;
	private String describe;
	public Category() {
		
	}

	public Category(String idCategory, String nameCategory, String describe) {
		this.idCategory = idCategory;
		this.nameCategory = nameCategory;
		this.describe = describe;
	}

	public String getIdCategory() {
		return idCategory;
	}

	public void setIdCategory(String idCategory) {
		this.idCategory = idCategory;
	}

	public String getNameCategory() {
		return nameCategory;
	}

	public void setNameCategory(String nameCategory) {
		this.nameCategory = nameCategory;
	}

	public String getDescribe() {
		return describe;
	}

	public void setDescribe(String describe) {
		this.describe = describe;
	}
}
