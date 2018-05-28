package in.fiinfra.question.Service;

import in.fiinfra.auth.model.GetRequest;
import in.fiinfra.cp.common.service.BasicService;
import in.fiinfra.cp.common.service.Services;
import in.fiinfra.question.AnswerData;
import in.fiinfra.question.QuestionData;

import java.util.List;

public class QuestionService extends BasicService {

	public List<QuestionData> getQuestions(int partyId, int questionType) {
		return getService().getForObjectCollection(Services.getListOfQuestions, new GetRequest().param("partyId", partyId).param("questionType", questionType),
				QuestionData.class, appendPathParam());
	}
	

	public AnswerData saveAnswer(AnswerData answer) {
		return getService().postForObject(Services.saveAnswer, answer,
				AnswerData.class, appendPathParam());
	}
	
	public List<QuestionData> getPolls(int partyId) {
		return getService().getForObjectCollection(Services.getListOfPolls, new GetRequest().param("partyId", partyId),
				QuestionData.class, appendPathParam());
	}
	
	public AnswerData savePolls(AnswerData answer) {
		return getService().postForObject(Services.savePolls, answer,
				AnswerData.class, appendPathParam());
	}
	

}


