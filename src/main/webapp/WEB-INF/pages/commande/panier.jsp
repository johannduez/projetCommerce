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
<link href="<c:url value="/resources/css/articles.css" />"
	rel="stylesheet">
<title>Insert title here</title>
</head>
<body>
	<%@ include file="../../../resources/structure/Entete.jsp"%>

	<div class=".container">
		<div class="articles">
			<h1><spring:message code="panier.commande.titre1"></spring:message></h1>
		</div>
		<div class="articles">
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
		<div class="ligne selection">
			<div class="col-4 mx-2">
				<form:form name="nomForm" method="POST" modelAttribute="ligne">
					<div class="ligne">
						<div class="col-3">
							<label for="idArticle col-2 lignepadding"><spring:message code="panier.commande.article"></spring:message></label>
						</div>
						<div class="col-8">
							<select class="form-select col-6 lignepadding"
								aria-label="Default select example" id="idArticle"
								name="article.id">
								<c:forEach var="article" items="${articles }">
									<option value="<c:out value="${article.id }"></c:out>"><c:out
											value="${article.nom }"></c:out></option>
								</c:forEach>

							</select>
						</div>
					</div>
					<div class="ligne">
						<div class="ligne col-8">
							<div class="col-4 mr-2">
								<label for="quantite" class="lignepadding col-12"><spring:message code="panier.commande.quantite"></spring:message></label>
							</div>
							<div class="col-5 mx-3">
								<input type="number" class="lignepadding form-control col-6"
									id="quantite" name="quantite" aria-describedby="emailHelp"
									placeholder="<spring:message code="panier.commande.quantite2"></spring:message>" min="1">
							</div>
						</div>
						<div class="col-3">
							<button type="submit" class="btn btn-success"><spring:message code="panier.commande.ajouter"></spring:message></button>
						</div>
					</div>
					<div class="viderPanier">
						<a href="<c:url value="/commande/viderpanier" />"><input type="button"
							class="btn btn-success" name="button" value="<spring:message code="panier.commande.viderpanier"></spring:message>" /></a>
					</div>
				 </form:form>

			</div>
			<div class="col-7 mx-2">
				<table class="table table-striped table-bordered ">
					<tr>
						<th><spring:message code="panier.commande.articles"></spring:message></th>
						<th><spring:message code="panier.commande.quantite2"></spring:message></th>
						<th><spring:message code="panier.commande.prixtotal"></spring:message></th>
					</tr>
					<c:forEach var="ligne" items="${commande.lignes}">
						<tr>
							<td><c:out value="${ligne.article.nom}" /></td>
							<td><c:out value="${ligne.quantite }" /></td>
							<td><fmt:formatNumber type="number" maxFractionDigits="2"
									value="${ligne.prix }" /></td>
							<!--  	<td><c:out value="${ligne.prix }€" /></td>--->
						</tr>

					</c:forEach>

				</table>
			</div>
		</div>

		<div>
			<c:if test="${!empty Message }">
				<p class="alert alert-danger col-4">
					<c:out value="${Message }"></c:out>
				</p>
			</c:if>
		</div>
		<div class="validerPanier">
			<a href="<c:url value="/commande/recapitulatif" />"><input type="button" class="btn btn-success"
				name="button" value="<spring:message code="panier.commande.validerpanier"></spring:message>" /></a>
		</div>
	<%@ include file="../../../resources/structure/footer.jsp"%>
	</div>

</body>
</html>