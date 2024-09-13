package controller;

import java.io.IOException;
import java.text.SimpleDateFormat;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import database.CustomerDAO;
import model.Customer;

/**
 * Servlet implementation class login
 */
@WebServlet("/log-in")
public class login extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public login() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String url = null;
		SimpleDateFormat d = new SimpleDateFormat("dd/MM/yyyy");
		Customer customer = CustomerDAO.getInstance().getElementByUsernameAndPassword(username, password);
		if(customer != null) {
			HttpSession session = request.getSession();
			session.setAttribute("username", username);
			session.setAttribute("idCustomer", customer.getIdCustomer());
			session.setAttribute("fullName", customer.getFullName());
			session.setAttribute("avatar", customer.getAvatar());
			session.setAttribute("gender", customer.getGender());
			session.setAttribute("dateOfBirth", d.format(customer.getDateOfBirth()));
			session.setAttribute("phoneNumber", customer.getPhoneNumber());
			session.setAttribute("email", customer.getEmail());
			url = "/index.jsp";
		}
		else {
			request.setAttribute("error", "Username or password is incorrect!");
			url = "/login.jsp";
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
