package controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/accueil")
public class AccueilController {

	@RequestMapping("/accueil")
	public String accueil(){
		return "/test/pageVierge";
	}
}
