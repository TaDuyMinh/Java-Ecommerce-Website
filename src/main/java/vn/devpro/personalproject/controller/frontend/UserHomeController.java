package vn.devpro.personalproject.controller.frontend;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import vn.devpro.personalproject.controller.BaseController;
import vn.devpro.personalproject.model.Product;
import vn.devpro.personalproject.service.ProductService;

@Controller
public class UserHomeController extends BaseController {
	@Autowired
	ProductService productService;

	@RequestMapping(value = "/index", method = RequestMethod.GET)
	public String home(final Model model, final HttpServletRequest request, final HttpServletResponse response)
			throws IOException {
		List<Product> products = productService.findAllHot();
		model.addAttribute("products", products);
		return "frontend/index";
	}

	@RequestMapping(value = "/about", method = RequestMethod.GET)
	public String homePage(final Model model, final HttpServletResponse request, final HttpServletResponse response)
			throws IOException {
		return "frontend/about";
	}

}
