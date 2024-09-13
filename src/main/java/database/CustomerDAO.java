package database;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import model.Customer;

public class CustomerDAO {
	public static CustomerDAO getInstance() {
		return new CustomerDAO();
	}
	
	public boolean insert(Customer customer) {
		Connection con=JDBCUtil.getConnection();
		try {
			String sql = "insert into Customer "
					+ "values(?,?,?,?,?,?,?,?,?)";
			PreparedStatement pst = con.prepareStatement(sql);
			pst.setObject(1, customer.getIdCustomer());
			pst.setObject(2, customer.getFullName());
			pst.setObject(3, customer.getGender());
			pst.setObject(4, customer.getAvatar());
			pst.setObject(5, customer.getDateOfBirth());
			pst.setObject(6, customer.getPhoneNumber());
			pst.setObject(7, customer.getEmail());
			pst.setObject(8, customer.getUsername());
			pst.setObject(9, customer.getPassword());
			pst.executeUpdate();
			JDBCUtil.closeConnection(con);
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}
		return true;
	}
	
	public Customer getElementByUsernameAndPassword(String username, String password) {
		Connection con = JDBCUtil.getConnection();
		Customer customer = null;
		try {
			String sql = "select * from Customer where username=? and passwords=?";
			PreparedStatement pst = con.prepareStatement(sql);
			pst.setObject(1, username);
			pst.setObject(2, password);
			ResultSet rs = pst.executeQuery();
			SimpleDateFormat d = new SimpleDateFormat("yyyy-MM-dd");
			if (rs.next()) {
				String idCustomer = rs.getString("idCustomer");
				String fullName = rs.getString("fullName");
				String gender = rs.getString("gender");
				String avatar = rs.getString("avatar");
				Date dateOfBirth = null;
				try {
					dateOfBirth = d.parse(rs.getString("dateOfBirth"));
				} catch (ParseException e) {
					e.printStackTrace();
				}
				String phoneNumber = rs.getString("phoneNumber");
				String email = rs.getString("email");
				customer = new Customer(idCustomer, fullName, gender, avatar, dateOfBirth, phoneNumber, email, username, password);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return customer;
	}
}
