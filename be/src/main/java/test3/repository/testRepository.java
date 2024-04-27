package test3.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import test3.entity.testEntity;

public interface testRepository extends JpaRepository<testEntity, String>{
	testEntity findById(Long id);
	List<testEntity> findAllByLiked(int liked);
	boolean deleteById(Long id);

}
