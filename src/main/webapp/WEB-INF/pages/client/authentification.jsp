<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@ include file="../../../resources/structure/link.jsp"%>
<!-- <link rel="stylesheet" href="css/authentification.css"> -->
<title>Insert title here</title>
</head>
<body>
	<div class="container-fluid">
		<%@ include file="../../../resources/structure/Entete.jsp"%>
		<div class="d-flex flex-column align-items-center">
			<div class="col-4 authentification">
				<form:form method="POST" modelAttribute="client">
					<div class="form-group mb-2 pb-2">
						<label for="exampleInputEmail1"><spring:message code="client.inscription.id"></spring:message></label> 
						<input type="number" class="form-control" id="exampleInputEmail1" name="id" aria-describedby="emailHelp" placeholder="Identifiant" value="<c:out value="${cookieID}"/>">
					</div>
					<div class="form-group mb-2 pb-2">
						<label for="exampleInputPassword1"><spring:message code="client.inscription.password"></spring:message></label> 
						<input type="password" class="form-control" name="password" id="exampleInputPassword1" placeholder="Mot de passe" value='<c:out value="${cookiePassword}"/>' maxlength="45">
					</div>
					<div class="form-check mb-2 pb-2">
						<input class="form-check-input" type="checkbox" value="1" id="souvenir" name="souvenir"> 
						<label class="form-check-label" for="souvenir"><spring:message code="client.inscription.rappel"></spring:message></label>
					</div>
					<div class="form-check authentification d-flex justify-content-end">
						<button type="submit" class="btn btn-primary"><spring:message code="client.inscription.connection"></spring:message></button>
					</div>
				</form:form>

			</div>

			<div class="col-6 d-flex justify-content-center">
				<c:if test="${!empty notification }">
					<p class="alert alert-danger col-12">
						<c:out value="${notification}"></c:out>
					</p>
				</c:if>

			</div>
		</div>
		<%@ include file="../../../resources/structure/footer.jsp"%>
	</div> 
</body>
</html>