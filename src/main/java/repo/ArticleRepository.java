package repo;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import model.Article;

public interface ArticleRepository extends JpaRepository<Article, Integer> {
	public List<Article> findByCategorie(String categorie);
	public Article findByNom(String nom);
}
