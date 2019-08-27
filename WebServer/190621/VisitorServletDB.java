package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.dao.VisitorDAO;
import model.vo.VisitorVO;

@WebServlet("/visitor")
public class VisitorServletDB extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String keyword = request.getParameter("keyword");
		VisitorDAO dao = new VisitorDAO();
		if (keyword == null) {
			request.setAttribute("list", dao.listAll());
		} else {
			ArrayList<VisitorVO> list = dao.search(keyword);
			if (list.size() == 0) {
				request.setAttribute("msg", keyword + "가 포함된 글이 없습니다.");
			} else {
				request.setAttribute("list", dao.search(keyword));
			}
		}
		request.getRequestDispatcher("/jspexam/visitorView.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String name = request.getParameter("name");
		String memo = request.getParameter("content");
		VisitorDAO dao = new VisitorDAO();
		VisitorVO vo = new VisitorVO();
		vo.setName(name);
		vo.setMemo(memo);
		boolean result = dao.insert(vo);
		if (result) {
			request.setAttribute("msg", name + "님의 글이 성공적으로 입력되었습니다.");
		} else {
			request.setAttribute("msg", name + "님의 글이 입력되지 않았습니다.");
		}
		request.getRequestDispatcher("/jspexam/visitorView.jsp").forward(request, response);
	}
}
