package vn.devpro.personalproject.controller.frontend;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import vn.devpro.personalproject.controller.BaseController;
import vn.devpro.personalproject.dto.PersonalProjectConstants;
import vn.devpro.personalproject.dto.SearchModel;
import vn.devpro.personalproject.model.Category;
import vn.devpro.personalproject.model.Product;
import vn.devpro.personalproject.service.CategoryService;
import vn.devpro.personalproject.service.ProductService;

@Controller
public class UserShopController extends BaseController implements PersonalProjectConstants{

	@Autowired
	private ProductService productService;

	@Autowired
	private CategoryService categoryService;

	@RequestMapping(value = "/shop", method = RequestMethod.GET)
	public String detail(final Model model, final HttpServletRequest request, final HttpServletResponse respond)
			throws IOException {

		List<Category> categories = categoryService.findAllActive();
		model.addAttribute("categories", categories);

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

		if (allProducts.size() <= SIZE_OF_PAGE_SHOP) {
			productSearch.setCurrentPage(1);
		}

		int firstIndex = (productSearch.getCurrentPage() - 1) * SIZE_OF_PAGE_SHOP;
		int index = firstIndex, count = 0;
		while (index < allProducts.size() && count < SIZE_OF_PAGE_SHOP) {
			products.add(allProducts.get(index));
			index++;
			count++;
		}

		// phan trang
		productSearch.setSizeOfPage(SIZE_OF_PAGE_SHOP);
		productSearch.setTotalItems(allProducts.size());

		model.addAttribute("products", products);
		model.addAttribute("productSearch", productSearch);

		return "frontend/shop";
	}

}
