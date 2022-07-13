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

			<form:form method="POST" modelAttribute="article">
				<div class="form-group mb-2 pb-2">
					<form:label path="nom">Nom:</form:label> 
					<form:input path="nom" type="text" class="form-control" placeholder="Nom" maxlength="45"/>
					<form:errors path="nom" cssClass="text-danger"/>
				</div>
				<div class="form-group mb-2 pb-2">
					<form:label path="description">Description</form:label> 
					<form:input path="description" type="text" class="form-control" placeholder="Description" maxlength="250"/>
					<form:errors path="description" cssClass="text-danger"/>
				</div>
				<div class="form-group mb-2 pb-2">
					<form:label path="tarif">Tarif</form:label> 
					<form:input path="tarif" type="number" class="form-control" placeholder="Tarif" maxlength="45"/>
					<form:errors path="tarif" cssClass="text-danger"/>
				</div>
				<div class="form-group mb-2 pb-2">
					<form:label path="image">Image</form:label> 
					<form:input path="image" type="text" class="form-control" placeholder="/resources/img/xxx.jpg" maxlength="250"/>
					<form:errors path="image" cssClass="text-danger"/>
				</div>
				<div class="form-group mb-2 pb-2">
					<form:label path="categorie">Catégorie</form:label> 
					<form:select path="categorie" class="form-control" aria-label="Default select example">
						<option value="Téléphone">Téléphone</option>
						<option value="Ordinateur">Ordinateur</option>
						<option value="Electroménager">Electroménager</option>
					</form:select>
					<form:errors path="categorie" cssClass="text-danger"/>
				</div>
				<button type="submit" class="btn btn-success">Ajouter</button>
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