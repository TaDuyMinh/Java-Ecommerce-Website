package vn.devpro.personalproject.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.web.bind.annotation.ModelAttribute;

import vn.devpro.personalproject.model.User;
import vn.devpro.personalproject.dto.Cart;

public class BaseController {
	@ModelAttribute("title")
	public String getTitle() {
		return "Personal Project";
	}

	@ModelAttribute("totalCartProducts")
	public Integer getTotalCartProducts(final HttpServletRequest request) {
		HttpSession session = request.getSession();
		if (session.getAttribute("cart") != null) {
			Cart cart = (Cart) session.getAttribute("cart");
			return cart.totalCartProducts();
		}
		return 0;
	}

	@ModelAttribute("loginedUser")
	public User getLoginedUser() {

		Object loginedUser = SecurityContextHolder.getContext().getAuthentication().getPrincipal();

		if (loginedUser != null && loginedUser instanceof UserDetails) {
			User user = (User) loginedUser;
//			System.out.println("name: " + user.getName());
//						System.out.println("user email: " + user.getEmail());
			return user;
		}
		return new User();
	}

	// Kiem tra da login hay chua?
	@ModelAttribute("isLogined")
	public boolean isLogined() {
		Object loginedUser = SecurityContextHolder.getContext().getAuthentication().getPrincipal();

		if (loginedUser != null && loginedUser instanceof UserDetails) {
			return true;
		}
		return false;
	}
}
