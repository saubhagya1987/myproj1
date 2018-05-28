package in.fiinfra.suggestion.service;

import java.util.ArrayList;
import java.util.List;

import in.fiinfra.common.diy.models.ProductData;
import in.fiinfra.common.diy.models.Suggestion;
import in.fiinfra.suggestion.dao.SuggestionDao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("suggestionService")
public class SuggestionServiceImpl implements SuggestionService {
	
	@Autowired
	SuggestionDao suggestionDao;
	
	@Override
	public boolean saveSuggestionData(Integer partyId, String datafor) {
		
		switch (datafor) {
		case "ER":
			suggestionDao.saveSuggestionForEmergency(partyId);
			break;
		case "LS":
			suggestionDao.saveSuggestionForLoanStatus(partyId);
			break;
		case "RC":
			suggestionDao.saveSuggestionForRiskCover(partyId);
			break;
		default:
			break;
		}
		return true;
	}

	@Override
	public Suggestion getSuggestionData(Integer partyId, String datafor) {
		
		Suggestion suggestion = new Suggestion();
		
		switch (datafor) {
		case "ER":
			suggestion = suggestionDao.getSuggestionForEmergency(partyId);
			suggestion.setPartyId(partyId);
			suggestion.setDatafor(datafor);
			break;
		case "LS":
			suggestion = suggestionDao.getSuggestionForLoanStatus(partyId);
			suggestion.setPartyId(partyId);
			suggestion.setDatafor(datafor);
			break;
		case "RC":
			suggestion = suggestionDao.getSuggestionForRiskCover(partyId);
			suggestion.setPartyId(partyId);
			suggestion.setDatafor(datafor);
			break;
		case "CF":
			suggestion = suggestionDao.getSuggestionForCashFlow(partyId);
			suggestion.setPartyId(partyId);
			suggestion.setDatafor(datafor);
			break;
		case "RP":
			suggestion = suggestionDao.getSuggestionForRetriement(partyId);
			List<ProductData> productDataList = new ArrayList<ProductData>();
			productDataList = suggestionDao.getRetirementOutput(partyId);
			suggestion.setPartyId(partyId);
			suggestion.setDatafor(datafor);
			suggestion.setSuggestionList(productDataList);
			break;
		default:
			break;
		}
		return suggestion;
	}

	@Override
	public Suggestion getSuggestionDataForGoal(Integer partyId, Integer goalId) {
		
		Suggestion suggestion = new Suggestion();
		suggestion = suggestionDao.getSuggestionDataForGoal(partyId,goalId);
		suggestion.setPartyId(partyId);
		suggestion.setGoalId(goalId);
		return suggestion;
	}
}
