package com.lilyochs.moviecritic.repositories;

import java.util.List;
import java.util.Optional;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.lilyochs.moviecritic.models.Movie;

@Repository
public interface MovieRepository extends CrudRepository<Movie, Long>{
	List<Movie> findAll();
	Optional<Movie> findById(Long id);
	List<Movie> findByTitleIs(String search);
	List<Movie> findByTitleContaining(String search);
	List<Movie> findByOrderByImdbScoreDesc();
	
}
