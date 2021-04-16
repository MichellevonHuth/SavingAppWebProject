package org.ics.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.ejb.EJB;
import javax.json.Json;
import javax.json.JsonArray;
import javax.json.JsonArrayBuilder;
import javax.json.JsonObjectBuilder;
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
@WebServlet("/SavingAppServlet/*")
public class SavingAppServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
  
	@EJB 
	FacadeLocal facade; 
 
	
    public SavingAppServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String pathInfo= request.getPathInfo();
		
		if(pathInfo== null|| pathInfo.equals("/")){
			System.out.println("Alla");
			System.out.println(pathInfo);
						
			Account account = facade.findByAccountUsername("ida");
			sendAsJson(response, account); 
			
			return;
		}
		
		String[] splits = pathInfo.split("/");
		
		if(splits.length!= 2) {
			System.out.println("Alla2");
			response.sendError(HttpServletResponse.SC_BAD_REQUEST);
			return;
		}
		
		//Account account = facade.findByAccountUsername(username);
		//sendAsJson(response, account);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
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

		String pathInfo= request.getPathInfo();
		
		if(pathInfo== null|| pathInfo.equals("/")){
			response.sendError(HttpServletResponse.SC_BAD_REQUEST);
			return;
		}
		
		String[] splits= pathInfo.split("/");
		
		if(splits.length!= 2) {
			response.sendError(HttpServletResponse.SC_BAD_REQUEST);
			return;
		}
		
		String username = splits[1];
		Account account = facade.findByAccountUsername(username);
		
		if(account!= null) {
			facade.deleteAccount(username);
		}
		
		sendAsJson(response, account);
	}
	
	private void sendAsJson(HttpServletResponse response, Account account) throws IOException {
		PrintWriter out= response.getWriter();
		response.setContentType("application/json");
		
		if(account!= null) {
			out.print("{\"Username:\":");
			out.print("\""+ account.getUsername() + "\"");
			out.print(",\"First name\":");out.print("\""+ account.getFirstName()+"\"");
			out.print(",\"Surname:\":");out.print("\""+ account.getSurname()+"\"}");
		} else{	
			out.print("{ }");
			}
		
		out.flush();
	}
	
	/*/
	private void sendAsJson(HttpServletResponse response, Account account) throws IOException {
		PrintWriter out= response.getWriter();
		response.setContentType("application/json");
		
		if(account!= null) {
			JsonArrayBuilder array= Json.createArrayBuilder();

			for(org.ics.ejb.SavingSchedule s: account.getSavingschedules()) {
				JsonObjectBuilder o= Json.createObjectBuilder();
				o.add("Number", s.getSavingScheduleNbr());
				o.add("Name", s.getSavingScheduleName());
				o.add("Username", s.getAccount().getUsername());
				array.add(o);
			}
			
			JsonArray jsonArray= array.build();
			System.out.println("SavingSchedule Rest: "+jsonArray);
			out.print(jsonArray);
			} else{
				out.print("[]");			
			}
		
		out.flush();} /*/
	
}

