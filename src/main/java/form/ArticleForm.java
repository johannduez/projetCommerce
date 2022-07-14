package form;

import java.util.ArrayList;
import java.util.List;

import model.Article;
import model.Filtre;
import repo.ArticleRepository;

public class ArticleForm {
	public static List<Article> getListArticles(Filtre filtre,ArticleRepository artRepository) {
		String nom = "%";
		ArrayList<Article> articles=new ArrayList<>();
		if (!filtre.getNom().isEmpty() && !filtre.getNom().equals("")) {
			nom += filtre.getNom() + "%";
		}
		double prixMin = filtre.getPrixMin() != null ? filtre.getPrixMin() : 0;
		double prixMax = filtre.getPrixMax() != null ? filtre.getPrixMax() : 100000000;

		if (filtre.getTelephone() != null && filtre.getTelephone() == 1) {
			List<Article> telephone = artRepository.findFiltre("Téléphone", prixMax, prixMin, nom);

			if (telephone.size() > 0)
				articles.addAll(telephone);
		}
		if (filtre.getOrdinateur() != null && filtre.getOrdinateur() == 1) {
			List<Article> ordinateur = artRepository.findFiltre("Ordinateur", prixMax, prixMin, nom);
			if (ordinateur.size() > 0)
				articles.addAll(ordinateur);
		}
		if (filtre.getElectromenager() != null && filtre.getElectromenager() == 1) {
			List<Article> electromenager = artRepository.findFiltre("Electroménager", prixMax, prixMin, nom);
			if (electromenager.size() > 0)
				articles.addAll(electromenager);
		}
		
		return articles;
	}
}
