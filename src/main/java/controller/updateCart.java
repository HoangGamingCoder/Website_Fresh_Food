package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import database.ShoppingCartDAO;
import model.ShoppingCart;


/**
 * Servlet implementation class updateCart
 */
@WebServlet("/updateCart")
public class updateCart extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public updateCart() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		String[] listIDProduct = request.getParameterValues("idProduct");
		String IDCustomer = request.getParameter("idCustomer");
		String[] ListQuantity = request.getParameterValues("quantity");
		
		for(int i=0; i<listIDProduct.length; i++) {
			ShoppingCart shoppingcart = new ShoppingCart(listIDProduct[i],IDCustomer, Integer.parseInt(ListQuantity[i]));
			ShoppingCartDAO.getInstance().update(shoppingcart);
			
		}
		
		response.sendRedirect("shopping-cart.jsp");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
