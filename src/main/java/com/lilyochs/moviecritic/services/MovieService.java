package com.lilyochs.moviecritic.services;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lilyochs.moviecritic.models.Movie;
import com.lilyochs.moviecritic.repositories.MovieRepository;

@Service
public class MovieService {
	@Autowired
	private MovieRepository movieRepository;
	
	public List<Movie> allMovies(){
		return movieRepository.findAll();
	}
	
	public Movie createMovie(Movie movie) {
        return movieRepository.save(movie);
    }
    // Retrieves a Movie
    public Movie findMovie(Long id) {
        Optional<Movie> optionalMovie = movieRepository.findById(id);
        if(optionalMovie.isPresent()) {
            return optionalMovie.get();
        } else {
            return null;
        }
    }
    
    //Sorts movies by rating
    public List<Movie> sortByRating(){
    	return movieRepository.findByOrderByImdbScoreDesc();
    }
    
    // Updates a Movie Listing
    public Movie updateMovie(Movie movie) {
		return movieRepository.save(movie);
	}
    
    public Movie deleteMovie(Long id){
		Optional<Movie> optionalMovie = movieRepository.findById(id);
			if(optionalMovie.isPresent()) {
				movieRepository.deleteById(id);
			}
			return null;
	}
    
}
