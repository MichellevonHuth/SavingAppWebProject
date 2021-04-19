package org.ics.servlet;

import java.io.IOException;

import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.ics.ejb.Account;
import org.ics.facade.FacadeLocal;

/**
 * Servlet implementation class SavingAppTest
 */
@WebServlet("/SavingAppTest")
public class SavingAppTest extends HttpServlet {
	private static final long serialVersionUID = 1L;
     @EJB
     FacadeLocal facade;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SavingAppTest() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		Account a = new Account();
		facade.deleteAccount("25");
		
	}

}
