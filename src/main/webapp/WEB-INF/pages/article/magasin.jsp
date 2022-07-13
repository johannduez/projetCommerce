<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>


<link rel="stylesheet"
	href="https://fontawesome.com/v4.7.0/assets/font-awesome/css/font-awesome.css">
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

					<div class="card">

						<article class="filter-group"> <header
							class="card-header"> <a href="#" data-toggle="collapse"
							data-target="#collapse_2" aria-expanded="true" class="">
							<h6 class="title">Catégorie</h6>
						</a> </header>
						<div class="filter-content collapse show" id="collapse_2" style="">
							<div class="card-body">
								<label class="custom-control custom-checkbox"> <form:checkbox
										path="ordinateur"  value="1"
										class="custom-control-input" />
									<div class="custom-control-label">Ordinateur</div>
								</label> <label class="custom-control custom-checkbox"> <form:checkbox
										path="telephone"  value="1"
										class="custom-control-input" />

									<div class="custom-control-label">Téléphone</div>
								</label> <label class="custom-control custom-checkbox"> <form:checkbox
										path="electromenager"  value="1"
										class="custom-control-input" />

									<div class="custom-control-label">Eléctromenager</div>
								</label>


							</div>

						</div>
						</article>
						<!-- filter-group .// -->
						<article class="filter-group"> <header
							class="card-header"> <a href="#" data-toggle="collapse"
							data-target="#collapse_4" aria-expanded="true" class="">
							<h6 class="title">Nom</h6>
						</a> </header>
						<div class="filter-content collapse show" id="collapse_4" style="">
							<div class="card-body">
								<!-- <label>Nom:</label> 
						<input type="test" class="form-control"
							maxlength="45" /> -->
								<form:label path="nom">
									<spring:message code="magasin.list.nom"></spring:message>
								</form:label>
								<form:input path="nom" type="test" class="form-control"
									maxlength="45" />
							</div>
							<!-- card-body.// -->
						</div>
						</article>
						<!-- filter-group .// -->
						<article class="filter-group"> <header
							class="card-header">

						<h6 class="title">Prix</h6>
						</header>
						<div class="filter-content collapse show" id="collapse_3" style="">
							<div class="card-body">
								<div class="form-row">
									<div class="form-group col-md-6">
										<!-- <label>Min</label> 
								<input class="form-control" placeholder="0"
									type="number"> -->
										<form:label path="prixMin">
											<spring:message code="magasin.list.prixminimum"></spring:message>
										</form:label>
										<form:input path="prixMin" type="number" class="form-control" />
									</div>
									<div class="form-group text-right col-md-6">
										<!-- <label>Max</label> 
								
								<input class="form-control"
									placeholder="100000" type="number"> -->
										<form:label path="prixMax">
											<spring:message code="magasin.list.prixmaximum"></spring:message>
										</form:label>
										<form:input path="prixMax" type="number" class="form-control" />
									</div>
								</div>
								<!-- form-row.// -->
								<button type="submit" class="btn btn-block btn-primary">Filtrer</button>

							</div>
							<!-- card-body.// -->
						</div>
						</article>
						<!-- filter-group .// -->


					</div>
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