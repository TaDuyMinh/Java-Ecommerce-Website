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

	<!-- Start Shop Page  -->
	<div class="shop-box-inner">
		<form action="${classpath }/shop" method="get">

			<div class="container">
				<div class="col-md-2">
					<div class="d-none form-group mb-6">
						<label>Current page</label> <input id="page" name="page"
							class="form-control" value="${productSearch.currentPage }">
					</div>
				</div>
				<div class="row">
					<div
						class="col-xl-9 col-lg-9 col-sm-12 col-xs-12 shop-content-right">
						<div class="right-product-box">
							<div class="product-item-filter row">
								<div class="col-8 col-sm-10 text-center d-flex">
									<div class="toolbar-sorter-right ">
										<span>Phân loại:</span> <select id="basic"
											class="selectpicker show-tick form-control " id="categoryId"
											name="categoryId">
											<option value="0">Tất cả</option>
											<c:forEach items="${categories }" var="category">
												<option value="${category.id }">${category.name }</option>
											</c:forEach>
										</select>
									</div>
									<div class="product-categori">
										<div class="search-product">
											<form action="#">
												<input class="form-control" id="keyword" name="keyword"
													placeholder="Nhập từ khóa..." type="text">

											</form>
											<button class="btn btn-primary" type="submit" id="btnSearch"
												name="btnSearch">
												<i class="fa fa-search"></i>
											</button>
										</div>
									</div>
								</div>

								<div class="col-8 col-sm-2 text-center text-sm-right">
									<ul class="nav nav-tabs ml-auto">
										<li><a class="nav-link active" href="#grid-view"
											data-toggle="tab"> <i class="fa fa-th"></i>
										</a></li>
										<li><a class="nav-link" href="#list-view"
											data-toggle="tab"> <i class="fa fa-list-ul"></i>
										</a></li>
									</ul>

								</div>
							</div>

							<div class="product-categorie-box">
								<div class="tab-content">
									<div role="tabpanel" class="tab-pane fade show active"
										id="grid-view">
										<div class="row">
											<c:forEach var="product" items="${products }"
												varStatus="loop">

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
																				title=""><i class="fas fa-heart"> Thêm vào
																						giỏ hàng</i></a></li>
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
															<p>${product.shortDescription }</p>
														</div>
													</div>
												</div>
											</c:forEach>
										</div>
									</div>
									<div role="tabpanel" class="tab-pane fade" id="list-view">
										<div class="list-view-box">
											<c:forEach items="${products }" var="product">

												<div class="row">
													<div class="col-sm-6 col-md-6 col-lg-4 col-xl-4">
														<div class="products-single fix">
															<div class="box-img-hover">
																<div class="type-lb">
																	<p class="new"></p>
																</div>
																<img src="${classpath }/FileUploads/${product.avatar }"
																	class="img-fluid" alt="Image">
															</div>
														</div>
													</div>
													<div class="col-sm-6 col-md-6 col-lg-8 col-xl-8">
														<div class="why-text full-width">
															<h4>${product.name }</h4>
															<c:choose>
																<c:when
																	test="${product.salePrice == NULL && product.price == NULL}">

																	<h2>Liên hệ</h2>
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
															<p>${product.detailDescription }</p>
															<a class="btn hvr-hover"
																href="${classpath }/product-detail/${product.id }">Xem
																sản phẩm</a> <a class="btn hvr-hover" href="#"
																onclick="addToCart(${product.id}, 1, '${product.name }')">Thêm
																vào giỏ hàng</a>
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
					<div
						class="col-xl-3 col-lg-3 col-sm-12 col-xs-12 sidebar-shop-left">
						<div class="product-categori">

							<%-- <div class="filter-sidebar-left">
								<div class="title-left">
									<h3>Categories</h3>
								</div>
								<div
									class="list-group list-group-collapse list-group-sm list-group-tree"
									id="list-group-men" data-children=".sub-men">
									<div class="list-group-collapse sub-men">
										<a class="list-group-item list-group-item-action"
											href="#sub-men1" data-toggle="collapse" aria-expanded="true"
											aria-controls="sub-men1">Fruits & Drinks <small
											class="text-muted">(100)</small>
										</a>
										<div class="collapse show" id="sub-men1"
											data-parent="#list-group-men">
											<div class="list-group">
												<a href="#"
													class="list-group-item list-group-item-action active">Fruits
													1 <small class="text-muted">(50)</small>
												</a> <a href="#" class="list-group-item list-group-item-action">Fruits
													2 <small class="text-muted">(10)</small>
												</a> <a href="#" class="list-group-item list-group-item-action">Fruits
													3 <small class="text-muted">(10)</small>
												</a> <a href="#" class="list-group-item list-group-item-action">Fruits
													4 <small class="text-muted">(10)</small>
												</a> <a href="#" class="list-group-item list-group-item-action">Fruits
													5 <small class="text-muted">(20)</small>
												</a>
											</div>
										</div>
									</div>
									<div class="col-md-2">
										<select class="form-control" id="categoryId" name="categoryId"
											style="margin-right: 10px;">
											<option value="0">Select category</option>
											<c:forEach items="${categories }" var="category">
												<option value="${category.id }">${category.name }</option>
											</c:forEach>
										</select>
									</div>
									<div class="list-group-collapse sub-men">
										<a class="list-group-item list-group-item-action"
											href="#sub-men2" data-toggle="collapse" aria-expanded="false"
											aria-controls="sub-men2">Vegetables <small
											class="text-muted">(50)</small>
										</a>
										<div class="collapse" id="sub-men2"
											data-parent="#list-group-men">
											<div class="list-group">
												<a href="#" class="list-group-item list-group-item-action">Vegetables
													1 <small class="text-muted">(10)</small>
												</a> <a href="#" class="list-group-item list-group-item-action">Vegetables
													2 <small class="text-muted">(20)</small>
												</a> <a href="#" class="list-group-item list-group-item-action">Vegetables
													3 <small class="text-muted">(20)</small>
												</a>
											</div>
										</div>
									</div>
									<a href="#" class="list-group-item list-group-item-action">
										Grocery <small class="text-muted">(150) </small>
									</a> <a href="#" class="list-group-item list-group-item-action">
										Grocery <small class="text-muted">(11)</small>
									</a> <a href="#" class="list-group-item list-group-item-action">
										Grocery <small class="text-muted">(22)</small>
									</a>
								</div>
							</div> --%>
							<div class="filter-price-left">
								<div class="title-left">
									<h3>Mức giá</h3>
								</div>
								<div class="price-box-slider">
									<div id="slider-range"></div>
									<p>
										<input type="text" id="amount" readonly
											style="border: 0; color: #fbb714; font-weight: bold;">


									</p>
									<div class="title-left">
										<h3>Thứ tự xếp loại</h3>
									</div>

									<div class="col-12 col-sm-8 text-center text-sm-left">
										<div class=" toolbar-sorter-right-true">
											<select id="basic"
												class="selectpicker show-tick form-control"
												data-placeholder="">
												<option data-display="Select">Mới nhất</option>
												<option value="1">Phổ biến</option>
												<option value="2">Giá cao -> thấp</option>
												<option value="3">Giá thấp -> Cao</option>
											</select>
										</div>
									</div>
									<p>
										<button class="btn hvr-hover" type="submit">Áp dụng</button>
									</p>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="col-md-6">
					<div class="pagination float-right">
						<div id="paging"></div>
					</div>
				</div>
			</div>
		</form>
	</div>
	<!-- End Shop Page -->

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