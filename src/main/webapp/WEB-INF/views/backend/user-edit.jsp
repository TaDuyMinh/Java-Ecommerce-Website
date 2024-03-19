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
								<sf:form class="form"
									action="${classpath }/admin/user-edit-save" method="post"
									modelAttribute="user" enctype="multipart/form-data">
									<div class="form-body">

										<sf:hidden path="id" />
										<!-- id > 0 => update -->

										<div class="row">
											<div class="col-md-6">
												<div class="form-group mb-4">
													<label for="username">User name</label>
													<sf:input path="username" type="text" class="form-control text-white"
														id="username" name="username" placeholder="user name"></sf:input>
												</div>
											</div>

											<div class="col-md-6">
												<div class="form-group mb-4">
													<label for="password">Password</label>
													<sf:input path="password" type="passward"
														class="form-control text-white" id="password" name="password"
														placeholder="password"></sf:input>
												</div>
											</div>
										</div>

										<div class="row">
											<div class="col-md-6">
												<div class="form-group mb-4">
													<label for="name">Full name</label>
													<sf:input path="name" type="text" class="form-control text-white"
														id="name" name="name" placeholder="full name"></sf:input>
												</div>
											</div>

											<div class="col-md-6">
												<div class="form-group mb-4">
													<label for="mobile">Mobile</label>
													<sf:input path="mobile" type="text" class="form-control text-white"
														id="mobile" name="mobile" placeholder="mobile"></sf:input>
												</div>
											</div>
										</div>

										<div class="row">
											<div class="col-md-6">
												<div class="form-group mb-4">
													<label for="email">Email</label>
													<sf:input path="email" type="text" class="form-control text-white"
														id="email" name="email" placeholder="email"></sf:input>
												</div>
											</div>

											<div class="col-md-6">
												<div class="form-group mb-4">
													<label for="address">Address</label>
													<sf:input path="address" type="text" class="form-control text-white"
														id="address" name="address" placeholder="address"></sf:input>
												</div>
											</div>
										</div>

										<div class="row">
											<div class="col-md-6">
												<div class="form-group mb-4">
													<label for="role">Create by</label>
													<sf:select path="userCreateUser.id" class="form-control text-white"
														id="userCreateUser">
														<sf:options items="${users }" itemValue="id"
															itemLabel="username"></sf:options>
													</sf:select>
												</div>
											</div>

											<div class="col-md-6">
												<div class="form-group mb-4">
													<label for="role">Update by</label>
													<sf:select path="userUpdateUser.id" class="form-control text-white"
														id="userUpdateUser">
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
													<a href="${classpath }/admin/user-list"
														class="btn btn-secondary active" role="button"
														aria-pressed="true"> Back to list </a>
													<button type="submit" class="btn btn-primary">Save
														user</button>
												</div>
											</div>
										</div>

									</div>
								</sf:form>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- main-panel ends -->
		</div>
		<!-- page-body-wrapper ends -->
	</div>
	<!-- container-scroller -->
	<!-- plugins:js -->
	<jsp:include page="/WEB-INF/views/backend/layout/js.jsp"></jsp:include>
</body>

</html>