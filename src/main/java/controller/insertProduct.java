package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;

import database.JDBCUtil;
import database.ProductDAO;
import model.Product;

/**
 * Servlet implementation class insertProduct
 */
@WebServlet("/insertProduct")
public class insertProduct extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public insertProduct() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html;charset=UTF-8");
		try (PrintWriter out = response.getWriter()) {
			ServletContext context = request.getServletContext();
			String realpath = context.getRealPath("/img/product");
			MultipartRequest multi = new MultipartRequest(request, realpath);// "C:/Users/AD/Documents/NetBeansProjects/WebApp_QUANLYBANHANGONLINE/web/images"
			String nameProduct = multi.getParameter("nameProduct");
			String quantity = multi.getParameter("quantity");
			String oldPrice = multi.getParameter("oldPrice");
			String newPrice = multi.getParameter("newPrice");
			String describe = multi.getParameter("describe");
			String idCategory = multi.getParameter("idCategory");
			String fileName = multi.getFilesystemName("img");
			Connection con = JDBCUtil.getConnection();
			String idProduct = null;
			// tìm mã khách hàng tiếp theo
			try {
				String sql = "select max(idProduct) idProduct from Product";
				PreparedStatement pst = con.prepareStatement(sql);
				ResultSet rs = pst.executeQuery();
				if (rs.next()) {
					String maxId = rs.getString("idProduct");
					if (maxId != null) {
						int num = Integer.parseInt(maxId.substring(2)) + 1;
						idProduct = String.format("SP%03d", num);
					} else {
						idProduct = "SP001";
					}
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
			Product product = new Product(idProduct, nameProduct, Integer.parseInt(quantity),
					Double.parseDouble(oldPrice), Double.parseDouble(newPrice), fileName, describe, idCategory);
			ProductDAO.getInstance().insert(product);
			response.sendRedirect("index.jsp");
		} catch (Exception ex) {
			ex.printStackTrace();
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
