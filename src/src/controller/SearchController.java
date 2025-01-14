package controller;

import java.sql.Connection;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.HistoryDao;
import dao.ProductDao;
import dbcp.JdbcUtil;
import model.User;
import page.ProductPage;

public class SearchController extends Controller {

	@Override
	public String doPost(HttpServletRequest req, HttpServletResponse res) throws Exception {
		try {
			User user = getAuthUser(req);
			String mid = user.getMid();
			String[] itemsSeq = req.getParameterValues("itemSeq");
			if (itemsSeq != null && itemsSeq.length > 0) {
				Connection con = null;
				try {
					con = JdbcUtil.getConnection();
					for (String i : itemsSeq) {
						HistoryDao.Insert(con, mid, i, new Date());
					}
				} finally {
					JdbcUtil.close(con);
				}
			}
			res.sendRedirect(req.getContextPath()+"/history.do");
			return null;
		} catch (NotLoginException e) {
			res.sendRedirect(req.getContextPath()+"/login.do");
			return null;
		}
	}

	@Override
	public String doGet(HttpServletRequest req, HttpServletResponse res) throws Exception {
		ProductPage page = null;
		String searchWord = req.getParameter("searchWord");
		if (searchWord != null && !searchWord.isEmpty()) {
			int pageNo = getParameterInt(req, "pageNo", 1);
			int numOfRows = getParameterInt(req, "numOfRows", 10);
			Connection con = JdbcUtil.getConnection();
			Integer count = ProductDao.getCount(con, searchWord);
			page = new ProductPage(count, pageNo, numOfRows, ProductDao.getList(con, searchWord, pageNo, numOfRows));
			JdbcUtil.close(con);
		}
		req.setAttribute("page", page);
		req.setAttribute("searchWord", searchWord);
		return "/index.jsp";
	}

}
