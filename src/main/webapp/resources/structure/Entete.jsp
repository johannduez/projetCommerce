<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="entete">
	<div class="imageEntete">
		<div class="d-flex flex-column justify-content-center align-items-center">
			<h1>Pizza Pit</h1><br>
			<h3>La veritable Pizza au feu de bois</h3>
		</div>
	</div>
	<div class="navbarContainer">
<nav class="navbar navbar-expand-lg bg-danger">
  <div class="container-fluid">
    <a class="navbar-brand text-white" href="accueil.jsp">Pizza Pit</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
        <li class="nav-item">
          <a class="nav-link active text-white" aria-current="page" href="carte">La carte</a>
        </li>
         <c:if test="${empty client}">
	        <li class="nav-item">
	          <a class="nav-link text-white" href="inscription">Inscription</a>
	        </li>
	        <li class="nav-item">
	          <a class="nav-link text-white" href="authentification">Authentification</a>
	        </li>
        </c:if>
        <c:if test="${!empty client}">
	        <li class="nav-item">
	          <a class="nav-link text-white" href="<c:url value="/article/magasin" />">Choix des articles</a>
	        </li>
	        <li class="nav-item">
	          <a class="nav-link text-white" href="listecommande">Commandes</a>
	        </li>
	        <li class="nav-item">
	          <a class="nav-link text-white" href="deconnexion">Déconnexion</a>
	        </li>
        </c:if>
          
         <c:if test="${!empty isAdmin  && !empty client}">
	       <li class="nav-item dropdown">
	        <a class="nav-link dropdown-toggle text-white" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
	          Administration
	        </a>
	        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
	        	 <c:if test="${!empty isAdmin && empty admin && !empty client}">
	        	<a class="dropdown-item" href="authentificationAdmin">Se connecter en tant qu'administrateur</a>
	        	</c:if>
	          <c:if test="${!empty admin}">
	          <a class="dropdown-item" href="ajouterarticle">Ajouter article</a>
	          <a class="dropdown-item" href="modifierArticle">Modifier/supprimer article</a>
	          <div class="dropdown-divider"></div>
		        <a class="dropdown-item" href="listeArticle">Tous les articles</a>
		   	 </c:if>
	        </div>
	      </li>
        </c:if>
      </ul>
    </div>
    <div >
  	<c:if test="${!empty client}"><a href="profilUtilisateur" class="text-white"> Bonjour <c:out value="${client.prenom }"></c:out> <c:out value="${client.nom }"></c:out> </a></c:if>
     </div>
  </div>
</nav>
</div>
</div>