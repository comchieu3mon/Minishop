package com.minhduc.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.minhduc.dto.Cart;
import com.minhduc.service.StaffService;

@Controller
@RequestMapping("api/")
@SessionAttributes({"username", "carts"})
public class ApiController {
	
	private List<Cart> carts = new ArrayList<Cart>();

	
	@Autowired
	StaffService staffService;
	
	@GetMapping("checkLogin/")
	@ResponseBody
	public String checkLogin(@RequestParam String username, @RequestParam String password, ModelMap modelMap) {
		boolean result = staffService.checkLogin(username, password);
		if (result == true) {
			modelMap.addAttribute("username", username);
		}
		return staffService.checkLogin(username, password) ? "true" : "false";
	}
	
	
	@GetMapping("/addToCart/")
	@SuppressWarnings("unchecked")
	@ResponseBody
	public void addToCart(@RequestParam(name = "product_id") int product_id, @RequestParam(name = "product_name") String product_name, @RequestParam(name = "size_id") int size_id, @RequestParam(name = "size_name") String size_name, @RequestParam(name = "color_id") int color_id, @RequestParam(name = "color_name") String color_name, @RequestParam(name = "quantity") int quantity, @RequestParam(name = "product_price") int product_price, HttpSession httpSession) {
		if (httpSession.getAttribute("carts") == null) {
			Cart cart = new Cart(product_id, product_name, product_price, color_id, color_name, size_id, size_name, quantity);
			carts.add(cart);
			httpSession.setAttribute("carts", carts);
		} else {
			boolean checkProductExistInCart = checkProductExistInCart(httpSession, product_id, size_id, color_id);
			if (!checkProductExistInCart) {
				Cart cart = new Cart(product_id, product_name, product_price, color_id, color_name, size_id, size_name, quantity);
				List<Cart> cartList = (List<Cart>) httpSession.getAttribute("carts");
				cartList.add(cart);
				httpSession.setAttribute("carts", carts);
			} else {
				List<Cart> cartList = (List<Cart>) httpSession.getAttribute("carts");
				int pos = getProductInSessionCartPosition(httpSession, product_id, size_id, color_id);
				int newQuantity = cartList.get(pos).getQuantity() + 1;
				cartList.get(pos).setQuantity(newQuantity);
			}
		}
		List<Cart> cartList = (List<Cart>) httpSession.getAttribute("carts");
		for (Cart cart : cartList) {
			System.out.println("Inside session cart: " + cart.getProduct_name() + cart.getQuantity());
		}
	}
	
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
}
