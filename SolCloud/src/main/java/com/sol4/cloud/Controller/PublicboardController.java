package com.sol4.cloud.Controller;

import java.io.File;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.sol4.cloud.Pagination;
import com.sol4.cloud.SessionAbandon;
import com.sol4.cloud.Domain.Cloud;
import com.sol4.cloud.Service.BoardService;
import com.sol4.cloud.Service.PublicboardService;

@Controller
public class PublicboardController {
	
	@Autowired
	private PublicboardService nService;
	
	@Autowired
	private BoardService bService;
	
	private static final SessionAbandon SA = new SessionAbandon();
	
	@RequestMapping(value="publicboardList.go")
	public ModelAndView publicboardList (HttpServletRequest request, HttpServletResponse response, HttpSession session,
			@RequestParam(defaultValue="all") String searchOption,
			@RequestParam(defaultValue="") String keyword, // 검색어
            @RequestParam(defaultValue="1") int curPage,  // 현재 페이지
            Cloud c) throws Exception {
		SA.sessionAbandon(response);
		ModelAndView mav = new ModelAndView();
		if(session.getAttribute("sessionID") != null) {
			if (keyword != null) {
				c.setF_name(keyword);
			} else {
				c.setF_name("");
			}
			
			// 레코드의 갯수 계산
		    int count = nService.checkPublicboard();

		    // 페이지 나누기 관련 처리
		    Pagination boardPager = new Pagination(count, curPage);
		    int start = boardPager.getPageBegin();
		    int end = boardPager.getPageEnd();
			
		    List<Cloud> list = nService.listAllPublicboard(start, end, searchOption, keyword);
		    
		    Map<String, Object> map = new HashMap<String, Object>();
		    map.put("list", list); // list
		    map.put("count", count); // 레코드의 갯수
		    map.put("searchOption", searchOption); // 검색옵션
		    map.put("keyword", keyword); // 검색키워드
		    map.put("boardPager", boardPager);
		    
		    mav.addObject("map", map); // 맵에 저장된 데이터를 mav에 저장
		    c.setM_id((String)session.getAttribute("sessionID"));
		    request.setAttribute("UC", (int)(((double)bService.usedCapacity(c)/2048)*100));
		    
			mav.addObject("headerPage", "board/header.jsp");
			mav.addObject("contentPage", "publicboard/publicboard.jsp");
			mav.setViewName("boardMain");
		} else {
			mav.setViewName("redirect:/");
		}
		return mav;
	}
	
	// 공유게시판 게시글 보기
	@RequestMapping(value="publicboardDetail")
	public ModelAndView publicboardDetail (HttpServletRequest request, HttpSession session, @RequestParam("pb_num") int pb_num, Cloud c) throws Exception {
		ModelAndView mav = new ModelAndView();
		if(session.getAttribute("sessionID") != null) {
			c.setM_id((String)session.getAttribute("sessionID"));
			request.setAttribute("UC", (int)(((double)bService.usedCapacity(c)/2048)*100));
			System.out.println(pb_num);
			c.setPb_num(pb_num);
			nService.updateViewCnt(c);
			mav.addObject("detail", nService.getPublicboard(c));
			mav.addObject("headerPage", "board/header.jsp");
			mav.addObject("contentPage", "publicboard/pb_detail.jsp");
			mav.setViewName("boardMain");
		}
		return mav;
	}
	
	// 공유 게시판 글 작성 폼 가기
	@RequestMapping(value="publicboardWrite.go")
	public ModelAndView publicboardWrite (HttpServletRequest request, HttpServletResponse response, HttpSession session, Cloud c) throws Exception {
		SA.sessionAbandon(response);
		ModelAndView mav = new ModelAndView();
		if(session.getAttribute("sessionID") != null) {
			c.setM_id((String)session.getAttribute("sessionID"));
			request.setAttribute("UC", (int)(((double)bService.usedCapacity(c)/2048)*100));
			
			mav.addObject("list", nService.getShareFile(c));
			mav.addObject("headerPage", "board/header.jsp");
			mav.addObject("contentPage", "publicboard/pb_write.jsp");
			mav.setViewName("boardMain");
		} else {
			mav.setViewName("redirect:/");
		}
		return mav;
	}
	
	// 공유 게시판 글 작성
	@RequestMapping(value="publicboardWrite.do", method = RequestMethod.POST)
	public ModelAndView publicboardWrite_do (HttpServletRequest request, HttpSession session, Cloud c) throws Exception {
		
		ModelAndView mav = new ModelAndView();
		if(session.getAttribute("sessionID") != null) {
			c.setM_id((String)session.getAttribute("sessionID"));
			request.setAttribute("UC", (int)(((double)bService.usedCapacity(c)/2048)*100));
			
			c.setPb_writer((String)session.getAttribute("sessionID"));
			if(c.getPb_class()==2) {
				c.setPb_file("");
			}
			nService.writePublicboardPost(c);
			
			mav.setViewName("redirect:publicboardList.go");
		} else {
			mav.setViewName("redirect:/");
		}
		return mav;
	}
	
	// 파일 다운로드
	@RequestMapping(value = "downloadShare", method = RequestMethod.GET)
	public ModelAndView download(@RequestParam("pb_writer") String pb_writer, @RequestParam("pb_file") String pb_file, Cloud c,
			HttpServletResponse response )throws Exception{
		
		String path = "C:\\SolCloud\\"+pb_writer+"\\"+pb_file;
		System.out.println(path);
		
		c.setPb_file(pb_file);
		c.setPb_writer(pb_writer);
		
		if (nService.checkFile(c) != 1) {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>alert('파일이 없습니다.'); location.href='publicboardList.go';</script>");
			out.flush();
			return null;
		} else {
			File down = new File(path);
			return new ModelAndView("download","downloadFile",down);
		}
	}
	
	// 공유 게시판 글 삭제
	@RequestMapping("deletePublicboard")
	public ModelAndView deletePublicboard (HttpSession session, HttpServletRequest request, 
			HttpServletResponse response, @RequestParam("pb_num") int pb_num, Cloud c) throws Exception {
		
		ModelAndView mav = new ModelAndView();
		if(session.getAttribute("sessionID") != null) {
			c.setM_id((String)session.getAttribute("sessionID"));
			request.setAttribute("UC", (int)(((double)bService.usedCapacity(c)/2048)*100));
			
			c.setPb_writer((String)session.getAttribute("sessionID"));
			c.setPb_num(pb_num);
			
			nService.deletePublicboardPost(c);
			
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>alert('게시물 삭제가 정상적으로 이루어졌습니다.'); location.href='publicboardList.go';</script>");
			out.flush();
			return null;
			
		} else {
			mav.setViewName("redirect:/");
		}
		return mav;
	}
}
