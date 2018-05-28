/**
 * 
 */
package in.fiinfra.common.diy.models;

/**
 * @author lole_a
 * 
 */
/**
 * @author MWX-21
 *
 */
public class DcAnalysisHelper {

	private int partyId;
	private int userId;
	private String dataFor;
	private String firstTake;
	private String firstTakeLife;
	private String firstTakeHealth;
	private String firstTakeCritical;
	private String firstTakeAccident;
	private String analysis;
	private String successMsg;
	private String errorMsg;
	private Double minimumEmergncyFund;
	private String insuranceMethod;
	
	public String getInsuranceMethod() {
		return insuranceMethod;
	}

	public void setInsuranceMethod(String insuranceMethod) {
		this.insuranceMethod = insuranceMethod;
	}
	
	public String getFirstTakeLife() {
		return firstTakeLife;
	}

	public void setFirstTakeLife(String firstTakeLife) {
		this.firstTakeLife = firstTakeLife;
	}

	public String getFirstTakeHealth() {
		return firstTakeHealth;
	}

	public void setFirstTakeHealth(String firstTakeHealth) {
		this.firstTakeHealth = firstTakeHealth;
	}

	public String getFirstTakeCritical() {
		return firstTakeCritical;
	}

	public void setFirstTakeCritical(String firstTakeCritical) {
		this.firstTakeCritical = firstTakeCritical;
	}

	public String getFirstTakeAccident() {
		return firstTakeAccident;
	}

	public void setFirstTakeAccident(String firstTakeAccident) {
		this.firstTakeAccident = firstTakeAccident;
	}

	public int getPartyId() {
		return partyId;
	}

	public void setPartyId(int partyId) {
		this.partyId = partyId;
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public String getDataFor() {
		return dataFor;
	}

	public void setDataFor(String dataFor) {
		this.dataFor = dataFor;
	}
	
	public String getFirstTake() {
		return firstTake;
	}

	public void setFirstTake(String firstTake) {
		this.firstTake = firstTake;
	}

	public String getAnalysis() {
		return analysis;
	}

	public void setAnalysis(String anslysis) {
		this.analysis = anslysis;
	}

	public String getSuccessMsg() {
		return successMsg;
	}

	public void setSuccessMsg(String successMsg) {
		this.successMsg = successMsg;
	}

	public String getErrorMsg() {
		return errorMsg;
	}

	public void setErrorMsg(String errorMsg) {
		this.errorMsg = errorMsg;
	}

	public Double getMinimumEmergncyFund() {
		return minimumEmergncyFund;
	}

	public void setMinimumEmergncyFund(Double minimumEmergncyFund) {
		this.minimumEmergncyFund = minimumEmergncyFund;
	}
}
