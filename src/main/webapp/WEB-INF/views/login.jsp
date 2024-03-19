<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<!-- directive của JSTL -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>${title }</title>

<!-- variables -->
<jsp:include page="/WEB-INF/views/common/variables.jsp"></jsp:include>

<!-- css -->
<jsp:include page="/WEB-INF/views/frontend/layout/css.jsp"></jsp:include>

</head>

<body>
	<jsp:include page="/WEB-INF/views/frontend/layout/top-navigation.jsp"></jsp:include>

	<div class="container">

		<!-- content -->
		<main class="main">
			<!-- Section: Design Block -->
			<section class="text-center text-lg-start">
				<div class="card mb-3">
					<div class="row g-0 d-flex align-items-center">
						<div class="col-lg-4 d-none d-lg-flex">
							<img src="${classpath}/frontend/images/login-image.jpg"
								class="w-100 rounded-t-5 rounded-tr-lg-0 rounded-bl-lg-5" />
						</div>
						<div class="col-lg-8">
							<div class="card-body py-5 px-md-5">
								<p class="text-center h1 fw-bold mb-5 mx-1 mx-md-4 mt-4">Hải
									sản Duy Minh</p>

								<form method="POST" action="${classpath }/login_processing_url"
									class="form-sigin">
									<%-- 
									<input type="hidden" name="${_csrf.parameterName }" value="${csrf.token }" />
									--%>
									<c:if test="${not empty param.login_error }">
										<div class="alert alert-danger" role="alert">Đăng nhập
											không thành công !!!</div>
									</c:if>

									<!-- Username input -->
									<div class="form-outline mb-4">
										<label class="form-label" for="username">Tài khoản</label> <input
											type="text" id="username" name="username"
											class="form-control" />
									</div>

									<!-- Password input -->
									<div class="form-outline mb-4">
										<label class="form-label" for="password">Mật khẩu</label> <input
											type="password" id="password" name="password"
											class="form-control" />
										<%-- $2a$04$4WqDFcz0o3c/y2XVW7VHu.qiXrCHxAZKHpRogGyPNGegNRvtnVEz6 --%>
									</div>

									<!-- 2 column grid layout for inline styling -->
									<div class="row mb-4">
										<div class="col d-flex justify-content-center">
											<!-- Checkbox -->
											<div class="form-check">
												<input class="form-check-input" type="checkbox"
													id="remember-me" name="remember-me" /> <label
													class="form-check-label" for="remember-me"> Ghi nhớ
													thông tin đăng nhập </label>
											</div>
										</div>

										<div class="col">
											<!-- Simple link -->
											<a href="#!">Quên mật khẩu</a>
										</div>
									</div>

									<!-- Submit button -->
									<div class="row mb-4">
										<div class="col md-5"></div>
										<div class="col md-2" align="right">
											<button type="submit" class="btn btn-primary">Đăng
												nhập</button>
										</div>
										<div class="col md-2 d-block ">
											Chưa có tài khoản ?
											<h2>
												<a href="${classpath }/signup""> Đăng ký tại đây</a>
											</h2>


										</div>
										<div class="col md-5"></div>
									</div>
								</form>

							</div>
						</div>
					</div>
				</div>
			</section>
			<!-- Section: Design Block -->
		</main>

		<!-- footer -->
		<jsp:include page="/WEB-INF/views/frontend/layout/footer.jsp"></jsp:include>

		<div class="scroll__top">
			<i class='bx bx-up-arrow-alt'></i>
		</div>

		<!-- mobile menu -->

	</div>
	<!-- js -->
	<jsp:include page="/WEB-INF/views/frontend/layout/js.jsp"></jsp:include>

</body>

</html>