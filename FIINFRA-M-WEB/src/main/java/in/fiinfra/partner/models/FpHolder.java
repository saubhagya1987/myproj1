package in.fiinfra.partner.models;

public class FpHolder {
	private int partyId;
	ProductOffering[] products;

	public int getPartyId() {
		return partyId;
	}

	public void setPartyId(int partyId) {
		this.partyId = partyId;
	}

	public ProductOffering[] getProducts() {
		return products;
	}

	public void setProducts(ProductOffering[] products) {
		this.products = products;
	}
}
