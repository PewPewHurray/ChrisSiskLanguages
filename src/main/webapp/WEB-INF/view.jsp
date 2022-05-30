<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- New line below to use the JSP Standard Tag Library -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
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
<title>View Language</title>
</head>
<body>
	<div class="m-5 px-5">
		<div class="d-flex justify-content-end">
			<a href="/languages">Dashboard</a>
		</div>
		<div class="mt-4">
			<div>
				<p>${language.name}</p>
			</div>
			<div>
				<p>${language.creator}</p>
			</div>
			<div>
				<p>${language.version}</p>
			</div>
			<div>
				<a href="/languages/${language.id}/edit">Edit</a>
			</div>
			<form action="/languages/${language.id}/destroy" method="post" class="mt-3">
				<input type="hidden" name="_method" value="delete"/>
				<input type="submit" value="Delete" class="deleteBtn"/>
			</form> 
		</div>
	</div>
</body>
</html>