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
<title>Thông tin sản phẩm</title>
<meta name="keywords" content="">
<meta name="description" content="">
<meta name="author" content="">

<!-- Site Icons -->
<link rel="shortcut icon" href="images/favicon.ico" type="image/x-icon">
<link rel="apple-touch-icon" href="images/apple-touch-icon.png">
<jsp:include page="/WEB-INF/views/common/variables.jsp"></jsp:include>

<jsp:include page="/WEB-INF/views/frontend/layout/css.jsp"></jsp:include>


<!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
      <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>

<body>
	<jsp:include page="/WEB-INF/views/frontend/layout/top-navigation.jsp"></jsp:include>


	<!-- 	<!-- Start All Title Box -->
	<div class="all-title-box">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<ul class="breadcrumb">
						<li class="breadcrumb-item"><a href="${classpath }/shop">Cửa
								hàng</a></li>
						<li class="breadcrumb-item active">Thông tin sản phẩm</li>
					</ul>
				</div>
			</div>
		</div>
	</div>
	-->
	<!-- End All Title Box -->

	<!-- Start Shop Detail  -->
	<div class="shop-detail-box-main">
		<div class="container">
			<div class="row">
				<div class="col-xl-5 col-lg-5 col-md-6">
					<div id="carousel-example-1"
						class="single-product-slider carousel slide" data-ride="carousel">
						<div class="carousel-inner" role="listbox">
							<div class="carousel-item active">
								<img class="d-block w-100"
									src="${classpath }/FileUploads/${product.avatar }" alt="">
							</div>
							<c:forEach var="item" items="${product.productImages }"
								varStatus="">
								<div class="carousel-item">
									<img src="${classpath}/FileUploads/${item.path }"
										class="d-block w-100" alt="">
								</div>
							</c:forEach>

						</div>
						<a class="carousel-control-prev" href="#carousel-example-1"
							role="button" data-slide="prev"> <i class="fa fa-angle-left"
							aria-hidden="true"></i> <span class="sr-only">Previous</span>
						</a> <a class="carousel-control-next" href="#carousel-example-1"
							role="button" data-slide="next"> <i class="fa fa-angle-right"
							aria-hidden="true"></i> <span class="sr-only">Next</span>
						</a>
						<ol class="carousel-indicators">
							<li data-target="#carousel-example-1" data-slide-to="0"
								class="active"><img
								src="${classpath}/FileUploads/${product.avatar }"
								class="d-block w-100 img-fluid"></li>
							<c:forEach var="item" items="${product.productImages }"
								varStatus="loop">
								<li data-target="#carousel-example-1" data-slide-to="0" class=""><img
									src="${classpath}/FileUploads/${item.path }"
									class="d-block w-100 img-fluid"></li>
							</c:forEach>
						</ol>
					</div>
				</div>
				<div class="col-xl-7 col-lg-7 col-md-6">
					<div class="single-product-details">
						<h2 class="product__header-title">${product.name }</h2>
						<c:choose>
							<c:when
								test="${product.salePrice == NULL && product.price == NULL}">
								<h1>Liên hệ</h1>
							</c:when>
							<c:when test="${product.salePrice == NULL }">

								<h5>
									<fmt:formatNumber value="${product.price }"
										minFractionDigits="0"></fmt:formatNumber>
									<sup>vnđ</sup>
								</h5>
							</c:when>
							<c:otherwise>
								<h5>
									<fmt:formatNumber value="${product.salePrice }"
										minFractionDigits="0"></fmt:formatNumber>
									<sup>vnđ</sup>
								</h5>
								<del>
									<h3>
										<fmt:formatNumber value="${product.price }"
											minFractionDigits="0"></fmt:formatNumber>
										<sup>vnđ</sup>
									</h3>
								</del>
							</c:otherwise>
						</c:choose>
						<p class="available-stock">
							<span> Còn 50+ sản phẩm <a href="#">8 đã bán </a></span>
						<p>
						<h4>Mô tả</h4>
						<p>${product.detailDescription
										}</p>
						<ul>
							<li>
								<div class="form-group quantity-box">
									<label class="control-label">Quantity</label><input
										type="number" name="" value="1" id="productQuantity">
								</div>
							</li>
						</ul>
						<c:choose>
							<c:when
								test="${product.salePrice == NULL && product.price == NULL}"></c:when>
							<c:otherwise>
								<div class="price-box-bar">
									<div class="cart-and-bay-btn">
										<a class="btn hvr-hover text-white"
											onclick="addToCart(${product.id},document.getElementById('productQuantity').valueAsNumber, '${product.name }')">
											Thêm vào giỏ hàng<i class='bx bx-cart'></i>
										</a>
									</div>
								</div>
							</c:otherwise>
						</c:choose>

					</div>
				</div>
			</div>

			<div class="row my-5">
				<div class="card card-outline-secondary my-4">
					<div class="card-header">
						<h2>Product Reviews</h2>
					</div>
					<div class="card-body">
						<div class="media mb-3">
							<div class="mr-2">
								<img class="rounded-circle border p-1"
									src="data:image/svg+xml;charset=UTF-8,%3Csvg%20width%3D%2264%22%20height%3D%2264%22%20xmlns%3D%22http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg%22%20viewBox%3D%220%200%2064%2064%22%20preserveAspectRatio%3D%22none%22%3E%3Cdefs%3E%3Cstyle%20type%3D%22text%2Fcss%22%3E%23holder_160c142c97c%20text%20%7B%20fill%3Argba(255%2C255%2C255%2C.75)%3Bfont-weight%3Anormal%3Bfont-family%3AHelvetica%2C%20monospace%3Bfont-size%3A10pt%20%7D%20%3C%2Fstyle%3E%3C%2Fdefs%3E%3Cg%20id%3D%22holder_160c142c97c%22%3E%3Crect%20width%3D%2264%22%20height%3D%2264%22%20fill%3D%22%23777%22%3E%3C%2Frect%3E%3Cg%3E%3Ctext%20x%3D%2213.5546875%22%20y%3D%2236.5%22%3E64x64%3C%2Ftext%3E%3C%2Fg%3E%3C%2Fg%3E%3C%2Fsvg%3E"
									alt="Generic placeholder image">
							</div>
							<div class="media-body">
								<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.
									Omnis et enim aperiam inventore, similique necessitatibus neque
									non! Doloribus, modi sapiente laboriosam aperiam fugiat
									laborum. Sequi mollitia, necessitatibus quae sint natus.</p>
								<small class="text-muted">Posted by Anonymous on 3/1/18</small>
							</div>
						</div>
						<hr>
						<div class="media mb-3">
							<div class="mr-2">
								<img class="rounded-circle border p-1"
									src="data:image/svg+xml;charset=UTF-8,%3Csvg%20width%3D%2264%22%20height%3D%2264%22%20xmlns%3D%22http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg%22%20viewBox%3D%220%200%2064%2064%22%20preserveAspectRatio%3D%22none%22%3E%3Cdefs%3E%3Cstyle%20type%3D%22text%2Fcss%22%3E%23holder_160c142c97c%20text%20%7B%20fill%3Argba(255%2C255%2C255%2C.75)%3Bfont-weight%3Anormal%3Bfont-family%3AHelvetica%2C%20monospace%3Bfont-size%3A10pt%20%7D%20%3C%2Fstyle%3E%3C%2Fdefs%3E%3Cg%20id%3D%22holder_160c142c97c%22%3E%3Crect%20width%3D%2264%22%20height%3D%2264%22%20fill%3D%22%23777%22%3E%3C%2Frect%3E%3Cg%3E%3Ctext%20x%3D%2213.5546875%22%20y%3D%2236.5%22%3E64x64%3C%2Ftext%3E%3C%2Fg%3E%3C%2Fg%3E%3C%2Fsvg%3E"
									alt="Generic placeholder image">
							</div>
							<div class="media-body">
								<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.
									Omnis et enim aperiam inventore, similique necessitatibus neque
									non! Doloribus, modi sapiente laboriosam aperiam fugiat
									laborum. Sequi mollitia, necessitatibus quae sint natus.</p>
								<small class="text-muted">Posted by Anonymous on 3/1/18</small>
							</div>
						</div>
						<hr>
						<div class="media mb-3">
							<div class="mr-2">
								<img class="rounded-circle border p-1"
									src="data:image/svg+xml;charset=UTF-8,%3Csvg%20width%3D%2264%22%20height%3D%2264%22%20xmlns%3D%22http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg%22%20viewBox%3D%220%200%2064%2064%22%20preserveAspectRatio%3D%22none%22%3E%3Cdefs%3E%3Cstyle%20type%3D%22text%2Fcss%22%3E%23holder_160c142c97c%20text%20%7B%20fill%3Argba(255%2C255%2C255%2C.75)%3Bfont-weight%3Anormal%3Bfont-family%3AHelvetica%2C%20monospace%3Bfont-size%3A10pt%20%7D%20%3C%2Fstyle%3E%3C%2Fdefs%3E%3Cg%20id%3D%22holder_160c142c97c%22%3E%3Crect%20width%3D%2264%22%20height%3D%2264%22%20fill%3D%22%23777%22%3E%3C%2Frect%3E%3Cg%3E%3Ctext%20x%3D%2213.5546875%22%20y%3D%2236.5%22%3E64x64%3C%2Ftext%3E%3C%2Fg%3E%3C%2Fg%3E%3C%2Fsvg%3E"
									alt="Generic placeholder image">
							</div>
							<div class="media-body">
								<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.
									Omnis et enim aperiam inventore, similique necessitatibus neque
									non! Doloribus, modi sapiente laboriosam aperiam fugiat
									laborum. Sequi mollitia, necessitatibus quae sint natus.</p>
								<small class="text-muted">Posted by Anonymous on 3/1/18</small>
							</div>
						</div>
						<hr>
						<a href="#" class="btn hvr-hover">Leave a Review</a>
					</div>
				</div>
			</div>

			<div class="row my-5">
				<div class="col-lg-12">
					<div class="title-all text-center">
						<h1>Sản phẩm liên quan</h1>
					</div>
					<div class="featured-products-box owl-carousel owl-theme">
						<div class="item">
							<div class="products-single fix">
								<div class="box-img-hover">
									<img src="images/img-pro-01.jpg" class="img-fluid" alt="Image">
									<div class="mask-icon">
										<ul>
											<li><a href="#" data-toggle="tooltip"
												data-placement="right" title="View"><i
													class="fas fa-eye"></i></a></li>
											<li><a href="#" data-toggle="tooltip"
												data-placement="right" title="Compare"><i
													class="fas fa-sync-alt"></i></a></li>
											<li><a href="#" data-toggle="tooltip"
												data-placement="right" title="Add to Wishlist"><i
													class="far fa-heart"></i></a></li>
										</ul>
										<a class="cart" href="#">Add to Cart</a>
									</div>
								</div>
								<div class="why-text">
									<h4>Lorem ipsum dolor sit amet</h4>
									<h5>$9.79</h5>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>

		</div>
	</div>
	<!-- End Cart -->

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
	<script type="text/javascript">
		$( document ).ready(function() {
			//Dat gia tri cua status ung voi dieu kien search truoc do
			$("#status").val(${productSearch.status});
			$("#categoryId").val(${productSearch.categoryId});
			
			$("#paging").pagination({
				currentPage: ${productSearch.currentPage}, //Trang hien tai
				items: ${productSearch.totalItems}, //Tong so san pham (total products)
				itemsOnPage: ${productSearch.sizeOfPage},
				cssStyle: 'light-theme',
				onPageClick: function(pageNumber, event) {
					$('#page').val(pageNumber);
					$('#btnSearch').trigger('click');
				},
			});
		});
	</script>
</body>

</html>