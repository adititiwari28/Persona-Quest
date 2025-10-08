package com.quiz.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import com.quiz.dao.AdminDao;

@Controller
public class AdminController {
     
	
	  @Autowired
	    private AdminDao adminDAO;

	    @RequestMapping("/adminLogin")
	    public String showLoginForm() {
	    	System.out.println("Loading1");
	        return "aLogin"; // JSP page name
	    }

	    @PostMapping("/adminLogin")
	    public String processLogin(@RequestParam("username") String username,
	                               @RequestParam("password") String password,
	                               Model model) {
	        boolean isValid = adminDAO.validateAdmin(username, password);
            System.out.println("loading 2");
	        if (isValid) {
	            return "aDashboard"; // redirect to dashboard JSP
	        } else {
	            model.addAttribute("error", "Invalid username or password");
	            return "aLogin"; // reload login page with error
	        }
	    }
	    
	    @GetMapping("/adminDashboard")
	    public String showDashboard() {
	        return "aDashboard"; // serves aDashboard.jsp directly
	    }


}
