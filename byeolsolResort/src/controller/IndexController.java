package controller;

import java.sql.Date;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import model.dto.Customer;
import model.dto.Reserv;
import model.dto.Room;
import model.service.CustomerService;
import model.service.FtpService;
import model.service.ReservService;
import model.service.RoomService;

@Controller
@RequestMapping("/index")
public class IndexController {
	
	//어드민페이지
	//Q&A현황
	@GetMapping("/adminQnA")
	public String adminQnAPage() {
		return "/adminPage/adminQnA";
	}
	
	//객실정보관리
	@GetMapping("/adminRoom")
	public String adminRoomPage() {
		return "adminPage/adminRoom";
	}
	
	//유저정보관리
	@GetMapping("/adminUser")
	public String adminUserPage() {
		return "/adminPage/adminUser";
	}
	

	//메인페이지
	@GetMapping("/main")
	public String mainPage(@RequestParam(required = false) String errorMessage, Model m) {
		m.addAttribute("errorMessage", errorMessage);
		return "/main/main";
	}
	
	//별솔리조트 페이지
	//별솔리조트란?
	@GetMapping("/byeolsolInfo")
	public String explicateLisPage() {
		return "/explicateList/byeolsolInfo";
	}
	
	//객실소개
	@GetMapping("/roomMain")
	public String roomMainPage() {
		return "/explicateList/roomMain";
	}
	
	//객실1
	@GetMapping("/roomInfo_01")
	public String roomInfo1Page() {
		return "/explicateList/roomInfo_01";
	}

	//객실2
	@GetMapping("/roomInfo_02")
	public String roomInfo2Page() {
		return "/explicateList/roomInfo_02";
	}
	
	@GetMapping("/roomInfo_03")
	public String roomInfo3Page() {
		return "/explicateList/roomInfo_03";
	}
	
	//이용안내
	@GetMapping("/fee")
	public String feePage() {
		return "/explicateList/fee";
	}
	
	//오시는길
	@GetMapping("/map")
	public String mapPage() {
		return "/explicateList/map";
	}
	
	//별솔소식 리스트
	//별솔뉴스
	@GetMapping("/news")
	public String newsPage() {
		return "/newsList/news";
	}
	
	//이벤트
	@GetMapping("/event")
	public String eventPage() {
		return "/newsList/event";
	}
	
	//회원서비스 리스트
	//객실예약
	@GetMapping("/leftover")
	public String leftoverPage() {
		return "/serviceList/leftover";
	}
	
	//객실현황
	@GetMapping("/guestroom")
	public String guestroomPage() {
		return "/serviceList/guestroom";
	}
	
	//후기게시판
	@GetMapping("/board")
	public String boardPage() {
		return "/serviceList/board";
	}
	
	//주변관광지 리스트
	//여행코스
	@GetMapping("/trip")
	public String tripPage() {
		return "/tour/trip";
	}
	
	//골프코스
	@GetMapping("/golf")
	public String golfPage() {
		return "/tour/golf";
	}
	
	//등산코스
	@GetMapping("/mount")
	public String mountPage() {
		return "/tour/golf";
	}
	
	//하단메뉴
	//회사소개
	@GetMapping("/about")
	public String aboutPage() {
		return "/bottom/about";
	}
	
	//개인정보 처리방침
	@GetMapping("/privacy")
	public String privacyPage() {
		return "/bottom/privacy";
	} 
	
	//영상정보처리기기
	@GetMapping("/operation")
	public String operationPage() {
		return "/bottom/operation";
	}
	
	//이용약관
	@GetMapping("termsofuse")
	public String termsofusePage() {
		return "/bottom/termsofuse";
	}
	
	//이메일무단수집거부
	@GetMapping("/emailcollection")
	public String emailcollectionPage() {
		return "/bottom/emailcollection";
	}
}
