package com.minhduc.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Set;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.fasterxml.jackson.annotation.JsonAlias;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.minhduc.dto.Cart;
import com.minhduc.entity.Bill;
import com.minhduc.entity.BillDetail;
import com.minhduc.entity.BillDetailId;
import com.minhduc.entity.Category;
import com.minhduc.entity.Product;
import com.minhduc.entity.ProductDetail;
import com.minhduc.service.BillDetailService;
import com.minhduc.service.BillService;
import com.minhduc.service.ProductService;
import com.minhduc.service.StaffService;

@Controller
@RequestMapping("api/")
@SessionAttributes({"username", "carts"})
public class ApiController {
	
	private List<Cart> carts = new ArrayList<Cart>();

	@Autowired
	StaffService staffService;
	
	@Autowired
	BillService billService;
	
	@Autowired
	BillDetailService billDetailService;
	
	@Autowired
	ProductService productService;
	
	@GetMapping("checkLogin/")
	@ResponseBody
	public String checkLogin(@RequestParam String username, @RequestParam String password, ModelMap modelMap) {
		boolean result = staffService.checkLogin(username, password);
		if (result == true) {
			modelMap.addAttribute("username", username);
		}
		return staffService.checkLogin(username, password) ? "true" : "false";
	}
	
	@GetMapping("/removeItem/")
	@SuppressWarnings("unchecked")
	@ResponseBody
	public void removeItemFromCart(HttpSession httpSession , @RequestParam(name = "product_id") int product_id, @RequestParam(name = "color_id") int color_id, @RequestParam(name = "size_id") int size_id) {
		if (httpSession.getAttribute("carts") != null) {
			List<Cart> listCart = (List<Cart>) httpSession.getAttribute("carts");
			int pos = findProductPosInCart(httpSession, product_id, size_id, color_id);
			if (pos != -1) {
				listCart.remove(pos);
				httpSession.setAttribute("carts", listCart);
			}
		}
	}
	
	@GetMapping("/addToCart/")
	@SuppressWarnings("unchecked")
	@ResponseBody
	public void addToCart(@RequestParam(name = "product_id") int product_id, @RequestParam(name = "product_name") String product_name, @RequestParam(name = "size_id") int size_id, @RequestParam(name = "size_name") String size_name, @RequestParam(name = "color_id") int color_id, @RequestParam(name = "color_name") String color_name, @RequestParam(name = "quantity") int quantity, @RequestParam(name = "product_price") int product_price, @RequestParam(name = "product_image_url") String product_image_url, @RequestParam(name = "product_detail_id") int product_detail_id, HttpSession httpSession) {
		if (httpSession.getAttribute("carts") == null) {
			Cart cart = new Cart(product_id, product_name, product_price, color_id, color_name, size_id, size_name, quantity, product_image_url, product_detail_id);
			carts.add(cart);
			httpSession.setAttribute("carts", carts);
		} else {
			boolean checkProductExistInCart = checkProductExistInCart(httpSession, product_id, size_id, color_id);
			if (checkProductExistInCart == false) {
				Cart cart = new Cart(product_id, product_name, product_price, color_id, color_name, size_id, size_name, quantity, product_image_url, product_detail_id);
				List<Cart> cartList = (List<Cart>) httpSession.getAttribute("carts");
				cartList.add(cart);
				httpSession.setAttribute("carts", cartList);
			} else {
				List<Cart> cartList = (List<Cart>) httpSession.getAttribute("carts");
				int pos = getProductInSessionCartPosition(httpSession, product_id, size_id, color_id);
				int newQuantity = cartList.get(pos).getQuantity() + 1;
				cartList.get(pos).setQuantity(newQuantity);
				httpSession.setAttribute("carts", cartList);
			}
		}
	}
	
	@GetMapping("/updateCart/")
	@ResponseBody
	@SuppressWarnings("unchecked")
	public void updateCart(HttpSession httpSession, @RequestParam(name = "product_id") int product_id, @RequestParam(name = "color_id") int color_id, @RequestParam(name = "size_id") int size_id, @RequestParam(name = "quantity") int quantity) {
		if (httpSession.getAttribute("carts") != null) {
			List<Cart> cartList = (List<Cart>) httpSession.getAttribute("carts");
			int pos = findProductPosInCart(httpSession, product_id, size_id, color_id);
			if (pos != -1) {
				cartList.get(pos).setQuantity(quantity);
			}
		}
	}
	
	@GetMapping("/getCartQuantity/")
	@ResponseBody
	@SuppressWarnings("unchecked")
	public String getCartQuantity(HttpSession httpSession) {
		String res = "";
		if (httpSession.getAttribute("carts") != null) {
			List<Cart> cartList = (List<Cart>) httpSession.getAttribute("carts");
			res = String.valueOf(cartList.size());
		}
		return res;
	}
	
	@SuppressWarnings("unchecked")
	private int findProductPosInCart(HttpSession httpSession ,int product_id, int size_id, int color_id) {
		int res = -1;
		List<Cart> cartList = (List<Cart>) httpSession.getAttribute("carts");
		for (int i = 0; i < cartList.size(); ++i) {
			Cart cart = cartList.get(i);
			if (cart.getProduct_id() == product_id && cart.getColor_id() == color_id && cart.getSize_id() == size_id) {
				return res = i;
			}
		}
		return res;
	}
	
	@SuppressWarnings("unchecked")
	private boolean checkProductExistInCart(HttpSession httpSession ,int product_id, int size_id, int color_id) {
		boolean res = false;
		List<Cart> cartList = (List<Cart>) httpSession.getAttribute("carts");
		for (Cart cart : cartList) {
			if (cart.getProduct_id() == product_id && cart.getColor_id() == color_id && cart.getSize_id() == size_id) {
				return res = true;
			}
		}
		return res;
	}
	
	@SuppressWarnings("unchecked")
	private int getProductInSessionCartPosition(HttpSession httpSession, int product_id, int size_id, int color_id) {
		int pos = -1;
		List<Cart> cartList = (List<Cart>) httpSession.getAttribute("carts");
		for (int i = 0; i < cartList.size(); ++i) {
			if (cartList.get(i).getProduct_id() == product_id && cartList.get(i).getColor_id() == color_id && cartList.get(i).getSize_id() == size_id) {
				pos = i;
				break;
			}
		}
		return pos;
	}
	
	@PostMapping("checkout/")
	@SuppressWarnings("unchecked")
	@ResponseBody
	public void checkout(HttpSession httpSession , @RequestParam(name = "firstName") String firstName, @RequestParam(name = "lastName") String lastName, @RequestParam(name = "address") String address, @RequestParam(name = "phone_number") String phone_number) {
		List<Cart> listCart = new ArrayList<Cart>();
		if (httpSession.getAttribute("carts") != null) {
			listCart = (List<Cart>) httpSession.getAttribute("carts");
			Bill bill = new Bill(firstName, phone_number, address, false, new Date().toString(), "COD", "TEST");
			int billId = billService.addBill(bill);
			for (Cart cart : listCart) {
				BillDetailId billDetailId = new BillDetailId(billId, cart.getProduct_detail_id());
				BillDetail billDetail = new BillDetail(billDetailId, cart.getQuantity(), String.valueOf(cart.getProduct_price()));
				billDetailService.addBillDetail(billDetail);
			}
		}
	}
	
	@GetMapping("deleteProduct/")
	@ResponseBody
	public void deleteProduct(@RequestParam(name = "product_id") int product_id) {
		productService.deleteProduct(product_id);
	}
	
	@Autowired
	private ServletContext context;
	
	@PostMapping("upload/")
	@ResponseBody
	public void uploadFile(MultipartHttpServletRequest httpServletRequest) throws IllegalStateException, IOException {
		String file_save_path = context.getRealPath("/WEB-INF/resources/Images/");
		Iterator<String> fileNames = httpServletRequest.getFileNames();
		MultipartFile multipartFile = httpServletRequest.getFile(fileNames.next());
		File file_save = new File(file_save_path + multipartFile.getOriginalFilename());
		multipartFile.transferTo(file_save);
	}
	
	@PostMapping("add/")
	@ResponseBody
	public void addProduct(@RequestParam(name = "data") String data) throws JsonMappingException, JsonProcessingException {
		ObjectMapper mapper = new ObjectMapper();
		JsonNode jsonObject = mapper.readTree(data);
		JsonNode product_image = jsonObject.get("product_image");
		JsonNode product_name = jsonObject.get("product_name");
		JsonNode product_price = jsonObject.get("product_price");
		JsonNode product_description = jsonObject.get("product_description");
		JsonNode product_details = jsonObject.get("product_details");
		
		Product product = new Product();
		product.setProduct_name(String.valueOf(product_name));
		product.setProduct_description(String.valueOf(product_description));
		product.setProduct_price(String.valueOf(product_price));
		product.setProduct_image(String.valueOf(product_image));
		System.out.println(data);
		
	}
}
