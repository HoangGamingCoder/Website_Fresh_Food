package database;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import model.Product;

public class ProductDAO {
	public static ProductDAO getInstance() {
		return new ProductDAO();
	}
	
	public boolean insert(Product product) {
		Connection con=JDBCUtil.getConnection();
		try {
			String sql = "insert into Product "
					+ "values(?,?,?,?,?,?,?,?)";
			PreparedStatement pst = con.prepareStatement(sql);
			pst.setObject(1, product.getIdProduct());
			pst.setObject(2, product.getNameProduct());
			pst.setObject(3, product.getQuantity());
			pst.setObject(4, product.getOldPrice());
			pst.setObject(5, product.getNewPrice());
			pst.setObject(6, product.getImg());
			pst.setObject(7, product.getDescribe());
			pst.setObject(8, product.getIdCategory());
			pst.executeUpdate();
			JDBCUtil.closeConnection(con);
		} catch (SQLException e) {
			return false;
		}
		return true;
	}
	
	public Product getProductById(String id) {
		Connection con = JDBCUtil.getConnection();
		Product product = null;
		try {
			String sql = "select * from Product where idProduct = ?";
			PreparedStatement pst = con.prepareStatement(sql);
			pst.setObject(1, id);
			ResultSet rs = pst.executeQuery();
			rs.next();
			String idProduct = rs.getString("idProduct");
			String nameProduct = rs.getString("nameProduct");
			int quantity = rs.getInt("quantity");
			double oldPrice = rs.getDouble("oldPrice");
			double newPrice = rs.getDouble("newPrice");
			String img = rs.getString("img");
			String describe = rs.getString("describe");
			String idCategory = rs.getString("idCategory");
			product = new Product(idProduct, nameProduct, quantity, oldPrice, newPrice, img, describe, idCategory);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return product;
	}
	
	public ArrayList<Product> getAllProduct() {
		ArrayList<Product> listProduct = new ArrayList<Product>();
		Connection con = JDBCUtil.getConnection();
		try {
			String sql = "select * from Product";
			PreparedStatement pst = con.prepareStatement(sql);
			ResultSet rs = pst.executeQuery();
			while (rs.next()) {
				String idProduct = rs.getString("idProduct");
				String nameProduct = rs.getString("nameProduct");
				int quantity = rs.getInt("quantity");
				double oldPrice = rs.getDouble("oldPrice");
				double newPrice = rs.getDouble("newPrice");
				String img = rs.getString("img");
				String describe = rs.getString("describe");
				String idCategory = rs.getString("idCategory");
				Product product = new Product(idProduct, nameProduct, quantity, oldPrice, newPrice, img, describe, idCategory);
				listProduct.add(product);
			}
			JDBCUtil.closeConnection(con);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return listProduct;
	}
}
