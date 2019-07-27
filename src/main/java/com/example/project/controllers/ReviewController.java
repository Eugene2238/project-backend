package com.example.project.controllers;

import com.example.project.services.FileStorageService;
import com.example.project.services.IdeaService;
import com.example.project.services.ReviewService;
import com.example.project.services.UserService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.security.Principal;

@Controller
public class ReviewController {
    private final IdeaService ideaService;
    private final UserService userService;
    private final ReviewService reviewService;



    public ReviewController(IdeaService ideaService, UserService userService, ReviewService reviewService) {
        this.ideaService = ideaService;
        this.userService = userService;
        this.reviewService = reviewService;
    }
//
//    @RequestMapping(value = "/")
//    public String listEntriesMainPage(Model model, Principal principal) {
//        if (principal != null) model.addAttribute("user", userService.findByUsername(principal.getName()));
//        model.addAttribute("ideas", ideaService.allEntries());
//        model.addAttribute("homeMenu", "active");
//        return "index.jsp";
//    }
}
