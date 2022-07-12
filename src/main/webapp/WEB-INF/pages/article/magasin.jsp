<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@ include file="../../../resources/structure/link.jsp"%>
<script src="<c:url value="/resources/js/magasin.js" />"></script>
<link href="<c:url value="/resources/css/magasin.css" />"
	rel="stylesheet">

<title>Insert title here</title>
</head>
<body>
	<div class="container-fluid">
		<%@ include file="../../../resources/structure/Entete.jsp"%>

		<div>
			<div id="tel" class="cartetitre liste">
				<h5><spring:message code="magasin.list.telephone"></spring:message></h5>
			</div>
			<div class="liste">
				<c:forEach var="tel" items="${telephone }">

					<div class="article col-2">
						<div class="zoom-image">
							<img src=  "<c:url value="${tel.image}"/>" 
								class="rounded mx-auto d-block" alt="...">
						</div>
						<div>
							<div class="centre">
								<a class="text-decoration-none" href="#"
									onclick="toggle('<c:out value="${tel.id}" />')"><i> <c:out
											value="${tel.nom}" />
								</i></a>
								<!--  <i> <c:out value="${entree.nom}" /></i>-->
							</div>
							<div style="visibility: hidden; height: 0;"
								id="<c:out value="${tel.id}" />" class="centre desciption">
								<c:out value="${tel.description}" />
							</div>
							<div class="prix centre">
								<c:out value="${tel.tarif}" />
								€
							</div>
						</div>

					</div>
				</c:forEach>


			</div>
			<div class="cartetitre liste">
				<h5>Nos plats</h5>

			</div>
			<div class="liste">
				<c:forEach var="plat" items="${plats }">

					<div class="article col-2">
						<div class="zoom-image">
							<img src="<c:out value="${plat.image}"/>"
								class="rounded mx-auto d-block" alt="...">
						</div>
						<div>
							<div class="centre">
								<a class="text-decoration-none" href="#"
									onclick="toggle('<c:out value="${plat.id}" />')"><i> <c:out
											value="${plat.nom}" /></i></a>
								<!--  <i> <c:out value="${entree.nom}" /></i>-->
							</div>
							<div style="visibility: hidden; height: 0;"
								id="<c:out value="${plat.id}" />" class="centre desciption">
								<c:out value="${plat.description}" />
							</div>

							<div class="prix centre">
								<c:out value="${plat.tarif}" />
								€
							</div>
						</div>

					</div>
				</c:forEach>


			</div>
			<div class="cartetitre liste">
				<h5>Nos desserts</h5>
			</div>
			<div class="liste">
				<c:forEach var="dessert" items="${desserts }">

					<div class="article col-2">
						<div class="zoom-image">
							<img src="<c:out value="${dessert.image}"/>"
								class="rounded mx-auto d-block" alt="...">
						</div>
						<div>
							<div class="centre">
								<a class="text-decoration-none" href="#"
									onclick="toggle('<c:out value="${dessert.id}" />')"><i>
										<c:out value="${dessert.nom}" />
								</i></a>
								<!--  <i> <c:out value="${entree.nom}" /></i>-->
							</div>
							<div style="visibility: hidden; height: 0;"
								id="<c:out value="${dessert.id}" />" class="centre desciption">
								<c:out value="${dessert.description}" />
							</div>
							<div class="prix centre">
								<c:out value="${dessert.tarif}" />
								€
							</div>
						</div>

					</div>
				</c:forEach>


			</div>
		</div>
		<%@ include file="../../../resources/structure/footer.jsp"%>
	</div>
</body>

</html>