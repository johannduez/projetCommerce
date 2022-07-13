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
<link href="<c:url value="/resources/css/carte.css" />" rel="stylesheet">
<link href="<c:url value="/resources/css/listeCommande.css" />"
	rel="stylesheet">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<%@ include file="../../../resources/structure/Entete.jsp"%>
	<div class="commandes">
		<table class="table table-striped table-bordered col-11">
			<tr>
				<th><spring:message code="article.liste.identifiant"></spring:message></th>
				<th><spring:message code="article.liste.nom"></spring:message></th>
				<th><spring:message code="article.liste.description"></spring:message></th>
				<th><spring:message code="article.liste.tarif"></spring:message></th>
				<th><spring:message code="article.liste.categorie"></spring:message></th>
				<th><spring:message code="article.liste.image"></spring:message></th>
			</tr>
			<c:forEach var="article" items="${articles}">

				<tr>
					<td><a
						href="<c:url value="/article/modifier"/>?id=<c:out value="${article.id}"/>"><c:out
								value="${article.id}" /></a></td>
					<td><c:out value="${article.nom }" /></td>
					<td><c:out value="${article.description }" /></td>
					<td><fmt:formatNumber type="number" maxFractionDigits="2"
							value="${article.tarif}" /></td>
					<td><c:out value="${article.categorie }" /></td>
					<td><img src="<c:url value="${article.image}"/>"
						class="rounded mx-auto d-block" alt="..."></td>
				</tr>

			</c:forEach>

		</table>
	</div>
	<%@ include file="../../../resources/structure/footer.jsp"%>
</body>
</html>