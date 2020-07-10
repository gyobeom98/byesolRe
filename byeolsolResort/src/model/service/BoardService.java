package model.service;

import java.io.File;
import java.io.IOException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import model.dto.Board;
import model.mapper.BoardMapper;
import model.mapper.CommentMapper;
import model.view.BoardView;

@Service("boardService")
public class BoardService {

	private static final int BOARD_COUNT_PER_PAGE = 5;
	
	@Autowired
	BoardMapper boardMapper;
	
	@Autowired
	CommentMapper commentMapper;
	
	public List<Board> getBoardList(){
		return boardMapper.selectBoardList();
	}
	
	public List<Board> selectBoardListByUserId(String userId) {
		return boardMapper.selectBoardListByUserId(userId);
		
	}
	
	public void addBoard(Board board) {
		boardMapper.insertBoard(board);
	}

	public void updateBoard(Board board) {
		boardMapper.updateBoard(board);
	}
	
	public Board selectBoard(int id) {
		return boardMapper.selectBoard(id);
	}
	
	@Autowired
	FtpService ftpService;
	
	@Transactional(rollbackFor = Exception.class)
	public String deleteBoard(int id , String userId) {
		Board b = boardMapper.selectBoard(id);
		if(b.getUserId().equals(userId) || userId.equals("admin")) {
			commentMapper.deleteBoardComment(id);
			boardMapper.deleteBoard(id);
			String Time = "";
			if(b.getFirstPath()!=null) {
			 Time = b.getFirstPath().substring(b.getFirstPath().indexOf('/', 46) + 1,
					b.getFirstPath().lastIndexOf('/'));
			 ftpService.ftpdelete(b.getFirstPath(), Time);
			}
			else if(b.getSecondPath()!=null) {
				Time = b.getSecondPath().substring(b.getSecondPath().indexOf('/', 46) + 1,
						b.getSecondPath().lastIndexOf('/'));
				ftpService.ftpdelete(b.getSecondPath(), Time);
			}else if(b.getThirdPath()!=null) {
				Time = b.getThirdPath().substring(b.getThirdPath().indexOf('/', 46) + 1,
						b.getThirdPath().lastIndexOf('/'));
				ftpService.ftpdelete(b.getThirdPath(), Time);
			}
			return "삭제 완료";
		}else {
			return "게시글을 삭제할 권한이 없음";
		}
		
	}
	
	@Transactional(rollbackFor = Exception.class)
	public Board imgUpAndSetPath(Board board , int i , MultipartFile uploadFile, String addTime, String count) {
		
		String isSuccess = ftpService.ftpImg(uploadFile, addTime, count);
		
		switch (i) {
		case 0:	
			if(isSuccess.equals("성공")) {
			board.setFirstPath("http://tjteam.dothome.co.kr/byeolsolResort/board/" + addTime + "/"
										+ "first" + uploadFile.getOriginalFilename());
			}else {
				board.setFirstPath(null);
			}
			break;
		case 1:	
			if(isSuccess.equals("성공")) {
			board.setSecondPath("http://tjteam.dothome.co.kr/byeolsolResort/board/" + addTime + "/"
										+ "second" + uploadFile.getOriginalFilename());
			}else {
				board.setSecondPath(null);
			}
			break;
		case 2:	
			if(isSuccess.equals("성공")) {
			board.setThirdPath("http://tjteam.dothome.co.kr/byeolsolResort/board/" + addTime + "/"
										+ "third" + uploadFile.getOriginalFilename());
			}else {
				board.setThirdPath(null);
			}
			break;	
		}
		
		return board;
	}
	
	
	public BoardView getAdminBoardView(int pageNum) {
		
		BoardView boardView = null;
		int firstRow = 0;
		List<Board> boardList = null;
		int boardCnt = boardMapper.countAdminBoard();
		if(boardCnt>0) {
			firstRow = (pageNum-1)*BOARD_COUNT_PER_PAGE;
			boardList = boardMapper.selectBoardListWithAdminPage(firstRow,BOARD_COUNT_PER_PAGE);
		}else {
			pageNum=0;
		}
		
		boardView = new BoardView(boardCnt, pageNum, firstRow, BOARD_COUNT_PER_PAGE, boardList);
		
		return boardView;
	}
	
	public BoardView getView(int pageNum) {
		BoardView boardView = null;
		int firstRow = 0;
		List<Board> boardList = null;
		int boardCnt = boardMapper.countBoard(); 
		if(boardCnt>0) {
			firstRow = (pageNum-1)*BOARD_COUNT_PER_PAGE;
			boardList = boardMapper.selectBoardListWithPage(firstRow, BOARD_COUNT_PER_PAGE);
		}else {
			pageNum=0;
		}
		int endRow = firstRow+BOARD_COUNT_PER_PAGE;
		
		boardView = new BoardView(boardCnt, pageNum, firstRow, BOARD_COUNT_PER_PAGE, boardList);
		
		return boardView;
	}
	
	public List<Board> getAdBoard(){
		return boardMapper.selectBoardListAdmain();
	}
	
	public boolean checkImg(MultipartFile uploadFile) {
		String fileType = uploadFile.getOriginalFilename().substring(uploadFile.getOriginalFilename().indexOf('.'),
				uploadFile.getOriginalFilename().length());
		System.out.println(fileType);
		if (fileType.equals(".jpg") || fileType.equals(".png") || fileType.equals(".jpeg") || fileType.equals(".PNG") || fileType.equals(".JPG") || fileType.equals(".JPEG")) {
			return true;
		} else
			return false;

	}
	
	/*
	 * public String updateImg(MultipartFile uploadFile, String path, String
	 * updateTime) { System.out.println("upPath : " + path); if(path != null) {
	 * String upPath = path.substring(0, path.lastIndexOf('/')); File file = new
	 * File(FILE_FOLDER_PATH + path); System.out.println("file path : " +
	 * FILE_FOLDER_PATH+path); if (file.canRead()) { file.delete(); File file01 =
	 * new File(FILE_FOLDER_PATH+ upPath, uploadFile.getOriginalFilename());
	 * System.out.println("file.getName : "+file.getName());
	 * System.out.println("file.getPath : " +file.getPath()); try {
	 * uploadFile.transferTo(file01); } catch (IllegalStateException | IOException
	 * e) { // TODO Auto-generated catch block e.printStackTrace(); } } return
	 * upPath + "/" + uploadFile.getOriginalFilename();
	 * 
	 * }else { String upPath = FILE_FOLDER_PATH +"board/"+updateTime; File file01 =
	 * new File(upPath); if (file01.mkdir()) { System.out.println("test"); } File
	 * file02 = new File(upPath, uploadFile.getOriginalFilename()); try {
	 * uploadFile.transferTo(file02); } catch (IllegalStateException | IOException
	 * e) { // TODO Auto-generated catch block e.printStackTrace(); } return
	 * "board/"+updateTime+"/"+uploadFile.getOriginalFilename(); }
	 * 
	 * }
	 */
	
	/*
	 * public String addImage(MultipartFile uploadFile,String addTime) { String
	 * boardPath = FILE_FOLDER_PATH + "board"; File fileBoard = new File(boardPath);
	 * if(fileBoard.mkdir()) {
	 * 
	 * } String path = boardPath+"/"+addTime; System.out.println("path : " + path);
	 * File file01 = new File(path); if (file01.mkdir()) {
	 * System.out.println("test"); } File file = new File(path,
	 * uploadFile.getOriginalFilename());
	 * 
	 * try { uploadFile.transferTo(file); } catch (IllegalStateException |
	 * IOException e) { // TODO Auto-generated catch block e.printStackTrace(); }
	 * 
	 * return "board/" + addTime + "/" + uploadFile.getOriginalFilename();
	 * 
	 * }
	 */

	
}
