package model.service;

import java.io.File;
import java.io.IOException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import model.dto.Board;
import model.mapper.BoardMapper;
import model.mapper.CommentMapper;
import model.view.BoardView;

@Service("boardService")
public class BoardService {

	private static final int BOARD_COUNT_PER_PAGE = 5;
	private static final String FILE_FOLDER_PATH = "c:/Users/tjoeun/byeolsolResort/";
	
	@Autowired
	BoardMapper boardMapper;
	
	@Autowired
	CommentMapper commentMapper;
	
	public List<Board> getBoardList(){
		return boardMapper.selectBoardList();
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
	
	public String deleteBoard(int id , String userId) {
		
		Board b = boardMapper.selectBoard(id);
		
		if(b.getUserId().equals(userId) || userId.equals("admin")) {
			commentMapper.deleteBoardComment(id);
			boardMapper.deleteBoard(id);
			return "삭제 완료";
		}else {
			return "게시글을 삭제할 권한이 없음";
		}
		
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
		
		boardView = new BoardView(boardCnt, pageNum, firstRow, endRow, BOARD_COUNT_PER_PAGE, boardList);
		
		return boardView;
	}
	
	public List<Board> getAdBoard(){
		return boardMapper.selectBoardListAdmain();
	}
	
	public boolean checkImg(MultipartFile uploadFile) {

		String fileType = uploadFile.getOriginalFilename().substring(uploadFile.getOriginalFilename().indexOf('.'),
				uploadFile.getOriginalFilename().length());
		if (fileType.equals(".jpg") || fileType.equals(".png") || fileType.equals(".jpeg")) {
			return true;
		} else
			return false;

	}
	
	public String updateImg(MultipartFile uploadFile, String path, String updateTime) {
		System.out.println("upPath : " + path);
		if(path != null) {
			String upPath = path.substring(0, path.lastIndexOf('/'));
		File file = new File(FILE_FOLDER_PATH + path);
		System.out.println("file path : " + FILE_FOLDER_PATH+path);
		if (file.canRead()) {
			file.delete();
			File file01 = new File(FILE_FOLDER_PATH+ upPath, uploadFile.getOriginalFilename());
			System.out.println("file.getName : "+file.getName());
			System.out.println("file.getPath : " +file.getPath());
			try {
				uploadFile.transferTo(file01);
			} catch (IllegalStateException | IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		} 
		return upPath + "/" + uploadFile.getOriginalFilename();
		
		}else {
			String upPath = FILE_FOLDER_PATH +"board/"+updateTime;
			File file01 = new File(upPath);
			if (file01.mkdir()) {
				System.out.println("test");
			}
			File file02 = new File(upPath, uploadFile.getOriginalFilename());
			try {
				uploadFile.transferTo(file02);
			} catch (IllegalStateException | IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return "board/"+updateTime+"/"+uploadFile.getOriginalFilename();
		}

	}
	
	public String addImage(MultipartFile uploadFile,String addTime) {
		String boardPath = FILE_FOLDER_PATH + "board";
		File fileBoard = new File(boardPath);
		if(fileBoard.mkdir()) {
			
		}
		String path = boardPath+"/"+addTime;
		System.out.println("path : " + path);
		File file01 = new File(path);
		if (file01.mkdir()) {
			System.out.println("test");
		}
		File file = new File(path, uploadFile.getOriginalFilename());
		
		try {
			uploadFile.transferTo(file);
		} catch (IllegalStateException | IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return "board/" + addTime + "/" + uploadFile.getOriginalFilename();
		
	}
	
	
}
