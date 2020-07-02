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

	@GetMapping("/main")
	public String mainPage(@RequestParam(required = false) String errorMessage, Model m) {
		m.addAttribute("errorMessage", errorMessage);
		return "index";
	}

	@GetMapping("/test")
	public String testPage() {
		return "testD";
	}

}
