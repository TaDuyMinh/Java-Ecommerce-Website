<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- directive của JSTL -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
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
	<jsp:include page="/WEB-INF/views/frontend/layout/top-navigation.jsp"></jsp:include>

	<!-- Start Cart  -->
	<div class="cart-box-main">
		<div class="container">
			<c:choose>
				<c:when test="${totalCartProducts > 0 }">
					<form action="${classpath }/cart-view" method="get">
						<div class="row">

							<div class="col-12">
								<h3 align="center"
									class="page-title text-truncate text-dark font-weight-medium mb-1">
									Your cart: ${message }</h3>
							</div>

						</div>
						<div class="row">
							<div class="col-lg-12">
								<div class="table-main table-responsive">
									<table class="table">
										<thead>
											<tr>
												<th>Ảnh</th>
												<th>Tên sản phẩm</th>
												<th>Giá</th>
												<th>Số lượng</th>
												<th>Tổng</th>
												<th>Xóa sản phẩm</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach var="item" items="${cart.cartProducts }"
												varStatus="loop">
												<tr>
													<td class="thumbnail-img"><a href="#"><img
															width="60px" height="60px"
															src="${classpath}/FileUploads/${item.avatar }"
															class="light-logo"> </a></td>
													<td class="name-pr"><a href="#">${item.productName }</a></td>
													<td class="price-pr"><fmt:formatNumber
															value="${item.price }" minFractionDigits="0" /></td>
													<td class="quantity-box"><button
															onclick="updateProductQuantity(${item.productId }, -1)"
															value="-">-</button> <strong><span
															id="productQuantity_${item.productId }">${item.quantity }</span></strong>
														<button
															onclick="updateProductQuantity(${item.productId }, 1)"
															value="+">+</button></td>
													<td class="total-pr"><fmt:formatNumber
															value="${item.price * item.quantity }"
															minFractionDigits="0" /></td>
													<td class="remove-pr"><a
														href="${classpath }/product-cart-delete/${item.productId }"
														role="button" class="btn btn-secondary fas fa-times"></a></td>
												</tr>
											</c:forEach>
										</tbody>

									</table>
									<div class="float-right d-flex gr-total">
										<h5>Tổng thanh toán :</h5>
										<div class="ml-auto h1">
											<fmt:formatNumber value="${totalCartPrice }"
												minFractionDigits="0"></fmt:formatNumber>
											<sup>vnđ</sup>
										</div>
									</div>

								</div>
							</div>
						</div>
					</form>
					<div class="page-breadcrumb">
						<div class="row"></div>
						<div class="row">
							<div class="main__products-title">
								<p>Thông tin khách hàng</p>
							</div>
						</div>
						<form action="${classpath }/cart-view" method="get">
							<div class="row">

								<div class="col-12">
									<div class="card">
										<div class="card-body">
											<div class="form-body">
												<div class="row">

													<div class="col-md-12">
														<div class="form-group mb-4">
															<input type="text" class="form-control" id="txtName"
																name="txtName" placeholder="Họ và tên"
																value="${user.name }" />
														</div>
													</div>
												</div>

												<div class="row">

													<div class="col-md-12">
														<div class="form-group mb-4">
															<input type="text" class="form-control" id="txtMobile"
																name="txtMobile" placeholder="Số điện thoại"
																value="${user.mobile }" />
														</div>
													</div>
												</div>

												<div class="row">

													<div class="col-md-12">
														<div class="form-group mb-4">
															<input type="email" class="form-control" id="txtEmail"
																name="txtEmail" placeholder="Email"
																value="${user.email }" />
														</div>
													</div>
												</div>

												<div class="row">

													<div class="col-md-12">
														<div class="form-group mb-4">
															<input type="text" class="form-control" id="txtAddress"
																name="txtAddress" placeholder="Địa chỉ"
																value="${user.address }" />
														</div>
													</div>
												</div>
												<!-- <div class="row d-none">
													<div class="col-md-12">
														<div class="form-group mb-4">
															<input  class="form-control text-white"
																type="date" id="createDate" name="createDate" />
														</div>
													</div>

													<div class="col-md-6">
														<div class="form-group mb-4">
															<input  class="form-control text-white"
																type="date" id="updateDate" name="updateDate" />
														</div>
													</div>
												</div> -->
												<div class="row">
													<div class="col-md-12">
														<div class="form-group mb-4">
															<div class="update-box">
																<input onclick="_placeOrder()" value="Đặt hàng"
																	type="submit">
															</div>
														</div>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>

							</div>
						</form>
					</div>
				</c:when>
				<c:otherwise>
					<div class="row">
						<div class="col-12">
							<c:choose>
								<c:when test="${checkout }">
									<h3 align="center"
										class="page-title text-truncate text-dark font-weight-medium mb-1">
										<span id="placeOrderSuccess">Bạn đã đặt hàng thành công</span>
									</h3>
								</c:when>
								<c:otherwise>
									<h3 align="center"
										class="page-title text-truncate text-dark font-weight-medium mb-1">
										<span id="placeOrderSuccess">Giỏ hàng của bạn:
											${errorMessage }</span>
									</h3>
								</c:otherwise>
							</c:choose>

						</div>
					</div>
					<div class="row">
						<div class="col-md-12" align="center">
							<div class="form-group mb-4">
								<a href="${classpath }/index" class="btn btn-primary active"
									role="button" aria-pressed="true"> Quay trở về </a>
							</div>
						</div>
					</div>

				</c:otherwise>
			</c:choose>
		</div>
	</div>

	<jsp:include page="/WEB-INF/views/frontend/layout/bottom-slider.jsp"></jsp:include>


	<jsp:include page="/WEB-INF/views/frontend/layout/footer.jsp"></jsp:include>



	<a href="#" id="back-to-top" title="Back to top" style="display: none;">&uarr;</a>

	<jsp:include page="/WEB-INF/views/frontend/layout/js.jsp"></jsp:include>
	<script type="text/javascript">
		updateProductQuantity = function(_productId, _quantity) {
			let data = {
				productId : _productId, //lay theo id
				quantity : _quantity
			};

			//$ === jQuery
			jQuery.ajax({
				url : "/update-product-quantity",
				type : "POST",
				contentType : "application/json",
				data : JSON.stringify(data),
				dataType : "json", //Kieu du lieu tra ve tu controller la json

				success : function(jsonResult) {
					let totalProducts = jsonResult.totalCartProducts;

					//viet lai so quantity product
					$("#productQuantity_" + jsonResult.productId).html(
							jsonResult.newQuantity);
				},

				error : function(jqXhr, textStatus, errorMessage) {
					alert("An error occur");
				}
			});
		}
	</script>

	<script type="text/javascript">
		function _placeOrder() {
			//javascript object
			let data = {
				txtName : jQuery("#txtName").val(),
				txtEmail : jQuery("#txtEmail").val(), //Get by Id
				txtMobile : jQuery("#txtMobile").val(),
				txtAddress : jQuery("#txtAddress").val(),
			};

			//$ === jQuery
			jQuery.ajax({
				url : "/place-order",
				type : "POST",
				contentType : "application/json",
				data : JSON.stringify(data),
				dataType : "json", //Kieu du lieu tra ve tu controller la json

				success : function(jsonResult) {
					alert(jsonResult.code + ": " + jsonResult.message);
					$("#placeOrderSuccess").html(jsonResult.message);
				},

				error : function(jqXhr, textStatus, errorMessage) {
					alert("An error occur");
				}
			});
		}
	</script>
</body>

</html>