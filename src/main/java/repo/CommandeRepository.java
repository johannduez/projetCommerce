package repo;




import org.springframework.data.jpa.repository.JpaRepository;


import model.Commande;

public interface CommandeRepository extends JpaRepository<Commande, Integer> {
	
}
