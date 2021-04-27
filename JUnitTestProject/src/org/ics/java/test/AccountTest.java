package org.ics.java.test;
import org.ics.java.Account;
import junit.framework.TestCase;

public class AccountTest extends TestCase {
	
	String expectedUsername;
	String expectedFirstName;
	String expectedSurname;
	double expectedTotalIncome;
	double expectedFixedCost;
	double expectedVariableCost;
	
	Account a1;
	Account a2;
	
	public AccountTest(String name) {
		super(name);
	}

	protected void setUp() throws Exception {
		super.setUp();
		
		expectedUsername = "idacarlsson";
		expectedFirstName = "Ida";
		expectedSurname = "Carlsson";
		expectedTotalIncome = 10000;
		expectedFixedCost = 4000;
		expectedVariableCost = 1000;
		
		a1= new Account(expectedUsername, expectedFirstName, expectedSurname, expectedTotalIncome, expectedFixedCost, expectedVariableCost);		
		a2 = new Account("michellevonhuth", "Michelle", "Von Huth", 10000, 30000, 1000);

	}

	protected void tearDown() throws Exception {
		a1 = null;
		a2 = null;
	}

	public void testGetUsername() {
		assertNotNull(a1);
		assertEquals(expectedUsername, a1.getUsername());
	}

	public void testSetUsername() {
		
		String expectedUsername2 = "TestUsername";
		a1.setUsername(expectedUsername2);
		assertEquals(expectedUsername2, a1.getUsername());
	
	}

	public void testGetFirstName() {
		assertEquals(expectedFirstName, a1.getFirstName());
	}

	public void testSetFirstName() {
		String expectedFirstName2 = "Test";
		a1.setFirstName(expectedFirstName2);
		assertEquals(expectedFirstName2, a1.getFirstName());
	}

	public void testGetSurname() {
		assertEquals(expectedSurname, a1.getSurname());
	}

	public void testSetSurname() {
		String expectedSurname2 = "Test";
		a1.setSurname(expectedSurname2);
		assertEquals(expectedSurname2, a1.getSurname());
	}

	public void testGetTotalIncome() {
		assertEquals(expectedTotalIncome, a1.getTotalIncome());
	}

	public void testSetTotalIncome() {
		double expectedTotalIncome2 = 10000;
		a1.setTotalIncome(expectedTotalIncome2);
		assertEquals(expectedTotalIncome2, a1.getTotalIncome());
	}

	public void testGetFixedCost() {
		assertEquals(expectedFixedCost, a1.getFixedCost());
	}

	public void testSetFixedCost() {
		double expectedFixedCost2 = 5000;
		a1.setFixedCost(expectedFixedCost2);
		assertEquals(expectedFixedCost2, a1.getFixedCost());
	}

	public void testGetVariableCost() {
		assertEquals(expectedVariableCost, a1.getVariableCost());
	}

	public void testSetVariableCost() {
		double expectedVariable2 = 1000;
		a1.setFixedCost(expectedVariable2);
		assertEquals(expectedVariable2, a1.getVariableCost());
	}
	
	public void testEquals(){
		assertTrue(!a1.equals(null));
		assertEquals(a1, a1);
		//assertEquals(a1, new Account(expectedUsername, expectedFirstName, expectedSurname, expectedTotalIncome, expectedFixedCost, expectedVariableCost));
		assertTrue(!a1.equals(a2));}
}
