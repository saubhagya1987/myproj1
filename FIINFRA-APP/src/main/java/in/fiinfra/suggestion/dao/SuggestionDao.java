package in.fiinfra.suggestion.dao;

import java.util.List;

import in.fiinfra.common.diy.models.ProductData;
import in.fiinfra.common.diy.models.Suggestion;

public interface SuggestionDao {

	public boolean saveSuggestionForEmergency( Integer partyId );
	
	public boolean saveSuggestionForLoanStatus( Integer partyId );
	
	public boolean saveSuggestionForRiskCover( Integer partyId );
	
	public Suggestion getSuggestionForEmergency( Integer partyId );
	
	public Suggestion getSuggestionForLoanStatus( Integer partyId );
	
	public Suggestion getSuggestionForRiskCover( Integer partyId );
	
	public Suggestion getSuggestionForCashFlow( Integer partyId );
	
	public Suggestion getSuggestionForRetriement( Integer partyId );
	
	public Suggestion getSuggestionDataForGoal( Integer partyId, Integer goalId );
	
	public List<ProductData> getRetirementOutput( Integer partyId );
}
