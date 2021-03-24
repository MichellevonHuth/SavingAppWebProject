package org.ics.ejb;

import javax.ejb.Stateless;

/**
 * Session Bean implementation class Account
 */
@Stateless
public class Account implements AccountRemote, AccountLocal {

    /**
     * Default constructor. 
     */
    public Account() {
        // TODO Auto-generated constructor stub
    }

}
