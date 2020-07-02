package controller;

import java.sql.Date;
import java.time.LocalDate;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import model.dto.Customer;
import model.dto.ErrorMessage;
import model.dto.Reserv;
import model.dto.Room;
import model.mapper.ReservMapper;
import model.service.CustomerService;
import model.service.ReservService;
import model.service.RoomService;

@Controller
@RequestMapping("/reserv")
public class ReservController {

	@Autowired
	ReservService reservService;

	@Autowired
	CustomerService customerService;

	@GetMapping("/addReserv")
	public String goAddReservForm(HttpSession session, @RequestParam(required = false, defaultValue = "0") int roomNum,
			Model m ) {
		if (roomNum >= 101 && roomNum <= 105 || roomNum >= 201 && roomNum <= 205 || roomNum >= 301 && roomNum <= 305) {
			if (session.getAttribute("userId") != null) {
				String userId = (String) session.getAttribute("userId");
				Customer customer = customerService.getCustomerById(userId);
				if (customer.getEmailState().equals("인증")) {
					m.addAttribute("roomNum", roomNum);
					return "addReservForm";
				} else {
					m.addAttribute("errorMessage", "이메일 인증이 되어있지 않은 계정입니다.");
					return "redirect:/index/main";
				}
			} else {
				m.addAttribute("errorMessage", "로그인이 되어 있지 않습니다.");
				return "redirect:/index/main";
			}
		} else {
			m.addAttribute("errorMessage", "잘못된 접근 방식 입니다.");
			return "redirect:/index/main";
		}

	}
	
	@GetMapping("/printTotalPrice")
	public String errorTotalPrice(Model m) {
		m.addAttribute("잘못된 접근 입니다.");
		return "redirect:/index/main";
	}
	
	@PostMapping("/printTotalPrice")
	@ResponseBody
	public String getTotalPrice(Date startDate, Date endDate , int roomNum) {
		LocalDate start = startDate.toLocalDate();
		LocalDate end = endDate.toLocalDate();
		Room room =roomService.getRoomByRoomNum(roomNum);
		if(reservService.dateCheck(start, end)) {
			int totalPrice = reservService.getTotalPrice(start,end,room);
			return totalPrice+"";
		}else {
			return "0";
		}
	}

	private final String DEFAULT_START_DATE = "1980-08-08";
	private final String DEFAULT_END_DATE = "1980-08-08";

	@PostMapping("/addReserv")
	public String addResrv(@RequestParam(defaultValue = DEFAULT_START_DATE) Date startDate,
			@RequestParam(defaultValue = DEFAULT_END_DATE) Date endDate, int roomNum, HttpSession session,
			@RequestParam(defaultValue = "0") int peopleCount, Model m, @RequestParam(defaultValue = "0")int totalPrice) {
		if (!startDate.equals(Date.valueOf(DEFAULT_START_DATE)) || !endDate.equals(Date.valueOf(DEFAULT_END_DATE))) {
			ErrorMessage errorMessage = reservService.totalAddResrv(startDate, endDate, roomNum, session, peopleCount);
			if (!reservService.isNullFromErrorMessage(errorMessage)) {
				m.addAttribute("errorMessage", errorMessage.getErrorMessage());
			}
			if (!reservService.isHaveRoomNumber(errorMessage))
				m.addAttribute("roomNum", errorMessage.getRoomNum());
			return errorMessage.getResult();
		} else {
			m.addAttribute("errorMessage", "필수 입력 정보는 모두 입력 하여 주세요");
			return "redirect:/reserv/addReserv?roomNum=" + roomNum;
		}
	}

	@Autowired
	RoomService roomService;

	@GetMapping("/updateReserv")
	public String updateReservForm(HttpSession session, Model m, @RequestParam(defaultValue = "0") int reservId) {
		if (session.getAttribute("userId") != null) {
			String userId = (String) session.getAttribute("userId");
			if (reservId != 0) {
				Reserv reserv = reservService.getReservById(reservId);
				if (reserv != null) {
					if (reserv.getUserId().equals(userId) || userId.equals("admin")) {
						m.addAttribute("reserv", reserv);
						m.addAttribute("roomNum", roomService.getRoomById(reserv.getRoomId()).getRoomNum());
						return "updateReservForm";
					} else {
						m.addAttribute("errorMessage", "권한이 없습니다.");
						return "redirect:/index/main";
					}
				} else {
					m.addAttribute("errorMessage", "잘못된 접근 입니다.");
					return "redirect:/index/main";
				}
			} else {
				m.addAttribute("errorMessage", "잘못된 접근 입니다.");
				return "redirect:/index/main";
			}

		} else {
			m.addAttribute("errorMessage", "로그인이 되어 있지 않습니다.");
			return "redirect:/index/main";
		}
	}
	
	@PostMapping("/updateReserv")
	public String updateReserv(@RequestParam(defaultValue = "0")int roomNum, @RequestParam(defaultValue = DEFAULT_START_DATE)Date startDate, @RequestParam(defaultValue = DEFAULT_END_DATE)Date endDate , @RequestParam(defaultValue = "0")int peopleCount){
		
		return "";
	}

}
