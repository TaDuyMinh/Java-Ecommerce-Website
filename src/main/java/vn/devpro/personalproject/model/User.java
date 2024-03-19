package vn.devpro.personalproject.model;

import java.util.ArrayList;
import java.util.Collection;
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

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;


@Entity
@Table(name = "tbl_user")
public class User extends BaseModel implements UserDetails {

	@Column(name = "username", length = 120, nullable = false)
	private String username;

	@Column(name = "password", length = 120, nullable = false)
	private String password;

	@Column(name = "name", length = 120, nullable = true)
	private String name;

	@Column(name = "email", length = 200, nullable = true)
	private String email;

	@Column(name = "mobile", length = 120, nullable = true)
	private String mobile;

	@Column(name = "address", length = 300, nullable = true)
	private String address;

	@Column(name = "description", length = 500, nullable = true)
	private String description;

	public User() {
		super();
	}

	public User(String username, String password, String name, String email, String mobile, String address,
			String description, List<Role> roles, User userCreateUser, User userUpdateUser, Set<User> userCreateUsers,
			Set<User> userUpdateUsers, Set<Category> userCreateCategories) {
		super();
		this.username = username;
		this.password = password;
		this.name = name;
		this.email = email;
		this.mobile = mobile;
		this.address = address;
		this.description = description;
		this.roles = roles;
		this.userCreateUser = userCreateUser;
		this.userUpdateUser = userUpdateUser;
		this.userCreateUsers = userCreateUsers;
		this.userUpdateUsers = userUpdateUsers;
		this.userCreateCategories = userCreateCategories;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getMobile() {
		return mobile;
	}

	public void setMobile(String mobile) {
		this.mobile = mobile;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public List<Role> getRoles() {
		return roles;
	}

	public void setRoles(List<Role> roles) {
		this.roles = roles;
	}

	public User getUserCreateUser() {
		return userCreateUser;
	}

	public void setUserCreateUser(User userCreateUser) {
		this.userCreateUser = userCreateUser;
	}

	public User getUserUpdateUser() {
		return userUpdateUser;
	}

	public void setUserUpdateUser(User userUpdateUser) {
		this.userUpdateUser = userUpdateUser;
	}

	public Set<User> getUserCreateUsers() {
		return userCreateUsers;
	}

	public void setUserCreateUsers(Set<User> userCreateUsers) {
		this.userCreateUsers = userCreateUsers;
	}

	public Set<User> getUserUpdateUsers() {
		return userUpdateUsers;
	}

	public void setUserUpdateUsers(Set<User> userUpdateUsers) {
		this.userUpdateUsers = userUpdateUsers;
	}

	public Set<Category> getUserCreateCategories() {
		return userCreateCategories;
	}

	public void setUserCreateCategories(Set<Category> userCreateCategories) {
		this.userCreateCategories = userCreateCategories;
	}

	public Set<Category> getUserUpdateCategories() {
		return userUpdateCategories;
	}

	public void setUserUpdateCategories(Set<Category> userUpdateCategories) {
		this.userUpdateCategories = userUpdateCategories;
	}

	public Set<Product> getUserCreateProducts() {
		return userCreateProducts;
	}

	public void setUserCreateProducts(Set<Product> userCreateProducts) {
		this.userCreateProducts = userCreateProducts;
	}

	public Set<Product> getUserUpdateProducts() {
		return userUpdateProducts;
	}

	public void setUserUpdateProducts(Set<Product> userUpdateProducts) {
		this.userUpdateProducts = userUpdateProducts;
	}

	public Set<Role> getUserCreateRoles() {
		return userCreateRoles;
	}

	public void setUserCreateRoles(Set<Role> userCreateRoles) {
		this.userCreateRoles = userCreateRoles;
	}

	public Set<Role> getUserUpdateRoles() {
		return userUpdateRoles;
	}

	public void setUserUpdateRoles(Set<Role> userUpdateRoles) {
		this.userUpdateRoles = userUpdateRoles;
	}
	

	// Mapping many to many : user to role
	@ManyToMany(cascade = CascadeType.ALL, fetch = FetchType.EAGER, mappedBy = "users")
	private List<Role> roles = new ArrayList<Role>();

// add remove elements out of relational user-role list
	public void addRelationalUserRole(Role role) {
		role.getUsers().add(this);
	}

	public void removeRelationalUserRole(Role role) {
		role.getUsers().remove(this);
		roles.remove(role);
	}

	// -----------Mapping many-to-one: user-to-user (user create
	// user)------------------
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "create_by")
	private User userCreateUser;

	// -----------Mapping many-to-one: user-to-user (user update
	// user)------------------
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "update_by")
	private User userUpdateUser;

	// ---------Mapping one-to-many: user-to-user (for user create user)-----------
	@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY, mappedBy = "userCreateUser")
	private Set<User> userCreateUsers = new HashSet<User>();

	// ---------Mapping one-to-many: user-to-user (for user update user)-----------
	@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY, mappedBy = "userUpdateUser")
	private Set<User> userUpdateUsers = new HashSet<User>();

	// One to many : user to create category

	@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY, mappedBy = "userCreateCategory")
	private Set<Category> userCreateCategories = new HashSet<Category>();

//	public void addRelationalCreateCategory(Category category) {
//		userCreateCategories.add(category);
//		category.setUserCreateCategory(this);
//	}
//
//	void removeRelationalCreateCategory(Category category) {
//		userCreateCategories.remove(category);
//		category.setUserCreateCategory(null);
//	}

	// One to many : user to update category

	@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY, mappedBy = "userUpdateCategory")
	private Set<Category> userUpdateCategories = new HashSet<Category>();

//	public void addRelationalUpdateCategory(Category category) {
//		userUpdateCategories.add(category);
//		category.setUserUpdateCategory(this);
//	}
//
//	void removeRelationalUpdateCategory(Category category) {
//		userUpdateCategories.remove(category);
//		category.setUserUpdateCategory(null);
//	}

	// One to many : user to create product

	@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY, mappedBy = "userCreateProduct")
	private Set<Product> userCreateProducts = new HashSet<Product>();

//	public void addRelationalCreateProduct(Product product) {
//		userCreateProducts.add(product);
//		product.setUserCreateProduct(this);
//	}
//
//	void removeRelationalCreateProduct(Product product) {
//		userCreateProducts.remove(product);
//		product.setUserCreateProduct(null);
//	}

	// One to many : user to update product

	@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY, mappedBy = "userUpdateProduct")
	private Set<Product> userUpdateProducts = new HashSet<Product>();

//	public void addRelationalUpdateProduct(Product product) {
//		userUpdateProducts.add(product);
//		product.setUserUpdateProduct(this);
//	}
//
//	void removeRelationalUpdateProduct(Product product) {
//		userUpdateProducts.remove(product);
//		product.setUserUpdateProduct(null);
//	}

	// One to many : user to create role

	@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY, mappedBy = "userCreateRole")
	private Set<Role> userCreateRoles = new HashSet<Role>();

//	public void addRelationalCreateRole(Role role) {
//		userCreateRoles.add(role);
//		role.setUserCreateRole(this);
//	}
//
//	void removeRelationalCreateRole(Role role) {
//		userCreateRoles.remove(role);
//		role.setUserCreateRole(null);
//	}

	// One to many : user to update role

	@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY, mappedBy = "userUpdateRole")
	private Set<Role> userUpdateRoles = new HashSet<Role>();

//	public void addRelationalUpdateRole(Role role) {
//		userUpdateRoles.add(role);
//		role.setUserUpdateRole(this);
//	}
//
//	void removeRelationalUpdateRole(Role role) {
//		userUpdateRoles.remove(role);
//		role.setUserUpdateRole(null);
//	}
	@Override
	public Collection<? extends GrantedAuthority> getAuthorities() {
		// TODO Auto-generated method stub
		return this.roles;
	}

	@Override
	public boolean isAccountNonExpired() {
		// TODO Auto-generated method stub
		return true;
	}

	@Override
	public boolean isAccountNonLocked() {
		// TODO Auto-generated method stub
		return true;
	}

	@Override
	public boolean isCredentialsNonExpired() {
		// TODO Auto-generated method stub
		return true;
	}

	@Override
	public boolean isEnabled() {
		// TODO Auto-generated method stub
		return true;
	}
}
