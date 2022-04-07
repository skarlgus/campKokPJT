package com.campkok.admin.notice.controller;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import com.campkok.admin.notice.model.service.AdminNoticeService;
import com.campkok.admin.notice.model.vo.CeoNotice;
import com.campkok.admin.notice.model.vo.CeoNoticePageData;
import com.campkok.admin.notice.model.vo.ClientNotice;
import com.campkok.admin.notice.model.vo.ClientNoticePageData;
import com.campkok.admin.notice.model.vo.Notice;
import com.campkok.hik.common.FileNameOverlap;

@Controller
public class AdminNoticeController {
	@Autowired
	private AdminNoticeService service;

	/* **************************************************
	 * Notice
	 * **************************************************
	*/
	@RequestMapping("/pageNoticeForm.do")
	public String pageNoticeForm() {

		return "/admin/noticeForm";
	}

	@RequestMapping("/searchCeoNotice.do")
	public String searchCeoNoticeList(int reqPage, String searchCategory, String search, Model model) {
		CeoNoticePageData cnpd = service.searchCeoNoticeList(reqPage, searchCategory, search);

		model.addAttribute("list", cnpd.getList());
		model.addAttribute("pageNavi", cnpd.getpageNavi());

		return "/admin/ceoNoticeList";
	}

	@RequestMapping(value = "/insertNotice.do", method = RequestMethod.POST)
	public String insertNotice(Notice notice, MultipartFile noticeFile, HttpServletRequest request, Model model) {
		String root = request.getSession().getServletContext().getRealPath("/");
		String path = root + "resources/upload/notice/";

		// 파일 업로드
		if (noticeFile != null) {
			String fileName = noticeFile.getOriginalFilename();
			String filePath = new FileNameOverlap().reName(path, fileName);

			try {
				byte[] bytes = noticeFile.getBytes();
				File uploadFile = new File(path + filePath);
				BufferedOutputStream bos = new BufferedOutputStream(new FileOutputStream(uploadFile));

				bos.write(bytes);
				bos.close();

				notice.setNoticeFileName(fileName);
				notice.setNoticeFilePath(filePath);
			} catch (IOException e) {
				e.printStackTrace();
			}
		}

		int result = service.insertNotice(notice);

		if (result > 0) {
			model.addAttribute("msg", notice.getUserCategory() + "공지사항 등록 성공");
		} else {
			model.addAttribute("msg", notice.getUserCategory() + "공지사항 등록 실패");
		}
		model.addAttribute("loc", "/pageAdmin.do?reqPage=1");

		return "/common/msg";
	}

	@RequestMapping("/selectCeoNotice.do")
	public String selectCeoNotice(int ceoNoticeNo, Model model) {
		CeoNotice ceoNotice = service.selectCeoNotice(ceoNoticeNo);

		model.addAttribute("ceoNotice", ceoNotice);

		return "/admin/ceoNoticeView";
	}

	@RequestMapping("/selectCeoNoticeList.do")
	public String selectCeoNoticeList(int reqPage, Model model) {
		CeoNoticePageData cnpd = service.selectCeoNoticeList(reqPage);

		model.addAttribute("list", cnpd.getList());
		model.addAttribute("pageNavi", cnpd.getpageNavi());

		return "/admin/ceoNoticeList";
	}

	@RequestMapping(value = "/updateCeoNotice.do", method = RequestMethod.POST)
	public String updateCeoNotice(CeoNotice ceoNotice, MultipartFile ceoNoticeFile, HttpServletRequest request,
			String oldFile, Model model) {
		if (ceoNoticeFile != null) {
			String root = request.getSession().getServletContext().getRealPath("/");
			String path = root + "resources/upload/notice/";
			String fileName = ceoNoticeFile.getOriginalFilename();
			String filePath = new FileNameOverlap().reName(path, fileName);

			try {
				byte[] bytes = ceoNoticeFile.getBytes();
				File newFile = new File(path + filePath);
				BufferedOutputStream bos = new BufferedOutputStream(new FileOutputStream(newFile));

				bos.write(bytes);
				bos.close();

				ceoNotice.setCeoNoticeFileName(fileName);
				ceoNotice.setCeoNoticeFilePath(filePath);

			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

			if (oldFile != null) {
				File deleteFile = new File(path + oldFile);

				System.out.println(deleteFile);

				if (deleteFile.exists()) {
					deleteFile.delete();
				}
			}
		}

		int result = service.updateCeoNotice(ceoNotice);

		if (result > 0) {
			model.addAttribute("msg", "사업자 공지사항 수정 성공");
		} else {
			model.addAttribute("msg", "사업자 공지사항 수정 실패");
		}
		model.addAttribute("loc", "/selectCeoNoticeList.do?reqPage=1");

		return "/common/msg";
	}

	@RequestMapping("/deleteCeoNotice.do")
	public String deleteCeoNotice(int ceoNoticeNo, String ceoNoticeFilePath, HttpServletRequest request, Model model) {
		if (ceoNoticeFilePath != null) {
			String root = request.getSession().getServletContext().getRealPath("/");
			String path = root + "resources/upload/notice/";
			String filePath = ceoNoticeFilePath;
			File deleteFile = new File(path + filePath);

			if (deleteFile.exists()) {
				deleteFile.delete();
			}
		}

		int result = service.deleteCeoNotice(ceoNoticeNo);

		if (result > 0) {
			model.addAttribute("msg", "사업자 공지사항 삭제 성공");
		} else {
			model.addAttribute("msg", "사업자 공지사항 삭제 실패");
		}
		model.addAttribute("loc", "/selectCeoNoticeList.do?reqPage=1");

		return "/common/msg";
	}

	// ****************************************************************************************************

	@RequestMapping("/searchClientNotice.do")
	public String searchClientNotice(int reqPage, String searchCategory, String search, Model model) {
		ClientNoticePageData cnpd = service.searchClientNotice(reqPage, searchCategory, search);

		model.addAttribute("list", cnpd.getList());
		model.addAttribute("pageNavi", cnpd.getPageNavi());

		return "/admin/clientNoticeList";
	}

	@RequestMapping("/selectClientNotice.do")
	public String selectClientNotice(int clientNoticeNo, Model model) {
		ClientNotice clientNotice = service.selectClientNotice(clientNoticeNo);

		model.addAttribute("clientNotice", clientNotice);

		return "/admin/clientNoticeView";
	}

	@RequestMapping("/selectClientNoticeList.do")
	public String selectClientNoticeList(int reqPage, Model model) {
		ClientNoticePageData cnpd = service.selectClientNoticeList(reqPage);

		model.addAttribute("list", cnpd.getList());
		model.addAttribute("pageNavi", cnpd.getPageNavi());

		return "/admin/clientNoticeList";
	}

	@RequestMapping(value = "/updateClientNotice.do", method = RequestMethod.POST)
	public String updateClientNotice(ClientNotice clientNotice, MultipartFile clientNoticeFile,
			HttpServletRequest request, String oldFile, Model model) {
		if (clientNoticeFile != null) {
			String root = request.getSession().getServletContext().getRealPath("/");
			String path = root + "resources/upload/notice/";
			String fileName = clientNoticeFile.getOriginalFilename();
			String filePath = new FileNameOverlap().reName(path, fileName);

			try {
				byte[] bytes = clientNoticeFile.getBytes();
				File newFile = new File(path + filePath);
				BufferedOutputStream bos = new BufferedOutputStream(new FileOutputStream(newFile));

				bos.write(bytes);
				bos.close();

				clientNotice.setClientNoticeFileName(fileName);
				clientNotice.setClientNoticeFilePath(filePath);
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

			if (oldFile != null) {
				File deleteFile = new File(path + oldFile);

				if (deleteFile.exists())
					deleteFile.delete();
			}
		}

		int result = service.updateClientNotice(clientNotice);

		if (result > 0) {
			model.addAttribute("msg", "고객 공지사항 수정 성공");
		} else {
			model.addAttribute("msg", "고객 공지사항 수정 실패");
		}
		model.addAttribute("loc", "/selectClientNoticeList.do?reqPage=1");

		return "/common/msg";
	}

	@RequestMapping("/deleteClientNotice.do")
	public String deleteClientNotice(int clientNoticeNo, String clientNoticeFilePath, HttpServletRequest request,
			Model model) {
		if (clientNoticeFilePath != null) {
			String root = request.getSession().getServletContext().getRealPath("/");
			String path = root + "resources/upload/notice/";
			String fileName = clientNoticeFilePath;
			File deleteFile = new File(path + fileName);

			if (deleteFile.exists()) {
				deleteFile.delete();
			}
		}

		int result = service.deleteClientNotice(clientNoticeNo);

		if (result > 0) {
			model.addAttribute("msg", "고객 공지사항 삭제 성공");
		} else {
			model.addAttribute("msg", "고객 공지사항 삭제 실패");
		}
		model.addAttribute("loc", "/selectClientNoticeList.do?reqPage=1");

		return "/common/msg";
	}
}
