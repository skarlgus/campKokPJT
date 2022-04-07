package com.campkok.customer.controller;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.net.URLEncoder;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import com.campkok.customer.model.service.BoardService;
import com.campkok.customer.model.vo.BoardCommentVO;
import com.campkok.customer.model.vo.BoardPageData;
import com.campkok.customer.model.vo.BoardVO;
import com.campkok.customer.model.vo.BoardViewData;
import com.campkok.hik.common.FileNameOverlap;

@Controller
public class BoardController {
	@Autowired
	private BoardService service;
	
	@RequestMapping("/boardList.do")
	public String boardList(int reqPage, Model model) {
		BoardPageData bpd = service.boardList(reqPage);
		model.addAttribute("list",bpd.getList());
		model.addAttribute("pageNavi", bpd.getPageNavi());
		return "board/boardList";
	}
	
	@RequestMapping("/boardView.do")
	public String boardView(int boardNo, Model model) {
		BoardViewData bvd = service.selectBoardView(boardNo);
		model.addAttribute("b", bvd.getB());
		model.addAttribute("list", bvd.getList());
		return "board/boardView";
	}
	
	@RequestMapping("/boardFrm.do")
	public String boardFrm() {
		return "board/boardFrm";
	}
	@RequestMapping("/insertBoard.do")
	public String insertBoard(BoardVO b, MultipartFile file, HttpServletRequest request, Model model) {
		/** 매개변수 설명
		 * Notice n : 제목, 작성자, 본문내용을 가져오는 매개변수
		 * MultipartFile : 업로드하는 파일을 가져오기 위한 매개변수
		 * HttpServletRequest : 업로드 경로를 가져오기위한 매개변수
		 * Model : 결과처리를 위한 매개변수
		 */
//		b.setBoardContents(boardContents);
		//1. 업로드 경로 지정(c드라이브부터 이 프로젝트까지 자동으로 경로를 찾아주는 코드 webapp까지)
		String root = request.getSession().getServletContext().getRealPath("/");
		String path = root + "resources/upload/board/";
		//2. 파일처리
		if(!file.isEmpty()) {
			//filename / filepath
			//사용자가 올린 파일명 저장
			String filename = file.getOriginalFilename();
			//업로드 경로에 중복된 경우 파일명을 다시 지정하여 변수에 저장
			String filepath = new FileNameOverlap().reName(path, filename);
			System.out.println("filename:"+filename);
			System.out.println("filepath:"+filepath);
			try {
				//업로드할 파일을 byte[]형태로 변환
				byte[] bytes = file.getBytes();
				//업로드할 파일객체 생성
				File upFile = new File(path+filepath);
				//파일을 내보내기 위한 주스트림 생성
				FileOutputStream fos = new FileOutputStream(upFile);
				//속도개선을 위한 보조스트림 생성
				BufferedOutputStream bos = new BufferedOutputStream(fos);
				//파일 저장
				bos.write(bytes);
				bos.close();
				b.setBoardFilename(filename);
				b.setBoardFilepath(filepath);
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		}
		int result = service.insetBoard(b);
		if(result>0) {
			model.addAttribute("msg", "게시판 작성 완료");
		}else {
			model.addAttribute("msg", "게시판 작성 실패");
		}
		model.addAttribute("loc", "/boardList.do?reqPage=1");
		return "common/msg";
	}
	
	@RequestMapping("/boardDownload.do")
    public void NoticeDownload(String filename, String filepath, int boardNo, HttpServletRequest request, HttpServletResponse response) {
       String path = request.getSession().getServletContext().getRealPath("/") + "resources/upload/board/";
        
        FileInputStream fis;
        try {
           fis = new FileInputStream(path+filepath);
           BufferedInputStream bis = new BufferedInputStream(fis);
           
           ServletOutputStream sos;
           try {
              sos = response.getOutputStream();
              BufferedOutputStream bos = new BufferedOutputStream(sos);
              
              String resFilename = "";
              
              boolean bool = request.getHeader("user-agent").indexOf("MSIE") != -1 || request.getHeader("user-agent").indexOf("Trident") != -1;
              System.out.println(bool);
              if(bool) {//사용자의 브라우저가 IE인 경우
                 resFilename = URLEncoder.encode(filename,"UTF-8");
                 resFilename = resFilename.replace("\\\\", "%20");
              }else {// 그 외 브라우저인 경우
                 resFilename = new String(filename.getBytes("UTF-8"),"ISO-8859-1");
              }
              
              response.setContentType("application/octet-stream");//파일받으면된다는 응답이 온것
              response.setHeader("Content-Disposition", "attachment;filename="+resFilename);//resFilename : 파일 다운로드받을때의 파일명
              //파일 전송
              int read = -1;
              while((read=bis.read())!=-1) {
                 bos.write(read);
              }
              bos.close();
              bis.close();
           } catch (IOException e) {
              // TODO Auto-generated catch block
              e.printStackTrace();
           }
           
        } catch (FileNotFoundException e) {
           // TODO Auto-generated catch block
           e.printStackTrace();
        }
        
        //return "redirect:/noticeView.do?noticeNo="+noticeNo;
    }
	
	@RequestMapping("/boardUpdateFrm.do")
	public String boardUpdateFrm(int boardNo, Model model) {
		BoardVO b = service.selectOneBoard(boardNo);
		model.addAttribute("b", b);
		return "board/boardUpdateFrm";
	}
	
	@RequestMapping("/updateBoard.do")
	public String updateBoard(BoardVO b, MultipartFile file, HttpServletRequest request, Model model, String status, String oldFilepath, String oldFilename) {
		//1. 업로드 경로 지정(c드라이브부터 이 프로젝트까지 자동으로 경로를 찾아주는 코드 webapp까지)
		String root = request.getSession().getServletContext().getRealPath("/");
		String path = root + "resources/upload/board/";
		//2. 파일처리
		if(!file.isEmpty()) {
			if(status.equals("delete")) {
				File delFile = new File(path+oldFilepath);
				delFile.delete();
			}
			//filename / filepath
			//사용자가 올린 파일명 저장
			String filename = file.getOriginalFilename();
			//업로드 경로에 중복된 경우 파일명을 다시 지정하여 변수에 저장
			String filepath = new FileNameOverlap().reName(path, filename);
			System.out.println("filename:"+filename);
			System.out.println("filepath:"+filepath);

			try {
				//업로드할 파일을 byte[]형태로 변환
				byte[] bytes = file.getBytes();
				//업로드할 파일객체 생성
				File upFile = new File(path+filepath);
				//파일을 내보내기 위한 주스트림 생성
				FileOutputStream fos = new FileOutputStream(upFile);
				//속도개선을 위한 보조스트림 생성
				BufferedOutputStream bos = new BufferedOutputStream(fos);
				//파일 저장
				bos.write(bytes);
				bos.close();
				b.setBoardFilename(filename);
				b.setBoardFilepath(filepath);
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			
		}
		if(oldFilepath != null) {
			if(status.equals("delete")) {
				File delFile = new File(path+oldFilepath);
				delFile.delete();
			}else {
				b.setBoardFilename(oldFilename);
				b.setBoardFilepath(oldFilepath);
			}
		}
		
		
		
		
		System.out.println(b.getBoardContents());
		int result = service.updateBoard(b);
		System.out.println(result);
		if(result>0) {
			model.addAttribute("msg", "게시판 수정 완료");
		}else {
			model.addAttribute("msg", "게시판 수정 실패");
		}
		model.addAttribute("loc", "/boardList.do?reqPage=1");
		return "common/msg";
	}
	
	@RequestMapping("/deleteBoard.do")
	public String deleteBoard(int boardNo, Model model) {
		int result = service.deleteBoard(boardNo);
		if(result>0) {
			model.addAttribute("msg", "게시판 삭제 완료");
		}else {
			model.addAttribute("msg", "게시판 삭제 실패");
		}
		model.addAttribute("loc", "/boardList.do?reqPage=1");
		return "common/msg";
	}
	
	@RequestMapping("/searchBoard.do")
	public String searchBoard(int reqPage, String keyword, Model model) {
		System.out.println(keyword);
		BoardPageData bpd = service.searchList(reqPage, keyword);
		model.addAttribute("list",bpd.getList());
		model.addAttribute("pageNavi", bpd.getPageNavi());
		return "board/boardList";
	}
	
	@RequestMapping("/insertBoardComment.do")
	public String insertBoardComment(BoardCommentVO bc, Model model) {
		System.out.println(bc.getBoardCommentContent());
		int result = service.insertBoardComment(bc);
		if (result > 0) {
			model.addAttribute("msg", "댓글 작성이 완료되었습니다.");
		} else {
			model.addAttribute("msg", "댓글 작성이 실패하였습니다.");
		}
		model.addAttribute("loc", "/boardView.do?boardNo="+bc.getBoardRef());
		return "common/msg";
	}
	@RequestMapping("/updateBoardComment.do")
	public String updateBoardComment(int boardNo, int boardCommentNo, String boardCommentContent, Model model) {
		BoardCommentVO bc = new BoardCommentVO();
		bc.setBoardCommentNo(boardCommentNo);
		bc.setBoardCommentContent(boardCommentContent);
		int result = service.updateBoardComment(bc);
		if (result > 0) {
			model.addAttribute("msg", "댓글 수정이 완료되었습니다.");
		} else {
			model.addAttribute("msg", "댓글 수정이 실패하였습니다.");
		}
		model.addAttribute("loc", "/boardView.do?boardNo="+boardNo);
		return "common/msg";
	}
	@RequestMapping("/deleteBoardComment.do")
	public String deleteBoardComment(int boardCommentNo, int boardNo, Model model) {
		int result = service.deleteBoardComment(boardCommentNo);
		if (result > 0) {
			model.addAttribute("msg", "댓글 삭제가 완료되었습니다.");
		} else {
			model.addAttribute("msg", "댓글 삭제가 실패하였습니다.");
		}
		model.addAttribute("loc", "/boardView.do?boardNo="+boardNo);
		return "common/msg";
	}
}
