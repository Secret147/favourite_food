package test3.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import test3.entity.UserProduct;

public interface UserProductRepo extends JpaRepository<UserProduct,Long>{
	UserProduct findByUserIdAndProductId(Long userId,Long productId);
	List<UserProduct> findByUserId(Long id);
}
