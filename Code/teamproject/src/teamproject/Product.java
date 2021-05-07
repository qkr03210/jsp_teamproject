package teamproject;

public class Product {
	@Override
	public String toString() {
		return "Product [code=" + code + ", name=" + name + ", price=" + price + ", date=" + date + ", type=" + type
				+ ", amount=" + amount + ", classific=" + classific + "]";
	}
	public int getCode() {
		return code;
	}
	public void setCode(int code) {
		this.code = code;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public int getAmount() {
		return amount;
	}
	public void setAmount(int amount) {
		this.amount = amount;
	}
	public String getClassific() {
		return classific;
	}
	public void setClassific(String classific) {
		this.classific = classific;
	}
	private int code;
	private String name;
	private String price;
	private String date;
	private String type;
	private int amount;
	private String classific;
}
