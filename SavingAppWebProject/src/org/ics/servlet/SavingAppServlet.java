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

	/**

	 * @see HttpServlet#HttpServlet()

	 */

	public SavingAppServlet() {

		super();

		// TODO Auto-generated constructor stub

	}



	/**

	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)

	 */

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		// TODO Auto-generated method stub

		//response.getWriter().append("Served at: ").append(request.getContextPath());

		//response.getWriter().append("Movies ");



		String pathInfo = request.getPathInfo();

		/*/if(pathInfo == null || pathInfo.equals("/")){

			System.out.println("Alla");

			System.out.println(pathInfo);



			List<.ejb.ics.Movie> allMovies = facade.findAllMovies();

			sendAsJson(response, allMovies);

			return;

		}/*/

		String[] splits = pathInfo.split("/");

		if(splits.length != 2) {

			System.out.println("Alla2");

			response.sendError(HttpServletResponse.SC_BAD_REQUEST);

			return;

		}

		String id = splits[1];
		Account account = facade.findByAccountUsername(id);
		sendAsJson(response, account.getSavingschedules()); 

	}



	/**

	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)

	 */

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		// TODO Auto-generated method stub

		//doGet(request, response);

		String pathInfo = request.getPathInfo();

		if(pathInfo == null || pathInfo.equals("/")){

			BufferedReader reader = request.getReader();//Läs data Json
			
			SavingSchedule s = parseJsonSavingSchedule(reader);
			Account a = parseJsonAccount(reader);

			try {

				a = facade.createAccount(a);
				s = facade.createSavingSchedule(s);

			}catch(Exception e) {

				System.out.println("duplicate key");

			}

			sendAsJson(response, a);

		}

	}



	/**

	 * @see HttpServlet#doPut(HttpServletRequest, HttpServletResponse)

	 */

	protected void doPut(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		// TODO Auto-generated method stub

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
		BufferedReader reader = request.getReader();
		SavingSchedule s = parseJsonSavingSchedule(reader);
		Account a = parseJsonAccount(reader);

		//Uppdatera i db

		try {

			a = facade.updateAccount(a);
			s = facade.updateSavingSchedule(s);

		}catch(Exception e) {

			System.out.println("facade Update Error");

		}

		sendAsJson(response, a);

	}
	/**
	 * @see HttpServlet#doDelete(HttpServletRequest, HttpServletResponse)
	 */

	protected void doDelete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		// TODO Auto-generated method stub

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



	private void sendAsJson(HttpServletResponse response, Set<SavingSchedule> accounts) throws IOException {

		PrintWriter out = response.getWriter();
		response.setContentType("application/json");

			if (accounts != null) {
				JsonArrayBuilder array = Json.createArrayBuilder();

				for (org.ics.ejb.SavingSchedule s : accounts) {
					JsonObjectBuilder o = Json.createObjectBuilder();
					o.add("id", s.getSavingScheduleName());
					o.add("title",String.valueOf(s.getSavingGoal()));
					array.add(o);
			}

			JsonArray jsonArray = array.build();
			System.out.println("Accounts rest: "+jsonArray);
			out.print(jsonArray);

		} else {
			out.print("[]");

		}
			out.flush(); 

	}



	private Account parseJsonAccount(BufferedReader br) {

		//javax.json-1.0.4.jar

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

		//javax.json-1.0.4.jar

		JsonReader jsonReader = null;
		JsonObject jsonRoot = null;

		jsonReader = Json.createReader(br);
		jsonRoot = jsonReader.readObject();

		System.out.println("JsonRoot: "+jsonRoot);
		
		SavingSchedule savingSchedule = new SavingSchedule();
		Account account = savingSchedule.getAccount();
		savingSchedule.setSavingScheduleName(jsonRoot.getString("name"));
		savingSchedule.setSavingGoal(Double.parseDouble(jsonRoot.getString("goal")));
		savingSchedule.setSavingDurationYear(Integer.parseInt(jsonRoot.getString("year")));
		savingSchedule.setSavingDurationYear(Integer.parseInt(jsonRoot.getString("month")));
		savingSchedule.setAccount(account);

		return savingSchedule;

	}
}