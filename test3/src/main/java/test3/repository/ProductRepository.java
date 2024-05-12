package test3.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import test3.entity.Product;

public interface ProductRepository extends JpaRepository<Product, String>{
	Product findById(Long id);
	List<Product> findAllByLiked(int liked);
	boolean deleteById(Long id);

}
