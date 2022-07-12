package controller;

import java.sql.SQLException;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import model.Client;
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
}
