<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>Hello World</title>
	<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
	<link rel="stylesheet" type="text/css" href="/css/style.css">
	<script type="text/javascript" src="/js/app.js"></script>
	<script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
</head>

<body>
	<h1>Two plus two is: <h1>
	<h2><c:out value="${2*2*2}"/></h2>
	
	<h1>User information: </h1>
	<h2>First Name: <c:out value="${first}"></c:out></h2>
	<h2>Last Name: <c:out value="${last}"></c:out></h2>
	<h2>Email: <c:out value="${email}"></c:out></h2>
	<h2>Age: <c:out value="${age}"></c:out></h2>
	
	<c:forEach var="singleCity" items="${citiesFromMyController}">
		<h3><c:out value="${singleCity}"></c:out></h3>
	</c:forEach>
	
	<c:forEach var="people" items="${peopleAndWhatTheyMake}">
		<h3>Name: <c:out value="${people.name}"></c:out></h3>
		<h3>Salary: <c:out value="${people.salary}"></c:out> dollars</h3>
	</c:forEach>
	
</body>
</html>