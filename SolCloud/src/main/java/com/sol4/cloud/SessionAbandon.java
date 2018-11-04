package com.sol4.cloud;

import javax.servlet.http.HttpServletResponse;

public class SessionAbandon {
	// 로그아웃 후, 뒤로가기 시에 남아있는 캐시값을 제거
	public void sessionAbandon(HttpServletResponse response) {
		response.setHeader("pragma","No-cache"); 
		response.setHeader("Cache-Control","no-cache"); 
		response.addHeader("Cache-Control","No-store"); 
		response.setDateHeader("Expires",1L); 
	}
}
