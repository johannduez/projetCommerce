<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@ include file="../../../resources/structure/link.jsp"%>
<title>Insert title here</title>
</head>
<body>
<%@ include file="../../../resources/structure/Entete.jsp"%>
	<div class="d-flex flex-column align-items-center mt-4">
		<div class="col-4 authentification">

			<form:form method="POST" modelAttribute="article" enctype="multipart/form-data">
				<div class="form-group mb-2 pb-2">
					<form:label path="nom"><spring:message code="client.inscription.nom"></spring:message></form:label> 
					<form:input path="nom" type="text" class="form-control" placeholder="Nom" maxlength="45"/>
					<form:errors path="nom" cssClass="text-danger"/>
				</div>
				<div class="form-group mb-2 pb-2">
					<form:label path="description"><spring:message code="article.liste.description"></spring:message></form:label> 
					<form:input path="description" type="text" class="form-control" placeholder="Description" maxlength="250"/>
					<form:errors path="description" cssClass="text-danger"/>
				</div>
				<div class="form-group mb-2 pb-2">
					<form:label path="tarif"><spring:message code="article.liste.tarif"></spring:message></form:label> 
					<form:input path="tarif" type="number" class="form-control" placeholder="Tarif" maxlength="45"/>
					<form:errors path="tarif" cssClass="text-danger"/>
				</div>
				<div class="form-group mb-2 pb-2">
					<label path="multiPartFile"><spring:message code="article.liste.image"></spring:message></label> 
					<!--  </br><td><input type="file" name="multiPartFile"  id="multiPartFile"  accept="image/png, image/jpeg"/></td>
					 -->
					  </br><td><form:input type="file" path="multiPartFile"  id="multiPartFile"  accept="image/png, image/jpeg"/></td>
					<form:errors path="multiPartFile" cssClass="text-danger"/>
					<%-- <form:input path="image" type="text" class="form-control" placeholder="/resources/img/xxx.jpg" maxlength="250"/>
					<form:errors path="image" cssClass="text-danger"/> --%>
				</div>
				<div class="form-group mb-2 pb-2">
					<form:label path="categorie"><spring:message code="article.liste.categorie"></spring:message></form:label> 
					<form:select path="categorie" class="form-control" aria-label="Default select example">
						<option value="Téléphone"><spring:message code="article.modif.telephone"></spring:message></option>
						<option value="Ordinateur"><spring:message code="article.modif.ordinateur"></spring:message></option>
						<option value="Electroménager"><spring:message code="article.modif.electromenager"></spring:message></option>
					</form:select>
					<form:errors path="categorie" cssClass="text-danger"/>
				</div>
				<button type="submit" class="btn btn-success"><spring:message code="article.liste.ajouter"></spring:message></button>
			</form:form>

		</div>
		<div class="col-6 d-flex justify-content-center alert">
			<c:if test="${!empty notif }">
				<p class="alert alert-danger col-4">
					<c:out value="${notif}"></c:out>
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