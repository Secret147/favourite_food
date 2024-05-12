package test3.api;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import test3.dto.CheckDto;
import test3.entity.Product;
import test3.entity.User;
import test3.entity.UserProduct;
import test3.repository.ProductRepository;
import test3.repository.UserProductRepo;
import test3.repository.UserRepo;

@RestController
@CrossOrigin
@RequestMapping("/userproduct")
public class UserProductAPI {
	@Autowired
	UserProductRepo userProductRe;
	@Autowired
	UserRepo userRe;
	@Autowired
	ProductRepository productRe;

	public UserProductAPI() {
		// TODO Auto-generated constructor stub
	}
	@PostMapping("/checked")
	public ResponseEntity<?> checkLiked(@RequestBody CheckDto checkDto){
		User user = userRe.findByEmail(checkDto.getEmail());
		try {
			UserProduct userProduct = userProductRe.findByUserIdAndProductId(user.getId(), checkDto.getProductId());
			if(userProduct!= null) {
				return ResponseEntity.ok(1);
			}
			return ResponseEntity.ok(0);
		} catch (Exception e) {
			return ResponseEntity.ok(0);
		}
		
	}
	@PostMapping("/liked")
	public ResponseEntity<?> liked(@RequestBody CheckDto checkDto){
		User user = userRe.findByEmail(checkDto.getEmail());
		Product product = productRe.findById(checkDto.getProductId());
		UserProduct userProduct = userProductRe.findByUserIdAndProductId(user.getId(), checkDto.getProductId());
		if(userProduct !=null){
			userProductRe.delete(userProduct);
			return ResponseEntity.ok("disliked");
		}else {
			UserProduct userProduct2 = new UserProduct();
			userProduct2.setUser(user);
			userProduct2.setProduct(product);
			try {
				userProductRe.save(userProduct2);
				return ResponseEntity.ok("like");
			}catch (Exception e) {
				return ResponseEntity.badRequest().body("fail");
			}
		}
		
		
	}
	
	@GetMapping("/list/liked")
	public ResponseEntity<?> getListLiked(@RequestBody String email){
		User user = userRe.findByEmail(email);
		return ResponseEntity.ok(userProductRe.findByUserId(user.getId()));
	}
	
	

}
