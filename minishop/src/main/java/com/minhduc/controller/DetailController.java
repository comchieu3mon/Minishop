package com.minhduc.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/detail")
public class DetailController {
	
	
	
	@GetMapping("{id}")
	@ResponseBody
	public String getDetailPage2(@PathVariable(name = "id") int product_id) {
		return String.valueOf(product_id);
	}
}
