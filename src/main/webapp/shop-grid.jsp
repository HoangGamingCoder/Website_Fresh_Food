<%@page import="database.ProductDAO"%>
<%@page import="model.Product"%>
<%@page import="database.ShoppingCartDAO"%>
<%@page import="model.ShoppingCart"%>
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
<title>Ogani | Shop</title>

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
							<div class="header__top__right__auth">
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
									<a href="personal-info.jsp"><i class="fa fa-user"></i> ${username}</a>
								</div>
								<input class="idCustomer" type="hidden" value="<%= idCustomer%>">
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
							<li class="active"><a href="./shop-grid.jsp">Shop</a></li>
							<li><a href="product-management.jsp">Manage product</a></li>
							<li><a href="./blog.html">Blog</a></li>
							<li><a href="./contact.html">Contact</a></li>
						</ul>
					</nav>
				</div>
				<div class="col-lg-2">
					<div class="header__cart">
						<ul>
							<li><a href="shopping-cart.jsp"><i class="fa fa-shopping-bag"></i> <span><%= carts.size()%></span></a></li>
						</ul>
						<div class="header__cart__price">
							item: <span>$<%= totalMoney%></span>
						</div>
					</div>
				</div>
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
							<i class="fa fa-bars"></i> <span>All categories</span>
						</div>
						<ul>
							<li><a href="#">Fresh fruits</a></li>
							<li><a href="#">Dried fruits</a></li>
							<li><a href="#">Vegetables</a></li>
							<li><a href="#">Drink fruits</a></li>
							<li><a href="#">Fresh meats</a></li>
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
						<h2>Organi Shop</h2>
						<div class="breadcrumb__option">
							<a href="./index.jsp">Home&nbsp;&nbsp;</a><span>Shop</span>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Breadcrumb Section End -->

	<!-- Product Section Begin -->
	<section class="product spad">
		<div class="container">
			<div class="row">
				<div class="col-lg-3 col-md-5">
					<div class="sidebar">
						<div class="sidebar__item">
							<h4>Department</h4>
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
							</ul>
						</div>
						<div class="sidebar__item">
							<h4>Price</h4>
							<div class="price-range-wrap">
								<div
									class="price-range ui-slider ui-corner-all ui-slider-horizontal ui-widget ui-widget-content"
									data-min="10" data-max="540">
									<div class="ui-slider-range ui-corner-all ui-widget-header"></div>
									<span tabindex="0"
										class="ui-slider-handle ui-corner-all ui-state-default"></span>
									<span tabindex="0"
										class="ui-slider-handle ui-corner-all ui-state-default"></span>
								</div>
								<div class="range-slider">
									<div class="price-input">
										<input type="text" id="minamount"> <input type="text"
											id="maxamount">
									</div>
								</div>
							</div>
						</div>
						<div class="sidebar__item sidebar__item__color--option">
							<h4>Colors</h4>
							<div class="sidebar__item__color sidebar__item__color--white">
								<label for="white"> White <input type="radio" id="white">
								</label>
							</div>
							<div class="sidebar__item__color sidebar__item__color--gray">
								<label for="gray"> Gray <input type="radio" id="gray">
								</label>
							</div>
							<div class="sidebar__item__color sidebar__item__color--red">
								<label for="red"> Red <input type="radio" id="red">
								</label>
							</div>
							<div class="sidebar__item__color sidebar__item__color--black">
								<label for="black"> Black <input type="radio" id="black">
								</label>
							</div>
							<div class="sidebar__item__color sidebar__item__color--blue">
								<label for="blue"> Blue <input type="radio" id="blue">
								</label>
							</div>
							<div class="sidebar__item__color sidebar__item__color--green">
								<label for="green"> Green <input type="radio" id="green">
								</label>
							</div>
						</div>
						<div class="sidebar__item">
							<h4>Popular Size</h4>
							<div class="sidebar__item__size">
								<label for="large"> Large <input type="radio" id="large">
								</label>
							</div>
							<div class="sidebar__item__size">
								<label for="medium"> Medium <input type="radio"
									id="medium">
								</label>
							</div>
							<div class="sidebar__item__size">
								<label for="small"> Small <input type="radio" id="small">
								</label>
							</div>
							<div class="sidebar__item__size">
								<label for="tiny"> Tiny <input type="radio" id="tiny">
								</label>
							</div>
						</div>
						<div class="sidebar__item">
							<div class="latest-product__text">
								<h4>Latest Products</h4>
								<div class="latest-product__slider owl-carousel">
									<div class="latest-prdouct__slider__item">
										<a href="#" class="latest-product__item">
											<div class="latest-product__item__pic">
												<img src="img/latest-product/lp-1.jpg" alt="">
											</div>
											<div class="latest-product__item__text">
												<h6>Crab Pool Security</h6>
												<span>$30.00</span>
											</div>
										</a> <a href="#" class="latest-product__item">
											<div class="latest-product__item__pic">
												<img src="img/latest-product/lp-2.jpg" alt="">
											</div>
											<div class="latest-product__item__text">
												<h6>Crab Pool Security</h6>
												<span>$30.00</span>
											</div>
										</a> <a href="#" class="latest-product__item">
											<div class="latest-product__item__pic">
												<img src="img/latest-product/lp-3.jpg" alt="">
											</div>
											<div class="latest-product__item__text">
												<h6>Crab Pool Security</h6>
												<span>$30.00</span>
											</div>
										</a>
									</div>
									<div class="latest-prdouct__slider__item">
										<a href="#" class="latest-product__item">
											<div class="latest-product__item__pic">
												<img src="img/latest-product/lp-1.jpg" alt="">
											</div>
											<div class="latest-product__item__text">
												<h6>Crab Pool Security</h6>
												<span>$30.00</span>
											</div>
										</a> <a href="#" class="latest-product__item">
											<div class="latest-product__item__pic">
												<img src="img/latest-product/lp-2.jpg" alt="">
											</div>
											<div class="latest-product__item__text">
												<h6>Crab Pool Security</h6>
												<span>$30.00</span>
											</div>
										</a> <a href="#" class="latest-product__item">
											<div class="latest-product__item__pic">
												<img src="img/latest-product/lp-3.jpg" alt="">
											</div>
											<div class="latest-product__item__text">
												<h6>Crab Pool Security</h6>
												<span>$30.00</span>
											</div>
										</a>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="col-lg-9 col-md-7">
					<div class="section-title product__discount__title">
						<h2>All products</h2>
					</div>
					<div class="filter__item">
						<%
						ArrayList<Product> listProduct = ProductDAO.getInstance().getAllProduct();
						%>
						<div class="row">
							<div class="col-lg-4 col-md-5">
								<div class="filter__sort">
									<span>Sort By</span> <select>
										<option value="0">Default</option>
										<option value="0">Default</option>
									</select>
								</div>
							</div>
							<div class="col-lg-4 col-md-4">
								<div class="filter__found">
									<h6>
										<span><%=listProduct.size()%></span> Products found
									</h6>
								</div>
							</div>
							<div class="col-lg-4 col-md-3">
								<div class="filter__option">
									<span class="icon_grid-2x2"></span> <span class="icon_ul"></span>
								</div>
							</div>
						</div>
					</div>
					<div class="row" id="productsList"></div>
					<div class="pagination" id="pagination"></div>
				</div>
			</div>
		</div>
	</section>
	<!-- Product Section End -->

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
									class="fa fa-heart" aria-hidden="true"></i> OGANI
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
	var idCustomer = document.querySelector(".idCustomer").value;
	var currentPage = 1;
	var productsPerPage = 6;
	var products = [
		  <%for (Product product : listProduct) {%>
		    {
		      id: "<%=product.getIdProduct()%>",
		      name: "<%=product.getNameProduct()%>",
		      newPrice: <%=product.getNewPrice()%>,
		      oldPrice: <%=product.getOldPrice()%>,
		      img: "<%=product.getImg()%>"
		    },
		  <%}%>
		];
	function displayProducts(products, wrapper, rowsPerPage, page) {
	    wrapper.innerHTML = "";
	    page--;
	    var start = rowsPerPage * page;
	    var end = start + rowsPerPage;
	    var paginatedProducts = products.slice(start, end);

	    for (var i = 0; i < paginatedProducts.length; i++) {
	        var product = paginatedProducts[i];
	        var html1 =
	            `<div class="col-lg-4 col-md-6 col-sm-6">
	                <div class="product__item">
	                    <div class="product__item__pic">
	                    	<img src="img/product/`
	                    	var html2 = 
	               			`">
	                        <ul class="product__item__pic__hover">
	                            <li><a href=`
	            var html3 = `><i class="fa fa-shopping-cart"></i></a></li>
	                        </ul>
	                    </div>
	                    <div class="product__item__text">
	                    <h6><a href=`;
	            var html4 =
	            	`</a></h6>
                <div class="product__item__price">
			    	<h5>$`
			    var html5 =
			    	`</h5>
			        	<span style="text-decoration: line-through;">$`
			 	var html6 = 
			 		`</span>
			            </div>
			        </div>
			    </div>
			</div>`;
			var cart = "insert-cart?idProduct=" + product.id + "&url=shop-grid.jsp&idCustomer=" + idCustomer;
			var detail = "detail-product?idProduct=" + product.id 
	        wrapper.innerHTML += html1 + product.img + html2 + cart + html3 + detail + ">" + product.name + html4 + product.newPrice + html5 + product.oldPrice + html6;
	    }
	}

	function setupPagination(products, wrapper, rowsPerPage) {
	    wrapper.innerHTML = "";

	    var pageCount = Math.ceil(products.length / rowsPerPage);

	    for (var i = 1; i <= pageCount; i++) {
	        var button = document.createElement('button');
	        button.innerText = i;
	        button.classList.add('page-button');
	        button.addEventListener('click', function () {
	            currentPage = parseInt(this.innerText);
	            displayProducts(products, document.getElementById('productsList'), productsPerPage, currentPage);
	            updatePaginationButtons();
	        });
	        wrapper.appendChild(button);
	    }

	    updatePaginationButtons();
	}

	function updatePaginationButtons() {
	    var buttons = document.querySelectorAll('.page-button');
	    for (var i = 0; i < buttons.length; i++) {
	        buttons[i].classList.remove('active');
	        if (buttons[i].innerText == currentPage) {
	            buttons[i].classList.add('active');
	        }
	    }
	}

	displayProducts(products, document.getElementById('productsList'), productsPerPage, currentPage);
	setupPagination(products, document.getElementById('pagination'), productsPerPage);
	</script>
</body>
</html>