package org.ics.facade;

import javax.ejb.Stateless;
// vi k�r remote och local nu, kolla om detta beh�vs

@Stateless
public class Facade implements FacadeRemote, FacadeLocal {
	@EJB
	private AccountEAOLocal accountEAO;
	
    public Facade() { }

    
}
