package repo;

import org.springframework.data.jpa.repository.JpaRepository;

import model.Administration;
import model.Client;

public interface AdminRepository extends JpaRepository<Administration, Integer> {
	Administration findByLoginAndPassword(int login, String password);
}
