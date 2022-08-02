package kr.co.airbnb.controller;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.multipart.MultipartFile;

import kr.co.airbnb.annotation.LoginUser;
import kr.co.airbnb.form.SocialLoginForm;
import kr.co.airbnb.form.UserRegisterForm;
import kr.co.airbnb.service.UserService;
import kr.co.airbnb.utils.SessionUtils;
import kr.co.airbnb.vo.User;
import kr.co.airbnb.vo.Wishlist;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/user")
@SessionAttributes({"userRegisterForm"})
@Slf4j
public class UserController {

	@Value("${airbnb.profile.image.save-directory}")
	String profileImageSaveDirectory;
	private static final String KAKAO_LOGIN_TYPE = "kakao";
	
	@Autowired
	private UserService userService;
	
	@GetMapping(path="/kakao")
	public String kakaotest() {
		return "user/kakaotest";
	}
	@GetMapping(path="/facebook")
	public String facebooktest() {
		return "user/facebooktest";
	}
	@GetMapping(path="google")
	public String googletest() {
		return "user/googletest";
	}
	
	
	// 카카오 로그인 요청을 처리한다.
		@PostMapping("/sns-login")
		public String loginWithSns(SocialLoginForm form) {
			log.info("소셜 로그인 인증정보: " + form);
			
			User user = User.builder()
						.name(form.getNickname())
						.email(form.getEmail())
						.gender(form.getGender() != null ? form.getGender() : "")
						.loginType(form.getLoginType())
						.build();
			User savedUser = userService.loginWithSns(user);
			
			if (savedUser != null) {
				SessionUtils.addAttribute("LOGIN_USER", savedUser);
				savedUser.setLoginType(form.getLoginType());
			} else {
				SessionUtils.addAttribute("LOGIN_USER", user);
			}
			log.info("소셜 로그인 완료");
			
			return "redirect:/"; 
		}
	
	@GetMapping(path="/register")
	public String register(Model model) {
		
		// 폼입력값을 담을 객체를 미리 생성해서 Model에 저장
		model.addAttribute("userRegisterForm", new UserRegisterForm());
		return "user/home";
	}
	
	@GetMapping(path="/checkEmail")
	@ResponseBody
	public Map<String, Object> checkEmail(@RequestParam("email") String email) {
		Map<String, Object> result = new HashMap<>();
		System.out.println("email: " + email);
		User savedUser = userService.getUserByEmail(email);
		System.out.println(savedUser);
		
		if(savedUser == null) {
			result.put("exist", false);
		} else {
			result.put("exist", true);
		}
		return result;
	}
	
	@PostMapping(path="/register")
	@ResponseBody
	public Map<String, Object> register(@ModelAttribute("userRegisterForm") UserRegisterForm userRegisterForm, Model model, SessionStatus sessionStatus) {
		
		User user = new User();
		user.setName(userRegisterForm.getLastName() + userRegisterForm.getFirstName());
		user.setBirthDate(userRegisterForm.getBirthDate());
		user.setEmail(userRegisterForm.getRegisterEmail());
		user.setPassword(userRegisterForm.getPassword());
		
		userService.addNewUser(user);
		// 세션에서 UserRegisterForm 삭제
		sessionStatus.setComplete();
		// 회원가입시 자동으로 로그인 처리됨
		SessionUtils.addAttribute("LOGIN_USER", user);
		
		Map<String, Object> result = new HashMap<String, Object>();
		result.put("success", true);
		
		return result;
	}
	
	@PostMapping(path="/addProfileImg")
	public Map<String, Object> uploadProfileImg(@RequestParam("profileImg") MultipartFile multipartFile, @LoginUser User loginUser) throws IOException {
		
		// 프로필이미지 사진 처리하기
		if(!multipartFile.isEmpty()) {
			String filename = multipartFile.getOriginalFilename();
			User user = userService.getUserByEmail(loginUser.getEmail());
			user.setProfileImage(filename);
			userService.updateUserInfo(user);
			
			// 이미지 파일명이 중복되는 것을 방지하기 위해 고유이미지파일명 설정? UUID.randomUUID()
			
			InputStream in = multipartFile.getInputStream();	// 업로드된 첨부파일이 임시파일로 저장되는데 그 파일을 읽어오는 스트림이다.
			FileOutputStream out = new FileOutputStream(new File(profileImageSaveDirectory, filename));
			FileCopyUtils.copy(in, out);
		}
		
		Map<String, Object> result = new HashMap<String, Object>();
		result.put("success", true);
		
		return result;
	}
	
	@GetMapping(path="/wishlists")
	public String wishlist(Model model) { // 추후 @LoginUser User loginUser 추가하기
		
		// List<Wishlist> wishlists = userService.getMyWishlists(loginUser.getNo());
		// model.addAttribute("wishlists", wishlists);
		return "user/wishlist";
	}
}
