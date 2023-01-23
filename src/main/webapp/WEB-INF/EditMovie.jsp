<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%> 
<%@ page isErrorPage="true" %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>Edit Movie Listing</title>
	<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
	<link rel="stylesheet" type="text/css" href="/css/style.css">
	<script type="text/javascript" src="/js/app.js"></script>
	<script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
</head>

<body>
	<div id="edit-movie">
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
	<div class="edit-movie-container">
			<div class="edit-movie-center">
				<a class="edit-movie navbar-brand" href="/" style="color: white; font-size: 30pt;"><img class="add-movie-nav-logo" src="/imgs/film.png" height="70">FlickList</a>
			</div>
			<div class="edit-movie-nav"> 
				<h1 class="edit-movie-title" style="font-weight: 300;">Edit a Movie Listing</h1>
			</div>
		<form:form action="/movies/${movie.id}" method="post" modelAttribute="movie">
		<input type="hidden" name="_method" value="put"/>
			<div class="row mb-3">
				<form:errors class="error" path="imdbLink"/>
				<form:label class="col-sm-2 col-form-label" path="imdbLink">IMDb Link: </form:label>
				<div class="col-sm-10">
					<form:input class="form-control" path="imdbLink"/>
				</div>
			</div>
			<div class="row mb-3">
				<form:errors class="error" path="title"/>
				<form:label class="col-sm-2 col-form-label" path="title">Title: </form:label>
				<div class="col-sm-10">
					<form:input class="form-control" path="title"/>
				</div>
			</div>
			<div class="row mb-3">
				<form:errors class="error" path="description"/>
				<form:label class="col-sm-2 col-form-label" path="description">Description: </form:label>
				<div class="col-sm-10">
					<form:textarea class="form-control" path="description" rows="4" cols="30"></form:textarea>
				</div>
			</div>
			<div class="row mb-3">
				<form:errors class="error" path="imdbScore"/> 
				<form:label class="col-sm-2 col-form-label" path="imdbScore">Rating: </form:label>
				<div class="col-sm-10">
					<form:input class="form-control" path="imdbScore"/>
				</div>
			</div>
			<div class="row mb-3">
				<form:errors class="error" path="genre"/>
				<form:label class="col-sm-2 col-form-label" path="genre">Genre: </form:label>
				<div class="col-sm-10">
					<form:input class="form-control" path="genre"/>
				</div>
			</div>
			<%-- <div class="row mb-3">
				<form:errors class="error" path="imdb_movie_poster"/>
				<form:label class="col-sm-2 col-form-label" path="imdb_movie_poster">Poster URL Link: </form:label>
				<div class="col-sm-10">
					<form:input class="form-control" path="imdb_movie_poster"/>
				</div>
			</div> --%>
			<div class="row mb-3">
					<form:errors class="error" path="imdb_movie_poster"/>
					<form:label class="col-sm-2 col-form-label" path="imdb_movie_poster">Poster URL:</form:label>
					<div class="col-sm-10">
						<%-- <form:input class="form-control" path="imdb_movie_poster"/> --%>
						<form:input path="imdb_movie_poster" type="file" id="myFile" name="filename"/>
					</div>
				</div>
			<%-- <p>
				<form:input type="hidden" path="user" value="${user.id}"/>
			</p> --%>
			<div class="add-movie-bottom-row">
				<div>
					<a href="/" class="btn btn-dark"> Cancel</a>
				</div>
				<div class="centerbtn">
					<input class="btn btn-dark" type="submit" value="Submit"/>	
				</div>
			</div>
		</form:form>
		</div>
	</div>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
</body>

</html>