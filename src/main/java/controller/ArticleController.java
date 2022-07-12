package controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import model.Article;
import repo.ArticleRepository;

@Controller
@RequestMapping("/article")
public class ArticleController {
	@Autowired
	ArticleRepository artRepository;
	@RequestMapping("/magasin")
	public String magasin( Model model) {
//		Article art1=new Article("Smartphone Apple iPhone 13", "Ecran OLED Super Retina XDR de 15,5 cm Mémoire de stockage : 512 Go", 799, "/resources/img/tel1.png", "Téléphone");
//		artRepository.save(art1);
//		Article art2=new Article("Smartphone XIAOMI", "XIAOMI PACK REDMINOTE 10 128GO GRIS 5G + BRACELET CONNECTÉ MI SMART BAND 5", 219, "/resources/img/xiaomi.jpg", "Téléphone");
//		artRepository.save(art2);
//		Article art3=new Article("Smartphone SAMSUNG GALAXY S22", "OS Android 12 - 256Go de ROM, 12Go de RAM", 499, "/resources/img/tel2.jpg", "Téléphone");
//		artRepository.save(art3);
//		Article art4=new Article("Smartphone OPPO RENO", "OS Android 11 - 128Go de ROM, 8Go de RAM", 219, "/resources/img/tel3.jpg", "Téléphone");
//		artRepository.save(art4);
//		
//		
//		Article art5=new Article("PC portable LENOVO IDEAPAD 3", "Processeur Intel Core™ i5-1135G7 (4 coeurs, 2,4 GHz / Turbo Boost jusqu'à 4,2 GHz)", 499, "/resources/img/ordi1.webp", "Ordinateur");
//		artRepository.save(art5);
//		Article art6=new Article("PC portable DELL INSPIRON", "Processeur Intel Core™ i7-1255U (10 coeurs, 1,7 GHz / Turbo Boost jusqu'à 4,7 GHz)", 959, "/resources/img/ordi2.png", "Ordinateur");
//		artRepository.save(art6);
//		Article art7=new Article("PC portable MSI MODERN", " Processeur Intel Core™ i7-1195G7 (4 coeurs, 2.9 GHz / Turbo Boost jusqu'à 5 GHz)", 879, "/resources/img/ordi3.png", "Ordinateur");
//		artRepository.save(art7);
//		Article art8=new Article("PC portable LENOVO IDEAPAD 5", "Proceseur AMD Ryzen™ 9 5900HX (8 coeurs, 3,3 GHz Turbo Boost)", 959, "/resources/img/ordi4.webp", "Ordinateur");
//		artRepository.save(art8);
//		
//		Article art9=new Article("Lave-linge hublot SAMSUNG", "Capacité 9kg (tambour 61 L) - Classe énergétique A", 499, "/resources/img/electro1.jpg", "Electroménager");
//		artRepository.save(art9);
//		Article art10=new Article("Lave-linge séchant WHIRLPOOL", "Capacité de lavage 9kg / séchage 7kg - Classe énergétique E", 579, "/resources/img/electro2.jpg", "Electroménager");
//		artRepository.save(art10);
//		Article art11=new Article("Lave-vaisselle THOMSON", "Largeur 60 cm (14 couverts) - 47dB (classe sonore C)", 399, "/resources/img/electro3.png", "Electroménager");
//		artRepository.save(art11);
//		Article art12=new Article("Lave-vaisselle THOMSON ENCASTRABLE", "Encastrable - Largeur 60 cm (14 couverts) - 44dB", 399, "/resources/img/electro4.jpg", "Electroménager");
//		artRepository.save(art12);
		
		List<Article> ordinateur = artRepository.findByCategorie("Ordinateur");
		List<Article> telephone = artRepository.findByCategorie("Téléphone");

		List<Article> electromenager = artRepository.findByCategorie("Electroménager");
		model.addAttribute("ordinateur", ordinateur);
		model.addAttribute("telephone", telephone);
		model.addAttribute("electromenager", electromenager);
		
		
		return "article/magasin";
	}
}
