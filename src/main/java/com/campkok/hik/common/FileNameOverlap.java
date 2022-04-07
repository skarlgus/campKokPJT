package com.campkok.hik.common;

import java.io.File;

public class FileNameOverlap {
	public String reName(String path, String fileName) {
		// 파일명 시작부터 마지막 '.' 앞까지 추출
		String fileFrontName = fileName.substring(0, fileName.lastIndexOf('.'));
		// '.' 이후 확장자
		String fileExtension = fileName.substring(fileName.lastIndexOf('.'));
		StringBuilder sb = new StringBuilder();
		// 파일 중복시 붙일 숫자
		int num = 0;

		while (true) {
			// StringBuilder 초기화
			sb.setLength(0);
			sb.append(fileFrontName);
			if (num != 0) {
				sb.append("(" + num + ")");
			}
			sb.append(fileExtension);

			File checkFile = new File(path + sb.toString());

			if (!checkFile.exists())
				break;
			num++;
		}
		return sb.toString();
	}
}
