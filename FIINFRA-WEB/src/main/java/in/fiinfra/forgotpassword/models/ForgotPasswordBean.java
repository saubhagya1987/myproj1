package in.fiinfra.forgotpassword.models;

import in.fiinfra.common.common.CodeValueData;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang.builder.ReflectionToStringBuilder;

public class ForgotPasswordBean {
	private String userName;
	private String email;
	private Integer questionId;
	private String answer;
	private List<CodeValueData> questions ;

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public Integer getQuestionId() {
		return questionId;
	}

	public void setQuestionId(Integer questionId) {
		this.questionId = questionId;
	}

	public String getAnswer() {
		return answer;
	}

	public void setAnswer(String answer) {
		this.answer = answer;
	}

	
	public List<CodeValueData> getQuestions() {
		return questions;
	}

	public void setQuestions(List<CodeValueData> questions) {
		this.questions = questions;
	}

	@Override
	public String toString() {
		return new ReflectionToStringBuilder(this).toString();
	}
}
