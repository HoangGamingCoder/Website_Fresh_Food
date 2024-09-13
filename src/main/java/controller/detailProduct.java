package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import database.ProductDAO;
import model.Product;

/**
 * Servlet implementation class detailProduct
 */
@WebServlet("/detail-product")
public class detailProduct extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public detailProduct() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String idProduct = request.getParameter("idProduct");
		Product product = ProductDAO.getInstance().getProductById(idProduct);
		request.setAttribute("idProduct", product.getIdProduct());
		request.setAttribute("nameProduct", product.getNameProduct());
		request.setAttribute("oldPrice", product.getOldPrice());
		request.setAttribute("newPrice", product.getNewPrice());
		request.setAttribute("img", product.getImg());
		request.setAttribute("describe", product.getDescribe());
		String url = "/shop-details.jsp";
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
