package org.ics.facade;

import javax.ejb.Stateless;
// vi kör remote och local nu, kolla om detta behövs

@Stateless
public class Facade implements FacadeRemote, FacadeLocal {
	@EJB
	private AccountEAOLocal accountEAO;
	
    public Facade() { }

    
}
