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
		a.setUsername("97");
		a.setFirstName("Filippa");
		a.setSurname("Carlsson");
		a.setFixedCost(10000);
		a.setVariableCost(10000);
		a.setTotalIncome(10000);
		facade.createAccount(a);
		
		SavingSchedule s = new SavingSchedule();
		s.setAccount(a);
		s.setSavingDurationMonth(123);
		s.setSavingDurationYear(1);
		s.setSavingGoal(10000);
		s.setSavingScheduleNbr("33");
		facade.createSavingSchedule(s);
		
		SavingSchedule s1 = new SavingSchedule();
		s1.setAccount(a);
		s1.setSavingDurationMonth(12);
		s1.setSavingDurationYear(12);
		s1.setSavingGoal(5000);
		s1.setSavingScheduleNbr("44");
		facade.createSavingSchedule(s1);
		
		if(a!= null) {
			out.println("<br>"+"***Account found and changed***");
			a.setFirstName("Filip");
			s.setSavingGoal(1);
			out.println("<br>" + "The name has changed to " + a.getFirstName());
			
		}
		else {
			out.println("<br>"+"***Account not found***");
		}
		
		facade.updateAccount(a);
		facade.updateSavingSchedule(s);
		// check the database 
		
		out.println("<br>"+"***Show saving schedules***");
		out.println("</body></html>");
		
	}
	
}
