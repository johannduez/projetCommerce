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
import model.Client;
import model.Commande;
import model.LigneCommande;
import repo.ArticleRepository;
import repo.CommandeRepository;
import repo.LigneCommandeRepository;

@Controller
@RequestMapping("/commande")
public class CommandeController {
	@Autowired
	ArticleRepository artRepository;
	@Autowired
	LigneCommandeRepository ligneCommandeRepository;
	@Autowired
	CommandeRepository commandeRepository;
	@RequestMapping("/panier")
	public String panier(HttpSession session, Model model) {
		if (session.getAttribute("commande") == null) {
			Commande commande = new Commande();
			commande.setClient(new Client(1, "1", "duez", "johann", "greasque"));
			session.setAttribute("commande", commande);
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
	@RequestMapping("/validerpanier")
	public String validerpanier(HttpSession session) {
		Commande commande = (Commande) session.getAttribute("commande");
		
		commandeRepository.save(commande);
		for (LigneCommande ligne : commande.getLignes()) {
			ligneCommandeRepository.save(ligne);
		}

		return "commande/validerCommande";
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
