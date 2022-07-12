package controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import model.Commande;
import model.LigneCommande;

@Controller
@RequestMapping("/commande")
public class CommandeController {
	@RequestMapping("/panier")
	public String panier(HttpSession session,Model model) {
		if(session.getAttribute("commande")==null){
			session.setAttribute("commande",new Commande());
		}
		model.addAttribute("ligne",new LigneCommande());
		return "commande/panier";
	}
	
	@PostMapping("/panier") // fonction post
	public String panier(@ModelAttribute("ligne") LigneCommande ligne, Model model,HttpSession session) {
		Commande commande=(Commande) session.getAttribute("commande");
		commande.add(ligne);
		session.setAttribute("commande",commande);
		return "commande/panier";
	}
}
