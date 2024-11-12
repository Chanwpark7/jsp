package myweb.mvc2board.controller;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;


public class MVC2BoardWrite extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//얘는 Viewer 만 호출해서 폼만 띄우는 역할만 함.
		req.getRequestDispatcher("writeForm.jsp").forward(req, resp);
	}
}
