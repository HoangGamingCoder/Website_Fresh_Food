<%@page import="model.ShoppingCart"%>
<%@page import="model.Product"%>
<%@page import="model.Customer"%>
<%@page import="database.ShoppingCartDAO"%>
<%@page import="database.ProductDAO"%>
<%@page import="database.CustomerDAO"%>
<%@page import="java.util.ArrayList"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="description" content="Ogani Template">
<meta name="keywords" content="Ogani, unica, creative, html">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>Ogani | Shopping cart</title>

<!-- Google Font -->
<link
	href="https://fonts.googleapis.com/css2?family=Cairo:wght@200;300;400;600;900&display=swap"
	rel="stylesheet">

<!-- Icon logo -->
<link rel="icon" href="img/icon.png">

<!-- Css Styles -->
<link rel="stylesheet" href="css/bootstrap.min.css" type="text/css">
<link rel="stylesheet" href="css/font-awesome.min.css" type="text/css">
<link rel="stylesheet" href="css/elegant-icons.css" type="text/css">
<link rel="stylesheet" href="css/nice-select.css" type="text/css">
<link rel="stylesheet" href="css/jquery-ui.min.css" type="text/css">
<link rel="stylesheet" href="css/owl.carousel.min.css" type="text/css">
<link rel="stylesheet" href="css/slicknav.min.css" type="text/css">
<link rel="stylesheet" href="css/style.css" type="text/css">
</head>

<body>
	<!-- Page Preloder -->
	<div id="preloder">
		<div class="loader"></div>
	</div>

	<!-- Header Section Begin -->
	<header class="header">
		<div class="header__top">
			<div class="container">
				<div class="row">
					<div class="col-lg-6">
						<div class="header__top__left">
							<ul>
								<li><i class="fa fa-envelope"></i> welcometoOgani@gmail.com</li>
								<li>Free Shipping for all Order of $99</li>
							</ul>
						</div>
					</div>
					<div class="col-lg-6">
						<div class="header__top__right">
							<div class="header__top__right__social">
								<a href="#"><i class="fa fa-facebook"></i></a> <a href="#"><i
									class="fa fa-twitter"></i></a> <a href="#"><i
									class="fa fa-linkedin"></i></a> <a href="#"><i
									class="fa fa-pinterest-p"></i></a>
							</div>
							<div class="header__top__right__language">
								<img src="img/language.png" alt="">
								<div>English</div>
								<span class="arrow_carrot-down"></span>
								<ul>
									<li><a href="#">Spanis</a></li>
									<li><a href="#">English</a></li>
								</ul>
							</div>
							<%
							String username = (String) session.getAttribute("username");
							String idCustomer = (String) session.getAttribute("idCustomer");
							ArrayList<Product> products = ProductDAO.getInstance().getAllProduct();
							ArrayList<ShoppingCart> carts = ShoppingCartDAO.getInstance().getAllProductByID(idCustomer);
							double totalMoney = 0;
							for (ShoppingCart cart : carts){
								for (Product product : products) {
									if (product.getIdProduct().equals(cart.getIdProduct())) {
										totalMoney += cart.getQuantity() * product.getNewPrice();
									}
								}
							}
							if (username != null) {
							%>
							<div class="header__top__right__auth">
								<a href="personal-info.jsp"><i class="fa fa-user"></i>
									${username}</a>
							</div>
							<%
							} else {
							%>
							<div class="header__top__right__auth">
								<a href="./login.jsp"><i class="fa fa-user"></i> Login</a>
							</div>
							<%
							}
							%>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="container">
			<div class="row">
				<div class="col-lg-3">
					<div class="header__logo">
						<a href="./index.jsp"><img src="img/logo.png" alt=""></a>
					</div>
				</div>
				<div class="col-lg-7">
					<nav class="header__menu">
						<ul>
							<li><a href="./index.jsp">Home</a></li>
							<li><a href="./shop-grid.jsp">Shop</a></li>
							<li><a href="#">Manage product</a></li>
							<li><a href="./blog.html">Blog</a></li>
							<li><a href="./contact.html">Contact</a></li>
						</ul>
					</nav>
				</div>
				<div class="col-lg-2">
					<div class="header__cart">
						<ul>
							<li><a href="shopping-cart.jsp"><i
									class="fa fa-shopping-bag"></i> <span><%= carts.size() %></span></a></li>
						</ul>
						<div class="header__cart__price">
							item: <span>$<%= totalMoney %></span>
						</div>
					</div>
				</div>
			</div>
			<div class="humberger__open">
				<i class="fa fa-bars"></i>
			</div>
		</div>
	</header>
	<!-- Header Section End -->

	<!-- Hero Section Begin -->
	<section class="hero hero-normal">
		<div class="container">
			<div class="row">
				<div class="col-lg-3">
					<div class="hero__categories">
						<div class="hero__categories__all">
							<i class="fa fa-bars"></i> <span>All departments</span>
						</div>
						<ul>
							<li><a href="#">Fresh Meat</a></li>
							<li><a href="#">Vegetables</a></li>
							<li><a href="#">Fruit &amp; Nut Gifts</a></li>
							<li><a href="#">Fresh Berries</a></li>
							<li><a href="#">Ocean Foods</a></li>
							<li><a href="#">Butter &amp; Eggs</a></li>
							<li><a href="#">Fastfood</a></li>
							<li><a href="#">Fresh Onion</a></li>
							<li><a href="#">Papayaya &amp; Crisps</a></li>
							<li><a href="#">Oatmeal</a></li>
							<li><a href="#">Fresh Bananas</a></li>
						</ul>
					</div>
				</div>
				<div class="col-lg-9">
					<div class="hero__search">
						<div class="hero__search__form">
							<form action="#">
								<div class="hero__search__categories">
									All Categories <span class="arrow_carrot-down"></span>
								</div>
								<input type="text" placeholder="What do you need?">
								<button type="submit" class="site-btn">SEARCH</button>
							</form>
						</div>
						<div class="hero__search__phone">
							<div class="hero__search__phone__icon">
								<i class="fa fa-phone"></i>
							</div>
							<div class="hero__search__phone__text">
								<h5>+84 34.870.7913</h5>
								<span>support 24/7 time</span>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Hero Section End -->

	<!-- Breadcrumb Section Begin -->
	<section class="breadcrumb-section set-bg"
		data-setbg="img/breadcrumb.jpg">
		<div class="container">
			<div class="row">
				<div class="col-lg-12 text-center">
					<div class="breadcrumb__text">
						<h2>Shopping Cart</h2>
						<div class="breadcrumb__option">
							<a href="./index.jsp">Home&nbsp;&nbsp;</a> <span>Shopping
								Cart</span>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Breadcrumb Section End -->

	<!-- Shoping Cart Section Begin -->
	<section class="shoping-cart spad">

		<div class="container">
			<form action="updateCart" method="get">
				<div class="row">
					<div class="col-lg-12">
						<div class="shoping__cart__table">
							<table>
								<thead>
									<tr>
										<th class="shoping__product">Products</th>
										<th>Price</th>
										<th>Quantity</th>
										<th>Total</th>
										<th></th>
									</tr>
								</thead>
								<tbody>
									<%
									ArrayList<ShoppingCart> listShoppingCart = ShoppingCartDAO.getInstance().getAllProductByID(idCustomer);
									ArrayList<Product> listProduct = ProductDAO.getInstance().getAllProduct();
									%>
									<input type="hidden" value="<%=idCustomer%>" class="idCustomer"
										name="idCustomer">
									<%
									for (ShoppingCart shoppingcart : listShoppingCart) {
										Product product = ProductDAO.getInstance().getProductById(shoppingcart.getIdProduct());
									%>
									<tr>
										<input type="hidden" value="<%=shoppingcart.getIdProduct()%>"
											class="idProduct" name="idProduct">


										<td class="shoping__cart__item"><img
											src="img/product/<%=product.getImg()%>" alt="">
											<h5><%=product.getNameProduct()%></h5></td>
										<td class="shoping__cart__price">$<%=product.getNewPrice()%>
										</td>
										<td class="shoping__cart__quantity">
											<div class="quantity">
												<div class="pro-qty">
													<input type="text" class="quantity" value="<%=shoppingcart.getQuantity()%>"
														name="quantity">
												</div>
											</div>
										</td>
										<td class="shoping__cart__total">$110.00</td>
										<td class="shoping__cart__item__close"><a
											href="deleteCart?idProduct=<%=shoppingcart.getIdProduct()%>&idCustomer=<%=idCustomer%>"><span
												class="icon_close"></span> </a></td>
									</tr>
									<%
									}
									%>
								</tbody>
							</table>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-lg-12">
						<div class="shoping__cart__btns">
							<a href="index.jsp" class="primary-btn cart-btn">CONTINUE
								SHOPPING</a>
							<button type="submit" class="update-cart">
								<a class="primary-btn cart-btn cart-btn-right"><span
									class="icon_loading"></span> Upadate Cart</a>
							</button>
						</div>
					</div>
					<div class="col-lg-6">
						<div class="shoping__continue">
							<div class="shoping__discount">
								<h5>Discount Codes</h5>
								<div>
									<input type="text" placeholder="Enter your coupon code">
									<button type="button" class="site-btn">APPLY COUPON</button>
								</div>
							</div>
						</div>
					</div>
					<div class="col-lg-6">
						<div class="shoping__checkout">
							<h5>Cart Total</h5>
							<ul id="total-list">
								<li>Subtotal <span>$454.98</span></li>
								<li>Total <span id="total-price">$454.98</span></li>
							</ul>
							<a href="#" class="primary-btn">PROCEED TO CHECKOUT</a>
						</div>
					</div>
				</div>
			</form>
		</div>
	</section>
	<!-- Shoping Cart Section End -->

	<!-- Footer Section Begin -->
	<footer class="footer spad">
		<div class="container">
			<div class="row">
				<div class="col-lg-3 col-md-6 col-sm-6">
					<div class="footer__about">
						<div class="footer__about__logo">
							<a href="./index.jsp"><img src="img/logo.png" alt=""></a>
						</div>
						<ul>
							<li>Address: 48 Cao Thắng</li>
							<li>Phone: +84 34.870.7913</li>
							<li>Email: welcometoOgani@gmail.com</li>
						</ul>
					</div>
				</div>
				<div class="col-lg-4 col-md-6 col-sm-6 offset-lg-1">
					<div class="footer__widget">
						<h6>Useful Links</h6>
						<ul>
							<li><a href="#">About Us</a></li>
							<li><a href="#">About Our Shop</a></li>
							<li><a href="#">Secure Shopping</a></li>
							<li><a href="#">Delivery infomation</a></li>
							<li><a href="#">Privacy Policy</a></li>
							<li><a href="#">Our Sitemap</a></li>
						</ul>
						<ul>
							<li><a href="#">Who We Are</a></li>
							<li><a href="#">Our Services</a></li>
							<li><a href="#">Projects</a></li>
							<li><a href="#">Contact</a></li>
							<li><a href="#">Innovation</a></li>
							<li><a href="#">Testimonials</a></li>
						</ul>
					</div>
				</div>
				<div class="col-lg-4 col-md-12">
					<div class="footer__widget">
						<h6>Join Our Newsletter Now</h6>
						<p>Get E-mail updates about our latest shop and special
							offers.</p>
						<form action="#">
							<input type="text" placeholder="Enter your mail">
							<button type="submit" class="site-btn">Subscribe</button>
						</form>
						<div class="footer__widget__social">
							<a href="#"><i class="fa fa-facebook"></i></a> <a href="#"><i
								class="fa fa-instagram"></i></a> <a href="#"><i
								class="fa fa-twitter"></i></a> <a href="#"><i
								class="fa fa-pinterest"></i></a>
						</div>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-lg-12">
					<div class="footer__copyright">
						<div class="footer__copyright__text">
							<p>
								<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
								Copyright &copy;
								<script>
									document.write(new Date().getFullYear());
								</script>
								All rights reserved | This template is made with <i
									class="fa fa-heart" aria-hidden="true"></i> by OGANI
								<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
							</p>
						</div>
						<div class="footer__copyright__payment">
							<img src="img/payment-item.png" alt="">
						</div>
					</div>
				</div>
			</div>
		</div>
	</footer>
	<!-- Footer Section End -->

	<!-- Js Plugins -->
	<script src="js/jquery-3.3.1.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/jquery.nice-select.min.js"></script>
	<script src="js/jquery-ui.min.js"></script>
	<script src="js/jquery.slicknav.js"></script>
	<script src="js/mixitup.min.js"></script>
	<script src="js/owl.carousel.min.js"></script>
	<script src="js/main.js"></script>
	<script>
		// Lặp qua từng hàng trong bảng
		var tableRows = document.querySelectorAll("tbody tr");
		tableRows
				.forEach(function(row) {
					// Lấy giá trị price và quantity của sản phẩm
					var price = row.querySelector(".shoping__cart__price").textContent
							.replace("$", "");
					var quantityInput = row.querySelector(".pro-qty input");
					var quantity = quantityInput.value;
					// Tính giá trị tổng và hiển thị nó trong cột Total
					var total = price * quantity;
					row.querySelector(".shoping__cart__total").textContent = "$"
							+ total.toFixed(2);
					// Cập nhật giá trị Total trong đầu vào
					var totalInput = document.createElement("input");
					totalInput.setAttribute("type", "hidden");
					totalInput.setAttribute("name", "total");
					totalInput.setAttribute("value", total);
					row.appendChild(totalInput);
					// Thêm sự kiện lắng nghe khi số lượng sản phẩm thay đổi để tính toán lại tổng giá trị
					quantityInput.addEventListener("input",function() {
									var newQuantity = quantityInput.value;
										var newTotal = price * newQuantity;
										row
												.querySelector(".shoping__cart__total").textContent = "$"
												+ newTotal.toFixed(2);
										totalInput.setAttribute("value",
												newTotal);
									});
					// Thêm sự kiện lắng nghe khi click vào nút tăng hoặc giảm số lượng sản phẩm để tính toán lại tổng giá trị
					var quantityBtns = row.querySelectorAll(".qtybtn");
					
					quantityBtns.forEach(function(btn) {
								btn.addEventListener("click", function() {
													var newQuantity = parseInt(quantityInput.value);
													if (btn.classList
															.contains("inc")) {
														newQuantity++;
													} else {
														newQuantity = newQuantity > 1 ? newQuantity - 1
																: 0;
													}
													
													var newTotal = price
															* newQuantity;
													
													row
															.querySelector(".shoping__cart__total").textContent = "$"
															+ newTotal
																	.toFixed(2);
													totalInput.setAttribute(
															"value", newTotal);
													let totalElements = document.getElementsByClassName("shoping__cart__total");
													let total = 0;
													for (let i = 0; i < totalElements.length; i++) {
													total += parseFloat(totalElements[i].innerHTML.replace("$", ""));}
													let subtotalElement = document.querySelector(".shoping__checkout li:first-child span");
													let totalElement = document.querySelector(".shoping__checkout li:last-child span");
													subtotalElement.innerHTML = "$" + total.toFixed(2);
													totalElement.innerHTML = "$" + total.toFixed(2);
												});
							});
				});
		function updateTotalPrice() {
			  let total = 0;
			  let priceElements = document.getElementsByClassName("shoping__cart__price");
			  let quantityElements = document.getElementsByName("quantity");
			  let totalElements = document.getElementsByClassName("shoping__cart__total");
			  
			  for (let i = 0; i < priceElements.length; i++) {
			    let price = parseFloat(priceElements[i].innerHTML.replace("$", ""));
			    let quantity = parseInt(quantityElements[i].value);
			    let subTotal = price * quantity;
			    total += subTotal;
			    totalElements[i].innerHTML = "$" + subTotal.toFixed(2);
			  }
			  
			  let subtotalElement = document.querySelector(".shoping__checkout li:first-child span");
			  let totalElement = document.querySelector(".shoping__checkout li:last-child span");
			  subtotalElement.innerHTML = "$" + total.toFixed(2);
			  totalElement.innerHTML = "$" + total.toFixed(2);
			}

			// Gọi hàm updateTotalPrice() khi trang tải xong
			window.onload = function() {
			  updateTotalPrice();
			};

			// Gọi hàm updateTotalPrice() khi người dùng thay đổi số lượng sản phẩm
			let quantityElements = document.getElementsByName("quantity");
			for (let i = 0; i < quantityElements.length; i++) {
			  quantityElements[i].addEventListener("change", updateTotalPrice);
			}
			
	</script>
</body>
</html>