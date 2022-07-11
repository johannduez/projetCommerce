package model;

public class Article {
	private int id;
	private String nom;
	private String description;
	private double tarif;
	private String image;
	private String categorie;

	public Article(int id, String nom, String description, double tarif, String image, String categorie) {
		super();
		this.id = id;
		this.nom = nom;
		this.description = description;
		this.tarif = tarif;
		this.image = image;
		this.categorie = categorie;
	}

	public Article() {
		super();
	}

	public String getNom() {
		return nom;
	}

	public void setNom(String nom) {
		this.nom = nom;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public double getTarif() {
		return tarif;
	}

	public void setTarif(double tarif) {
		this.tarif = tarif;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public String getCategorie() {
		return categorie;
	}

	public void setCategorie(String categorie) {
		this.categorie = categorie;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	@Override
	public String toString() {
		return "Article [id=" + id + ", nom=" + nom + ", description=" + description + ", tarif=" + tarif + ", image="
				+ image + ", categorie=" + categorie + "]";
	}

}
