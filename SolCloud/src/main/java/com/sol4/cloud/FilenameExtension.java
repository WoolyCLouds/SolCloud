package com.sol4.cloud;

public class FilenameExtension {
	// 파일 확장자에 따른 썸네일 설정
	public String filenameExtension(String f_name) {
		switch (f_name.substring(f_name.lastIndexOf(".") + 1, f_name.length()).toString()) {
			case "mp3":
			case "wma":
				return "resources/image/icon/music.png";
			case "txt":
			case "hwp":
				return "resources/image/icon/document.png";
			case "jpg":
			case "png":
			case "jpeg":
			case "gif":
			case "bmp":
				return "resources/image/icon/image.png";
			case "avi":
			case "wmv":
			case "mp4":
			case "mkv":
				return "resources/image/icon/video.png";
			case "zip":
				return "resources/image/icon/zip.png";
			case "ppt":
			case "pptx":
				return "resources/image/icon/ppt.png";
			case "doc":
			case "docx":
				return "resources/image/icon/doc.png";
			default:
				return "resources/image/icon/file.png";
		}
	}
}
