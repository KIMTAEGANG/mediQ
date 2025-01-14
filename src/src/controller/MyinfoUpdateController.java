package controller;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.User;
import model.Member;

public class MyinfoUpdateController implements CommandHandler {
	
	private static final String FORM_VIEW = "/view/member/myinfoUpdate.jsp";
	
	String mid = null;
	String mpwd = null;
	String memail = null;
	String mhp = null;
	String mname = null;
	User user = null;
	
	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("MyinfoUpdateController 진입성공");
		
		HttpSession session = request.getSession();
		user = (User)session.getAttribute("AUTHUSER");
		mid = user.getMid();
		System.out.println("세션에서 받은 mid = "+mid);
		//GET방식으로  요청이 들어오면
		if(request.getMethod().equalsIgnoreCase("GET")) {
			System.out.println("myinfoUpdate.jsp의 method방식="+request.getMethod());
			return processForm(request,response);
		}else if(request.getMethod().equalsIgnoreCase("POST")) {//post방식으로 요청이 들어오면
			System.out.println("myinfoUpdate.jsp의 method방식="+request.getMethod());
			return processSubmit(request,response);
		}else {
			//405에러
			response.setStatus(HttpServletResponse.SC_METHOD_NOT_ALLOWED);
			return null;
		}
	}
	
	//GET방식으로 요청이 들어오면  폼(/view/member/join.jsp)을 보여주기
	private String processForm(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("MyinfoUpdateController의 processForm()호출");
		//할일
		//1.파라미터받기
				
		//2.비즈니스로직(<->Service<->DAO<->DB)
		try {
			
			Member member = MyinfoUpdateService.getInfo(mid);
			System.out.println("MyinfoController-processForm(member)="+member);
			
			//3.Model
			request.setAttribute("member",member);
			System.out.println("테스트 member="+member);
			
			//4.View
			return "/view/member/myinfoUpdate.jsp";
		}catch(Exception e) {
			request.getServletContext().log("no article", e);
			response.sendError(HttpServletResponse.SC_NOT_FOUND);
			return null;
		}
	}
	
		//service호출
		private String processSubmit(HttpServletRequest request, HttpServletResponse response) throws SQLException {
			
			System.out.println("MyinfoController의 processSubmit()호출");
			
			mpwd = request.getParameter("mpwd");
			memail = request.getParameter("memail");
			mhp = request.getParameter("mhp");
			
			MyinfoUpdateService myinfoUpdateService = new MyinfoUpdateService();
			myinfoUpdateService.InfoUpdateService(mid, mpwd, memail, mhp);
			
			mname = user.getMname();
			request.setAttribute("mname",mname);
			return "/view/member/myinfoUpdateSuccess.jsp";
		}
}

