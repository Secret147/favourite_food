package test3.api;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import test3.entity.testEntity;
import test3.repository.testRepository;

@RestController
@CrossOrigin
@RequestMapping("/dish")
public class testAPI {
	@Autowired
	private testRepository testRe;
	
	@GetMapping("/all")
	public ResponseEntity<?> getDish(){
		List<testEntity> dishs = testRe.findAll();
		return ResponseEntity.ok(dishs);
	}
	@GetMapping("/listlike")
	public ResponseEntity<?> listLike(){
		List<testEntity> dishs = testRe.findAllByLiked(1);
		return ResponseEntity.ok(dishs);
	}
	@GetMapping("/checkliked/{id}")
	public ResponseEntity<?> checkLike(@PathVariable Long id){
		testEntity dish = testRe.findById(id);
		return dish.getLiked() == 1 ? ResponseEntity.ok(true) :  ResponseEntity.ok(false) ;
	}
	@PostMapping("/newdish")
	public ResponseEntity<?> newDish(@RequestBody testEntity dish){
		testRe.save(dish);
		return ResponseEntity.ok("Save success");
	}
	@PutMapping("/liked/{id}")
	public ResponseEntity<?> liked(@PathVariable Long id){
		testEntity dish = testRe.findById(id);
		dish.setLiked(dish.getLiked()==1 ? 0 : 1);
		testRe.save(dish);
		return ResponseEntity.ok("Success");
	}
	@DeleteMapping("delete/{id}")
	public ResponseEntity<?> deletedish(@PathVariable Long id){
		testRe.deleteById(id);
		return ResponseEntity.ok("Success");
	}

}
