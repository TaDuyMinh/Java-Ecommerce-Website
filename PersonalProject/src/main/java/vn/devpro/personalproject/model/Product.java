package vn.devpro.personalproject.model;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;


@Entity
@Table(name = "tbl_product")
public class Product extends BaseModel {

	@Column(name = "name", length = 120, nullable = false)
	private String name;

	@Column(name = "avatar", length = 300, nullable = true)
	private String avatar;

	@Column(name = "price", nullable = true)
	private BigDecimal price;

	@Column(name = "sale_price", nullable = true)
	private BigDecimal salePrice;

	@Column(name = "short_description", length = 500, nullable = true)
	private String shortDescription;

	@Column(name = "detail_description", nullable = true)
	private String detailDescription;

	@Column(name = "is_hot", nullable = true)
	private Boolean isHot = Boolean.FALSE;

	@Column(name = "seo", length = 1000, nullable = true)
	private String seo;

	public Product() {
		super();
	}

	public Product(String name, String avatar, BigDecimal price, BigDecimal salePrice, String shortDescription,
			String detailDescription, Boolean isHot, String seo, Category category, List<SaleOrder> saleOrders,
			Set<ProductImage> productImages, User userCreateProduct, User userUpdateProduct) {
		super();
		this.name = name;
		this.avatar = avatar;
		this.price = price;
		this.salePrice = salePrice;
		this.shortDescription = shortDescription;
		this.detailDescription = detailDescription;
		this.isHot = isHot;
		this.seo = seo;
		this.category = category;
		this.saleOrders = saleOrders;
		this.productImages = productImages;
		this.userCreateProduct = userCreateProduct;
		this.userUpdateProduct = userUpdateProduct;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getAvatar() {
		return avatar;
	}

	public void setAvatar(String avatar) {
		this.avatar = avatar;
	}

	public BigDecimal getPrice() {
		return price;
	}

	public void setPrice(BigDecimal price) {
		this.price = price;
	}

	public BigDecimal getSalePrice() {
		return salePrice;
	}

	public void setSalePrice(BigDecimal salePrice) {
		this.salePrice = salePrice;
	}

	public String getShortDescription() {
		return shortDescription;
	}

	public void setShortDescription(String shortDescription) {
		this.shortDescription = shortDescription;
	}

	public String getDetailDescription() {
		return detailDescription;
	}

	public void setDetailDescription(String detailDescription) {
		this.detailDescription = detailDescription;
	}

	public Boolean getIsHot() {
		return isHot;
	}

	public void setIsHot(Boolean isHot) {
		this.isHot = isHot;
	}

	public String getSeo() {
		return seo;
	}

	public void setSeo(String seo) {
		this.seo = seo;
	}

	public List<SaleOrder> getSaleOrders() {
		return saleOrders;
	}

	public void setSaleOrders(List<SaleOrder> saleOrders) {
		this.saleOrders = saleOrders;
	}

	public Set<ProductImage> getProductImages() {
		return productImages;
	}

	public void setProductImages(Set<ProductImage> productImages) {
		this.productImages = productImages;
	}

	// -------------------Mapping many-to-one : product-to-category----------
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "category_id")
	private Category category;

	public Category getCategory() {
		return category;
	}

	public void setCategory(Category category) {
		this.category = category;
	}

//----------Many to Many, product to sale order product
	@ManyToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY, mappedBy = "products")
	private List<SaleOrder> saleOrders = new ArrayList<SaleOrder>();

	// add remove elements out of relational product-saleOrder list
//	public void addRelationalProductSaleOrder(SaleOrder saleOrder) {
//		saleOrder.getProducts().add(this);
//	}
//
//	public void removeRelationalProductSaleOrder(SaleOrder saleOrder) {
//		saleOrder.getProducts().remove(this);
//		saleOrders.remove(saleOrder);
//	}
	// One to many: product to product image

	@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY, mappedBy = "product")
	private Set<ProductImage> productImages = new HashSet<ProductImage>();

	public void addRelationalProductImage(ProductImage productImage) {
		productImages.add(productImage);
		productImage.setProduct(this);
	}

	public void removeRelationalProductImage(ProductImage productImage) {
		productImages.remove(productImage);
		productImage.setProduct(null);
	}

	// many to one : product to user create

	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "create_by")
	private User userCreateProduct;

	public User getUserCreateProduct() {
		return userCreateProduct;
	}

	public void setUserCreateProduct(User userCreateProduct) {
		this.userCreateProduct = userCreateProduct;
	}

	// many to one : product to user update

	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "update_by")
	private User userUpdateProduct;

	public User getUserUpdateProduct() {
		return userUpdateProduct;
	}

	public void setUserUpdateProduct(User userUpdateProduct) {
		this.userUpdateProduct = userUpdateProduct;
	}

}
