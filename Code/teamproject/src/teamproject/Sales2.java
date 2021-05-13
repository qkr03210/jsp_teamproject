package teamproject;

public class Sales2 {
	private String name;
	private int price;
	private int amount;
	private int totalPrice;
	
	@Override
	public String toString() {
		return "Sales2 [name=" + name + ", price=" + price + ", amount=" + amount + ", totalPrice=" + totalPrice
				+ ", toString()=" + super.toString() + "]";
	}

	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public int getAmount() {
		return amount;
	}
	public void setAmount(int amount) {
		this.amount = amount;
	}
	public int getTotalPrice() {
		return totalPrice;
	}
	public void setTotalPrice(int totalPrice) {
		this.totalPrice = totalPrice;
	}

}
