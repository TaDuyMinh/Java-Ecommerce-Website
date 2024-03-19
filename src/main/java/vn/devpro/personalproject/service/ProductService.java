package vn.devpro.personalproject.service;

import java.io.File;
import java.io.IOException;
import java.util.Date;
import java.util.List;

import javax.transaction.Transactional;

import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;
import org.springframework.web.multipart.MultipartFile;

import vn.devpro.personalproject.model.Product;
import vn.devpro.personalproject.model.ProductImage;
import vn.devpro.personalproject.dto.SearchModel;
import vn.devpro.personalproject.dto.PersonalProjectConstants;

@Service
public class ProductService extends BaseService<Product> implements PersonalProjectConstants {
	@Override
	public Class<Product> clazz() {
		return Product.class;
	}

	public List<Product> findAllActive() {
		return super.executeNativeSql("SELECT * FROM tbl_product WHERE status = 1");
	}

	public List<Product> findAllHot() {
		return super.executeNativeSql("SELECT * FROM tbl_product WHERE is_hot = 1");
	}

	@Transactional
	public void deleteProductById(int id) {
		super.deleteById(id);
	}

	// ham kiem tra file co duoc upload ko
	public boolean isUploadFile(MultipartFile file) {
		if (file == null || file.getOriginalFilename().isEmpty()) {
			return false; // ko upload
		}
		return true;
	}

	public boolean isUploadFiles(MultipartFile[] files) {
		if (files == null || files.length == 0) {
			return false; // ko upload
		}
		return true;
	}

	@Transactional
	public Product saveAddProduct(Product product, MultipartFile avatarFile, MultipartFile[] imageFiles)
			throws IOException {
		if (isUploadFile(avatarFile)) {
			String path = FOLDER_UPLOAD + "Product/Avatar/" + avatarFile.getOriginalFilename();
			File file = new File(path);
			avatarFile.transferTo(file);
			product.setAvatar("Product/Avatar/" + avatarFile.getOriginalFilename());
		}

		if (isUploadFiles(imageFiles)) {
			for (MultipartFile imageFile : imageFiles) {
				if (isUploadFile(imageFile)) {
					String path = FOLDER_UPLOAD + "Product/Image/" + imageFile.getOriginalFilename();
					File file = new File(path);
					imageFile.transferTo(file);
					ProductImage productImage = new ProductImage();
					productImage.setTitle(imageFile.getOriginalFilename());
					productImage.setPath("Product/Image/" + imageFile.getOriginalFilename());
					productImage.setStatus(Boolean.TRUE);
					productImage.setCreateDate(new Date());
					product.addRelationalProductImage(productImage); // Luu sang bang tbl_product_image
				}
			}
		}
		return super.saveOrUpdate(product);
	}

	// ----------Search product----------------
	public List<Product> searchProduct(SearchModel productSearch) {
		// tao cau lenh sql
		String sql = "SELECT * FROM tbl_product p WHERE 1=1";
		// tim kiem voi status
		if (productSearch.getStatus() != 2) {
			sql += " AND p.status=" + productSearch.getStatus();
		}
		// tim kiem voi category
		if (productSearch.getCategoryId() != 0) {
			sql += " AND p.category_id=" + productSearch.getCategoryId();

			// tim kiem theo keyword
		}
		if (productSearch.getKeyword() != "keyword") {
			String keyword = productSearch.getKeyword().toLowerCase();
			sql += " AND (LOWER(p.name) like '%" + keyword + "%'" + "OR LOWER(p.short_description) like '%" + keyword
					+ "%'" + "OR LOWER(p.seo) like '%" + keyword + "%')";
		}

		// tim theo cac Date
		if (!StringUtils.isEmpty(productSearch.getBeginDate()) && !StringUtils.isEmpty(productSearch.getEndDate())) {
			String beginDate = productSearch.getBeginDate();
			String endDate = productSearch.getEndDate();
			sql += " AND p.create_date BETWEEN '" + beginDate + "' AND '" + endDate + "'";
		}
		return super.executeNativeSql(sql);

	}

}