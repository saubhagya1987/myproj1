/**
 * 
 */
package in.fiinfra.common.util;

import java.util.Comparator;

import in.fiinfra.common.diy.models.Party;
import in.fiinfra.common.diy.models.PartySearchCriteria;

/**
 * @author Kunal
 *
 */
public class PartyNameComparator<T> implements Comparator<T>{

	private boolean isAscending;
	
	public PartyNameComparator(boolean isAscending) {
		super();
		this.isAscending = isAscending;
	}

	public boolean isAscending() {
		return isAscending;
	}

	public void setAscending(boolean isAscending) {
		this.isAscending = isAscending;
	}

	public int compare(T object1, T object2) {
		
		
		if((null != object1 && object1 instanceof PartySearchCriteria) && (null != object1 && object1 instanceof PartySearchCriteria)){
			PartySearchCriteria party1 = (PartySearchCriteria) object1;
			PartySearchCriteria party2 = (PartySearchCriteria) object2;
			
			if(isAscending)
				return party1.getName().compareTo(party2.getName());
			else
				return party2.getName().compareTo(party1.getName());
		}else{
			return 0;
		}
	}
	
	}
	

