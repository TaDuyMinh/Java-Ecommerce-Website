package vn.devpro.personalproject.controller.backend;

import java.io.IOException;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import vn.devpro.personalproject.controller.BaseController;
import vn.devpro.personalproject.model.User;
import vn.devpro.personalproject.model.Category;
import vn.devpro.personalproject.service.UserService;
import vn.devpro.personalproject.service.CategoryService;

@Controller
public class AdminCategoryController extends BaseController {

	// Su dung service de thao tac du lieu voi database
	@Autowired
	private CategoryService categoryService;
	@Autowired
	private UserService userService;

	@RequestMapping(value = "/admin/category-list", method = RequestMethod.GET)
	public String categoryList(final Model model) throws IOException {
		List<Category> categories = categoryService.findAllActive();
		model.addAttribute("categories", categories);
		return "backend/category-list";

	}

	@RequestMapping(value = "/admin/category-add", method = RequestMethod.GET)
	public String categoryAdd(final Model model) throws IOException {

		List<Category> categories = categoryService.findAll();
		model.addAttribute("categories", categories);

		List<User> users = userService.findAll();
		model.addAttribute("users", users);

		Category category = new Category();
		category.setCreateDate(new Date());
		category.setUpdateDate(new Date());

		model.addAttribute("category", category);

		return "backend/category-add";

	}

	// save category to db
	@RequestMapping(value = "/admin/category-add-save", method = RequestMethod.POST)
	public String categoryAddSave(final Model model, final HttpServletRequest request,
			@ModelAttribute("category") Category category) throws IOException {


			categoryService.saveOrUpdate(category);

		return "backend/category-add";
	}

	// Edit category
	@RequestMapping(value = "/admin/category-edit/{categoryId}", method = RequestMethod.GET)
	public String categoryEdit(final Model model, @PathVariable("categoryId") int categoryId) throws IOException {

		Category category = categoryService.getById(categoryId);
		model.addAttribute("category", category);

		List<Category> categories = categoryService.findAll();
		model.addAttribute("categories", categories);
		
		List<User> users = userService.findAll();
		model.addAttribute("users", users);

		return "backend/category-edit";

	}

	@RequestMapping(value = "/admin/category-edit-save", method = RequestMethod.POST)
	public String categoryEditSave(final Model model, final HttpServletRequest request,
			@ModelAttribute("category") Category category) throws IOException {

		categoryService.saveOrUpdate(category);

		return "redirect:/admin/category-list";
	}

	// ------Inactive category

	@RequestMapping(value = "/admin/category-delete/{categoryId}", method = RequestMethod.GET)
	public String categoryInactive(final Model model, @PathVariable("categoryId") int categoryId // Lay category id khi click Edit
	) throws IOException {

		// Lay category tu tbl_category trong database
		Category category = categoryService.getById(categoryId);
		category.setStatus(Boolean.FALSE);

		categoryService.saveOrUpdate(category);

		return "redirect:/admin/category-list";
	}

}
