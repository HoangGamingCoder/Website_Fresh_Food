package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import database.ProductDAO;
import database.ShoppingCartDAO;
import model.Product;
import model.ShoppingCart;

/**
 * Servlet implementation class insetCart
 */
@WebServlet("/insert-cart")
public class insetCart extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public insetCart() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String idProduct = request.getParameter("idProduct");
		String idCustomer = request.getParameter("idCustomer");
		int quantityBuy = 0;
		Product product = ProductDAO.getInstance().getProductById(idProduct);
		ArrayList<ShoppingCart> carts = ShoppingCartDAO.getInstance().getAllProductByID(idCustomer);
		boolean contain = false;
		for(ShoppingCart cart : carts) {
			if(cart.getIdProduct().equals(idProduct)) {
				contain = true;
				if(cart.getQuantity() + 1 <= product.getQuantity()) {
					quantityBuy = cart.getQuantity() + 1;
				}
				else {
					quantityBuy = product.getQuantity();
				}
				break;
			}
		}
		if(contain) {
			ShoppingCartDAO.getInstance().update(new ShoppingCart(idProduct, idCustomer, quantityBuy));
		}
		else {
			ShoppingCartDAO.getInstance().insert(new ShoppingCart(idProduct, idCustomer, 1));
		}
		response.sendRedirect(request.getParameter("url"));
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
