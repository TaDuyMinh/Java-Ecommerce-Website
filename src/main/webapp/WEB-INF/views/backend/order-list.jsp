<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- directive của JSTL -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html dir="ltr" lang="en">

<head>
<!-- Required meta tags -->
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>${title }</title>

<jsp:include page="/WEB-INF/views/common/variables.jsp"></jsp:include>

<jsp:include page="/WEB-INF/views/backend/layout/css.jsp"></jsp:include>

<!-- End layout styles -->
<link rel="shortcut icon"
	href="${classpath }/backend/assets/images/favicon.png" />
</head>

<body>
	<div class="container-scroller">
		<!-- partial:../../partials/_sidebar.html -->
		<jsp:include
			page="/WEB-INF/views/backend/layout/side-bar-navigation.jsp"></jsp:include>

		<!-- partial -->
		<div class="container-fluid page-body-wrapper">
			<!-- partial:../../partials/_navbar.html -->
			<jsp:include
				page="/WEB-INF/views/backend/layout/top-bar-navigation.jsp"></jsp:include>
			<!-- partial -->
			<div class="main-panel">
				<div class="content-wrapper">

					<div class="col-12 grid-margin">
						<div class="card">
							<div class="card-body">
								<form action="${classpath }/admin/order-list" method="get">

									<div class="row">
										<div class="col-md-6">
											<div class="form-group mb-4">
												<h3>Total orders: &nbsp ${orderSearch.totalItems }</h3>
											</div>
										</div>
										<div class="col-md-2">
											<div class="form-group mb-6">
												<label>Current page</label> <input id="page" name="page"
													class="form-control" value="${orderSearch.currentPage }">
											</div>
										</div>
									</div>
									<div class="row">
										<div class="col-md-2">
											<div class="form-group mb-4">

												<select class="form-control text-white" id="status"
													name="status">
													<option value="2">All</option>
													<option value="1">Active</option>
													<option value="0">Inactive</option>
												</select>
											</div>
										</div>



										<div class="col-md-2">
											<input class="form-control text-white" type="date"
												id="beginDate" name="beginDate" />
										</div>
										<div class="col-md-2">
											<input class="form-control text-white" type="date"
												id="endDate" name="endDate" />
										</div>



										<div class="col-md-1">
											<button type="submit" id="btnSearch" name="btnSearch"
												class="btn btn-primary text-white">Search</button>
										</div>
									</div>
									<div class="table-responsive">



										<table id="zero_config" class="table no-wrap">
											<thead>
												<tr>
													<th scope="col">No.</th>
													<th scope="col">Code</th>
													<th scope="col">Customer</th>
													<th scope="col">Mobile</th>
													<th scope="col">Email</th>
													<th scope="col">Address</th>
													<th scope="col">Payment</th>
													<th scope="col">Create date</th>
													<th scope="col">Update date</th>
													<th scope="col">Status</th>
												</tr>
											</thead>
											<tbody>
												<c:forEach var="saleorder" items="${saleorders }"
													varStatus="loop">
													<tr class="text-white">
														<td>${loop.index + 1 }</td>
														<td>${saleorder.code }</td>
														<td>${saleorder.customerName }</td>
														<td>${saleorder.customerMobile }</td>
														<td>${saleorder.customerEmail }</td>
														<td>${saleorder.customerAddress }</td>
														<td><fmt:formatNumber value="${saleorder.total }"
																minFractionDigits="0"></fmt:formatNumber> <sup>vnđ</sup></td>
														<td><fmt:formatDate value="${saleorder.createDate }"
																pattern="dd-MM-yyyy" /></td>
														<td><fmt:formatDate value="${saleorder.updateDate }"
																pattern="dd-MM-yyyy" /></td>
														<td><span id="_saleorder_status_${saleorder.id }">
																<c:choose>
																	<c:when test="${saleorder.status }">
																		<span>Active</span>
																	</c:when>
																	<c:otherwise>
																		<span>Inactive</span>
																	</c:otherwise>
																</c:choose>
														</span></td>
														<td>${user.description }</td>
														<td><a
															href="${classpath }/admin/saleorder-edit/${saleorder.id }"
															role="button" class="btn btn-primary">Edit</a> <a
															href="${classpath }/admin/saleorder-delete/${saleorder.id }"
															role="button" class="btn btn-secondary">Delete</a></td>
													</tr>
												</c:forEach>
											</tbody>
											<tfoot>
												<tr>
													<th scope="col">No.</th>
													<th scope="col">Code</th>
													<th scope="col">Customer</th>
													<th scope="col">Mobile</th>
													<th scope="col">Email</th>
													<th scope="col">Address</th>
													<th scope="col">Payment</th>
													<th scope="col">Create date</th>
													<th scope="col">Update date</th>
													<th scope="col">Status</th>
												</tr>
											</tfoot>
										</table>

										<div class="row mt-5">

											<h1>
												Total sales:
												<fmt:formatNumber value="${totalSales }"
													minFractionDigits="0"></fmt:formatNumber>
												<sup>vnđ</sup>
											</h1>
											<div class="col-md-5">
												<div class="form-group mb-4 d-none">
													<a href="" role="button" class="btn btn-primary">Add
														New User</a>
												</div>
											</div>
											<div class="col-md-6">
												<div class="pagination float-right">
													<div id="paging"></div>
												</div>
											</div>
										</div>
									</div>
								</form>
							</div>
						</div>
					</div>
					<!-- main-panel ends -->
				</div>
				<!-- page-body-wrapper ends -->
			</div>
		</div>
	</div>
	<!-- container-scroller -->
	<!-- plugins:js -->
	<jsp:include page="/WEB-INF/views/backend/layout/js.jsp"></jsp:include>
	<script type="text/javascript">
		$( document ).ready(function() {
			//Dat gia tri cua status ung voi dieu kien search truoc do
			$("#status").val(${userSearch.status});
			$("#paging").pagination({
				currentPage: ${orderSearch.currentPage}, //Trang hien tai
				items: ${orderSearch.totalItems}, //Tong so san pham (total orders)
				itemsOnPage: ${orderSearch.sizeOfPage},
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