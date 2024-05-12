package test3.api;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import test3.dto.UserDto;
import test3.entity.User;
import test3.repository.UserRepo;

@RestController
@CrossOrigin
@RequestMapping("/user")
public class UserAPI {

	@Autowired
	UserRepo userRe;
	
	@PostMapping("/signup")
	public ResponseEntity<?> createUser(@RequestBody User user){
		try {
			userRe.save(user);
			return ResponseEntity.ok("Success");
		} catch (Exception e) {
			return ResponseEntity.badRequest().body("Fail");
		}
	}
	
	@PostMapping("/login")
	public ResponseEntity<?> login(@RequestBody UserDto userDto){
		try {
			User userLogin = userRe.findByEmail(userDto.getEmail());
			if(userLogin.getEmail().equals(userDto.getEmail())&& userLogin.getPassword().equals(userDto.getPassword())) {
				return ResponseEntity.ok(userLogin);
			}
			return ResponseEntity.badRequest().body("Fail");
		} catch (Exception e) {
			return ResponseEntity.badRequest().body("Fail");
		}
		
	}


}
