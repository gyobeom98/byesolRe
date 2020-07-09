package controller;

import java.io.File;
import java.io.IOException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Required;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import model.dto.Board;
import model.dto.Comment;
import model.service.BoardService;
import model.service.CommentService;
import model.service.FtpService;
import model.view.BoardView;

@Controller
@RequestMapping("/board")
public class BoardController {
	private static final String FILE_FOLDER_PATH = "c:/Users/tjoeun/byeolsolResort/";
	@Autowired
	BoardService boardService;

	@Autowired
	CommentService commentService;

	@GetMapping("/list")
	public String getList(Model m, @RequestParam(defaultValue = "1") int pageNum,
			@RequestParam(required = false) String errorMessage) {
		m.addAttribute("adBoardList", boardService.getAdBoard());
		m.addAttribute("boardView", boardService.getView(pageNum));
		if (errorMessage != null)
			m.addAttribute("errorMessage", errorMessage);
		return "/serviceList/board";
	}

	@GetMapping("/addBoard")
	public String goAddBoardForm(HttpSession session, Model m) {
		if (session.getAttribute("userId") != null)
			return "/serviceList/addBoard";
		else {
			m.addAttribute("errorMessage", "로그인이 되어 있지 않습니다");
			return "redirect:/board/list";
		}
	}

	@Autowired
	FtpService ftpService;

	@PostMapping("/addBoard")
	public String goAddBoardResult(Board board, HttpSession session,
			@RequestParam(required = false) MultipartFile[] uploadFile, Model m) {
		boolean isTypeCheck = true;
		boolean errorCheck = true;
		if (session.getAttribute("userId") != null) {
			String userId = (String) session.getAttribute("userId");
			board.setUserId(userId);
			if (board.getTitle() == null  || board.getContent() == null) {
				m.addAttribute("errorMessage", "공백이 있습니다.");
				return "redirect:/board/addBoard";

			} else {
				String addTime = LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyy_MM_dd_HH_mm_ss_SSSS"));
				if (!uploadFile[0].isEmpty()) {
					for (int i = 0; i < uploadFile.length; i++) {
						System.out.println(i);
						if (boardService.checkImg(uploadFile[i])) {
							if (i == 0) {
								board = boardService.imgUpAndSetPath(board, i, uploadFile[i], addTime, "first");
								if (board.getFirstPath() == null)
									errorCheck = false;
							}
							if (i == 1) {
								board = boardService.imgUpAndSetPath(board, i, uploadFile[i], addTime, "second");
								if (board.getSecondPath() == null)
									errorCheck = false;
							}
							if (i == 2) {
								board = boardService.imgUpAndSetPath(board, i, uploadFile[i], addTime, "third");
								if (board.getThirdPath() == null)
									errorCheck = false;
							}
						} else {
							isTypeCheck = false;
						}

					}
				}
				if (isTypeCheck && errorCheck) {
					boardService.addBoard(board);
					return "redirect:/board/list";
				} else {
					m.addAttribute("errorMessage", "게시글 형식에 맞지 않습니다.");
					return "redirect:/board/addBoard";
				}
			}
		} else {
			m.addAttribute("errorMessage", "로그인이 되어 있지 않습니다");
			return "redirect:/board/list";
		}

	}

	@GetMapping("/adminList")
	public String getadminList(Model m, @RequestParam(defaultValue = "1") int pageNum,
			@RequestParam(required = false) String errorMessage) {
		m.addAttribute("boardView", boardService.getAdminBoardView(pageNum));
		if (errorMessage != null)
			m.addAttribute("errorMessage", errorMessage);
		return "/newsList/news";
	}
	
	@GetMapping("/addAdminBoard")
	public String addAdminBoardForm(HttpSession session, Model m) {

		if (session.getAttribute("userId") != null) {
			String userId = (String) session.getAttribute("userId");
			if (userId.equals("admin")) {
				return "/newsList/addNews";
			} else {
				m.addAttribute("errorMessage", "권한이 없는 접근 입니다.");
				return "redirect:/board/adminBoardMain";
			}
		} else {
			m.addAttribute("errorMessage", "로그인이 되어 있지 않습니다.");
			return "redirect:/index/main";
		}

	}

	@PostMapping("/addAdminBoard")
	public String addAdminBoard(Board board, HttpSession session,
			@RequestParam(required = false) MultipartFile[] uploadFile, Model m) {
		boolean isTypeCheck = true;
		boolean errorCheck = true;
		if (session.getAttribute("userId") != null) {
			String userId = (String) session.getAttribute("userId");
			if (userId.equals("admin")) {
				board.setUserId(userId);
				if (board.getTitle().equals("") || board.getContent().equals("")) {
					m.addAttribute("errorMessage", "공백이 있습니다.");
					return "redirect:/board/addAdminBoard";

				} else {
					String addTime = LocalDateTime.now()
							.format(DateTimeFormatter.ofPattern("yyyy_MM_dd_HH_mm_ss_SSSS"));
					if (!uploadFile[0].isEmpty()) {
						for (int i = 0; i < uploadFile.length; i++) {
							System.out.println(i);
							if (boardService.checkImg(uploadFile[i])) {
								if (i == 0) {
									board = boardService.imgUpAndSetPath(board, i, uploadFile[i], addTime, "first");
									if (board.getFirstPath() == null)
										errorCheck = false;
								}
								if (i == 1) {
									board = boardService.imgUpAndSetPath(board, i, uploadFile[i], addTime, "second");
									if (board.getSecondPath() == null)
										errorCheck = false;
								}
								if (i == 2) {
									board = boardService.imgUpAndSetPath(board, i, uploadFile[i], addTime, "third");
									if (board.getThirdPath() == null)
										errorCheck = false;
								}
							} else {
								isTypeCheck = false;
							}

						}
					}
					if (isTypeCheck && errorCheck) {
						board.setState("admin");
						boardService.addBoard(board);
						return "redirect:/board/adminList";
					} else {
						m.addAttribute("errorMessage", "게시글 형식에 맞지 않습니다.");
						return "redirect:/board/addAdminBoard";
					}
				}
			} else {
				m.addAttribute("errorMessage", "권한이 없는 접근 입니다.");
				return "redirect:/index/main";
			}
		} else {
			m.addAttribute("errorMessage", "로그인이 되어 있지 않습니다");
			return "redirect:/board/adminList";
		}
	}

	@GetMapping("/updateBoard")
	public String goBoardUpdateForm(@RequestParam(defaultValue = "0")int id, Model m, HttpSession session) {
		System.out.println(id);
		if (session.getAttribute("userId") != null) {
			String userId = (String) session.getAttribute("userId");
			if (id != 0) {
				Board board = boardService.selectBoard(id);
				if (userId.equals(board.getUserId()) || userId.equals("admin")) {
					m.addAttribute("board", board);
					return "/serviceList/updateBoard";
				} else {
					m.addAttribute("errorMessage", "권한이 없습니다.");
					return "redirect:/board/list";
				}
			} else {
				m.addAttribute("errorMessage", "잘못된 요청 방식 입니다.");
				return "redirect:/board/list";
			}
		} else {
			m.addAttribute("errorMessage", "로그인이 되어 있지 않습니다");
			return "redirect:/board/list";
		}

	}

	@PostMapping("/updateBoard")
	public String goUpdateBoardResult(Board board, HttpSession session, Model m,
			@RequestParam(required = false) MultipartFile uploadFile01,
			@RequestParam(required = false) MultipartFile uploadFile02,
			@RequestParam(required = false) MultipartFile uploadFile03) {
		boolean isTypeCheck = true;
		boolean errorCheck = true;
		board.getId();
		if (session.getAttribute("userId") != null) {
			String updateTime = LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyy_MM_dd_HH_mm_ss_SSSS"));
			Board b = boardService.selectBoard(board.getId());
			if (b != null) {
				String userId = (String) session.getAttribute("userId");
				if (b.getUserId().equals(userId) || userId.equals("admin")) {
					board.setUserId(b.getUserId());
					if (uploadFile01.isEmpty()) {
						board.setFirstPath(b.getFirstPath());
					} else {
						if (boardService.checkImg(uploadFile01)) {
							if (b.getFirstPath() != null) {
								String Time = b.getFirstPath().substring(b.getFirstPath().indexOf('/', 46) + 1,
										b.getFirstPath().lastIndexOf('/'));
								ftpService.ftpdelete(b.getFirstPath(), Time);
								board = boardService.imgUpAndSetPath(board, 0, uploadFile01, Time, "first");
								if (board.getFirstPath() == null)
									errorCheck = false;
							} else {
								board = boardService.imgUpAndSetPath(board, 0, uploadFile01, updateTime, "first");
								if (board.getFirstPath() == null)
									errorCheck = false;
							}
						} else {
							isTypeCheck = false;
						}
					}
					if (uploadFile02.isEmpty()) {
						board.setSecondPath(b.getSecondPath());
					}

					else {
						if (boardService.checkImg(uploadFile02)) {
							if (b.getSecondPath() != null) {
								String Time = b.getFirstPath().substring(b.getFirstPath().indexOf('/', 46) + 1,
										b.getFirstPath().lastIndexOf('/'));
								ftpService.ftpdelete(b.getSecondPath(), Time);
								board = boardService.imgUpAndSetPath(board, 1, uploadFile02, Time, "second");
								if (board.getSecondPath() == null)
									errorCheck = false;
							} else {
								board = boardService.imgUpAndSetPath(board, 1, uploadFile02, updateTime, "second");
								if (board.getSecondPath() == null)
									errorCheck = false;
							}
						} else {
							isTypeCheck = false;
						}
					}

					if (uploadFile03.isEmpty()) {
						board.setThirdPath(b.getThirdPath());
					} else {
						if (boardService.checkImg(uploadFile03)) {
							if (b.getThirdPath() != null) {
								String Time = b.getFirstPath().substring(b.getFirstPath().indexOf('/', 46) + 1,
										b.getFirstPath().lastIndexOf('/'));
								ftpService.ftpdelete(b.getThirdPath(), Time);
								board = boardService.imgUpAndSetPath(board, 2, uploadFile03, Time, "third");
								if (board.getThirdPath() == null)
									errorCheck = false;
							} else {
								board = boardService.imgUpAndSetPath(board, 2, uploadFile03, updateTime, "third");
								if (board.getThirdPath() == null)
									errorCheck = false;
							}
						} else {
							isTypeCheck = false;
						}
					}
					System.out.println("type : "+isTypeCheck);
					System.out.println("error : "+errorCheck);
					if (isTypeCheck && errorCheck) {
						System.out.println(board.getContent());
						boardService.updateBoard(board);
					}
				}
				return "redirect:/board/list";
			} else {
				m.addAttribute("errorMessage", "잘못된 접근 입니다.");
				return "redirect:/board/list";
			}
		} else {
			m.addAttribute("errorMessage", "로그인이 되어 있지 않습니다");
			return "redirect:/board/list";
		}
	}

	@GetMapping("/updateAdminBoard")
	public String updateAdminBoardForm(HttpSession session, Model m, @RequestParam(defaultValue = "0") int id) {

		if (session.getAttribute("userId") != null) {
			if (id > 0) {
				String userId = (String) session.getAttribute("userId");
				if (userId.equals("admin")) {
					Board board = boardService.selectBoard(id);
					if (board != null && board.getState().equals("admin")) {
						m.addAttribute("adminBoard", board);
						return "/newsList/updateNews";
					} else {
						m.addAttribute("errorMessage", "잘못된 접근 입니다.");
						return "redirect:/index/main";
					}
				} else {
					m.addAttribute("errorMessage", "권한이 없는 접근 입니다.");
					return "redirect:/index/main";
				}
			} else {
				m.addAttribute("errorMessage", "로그인이 되어 있지 않습니다.");
				return "redirect:/index/main";
			}
		} else {
			m.addAttribute("errorMessage", "잘못된 접근 입니다.");
			return "redirect:/board/adminList";
		}

	}

	@PostMapping("/updateAdminBoard")
	public String updateAdminBoard(Board board, HttpSession session, Model m,
			@RequestParam(required = false) MultipartFile uploadFile01,
			@RequestParam(required = false) MultipartFile uploadFile02,
			@RequestParam(required = false) MultipartFile uploadFile03) {
		boolean isTypeCheck = true;
		boolean errorCheck = true;
		if (session.getAttribute("userId") != null) {
			String updateTime = LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyy_MM_dd_HH_mm_ss_SSSS"));
			Board b = boardService.selectBoard(board.getId());
			if (b != null) {
				String userId = (String) session.getAttribute("userId");
				if (userId.equals("admin") && b.getState().equals("admin")) {
					board.setUserId(b.getUserId());
					if (uploadFile01.isEmpty()) {
						board.setFirstPath(b.getFirstPath());
					} else {
						if (boardService.checkImg(uploadFile01)) {
							if (b.getFirstPath() != null) {
								String Time = b.getFirstPath().substring(b.getFirstPath().indexOf('/', 46) + 1,
										b.getFirstPath().lastIndexOf('/'));
								ftpService.ftpdelete(b.getFirstPath(), Time);
								board = boardService.imgUpAndSetPath(board, 0, uploadFile01, Time, "first");
								if (board.getFirstPath() == null)
									errorCheck = false;
							} else {
								board = boardService.imgUpAndSetPath(board, 0, uploadFile01, updateTime, "first");
								if (board.getFirstPath() == null)
									errorCheck = false;
							}
						} else {
							isTypeCheck = false;
						}
					}
					if (uploadFile02.isEmpty()) {
						board.setSecondPath(b.getSecondPath());
					}

					else {
						if (boardService.checkImg(uploadFile02)) {
							if (b.getSecondPath() != null) {
								String Time = b.getFirstPath().substring(b.getFirstPath().indexOf('/', 46) + 1,
										b.getFirstPath().lastIndexOf('/'));
								ftpService.ftpdelete(b.getSecondPath(), Time);
								board = boardService.imgUpAndSetPath(board, 1, uploadFile02, Time, "second");
								if (board.getSecondPath() == null)
									errorCheck = false;
							} else {
								board = boardService.imgUpAndSetPath(board, 1, uploadFile02, updateTime, "second");
								if (board.getSecondPath() == null)
									errorCheck = false;
							}
						} else {
							isTypeCheck = false;
						}
					}

					if (uploadFile03.isEmpty()) {
						board.setThirdPath(b.getThirdPath());
					} else {
						if (boardService.checkImg(uploadFile03)) {
							if (b.getThirdPath() != null) {
								String Time = b.getFirstPath().substring(b.getFirstPath().indexOf('/', 46) + 1,
										b.getFirstPath().lastIndexOf('/'));
								ftpService.ftpdelete(b.getThirdPath(), Time);
								board = boardService.imgUpAndSetPath(board, 2, uploadFile03, Time, "third");
								if (board.getThirdPath() == null)
									errorCheck = false;
							} else {
								board = boardService.imgUpAndSetPath(board, 2, uploadFile03, updateTime, "third");
								if (board.getThirdPath() == null)
									errorCheck = false;
							}
						} else {
							isTypeCheck = false;
						}
					}
					if (isTypeCheck && errorCheck) {
						boardService.updateBoard(board);
					}
				}
				return "redirect:/board/list";
			} else {
				m.addAttribute("errorMessage", "잘못된 접근 입니다.");
				return "redirect:/board/list";
			}
		} else {
			m.addAttribute("errorMessage", "로그인이 되어 있지 않습니다");
			return "redirect:/board/list";
		}
	}

	@GetMapping("/deleteBoard")
	public String deleteBoard(HttpSession session, Model m, @RequestParam(defaultValue = "0") int id) {
		if (session.getAttribute("userId") != null) {
			String userId = (String) session.getAttribute("userId");
			if (id > 0) {
				Board board = boardService.selectBoard(id);
				if (board != null) {
					if (board.getUserId().equals(userId) || userId.equals("admin")) {
						boardService.deleteBoard(id, userId);
						return "redirect:/board/list";
					} else {
						m.addAttribute("errorMessage","권한이 없습니다.");
						return "redirect:/index/main";
					}
				} else {
					m.addAttribute("errorMessage","잘못된 접근 입니다.");
					return "redirect:/board/list";
				}
			} else {
				m.addAttribute("errorMessage","잘못된 접근 입니다.");
				return "redirect:/board/list";
			}
		} else {
			m.addAttribute("errorMessage","로그인이 되어 있지 않습니다.");
			return "redirect:/index/main";
		}
	}
	
	@GetMapping("/deleteAdminBoard")
	public String deleteAdminBoard(HttpSession session, Model m, @RequestParam(defaultValue = "0") int id) {
		if (session.getAttribute("userId") != null) {
			String userId = (String) session.getAttribute("userId");
			if (id > 0) {
				Board board = boardService.selectBoard(id);
				if (board != null && board.getState().equals("admin")) {
					if (userId.equals("admin")) {
						boardService.deleteBoard(id, userId);
						return "redirect:/board/adminBoardList";
					} else {
						m.addAttribute("errorMessage","권한이 없습니다.");
						return "redirect:/index/main";
					}
				} else {
					m.addAttribute("errorMessage","잘못된 접근 입니다.");
					return "redirect:/board/adminList";
				}
			} else {
				m.addAttribute("errorMessage","잘못된 접근 입니다.");
				return "redirect:/board/adminList";
			}
		} else {
			m.addAttribute("errorMessage","로그인이 되어 있지 않습니다.");
			return "redirect:/index/main";
		}
	}
	
	

	@GetMapping("/detailBoard")
	public String goBoardDetail(int boardId, Model m, @RequestParam(defaultValue = "1") int pageNum) {
		m.addAttribute("board", boardService.selectBoard(boardId));
		m.addAttribute("commentView", commentService.getView(pageNum, boardId));
		return "/serviceList/detailBoard";
	}
	
	@GetMapping("/adminDetailBoard")
	public String goAdminBoardDetail(int boardId, Model m, @RequestParam(defaultValue = "1") int pageNum) {
		m.addAttribute("board", boardService.selectBoard(boardId));
		m.addAttribute("commentView", commentService.getView(pageNum, boardId));
		return "/newsList/detailNews";
	}

	@PostMapping("/addComment")
	public String addComment(Comment comment, HttpSession session, Model m) {
		if (session.getAttribute("userId") != null) {
			comment.setUserId((String) session.getAttribute("userId"));
			commentService.addComment(comment);
		} else {
			m.addAttribute("errorMessage", "로그인을 해주세요");
		}
		return "redirect:/board/detailBoard?boardId=" + comment.getBoardId();
	}
}
