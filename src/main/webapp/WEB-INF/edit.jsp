<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- New line below to use the JSP Standard Tag Library -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript" src="js/app.js"></script>
<!-- for Bootstrap CSS -->
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
<!-- YOUR own local CSS -->
<link rel="stylesheet" href="/css/style.css"/>
<!-- For any Bootstrap that uses JS or jQuery-->
<script src="/webjars/jquery/jquery.min.js"></script>
<script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
<meta charset="ISO-8859-1">
<title>Edit Language</title>
</head>
<body>
	<div class="m-5 px-5">
		<div class="d-flex justify-content-end">
			<form action="/languages/${language.id}/destroy" method="post" class="d-inline">
				<input type="hidden" name="_method" value="delete"/>
				<input type="submit" value="Delete" class="deleteBtn"/>
			</form> 
			<a href="/languages" class="ms-5">Dashboard</a>
		</div>
		<form:form action="/languages/${language.id}/update" method="post" modelAttribute="language" class="mt-5">
			<input type="hidden" name="_method" value="put"/>
			<div>
				<p class="d-flex justify-content-center">
					<form:label for="name" path="name" class="me-3">Name:</form:label>
					<form:input name="name" path="name" type="text" class="ms-2"/>
				</p>
				<p class="d-flex justify-content-center">
					<form:errors path="name" class="text-danger"/>
				</p>
			</div>
			<div>
				<p class="d-flex justify-content-center">
					<form:label for="creator" path="creator" class="me-3">Creator:</form:label>
					<form:input name="creator" path="creator" type="text"/>
				</p>
				<p class="d-flex justify-content-center">
					<form:errors path="creator" class="text-danger"/>
				</p>
			</div>
			<div>
				<p class="d-flex justify-content-center">
					<form:label for="version" path="version" class="me-3">Version:</form:label>
					<form:input name="version" path="version" type="text"/>
				</p>
				<p class="d-flex justify-content-center">
					<form:errors path="version" class="text-danger"/>
				</p>
			</div>
			<div class="d-flex justify-content-center">
				<input type="submit" value="Submit" class="btn btn-primary"/>
			</div>
		</form:form>
	</div>
</body>
</html>