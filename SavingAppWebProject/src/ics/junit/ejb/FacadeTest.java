package ics.junit.ejb;

import javax.naming.Context;
import javax.naming.InitialContext;

import org.ics.ejb.Account;
import org.ics.facade.FacadeLocal;

import junit.framework.TestCase;

public class FacadeTest extends TestCase {

	FacadeLocal facade;
	
	Account account;

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

		 expectedUsername = "Idacarlsson12345678";
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
		
		facade.deleteAccount(expectedUsername);
		facade = null;
		account = null;
		
	}
	
	public void testFacadeAccount() {
		
		Account a = new Account();
		a.setUsername(expectedUsername);
		facade.createAccount(a);
		a.setSurname(expectedSurname);
		facade.updateAccount(a);


		account = facade.findByAccountUsername(expectedUsername);
		assertEquals(account.getUsername(), expectedUsername);
		
		
	}
	
	

}