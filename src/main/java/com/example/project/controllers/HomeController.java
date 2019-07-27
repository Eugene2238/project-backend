package com.example.project.controllers;

import com.example.project.services.UserService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.security.Principal;

@Controller
public class HomeController {
    private UserService userService;

    public HomeController(UserService userService) {
        this.userService = userService;
    }


//    @RequestMapping(value = {"/", "/home"})
//    public String home(Principal principal, Model model) {
////        return "redirect:/ideas";
////        String username = principal.getName();
////        model.addAttribute("currentUser", userService.findByUsername(username));
////        return "index.jsp";
////        return "redirect:/ideas";
//    }
}
