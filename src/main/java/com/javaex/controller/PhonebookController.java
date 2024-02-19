package com.javaex.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.javaex.dao.PhoneDao;
import com.javaex.vo.PersonVo;

/**
 * Servlet implementation class PhonebookController
 */
@WebServlet("/pbc")
public class PhonebookController extends HttpServlet {
	
	//필드
	private static final long serialVersionUID = 1L;
       
    //생성자
	//메소드 - g/s
	
	//메소드 - 일반
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("PhonebookController.goGet()");
		
		String action = request.getParameter("action");
		System.out.println(action);
		
		if("wform".equals(action)) {
			System.out.println("wform: 등록폼");
			
			//jsp 한테 html그리기 응답해라 --> 포워드
			RequestDispatcher rd = request.getRequestDispatcher("/writeForm.jsp");
			rd.forward(request, response);
			
		} else if("insert".equals(action)) {
			System.out.println("insert: 등록");
			
			String name = request.getParameter("name");
			String hp = request.getParameter("hp");
			String company = request.getParameter("company");
			
			System.out.println(name);
			System.out.println(hp);
			System.out.println(company);
			
			// vo로 묶기
			PersonVo personVo = new PersonVo(name, hp, company);
			System.out.println(personVo.toString());
			
			//db관련 업무
			PhoneDao phoneDao = new PhoneDao();
			
			//db에 저장
			phoneDao.personInsert(personVo);
			
			//db에서 전체 데이터 가져오기
			List<PersonVo> personList = phoneDao.personSelect();
			System.out.println(personList);
			
			//request에 담기
			request.setAttribute("personList", personList);
			
			//jsp 한테 html그리기 응답해라 --> 포워드
			RequestDispatcher rd = request.getRequestDispatcher("/list.jsp");
			rd.forward(request, response);
			
		}
		
		
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
