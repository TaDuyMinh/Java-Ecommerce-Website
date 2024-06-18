package vn.devpro.personalproject.controller.backend;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import vn.devpro.personalproject.controller.BaseController;
import vn.devpro.personalproject.dto.PersonalProjectConstants;

@Controller
public class AdminHomeController extends BaseController implements PersonalProjectConstants {

	@RequestMapping(value = "/admin/home", method = RequestMethod.GET)
	public String homeAdmin(final Model model, final HttpServletRequest request, final HttpServletResponse respond)
			throws IOException {
		return "backend/home";
	}

}
