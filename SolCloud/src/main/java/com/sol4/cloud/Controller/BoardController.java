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
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.sol4.cloud.FilenameExtension;
import com.sol4.cloud.Pagination;
import com.sol4.cloud.SessionAbandon;
import com.sol4.cloud.Domain.Cloud;
import com.sol4.cloud.Service.BoardService;
import com.sol4.cloud.Service.PublicboardService;

@Controller
public class BoardController {
	
	@Autowired
	private BoardService bService;
	
	private static final SessionAbandon SA = new SessionAbandon();

	private static FilenameExtension FE = new FilenameExtension();

	// 로그인 후, 처음 화면
	@RequestMapping(value="boardMain.go")
	public ModelAndView dashBoard_go (HttpServletRequest request, HttpServletResponse response, Cloud c, @RequestParam(defaultValue="") String f_name, HttpSession session) throws Exception {
		SA.sessionAbandon(response);
		ModelAndView mav = new ModelAndView();
		if (session.getAttribute("sessionID") != null) {
			c.setM_id((String) session.getAttribute("sessionID"));
			c.setF_name(f_name);
			request.setAttribute("count", bService.checkFile(c));
			request.setAttribute("usedCapacity", bService.usedCapacity(c));
			request.setAttribute("UC", (int)(((double)bService.usedCapacity(c)/2048)*100));
			c.setPb_writer((String) session.getAttribute("sessionID"));
			mav.addObject("list", bService.getBoard(c));
			mav.addObject("publicboard", bService.getPublicboardbyID(c));
			mav.addObject("headerPage", "board/header.jsp");
			mav.addObject("contentPage", "board/dashboard.jsp");
			mav.setViewName("boardMain");
		} else {
			mav.setViewName("redirect:/");
		}
		
		return mav;
	}

	// 클라우드 게시판
	@RequestMapping("board.go")
	public ModelAndView boardList (HttpServletRequest request, HttpServletResponse response, HttpSession session,
							@RequestParam(defaultValue="") String searchfname,
	                        @RequestParam(defaultValue="1") int curPage) throws Exception {
		SA.sessionAbandon(response);
		ModelAndView mav = new ModelAndView();
		if(session.getAttribute("sessionID") != null) {
			Cloud c = new Cloud();
			c.setM_id((String) session.getAttribute("sessionID"));
			if (searchfname != null) {
				c.setF_name(searchfname);
			} else {
				c.setF_name("");
			}
			
			// 레코드의 갯수 계산
		    int count = bService.checkFile(c);
		    
		    // 페이지 나누기 관련 처리
		    Pagination boardPager = new Pagination(count, curPage);
		    int start = boardPager.getPageBegin();
		    int end = boardPager.getPageEnd();
			
		    List<Cloud> list = bService.listAll(start, end, c);
		    
		    Map<String, Object> map = new HashMap<String, Object>();
		    map.put("list", list); // list
		    map.put("count", count); // 레코드의 갯수
		    map.put("searchfname", searchfname); // 검색키워드
		    map.put("boardPager", boardPager);
		    
		    mav.addObject("map", map); // 맵에 저장된 데이터를 mav에 저장
		    request.setAttribute("UC", (int)(((double)bService.usedCapacity(c)/2048)*100));
		    
			mav.addObject("headerPage", "board/header.jsp");
			mav.addObject("contentPage", "board/board.jsp");
			mav.setViewName("boardMain");
		} else {
			mav.setViewName("redirect:/");
		}
		return mav;
	}

	// 파일 업로드
	@RequestMapping(value="uploadfile.do", method=RequestMethod.POST)
	public ModelAndView uploadFile(HttpServletRequest request, HttpServletResponse response, HttpSession session, Cloud c, @RequestParam("file1") MultipartFile file) throws Exception {
		ModelAndView mav = new ModelAndView();
		String s_id = (String) session.getAttribute("sessionID");
		c.setM_id(s_id);
		
		// 클라우드의 용량은 2GB 까지
		if(s_id != null) {
			if(!file.isEmpty() && ((bService.usedCapacity(c) + (double) file.getSize()/(1024*1024)) <= 2048)) { 
				File f = new File("C:\\SolCloud\\"+s_id+"\\"+file.getOriginalFilename());
		    	file.transferTo(f);
		    	c.setF_name(file.getOriginalFilename());
		    	c.setF_location(f.getPath());
		    	c.setF_icon(FE.filenameExtension(c.getF_name()));
		    	c.setF_size(file.getSize()/(double)(1024*1024)); //mb단위
		    	
		    	// 중복 파일명 체크
		    	if(bService.checkFile(c)!=0) {
		    		response.setContentType("text/html; charset=UTF-8");
					PrintWriter out = response.getWriter();
					out.println("<script>alert('중복된 이름의 파일이 있습니다.'); location.href='board.go';</script>");
					out.flush();
					return null;
		    	} else {
		    		bService.uploadFile(c);
		    	}
			} else if((bService.usedCapacity(c) + (double) file.getSize()/(1024*1024)) > 2048) { 
				response.setContentType("text/html; charset=UTF-8");
				PrintWriter out = response.getWriter();
				out.println("<script>alert('클라우드 용량이 다 찼습니다.'); location.href='board.go';</script>");
				out.flush();				
				return null;
			 }else {
				response.setContentType("text/html; charset=UTF-8");
				PrintWriter out = response.getWriter();
				out.println("<script>alert('파일이 없습니다.'); location.href='board.go';</script>");
				out.flush();
				return null;
			}
			
			System.out.println(bService.usedCapacity(c));
			mav.setViewName("redirect:board.go");
			return mav;

		} else {
			mav.setViewName("redirect:/");
			return mav;
		}
	}

	// 파일 다운로드
	@RequestMapping(value = "downloadfile", method = RequestMethod.GET)
	public ModelAndView download(@RequestParam("m_id") String m_id, @RequestParam("f_name") String f_name)throws Exception{
		String path = "C:\\SolCloud\\"+m_id+"\\"+f_name;
		System.out.println(path);
		File down = new File(path);
		return new ModelAndView("download","downloadFile",down);
	}
	
	// 파일 삭제
	@RequestMapping(value="deletefile.do", method = RequestMethod.GET)
	public ModelAndView deleteFile(HttpServletRequest request, Cloud sdto, @RequestParam("f_name") String f_name) {
		System.out.println(f_name);
		System.out.println(sdto.getF_name());
		sdto.setF_name(f_name);
		System.out.println(sdto.getF_name());
		bService.deleteFile(sdto);
		ModelAndView mav = new ModelAndView();
        mav.setViewName("redirect:board.go");
        return mav;
	}
	
	// 파일 공유 설정
	@RequestMapping(value = "shareCheck", method = RequestMethod.GET)
	public ModelAndView shareCheck (HttpServletRequest request, HttpSession session, @RequestParam("m_id") String m_id,
			@RequestParam("f_name") String f_name, @RequestParam("f_share") int f_share, Cloud c) {
		
		ModelAndView mav = new ModelAndView();
		
		// 공유한 파일 DB sc_publicboard 테이블에 등록  
		if (session.getAttribute("sessionID") != null && session.getAttribute("sessionID").equals(m_id)) {
			c.setM_id((String) session.getAttribute("sessionID"));
			c.setF_name(f_name);
			c.setF_share(f_share);
			bService.updateShare(c);
			System.out.println(request.getParameter("view"));
			if (request.getParameter("view").equals("dashboard")) {
				mav.setViewName("redirect:boardMain.go");
			} else {
				mav.setViewName("redirect:board.go");
			}
		} else {
			mav.setViewName("redirect:/");
		}
		
		return mav;
	}
}
