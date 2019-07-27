package com.example.project.controllers;

import com.example.project.models.User;
import com.example.project.services.UserService;
import com.example.project.validator.UserValidator;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

@Controller
public class UserController {
    private UserService userService;
    private UserValidator userValidator;

    public UserController(UserService userService, UserValidator userValidator) {
        this.userService = userService;
        this.userValidator = userValidator;
    }

    @PostMapping("/registration")
    public String registration(@Valid @ModelAttribute("user") User user, BindingResult result,
                               HttpServletRequest request, String username, String password) {
        userValidator.validate(user, result);
        if (result.hasErrors()) return "/users/auth.jsp";
        userService.saveWithUserRole(user);
        // userService.saveUserWithAdminRole(user);
        try {
            request.login(username, password);
        } catch (ServletException e) {
            System.out.println("Error log in");
            System.out.println(e);
        }
        return "redirect:/ideas";
    }

    @RequestMapping("/login")
    public String login(
            @ModelAttribute(value = "user", binding = false) User user,
            @RequestParam(value = "error", required = false) String error,
            @RequestParam(value = "logout", required = false) String logout,
            Model model) {
        if (error != null) model.addAttribute("errorMessage", "Invalid Credentials, Please try again.");
        if (logout != null) model.addAttribute("logoutMessage", "Logout Successful!");
        return "/users/auth.jsp";
    }

}