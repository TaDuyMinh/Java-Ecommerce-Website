package vn.devpro.personalproject.model;

import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "tbl_category")
public class Category extends BaseModel {

	@Column(name = "name", length = 300, nullable = false)
	private String name;

	@Column(name = "description", length = 500, nullable = true)
	private String description;

	@Column(name = "seo", length = 1000, nullable = true)
	private String seo;

	public Category() {
		super();
	}

	// ----------Mapping one to many: category to product-----------

	public Category(String name, String description, String seo, Set<Product> products,
			User userCreateCategory) {
		super();
		this.name = name;
		this.description = description;
		this.seo = seo;
		this.products = products;
		this.userCreateCategory = userCreateCategory;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getSeo() {
		return seo;
	}

	public void setSeo(String seo) {
		this.seo = seo;
	}

	public Set<Product> getProducts() {
		return products;
	}

	public void setProducts(Set<Product> products) {
		this.products = products;
	}

	// One to many : category to product
	@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY, mappedBy = "category")
	private Set<Product> products = new HashSet<Product>();

	public void addRelationalProduct(Product product) {
		products.add(product);
		product.setCategory(this);
	}

	void removeRelationalProduct(Product product) {
		products.remove(product);
		product.setCategory(null);
	}

	// many to one : category to user create

	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "create_by")
	private User userCreateCategory;

	public User getUserCreateCategory() {
		return userCreateCategory;
	}

	public void setUserCreateCategory(User userCreateCategory) {
		this.userCreateCategory = userCreateCategory;
	}

	// many to one : category to user update

	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "update_by")
	private User userUpdateCategory;

	public User getUserUpdateCategory() {
		return userUpdateCategory;
	}

	public void setUserUpdateCategory(User userUpdateCategory) {
		this.userUpdateCategory = userUpdateCategory;
	}

}
