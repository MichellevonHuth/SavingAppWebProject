package org.ics.eao;

import java.util.List;

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;

import org.ics.ejb.Account;
import org.ics.ejb.SavingSchedule;

/**
 * Session Bean implementation class SavingScheduleEAOImpl
 */
@Stateless
public class SavingScheduleEAOImpl implements SavingScheduleEAORemote, SavingScheduleEAOLocal {
	
	@PersistenceContext(unitName="ISProject")
	private EntityManager em;
	
    public SavingScheduleEAOImpl() { }
    
    public SavingSchedule findBySavingScheduleNbr(long savingScheduleNbr) {
    	return em.find(SavingSchedule.class, savingScheduleNbr);
    }
    
    public SavingSchedule createSavingSchedule(SavingSchedule savingSchedule) {
    	
    	Account a = savingSchedule.getAccount();
    	
    	double goal = savingSchedule.getSavingGoal();
    	double income = a.getTotalIncome();
    	double fixedCost = a.getFixedCost();
    	double variableCost = a.getVariableCost();
    	int year = savingSchedule.getSavingDurationYear();
    	
    	
    	
    	em.persist(savingSchedule);
    	return savingSchedule;
    }
    
    public SavingSchedule updateSavingSchedule(SavingSchedule savingSchedule) {
    
    	em.merge(savingSchedule);
    	return savingSchedule;
    }
    
    public void deleteSavingSchedule(long savingScheduleNbr) {
    	SavingSchedule s = this.findBySavingScheduleNbr(savingScheduleNbr);
    	if (s!= null) {
    		em.remove(s);
    	}
    }
    
    public List<SavingSchedule> findByID(String username) {
    	TypedQuery<SavingSchedule> query = em.createNamedQuery("SavingSchedule.findByID", SavingSchedule.class);
    	query.setParameter("username", username);
    	
    	List<SavingSchedule> savings = query.getResultList();
    	return savings;
    }

}
