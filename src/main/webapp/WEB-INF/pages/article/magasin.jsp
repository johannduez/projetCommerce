<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
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
	<div class="container-fluid ">
		<%@ include file="../../../resources/structure/Entete.jsp"%>
		<div class=" d-flex flex-row">
			<div class=" col-2 m-5">
				<form:form method="POST" modelAttribute="filtre">
					<div class="form-group mb-2 pb-2">
						<form:label path="prixMin">Prix minimum:</form:label>
						<form:input path="prixMin" type="number" class="form-control" />

					</div>
					<div class="form-group mb-2 pb-2">
						<form:label path="prixMax">Prix maximum:</form:label>
						<form:input path="prixMax" type="number" class="form-control" />

					</div>
					<div class="form-group mb-2 pb-2">
						<form:label path="nom">Nom:</form:label>
						<form:input path="nom" type="test" class="form-control"
							maxlength="45" />

					</div>
					<button type="submit" class="btn btn-primary">Filtrer</button>
				</form:form>
			</div>
			<div class=" col-10">
				<c:if test="${!empty telephone}">
					<div id="tel" class="cartetitre liste">
						<h5>
							<spring:message code="magasin.list.telephone"></spring:message>
						</h5>
					</div>
				</c:if>
				<div class="liste">
					<c:forEach var="tel" items="${telephone }">

						<div class="article col-2">
							<div class="zoom-image">
								<img src="<c:url value="${tel.image}"/>"
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
									&euro;
								</div>
							</div>

						</div>
					</c:forEach>


				</div>
				<div class="cartetitre liste">
					<c:if test="${!empty ordinateur}">
						<h5>
							<spring:message code="magasin.list.ordinateur"></spring:message>
						</h5>
					</c:if>
				</div>
				<div class="liste">
					<c:forEach var="ordi" items="${ordinateur }">

						<div class="article col-2">
							<div class="zoom-image">
								<img src="<c:url value="${ordi.image}"/>"
									class="rounded mx-auto d-block" alt="...">
							</div>
							<div>
								<div class="centre">
									<a class="text-decoration-none" href="#"
										onclick="toggle('<c:out value="${ordi.id}" />')"><i> <c:out
												value="${ordi.nom}" /></i></a>
									<!--  <i> <c:out value="${entree.nom}" /></i>-->
								</div>
								<div style="visibility: hidden; height: 0;"
									id="<c:out value="${ordi.id}" />" class="centre desciption">
									<c:out value="${ordi.description}" />
								</div>

								<div class="prix centre">
									<c:out value="${ordi.tarif}" />
									&euro;
								</div>
							</div>

						</div>
					</c:forEach>


				</div>
				<div class="cartetitre liste">
					<c:if test="${!empty electromenager}">
						<h5>
							<spring:message code="magasin.list.electromenager"></spring:message>
						</h5>
					</c:if>
				</div>
				<div class="liste">
					<c:forEach var="electro" items="${electromenager }">

						<div class="article col-2">
							<div class="zoom-image">
								<img src="<c:url value="${electro.image}"/>"
									class="rounded mx-auto d-block" alt="...">
							</div>
							<div>
								<div class="centre">
									<a class="text-decoration-none" href="#"
										onclick="toggle('<c:out value="${electro.id}" />')"><i>
											<c:out value="${electro.nom}" />
									</i></a>
									<!--  <i> <c:out value="${entree.nom}" /></i>-->
								</div>
								<div style="visibility: hidden; height: 0;"
									id="<c:out value="${electro.id}" />" class="centre desciption">
									<c:out value="${electro.description}" />
								</div>
								<div class="prix centre">
									<c:out value="${electro.tarif}" />
									&euro;
								</div>
							</div>

						</div>
					</c:forEach>


				</div>
			</div>
		</div>
		<%@ include file="../../../resources/structure/footer.jsp"%>
	</div>
</body>

</html>