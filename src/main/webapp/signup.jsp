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
<title>Ogani | Sign up</title>

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
					<div class="col-lg-6 col-md-6">
						<div class="header__top__left">
							<ul>
								<li><i class="fa fa-envelope"></i> welcometoOgani@gmail.com</li>
								<li>Free Shipping for all Order of $99</li>
							</ul>
						</div>
					</div>
					<div class="col-lg-6 col-md-6">
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
								<a href="./login.jsp"><i class="fa fa-user"></i> Login</a>
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
							<li><a href="./shop-grid.jsp">Shop</a></li>
							<li><a href="#">Manage product</a></li>
							<li><a href="./blog.html">Blog</a></li>
							<li><a href="./contact.html">Contact</a></li>
						</ul>
					</nav>
				</div>
			</div>
		</div>
	</header>
	<!-- Header Section End -->

	<!-- Signup Section Begin -->
	<div class="row">
		<div class="col-lg-1"></div>
		<div class="col-lg-6">
			<img src="img/login/login-background.jpg" alt="" width="100%">
		</div>
		<div class="col-lg-5">
			<form class="form-format" action="sign-up" method="post" enctype="multipart/form-data">
				<div class="row">
					<div class="col-lg-1"></div>
					<div class="col-lg-8">
						<span class="require">${exist_username}</span>
					</div>
				</div>
				<div class="row">
					<div class="col-lg-1"></div>
					<div class="col-lg-3">
						<strong>SIGN UP PAGE</strong>
					</div>
				</div>
				<div class="row">
					<div class="col-lg-1"></div>
					<div class="col-lg-8">
						<label for="fullName" class="form-label format-label">Full
							name: (<span class="require">*</span>)
						</label> <input type="text" class="form-control" id="fullName"
							name="fullName" value="${fullName}" required="required">
					</div>
				</div>
				<div class="row">
					<div class="col-lg-1"></div>
					<div class="col-lg-8">
						<label class="form-label format-label">Gender: (<span
							class="require">*</span>)
						</label>
						<div class="form-check">
							<input class="form-check-input" type="radio" name="gender"
								id="male" value="Male" required="required" ${gender.equals("Male") ? "checked" : ""}> <label
								class="form-check-label" for="male"> Male</label>
						</div>
						<div class="form-check">
							<input class="form-check-input" type="radio" name="gender"
								id="female" value="Female" required="required" ${gender.equals("Female") ? "checked" : ""}> <label class="form-check-label"
								for="female"> Female</label>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-lg-1"></div>
					<div class="col-lg-8">
						<label class="form-label format-label">Avatar: (<span
							class="require">*</span>)
						</label> <input type="file" name="file" class="form-control" required="required">
					</div>
				</div>
				<div class="row">
					<div class="col-lg-1"></div>
					<div class="col-lg-8">
						<label for="dateOfBirth" class="form-label format-label">Date
							of birth: </label> <input type="date" class="form-control"
							id="dateOfBirth" name="dateOfBirth" value="${dateOfBirth}" required="required">
					</div>
				</div>
				<div class="row">
					<div class="col-lg-1"></div>
					<div class="col-lg-8">
						<label for="phoneNumber" class="form-label format-label">Phone
							number: (<span class="require">*</span>) <span
							class="error-phone require">&emsp;</span>
						</label> <input type="text" class="form-control" id="phoneNumber"
							name="phoneNumber" value="${phoneNumber}" required="required">
					</div>
				</div>
				<div class="row">
					<div class="col-lg-1"></div>
					<div class="col-lg-8">
						<label for="email" class="form-label format-label">Email:
						</label> <input type="email" class="form-control" id="email" name="email" value="${email}">
					</div>
				</div>
				<div class="row">
					<div class="col-lg-1"></div>
					<div class="col-lg-8">
						<label for="username" class="form-label format-label">Username:
							(<span class="require">*</span>) <span
							class="error-username require">&emsp;</span>
						</label> <input type="text" class="form-control" id="username"
							name="username" value="${username}" required="required">
					</div>
				</div>
				<div class="row">
					<div class="col-lg-1"></div>
					<div class="col-lg-8">
						<label for="password" class="form-label format-label">Password:
							(<span class="require">*</span>) <span
							class="error-passwordd require">&emsp;</span>
						</label> <input type="password" class="form-control" id="password"
							name="password" value="${password}" required="required"
							onkeyup="checkConfirmPassword()">
					</div>
				</div>
				<div class="row">
					<div class="col-lg-1"></div>
					<div class="col-lg-8">
						<label for="confirm-password" class="form-label format-label">Confirm
							Password: (<span class="require">*</span>) <span
							class="error-password require">&emsp;</span>
						</label> <input type="password" class="form-control" id="confirm-password"
							name="confirm-password" value="${confirm_password}" required="required"
							onkeyup="checkConfirmPassword()">
					</div>
				</div>
				<div class="row">
					<div class="col-lg-1"></div>
					<div class="col-lg-4">
						<button type="submit" class="btn btn-primary btnSubmit">Register</button>
					</div>
				</div>
			</form>
		</div>
	</div>
	<!-- Signup Section End -->
	
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
		function checkConfirmPassword() {
			var password = document.querySelector("#password").value;
			var confirmPassword = document.querySelector("#confirm-password").value;
			if (password != confirmPassword) {
				document.querySelector(".error-password").innerHTML = "Password does not match";
				return false;
			} else {
				document.querySelector(".error-password").innerHTML = ""
				return true;
			}
		}

		var form = document.querySelector("form");
		form.addEventListener("submit",function(event) {
			event.preventDefault(); // Ngăn chặn hành động mặc định của form

			// Lấy giá trị của các trường dữ liệu
			var phoneNumber = document.querySelector("#phoneNumber").value;
			var username = document.querySelector("#username").value;
			var password = document.querySelector("#password").value;
			
			// Kiểm tra dữ liệu của trường số điện thoại
			if (!validatePhoneNumber(phoneNumber)) {
				document.querySelector(".error-phone").innerHTML = "Invalid phone number"
				return; // Dừng việc submit form nếu số điện thoại không hợp lệ
			}
			else {
				document.querySelector(".error-phone").innerHTML = "";
			}

			// Kiểm tra dữ liệu của trường username
			if (!validateUsername(username)) {
				document.querySelector(".error-username").innerHTML = "Invalid username, username must be between 3 and 16 characters and contain no special characters"
				return; // Dừng việc submit form nếu username không hợp lệ
			}
			else {
				document.querySelector(".error-username").innerHTML = "";
			}

			// Kiểm tra dữ liệu của trường password
			if (!validatePassword(password)) {
				document.querySelector(".error-passwordd").innerHTML = "Invalid password, password must be between 6 and 18 characters and contain no special characters"
				return; // Dừng việc submit form nếu password không hợp lệ
			}
			else {
				document.querySelector(".error-passwordd").innerHTML = "";
			}
			
			if (!checkConfirmPassword()){
				console.log(true);
				return;
			}

			// Nếu dữ liệu của các trường đều hợp lệ, cho phép submit form
			form.submit();
		});

		// Hàm validate số điện thoại
		function validatePhoneNumber(phoneNumber) {
			// Sử dụng regex để kiểm tra số điện thoại
			var regex = /^(0|\+84)(\d{9}|\d{10})$/;
			return regex.test(phoneNumber);
		}

		// Hàm validate username
		function validateUsername(username) {
			// Sử dụng regex để kiểm tra username
			var regex = /^[a-z0-9_-]{3,16}$/;
			return regex.test(username);
		}

		// Hàm validate password
		function validatePassword(password) {
			// Sử dụng regex để kiểm tra password
			var regex = /^[a-z0-9_-]{6,18}$/;
			return regex.test(password);
		}
	</script>
</body>
</html>