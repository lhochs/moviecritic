package com.lilyochs.moviecritic.controllers;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;

import com.lilyochs.moviecritic.models.Movie;
import com.lilyochs.moviecritic.services.MovieService;


@Controller
public class MovieController {
	
//	@Autowired
//	private UserService userService;
	@Autowired
	MovieService movieService;


	@GetMapping("/")
	public String index(Model model) {
		model.addAttribute("movies", movieService.allMovies());
		return "index.jsp";
	}
	
	@GetMapping("/movies/by-rating")
	public String movieRating(Model model) {
		model.addAttribute("movies", movieService.sortByRating());
		return "index.jsp";
	}
	
	@GetMapping("/movies/new")
	public String newMovie(@ModelAttribute("movie") Movie movie){
		return "NewMovie.jsp";
	}
	
	@PostMapping("/movies")
	public String create(@Valid @ModelAttribute("movie") Movie movie, BindingResult result) {
		if (result.hasErrors()) {
			return "NewMovie.jsp";
		}else {
		    // CODE TO MAKE A NEW BOOK AND SAVE TO THE DB
			movieService.createMovie(movie);
		    return "redirect:/";
			}
		}
	
	@GetMapping("/movies/edit/{id}")
    public String edit(@PathVariable("id") Long id, Model model) {
		Movie movie = movieService.findMovie(id);
        model.addAttribute("movie", movie);
        return "EditMovie.jsp";
    }
	
	
	@PutMapping("/movies/{id}")
	public String update(@Valid @ModelAttribute("movie") Movie movie, BindingResult result, Model model) {
		if (result.hasErrors()) {
			return "EditMovie.jsp";
		}
			movieService.updateMovie(movie);
			return "redirect:/";
	}
	
	
	@DeleteMapping("/movies/{id}")
	public String destroy(@PathVariable("id") Long id) {
        movieService.deleteMovie(id);
        return "redirect:/";
	}
	
	@GetMapping("/movies/{id}")
    public String viewOne(@PathVariable("id") Long id, Model model) {
		Movie movie = movieService.findMovie(id);
		model.addAttribute("movie", movie);
        return "ViewOne.jsp";
    }
}
