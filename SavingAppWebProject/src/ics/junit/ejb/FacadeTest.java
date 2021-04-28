package ics.junit.ejb;

import org.ics.ejb.Account;
import org.ics.facade.FacadeLocal;

import javax.naming.Context;
import javax.naming.InitialContext;

import junit.framework.TestCase;

public class FacadeTest extends TestCase {

	FacadeLocal facade;
	
	Account a1;
	Account a2;

	String expectedUsername;
	String expectedFirstName;
	String expectedSurname;
	double expectedTotalIncome;
	double expectedFixedCost;
	double expectedVariableCost;

	public FacadeTest(String name) {
		super(name);
	}

	protected void setUp() throws Exception {
		super.setUp();

		 expectedUsername = "Idacarlsson1234";
		 expectedFirstName = "Ida";
		 expectedSurname = "Carlsson";
		 expectedTotalIncome = 10000;
		 expectedFixedCost = 2000;
		 expectedVariableCost = 1000;

		Context context = new InitialContext();
		facade = (FacadeLocal) context.lookup("java:app/SavingAppEJBProject/Facade!org.ics.facade.FacadeLocal");


	}

	protected void tearDown() throws Exception {
		super.tearDown();

		//facade.deleteAccount(expectedUsername);
		facade = null;
		a1 = null;
		a2 = null;
	}
	

	/*
	 * public void testFacadeHighestId() { facadeLocal.getHighestId();
	 * assertSame(facadeLocal.getHighestId(), 110); }
	 */
	public void testFacadeAccountFind() {
		
	}
	
	public void testFacadeAccount() {

		//a1 = facade.createAccount(a1);
		
		//assertEquals(a1.getUsername(), expectedUsername);
		//assertEquals(a1.getFirstName(), expectedFirstName);
		
		Account a = new Account();
		a.setUsername(expectedUsername);
		facade.createAccount(a);
		
		a1 = facade.findByAccountUsername(expectedUsername);
		assertEquals(a1.getUsername(), expectedUsername);
		facade.deleteAccount(expectedUsername);

	}
	
	

}

