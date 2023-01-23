package com.lilyochs.moviecritic.controllers;

import java.util.ArrayList;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.lilyochs.moviecritic.models.People;

@Controller
public class HomeController {

	@RequestMapping("/")
	public String salary(Model model) {
		
		String firstName = "Lily";
		String lastName = "Ochs";
		String email = "lilyochs@yahoo.com";
		Integer age = 28;
		
		model.addAttribute("first", firstName);
		model.addAttribute("last", lastName);
		model.addAttribute("email", email);
		model.addAttribute("age", age);
	
		ArrayList<String> cities = new ArrayList<String>();
		cities.add("Burbank");
		cities.add("Chicago");
		cities.add("Bellevue");

		model.addAttribute("citiesFromMyController", cities);
		
		ArrayList<People> occupations = new ArrayList<People>();
		occupations.add(new People("Alan", 105000.00));
		occupations.add(new People("Lily", 355000.00));
		occupations.add(new People("Margaret", 145000.00));
		
		model.addAttribute("peopleAndWhatTheyMake", occupations);
		
		
		return "demo.jsp";
	}
	
}
