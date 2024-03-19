package vn.devpro.personalproject.controller.frontend;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import vn.devpro.personalproject.controller.BaseController;
import vn.devpro.personalproject.model.Product;
import vn.devpro.personalproject.service.ProductService;
@Controller
public class UserProductController extends BaseController{
	@Autowired
	ProductService productService;
	
	@RequestMapping(value = "/product-detail/{productId}", method = RequestMethod.GET)
	public String productDetail(final Model model, final HttpServletRequest request, final HttpServletResponse response,
			@PathVariable("productId") int productId) throws IOException {
		List<Product> products = productService.findAllActive();
		Product product = productService.getById(productId);
		model.addAttribute("product", product);
		model.addAttribute("products", products);

		// productgetbyid
		return "frontend/product-detail";
	}
}
