package in.fiinfra.question.dao;

import in.fiinfra.question.OptionData;
import in.fiinfra.question.QuestionData;

import java.sql.ResultSet;
import java.sql.SQLException;


  public class PollMapper extends QuestionMapper{
	  
	  @Override
	protected void mapOption(ResultSet rs, QuestionData q, OptionData op) throws SQLException {
		super.mapOption(rs, q,op);
		op.setSelectedTotal(rs.getInt("TotalSelected"));
	}
  }
