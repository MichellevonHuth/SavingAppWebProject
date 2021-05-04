package org.ics.servlet;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.PrintWriter;

import javax.ejb.EJB;
import javax.json.Json;
import javax.json.JsonObject;
import javax.json.JsonReader;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.ics.ejb.Account;
import org.ics.ejb.SavingSchedule;
import org.ics.facade.FacadeLocal;

/**
 * Servlet implementation class SavingSchedules
 */
@WebServlet("/SavingSchedules/*")
public class SavingSchedules extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    @EJB
    FacadeLocal facade;
    
    public SavingSchedules() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String pathInfo = request.getPathInfo();
		
		if(pathInfo == null || pathInfo.equals("/")){

			BufferedReader reader = request.getReader();
			SavingSchedule s = parseJsonSavingSchedule(reader);
			
			try {
				s = facade.createSavingSchedule(s);
			}
			catch(Exception ex) {
				response.sendError(HttpServletResponse.SC_BAD_REQUEST);
				return;
			}

			sendAsJson(response, s);
		}
	}

	/**
	 * @see HttpServlet#doPut(HttpServletRequest, HttpServletResponse)
	 */
	protected void doPut(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}
	
	private void sendAsJson(HttpServletResponse response, SavingSchedule savingschedule) throws IOException {
		
		PrintWriter out = response.getWriter();
		response.setContentType("application/json"); 

		if (savingschedule != null) {
			out.print("\"" +"SavingSchedule added"+ "\"");

		} else {
			out.print("\"" +"This username doesn't exists"+ "\"");
		}
		out.flush();

	}
	
	private SavingSchedule parseJsonSavingSchedule(BufferedReader br) {

		JsonReader jsonReader = null;
		JsonObject jsonRoot = null;
		jsonReader = Json.createReader(br);
		jsonRoot = jsonReader.readObject();
		
		Account a = facade.findByAccountUsername(jsonRoot.getString("usernameS"));
		SavingSchedule savingSchedule = new SavingSchedule();

		int savingDuration = 0;
		
		double fixedCost = a.getFixedCost();
		double income = a.getTotalIncome();
		double variableCost = a.getVariableCost();
		
		double costs = fixedCost + variableCost;
        double moneyLeft = income - costs;
        
    	double goal = Double.parseDouble(jsonRoot.getString("goal"));
    	int year = Integer.parseInt(jsonRoot.getString("year"));
    	int month = Integer.parseInt(jsonRoot.getString("month"));
    	
        if(year!= 0 && month!=0) {
        	savingDuration = (year*12)+month;
        }
        else if(year!= 0 && month==0) {
        	savingDuration = year*12;
        }
        else if(year== 0 && month!=0) {
        	savingDuration = month;
        }
        
        double moneySaving = goal/savingDuration;
        		savingSchedule.setAccount(a);
        		savingSchedule.setSavingScheduleName(jsonRoot.getString("name"));
        		savingSchedule.setSavingGoal(goal);
        		savingSchedule.setSavingDurationYear(year);
        		savingSchedule.setSavingDurationMonth(month);
        		savingSchedule.setBudget(moneySaving);
        
		return savingSchedule;
		}
}


