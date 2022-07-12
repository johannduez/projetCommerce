<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<div class="entete">
	<div class="imageEntete">
		<div class="d-flex flex-column justify-content-center align-items-center">
			<h1>E-Lectronique</h1><br>
			<h3>L'avenir accessible pour tous </h3>
		</div>
	</div>
	<div class="navbarContainer">
<nav class="navbar navbar-expand-lg navbar-dark bg-primary">
  <div class="container-fluid">
    <a class="navbar-brand text-white" href="<c:url value="/accueil/accueil"/>">E-lectronique</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
        <li class="nav-item">
          <a class="nav-link active text-white" aria-current="page" href="<c:url value="/article/magasin"/>"><spring:message code="entete.commande.produit"></spring:message></a>
        </li>
         <c:if test="${empty commande}">
	        <li class="nav-item">
	          <a class="nav-link text-white" href="<c:url value="/client/inscription"/>"><spring:message code="entete.commande.inscription"></spring:message></a>
	        </li>
	        <li class="nav-item">
	          <a class="nav-link text-white" href="<c:url value="/client/authentification"/>"><spring:message code="entete.commande.authentification"></spring:message></a>
	        </li>
        </c:if>
        <c:if test="${!empty commande}">
	        <li class="nav-item">
	          <a class="nav-link text-white" href="<c:url value="/commande/panier" />"><spring:message code="entete.commande.choix"></spring:message></a>
	        </li>
	        <li class="nav-item">
	          <a class="nav-link text-white" href="deconnexion"><spring:message code="entete.commande.deconnexion"></spring:message></a>
	        </li>
        </c:if>
          
         <c:if test="${!empty isAdmin  && !empty commande}">
	       <li class="nav-item dropdown">
	        <a class="nav-link dropdown-toggle text-white" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
	          Administration
	        </a>
	        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
	        	 <c:if test="${!empty isAdmin && empty admin && !empty commande}">
	        	<a class="dropdown-item" href="authentificationAdmin"><spring:message code="entete.commande.connexionadmin"></spring:message></a>
	        	</c:if>
	          <c:if test="${!empty admin}">
	          <a class="dropdown-item" href="ajouterarticle"><spring:message code="entete.commande.ajoutproduit"></spring:message></a>
	          <a class="dropdown-item" href="modifierArticle"><spring:message code="entete.commande.modifproduit"></spring:message></a>
	          <div class="dropdown-divider"></div>
		        <a class="dropdown-item" href="listeArticle"><spring:message code="entete.commande.produits"></spring:message></a>
		   	 </c:if>
	        </div>
	      </li>
        </c:if>
      </ul>
    </div>
    <div >
  	<c:if test="${!empty commande}"><a href="profilUtilisateur" class="text-white"> <spring:message code="entete.commande.bonjour"></spring:message> <c:out value="${commande.client.prenom }"></c:out> <c:out value="${commande.client.nom }"></c:out> </a></c:if>
     </div>
  </div>
</nav>
</div>
</div>