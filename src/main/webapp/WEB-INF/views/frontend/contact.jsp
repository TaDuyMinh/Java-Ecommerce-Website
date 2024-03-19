<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
	<!-- Preloader -->
	<div class="spinner-wrapper">
		<div class="spinner">
			<div class="bounce1"></div>
			<div class="bounce2"></div>
			<div class="bounce3"></div>
		</div>
	</div>
	<jsp:include page="/WEB-INF/views/frontend/layout/top-navigation.jsp"></jsp:include>

	<!-- Start Contact Us  -->
	<div class="contact-box-main">
		<div class="container">
			<div class="row">
				<div class="col-lg-8 col-sm-12">
					<div class="contact-form-right">
						<h2>Liên hệ</h2>
						<p>Để lại thông tin để chúng tôi liên lạc hỗ trợ và tư vấn
							những sản phẩm tốt nhất.</p>
						<sf:form class="form" action="${classpath }/contact-save" method="post"
							modelAttribute="contact" enctype="multipart/form-data">

							<div class="row">
								<div class="col-md-12">
									<div class="form-group">
										<sf:input path="name" type="text" class="form-control"
											id="name" name="name" placeholder="Họ và tên"></sf:input>
										<div class="help-block with-errors"></div>
									</div>
								</div>
								<div class="col-md-12">
									<div class="form-group">
										<sf:input path="mobile" type="text" class="form-control"
											id="mobile" Mobile="mobile" placeholder="Số điện thoại"></sf:input>
										<div class="help-block with-errors"></div>
									</div>
								</div>
								<div class="col-md-12">
									<div class="form-group">
										<sf:input path="email" type="text" placeholder="Email"
											id="email" class="form-control" name="email"></sf:input>
										<div class="help-block with-errors"></div>
									</div>
								</div>
								<div class="col-md-12">
									<div class="form-group">
										<sf:textarea path="message" class="form-control"
											id="Lời nhắn" name="message" placeholder="Lời nhắn"
											rows="4"></sf:textarea>
										<div class="help-block with-errors"></div>
									</div>
									<div class="submit-button text-center">
										<button class="btn hvr-hover" id="submit" type="submit">Gửi</button>
										<div id="msgSubmit" class="h3 text-center hidden"></div>
										<div class="clearfix"></div>
									</div>
								</div>
							</div>
						</sf:form>
					</div>
				</div>
				<div class="col-lg-4 col-sm-12">
					<div class="contact-info-left">
						<h2>Thông tin liên hệ</h2>
						<ul>
							<li>
								<p>
									<i class="fas fa-map-marker-alt"></i>Số 123456 Ngõ 3456 Triều Khúc<br> Hà nội
								</p>
							</li>
							<li>
								<p>
									<i class="fas fa-phone-square"></i>Số điện thoại <a
										href="tel:+1-888705770">+1-888 705 770</a>
								</p>
							</li>
							<li>
								<p>
									<i class="fas fa-envelope"></i>Email: <a
										href="mailto:contactinfo@gmail.com">email@email.com</a>
								</p>
							</li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- End Cart -->


	<jsp:include page="/WEB-INF/views/frontend/layout/bottom-slider.jsp"></jsp:include>


	<jsp:include page="/WEB-INF/views/frontend/layout/footer.jsp"></jsp:include>



	<a href="#" id="back-to-top" title="Back to top" style="display: none;">&uarr;</a>

	<jsp:include page="/WEB-INF/views/frontend/layout/js.jsp"></jsp:include>
	<!-- Add to cart -->



</body>

</html>