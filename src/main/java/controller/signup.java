package controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;

import database.CustomerDAO;
import database.JDBCUtil;
import model.Customer;

/**
 * Servlet implementation class insertCustomer
 */
@WebServlet("/sign-up")
public class signup extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public signup() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		SimpleDateFormat d = new SimpleDateFormat("yyyy-MM-dd");
		MultipartRequest multi = new MultipartRequest(request, "C:\\Users\\vacng\\eclipse-workspace\\Website_Fresh_Food\\src\\main\\webapp\\img\\customer-avatar");
		String fullName = multi.getParameter("fullName");
		String gender = multi.getParameter("gender");
		String avatar = multi.getFilesystemName("file");
		Date dateOfBirth = null;
		try {
			dateOfBirth = d.parse(multi.getParameter("dateOfBirth"));
		} catch (ParseException e) {
			e.printStackTrace();
		}
		String phoneNumber = multi.getParameter("phoneNumber");
		String email = multi.getParameter("email");
		String username = multi.getParameter("username");
		String password = multi.getParameter("password");
		email = (email.equals(""))?null:email;
		
		Connection con = JDBCUtil.getConnection();
		String idCustomer = null;
		// tìm mã khách hàng tiếp theo
		try {
			String sql = "select max(idCustomer) idCustomer from Customer";
			PreparedStatement pst = con.prepareStatement(sql);
			ResultSet rs = pst.executeQuery();
			if (rs.next()) {
				String maxId = rs.getString("idCustomer");
				if (maxId !=null) {
					int num = Integer.parseInt(maxId.substring(2)) + 1;
		            idCustomer = String.format("KH%03d", num);
				}
				else {
					idCustomer = "KH001";
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		// kiểm tra username đã tồn tại hay chưa
		String url = null;
		Customer customer = null;
		try {
			String sql = "select * from customer where username=?";
			PreparedStatement pst = con.prepareStatement(sql);
			pst.setString(1, username);
			ResultSet rs = pst.executeQuery();
			if (rs.next()) {
				url = "/signup.jsp";
				request.setAttribute("exist_username", "Username already exists, please enter another one");
				request.setAttribute("fullName", fullName);
				request.setAttribute("gender", gender);
				request.setAttribute("dateOfBirth", multi.getParameter("dateOfBirth"));
				request.setAttribute("phoneNumber", phoneNumber);
				request.setAttribute("email", email);
				request.setAttribute("username", username);
				request.setAttribute("password", password);
				request.setAttribute("confirm_password", multi.getParameter("confirm-password"));
			}
			else {
				customer = new Customer(idCustomer, fullName, gender, avatar, dateOfBirth, phoneNumber, email, username, password);
				CustomerDAO.getInstance().insert(customer);
				url = "/login.jsp";
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		RequestDispatcher rd = getServletContext().getRequestDispatcher(url);
		rd.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
