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
								<form action="${classpath }/admin/contact-list" method="get">


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
													<th scope="col">Name</th>
													<th scope="col">Mobile</th>
													<th scope="col">Email</th>
													<th scope="col">Address</th>
													<th scope="col">Message</th>
													<th scope="col">Create date</th>
													<th scope="col">Update date</th>
													<th scope="col">Status</th>
												</tr>
											</thead>
											<tbody>
												<c:forEach var="contact" items="${contacts }"
													varStatus="loop">
													<tr class="text-white">
														<td>${loop.index + 1 }</td>
														<td>${contact.name }</td>
														<td>${contact.mobile }</td>
														<td>${contact.email }</td>
														<td>${contact.address }</td>
														<td>${contact.message }</td>

														<td><fmt:formatDate value="${contact.createDate }"
																pattern="dd-MM-yyyy" /></td>
														<td><fmt:formatDate value="${contact.updateDate }"
																pattern="dd-MM-yyyy" /></td>
														<td><span id="_contact_status_${contact.id }">
																<c:choose>
																	<c:when test="${contact.status }">
																		<span>Active</span>
																	</c:when>
																	<c:otherwise>
																		<span>Inactive</span>
																	</c:otherwise>
																</c:choose>
														</span></td>
														<td>${user.description }</td>
														<td><a
															href="${classpath }/admin/contact-edit/${contact.id }"
															role="button" class="btn btn-primary">Edit</a> <a
															href="${classpath }/admin/contact-delete/${contact.id }"
															role="button" class="btn btn-secondary">Delete</a></td>
													</tr>
												</c:forEach>
											</tbody>
											<tfoot>
												<tr>
													<th scope="col">No.</th>
													<th scope="col">Name</th>
													<th scope="col">Mobile</th>
													<th scope="col">Email</th>
													<th scope="col">Address</th>
													<th scope="col">Message</th>
													<th scope="col">Create date</th>
													<th scope="col">Update date</th>
													<th scope="col">Status</th>
												</tr>
											</tfoot>
										</table>
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

</body>

</html>