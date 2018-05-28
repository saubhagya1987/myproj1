package in.fiinfra.common.utility;

import in.fiinfra.common.diy.models.Document;
import in.fiinfra.common.diy.models.GoalAttribute;
import in.fiinfra.common.diy.models.GoalPlanInput;
import in.fiinfra.common.diy.models.KeyValue;
import in.fiinfra.common.diy.models.ProductData;
import in.fiinfra.common.util.JsonData;

import java.util.List;
import java.util.Map;






public class DCOutputData {
	private String saving;
	private String potentialSaving;
	private String futurePotentialCorpus;
	private String currentEmergencyFund;
	private String currentInsurance;
	private String currentHealthInsurance;
	private String currentCriticalIllnesCoverAmout;
	private String currentpersonalInsuranceCoverAmt;
	private int dcInputPartyId;
	
	
	
	public int getDcInputPartyId() {
		return dcInputPartyId;
	}
	public void setDcInputPartyId(int dcInputPartyId) {
		this.dcInputPartyId = dcInputPartyId;
	}
	public String getCurrentpersonalInsuranceCoverAmt() {
		return currentpersonalInsuranceCoverAmt;
	}
	public void setCurrentpersonalInsuranceCoverAmt(
			String currentpersonalInsuranceCoverAmt) {
		this.currentpersonalInsuranceCoverAmt = currentpersonalInsuranceCoverAmt;
	}
	public String getCurrentCriticalIllnesCoverAmout() {
		return currentCriticalIllnesCoverAmout;
	}
	public void setCurrentCriticalIllnesCoverAmout(
			String currentCriticalIllnesCoverAmout) {
		this.currentCriticalIllnesCoverAmout = currentCriticalIllnesCoverAmout;
	}
	public String getCurrentHealthInsurance() {
		return currentHealthInsurance;
	}
	public void setCurrentHealthInsurance(String currentHealthInsurance) {
		this.currentHealthInsurance = currentHealthInsurance;
	}
	private String idealInsurance;
	private String necessaryInsurance;
	private String retirementNeed;
	private String retirementCorpusAccumulation;
	private String partyId;
	private String retirementLumpsum;
	private int isLoanTaken;
	private String isWillPrepared;
	
	
	private int age;
	private int isplanToTakeLoan;
	private String income;
	private String surplus;
	
	private Map<String,String> ratings; 
	private String percentIncomeInRepayLoan;
	
	//private List<QuestionDetails> askYourSelfQuestions;
	private List<GoalData> goalList;
	//private List<QuestionDetails> expectedEvents;
	
	private List<String> emergenciesFaced;
	private String emergencies;	
	private String facedEmergency;
	private String managedEmergency;
	private String minimumEmergencyFund;
	private String idealEmergencyFund;
	private String spouseName;
	private String opportunityName;
	private String savingPlusExpensePercentage;
	private String personalInfoNotes;
	private String currentFinStatusNotes;
	private String futureFinExpectationsNotes;
	private String eventsNotes;
	private String salutation;
	
	
	private String isGoalAchivementOrInvestmentIsZero;
	private String totalRegularInvestmentFromGoals;
	private String sumOfCurrentRegInvAndRetirment;
	private String retirmenrShortfallAmt;
	
	private String healthInsuranceCoverAmount;
	private String inflationRate;
	private String expectedReturnOnExistingInvestment;
	private String expectedReturnOnNewInvestment;
	private String emergencyFundsRequiredMonths;
	private String expectedGrowthRateForRetirementGoalInvestments;
	private String expectedGrowthRateForGoalsLessOrEqualThree;
	private String expectedGrowthRateForGoalsGreaterThanThree;
	
	private String emergencyRselectedQuestion;
	
	
	
	private String healthInsurance;
	private String idealHInsurance;
	
	private int 	percentGoalReachable;
	private String 	regularInvestmentRetirement;
	private Map<String,String> succession; 
	private String pathFinderStatus;
	private String meterGaugeStr1;// this is for slabs string  
	private String meterGaugeStr2;// this is for arrow string 
	private String currentRegularInvestmentRetirement;
	private String partnerName;
	private String partnerSalutation;
	private String partnerPhone;
	private String partnerEmail;
	private String partnerLogo;
	private Integer logoHeight;
	private Integer logoWidth;
	public Integer getLogoWidth() {
		return logoWidth;
	}
	public void setLogoWidth(Integer logoWidth) {
		this.logoWidth = logoWidth;
	}
	public Integer getLogoHeight() {
		return logoHeight;
	}
	public void setLogoHeight(Integer logoHeight) {
		this.logoHeight = logoHeight;
	}
	public String getPartnerSalutation() {
		return partnerSalutation;
	}
	public void setPartnerSalutation(String partnerSalutation) {
		this.partnerSalutation = partnerSalutation;
	}
	private String partnerAddress;
	private String partnerCity;
	private String postalCode;
	public String getPartnerAddress() {
		return partnerAddress;
	}
	public void setPartnerAddress(String partnerAddress) {
		this.partnerAddress = partnerAddress;
	}
	public String getPartnerCity() {
		return partnerCity;
	}
	public void setPartnerCity(String partnerCity) {
		this.partnerCity = partnerCity;
	}
	public String getPostalCode() {
		return postalCode;
	}
	public void setPostalCode(String postalCode) {
		this.postalCode = postalCode;
	}
	private String buLogo;
	private int score;
	private String profile;
	private String monthlyEmi;
	private String currentLIInsuranceCoveAmtisGreater;
	private String currentHealthInsuranceCoveAmtisGreater;
	private String healthInsuranceAdqueteAmat;
	private String personalAcdntInsuranceAdqueteAmat;
	private String personalAcdntInsuranceCoveAmtisGreater;
	private String assetHouseholdInsuranceCoveredorNot;
	private String riskFlagColor; 
	
	
	private String criticalIllNessInsuranceAdqueteAmat;
	private String currentCriticalInsuranceCoveAmtisGreater;
	private String futureMonthlyExpenses;
	private String monthlyExpenses;
	private String criticalIllnessInsurance;
	private String accidentInsurance;
	private String retirementYear;
	private int currentYear;	
	private int loanEmiPercentage;
	
	private Integer fpplanTypeId;
	
	public Integer getFpplanTypeId() {
		return fpplanTypeId;
	}
	public void setFpplanTypeId(Integer fpplanTypeId) {
		this.fpplanTypeId = fpplanTypeId;
	}
	public List<GoalData> getGoalList() {
		return goalList;
	}
	public void setGoalList(List<GoalData> goalList) {
		this.goalList = goalList;
	}
	public String getSaving() {
		return saving;
	}
	public void setSaving(String saving) {
		this.saving = saving;
	}
	public String getPotentialSaving() {
		return potentialSaving;
	}
	public void setPotentialSaving(String potentialSaving) {
		this.potentialSaving = potentialSaving;
	}
	public String getFuturePotentialCorpus() {
		return futurePotentialCorpus;
	}
	public void setFuturePotentialCorpus(String futurePotentialCorpus) {
		this.futurePotentialCorpus = futurePotentialCorpus;
	}
	public String getCurrentEmergencyFund() {
		return currentEmergencyFund;
	}
	public void setCurrentEmergencyFund(String currentEmergencyFund) {
		this.currentEmergencyFund = currentEmergencyFund;
	}
	public String getCurrentInsurance() {
		return currentInsurance;
	}
	public void setCurrentInsurance(String currentInsurance) {
		this.currentInsurance = currentInsurance;
	}
	public String getIdealInsurance() {
		return idealInsurance;
	}
	public void setIdealInsurance(String idealInsurance) {
		this.idealInsurance = idealInsurance;
	}
	public String getNecessaryInsurance() {
		return necessaryInsurance;
	}
	public void setNecessaryInsurance(String necessaryInsurance) {
		this.necessaryInsurance = necessaryInsurance;
	}
	public String getRetirementNeed() {
		return retirementNeed;
	}
	public void setRetirementNeed(String retirementNeed) {
		this.retirementNeed = retirementNeed;
	}
	public String getRetirementCorpusAccumulation() {
		return retirementCorpusAccumulation;
	}
	public void setRetirementCorpusAccumulation(String retirementCorpusAccumulation) {
		this.retirementCorpusAccumulation = retirementCorpusAccumulation;
	}
	
	public String getPartyId() {
		return partyId;
	}
	public void setPartyId(String partyId) {
		this.partyId = partyId;
	}
	public String getRetirementLumpsum() {
		return retirementLumpsum;
	}
	public void setRetirementLumpsum(String retirementLumpsum) {
		this.retirementLumpsum = retirementLumpsum;
	}
	public int getIsLoanTaken() {
		return isLoanTaken;
	}
	public void setIsLoanTaken(int isLoanTaken) {
		this.isLoanTaken = isLoanTaken;
	}
	public String getIsWillPrepared() {
		return isWillPrepared;
	}
	public void setIsWillPrepared(String isWillPrepared) {
		this.isWillPrepared = isWillPrepared;
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	public int getIsplanToTakeLoan() {
		return isplanToTakeLoan;
	}
	public void setIsplanToTakeLoan(int isplanToTakeLoan) {
		this.isplanToTakeLoan = isplanToTakeLoan;
	}
	public String getIncome() {
		return income;
	}
	public void setIncome(String income) {
		this.income = income;
	}
	public String getSurplus() {
		return surplus;
	}
	public void setSurplus(String surplus) {
		this.surplus = surplus;
	}
	public Map<String, String> getRatings() {
		return ratings;
	}
	public void setRatings(Map<String, String> ratings) {
		this.ratings = ratings;
	}
	public String getPercentIncomeInRepayLoan() {
		return percentIncomeInRepayLoan;
	}
	public void setPercentIncomeInRepayLoan(String percentIncomeInRepayLoan) {
		this.percentIncomeInRepayLoan = percentIncomeInRepayLoan;
	}
	
	public List<String> getEmergenciesFaced() {
		return emergenciesFaced;
	}
	public void setEmergenciesFaced(List<String> emergenciesFaced) {
		this.emergenciesFaced = emergenciesFaced;
	}
	public String getEmergencies() {
		return emergencies;
	}
	public void setEmergencies(String emergencies) {
		this.emergencies = emergencies;
	}
	public String getFacedEmergency() {
		return facedEmergency;
	}
	public void setFacedEmergency(String facedEmergency) {
		this.facedEmergency = facedEmergency;
	}
	public String getManagedEmergency() {
		return managedEmergency;
	}
	public void setManagedEmergency(String managedEmergency) {
		this.managedEmergency = managedEmergency;
	}
	public String getMinimumEmergencyFund() {
		return minimumEmergencyFund;
	}
	public void setMinimumEmergencyFund(String minimumEmergencyFund) {
		this.minimumEmergencyFund = minimumEmergencyFund;
	}
	public String getIdealEmergencyFund() {
		return idealEmergencyFund;
	}
	public void setIdealEmergencyFund(String idealEmergencyFund) {
		this.idealEmergencyFund = idealEmergencyFund;
	}
	public String getSpouseName() {
		return spouseName;
	}
	public void setSpouseName(String spouseName) {
		this.spouseName = spouseName;
	}
	
	public String getOpportunityName() {
		return opportunityName;
	}
	public void setOpportunityName(String opportunityName) {
		this.opportunityName = opportunityName;
	}
	public String getSavingPlusExpensePercentage() {
		return savingPlusExpensePercentage;
	}
	public void setSavingPlusExpensePercentage(String savingPlusExpensePercentage) {
		this.savingPlusExpensePercentage = savingPlusExpensePercentage;
	}
	public String getPersonalInfoNotes() {
		return personalInfoNotes;
	}
	public void setPersonalInfoNotes(String personalInfoNotes) {
		this.personalInfoNotes = personalInfoNotes;
	}
	public String getCurrentFinStatusNotes() {
		return currentFinStatusNotes;
	}
	public void setCurrentFinStatusNotes(String currentFinStatusNotes) {
		this.currentFinStatusNotes = currentFinStatusNotes;
	}
	public String getFutureFinExpectationsNotes() {
		return futureFinExpectationsNotes;
	}
	public void setFutureFinExpectationsNotes(String futureFinExpectationsNotes) {
		this.futureFinExpectationsNotes = futureFinExpectationsNotes;
	}
	public String getEventsNotes() {
		return eventsNotes;
	}
	public void setEventsNotes(String eventsNotes) {
		this.eventsNotes = eventsNotes;
	}
	public String getSalutation() {
		return salutation;
	}
	public void setSalutation(String salutation) {
		this.salutation = salutation;
	}
	public String getIsGoalAchivementOrInvestmentIsZero() {
		return isGoalAchivementOrInvestmentIsZero;
	}
	public void setIsGoalAchivementOrInvestmentIsZero(
			String isGoalAchivementOrInvestmentIsZero) {
		this.isGoalAchivementOrInvestmentIsZero = isGoalAchivementOrInvestmentIsZero;
	}
	public String getTotalRegularInvestmentFromGoals() {
		return totalRegularInvestmentFromGoals;
	}
	public void setTotalRegularInvestmentFromGoals(
			String totalRegularInvestmentFromGoals) {
		this.totalRegularInvestmentFromGoals = totalRegularInvestmentFromGoals;
	}
	public String getSumOfCurrentRegInvAndRetirment() {
		return sumOfCurrentRegInvAndRetirment;
	}
	public void setSumOfCurrentRegInvAndRetirment(
			String sumOfCurrentRegInvAndRetirment) {
		this.sumOfCurrentRegInvAndRetirment = sumOfCurrentRegInvAndRetirment;
	}
	public String getRetirmenrShortfallAmt() {
		return retirmenrShortfallAmt;
	}
	public void setRetirmenrShortfallAmt(String retirmenrShortfallAmt) {
		this.retirmenrShortfallAmt = retirmenrShortfallAmt;
	}
	public String getHealthInsuranceCoverAmount() {
		return healthInsuranceCoverAmount;
	}
	public void setHealthInsuranceCoverAmount(String healthInsuranceCoverAmount) {
		this.healthInsuranceCoverAmount = healthInsuranceCoverAmount;
	}
	public String getInflationRate() {
		return inflationRate;
	}
	public void setInflationRate(String inflationRate) {
		this.inflationRate = inflationRate;
	}
	public String getExpectedReturnOnExistingInvestment() {
		return expectedReturnOnExistingInvestment;
	}
	public void setExpectedReturnOnExistingInvestment(
			String expectedReturnOnExistingInvestment) {
		this.expectedReturnOnExistingInvestment = expectedReturnOnExistingInvestment;
	}
	public String getExpectedReturnOnNewInvestment() {
		return expectedReturnOnNewInvestment;
	}
	public void setExpectedReturnOnNewInvestment(
			String expectedReturnOnNewInvestment) {
		this.expectedReturnOnNewInvestment = expectedReturnOnNewInvestment;
	}
	public String getEmergencyFundsRequiredMonths() {
		return emergencyFundsRequiredMonths;
	}
	public void setEmergencyFundsRequiredMonths(String emergencyFundsRequiredMonths) {
		this.emergencyFundsRequiredMonths = emergencyFundsRequiredMonths;
	}
	public String getExpectedGrowthRateForRetirementGoalInvestments() {
		return expectedGrowthRateForRetirementGoalInvestments;
	}
	public void setExpectedGrowthRateForRetirementGoalInvestments(
			String expectedGrowthRateForRetirementGoalInvestments) {
		this.expectedGrowthRateForRetirementGoalInvestments = expectedGrowthRateForRetirementGoalInvestments;
	}
	public String getExpectedGrowthRateForGoalsLessOrEqualThree() {
		return expectedGrowthRateForGoalsLessOrEqualThree;
	}
	public void setExpectedGrowthRateForGoalsLessOrEqualThree(
			String expectedGrowthRateForGoalsLessOrEqualThree) {
		this.expectedGrowthRateForGoalsLessOrEqualThree = expectedGrowthRateForGoalsLessOrEqualThree;
	}
	public String getExpectedGrowthRateForGoalsGreaterThanThree() {
		return expectedGrowthRateForGoalsGreaterThanThree;
	}
	public void setExpectedGrowthRateForGoalsGreaterThanThree(
			String expectedGrowthRateForGoalsGreaterThanThree) {
		this.expectedGrowthRateForGoalsGreaterThanThree = expectedGrowthRateForGoalsGreaterThanThree;
	}
	public String getEmergencyRselectedQuestion() {
		return emergencyRselectedQuestion;
	}
	public void setEmergencyRselectedQuestion(String emergencyRselectedQuestion) {
		this.emergencyRselectedQuestion = emergencyRselectedQuestion;
	}
	public String getHealthInsurance() {
		return healthInsurance;
	}
	public void setHealthInsurance(String healthInsurance) {
		this.healthInsurance = healthInsurance;
	}
	public String getIdealHInsurance() {
		return idealHInsurance;
	}
	public void setIdealHInsurance(String idealHInsurance) {
		this.idealHInsurance = idealHInsurance;
	}
	public int getPercentGoalReachable() {
		return percentGoalReachable;
	}
	public void setPercentGoalReachable(int percentGoalReachable) {
		this.percentGoalReachable = percentGoalReachable;
	}
	public String getRegularInvestmentRetirement() {
		return regularInvestmentRetirement;
	}
	public void setRegularInvestmentRetirement(String regularInvestmentRetirement) {
		this.regularInvestmentRetirement = regularInvestmentRetirement;
	}
	public Map<String, String> getSuccession() {
		return succession;
	}
	public void setSuccession(Map<String, String> succession) {
		this.succession = succession;
	}
	public String getPathFinderStatus() {
		return pathFinderStatus;
	}
	public void setPathFinderStatus(String pathFinderStatus) {
		this.pathFinderStatus = pathFinderStatus;
	}
	public String getMeterGaugeStr1() {
		return meterGaugeStr1;
	}
	public void setMeterGaugeStr1(String meterGaugeStr1) {
		this.meterGaugeStr1 = meterGaugeStr1;
	}
	public String getMeterGaugeStr2() {
		return meterGaugeStr2;
	}
	public void setMeterGaugeStr2(String meterGaugeStr2) {
		this.meterGaugeStr2 = meterGaugeStr2;
	}
	public String getCurrentRegularInvestmentRetirement() {
		return currentRegularInvestmentRetirement;
	}
	public void setCurrentRegularInvestmentRetirement(
			String currentRegularInvestmentRetirement) {
		this.currentRegularInvestmentRetirement = currentRegularInvestmentRetirement;
	}
	public String getPartnerName() {
		return partnerName;
	}
	public void setPartnerName(String partnerName) {
		this.partnerName = partnerName;
	}
	public String getPartnerPhone() {
		return partnerPhone;
	}
	public void setPartnerPhone(String partnerPhone) {
		this.partnerPhone = partnerPhone;
	}
	public String getPartnerEmail() {
		return partnerEmail;
	}
	public void setPartnerEmail(String partnerEmail) {
		this.partnerEmail = partnerEmail;
	}
	public String getPartnerLogo() {
		return partnerLogo;
	}
	public void setPartnerLogo(String partnerLogo) {
		this.partnerLogo = partnerLogo;
	}
	public String getBuLogo() {
		return buLogo;
	}
	public void setBuLogo(String buLogo) {
		this.buLogo = buLogo;
	}
	public int getScore() {
		return score;
	}
	public void setScore(int score) {
		this.score = score;
	}
	public String getProfile() {
		return profile;
	}
	public void setProfile(String profile) {
		this.profile = profile;
	}
	public String getMonthlyEmi() {
		return monthlyEmi;
	}
	public void setMonthlyEmi(String monthlyEmi) {
		this.monthlyEmi = monthlyEmi;
	}
	public String getCurrentLIInsuranceCoveAmtisGreater() {
		return currentLIInsuranceCoveAmtisGreater;
	}
	public void setCurrentLIInsuranceCoveAmtisGreater(
			String currentLIInsuranceCoveAmtisGreater) {
		this.currentLIInsuranceCoveAmtisGreater = currentLIInsuranceCoveAmtisGreater;
	}
	public String getCurrentHealthInsuranceCoveAmtisGreater() {
		return currentHealthInsuranceCoveAmtisGreater;
	}
	public void setCurrentHealthInsuranceCoveAmtisGreater(
			String currentHealthInsuranceCoveAmtisGreater) {
		this.currentHealthInsuranceCoveAmtisGreater = currentHealthInsuranceCoveAmtisGreater;
	}
	public String getHealthInsuranceAdqueteAmat() {
		return healthInsuranceAdqueteAmat;
	}
	public void setHealthInsuranceAdqueteAmat(String healthInsuranceAdqueteAmat) {
		this.healthInsuranceAdqueteAmat = healthInsuranceAdqueteAmat;
	}
	public String getPersonalAcdntInsuranceAdqueteAmat() {
		return personalAcdntInsuranceAdqueteAmat;
	}
	public void setPersonalAcdntInsuranceAdqueteAmat(
			String personalAcdntInsuranceAdqueteAmat) {
		this.personalAcdntInsuranceAdqueteAmat = personalAcdntInsuranceAdqueteAmat;
	}
	public String getPersonalAcdntInsuranceCoveAmtisGreater() {
		return personalAcdntInsuranceCoveAmtisGreater;
	}
	public void setPersonalAcdntInsuranceCoveAmtisGreater(
			String personalAcdntInsuranceCoveAmtisGreater) {
		this.personalAcdntInsuranceCoveAmtisGreater = personalAcdntInsuranceCoveAmtisGreater;
	}
	public String getAssetHouseholdInsuranceCoveredorNot() {
		return assetHouseholdInsuranceCoveredorNot;
	}
	public void setAssetHouseholdInsuranceCoveredorNot(
			String assetHouseholdInsuranceCoveredorNot) {
		this.assetHouseholdInsuranceCoveredorNot = assetHouseholdInsuranceCoveredorNot;
	}
	public String getRiskFlagColor() {
		return riskFlagColor;
	}
	public void setRiskFlagColor(String riskFlagColor) {
		this.riskFlagColor = riskFlagColor;
	}
	public String getCriticalIllNessInsuranceAdqueteAmat() {
		return criticalIllNessInsuranceAdqueteAmat;
	}
	public void setCriticalIllNessInsuranceAdqueteAmat(
			String criticalIllNessInsuranceAdqueteAmat) {
		this.criticalIllNessInsuranceAdqueteAmat = criticalIllNessInsuranceAdqueteAmat;
	}
	public String getCurrentCriticalInsuranceCoveAmtisGreater() {
		return currentCriticalInsuranceCoveAmtisGreater;
	}
	public void setCurrentCriticalInsuranceCoveAmtisGreater(
			String currentCriticalInsuranceCoveAmtisGreater) {
		this.currentCriticalInsuranceCoveAmtisGreater = currentCriticalInsuranceCoveAmtisGreater;
	}
	public String getFutureMonthlyExpenses() {
		return futureMonthlyExpenses;
	}
	public void setFutureMonthlyExpenses(String futureMonthlyExpenses) {
		this.futureMonthlyExpenses = futureMonthlyExpenses;
	}
	public String getMonthlyExpenses() {
		return monthlyExpenses;
	}
	public void setMonthlyExpenses(String monthlyExpenses) {
		this.monthlyExpenses = monthlyExpenses;
	}
	public String getCriticalIllnessInsurance() {
		return criticalIllnessInsurance;
	}
	public void setCriticalIllnessInsurance(String criticalIllnessInsurance) {
		this.criticalIllnessInsurance = criticalIllnessInsurance;
	}
	public String getAccidentInsurance() {
		return accidentInsurance;
	}
	public void setAccidentInsurance(String accidentInsurance) {
		this.accidentInsurance = accidentInsurance;
	}
	public String getRetirementYear() {
		return retirementYear;
	}
	public void setRetirementYear(String retirementYear) {
		this.retirementYear = retirementYear;
	}
	public int getCurrentYear() {
		return currentYear;
	}
	public void setCurrentYear(int currentYear) {
		this.currentYear = currentYear;
	}
	public int getLoanEmiPercentage() {
		return loanEmiPercentage;
	}
	public void setLoanEmiPercentage(int loanEmiPercentage) {
		this.loanEmiPercentage = loanEmiPercentage;
	}
	
	private List<ProductData> retirementList;

	public List<ProductData> getRetirementList() {
		return retirementList;
	}
	public void setRetirementList(List<ProductData> retirementList) {
		this.retirementList = retirementList;
	}
	
	private String CPLogo;
	
	public String getCPLogo() {
		return CPLogo;
	}
	public void setCPLogo(String cPLogo) {
		CPLogo = cPLogo;
	}
	
	private int loanNameId;
	
	private String loanName;
	
	private String investmentValue;

	public int getLoanNameId() {
		return loanNameId;
	}
	public void setLoanNameId(int loanNameId) {
		this.loanNameId = loanNameId;
	}
	public String getLoanName() {
		return loanName;
	}
	public void setLoanName(String loanName) {
		this.loanName = loanName;
	}
	public String getInvestmentValue() {
		return investmentValue;
	}
	public void setInvestmentValue(String investmentValue) {
		this.investmentValue = investmentValue;
	}
	
	private String salaryIncome;
	private String otherIncome;
	private String expenses;

	public String getSalaryIncome() {
		return salaryIncome;
	}
	public void setSalaryIncome(String salaryIncome) {
		this.salaryIncome = salaryIncome;
	}
	public String getOtherIncome() {
		return otherIncome;
	}
	public void setOtherIncome(String otherIncome) {
		this.otherIncome = otherIncome;
	}
	public String getExpenses() {
		return expenses;
	}
	public void setExpenses(String expenses) {
		this.expenses = expenses;
	}
	
	private String salaryIncomeAdvanced;
	private String otherIncomeAdvanced;
	private String expensesAdvanced;

	public String getSalaryIncomeAdvanced() {
		return salaryIncomeAdvanced;
	}
	public void setSalaryIncomeAdvanced(String salaryIncomeAdvanced) {
		this.salaryIncomeAdvanced = salaryIncomeAdvanced;
	}
	public String getOtherIncomeAdvanced() {
		return otherIncomeAdvanced;
	}
	public void setOtherIncomeAdvanced(String otherIncomeAdvanced) {
		this.otherIncomeAdvanced = otherIncomeAdvanced;
	}
	public String getExpensesAdvanced() {
		return expensesAdvanced;
	}
	public void setExpensesAdvanced(String expensesAdvanced) {
		this.expensesAdvanced = expensesAdvanced;
	}
	
	private List<JsonData> jsonDataList;

	public List<JsonData> getJsonDataList() {
		return jsonDataList;
	}
	public void setJsonDataList(List<JsonData> jsonDataList) {
		this.jsonDataList = jsonDataList;
	}
	
	private List<GoalAttribute> goalAttributeList;

	public List<GoalAttribute> getGoalAttributeList() {
		return goalAttributeList;
	}
	public void setGoalAttributeList(List<GoalAttribute> goalAttributeList) {
		this.goalAttributeList = goalAttributeList;
	}
	
	
	private Integer themeId;

	public Integer getThemeId() {
		return themeId;
	}
	public void setThemeId(Integer themeId) {
		this.themeId = themeId;
	}
	
	private Integer riskProfileid;

	public Integer getRiskProfileid() {
		return riskProfileid;
	}
	public void setRiskProfileid(Integer riskProfileid) {
		this.riskProfileid = riskProfileid;
	}
	
	private List<KeyValue> keyValueList;

	public List<KeyValue> getKeyValueList() {
		return keyValueList;
	}
	public void setKeyValueList(List<KeyValue> keyValueList) {
		this.keyValueList = keyValueList;
	}
	
	private List<Document> documentList;

	public List<Document> getDocumentList() {
		return documentList;
	}
	public void setDocumentList(List<Document> documentList) {
		this.documentList = documentList;
	}
	
	private String premiums;

	public String getPremiums() {
		return premiums;
	}
	public void setPremiums(String premiums) {
		this.premiums = premiums;
	}
	
	private String accidentMonths;
	private String criticalMonths;
	private Integer insruanceMethod;
	
	public String getAccidentMonths() {
		return accidentMonths;
	}
	public void setAccidentMonths(String accidentMonths) {
		this.accidentMonths = accidentMonths;
	}
	public String getCriticalMonths() {
		return criticalMonths;
	}
	public void setCriticalMonths(String criticalMonths) {
		this.criticalMonths = criticalMonths;
	}
	public Integer getInsruanceMethod() {
		return insruanceMethod;
	}
	public void setInsruanceMethod(Integer insruanceMethod) {
		this.insruanceMethod = insruanceMethod;
	}
	private String clientPhoto;

	public String getClientPhoto() {
		return clientPhoto;
	}
	public void setClientPhoto(String clientPhoto) {
		this.clientPhoto = clientPhoto;
	}
	private Integer ownerPartyId;

	public Integer getOwnerPartyId() {
		return ownerPartyId;
	}
	public void setOwnerPartyId(Integer ownerPartyId) {
		this.ownerPartyId = ownerPartyId;
	}
	
}
