<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@ include file="../../../resources/structure/link.jsp"%>
<link rel="stylesheet" href="css/authentification.css">
<title>Insert title here</title>
</head>
<body>
	<div class="container-fluid">
		<%@ include file="../../../resources/structure/Entete.jsp"%>

		<div class="d-flex flex-column align-items-center">
			<div class=" authentification centre col-5">

				<form:form method="POST" class="col-12" modelAttribute="client">
				 	<div class="form-group mb-2 pb-2">
						<form:label path="id"><spring:message code="client.inscription.id"></spring:message></form:label> 
						<form:input type="number" class="form-control" path="id" aria-describedby="emailHelp" placeholder="1" step="1" min="0"/>
						<form:errors path="id" cssClass="text-danger"/>
					</div>
					<div class="form-group mb-2 pb-2">
						<form:label path="password"><spring:message code="client.inscription.password"></spring:message></form:label> 
						<form:input type="text" class="form-control" path="password" placeholder="12345" maxlength="45"/>
						<form:errors path="password" cssClass="text-danger"/>
					</div>
					<div class="form-group mb-2 pb-2">
						<form:label path="nom"><spring:message code="client.inscription.nom"></spring:message></form:label> 
						<form:input type="text" class="form-control" path="nom" placeholder="Dupond" maxlength="45"/>
						<form:errors path="nom" cssClass="text-danger"/>
					</div>
					<div class="form-group mb-2 pb-2">
						<form:label path="prenom"><spring:message code="client.inscription.prenom"></spring:message></form:label> 
						<form:input type="text" class="form-control" path="prenom" placeholder="Toto" maxlength="45"/>
						<form:errors path="prenom" cssClass="text-danger"/>
					</div>
					<div class="form-group mb-2 pb-2">
						<form:label path="adresse"><spring:message code="client.inscription.adresse"></spring:message></form:label>
						<form:input type="text" class="form-control" path="adresse" placeholder="1 avenue de la Paix, Paris" maxlength="250"/>
						<form:errors path="adresse" cssClass="text-danger"/>
					</div> 
					<div class="d-flex justify-content-end">
						<button type="submit" class="btn btn-primary"><spring:message code="client.inscription.valider"></spring:message></button>
					</div>
				</form:form>

			</div>

			<div class="col-6 d-flex justify-content-center">
				<c:if test="${!empty notif }">
					<p class="alert alert-danger col-4">
						<c:out value="${notif }"></c:out>
					</p>
				</c:if>
			</div>
			<div class="col-6 d-flex justify-content-center">
				<c:if test="${!empty Message2 }">
					<p class="alert alert-primary col-4">
						<c:out value="${Message2 }"></c:out>
					</p>
				</c:if>
			</div>

		</div>
		<%@ include file="../../../resources/structure/footer.jsp"%>
	</div>
</body>

</html>