package in.fiinfra.financial;

import in.fiinfra.common.AbstractTestCase;
import in.fiinfra.cp.AssetData;
import in.fiinfra.cp.PlanData;
import in.fiinfra.portfolio.service.PortfolioService;

import java.util.List;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

public class TestPortfolioService extends AbstractTestCase {

	@Autowired
	PortfolioService service;

	@Test
	public void testPortFolioList() {

		List<AssetData> lst = service.getListOfPortfolio(1, 27641);
		for (AssetData asset : lst) {
			printJson(asset.getAssetName(), asset);
		}

	}

	@Test
	public void testPlans() {

		List<PlanData> lst = service.getPlans(1, 27641);
		for (PlanData plan : lst) {
			printJson(plan.getPurposeText(), plan);
		}

	}

}
