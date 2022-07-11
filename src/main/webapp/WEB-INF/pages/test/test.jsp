<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@ include file="../../../resources/structure/link.jsp"%>
<title>Pizza Pit - La vraie pizza au feu de bois</title>
</head>
<body>
	<div class="container-fluid">
		<%@ include file="../../../resources/structure/Entete.jsp"%>
		<div class="hCar">
			<div id="carouselExampleControls" class="carousel slide"
				data-ride="carousel">
				<div class="carousel-inner">
					<div class="carousel-item">
						<img class="d-block w-100" src="<c:url value="/resources/img/PolloAlfredo.jpg" />"
							alt="Third slide">
					</div>
					<div class="carousel-item">
						<img class="d-block w-100" src="<c:url value="/resources/img/pizza-36924315.jpg"/>"
							alt="Second slide">
					</div>
					<div class="carousel-item active">
						<img class="d-block w-100" src="<c:url value="/resources/img/Agora.jpg"/>" alt="First slide">
					</div>
				</div>
				<a class="carousel-control-prev" href="#carouselExampleControls"
					role="button" data-slide="prev"> <span
					class="carousel-control-prev-icon" aria-hidden="true"></span> <span
					class="sr-only">Previous</span>
				</a> <a class="carousel-control-next" href="#carouselExampleControls"
					role="button" data-slide="next"> <span
					class="carousel-control-next-icon" aria-hidden="true"></span> <span
					class="sr-only">Next</span>
				</a>
			</div>
		</div>
		<%@ include file="../../../resources/structure/footer.jsp"%>
	</div>
</body>
</html>