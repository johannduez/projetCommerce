<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@ include file="../../../resources/structure/link.jsp"%>
<link rel="stylesheet" href="css/modifierArticle.css">
<script src="js/modifier.js"></script>
<title>Insert title here</title>
</head>
<body onload="selectionCombo()">
	<%@ include file="../../../resources/structure/Entete.jsp"%>
	<div class="d-flex flex-column align-items-center mt-4">
		<div class="col-4 authentification">

			<form method="POST" enctype="multipart/form-data">
				<div class="form-group mb-2 pb-2">
					<label for="id">Identifiant:</label> <select
						class="form-control col-3" aria-label=".form-select-lg example"
						id="idIdentifiant" name="idIdentifiant">
						<c:forEach var="art" items="${articles }">
							<c:if test="${art.id != article.id}">
								<option value="${art.id}">${art.id}</option>
							</c:if>
							<c:if test="${art.id == article.id}">
								<option value="${art.id}" selected>${art.id}</option>
							</c:if>
						</c:forEach>

					</select>
					<!--  <input
					type="number" class="form-control" id="id"
					name="id" aria-describedby="emailHelp" placeholder="Identifiant"  step="1" min="0">-->
				</div>
				<div class="form-group mb-2 pb-2">
					<label for="nom">Nom:</label> <input type="text"
						class="form-control" name="nom" id="nom" placeholder="Nom"
						maxlength="45" value="<c:out value="${article.nom}"/>">
				</div>
				<div class="form-group mb-2 pb-2">
					<label for="description">Description</label> <input type="text"
						class="form-control" name="description" id="description"
						placeholder="Description" maxlength="250"
						value="<c:out value="${article.description}"/>">
				</div>
				<div class="form-group mb-2 pb-2">
					<label for="tarif">Tarif</label> <input type="number"
						class="form-control" name="tarif" id="tarif" placeholder="Tarif"
						maxlength="45" value="<c:out value="${article.tarif}"/>">
				</div>
				<div class="form-group mb-2 pb-2">
					<label for="file">Image</label>
					<div class="article col-6">
						<div class="zoom-image">
							<img src="<c:out value="${article.image}"/>"
								class="rounded mx-auto d-block" alt="...">
						</div>
					</div>

					<input type="file" name="file" id="file"
						accept="image/png, image/jpeg">
					</textarea>
				</div>
				<div class="form-group mb-2 pb-2">
					<label for="categorie">Catégorie</label> <select
						class="form-control" aria-label="Default select example"
						name="categorie" id="categorie">
						<c:if test="${'entree' != article.categorie}">
							<option value="entree">Entrée</option>
						</c:if>
						<c:if test="${'entree' == article.categorie}">
							<option value="entree" selected>Entrée</option>
						</c:if>
						<c:if test="${'plat' != article.categorie}">
							<option value="plat">Plat</option>
						</c:if>
						<c:if test="${'plat' == article.categorie}">
							<option value="plat" selected>Plat</option>
						</c:if>
						<c:if test="${'dessert' != article.categorie}">
							<option value="dessert">Dessert</option>
						</c:if>
						<c:if test="${'dessert' == article.categorie}">
							<option value="dessert" selected>Dessert</option>
						</c:if>

					</select>
				</div>
				<div class="modifsup">
					<button type="submit" class="btn btn-success">Modifier</button>
					<a href="supprimerarticle?id=<c:out value="${article.id}"/>"><input
						type="button" class="btn btn-success" name="button"
						value="Supprimer" /></a>
				</div>
			</form>

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