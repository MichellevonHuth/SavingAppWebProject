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


@WebServlet("/SavingAppControllerServlet")
public class SavingAppControllerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@EJB
	FacadeLocal facade;
	HttpSession session;
	
    public SavingAppControllerServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		
		String url = null;
		String operation = request.getParameter("operation");
		session = request.getSession();
		session.setAttribute("errorMessage", "");
		session.setAttribute("message", "");
		
		if(operation.equals("getSavingSchedules")) {
			
			try {
			ArrayList<SavingSchedule> savings = new ArrayList<SavingSchedule>();
			Account a = (Account)session.getAttribute("account");
			String username = a.getUsername();
				Account account = facade.findByAccountUsername(username);
					if(account != null) {
						for(SavingSchedule savingSchedule : account.getSavingschedules()) {
							if(savingSchedule!= null) {
								savings.add(savingSchedule);							
							}							
						}
						url = "/savingschedules.jsp";		
						request.setAttribute("getSavingSchedules", savings);
					}
			}catch(Exception e) {
				session.setAttribute("errorMessage", "Something went wrong, we can not load your saving goals");
			}
			
		}
		
		if(operation.equals("createAnSavingSchedule")) {
			doPost(request,response);	
		}
		
		if(operation.equals("toNew")) {
			session.setAttribute("message", "");
			url = "/new.jsp";
		}
		

		if(operation.equals("Save changes")) {
			doPut(request,response);
		}
		
		if(operation.equals("Delete user")) {
			doDelete(request,response);
		}
		if(operation.equals("toSettings")){
			Account a = (Account)request.getSession().getAttribute("account");
			String username = a.getUsername();
			Account account = facade.findByAccountUsername(username);
			session.setAttribute("account", account);
			url = "/settings.jsp";		
		}

		if(operation.equals("findAccount")) {
			try {
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
			}catch(Exception e) {
				session.setAttribute("errorMessage", "Something went wrong, try again later");
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
		session.setAttribute("message", "");
        
        if(operation.equals("addAccount")){
           try { 
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
			
           }catch(Exception e) {
        	  session.setAttribute("errorMessage", "There is already an account with this username, please select another");
        	  url ="/register.jsp";
           }                     
        } 
        
        if(operation.equals("createAnSavingSchedule")) {
        	try{			
				Account account = (Account)session.getAttribute("account");
				String username = account.getUsername();
				Account a =	facade.findByAccountUsername(username);
			
				double month = 0;			
				double fixedCost = a.getFixedCost();
				double income = a.getTotalIncome();
				double variableCost = a.getVariableCost();
				int savingDurationMonth = Integer.parseInt(request.getParameter("savingDurationMonthTextBox"));
				int savingDurationYear = Integer.parseInt(request.getParameter("savingDurationYearTextBox"));        
				double savingGoal = Double.parseDouble(request.getParameter("savingGoalTextBox"));
				String savingScheduleName = request.getParameter("savingScheduleNameTextBox");
				
				double costs = fixedCost + variableCost;
				double moneyLeft = income - costs;
	               
				if(savingDurationYear!= 0 && savingDurationMonth!=0) {
					month = (savingDurationYear*12)+savingDurationMonth;
				}
				else if(savingDurationYear!= 0 && savingDurationMonth==0) {
					month = (savingDurationYear*12);
				}
				else if(savingDurationYear== 0 && savingDurationMonth!=0) {
					month = savingDurationMonth;
				}
	        
				double moneySaving = savingGoal/month;
			
				double realisticAmountOfMonth = 0;
				
	        if(costs>income) {
	        	url = "/new.jsp";		
				session.setAttribute("errorMessage", "You have to many expenses, please reduce them to reach your goal");
	        }
	        
	        else if(moneySaving<=moneyLeft) {
	        		SavingSchedule s = new SavingSchedule();
	        		s.setSavingScheduleName(savingScheduleName);
	 	            s.setSavingGoal(savingGoal);
	 	            s.setSavingDurationYear(savingDurationYear);
	 	            s.setSavingDurationMonth(savingDurationMonth);
	 	            s.setBudget(moneySaving);
	 	            s.setAccount(a);
	 	            
	 	            facade.createSavingSchedule(s);
	 	            url="/new.jsp";
	 	            session.setAttribute("message", "Hurray! You have created a saving goal");        		
	        	}
	        	else {
	        		realisticAmountOfMonth=savingGoal/moneyLeft;
	        		url = "/new.jsp";		
					session.setAttribute("errorMessage", "You cant reach your goal within this duration, try " + realisticAmountOfMonth + " month instead");
	        	}
			}catch(Exception e) {
					url = "/new.jsp";		
					session.setAttribute("errorMessage", "Something went wrong, try again later");
			}
        }
        RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(url);
        dispatcher.forward(request, response);
    }


	protected void doPut(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		 String url = "";
		 session = request.getSession();
		 session.setAttribute("errorMessage", "");
		 session.setAttribute("message", "");
		 
		try {
		 Account account = (Account)session.getAttribute("account");
         String firstName = request.getParameter("firstnameTextBox");
         String surname = request.getParameter("surnameTextBox");
         double totalIncome = Double.parseDouble(request.getParameter("incomeTextBox"));
         double fixedCost = Double.parseDouble(request.getParameter("fixedCostTextBox"));
         double variableCost = Double.parseDouble(request.getParameter("variableCostTextBox"));
         
 
         Account a = facade.findByAccountUsername(account.getUsername());
         	if(a!=null) {
         	     a.setFirstName(firstName);
                 a.setSurname(surname);
                 a.setTotalIncome(totalIncome);
                 a.setFixedCost(fixedCost);
                 a.setVariableCost(variableCost);         
                 facade.updateAccount(a);
                 session.setAttribute("account", a);
                 session.setAttribute("message", "Your settings have been saved");
                 url = "/settings.jsp";
         	}
		}
		catch(Exception e) {
		session.setAttribute("errorMessage", "An unexpexted error has occured, try again later");
       	  url ="/settings.jsp";
		}
         
            RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(url);
            dispatcher.forward(request, response);
 
	}

	protected void doDelete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String url="";
		session.setAttribute("message", "");
		
		try {
		
		Account account = (Account)request.getSession().getAttribute("account");
		String username = account.getUsername();
		Account a = facade.findByAccountUsername(username);
   	 	   	 		 
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
	    	 
		} catch(Exception e) {
			session.setAttribute("errorMessage", "A unexpexted error has occured, try again later");
	       	url = "/settings.jsp";
		}
		
		
	    RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(url);
        dispatcher.forward(request, response);
		
	}

}
