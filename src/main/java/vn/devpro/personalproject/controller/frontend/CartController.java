package vn.devpro.personalproject.controller.frontend;

import java.io.IOException;
import java.math.BigDecimal;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import vn.devpro.personalproject.dto.CartProduct;
import vn.devpro.personalproject.dto.Customer;
import vn.devpro.personalproject.dto.PersonalProjectConstants;
import vn.devpro.personalproject.model.Product;
import vn.devpro.personalproject.model.SaleOrder;
import vn.devpro.personalproject.model.SaleOrderProduct;
import vn.devpro.personalproject.model.User;
import vn.devpro.personalproject.service.ProductService;
import vn.devpro.personalproject.service.SaleOrderService;
import vn.devpro.personalproject.controller.BaseController;
import vn.devpro.personalproject.dto.Cart;

@Controller
public class CartController extends BaseController implements PersonalProjectConstants {

	@Autowired
	private ProductService productService;

	@Autowired
	private SaleOrderService saleOrderService;

//Add product to cart
	@RequestMapping(value = "/add-to-cart", method = RequestMethod.POST)
	public ResponseEntity<Map<String, Object>> addToCart(final Model model, final HttpServletRequest request,
			final HttpServletResponse response, @RequestBody CartProduct addedProduct) throws IOException {

		// lay session
		HttpSession session = request.getSession();

		Cart cart = null;

		if (session.getAttribute("cart") != null) {
			cart = (Cart) session.getAttribute("cart");
		} else {
			cart = new Cart();
			session.setAttribute("cart", cart);
		}

		// Them hang vao gio
		// +lay product trong DB
		Product dbProduct = productService.getById(addedProduct.getProductId());
		// +Tao moi mot cart's product: 2 truong hop
		int index = cart.findProductById(dbProduct.getId());
		if (index != -1) {
			cart.getCartProducts().get(index)
					.setQuantity(cart.getCartProducts().get(index).getQuantity() + addedProduct.getQuantity());
		} else {
			addedProduct.setAvatar(dbProduct.getAvatar());
			addedProduct.setProductName(dbProduct.getName());
			if (dbProduct.getSalePrice() != null && dbProduct.getSalePrice() != BigDecimal.ZERO) {
				addedProduct.setPrice(dbProduct.getSalePrice());
			} else {
				addedProduct.setPrice(dbProduct.getPrice());
			}

			cart.getCartProducts().add(addedProduct);

		}

		// Thiet lap bien session cho cart

		session.setAttribute("cart", cart);

		// Tra ve tong so san pham
		model.addAttribute("totalCartProducts", cart.totalCartProducts());

		Map<String, Object> jsonResult = new HashMap<String, Object>();
		jsonResult.put("code", 404);
		jsonResult.put("message", " Đã thêm sản phẩm '" + dbProduct.getName() + "' vào giỏ hàng");
		jsonResult.put("totalCartProducts", cart.totalCartProducts());
		return ResponseEntity.ok(jsonResult);
	}

//Delete product in cart
	@RequestMapping(value = "/product-cart-delete/{productId}", method = RequestMethod.GET)
	public String productCartDelete(@PathVariable("productId") int productId, final HttpServletRequest request,
			final Model model) {
		HttpSession session = request.getSession();
		Cart cart = (Cart) session.getAttribute("cart");
		int index = cart.findProductById(productId);
		if (index != -1) {
			cart.getCartProducts().remove(index);
		}
		if (cart.totalCartProducts() == 0) {
			cart = null;
		}
		session.setAttribute("cart", cart);

		return "redirect:/cart-view";
	}

	@RequestMapping(value = "/cart-view", method = RequestMethod.GET)
	public String cartView(final Model model, final HttpServletRequest request, final HttpServletResponse response)
			throws IOException {

		HttpSession session = request.getSession();
		Cart cart = null;
		String message = null;
		String errorMessage = null;

		if (session.getAttribute("cart") != null) {
			cart = (Cart) session.getAttribute("cart");
			model.addAttribute("totalCartPrice");
			message = "Co " + cart.totalCartProducts() + " trong gio hang";
			model.addAttribute("totalCartPrice", cart.totalCartPrice());
		} else {
			message = "Khong co san pham nao trong gio hang";
		}
		model.addAttribute("errorMessage", errorMessage);
		model.addAttribute("message", message);

		if (isLogined()) {
			model.addAttribute("user", getLoginedUser());
		} else {
			model.addAttribute("user", new User());
		}
		return "frontend/cart-view";
	}

//Change the quantity of item in cart
	@RequestMapping(value = "/update-product-quantity", method = RequestMethod.POST)
	public ResponseEntity<Map<String, Object>> updateProductQuantity(final Model model,
			final HttpServletRequest request, final HttpServletResponse response,
			@RequestBody CartProduct updateProduct) throws IOException {
		// lay gio hang
		HttpSession session = request.getSession();
		Cart cart = (Cart) session.getAttribute("cart");
		int index = cart.findProductById(updateProduct.getProductId());
		Integer newQuantity = cart.getCartProducts().get(index).getQuantity() + updateProduct.getQuantity();
		if (newQuantity.intValue() < 1) {
			newQuantity = 1;
		}
		cart.getCartProducts().get(index).setQuantity(newQuantity);
		;

		Map<String, Object> jsonResult = new HashMap<String, Object>();

		jsonResult.put("code", 200);
		jsonResult.put("status", "Success");
		jsonResult.put("newQuantity", newQuantity);

		return ResponseEntity.ok(jsonResult);
	}

// Place order
	@RequestMapping(value = "/place-order", method = RequestMethod.POST)
	public ResponseEntity<Map<String, Object>> placeOrder(final Model model, final HttpServletRequest request,
			final HttpServletResponse response, @RequestBody Customer customer) throws IOException {
		Map<String, Object> jsonResult = new HashMap<String, Object>();
		// Kien tra thong tin bat buoc
		if (customer.getTxtName().isEmpty()) {
			jsonResult.put("code", 100);
			jsonResult.put("message", "Ban chua nhap ho ten");
		} else if (customer.getTxtMobile().isEmpty()) {
			jsonResult.put("code", 101);
			jsonResult.put("message", "Ban chua nhap so dien thoai");
		} else {
			HttpSession session = request.getSession();
			if (session.getAttribute("cart") != null) { // Co gio hang
				Cart cart = (Cart) session.getAttribute("cart");
				if (cart.totalCartProducts().intValue() > 0) {
					SaleOrder saleOrder = new SaleOrder();
					saleOrder.setCustomerName(customer.getTxtName());
					saleOrder.setCustomerMobile(customer.getTxtMobile());
					saleOrder.setCustomerAddress(customer.getTxtAddress());
					saleOrder.setCustomerEmail(customer.getTxtEmail());
					saleOrder.setTotal(cart.totalCartPrice());
					saleOrder.setCode(customer.getTxtMobile());
					saleOrder.setCreateDate(new Date());
					saleOrder.setUpdateDate(new Date());
					saleOrder.setStatus(true);
					// set moi quan he voi user
					User user = new User();
					user.setId(1);
					saleOrder.setUser(user);
					// Duyet danh sach san pham trong gio hang va luu vao tbl_sale_order_product DB
					for (CartProduct cartProduct : cart.getCartProducts()) {
						SaleOrderProduct saleOrderProduct = new SaleOrderProduct();
						saleOrderProduct.setQuantity(cartProduct.getQuantity().intValue());
						;
						Product product = productService.getById(cartProduct.getProductId());
						saleOrderProduct.setProduct(product);
						saleOrder.addRelationalSaleOrderProduct(saleOrderProduct);
					}
					// luu don hang vao tbl_sale_order
					saleOrderService.saveOrUpdate(saleOrder);
					// Xoa gio hang sau khi luu thanh cong
					session.setAttribute("cart", null);
					jsonResult.put("code", 200);
					jsonResult.put("message", "Bạn đã đặt hàng thành công !");
					cart = new Cart();
					session.setAttribute("checkout", true);
				} else {
					jsonResult.put("code", 103);
					jsonResult.put("message", "Có lỗi đường truyền mạng !");
				}
			} else {
				jsonResult.put("code", 104);
				jsonResult.put("message", "Có lỗi đường truyền mạng !");
			}
		}
		return ResponseEntity.ok(jsonResult);
	}
}
