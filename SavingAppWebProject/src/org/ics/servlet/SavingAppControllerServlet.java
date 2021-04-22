package org.ics.servlet;

import java.io.IOException;

import javax.ejb.EJB;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.ics.ejb.Account;
import org.ics.ejb.SavingSchedule;
import org.ics.facade.FacadeLocal;

/**
 * Servlet implementation class SavingAppControllerServlet
 */
@WebServlet("/SavingAppControllerServlet")
public class SavingAppControllerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@EJB
	FacadeLocal facade;
    public SavingAppControllerServlet() {
        super();
        // TODO Auto-generated constructor stub
    }
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		String url = null;
		String operation = request.getParameter("operation");
		if(operation.equals("findAccount")) {
			
			String username = request.getParameter("userNameTextField");
			Account a = facade.findByAccountUsername(username);
				if(a !=null) {
					String name = a.getFirstName();
					String user = a.getUsername();
					url ="/home.jsp";
					request.setAttribute("getName", name);
					request.setAttribute("getUsername", user);
				}
				else {			
					url ="/start.jsp";
					
				}
		}
		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(url);
		dispatcher.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//doGet(request, response);
		
		 // TODO Auto-generated method stub
        //doGet(request, response);
        
        String operation = request.getParameter("operation");
        String url = null;
        
        if(operation.equals("addAccount")){
            
            String username = request.getParameter("usernameTextBox");
            String firstName = request.getParameter("firstnameTextBox");
            String surname = request.getParameter("surnameTextBox");
            double totalIncome = Double.parseDouble(request.getParameter("incomeTextBox"));
            double fixedCost = Double.parseDouble(request.getParameter("fixedCostTextBox"));
            double variableCost = Double.parseDouble(request.getParameter("variableCostTextBox"));
            
            Account a = new Account();
            
            a.setUsername(username);
            a.setFirstName(firstName);
            a.setSurname(surname);
            a.setTotalIncome(totalIncome);
            a.setFixedCost(fixedCost);
            a.setVariableCost(variableCost);
            
            facade.createAccount(a);
            url="/settings.jsp";
            
        }
        
        if(operation.equals("addSaving")) {

            String savingScheduleName = request.getParameter("savingScheduleNameTextBox");
            double savingGoal = Double.parseDouble(request.getParameter("savingGoalTextBox"));
            int savingDurationYear = Integer.parseInt(request.getParameter("savingDurationYearTextBox"));
            int savingDurationMonth = Integer.parseInt(request.getParameter("savingDurationMonthTextBox"));
            String username = request.getParameter("savingScheduleUsernameTextBox");

            Account a = facade.findByAccountUsername(username);
            SavingSchedule s = new SavingSchedule();
            
            s.setSavingScheduleName(savingScheduleName);
            s.setSavingGoal(savingGoal);
            s.setSavingDurationYear(savingDurationYear);
            s.setSavingDurationMonth(savingDurationMonth);
            s.setAccount(a);
            
            facade.createSavingSchedule(s);
            url="/new.jsp";
            }
        
        RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(url);
        dispatcher.forward(request, response);
    }

	/**
	 * @see HttpServlet#doPut(HttpServletRequest, HttpServletResponse)
	 */
	protected void doPut(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
	}

	/**
	 * @see HttpServlet#doDelete(HttpServletRequest, HttpServletResponse)
	 */
	protected void doDelete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 
		String operation = request.getParameter("operation");
	    String url = null;
	    
	    if(operation.equals("deleteUser")) {
	    	 String username = request.getParameter("usernameTextBox");
	    	 Account a = facade.findByAccountUsername(username);
	    	 
	    	 if(a!= null) {
	    		 facade.deleteAccount(username);
	    		 url="/start.jsp";
	    	 }
	    	 
	    	 else {
	    		 url="/settings.jsp";
	    	 }
	    	
	    }
	    RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(url);
        dispatcher.forward(request, response);
		
	}

}
