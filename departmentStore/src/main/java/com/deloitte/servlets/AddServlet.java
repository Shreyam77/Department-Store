package com.deloitte.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import com.deloitte.Item;
import com.deloitte.dao.ItemDao;
import com.deloitte.util.HibernateHelper;

/**
 *
 * @author Mini Project - Group 6
 */
public class AddServlet extends HttpServlet {

	/**
	 * this method takes input from html form and performs further operations
	 */
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		// Taking database values into local variables
		String code = request.getParameter("inventoryCode").trim();
		String name = request.getParameter("inventoryName").trim();
		Float qty = Float.parseFloat(request.getParameter("quantity"));
		Float price = Float.parseFloat(request.getParameter("unitPrice"));

		HttpSession session = request.getSession();
		PrintWriter out = response.getWriter();

		int res = 0;

		// Creating a new Entity object
		ItemDao iDao = new ItemDao();
		List<Item> i1 = iDao.fetchItem();
		for (Item i : i1) {
			// checking for same invtCode
			if (i.getInvtCode().equals(code)) {
				session.setAttribute("warning", "Inventory Code :" + i.getInvtCode() + " - Already Exists");
				response.sendRedirect("addItem.jsp");
				return;
			}
		}

		// Null Check
		if (code.isEmpty()) {
			out.println("No item in the list");
		} else {

			Item i = new Item(code, name, qty, price);
			res = iDao.addItem(i);

			if (res != 0) {
				session.setAttribute("success", i.getInvtName() + " item added in Inventory");
				response.sendRedirect("itemList.jsp");
				return;
			}
		}
	}
}
