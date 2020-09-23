package com.minhduc.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.minhduc.service.StaffService;

@Controller
@RequestMapping("api/")
@SessionAttributes("username")
public class ApiController {
	
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
}
