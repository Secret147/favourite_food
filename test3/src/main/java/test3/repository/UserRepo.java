package test3.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import test3.entity.User;

public interface UserRepo extends JpaRepository<User, Long>{

	User findByEmail(String email);
}
