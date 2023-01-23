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
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
</head>

<body>
	<div id="viewOne-container">
		<nav class="navbar sticky-top navbar-expand-lg navbar-dark bg-dark" style="margin:0; padding: 0">
			<a class="navbar-brand mx-3" href="/"><img class="nav-logo" src="/imgs/film.png" height="40"> FlickList</a>
			<div class="navbar-collapse">
				<form class="form-inline col-sm-6">
			      <input class="form-control" type="search" placeholder="Search movies..." aria-label="Search" style="font-size:10pt">
			      <button class="btn btn-outline-light" type="submit" style="font-size:10pt">Search</button>
			    </form>
				<ul class="nav">
					<li class="nav-item"><a href = "#"><img class="camera" src="/imgs/camera.png" height="30"></a> Watchlist</li>
					<li class="nav-item mx-3"><a href = "#"><img class="user" src="/imgs/login.png" height="30"></a> Sign In</li>
				</ul>
			</div>
		</nav>
		<div class="viewOne-movieCard">
			<div class="viewOne-header">
				<h1 style="text-align: center;"><c:out value="${movie.title}"></c:out></h1>
			</div>
			<div class="viewOne-body">
				 <img class="viewOne-img" src="<c:url value="${movie.imdb_movie_poster}"/>" height="450">
				 <div class="card-text">
				 	<p class="card-desc" style="padding-bottom: 6%; border-bottom: 2px solid white;"><c:out value="${movie.description}"/></p>
				 	<p class="card-genre"><c:out value="${movie.genre}"/></p>
			 		<div class="viewOne-rating">
			 			<strong>IMDb Rating</strong>
				 		<div class="viewOne-align">
				 			<img src="/imgs/star.png" height="40" style="margin-right: 2%;">
							<h2><c:out value="${movie.imdbScore}"/>/10</h2>
				 		</div>
			 		</div>
			 		<div class="viewOne-bottom">View on IMDb: <a href = "<c:url value="${movie.imdbLink}"/>"><img src="https://cdn.freebiesupply.com/images/large/2x/imdb-logo-transparent.png" height="30"></a></div>
				 </div>
			</div>
		</div>
	</div>
</body>

</html>