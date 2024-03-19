package vn.devpro.personalproject.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import vn.devpro.personalproject.dto.PersonalProjectConstants;
import vn.devpro.personalproject.dto.SearchModel;
import vn.devpro.personalproject.model.Product;
import vn.devpro.personalproject.model.SaleOrder;

@Service
public class SaleOrderService extends BaseService<SaleOrder> implements PersonalProjectConstants {
	@Override
	public Class<SaleOrder> clazz() {
		return SaleOrder.class;
	}

	public List<SaleOrder> findAllActive() {
		return super.executeNativeSql("SELECT * FROM tbl_sale_order WHERE status = 1");
	}

	public List<SaleOrder> searchSaleOrder(SearchModel orderSearch) {
		// tao cau lenh sql
		String sql = "SELECT * FROM tbl_sale_order p WHERE 1=1";
		// tim kiem voi status
		if (orderSearch.getStatus() != 2) {
			sql += " AND p.status=" + orderSearch.getStatus();
		}

		// tim theo cac Date
		if (!StringUtils.isEmpty(orderSearch.getBeginDate()) && !StringUtils.isEmpty(orderSearch.getEndDate())) {
			String beginDate = orderSearch.getBeginDate();
			String endDate = orderSearch.getEndDate();
			sql += " AND p.create_date BETWEEN '" + beginDate + "' AND '" + endDate + "'";
		}
		return super.executeNativeSql(sql);

	}
}
