package vn.devpro.personalproject.controller.frontend;

import java.io.IOException;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import vn.devpro.personalproject.controller.BaseController;
import vn.devpro.personalproject.dto.PersonalProjectConstants;
import vn.devpro.personalproject.model.Contact;
import vn.devpro.personalproject.service.ContactService;

@Controller
public class ContactController extends BaseController implements PersonalProjectConstants {

	@Autowired
	private ContactService contactService;

	@RequestMapping(value = "/contact", method = RequestMethod.GET)
	public String contact(final Model model, final HttpServletRequest request, final HttpServletResponse respond)
			throws IOException {
		List<Contact> contacts = contactService.findAll();
		model.addAttribute("contacts", contacts);

		Contact contact = new Contact();
		contact.setCreateDate(new Date());
		contact.setUpdateDate(new Date());

		model.addAttribute("contact", contact);
		return "frontend/contact";
	}

	@RequestMapping(value = "/contact-save", method = RequestMethod.POST)
	public String productAddSave(final Model model, final HttpServletRequest request,
			@ModelAttribute("contact") Contact contact) throws IOException {
		contactService.saveOrUpdate(contact);
		return "frontend/contact";
	}

	@RequestMapping(value = "/admin/contact-list", method = RequestMethod.GET)
	public String contactList(final Model model) throws IOException {
		List<Contact> contacts = contactService.findAllActive();
		model.addAttribute("contacts", contacts);
		return "backend/contact-list";

	}

	@RequestMapping(value = "/admin/contact-delete/{contactId}", method = RequestMethod.GET)
	public String contactInactive(final Model model, @PathVariable("contactId") int contactId // Lay contact id khi
																								// click Edit
	) throws IOException {

		// Lay contact tu tbl_contact trong database
		Contact contact = contactService.getById(contactId);
		contact.setStatus(Boolean.FALSE);

		contactService.saveOrUpdate(contact);

		return "redirect:/admin/contact-list";
	}

}
