package model.service;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.ArrayList;
import java.util.List;

import org.apache.commons.net.ftp.FTP;
import org.apache.commons.net.ftp.FTPClient;
import org.apache.commons.net.ftp.FTPFile;
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
			String deletePath = "/html/byeolsolResort/event/" + Time
					+ path.substring(path.lastIndexOf('/'), path.length());
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
			String deletePath = "/html/byeolsolResort/board/" + Time
					+ path.substring(path.lastIndexOf('/'), path.length());
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
			fis.close();
			fos.close();
			System.out.println(file.exists());
			System.out.println(file.delete());
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

	public void ftpImg(MultipartFile uploadFile, String addTime, String count) {
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
			boolean isSucess = ftp.storeFile(count + uploadFile.getOriginalFilename(), fis);
			if (isSucess) {
				System.out.println("성공");
			} else {
				System.out.println("실패");
			}
			fis.close();
			fos.close();
			System.out.println(file.exists());
			System.out.println(file.delete());
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

	public List<String> ftpImgPath(String what) {
		FTPClient ftp = null;
		List<String> imgPath = new ArrayList<String>();
		try {
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
			ftp.changeWorkingDirectory("/html/byeolsolResort/"+what);
			FTPFile[] ftpFiles = ftp.listFiles();
			for (FTPFile ftpFile : ftpFiles) {
				System.out.println(ftpFile.getName());
				imgPath.add("http://tjteam.dothome.co.kr/byeolsolResort/"+what+"/"+ftpFile.getName());
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return imgPath;
	}

	public void ftpLogoImg(MultipartFile uploadFile) {
		FTPClient ftp = null;
		String uploadFileType = "." + uploadFile.getContentType()
				.substring(uploadFile.getContentType().lastIndexOf('/') + 1, uploadFile.getContentType().length());
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
			ftp.mkd("/html/byeolsolResort/logo");
			System.out.println("성공?");
			// makeDirectory는 directory 생성이 필요할 때만 해주시면 됩니다.
			ftp.changeWorkingDirectory("/html/byeolsolResort/logo");
			// 보관 이미지의 번호를 주기 위해 현재 이미지를 올리는 폴더 안에 있는 파일을 구함
			FTPFile[] ftpFiles = ftp.listFiles();
			FileInputStream fis = new FileInputStream(file);
			// 이전 logo이미지를 dumpLogo + 현재 이미지 올리는 폴더의 파일 수 로 이름을 변경 해준다.
			ftp.rename("logo.png", "dumpLogo"+ ftpFiles.length+".png");
			// 그 후 이전에 File로 변환한 업로드파일을 읽어 FTP로 전송합니다.
			boolean isSucess = ftp.storeFile("logo.png", fis);
			if (isSucess) {
				System.out.println("성공");
			} else {
				System.out.println("실패");
			}
			fis.close();
			fos.close();
			System.out.println(file.exists());
			System.out.println(file.delete());
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
	
	
	public void ftpHeaderImg(MultipartFile uploadFile) {
		FTPClient ftp = null;
		String uploadFileType = "." + uploadFile.getContentType()
				.substring(uploadFile.getContentType().lastIndexOf('/') + 1, uploadFile.getContentType().length());
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
			ftp.mkd("/html/byeolsolResort/header");
			System.out.println("성공?");
			// makeDirectory는 directory 생성이 필요할 때만 해주시면 됩니다.
			ftp.changeWorkingDirectory("/html/byeolsolResort/header");
			FTPFile[] ftpFiles = ftp.listFiles();
			// 그 후 이전에 File로 변환한 업로드파일을 읽어 FTP로 전송합니다.
			FileInputStream fis = new FileInputStream(file);
			ftp.rename("header.png", "dumpHeader"+ftpFiles.length+".png");
			boolean isSucess = ftp.storeFile("header.png", fis);
			if (isSucess) {
				System.out.println("성공");
			} else {
				System.out.println("실패");
			}
			fis.close();
			fos.close();
			System.out.println(file.exists());
			System.out.println(file.delete());
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
	

//	public void ftpUpEventImg(MultipartFile uploadFile, String Time, String path) {
//
//		FTPClient ftp = null;
//		try {
//			ftp.deleteFile(path);
//			File file = new File("C:\\Users\\tjoeun\\Desktop\\project" + uploadFile.getOriginalFilename());
//			if (file.createNewFile()) {
//				System.out.println("생성");
//			}
//			FileOutputStream fos = new FileOutputStream(file);
//			fos.write(uploadFile.getBytes());
//			fos.close();
//			// FTPClient를 생성합니다.
//			ftp = new FTPClient();
//			// 원하시는 인코딩 타입
//			ftp.setControlEncoding("utf-8");
//			ftp.connect(server, port);
//			ftp.login(user, pw);
//			// 원하시는 파일 타입
//			ftp.setFileType(FTP.BINARY_FILE_TYPE);
//			// 제대로 연결이 안댔을 경우 ftp접속을 끊습니다.
//			if (!FTPReply.isPositiveCompletion(ftp.getReplyCode())) {
//				ftp.disconnect();
//				System.out.println("연결 실패");
//			} else {
//				System.out.println("연결 성공");
//			}
//			// 파일을 넣을 디렉토리를 설정해줍니다.
//			ftp.mkd("/html/byeolsolResort/event");
//			ftp.mkd("/html/byeolsolResort/event/" + Time);
//			System.out.println("성공?");
//			// makeDirectory는 directory 생성이 필요할 때만 해주시면 됩니다.
//			ftp.changeWorkingDirectory("/html/byeolsolResort/event/" + Time);
//			// 그 후 이전에 File로 변환한 업로드파일을 읽어 FTP로 전송합니다.
//			FileInputStream fis = new FileInputStream(file);
//			boolean isSucess = ftp.storeFile(uploadFile.getOriginalFilename(), fis);
//			if (isSucess) {
//				System.out.println("성공");
//			} else {
//				System.out.println("실패");
//			}
//			fis.close();
//			fos.close();
//			System.out.println(file.exists());
//			System.out.println(file.delete());
//			// storeFile Method는 파일 송신결과를 boolean값으로 리턴합니다
//		} catch (Exception e) {
//			e.printStackTrace();
//		} finally {
//			if (ftp != null && ftp.isConnected()) {
//				try {
//					ftp.disconnect();
//				} catch (Exception e) {
//					e.printStackTrace();
//				}
//			}
//		}
//
//	}

}