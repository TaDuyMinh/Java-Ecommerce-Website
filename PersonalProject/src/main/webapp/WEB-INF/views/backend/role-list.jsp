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
								<h4 class="card-title">Role Table</h4>
								<div class="table-responsive">

									<div class="row">
										<div class="col-md-6">
											<div class="form-group mb-4">
												<a href="${classpath }/admin/role-add" role="button"
													class="btn btn-primary">Add New Role</a>
											</div>
										</div>

										<div class="col-md-6 ">
											<ul class="pagination float-right btn-group" role="group">
												<li class="page-item "><a
													class="page-link disabled btn btn-outline-secondary"
													href="#" tabindex="-1">Previous</a></li>
												<li class="page-item active"><a
													class="page-link btn btn-outline-secondary" href="#">1</a></li>
												<li class="page-item"><a
													class="page-link btn btn-outline-secondary" href="#">2</a></li>
												<li class="page-item"><a
													class="page-link btn btn-outline-secondary" href="#">3</a></li>
												<li class="page-item"><a
													class="page-link btn btn-outline-secondary" href="#">Next</a>
												</li>
											</ul>
										</div>
									</div>

									<table id="zero_config" class="table no-wrap">
										<thead>
											<tr>
												<th scope="col">No.</th>
												<th scope="col">Id</th>
												<th scope="col">Name</th>
												<th scope="col">Create by</th>
												<th scope="col">Update by</th>
												<th scope="col">Create date</th>
												<th scope="col">Update date</th>
												<th scope="col">Status</th>
												<th scope="col">Description</th>
												<th scope="col">Action</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach var="role" items="${roles }" varStatus="loop">
												<tr class="text-white">
													<td>${loop.index + 1 }</td>
													<td>${role.id }</td>
													<td>${role.name }</td>
													<td>${role.userCreateRole.username }</td>
													<td>${role.userUpdateRole.username }</td>
													<td><fmt:formatDate value="${role.createDate }"
															pattern="dd-MM-yyyy" /></td>
													<td><fmt:formatDate value="${role.updateDate }"
															pattern="dd-MM-yyyy" /></td>
													<td><span id="_role_status_${role.id }"> <c:choose>
																<c:when test="${role.status }">
																	<span>Active</span>
																</c:when>
																<c:otherwise>
																	<span>Inactive</span>
																</c:otherwise>
															</c:choose>
													</span></td>
													<td>${role.description }</td>
													<td><a
														href="${classpath }/admin/role-edit/${role.id }"
														role="button" class="btn btn-primary">Edit</a> <a
														href="${classpath }/admin/role-delete/${role.id }"
														role="button" class="btn btn-secondary">Delete</a></td>
												</tr>
											</c:forEach>
										</tbody>
										<tfoot>
											<tr>
												<th scope="col">No.</th>
												<th scope="col">Id</th>
												<th scope="col">Name</th>
												<th scope="col">Create by</th>
												<th scope="col">Update by</th>
												<th scope="col">Create date</th>
												<th scope="col">Update date</th>
												<th scope="col">Status</th>
												<th scope="col">Description</th>
												<th scope="col">Action</th>
											</tr>
										</tfoot>
									</table>

									<div class="row mt-5">
										<div class="col-md-6">
											<div class="form-group mb-4">
												<a href="${classpath }/admin/role-add" role="button"
													class="btn btn-primary">Add New Role</a>
											</div>
										</div>

										<div class="col-md-6 ">
											<ul class="pagination float-right btn-group" role="group">
												<li class="page-item "><a
													class="page-link disabled btn btn-outline-secondary"
													href="#" tabindex="-1">Previous</a></li>
												<li class="page-item active"><a
													class="page-link btn btn-outline-secondary" href="#">1</a></li>
												<li class="page-item"><a
													class="page-link btn btn-outline-secondary" href="#">2</a></li>
												<li class="page-item"><a
													class="page-link btn btn-outline-secondary" href="#">3</a></li>
												<li class="page-item"><a
													class="page-link btn btn-outline-secondary" href="#">Next</a>
												</li>
											</ul>
										</div>
									</div>
								</div>
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
</body>

</html>