package org.ics.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.ics.ejb.Account;
import org.ics.ejb.SavingSchedule;
import org.ics.facade.FacadeLocal;

/**
 * Servlet implementation class SavingAppServlet
 */
@WebServlet("/SavingAppServlet")
public class SavingAppServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	@EJB
	private FacadeLocal facade;
 
    public SavingAppServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		PrintWriter out = response.getWriter();
		
		out.println("<!DOCTYPE html><html><head>");
		out.println("<title>Lab4</title>");
		out.println("<meta charset=\"ISO-8859-1\">");
		out.println("</head><body>");
		
		out.println("<h3>Account och SavingSchedule</h3>"+"<br>");
		//out.println("** Create Customer **");
		
		Account a = new Account();
		a.setUsername("123");
		a.setFirstName("Ida");
		a.setSurname("Carlsson");
		a.setFixedCost(10000);
		a.setVariableCost(10000);
		a.setTotalIncome(10000);
		
		//facade.createAccount(a);
		
		out.println("<br>"+"***Show saving schedules***");

		
		if(a != null) {
			facade.updateAccount(a);
			a.setFirstName("Filippa");
			out.println("<br>");
			out.println("For customer: "+ a.getFirstName());
			out.println("<br>");
			
			for(SavingSchedule tmp : a.getSavingschedules()) {
				out.println(tmp.getSavingScheduleNbr());
				out.println(tmp.getSavingGoal());
				out.println("<br>");
				}			
			}
		out.println("</body></html>");
		
	}
	
}
