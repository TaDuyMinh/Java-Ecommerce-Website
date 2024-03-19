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
								<sf:form class="form" action="${classpath }/admin/role-add-save"
									method="post" modelAttribute="role"
									enctype="multipart/form-data">
									<div class="form-body">

										<div class="row">
											<div class="col-md-6">
												<div class="form-group mb-4">
													<label for="name">Role name</label>
													<sf:input path="name" type="text" class="form-control text-white"
														id="name" name="name" placeholder="role name"></sf:input>
												</div>
											</div>





											<div class="row">
												<div class="col-md-6">
													<div class="form-group mb-4">
														<label for="role">Create by</label>
														<sf:select path="userCreateRole.id" class="form-control text-white"
															id="userCreateRole">
															<sf:options items="${users }" itemValue="id"
																itemLabel="username"></sf:options>
														</sf:select>
													</div>
												</div>

												<div class="col-md-6">
													<div class="form-group mb-4">
														<label for="role">Update by</label>
														<sf:select path="userUpdateRole.id" class="form-control text-white"
															id="userUpdateRole">
															<sf:options items="${users }" itemValue="id"
																itemLabel="username"></sf:options>
														</sf:select>
													</div>
												</div>
											</div>

											<div class="row">
												<div class="col-md-6">
													<div class="form-group mb-4">
														<label for="createdate">Create date</label>

														<sf:input path="createDate" class="form-control text-white"
															type="date" id="createDate" name="createDate"></sf:input>
													</div>
												</div>

												<div class="col-md-6">
													<div class="form-group mb-4">
														<label for="updatedate">Update date</label>

														<sf:input path="updateDate" class="form-control text-white"
															type="date" id="updateDate" name="updateDate"></sf:input>
													</div>
												</div>
											</div>

											<div class="row">
												<div class="col-md-12">
													<div class="form-group mb-4">
														<label for="description">Description</label>
														<sf:textarea path="description" id="description"
															name="description" class="form-control text-white" rows="3"
															placeholder="desription..."></sf:textarea>
													</div>
												</div>
											</div>

											<div class="row">



												<div class="col-md-6">
													<div class="form-group mb-4">
														<label for="status">&nbsp;&nbsp;&nbsp;&nbsp;</label>
														<sf:checkbox path="status" class="form-check-input"
															id="status" name="status"></sf:checkbox>
														<label for="status">Active</label>
													</div>
												</div>

											</div>

											<div class="row">
												<div class="col-md-12">
													<div class="form-group mb-4">
														<a href="${classpath }/admin/role-list"
															class="btn btn-secondary active" role="button"
															aria-pressed="true"> Back to list </a>
														<button type="submit" class="btn btn-primary">Save
															role</button>
													</div>
												</div>
											</div>
										</div>

									</div>
								</sf:form>
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