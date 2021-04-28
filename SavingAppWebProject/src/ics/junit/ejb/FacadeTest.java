package ics.junit.ejb;

import org.ics.ejb.Account;
import org.ics.facade.FacadeLocal;

import javax.naming.Context;
import javax.naming.InitialContext;

import junit.framework.TestCase;

public class FacadeTest extends TestCase {

	FacadeLocal facade;

	 String expectedUsername;
	 String expectedFirstName;
	 String expectedSurname;
	 double expectedTotalIncome;
	 double expectedFixedCost;
	 double expectedVariableCost;

	Account a1;
	Account a2;

	public FacadeTest(String name) {
		super(name);
	}

	protected void setUp() throws Exception {
		super.setUp();

		 expectedUsername = "Idac";
		 expectedFirstName = "Ida";
		 expectedSurname = "Carlsson";
		 expectedTotalIncome = 10000;
		 expectedFixedCost = 2000;
		 expectedVariableCost = 1000;

		Context context = new InitialContext();
		facade = (FacadeLocal) context.lookup("java:app/MakePizzaEJBProject/Facade!facade.FacadeLocal");

		a1 = new Account( expectedUsername,
		  expectedFirstName,
		  expectedSurname,
		  expectedTotalIncome,
		  expectedFixedCost,
		  expectedVariableCost);

	}

	protected void tearDown() throws Exception {
		super.tearDown();

		facade.deleteAccount(expectedUsername);
		facade = null;

		a1 = null;
		a2 = null;
	}
	

	/*
	 * public void testFacadeHighestId() { facadeLocal.getHighestId();
	 * assertSame(facadeLocal.getHighestId(), 110); }
	 */
	public void testFacadeAccount() {

		a1 = facade.createAccount(a1);
		a2 = facade.findByAccountUsername(expectedUsername);
		assertEquals(a1.getUsername(), expectedUsername);
		assertEquals(a1.getFirstName(), expectedFirstName);
		assertEquals(a2.getUsername(), expectedUsername);
		assertEquals(a2.getFirstName(), expectedFirstName);

	}

}

