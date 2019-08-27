package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.dao.NewsDAO;
import model.vo.NewsVO;

@WebServlet("/news")
public class NewsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		NewsDAO dao = new NewsDAO();
		String action = request.getParameter("action");
		String newsId = request.getParameter("id");
		if (action != null) {
			int id = Integer.parseInt(newsId);
			if (action.equals("read")) {
				NewsVO vo = dao.listOne(id);
				request.setAttribute("listOne", vo);
			}else{
				dao.delete(id);
			}
		}else {
		request.setAttribute("list", dao.listAll());
		}
		request.getRequestDispatcher("/jspexam/news.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String action = request.getParameter("action");
		String writer = request.getParameter("writer");
		String title = request.getParameter("title");
		String content = request.getParameter("content");

		NewsVO vo = new NewsVO();
		NewsDAO dao = new NewsDAO();
		vo.setWriter(writer);
		vo.setTitle(title);
		vo.setContent(content);

		if (action.equals("insert")) {
			dao.insert(vo);
		} else {
			vo.setId(Integer.parseInt(request.getParameter("id")));
			dao.update(vo);
		}
		request.setAttribute("list", dao.listAll());
		request.getRequestDispatcher("/jspexam/news.jsp").forward(request, response);
	}
}
