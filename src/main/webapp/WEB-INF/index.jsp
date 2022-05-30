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
<title>Languages</title>
</head>
<body>
	<div class="m-4">
		<table class="table table-striped table-bordered border-dark">
			<thead>
				<tr>
					<th>Name</th>
					<th>Creator</th>
					<th>Version</th>
					<td>Actions</td>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${languages}" var="oneLanguage">
					<tr>
						<td><a href="/languages/${oneLanguage.id}">${oneLanguage.name}</a></td>
						<td>${oneLanguage.creator}</td>
						<td>${oneLanguage.version}</td>
						<td><a href="/languages/${oneLanguage.id}/edit">Edit</a> | 
							<form action="/languages/${oneLanguage.id}/destroy" method="post" class="d-inline">
								<input type="hidden" name="_method" value="delete"/>
								<input type="submit" value="Delete" class="deleteBtn"/>
							</form> 
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<form:form action="/languages/create" method="post" modelAttribute="language" class="mt-5">
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