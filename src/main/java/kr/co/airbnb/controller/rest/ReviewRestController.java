package kr.co.airbnb.controller.rest;

import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import kr.co.airbnb.annotation.LoginUser;
import kr.co.airbnb.form.GuestReviewForm;
import kr.co.airbnb.form.HostReviewForm;
import kr.co.airbnb.reponse.ListResponseData;
import kr.co.airbnb.reponse.ResponseData;
import kr.co.airbnb.reponse.SingleResponseData;
import kr.co.airbnb.service.ReviewService;
import kr.co.airbnb.vo.Accommodation;
import kr.co.airbnb.vo.GuestRequest;
import kr.co.airbnb.vo.HostRequest;
import kr.co.airbnb.vo.Review;
import kr.co.airbnb.vo.User;

@RestController
@CrossOrigin("*")
@RequestMapping("/review")
public class ReviewRestController {
	
	@Autowired
	ReviewService reviewService;
	
	@GetMapping(path = "/check")
	public SingleResponseData<String> duplicateCheck(@RequestParam("reservationNo") int reservationNo, @LoginUser User loginUser) {
		
		String isDuplicated = reviewService.getDuplicateReview(reservationNo, loginUser.getNo());		// "Y" or "N" 나온다. Y가 나오면 이미 리뷰를 달았다는 뜻이다.
		return SingleResponseData.create(isDuplicated);
	}
	
	@GetMapping(path = "/checkOverdue")
	public SingleResponseData<String> overdueCheck(@RequestParam("reservationNo") int reservationNo, @LoginUser User loginUser) {
		
		String isOverdue = reviewService.getCheckoutDate(reservationNo, loginUser.getNo());				// "Y" or "N" 나온다. Y가 나오면 체크아웃한지 14일이 지났다는 뜻이다.
		return SingleResponseData.create(isOverdue);
	}
	
	@GetMapping(path = "/getGuest")
	public SingleResponseData<GuestRequest> guestRequest(@RequestParam("reservationNo") int reservationNo) {
		GuestRequest guestRequest = reviewService.getGuestInfo(reservationNo);

		return SingleResponseData.create(guestRequest);
	}
	
	@GetMapping(path = "/getHost")
	public SingleResponseData<HostRequest> hostRequest(@RequestParam("reservationNo") int reservationNo) {
		HostRequest hostRequest = reviewService.getHostInfo(reservationNo);
		
		return SingleResponseData.create(hostRequest);
	}
	
	@PostMapping(path = "/saveGuest")
	public ResponseData saveReview(@RequestBody GuestReviewForm guestReviewForm, @LoginUser User loginUser)  {
		Review review = Review.createGuestReview(guestReviewForm);
		reviewService.saveGuestReview(review, loginUser.getNo(), guestReviewForm.getAccNo());
		
		return ResponseData.create(true, "리뷰가 등록되었습니다.");
	}
		
	@PostMapping(path = "/saveHost")
	public ResponseData saveReview(@RequestBody HostReviewForm hostReviewForm, @LoginUser User loginUser) {
		Review review = Review.createHostReview(hostReviewForm);
		reviewService.saveHostReview(review, loginUser.getNo(), hostReviewForm.getAccNo());
		
		return ResponseData.create(true, "리뷰가 등록되었습니다.");
	}
	
	@GetMapping(path = "/reviews")
	public ListResponseData<Review> reviews(@RequestParam("no") int accNo, @RequestParam(name="page", required=false, defaultValue="1")int pageNo) {
		int rows = 10;										// 한 페이지에 나오는 행 갯수	
		int beginIndex = (pageNo - 1) * rows + 1;			// 시작 번호
		int endIndex = pageNo * rows;						// 끝 번호
		
		List<Review> reviews = reviewService.getReviews(accNo, beginIndex, endIndex);
		
		return ListResponseData.create(reviews);
	} 
	
	@GetMapping(path = "/reviewsUnder")
	public ListResponseData<Review> reviewsUnder(@RequestParam("no") int accNo) {
		List<Review> reviews = reviewService.getReviewsUnder(accNo);
		
		return ListResponseData.create(reviews);
	}
	/*
	@GetMapping(path = "/search")
	public ListResponseData<Review> searchReview(@RequestParam("no") int accNo, @RequestParam("keyword") String keyword) {
		List<Review> reviews = reviewService.getSearchReview(accNo, keyword);
		
		return ListResponseData.create(reviews);
	}
	*/
}
