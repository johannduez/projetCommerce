package controller;

import java.sql.SQLException;
import java.util.Optional;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.CookieValue;
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
	public String inscription(Model model, @Valid @ModelAttribute(name = "client") Client client,BindingResult br) throws ClassNotFoundException, SQLException{
		if (br.hasErrors())
            return "client/inscription";
		
		Optional<Client> c = clientRepository.findById(client.getId());
		System.out.println(c);
		if (!c.isPresent()){
			clientRepository.save(client);
			return "redirect:/client/authentification";
		} else {
			model.addAttribute("notif", "Id deja existant");
			return "/client/inscription";
		}
	}
	
	@GetMapping("/authentification")
	public ModelAndView connection(@CookieValue(value = "id", defaultValue = "") String cookieID, @CookieValue(value = "password", defaultValue = "") String cookiePassword, Model model){
		
		if(cookieID != "" && cookiePassword != ""){
			model.addAttribute("cookieID", cookieID);
			model.addAttribute("cookiePassword", cookiePassword);
		}
		return new ModelAndView("/client/authentification","client", new Client());
	}

	@GetMapping("/deconnexion")
	public String deconnexion(HttpSession session){
		session.invalidate();
		return "redirect:/accueil/accueil";
	}

	@PostMapping("/authentification")
	public String connection(@ModelAttribute(name = "client") Client client, @RequestParam(value="souvenir", required = false) Boolean souvenir,Model model, HttpSession session, HttpServletResponse response) throws ClassNotFoundException, SQLException{

		Client c = clientRepository.findByIdAndPassword(client.getId(),client.getPassword());

		if (c==null){
			model.addAttribute("notification", "Id ou mot de passe incorrecte");
			return "/client/authentification";
		} else {
			Commande commande = new Commande();
			commande.setClient(c);
			session.setAttribute("commande", commande);
			
			if(souvenir!=null){
				Cookie cookieID = new Cookie("id", client.getId().toString());
				cookieID.setMaxAge(60 * 60 * 24 * 30);
				response.addCookie(cookieID);
				Cookie cookiePassword = new Cookie("password", client.getPassword());
				cookieID.setMaxAge(60 * 60 * 24 * 30);
				response.addCookie(cookiePassword);
			}
			
			return "redirect:/accueil/accueil";
		}
	}

}
