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
	<c:set var="currentPage" value="${currentPage }" scope="session"></c:set>
	<c:set var="totalPage" value="${totalPage }" scope="session"></c:set>

	<jsp:include page="/WEB-INF/views/frontend/layout/top-navigation.jsp"></jsp:include>


	<!-- Start All Title Box -->
	<div class="all-title-box">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">

					<ul class="breadcrumb">
						<li class="breadcrumb-item"><a href="${classpath }/index">Trang
								chủ</a></li>
						<li class="breadcrumb-item active">Cửa hàng</li>
					</ul>
				</div>
			</div>
		</div>
	</div>
	<!-- End All Title Box -->

	<!-- Start About Page  -->
	<div class="about-box-main">
		<div class="container">
			<div class="row">
				<div class="col-lg-6">
					<div class="banner-frame">
						<img class="img-fluid" src="${classpath}/frontend/images/banner-01.jpg" alt="" />
					</div>
				</div>
				<div class="col-lg-6">
					<h2 class="noo-sh-title-top">
						Hải sản <span>Duy Minh</span>
					</h2>
					<p>"Sed ut perspiciatis unde omnis iste natus error sit
						voluptatem accusantium doloremque laudantium, totam rem aperiam,
						eaque ipsa quae ab illo inventore veritatis et quasi architecto
						beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia
						voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur
						magni dolores eos qui ratione voluptatem sequi nesciunt. Neque
						porro quisquam est, qui dolorem ipsum quia dolor sit amet,
						consectetur, adipisci velit, sed quia non numquam eius modi
						tempora incidunt ut labore et dolore magnam aliquam quaerat
						voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem
						ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi
						consequatur? Quis autem vel eum iure reprehenderit qui in ea
						voluptate velit esse quam nihil molestiae consequatur.</p>
					<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed
						do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut
						enim ad minim veniam, quis nostrud exercitation ullamco laboris
						nisi ut aliquip ex ea commodo consequat.</p>
					<a class="btn hvr-hover" href="#">Read More</a>
				</div>
			</div>
			<div class="row my-5">
				<div class="col-sm-6 col-lg-4">
					<div class="service-block-inner">
						<h3>Uy tín</h3>
						<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit,
							sed do eiusmod tempor incididunt ut labore et dolore magna
							aliqua.</p>
					</div>
				</div>
				<div class="col-sm-6 col-lg-4">
					<div class="service-block-inner">
						<h3>Chất lượng</h3>
						<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit,
							sed do eiusmod tempor incididunt ut labore et dolore magna
							aliqua.</p>
					</div>
				</div>
				<div class="col-sm-6 col-lg-4">
					<div class="service-block-inner">
						<h3>Phục vụ tận tâm</h3>
						<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit,
							sed do eiusmod tempor incididunt ut labore et dolore magna
							aliqua.</p>
					</div>
				</div>
			</div>
			<div class="row my-4">
				<div class="col-12">
					<h2 class="noo-sh-title">Các thành viên chính</h2>
				</div>
				<div class="col-sm-6 col-lg-3">
					<div class="hover-team">
						<div class="our-team">
							<img src="${classpath}/frontend/images/CEO.jpg" alt="" />
							<div class="team-content">
								<h3 class="title">Tạ Duy Minh</h3>
								<span class="post">CEO</span>
							</div>
							<ul class="social">
								<li><a href="#" class="fab fa-facebook"></a></li>
								<li><a href="#" class="fab fa-twitter"></a></li>
								<li><a href="#" class="fab fa-google-plus"></a></li>
								<li><a href="#" class="fab fa-youtube"></a></li>
							</ul>
							<div class="icon">
								<i class="fa fa-plus" aria-hidden="true"></i>
							</div>
						</div>
						<div class="team-description">
						
						</div>
						<hr class="my-0">
					</div>
				</div>
				<div class="col-sm-6 col-lg-3">
					<div class="hover-team">
						<div class="our-team">
							<img src="${classpath}/frontend/images/CEO.jpg" alt="" />
							<div class="team-content">
								<h3 class="title">Tạ Duy Minh</h3>
								<span class="post">Web Developer</span>
							</div>
							<ul class="social">
								<li><a href="#" class="fab fa-facebook"></a></li>
								<li><a href="#" class="fab fa-twitter"></a></li>
								<li><a href="#" class="fab fa-google-plus"></a></li>
								<li><a href="#" class="fab fa-youtube"></a></li>
							</ul>
							<div class="icon">
								<i class="fa fa-plus" aria-hidden="true"></i>
							</div>
						</div>
						<div class="team-description">
						
						</div>
						<hr class="my-0">
					</div>
				</div>
				<div class="col-sm-6 col-lg-3">
					<div class="hover-team">
						<div class="our-team">
							<img src="${classpath}/frontend/images/CEO.jpg" alt="" />
							<div class="team-content">
								<h3 class="title">Tạ Duy Minh</h3>
								<span class="post">Admin</span>
							</div>
							<ul class="social">
								<li><a href="#" class="fab fa-facebook"></a></li>
								<li><a href="#" class="fab fa-twitter"></a></li>
								<li><a href="#" class="fab fa-google-plus"></a></li>
								<li><a href="#" class="fab fa-youtube"></a></li>
							</ul>
							<div class="icon">
								<i class="fa fa-plus" aria-hidden="true"></i>
							</div>
						</div>
						<div class="team-description">
						
						</div>
						<hr class="my-0">
					</div>
				</div>
				<div class="col-sm-6 col-lg-3">
					<div class="hover-team">
						<div class="our-team">
							<img src="${classpath}/frontend/images/CEO.jpg" alt="" />
							<div class="team-content">
								<h3 class="title">Tạ Duy Minh</h3>
								<span class="post">Customer Support</span>
							</div>
							<ul class="social">
								<li><a href="#" class="fab fa-facebook"></a></li>
								<li><a href="#" class="fab fa-twitter"></a></li>
								<li><a href="#" class="fab fa-google-plus"></a></li>
								<li><a href="#" class="fab fa-youtube"></a></li>
							</ul>
							<div class="icon">
								<i class="fa fa-plus" aria-hidden="true"></i>
							</div>
						</div>
						<div class="team-description">
						
						</div>
						<hr class="my-0">
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- End About Page -->

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