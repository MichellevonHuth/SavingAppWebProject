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
import org.ics.ejb.*;
import org.ics.facade.*;

/**
 * Servlet implementation class Movies
 */

@WebServlet("/SavingAppServlet/*")
public class SavingAppServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@EJB
	FacadeLocal facade;

	public SavingAppServlet() {

		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String pathInfo = request.getPathInfo();
		String[] splits = pathInfo.split("/");
		

		if(splits.length != 2) {
			response.sendError(HttpServletResponse.SC_BAD_REQUEST);
			return;

		}

		String id = splits[1];
		Account account = facade.findByAccountUsername(id);
		sendAsJson(response, account.getSavingschedules()); 

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String pathInfo = request.getPathInfo();
		System.out.println(request.getPathInfo());

		if(pathInfo == null || pathInfo.equals("")){

			BufferedReader reader = request.getReader();//Läs data Json
			SavingSchedule s = parseJsonSavingSchedule(reader);
			
			try {
				s = facade.createSavingSchedule(s);
			}
			catch(Exception e) {
				System.out.println("duplicate key");
			}

			sendAsJson(response, s);
		}
		
		if(pathInfo == null || pathInfo.equals("/")){

			BufferedReader reader = request.getReader();//Läs data Json
			Account a = parseJsonAccount(reader);
			
			try {
				a = facade.createAccount(a);

			}catch(Exception e) {
				System.out.println("duplicate key");
			}

			sendAsJson(response, a);
		}

	}

	protected void doPut(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String pathInfo = request.getPathInfo();
		if(pathInfo == null || pathInfo.equals("/")){

			response.sendError(HttpServletResponse.SC_BAD_REQUEST);
			return;

		}

		String[] splits = pathInfo.split("/");
		if(splits.length != 2) {
			response.sendError(HttpServletResponse.SC_BAD_REQUEST);
			return;

		}
		
		BufferedReader reader = request.getReader();
		Account a = parseJsonAccount(reader);
		
		//Uppdatera i db

		try {

			a = facade.updateAccount(a);

		}catch(Exception e) {

			System.out.println("facade Update Error");

		}

		sendAsJson(response, a);

	}

	protected void doDelete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String pathInfo = request.getPathInfo();
		if(pathInfo == null || pathInfo.equals("/")){
			response.sendError(HttpServletResponse.SC_BAD_REQUEST);
			return;
		}

		String[] splits = pathInfo.split("/");
		if(splits.length != 2) {
			response.sendError(HttpServletResponse.SC_BAD_REQUEST);
			return;

		}

		String id = splits[1];
		Account account = facade.findByAccountUsername(id);
		
		if (account != null) {
			for(SavingSchedule s : account.getSavingschedules()) {
				facade.deleteSavingSchedule(s.getSavingScheduleNbr());
			}
			facade.deleteAccount(id);
		}	
		sendAsJson(response, account);	
	}

	private void sendAsJson(HttpServletResponse response, Account account) throws IOException {
			
		PrintWriter out = response.getWriter();
		response.setContentType("application/json"); 

		if (account != null) {
			out.print("{\"title\":");
			out.print("\"" + account.getUsername() + "\"");
			out.print(",\"id\":");
			out.print("\"" +account.getSurname()+"\"");
			out.print(",\"price\":");
			out.print("\"" +account.getFirstName()+"\"}");

		} else {
			out.print("{ }");
		}
		out.flush();

	}
	
	private void sendAsJson(HttpServletResponse response, SavingSchedule savingschedule) throws IOException {
		
		PrintWriter out = response.getWriter();
		response.setContentType("application/json"); 

		if (savingschedule != null) {
			out.print("{\"title\":");
			out.print("\"" +savingschedule.getSavingScheduleName()+ "\"");
			out.print(",\"id\":");
			out.print("\"" +savingschedule.getSavingGoal()+"\"");
			out.print(",\"price\":");
			out.print("\"" +savingschedule.getAccount()+"\"}");

		} else {
			out.print("{ }");
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
					o.add("Savingschedule number", s.getSavingScheduleNbr());
					o.add("Name:", s.getSavingScheduleName());
					o.add("Saving goal:",String.valueOf(s.getSavingGoal()));
					array.add(o);
			}

			JsonArray jsonArray = array.build();
			out.print(jsonArray.toString());
			System.out.println("Accounts rest: "+jsonArray.toString());

		} else {
			out.print("[]");

		}
			out.flush(); 

	}

	private Account parseJsonAccount(BufferedReader br) {

		JsonReader jsonReader = null;
		JsonObject jsonRoot = null;
		jsonReader = Json.createReader(br);
		jsonRoot = jsonReader.readObject();

		System.out.println("JsonRoot: "+jsonRoot);

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

		System.out.println("JsonRoot: "+jsonRoot);
		
		SavingSchedule savingSchedule = new SavingSchedule();
		Account a = facade.findByAccountUsername(jsonRoot.getString("username"));
		savingSchedule.setAccount(a);
		savingSchedule.setSavingScheduleName(jsonRoot.getString("name"));
		savingSchedule.setSavingGoal(Double.parseDouble(jsonRoot.getString("goal")));
		savingSchedule.setSavingDurationYear(Integer.parseInt(jsonRoot.getString("year")));
		savingSchedule.setSavingDurationYear(Integer.parseInt(jsonRoot.getString("month")));

		return savingSchedule;

		}
	}