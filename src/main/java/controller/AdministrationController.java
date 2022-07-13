package controller;

import java.sql.SQLException;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import model.Administration;
import model.Client;
import model.Commande;
import repo.AdminRepository;

@Controller
@RequestMapping("/admin")
public class AdministrationController {
	@Autowired
	private AdminRepository adminRepository;

	public AdminRepository getAdminRepository() {
		return adminRepository;
	}

	public void setAdminRepository(AdminRepository adminRepository) {
		this.adminRepository = adminRepository;
	}

	@GetMapping("/authentification")
	public ModelAndView connection() {
		return new ModelAndView("/administration/authentification", "admin", new Administration());
	}

	@PostMapping("/authentification")
	public String connection(@ModelAttribute(name = "admin") Administration admin, Model model, HttpSession session)
			throws ClassNotFoundException, SQLException {
		System.out.println(admin);
		Administration admininistration = adminRepository.findByLoginAndPassword(admin.getLogin(), admin.getPassword());
System.out.println(admininistration);
		if (admininistration == null) {
			model.addAttribute("notification", "Login ou mot de passe incorrecte");
			return "/administration/authentification";
		} else {
			if(admininistration.getActif()!=1){
				model.addAttribute("notification", "Profil pas actif!");
				return "/administration/authentification";
			}
			else{
				session.setAttribute("admininistration", admininistration);
			}
			

			return "redirect:/accueil/accueil";
		}
	}
}
