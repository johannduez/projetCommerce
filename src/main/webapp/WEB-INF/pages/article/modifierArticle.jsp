<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@ include file="../../../resources/structure/link.jsp"%>
<script src="<c:url value="/resources/js/modifier.js" />"></script>
<link href="<c:url value="/resources/css/modifierArticle.css" />"
	rel="stylesheet">

<title>Insert title here</title>
</head>
<body onload="selectionCombo()">
	<%@ include file="../../../resources/structure/Entete.jsp"%>
	<div class="d-flex flex-column align-items-center mt-4">
		<div class="col-4 authentification">

			<form:form action="" method="POST" modelAttribute="article">
				<!-- enctype="multipart/form-data" -->
				<div class="form-group mb-2 pb-2 mt-5">
					<label for="id"><spring:message
							code="article.liste.identifiant"></spring:message>:</label> <select
						class="form-control col-3" aria-label=".form-select-lg example"
						id="idIdentifiant" name="id">
						<c:forEach var="art" items="${articles }">
							<c:if test="${art.id != article.id}">
								<option value="${art.id}">${art.id}</option>
							</c:if>
							<c:if test="${art.id == article.id}">
								<option value="${art.id}" selected>${art.id}</option>
							</c:if>
						</c:forEach>

					</select>
				</div>
				<div class="form-group mb-2 pb-2">
					<label for="nom"><spring:message code="article.liste.nom"></spring:message>:</label>
					<input type="text" class="form-control" name="nom" id="nom"
						placeholder="<spring:message code="article.liste.nom"></spring:message>"
						maxlength="45" value="<c:out value="${article.nom}"/>">

				</div>
				<div class="form-group mb-2 pb-2">
					<label for="description"><spring:message
							code="article.liste.description"></spring:message></label> <input
						type="text" class="form-control" name="description"
						id="description"
						placeholder="<spring:message code="article.liste.description"></spring:message>"
						maxlength="250" value="<c:out value="${article.description}"/>">
				</div>
				<div class="form-group mb-2 pb-2">
					<label for="tarif"><spring:message
							code="article.liste.tarif"></spring:message></label> <input type="number"
						class="form-control" name="tarif" id="tarif"
						placeholder="<spring:message code="article.liste.tarif"></spring:message>"
						maxlength="45" value="<c:out value="${article.tarif}"/>">
				</div>
				<div class="form-group mb-2 pb-2">
					<label for="file"><spring:message
							code="article.liste.image"></spring:message></label>
					<div class="article col-6">
						<div class="zoom-image">
							<img src="<c:url value="${article.image}"/>"
								class="rounded mx-auto d-block" alt="...">
						</div>
					</div>

					<input type="text" name="image" id="image"
						class="form-control col-6"
						value="<c:out value="${article.image}"/>" />

				</div>


				<div class="form-group mb-2 pb-2">
					<label for="categorie"><spring:message
							code="article.liste.categorie"></spring:message></label> <select
						class="form-control" aria-label="Default select example"
						name="categorie" id="categorie">
						<c:if test="${'Téléphone' != article.categorie}">
							<option value="Téléphone"><spring:message
									code="article.modif.telephone"></spring:message></option>
						</c:if>
						<c:if test="${'Téléphone' == article.categorie}">
							<option value="Téléphone" selected><spring:message
									code="article.modif.telephone"></spring:message></option>
						</c:if>
						<c:if test="${'Ordinateur' != article.categorie}">
							<option value="Ordinateur"><spring:message
									code="article.modif.ordinateur"></spring:message></option>
						</c:if>
						<c:if test="${'Ordinateur' == article.categorie}">
							<option value="Ordinateur" selected><spring:message
									code="article.modif.ordinateur"></spring:message></option>
						</c:if>
						<c:if test="${'Electroménager' != article.categorie}">
							<option value="Electroménager"><spring:message
									code="article.modif.electromenager"></spring:message></option>
						</c:if>
						<c:if test="${'Electroménager' == article.categorie}">
							<option value="Electroménager" selected><spring:message
									code="article.modif.electromenager"></spring:message></option>
						</c:if>

					</select>
				</div>
				<div>
					<input type="hidden" name="version" value="${article.version} ">
				</div>
				<div class="modifsup">
					<button type="submit" class="btn btn-success">Modifier</button>
					<a href="<c:url value="/article/supprimer"/>?id=<c:out value="${article.id}"/>"><input
						type="button" class="btn btn-success" name="button"
						value="Supprimer" /></a>
				</div>
			</form:form>

		</div>

		<div class="col-6 d-flex justify-content-center alert">
			<c:if test="${!empty Message }">
				<p class="alert alert-danger col-4">
					<c:out value="${Message }"></c:out>
				</p>
			</c:if>
		</div>
		<div class="col-6 d-flex justify-content-center alert">
			<c:if test="${!empty Message2 }">
				<p class="alert alert-primary col-4">
					<c:out value="${Message2 }"></c:out>
				</p>
			</c:if>
		</div>
	</div>
	<%@ include file="../../../resources/structure/footer.jsp"%>
</body>
</html>