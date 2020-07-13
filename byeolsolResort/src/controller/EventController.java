package controller;

import java.io.IOException;
import java.sql.Date;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import model.dto.Event;
import model.mapper.EventMapper;
import model.service.EventService;

@Controller
@RequestMapping("/event")
public class EventController {

	private static final String DEFAULT_START_DATE = "1850-01-01";
	private static final String DEFAULT_END_DATE = "1850-12-31";

	@Autowired
	EventService eventService;

	@GetMapping("/list")
	public String goEventListView(Model m, @RequestParam(defaultValue = "1") int pageNum,
			@RequestParam(required = false) String errorMessage) {
		m.addAttribute("eventView", eventService.getEventView(pageNum));
		if (errorMessage != null)
			m.addAttribute("errorMessage", errorMessage);
		return "eventMain";
		// eventView를 페이지에 넘겨줌
	}

	@GetMapping("/addEvent")
	public String addEventForm(HttpSession session, Model m) {

		if (session.getAttribute("userId") != null) {
			String userId = (String) session.getAttribute("userId");
			if (userId.equals("admin")) {
				return "addEventForm";
			} else {
				m.addAttribute("errorMessage", "권한이 없습니다");
				return "redirect:/event/list";
			}
		} else {
			m.addAttribute("errorMessage", "로그인이 되어 있지 않습니다.");
			return "redirect:/event/list";
		}
	}

	@PostMapping("/addEvent")
	public String addEvent(@RequestParam(required = false) MultipartFile uploadFile, Event event, Model m,
			HttpSession session, @RequestParam(required = false) MultipartFile thumbnail,
			@RequestParam(defaultValue = DEFAULT_START_DATE) Date start,
			@RequestParam(defaultValue = DEFAULT_END_DATE) Date end) {
		if (session.getAttribute("userId") != null) {
			String userId = (String) session.getAttribute("userId");
			if (userId.equals("admin")) {
				if (!uploadFile.isEmpty() && !thumbnail.isEmpty()) {
					if (eventService.nullCheck(event)) {
						if (event.getState().equals("미상시") && !start.toString().equals(DEFAULT_START_DATE)
								&& !end.toString().equals(DEFAULT_END_DATE)
								|| event.getState().equals("상시") && start.toString().equals(DEFAULT_START_DATE)
										&& end.toString().equals(DEFAULT_END_DATE)) {
							if (event.getState().equals("상시")
									|| event.getState().equals("미상시") && eventService.stateNoDateCheck(start, end)) {
								try {
									eventService.stateNoDateCheck(start, end);
									event.setStartDate(start.toLocalDate());
									event.setEndDate(end.toLocalDate());
									if (eventService.addEvent(event, uploadFile, thumbnail)) {
										return "redirect:/event/list";
									} else {
										m.addAttribute("Event", event);
										return "redirect:/event/addEvent";
									}
								} catch (IOException e) {
									// TODO Auto-generated catch block
									e.printStackTrace();
									return "error";
								}
							} else {
								m.addAttribute("errorMessage", "날짜 입력을 확인 하여 주세요");
								return "redirect:/event/addEvent";
							}
						} else {
							m.addAttribute("errorMessage", "날짜 입력을 확인 하여 주세요");
							return "redirect:/event/addEvent";
						}
					} else {
						m.addAttribute("errorMessage", "파일업로드는 무조건 해야 합니다.");
						return "redirect:/event/addEvent";
					}
				} else {
					m.addAttribute("errorMessage", "공백 값이 있습니다.");
					return "redirect:/event/addEvent";
				}
			} else {
				m.addAttribute("errorMessage", "권한이 없습니다");
				return "redirect:/event/list";
			}
		} else {
			m.addAttribute("errorMessage", "권한이 없습니다");
			return "redirect:/event/list";
		}
	}

	@GetMapping("/updateEvent")
	public String updateEvent(int id, Model m, HttpSession session) {
		if (session.getAttribute("userId") != null) {
			String userId = (String) session.getAttribute("userId");
			if (userId.equals("admin")) {
				if (id != 0) {
					Event event = eventService.getEvent(id);
					if (event != null) {
						m.addAttribute("event", event);
						return "updateEventForm";
					} else {
						m.addAttribute("errorMessage", "잘못된 접근");
						return "redirect:/event/list";
					}
				} else {
					m.addAttribute("errorMessage", "잘못된 접근");
					return "redirect:/event/list";
				}
			} else {
				m.addAttribute("errorMessage", "권한이 없는 접근");
				return "redirect:/event/list";
			}
		} else {
			m.addAttribute("errorMessage", "권한이 없는 접근");
			return "redirect:/event/list";
		}

	}

	@PostMapping("/updateEvent")
	public String updateEvent(@RequestParam(required = false) MultipartFile uploadFile, Event event,
			@RequestParam(required = false) MultipartFile thumbnail, HttpSession session, Model m,
			@RequestParam(defaultValue = DEFAULT_START_DATE) Date start,
			@RequestParam(defaultValue = DEFAULT_END_DATE) Date end) {
		boolean isThumbUp = true;
		boolean isDateCheck = false;
		boolean isNullCheck = false;
		isNullCheck = eventService.nullCheck(event);
		Event eventD = eventService.getEvent(event.getId());
		if (isNullCheck) {
			if (event.getState().equals("미상시") && !start.toString().equals(DEFAULT_START_DATE)
					&& !end.toString().equals(DEFAULT_END_DATE)
					|| event.getState().equals("상시") && start.toString().equals(DEFAULT_START_DATE)
							&& end.toString().equals(DEFAULT_END_DATE)
					|| event.getState().equals("상시") && start.toLocalDate().equals(eventD.getStartDate())
							&& end.toLocalDate().equals(eventD.getEndDate())) {
				if (event.getState().equals("미상시") && eventService.stateNoDateCheck(start, end)
						|| event.getState().equals("상시")) {
					event.setStartDate(start.toLocalDate());
					event.setEndDate(end.toLocalDate());
					isDateCheck = true;
				}
			}
		}
		if (session.getAttribute("userId") != null) {
			String userId = (String) session.getAttribute("userId");
			if (userId.equals("admin")) {
				if (isNullCheck) {
					if (isDateCheck) {
						Event ev = eventService.getEvent(event.getId());
						if (uploadFile.isEmpty()) {
							event.setImgPath(ev.getImgPath());
							if (!thumbnail.isEmpty()) {
								if (isThumbUp = eventService.deleteEventImgThumbnaul(event.getId()))
									;
								isThumbUp = eventService.addEventImgThumbnail(thumbnail, event.getId());
								System.out.println(isThumbUp);
							}
							if (isThumbUp) {
								eventService.updateEvent(event);
								return "redirect:/event/list";
							} else {
								m.addAttribute("errorMessage", "업로드할 썸네일 이미지를 확인하여 주세요");
								return "redirect:/event/addEvent";
							}
						} else {
							event.setImgPath(ev.getImgPath());
							if (eventService.updateEventWithFile(uploadFile, event)) {
								if (!thumbnail.isEmpty()) {
									if (isThumbUp = eventService.deleteEventImgThumbnaul(event.getId()))
										;
									isThumbUp = eventService.addEventImgThumbnail(thumbnail, event.getId());
								}
								if (isThumbUp) {
									return "redirect:/event/list";
								} else {
									m.addAttribute("errorMessage", "잘못된 접근");
									return "redirect:/event/list";
								}
							} else {
								return "redirect:/event/updateEvent?id=" + event.getId();
							}
						}
					} else {
						m.addAttribute("errorMessage", "날짜를 다시 확인 하여 주세요");
						return "redirect:/event/updateEvent?id=" + event.getId();
					}
				} else {
					m.addAttribute("errorMessage", "입력하지 않은 값이 있습니다.");
					return "redirect:/event/updateEvent?id=" + event.getId();
				}
			} else {
				m.addAttribute("errorMessage", "권한이 없는 접근 입니다,");
				return "redirect:/index/main";
			}
		} else {
			m.addAttribute("errorMessage", "로그인이 되어 있지 않습니다.");
			return "redirect:/index/main";
		}

	}

	@GetMapping("/deleteEvent")
	public String deleteEvent(@RequestParam(defaultValue = "0") int id, Model m, HttpSession session) {
		if (session.getAttribute("userId") != null) {
			String userId = (String) session.getAttribute("userId");
			if (userId.equals("admin")) {
				if (id != 0) {
					if (eventService.getEvent(id) != null) {
						try {

							String imgPath = eventService.getImgPath(id);
							if (eventService.removeEvent(id)) {
								return "redirect:/event/list";
							} else
								return "redirect:/event/detailEvent?id=" + id;
						} catch (IOException e) {
							// TODO Auto-generated catch block
							e.printStackTrace();
							return "redirect:/event/list";
						}
					} else {
						m.addAttribute("errorMessage", "잘못된 접근");
						return "redirect:/event/list";
					}
				} else {

					m.addAttribute("errorMessage", "잘못된 접근");
					return "redirect:/event/list";
				}
			} else {
				m.addAttribute("errorMessage", "권한이 없는 접근");
				return "redirect:/event/list";
			}
		} else {
			m.addAttribute("errorMessage", "권한이 없는 접근");
			return "redirect:/event/list";
		}
	}

	@GetMapping("/detailEvent")
	public String detailEvent(@RequestParam(defaultValue = "0") int id, Model m) {
		if (id > 0) {
			Event event = eventService.getEvent(id);
			if (event != null) {
				m.addAttribute("event", event);
				return "detailEvent";
			} else {
				m.addAttribute("errorMessage", "잘못된  접근");
				return "redirect:/event/list";
			}
		} else {
			m.addAttribute("errorMessage", "잘못된 접근");
			return "redirect:/event/list";
		}

	}

}
