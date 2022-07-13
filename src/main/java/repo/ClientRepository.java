package repo;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import model.Client;

public interface ClientRepository extends JpaRepository<Client, Integer> {
	Client findByIdAndPassword(int id, String password);
}
