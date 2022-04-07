package com.campkok.admin.common;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.campkok.admin.board.model.service.AdminBoardService;
import com.campkok.admin.board.model.vo.Board;
import com.campkok.admin.camp.model.service.AdminCampService;
import com.campkok.admin.camp.model.vo.Camp;
import com.campkok.admin.notice.model.service.AdminNoticeService;
import com.campkok.admin.notice.model.vo.CeoNotice;
import com.campkok.admin.notice.model.vo.ClientNotice;
import com.campkok.admin.user.model.service.AdminUserService;
import com.campkok.admin.user.model.vo.User;

@Controller
public class AdminPageController {
	@Autowired
	private AdminNoticeService nService;
	@Autowired
	private AdminUserService uService;
	@Autowired
	private AdminCampService cService;
	@Autowired
	private AdminBoardService bService;

	/* **************************************************
	 * Admin Page
	 * **************************************************
	*/
	@RequestMapping("/pageAdmin.do")
	public String pageAdmin(Model model) {
		int start = 1;
		int end = 5;

		ArrayList<CeoNotice> ceoNoticeList = nService.selectCeoNoticeList(start, end);
		ArrayList<ClientNotice> clientNoticeList = nService.selectClientNoticeList(start, end);
		ArrayList<User> clientInfoList = uService.selectClientInfoList(start, end);
		ArrayList<User> ceoInfoList = uService.selectCeoInfoList(start, end);
		ArrayList<Camp> campInfoList = cService.selectCampInfoList(start, end);
		ArrayList<Board> boardInfoList = bService.selectBoardInfoList(start, end);
		int tempCampCount = getTempCampCount();

		model.addAttribute("ceoNoticeList", ceoNoticeList);
		model.addAttribute("clientNoticeList", clientNoticeList);
		model.addAttribute("clientInfoList", clientInfoList);
		model.addAttribute("ceoInfoList", ceoInfoList);
		model.addAttribute("campInfoList", campInfoList);
		model.addAttribute("boardInfoList", boardInfoList);
		model.addAttribute("tempCampCount", tempCampCount);

		return "/admin/admin";
	}
	
	@RequestMapping("/pageMain.do")
	public String pageMain() {
		return "/main";
	}

	public int getTempCampCount() {
		int insertTempCampCount = cService.getTempCampCount();

		return insertTempCampCount;
	}

	//	@RequestMapping("/imgPreview.do")
	//	public void imgPreview(String filePath, HttpServletRequest request, HttpServletResponse response) {
	//		String root = request.getSession().getServletContext().getRealPath("file:///");
	//		String path = root + "/resources/upload/notice/";
	//		StringBuilder sb = new StringBuilder(path);
	//		sb.append(filePath);
	//
	//		try {
	//			URL fileUrl = new URL(sb.toString());
	//			IOUtils.copy(fileUrl.openStream(), response.getOutputStream());
	//		} catch (MalformedURLException e) {
	//			// TODO Auto-generated catch block
	//			e.printStackTrace();
	//		} catch (IOException ie) {
	//			// TODO Auto-generated catch block
	//			ie.printStackTrace();
	//		}
	//	}
}
