<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@ include file="../../../resources/structure/link.jsp"%>
<title>Ma commande</title>
</head>
<body>

	<%@ include file="../../../resources/structure/Entete.jsp"%>

	<br>
	<div class="d-flex justify-content-center align-items-center ">

		<div class="m-1 p-1" style="width: 22rem;">
			
			<div class="card-body">
				<h5
					class="d-flex justify-content-center align-items-center card-text">
					
					<spring:message code="valider.commande.felicitation"></spring:message>
					<c:out value="${commande.client.prenom }"></c:out>
					<c:out value="${commande.client.nom }"></c:out>
					<br> <spring:message code="valider.commande.valider"></spring:message> 
					<br> <spring:message code="valider.commande.montant"></spring:message>
					<fmt:formatNumber type="number" maxFractionDigits="2"
						value="${commande.prixTotal }" />
					<spring:message code="valider.commande.euro"></spring:message>
					<br><spring:message code="valider.commande.envoi"></spring:message>
					<c:out value="${commande.client.adresse }"></c:out>
				</h5>
			</div>
		</div>
	</div>

	<%@ include file="../../../resources/structure/footer.jsp"%>
</body>
</html>