package database;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import model.Category;

public class CategoryDAO {
	public static CategoryDAO getInstance() {
		return new CategoryDAO();
	}

	public ArrayList<Category> getAllCategories() {
		ArrayList<Category> listCategories = new ArrayList<>();
		Connection con = JDBCUtil.getConnection();
		try {
			String sql = "select * from Category";
			PreparedStatement pst = con.prepareStatement(sql);
			ResultSet rs = pst.executeQuery();
			while (rs.next()) {
				String idCategory = rs.getString("idCategory");
				String nameCategory = rs.getString("nameCategory");
				String describe = rs.getString("describe");
				Category category = new Category(idCategory, nameCategory, describe);
				listCategories.add(category);
			}
			JDBCUtil.closeConnection(con);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return listCategories;
	}
}
