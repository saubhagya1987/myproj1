package in.fiinfra.testcases;

import in.fiinfra.common.AbstractTestCase;
import in.fiinfra.cp.BroadcastData;
import in.fiinfra.cp.GupShupData;
import in.fiinfra.cp.TestimonialData;
import in.fiinfra.cp.misc.service.CPMiscService;
import in.fiinfra.question.AnswerData;
import in.fiinfra.question.OptionData;
import in.fiinfra.question.QuestionData;
import in.fiinfra.question.service.QuestionService;

import java.util.List;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

public class TestQuestionService extends AbstractTestCase {
	QuestionService service;
	@Autowired
	CPMiscService service1;

	@Test
	public void testQuestions() {
		List<QuestionData> data = service.getQuestions(27828, 31001, 58004,
				6375);

		printJson(" Questions ", data);
	}

	@Test
	public void testAnswer() {
		List<QuestionData> data = service.getQuestions(27828, 31001, 58004,
				6375);
		AnswerData answer = new AnswerData();
		QuestionData question = data.get(0);
		answer.setPartyId(6375);
		answer.setQuestionId(question.getQuestionId());
		OptionData op = question.getOptions().get(0);

		OptionData[] options = new OptionData[1];
		options[0] = op;

		answer.setSelectedOptions(options);

		service.saveQuestionAnswer(27828, answer);

		data = service.getQuestions(27828, 31001, 58004, 6375);

		printJson(" Questions ", data);

	}

	@Test
	public void testBroadcast() {
		List<BroadcastData> data = service1.getBroadcastlist(27828,6375);

		printJson(" Questions ", data);
	}

	@Test
	public void testTestimonials() {
		List<TestimonialData> data = service1
				.getTestimonials(6375, 27827, 1, 2);

		printJson(" Testimonials ", data);
	}

	@Test
	public void testGupShup() {
		List<GupShupData> data = service1.getGupShup(27827,6375,0,1 );

		printJson(" GupShup ", data);
	}

}
