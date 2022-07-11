package model;

public class LigneCommande {
	private int quantite;
	private double prix;
	private Article article;

	public LigneCommande(int quantite, double prix, Article article) {
		super();
		this.quantite = quantite;
		this.prix = prix;
		this.article = article;
	}

	public LigneCommande() {
		super();
	}

	public int getQuantite() {
		return quantite;
	}

	public void setQuantite(int quantite) {
		this.quantite = quantite;
	}

	public double getPrix() {
		return prix;
	}

	public void setPrix(double prix) {
		this.prix = prix;
	}

	public Article getArticle() {
		return article;
	}

	public void setArticle(Article article) {
		this.article = article;
	}

}
