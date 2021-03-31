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
		a.setUsername("25");
		a.setFirstName("Matilda");
		a.setSurname("Carlsson");
		a.setFixedCost(10000);
		a.setVariableCost(10000);
		a.setTotalIncome(10000);
		facade.createAccount(a);
		
		SavingSchedule s = new SavingSchedule();
		s.setAccount(a);
		s.setSavingScheduleName("Körkort");
		s.setSavingDurationMonth(123);
		s.setSavingDurationYear(1);
		s.setSavingGoal(10000);
		facade.createSavingSchedule(s);
		
		SavingSchedule s1 = new SavingSchedule();
		s1.setSavingScheduleName("körkort");
		s1.setAccount(a);
		s1.setSavingDurationMonth(12);
		s1.setSavingDurationYear(12);
		s1.setSavingGoal(5000);
		facade.createSavingSchedule(s1);
		
		Account a1 = facade.findByAccountUsername("25");
		if(a1 != null ) {
			out.println(a1.getFirstName() + " " + a.getSurname());
			out.println("<br>"+"***Show saving schedules***");
			out.println(a1.getSavingschedules());
		}

		out.println("</body></html>");
		
	}
	
}
