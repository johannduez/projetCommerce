package repo;




import org.springframework.data.jpa.repository.JpaRepository;



import model.LigneCommande;

public interface LigneCommandeRepository extends JpaRepository<LigneCommande, Integer> {
	
}
