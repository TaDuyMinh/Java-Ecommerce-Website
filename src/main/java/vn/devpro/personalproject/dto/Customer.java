package vn.devpro.personalproject.dto;

public class Customer {

	private String txtName;
	private String txtMobile;
	private String txtAddress;
	private String txtEmail;

	public Customer() {
		super();
	}

	public Customer(String txtName, String txtMobile, String txtAddress, String txtEmail) {
		super();
		this.txtName = txtName;
		this.txtMobile = txtMobile;
		this.txtAddress = txtAddress;
		this.txtEmail = txtEmail;
	}

	public String getTxtName() {
		return txtName;
	}

	public void setTxtName(String txtName) {
		this.txtName = txtName;
	}

	public String getTxtMobile() {
		return txtMobile;
	}

	public void setTxtMobile(String txtMobile) {
		this.txtMobile = txtMobile;
	}

	public String getTxtAddress() {
		return txtAddress;
	}

	public void setTxtAddress(String txtAddress) {
		this.txtAddress = txtAddress;
	}

	public String getTxtEmail() {
		return txtEmail;
	}

	public void setTxtEmail(String txtEmail) {
		this.txtEmail = txtEmail;
	}

}
