package vn.devpro.personalproject.controller.backend;

import java.io.IOException;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import vn.devpro.personalproject.controller.BaseController;
import vn.devpro.personalproject.dto.PersonalProjectConstants;
import vn.devpro.personalproject.dto.SearchModel;
import vn.devpro.personalproject.model.Product;
import vn.devpro.personalproject.model.SaleOrder;
import vn.devpro.personalproject.service.SaleOrderService;

@Controller
public class AdminSaleOrderController extends BaseController implements PersonalProjectConstants {

	@Autowired
	private SaleOrderService saleOrderService;

	@RequestMapping(value = "/admin/order-list", method = RequestMethod.GET)
	public String orderList(final Model model, final HttpServletRequest request) throws IOException {
		// Lay danh sach user tu tbl_user trong database

		SearchModel orderSearch = new SearchModel();

		orderSearch.setStatus(1);
		if (!StringUtils.isEmpty(request.getParameter("status"))) {
			orderSearch.setStatus(Integer.parseInt(request.getParameter("status")));
		}
		orderSearch.setBeginDate(request.getParameter("beginDate"));
		orderSearch.setEndDate(request.getParameter("endDate"));

		// Bat dau phan trang
		if (!StringUtils.isEmpty(request.getParameter("page"))) {
			orderSearch.setCurrentPage(Integer.parseInt(request.getParameter("page")));
		} else {
			orderSearch.setCurrentPage(1);
		}

		List<SaleOrder> allSaleOrders = saleOrderService.searchSaleOrder(orderSearch);

		List<SaleOrder> saleorders = new ArrayList<SaleOrder>();

		if (allSaleOrders.size() <= SIZE_OF_PAGE) {
			orderSearch.setCurrentPage(1);
		}

		int firstIndex = (orderSearch.getCurrentPage() - 1) * SIZE_OF_PAGE;
		int index = firstIndex, count = 0;
		while (index < allSaleOrders.size() && count < SIZE_OF_PAGE) {
			saleorders.add(allSaleOrders.get(index));
			index++;
			count++;
		}

		BigDecimal totalSales = BigDecimal.ZERO;
		for (SaleOrder saleOrder : saleorders) {
			totalSales = totalSales.add(saleOrder.getTotal());
		}
		model.addAttribute("totalSales", totalSales);
		// phan trang
		orderSearch.setSizeOfPage(SIZE_OF_PAGE);
		orderSearch.setTotalItems(allSaleOrders.size());
		model.addAttribute("saleorders", saleorders);
		model.addAttribute("orderSearch", orderSearch);

		return "backend/order-list";
	}

}
