package vn.devpro.personalproject.controller.backend;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import vn.devpro.personalproject.dto.PersonalProjectConstants;
import vn.devpro.personalproject.dto.SearchModel;
import vn.devpro.personalproject.controller.BaseController;
import vn.devpro.personalproject.model.Category;
import vn.devpro.personalproject.model.Product;
import vn.devpro.personalproject.model.User;
import vn.devpro.personalproject.service.CategoryService;
import vn.devpro.personalproject.service.ProductService;
import vn.devpro.personalproject.service.UserService;

@Controller
public class AdminProductController extends BaseController implements PersonalProjectConstants {

	// Su dung service de thao tac du lieu voi database
	@Autowired
	private ProductService productService;

	@Autowired
	private CategoryService categoryService;

	@Autowired
	private UserService userService;

	@RequestMapping(value = "/admin/product-list", method = RequestMethod.GET)
	public String productList(final Model model, final HttpServletRequest request) throws IOException {

		List<Category> categories = categoryService.findAllActive();
		model.addAttribute("categories", categories);

//		List<Product> products = productService.findAll();

		SearchModel productSearch = new SearchModel();

		// tim theo status
		productSearch.setStatus(1);
		if (!StringUtils.isEmpty(request.getParameter("status"))) {
			productSearch.setStatus(Integer.parseInt(request.getParameter("status")));
		}

		// tim theo category
		productSearch.setCategoryId(0);
		if (!StringUtils.isEmpty(request.getParameter("categoryId"))) {
			productSearch.setCategoryId(Integer.parseInt(request.getParameter("categoryId")));
		}

		// tim theo keyword
		productSearch.setKeyword("keyword");
		if (!StringUtils.isEmpty(request.getParameter("keyword"))) {
			productSearch.setKeyword(request.getParameter("keyword"));
		}

		// tim theo cac Date
		productSearch.setBeginDate(request.getParameter("beginDate"));
		productSearch.setEndDate(request.getParameter("endDate"));

		// Bat dau phan trang
		if (!StringUtils.isEmpty(request.getParameter("page"))) {
			productSearch.setCurrentPage(Integer.parseInt(request.getParameter("page")));
		} else {
			productSearch.setCurrentPage(1);
		}

		List<Product> allProducts = productService.searchProduct(productSearch);

		List<Product> products = new ArrayList<Product>();

		if (allProducts.size() <= SIZE_OF_PAGE) {
			productSearch.setCurrentPage(1);
		}

		int firstIndex = (productSearch.getCurrentPage() - 1) * SIZE_OF_PAGE;
		int index = firstIndex, count = 0;
		while (index < allProducts.size() && count < SIZE_OF_PAGE) {
			products.add(allProducts.get(index));
			index++;
			count++;
		}

		// phan trang
		productSearch.setSizeOfPage(SIZE_OF_PAGE);
		productSearch.setTotalItems(allProducts.size());

		model.addAttribute("products", products);
		model.addAttribute("productSearch", productSearch);
		return "backend/product-list";

	}

	@RequestMapping(value = "/admin/product-add", method = RequestMethod.GET)
	public String productAdd(final Model model) throws IOException {

		List<Product> products = productService.findAll();
		model.addAttribute("products", products);

		List<User> users = userService.findAll();
		model.addAttribute("users", users);

		List<Category> categories = categoryService.findAllActive();
		model.addAttribute("categories", categories);

		Product product = new Product();
		product.setCreateDate(new Date());
		product.setUpdateDate(new Date());
		product.setAvatar(new String());

		model.addAttribute("product", product);

		return "backend/product-add";

	}

	@RequestMapping(value = "/admin/product-add-save", method = RequestMethod.POST)
	public String productAddSave(final Model model, final HttpServletRequest request,
			@RequestParam("avatarFile") MultipartFile avatarFile,
			@RequestParam("imageFiles") MultipartFile[] imageFiles, @ModelAttribute("product") Product product)
			throws IOException {

		productService.saveAddProduct(product, avatarFile, imageFiles);

		return "backend/product-add";
	}

	@RequestMapping(value = "/admin/product-edit/{productId}", method = RequestMethod.GET)
	public String productEdit(final Model model, @PathVariable("productId") int productId) throws IOException {

		Product product = productService.getById(productId);
		model.addAttribute("product", product);

		List<Product> products = productService.findAll();
		model.addAttribute("products", products);

		List<User> users = userService.findAll();
		model.addAttribute("users", users);

		List<Category> categories = categoryService.findAll();
		model.addAttribute("categories", categories);

		return "backend/product-edit";

	}

	@RequestMapping(value = "/admin/product-edit-save", method = RequestMethod.POST)
	public String productEditSave(final Model model, final HttpServletRequest request,
			@ModelAttribute("product") Product product) throws IOException {

		productService.saveOrUpdate(product);

		return "redirect:/admin/product-list";
	}

//	------Inactive product 

	@RequestMapping(value = "/admin/product-delete/{productId}", method = RequestMethod.GET)
	public String productInactive(final Model model, @PathVariable("productId") int productId // Lay product id khi
																								// click Edit
	) throws IOException {

		// Lay product tu tbl_product trong database
		Product product = productService.getById(productId);
		product.setStatus(Boolean.FALSE);

		productService.saveOrUpdate(product);

		return "redirect:/admin/product-list";
	}

}
