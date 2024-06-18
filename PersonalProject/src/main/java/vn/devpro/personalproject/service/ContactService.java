package vn.devpro.personalproject.service;

import java.util.List;

import org.springframework.stereotype.Service;

import vn.devpro.personalproject.model.Contact;

@Service
public class ContactService extends BaseService<Contact> {
	@Override
	public Class<Contact> clazz() {
		return Contact.class;
	}

	public List<Contact> findAllActive() {
		return super.executeNativeSql("SELECT * FROM tbl_contact WHERE status = 1");
	}

	public void deleteContactById(int id) {
		super.deleteById(id);
	}
}
