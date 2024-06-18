package vn.devpro.personalproject.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import vn.devpro.personalproject.dto.SearchModel;
import vn.devpro.personalproject.model.User;

@Service
public class UserService extends BaseService<User> {
	@Override
	public Class<User> clazz() {
		return User.class;
	}

	public List<User> findAllActive() {
		return super.executeNativeSql("SELECT * FROM tbl_user WHERE status = 1");
	}

	@Transactional
	public void deleteUserById(int id) {
		super.deleteById(id);
	}

	// ----------Search user----------------
	public List<User> searchUser(SearchModel userSearch) {
		// tao cau lenh sql
		String sql = "SELECT * FROM tbl_user p WHERE 1=1";
		// tim kiem voi status
		if (userSearch.getStatus() != 2) {
			sql += " AND p.status=" + userSearch.getStatus();
		}
		// tim kiem voi category
//		if (userSearch.getRoleId() != 0) {
//			sql += " AND p.role_id=" + userSearch.getRoleId();
//
//			// tim kiem theo keyword
//		}
		if (userSearch.getKeyword() != "keyword") {
			String keyword = userSearch.getKeyword().toLowerCase();
			sql += " AND (LOWER(p.name) like '%" + keyword + "%'" + "OR LOWER(p.mobile) like '%" + keyword + "%'"
					+ "OR LOWER(p.username) like '%" + keyword + "%'" + "OR LOWER(p.email) like '%" + keyword + "%'"
					+ "OR LOWER(p.address) like '%" + keyword + "%')";
		}

		// tim theo cac Date
		if (!StringUtils.isEmpty(userSearch.getBeginDate()) && !StringUtils.isEmpty(userSearch.getEndDate())) {
			String beginDate = userSearch.getBeginDate();
			String endDate = userSearch.getEndDate();
			sql += " AND p.create_date BETWEEN '" + beginDate + "' AND '" + endDate + "'";
		}
		return super.executeNativeSql(sql);

	}
}
