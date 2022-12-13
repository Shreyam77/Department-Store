package com.deloitte.servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.deloitte.dao.ItemDao;

/**
 *
 * @author Mini Project - Group 6
 */
public class EditServlet extends HttpServlet {
	
	/*
	 * this method takes input from html forms and peforms further operations
	 */	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		//Taking form values in local variables
		String id = request.getParameter("invtId");
		Float qty = null;
		Float price = null;
		try {
			qty = Float.parseFloat(request.getParameter("quantity"));
			price = Float.parseFloat(request.getParameter("price"));
		} catch (NumberFormatException e1) {
			e1.printStackTrace();
		}

		/*
		 * Creating an entity object
		 */		
		ItemDao iDao = new ItemDao();
		int result = iDao.editItem(id, qty, price);
		
		HttpSession session = request.getSession();

		//Submitting response to session variables
		try {
			if (result == 1) {
				session.setAttribute("success", id + " items updated Successfully !!");
				response.sendRedirect("itemList.jsp");
			} else {
				session.setAttribute("warning",id + " items NOT updated Successfully !!");
				response.sendRedirect("itemList.jsp");
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

}
