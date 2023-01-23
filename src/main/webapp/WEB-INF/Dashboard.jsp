<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title></title>
	<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
	<link rel="stylesheet" type="text/css" href="/css/style.css">
	<script type="text/javascript" src="/js/app.js"></script>
	<script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
</head>

<body>

<h1>Movie Database</h1>
<table>
	<thead>
		<tr>
			<th>ID</th>
			<th>IMDb Page</th>
			<th>Title</th>
			<th>Description</th>
			<th>Rating</th>
			<th>Genre</th>
			<th>Movie Poster</th>
		</tr>
	</thead>
	<tbody>
		<c:forEach var="movie" items="${movies}">
		<tr>
			<td><c:out value="${movie.id}"/></td>
			<td><a href = "<c:url value="${movie.imdbLink}"/>"><img src="https://cdn.freebiesupply.com/images/large/2x/imdb-logo-transparent.png" height="30"></a></td>
			<td><c:out value="${movie.title}"/></td>
			<td><c:out value="${movie.description}"/></td>
			<td><c:out value="${movie.imdbScore}"/></td>
			<td><c:out value="${movie.genre}"/></td>
			<td><img alt="" src="<c:url value="${movie.imdb_movie_poster}"/>"></td>
		</tr>
		</c:forEach> 
	</tbody>
</table>
</body>

</html>