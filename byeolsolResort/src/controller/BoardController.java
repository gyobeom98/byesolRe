package controller;

import java.io.File;
import java.io.IOException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Required;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
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
		return "boardMain";
	}

	@GetMapping("/addBoard")
	public String goAddBoardForm(HttpSession session, Model m) {
		if (session.getAttribute("userId") != null)
			return "addBoardForm";
		else {
			m.addAttribute("errorMessage", "로그인이 되어 있지 않습니다");
			return "redirect:/board/list";
		}
	}

	@Autowired
	FtpService ftpService;

	@PostMapping("/addBoard")
	@Transactional
	public String goAddBoardResult(Board board, HttpSession session,
			@RequestParam(required = false) MultipartFile[] uploadFile, Model m) {
		if (session.getAttribute("userId") != null) {
			if (board.getTitle().equals("") || board.getContent().equals("")) {
				m.addAttribute("errorMessage","공백이 있습니다.");
				return "redirect:/board/addBoard";
				
			} else {
				String addTime = LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyy_MM_dd_HH_mm_ss_SSSS"));
				if (!uploadFile[0].isEmpty()) {
					for (int i = 0; i < uploadFile.length; i++) {
						System.out.println(i);
						if (boardService.checkImg(uploadFile[i])) {
							if (i == 0) {
								ftpService.ftpImg(uploadFile[i], addTime, "first");
								board.setFirstPath("http://tjteam.dothome.co.kr/byeolsolResort/board/" + addTime + "/"
										+ "first" + uploadFile[i].getOriginalFilename());
								System.out.println("board ftpTest  : " + board.getFirstPath());
							}
							if (i == 1) {
								ftpService.ftpImg(uploadFile[i], addTime, "second");
								board.setSecondPath("http://tjteam.dothome.co.kr/byeolsolResort/board/" + addTime + "/"
										+ "second" + uploadFile[i].getOriginalFilename());
							}
							if (i == 2) {
								ftpService.ftpImg(uploadFile[i], addTime, "third");
								board.setThirdPath("http://tjteam.dothome.co.kr/byeolsolResort/board/" + addTime + "/"
										+ "third" + uploadFile[i].getOriginalFilename());
							}
						}

					}
				}
				board.setUserId((String) session.getAttribute("userId"));
				if (board.getUserId().equals("admin")) {
					board.setState("admin");
				}
				System.out.println(board);
				boardService.addBoard(board);
				return "redirect:/board/list";
			}
		} else {
			m.addAttribute("errorMessage", "로그인이 되어 있지 않습니다");
			return "redirect:/board/list";
		}

	}

	@GetMapping("/updateBoard")
	public String goBoardUpdateForm(@RequestParam(defaultValue = "0")int id, Model m, HttpSession session) {
		if (session.getAttribute("userId") != null) {
			String userId = (String) session.getAttribute("userId");
			if (id != 0) {
				Board board = boardService.selectBoard(id);
				if (userId.equals(board.getUserId())) {
					m.addAttribute("board", board);
					return "updateBoardForm";
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
		if (session.getAttribute("userId") != null) {
			String updateTime = LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyy_MM_dd_HH_mm_ss_SSSS"));
			Board b = boardService.selectBoard(board.getId());
			System.out.println(b);
			if (b.getUserId().equals((String) session.getAttribute("userId"))) {
				if (uploadFile01.isEmpty()) {
					board.setFirstPath(b.getFirstPath());
				} else {
					if (boardService.checkImg(uploadFile01)) {
						if (b.getFirstPath() != null) {
							String Time = b.getFirstPath().substring(b.getFirstPath().indexOf('/', 46) + 1,
									b.getFirstPath().lastIndexOf('/'));
							ftpService.ftpdelete(b.getFirstPath(), Time);
							System.out.println("TIME : " + Time);
							ftpService.ftpImg(uploadFile01, Time, "first");
							board.setFirstPath("http://tjteam.dothome.co.kr/byeolsolResort/board/" + Time + "/"
									+ "first" + uploadFile01.getOriginalFilename());
						} else {
							ftpService.ftpImg(uploadFile01, updateTime, "first");
							board.setFirstPath("http://tjteam.dothome.co.kr/byeolsolResort/board/" + updateTime
									+ "/first" + uploadFile01.getOriginalFilename());
							;
						}
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
							ftpService.ftpImg(uploadFile02, Time, "second");
							board.setSecondPath("http://tjteam.dothome.co.kr/byeolsolResort/board/" + Time + "/second"
									+ uploadFile02.getOriginalFilename());
						} else {
							ftpService.ftpImg(uploadFile02, updateTime, "second");
							board.setSecondPath("http://tjteam.dothome.co.kr/byeolsolResort/board/" + updateTime
									+ "/second" + uploadFile02.getOriginalFilename());
							;
						}
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
							ftpService.ftpImg(uploadFile03, Time, "third");
							board.setThirdPath("http://tjteam.dothome.co.kr/byeolsolResort/board/" + Time + "/third"
									+ uploadFile03.getOriginalFilename());
						} else {
							ftpService.ftpImg(uploadFile03, updateTime, "third");
							board.setThirdPath("http://tjteam.dothome.co.kr/byeolsolResort/board/" + updateTime
									+ "/third" + uploadFile03.getOriginalFilename());
						}
					}
				}

				boardService.updateBoard(board);
				System.out.println(board);
			}
			return "redirect:/board/list";
		} else {
			m.addAttribute("errorMessage", "로그인이 되어 있지 않습니다");
			return "redirect:/board/list";
		}
	}

	@GetMapping("/detailBoard")
	public String goBoardDetail(int boardId, Model m, @RequestParam(defaultValue = "1") int pageNum) {
		m.addAttribute("board", boardService.selectBoard(boardId));
		m.addAttribute("commentView", commentService.getView(pageNum, boardId));
		return "detailBoard";
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
