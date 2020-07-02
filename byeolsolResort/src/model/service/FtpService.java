package model.service;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;

import org.apache.commons.net.ftp.FTP;
import org.apache.commons.net.ftp.FTPClient;
import org.apache.commons.net.ftp.FTPReply;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

@Service("testService")
public class FtpService {

	private final String server = "112.175.184.88";
	private final int port = 21;
	private final String user = "tjteam";
	private final String pw = "tjpassword01!";

	public void ftpdeleteEvent(String path, String Time) {
		FTPClient ftp = null;
		try {
			ftp = new FTPClient();
			ftp.setControlEncoding("utf-8");
			ftp.connect(server, port);
			ftp.login(user, pw);
			ftp.setFileType(FTP.BINARY_FILE_TYPE);
			if (!FTPReply.isPositiveCompletion(ftp.getReplyCode())) {
				ftp.disconnect();
				System.out.println("연결 실패");
			} else {
				System.out.println("연결 성공");
			}
			ftp.changeWorkingDirectory("/html/byeolsolResort/event/" + Time);
			String deletePath = "/html/byeolsolResort/event/"+Time+path.substring(path.lastIndexOf('/'),path.length());
			System.out.println(deletePath);
			System.out.println(ftp.deleteFile(deletePath));
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (ftp != null && ftp.isConnected()) {
				try {
					ftp.disconnect();
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		}

	}

	public void ftpdelete(String path, String Time) {

		FTPClient ftp = null;
		try {
			ftp = new FTPClient();
			ftp.setControlEncoding("utf-8");
			ftp.connect(server, port);
			ftp.login(user, pw);
			ftp.setFileType(FTP.BINARY_FILE_TYPE);
			if (!FTPReply.isPositiveCompletion(ftp.getReplyCode())) {
				ftp.disconnect();
				System.out.println("연결 실패");
			} else {
				System.out.println("연결 성공");
			}
			ftp.changeWorkingDirectory("/html/byeolsolResort/board/" + Time);
			String deletePath = "/html/byeolsolResort/board/" + Time+path.substring(path.lastIndexOf('/'),path.length());
			System.out.println(deletePath);
			System.out.println(ftp.deleteFile(deletePath));
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (ftp != null && ftp.isConnected()) {
				try {
					ftp.disconnect();
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		}

	}
	
	public void ftpEventImg(MultipartFile uploadFile, String addTime) {
		// 받는 변수는 request를 보낸 것에 맞게 받으시면 됩니다.
		// 웹에서 받은 MultipartFile을 File로 변환시켜줍니다.
		FTPClient ftp = null;
		try {
			File file = new File("C:\\Users\\tjoeun\\Desktop\\project" + uploadFile.getOriginalFilename());
			if (file.createNewFile()) {
				System.out.println("생성");
			}
			FileOutputStream fos = new FileOutputStream(file);
			fos.write(uploadFile.getBytes());
			fos.close();
			// FTPClient를 생성합니다.
			ftp = new FTPClient();
			// 원하시는 인코딩 타입
			ftp.setControlEncoding("utf-8");
			ftp.connect(server, port);
			ftp.login(user, pw);
			// 원하시는 파일 타입
			ftp.setFileType(FTP.BINARY_FILE_TYPE);
			// 제대로 연결이 안댔을 경우 ftp접속을 끊습니다.
			if (!FTPReply.isPositiveCompletion(ftp.getReplyCode())) {
				ftp.disconnect();
				System.out.println("연결 실패");
			} else {
				System.out.println("연결 성공");
			}
			// 파일을 넣을 디렉토리를 설정해줍니다.
			ftp.mkd("/html/byeolsolResort/event");
			ftp.mkd("/html/byeolsolResort/event/" + addTime);
			System.out.println("성공?");
			// makeDirectory는 directory 생성이 필요할 때만 해주시면 됩니다.
			ftp.changeWorkingDirectory("/html/byeolsolResort/event/" + addTime);
			// 그 후 이전에 File로 변환한 업로드파일을 읽어 FTP로 전송합니다.
			FileInputStream fis = new FileInputStream(file);
			boolean isSucess = ftp.storeFile(uploadFile.getOriginalFilename(), fis);
			if (isSucess) {
				System.out.println("성공");
			} else {
				System.out.println("실패");
			}
			// storeFile Method는 파일 송신결과를 boolean값으로 리턴합니다
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (ftp != null && ftp.isConnected()) {
				try {
					ftp.disconnect();
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		}
	}
	
	
	public void ftpImg(MultipartFile uploadFile, String addTime ,String count) {
		// 받는 변수는 request를 보낸 것에 맞게 받으시면 됩니다.
		// 웹에서 받은 MultipartFile을 File로 변환시켜줍니다.
		FTPClient ftp = null;
		try {
			File file = new File("C:\\Users\\tjoeun\\Desktop\\project" + uploadFile.getOriginalFilename());
			if (file.createNewFile()) {
				System.out.println("생성");
			}
			FileOutputStream fos = new FileOutputStream(file);
			fos.write(uploadFile.getBytes());
			fos.close();
			// FTPClient를 생성합니다.
			ftp = new FTPClient();
			// 원하시는 인코딩 타입
			ftp.setControlEncoding("utf-8");
			ftp.connect(server, port);
			ftp.login(user, pw);
			// 원하시는 파일 타입
			ftp.setFileType(FTP.BINARY_FILE_TYPE);
			// 제대로 연결이 안댔을 경우 ftp접속을 끊습니다.
			if (!FTPReply.isPositiveCompletion(ftp.getReplyCode())) {
				ftp.disconnect();
				System.out.println("연결 실패");
			} else {
				System.out.println("연결 성공");
			}
			// 파일을 넣을 디렉토리를 설정해줍니다.
			ftp.mkd("/html/byeolsolResort/board");
			ftp.mkd("/html/byeolsolResort/board/" + addTime);
			System.out.println("성공?");
			// makeDirectory는 directory 생성이 필요할 때만 해주시면 됩니다.
			ftp.changeWorkingDirectory("/html/byeolsolResort/board/" + addTime);
			// 그 후 이전에 File로 변환한 업로드파일을 읽어 FTP로 전송합니다.
			FileInputStream fis = new FileInputStream(file);
			boolean isSucess = ftp.storeFile(count+uploadFile.getOriginalFilename(), fis);
			if (isSucess) {
				System.out.println("성공");
			} else {
				System.out.println("실패");
			}
			// storeFile Method는 파일 송신결과를 boolean값으로 리턴합니다
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (ftp != null && ftp.isConnected()) {
				try {
					ftp.disconnect();
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		}
	}
	

	
	public void ftpUpEventImg(MultipartFile uploadFile, String Time, String path) {

		FTPClient ftp = null;
		try {
			ftp.deleteFile(path);
			File file = new File("C:\\Users\\tjoeun\\Desktop\\project" + uploadFile.getOriginalFilename());
			if (file.createNewFile()) {
				System.out.println("생성");
			}
			FileOutputStream fos = new FileOutputStream(file);
			fos.write(uploadFile.getBytes());
			fos.close();
			// FTPClient를 생성합니다.
			ftp = new FTPClient();
			// 원하시는 인코딩 타입
			ftp.setControlEncoding("utf-8");
			ftp.connect(server, port);
			ftp.login(user, pw);
			// 원하시는 파일 타입
			ftp.setFileType(FTP.BINARY_FILE_TYPE);
			// 제대로 연결이 안댔을 경우 ftp접속을 끊습니다.
			if (!FTPReply.isPositiveCompletion(ftp.getReplyCode())) {
				ftp.disconnect();
				System.out.println("연결 실패");
			} else {
				System.out.println("연결 성공");
			}
			// 파일을 넣을 디렉토리를 설정해줍니다.
			ftp.mkd("/html/byeolsolResort/event");
			ftp.mkd("/html/byeolsolResort/event/" + Time);
			System.out.println("성공?");
			// makeDirectory는 directory 생성이 필요할 때만 해주시면 됩니다.
			ftp.changeWorkingDirectory("/html/byeolsolResort/event/" + Time);
			// 그 후 이전에 File로 변환한 업로드파일을 읽어 FTP로 전송합니다.
			FileInputStream fis = new FileInputStream(file);
			boolean isSucess = ftp.storeFile(uploadFile.getOriginalFilename(), fis);
			if (isSucess) {
				System.out.println("성공");
			} else {
				System.out.println("실패");
			}
			// storeFile Method는 파일 송신결과를 boolean값으로 리턴합니다
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (ftp != null && ftp.isConnected()) {
				try {
					ftp.disconnect();
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		}

	}
	

}