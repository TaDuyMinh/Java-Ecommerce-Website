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
import vn.devpro.personalproject.model.Role;
import vn.devpro.personalproject.model.User;
import vn.devpro.personalproject.service.RoleService;
import vn.devpro.personalproject.service.UserService;

@Controller
public class AdminRoleController extends BaseController{

	@Autowired
	private RoleService roleService;

	@Autowired
	private UserService userService;

	@RequestMapping(value = "/admin/role-list", method = RequestMethod.GET)
	public String roleList(final Model model) throws IOException {
		List<Role> roles = roleService.findAllActive();
		model.addAttribute("roles", roles);
		return "backend/role-list";
	}

	// -------------------- Add new user-----------------------------------------
	@RequestMapping(value = "/admin/role-add", method = RequestMethod.GET)
	public String roleAdd(final Model model) throws IOException {
		// Lay danh sach user tu tbl_user trong database

		List<User> users = userService.findAll();
		model.addAttribute("users", users);

		List<Role> roles = roleService.findAll();
		model.addAttribute("roles", roles);

		Role role = new Role();
		role.setCreateDate(new Date());
		role.setUpdateDate(new Date());

		model.addAttribute("role", role);

		return "backend/role-add";
	}

	// Save user to database
	@RequestMapping(value = "/admin/role-add-save", method = RequestMethod.POST)
	public String roleAddSave(final Model model, final HttpServletRequest request, @ModelAttribute("role") Role role)
			throws IOException {

		// Luu user vao bang tbl_user
		roleService.saveOrUpdate(role);
		// Khong chon role thi khong luu user
		return "backend/role-add";
	}

	@RequestMapping(value = "/admin/role-edit/{roleId}", method = RequestMethod.GET)
	public String roleEdit(final Model model, @PathVariable("roleId") int roleId) throws IOException {

		Role role = roleService.getById(roleId);
		model.addAttribute("role", role);

		List<Role> roles = roleService.findAll();
		model.addAttribute("roles", roles);

		List<User> users = userService.findAll();
		model.addAttribute("users", users);

		return "backend/role-edit";

	}

	@RequestMapping(value = "/admin/role-edit-save", method = RequestMethod.POST)
	public String roleEditSave(final Model model, final HttpServletRequest request, @ModelAttribute("role") Role role)
			throws IOException {

		roleService.saveOrUpdate(role);

		return "redirect:/admin/role-list";

	}
	// ------Inactive role

	@RequestMapping(value = "/admin/role-delete/{roleId}", method = RequestMethod.GET)
	public String roleInactive(final Model model, @PathVariable("roleId") int roleId // Lay role id khi click Edit
	) throws IOException {

		// Lay role tu tbl_role trong database
		Role role = roleService.getById(roleId);
		role.setStatus(Boolean.FALSE);

		roleService.saveOrUpdate(role);

		return "redirect:/admin/role-list";
	}

}
