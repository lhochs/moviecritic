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
	<div id="home">
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
		<div id="home-container">
			<div class="home-nav"> 
				<h1 class="home-title" style="font-weight: 300;">What to Watch - FlickList</h1>
			</div>
			<div class="home-sub-nav-buttons">
				<ul class="home-sub-nav">
					<li><a type="button" class="btn btn-dark" href="/movies/by-rating" style="color:white;">Top Rated</a></li>
					<li><a type="button" class="btn btn-dark" href="#" style="color:white;">Most Reviewed</a></li>
					<li><a type="button" class="btn btn-dark" href="#" style="color:white;">Movies (A to Z)</a></li>
					<li class="dropdown">
					  <button class="btn btn-dark dropdown-toggle" type="button" id="dropdownMenuButton1" data-bs-toggle="dropdown" aria-expanded="false">
					    Movies by Genre
					  </button>
					  <ul class="dropdown-menu" aria-labelledby="dropdownMenuButton1">
					    <li><a class="dropdown-item" href="#">Action</a></li>
					    <li><a class="dropdown-item" href="#">Adventure</a></li>
					    <li><a class="dropdown-item" href="#">Animation</a></li>
					    <li><a class="dropdown-item" href="#">Biography</a></li>
					    <li><a class="dropdown-item" href="#">Crime</a></li>
					    <li><a class="dropdown-item" href="#">Comedy</a></li>
					    <li><a class="dropdown-item" href="#">Drama</a></li>
					    <li><a class="dropdown-item" href="#">Fantasy</a></li>
					    <li><a class="dropdown-item" href="#">Family</a></li>
					    <li><a class="dropdown-item" href="#">History</a></li>
					    <li><a class="dropdown-item" href="#">Horror</a></li>
					    <li><a class="dropdown-item" href="#">Mystery</a></li>
					    <li><a class="dropdown-item" href="#">Music</a></li>
					    <li><a class="dropdown-item" href="#">Romantic</a></li>
					    <li><a class="dropdown-item" href="#">Sci-Fi</a></li>
					    <li><a class="dropdown-item" href="#">Sport</a></li>
					    <li><a class="dropdown-item" href="#">Thriller</a></li>
					    <li><a class="dropdown-item" href="#">War</a></li>
					  </ul>
					</li>
				</ul>
				<a type="button" class="home-sub-nav btn btn-dark" href="/movies/new" style="color:white; height: 38px; width: auto; align-items: center; margin-right: 1%">+ Add Movie</a>
			</div>
			<div class="home-movieCard">
				<c:forEach var="movie" items="${movies}">
				<div class="card" style="width: 14rem;">
				  <img class="card-img-top" onerror="this.src='/imgs/not-found.png'"  src="<c:url value="${movie.imdb_movie_poster}"/>" height="250">
				  <div class="card-body">
				    <h5 class="card-title"><c:out value="${movie.title}"/></h5>
				    <%-- <p class="card-text"><c:out value="${movie.description}"/></p> --%>
				  </div>
				  <ul class="list-group list-group-flush">
				    <li class="list-group-item">Rating: <c:out value="${movie.imdbScore}"/></li>
				    <li class="list-group-item">Genre: <c:out value="${movie.genre}"/></li>
				    <li class="list-group-item">View on IMDb: <a href = "<c:url value="${movie.imdbLink}"/>"><img src="https://cdn.freebiesupply.com/images/large/2x/imdb-logo-transparent.png" height="30"></a></li>
				  </ul>
				  <div class="bottom-link">
				  <div class="card-body">
				  <form action="/movies/${movie.id}" method="POST">
					<input type="hidden" name="_method" value="delete"/>
				    <a href="/movies/${movie.id}" class="card-link">View</a>
				    <a href="/movies/edit/${movie.id}" class="card-link">Edit</a>
					<input class="card-link" type="submit" value="Delete"/></form>
				  </div>
				  </div>
				</div>
			</c:forEach>
			</div>
		</div>
	</div>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
</body>

</html>