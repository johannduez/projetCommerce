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

	<%@ include file="../../../resources/structure/Entete.jsp"%><br>


	<div class="d-flex justify-content-center">
		<br>
		<h5>
			<spring:message code="panier.commande.titre20"></spring:message>
			<c:out value="${commande.client.prenom }"></c:out>
			<c:out value="${commande.client.nom }"></c:out>
			<spring:message code="panier.commande.titre21"></spring:message>
			<fmt:formatNumber type="number" maxFractionDigits="2"
				value="${commande.prixTotal }" />
			<spring:message code="panier.commande.titre22"></spring:message>
		</h5>
	</div>
	<div class="tab">
		<table class="table">
			<thead>
				<tr>
					<th><spring:message code="panier.commande.articles"></spring:message></th>
					<th><spring:message code="panier.commande.quantite2"></spring:message></th>
					<th><spring:message code="panier.commande.prixtotal"></spring:message></th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="ligne" items="${commande.lignes}">
					<tr>
						<td><c:out value="${ligne.article.nom }" /></td>
						<td><c:out value="${ligne.quantite }" /></td>
						<td><fmt:formatNumber type="number" maxFractionDigits="2"
								value="${ligne.prix }" /></td>
					</tr>
				</c:forEach>

			</tbody>
		</table>
	</div>

	<div class="d-flex flex-row">
		<div class="retourPanier">
			<a href="<c:url value="/commande/panier" />"><input type="button"
				class="btn btn-primary m-1 p-1" name="button"
				value="<spring:message code="panier.commande.retourpanier"></spring:message>" /></a>
		</div>
		<div class="validerCommande">
			<a href="<c:url value="/commande/validerpanier" />"><input type="button"
				class="btn btn-primary m-1 p-1" name="button"
				value="<spring:message code="panier.commande.valider"></spring:message>" /></a>
		</div>
	</div>
	<%@ include file="../../../resources/structure/footer.jsp"%>
</body>
</html>