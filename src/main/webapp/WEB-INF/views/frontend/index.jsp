<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">
<!-- Basic -->

<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">

<!-- Mobile Metas -->
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- Site Metas -->
<title>${title }</title>
<meta name="keywords" content="">
<meta name="description" content="">
<meta name="author" content="">

<!-- Site Icons -->
<link rel="shortcut icon"
	href="${classpath}/frontend/images/favicon.ico" type="image/x-icon">
<link rel="apple-touch-icon"
	href="${classpath}/frontend/images/apple-touch-icon.png">

<jsp:include page="/WEB-INF/views/common/variables.jsp"></jsp:include>
<jsp:include page="/WEB-INF/views/frontend/layout/css.jsp"></jsp:include>


<!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
      <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>

<body>
	<!-- Preloader -->
	<div class="spinner-wrapper">
		<div class="spinner">
			<div class="bounce1"></div>
			<div class="bounce2"></div>
			<div class="bounce3"></div>
		</div>
	</div>
	<jsp:include page="/WEB-INF/views/frontend/layout/top-navigation.jsp"></jsp:include>

	<!-- Start Slider -->
	<div id="slides-shop" class="cover-slides">
		<ul class="slides-container">
			<li class="text-center"><img
				src="${classpath}/frontend/images/banner-01.jpg" alt="">
				<div class="container">
					<div class="row">
						<div class="col-md-12">
							<h1 class="m-b-20">
								<strong> HẢI SẢN DUY MINH </strong>
							</h1>
							<p class="m-b-40">
								Hải sản tươi sống nhập khẩu Quảng Ninh <br> vận chuyển hỏa
								tốc đến ngôi nhà của bạn
							</p>
							<p>
								<a class="btn hvr-hover" href="#">ĐẶT HÀNG NGAY !</a>
							</p>
						</div>
					</div>
				</div></li>
			<li class="text-center"><img
				src="${classpath}/frontend/images/banner-02.jpg" alt="">
				<div class="container">
					<div class="row">
						<div class="col-md-12">
							<h1 class="m-b-20">
								<strong> HẢI SẢN DUY MINH </strong>
							</h1>
							<p class="m-b-40">
								Hải sản tươi sống nhập khẩu Quảng Ninh <br> vận chuyển hỏa
								tốc đến ngôi nhà của bạn
							</p>
							<p>
								<a class="btn hvr-hover" href="#">ĐẶT HÀNG NGAY !</a>
							</p>
						</div>
					</div>
				</div></li>
			<li class="text-center"><img
				src="${classpath}/frontend/images/banner-03.jpg" alt="">
				<div class="container">
					<div class="row">
						<div class="col-md-12">
							<h1 class="m-b-20">
								<strong> HẢI SẢN DUY MINH </strong>
							</h1>
							<p class="m-b-40">
								Hải sản tươi sống nhập khẩu Quảng Ninh <br> vận chuyển hỏa
								tốc đến ngôi nhà của bạn
							</p>
							<p>
								<a class="btn hvr-hover" href="#">ĐẶT HÀNG NGAY !</a>
							</p>
						</div>
					</div>
				</div></li>
		</ul>
		<div class="slides-navigation">
			<a href="#" class="next"><i class="fa fa-angle-right"
				aria-hidden="true"></i></a> <a href="#" class="prev"><i
				class="fa fa-angle-left" aria-hidden="true"></i></a>
		</div>
	</div>
	<!-- End Slider -->

	<!-- Start Categories  -->
	<div class="categories-shop">
		<div class="container">
			<div class="row">
				<div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
					<div style="height: 250px" class="shop-cat-box">
						<img class="img-fluid"
							src="${classpath}/frontend/images/categories_img_01.jpg" /> <a
							class="btn hvr-hover" href="${classpath }/shop">Cá</a>
					</div>
				</div>
				<div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
					<div style="height: 250px" class="shop-cat-box">
						<img class="img-fluid"
							src="${classpath}/frontend/images/categories_img_02.jpg" alt="" />
						<a class="btn hvr-hover" href="${classpath }/shop">Sò, ốc</a>
					</div>
				</div>
				<div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
					<div style="height: 250px" class="shop-cat-box">
						<img class="img-fluid"
							src="${classpath}/frontend/images/categories_img_03.jpg" alt="" />
						<a class="btn hvr-hover" href="${classpath }/shop">Tôm, Cua</a>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- End Categories -->

	<div class="box-add-products">
		<div class="container">
			<div class="row">
				<!-- <div class=" col-lg-12 col-md-12 col-sm-12">
					<div class="offer-box-products">
						<img class="img-fluid" src="" alt="" />
					</div>
				</div> -->
			</div>
		</div>
	</div>

	<!-- Start Products  -->
	<div class="products-box">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="title-all text-center">
						<h1>Các sản phẩm đang HOT !!!</h1>

					</div>
				</div>
			</div>
			<!-- 	<div class="row">
				<div class="col-lg-12">
					<div class="special-menu text-center">
						<div class="button-group filter-button-group">
							<button class="active" data-filter="*">Tất cả</button>
							<button data-filter=".fresh">Tươi sống</button>
							<button data-filter=".frozen">Đông lạnh, chế biến sẵn</button>
						</div>
					</div>
				</div>
			</div> -->
			<div class="product-categorie-box">
				<div class="tab-content">
					<div role="tabpanel" class="tab-pane fade show active"
						id="grid-view">
						<div class="row">
							<c:forEach items="${products }" var="product">

								<div class="col-sm-6 col-md-6 col-lg-4 col-xl-4">
									<div class="products-single fix">
										<div class="box-img-hover">
											<div class="type-lb">
												<p class=""></p>
											</div>
											<img src="${classpath }/FileUploads/${product.avatar }"
												class="img-fluid" alt="Image">
											<c:choose>
												<c:when
													test="${product.salePrice == NULL && product.price == NULL}">
													<div class="mask-icon">
														<ul>
															<li><a
																href="${classpath }/product-detail/${product.id }"
																class="fas fa-eye " title=""> Xem sản phẩm</a></li>

														</ul>

													</div>
												</c:when>
												<c:otherwise>
													<div class="mask-icon">
														<ul>
															<li><a
																href="${classpath }/product-detail/${product.id }"
																class="fas fa-eye " title=""> Xem sản phẩm</a></li>
															<li><a href="#"
																onclick="addToCart(${product.id}, 1, '${product.name }')"
																title=""><i class="fas fa-heart"> Thêm vào giỏ
																		hàng</i></a></li>
														</ul>

													</div>
												</c:otherwise>
											</c:choose>
										</div>
										<div class="why-text">
											<h1>
												<a href="${classpath }/product-detail/${product.id }"
													class="content-link"> <span class="product__name">${product.name }</span>
												</a>
											</h1>
											<c:choose>
												<c:when
													test="${product.salePrice == NULL && product.price == NULL}">
													<h1>Liên hệ</h1>
												</c:when>
												<c:when test="${product.salePrice == NULL }">
													<h3>
														<fmt:formatNumber value="${product.price }"
															minFractionDigits="0"></fmt:formatNumber>
														<sup>vnđ</sup>
													</h3>
												</c:when>
												<c:otherwise>
													<h2>
														<fmt:formatNumber value="${product.salePrice }"
															minFractionDigits="0"></fmt:formatNumber>
														<sup>vnđ</sup>
													</h2>
													<del>
														<h3>
															<fmt:formatNumber value="${product.price }"
																minFractionDigits="0"></fmt:formatNumber>
															<sup>vnđ</sup>
														</h3>
													</del>
												</c:otherwise>
											</c:choose>
										</div>
									</div>
								</div>
							</c:forEach>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- End Products  -->

	<!-- Start Blog  -->
	<div class="latest-blog">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="title-all text-center">
						<h1>Phản hồi từ khách hàng</h1>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-md-6 col-lg-4 col-xl-4">
					<div class="blog-box">
						<div class="blog-img">
							<img class="img-fluid" height="100%"
								src="${classpath}/frontend/images/Blank-Customer-Profile.jpg" alt="" />
						</div>
						<div class="blog-content">
							<div class="title-blog">
								<h3>Customer</h3>
								<p>I highly recommend Duy Minh to seafood enthusiasts
									seeking the best that Hanoi has to offer. Prepare to be
									impressed by the exceptional freshness and outstanding service
									that this remarkable shop provides. Best regards, Donald J.
									Trump</p>
							</div>
							<ul class="option-blog">
								<li><a href="#"><i class="far fa-heart"></i></a></li>
							</ul>

						</div>
					</div>
				</div>
				<div class="col-md-6 col-lg-4 col-xl-4">
					<div class="blog-box">
						<div class="blog-img">
							<img class="img-fluid" height="100%"
								src="${classpath}/frontend/images/Blank-Customer-Profile.jpg" alt="" />
						</div>
						<div class="blog-content">
							<div class="title-blog">
								<h3>Customer</h3>
								<p>I highly recommend Duy Minh to seafood enthusiasts
									seeking the best that Hanoi has to offer. Prepare to be
									impressed by the exceptional freshness and outstanding service
									that this remarkable shop provides. Best regards, Donald J.
									Trump</p>
							</div>
							<ul class="option-blog">
								<li><a href="#"><i class="far fa-heart"></i></a></li>
							</ul>

						</div>
					</div>
				</div>
				<div class="col-md-6 col-lg-4 col-xl-4">
					<div class="blog-box">
						<div class="blog-img">
							<img class="img-fluid" height="100%"
								src="${classpath}/frontend/images/Blank-Customer-Profile.jpg" alt="" />
						</div>
						<div class="blog-content">
							<div class="title-blog">
								<h3>Customer</h3>
								<p>I highly recommend Duy Minh to seafood enthusiasts
									seeking the best that Hanoi has to offer. Prepare to be
									impressed by the exceptional freshness and outstanding service
									that this remarkable shop provides. Best regards, Donald J.
									Trump</p>
							</div>
							<ul class="option-blog">
								<li><a href="#"><i class="far fa-heart"></i></a></li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- End Blog  -->


	<jsp:include page="/WEB-INF/views/frontend/layout/bottom-slider.jsp"></jsp:include>


	<jsp:include page="/WEB-INF/views/frontend/layout/footer.jsp"></jsp:include>



	<a href="#" id="back-to-top" title="Back to top" style="display: none;">&uarr;</a>

	<jsp:include page="/WEB-INF/views/frontend/layout/js.jsp"></jsp:include>
	<!-- Add to cart -->
	<script type="text/javascript">
		addToCart = function(_productId, _quantity, _productName) {
			alert("Thêm " + _quantity + " sản phẩm '" + _productName
					+ "' vào giỏ hàng ");
			let data = {
				productId : _productId, //lay theo id
				quantity : _quantity,

			};

			//$ === jQuery
			jQuery.ajax({
				url : "/add-to-cart",
				type : "POST",
				contentType : "application/json",
				data : JSON.stringify(data),
				dataType : "json", //Kieu du lieu tra ve tu controller la json

				success : function(jsonResult) {
					/* alert(jsonResult.code + ": " + jsonResult.message); */
					let totalProducts = jsonResult.totalCartProducts;
					$("#totalCartProductsId").html(totalProducts);
				},

				error : function(jqXhr, textStatus, errorMessage) {
					alert(jsonResult.code + ': Đã có lỗi xay ra...!')
				},
			});
		}
	</script>
</body>

</html>