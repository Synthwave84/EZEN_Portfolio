package com.synth.utils;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.nio.file.Files;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.UUID;

import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.multipart.MultipartFile;

import net.coobird.thumbnailator.Thumbnailator;


//	파일 업로드 관련 필요한 메소드 구성
public class FileUtils {

//	날짜폴더 생성을 위한 날짜 정보
	public static String getDateFolder () {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-mm-dd");
		Date date = new Date();
//		Ex> 2023-11-02
		String str = sdf.format(date);
//		각 OS별로 하이픈을 경로 구분자로 반환해준다.
//		Linux,Unix,Mac 기반 /
//		윈도우즈 구분자 \ => yyyy/mm/dd
		return str.replace("-", File.separator);
	}
	
//	서버에 파일업로드 기능을 실제 업로드 한 파일명 반환
//	String uploadFolder : 서버측의 업로드 될 폴더위치 
//	String dateFolder: 이미지 파일을 저장할 날짜 폴더명 
//	Multipartfile uploadFile : 업로드된 파일을 참조하는 객체
	public static String uploadFile(String uploadFolder, String dateFolder, MultipartFile uploadFile) {
		
//		실제 업로드 한 파일 이름.(파일이름 중복방지)
		String realUploadFileName= "";

//		File클래스 :파일과 폴더관련 작업
//		예시 >"C:/dev/upload" "2023/11/02"
		File file = new File(uploadFolder, dateFolder);
		
		if(file.exists() == false) {
			file.mkdirs();
		}
		
		String clientFileName = uploadFile.getOriginalFilename();
		
//		파일명의 중복장지를 위해 고유한 이름에 사용하는 UUID
		UUID uuid = UUID.randomUUID();
		realUploadFileName = uuid.toString()+"_"+ clientFileName;
		
		try {
//			file: "C:/dev/upload/2023/11/02" + realUploadFileName : 업로드파일명
			File saveFile = new File(file,realUploadFileName);
//			파일 업로드(파일복사)
//			하단의 transerTo 를 위해 작업된 것. 핵심 메소드!*****
			uploadFile.transferTo(saveFile);
			
//			Thumbnail 작업
//			원본이미지의 파일크기가 커서, 브라우저에 리스트로 사용시 로딩되는 시간이 길어진다.
//			때문에 원본이미지를 파일크기와 해상도를 낮추어 작은형태의 이미지로 만드는 것.
			if(checkImageType(saveFile)) {
//				파일 출력 스트림 클래스. 하단 줄만 실행시, 파일이 생성된다.
				FileOutputStream thumbnail = new FileOutputStream(new File(file, "s_" + realUploadFileName));

//				썸네일 작업기능 라이브러리에서 제공하는 클래스 Thumbnailator. pom.xml 참조
//				원본 이미지 파일의 내용을 스프링방식으로 읽어서, 썸네일 이미지파일에 쓰는 작업
				Thumbnailator.createThumbnail(uploadFile.getInputStream(), thumbnail, 100,100);
				
				thumbnail.close();
			}
		} catch (Exception e) {
//			파일 업로드시 예외가 발생되면, 예외정보를 출력하는 역활.
			e.printStackTrace();
		}
//		상품 테이블에 상품이미지명으로 저장.
		return realUploadFileName;
		

	}
//		업로드 되는 파일 구문(이미지파일 또는 일반파일 구분)
		private static boolean checkImageType(File savefile) {
		boolean isImageType = false;
		try {
//			MIME: text/html, text/plain, image/image
			String contentType = Files.probeContentType(savefile.toPath());
			
//			contentType변수의 값이 image문자열로 시작하는지 여부를 True, False값으로 리턴해줌.
			isImageType = contentType.startsWith("image");
		} catch (IOException e) {
		
			e.printStackTrace();
		}
		
		return isImageType;
		
	}
		
//	프로젝트 외부폴더에 의해서 관리되고 있는 상품 이미지를 브라우저의 <img src=""> 이미지태그로 부터 요청이 들어왔을 때
//	바이트 배열로 보내주는 작업.
//	String uploadPath : 업로드 폴더 경로 , String fileName : 날짜경로를 포함한 파일 경로
//	ResponseEntity 클래스가 나올 경우 : 1)헤더 2)바디 3)상태코드
	public static ResponseEntity<byte[]> getFile(String uploadPath, String fileName) throws Exception {
		
		ResponseEntity<byte[]> entity = null;
		
//		상품 이미지 파일을 참조하는 파일 예제
		File file = new File(uploadPath, fileName);
		
//		파일이 해당 경로에 존재하지 않으면
		if(!file.exists()) {
//			null로 리턴.
			return entity;
		}
		
//		1) Header
//		Files.probeContentType(file.toPath()) : image/jpeg
//		file : b00b7cbb-0f29-4f98-91fb-b803e1ba41b2_cat.jpg
		HttpHeaders headers = new HttpHeaders();
		headers.add("Content-Type", Files.probeContentType(file.toPath()));
		
		entity = new ResponseEntity<byte[]>(FileCopyUtils.copyToByteArray(file), headers, HttpStatus.OK);
		
		return entity;
	}
//	파일 삭제
//	String uploadPath : 업로드 폴더 > servlet-context.xml uploadPath bean정보 사용.
//	String folderName : 파일 업로드 된 날짜 폴더명
//	String fileName   : 파일명
	public static void deleteFile(String uploadPath, String folderName, String fileName) {
		
//		File.separatorChar : 배포된 서버의 운영체제에서 사용하는 파일 경로구분자를 반환.
//		예 > 윈도우즈 : \ 리눅스 : /
		
//		1) 원본 이미지 삭제.
		new File((uploadPath + folderName + "\\" + fileName).replace('\\', File.separatorChar)).delete();
//		2) 썸네일 이미지 삭제.
		new File((uploadPath + folderName + "\\"+ "s_" + fileName).replace('\\', File.separatorChar)).delete();
	}
}
