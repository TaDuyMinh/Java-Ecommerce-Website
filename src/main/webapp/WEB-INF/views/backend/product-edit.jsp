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
									action="${classpath }/admin/product-edit-save" method="post"
									modelAttribute="product" enctype="multipart/form-data">

									<div class="form-body">

										<sf:hidden path="id" />
										<!-- id > 0 -> Edit -->

										<div class="row">
											<div class="col-md-6">
												<div class="form-group mb-4">
													<label for="category">Select category</label>
													<sf:select path="category.id" class="form-control text-white"
														id="category">
														<sf:options items="${categories }" itemValue="id"
															itemLabel="name"></sf:options>
													</sf:select>
												</div>
											</div>

											<div class="col-md-6">
												<div class="form-group mb-4">
													<label for="name">Product name</label>
													<sf:input path="name" type="text" class="form-control text-white"
														id="name" name="name" placeholder="product name"></sf:input>
												</div>
											</div>
										</div>

										<div class="row">
											<div class="col-md-6">
												<div class="form-group mb-4">
													<label for="price">Price</label>
													<sf:input path="price" type="number" autocomplete="off"
														id="price" name="price" class="form-control text-white"
														placeholder="price"></sf:input>
												</div>
											</div>

											<div class="col-md-6">
												<div class="form-group mb-4">
													<label for="salePrice">Sale price</label>
													<sf:input path="salePrice" type="number" autocomplete="off"
														id="salePrice" name="salePrice" class="form-control text-white"
														placeholder="Sale price"></sf:input>
												</div>
											</div>
										</div>

										<div class="row">
											<div class="col-md-6">
												<div class="form-group mb-4">
													<label for="create">Create by</label>
													<sf:select path="userCreateProduct.id" class="form-control text-white"
														id="createBy">
														<sf:options items="${users }" itemValue="id"
															itemLabel="username"></sf:options>
													</sf:select>
												</div>
											</div>

											<div class="col-md-6">
												<div class="form-group mb-4">
													<label for="update">Update by</label>
													<sf:select path="userUpdateProduct.id" class="form-control text-white"
														id="updateBy">
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
													<sf:textarea path="shortDescription" id="shortDescription"
														name="shortDescription" class="form-control text-white" rows="3"
														placeholder="Short desription..."></sf:textarea>
												</div>
											</div>
										</div>

										<div class="row">
											<div class="col-md-12">
												<div class="form-group mb-4">
													<label for="detailDescription">Detail description</label>
													<sf:textarea path="detailDescription"
														id="detailDescription" name="detailDescription"
														class="form-control text-white" rows="3"
														placeholder="detail desription..."></sf:textarea>
												</div>
											</div>
										</div>

										<div class="row">
											<div class="col-md-2">
												<div class="form-group mb-4">
													<label for="isHot">&nbsp;&nbsp;&nbsp;&nbsp;</label>
													<sf:checkbox path="isHot" class="form-check-input"
														id="isHot" name="isHot"></sf:checkbox>
													<label for="isHot">Is a hot product?</label>

												</div>
											</div>

											<div class="col-md-10">
												<div class="form-group mb-4">
													<label for="isHot">&nbsp;&nbsp;&nbsp;&nbsp;</label>
													<sf:checkbox path="status" class="form-check-input"
														id="status" name="status"></sf:checkbox>
													<label for="status">Active</label>

												</div>
											</div>

										</div>

										<div class="row">
											<div class="col-md-12">
												<div class="form-group mb-4">
													<label for="avatarFile">Choose product Avatar</label> <input
														id="avatarFile" name="avatarFile" type="file"
														class="form-control-file text-white" multiple="multiple">
												</div>
											</div>
										</div>

										<div class="row">
											<div class="col-md-12">
												<div class="form-group mb-4">
													<label for="image">Choose product Image</label> <input
														id="imageFiles" name="imageFiles" type="file"
														class="form-control-file text-white" multiple="multiple">
												</div>
											</div>
										</div>

										<div class="row">
											<div class="col-md-12">
												<div class="form-group mb-4">
													<label for="image">Choose product Image</label> <input
														id="imageFiles" name="imageFiles" type="file"
														class="form-control-file text-white" multiple="multiple">
												</div>
											</div>
										</div>

										<div class="row">
											<div class="col-md-12">
												<div class="form-group mb-4">
													<label for="image">Choose product Image</label> <input
														id="imageFiles" name="imageFiles" type="file"
														class="form-control-file text-white" multiple="multiple">
												</div>
											</div>
										</div>

										<div class="row">
											<div class="col-md-12">
												<div class="form-group mb-4">
													<label for="image">Choose product Image</label> <input
														id="imageFiles" name="imageFiles" type="file"
														class="form-control-file text-white" multiple="multiple">
												</div>
											</div>
										</div>

										<div class="row">
											<div class="col-md-12">
												<div class="form-group mb-4">
													<a href="${classpath }/admin/product-list"
														class="btn btn-secondary active" role="button"
														aria-pressed="true"> Back to list </a>
													<button type="submit" class="btn btn-primary">Save
														edit product</button>
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