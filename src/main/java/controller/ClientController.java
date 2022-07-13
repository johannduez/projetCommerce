package controller;

import java.sql.SQLException;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import model.Client;
import model.Commande;
import repo.ClientRepository;

@Controller
@RequestMapping("/client")
public class ClientController {
	@Autowired
	private ClientRepository clientRepository;
	
	public ClientRepository getClientRepository() {
		return clientRepository;
	}

	public void setClientRepository(ClientRepository clientRepository) {
		this.clientRepository = clientRepository;
	}

	
	@GetMapping("/inscription")
	public ModelAndView inscription(Model model){
		return new ModelAndView("/client/inscription","client", new Client());
	}
	
	@PostMapping("/inscription")
	public String inscription(@Valid @ModelAttribute(name = "client") Client client,BindingResult br) throws ClassNotFoundException, SQLException{
		if (br.hasErrors())
            return "client/inscription";
		
		clientRepository.save(client);
		return "redirect:/accueil/accueil";
	}
	
	@GetMapping("/authentification")
	public ModelAndView connection(){
		return new ModelAndView("/client/authentification","client", new Client());
	}

	@GetMapping("/deconnexion")
	public String deconnexion(HttpSession session){
		session.invalidate();
		return "redirect:/accueil/accueil";
	}

	@PostMapping("/authentification")
	public String connection(@ModelAttribute(name = "client") Client client, Model model, HttpSession session) throws ClassNotFoundException, SQLException{

		Client c = clientRepository.findByIdAndPassword(client.getId(),client.getPassword());
		
		if (c==null){
			model.addAttribute("notification", "Id ou mot de passe incorrecte");
			return "/client/authentification";
		} else {
			Commande commande = new Commande();
			commande.setClient(c);
			session.setAttribute("commande", commande);
			
			return "redirect:/accueil/accueil";
		}
		
	}

}
