package in.fiinfra.subx.scheduler;

import in.fiinfra.subx.service.SubxService;
import in.fiinfra.subx.service.SubxServiceImpl;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Map;

import org.apache.commons.logging.LogFactory;

public class SubxScheduler extends CommonScheduler {

	private boolean working = false;

	@Override
	public void doExecute() {
		if (working) {
			LogFactory.getLog(getClass()).info("skiping current cycle");
			return;
		}
		try {
			working = true;

			SubxService subxService = getBean(SubxServiceImpl.class);

			DateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy hh:mm:ss");

			//System.out.println("Invoked on "+ dateFormat.format(System.currentTimeMillis()));

			Map<String, Object> result = subxService.batchCreateSubscription(1);

			// System.out.println("Found " + products.size());
		} finally {

			working = false;
		}

	}

	@Override
	protected String getJobName() {
		return "SubxScheduler";
	}
}
