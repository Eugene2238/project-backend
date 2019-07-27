package com.example.project.controllers;

import com.example.project.services.UserService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.security.Principal;

@Controller
public class AdminController {
    private UserService userService;

    public AdminController(UserService userService) {
        this.userService = userService;
    }


//    @RequestMapping("/admin")
//    public String adminPage(Principal principal, Model model) {
//        String username = principal.getName();
//        model.addAttribute("currentUser", userService.findByUsername(username));
//        return "/admin/admin.jsp";
//    }

}
