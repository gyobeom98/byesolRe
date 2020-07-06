package model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import model.dto.Board;
import model.dto.Comment;
import model.mapper.CommentMapper;
import model.view.BoardView;
import model.view.CommentView;

@Service("commentService")
public class CommentService {
	
	private static final int COMMENT_COUNT_PER_PAGE = 5;

	@Autowired
	CommentMapper commentMapepr; 
	
	
	public void addComment(Comment comment) {
		commentMapepr.insertComment(comment);
	}
	
	public void updateComment(Comment comment) {
		commentMapepr.updateComment(comment);
	}
	
	public String deleteComment(int id, String userId) {
		Comment comment = commentMapepr.selectCommentWithId(id);
		
		if(userId.equals("adming") || comment.getUserId().equals(userId)) {
			commentMapepr.deleteComment(id);
			return "삭제";
		}else return "권한이 없습니다";
		
	}
	
	public CommentView getView(int pageNum , int boardId) {
		CommentView commentView = null;
		int firstRow = 0;
		List<Comment> commentList = null;
		int commentCnt = commentMapepr.commentCount(boardId); 
		if(commentCnt>0) {
			firstRow = (pageNum-1)*COMMENT_COUNT_PER_PAGE;
			commentList = commentMapepr.commentListView(boardId, firstRow, COMMENT_COUNT_PER_PAGE);
		}else {
			pageNum=0;
		}
		commentView = new CommentView(commentCnt, pageNum, firstRow, COMMENT_COUNT_PER_PAGE, commentList);
		return commentView;
	}
	
	
}
