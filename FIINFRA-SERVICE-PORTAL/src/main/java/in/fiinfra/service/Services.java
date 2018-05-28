package in.fiinfra.service;

public enum Services {

	getPicklistValueList("getPicklistValueList"), getSubxList("getListOFSubx"), saveSubx(
			"saveSubx"), getSubxProducts("getSubxProducts"), getOrderList(
			"getOrderList"), getPaymentList("getPaymentList"), savePayment(
			"savePayment"), saveOrder("saveOrder"), getSubxByProductAndPartyId(
			"getSubxByProductAndPartyId"), getSubxById("getSubxById"), getOrderById(
			"getOrderById"), getSubxProductByBuId("getSubxProductByBuId"), createSubx(
			"createSubx"), GET_PARTY_PROFILE("GET_PARTY_PROFILE"), getPartyName(
			"getPartyName"), getPartnerList("getPartnerList"), getCurrentSubx(
			"getCurrentSubx"), getPartyProducts("getPartyProducts"), getPGReports(
			"getPGReports"), getProducts("getProducts"), saveProduct(
			"saveProduct"), saveNach("saveNach"), getNachList("getNachList"), getCurrentNach(
			"getCurrentNach"), getFileStoragePath("getFileStoragePath"), addDocument(
			"addDocument"), getResourceUtilReport("getResourceUtilReport"), getDocument("getDocument"), 
			getAutoPaymentList("getAutoPaymentList"),sendAutoPayment("sendAutoPayment");

	private Services(String value) {
		this.value = value;
	}

	private final String value;

	@Override
	public String toString() {
		return this.value;
	}

	public String getValue() {
		return this.value;
	}
}
