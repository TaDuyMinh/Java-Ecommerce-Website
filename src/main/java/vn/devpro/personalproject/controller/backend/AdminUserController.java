package vn.devpro.personalproject.controller.backend;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import vn.devpro.personalproject.controller.BaseController;
import vn.devpro.personalproject.dto.PersonalProjectConstants;
import vn.devpro.personalproject.dto.SearchModel;
import vn.devpro.personalproject.model.Role;
import vn.devpro.personalproject.model.User;
import vn.devpro.personalproject.service.RoleService;
import vn.devpro.personalproject.service.UserService;

@Controller
public class AdminUserController extends BaseController implements PersonalProjectConstants {

	// Su dung service de theo tac du lieu voi database (tbl_user)
	@Autowired
	private UserService userService;

	@Autowired
	private RoleService roleService;

//--------------user list-----------------------------------------------------	
	@RequestMapping(value = "/admin/user-list", method = RequestMethod.GET)
	public String userList(final Model model, final HttpServletRequest request) throws IOException {
		// Lay danh sach user tu tbl_user trong database
		List<Role> roles = roleService.findAllActive();
		model.addAttribute("roles", roles);

		SearchModel userSearch = new SearchModel();

		// tim theo status
		userSearch.setStatus(1);
		if (!StringUtils.isEmpty(request.getParameter("status"))) {
			userSearch.setStatus(Integer.parseInt(request.getParameter("status")));
		}

		// tim theo category
		userSearch.setRoleId(0);
		if (!StringUtils.isEmpty(request.getParameter("roleId"))) {
			userSearch.setRoleId(Integer.parseInt(request.getParameter("roleId")));
		}

		// tim theo keyword
		userSearch.setKeyword("keyword");
		if (!StringUtils.isEmpty(request.getParameter("keyword"))) {
			userSearch.setKeyword(request.getParameter("keyword"));
		}

		// tim theo cac Date
		userSearch.setBeginDate(request.getParameter("beginDate"));
		userSearch.setEndDate(request.getParameter("endDate"));

		// Bat dau phan trang
		if (!StringUtils.isEmpty(request.getParameter("page"))) {
			userSearch.setCurrentPage(Integer.parseInt(request.getParameter("page")));
		} else {
			userSearch.setCurrentPage(1);
		}

		List<User> allUsers = userService.searchUser(userSearch);
		List<User> users = new ArrayList<User>();

		if (allUsers.size() <= SIZE_OF_PAGE) {
			userSearch.setCurrentPage(1);
		}

		int firstIndex = (userSearch.getCurrentPage() - 1) * SIZE_OF_PAGE;
		int index = firstIndex, count = 0;
		while (index < allUsers.size() && count < SIZE_OF_PAGE) {
			users.add(allUsers.get(index));
			index++;
			count++;
		}

		userSearch.setSizeOfPage(SIZE_OF_PAGE);
		userSearch.setTotalItems(allUsers.size());

		model.addAttribute("users", users);
		model.addAttribute("userSearch", userSearch);
		return "backend/user-list";
	}

//-------------------- Add new user-----------------------------------------	
	@RequestMapping(value = "/admin/user-add", method = RequestMethod.GET)
	public String userAdd(final Model model) throws IOException {
		// Lay danh sach user tu tbl_user trong database

		List<User> users = userService.findAll();
		model.addAttribute("users", users);

		List<Role> roles = roleService.findAllActive();
		model.addAttribute("roles", roles);

		User user = new User();
		user.setCreateDate(new Date());

		model.addAttribute("user", user);

		return "backend/user-add";
	}

	// Save user to database
	@RequestMapping(value = "/admin/user-add-save", method = RequestMethod.POST)
	public String userAddSave(final Model model, final HttpServletRequest request, @ModelAttribute("user") User user)
			throws IOException {

		if (!StringUtils.isEmpty(request.getParameter("role"))) {
			int roleId = Integer.parseInt(request.getParameter("role"));
			// Lay role tu tbl_role trong DB
			Role role = roleService.getById(roleId);

			// Luu user_id va role_id vao tbl_user_role
			user.addRelationalUserRole(role);

			// Ma hoa password
			user.setPassword(new BCryptPasswordEncoder(4).encode(user.getPassword()));

			// Luu user vao bang tbl_user
			userService.saveOrUpdate(user);
		}
		// Khong chon role thi khong luu user
		return "backend/user-add";
	}

//-------------------- Edit user-----------------------------------------	
	@RequestMapping(value = "/admin/user-edit/{userId}", method = RequestMethod.GET)
	public String userEdit(final Model model, @PathVariable("userId") int userId // Lay user id khi click Edit
	) throws IOException {

		// Lay user tu tbl_user trong database
		User user = userService.getById(userId);
		model.addAttribute("user", user);

		List<User> users = userService.findAll();
		model.addAttribute("users", users);

		return "backend/user-edit";
	}

	// Save user to database
	@RequestMapping(value = "/admin/user-edit-save", method = RequestMethod.POST)
	public String userEditSave(final Model model, final HttpServletRequest request, @ModelAttribute("user") User user)
			throws IOException {

		userService.saveOrUpdate(user);

		return "redirect:/admin/user-list";
	}

//		//------Delete user
//		
//		@RequestMapping(value = "/admin/user-delete/{userId}", method = RequestMethod.GET)
//		public String userDelete(final Model model,
//				@PathVariable("userId") int userId //Lay user id khi click Edit
//				) throws IOException {
//			
//			//Lay user tu tbl_user trong database
//			userService.deleteUserById(userId);
//			
//			return "redirect:/admin/user-list";
//		}
//		
	// ------Inactive user

	@RequestMapping(value = "/admin/user-delete/{userId}", method = RequestMethod.GET)
	public String userInactive(final Model model, @PathVariable("userId") int userId // Lay user id khi click Edit
	) throws IOException {

		// Lay user tu tbl_user trong database
		User user = userService.getById(userId);
		user.setStatus(Boolean.FALSE);

		userService.saveOrUpdate(user);

		return "redirect:/admin/user-list";
	}

}
