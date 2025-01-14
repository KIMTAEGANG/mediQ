package controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.CommandHandler;
import page.ListMemberPage;
import page.NewsPage;


//전체목록보기 요청 담당 컨트롤러 
//p652
public class ListMembercontroller implements CommandHandler {
 
	private ListMemberService listmemberService= new ListMemberService();
	
	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("ListMemberService진입성공");
		//할일
		//1.파라미터 받기
		String pageNoVal=request.getParameter("pageNo");//보고싶은 페이지
		int  pageNo=1;
		if	(pageNoVal!=null) {//보고싶은 페이지가 넘어오면 
			pageNo = Integer.parseInt(pageNoVal);
		}
		
		//2.비즈니스로직(<->Service<->DAO<->DB) 수행
		ListMemberPage listmemberPage =
				 listmemberService.getMemberListPage(pageNo);
		//3.Model
		request.setAttribute("listmemberPAGE", listmemberPage);
		//4.View 지정
		return"view/notice/news/memberList.jsp";

	}
}
