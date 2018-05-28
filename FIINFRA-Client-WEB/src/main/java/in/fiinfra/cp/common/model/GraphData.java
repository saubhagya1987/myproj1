package in.fiinfra.cp.common.model;

import in.fiinfra.portfolio.PortfolioSummary;

import java.util.List;

public class GraphData {
	private String label;
	private long data;
	private String category;
	
	List<PortfolioSummary> formatData;

	public String getLabel() {
		return label;
	}

	public List<PortfolioSummary> getFormatData() {
		return formatData;
	}

	public void setFormatData(List<PortfolioSummary> formatData) {
		this.formatData = formatData;
	}

	public void setLabel(String label) {
		this.label = label;
	}

	public long getData() {
		return data;
	}

	public void setData(long data) {
		this.data = data;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}
}
