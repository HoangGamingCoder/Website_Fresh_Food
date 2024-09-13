package database;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import model.ShoppingCart;

public class ShoppingCartDAO {
	public static ShoppingCartDAO getInstance() {
		return new ShoppingCartDAO();
	}

	public boolean insert(ShoppingCart cart) {
		Connection con = JDBCUtil.getConnection();
		try {
			String sql = "insert into ShoppingCart values(?,?,?)";
			PreparedStatement pst = con.prepareStatement(sql);
			pst.setObject(1, cart.getIdProduct());
			pst.setObject(2, cart.getIdCustomer());
			pst.setObject(3, cart.getQuantity());
			pst.executeUpdate();
			JDBCUtil.closeConnection(con);
		} catch (SQLException e) {
			return false;
		}
		return true;
	}
	
	public boolean update(ShoppingCart cart) {
		Connection con = JDBCUtil.getConnection();
		try {
			String sql = "update ShoppingCart "
					+ "set quantityBuy=? where idProduct=? and idCustomer=?";
			PreparedStatement pst = con.prepareStatement(sql);
			pst.setObject(1, cart.getQuantity());
			pst.setObject(2, cart.getIdProduct());
			pst.setObject(3, cart.getIdCustomer());
			pst.executeUpdate();
			JDBCUtil.closeConnection(con);
		} catch (SQLException e) {
			return false;
		}
		return true;
	}
	
	public boolean delete(ShoppingCart cart) {
		Connection con = JDBCUtil.getConnection();
		try {
			String sql = "delete ShoppingCart where idProduct=? and idCustomer=?";
			PreparedStatement pst = con.prepareStatement(sql);
			pst.setObject(1, cart.getIdProduct());
			pst.setObject(2, cart.getIdCustomer());
			pst.executeUpdate();
			JDBCUtil.closeConnection(con);
		} catch (SQLException e) {
			return false;
		}
		return true;
	}
	
	public ArrayList<ShoppingCart> getAllProductByID(String id) {
		ArrayList<ShoppingCart> listShoppingCart = new ArrayList<>();
		Connection con = JDBCUtil.getConnection();
		try {
			String sql = "select * from ShoppingCart "
					+ "where idCustomer = ?";
			PreparedStatement pst = con.prepareStatement(sql);
			pst.setObject(1, id);
			ResultSet rs = pst.executeQuery();
			while (rs.next()) {
				String idProduct = rs.getString("idProduct");
				String idCustomer = rs.getString("idCustomer");
				int quantity = rs.getInt("quantityBuy");
				ShoppingCart cart = new ShoppingCart(idProduct, idCustomer, quantity);
				listShoppingCart.add(cart);
			}
			JDBCUtil.closeConnection(con);
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return listShoppingCart;
	}
}
