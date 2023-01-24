package com.lilyochs.moviecritic.models;

import java.util.Date;

import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Lob;
import javax.persistence.PrePersist;
import javax.persistence.PreUpdate;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import org.hibernate.validator.constraints.Range;
import org.springframework.format.annotation.DateTimeFormat;

@Entity
@Table(name="movies")
public class Movie {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	@NotNull
	@Size(min=4, max=65535)
	private String imdbLink;
	@NotNull
	@Size(min=2, max=255)
	private String title;
	@NotNull
	@Size(min=4, max=65535)
	private String description;
	@NotNull
	@Range(min=0, max=10)
	private Double imdbScore;
	@NotNull
	@Size(min=2, max=255)
	private String genre;
	@NotNull
	private String imdb_movie_poster;
	
	@Column(updatable=false)
    @DateTimeFormat(pattern="yyyy-MM-dd")
    private Date createdAt;
    @DateTimeFormat(pattern="yyyy-MM-dd")
    private Date updatedAt;
    
    public Movie() {
    }
    
//	public Movie(String imdbLink, String title, String description, Double imdbScore, String genre, String moviePoster) {
//		this.imdbLink = imdbLink;
//		this.title = title;
//		this.description = description;
//		this.imdbScore = imdbScore;
//		this.genre = genre;
//		this.moviePoster = moviePoster;
//    }

	
	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getImdbLink() {
		return imdbLink;
	}

	public void setImdbLink(String imdbLink) {
		this.imdbLink = imdbLink;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public Double getImdbScore() {
		return imdbScore;
	}

	public void setImdbScore(Double imdbScore) {
		this.imdbScore = imdbScore;
	}

	public String getGenre() {
		return genre;
	}

	public void setGenre(String genre) {
		this.genre = genre;
	}

	public String getImdb_movie_poster() {
		return imdb_movie_poster;
	}

	public void setImdb_movie_poster(String imdb_movie_poster) {
		this.imdb_movie_poster = imdb_movie_poster;
	}

	@PrePersist
    protected void onCreate(){
        this.createdAt = new Date();
    }
    @PreUpdate
    protected void onUpdate(){
        this.updatedAt = new Date();
    }
}
