package teamproject;

public class Sales {
	@Override
	public String toString() {
		return "Sales [idx=" + idx + ", salesNumber=" + salesNumber + ", product=" + product + ", amount=" + amount
				+ ", client=" + client + ", toString()=" + super.toString() + "]";
	}
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public String getSalesNumber() {
		return salesNumber;
	}
	public void setSalesNumber(String salesNumber) {
		this.salesNumber = salesNumber;
	}
	public String getProduct() {
		return product;
	}
	public void setProduct(String product) {
		this.product = product;
	}
	public int getAmount() {
		return amount;
	}
	public void setAmount(int amount) {
		this.amount = amount;
	}
	public String getClient() {
		return client;
	}
	public void setClient(String client) {
		this.client = client;
	}
	private int idx;
	private String salesNumber;
	private String product;
	private int amount;
	private String client;
}
