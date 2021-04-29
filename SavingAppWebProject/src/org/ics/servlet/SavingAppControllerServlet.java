package org.ics.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Set;

import javax.ejb.EJB;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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
	HttpSession session;
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
		session = request.getSession();
		
		
		if(operation.equals("getSavingSchedules")) {
			ArrayList<SavingSchedule> savings = new ArrayList<SavingSchedule>();
			Account a = (Account)session.getAttribute("account");
			String username = a.getUsername();
				Account account = facade.findByAccountUsername(username);
					if(account != null) {
						for(SavingSchedule savingSchedule : account.getSavingschedules()) {
							if(savingSchedule!= null) {
								savings.add(savingSchedule);
								savingSchedule.getSavingScheduleNbr();
								
							}
								
								
				}
						url = "/savingschedules.jsp";		
						request.setAttribute("getSavingSchedules", savings);
			}
		}
		
		if(operation.equals("createAnSavingSchedule")) {
			
			
			Account account = (Account)session.getAttribute("account");
			String username = account.getUsername();
			Account a =	facade.findByAccountUsername(username);
			System.out.println(username);
			
			int savingDuration = 0;
			
			double fixedCost = a.getFixedCost();
			double income = a.getTotalIncome();
			double variableCost = a.getVariableCost();
			String stringMonth = request.getParameter("savingDurationMonthTextBox");
			int savingDurationMonth;
			String stringYear = request.getParameter("savingDurationYearTextbox");
			int savingDurationYear;
			
			if(stringMonth == null || stringMonth.equals("")) {
				savingDurationMonth = 0; 				
			} else {
				savingDurationMonth = Integer.parseInt(stringMonth);
			}
		
			if(stringYear == null || stringYear.equals("")) {
				savingDurationYear = 0;
			}else {
				savingDurationYear = Integer.parseInt(stringYear);
			}
			
	        double savingGoal = Double.parseDouble(request.getParameter("savingGoalTextBox")); 
	        String savingScheduleName = request.getParameter("savingScheduleNameTextBox");
	        
	        double costs = fixedCost - variableCost;
	        double moneyLeft = income - costs;
	        
	       
	        if(savingDurationYear!= 0 && savingDurationMonth!=0) {
	        	savingDuration = (savingDurationYear*12)+savingDurationMonth;
	        }
	        else if(savingDurationYear!= 0 && savingDurationMonth==0) {
	        	savingDuration = (savingDurationYear*12);
	        }
	        else if(savingDurationYear== 0 && savingDurationMonth!=0) {
	        	savingDuration = savingDurationMonth;
	        }
	        
	        double moneySaving = savingGoal/savingDuration;
	        double howManyMonths = 0;
	        
	        	if(moneySaving<moneyLeft) {
	        		SavingSchedule s = new SavingSchedule();
	        		s.setSavingScheduleName(savingScheduleName);
	 	            s.setSavingGoal(savingGoal);
	 	            s.setSavingDurationYear(savingDurationYear);
	 	            s.setSavingDurationMonth(savingDurationMonth);
	 	            s.setBudget(moneySaving);
	 	            s.setAccount(a);
	 	            
	 	            facade.createSavingSchedule(s);
	 	            url="/new.jsp";
	        		
	        	}
	        	
	        	else {
	        		howManyMonths=savingGoal/moneyLeft;
	        		url = "/new.jsp";		
					request.setAttribute("howManyMonths", howManyMonths);
	        	}
			
		}
		

		if(operation.equals("Save changes")) {
			doPut(request,response);

		}
		
		if(operation.equals("Delete user")) {
			doDelete(request,response);
		}

		
		if(operation.equals("getUsername")) {
			String username = (String)session.getAttribute("getUsername");
			Account account = facade.findByAccountUsername(username);
			if(account != null) {
				
				String firstname = account.getFirstName();
				String surname = account.getSurname();
				String totalIncome = Double.toString(account.getTotalIncome());
				String variableCost = Double.toString(account.getVariableCost());
				String fixedCost = Double.toString(account.getFixedCost());
				
				session.setAttribute("getFirstname", firstname);
				session.setAttribute("getSurname", surname);
				session.setAttribute("getTotalIncome", totalIncome);
				session.setAttribute("getVariableCost", variableCost);
				session.setAttribute("getFixedCost", fixedCost);
			}
			url="/settings.jsp";
				
		}
		
		if(operation.equals("findAccount")) {
			
			String username = request.getParameter("userNameTextField");
			Account a = facade.findByAccountUsername(username);
				if(a !=null) {
					url ="/home.jsp";
					session.setAttribute("account", a);
				}
				
				else {	
					String s = "The user doesn't exist, please register";
					request.setAttribute("ErrorLogIn", s);
					url ="/start.jsp";
								
				}
		}
		
		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(url);
		dispatcher.forward(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
        String operation = request.getParameter("operation");
        String url = null;
        session = request.getSession();
        session.setAttribute("errorMessage", "");
        
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
            session.setAttribute("account", a);
			url ="/home.jsp";
            
        }
        
        
        RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(url);
        dispatcher.forward(request, response);
    }


	protected void doPut(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		 String url = "";
		 Account account = (Account)session.getAttribute("account");
		 String username = account.getUsername();
         String firstName = request.getParameter("firstnameTextBox");
         String surname = request.getParameter("surnameTextBox");
         double totalIncome = Double.parseDouble(request.getParameter("incomeTextBox"));
         double fixedCost = Double.parseDouble(request.getParameter("fixedCostTextBox"));
         double variableCost = Double.parseDouble(request.getParameter("variableCostTextBox"));
         session = request.getSession();
 
         Account a = facade.findByAccountUsername(username);
         	if(a!=null) {
         	     a.setFirstName(firstName);
                 a.setSurname(surname);
                 a.setTotalIncome(totalIncome);
                 a.setFixedCost(fixedCost);
                 a.setVariableCost(variableCost);         
                 facade.updateAccount(a);
                 session.setAttribute("account", a);
                 
                 url = "/settings.jsp";
         	}
         
            RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(url);
            dispatcher.forward(request, response);
 
	}

	/**
	 * @see HttpServlet#doDelete(HttpServletRequest, HttpServletResponse)
	 */
	protected void doDelete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String operation = request.getParameter("operation");
		Account account = (Account)request.getSession().getAttribute("account");
		String username = account.getUsername();
		Account a = facade.findByAccountUsername(username);
   	 	String url="";
   	 		 
	    	 if(a!= null) {
	    		 for(SavingSchedule s : a.getSavingschedules()) {
	    			 facade.deleteSavingSchedule(s.getSavingScheduleNbr());
	    		 }
	    		 facade.deleteAccount(username);
	    		 url="/start.jsp";
	    	 }
	    	 
	    	 else {
	    		 url="/settings.jsp";
	    	 }
		

	  
	    RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(url);
        dispatcher.forward(request, response);
		
	}

}
