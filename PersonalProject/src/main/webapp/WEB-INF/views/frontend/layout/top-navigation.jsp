<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!-- Start Main Top -->
<div class="main-top">
	<div class="container-fluid">
		<div class="row">
			<div class=" col-lg-4 col-md-6 col-sm-12 col-xs-12">
				<div class="right-phone-box">
					<p>
						Đặt hàng : <a href="#"> 0388888888</a>
					</p>
				</div>
				<div class="our-link">
					<ul>
						<li><a href="#"><i class="fas fa-location-arrow"></i> Địa
								chỉ </a></li>
						<li><a href="#"><i class="fas fa-headset"></i> Liên hệ
								với chúng tôi</a></li>
					</ul>
				</div>
			</div>
			<div class="col-lg-4 col-md-6 col-sm-12 col-xs-12">
				<div class="text-slid-box">
					<div id="offer-box" class="carouselTicker">
						<ul class="offer-box">
							<li><i class="fab fa-opencart"></i> Giảm giá 20% cho đơn
								hàng đầu tiên!</li>
							<li><i class="fab fa-opencart"></i> Hải sản tươi sống</li>
							<li><i class="fab fa-opencart"></i> Giảm 10% các loại hàu
								sống!</li>
							<li><i class="fab fa-opencart"></i> Hải sản nhập khẩu Quảng
								Ninh</li>
							<li><i class="fab fa-opencart"></i> Giảm 80% cho học viên
								tại Devpro !</li>
						</ul>
					</div>
				</div>
			</div>
			<div class="col-lg-4 col-md-6 col-sm-12 col-xs-12">
				<div class="our-link">
					<c:choose>
						<c:when test="${isLogined == true}">
							<ul>
								<li><a class="btn disabled" href="#"><i class="fas "></i>
										Welcome, ${loginedUser.name } </a></li>

								<li><a href="#"><i
										class="fa fa-user s_color"></i> Tài khoản </a></li>
								<li><a href="${classpath }/logout"><i
										class=""></i> Đăng xuất </a></li>
							</ul>
						</c:when>
						<c:otherwise>
							<ul>
								<li><a href="${classpath }/login"><i
										class="fa fa-user s_color"></i> Đăng nhập </a></li>
							</ul>
						</c:otherwise>
					</c:choose>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- End Main Top -->

<!-- Start Main Top -->
<header class="main-header">
	<!-- Start Navigation -->
	<nav
		class="navbar navbar-expand-lg navbar-light bg-light navbar-default bootsnav">
		<div class="container">
			<!-- Start Header Navigation -->
			<div class="navbar-header">
				<button class="navbar-toggler" type="button" data-toggle="collapse"
					data-target="#navbar-menu" aria-controls="navbars-rs-food"
					aria-expanded="false" aria-label="Toggle navigation">
					<i class="fa fa-bars"></i>
				</button>
				<a class="navbar-brand" href="index.html"><img
					src="images/logo.png" class="logo" alt=""></a>
			</div>
			<!-- End Header Navigation -->

			<!-- Collect the nav links, forms, and other content for toggling -->
			<div class="collapse navbar-collapse" id="navbar-menu">
				<ul class="nav navbar-nav ml-auto" data-in="fadeInDown"
					data-out="fadeOutUp">
					<li class="nav-item "><a class="nav-link"
						href="${classpath }/index">Trang chủ</a></li>
					<li class="nav-item"><a class="nav-link" href="${classpath }/about">Thông
							tin </a></li>
					<li class="nav-item"><a class="nav-link"
						href="${classpath }/shop">Cửa hàng</a></li>

					<li class="nav-item"><a class="nav-link"
						href="${classpath }/contact">Liên hệ</a></li>
				</ul>
			</div>
			<!-- /.navbar-collapse -->

			<!-- Start Atribute Navigation -->
			<div class="attr-nav">
				<ul>
					<li class="search"><a href="#"><i class="fa fa-search"></i></a></li>
					<li class="side-menu"><a href="${classpath }/cart-view"> <i
							class="fa fa-shopping-bag"></i> <span id="totalCartProductsId"
							class="badge">${totalCartProducts }</span>
							<p>Giỏ hàng</p>
					</a></li>
				</ul>
			</div>
			<!-- End Atribute Navigation -->
		</div>
		<!-- Start Side Menu -->
	<%-- 	<div class="side">
			<a href="#" class="close-side"><i class="fa fa-times"></i></a>
			<div class="cart-box">
				<c:forEach var="item" items="${cart.cartProducts }" varStatus="loop">
					<ul class="cart-list">

						<li><a href="#" class="photo"><img
								src="${classpath}/FileUploads/${item.avatar }"
								class="cart-thumb"> </a>
							<h6>
								<a href="#">${item.productName }</a>
							</h6>
							<p>
								${item.quantity }x - <span class="price"><fmt:formatNumber
										value="${item.price }" minFractionDigits="0" /><sup>vnđ</sup></span>
							</p></li>

					</ul>
				</c:forEach>
				<ul class="cart-list">
					<li class="total"><a href="${classpath }/cart-view"
						class="btn btn-default hvr-hover btn-cart">VIEW CART</a></li>
				</ul>
			</div>

		</div> --%>
		<!-- End Side Menu -->
	</nav>
	<!-- End Navigation -->
</header>
<!-- End Main Top -->

<!-- Start Top Search -->
<div class="top-search">
	<div class="container">
		<div class="input-group">
			<span class="input-group-addon"><i class="fa fa-search"></i></span> <input
				type="text" class="form-control" placeholder="Search"> <span
				class="input-group-addon close-search"><i class="fa fa-times"></i></span>
		</div>
	</div>
</div>
<!-- End Top Search -->