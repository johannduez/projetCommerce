package controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import model.Article;
import model.Commande;
import model.LigneCommande;
import repo.ArticleRepository;

@Controller
@RequestMapping("/commande")
public class CommandeController {
	@Autowired
	ArticleRepository artRepository;

	@RequestMapping("/panier")
	public String panier(HttpSession session, Model model) {
		if (session.getAttribute("commande") == null) {
			session.setAttribute("commande", new Commande());
		}

		model.addAttribute("articles", artRepository.findAll());
		model.addAttribute("ligne", new LigneCommande());
		return "commande/panier";
	}
	
	
	@RequestMapping("/recapitulatif")
	public String panier() {
		
		return "commande/recapitulatif";
	}
	

	@RequestMapping("/viderpanier")
	public String viderpanier(HttpSession session, Model model) {
		Commande commande = (Commande) session.getAttribute("commande");
		if (commande != null) {
			commande.setPrixTotal(0);
			commande.getLignes().clear();
			session.setAttribute("commande", commande);
		}

		return "redirect:/commande/panier";
	}

	@PostMapping("/panier") // fonction post
	public String panier(@ModelAttribute("ligne") LigneCommande ligne, Model model, HttpSession session) {
		Commande commande = (Commande) session.getAttribute("commande");
		List<Article> liste = artRepository.findAll();
		commande.addLigneCommande(ligne.getArticle().getId(), ligne.getQuantite(), liste);
		model.addAttribute("articles", liste);
		session.setAttribute("commande", commande);
		return "commande/panier";
	}
}
