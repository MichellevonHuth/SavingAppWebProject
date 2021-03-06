package org.ics.servlet;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Set;

import javax.ejb.EJB;
import javax.json.Json;
import javax.json.JsonArray;
import javax.json.JsonArrayBuilder;
import javax.json.JsonObject;
import javax.json.JsonObjectBuilder;
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
 * Servlet implementation class Accounts
 */
@WebServlet("/Accounts/*")
public class Accounts extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@EJB
	FacadeLocal facade;

	public Accounts() {

		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String pathInfo = request.getPathInfo();
		String[] splits = pathInfo.split("/");
		
		try {
			String id = splits[1];
			Account account = facade.findByAccountUsername(id);
			sendAsJson(response, account.getSavingschedules());
			}
			
		 catch(Exception e) {
			response.sendError(HttpServletResponse.SC_BAD_REQUEST);
			return;
		}

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String pathInfo = request.getPathInfo();

		if(pathInfo == null || pathInfo.equals("")){

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
		
		if(pathInfo == null || pathInfo.equals("/")){

			BufferedReader reader = request.getReader();//L?s data Json
			Account a = parseJsonAccount(reader);
			
			try {
				a = facade.createAccount(a);
				
			}catch(Exception e) {
				response.sendError(HttpServletResponse.SC_BAD_REQUEST);
				return;
			}
			sendAsJson(response, a);
		}

	}

	protected void doPut(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		

	}

	protected void doDelete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String pathInfo = request.getPathInfo();
		String[] splits = pathInfo.split("/");
		
		String id = splits[1];
		
		
		try {
		Account account = facade.findByAccountUsername(id);
			if (account != null) {
				for(SavingSchedule s : account.getSavingschedules()) {
					facade.deleteSavingSchedule(s.getSavingScheduleNbr());
				}
				facade.deleteAccount(id);
				sendAsJson(response, account);
			}
			else {
				response.sendError(HttpServletResponse.SC_BAD_REQUEST);
				return;
			}
		} catch (Exception e) {
			response.sendError(HttpServletResponse.SC_BAD_REQUEST);
			return;
		}		
	}

 private void sendAsJson(HttpServletResponse response, Account account) throws IOException {
		
		PrintWriter out = response.getWriter();
		response.setContentType("application/json"); 

		if (account != null) {
			
			out.print("\"" + "Account added"+ "\"");
		

		} else {
			out.print("\"" + "The user you are trying to add already exists"+ "\"");
		}
		out.flush();

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
	private void sendAsJson(HttpServletResponse response, Set<SavingSchedule> accounts) throws IOException {
		
		PrintWriter out = response.getWriter();
		response.setContentType("application/json");

			if (accounts != null) {
				JsonArrayBuilder array = Json.createArrayBuilder();

				for (org.ics.ejb.SavingSchedule s : accounts) {
					JsonObjectBuilder o = Json.createObjectBuilder();
					o.add("Name", s.getSavingScheduleName());
					o.add("SavingGoal",String.valueOf(s.getSavingGoal()));
					array.add(o);
			}

			JsonArray jsonArray = array.build();
			out.print(jsonArray.toString());

		} else {
			out.print("This account doesn't exist");

		}
			out.flush(); 

	}

	private Account parseJsonAccount(BufferedReader br) {

		JsonReader jsonReader = null;
		JsonObject jsonRoot = null;
		jsonReader = Json.createReader(br);
		jsonRoot = jsonReader.readObject();

	

		Account account = new Account();
		account.setUsername(jsonRoot.getString("id"));
		account.setFirstName(jsonRoot.getString("firstName"));
		account.setSurname(jsonRoot.getString("surname"));
		account.setTotalIncome(Integer.parseInt(jsonRoot.getString("totalIncome")));
		account.setVariableCost(Integer.parseInt(jsonRoot.getString("variableCost")));
		account.setFixedCost(Integer.parseInt(jsonRoot.getString("fixedCost")));
		
		return account;

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