package controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import model.service.RoomService;

@Controller
@RequestMapping("/room")
public class RoomController {

	@Autowired
	RoomService roomService;
	
	@GetMapping("/list")
	public String roomListByConcept(@RequestParam(defaultValue = "kids")String concept, Model m) {
		m.addAttribute("roomList",roomService.getRoomListByConcept(concept));
		return "roomInfo";
	}
	
	
//	@GetMapping("/updateRoom")
//	public String goUpdateRoomForm(HttpSession session, Model m,) {
//		
//	}
	
	
	
}
